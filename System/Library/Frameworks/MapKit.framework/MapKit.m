void sub_18BAEE84C(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_18BAEE9D0(_Unwind_Exception *a1)
{
}

void sub_18BAEECC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BAEFD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  _Unwind_Resume(a1);
}

void sub_18BAF0024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      v6 = *v5;
      *v5++ = 0;
      v7 = *a3;
      *a3++ = v6;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_18BAF04A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p)
{
  _Unwind_Resume(a1);
}

void sub_18BAF05D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _insert(void *a1, uint64_t a2, void *a3)
{
  id v47 = a1;
  v5 = a3;
  uint64_t v6 = _insertionNodeForItem(v47, a2);
  uint64_t v7 = v6;
  v8 = *(char ***)(v6 + 32);
  if (v5[2] <= (unint64_t)((v8[1] - *v8) >> 3)
    && (*(double *)(v6 + 16) > *((double *)v5 + 2) || *(double *)(v6 + 24) > *((double *)v5 + 3)))
  {
    v10 = v5;
    *(void *)(v7 + 40) = malloc_type_calloc(4uLL, 8uLL, 0x2004093837F09uLL);
    double v11 = *(double *)(v7 + 16);
    double v12 = *(double *)(v7 + 24);
    double v13 = *(double *)v7;
    uint64_t v14 = *(void *)(v7 + 8);
    v15 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    double v16 = v11 * 0.5;
    double v17 = v12 * 0.5;
    double *v15 = v13;
    *((void *)v15 + 1) = v14;
    v15[2] = v16;
    v15[3] = v17;
    **(void **)(v7 + 40) = v15;
    double v19 = *(double *)v7;
    uint64_t v18 = *(void *)(v7 + 8);
    double v20 = *(double *)(v7 + 16);
    v21 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    double *v21 = v16 + v19;
    *((void *)v21 + 1) = v18;
    v21[2] = v20 - v16;
    v21[3] = v17;
    *(void *)(*(void *)(v7 + 40) + 8) = v21;
    double v22 = *(double *)v7;
    double v23 = *(double *)(v7 + 8);
    double v24 = *(double *)(v7 + 24);
    v25 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    double *v25 = v22;
    v25[1] = v17 + v23;
    v25[2] = v16;
    v25[3] = v24 - v17;
    *(void *)(*(void *)(v7 + 40) + 16) = v25;
    double v26 = *(double *)v7;
    double v27 = *(double *)(v7 + 8);
    double v28 = *(double *)(v7 + 16);
    double v29 = *(double *)(v7 + 24);
    v30 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    double *v30 = v16 + v26;
    v30[1] = v17 + v27;
    v30[2] = v28 - v16;
    v30[3] = v29 - v17;
    *(void *)(*(void *)(v7 + 40) + 24) = v30;
    operator new();
  }
  id v31 = v47;
  id v32 = v31;
  v34 = v8[1];
  unint64_t v33 = (unint64_t)v8[2];
  if ((unint64_t)v34 >= v33)
  {
    v36 = *v8;
    uint64_t v37 = (v34 - *v8) >> 3;
    unint64_t v38 = v37 + 1;
    if ((unint64_t)(v37 + 1) >> 61) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v39 = v33 - (void)v36;
    if (v39 >> 2 > v38) {
      unint64_t v38 = v39 >> 2;
    }
    if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v40 = v38;
    }
    if (v40)
    {
      if (v40 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v41 = (char *)operator new(8 * v40);
    }
    else
    {
      v41 = 0;
    }
    v42 = &v41[8 * v37];
    v43 = &v41[8 * v40];
    *(void *)v42 = v32;
    v35 = v42 + 8;
    if (v34 == v36)
    {
      *v8 = v42;
      v8[1] = v35;
      v8[2] = v43;
    }
    else
    {
      do
      {
        uint64_t v44 = *((void *)v34 - 1);
        v34 -= 8;
        *(void *)v34 = 0;
        *((void *)v42 - 1) = v44;
        v42 -= 8;
      }
      while (v34 != v36);
      v34 = *v8;
      v45 = v8[1];
      *v8 = v42;
      v8[1] = v35;
      v8[2] = v43;
      while (v45 != v34)
      {
        v46 = (void *)*((void *)v45 - 1);
        v45 -= 8;
      }
    }
    if (v34) {
      operator delete(v34);
    }
  }
  else
  {
    *(void *)v34 = v31;
    v35 = v34 + 8;
  }
  v8[1] = v35;
}

void sub_18BAF09A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_18BAF0B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BAF0CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MKMapRectContainsPoint(MKMapRect rect, MKMapPoint point)
{
  double x = point.x;
  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY) {
    return 0;
  }
  double y = point.y;
  double v5 = rect.origin.x + rect.size.width;
  if ((rect.origin.x >= 0.0 || v5 <= 0.0) && (rect.origin.x >= 268435456.0 || v5 <= 268435456.0))
  {
    BOOL result = 0;
    if (x < rect.origin.x) {
      return result;
    }
    BOOL v8 = x > v5;
    goto LABEL_32;
  }
  if (rect.origin.x >= 0.0)
  {
    if (v5 <= 268435456.0)
    {
      double v10 = 0.0;
      double v9 = INFINITY;
      double v11 = INFINITY;
      double height = 0.0;
      goto LABEL_21;
    }
    double v10 = v5 + -268435456.0;
    double v9 = 0.0;
  }
  else
  {
    double v9 = rect.origin.x + 268435456.0;
    double v10 = fabs(rect.origin.x);
  }
  double v11 = rect.origin.y;
  double height = rect.size.height;
LABEL_21:
  v17.size.width = 268435456.0;
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.double height = 268435456.0;
  rect = MKMapRectIntersection(rect, v17);
  if (x >= v9)
  {
    BOOL v13 = x > v9 + v10 || y < v11;
    if (!v13 && y <= v11 + height) {
      return 1;
    }
  }
  BOOL result = 0;
  if (x >= v16.origin.x)
  {
    BOOL v8 = x > v16.origin.x + v16.size.width;
LABEL_32:
    if (!v8 && y >= rect.origin.y) {
      return y <= rect.origin.y + rect.size.height;
    }
  }
  return result;
}

uint64_t _insertionNodeForItem(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 coordinate];
  double v6 = MKTilePointForCoordinate(v4, v5, 21.0);
  double v8 = v7;

  while (1)
  {
    uint64_t v9 = *(void *)(a2 + 40);
    if (!v9) {
      break;
    }
    uint64_t v10 = 0;
    while (1)
    {
      a2 = *(void *)(v9 + v10);
      v12.double x = v6;
      v12.double y = v8;
      if (MKMapRectContainsPoint(*(MKMapRect *)a2, v12)) {
        break;
      }
      v10 += 8;
      if (v10 == 32)
      {
        a2 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_7:

  return a2;
}

void sub_18BAF0EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MKTilePointForCoordinate(double a1, double a2, double a3)
{
  if (a2 == -180.0 && a1 == -180.0 || a2 < -180.0 || a2 > 180.0 || a1 < -90.0) {
    return -1.0;
  }
  double v4 = -1.0;
  if (a1 <= 90.0)
  {
    double v4 = (a2 + 180.0) * 0.0174532925 * (ldexp(1.0, (int)a3) / 6.28318531) * 128.0;
    double v5 = fmax(fmin(a1, 85.0), -85.0);
    if (v5 > 90.0) {
      double v5 = v5 + -180.0;
    }
    if (v5 < -90.0) {
      double v5 = v5 + 180.0;
    }
    long double v6 = sin(v5 * 0.0174532925);
    log((v6 + 1.0) / (1.0 - v6));
  }
  return v4;
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  if (rect1.origin.x == INFINITY && rect1.origin.y == INFINITY) {
    return 0;
  }
  if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY) {
    return 0;
  }
  if (rect1.origin.x >= rect2.origin.x)
  {
    if (rect2.origin.x + rect2.size.width <= rect1.origin.x) {
      return 0;
    }
  }
  else if (rect1.origin.x + rect1.size.width <= rect2.origin.x)
  {
    return 0;
  }
  if (rect1.origin.y >= rect2.origin.y)
  {
    if (rect2.origin.y + rect2.size.height <= rect1.origin.y) {
      return 0;
    }
  }
  else if (rect1.origin.y + rect1.size.height <= rect2.origin.y)
  {
    return 0;
  }
  return 1;
}

BOOL MKMapRectContainsRect(MKMapRect rect1, MKMapRect rect2)
{
  if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY) {
    return 1;
  }
  BOOL v4 = rect1.origin.y == INFINITY && rect1.origin.x == INFINITY || rect1.origin.x > rect2.origin.x;
  BOOL result = !v4
        && (rect1.origin.x + rect1.size.width >= rect2.origin.x + rect2.size.width
          ? (BOOL v5 = rect1.origin.y > rect2.origin.y)
          : (BOOL v5 = 1),
            !v5)
        && rect1.origin.y + rect1.size.height >= rect2.origin.y + rect2.size.height;
  return result;
}

void PartitionAnnotations(void *a1, void *a2, void *a3)
{
  MKMapPoint v12 = a2;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a1;
  id v4 = 0;
  id v5 = 0;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "feature", v12);
        int v11 = [v10 isGlobalFeature];

        if (v11)
        {
          if (!v4)
          {
            id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
            *a3 = v4;
          }
          [v4 addObject:v9];
        }
        else
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(0, "count"));
            id v5 = objc_claimAutoreleasedReturnValue();
            *MKMapPoint v12 = v5;
          }
          [v5 addObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void sub_18BAF1318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<GEOPosition2d>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    id v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(a2);
    id v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v7 = &v4[16 * v6];
    uint64_t v9 = (char *)*a1;
    double v8 = (char *)a1[1];
    uint64_t v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        *((_OWORD *)v10 - 1) = *((_OWORD *)v8 - 1);
        v10 -= 16;
        v8 -= 16;
      }
      while (v8 != v9);
      double v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

void sub_18BAF156C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BAF3138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _MKLinkedOnOrAfterReleaseSet(__int16 a1)
{
  if (qword_1EB315FC0 != -1) {
    dispatch_once(&qword_1EB315FC0, &__block_literal_global_113);
  }
  __int16 v2 = (a1 & 0xFF00) + 256;
  if (HIBYTE(v2) > 0x10u)
  {
    int v4 = 0;
    unsigned int v5 = -268435456;
  }
  else
  {
    uint64_t v3 = SHIBYTE(v2);
    int v4 = dword_18BD1B4E8[SHIBYTE(v2)];
    unsigned int v5 = dword_18BD1B52C[v3];
  }
  return dword_1EB315F78 == v4 && *(_DWORD *)algn_1EB315F7C >= v5;
}

double MKCompassViewDiameterForSize(uint64_t a1)
{
  v1 = +[MKCompassView _parameterForSize:a1];
  [v1 diameter];
  double v3 = v2;

  return v3;
}

BOOL MapKitIdiomIsMacCatalyst()
{
  v0 = +[MKSystemController sharedInstance];
  BOOL v1 = [v0 userInterfaceIdiom] == 2;

  return v1;
}

double MKIntegralCenterForView(void *a1, double a2)
{
  int v4 = [a1 layer];
  [a1 _currentScreenScale];
  double v6 = v5;
  [v4 doubleBounds];
  double v8 = v7;
  double v10 = v9;
  [v4 anchorPoint];
  double v12 = floor((v8 + a2 - (v8 + v10 * v11)) * v6 + 0.00000011920929) / v6 + v10 * v11;

  return v12;
}

double MKIntegralCenterForViewWithScale(void *a1, double a2, double a3, double a4)
{
  double v6 = [a1 layer];
  [v6 doubleBounds];
  double v8 = v7;
  double v10 = v9;
  [v6 anchorPoint];
  double v12 = floor((v8 + a2 - (v8 + v10 * v11)) * a4 + 0.00000011920929) / a4 + v10 * v11;

  return v12;
}

id MKGetAnnotationsLog()
{
  if (MKGetAnnotationsLog_onceToken != -1) {
    dispatch_once(&MKGetAnnotationsLog_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)MKGetAnnotationsLog_log;

  return v0;
}

void sub_18BAF94C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t __depthFirstApply(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = v3;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = *(long long **)(a1 + 40);
  if (v5)
  {
    long long v6 = v5[1];
    long long v11 = *v5;
    long long v12 = v6;
  }
  int v7 = (*((uint64_t (**)(id, uint64_t))v3 + 2))(v3, a1);
  if (v7)
  {
    if (v7 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else if (v5)
  {
    uint64_t v9 = 0;
    while (__depthFirstApply(*(void *)((char *)&v11 + v9), v4) != 2)
    {
      v9 += 8;
      if (v9 == 32) {
        goto LABEL_11;
      }
    }
    uint64_t v8 = 2;
  }
  else
  {
LABEL_11:
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_18BAF95DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BAF9708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BAF98C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BAF99B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
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
  double v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

{
}

void sub_18BAFB080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
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

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
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

uint64_t __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18C139AE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
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

__n128 __Block_byref_object_copy__14(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
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

uint64_t __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18C139AE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18C139AE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
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

__n128 __Block_byref_object_copy__24(__n128 *a1, __n128 *a2)
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

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void MKRegisterGEOMultitaskingNotifications()
{
  if (MKRegisterGEOMultitaskingNotifications__once != -1) {
    dispatch_once(&MKRegisterGEOMultitaskingNotifications__once, &__block_literal_global_90);
  }
}

uint64_t _MKMapTypeForCartographicConfiguration(uint64_t *a1)
{
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v5, 2u);
    }
    return 0;
  }
  uint64_t v2 = *a1;
  if (*a1 == 2) {
    return 107;
  }
  if (v2 == 1)
  {
    if (*((unsigned char *)a1 + 48)) {
      return 106;
    }
    uint64_t v4 = a1[1];
    if ((unint64_t)(v4 - 1) >= 4)
    {
      if (v4)
      {
        return 2;
      }
      else if (a1[2] == 1)
      {
        return 3;
      }
      else
      {
        return 1;
      }
    }
    else if (a1[2] == 1)
    {
      return 4;
    }
    else
    {
      return 2;
    }
  }
  if (v2) {
    return 0;
  }
  if (*((unsigned char *)a1 + 48)) {
    return 105;
  }
  uint64_t result = 0;
  switch(a1[1])
  {
    case 0:
      if (a1[4] == 2)
      {
        if (a1[5] == 1) {
          uint64_t result = 110;
        }
        else {
          uint64_t result = 109;
        }
      }
      else
      {
        uint64_t result = 5;
      }
      break;
    case 2:
      uint64_t result = 108;
      break;
    case 3:
      uint64_t result = 102;
      break;
    case 4:
      uint64_t result = 104;
      break;
    default:
      return result;
  }
  return result;
}

id _MKLocalizedStringFromThisBundle(void *a1)
{
  BOOL v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 _mapkitBundle];
  uint64_t v4 = objc_msgSend(v3, "_mapkit_localizedStringForKey:value:table:", v2, @"<unlocalized>", 0);

  return v4;
}

uint64_t _MKModernPuckDesignEnabled()
{
  uint64_t result = _MKLinkedOnOrAfterReleaseSet(2824);
  if (result)
  {
    return GEOConfigGetBOOL();
  }
  return result;
}

uint64_t _MKUserLocationViewBaseShadowColor()
{
  return objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckShadowColor");
}

id _MKPuckAnnotationViewBaseColor(uint64_t a1, int a2)
{
  if ((unint64_t)(a1 - 1) < 4 || a1 == 107)
  {
    id v3 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v4 = v3;
    if (a2)
    {
      uint64_t v5 = [v3 colorWithAlphaComponent:0.699999988];

      uint64_t v4 = (void *)v5;
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___MKPuckAnnotationViewBaseColor_block_invoke;
    v7[3] = &__block_descriptor_33_e36___UIColor_16__0__UITraitCollection_8l;
    char v8 = a2;
    uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithDynamicProvider:v7];
  }

  return v4;
}

id _deviceKeyboardLanguageIfAvailable()
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v0 = [MEMORY[0x1E4F42738] sharedApplication];
    BOOL v1 = [v0 textInputMode];

    id v2 = [v1 primaryLanguage];
    if (![v2 length])
    {

      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_18BB00060(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB0012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB00A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB026F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_18BB02A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB02A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB02AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB02C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB02D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

MKMapRect MKMapRectIntersection(MKMapRect rect1, MKMapRect rect2)
{
  double width = rect1.size.width;
  double x = rect1.origin.x;
  double v4 = 0.0;
  double v5 = INFINITY;
  if (x != INFINITY || rect1.origin.y != INFINITY)
  {
    double v5 = INFINITY;
    if (rect2.origin.x != INFINITY || rect2.origin.y != INFINITY)
    {
      if (x <= rect2.origin.x) {
        double v5 = rect2.origin.x;
      }
      else {
        double v5 = x;
      }
      double v8 = x + width;
      double v9 = rect2.origin.x + rect2.size.width;
      if (v8 >= v9) {
        double v10 = v9;
      }
      else {
        double v10 = v8;
      }
      if (v5 <= v10)
      {
        double v11 = rect1.origin.y <= rect2.origin.y ? rect2.origin.y : rect1.origin.y;
        double v12 = rect1.origin.y + rect1.size.height;
        if (v12 >= rect2.origin.y + rect2.size.height) {
          double v12 = rect2.origin.y + rect2.size.height;
        }
        if (v11 <= v12)
        {
          double v4 = v10 - v5;
          double v13 = v12 - v11;
          goto LABEL_24;
        }
      }
      double v5 = INFINITY;
    }
  }
  double v11 = INFINITY;
  double v13 = 0.0;
LABEL_24:
  double v14 = v11;
  result.size.double height = v13;
  result.size.double width = v4;
  result.origin.double y = v14;
  result.origin.double x = v5;
  return result;
}

id MKGetApplicationStateMonitorLog()
{
  if (qword_1EB316138 != -1) {
    dispatch_once(&qword_1EB316138, &__block_literal_global_91);
  }
  v0 = (void *)qword_1EB316130;

  return v0;
}

uint64_t MKApplicationLayoutDirectionIsRightToLeft()
{
  if (!objc_msgSend(MEMORY[0x1E4F28B50], "_navigation_isRunningInSiri")) {
    goto LABEL_8;
  }
  if (qword_1E9154160 != -1) {
    dispatch_once(&qword_1E9154160, &__block_literal_global_179);
  }
  v0 = (uint64_t (*)(void))_MergedGlobals_1_7;
  if (_MergedGlobals_1_7)
  {
    return v0();
  }
  else
  {
LABEL_8:
    id v2 = [MEMORY[0x1E4F42738] sharedApplication];
    BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

    return v3;
  }
}

void sub_18BB03B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB04488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB04B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id GEOGetMKIconManagerLog()
{
  if (qword_1EB315D98 != -1) {
    dispatch_once(&qword_1EB315D98, &__block_literal_global_39);
  }
  v0 = (void *)qword_1EB315D90;

  return v0;
}

id _pairStringsForStyleAttributes(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA80] set];
  if (*(unsigned char *)(a1 + 33))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      double v5 = objc_msgSend(NSString, "stringWithFormat:", @"%u_%i", *(unsigned int *)(*(void *)a1 + v3), *(unsigned int *)(*(void *)a1 + v3 + 4));
      [v2 addObject:v5];

      ++v4;
      v3 += 8;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 33));
  }
  if (*(void *)(a1 + 8))
  {
    long long v6 = _pairStringsForStyleAttributes();
    [v2 unionSet:v6];
  }

  return v2;
}

void sub_18BB04D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB055DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB063C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18BB06564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB06C08(_Unwind_Exception *a1)
{
  long long v6 = v5;

  _Unwind_Resume(a1);
}

void sub_18BB06CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB0707C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t MKCurrentNetworkConnectionFailureDiagnosis()
{
  v0 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  char v1 = [v0 isNetworkReachable];

  if (v1) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F4BE78]);
  unint64_t v4 = (void *)[v3 initWithQueue:MEMORY[0x1E4F14428]];
  if ([v4 airplaneMode])
  {
    uint64_t v2 = 1;
  }
  else
  {
    double v5 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
    int v6 = [v5 isCellConnection];

    if (v6) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 3;
    }
  }

  return v2;
}

void sub_18BB09608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetCuratedCollectionsLog()
{
  if (MKGetCuratedCollectionsLog_onceToken != -1) {
    dispatch_once(&MKGetCuratedCollectionsLog_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)MKGetCuratedCollectionsLog_log;

  return v0;
}

void sub_18BB0A3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);

  _Unwind_Resume(a1);
}

void sub_18BB0ABA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id MKGetAppImageManagerLog()
{
  if (qword_1EB315C20 != -1) {
    dispatch_once(&qword_1EB315C20, &__block_literal_global_184);
  }
  v0 = (void *)qword_1EB315C18;

  return v0;
}

void sub_18BB0B5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB0B690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB0B85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB0CBAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  double v9 = (uint64_t *)result;
LABEL_2:
  double v10 = a2 - 1;
  double v11 = v9;
  while (1)
  {
    double v9 = v11;
    uint64_t v12 = (char *)a2 - (char *)v11;
    unint64_t v13 = a2 - v11;
    if (v5 || !v4)
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v69 = *(a2 - 1);
          double v70 = *(double *)(v69 + 656);
          uint64_t v71 = *v11;
          double v72 = *(double *)(*v11 + 656);
          if (v70 < v72 || (v69 < v71 ? (BOOL v73 = v70 == v72) : (BOOL v73 = 0), v73))
          {
            *double v11 = v69;
            *(a2 - 1) = v71;
          }
          break;
        case 3uLL:
          MKMapRect result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v11, v11 + 1, a2 - 1);
          break;
        case 4uLL:
          MKMapRect result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v11, v11 + 1, v11 + 2, a2 - 1);
          break;
        case 5uLL:
          MKMapRect result = (uint64_t)std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v12 <= 191) {
      break;
    }
    if (!a3)
    {
      if (v11 == a2) {
        return result;
      }
      int64_t v91 = (v13 - 2) >> 1;
      int64_t v92 = v91;
      do
      {
        int64_t v93 = v92;
        if (v91 >= v92)
        {
          uint64_t v94 = (2 * v92) | 1;
          v95 = &v11[v94];
          if (2 * v92 + 2 < (uint64_t)v13)
          {
            uint64_t v96 = v95[1];
            MKMapRect result = *v95;
            double v97 = *(double *)(*v95 + 656);
            double v98 = *(double *)(v96 + 656);
            if (v97 < v98 || (result < v96 ? (BOOL v99 = v97 == v98) : (BOOL v99 = 0), v99))
            {
              ++v95;
              uint64_t v94 = 2 * v92 + 2;
            }
          }
          v100 = &v11[v92];
          uint64_t v101 = *v95;
          double v102 = *(double *)(*v95 + 656);
          uint64_t v103 = *v100;
          double v104 = *(double *)(*v100 + 656);
          if (v102 >= v104 && (v101 >= v103 || v102 != v104))
          {
            do
            {
              uint64_t *v100 = v101;
              v100 = v95;
              if (v91 < v94) {
                break;
              }
              uint64_t v106 = 2 * v94;
              uint64_t v94 = (2 * v94) | 1;
              v95 = &v11[v94];
              uint64_t v107 = v106 + 2;
              if (v107 < (uint64_t)v13)
              {
                MKMapRect result = (uint64_t)(v95 + 1);
                uint64_t v108 = v95[1];
                double v109 = *(double *)(*v95 + 656);
                double v110 = *(double *)(v108 + 656);
                if (v109 < v110 || (*v95 < v108 ? (BOOL v111 = v109 == v110) : (BOOL v111 = 0), v111))
                {
                  ++v95;
                  uint64_t v94 = v107;
                }
              }
              uint64_t v101 = *v95;
              double v112 = *(double *)(*v95 + 656);
              double v113 = *(double *)(v103 + 656);
              if (v112 < v113) {
                break;
              }
            }
            while (v101 >= v103 || v112 != v113);
            uint64_t *v100 = v103;
          }
        }
        --v92;
      }
      while (v93);
      uint64_t v115 = (unint64_t)v12 >> 3;
      while (2)
      {
        uint64_t v116 = 0;
        uint64_t v117 = *v11;
        uint64_t v118 = v115 - 2;
        if (v115 < 2) {
          uint64_t v118 = v115 - 1;
        }
        uint64_t v119 = v118 >> 1;
        v120 = v11;
        do
        {
          v121 = v120;
          v120 += v116 + 1;
          uint64_t v122 = 2 * v116;
          uint64_t v116 = (2 * v116) | 1;
          uint64_t v123 = v122 + 2;
          if (v123 < v115)
          {
            uint64_t v124 = v120[1];
            MKMapRect result = *v120;
            double v125 = *(double *)(*v120 + 656);
            double v126 = *(double *)(v124 + 656);
            if (v125 < v126 || (result < v124 ? (BOOL v127 = v125 == v126) : (BOOL v127 = 0), v127))
            {
              ++v120;
              uint64_t v116 = v123;
            }
          }
          uint64_t *v121 = *v120;
        }
        while (v116 <= v119);
        if (v120 != --a2)
        {
          uint64_t *v120 = *a2;
          *a2 = v117;
          uint64_t v128 = (char *)v120 - (char *)v11 + 8;
          if (v128 < 9) {
            goto LABEL_222;
          }
          unint64_t v129 = ((unint64_t)v128 >> 3) - 2;
          unint64_t v130 = v129 >> 1;
          v131 = &v11[v129 >> 1];
          uint64_t v132 = *v131;
          double v133 = *(double *)(*v131 + 656);
          uint64_t v117 = *v120;
          double v134 = *(double *)(*v120 + 656);
          if (v133 >= v134 && (v132 >= v117 || v133 != v134))
          {
LABEL_222:
            BOOL v53 = v115-- <= 2;
            if (v53) {
              return result;
            }
            continue;
          }
          uint64_t *v120 = v132;
          if (v129 >= 2)
          {
            while (1)
            {
              unint64_t v136 = v130 - 1;
              unint64_t v130 = (v130 - 1) >> 1;
              v120 = &v11[v130];
              uint64_t v137 = *v120;
              double v138 = *(double *)(*v120 + 656);
              double v139 = *(double *)(v117 + 656);
              if (v138 >= v139 && (v137 >= v117 || v138 != v139)) {
                break;
              }
              uint64_t *v131 = v137;
              v131 = &v11[v130];
              if (v136 <= 1) {
                goto LABEL_221;
              }
            }
          }
          v120 = v131;
        }
        break;
      }
LABEL_221:
      uint64_t *v120 = v117;
      goto LABEL_222;
    }
    unint64_t v14 = v13 >> 1;
    long long v15 = &v11[v13 >> 1];
    if ((unint64_t)v12 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9, &v9[v13 >> 1], a2 - 1);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9 + 1, v15 - 1, a2 - 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9 + 2, &v9[v14 + 1], a2 - 3);
      MKMapRect result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v15 - 1, v15, &v9[v14 + 1]);
      uint64_t v16 = *v9;
      uint64_t *v9 = *v15;
      uint64_t *v15 = v16;
    }
    else
    {
      MKMapRect result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(&v9[v13 >> 1], v9, a2 - 1);
    }
    --a3;
    uint64_t v17 = *v9;
    if (a4)
    {
      double v18 = *(double *)(v17 + 656);
LABEL_15:
      for (uint64_t i = 0; ; ++i)
      {
        uint64_t v22 = v9[i + 1];
        double v23 = *(double *)(v22 + 656);
        if (v23 >= v18 && (v22 >= v17 || v23 != v18)) {
          break;
        }
      }
      v25 = &v9[i];
      unint64_t v26 = (unint64_t)&v9[i + 1];
      double v27 = a2 - 1;
      if (i * 8)
      {
        do
        {
          double v28 = v27;
          uint64_t v29 = *v27;
          double v30 = *(double *)(*v27 + 656);
          if (v30 < v18) {
            break;
          }
          --v27;
        }
        while (v29 >= v17 || v30 != v18);
      }
      else
      {
        id v32 = a2 - 1;
        while (1)
        {
          double v28 = v32;
          unint64_t v33 = (unint64_t)(v32 + 1);
          if (v26 >= v33) {
            break;
          }
          double v34 = *(double *)(*v28 + 656);
          if (v34 >= v18)
          {
            id v32 = v28 - 1;
            if (*v28 >= v17 || v34 != v18) {
              continue;
            }
          }
          goto LABEL_41;
        }
        double v28 = (uint64_t *)v33;
      }
LABEL_41:
      if (v26 < (unint64_t)v28)
      {
        uint64_t v36 = *v28;
        unint64_t v37 = v26;
        unint64_t v38 = v28;
        do
        {
          *(void *)unint64_t v37 = v36;
          v37 += 8;
          *unint64_t v38 = v22;
          double v39 = *(double *)(v17 + 656);
          while (1)
          {
            uint64_t v22 = *(void *)v37;
            double v40 = *(double *)(*(void *)v37 + 656);
            if (v40 >= v39 && (v22 >= v17 || v40 != v39)) {
              break;
            }
            v37 += 8;
          }
          v42 = v38 - 1;
          do
          {
            unint64_t v38 = v42;
            uint64_t v36 = *v42;
            double v43 = *(double *)(*v42 + 656);
            if (v43 < v39) {
              break;
            }
            --v42;
          }
          while (v36 >= v17 || v43 != v39);
        }
        while (v37 < (unint64_t)v38);
        v25 = (uint64_t *)(v37 - 8);
      }
      if (v25 != v9) {
        uint64_t *v9 = *v25;
      }
      uint64_t *v25 = v17;
      if (v26 < (unint64_t)v28) {
        goto LABEL_64;
      }
      BOOL v45 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v9, v25);
      double v11 = v25 + 1;
      MKMapRect result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(v25 + 1, a2);
      if (result)
      {
        a2 = v25;
        if (v45) {
          return result;
        }
        goto LABEL_2;
      }
      if (!v45)
      {
LABEL_64:
        MKMapRect result = std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(v9, v25, a3, a4 & 1);
        a4 = 0;
        double v11 = v25 + 1;
      }
    }
    else
    {
      uint64_t v19 = *(v9 - 1);
      double v20 = *(double *)(v19 + 656);
      double v18 = *(double *)(v17 + 656);
      if (v20 < v18 || v19 < v17 && v20 == v18) {
        goto LABEL_15;
      }
      uint64_t v46 = *v10;
      double v47 = *(double *)(*v10 + 656);
      if (v18 < v47 || v17 < v46 && v18 == v47)
      {
        v48 = v9 + 1;
        do
        {
          double v11 = v48;
          uint64_t v49 = *v48;
          double v50 = *(double *)(*v48 + 656);
          if (v18 < v50) {
            break;
          }
          ++v48;
        }
        while (v17 >= v49 || v18 != v50);
      }
      else
      {
        v65 = v9 + 1;
        do
        {
          double v11 = v65;
          if (v65 >= a2) {
            break;
          }
          uint64_t v66 = *v65;
          double v67 = *(double *)(*v65 + 656);
          if (v18 < v67) {
            break;
          }
          ++v65;
        }
        while (v17 >= v66 || v18 != v67);
      }
      j = a2;
      if (v11 < a2)
      {
        for (j = a2 - 1; ; --j)
        {
          if (v18 >= v47)
          {
            BOOL v53 = v18 == v47 && v17 < v46;
            if (!v53) {
              break;
            }
          }
          uint64_t v54 = *(j - 1);
          uint64_t v46 = v54;
          double v47 = *(double *)(v54 + 656);
        }
      }
      if (v11 < j)
      {
        uint64_t v55 = *v11;
        uint64_t v56 = *j;
        do
        {
          *double v11 = v56;
          uint64_t *j = v55;
          double v57 = *(double *)(v17 + 656);
          v58 = v11 + 1;
          do
          {
            double v11 = v58;
            uint64_t v55 = *v58;
            double v59 = *(double *)(*v58 + 656);
            if (v57 < v59) {
              break;
            }
            ++v58;
          }
          while (v17 >= v55 || v57 != v59);
          do
          {
            do
            {
              uint64_t v61 = *--j;
              uint64_t v56 = v61;
              double v62 = *(double *)(v61 + 656);
            }
            while (v57 < v62);
          }
          while (v17 < v56 && v57 == v62);
        }
        while (v11 < j);
      }
      v64 = v11 - 1;
      BOOL v4 = v11 - 1 >= v9;
      BOOL v5 = v11 - 1 == v9;
      if (v11 - 1 != v9) {
        uint64_t *v9 = *v64;
      }
      a4 = 0;
      uint64_t *v64 = v17;
    }
  }
  v74 = v11 + 1;
  BOOL v76 = v11 == a2 || v74 == a2;
  if (a4)
  {
    if (!v76)
    {
      uint64_t v77 = 0;
      v78 = v11;
      do
      {
        v79 = v74;
        uint64_t v81 = *v78;
        uint64_t v80 = v78[1];
        double v82 = *(double *)(v80 + 656);
        double v83 = *(double *)(*v78 + 656);
        if (v82 < v83 || (v80 < v81 ? (BOOL v84 = v82 == v83) : (BOOL v84 = 0), v84))
        {
          v78[1] = v81;
          v85 = v11;
          if (v78 != v11)
          {
            uint64_t v86 = v77;
            do
            {
              double v87 = *(double *)(v80 + 656);
              uint64_t v88 = *(uint64_t *)((char *)v11 + v86 - 8);
              double v89 = *(double *)(v88 + 656);
              if (v87 >= v89 && (v80 >= v88 || v87 != v89))
              {
                v85 = (uint64_t *)((char *)v11 + v86);
                goto LABEL_155;
              }
              *(uint64_t *)((char *)v11 + v86) = v88;
              v86 -= 8;
            }
            while (v86);
            v85 = v11;
          }
LABEL_155:
          uint64_t *v85 = v80;
        }
        v74 = v79 + 1;
        v77 += 8;
        v78 = v79;
      }
      while (v79 + 1 != a2);
    }
  }
  else if (!v76)
  {
    do
    {
      v141 = v74;
      uint64_t v143 = *v9;
      uint64_t v142 = v9[1];
      double v144 = *(double *)(v142 + 656);
      double v145 = *(double *)(*v9 + 656);
      if (v144 < v145 || (v142 < v143 ? (BOOL v146 = v144 == v145) : (BOOL v146 = 0), v146))
      {
        do
        {
          do
          {
            v147 = v9;
            uint64_t v148 = v143;
            uint64_t v149 = *--v9;
            uint64_t v143 = v149;
            v9[2] = v148;
            double v150 = *(double *)(v142 + 656);
            double v151 = *(double *)(v149 + 656);
          }
          while (v150 < v151);
        }
        while (v142 < v143 && v150 == v151);
        uint64_t *v147 = v142;
      }
      v74 = v141 + 1;
      double v9 = v141;
    }
    while (v141 + 1 != a2);
  }
  return result;
}

void std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  BOOL v5 = operator new(8 * prime);
  int v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  double v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    unint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *double v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          unint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        double v8 = v14;
        unint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_18BB0FB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB1087C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MKPlaceCardUseSmallerFont()
{
  if (qword_1EB315DE0 != -1) {
    dispatch_once(&qword_1EB315DE0, &__block_literal_global_43);
  }
  return _MergedGlobals_146;
}

void sub_18BB14C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MKCartographicConfigurationForMapType@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(void *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v2 = (void *)(a2 + 16);
  *(void *)(a2 + 8) = 1;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 1;
  *(void *)(a2 + 16) = 0;
  switch(result)
  {
    case 'f':
      uint64_t v3 = 3;
      goto LABEL_11;
    case 'g':
      return result;
    case 'h':
      uint64_t v3 = 4;
      goto LABEL_11;
    case 'i':
      *(unsigned char *)(a2 + 48) = 1;
      return result;
    case 'j':
      *(void *)a2 = 1;
      *(unsigned char *)(a2 + 48) = 1;
      return result;
    case 'k':
      uint64_t v4 = 2;
LABEL_15:
      *(void *)a2 = v4;
      return result;
    case 'l':
      uint64_t v3 = 2;
LABEL_11:
      *(void *)(a2 + 8) = v3;
      break;
    case 'm':
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 32) = 2;
      break;
    case 'n':
      *(void *)(a2 + 8) = 0;
      *(_OWORD *)(a2 + 32) = xmmword_18BD1B180;
      break;
    default:
      switch(result)
      {
        case 0:
          MKMapRect result = GEOConfigGetBOOL();
          if (result) {
            *uint64_t v2 = 1;
          }
          break;
        case 1:
          *(_OWORD *)a2 = xmmword_18BD1B170;
          break;
        case 2:
          uint64_t v4 = 1;
          goto LABEL_15;
        case 3:
          *(_OWORD *)a2 = xmmword_18BD1B170;
          *(int64x2_t *)(a2 + 16) = vdupq_n_s64(1uLL);
          break;
        case 4:
          *(void *)a2 = 1;
          *(int64x2_t *)(a2 + 16) = vdupq_n_s64(1uLL);
          break;
        case 5:
          *(void *)(a2 + 8) = 0;
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

id MKGetMKMapViewLog()
{
  if (qword_1E9154038 != -1) {
    dispatch_once(&qword_1E9154038, &__block_literal_global_1870);
  }
  v0 = (void *)qword_1E9154030;

  return v0;
}

BOOL _MKCartographicConfigurationEquals(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2
      && *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      && *(void *)(a1 + 40) == *(void *)(a2 + 40)
      && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48);
}

uint64_t _VKTerrainModeForMKCartographicConfiguration(uint64_t a1)
{
  if (a1)
  {
    if ((unint64_t)(*(void *)(a1 + 24) - 1) >= 3) {
      return 0;
    }
    else {
      return *(void *)(a1 + 24);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v2, 2u);
    }
    return 0;
  }
}

uint64_t _VKMapTypeForMKCartographicConfiguration(uint64_t *a1)
{
  if (!a1)
  {
    uint64_t result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_WORD *)uint8x8_t v10 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v10, 2u);
    return 0;
  }
  uint64_t v1 = *a1;
  if (*a1 == 2) {
    return 11;
  }
  if (v1 != 1)
  {
    if (!v1)
    {
      if (*((unsigned char *)a1 + 48)) {
        return 6;
      }
      uint64_t v3 = a1[1];
      if (v3 == 3) {
        unsigned int v4 = 5;
      }
      else {
        unsigned int v4 = 0;
      }
      if (v3 == 4) {
        return 8;
      }
      else {
        return v4;
      }
    }
    return 0;
  }
  if (*((unsigned char *)a1 + 48)) {
    return 7;
  }
  uint64_t v5 = a1[1];
  unint64_t v6 = v5 - 1;
  if (a1[2] == 1) {
    unsigned int v7 = 4;
  }
  else {
    unsigned int v7 = 2;
  }
  if (a1[2] == 1) {
    int v8 = 3;
  }
  else {
    int v8 = 1;
  }
  if (v5) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = v8;
  }
  if (v6 >= 4) {
    return v9;
  }
  else {
    return v7;
  }
}

uint64_t _VKMapKitUsageForMKCartographicConfiguration(uint64_t a1)
{
  if (a1)
  {
    unint64_t v1 = *(void *)(a1 + 32);
    if (v1 >= 3) {
      LOBYTE(v1) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v3, 2u);
    }
    LOBYTE(v1) = 1;
  }
  return v1;
}

BOOL _VKMapKitClientModeForMKCartographicConfiguration(uint64_t a1)
{
  if (a1) {
    return *(void *)(a1 + 40) == 1;
  }
  BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v2, 2u);
    return 0;
  }
  return result;
}

uint64_t _VKEmphasisForMKCartographicConfiguration(void *a1)
{
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: configuration != ((void *)0)", v3, 2u);
    }
    return 1;
  }
  if ((unint64_t)(*a1 - 1) < 2) {
    return 2;
  }
  if (*a1) {
    return 1;
  }
  unsigned __int8 v1 = 0;
  switch(a1[1])
  {
    case 0:
    case 4:
      return v1;
    case 1:
      if (MapsFeature_IsAvailable_Maps298()) {
        unsigned __int8 v1 = 2;
      }
      else {
        unsigned __int8 v1 = 1;
      }
      break;
    default:
      return 1;
  }
  return v1;
}

id MKGetMKLocationManagerLog()
{
  if (qword_1EB315CD0 != -1) {
    dispatch_once(&qword_1EB315CD0, &__block_literal_global_496);
  }
  v0 = (void *)qword_1EB315CC8;

  return v0;
}

void sub_18BB17690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MKDefaultCoordinateRegion_block_invoke(uint64_t a1)
{
  id v19 = objc_alloc_init(MEMORY[0x1E4F4BE38]);
  uint64_t v2 = [v19 localeWithCode:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 objectForKey:@"mapLatitude"];
    uint64_t v5 = [v3 objectForKey:@"mapLongitude"];
    unint64_t v6 = [v3 objectForKey:@"mapHeight"];
    uint64_t v7 = [v3 objectForKey:@"mapWidth"];
    int v8 = (void *)v7;
    if (v4) {
      BOOL v9 = v5 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || v6 == 0 || v7 == 0)
    {
      xmmword_1EB316188 = MKCoordinateRegionInvalid;
      *(_OWORD *)&qword_1EB316198 = unk_18BD1C248;
    }
    else
    {
      objc_msgSend(v4, "_mapkit_cgFloatValue");
      uint64_t v13 = v12;
      objc_msgSend(v5, "_mapkit_cgFloatValue");
      uint64_t v15 = v14;
      objc_msgSend(v6, "_mapkit_cgFloatValue");
      uint64_t v17 = v16;
      objc_msgSend(v8, "_mapkit_cgFloatValue");
      *(void *)&xmmword_1EB316188 = v13;
      *((void *)&xmmword_1EB316188 + 1) = v15;
      qword_1EB316198 = v17;
      unk_1EB3161A0 = v18;
    }
  }
  else
  {
    xmmword_1EB316188 = MKCoordinateRegionInvalid;
    *(_OWORD *)&qword_1EB316198 = unk_18BD1C248;
  }
}

void sub_18BB1B13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB1D770(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___registerStateCaptureCallbacks_block_invoke()
{
  _stateCaptureCallbackRegistration = 1;
  return MEMORY[0x1F411C598](0, _getConfigStoreStringKeysForStateCapture);
}

double MKDefaultCoordinateRegion()
{
  v0 = [MEMORY[0x1E4F64500] sharedConfiguration];
  uint64_t v1 = [v0 countryCode];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __MKDefaultCoordinateRegion_block_invoke;
  block[3] = &unk_1E54B8188;
  id v7 = v1;
  uint64_t v2 = _MergedGlobals_170;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_MergedGlobals_170, block);
  }
  double v4 = *(double *)&xmmword_1EB316188;

  return v4;
}

void sub_18BB1EDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB1EEC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BB1F3BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void _scaleForMapRect(double *a1, double *a2, double *a3, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18)
{
  double v26 = a9 + a11 - a9;
  double v27 = a10 + a12 - a10;
  v49.origin.CGFloat x = a5 + a14;
  CGFloat x = v49.origin.x;
  v49.origin.CGFloat y = a6 + a13;
  CGFloat y = v49.origin.y;
  v49.size.CGFloat width = a7 - (a14 + a16);
  CGFloat width = v49.size.width;
  v49.size.CGFloat height = a8 - (a13 + a15);
  CGFloat height = v49.size.height;
  double MaxX = CGRectGetMaxX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  *a3 = MaxX - CGRectGetMinX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v34 = MaxY - CGRectGetMinY(v52);
  a3[1] = v34;
  double v35 = v34 / v27;
  if (*a3 / v26 >= v35) {
    double v36 = v35;
  }
  else {
    double v36 = *a3 / v26;
  }
  double v37 = log2(v36) + 21.0;
  double v38 = 0.0;
  if (v37 >= 0.0) {
    double v38 = v37;
  }
  if (a18 != -1.0 && v38 > a18)
  {
    long double v39 = exp2(21.0 - a18);
    double v38 = a18;
    double v36 = 1.0 / v39;
  }
  if (a17 != -1.0 && v38 < a17)
  {
    long double v40 = exp2(21.0 - a17);
    double v38 = a17;
    double v36 = 1.0 / v40;
  }
  if (a4)
  {
    double v41 = floor(v38);
    long double v42 = exp2((double)(uint64_t)(21 - vcvtmd_u64_f64(v38)));
    double v38 = v41;
    double v36 = 1.0 / v42;
  }
  *a2 = v38;
  double v43 = a9 + a11 * 0.5;
  double v44 = a10 + a12 * 0.5;
  if (v36 > 0.0)
  {
    double v43 = v43 + (a16 - a14) * 0.5 / v36;
    double v44 = v44 + (a15 - a13) * 0.5 / v36;
  }
  *a1 = v43;
  a1[1] = v44;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  double x = rect.origin.x;
  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY)
  {
    CLLocationDegrees latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
    double v9 = 0.0;
    double v10 = 0.0;
  }
  else
  {
    double height = rect.size.height;
    double width = rect.size.width;
    double y = rect.origin.y;
    v39.double x = rect.origin.x + rect.size.width * 0.5;
    v39.double y = rect.origin.y + rect.size.height * 0.5;
    CLLocationCoordinate2D v6 = MKCoordinateForMapPoint(v39);
    CLLocationDegrees latitude = v6.latitude;
    double longitude = v6.longitude;
    if (v6.longitude < -180.0 || v6.longitude > 180.0)
    {
      if (v6.longitude <= 180.0) {
        double longitude = fmod(v6.longitude + -180.0, 360.0) + 180.0;
      }
      else {
        double longitude = fmod(v6.longitude + 180.0, 360.0) + -180.0;
      }
    }
    double v11 = x + width;
    double v38 = y + height;
    if ((x >= 0.0 || v11 <= 0.0) && (x >= 268435456.0 || v11 <= 268435456.0))
    {
      v43.double x = x;
      v43.double y = y;
      double v30 = MKCoordinateForMapPoint(v43).longitude;
      v44.double x = x + width;
      double v29 = y + height;
      v44.double y = y + height;
      double v28 = vabdd_f64(v30, MKCoordinateForMapPoint(v44).longitude);
    }
    else
    {
      v50.size.double width = 268435456.0;
      v50.origin.double x = 0.0;
      v50.origin.double y = 0.0;
      v47.origin.double x = x;
      v47.origin.double y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      v50.size.double height = 268435456.0;
      MKMapRect v48 = MKMapRectIntersection(v47, v50);
      double v12 = INFINITY;
      double v13 = v11 + -268435456.0;
      if (v11 > 268435456.0) {
        double v14 = 0.0;
      }
      else {
        double v14 = INFINITY;
      }
      if (v11 <= 268435456.0) {
        double v13 = 0.0;
      }
      else {
        double v12 = y;
      }
      if (v11 > 268435456.0) {
        double v15 = height;
      }
      else {
        double v15 = 0.0;
      }
      double v16 = fabs(x);
      if (x < 0.0) {
        double v17 = x + 268435456.0;
      }
      else {
        double v17 = v14;
      }
      double v37 = longitude;
      if (x < 0.0) {
        double v18 = y;
      }
      else {
        double v18 = v12;
      }
      if (x < 0.0) {
        double v19 = v16;
      }
      else {
        double v19 = v13;
      }
      if (x < 0.0) {
        double v20 = height;
      }
      else {
        double v20 = v15;
      }
      double v34 = v20;
      double v35 = v19;
      double v21 = v48.origin.x + v48.size.width;
      double v22 = v48.origin.y + v48.size.height;
      double v36 = v11;
      double v23 = MKCoordinateForMapPoint(*(MKMapPoint *)&v48).longitude;
      v40.double x = v21;
      v40.double y = v22;
      double v24 = vabdd_f64(v23, MKCoordinateForMapPoint(v40).longitude);
      double v25 = v18 + v34;
      v41.double x = v17;
      v41.double y = v18;
      double longitude = v37;
      double v26 = MKCoordinateForMapPoint(v41).longitude;
      v42.double x = v17 + v35;
      v42.double y = v25;
      double v27 = vabdd_f64(v26, MKCoordinateForMapPoint(v42).longitude);
      double v11 = v36;
      double v28 = v24 + v27;
      CLLocationDegrees latitude = v6.latitude;
      double v29 = v38;
    }
    v45.double x = x;
    v45.double y = y;
    double v31 = MKCoordinateForMapPoint(v45).latitude;
    v46.double x = v11;
    v46.double y = v29;
    double v9 = fmin(v31 - MKCoordinateForMapPoint(v46).latitude, 180.0);
    double v10 = fmin(v28, 360.0);
  }
  double v32 = latitude;
  double v33 = longitude;
  result.span.longitudeDelta = v10;
  result.span.latitudeDelta = v9;
  result.center.double longitude = v33;
  result.center.CLLocationDegrees latitude = v32;
  return result;
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  double x = mapPoint.x + 268435456.0;
  if (mapPoint.x >= 0.0) {
    double x = mapPoint.x;
  }
  if (mapPoint.x > 268435456.0) {
    double v2 = mapPoint.x + -268435456.0;
  }
  else {
    double v2 = x;
  }
  long double v4 = MKCoordinateForTilePoint(v2, mapPoint.y, 21.0);
  if (v3 < -180.0 || v3 > 180.0)
  {
    if (v3 <= 180.0) {
      double v3 = fmod(v3 + -180.0, 360.0) + 180.0;
    }
    else {
      double v3 = fmod(v3 + 180.0, 360.0) + -180.0;
    }
  }
  double v5 = v4;
  result.double longitude = v3;
  result.CLLocationDegrees latitude = v5;
  return result;
}

long double MKCoordinateForTilePoint(double a1, double a2, double a3)
{
  double v3 = a2 * 0.0078125;
  long double v4 = ldexp(1.0, (int)a3);
  long double v5 = exp((v3 + v4 * -0.5) / (v4 / 6.28318531));
  return (atan(v5) * -2.0 + 1.57079633) * 57.2957795;
}

void sub_18BB20D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB21134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _registerStateCaptureCallbacks()
{
  if (_registerStateCaptureCallbacks_onceToken != -1) {
    dispatch_once(&_registerStateCaptureCallbacks_onceToken, &__block_literal_global_5_0);
  }
}

id MKGetUserLocationViewLog()
{
  if (MKGetUserLocationViewLog_onceToken != -1) {
    dispatch_once(&MKGetUserLocationViewLog_onceToken, &__block_literal_global_40);
  }
  v0 = (void *)MKGetUserLocationViewLog_log;

  return v0;
}

void sub_18BB23BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  _Unwind_Resume(a1);
}

uint64_t labelScaleFactorForContentSizeCategory(void *a1)
{
  v6[16] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v6[0] = (id)*MEMORY[0x1E4F437A0];
  v6[1] = 2;
  v6[2] = (id)*MEMORY[0x1E4F43798];
  v6[3] = 3;
  v6[4] = (id)*MEMORY[0x1E4F43790];
  v6[5] = 4;
  v6[6] = (id)*MEMORY[0x1E4F43780];
  v6[7] = 4;
  v6[8] = (id)*MEMORY[0x1E4F43778];
  v6[9] = 4;
  v6[10] = (id)*MEMORY[0x1E4F43770];
  v6[11] = 4;
  v6[12] = (id)*MEMORY[0x1E4F43768];
  v6[13] = 4;
  uint64_t v2 = 0;
  v6[14] = (id)*MEMORY[0x1E4F43760];
  v6[15] = 4;
  uint64_t v3 = 1;
  while (![v1 isEqualToString:v6[v2]])
  {
    v2 += 2;
    if (v2 == 16) {
      goto LABEL_6;
    }
  }
  uint64_t v3 = v6[v2 + 1];
LABEL_6:
  for (uint64_t i = 14; i != -2; i -= 2)

  return v3;
}

void sub_18BB25594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  for (uint64_t i = 112; i != -16; i -= 16)

  _Unwind_Resume(a1);
}

void sub_18BB25B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB25C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MKGetMKDefaultLog()
{
  if (MKGetMKDefaultLog_onceToken != -1) {
    dispatch_once(&MKGetMKDefaultLog_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)MKGetMKDefaultLog_log;

  return v0;
}

id _attributionImagesForType(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long double v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  if (a2 == 1) {
    int v5 = 6;
  }
  else {
    int v5 = 5;
  }
  long long v16 = 0uLL;
  long long v17 = 0uLL;
  CLLocationCoordinate2D v6 = objc_msgSend(v3, "resources", (void)v14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 resourceType] == v5)
        {
          double v12 = [v11 filename];
          [v4 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

void sub_18BB2A140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_18BB2A4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v27);
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_18BB2AD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ___shouldUseUIApplicationState_block_invoke()
{
  uint64_t result = _UIApplicationIsExtension();
  _shouldUseUIApplicationState_value = result ^ 1;
  return result;
}

id _routeAttributesForMKDirectionsRequest(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F649A0]);
  BOOL v3 = _MKLinkedOnOrAfterReleaseSet(1283);
  int BOOL = GEOConfigGetBOOL();
  if (v3 && BOOL)
  {
    uint64_t v5 = [v1 transportType];
    CLLocationCoordinate2D v6 = [MEMORY[0x1E4F1CA48] array];
    if (v5 == 0xFFFFFFF)
    {
      unint64_t v7 = GEOGetUserTransportTypePreference();
      if (v7 < 5) {
        [v6 addObject:qword_1E54BE9E8[v7]];
      }
    }
    else if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 2) != 0 && ([v6 containsObject:&unk_1ED97EE50] & 1) == 0) {
        [v6 addObject:&unk_1ED97EE50];
      }
      if ((v5 & 4) != 0 && ([v6 containsObject:&unk_1ED97EE68] & 1) == 0) {
        [v6 addObject:&unk_1ED97EE68];
      }
      if ((v5 & 8) != 0 && ([v6 containsObject:&unk_1ED97EE38] & 1) == 0) {
        [v6 addObject:&unk_1ED97EE38];
      }
      if (![v6 count]) {
        [v6 addObject:&unk_1ED97EE80];
      }
      uint64_t v8 = (void *)[v6 mutableCopy];

      goto LABEL_29;
    }
    if (([v6 containsObject:&unk_1ED97EE80] & 1) == 0) {
      [v6 addObject:&unk_1ED97EE80];
    }
    goto LABEL_13;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [v1 transportType];
  switch(v9)
  {
    case 2:
      double v10 = &unk_1ED97EE50;
      break;
    case 4:
      double v10 = &unk_1ED97EE68;
      break;
    case 8:
      double v10 = &unk_1ED97EE38;
      break;
    default:
      double v10 = &unk_1ED97EE80;
      break;
  }
  [v8 addObject:v10];
LABEL_29:
  [v8 removeObject:&unk_1ED97EE68];
  double v11 = [v8 firstObject];
  uint64_t v12 = [v11 intValue];

  [v2 setMainTransportType:v12];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v14) {
    goto LABEL_49;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = [*(id *)(*((void *)&v36 + 1) + 8 * i) intValue];
      if (v18 != v12) {
        [v2 addAdditionalTransportType:v18];
      }
      if (v18 == 3)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F64508]);
        [v2 setCyclingOptions:v22];
      }
      else if (v18 == 2)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F64BE8]);
        [v2 setWalkingOptions:v22];
      }
      else
      {
        if (v18) {
          continue;
        }
        id v19 = objc_alloc_init(MEMORY[0x1E4F64410]);
        [v2 setAutomobileOptions:v19];

        double v20 = [v2 automobileOptions];
        [v20 setIncludeHistoricTravelTime:1];

        double v21 = [v2 automobileOptions];
        [v21 setTrafficType:3];

        id v22 = objc_alloc_init(MEMORY[0x1E4F64B88]);
        if ([v1 tollPreference] == 1) {
          [v22 setAvoidTolls:1];
        }
        if ([v1 highwayPreference] == 1) {
          [v22 setAvoidHighways:1];
        }
        double v23 = [v2 automobileOptions];
        [v23 setUserPreferences:v22];
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v15);
LABEL_49:

  [v2 setTrafficType:3];
  [v2 setIncludeTrafficAlongRoute:1];
  if ([v1 _includeRoutePoints]) {
    [v2 setRoutePointTypeForTransportType:v12];
  }
  objc_msgSend(v2, "setIncludeHistoricTravelTime:", objc_msgSend(v1, "_includeTravelTimes"));
  objc_msgSend(v2, "setIncludeTrafficIncidents:", objc_msgSend(v1, "_includeTrafficIncidents"));
  double v24 = [v1 _arrivalDate];
  double v25 = [v1 _departureDate];
  double v26 = v25;
  if ((v24 == 0) == (v25 != 0))
  {
    if (v24)
    {
      double v27 = v35;
      [v24 timeIntervalSinceReferenceDate];
      uint64_t v34 = 0;
      int v29 = 1;
      double v30 = &v34;
      goto LABEL_56;
    }
    if (v25)
    {
      double v27 = v33;
      [v25 timeIntervalSinceReferenceDate];
      int v29 = 0;
      uint64_t v32 = 0;
      double v30 = &v32;
LABEL_56:
      v30[1] = v28;
      *((_DWORD *)v30 + 4) = v29;
      *((unsigned char *)v30 + 20) = 6;
      v27[2] = 0;
      *(_WORD *)double v27 = 0;
      [v2 setTimepoint:v32];
    }
  }
  [v2 addUiContext:3];

  return v2;
}

void sub_18BB2DD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

__CFString *MKCurrencySymbolForLocale(void *a1)
{
  id v1 = [a1 objectForKey:*MEMORY[0x1E4F1C410]];
  if ([v1 length] == 1)
  {
    id v2 = v1;
  }
  else
  {
    if (![v1 length])
    {
      long double v4 = @"$";
      goto LABEL_11;
    }
    uint64_t v3 = 0;
    long double v4 = @"$";
    while (1)
    {
      uint64_t v5 = [v1 characterAtIndex:v3];
      if (u_charType(v5) == 25) {
        break;
      }
      if (++v3 >= (unint64_t)[v1 length]) {
        goto LABEL_11;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%C", v5);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  long double v4 = v2;
LABEL_11:

  return v4;
}

BOOL ___notifyOnSizeChange_block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(3081);
  _MergedGlobals_9 = result;
  return result;
}

id MKLocalizedStringForCurrentLocation()
{
  if (qword_1EB315E80 != -1) {
    dispatch_once(&qword_1EB315E80, &__block_literal_global_34);
  }
  v0 = (void *)qword_1EB315E78;

  return v0;
}

void sub_18BB2F5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___get_platform_and_version_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = dyld_get_base_platform();
  dword_1EB315F78 = result;
  *(_DWORD *)algn_1EB315F7C = a3;
  return result;
}

void __MKLocalizedStringForCurrentLocation_block_invoke()
{
  uint64_t v0 = _MKLocalizedStringFromThisBundle(@"My Location");
  id v1 = (void *)qword_1EB315E78;
  qword_1EB315E78 = v0;
}

void __MKGetUserLocationViewLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "UserLocationView");
  id v1 = (void *)MKGetUserLocationViewLog_log;
  MKGetUserLocationViewLog_log = (uint64_t)v0;
}

void __MKGetMKMapViewLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKMapView");
  id v1 = (void *)qword_1E9154030;
  qword_1E9154030 = (uint64_t)v0;
}

void __MKGetMKLocationManagerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKLocationManager");
  id v1 = (void *)qword_1EB315CC8;
  qword_1EB315CC8 = (uint64_t)v0;
}

void __MKGetMKDefaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKDefault");
  id v1 = (void *)MKGetMKDefaultLog_log;
  MKGetMKDefaultLog_log = (uint64_t)v0;
}

void __MKGetApplicationStateMonitorLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "ApplicationStateMonitor");
  id v1 = (void *)qword_1EB316130;
  qword_1EB316130 = (uint64_t)v0;
}

void __MKGetAppImageManagerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "AppImageManager");
  id v1 = (void *)qword_1EB315C18;
  qword_1EB315C18 = (uint64_t)v0;
}

void __MKGetAnnotationsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "Annotations");
  id v1 = (void *)MKGetAnnotationsLog_log;
  MKGetAnnotationsLog_log = (uint64_t)v0;
}

void __GEOGetMKIconManagerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.GeoServices", "MKIconManager");
  id v1 = (void *)qword_1EB315D90;
  qword_1EB315D90 = (uint64_t)v0;
}

void sub_18BB31898(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BB32654(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB32874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MKGEOAppEnteredForeground()
{
  if (_geoInForeground == 1)
  {
    _geoInForeground = 0;
    id v0 = [MEMORY[0x1E4F64500] sharedConfiguration];
    [v0 updateProvidersForCurrentCountry];
  }
}

void __MKRegisterGEOMultitaskingNotifications_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_MKGEOAppEnteredBackground, (CFStringRef)*MEMORY[0x1E4F43660], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v1 = CFNotificationCenterGetLocalCenter();
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F43708];

  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_MKGEOAppEnteredForeground, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

double _MKCartographicConfigurationDefault@<D0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_18BD1B110;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)&double result = 1;
  *(_OWORD *)(a1 + 32) = xmmword_18BD1B170;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t ___get_platform_and_version_block_invoke()
{
  _dyld_get_prog_image_header();
  dyld_get_image_versions();
  uint64_t result = _GEOConfigHasValue();
  if (result)
  {
    uint64_t result = GEOConfigGetUInteger();
    __int16 v1 = (result & 0xFF00) + 256;
    if (HIBYTE(v1) > 0x10u)
    {
      int v3 = 0;
      int v4 = -268435456;
    }
    else
    {
      uint64_t v2 = SHIBYTE(v1);
      int v3 = dword_18BD1B4E8[SHIBYTE(v1)];
      int v4 = dword_18BD1B52C[v2];
    }
    dword_1EB315F78 = v3;
    *(_DWORD *)algn_1EB315F7C = v4;
  }
  return result;
}

void sub_18BB33C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BB34114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getCNMonogrammerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCNMonogrammerClass_softClass;
  uint64_t v7 = getCNMonogrammerClass_softClass;
  if (!getCNMonogrammerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCNMonogrammerClass_block_invoke;
    v3[3] = &unk_1E54B8448;
    v3[4] = &v4;
    __getCNMonogrammerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18BB34570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNMonogrammerClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  Class result = objc_getClass("CNMonogrammer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNMonogrammerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)ContactsUILibrary();
  }
  return result;
}

uint64_t ContactsUILibrary()
{
  uint64_t v0 = ContactsUILibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t ContactsUILibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  int v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ContactsUILibraryCore_frameworkLibrary;
  uint64_t v5 = ContactsUILibraryCore_frameworkLibrary;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E54BD0A8;
    long long v7 = *(_OWORD *)&off_1E54BD0B8;
    v3[3] = _sl_dlopen();
    ContactsUILibraryCore_frameworkLibrardouble y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18BB34764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB34B60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB3515C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB360CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL10_diskCachev_block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [(id)qword_1EB315DA0 URLByAppendingPathComponent:@"MapsIcons"];
  if (v0) {
    goto LABEL_2;
  }
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.Spotlight"];

  if (!v6) {
    goto LABEL_8;
  }
  long long v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v7 URLsForDirectory:13 inDomains:1];
  uint64_t v9 = [v8 firstObject];

  double v10 = [MEMORY[0x1E4F28B50] mainBundle];
  double v11 = [v10 bundleIdentifier];
  uint64_t v12 = [v11 stringByAppendingPathExtension:@"mapsiconcache"];

  uint64_t v0 = [v9 URLByAppendingPathComponent:v12];

  if (v0)
  {
LABEL_2:
    uint64_t v1 = GEOGetMKIconManagerLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      uint64_t v14 = v0;
      _os_log_impl(&dword_18BAEC000, v1, OS_LOG_TYPE_DEBUG, "Init cache at %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v2 = [[_MKIconDiskCache alloc] initWithDirectoryURL:v0];
    int v3 = (void *)qword_1EB315DA8;
    qword_1EB315DA8 = (uint64_t)v2;
  }
  else
  {
LABEL_8:
    uint64_t v0 = GEOGetMKIconManagerLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18BAEC000, v0, OS_LOG_TYPE_DEBUG, "Not using cache, url not defined", (uint8_t *)&v13, 2u);
    }
  }
}

void sub_18BB36FB0(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void __MKGetCuratedCollectionsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "CuratedCollections");
  uint64_t v1 = (void *)MKGetCuratedCollectionsLog_log;
  MKGetCuratedCollectionsLog_log = (uint64_t)v0;
}

void sub_18BB37924(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18BB37CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB381E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB384FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

CGPathRef _MKCGPathCreateCopyByStrokingPath(CGPathRef path, CGLineCap lineCap, CGLineCap a3, CGLineJoin a4, CGFloat a5, CGFloat a6)
{
  if (lineCap == a3)
  {
    return CGPathCreateCopyByStrokingPath(path, 0, a5, lineCap, a4, a6);
  }
  else
  {
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(path, 0, a5, kCGLineCapButt, a4, a6);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, CopyByStrokingPath);
    uint64_t v30 = 0;
    double v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v23 = 0;
    double v24 = (CGPoint *)&v23;
    uint64_t v25 = 0x4012000000;
    double v26 = __Block_byref_object_copy_;
    double v27 = __Block_byref_object_dispose_;
    uint64_t v28 = "";
    long long v29 = *MEMORY[0x1E4F1DAD8];
    uint64_t v16 = 0;
    long long v17 = (CGPoint *)&v16;
    uint64_t v18 = 0x4012000000;
    id v19 = __Block_byref_object_copy_;
    double v20 = __Block_byref_object_dispose_;
    double v21 = "";
    long long v22 = *MEMORY[0x1E4F1DAD8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___MKCGPathCreateCopyByStrokingPath_block_invoke;
    v13[3] = &unk_1E54B8160;
    v13[4] = &v30;
    v13[5] = &v16;
    *(CGFloat *)&v13[8] = a5;
    v13[6] = &v23;
    v13[7] = Mutable;
    CGLineCap v14 = a3;
    CGLineCap v15 = lineCap;
    CGPathApplyWithBlock(path, v13);
    if (v31[3]) {
      _MKCGPathAddLineCap(Mutable, v24[3], v17[3], a5, a3, 0);
    }
    CGPathRelease(CopyByStrokingPath);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v30, 8);
    return Mutable;
  }
}

void sub_18BB39B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void _MKCGPathAddLineCap(CGMutablePathRef path, CGPoint a2, CGPoint a3, double a4, CGLineCap a5, BOOL a6)
{
  if (a5)
  {
    BOOL v6 = a6;
    double v9 = a3.y - a2.y;
    double v10 = 1.0 / sqrt((a3.x - a2.x) * (a3.x - a2.x) + 0.0 + v9 * v9);
    double v11 = (a3.x - a2.x) * v10;
    double v12 = (a3.y - a2.y) * v10;
    if (a6) {
      double x = a2.x;
    }
    else {
      double x = a3.x;
    }
    if (a6) {
      double y = a2.y;
    }
    else {
      double y = a3.y;
    }
    if (a5 == kCGLineCapRound)
    {
      double v18 = acos(fmax(fmin(v11 + 0.0 + v12 * 0.0, 1.0), -1.0));
      if (v9 >= 0.0) {
        double v19 = v18;
      }
      else {
        double v19 = -v18;
      }
      CGPathMoveToPoint(path, 0, x, y);
      CGPathAddArc(path, 0, x, y, a4 * 0.5, v19 + -1.57079633, v19 + 1.57079633, v6);
    }
    else
    {
      if (a5 != kCGLineCapSquare) {
        return;
      }
      if (a6) {
        double v15 = -v11;
      }
      else {
        double v15 = (a3.x - a2.x) * v10;
      }
      if (a6) {
        double v16 = -v12;
      }
      else {
        double v16 = (a3.y - a2.y) * v10;
      }
      double v17 = a4 * 0.5;
      CGPathMoveToPoint(path, 0, x + v17 * (v15 - v16), y + v17 * (v16 + v15));
      CGPathAddLineToPoint(path, 0, x + v17 * (v16 + v15), y + v17 * (v16 - v15));
      CGPathAddLineToPoint(path, 0, x + v17 * v16, y - v17 * v15);
      CGPathAddLineToPoint(path, 0, x - v17 * v16, y + v17 * v15);
    }
    CGPathCloseSubpath(path);
  }
}

id makeAnimation(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  double v9 = (void *)MEMORY[0x1E4F39B48];
  id v10 = a3;
  id v11 = a2;
  double v12 = [v9 animationWithKeyPath:a1];
  [v12 setFromValue:v11];

  [v12 setToValue:v10];
  [v12 setBeginTime:a4];
  [v12 setDuration:a5];
  [v12 setFillMode:*MEMORY[0x1E4F39FB0]];
  int v13 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [v12 setTimingFunction:v13];

  return v12;
}

id MKGetCuratedCollectionsBatchControllerLog()
{
  if (qword_1EB315BF0 != -1) {
    dispatch_once(&qword_1EB315BF0, &__block_literal_global);
  }
  os_log_t v0 = (void *)_MergedGlobals_124;

  return v0;
}

void sub_18BB3A7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __MKGetCuratedCollectionsBatchControllerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "CuratedCollectionsBatchController");
  uint64_t v1 = (void *)_MergedGlobals_124;
  _MergedGlobals_124 = (uint64_t)v0;
}

id MKGetMKRemoteUILog()
{
  if (qword_1E91540E8 != -1) {
    dispatch_once(&qword_1E91540E8, &__block_literal_global_0);
  }
  os_log_t v0 = (void *)_MergedGlobals_1_1;

  return v0;
}

void __MKGetMKRemoteUILog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKRemoteUI");
  uint64_t v1 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = (uint64_t)v0;
}

void sub_18BB3E004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 112), 8);
  _Unwind_Resume(a1);
}

id _errorWithReason(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = MKErrorDomain;
  uint64_t v8 = *MEMORY[0x1E4F1D138];
  v9[0] = a1;
  int v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a1;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [v1 errorWithDomain:v2 code:6 userInfo:v5];

  return v6;
}

uint64_t _geoJSONObjectType(uint64_t a1)
{
  uint64_t v1 = [&unk_1ED97F030 objectForKeyedSubscript:a1];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _geoJSONGeometryType(uint64_t a1)
{
  uint64_t v1 = [&unk_1ED97F058 objectForKeyedSubscript:a1];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id MKGetMKGeoJSONSerializationLog()
{
  if (qword_1EB315C30 != -1) {
    dispatch_once(&qword_1EB315C30, &__block_literal_global_2);
  }
  os_log_t v0 = (void *)_MergedGlobals_126;

  return v0;
}

char *_createVerticesFromGeoJSON(void *a1, void *a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a2) {
      goto LABEL_36;
    }
    double v16 = @"coordinates value is not an array";
LABEL_22:
    _errorWithReason(v16);
    uint64_t v5 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (![v3 count]) {
    goto LABEL_36;
  }
  id v4 = (char *)malloc_type_malloc(16 * [v3 count], 0x1000040451B5BE8uLL);
  if (!v4)
  {
    if (!a2) {
      goto LABEL_36;
    }
    double v16 = @"Failed to allocate buffer";
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  if (![v3 count]) {
    goto LABEL_37;
  }
  unint64_t v6 = 0;
  long long v7 = v5 + 8;
  while (1)
  {
    id v8 = [v3 objectAtIndexedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a2) {
        goto LABEL_35;
      }
      double v17 = @"coordinate value is not an array";
LABEL_31:
      _errorWithReason(v17);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    if ((unint64_t)[v8 count] <= 1)
    {
      if (!a2) {
        goto LABEL_35;
      }
      double v17 = @"GeoJSON positions must have at least two values";
      goto LABEL_31;
    }
    if ((unint64_t)[v8 count] >= 4)
    {
      double v9 = MKGetMKGeoJSONSerializationLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_INFO, "GeoJSON positions SHOULD NOT extend positions beyond three elements", buf, 2u);
      }
    }
    id v10 = [v8 objectAtIndexedSubscript:0];
    id v11 = [v8 objectAtIndexedSubscript:1];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a2)
      {
        _errorWithReason(@"GeoJSON positions must be an array of numbers");
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_34;
    }
    [v11 doubleValue];
    CLLocationDegrees v13 = v12;
    [v10 doubleValue];
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v14);
    if (v15.longitude < -180.0 || v15.longitude > 180.0 || v15.latitude < -90.0 || v15.latitude > 90.0) {
      break;
    }

    *(MKMapPoint *)(v7 - 8) = MKMapPointForCoordinate(v15);
    ++v6;
    v7 += 16;
    if (v6 >= [v3 count]) {
      goto LABEL_37;
    }
  }
  if (a2)
  {
    double v18 = NSString;
    double v19 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&v15.latitude, *(void *)&v15.longitude];
    double v20 = [v18 stringWithFormat:@"Invalid coordinate position: %@", v19];
    _errorWithReason(v20);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:

LABEL_35:
  free(v5);

LABEL_36:
  uint64_t v5 = 0;
LABEL_37:

  return v5;
}

void __MKGetMKGeoJSONSerializationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKGeoJSONSerialization");
  uint64_t v1 = (void *)_MergedGlobals_126;
  _MergedGlobals_126 = (uint64_t)v0;
}

void sub_18BB40CFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id getAMSMediaTaskClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getAMSMediaTaskClass_softClass;
  uint64_t v7 = getAMSMediaTaskClass_softClass;
  if (!getAMSMediaTaskClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAMSMediaTaskClass_block_invoke;
    v3[3] = &unk_1E54B8448;
    v3[4] = &v4;
    __getAMSMediaTaskClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18BB40DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetAppleMediaServicesServerLog()
{
  if (qword_1EB315C50 != -1) {
    dispatch_once(&qword_1EB315C50, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)qword_1EB315C48;

  return v0;
}

void __getAMSMediaTaskClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSMediaTask");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSMediaTaskClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __AppleMediaServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E54B8468;
    uint64_t v3 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrardouble y = _sl_dlopen();
    os_log_t v0 = (void *)v1[0];
    if (AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      os_log_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMediaServicesLibraryCore_frameworkLibrardouble y = result;
  return result;
}

Class __getAMSBagClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSBag");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAMSBagClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__MKGetAppleMediaServicesServerLog_block_invoke(v3);
  }
  return result;
}

void __MKGetAppleMediaServicesServerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "AppleMediaServicesServer");
  id v1 = (void *)qword_1EB315C48;
  qword_1EB315C48 = (uint64_t)v0;
}

uint64_t __ClipServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ClipServicesLibraryCore_frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ClipServicesLibrary()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = ClipServicesLibraryCore_frameworkLibrary;
  uint64_t v8 = ClipServicesLibraryCore_frameworkLibrary;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __ClipServicesLibraryCore_block_invoke;
    v2[4] = &unk_1E54B8598;
    uint64_t v3 = &v5;
    uint64_t v4 = v2;
    long long v9 = xmmword_1E54B8570;
    long long v10 = *(_OWORD *)&off_1E54B8580;
    v6[3] = _sl_dlopen();
    ClipServicesLibraryCore_frameworkLibrardouble y = *(void *)(v3[1] + 24);
    uint64_t v0 = v6[3];
  }
  _Block_object_dispose(&v5, 8);
  id v1 = v2[0];
  if (!v0)
  {
    id v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v2[0]) {
LABEL_7:
  }
    free(v1);
}

void sub_18BB418C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCPSClipMetadataRequestClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary();
  Class result = objc_getClass("CPSClipMetadataRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipMetadataRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getCPSClipRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getCPSClipRequestClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary();
  Class result = objc_getClass("CPSClipRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSClipRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return __getCPSValidationRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getCPSValidationRequestClass_block_invoke(uint64_t a1)
{
  ClipServicesLibrary();
  Class result = objc_getClass("CPSValidationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCPSValidationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[MKClipServices sharedInstance];
  }
  return result;
}

void sub_18BB42910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_18BB42D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18BB43140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB45FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_18BB464D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB477E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB47C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB4A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB4BA78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BB53C48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18BB54418(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_18BB5460C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB547FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB54CCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18BB559AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BB55BCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18BB55F14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_18BB5650C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18BB5664C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18BB5678C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18BB570B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB58378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BB58548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB586D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MKMapViewUseModernControls()
{
  if (qword_1E9154028 != -1) {
    dispatch_once(&qword_1E9154028, &__block_literal_global_1868);
  }
  return byte_1E9153FDB;
}

id _filterLabelMarkersPredicate()
{
  if (qword_1E9154048 != -1) {
    dispatch_once(&qword_1E9154048, &__block_literal_global_1882);
  }
  uint64_t v0 = (void *)qword_1E9154050;

  return v0;
}

void ___filterLabelMarkersPredicate_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1886];
  id v1 = (void *)qword_1E9154050;
  qword_1E9154050 = v0;
}

BOOL ___filterLabelMarkersPredicate_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

double MKNormalizedPointForLayer(void *a1, double a2)
{
  [a1 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double v8 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetHeight(v11);
  [a1 contentsAreFlipped];
  return a2 / v8;
}

double MKIntegralPoint(double a1, double a2, double a3)
{
  double v3 = a3;
  if (a3 == 0.0)
  {
    uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 scale];
    double v3 = v6;
  }
  return round(a1 * v3) / v3;
}

void MKSetLayoutPriorityOnConstraints(void *a1, float a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        *(float *)&double v5 = a2;
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPriority:v5];
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void _setAlphaForViews(void *a1, int a2, double a3, double a4, double a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  long long v10 = v9;
  if (a2)
  {
    long long v11 = (void *)MEMORY[0x1E4F42FF0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___setAlphaForViews_block_invoke;
    v20[3] = &unk_1E54B81B0;
    id v21 = v9;
    double v22 = a3;
    [v11 animateWithDuration:4 delay:v20 options:0 animations:a4 completion:a5];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v12 = [v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) setAlpha:a3];
        }
        while (v13 != v15);
        uint64_t v13 = [v10 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

void _setViewTransform(void *a1, _OWORD *a2, double a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (a3 <= 0.0)
  {
    long long v9 = a2[1];
    v10[0] = *a2;
    v10[1] = v9;
    v10[2] = a2[2];
    [v5 setTransform:v10];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___setViewTransform_block_invoke;
    v11[3] = &unk_1E54B8D88;
    id v12 = v5;
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v15 = a2[2];
    [v7 animateWithDuration:4 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:a3 options:0.0 animations:0.666666687 completion:0.0];
  }
}

uint64_t _MKMarkerAnnotationViewSelectionShouldSway()
{
  if (!MapsFeature_IsEnabled_ShelbyvilleMapKit() || !_MKLinkedOnOrAfterReleaseSet(3081)) {
    return 0;
  }
  uint64_t v0 = +[MKSystemController sharedInstance];
  uint64_t v1 = [v0 reduceMotionEnabled] ^ 1;

  return v1;
}

id _MKMarkerAnnotationViewSelectionSwayAnimation()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v0 = (float)arc4random() * 2.3283e-10;
  if (v0 >= 0.5) {
    float v1 = (float)(v0 * 0.05) + 0.05;
  }
  else {
    float v1 = -(float)((float)(v0 * 0.05) + 0.05);
  }
  id v2 = _createSpringAnimationForSwaying(v1);
  id v3 = [MEMORY[0x1E4F39B38] animation];
  long long v9 = v2;
  uint64_t v4 = _createSpringAnimationForSwaying(0.0);
  long long v10 = v4;
  id v5 = _createSpringAnimationForSwaying(-v1);
  long long v11 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  objc_msgSend(v3, "setAnimations:", v6, v9, v10);

  [v2 settlingDuration];
  objc_msgSend(v3, "setDuration:");
  uint64_t v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  [v3 setTimingFunction:v7];

  return v3;
}

id _createSpringAnimationForSwaying(float a1)
{
  id v2 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.rotation.z"];
  [v2 setStiffness:127.152748];
  [v2 setDamping:5.0];
  [v2 setMass:1.0];
  [v2 setInitialVelocity:0.0];
  *(float *)&double v3 = a1;
  uint64_t v4 = [NSNumber numberWithFloat:v3];
  [v2 setToValue:v4];

  [v2 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v2 setAdditive:1];

  return v2;
}

void ___setAlphaForViews_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t ___setViewTransform_block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

id ImageForArtworkDataSource(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 iconDataSource];
  uint64_t v6 = [v5 styleAttributes];

  uint64_t v7 = [v4 shieldDataSource];

  id v8 = 0;
  if (v3 && v6 | v7)
  {
    uint64_t v9 = [v3 userInterfaceStyle];
    [v3 displayScale];
    if (v10 == 0.0)
    {
      long long v11 = [MEMORY[0x1E4F42D90] mainScreen];
      [v11 scale];
      double v13 = v12;
    }
    else
    {
      [v3 displayScale];
      double v13 = v14;
    }
    BOOL v15 = v9 == 2;
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F645A0]) initWithGEOStyleAttributes:v6];
    long long v17 = +[MKIconManager imageForStyle:v16 size:4 forScale:0 format:v15 nightMode:v13];
    long long v18 = v17;
    if (v17)
    {
      id v8 = v17;
    }
    else if (v7)
    {
      long long v19 = [MEMORY[0x1E4FB3A20] sharedManager];
      uint64_t v20 = [(id)v7 shieldType];
      id v21 = [(id)v7 shieldText];
      *(float *)&double v22 = v13;
      uint64_t v23 = [v19 imageForDataID:v20 text:v21 contentScale:4 sizeGroup:0 modifiers:v22];

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(v23, "image"), 0, v13);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

id DetailTextsForAdvisoryItem(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [v1 details];
  id v3 = (void *)[v2 count];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v1;
    uint64_t v5 = [v1 details];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v11 = [v10 titleString];
          double v12 = [v11 stringWithDefaultOptions];

          if (v12) {
            [v4 addObject:v12];
          }
          id v13 = v10;
          double v14 = [v13 detailStrings];
          uint64_t v15 = [v14 count];

          if (v15)
          {
            long long v16 = [v13 detailStrings];
            long long v17 = objc_msgSend(v16, "_geo_map:", &__block_literal_global_7);

            long long v18 = [v17 componentsJoinedByString:@"\n"];

            if (v18) {
              [v4 addObject:v18];
            }
          }
          else
          {

            long long v18 = 0;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    id v3 = (void *)[v4 copy];
    id v1 = v20;
  }

  return v3;
}

uint64_t __DetailTextsForAdvisoryItem_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringWithDefaultOptions];
}

void sub_18BB612C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id _MKBestWalletHeroPhotoForGEOMapItem(void *a1)
{
  id v1 = a1;
  id v2 = [v1 businessAssets];
  id v3 = [v2 coverPhoto];

  if (v3 && (_isValidWalletHeroImage(v3) & 1) != 0) {
    goto LABEL_6;
  }
  id v4 = [v1 _photos];
  uint64_t v5 = [v4 firstObject];

  if (v5 && _isValidWalletHeroImage(v5))
  {
    id v3 = v5;
LABEL_6:
    id v6 = v3;
    uint64_t v5 = v6;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

uint64_t _isValidWalletHeroImage(void *a1)
{
  id v1 = a1;
  int BOOL = GEOConfigGetBOOL();
  int v3 = GEOConfigGetBOOL();
  int v4 = v3;
  if (BOOL)
  {
    uint64_t v5 = [v1 highQuality];
    if ((v5 & v4 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v3)
  {
    uint64_t v5 = 1;
    goto LABEL_7;
  }
  uint64_t v5 = [v1 businessProvided];
LABEL_7:

  return v5;
}

uint64_t defaultGenerator_block_invoke()
{
  return 0;
}

void sub_18BB623B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id MKGetMKPlaceInlineMapVCLog()
{
  if (qword_1EB315A88 != -1) {
    dispatch_once(&qword_1EB315A88, &__block_literal_global_260);
  }
  float v0 = (void *)_MergedGlobals_3;

  return v0;
}

void sub_18BB6434C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __MKGetMKPlaceInlineMapVCLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKPlaceInlineMapVC");
  uint64_t v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;
}

void sub_18BB69E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetMKCoreLocationProviderLog()
{
  if (qword_1EB315CA0 != -1) {
    dispatch_once(&qword_1EB315CA0, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)_MergedGlobals_132;

  return v0;
}

id MKGetVehicleSensorLog()
{
  if (qword_1EB315CB0 != -1) {
    dispatch_once(&qword_1EB315CB0, &__block_literal_global_264);
  }
  os_log_t v0 = (void *)qword_1EB315CA8;

  return v0;
}

void sub_18BB6B210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6B368(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18BB6B4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6B64C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18BB6B838(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB6B968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BB78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BDA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB6BF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MKGetMKCoreLocationProviderLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKCoreLocationProvider");
  uint64_t v1 = (void *)_MergedGlobals_132;
  _MergedGlobals_132 = (uint64_t)v0;
}

void __MKGetVehicleSensorLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "VehicleSensor");
  uint64_t v1 = (void *)qword_1EB315CA8;
  qword_1EB315CA8 = (uint64_t)v0;
}

void sub_18BB6DBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BB6DE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetVehicleSensorLog_0()
{
  if (qword_1EB315CE0 != -1) {
    dispatch_once(&qword_1EB315CE0, &__block_literal_global_500);
  }
  os_log_t v0 = (void *)qword_1EB315CD8;

  return v0;
}

void __MKGetVehicleSensorLog_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "VehicleSensor");
  uint64_t v1 = (void *)qword_1EB315CD8;
  qword_1EB315CD8 = (uint64_t)v0;
}

id _transformAnim(long long *a1, long long *a2)
{
  int v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  long long v5 = a1[5];
  long long v20 = a1[4];
  long long v21 = v5;
  long long v6 = a1[7];
  long long v22 = a1[6];
  long long v23 = v6;
  long long v7 = a1[1];
  long long v16 = *a1;
  long long v17 = v7;
  long long v8 = a1[3];
  long long v18 = a1[2];
  long long v19 = v8;
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  [v4 setFromValue:v9];

  long long v10 = a2[5];
  long long v20 = a2[4];
  long long v21 = v10;
  long long v11 = a2[7];
  long long v22 = a2[6];
  long long v23 = v11;
  long long v12 = a2[1];
  long long v16 = *a2;
  long long v17 = v12;
  long long v13 = a2[3];
  long long v18 = a2[2];
  long long v19 = v13;
  double v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  [v4 setToValue:v14];

  return v4;
}

id _positionAnim(double a1, double a2, double a3, double a4)
{
  long long v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "_mapkit_valueWithCGPoint:", a1, a2);
  [v8 setFromValue:v9];

  long long v10 = objc_msgSend(MEMORY[0x1E4F29238], "_mapkit_valueWithCGPoint:", a3, a4);
  [v8 setToValue:v10];

  return v8;
}

void sub_18BB74290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void __MKGetMKRemoteUILog_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKRemoteUI");
  uint64_t v1 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = (uint64_t)v0;
}

void MKMapsSuggestionsLogPredictedTransportMode(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  GEOFindOrCreateLog();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  long long v10 = v9;
  if (a1 == a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      long long v11 = @"AUTOMOBILE";
      long long v12 = @"AUTOMOBILE";
      switch(@"AUTOMOBILE")
      {
        case 0u:
          break;
        case 1u:
          long long v11 = @"TRANSIT";
          goto LABEL_19;
        case 2u:
          long long v11 = @"WALKING";
          goto LABEL_19;
        case 3u:
          long long v11 = @"BICYCLE";
          goto LABEL_19;
        case 4u:
          long long v11 = @"UNKNOWN_TRANSPORT_TYPE";
          goto LABEL_19;
        case 5u:
          long long v11 = @"FERRY";
          goto LABEL_19;
        case 6u:
          long long v11 = @"RIDESHARE";
LABEL_19:
          long long v12 = v11;
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", @"AUTOMOBILE");
          long long v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", @"AUTOMOBILE");
          long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      *(_DWORD *)buf = 138413058;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      long long v21 = v11;
      __int16 v22 = 2112;
      long long v23 = v12;
      _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "PTM in %@, %@, Predicted: %@, Actual: %@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    if (a1 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v13 = off_1E54B9468[(int)a1];
    }
    double v14 = v13;
    if (a2 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = off_1E54B9468[(int)a2];
    }
    *(_DWORD *)buf = 138413058;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    long long v21 = v14;
    __int16 v22 = 2112;
    long long v23 = v15;
    _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_ERROR, "PTM difference in %@, %@, Predicted: %@, Actual: %@", buf, 0x2Au);
  }
}

void __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("MapsSuggestionsTransportModePredictionQueue", v2);
  uint64_t v1 = (void *)MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue;
  MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue = (uint64_t)v0;
}

void __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_3;
  v13[3] = &unk_1E54B9420;
  id v14 = v6;
  id v15 = v5;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = v8;
  uint64_t v17 = v9;
  id v10 = v5;
  id v11 = v6;
  long long v12 = v7;
  dispatch_async(v12, v13);
}

uint64_t __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) count])
  {
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = *(void **)(a1 + 32);
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_ERROR, "Could not predict transport mode. Error: %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_4;
  }
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
      int v12 = 138412290;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_ERROR, "Unexpected class type for predicted transport mode. Error: %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_4:

    int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
  id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 intValue];

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 4)
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "Could not set predicted transport mode.", (uint8_t *)&v12, 2u);
    }
  }
  int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void MKMapsSuggestionsTransportModeForOriginAndDestination(void *a1, CLLocationDegrees a2, CLLocationDegrees a3, CLLocationDegrees a4, CLLocationDegrees a5)
{
  id v9 = a1;
  if (!v9)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_ERROR, "Need a non-nil handler", (uint8_t *)v20, 2u);
    }
    goto LABEL_27;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    id v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    LOWORD(v20[0]) = 0;
    uint64_t v17 = "MapsSuggestions Feeler Pipeline is disabled";
LABEL_18:
    _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)v20, 2u);
    goto LABEL_19;
  }
  v25.CLLocationDegrees latitude = a4;
  v25.double longitude = a5;
  if (!CLLocationCoordinate2DIsValid(v25))
  {
    id v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    LOWORD(v20[0]) = 0;
    uint64_t v17 = "Need a valid destination coordinate";
    goto LABEL_18;
  }
  v26.CLLocationDegrees latitude = a2;
  v26.double longitude = a3;
  if (CLLocationCoordinate2DIsValid(v26))
  {
    id v10 = [objc_alloc(MEMORY[0x1E4F64828]) initWithLatitude:a4 longitude:a5];
    id v11 = [MEMORY[0x1E4F646E0] mapItemStorageForPlace:v10];
    id v12 = v9;
    if (GEOConfigGetBOOL())
    {
      if (v11)
      {
        v23[0] = 0;
        v23[1] = v23;
        v23[2] = 0x2020000000;
        int v24 = 4;
        if (MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_onceToken != -1) {
          dispatch_once(&MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_onceToken, &__block_literal_global_16);
        }
        id v13 = +[MKMapsSuggestionsPredictor sharedPredictor];
        uint64_t v14 = [v11 data];
        id v15 = NSDataFromCLLocationCoordinates(a2, a3);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_2;
        v20[3] = &unk_1E54B9448;
        id v21 = v12;
        __int16 v22 = v23;
        [v13 transportModeForDestinationMapItemData:v14 originCoordinateData:v15 handler:v20];

        _Block_object_dispose(v23, 8);
        goto LABEL_26;
      }
      __int16 v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        id v19 = "Need a non-nil MapItem for the destination";
        goto LABEL_24;
      }
    }
    else
    {
      __int16 v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        id v19 = "MapsSuggestions Feeler Pipeline is disabled";
LABEL_24:
        _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)v20, 2u);
      }
    }

    (*((void (**)(id, uint64_t))v12 + 2))(v12, 4);
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20[0]) = 0;
    uint64_t v17 = "Need a valid origin coordinate";
    goto LABEL_18;
  }
LABEL_19:

  (*((void (**)(id, uint64_t))v9 + 2))(v9, 4);
LABEL_28:
}

void sub_18BB7635C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB7D24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB7D3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB7D978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB7DAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB7DC50(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_18BB7DD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BB7DF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18BB7EDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

CGPathRef _createClipPath(MKMapPoint *a1, unint64_t a2, CGFloat a3, CGLineCap a4, CGLineJoin a5, CGFloat a6, MKMapPoint a7, double a8, double a9, double a10, double a11)
{
  double y = a7.y;
  double x = a7.x;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, &a1->x, a2, x, y, a8, a9, a10, a11);
  if (a9 <= 0.0) {
    CGLineCap v24 = a4;
  }
  else {
    CGLineCap v24 = kCGLineCapButt;
  }
  if (a10 >= 1.0) {
    CGLineCap v25 = a4;
  }
  else {
    CGLineCap v25 = kCGLineCapButt;
  }
  CGPathRef CopyByStrokingPath = _MKCGPathCreateCopyByStrokingPath(Mutable, v24, v25, a5, a3, a6);
  CGPathRelease(Mutable);
  return CopyByStrokingPath;
}

CGPathRef _createDashedClipPath(double *a1, unint64_t a2, CGLineCap a3, CGLineJoin a4, void *a5, CGFloat a6, CGFloat a7, double a8, double a9, double a10, CGFloat a11, double a12)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v37 = a5;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, a1, a2, a8, a9, a10, 0.0, 1.0, -1.0);
  size_t v24 = [v37 count];
  CGLineCap v25 = (CGFloat *)malloc_type_malloc(8 * v24, 0x100004000313F17uLL);
  CGLineCap lineCap = a3;
  CGLineJoin v26 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = v37;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v28)
  {
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v31) cgFloatValue];
        v25[v29 + v31++] = v32 / a10 * a12;
      }
      while (v28 != v31);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
      v29 += v31;
    }
    while (v28);
  }

  CopyByDashingPath = CGPathCreateCopyByDashingPath(Mutable, 0, a11, v25, v24);
  CGPathRef CopyByStrokingPath = CGPathCreateCopyByStrokingPath(CopyByDashingPath, 0, a6, lineCap, v26, a7);
  CGPathRelease(CopyByDashingPath);
  CGPathRelease(Mutable);
  free(v25);

  return CopyByStrokingPath;
}

void sub_18BB7F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _nextSimplifiedPointIndex(MKMapPoint *a1, unint64_t a2, uint64_t a3, double a4, MKMapPoint a5, double *a6)
{
  uint64_t result = a3 + 1;
  if (a3 + 1 >= a2) {
    return a2 - 1;
  }
  double v8 = 5.0 / a4 * (5.0 / a4);
  id v9 = &a1[a3];
  double x = v9->x;
  double y = v9->y;
  double v12 = v9->x - a5.x;
  double v13 = y - a5.y;
  p_double y = &v9[1].y;
  BOOL v15 = 1;
  double v16 = 0.0;
  while (1)
  {
    double v17 = x;
    double v18 = y;
    double x = *(p_y - 1);
    double y = *p_y;
    double v16 = v16 + sqrt((x - v17) * (x - v17) + 0.0 + (*p_y - v18) * (*p_y - v18));
    if ((x - a5.x - v12) * (x - a5.x - v12) + (*p_y - a5.y - v13) * (*p_y - a5.y - v13) >= v8) {
      break;
    }
    BOOL v15 = ++result < a2;
    p_y += 2;
    if (a2 == result) {
      return a2 - 1;
    }
  }
  if (a6)
  {
    *a6 = v16;
    if (v15) {
      return result;
    }
    return a2 - 1;
  }
  if (!v15) {
    return a2 - 1;
  }
  return result;
}

void _addMiterJoin(CGPath *a1, int a2, double a3, double a4, long double a5, long double a6, long double a7, long double a8, double a9)
{
  double v18 = atan2(a8, a7);
  double v19 = v18 - atan2(a6, a5);
  if (v19 <= 3.14159265)
  {
    if (v19 >= -3.14159265) {
      goto LABEL_6;
    }
    double v20 = 6.28318531;
  }
  else
  {
    double v20 = -6.28318531;
  }
  double v19 = v19 + v20;
LABEL_6:
  double v21 = 1.0 / sqrt((a5 + a7) * (a5 + a7) + 0.0 + (a6 + a8) * (a6 + a8));
  long double v22 = (a5 + a7) * v21;
  long double v23 = -((a6 + a8) * v21);
  long double v24 = 1.0 / cos(v19 * 0.5);
  double v25 = v23 * v24;
  double v26 = v22 * v24;
  if (a2)
  {
    CGPathMoveToPoint(a1, 0, a3 - v25 * a9, a4 - v26 * a9);
    double v27 = a3 + v25 * a9;
  }
  else
  {
    CGPathAddLineToPoint(a1, 0, a3 + v25 * a9, a4 + v26 * a9);
    double v27 = a3 - v25 * a9;
    double v26 = -v26;
  }

  CGPathAddLineToPoint(a1, 0, v27, a4 + v26 * a9);
}

void sub_18BB8429C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void _performBlockOnMainThreadIfNeeded(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

id MKKeyForTransitArtwork(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, double a6, double a7)
{
  id v10 = a1;
  int v11 = [v10 artworkSourceType];
  double v12 = [v10 shieldDataSource];
  double v13 = [v12 shieldText];
  uint64_t v14 = [v12 shieldColorString];
  uint64_t v15 = [v12 shieldType];
  double v16 = [v10 iconDataSource];

  if (objc_opt_respondsToSelector()) {
    uint64_t v17 = [v16 cartoID];
  }
  else {
    uint64_t v17 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = [v16 defaultTransitType];
  }
  else {
    uint64_t v18 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v19 = [v16 iconAttributeKey];
  }
  else {
    uint64_t v19 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v20 = [v16 iconAttributeValue];
  }
  else {
    uint64_t v20 = 0;
  }
  double v21 = [NSString stringWithFormat:@"source:%ld_text:%@_color:%@_shield:%ld_id:%ld_transit:%ld_size:%ld_feature:%ld_padding:%.2f_iconKey:%ld_iconValue:%ld_flipped:%d_nightMode:%d_scale:%.2f", v11, v13, v14, v15, v17, v18, a2, a3, *(void *)&a6, v19, v20, a4, a5, *(void *)&a7];

  return v21;
}

void PlaceCardLayoutChanged(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PlaceCardLayoutChanged_block_invoke;
  block[3] = &unk_1E54B8188;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __PlaceCardLayoutChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewControllers];
}

BOOL ImageForShieldDataSourceTypeShouldBeFlipped(uint64_t a1)
{
  if (qword_1EB315D40 != -1) {
    dispatch_once(&qword_1EB315D40, &__block_literal_global_26);
  }
  id v2 = (void *)_MergedGlobals_138;
  id v3 = [NSNumber numberWithLongLong:a1];
  LODWORD(v2) = [v2 containsObject:v3];

  return v2 && (MKApplicationLayoutDirectionIsRightToLeft() & 1) != 0;
}

void __ImageForShieldDataSourceTypeShouldBeFlipped_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1ED97E238, &unk_1ED97E250, &unk_1ED97E268, &unk_1ED97E280, &unk_1ED97E298, &unk_1ED97E2B0, &unk_1ED97E2C8, &unk_1ED97E2E0, &unk_1ED97E2F8, 0);
  uint64_t v1 = (void *)_MergedGlobals_138;
  _MergedGlobals_138 = v0;
}

void checkLevel(unint64_t a1)
{
  if (a1 >= 2)
  {
    id v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    objc_msgSend(NSString, "stringWithFormat:", @"%ld is not a valid MKOverlayLevel", a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    int v4 = [v2 exceptionWithName:v3 reason:v5 userInfo:0];
    [v4 raise];
  }
}

void sub_18BB97B74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BB97CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BB97DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB97ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB97FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB980E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB981F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB9831C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BB983AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BB98508(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BB98A24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
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
        id v9 = [MKMapItemIdentifier alloc];
        id v10 = -[MKMapItemIdentifier initWithGEOMapItemIdentifier:](v9, "initWithGEOMapItemIdentifier:", v8, (void)v12);
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

id MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
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
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "geoMapItemIdentifier", (void)v10);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

MKMapItemIdentifier *MKMapItemIdentifierFromGEOTransitLine(void *a1)
{
  id v1 = a1;
  id v2 = [MKMapItemIdentifier alloc];
  id v3 = [v1 identifier];

  uint64_t v4 = [(MKMapItemIdentifier *)v2 initWithGEOMapItemIdentifier:v3];

  return v4;
}

MKMapItemIdentifier *MKMapItemIdentifierFromGEOPBTransitLine(void *a1)
{
  id v1 = a1;
  id v2 = [MKMapItemIdentifier alloc];
  uint64_t v3 = [v1 muid];

  uint64_t v4 = [(MKMapItemIdentifier *)v2 initWithMUID:v3];

  return v4;
}

void sub_18BB9A1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB9A448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGPath *CreatePathForPolygon(void *a1, double a2, double a3)
{
  id v5 = a1;
  unint64_t v6 = [v5 pointCount];
  id v7 = v5;
  uint64_t v8 = [v7 points];
  if (v6 >= 3)
  {
    long long v10 = (double *)v8;
    Mutable = CGPathCreateMutable();
    double v12 = *v10;
    double v13 = v10[1];
    long long v11 = v10 + 3;
    CGPathMoveToPoint(Mutable, 0, v12 - a2, v13 - a3);
    unint64_t v14 = v6 - 1;
    do
    {
      CGPathAddLineToPoint(Mutable, 0, *(v11 - 1) - a2, *v11 - a3);
      v11 += 2;
      --v14;
    }
    while (v14);
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void sub_18BB9D038(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BB9D710(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18BB9D9F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BB9DB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BB9E040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_18BB9E2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _MKCartographicConfigurationDecodeWithCoder(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 48) = 0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  id v5 = a2;
  id v6 = a1;
  id v7 = [v5 stringByAppendingString:@"MKCartographicConfigurationStyle"];
  *(void *)a3 = [v6 decodeIntegerForKey:v7];

  uint64_t v8 = [v5 stringByAppendingString:@"MKCartographicConfigurationEmphasis"];
  *(void *)(a3 + 8) = [v6 decodeIntegerForKey:v8];

  id v9 = [v5 stringByAppendingString:@"MKCartographicConfigurationProjection"];
  *(void *)(a3 + 16) = [v6 decodeIntegerForKey:v9];

  long long v10 = [v5 stringByAppendingString:@"MKCartographicConfigurationTerrainMode"];
  *(void *)(a3 + 24) = [v6 decodeIntegerForKey:v10];

  long long v11 = [v5 stringByAppendingString:@"MKCartographicConfigurationMapKitUsage"];
  *(void *)(a3 + 32) = [v6 decodeIntegerForKey:v11];

  double v12 = [v5 stringByAppendingString:@"MKCartographicConfigurationMapKitClientMode"];
  *(void *)(a3 + 40) = [v6 decodeIntegerForKey:v12];

  id v13 = [v5 stringByAppendingString:@"MKCartographicConfigurationGridOnly"];

  LOBYTE(v5) = [v6 decodeBoolForKey:v13];
  *(unsigned char *)(a3 + 48) = (_BYTE)v5;
}

void _MKCartographicConfigurationEncodeWithCoder(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5 = *a1;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v6 stringByAppendingString:@"MKCartographicConfigurationStyle"];
  [v7 encodeInteger:v5 forKey:v8];

  uint64_t v9 = a1[1];
  long long v10 = [v6 stringByAppendingString:@"MKCartographicConfigurationEmphasis"];
  [v7 encodeInteger:v9 forKey:v10];

  uint64_t v11 = a1[2];
  double v12 = [v6 stringByAppendingString:@"MKCartographicConfigurationProjection"];
  [v7 encodeInteger:v11 forKey:v12];

  uint64_t v13 = a1[3];
  unint64_t v14 = [v6 stringByAppendingString:@"MKCartographicConfigurationTerrainMode"];
  [v7 encodeInteger:v13 forKey:v14];

  uint64_t v15 = a1[4];
  double v16 = [v6 stringByAppendingString:@"MKCartographicConfigurationMapKitUsage"];
  [v7 encodeInteger:v15 forKey:v16];

  uint64_t v17 = a1[5];
  uint64_t v18 = [v6 stringByAppendingString:@"MKCartographicConfigurationMapKitClientMode"];
  [v7 encodeInteger:v17 forKey:v18];

  uint64_t v19 = *((unsigned __int8 *)a1 + 48);
  id v20 = [v6 stringByAppendingString:@"MKCartographicConfigurationGridOnly"];

  [v7 encodeBool:v19 forKey:v20];
}

void sub_18BBA2090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  objc_destroyWeak(v56);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v57 - 216), 8);
  objc_destroyWeak((id *)(v57 - 112));
  _Unwind_Resume(a1);
}

void sub_18BBA2B18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_18BBA3144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BBA37F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_18BBA40E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_18BBA4A98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id GEOPOICategoriesForPointOfInterestCategories(void *a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 count])
    {
      uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      int64_t v91 = v2;
      id v4 = v2;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v92 objects:v96 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        id v7 = (id *)MEMORY[0x1E4F63F38];
        uint64_t v8 = (id *)MEMORY[0x1E4F63F50];
        uint64_t v9 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v93 != v9) {
              objc_enumerationMutation(v4);
            }
            id v11 = *(id *)(*((void *)&v92 + 1) + 8 * i);
            double v12 = v11;
            if (!v11) {
              goto LABEL_86;
            }
            char v13 = [v11 isEqual:@"MKPOICategoryAirport"];
            unint64_t v14 = v7;
            if (v13) {
              goto LABEL_84;
            }
            char v15 = [v12 isEqual:@"MKPOICategoryAmusementPark"];
            unint64_t v14 = v8;
            if (v15) {
              goto LABEL_84;
            }
            char v16 = [v12 isEqual:@"MKPOICategoryAnimalService"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F58];
            if (v16) {
              goto LABEL_84;
            }
            char v17 = [v12 isEqual:@"MKPOICategoryAquarium"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F60];
            if (v17) {
              goto LABEL_84;
            }
            char v18 = [v12 isEqual:@"MKPOICategoryATM"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F30];
            if (v18) {
              goto LABEL_84;
            }
            char v19 = [v12 isEqual:@"MKPOICategoryAutomotiveRepair"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F68];
            if (v19) {
              goto LABEL_84;
            }
            char v20 = [v12 isEqual:@"MKPOICategoryBakery"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F70];
            if (v20) {
              goto LABEL_84;
            }
            char v21 = [v12 isEqual:@"MKPOICategoryBank"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F78];
            if (v21) {
              goto LABEL_84;
            }
            char v22 = [v12 isEqual:@"MKPOICategoryBaseball"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F80];
            if (v22) {
              goto LABEL_84;
            }
            char v23 = [v12 isEqual:@"MKPOICategoryBasketball"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F88];
            if (v23) {
              goto LABEL_84;
            }
            char v24 = [v12 isEqual:@"MKPOICategoryBeach"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F90];
            if (v24) {
              goto LABEL_84;
            }
            char v25 = [v12 isEqual:@"MKPOICategoryBeauty"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63F98];
            if (v25) {
              goto LABEL_84;
            }
            char v26 = [v12 isEqual:@"MKPOICategoryBowling"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FA0];
            if (v26) {
              goto LABEL_84;
            }
            char v27 = [v12 isEqual:@"MKPOICategoryBrewery"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FA8];
            if (v27) {
              goto LABEL_84;
            }
            char v28 = [v12 isEqual:@"MKPOICategoryCafe"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FB0];
            if (v28) {
              goto LABEL_84;
            }
            char v29 = [v12 isEqual:@"MKPOICategoryCampground"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FB8];
            if (v29) {
              goto LABEL_84;
            }
            char v30 = [v12 isEqual:@"MKPOICategoryCarRental"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FC0];
            if (v30) {
              goto LABEL_84;
            }
            char v31 = [v12 isEqual:@"MKPOICategoryCastle"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FC8];
            if (v31) {
              goto LABEL_84;
            }
            char v32 = [v12 isEqual:@"MKPOICategoryConventionCenter"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FD0];
            if (v32) {
              goto LABEL_84;
            }
            char v33 = [v12 isEqual:@"MKPOICategoryDistillery"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FD8];
            if (v33) {
              goto LABEL_84;
            }
            char v34 = [v12 isEqual:@"MKPOICategoryEVCharger"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FE0];
            if (v34) {
              goto LABEL_84;
            }
            char v35 = [v12 isEqual:@"MKPOICategoryFairground"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FE8];
            if (v35) {
              goto LABEL_84;
            }
            char v36 = [v12 isEqual:@"MKPOICategoryFireStation"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FF0];
            if (v36) {
              goto LABEL_84;
            }
            char v37 = [v12 isEqual:@"MKPOICategoryFishing"];
            unint64_t v14 = (id *)MEMORY[0x1E4F63FF8];
            if (v37) {
              goto LABEL_84;
            }
            char v38 = [v12 isEqual:@"MKPOICategoryFitnessCenter"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64000];
            if (v38) {
              goto LABEL_84;
            }
            char v39 = [v12 isEqual:@"MKPOICategoryFoodMarket"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64008];
            if (v39) {
              goto LABEL_84;
            }
            char v40 = [v12 isEqual:@"MKPOICategoryFortress"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64010];
            if (v40) {
              goto LABEL_84;
            }
            char v41 = [v12 isEqual:@"MKPOICategoryGasStation"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64018];
            if (v41) {
              goto LABEL_84;
            }
            char v42 = [v12 isEqual:@"MKPOICategoryGolf"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64028];
            if (v42) {
              goto LABEL_84;
            }
            char v43 = [v12 isEqual:@"MKPOICategoryGoKart"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64020];
            if (v43) {
              goto LABEL_84;
            }
            char v44 = [v12 isEqual:@"MKPOICategoryHiking"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64030];
            if (v44) {
              goto LABEL_84;
            }
            char v45 = [v12 isEqual:@"MKPOICategoryHospital"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64038];
            if (v45) {
              goto LABEL_84;
            }
            char v46 = [v12 isEqual:@"MKPOICategoryHotel"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64040];
            if (v46) {
              goto LABEL_84;
            }
            char v47 = [v12 isEqual:@"MKPOICategoryKayaking"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64048];
            if (v47) {
              goto LABEL_84;
            }
            char v48 = [v12 isEqual:@"MKPOICategoryLandmark"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64050];
            if (v48) {
              goto LABEL_84;
            }
            char v49 = [v12 isEqual:@"MKPOICategoryLaundry"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64058];
            if (v49) {
              goto LABEL_84;
            }
            char v50 = [v12 isEqual:@"MKPOICategoryLibrary"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64060];
            if (v50) {
              goto LABEL_84;
            }
            char v51 = [v12 isEqual:@"MKPOICategoryMailbox"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64068];
            if (v51) {
              goto LABEL_84;
            }
            char v52 = [v12 isEqual:@"MKPOICategoryMarina"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64070];
            if (v52) {
              goto LABEL_84;
            }
            char v53 = [v12 isEqual:@"MKPOICategoryMiniGolf"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64078];
            if (v53) {
              goto LABEL_84;
            }
            char v54 = [v12 isEqual:@"MKPOICategoryMovieTheater"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64080];
            if (v54) {
              goto LABEL_84;
            }
            char v55 = [v12 isEqual:@"MKPOICategoryMuseum"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64088];
            if (v55) {
              goto LABEL_84;
            }
            char v56 = [v12 isEqual:@"MKPOICategoryMusicVenue"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64090];
            if (v56) {
              goto LABEL_84;
            }
            char v57 = [v12 isEqual:@"MKPOICategoryNationalMonument"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64098];
            if (v57) {
              goto LABEL_84;
            }
            char v58 = [v12 isEqual:@"MKPOICategoryNationalPark"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640A0];
            if (v58) {
              goto LABEL_84;
            }
            char v59 = [v12 isEqual:@"MKPOICategoryNightlife"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640A8];
            if (v59) {
              goto LABEL_84;
            }
            char v60 = [v12 isEqual:@"MKPOICategoryPark"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640B0];
            if (v60) {
              goto LABEL_84;
            }
            char v61 = [v12 isEqual:@"MKPOICategoryParking"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640B8];
            if (v61) {
              goto LABEL_84;
            }
            char v62 = [v12 isEqual:@"MKPOICategoryPharmacy"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640C0];
            if (v62) {
              goto LABEL_84;
            }
            char v63 = [v12 isEqual:@"MKPOICategoryPlanetarium"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640C8];
            if (v63) {
              goto LABEL_84;
            }
            char v64 = [v12 isEqual:@"MKPOICategoryPlayground"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640D0];
            if (v64) {
              goto LABEL_84;
            }
            char v65 = [v12 isEqual:@"MKPOICategoryPolice"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640D8];
            if (v65) {
              goto LABEL_84;
            }
            char v66 = [v12 isEqual:@"MKPOICategoryPostOffice"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640E0];
            if (v66) {
              goto LABEL_84;
            }
            char v67 = [v12 isEqual:@"MKPOICategoryPublicTransport"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640E8];
            if (v67) {
              goto LABEL_84;
            }
            char v68 = [v12 isEqual:@"MKPOICategoryReligiousSite"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640F8];
            if (v68) {
              goto LABEL_84;
            }
            char v69 = [v12 isEqual:@"MKPOICategoryRestaurant"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64100];
            if (v69) {
              goto LABEL_84;
            }
            char v70 = [v12 isEqual:@"MKPOICategoryRestroom"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64108];
            if (v70) {
              goto LABEL_84;
            }
            char v71 = [v12 isEqual:@"MKPOICategoryRockClimbing"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64110];
            if (v71) {
              goto LABEL_84;
            }
            char v72 = [v12 isEqual:@"MKPOICategoryRVPark"];
            unint64_t v14 = (id *)MEMORY[0x1E4F640F0];
            if (v72) {
              goto LABEL_84;
            }
            char v73 = [v12 isEqual:@"MKPOICategorySchool"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64118];
            if (v73) {
              goto LABEL_84;
            }
            char v74 = [v12 isEqual:@"MKPOICategorySkatePark"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64120];
            if (v74) {
              goto LABEL_84;
            }
            char v75 = [v12 isEqual:@"MKPOICategorySkating"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64128];
            if (v75) {
              goto LABEL_84;
            }
            char v76 = [v12 isEqual:@"MKPOICategorySkiing"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64130];
            if (v76) {
              goto LABEL_84;
            }
            char v77 = [v12 isEqual:@"MKPOICategorySoccer"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64138];
            if (v77) {
              goto LABEL_84;
            }
            char v78 = [v12 isEqual:@"MKPOICategorySpa"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64140];
            if (v78) {
              goto LABEL_84;
            }
            char v79 = [v12 isEqual:@"MKPOICategoryStadium"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64148];
            if (v79) {
              goto LABEL_84;
            }
            char v80 = [v12 isEqual:@"MKPOICategoryStore"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64150];
            if (v80) {
              goto LABEL_84;
            }
            char v81 = [v12 isEqual:@"MKPOICategorySurfing"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64158];
            if (v81) {
              goto LABEL_84;
            }
            char v82 = [v12 isEqual:@"MKPOICategorySwimming"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64160];
            if (v82) {
              goto LABEL_84;
            }
            char v83 = [v12 isEqual:@"MKPOICategoryTennis"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64168];
            if (v83) {
              goto LABEL_84;
            }
            char v84 = [v12 isEqual:@"MKPOICategoryTheater"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64170];
            if (v84) {
              goto LABEL_84;
            }
            char v85 = [v12 isEqual:@"MKPOICategoryUniversity"];
            unint64_t v14 = (id *)MEMORY[0x1E4F64178];
            if ((v85 & 1) != 0
              || (char v86 = [v12 isEqual:@"MKPOICategoryVolleyball"],
                  unint64_t v14 = (id *)MEMORY[0x1E4F64180],
                  (v86 & 1) != 0)
              || (char v87 = [v12 isEqual:@"MKPOICategoryWinery"],
                  unint64_t v14 = (id *)MEMORY[0x1E4F64188],
                  (v87 & 1) != 0)
              || (char v88 = [v12 isEqual:@"MKPOICategoryZoo"],
                  unint64_t v14 = (id *)MEMORY[0x1E4F64190],
                  (v88 & 1) != 0))
            {
LABEL_84:
              id v89 = *v14;

              if (v89) {
                [v3 addObject:v89];
              }
            }
            else
            {
LABEL_86:

              id v89 = 0;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v92 objects:v96 count:16];
        }
        while (v6);
      }

      uint64_t v2 = v91;
    }
    else
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

__CFString *MKPointOfInterestCategoryForGEOPOICategory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 isEqual:*MEMORY[0x1E4F63F38]])
    {
      uint64_t v3 = @"MKPOICategoryAirport";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F50]])
    {
      uint64_t v3 = @"MKPOICategoryAmusementPark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F58]])
    {
      uint64_t v3 = @"MKPOICategoryAnimalService";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F60]])
    {
      uint64_t v3 = @"MKPOICategoryAquarium";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F30]])
    {
      uint64_t v3 = @"MKPOICategoryATM";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F68]])
    {
      uint64_t v3 = @"MKPOICategoryAutomotiveRepair";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F70]])
    {
      uint64_t v3 = @"MKPOICategoryBakery";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F78]])
    {
      uint64_t v3 = @"MKPOICategoryBank";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F80]])
    {
      uint64_t v3 = @"MKPOICategoryBaseball";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F88]])
    {
      uint64_t v3 = @"MKPOICategoryBasketball";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F90]])
    {
      uint64_t v3 = @"MKPOICategoryBeach";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63F98]])
    {
      uint64_t v3 = @"MKPOICategoryBeauty";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FA0]])
    {
      uint64_t v3 = @"MKPOICategoryBowling";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FA8]])
    {
      uint64_t v3 = @"MKPOICategoryBrewery";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FB0]])
    {
      uint64_t v3 = @"MKPOICategoryCafe";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FB8]])
    {
      uint64_t v3 = @"MKPOICategoryCampground";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FC0]])
    {
      uint64_t v3 = @"MKPOICategoryCarRental";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FC8]])
    {
      uint64_t v3 = @"MKPOICategoryCastle";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FD0]])
    {
      uint64_t v3 = @"MKPOICategoryConventionCenter";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FD8]])
    {
      uint64_t v3 = @"MKPOICategoryDistillery";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FE0]])
    {
      uint64_t v3 = @"MKPOICategoryEVCharger";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FE8]])
    {
      uint64_t v3 = @"MKPOICategoryFairground";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FF0]])
    {
      uint64_t v3 = @"MKPOICategoryFireStation";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F63FF8]])
    {
      uint64_t v3 = @"MKPOICategoryFishing";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64000]])
    {
      uint64_t v3 = @"MKPOICategoryFitnessCenter";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64008]])
    {
      uint64_t v3 = @"MKPOICategoryFoodMarket";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64010]])
    {
      uint64_t v3 = @"MKPOICategoryFortress";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64018]])
    {
      uint64_t v3 = @"MKPOICategoryGasStation";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64028]])
    {
      uint64_t v3 = @"MKPOICategoryGolf";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64020]])
    {
      uint64_t v3 = @"MKPOICategoryGoKart";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64030]])
    {
      uint64_t v3 = @"MKPOICategoryHiking";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64038]])
    {
      uint64_t v3 = @"MKPOICategoryHospital";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64040]])
    {
      uint64_t v3 = @"MKPOICategoryHotel";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64048]])
    {
      uint64_t v3 = @"MKPOICategoryKayaking";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64050]])
    {
      uint64_t v3 = @"MKPOICategoryLandmark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64058]])
    {
      uint64_t v3 = @"MKPOICategoryLaundry";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64060]])
    {
      uint64_t v3 = @"MKPOICategoryLibrary";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64068]])
    {
      uint64_t v3 = @"MKPOICategoryMailbox";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64070]])
    {
      uint64_t v3 = @"MKPOICategoryMarina";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64078]])
    {
      uint64_t v3 = @"MKPOICategoryMiniGolf";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64080]])
    {
      uint64_t v3 = @"MKPOICategoryMovieTheater";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64088]])
    {
      uint64_t v3 = @"MKPOICategoryMuseum";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64090]])
    {
      uint64_t v3 = @"MKPOICategoryMusicVenue";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64098]])
    {
      uint64_t v3 = @"MKPOICategoryNationalMonument";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640A0]])
    {
      uint64_t v3 = @"MKPOICategoryNationalPark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640A8]])
    {
      uint64_t v3 = @"MKPOICategoryNightlife";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640B0]])
    {
      uint64_t v3 = @"MKPOICategoryPark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640B8]])
    {
      uint64_t v3 = @"MKPOICategoryParking";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640C0]])
    {
      uint64_t v3 = @"MKPOICategoryPharmacy";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640C8]])
    {
      uint64_t v3 = @"MKPOICategoryPlanetarium";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640D0]])
    {
      uint64_t v3 = @"MKPOICategoryPlayground";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640D8]])
    {
      uint64_t v3 = @"MKPOICategoryPolice";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640E0]])
    {
      uint64_t v3 = @"MKPOICategoryPostOffice";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640E8]])
    {
      uint64_t v3 = @"MKPOICategoryPublicTransport";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640F8]])
    {
      uint64_t v3 = @"MKPOICategoryReligiousSite";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64100]])
    {
      uint64_t v3 = @"MKPOICategoryRestaurant";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64108]])
    {
      uint64_t v3 = @"MKPOICategoryRestroom";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64110]])
    {
      uint64_t v3 = @"MKPOICategoryRockClimbing";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F640F0]])
    {
      uint64_t v3 = @"MKPOICategoryRVPark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64118]])
    {
      uint64_t v3 = @"MKPOICategorySchool";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64120]])
    {
      uint64_t v3 = @"MKPOICategorySkatePark";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64128]])
    {
      uint64_t v3 = @"MKPOICategorySkating";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64130]])
    {
      uint64_t v3 = @"MKPOICategorySkiing";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64138]])
    {
      uint64_t v3 = @"MKPOICategorySoccer";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64140]])
    {
      uint64_t v3 = @"MKPOICategorySpa";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64148]])
    {
      uint64_t v3 = @"MKPOICategoryStadium";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64150]])
    {
      uint64_t v3 = @"MKPOICategoryStore";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64158]])
    {
      uint64_t v3 = @"MKPOICategorySurfing";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64160]])
    {
      uint64_t v3 = @"MKPOICategorySwimming";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64168]])
    {
      uint64_t v3 = @"MKPOICategoryTennis";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64170]])
    {
      uint64_t v3 = @"MKPOICategoryTheater";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64178]])
    {
      uint64_t v3 = @"MKPOICategoryUniversity";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64180]])
    {
      uint64_t v3 = @"MKPOICategoryVolleyball";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64188]])
    {
      uint64_t v3 = @"MKPOICategoryWinery";
    }
    else if ([v2 isEqual:*MEMORY[0x1E4F64190]])
    {
      uint64_t v3 = @"MKPOICategoryZoo";
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_18BBAC47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BBB508C(_Unwind_Exception *a1)
{
}

uint64_t _MKRouteContextBuilderCacheEntryKey(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v1 = a1;
  uint64_t v2 = 0;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "uniqueRouteID", (void)v12);
        BOOL v8 = v7 == 0;

        if (!v8)
        {
          uint64_t v9 = [v6 uniqueRouteID];
          uint64_t v10 = [v9 hash];

          uint64_t v2 = v10 ^ (v2 << 6);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }

  return v2;
}

void sub_18BBB6CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBB6D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBB7894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  *(void *)(v28 - 12_Block_object_dispose(&STACK[0x240], 8) = &a28;
  std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 128));

  _Unwind_Resume(a1);
}

id MKGetMKRouteContextBuilderLog(void)
{
  if (qword_1EB315D80 != -1) {
    dispatch_once(&qword_1EB315D80, &__block_literal_global_65_0);
  }
  uint64_t v0 = (void *)_MergedGlobals_142;

  return v0;
}

void sub_18BBB7C40(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void ___ZL29MKGetMKRouteContextBuilderLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKRouteContextBuilder");
  id v1 = (void *)_MergedGlobals_142;
  _MergedGlobals_142 = (uint64_t)v0;
}

void std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E54B7F38, MEMORY[0x1E4FBA1C8]);
}

void sub_18BBB7D64(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char **std::vector<RouteSection>::vector(char **a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = (char *)operator new(24 * a2);
    *a1 = v4;
    a1[1] = v4;
    uint64_t v5 = &v4[24 * a2];
    a1[2] = v5;
    do
    {
      *(void *)uint64_t v4 = 0;
      *((void *)v4 + 1) = 0;
      *((_DWORD *)v4 + 3) = -1082130432;
      *((void *)v4 + 2) = 0xBF80000000000000;
      v4 += 24;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_18BBB7EF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x240], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id MKGetMKLookAroundLog()
{
  if (MKGetMKLookAroundLog_onceToken != -1) {
    dispatch_once(&MKGetMKLookAroundLog_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)MKGetMKLookAroundLog_log;

  return v0;
}

void __MKGetMKLookAroundLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKLookAround");
  uint64_t v1 = (void *)MKGetMKLookAroundLog_log;
  MKGetMKLookAroundLog_log = (uint64_t)v0;
}

id MKGetPlaceCardLog()
{
  if (MKGetPlaceCardLog_onceToken != -1) {
    dispatch_once(&MKGetPlaceCardLog_onceToken, &__block_literal_global_7_0);
  }
  os_log_t v0 = (void *)MKGetPlaceCardLog_log;

  return v0;
}

void __MKGetPlaceCardLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "PlaceCard");
  uint64_t v1 = (void *)MKGetPlaceCardLog_log;
  MKGetPlaceCardLog_log = (uint64_t)v0;
}

id MKGetTransitItemUpdaterLog()
{
  if (MKGetTransitItemUpdaterLog_onceToken != -1) {
    dispatch_once(&MKGetTransitItemUpdaterLog_onceToken, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)MKGetTransitItemUpdaterLog_log;

  return v0;
}

void __MKGetTransitItemUpdaterLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "TransitItemUpdater");
  uint64_t v1 = (void *)MKGetTransitItemUpdaterLog_log;
  MKGetTransitItemUpdaterLog_log = (uint64_t)v0;
}

id MKGetSnapshotLog()
{
  if (MKGetSnapshotLog_onceToken != -1) {
    dispatch_once(&MKGetSnapshotLog_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)MKGetSnapshotLog_log;

  return v0;
}

void __MKGetSnapshotLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "Snapshot");
  uint64_t v1 = (void *)MKGetSnapshotLog_log;
  MKGetSnapshotLog_log = (uint64_t)v0;
}

id MKGetGesturesLog()
{
  if (MKGetGesturesLog_onceToken != -1) {
    dispatch_once(&MKGetGesturesLog_onceToken, &__block_literal_global_22);
  }
  os_log_t v0 = (void *)MKGetGesturesLog_log;

  return v0;
}

void __MKGetGesturesLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "Gestures");
  uint64_t v1 = (void *)MKGetGesturesLog_log;
  MKGetGesturesLog_log = (uint64_t)v0;
}

id MKGetClipServicesLog()
{
  if (MKGetClipServicesLog_onceToken != -1) {
    dispatch_once(&MKGetClipServicesLog_onceToken, &__block_literal_global_28);
  }
  os_log_t v0 = (void *)MKGetClipServicesLog_log;

  return v0;
}

void __MKGetClipServicesLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "ClipServices");
  uint64_t v1 = (void *)MKGetClipServicesLog_log;
  MKGetClipServicesLog_log = (uint64_t)v0;
}

id MKGetPuckTrackingLog()
{
  if (MKGetPuckTrackingLog_onceToken != -1) {
    dispatch_once(&MKGetPuckTrackingLog_onceToken, &__block_literal_global_37);
  }
  os_log_t v0 = (void *)MKGetPuckTrackingLog_log;

  return v0;
}

void __MKGetPuckTrackingLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "PuckTracking");
  uint64_t v1 = (void *)MKGetPuckTrackingLog_log;
  MKGetPuckTrackingLog_log = (uint64_t)v0;
}

id MKGetMapItemRequestLog()
{
  if (MKGetMapItemRequestLog_onceToken != -1) {
    dispatch_once(&MKGetMapItemRequestLog_onceToken, &__block_literal_global_43);
  }
  os_log_t v0 = (void *)MKGetMapItemRequestLog_log;

  return v0;
}

void __MKGetMapItemRequestLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MapItemRequest");
  uint64_t v1 = (void *)MKGetMapItemRequestLog_log;
  MKGetMapItemRequestLog_log = (uint64_t)v0;
}

id MKGetMKLinkPreviewLog()
{
  if (MKGetMKLinkPreviewLog_onceToken != -1) {
    dispatch_once(&MKGetMKLinkPreviewLog_onceToken, &__block_literal_global_46);
  }
  os_log_t v0 = (void *)MKGetMKLinkPreviewLog_log;

  return v0;
}

void __MKGetMKLinkPreviewLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKLinkPreview");
  uint64_t v1 = (void *)MKGetMKLinkPreviewLog_log;
  MKGetMKLinkPreviewLog_log = (uint64_t)v0;
}

uint64_t __CoreImageLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreImageLibraryCore_frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreImageLibrary()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = CoreImageLibraryCore_frameworkLibrary;
  uint64_t v9 = CoreImageLibraryCore_frameworkLibrary;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    _OWORD v3[3] = __CoreImageLibraryCore_block_invoke;
    v3[4] = &unk_1E54B8598;
    uint64_t v4 = &v6;
    uint64_t v5 = v3;
    long long v10 = xmmword_1E54BA690;
    long long v11 = *(_OWORD *)&off_1E54BA6A0;
    v7[3] = _sl_dlopen();
    CoreImageLibraryCore_frameworkLibrardouble y = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  uint64_t v1 = v3[0];
  if (!v0)
  {
    uint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18BBB8634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCIFilterClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCIFilterClass_softClass;
  uint64_t v7 = getCIFilterClass_softClass;
  if (!getCIFilterClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCIFilterClass_block_invoke;
    _OWORD v3[3] = &unk_1E54B8448;
    v3[4] = &v4;
    __getCIFilterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18BBB8720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIFilterClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCIFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getCIContextClass_block_invoke(v3);
  }
  return result;
}

Class __getCIContextClass_block_invoke(uint64_t a1)
{
  CoreImageLibrary();
  Class result = objc_getClass("CIContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getkCIContextWorkingColorSpaceSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getkCIContextWorkingColorSpaceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreImageLibrary();
  Class result = dlsym(v2, "kCIContextWorkingColorSpace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E9154118 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCIOutputImageKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreImageLibrary();
  Class result = dlsym(v2, "kCIOutputImageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E9154120 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _trackShadowImage(CGFloat a1)
{
  v25.CGFloat width = 162.0;
  v25.CGFloat height = 750.0;
  UIGraphicsBeginImageContextWithOptions(v25, 0, a1);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 75.0, 75.0, 12.0, 600.0, 6.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(CurrentContext);
  CGContextAddRect(CurrentContext, ClipBoundingBox);
  id v4 = v2;
  CGContextAddPath(CurrentContext, (CGPathRef)[v4 CGPath]);
  CGContextEOClip(CurrentContext);
  id v5 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v6 = (CGColor *)[v5 CGColor];
  CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E4F1DB30], 75.0, v6);
  [v5 setFill];
  UIRectInset();
  UIRectFill(v27);
  if (qword_1E9154130 != -1) {
    dispatch_once(&qword_1E9154130, &__block_literal_global_37);
  }
  uint64_t v7 = [getCIFilterClass() filterWithName:@"CIRandomGenerator"];
  uint64_t v8 = [getCIFilterClass() filterWithName:@"CIColorMonochrome"];
  uint64_t v9 = [v7 valueForKey:@"outputImage"];
  [v8 setValue:v9 forKey:@"inputImage"];

  long long v10 = (void *)qword_1E9154128;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  long long v11 = (id *)qword_1E9154120;
  uint64_t v23 = qword_1E9154120;
  if (!qword_1E9154120)
  {
    uint64_t v12 = (void *)CoreImageLibrary();
    v21[3] = (uint64_t)dlsym(v12, "kCIOutputImageKey");
    qword_1E9154120 = v21[3];
    long long v11 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v11)
  {
    dlerror();
    char v19 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v19);
  }
  id v13 = *v11;
  long long v14 = [v8 valueForKey:v13];
  long long v15 = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:", v14, 0.0, 0.0, 162.0, 750.0);

  if (v15)
  {
    CGContextSetAlpha(CurrentContext, 0.25);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
    v28.origin.double x = 0.0;
    v28.origin.double y = 0.0;
    v28.size.CGFloat width = 162.0;
    v28.size.CGFloat height = 750.0;
    CGContextDrawImage(CurrentContext, v28, v15);
  }
  CGImageRelease(v15);

  CGContextRestoreGState(CurrentContext);
  char v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  uint64_t v17 = objc_msgSend(v16, "resizableImageWithCapInsets:", 115.0, 0.0, 115.0, 0.0);

  return v17;
}

void ___trackShadowImage_block_invoke()
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000;
  uint64_t v0 = (void *)_MergedGlobals_1_4;
  uint64_t v19 = _MergedGlobals_1_4;
  if (!_MergedGlobals_1_4)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __getCIContextClass_block_invoke;
    long long v14 = &unk_1E54B8448;
    long long v15 = &v16;
    __getCIContextClass_block_invoke((uint64_t)&v11);
    uint64_t v0 = (void *)v17[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v16, 8);
  id v2 = v1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v3 = (id *)qword_1E9154118;
  uint64_t v19 = qword_1E9154118;
  if (!qword_1E9154118)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __getkCIContextWorkingColorSpaceSymbolLoc_block_invoke;
    long long v14 = &unk_1E54B8448;
    long long v15 = &v16;
    id v4 = (void *)CoreImageLibrary();
    id v5 = dlsym(v4, "kCIContextWorkingColorSpace");
    *(void *)(v15[1] + 24) = v5;
    qword_1E9154118 = *(void *)(v15[1] + 24);
    uint64_t v3 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v3)
  {
    dlerror();
    abort_report_np();
  }
  id v6 = *v3;
  id v20 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  v21[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v9 = [v2 contextWithOptions:v8];
  long long v10 = (void *)qword_1E9154128;
  qword_1E9154128 = v9;
}

void sub_18BBB9E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MKGetMKRemoteUILog_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKRemoteUI");
  id v1 = (void *)_MergedGlobals_1_5;
  _MergedGlobals_1_5 = (uint64_t)v0;
}

uint64_t __MobileIconsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  MobileIconsLibraryCore::frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileIconsLibrary()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = MobileIconsLibraryCore::frameworkLibrary;
  uint64_t v9 = MobileIconsLibraryCore::frameworkLibrary;
  if (!MobileIconsLibraryCore::frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    _OWORD v3[3] = __MobileIconsLibraryCore_block_invoke;
    v3[4] = &unk_1E54BA6D8;
    id v4 = &v6;
    id v5 = v3;
    long long v10 = xmmword_1E54BA6B0;
    long long v11 = *(_OWORD *)&off_1E54BA6C0;
    v7[3] = _sl_dlopen();
    MobileIconsLibraryCore::frameworkLibrardouble y = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  id v1 = v3[0];
  if (!v0)
  {
    id v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18BBBC05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getLICreateIconForBundleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MobileIconsLibrary();
  uint64_t result = dlsym(v2, "LICreateIconForBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_143 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18BBBC168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBC22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBC424(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18BBBC600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBC6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBC854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBCD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_18BBBCE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBD04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBD1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)_MKIconDiskCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_18BBBD4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MKGetHasUserConsentedToAddingContributions()
{
  return GEOConfigGetInteger();
}

uint64_t MKSetHasUserConsentedToAddingContributions(int a1)
{
  if (a1) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = 2;
  }
  return MEMORY[0x1F411C0E8](MapKitConfig_UserConsentState, off_1E91535B0, v1);
}

void sub_18BBBDF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MKMapGestureController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18BBBE104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBE1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBE290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBE36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBE854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_18BBBE9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBEAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBECA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBBF944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBFB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBBFFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_18BBC00D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC019C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC028C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18BBC08AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18BBC0A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC0B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC0C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC0D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC0EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC11C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC1284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC149C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC1550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC1B38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 168));

  _Unwind_Resume(a1);
}

void sub_18BBC1D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC1E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC1F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC2008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC25B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC2708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC27D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC28C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC29C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC2A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC2B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC3114(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 152));

  _Unwind_Resume(a1);
}

void sub_18BBC32F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC340C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v11 = v10;

  _Unwind_Resume(a1);
}

void sub_18BBC3550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC3620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC36CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC37DC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18BBC38F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBC3ADC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18BBC3DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC3EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC3F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC40BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC4234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC4318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBC5158(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BBC57E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BBC5E74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

id NSDataFromCLLocationCoordinates(double a1, double a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1))
  {
    v17[0] = @"latitude";
    uint64_t v4 = [NSNumber numberWithDouble:a1];
    v17[1] = @"longitude";
    v18[0] = v4;
    uint64_t v5 = [NSNumber numberWithDouble:a2];
    v18[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v12 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
    id v8 = v12;
    if (!v7)
    {
      uint64_t v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        long long v10 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&a1, *(void *)&a2];
        *(_DWORD *)buf = 138412546;
        long long v14 = v10;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_ERROR, "Error archiving coordinate %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_ERROR, "This is not a valid coordinate", buf, 2u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

double CLLocationCoordinatesFromNSData(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v18 = 0;
    uint64_t v2 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v1 error:&v18];
    id v3 = v18;
    if (v3)
    {
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v3;
        _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "Error decoding CoordinateData - %@", buf, 0xCu);
      }

      double latitude = *MEMORY[0x1E4F1E750];
    }
    else
    {
      double latitude = *MEMORY[0x1E4F1E750];
      uint64_t v8 = [v2 objectForKeyedSubscript:@"latitude"];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        long long v10 = [v2 objectForKeyedSubscript:@"longitude"];

        if (v10)
        {
          long long v11 = [v2 objectForKeyedSubscript:@"latitude"];
          [v11 doubleValue];
          CLLocationDegrees v13 = v12;
          long long v14 = [v2 objectForKeyedSubscript:@"longitude"];
          [v14 doubleValue];
          CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v13, v15);

          if (CLLocationCoordinate2DIsValid(v16))
          {
            double latitude = v16.latitude;
          }
          else
          {
            uint64_t v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v20 = v2;
              _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_ERROR, "Unarchived an NSDictionary but it doesn't contain valid coordinates. Dictionary: %@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_ERROR, "coordinateData should not be nil", buf, 2u);
    }

    double latitude = *MEMORY[0x1E4F1E750];
  }

  return latitude;
}

id _MKSlightTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v6 = [MEMORY[0x1E4F427D0] bezierPath];
  a3[9] = a3[30];
  if (a2 == 2)
  {
    uint64_t v8 = a3 + 50;
  }
  else if (a2 == 1)
  {
    uint64_t v8 = a3 + 49;
  }
  else
  {
    double v7 = 0.0;
    if (a2) {
      goto LABEL_8;
    }
    uint64_t v8 = a3 + 48;
  }
  double v7 = *v8;
LABEL_8:
  uint64_t v9 = *((void *)a3 + 51);
  a3[28] = v7;
  *((void *)a3 + 29) = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v14, 0, v7);
  double v11 = dbl_18BD1B290[a1 == 0];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v6, 0, __dst, v14, 0, v11);
  double v12 = a3[51];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v14, v12);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v6, (uint64_t)__dst, 0, v14, 0.0);

  return v6;
}

id _MKTurnArrow(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = [MEMORY[0x1E4F427D0] bezierPath];
  *(void *)(a3 + 72) = *(void *)(a3 + 376);
  double v9 = *(double *)(a3 + 448);
  if (a2 == 2)
  {
    double v10 = *(double *)(a3 + 368) - *(double *)(a3 + 360) + *(double *)(a3 + 48) * -0.5 + *(double *)(a3 + 24) * 0.5;
  }
  else
  {
    if (a2 != 1) {
      goto LABEL_7;
    }
    double v10 = *(double *)(a3 + 368) + (a4 + a4) / -3.0;
  }
  double v9 = v9 - v10;
  if (v9 < 0.0) {
    double v9 = 0.0;
  }
LABEL_7:
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v11;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v8, (uint64_t)__dst, v15, 0, v9);
  if (a1) {
    double v12 = -3.14159265;
  }
  else {
    double v12 = 0.0;
  }
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v8, 0, __dst, v15, 0, v12);
  double v13 = *(double *)(a3 + 456);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v8, (uint64_t)__dst, v15, v13);
  memcpy(__dst, (const void *)a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v8, (uint64_t)__dst, 0, v15, 0.0);

  return v8;
}

id _MKSharpTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v6 = [MEMORY[0x1E4F427D0] bezierPath];
  a3[9] = a3[26];
  if (a2 == 2)
  {
    uint64_t v7 = *((void *)a3 + 27);
    *((void *)a3 + 9) = v7;
    *((void *)a3 + 26) = v7;
    uint64_t v8 = a3 + 54;
    double v9 = a3 + 55;
  }
  else
  {
    uint64_t v8 = a3 + 52;
    double v9 = a3 + 53;
  }
  double v10 = *v9;
  double v11 = *v8;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v12;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v15, 0, v11);
  double v13 = dbl_18BD1B2A0[a1 == 0];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptions(v6, 0, __dst, v15, 0, v13);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v15, v10);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v6, (uint64_t)__dst, 0, v15, 0.0);

  return v6;
}

id _MKUTurnArrow(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v6 = [MEMORY[0x1E4F427D0] bezierPath];
  a3[9] = a3[26];
  if (a2 == 2)
  {
    uint64_t v7 = *((void *)a3 + 11);
    *((void *)a3 + 9) = v7;
    *((void *)a3 + 10) = v7;
    uint64_t v8 = a3 + 60;
  }
  else
  {
    uint64_t v8 = a3 + 58;
  }
  double v9 = *v8;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v17[0] = *MEMORY[0x1E4F1DAB8];
  v17[1] = v10;
  void v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v6, (uint64_t)__dst, v17, 0, v9);
  if (a1) {
    double v11 = -a3[10];
  }
  else {
    double v11 = a3[10];
  }
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendUTurnCurveToPath(v6, (uint64_t)__dst, v17, v11);
  if (a2 == 2)
  {
    double v12 = a3[61];
    memcpy(__dst, a3, sizeof(__dst));
    MKArrowAppendSegmentToPath(v6, (uint64_t)__dst, v17, v12);
    memcpy(__dst, a3, sizeof(__dst));
    CGFloat v13 = 0.0;
    long long v14 = v6;
  }
  else
  {
    double v15 = a3[59];
    memcpy(__dst, a3, sizeof(__dst));
    long long v14 = v6;
    CGFloat v13 = v15;
  }
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v14, (uint64_t)__dst, 0, v17, v13);

  return v6;
}

uint64_t MKLaneDirectionIsToTheLeft(unsigned int a1)
{
  uint64_t result = 1;
  if (a1 <= 8 && ((1 << a1) & 0x117) != 0 || a1 == 256) {
    return 0;
  }
  return result;
}

id MKCreateImageForLane(void *a1, int a2, uint64_t a3, double *a4, void *a5, CGFloat *a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  memcpy(__dst, a6, sizeof(__dst));
  double v12 = MKCreateBezierPathsForLane(a1, a2, a3, a4, __dst);
  CGFloat v13 = a6[1];
  CGFloat v14 = a6[2];
  double v15 = +[MKSystemController sharedInstance];
  [v15 screenScale];
  CGFloat v17 = v16;
  v33.CGFloat width = v13;
  v33.CGFloat height = v14;
  UIGraphicsBeginImageContextWithOptions(v33, 0, v17);

  [v11 set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "fill", (void)v25);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v23;
}

id MKCreateBezierPathsForLane(void *a1, int a2, uint64_t a3, double *a4, double *a5)
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  uint64_t v8 = v7;
  int v131 = a2;
  if (a2)
  {
    double v9 = [v7 directions];
    long long v10 = [v9 firstObject];
  }
  else
  {
    long long v10 = 0;
  }
  if (![v10 direction])
  {

    long long v10 = 0;
  }
  unint64_t v130 = v8;
  id v11 = [v8 directions];
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = ___MKDirectionsToDrawForLane_block_invoke;
  v169[3] = &unk_1E54BAC08;
  id v12 = v10;
  id v170 = v12;
  CGFloat v13 = [v11 sortedArrayUsingComparator:v169];

  CGFloat v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  obuint64_t j = v13;
  uint64_t v16 = [obj countByEnumeratingWithState:&v165 objects:__dst count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    LODWORD(v1_Block_object_dispose(&STACK[0x240], 8) = 0;
    uint64_t v19 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v166 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(*((void *)&v165 + 1) + 8 * i);
        if ([v21 direction] != v18)
        {
          if ([v21 direction])
          {
            [v14 addObject:v21];
            uint64_t v18 = [v21 direction];
            if (v21 != v12)
            {
              uint64_t v22 = [NSNumber numberWithInt:v18];
              [v15 addObject:v22];
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v165 objects:__dst count:16];
    }
    while (v17);
  }

  uint64_t v23 = [[MKLaneDirectionCollisionCalculator alloc] initWithDirections:v15];
  unint64_t v24 = 0;
  while (v12)
  {
    if (![(MKLaneDirectionCollisionCalculator *)v23 hasCollisions] || v24 > 8) {
      goto LABEL_30;
    }
    if (![(MKLaneDirectionCollisionCalculator *)v23 hasDirectionWithMaxCollisions])
    {
      -[MKLaneDirectionCollisionCalculator removeDirectionWithCollisionsLeastSimilarToDirection:](v23, "removeDirectionWithCollisionsLeastSimilarToDirection:", [v12 direction]);
      goto LABEL_28;
    }
LABEL_27:
    [(MKLaneDirectionCollisionCalculator *)v23 removeNextDirectionWithCollisions];
LABEL_28:
    ++v24;
  }
  long long v25 = [(MKLaneDirectionCollisionCalculator *)v23 directions];
  if ((unint64_t)[v25 count] > 2)
  {
    BOOL v26 = [(MKLaneDirectionCollisionCalculator *)v23 hasCollisions];

    if (!v26 || v24 > 8) {
      goto LABEL_30;
    }
    [(MKLaneDirectionCollisionCalculator *)v23 hasDirectionWithMaxCollisions];
    goto LABEL_27;
  }

LABEL_30:
  BOOL v146 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  BOOL v127 = v23;
  long long v27 = [(MKLaneDirectionCollisionCalculator *)v23 directions];
  if (v12)
  {
    long long v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "direction"));
    uint64_t v29 = [v27 arrayByAddingObject:v28];

    long long v27 = (void *)v29;
  }
  uint64_t v128 = v15;
  unint64_t v129 = v12;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v148 = v14;
  uint64_t v30 = [v148 countByEnumeratingWithState:&v161 objects:v173 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    int v134 = 0;
    int v142 = 0;
    int v136 = 0;
    int v144 = 0;
    uint64_t v133 = 0;
    int v140 = 0;
    int v32 = 0;
    int v138 = 0;
    uint64_t v33 = *(void *)v162;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v162 != v33) {
          objc_enumerationMutation(v148);
        }
        char v35 = *(void **)(*((void *)&v161 + 1) + 8 * j);
        uint64_t v36 = [v35 direction];
        char v37 = [NSNumber numberWithInt:v36];
        int v38 = [v27 containsObject:v37];

        if (v38)
        {
          if ((int)v36 > 31)
          {
            if (v36 == 256) {
              int v39 = 1;
            }
            else {
              int v39 = v32;
            }
            int v40 = v142;
            if (v36 == 128) {
              int v41 = 1;
            }
            else {
              int v41 = v142;
            }
            if (v36 == 128) {
              int v39 = v32;
            }
            int v42 = v144;
            if (v36 == 64) {
              int v43 = 1;
            }
            else {
              int v43 = v144;
            }
            if (v36 == 32) {
              int v43 = v144;
            }
            int v44 = v140;
            if (v36 == 32) {
              int v45 = 1;
            }
            else {
              int v45 = v140;
            }
            if ((int)v36 > 127) {
              int v40 = v41;
            }
            int v142 = v40;
            if ((int)v36 <= 127) {
              int v42 = v43;
            }
            int v144 = v42;
            if ((int)v36 <= 127) {
              int v44 = v45;
            }
            int v140 = v44;
            if ((int)v36 > 127) {
              int v32 = v39;
            }
          }
          else
          {
            switch((int)v36)
            {
              case 1:
                int v134 = 1;
                break;
              case 2:
                int v136 = 1;
                break;
              case 3:
              case 5:
              case 6:
              case 7:
                break;
              case 4:
                HIDWORD(v133) = 1;
                break;
              case 8:
                LODWORD(v133) = 1;
                break;
              default:
                if (v36 == 16) {
                  int v46 = 1;
                }
                else {
                  int v46 = v138;
                }
                int v138 = v46;
                break;
            }
          }
          [v146 addObject:v35];
        }
      }
      uint64_t v31 = [v148 countByEnumeratingWithState:&v161 objects:v173 count:16];
    }
    while (v31);
  }
  else
  {
    int v134 = 0;
    int v142 = 0;
    int v136 = 0;
    int v144 = 0;
    uint64_t v133 = 0;
    int v140 = 0;
    int v32 = 0;
    int v138 = 0;
  }

  if (v129)
  {
    [v146 removeObject:v129];
    [v146 insertObject:v129 atIndex:0];
  }
  char v47 = (void *)[v146 copy];

  char v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
  if (v131)
  {
    char v49 = [v47 firstObject];
    unsigned int v50 = [v49 direction];
  }
  else
  {
    unsigned int v50 = 0;
  }
  int v51 = v136;
  if (!v134)
  {
    BOOL v59 = v142 == 0;
    if (!v136 || !v142)
    {
      uint64_t v58 = 0;
      int v57 = v144;
      if (!(v136 | v142))
      {
        BOOL v59 = 1;
        uint64_t v137 = 0;
        uint64_t v139 = 0;
        goto LABEL_121;
      }
      uint64_t v137 = 0;
      int v53 = v138;
      if (v144) {
        goto LABEL_111;
      }
      goto LABEL_112;
    }
    if ([v47 count] == 2)
    {
      if (v50)
      {
        unsigned int v60 = MKLaneDirectionIsToTheLeft(v50);
        uint64_t v137 = v60;
        uint64_t v58 = v60 ^ 1;
      }
      else
      {
        uint64_t v58 = a3 != 0;
        uint64_t v137 = a3 == 0;
      }
      goto LABEL_109;
    }
LABEL_108:
    uint64_t v137 = 0;
    uint64_t v58 = 0;
LABEL_109:
    int v57 = v144;
    int v53 = v138;
    goto LABEL_110;
  }
  if (v136 && v32) {
    goto LABEL_108;
  }
  uint64_t v137 = 0;
  BOOL v52 = v142 == 0;
  int v53 = v138;
  if (v138) {
    BOOL v54 = v142 == 0;
  }
  else {
    BOOL v54 = 1;
  }
  if (v51) {
    BOOL v55 = HIDWORD(v133) == 0;
  }
  else {
    BOOL v55 = 1;
  }
  int v56 = v55;
  int v57 = v144;
  if (!v144) {
    BOOL v52 = 1;
  }
  if (v54 && v56)
  {
    uint64_t v58 = 0;
    if (v52)
    {
      if (v51 && v133)
      {
        uint64_t v137 = 2;
        uint64_t v58 = 2;
      }
      else
      {
        if (v140) {
          BOOL v124 = v142 == 0;
        }
        else {
          BOOL v124 = 1;
        }
        uint64_t v125 = 1;
        if (!v124) {
          uint64_t v125 = 2;
        }
        uint64_t v137 = v125;
        uint64_t v58 = v125;
      }
    }
  }
  else
  {
    uint64_t v58 = 0;
  }
LABEL_110:
  BOOL v59 = v142 == 0;
  if (!v57)
  {
LABEL_112:
    if (HIDWORD(v133) && v32) {
      goto LABEL_114;
    }
    if (!v134)
    {
      if (v57) {
        int v122 = v59;
      }
      else {
        int v122 = 1;
      }
      if (HIDWORD(v133)) {
        BOOL v123 = v51 == 0;
      }
      else {
        BOOL v123 = 1;
      }
      if (!v123) {
        int v122 = 0;
      }
      uint64_t v139 = v122 ^ 1u;
      if (!v59) {
        goto LABEL_123;
      }
LABEL_122:
      double v141 = 0.0;
      if (v51) {
        goto LABEL_123;
      }
      goto LABEL_125;
    }
    uint64_t v139 = 1;
LABEL_118:
    char v61 = a5 + 43;
    goto LABEL_124;
  }
LABEL_111:
  if (!v53) {
    goto LABEL_112;
  }
LABEL_114:
  uint64_t v139 = 2;
  if (v134) {
    goto LABEL_118;
  }
LABEL_121:
  if (v59) {
    goto LABEL_122;
  }
LABEL_123:
  char v61 = a5 + 44;
LABEL_124:
  double v141 = *v61;
LABEL_125:
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v62 = v47;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v157 objects:v172 count:16];
  if (!v63)
  {
    double v66 = 1.79769313e308;
    double v67 = 2.22507386e-308;
    double v68 = 2.22507386e-308;
    double v69 = 1.79769313e308;
    goto LABEL_170;
  }
  uint64_t v64 = v63;
  uint64_t v135 = v58;
  uint64_t v65 = *(void *)v158;
  double v143 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v145 = *MEMORY[0x1E4F1DAD8];
  double v66 = 1.79769313e308;
  double v67 = 2.22507386e-308;
  double v68 = 2.22507386e-308;
  double v69 = 1.79769313e308;
  while (2)
  {
    uint64_t v70 = 0;
    while (2)
    {
      if (*(void *)v158 != v65) {
        objc_enumerationMutation(v62);
      }
      char v71 = *(void **)(*((void *)&v157 + 1) + 8 * v70);
      int v72 = MKLaneDirectionIsToTheLeft([v71 direction]);
      int v73 = [v71 direction];
      if (v73 <= 15)
      {
        switch(v73)
        {
          case 0:
          case 1:
            uint64_t v74 = *(void *)a5;
            double v75 = a5[1];
            double v76 = a5[2];
            memcpy(&__dst[24], a5 + 3, 0x1D8uLL);
            char v77 = [MEMORY[0x1E4F427D0] bezierPath];
            *(void *)__dst = v74;
            *(double *)&__dst[8] = v75;
            *(double *)&__dst[16] = v76;
            MKArrowAppendStraightArrowToPathInRect(v77, (double *)__dst, 0, v145, v143, v75, v76);
            if (!v77) {
              goto LABEL_166;
            }
            double v147 = v69;
            double v149 = v67;
            double obja = v66;
            [v77 bounds];
            CGFloat x = v177.origin.x;
            CGFloat y = v177.origin.y;
            CGFloat width = v177.size.width;
            CGFloat height = v177.size.height;
            double v82 = a5[1];
            double v83 = -(CGRectGetMidX(v177) - v82 * 0.5);
            break;
          case 2:
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v88 = 0;
            uint64_t v89 = v137;
            goto LABEL_151;
          case 4:
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v90 = 0;
            goto LABEL_149;
          case 8:
            uint64_t v86 = 2 * ([v62 count] == 1);
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v87 = 0;
            goto LABEL_145;
          default:
            goto LABEL_166;
        }
LABEL_157:
        double v104 = a5[2];
        v178.origin.CGFloat x = x;
        v178.origin.CGFloat y = y;
        v178.size.CGFloat width = width;
        v178.size.CGFloat height = height;
        CGFloat MaxY = CGRectGetMaxY(v178);
        CGAffineTransformMakeTranslation(&v156, v83, v104 - MaxY);
        [v77 applyTransform:&v156];
        [v77 bounds];
        CGFloat v106 = v179.origin.x;
        CGFloat v107 = v179.origin.y;
        CGFloat v108 = v179.size.width;
        CGFloat v109 = v179.size.height;
        double MinX = CGRectGetMinX(v179);
        v180.origin.CGFloat x = v106;
        v180.origin.CGFloat y = v107;
        v180.size.CGFloat width = v108;
        v180.size.CGFloat height = v109;
        double MaxX = CGRectGetMaxX(v180);
        v181.origin.CGFloat x = v106;
        v181.origin.CGFloat y = v107;
        v181.size.CGFloat width = v108;
        v181.size.CGFloat height = v109;
        double MinY = CGRectGetMinY(v181);
        v182.origin.CGFloat x = v106;
        v182.origin.CGFloat y = v107;
        v182.size.CGFloat width = v108;
        v182.size.CGFloat height = v109;
        double v113 = CGRectGetMaxY(v182);
        double v69 = v147;
        double v67 = v149;
        if (MinX < v147) {
          double v69 = MinX;
        }
        if (MaxX > v149) {
          double v67 = MaxX;
        }
        double v66 = obja;
        if (MinY < obja) {
          double v66 = MinY;
        }
        if (v113 > v68) {
          double v68 = v113;
        }
        [v48 addObject:v77];

        goto LABEL_166;
      }
      if (v73 <= 63)
      {
        if (v73 == 16)
        {
          uint64_t v84 = 2 * ([v62 count] == 1);
          memcpy(__dst, a5, sizeof(__dst));
          uint64_t v85 = 1;
          goto LABEL_147;
        }
        if (v73 != 32) {
          goto LABEL_166;
        }
        uint64_t v86 = 2 * ([v62 count] == 1);
        memcpy(__dst, a5, sizeof(__dst));
        uint64_t v87 = 1;
LABEL_145:
        int64_t v91 = _MKSharpTurnArrow(v87, v86, (double *)__dst);
      }
      else
      {
        switch(v73)
        {
          case 64:
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v90 = 1;
LABEL_149:
            int64_t v91 = _MKTurnArrow(v90, v139, (uint64_t)__dst, v141);
            break;
          case 128:
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v88 = 1;
            uint64_t v89 = v135;
LABEL_151:
            int64_t v91 = _MKSlightTurnArrow(v88, v89, (double *)__dst);
            break;
          case 256:
            uint64_t v84 = 2 * ([v62 count] == 1);
            memcpy(__dst, a5, sizeof(__dst));
            uint64_t v85 = 0;
LABEL_147:
            int64_t v91 = _MKUTurnArrow(v85, v84, (double *)__dst);
            break;
          default:
            goto LABEL_166;
        }
      }
      char v77 = v91;
      if (v91)
      {
        double v147 = v69;
        double v149 = v67;
        double obja = v66;
        [v91 bounds];
        CGFloat x = v94;
        CGFloat y = v95;
        CGFloat width = v92;
        CGFloat height = v93;
        double v96 = a5[1];
        double v97 = a5[3];
        if (v72)
        {
          double v98 = v97 * 0.5 + v96 * 0.5;
          CGFloat v99 = x;
          CGFloat v100 = y;
          double v101 = CGRectGetMaxX(*(CGRect *)(&v92 - 2));
        }
        else
        {
          double v98 = v97 * -0.5 + v96 * 0.5;
          CGFloat v102 = x;
          CGFloat v103 = y;
          double v101 = CGRectGetMinX(*(CGRect *)(&v92 - 2));
        }
        double v83 = v98 - v101;
        goto LABEL_157;
      }
LABEL_166:
      if (v64 != ++v70) {
        continue;
      }
      break;
    }
    uint64_t v64 = [v62 countByEnumeratingWithState:&v157 objects:v172 count:16];
    if (v64) {
      continue;
    }
    break;
  }
LABEL_170:

  memset(__dst, 0, 48);
  CGAffineTransformMakeTranslation((CGAffineTransform *)__dst, -v69, -v66);
  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v114 = v48;
  uint64_t v115 = [v114 countByEnumeratingWithState:&v152 objects:v171 count:16];
  if (v115)
  {
    uint64_t v116 = v115;
    uint64_t v117 = *(void *)v153;
    do
    {
      for (uint64_t k = 0; k != v116; ++k)
      {
        if (*(void *)v153 != v117) {
          objc_enumerationMutation(v114);
        }
        uint64_t v119 = *(void **)(*((void *)&v152 + 1) + 8 * k);
        v173[0] = *(_OWORD *)__dst;
        v173[1] = *(_OWORD *)&__dst[16];
        v173[2] = *(_OWORD *)&__dst[32];
        [v119 applyTransform:v173];
      }
      uint64_t v116 = [v114 countByEnumeratingWithState:&v152 objects:v171 count:16];
    }
    while (v116);
  }

  if (a4)
  {
    *a4 = v67 - v69;
    a4[1] = v68 - v66;
  }
  v120 = (void *)[v114 copy];

  return v120;
}

uint64_t _MKBlurEffectStyleForTraitCollection()
{
  return 1100;
}

void sub_18BBD068C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKServiceGapDescription(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    long long v10 = @"Service interrupted";
LABEL_9:
    double v15 = _MKLocalizedStringFromThisBundle(v10);
    goto LABEL_14;
  }
  if (!v7)
  {
    long long v10 = @"No upcoming service";
    goto LABEL_9;
  }
  [v7 timeIntervalSinceDate:v8];
  if (v11 < 43200.0)
  {
    if (qword_1EB315E10 != -1) {
      dispatch_once(&qword_1EB315E10, &__block_literal_global_44);
    }
    [(id)_MergedGlobals_147 setTimeZone:v9];
    id v12 = _MKLocalizedStringFromThisBundle(@"ServiceResume_AbsoluteTime");
    CGFloat v13 = NSString;
    CGFloat v14 = [(id)_MergedGlobals_147 stringFromDate:v7];
    objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);
    goto LABEL_12;
  }
  unint64_t v18 = 0;
  uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v12 = objc_msgSend(v16, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v7, 5, v9, &v18);

  double v15 = 0;
  if (v18 <= 2)
  {
    CGFloat v14 = _MKLocalizedStringFromThisBundle(off_1E54BADF0[v18]);
    objc_msgSend(NSString, "localizedStringWithFormat:", v14, v12);
    double v15 = LABEL_12:;
  }
LABEL_14:

  return v15;
}

uint64_t __MKServiceGapDescription_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)_MergedGlobals_147;
  _MergedGlobals_147 = (uint64_t)v0;

  uint64_t v2 = (void *)_MergedGlobals_147;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  uint64_t v4 = (void *)_MergedGlobals_147;

  return [v4 setLocalizedDateFormatFromTemplate:@"jma"];
}

void sub_18BBD1C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

Class __getTUCallCapabilitiesClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUCallCapabilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_148 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)getTUDialRequestClass(v3);
  }
  return result;
}

id getTUDialRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getTUDialRequestClass_softClass;
  uint64_t v7 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getTUDialRequestClass_block_invoke;
    _OWORD v3[3] = &unk_1E54B8448;
    v3[4] = &v4;
    __getTUDialRequestClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18BBD66A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUDialRequestClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUDialRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUDialRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return __getTUCallProviderManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUCallProviderManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB315E20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)getTUHandleClass(v3);
  }
  return result;
}

id getTUHandleClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getTUHandleClass_softClass;
  uint64_t v7 = getTUHandleClass_softClass;
  if (!getTUHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getTUHandleClass_block_invoke;
    _OWORD v3[3] = &unk_1E54B8448;
    v3[4] = &v4;
    __getTUHandleClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18BBD686C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUHandleClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getTUConvertDestinationIDToLatinNumbersSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getTUConvertDestinationIDToLatinNumbersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)TelephonyUtilitiesLibrary();
  Class result = dlsym(v2, "TUConvertDestinationIDToLatinNumbers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id mk_TUConvertDestinationIDToLatinNumbers(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v2 = (void (*)(id))getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr;
  long long v10 = getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr;
  if (!getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)TelephonyUtilitiesLibrary();
    v8[3] = (uint64_t)dlsym(v3, "TUConvertDestinationIDToLatinNumbers");
    getTUConvertDestinationIDToLatinNumbersSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(v1);

  return v4;
}

void sub_18BBD6F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BBD9458(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void _mapItemsForGeoMapItemsWithHandler(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v4)
  {
    uint64_t v5 = [v3 count];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v12, "conformsToProtocol:", &unk_1ED9DD628, (void)v16)
              && [v12 isValid])
            {
              CGFloat v13 = +[MKMapItem _itemWithGeoMapItem:v12];
              [v6 addObject:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      if (v6 && [v6 count])
      {
        CGFloat v14 = 0;
LABEL_18:
        v4[2](v4, v6, v14);

        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    CGFloat v14 = (void *)[v15 initWithDomain:MKErrorDomain code:4 userInfo:0];

    uint64_t v6 = 0;
    goto LABEL_18;
  }
LABEL_19:
}

void sub_18BBE8660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BBEB8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BBEC0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL ___notifyCenterOffsetChanged_block_invoke()
{
  BOOL result = _MKLinkedOnOrAfterReleaseSet(257);
  byte_1E91540A9 = result;
  return result;
}

void __MKMappedABCNDictionary_block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Street";
  v2[1] = @"City";
  v3[0] = @"street";
  v3[1] = @"city";
  v2[2] = @"State";
  v2[3] = @"ZIP";
  v3[2] = @"state";
  _OWORD v3[3] = @"postalCode";
  v2[4] = @"Country";
  v2[5] = @"CountryCode";
  v3[4] = @"country";
  void v3[5] = @"ISOCountryCode";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)_MergedGlobals_150;
  _MergedGlobals_150 = v0;
}

id MKAddressStringForAddressDictionary(void *a1, unsigned int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  unsigned int v18 = a2;
  if (qword_1EB315E40 != -1) {
    dispatch_once(&qword_1EB315E40, &__block_literal_global_52);
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v11 = [(id)_MergedGlobals_150 objectForKeyedSubscript:v10];
        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v11];

          if (!v12)
          {
            CGFloat v13 = [v3 objectForKeyedSubscript:v10];
            [v4 setObject:v13 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  CGFloat v14 = (void *)[v4 copy];
  id v15 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v14];
  long long v16 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v15 addCountryName:v18];

  return v16;
}

id MKAddressDictionaryFromPostalAddress(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 dictionaryRepresentation];
    uint64_t v2 = geoAddressDictionaryFromContactsAddressDictionary(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id geoAddressDictionaryFromContactsAddressDictionary(void *a1)
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v12[0] = @"street";
  v12[1] = @"city";
  v13[0] = @"Street";
  v13[1] = @"City";
  v12[2] = @"state";
  v12[3] = @"subAdministrativeArea";
  v13[2] = @"State";
  v13[3] = @"SubAdministrativeArea";
  v12[4] = @"subLocality";
  v12[5] = @"postalCode";
  void v13[4] = @"SubLocality";
  v13[5] = @"ZIP";
  v12[6] = @"country";
  v12[7] = @"ISOCountryCode";
  v13[6] = @"Country";
  v13[7] = @"CountryCode";
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = a1;
  id v3 = [v1 dictionaryWithObjects:v13 forKeys:v12 count:8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __geoAddressDictionaryFromContactsAddressDictionary_block_invoke;
  v9[3] = &unk_1E54BB318;
  id v10 = v3;
  id v11 = v4;
  id v5 = v4;
  id v6 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v7 = (void *)[v5 copy];

  return v7;
}

id MKAddressDictionaryFromContactsDictionary(void *a1)
{
  if (a1)
  {
    a1 = geoAddressDictionaryFromContactsAddressDictionary(a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

id MKAddressDictionaryFromCLPlacemark(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CA60];
    id v2 = a1;
    id v3 = [v1 dictionary];
    uint64_t v4 = [v2 thoroughfare];
    [v3 setObject:v4 forKeyedSubscript:@"street"];

    id v5 = [v2 subLocality];
    [v3 setObject:v5 forKeyedSubscript:@"subLocality"];

    id v6 = [v2 locality];
    [v3 setObject:v6 forKeyedSubscript:@"city"];

    uint64_t v7 = [v2 subAdministrativeArea];
    [v3 setObject:v7 forKeyedSubscript:@"subAdministrativeArea"];

    uint64_t v8 = [v2 administrativeArea];
    [v3 setObject:v8 forKeyedSubscript:@"state"];

    uint64_t v9 = [v2 postalCode];
    [v3 setObject:v9 forKeyedSubscript:@"postalCode"];

    id v10 = [v2 country];
    [v3 setObject:v10 forKeyedSubscript:@"country"];

    id v11 = [v2 ISOcountryCode];

    [v3 setObject:v11 forKeyedSubscript:@"ISOCountryCode"];
    if ([v3 count] && (id v12 = objc_msgSend(v3, "copy")) != 0)
    {
      CGFloat v13 = v12;
      CGFloat v14 = geoAddressDictionaryFromContactsAddressDictionary(v12);
    }
    else
    {
      CGFloat v14 = 0;
    }
  }
  else
  {
    CGFloat v14 = 0;
  }

  return v14;
}

void __geoAddressDictionaryFromContactsAddressDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v5 length])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v9;
    }
    id v8 = v7;

    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v8];
  }
}

void sub_18BBF434C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

void MKQuadTrieNodeFree(void *a1)
{
  if (a1)
  {
    id v2 = (void *)a1[5];
    if (v2) {
      free(v2);
    }
    uint64_t v3 = a1[4];
    if (v3)
    {
      uint64_t v4 = (void **)a1[4];
      std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
      MEMORY[0x18C1392D0](v3, 0x80C40D6874129);
    }
    free(a1);
  }
}

void _breadthFirstApply(const void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFArrayAppendValue(Mutable, a1);
  while (CFArrayGetCount(Mutable) >= 1)
  {
    ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(Mutable, 0);
    CFArrayRemoveValueAtIndex(Mutable, 0);
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (long long *)ValueAtIndex[5];
    if (v5)
    {
      long long v6 = v5[1];
      long long v10 = *v5;
      long long v11 = v6;
    }
    int v7 = v9[2](v9, ValueAtIndex);
    if (!v5 || v7)
    {
      if (v7 == 2) {
        break;
      }
    }
    else
    {
      for (uint64_t i = 0; i != 32; i += 8)
        CFArrayAppendValue(Mutable, *(const void **)((char *)&v10 + i));
    }
  }
  CFRelease(Mutable);
}

void sub_18BBF5688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BBF5700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MKQuadTrie;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18BBF58B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18BBF5974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBF5A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BBF5B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18BBF5C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBF5D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BBF5F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BBF6004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BBF60D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18BBF61A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MKCompassPointFromLocationDirection(double a1)
{
  uint64_t result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    unint64_t v2 = llround(a1 / 360.0 * 8.0);
    unint64_t v3 = v2 & 7;
    uint64_t v5 = -(uint64_t)v2;
    BOOL v4 = v5 < 0;
    uint64_t v6 = v5 & 7;
    if (v4) {
      unint64_t v7 = v3;
    }
    else {
      unint64_t v7 = -v6;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      return 0;
    }
    else {
      return dword_18BD1B428[v7];
    }
  }
  return result;
}

id MKLocalizedAbbreviationForCompassPoint(int a1)
{
  if ((a1 - 1) > 7)
  {
    unint64_t v2 = 0;
  }
  else
  {
    unint64_t v2 = _MKLocalizedStringFromThisBundle(off_1E54BB670[a1 - 1]);
  }
  return v2;
}

uint64_t MKCompassPointNEWSFromLocationDirection(double a1)
{
  uint64_t result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    unint64_t v2 = llround(a1 / 360.0 * 4.0);
    unint64_t v3 = v2 & 3;
    uint64_t v5 = -(uint64_t)v2;
    BOOL v4 = v5 < 0;
    uint64_t v6 = v5 & 3;
    if (v4) {
      unint64_t v7 = v3;
    }
    else {
      unint64_t v7 = -v6;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      return 0;
    }
    else {
      return __const_MKCompassPointNEWSFromLocationDirection_quad[v7];
    }
  }
  return result;
}

id MKLocalizedAbbreviationForCompassPointNEWS(int a1)
{
  if ((a1 - 1) > 3)
  {
    unint64_t v2 = 0;
  }
  else
  {
    unint64_t v2 = _MKLocalizedStringFromThisBundle(off_1E54BB6B0[a1 - 1]);
  }
  return v2;
}

uint64_t MKCompassPointNEWSForHeading(double a1)
{
  if (a1 < 0.0 || a1 >= 360.0)
  {
    a1 = fmod(a1, 360.0);
    if (a1 < 0.0) {
      a1 = a1 + 360.0;
    }
  }
  uint64_t result = 0;
  if (a1 >= 0.0 && a1 < 360.0)
  {
    unint64_t v2 = llround(a1 / 360.0 * 4.0);
    unint64_t v3 = v2 & 3;
    uint64_t v5 = -(uint64_t)v2;
    BOOL v4 = v5 < 0;
    uint64_t v6 = v5 & 3;
    if (v4) {
      unint64_t v7 = v3;
    }
    else {
      unint64_t v7 = -v6;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      return 0;
    }
    else {
      return __const_MKCompassPointNEWSFromLocationDirection_quad[v7];
    }
  }
  return result;
}

void sub_18BBFCDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BBFCF2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BC00298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _MKLocalizedStringFromThisBundleFromTable(void *a1, void *a2)
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 _mapkitBundle];
  unint64_t v7 = objc_msgSend(v6, "_mapkit_localizedStringForKey:value:table:", v5, @"<unlocalized>", v4);

  return v7;
}

uint64_t MKCompareLocatableObjects(void *a1, void *a2, uint64_t a3)
{
  [a1 coordinate];
  double v7 = v6;
  double v9 = v8;
  [a2 coordinate];
  double v12 = v10;
  double v13 = v11;
  switch(*(void *)a3)
  {
    case 0:
      BOOL v14 = v7 <= v10;
      if (v7 < v10) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 1:
      BOOL v14 = v9 <= v11;
      if (v9 >= v11) {
        goto LABEL_25;
      }
      goto LABEL_24;
    case 2:
      GEOCalculateDistance();
      double v16 = v15;
      GEOCalculateDistance();
      goto LABEL_23;
    case 3:
      if ([a1 isHidden] && objc_msgSend(a2, "isHidden"))
      {
        if (a1 >= a2)
        {
          if (a2 >= a1) {
            return 0;
          }
          goto LABEL_26;
        }
LABEL_24:
        BOOL v21 = *(unsigned char *)(a3 + 64) == 0;
        uint64_t v22 = -1;
        goto LABEL_27;
      }
      if (![a1 isHidden] || (objc_msgSend(a2, "isHidden") & 1) != 0)
      {
        if (![a2 isHidden] || (objc_msgSend(a1, "isHidden") & 1) != 0)
        {
          unsigned int v18 = [a1 superview];
          if (v18) {
            [a1 center];
          }
          else {
            objc_msgSend(*(id *)(a3 + 56), "convertCoordinate:toPointToView:", *(void *)(a3 + 56), v7, v9);
          }

          long long v19 = [a2 superview];
          if (v19) {
            [a2 center];
          }
          else {
            objc_msgSend(*(id *)(a3 + 56), "convertCoordinate:toPointToView:", *(void *)(a3 + 56), v12, v13);
          }

          GEODistanceBetweenPointAndLine();
          double v16 = v20;
          GEODistanceBetweenPointAndLine();
LABEL_23:
          BOOL v14 = v16 <= v17;
          if (v16 >= v17)
          {
LABEL_25:
            if (v14) {
              return 0;
            }
            goto LABEL_26;
          }
        }
        goto LABEL_24;
      }
LABEL_26:
      BOOL v21 = *(unsigned char *)(a3 + 64) == 0;
      uint64_t v22 = 1;
LABEL_27:
      if (v21) {
        return v22;
      }
      else {
        return -v22;
      }
    default:
      return 0;
  }
}

id MKLocalizedStringForApproximateLocation()
{
  if (qword_1EB315E70 != -1) {
    dispatch_once(&qword_1EB315E70, &__block_literal_global_58);
  }
  uint64_t v0 = (void *)_MergedGlobals_153;

  return v0;
}

void __MKLocalizedStringForApproximateLocation_block_invoke()
{
  uint64_t v0 = _MKLocalizedStringFromThisBundle(@"Approximate Location");
  uint64_t v1 = (void *)_MergedGlobals_153;
  _MergedGlobals_153 = v0;
}

id MKLocalizedStringForUnknownLocation()
{
  if (qword_1EB315E90 != -1) {
    dispatch_once(&qword_1EB315E90, &__block_literal_global_42);
  }
  uint64_t v0 = (void *)qword_1EB315E88;

  return v0;
}

void __MKLocalizedStringForUnknownLocation_block_invoke()
{
  uint64_t v0 = _MKLocalizedStringFromThisBundle(@"Unknown Location");
  uint64_t v1 = (void *)qword_1EB315E88;
  qword_1EB315E88 = v0;
}

id _CreateCoordinateComponentString(int a1, double a2, double a3)
{
  if (a1) {
    a2 = a3;
  }
  id v4 = @"N";
  id v5 = @"E";
  if ((uint64_t)(a2 * 3600.0) < 0)
  {
    id v4 = @"S";
    id v5 = @"W";
  }
  if (a1) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = _MKLocalizedStringFromThisBundle(v6);
  if ((int)(uint64_t)a2 >= 0) {
    uint64_t v8 = (uint64_t)a2;
  }
  else {
    uint64_t v8 = -(uint64_t)a2;
  }
  double v9 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  uint64_t v10 = (uint64_t)v9;
  double v11 = (v9 - (double)(uint64_t)v9) * 60.0;
  id v12 = v7;

  id v13 = v12;
  BOOL v14 = (void *)MEMORY[0x1E4F28EE0];
  double v15 = [NSNumber numberWithInteger:v8];
  double v16 = [v14 localizedStringFromNumber:v15 numberStyle:0];

  double v17 = (void *)MEMORY[0x1E4F28EE0];
  unsigned int v18 = [NSNumber numberWithInteger:v10];
  long long v19 = [v17 localizedStringFromNumber:v18 numberStyle:0];

  double v20 = (void *)MEMORY[0x1E4F28EE0];
  BOOL v21 = [NSNumber numberWithInteger:(uint64_t)v11];
  uint64_t v22 = [v20 localizedStringFromNumber:v21 numberStyle:0];

  id v23 = [NSString alloc];
  uint64_t v24 = _MKLocalizedStringFromThisBundle(@"%1$@°%2$@′%3$@″ %4$@");
  long long v25 = objc_msgSend(v23, "initWithFormat:", v24, v16, v19, v22, v13, 0);

  return v25;
}

unint64_t MKIntegerHash(uint64_t a1)
{
  unint64_t v1 = 265 * (((a1 << 21) - 1) ^ ((unint64_t)((a1 << 21) - 1) >> 24));
  return 2147483649u * ((21 * (v1 ^ (v1 >> 14))) ^ ((21 * (v1 ^ (v1 >> 14))) >> 28));
}

unint64_t MKLongHash(uint64_t a1)
{
  unint64_t v1 = 21 * ((~a1 + (a1 << 18)) ^ ((unint64_t)(~a1 + (a1 << 18)) >> 31));
  return (65 * (v1 ^ (v1 >> 11))) ^ ((65 * (v1 ^ (v1 >> 11))) >> 22);
}

uint64_t initNetworkIOThread()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.__sig = 0;
  *(void *)v3.__opaque = 0;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 0);
  pthread_mutex_init(&stru_1EB315F10, &v3);
  pthread_mutexattr_destroy(&v3);
  pthread_cond_init(&stru_1EB315EE0, 0);
  pthread_mutex_lock(&stru_1EB315F10);
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:objc_opt_class() selector:sel__mapkit_runThread_ object:@"NetworkIO"];
  unint64_t v1 = (void *)qword_1EB315E98;
  qword_1EB315E98 = v0;

  [(id)qword_1EB315E98 start];
  pthread_cond_wait(&stru_1EB315EE0, &stru_1EB315F10);
  return pthread_mutex_unlock(&stru_1EB315F10);
}

void sub_18BC07080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __SecurityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SecurityLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SecurityLibrary()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = SecurityLibraryCore_frameworkLibrary;
  uint64_t v9 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    _OWORD v3[3] = __SecurityLibraryCore_block_invoke;
    v3[4] = &unk_1E54B8598;
    uint64_t v4 = &v6;
    id v5 = v3;
    long long v10 = xmmword_1E54BBA20;
    long long v11 = *(_OWORD *)&off_1E54BBA30;
    v7[3] = _sl_dlopen();
    SecurityLibraryCore_frameworkLibrarCGFloat y = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  unint64_t v1 = v3[0];
  if (!v0)
  {
    unint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18BC0808C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSecTaskCreateFromSelfSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecTaskCreateFromSelf");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCreateFromSelfSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSecTaskCopyValueForEntitlementSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecTaskCopyValueForEntitlement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecTaskCopyValueForEntitlementSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t mk_SecTaskCopyValueForEntitlement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  BOOL v14 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  if (!getSecTaskCopyValueForEntitlementSymbolLoc_ptr)
  {
    double v7 = (void *)SecurityLibrary();
    v12[3] = (uint64_t)dlsym(v7, "SecTaskCopyValueForEntitlement");
    getSecTaskCopyValueForEntitlementSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12[3];
  }
  long long v10 = v6;
  _Block_object_dispose(&v11, 8);
  if (!v10)
  {
    dlerror();
    uint64_t v9 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v9);
  }

  return v10(a1, a2, a3);
}

uint64_t _MKRAPIsAvailable()
{
  if (GEOConfigGetBOOL()) {
    return 0;
  }
  if (!GEOIsBAASupported()) {
    return 0;
  }
  uint64_t v0 = [MEMORY[0x1E4F64B80] primaryICloudAccount];
  if (v0)
  {
    unint64_t v1 = (void *)v0;
    char v2 = [MEMORY[0x1E4F64B80] isCurrentICloudAccountUnderage];

    if (v2) {
      return 0;
    }
  }
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  if [v5 userMode] == 1 || (objc_msgSend(v5, "isEphemeralMultiUser"))
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (qword_1EB315F60 != -1) {
      dispatch_once(&qword_1EB315F60, &__block_literal_global_60);
    }
    if (_MergedGlobals_154)
    {
      BOOL v6 = 0;
    }
    else
    {
      double v7 = objc_msgSend((id)qword_1EB315F58, "aa_primaryAppleAccount");
      byte_1EB315F51 = objc_msgSend(v7, "aa_isManagedAppleID");
      if (v7)
      {
        _MergedGlobals_154 = 1;
      }
      else if (qword_1EB315F68 != -1)
      {
        dispatch_once(&qword_1EB315F68, &__block_literal_global_17);
      }

      BOOL v6 = _MergedGlobals_154 == 0;
    }
    if (byte_1EB315F51) {
      uint64_t v3 = v6;
    }
    else {
      uint64_t v3 = 1;
    }
  }

  return v3;
}

void _MKRAPiCloudAccountChanged(uint64_t a1, unsigned char *a2)
{
  *a2 = 0;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  FrontBoardServicesLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  uint64_t v9 = FrontBoardServicesLibraryCore_frameworkLibrary;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    _OWORD v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &unk_1E54B8598;
    uint64_t v4 = &v6;
    id v5 = v3;
    long long v10 = xmmword_1E54BBA68;
    long long v11 = *(_OWORD *)&off_1E54BBA78;
    v7[3] = _sl_dlopen();
    FrontBoardServicesLibraryCore_frameworkLibrarCGFloat y = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  unint64_t v1 = v3[0];
  if (!v0)
  {
    unint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18BC091A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)FrontBoardServicesLibrary();
  uint64_t result = dlsym(v2, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

id getFBSOpenApplicationOptionKeyPromptUnlockDevice()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  uint64_t v8 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    unint64_t v1 = (void *)FrontBoardServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    uint64_t v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  char v2 = *v0;

  return v2;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SpringBoardServicesLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpringBoardServicesLibrary()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = SpringBoardServicesLibraryCore_frameworkLibrary;
  uint64_t v9 = SpringBoardServicesLibraryCore_frameworkLibrary;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    _OWORD v3[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v3[4] = &unk_1E54B8598;
    uint64_t v4 = &v6;
    uint64_t v5 = v3;
    long long v10 = xmmword_1E54BBA88;
    long long v11 = *(_OWORD *)&off_1E54BBA98;
    v7[3] = _sl_dlopen();
    SpringBoardServicesLibraryCore_frameworkLibrarCGFloat y = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  unint64_t v1 = v3[0];
  if (!v0)
  {
    unint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18BC094FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBSGetScreenLockStatusSymbolLoc_block_invoke(uint64_t a1)
{
  char v2 = (void *)SpringBoardServicesLibrary();
  uint64_t result = dlsym(v2, "SBSGetScreenLockStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBSGetScreenLockStatusSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TelephonyUtilitiesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = TelephonyUtilitiesLibraryCore_frameworkLibrary;
  uint64_t v5 = TelephonyUtilitiesLibraryCore_frameworkLibrary;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    long long v6 = __const__block__paths_18;
    long long v7 = *(_OWORD *)&off_1E54BBAB8;
    _OWORD v3[3] = _sl_dlopen();
    TelephonyUtilitiesLibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18BC0967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  TelephonyUtilitiesLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t TelephonyUtilitiesLibrary()
{
  uint64_t v0 = TelephonyUtilitiesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getTUCallCenterClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  Class result = objc_getClass("TUCallCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTUCallCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (MKSystemController *)abort_report_np();
    return (Class)[(MKSystemController *)v3 isWifiEnabled];
  }
  return result;
}

void sub_18BC0A6C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t _MKIsIOSARMAppOnMac()
{
  return 0;
}

void sub_18BC0B43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PhoneNumbersLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  uint64_t v5 = PhoneNumbersLibraryCore_frameworkLibrary;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E54BBBD8;
    long long v7 = *(_OWORD *)&off_1E54BBBE8;
    _OWORD v3[3] = _sl_dlopen();
    PhoneNumbersLibraryCore_frameworkLibrarCGFloat y = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18BC0C8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PhoneNumbersLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PhoneNumbersLibraryCore_frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v0 = PhoneNumbersLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getCFPhoneNumberCreateSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCFPhoneNumberCreateSymbolLoc_ptr;
  uint64_t v6 = getCFPhoneNumberCreateSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)PhoneNumbersLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CFPhoneNumberCreate");
    getCFPhoneNumberCreateSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18BC0CAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCFPhoneNumberCreateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PhoneNumbersLibrary();
  uint64_t result = dlsym(v2, "CFPhoneNumberCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t mk_CFPhoneNumberCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getCFPhoneNumberCreateSymbolLoc();
  if (SymbolLoc)
  {
    return SymbolLoc(a1, a2, a3);
  }
  else
  {
    dlerror();
    uint64_t v8 = abort_report_np();
    return getCFPhoneNumberCreateStringSymbolLoc(v8);
  }
}

uint64_t getCFPhoneNumberCreateStringSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
  uint64_t v6 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)PhoneNumbersLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CFPhoneNumberCreateString");
    getCFPhoneNumberCreateStringSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18BC0CC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCFPhoneNumberCreateStringSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PhoneNumbersLibrary();
  uint64_t result = dlsym(v2, "CFPhoneNumberCreateString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateStringSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t mk_CFPhoneNumberCreateString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  StringSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getCFPhoneNumberCreateStringSymbolLoc();
  if (StringSymbolLoc)
  {
    return StringSymbolLoc(a1, a2, a3);
  }
  else
  {
    dlerror();
    uint64_t v8 = abort_report_np();
    return +[CLCircularRegion(MKMapItemAdditions) circularRegionFromMapRegion:](v8);
  }
}

void sub_18BC0D9F4(_Unwind_Exception *a1)
{
}

void sub_18BC0DA84(_Unwind_Exception *a1)
{
}

void sub_18BC0DB14(_Unwind_Exception *a1)
{
}

void sub_18BC0DBA4(_Unwind_Exception *a1)
{
}

void sub_18BC0DC34(_Unwind_Exception *a1)
{
}

void sub_18BC0EF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BC123B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BC156AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__617(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__618(uint64_t a1)
{
}

void sub_18BC19BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id -[MKTransitItemIncidentView _blockingImage](MKTransitItemIncidentView *self, SEL a2)
{
  uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 scale];
  float v4 = v3;

  uint64_t v5 = [MEMORY[0x1E4FB3A20] sharedManager];
  uint64_t v6 = [v5 trafficIncidentTypeKey];

  long long v7 = [MEMORY[0x1E4FB3A20] sharedManager];
  *(float *)&double v8 = v4;
  uint64_t v9 = [v7 imageForKey:v6 value:3 contentScale:7 sizeGroup:0 modifiers:v8];

  if (v9 && (CGImageRef v10 = CGImageRetain((CGImageRef)[v9 image])) != 0)
  {
    long long v11 = v10;
    uint64_t v12 = (void *)MEMORY[0x1E4F42A80];
    [v9 contentScale];
    BOOL v14 = [v12 imageWithCGImage:v11 scale:0 orientation:v13];
    CGImageRelease(v11);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void sub_18BC1BB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MKGetMKMapCameraLog()
{
  if (qword_1EB316010 != -1) {
    dispatch_once(&qword_1EB316010, &__block_literal_global_132);
  }
  uint64_t v0 = (void *)_MergedGlobals_157;

  return v0;
}

void __MKGetMKMapCameraLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKMapCamera");
  uint64_t v1 = (void *)_MergedGlobals_157;
  _MergedGlobals_157 = (uint64_t)v0;
}

void sub_18BC1E864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BC253CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BC254FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BC25B20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18BC25C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MKIsHostedInSiri()
{
  return objc_msgSend(MEMORY[0x1E4F28B50], "_navigation_isRunningInSiri");
}

void sub_18BC29680(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_18BC2A244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MKGetMKRemoteUILog_0()
{
  if (qword_1E9154170 != -1) {
    dispatch_once(&qword_1E9154170, &__block_literal_global_104);
  }
  os_log_t v0 = (void *)_MergedGlobals_1_8;

  return v0;
}

void sub_18BC2A68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __MKGetMKRemoteUILog_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKRemoteUI");
  uint64_t v1 = (void *)_MergedGlobals_1_8;
  _MergedGlobals_1_8 = (uint64_t)v0;
}

void sub_18BC2F3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC2F470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BC2F6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_18BC2F88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BC2FB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC2FCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BC2FD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18BC2FE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float v13 = v12;

  _Unwind_Resume(a1);
}

void sub_18BC2FFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_18BC30134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BC301C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BC30314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC30520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MKCGRectFittingImageWithinSize(void *a1, double a2, double a3)
{
  [a1 size];
  double v7 = v6;
  double v8 = v5;
  BOOL v9 = v5 > a3;
  for (BOOL i = v6 > a2; v7 > a2 || v8 > a3; BOOL i = v7 > a2)
  {
    if (i)
    {
      double v8 = a2 * (v8 / v7);
      double v7 = a2;
    }
    else if (v9)
    {
      double v7 = a3 * (v7 / v8);
      double v8 = a3;
    }
    BOOL v9 = v8 > a3;
  }
  return (a2 - v7) * 0.5;
}

id MKManeuverArrowImage(int a1, int a2, double *a3, void *a4, void *a5, double *a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a5;
  long long v19 = v18;
  double v20 = 0;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 11:
    case 12:
    case 16:
    case 17:
    case 18:
    case 20:
    case 21:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 33:
    case 34:
    case 35:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 88:
      double v21 = a3[1];
      double v22 = a3[2];
      char v105 = 0;
      id v103 = 0;
      id v104 = 0;
      id v101 = 0;
      id v102 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKManeuverArrowPaths(a1, a2, (double *)__dst, a6, &v104, &v103, &v102, &v101, &v105);
      id v23 = v104;
      id v24 = v103;
      id v25 = v102;
      id v26 = v101;
      if ([v25 count] || v23 && (objc_msgSend(v23, "isEmpty") & 1) == 0)
      {
        double v88 = v22;
        double v89 = v21;
        id v90 = v26;
        long long v27 = v19;
        id v28 = v17;
        double v29 = *MEMORY[0x1E4F1DAD8];
        double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v31 = a7;
        v111.double width = a7;
        double v32 = a8;
        v111.double height = a8;
        UIGraphicsBeginImageContextWithOptions(v111, 0, a9);
        CurrentContext = UIGraphicsGetCurrentContext();
        [v23 bounds];
        double x = v34;
        double y = v36;
        double width = v38;
        double height = v40;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id v91 = v25;
        id v42 = v25;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v97 objects:v107 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v98;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v98 != v45) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v97 + 1) + 8 * i) bounds];
              v118.origin.double x = v47;
              v118.origin.double y = v48;
              v118.size.double width = v49;
              v118.size.double height = v50;
              v113.origin.double x = x;
              v113.origin.double y = y;
              v113.size.double width = width;
              v113.size.double height = height;
              CGRect v114 = CGRectUnion(v113, v118);
              double x = v114.origin.x;
              double y = v114.origin.y;
              double width = v114.size.width;
              double height = v114.size.height;
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v97 objects:v107 count:16];
          }
          while (v44);
        }

        memset(__dst, 0, 48);
        _transformForFrames((CGAffineTransform *)__dst, v29, v30, v89, v88, x, y, width, height, v31, v32);
        if (a6)
        {
          *(float64x2_t *)a6 = vaddq_f64(*(float64x2_t *)&__dst[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&__dst[16], a6[1]), *(float64x2_t *)__dst, *a6));
          if (!v105)
          {
            v115.origin.double x = 0.0;
            v115.origin.double y = 0.0;
            v115.size.double width = v31;
            v115.size.double height = v32;
            a6[1] = CGRectGetMidY(v115);
          }
        }
        CGAffineTransform transform = *(CGAffineTransform *)__dst;
        CGContextConcatCTM(CurrentContext, &transform);
        id v17 = v28;
        long long v19 = v27;
        if (v24)
        {
          int v51 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 0.0, v31, v32);
          [v51 appendPath:v23];
          [v51 setUsesEvenOddFillRule:1];
          CGContextSaveGState(CurrentContext);
          [v51 addClip];
          [v27 set];
          [v24 fill];
          CGContextRestoreGState(CurrentContext);
        }
        [v17 set];
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v52 = v42;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:v106 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v54; ++j)
            {
              if (*(void *)v93 != v55) {
                objc_enumerationMutation(v52);
              }
              [*(id *)(*((void *)&v92 + 1) + 8 * j) fill];
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v92 objects:v106 count:16];
          }
          while (v54);
        }

        [v23 fill];
        double v20 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        id v26 = v90;
        id v25 = v91;
      }
      else
      {
        double v20 = 0;
      }

      goto LABEL_27;
    case 22:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      id v58 = v18;
      uint64_t v59 = 310002;
      int v60 = *(unsigned __int8 *)a3;
      id v61 = v17;
      id v62 = v61;
      switch(a1)
      {
        case 'P':
          goto LABEL_54;
        case 'Q':
          uint64_t v59 = 310003;
          goto LABEL_54;
        case 'R':
          int BOOL = GEOConfigGetBOOL();
          if (v60) {
            unsigned int v64 = 327633261;
          }
          else {
            unsigned int v64 = 603924167;
          }
          if (BOOL) {
            uint64_t v59 = v64;
          }
          else {
            uint64_t v59 = 101625;
          }
          goto LABEL_54;
        case 'S':
          int v65 = GEOConfigGetBOOL();
          if (v60) {
            unsigned int v66 = 146083830;
          }
          else {
            unsigned int v66 = 179594842;
          }
          if (v65) {
            uint64_t v59 = v66;
          }
          else {
            uint64_t v59 = 101626;
          }
          goto LABEL_54;
        case 'T':
          int v67 = GEOConfigGetBOOL();
          if (v60) {
            unsigned int v68 = 830247085;
          }
          else {
            unsigned int v68 = 316321895;
          }
          if (v67) {
            uint64_t v59 = v68;
          }
          else {
            uint64_t v59 = 101627;
          }
          goto LABEL_54;
        default:
          if (a1 != 22)
          {
            double v20 = 0;
            long long v19 = v58;
            id v25 = v61;
            goto LABEL_28;
          }
          uint64_t v59 = 310004;
LABEL_54:
          double v69 = [MEMORY[0x1E4FB3A20] sharedManager];
          *(float *)&double v70 = a9;
          id v23 = [v69 imageForDataID:v59 text:0 contentScale:4 sizeGroup:0 modifiers:v70];

          if (v23)
          {
            char v71 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", objc_msgSend(v23, "image"));
            MKCGRectFittingImageWithinSize(v71, a7, a8);
            CGFloat v73 = v72;
            CGFloat v75 = v74;
            CGFloat v76 = *MEMORY[0x1E4F1DAD8];
            CGFloat v77 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
            v112.double width = v72;
            v112.double height = v74;
            UIGraphicsBeginImageContextWithOptions(v112, 0, 0.0);
            char v78 = UIGraphicsGetCurrentContext();
            CGContextSetInterpolationQuality(v78, kCGInterpolationHigh);
            id v25 = v62;
            [v62 setFill];
            CGContextTranslateCTM(v78, 0.0, v75);
            CGContextScaleCTM(v78, 1.0, -1.0);
            id v79 = v71;
            char v80 = (CGImage *)[v79 CGImage];
            v116.origin.double x = v76;
            v116.origin.double y = v77;
            v116.size.double width = v73;
            v116.size.double height = v75;
            CGContextClipToMask(v78, v116, v80);
            v117.origin.double x = v76;
            v117.origin.double y = v77;
            v117.size.double width = v73;
            v117.size.double height = v75;
            CGContextFillRect(v78, v117);
            char v81 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            id v82 = v81;
            double v83 = v82;
            double v20 = v82;
            if (a2 == 1)
            {
              uint64_t v84 = (void *)MEMORY[0x1E4F42A80];
              id v85 = v82;
              uint64_t v86 = [v85 CGImage];
              [v85 scale];
              double v20 = objc_msgSend(v84, "imageWithCGImage:scale:orientation:", v86, 4);
            }
          }
          else
          {
            uint64_t v87 = MKGetMKDefaultLog();
            id v25 = v62;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__dst = 134217984;
              *(void *)&__dst[4] = v59;
              _os_log_impl(&dword_18BAEC000, v87, OS_LOG_TYPE_ERROR, "Could not find icon image for id: %lu", __dst, 0xCu);
            }

            double v20 = 0;
          }
          long long v19 = v58;
          break;
      }
LABEL_27:

LABEL_28:
      break;
    default:
      break;
  }

  return v20;
}

void MKManeuverArrowPaths(int a1, int a2, double *a3, double *a4, void *a5, void *a6, void *a7, void *a8, char *a9)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  double v14 = a3[1];
  double v13 = a3[2];
  double v15 = [MEMORY[0x1E4F427D0] bezierPath];
  double v16 = v15;
  char v17 = 0;
  id v18 = 0;
  double v20 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v21 = 0;
  id v22 = 0;
  switch(a1)
  {
    case 0:
    case 7:
    case 17:
    case 22:
    case 24:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
      goto LABEL_30;
    case 1:
    case 27:
    case 60:
      id v82 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendLeftTurnToPathInRect(v16, __dst, v20, v19, v14, v13, 0, &v82);
      id v23 = v82;
      goto LABEL_11;
    case 2:
    case 28:
    case 61:
      char v81 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendRightTurnToPathInRect(v16, (double *)__dst, 0, &v81, v20, v19, v14, v13);
      id v23 = v81;
      goto LABEL_11;
    case 3:
    case 5:
    case 6:
    case 12:
    case 23:
    case 64:
      double v83 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendStraightArrowToPathInRect(v16, (double *)__dst, &v83, v20, v19, v14, v13);
      id v23 = v83;
      goto LABEL_11;
    case 4:
    case 25:
    case 26:
    case 35:
    case 88:
      char v78 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendUTurnToPathInRect(v16, a2, (double *)__dst, &v78, v20, v19, v14, v13);
      id v23 = v78;
      goto LABEL_11;
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 19:
    case 31:
    case 32:
    case 36:
    case 37:
    case 38:
    case 40:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
      goto LABEL_13;
    case 11:
      if (a2)
      {
        CGFloat v74 = 0;
        memcpy(__dst, a3, sizeof(__dst));
        MKArrowAppendMergeLeftToPathInRect(v16, __dst, &v74, v20, v19, v14, v13);
        id v23 = v74;
      }
      else
      {
        CGFloat v75 = 0;
        memcpy(__dst, a3, sizeof(__dst));
        MKArrowAppendMergeRightToPathInRect(v16, (double *)__dst, &v75, v20, v19, v14, v13);
        id v23 = v75;
      }
      goto LABEL_11;
    case 16:
    case 18:
    case 33:
    case 34:
    case 39:
      id v72 = v15;
      id v73 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      _D8 = MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(&v73, &v72, (uint64_t)__dst, 0, v14, v13);
      double v26 = v25;
      id v22 = v73;
      id v27 = v72;

      long long v28 = *MEMORY[0x1E4F1DAB8];
      long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      if (a1 == 34)
      {
        CGFloat v34 = 1.57079633;
      }
      else
      {
        long long v31 = *MEMORY[0x1E4F1DAB8];
        long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        if (a1 != 33) {
          goto LABEL_33;
        }
        CGFloat v34 = -1.57079633;
      }
      long long v63 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v65 = *MEMORY[0x1E4F1DAB8];
      long long v61 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformMakeRotation((CGAffineTransform *)__dst, v34);
      long long v30 = v61;
      long long v29 = v63;
      long long v28 = v65;
      long long v31 = *(_OWORD *)__dst;
      long long v32 = *(_OWORD *)&__dst[16];
      long long v33 = *(_OWORD *)&__dst[32];
LABEL_33:
      long long v64 = v32;
      long long v66 = v31;
      *(_OWORD *)__dst = v31;
      *(_OWORD *)&__dst[16] = v32;
      long long v62 = v33;
      *(_OWORD *)&__dst[32] = v33;
      *(_OWORD *)&t2.a = v28;
      *(_OWORD *)&t2.c = v29;
      *(_OWORD *)&t2.tCGFloat x = v30;
      if (!CGAffineTransformEqualToTransform((CGAffineTransform *)__dst, &t2))
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v44 = v22;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v85 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v68 != v47) {
                objc_enumerationMutation(v44);
              }
              CGFloat v49 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              *(_OWORD *)__dst = v66;
              *(_OWORD *)&__dst[16] = v64;
              *(_OWORD *)&__dst[32] = v62;
              [v49 applyTransform:__dst];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v67 objects:v85 count:16];
          }
          while (v46);
        }

        *(_OWORD *)__dst = v66;
        *(_OWORD *)&__dst[16] = v64;
        *(_OWORD *)&__dst[32] = v62;
        [v27 applyTransform:__dst];
      }
      if (!a4)
      {
        double v21 = 0;
        char v17 = 0;
        id v18 = 0;
        goto LABEL_18;
      }
      id v18 = 0;
      double v21 = 0;
      _V2.D[1] = *((void *)&v66 + 1);
      __asm { FMLA            D1, D8, V2.D[1] }
      *a4 = *(double *)&v62 + vmlad_n_f64(v26 * *(double *)&v64, _D8, *(double *)&v66);
      a4[1] = *((double *)&v62 + 1) + _D1;
      char v17 = 1;
      double v16 = v27;
LABEL_13:
      if (!a4)
      {
        id v27 = v16;
LABEL_18:
        double v36 = a7;
        char v35 = a8;
        char v37 = a6;
        goto LABEL_19;
      }
      double v36 = a7;
      char v35 = a8;
      char v37 = a6;
      if (!v22)
      {
        id v18 = v18;
        BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[v18 CGPath]);
        CGFloat x = BoundingBox.origin.x;
        CGFloat y = BoundingBox.origin.y;
        CGFloat width = BoundingBox.size.width;
        CGFloat height = BoundingBox.size.height;
        CGFloat MidX = CGRectGetMidX(BoundingBox);
        v88.origin.CGFloat x = x;
        v88.origin.CGFloat y = y;
        v88.size.CGFloat width = width;
        v88.size.CGFloat height = height;
        CGFloat MidY = CGRectGetMidY(v88);
        *a4 = MidX;
        a4[1] = MidY;
      }
      id v27 = v16;
LABEL_19:
      if (a5) {
        *a5 = v27;
      }
      if (v37) {
        *char v37 = v21;
      }
      if (v36) {
        void *v36 = v22;
      }
      if (v35) {
        void *v35 = v18;
      }
      if (a9) {
        *a9 = v17;
      }
      double v16 = v27;
LABEL_30:

      return;
    case 20:
    case 62:
    case 65:
      char v80 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendMergeLeftToPathInRect(v16, __dst, &v80, v20, v19, v14, v13);
      id v23 = v80;
      goto LABEL_11;
    case 21:
    case 63:
    case 66:
      id v79 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendMergeRightToPathInRect(v16, (double *)__dst, &v79, v20, v19, v14, v13);
      id v23 = v79;
LABEL_11:
      id v18 = v23;
      char v17 = 0;
      double v21 = 0;
      goto LABEL_12;
    case 29:
      double v21 = [MEMORY[0x1E4F427D0] bezierPath];
      CGFloat v76 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendExitRoadLeftToPathInRect(v16, v21, __dst, &v76, v20, v19, v14, v13);
      int v56 = v76;
      goto LABEL_49;
    case 30:
      double v21 = [MEMORY[0x1E4F427D0] bezierPath];
      CGFloat v77 = 0;
      memcpy(__dst, a3, sizeof(__dst));
      MKArrowAppendExitRoadRightToPathInRect(v16, v21, __dst, &v77, v20, v19, v14, v13);
      int v56 = v77;
LABEL_49:
      id v18 = v56;
      char v17 = 0;
LABEL_12:
      id v22 = 0;
      goto LABEL_13;
    default:
      double v21 = 0;
      id v22 = 0;
      goto LABEL_13;
  }
}

CGFloat _transformForFrames(CGAffineTransform *retstr, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v23 = 1.0;
  double v24 = a4 / a8;
  if (a4 / a8 >= a5 / a9) {
    double v24 = a5 / a9;
  }
  if (a8 > a4 || a9 > a5) {
    double v23 = v24;
  }
  double v26 = a10 / a4;
  if (a10 / a4 >= a11 / a5) {
    double v26 = a11 / a5;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, v26 * v23, v26 * v23);
  long long v27 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v31.c = v27;
  *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformInvert(&v32, &v31);
  v33.origin.CGFloat x = 0.0;
  v33.origin.CGFloat y = 0.0;
  v33.size.CGFloat width = a10;
  v33.size.CGFloat height = a11;
  CGRect v34 = CGRectApplyAffineTransform(v33, &v32);
  v34.origin.CGFloat y = v34.origin.y + (v34.size.height - a9) * 0.5 - a7;
  *(_OWORD *)&v34.size.CGFloat height = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v30.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v30.c = *(_OWORD *)&v34.size.height;
  *(_OWORD *)&v30.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v31, &v30, v34.origin.x + (v34.size.width - a8) * 0.5 - a6, v34.origin.y);
  long long v28 = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v31.a;
  *(_OWORD *)&retstr->c = v28;
  CGFloat result = v31.tx;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v31.tx;
  return result;
}

id MKJunctionArrowImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, void *a7, void *a8, CGFloat a9, CGFloat a10, CGFloat a11, double *a12)
{
  id v22 = a7;
  id v23 = a8;
  double v24 = [[MKJunction alloc] initWithType:a1 maneuver:a2 drivingSide:a3 elements:a4 count:a5];
  if (v24)
  {
    id v59 = 0;
    id v60 = 0;
    id v58 = 0;
    double v25 = a6[5];
    if (v25 > 0.0) {
      double v26 = &v57;
    }
    else {
      double v26 = 0;
    }
    if (v25 > 0.0) {
      id v57 = 0;
    }
    double v27 = a6[1];
    double v28 = a6[2];
    memcpy(__dst, a6, sizeof(__dst));
    -[MKJunction getArrowPath:arrowStrokePath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:](v24, "getArrowPath:arrowStrokePath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:", &v60, &v59, &v58, v26, __dst, a3, v27, v28, a12);
    id v29 = v60;
    id v30 = v59;
    id v31 = v58;
    if (v25 > 0.0) {
      id v32 = v57;
    }
    else {
      id v32 = 0;
    }
    double v34 = *MEMORY[0x1E4F1DAD8];
    double v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v53 = a6[2];
    double v54 = a6[1];
    double v36 = a9;
    v62.double width = a9;
    double v37 = a10;
    v62.double height = a10;
    UIGraphicsBeginImageContextWithOptions(v62, 0, a11);
    CurrentContext = UIGraphicsGetCurrentContext();
    [v29 bounds];
    double x = v39;
    double y = v41;
    double width = v43;
    double height = v45;
    if (v31)
    {
      [v31 bounds];
      v66.origin.double x = v47;
      v66.origin.double y = v48;
      v66.size.double width = v49;
      v66.size.double height = v50;
      v63.origin.double x = x;
      v63.origin.double y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      CGRect v64 = CGRectUnion(v63, v66);
      double x = v64.origin.x;
      double y = v64.origin.y;
      double width = v64.size.width;
      double height = v64.size.height;
    }
    memset(__dst, 0, 48);
    _transformForFrames((CGAffineTransform *)__dst, v34, v35, v54, v53, x, y, width, height, v36, v37);
    if (a12)
    {
      *(float64x2_t *)a12 = vaddq_f64(*(float64x2_t *)&__dst[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&__dst[16], a12[1]), *(float64x2_t *)__dst, *a12));
      if ([(MKJunction *)v24 type] != 1)
      {
        v65.origin.double x = v34;
        v65.origin.double y = v35;
        v65.size.double width = v36;
        v65.size.double height = v37;
        a12[1] = CGRectGetMidY(v65);
      }
    }
    CGAffineTransform transform = *(CGAffineTransform *)__dst;
    CGContextConcatCTM(CurrentContext, &transform);
    if (v31)
    {
      int v51 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v34, v35, v54, v53);
      [v51 appendPath:v29];
      [v51 setUsesEvenOddFillRule:1];
      CGContextSaveGState(CurrentContext);
      [v51 addClip];
      [v23 set];
      [v31 fill];
      CGContextRestoreGState(CurrentContext);
    }
    [v22 set];
    [v29 fill];
    CGRect v33 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    CGRect v33 = 0;
  }

  return v33;
}

uint64_t annotatedItemListIsValidWithDisplayStyle(void *a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if ([v3 annotatedItemStyle])
  {
    if (a2 == 2)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      BOOL v9 = objc_msgSend(v3, "textItemContainer", 0);
      double v5 = [v9 textItems];

      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v6)
      {
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v5);
            }
            uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) primaryText];
            uint64_t v13 = [v12 length];

            if (v13)
            {

              double v14 = [v3 textItemContainer];
              double v5 = [v14 displayConfig];

              if ([v5 maxRowCount]) {
                uint64_t v6 = [v5 maxItemsPerRow] != 0;
              }
              else {
                uint64_t v6 = 0;
              }
              goto LABEL_27;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      goto LABEL_27;
    }
    if (a2 == 1)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      float v4 = [v3 pictureItemContainer];
      double v5 = [v4 pictureItems];

      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v21;
        while (2)
        {
          for (uint64_t j = 0; j != v6; ++j)
          {
            if (*(void *)v21 != v7) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v20 + 1) + 8 * j) pictureItemPhotoType])
            {
              uint64_t v6 = 1;
              goto LABEL_27;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  uint64_t v6 = 0;
LABEL_28:

  return v6;
}

uint64_t displayStyleForAnnotatedItemList(void *a1, int a2)
{
  id v3 = a1;
  int BOOL = GEOConfigGetBOOL();
  uint64_t v5 = 2;
  int IsValidWithDisplayStyle = annotatedItemListIsValidWithDisplayStyle(v3, 2);
  int v7 = IsValidWithDisplayStyle;
  if (!BOOL || (IsValidWithDisplayStyle & 1) == 0)
  {
    if (!a2 || (uint64_t v5 = 1, (annotatedItemListIsValidWithDisplayStyle(v3, 1) & 1) == 0))
    {
      if (v7) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 0;
      }
    }
  }

  return v5;
}

_MKMapItemAttribution *mkAttributionForAnnotatedList(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [_MKMapItemAttribution alloc];
  id v3 = [v1 attribution];

  float v4 = [(_MKMapItemAttribution *)v2 initWithGEOMapItemAttribution:v3];

  return v4;
}

void sub_18BC38ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

id _MKTransitIncidentImage(void *a1)
{
  if (a1)
  {
    a1 = _MKTransitIncidentImageForType([a1 iconType]);
    uint64_t v1 = vars8;
  }
  return a1;
}

id _MKTransitIncidentImageForType(unsigned int a1)
{
  if (a1 > 2)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = off_1E54BC5A8[a1];
    id v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 scale];
    float v5 = v4;

    uint64_t v6 = [MEMORY[0x1E4FB3A20] sharedManager];
    *(float *)&double v7 = v5;
    double v8 = [v6 imageForName:v2 contentScale:8 sizeGroup:0 modifiers:v7];

    uint64_t v9 = [v8 image];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F42A80] imageWithCGImage:v9 scale:0 orientation:v5];

      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (a1 <= 2) {
    uint64_t v2 = off_1E54BC5C0[a1];
  }
  long long v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Maps"];
  uint64_t v10 = [MEMORY[0x1E4F42A80] imageNamed:v2 inBundle:v11];

LABEL_10:

  return v10;
}

id MKTransitIncidentIcon()
{
  return +[MKIconManager imageForTrafficIncidentType:size:forScale:](MKIconManager, "imageForTrafficIncidentType:size:forScale:", 4, 0);
}

id MKGetMKMapItemViewLog()
{
  if (qword_1EB315AD8 != -1) {
    dispatch_once(&qword_1EB315AD8, &__block_literal_global_214_0);
  }
  os_log_t v0 = (void *)_MergedGlobals_3_3;

  return v0;
}

id _MKDebugNameForMapItem(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 name];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    uint64_t v4 = [v1 name];
  }
  else
  {
    float v5 = [v1 _addressFormattedAsSinglelineAddress];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      [v1 _addressFormattedAsSinglelineAddress];
    }
    else
    {
      [v1 _coordinate];
      [NSString stringWithFormat:@"%+.8f, %+.8f", v7, v8];
    uint64_t v4 = };
  }
  uint64_t v9 = (void *)v4;

  return v9;
}

void sub_18BC3A940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BC3ADF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BC3B484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_18BC3CA64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void __MKGetMKMapItemViewLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKMapItemView");
  id v1 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = (uint64_t)v0;
}

double searchNextRequestInterval()
{
  if (qword_1EB316068 != -1) {
    dispatch_once(&qword_1EB316068, &__block_literal_global_435);
  }
  os_log_t v0 = [MEMORY[0x1E4F64790] sharedNetworkObserver];
  int v1 = [v0 isCellConnection];
  uint64_t v2 = 3;
  if (v1) {
    uint64_t v2 = 2;
  }
  double v3 = *(double *)&_MergedGlobals_161[v2];

  return v3;
}

uint64_t __searchReplaceRequestInterval_block_invoke()
{
  uint64_t result = GEOConfigGetDouble();
  _MergedGlobals_161[0] = v1;
  return result;
}

double __searchNextRequestInterval_block_invoke()
{
  GEOConfigGetDouble();
  qword_1EB316058 = fmin(fmax(v0, 0.01), 5.0);
  GEOConfigGetDouble();
  double result = fmin(fmax(v1, 0.01), 5.0);
  qword_1EB316060 = *(void *)&result;
  return result;
}

uint64_t _MKPuckAnnotationViewInnerStaleColor()
{
  return [MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_75];
}

void sub_18BC66B10(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_18BC674EC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t v9 = (uint64_t *)result;
  while (2)
  {
    uint64_t v10 = a2 - 1;
    long long v11 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v9 = v11;
          uint64_t v12 = (char *)a2 - (char *)v11;
          unint64_t v13 = a2 - v11;
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                uint64_t v69 = *(a2 - 1);
                double v70 = *(double *)(v69 + 664);
                uint64_t v71 = *v11;
                double v72 = *(double *)(*v11 + 664);
                if (v70 < v72 || (v69 < v71 ? (BOOL v73 = v70 == v72) : (BOOL v73 = 0), v73))
                {
                  *long long v11 = v69;
                  *(a2 - 1) = v71;
                }
                break;
              case 3uLL:
                double result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v11, v11 + 1, a2 - 1);
                break;
              case 4uLL:
                double result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v11, v11 + 1, v11 + 2, a2 - 1);
                break;
              case 5uLL:
                double result = (uint64_t)std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 191)
          {
            CGFloat v74 = v11 + 1;
            BOOL v76 = v11 == a2 || v74 == a2;
            if (a4)
            {
              if (!v76)
              {
                uint64_t v77 = 0;
                char v78 = v11;
                do
                {
                  id v79 = v74;
                  uint64_t v81 = *v78;
                  uint64_t v80 = v78[1];
                  double v82 = *(double *)(v80 + 664);
                  double v83 = *(double *)(*v78 + 664);
                  if (v82 < v83 || (v80 < v81 ? (BOOL v84 = v82 == v83) : (BOOL v84 = 0), v84))
                  {
                    v78[1] = v81;
                    id v85 = v11;
                    if (v78 != v11)
                    {
                      uint64_t v86 = v77;
                      do
                      {
                        double v87 = *(double *)(v80 + 664);
                        uint64_t v88 = *(uint64_t *)((char *)v11 + v86 - 8);
                        double v89 = *(double *)(v88 + 664);
                        if (v87 >= v89 && (v80 >= v88 || v87 != v89))
                        {
                          id v85 = (uint64_t *)((char *)v11 + v86);
                          goto LABEL_155;
                        }
                        *(uint64_t *)((char *)v11 + v86) = v88;
                        v86 -= 8;
                      }
                      while (v86);
                      id v85 = v11;
                    }
LABEL_155:
                    uint64_t *v85 = v80;
                  }
                  CGFloat v74 = v79 + 1;
                  v77 += 8;
                  char v78 = v79;
                }
                while (v79 + 1 != a2);
              }
            }
            else if (!v76)
            {
              do
              {
                int v142 = v74;
                uint64_t v144 = *v9;
                uint64_t v143 = v9[1];
                double v145 = *(double *)(v143 + 664);
                double v146 = *(double *)(*v9 + 664);
                if (v145 < v146 || (v143 < v144 ? (BOOL v147 = v145 == v146) : (BOOL v147 = 0), v147))
                {
                  do
                  {
                    do
                    {
                      id v148 = v9;
                      uint64_t v149 = v144;
                      uint64_t v150 = *--v9;
                      uint64_t v144 = v150;
                      void v9[2] = v149;
                      double v151 = *(double *)(v143 + 664);
                      double v152 = *(double *)(v150 + 664);
                    }
                    while (v151 < v152);
                  }
                  while (v143 < v144 && v151 == v152);
                  *id v148 = v143;
                }
                CGFloat v74 = v142 + 1;
                uint64_t v9 = v142;
              }
              while (v142 + 1 != a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v11 != a2)
            {
              int64_t v91 = (v13 - 2) >> 1;
              int64_t v92 = v91;
              do
              {
                int64_t v93 = v92;
                if (v91 >= v92)
                {
                  uint64_t v94 = (2 * v92) | 1;
                  long long v95 = &v11[v94];
                  if (2 * v92 + 2 < (uint64_t)v13)
                  {
                    uint64_t v96 = v95[1];
                    double v97 = *(double *)(*v95 + 664);
                    double v98 = *(double *)(v96 + 664);
                    if (v97 < v98 || (*v95 < v96 ? (BOOL v99 = v97 == v98) : (BOOL v99 = 0), v99))
                    {
                      ++v95;
                      uint64_t v94 = 2 * v92 + 2;
                    }
                  }
                  long long v100 = &v11[v92];
                  double result = *v95;
                  double v101 = *(double *)(*v95 + 664);
                  uint64_t v102 = *v100;
                  double v103 = *(double *)(*v100 + 664);
                  if (v101 >= v103 && (result >= v102 || v101 != v103))
                  {
                    do
                    {
                      uint64_t *v100 = result;
                      long long v100 = v95;
                      if (v91 < v94) {
                        break;
                      }
                      uint64_t v105 = 2 * v94;
                      uint64_t v94 = (2 * v94) | 1;
                      long long v95 = &v11[v94];
                      uint64_t v106 = v105 + 2;
                      if (v106 < (uint64_t)v13)
                      {
                        uint64_t v107 = v95[1];
                        double v108 = *(double *)(*v95 + 664);
                        double v109 = *(double *)(v107 + 664);
                        if (v108 < v109 || (*v95 < v107 ? (BOOL v110 = v108 == v109) : (BOOL v110 = 0), v110))
                        {
                          ++v95;
                          uint64_t v94 = v106;
                        }
                      }
                      double result = *v95;
                      double v111 = *(double *)(*v95 + 664);
                      double v112 = *(double *)(v102 + 664);
                      if (v111 < v112) {
                        break;
                      }
                    }
                    while (result >= v102 || v111 != v112);
                    uint64_t *v100 = v102;
                  }
                }
                --v92;
              }
              while (v93);
              uint64_t v114 = (unint64_t)v12 >> 3;
              do
              {
                uint64_t v115 = 0;
                uint64_t v116 = *v11;
                uint64_t v117 = v114 - 2;
                if (v114 < 2) {
                  uint64_t v117 = v114 - 1;
                }
                uint64_t v118 = v117 >> 1;
                uint64_t v119 = v11;
                do
                {
                  v120 = v119;
                  v119 += v115 + 1;
                  uint64_t v121 = 2 * v115;
                  uint64_t v115 = (2 * v115) | 1;
                  uint64_t v122 = v121 + 2;
                  if (v122 < v114)
                  {
                    uint64_t v123 = v119[1];
                    double result = *v119;
                    double v124 = *(double *)(*v119 + 664);
                    double v125 = *(double *)(v123 + 664);
                    if (v124 < v125 || (result < v123 ? (BOOL v126 = v124 == v125) : (BOOL v126 = 0), v126))
                    {
                      ++v119;
                      uint64_t v115 = v122;
                    }
                  }
                  uint64_t *v120 = *v119;
                }
                while (v115 <= v118);
                if (v119 == --a2)
                {
                  *uint64_t v119 = v116;
                }
                else
                {
                  *uint64_t v119 = *a2;
                  *a2 = v116;
                  uint64_t v127 = (char *)v119 - (char *)v11 + 8;
                  if (v127 >= 9)
                  {
                    unint64_t v128 = ((unint64_t)v127 >> 3) - 2;
                    unint64_t v129 = v128 >> 1;
                    unint64_t v130 = &v11[v128 >> 1];
                    uint64_t v131 = *v130;
                    double v132 = *(double *)(*v130 + 664);
                    uint64_t v133 = *v119;
                    double v134 = *(double *)(*v119 + 664);
                    if (v132 < v134 || (v131 < v133 ? (BOOL v135 = v132 == v134) : (BOOL v135 = 0), v135))
                    {
                      *uint64_t v119 = v131;
                      if (v128 >= 2)
                      {
                        while (1)
                        {
                          unint64_t v137 = v129 - 1;
                          unint64_t v129 = (v129 - 1) >> 1;
                          int v136 = &v11[v129];
                          uint64_t v138 = *v136;
                          double result = *v136 + 656;
                          double v139 = *(double *)(*v136 + 664);
                          double v140 = *(double *)(v133 + 664);
                          if (v139 >= v140 && (v138 >= v133 || v139 != v140)) {
                            break;
                          }
                          *unint64_t v130 = v138;
                          unint64_t v130 = &v11[v129];
                          if (v137 <= 1) {
                            goto LABEL_222;
                          }
                        }
                      }
                      int v136 = v130;
LABEL_222:
                      *int v136 = v133;
                    }
                  }
                }
                BOOL v53 = v114-- <= 2;
              }
              while (!v53);
            }
            return result;
          }
          unint64_t v14 = v13 >> 1;
          double v15 = &v11[v13 >> 1];
          if ((unint64_t)v12 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9, &v9[v13 >> 1], a2 - 1);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9 + 1, v15 - 1, a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9 + 2, &v9[v14 + 1], a2 - 3);
            double result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v15 - 1, v15, &v9[v14 + 1]);
            uint64_t v16 = *v9;
            uint64_t *v9 = *v15;
            uint64_t *v15 = v16;
          }
          else
          {
            double result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(&v9[v13 >> 1], v9, a2 - 1);
          }
          --a3;
          uint64_t v17 = *v9;
          if (a4) {
            break;
          }
          uint64_t v19 = *(v9 - 1);
          double v20 = *(double *)(v19 + 664);
          double v18 = *(double *)(v17 + 664);
          if (v20 < v18 || v19 < v17 && v20 == v18) {
            goto LABEL_15;
          }
          uint64_t v46 = *v10;
          double v47 = *(double *)(*v10 + 664);
          if (v18 < v47 || v17 < v46 && v18 == v47)
          {
            CGFloat v48 = v9 + 1;
            do
            {
              long long v11 = v48;
              uint64_t v49 = *v48;
              double v50 = *(double *)(*v48 + 664);
              if (v18 < v50) {
                break;
              }
              ++v48;
            }
            while (v17 >= v49 || v18 != v50);
          }
          else
          {
            CGRect v65 = v9 + 1;
            do
            {
              long long v11 = v65;
              if (v65 >= a2) {
                break;
              }
              uint64_t v66 = *v65;
              double v67 = *(double *)(*v65 + 664);
              if (v18 < v67) {
                break;
              }
              ++v65;
            }
            while (v17 >= v66 || v18 != v67);
          }
          uint64_t i = a2;
          if (v11 < a2)
          {
            for (uint64_t i = a2 - 1; ; --i)
            {
              if (v18 >= v47)
              {
                BOOL v53 = v18 == v47 && v17 < v46;
                if (!v53) {
                  break;
                }
              }
              uint64_t v54 = *(i - 1);
              uint64_t v46 = v54;
              double v47 = *(double *)(v54 + 664);
            }
          }
          if (v11 < i)
          {
            uint64_t v55 = *v11;
            uint64_t v56 = *i;
            do
            {
              *long long v11 = v56;
              *uint64_t i = v55;
              double v57 = *(double *)(v17 + 664);
              id v58 = v11 + 1;
              do
              {
                long long v11 = v58;
                uint64_t v55 = *v58;
                double v59 = *(double *)(*v58 + 664);
                if (v57 < v59) {
                  break;
                }
                ++v58;
              }
              while (v17 >= v55 || v57 != v59);
              do
              {
                do
                {
                  uint64_t v61 = *--i;
                  uint64_t v56 = v61;
                  double v62 = *(double *)(v61 + 664);
                }
                while (v57 < v62);
              }
              while (v17 < v56 && v57 == v62);
            }
            while (v11 < i);
          }
          CGRect v64 = v11 - 1;
          BOOL v4 = v11 - 1 >= v9;
          BOOL v5 = v11 - 1 == v9;
          if (v11 - 1 != v9) {
            uint64_t *v9 = *v64;
          }
          a4 = 0;
          uint64_t *v64 = v17;
        }
        double v18 = *(double *)(v17 + 664);
LABEL_15:
        for (uint64_t j = 0; ; ++j)
        {
          uint64_t v22 = v9[j + 1];
          double v23 = *(double *)(v22 + 664);
          if (v23 >= v18 && (v22 >= v17 || v23 != v18)) {
            break;
          }
        }
        double v25 = &v9[j];
        unint64_t v26 = (unint64_t)&v9[j + 1];
        double v27 = a2 - 1;
        if (j * 8)
        {
          do
          {
            double v28 = v27;
            uint64_t v29 = *v27;
            double v30 = *(double *)(*v27 + 664);
            if (v30 < v18) {
              break;
            }
            --v27;
          }
          while (v29 >= v17 || v30 != v18);
        }
        else
        {
          id v32 = a2 - 1;
          while (1)
          {
            double v28 = v32;
            unint64_t v33 = (unint64_t)(v32 + 1);
            if (v26 >= v33) {
              break;
            }
            double v34 = *(double *)(*v28 + 664);
            if (v34 >= v18)
            {
              id v32 = v28 - 1;
              if (*v28 >= v17 || v34 != v18) {
                continue;
              }
            }
            goto LABEL_41;
          }
          double v28 = (uint64_t *)v33;
        }
LABEL_41:
        if (v26 < (unint64_t)v28)
        {
          uint64_t v36 = *v28;
          unint64_t v37 = v26;
          double v38 = v28;
          do
          {
            *(void *)unint64_t v37 = v36;
            v37 += 8;
            *double v38 = v22;
            double v39 = *(double *)(v17 + 664);
            while (1)
            {
              uint64_t v22 = *(void *)v37;
              double v40 = *(double *)(*(void *)v37 + 664);
              if (v40 >= v39 && (v22 >= v17 || v40 != v39)) {
                break;
              }
              v37 += 8;
            }
            id v42 = v38 - 1;
            do
            {
              double v38 = v42;
              uint64_t v36 = *v42;
              double v43 = *(double *)(*v42 + 664);
              if (v43 < v39) {
                break;
              }
              --v42;
            }
            while (v36 >= v17 || v43 != v39);
          }
          while (v37 < (unint64_t)v38);
          double v25 = (uint64_t *)(v37 - 8);
        }
        if (v25 != v9) {
          uint64_t *v9 = *v25;
        }
        uint64_t *v25 = v17;
        if (v26 >= (unint64_t)v28) {
          break;
        }
LABEL_64:
        double result = std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(v9, v25, a3, a4 & 1);
        a4 = 0;
        long long v11 = v25 + 1;
      }
      BOOL v45 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v9, v25);
      long long v11 = v25 + 1;
      double result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(v25 + 1, a2);
      if (result) {
        break;
      }
      if (!v45) {
        goto LABEL_64;
      }
    }
    a2 = v25;
    if (!v45) {
      continue;
    }
    return result;
  }
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  double v4 = *(double *)(*a2 + 664);
  uint64_t v5 = *result;
  uint64_t v6 = *result + 656;
  double v7 = *(double *)(*result + 664);
  if (v4 < v7 || (v3 < v5 ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0), v8))
  {
    uint64_t v16 = *a3;
    double v17 = *(double *)(*a3 + 664);
    if (v17 < v4 || (v16 < v3 ? (BOOL v18 = v17 == v4) : (BOOL v18 = 0), v18))
    {
      *double result = v16;
    }
    else
    {
      *double result = v3;
      *a2 = v5;
      uint64_t v19 = *a3;
      double v20 = *(double *)(*a3 + 664);
      double v21 = *(double *)(v6 + 8);
      if (v20 >= v21 && (v19 >= v5 || v20 != v21)) {
        return result;
      }
      *a2 = v19;
    }
    *a3 = v5;
    return result;
  }
  uint64_t v9 = *a3;
  double v10 = *(double *)(*a3 + 664);
  if (v10 < v4 || (v9 < v3 ? (BOOL v11 = v10 == v4) : (BOOL v11 = 0), v11))
  {
    *a2 = v9;
    *a3 = v3;
    uint64_t v12 = *a2;
    double v13 = *(double *)(*a2 + 664);
    uint64_t v14 = *result;
    double v15 = *(double *)(*result + 664);
    if (v13 < v15 || v12 < v14 && v13 == v15)
    {
      *double result = v12;
      *a2 = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      double v7 = *(double *)(v6 + 664);
      uint64_t v8 = *a1;
      double v9 = *(double *)(*a1 + 664);
      if (v7 < v9 || (v6 < v8 ? (BOOL v10 = v7 == v9) : (BOOL v10 = 0), v10))
      {
        *a1 = v6;
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      BOOL v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2);
      uint64_t v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    uint64_t v15 = *v12;
    double v16 = *(double *)(*v12 + 664);
    uint64_t v17 = *v11;
    double v18 = *(double *)(*v11 + 664);
    if (v16 < v18 || (v15 < v17 ? (BOOL v19 = v16 == v18) : (BOOL v19 = 0), v19))
    {
      *uint64_t v12 = v17;
      double v20 = a1;
      if (v11 != a1)
      {
        uint64_t v21 = v13;
        do
        {
          double v22 = *(double *)(v15 + 664);
          uint64_t v23 = *(uint64_t *)((char *)a1 + v21 + 8);
          double v24 = *(double *)(v23 + 664);
          if (v22 >= v24 && (v15 >= v23 || v22 != v24))
          {
            double v20 = (uint64_t *)((char *)a1 + v21 + 16);
            goto LABEL_27;
          }
          *(uint64_t *)((char *)a1 + v21 + 16) = v23;
          v21 -= 8;
        }
        while (v21 != -16);
        double v20 = a1;
      }
LABEL_27:
      *double v20 = v15;
      if (++v14 == 8) {
        return v12 + 1 == a2;
      }
    }
    BOOL v11 = v12;
    v13 += 8;
    if (++v12 == a2) {
      return 1;
    }
  }
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a2, a3);
  uint64_t v9 = *a4;
  double v10 = *(double *)(*a4 + 664);
  uint64_t v11 = *a3;
  double v12 = *(double *)(*a3 + 664);
  if (v10 < v12 || (v9 < v11 ? (BOOL v13 = v10 == v12) : (BOOL v13 = 0), v13))
  {
    *a3 = v9;
    *a4 = v11;
    uint64_t v14 = *a3;
    double v15 = *(double *)(*a3 + 664);
    uint64_t v16 = *a2;
    double v17 = *(double *)(*a2 + 664);
    if (v15 < v17 || v14 < v16 && v15 == v17)
    {
      *a2 = v14;
      *a3 = v16;
      uint64_t v18 = *a2;
      double v19 = *(double *)(*a2 + 664);
      uint64_t v20 = *a1;
      double v21 = *(double *)(*a1 + 664);
      if (v19 < v21 || v18 < v20 && v19 == v21)
      {
        *a1 = v18;
        *a2 = v20;
      }
    }
  }
  return result;
}

uint64_t *std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  BOOL result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **>(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  double v12 = *(double *)(*a5 + 664);
  uint64_t v13 = *a4;
  double v14 = *(double *)(*a4 + 664);
  if (v12 < v14 || (v11 < v13 ? (BOOL v15 = v12 == v14) : (BOOL v15 = 0), v15))
  {
    *a4 = v11;
    *a5 = v13;
    uint64_t v16 = *a4;
    double v17 = *(double *)(*a4 + 664);
    uint64_t v18 = *a3;
    double v19 = *(double *)(*a3 + 664);
    if (v17 < v19 || v16 < v18 && v17 == v19)
    {
      *a3 = v16;
      *a4 = v18;
      uint64_t v20 = *a3;
      double v21 = *(double *)(*a3 + 664);
      uint64_t v22 = *a2;
      double v23 = *(double *)(*a2 + 664);
      if (v21 < v23 || v20 < v22 && v21 == v23)
      {
        *a2 = v20;
        *a3 = v22;
        uint64_t v24 = *a2;
        double v25 = *(double *)(*a2 + 664);
        uint64_t v26 = *a1;
        double v27 = *(double *)(*a1 + 664);
        if (v25 < v27 || v24 < v26 && v25 == v27)
        {
          *a1 = v24;
          *a2 = v26;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  double v4 = *(double *)(*a2 + 656);
  uint64_t v5 = *result;
  double v6 = *(double *)(*result + 656);
  if (v4 < v6 || (v3 < v5 ? (BOOL v7 = v4 == v6) : (BOOL v7 = 0), v7))
  {
    uint64_t v15 = *a3;
    double v16 = *(double *)(*a3 + 656);
    if (v16 < v4 || (v15 < v3 ? (BOOL v17 = v16 == v4) : (BOOL v17 = 0), v17))
    {
      *BOOL result = v15;
    }
    else
    {
      *BOOL result = v3;
      *a2 = v5;
      uint64_t v18 = *a3;
      double v19 = *(double *)(*a3 + 656);
      double v20 = *(double *)(v5 + 656);
      if (v19 >= v20 && (v18 >= v5 || v19 != v20)) {
        return result;
      }
      *a2 = v18;
    }
    *a3 = v5;
    return result;
  }
  uint64_t v8 = *a3;
  double v9 = *(double *)(*a3 + 656);
  if (v9 < v4 || (v8 < v3 ? (BOOL v10 = v9 == v4) : (BOOL v10 = 0), v10))
  {
    *a2 = v8;
    *a3 = v3;
    uint64_t v11 = *a2;
    double v12 = *(double *)(*a2 + 656);
    uint64_t v13 = *result;
    double v14 = *(double *)(*result + 656);
    if (v12 < v14 || v11 < v13 && v12 == v14)
    {
      *BOOL result = v11;
      *a2 = v13;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      double v7 = *(double *)(v6 + 656);
      uint64_t v8 = *a1;
      double v9 = *(double *)(*a1 + 656);
      if (v7 < v9 || (v6 < v8 ? (BOOL v10 = v7 == v9) : (BOOL v10 = 0), v10))
      {
        *a1 = v6;
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      uint64_t v11 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a1 + 1, a1 + 2);
      double v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    uint64_t v15 = *v12;
    double v16 = *(double *)(*v12 + 656);
    uint64_t v17 = *v11;
    double v18 = *(double *)(*v11 + 656);
    if (v16 < v18 || (v15 < v17 ? (BOOL v19 = v16 == v18) : (BOOL v19 = 0), v19))
    {
      *double v12 = v17;
      double v20 = a1;
      if (v11 != a1)
      {
        uint64_t v21 = v13;
        do
        {
          double v22 = *(double *)(v15 + 656);
          uint64_t v23 = *(uint64_t *)((char *)a1 + v21 + 8);
          double v24 = *(double *)(v23 + 656);
          if (v22 >= v24 && (v15 >= v23 || v22 != v24))
          {
            double v20 = (uint64_t *)((char *)a1 + v21 + 16);
            goto LABEL_27;
          }
          *(uint64_t *)((char *)a1 + v21 + 16) = v23;
          v21 -= 8;
        }
        while (v21 != -16);
        double v20 = a1;
      }
LABEL_27:
      *double v20 = v15;
      if (++v14 == 8) {
        return v12 + 1 == a2;
      }
    }
    uint64_t v11 = v12;
    v13 += 8;
    if (++v12 == a2) {
      return 1;
    }
  }
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a2, a3);
  uint64_t v9 = *a4;
  double v10 = *(double *)(*a4 + 656);
  uint64_t v11 = *a3;
  double v12 = *(double *)(*a3 + 656);
  if (v10 < v12 || (v9 < v11 ? (BOOL v13 = v10 == v12) : (BOOL v13 = 0), v13))
  {
    *a3 = v9;
    *a4 = v11;
    uint64_t v14 = *a3;
    double v15 = *(double *)(*a3 + 656);
    uint64_t v16 = *a2;
    double v17 = *(double *)(*a2 + 656);
    if (v15 < v17 || v14 < v16 && v15 == v17)
    {
      *a2 = v14;
      *a3 = v16;
      uint64_t v18 = *a2;
      double v19 = *(double *)(*a2 + 656);
      uint64_t v20 = *a1;
      double v21 = *(double *)(*a1 + 656);
      if (v19 < v21 || v18 < v20 && v19 == v21)
      {
        *a1 = v18;
        *a2 = v20;
      }
    }
  }
  return result;
}

uint64_t *std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  BOOL result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **>(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  double v12 = *(double *)(*a5 + 656);
  uint64_t v13 = *a4;
  double v14 = *(double *)(*a4 + 656);
  if (v12 < v14 || (v11 < v13 ? (BOOL v15 = v12 == v14) : (BOOL v15 = 0), v15))
  {
    *a4 = v11;
    *a5 = v13;
    uint64_t v16 = *a4;
    double v17 = *(double *)(*a4 + 656);
    uint64_t v18 = *a3;
    double v19 = *(double *)(*a3 + 656);
    if (v17 < v19 || v16 < v18 && v17 == v19)
    {
      *a3 = v16;
      *a4 = v18;
      uint64_t v20 = *a3;
      double v21 = *(double *)(*a3 + 656);
      uint64_t v22 = *a2;
      double v23 = *(double *)(*a2 + 656);
      if (v21 < v23 || v20 < v22 && v21 == v23)
      {
        *a2 = v20;
        *a3 = v22;
        uint64_t v24 = *a2;
        double v25 = *(double *)(*a2 + 656);
        uint64_t v26 = *a1;
        double v27 = *(double *)(*a1 + 656);
        if (v25 < v27 || v24 < v26 && v25 == v27)
        {
          *a1 = v24;
          *a2 = v26;
        }
      }
    }
  }
  return result;
}

unint64_t std::hash<_MKAnnotationViewPair>::operator()(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0x9DDFEA08EB382D69 * (((8 * a1) + 8) ^ HIDWORD(a1));
  unint64_t v3 = 0x9DDFEA08EB382D69 * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  unint64_t v4 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v5 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v4 >> 47) ^ v4);
  return (0x77FA823ACE0B5A40 * (v3 ^ (v3 >> 47))
        + ((0x9DDFEA08EB382D69 * (v3 ^ (v3 >> 47))) >> 2)
        - 0x622015F714C7D297 * (v5 ^ (v5 >> 47))
        - 0x61C8864680B583EBLL) ^ (0x9DDFEA08EB382D69 * (v3 ^ (v3 >> 47)));
}

__CFString *MKPlaceCardActionTypeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x2C) {
    return @"Unknown";
  }
  else {
    return off_1E54BC7C0[a1 - 1];
  }
}

void sub_18BC6CFD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *MKPlaceItemOptionsAsString(uint64_t a1)
{
  BOOL result = @"MKPlaceItemOptionNone";
  switch(a1)
  {
    case 1:
      BOOL result = @"MKPlaceItemOptionUserLocation";
      break;
    case 2:
      BOOL result = @"MKPlaceItemOptionDroppedPin";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      BOOL result = @"MKPlaceItemOptionSuggestedFavorite";
      break;
    case 8:
      BOOL result = @"MKPlaceItemOptionMeCard";
      break;
    default:
      unint64_t v3 = @"MKPlaceItemOptionPersonCard";
      if (a1 != 32) {
        unint64_t v3 = @"MKPlaceItemOptionNone";
      }
      if (a1 == 16) {
        BOOL result = @"MKPlaceItemOptionContactOnly";
      }
      else {
        BOOL result = v3;
      }
      break;
  }
  return result;
}

void sub_18BC711AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BC733AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id -[MKTransitDeparturesDataProvider _blockedIncidentEntities](MKTransitDeparturesDataProvider *self, SEL a2)
{
  return [(MKTransitItemIncidentsController *)self->_incidentsController blockedIncidentEntities];
}

id overlayRendererKVOKeys()
{
  if (qword_1E91542F0 != -1) {
    dispatch_once(&qword_1E91542F0, &__block_literal_global_327);
  }
  double v0 = (void *)_MergedGlobals_2;

  return v0;
}

void __overlayRendererKVOKeys_block_invoke()
{
  double v0 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)&unk_1ED97F548;
}

id MKGetMKSearchFoundationResultLog()
{
  if (qword_1E91541A0 != -1) {
    dispatch_once(&qword_1E91541A0, &__block_literal_global_82);
  }
  double v0 = (void *)_MergedGlobals_1_11;

  return v0;
}

void sub_18BC7E110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __MKGetMKSearchFoundationResultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MapKit", "MKSearchFoundationResult");
  double v1 = (void *)_MergedGlobals_1_11;
  _MergedGlobals_1_11 = (uint64_t)v0;
}

void sub_18BC802AC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_18BC80D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BC87C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC87D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _AddPathForPolygon(CGPath *a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  unint64_t v8 = [v7 pointCount];
  id v13 = v7;
  uint64_t v9 = (double *)[v13 points];
  if (v8 >= 3)
  {
    double v10 = v9;
    CGPathMoveToPoint(a1, 0, *v9 - a3, v9[1] - a4);
    unint64_t v11 = v8 - 1;
    double v12 = v10 + 3;
    do
    {
      CGPathAddLineToPoint(a1, 0, *(v12 - 1) - a3, *v12 - a4);
      v12 += 2;
      --v11;
    }
    while (v11);
    CGPathCloseSubpath(a1);
  }
}

void sub_18BC8BEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BC8BF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BC8DE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BC8EF18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v35 - 176));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18BC90FD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18BC92938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC92A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC92DE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<gm::Matrix<double,2,1>>::reserve(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>(v3, a2);
    id v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    unint64_t v11 = (char *)*a1;
    double v10 = (char *)a1[1];
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
      double v10 = (char *)*a1;
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

uint64_t geo::Intersect::isSelfIntersecting<double>(void *a1, int a2)
{
  uint64_t v2 = a1[1] - *a1;
  if ((unint64_t)v2 < 0x30) {
    return 0;
  }
  id v90 = 0;
  int64_t v91 = 0;
  v92[0] = 0;
  std::vector<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo,std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>::reserve((void **)&v90, v2 >> 4);
  unint64_t v5 = (uint64_t)(a1[1] - *a1) >> 4;
  uint64_t v6 = v5 - 1;
  if (a2 && *(_OWORD *)*a1 != *(_OWORD *)(*a1 + 16 * v6)) {
    uint64_t v6 = (uint64_t)(a1[1] - *a1) >> 4;
  }
  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = (double *)(*a1 + 16 * v7);
      unint64_t v9 = v7 + 1;
      unint64_t v10 = (v7 + 1) % v5;
      unint64_t v11 = (double *)(*a1 + 16 * v10);
      BOOL v12 = *v8 < *v11 || *v8 == *v11 && v8[1] < v11[1];
      id v13 = v91;
      double v14 = (char *)v92[0];
      if ((unint64_t)v91 >= v92[0])
      {
        unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91 - (char *)v90) >> 3);
        unint64_t v17 = v16 + 1;
        if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v92[0] - (void)v90) >> 3) > v17) {
          unint64_t v17 = 0x5555555555555556 * ((uint64_t)(v92[0] - (void)v90) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v92[0] - (void)v90) >> 3) >= 0x555555555555555) {
          unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v18 = v17;
        }
        double v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>((uint64_t)v92, v18);
        double v21 = &v19[24 * v16];
        *(void *)double v21 = v7;
        *((void *)v21 + 1) = v10;
        v21[16] = v12;
        double v23 = v90;
        uint64_t v22 = (uint64_t *)v91;
        uint64_t v24 = (uint64_t *)v21;
        if (v91 != (__n128 *)v90)
        {
          do
          {
            long long v25 = *(_OWORD *)(v22 - 3);
            *((unsigned char *)v24 - _Block_object_dispose(&STACK[0x240], 8) = *((unsigned char *)v22 - 8);
            *(_OWORD *)(v24 - 3) = v25;
            v24 -= 3;
            v22 -= 3;
          }
          while (v22 != v23);
          uint64_t v22 = v90;
        }
        double v14 = &v19[24 * v20];
        BOOL v15 = (unint64_t *)(v21 + 24);
        id v90 = v24;
        int64_t v91 = (__n128 *)(v21 + 24);
        v92[0] = v14;
        if (v22)
        {
          operator delete(v22);
          double v14 = (char *)v92[0];
        }
      }
      else
      {
        v91->n128_u64[0] = v7;
        v13->n128_u64[1] = v10;
        BOOL v15 = &v13[1].n128_u64[1];
        v13[1].n128_u8[0] = v12;
      }
      int64_t v91 = (__n128 *)v15;
      BOOL v26 = !v12;
      if (v15 >= (unint64_t *)v14)
      {
        unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v90) >> 3);
        unint64_t v29 = v28 + 1;
        if (v28 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (char *)v90) >> 3);
        if (2 * v30 > v29) {
          unint64_t v29 = 2 * v30;
        }
        if (v30 >= 0x555555555555555) {
          unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v31 = v29;
        }
        id v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>((uint64_t)v92, v31);
        double v34 = &v32[24 * v28];
        *(void *)double v34 = v10;
        *((void *)v34 + 1) = v7;
        v34[16] = v26;
        uint64_t v36 = v90;
        uint64_t v35 = (uint64_t *)v91;
        unint64_t v37 = (uint64_t *)v34;
        if (v91 != (__n128 *)v90)
        {
          do
          {
            long long v38 = *(_OWORD *)(v35 - 3);
            *((unsigned char *)v37 - _Block_object_dispose(&STACK[0x240], 8) = *((unsigned char *)v35 - 8);
            *(_OWORD *)(v37 - 3) = v38;
            v37 -= 3;
            v35 -= 3;
          }
          while (v35 != v36);
          uint64_t v35 = v90;
        }
        double v27 = (__n128 *)(v34 + 24);
        id v90 = v37;
        int64_t v91 = (__n128 *)(v34 + 24);
        v92[0] = &v32[24 * v33];
        if (v35) {
          operator delete(v35);
        }
      }
      else
      {
        unint64_t *v15 = v10;
        v15[1] = v7;
        double v27 = (__n128 *)(v15 + 3);
        *((unsigned char *)v15 + 16) = v26;
      }
      int64_t v91 = v27;
      ++v7;
    }
    while (v9 != v6);
  }
  else
  {
    double v27 = v91;
  }
  unint64_t v39 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v90) >> 3));
  *(void *)&v86.f64[0] = a1;
  if (v27 == (__n128 *)v90) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = v39;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(v90, v27, (uint64_t **)&v86, v40, 1);
  v89[0] = 0;
  v89[1] = 0;
  uint64_t v88 = (uint64_t *)v89;
  double v41 = v90;
  id v42 = (uint64_t *)v91;
  while (1)
  {
    if (v41 == v42)
    {
      uint64_t v3 = 0;
      goto LABEL_133;
    }
    if (*((unsigned char *)v41 + 16)) {
      break;
    }
    uint64_t v49 = v41[1];
    float64x2_t v50 = vsubq_f64(*(float64x2_t *)(*a1 + 16 * *v41), *(float64x2_t *)(*a1 + 16 * v49));
    float64x2_t v86 = *(float64x2_t *)(*a1 + 16 * v49);
    float64x2_t v87 = v50;
    int v51 = (uint64_t *)std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::find<gm::LineSegment<double,2>>((uint64_t)&v88, v86.f64);
    id v52 = v51;
    if (v89 != (void **)v51)
    {
      if (v88 != v51)
      {
        uint64_t v53 = *v51;
        if (*v51)
        {
          do
          {
            uint64_t v54 = v53;
            uint64_t v53 = *(void *)(v53 + 8);
          }
          while (v53);
        }
        else
        {
          double v72 = v51;
          do
          {
            uint64_t v54 = v72[2];
            BOOL v57 = *(void *)v54 == (void)v72;
            double v72 = (uint64_t *)v54;
          }
          while (v57);
        }
        BOOL v73 = (uint64_t *)v51[1];
        if (v73)
        {
          do
          {
            CGFloat v74 = v73;
            BOOL v73 = (uint64_t *)*v73;
          }
          while (v73);
        }
        else
        {
          CGFloat v75 = v51;
          do
          {
            CGFloat v74 = (uint64_t *)v75[2];
            BOOL v57 = *v74 == (void)v75;
            CGFloat v75 = v74;
          }
          while (!v57);
        }
        if (v74 != (uint64_t *)v89)
        {
          BOOL v76 = (void *)(v54 + 32);
          uint64_t v77 = v74 + 4;
          if (gm::LineSegment<double,2>::intersects<double,void>((double *)(v54 + 32), (double *)v74 + 4, 0)
            && (*v76 != *v77 || *(void *)(v54 + 40) != v74[5]))
          {
            float64x2_t v79 = vaddq_f64(*((float64x2_t *)v74 + 2), *((float64x2_t *)v74 + 3));
            if (*v76 != *(void *)&v79.f64[0] || *(void *)(v54 + 40) != *(void *)&v79.f64[1])
            {
              float64x2_t v81 = vaddq_f64(*(float64x2_t *)(v54 + 32), *(float64x2_t *)(v54 + 48));
              if ((*(void *)&v81.f64[0] != *v77 || *(void *)&v81.f64[1] != v74[5])
                && (*(void *)&v81.f64[0] != *(void *)&v79.f64[0] || *(void *)&v81.f64[1] != *(void *)&v79.f64[1]))
              {
                goto LABEL_132;
              }
            }
          }
        }
      }
      std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__remove_node_pointer(&v88, v52);
      operator delete(v52);
    }
LABEL_130:
    v41 += 3;
  }
  float64x2_t v43 = vsubq_f64(*(float64x2_t *)(*a1 + 16 * v41[1]), *(float64x2_t *)(*a1 + 16 * *v41));
  float64x2_t v86 = *(float64x2_t *)(*a1 + 16 * *v41);
  float64x2_t v87 = v43;
  id v44 = std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__emplace_unique_key_args<gm::LineSegment<double,2>,gm::LineSegment<double,2> const&>(&v88, v86.f64, &v86);
  if (v45)
  {
    uint64_t v46 = v44;
    if (v88 == v44) {
      goto LABEL_78;
    }
    uint64_t v47 = *v44;
    if (*v44)
    {
      do
      {
        uint64_t v48 = v47;
        uint64_t v47 = *(void *)(v47 + 8);
      }
      while (v47);
    }
    else
    {
      uint64_t v55 = v44;
      do
      {
        uint64_t v48 = v55[2];
        BOOL v57 = *(void *)v48 == (void)v55;
        uint64_t v55 = (uint64_t *)v48;
      }
      while (v57);
    }
    uint64_t v56 = (void *)(v48 + 32);
    if (!gm::LineSegment<double,2>::intersects<double,void>(v86.f64, (double *)(v48 + 32), 0)
      || (*v56 == *(void *)&v86.f64[0] ? (BOOL v57 = *(void *)(v48 + 40) == *(void *)&v86.f64[1]) : (BOOL v57 = 0),
          v57
       || ((float64x2_t v58 = vaddq_f64(v86, v87), *v56 == *(void *)&v58.f64[0])
         ? (BOOL v59 = *(void *)(v48 + 40) == *(void *)&v58.f64[1])
         : (BOOL v59 = 0),
           v59
        || ((float64x2_t v60 = vaddq_f64(*(float64x2_t *)(v48 + 32), *(float64x2_t *)(v48 + 48)),
             *(void *)&v60.f64[0] == *(void *)&v86.f64[0])
          ? (BOOL v61 = *(void *)&v60.f64[1] == *(void *)&v86.f64[1])
          : (BOOL v61 = 0),
            v61
         || (*(void *)&v60.f64[0] == *(void *)&v58.f64[0]
           ? (BOOL v62 = *(void *)&v60.f64[1] == *(void *)&v58.f64[1])
           : (BOOL v62 = 0),
             v62)))))
    {
LABEL_78:
      CGRect v63 = (uint64_t *)v46[1];
      if (v63)
      {
        do
        {
          CGRect v64 = v63;
          CGRect v63 = (uint64_t *)*v63;
        }
        while (v63);
      }
      else
      {
        do
        {
          CGRect v64 = (uint64_t *)v46[2];
          BOOL v57 = *v64 == (void)v46;
          uint64_t v46 = v64;
        }
        while (!v57);
      }
      if (v64 == (uint64_t *)v89) {
        goto LABEL_130;
      }
      CGRect v65 = v64 + 4;
      if (!gm::LineSegment<double,2>::intersects<double,void>(v86.f64, (double *)v64 + 4, 0)) {
        goto LABEL_130;
      }
      if (*v65 == *(void *)&v86.f64[0] && v64[5] == *(void *)&v86.f64[1]) {
        goto LABEL_130;
      }
      float64x2_t v67 = vaddq_f64(v86, v87);
      if (*v65 == *(void *)&v67.f64[0] && v64[5] == *(void *)&v67.f64[1]) {
        goto LABEL_130;
      }
      float64x2_t v69 = vaddq_f64(*((float64x2_t *)v64 + 2), *((float64x2_t *)v64 + 3));
      if (*(void *)&v69.f64[0] == *(void *)&v86.f64[0] && *(void *)&v69.f64[1] == *(void *)&v86.f64[1]) {
        goto LABEL_130;
      }
      if (*(void *)&v69.f64[0] == *(void *)&v67.f64[0] && *(void *)&v69.f64[1] == *(void *)&v67.f64[1]) {
        goto LABEL_130;
      }
    }
  }
LABEL_132:
  uint64_t v3 = 1;
LABEL_133:
  std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy((uint64_t)&v88, v89[0]);
  if (v90)
  {
    int64_t v91 = (__n128 *)v90;
    operator delete(v90);
  }
  return v3;
}

void sub_18BC93550(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25)
{
  double v27 = *(void **)(v25 - 112);
  if (v27)
  {
    *(void *)(v25 - 104) = v27;
    operator delete(v27);
  }
  _Unwind_Resume(exception_object);
}

void sub_18BC93838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::vector<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo,std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>::reserve(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>(v3, a2);
    unint64_t v7 = &v6[v5];
    unint64_t v9 = &v6[24 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    BOOL v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *(v12 - _Block_object_dispose(&STACK[0x240], 8) = *(v10 - 8);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
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

BOOL gm::LineSegment<double,2>::intersects<double,void>(double *a1, double *a2, double *a3)
{
  double v5 = 0.0;
  double v6 = 0.0;
  BOOL result = gm::LineSegment<double,2>::intersect<double,void>(a1, a2, &v6, &v5, a3);
  if (result)
  {
    BOOL v4 = v6 >= 0.0;
    if (v6 > 1.0) {
      BOOL v4 = 0;
    }
    if (v5 < 0.0) {
      BOOL v4 = 0;
    }
    return v5 <= 1.0 && v4;
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

__n128 std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(uint64_t *a1, __n128 *a2, uint64_t **a3, uint64_t a4, char a5)
{
LABEL_1:
  unint64_t v11 = (__n128 *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t *)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          double v34 = (__n128 *)((char *)a2 - 24);
          unint64_t v35 = a2[-2].n128_u64[1];
          if (a2[-1].n128_u8[8] == v11[1].n128_u8[0])
          {
            uint64_t v36 = v11->n128_u64[0];
          }
          else
          {
            uint64_t v36 = v11->n128_u64[0];
            if (v35 == v11->n128_u64[1] && a2[-1].n128_u64[0] == v36)
            {
              if (!a2[-1].n128_u8[8]) {
                return result;
              }
              goto LABEL_61;
            }
          }
          uint64_t v38 = **a3;
          unint64_t v39 = (unint64_t *)(v38 + 16 * v35);
          uint64_t v40 = (double *)(v38 + 16 * v36);
          result.n128_u64[0] = *v39;
          if (*(double *)v39 >= *v40)
          {
            if (*(double *)v39 != *v40) {
              return result;
            }
            result.n128_u64[0] = v39[1];
            if (result.n128_f64[0] >= v40[1]) {
              return result;
            }
          }
LABEL_61:
          unint64_t v45 = v11[1].n128_u64[0];
          __n128 v43 = *v11;
          __n128 v41 = *v34;
          v11[1].n128_u8[0] = a2[-1].n128_u8[8];
          *unint64_t v11 = v41;
          __n128 result = v43;
          __n128 *v34 = v43;
          a2[-1].n128_u8[8] = v45;
          return result;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v11, &v11[1].n128_i64[1], &a2[-2].n128_i64[1], a3);
          return result;
        case 4uLL:
          result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)v11, (uint64_t)&v11[1].n128_i64[1], (uint64_t *)&v11[3], &a2[-2].n128_i64[1], a3).n128_u64[0];
          return result;
        case 5uLL:
          result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)v11, (uint64_t)&v11[1].n128_i64[1], (uint64_t)&v11[3], &v11[4].n128_i64[1], &a2[-2].n128_i64[1], a3).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = (uint64_t *)v11 + 3 * (v15 >> 1);
    if ((unint64_t)v14 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v11, (uint64_t *)v11 + 3 * (v15 >> 1), &a2[-2].n128_i64[1], a3);
      uint64_t v18 = 3 * v16;
      double v19 = (uint64_t *)&v11[-1] + 3 * v16 - 1;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(&v11[1].n128_i64[1], v19, (uint64_t *)&a2[-3], a3);
      uint64_t v20 = (uint64_t *)&v11[3];
      double v21 = &v11[1].n128_i64[v18 + 1];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v20, v21, &a2[-5].n128_i64[1], a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v19, v17, v21, a3);
      uint64_t v44 = a1[2];
      long long v42 = *(_OWORD *)a1;
      long long v22 = *(_OWORD *)v17;
      *((unsigned char *)a1 + 16) = *((unsigned char *)v17 + 16);
      *(_OWORD *)a1 = v22;
      *((unsigned char *)v17 + 16) = v44;
      *(_OWORD *)unint64_t v17 = v42;
      if (a5) {
        goto LABEL_21;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v11 + 3 * (v15 >> 1), (uint64_t *)v11, &a2[-2].n128_i64[1], a3);
      if (a5) {
        goto LABEL_21;
      }
    }
    uint64_t v23 = *(a1 - 3);
    if (*((unsigned __int8 *)a1 - 8) == *((unsigned __int8 *)a1 + 16))
    {
      uint64_t v24 = *a1;
    }
    else
    {
      uint64_t v24 = *a1;
      if (v23 == a1[1] && *(a1 - 2) == v24)
      {
        if (!*((unsigned char *)a1 - 8)) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
    }
    uint64_t v25 = **a3;
    BOOL v26 = (double *)(v25 + 16 * v23);
    double v27 = (double *)(v25 + 16 * v24);
    if (*v26 >= *v27 && (*v26 != *v27 || v26[1] >= v27[1]))
    {
LABEL_25:
      unint64_t v11 = (__n128 *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(a1, (unint64_t)a2, a3);
      goto LABEL_26;
    }
LABEL_21:
    unint64_t v28 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(a1, (unint64_t)a2, a3);
    if ((v29 & 1) == 0) {
      goto LABEL_24;
    }
    std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, v28, a3);
    char v31 = v30;
    unint64_t v11 = (__n128 *)(v28 + 24);
    __n128 result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(v28 + 24, (uint64_t)a2, a3);
    if (v33)
    {
      a4 = -v13;
      a2 = (__n128 *)v28;
      if (v31) {
        return result;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if ((v31 & 1) == 0)
    {
LABEL_24:
      std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(a1, v28, a3, -v13, a5 & 1);
      unint64_t v11 = (__n128 *)(v28 + 24);
LABEL_26:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v11, (uint64_t *)a2, a3);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)v11, (uint64_t *)a2, a3);
  }
  return result;
}

uint64_t *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  if (result == a2) {
    return result;
  }
  uint64_t v3 = result + 3;
  if (result + 3 == a2) {
    return result;
  }
  uint64_t v4 = 0;
  char v5 = result;
  do
  {
    char v6 = v5;
    char v5 = v3;
    int v7 = *((unsigned __int8 *)v6 + 40);
    uint64_t v8 = v6[3];
    if (v7 == *((unsigned __int8 *)v6 + 16))
    {
      uint64_t v9 = *v6;
LABEL_10:
      uint64_t v11 = **a3;
      uint64_t v12 = (double *)(v11 + 16 * v8);
      uint64_t v13 = (double *)(v11 + 16 * v9);
      if (*v12 >= *v13 && (*v12 != *v13 || v12[1] >= v13[1])) {
        goto LABEL_33;
      }
      goto LABEL_15;
    }
    uint64_t v9 = *v6;
    if (v8 != v6[1] || v6[4] != v9) {
      goto LABEL_10;
    }
    if (!*((unsigned char *)v6 + 40)) {
      goto LABEL_33;
    }
LABEL_15:
    uint64_t v14 = v6[4];
    *(_OWORD *)char v5 = *(_OWORD *)v6;
    *((unsigned char *)v5 + 16) = *((unsigned char *)v6 + 16);
    unint64_t v15 = result;
    if (v6 == result) {
      goto LABEL_32;
    }
    uint64_t v16 = v4;
    while (1)
    {
      uint64_t v17 = (uint64_t)result + v16;
      uint64_t v18 = (uint64_t *)((char *)result + v16 - 24);
      if (v7 == *((unsigned __int8 *)result + v16 - 8)) {
        break;
      }
      uint64_t v19 = *v18;
      if (v8 != *(void *)(v17 - 16) || v14 != v19) {
        goto LABEL_23;
      }
      if (!v7) {
        goto LABEL_31;
      }
LABEL_29:
      v6 -= 3;
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *(unsigned char *)(v17 + 16) = *((unsigned char *)result + v16 - 8);
      v16 -= 24;
      if (!v16)
      {
        unint64_t v15 = result;
        goto LABEL_32;
      }
    }
    uint64_t v19 = *v18;
LABEL_23:
    uint64_t v21 = **a3;
    long long v22 = (double *)(v21 + 16 * v8);
    uint64_t v23 = (double *)(v21 + 16 * v19);
    if (*v22 < *v23) {
      goto LABEL_29;
    }
    if (*v22 != *v23)
    {
      unint64_t v15 = (uint64_t *)((char *)result + v16);
      goto LABEL_32;
    }
    if (v22[1] < v23[1]) {
      goto LABEL_29;
    }
LABEL_31:
    unint64_t v15 = v6;
LABEL_32:
    uint64_t *v15 = v8;
    v15[1] = v14;
    *((unsigned char *)v15 + 16) = v7;
LABEL_33:
    uint64_t v3 = v5 + 3;
    v4 += 24;
  }
  while (v5 + 3 != a2);
  return result;
}

uint64_t *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  if (result != a2)
  {
    while (1)
    {
LABEL_2:
      if (result + 3 == a2) {
        return result;
      }
      uint64_t v3 = result;
      result += 3;
      int v4 = *((unsigned __int8 *)v3 + 40);
      uint64_t v5 = v3[3];
      if (v4 == *((unsigned __int8 *)v3 + 16))
      {
        uint64_t v6 = *v3;
      }
      else
      {
        uint64_t v6 = *v3;
        if (v5 == v3[1] && v3[4] == v6)
        {
          if (!*((unsigned char *)v3 + 40)) {
            continue;
          }
LABEL_14:
          uint64_t v11 = v3[4];
          while (1)
          {
            uint64_t v12 = v3;
            *(_OWORD *)(v3 + 3) = *(_OWORD *)v3;
            *((unsigned char *)v3 + 40) = *((unsigned char *)v3 + 16);
            v3 -= 3;
            if (v4 == *((unsigned __int8 *)v12 - 8))
            {
              uint64_t v13 = *(v12 - 3);
            }
            else
            {
              uint64_t v13 = *(v12 - 3);
              if (v5 == *(v12 - 2) && v11 == v13)
              {
                if (!v4) {
                  goto LABEL_26;
                }
                continue;
              }
            }
            uint64_t v15 = **a3;
            uint64_t v16 = (double *)(v15 + 16 * v5);
            uint64_t v17 = (double *)(v15 + 16 * v13);
            if (*v16 >= *v17 && (*v16 != *v17 || v16[1] >= v17[1]))
            {
LABEL_26:
              *uint64_t v12 = v5;
              v12[1] = v11;
              *((unsigned char *)v12 + 16) = v4;
              goto LABEL_2;
            }
          }
        }
      }
      uint64_t v8 = **a3;
      uint64_t v9 = (double *)(v8 + 16 * v5);
      unint64_t v10 = (double *)(v8 + 16 * v6);
      if (*v9 < *v10 || *v9 == *v10 && v9[1] < v10[1]) {
        goto LABEL_14;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  int v4 = *((unsigned __int8 *)a2 + 16);
  uint64_t v5 = *a2;
  if (v4 == *((unsigned __int8 *)a1 + 16))
  {
    uint64_t v6 = *a1;
  }
  else
  {
    uint64_t v6 = *a1;
    if (v5 == a1[1] && a2[1] == v6)
    {
      if (!*((unsigned char *)a2 + 16)) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  uint64_t v8 = **a4;
  uint64_t v9 = (double *)(v8 + 16 * v5);
  unint64_t v10 = (double *)(v8 + 16 * v6);
  if (*v9 >= *v10 && (*v9 != *v10 || v9[1] >= v10[1]))
  {
LABEL_10:
    uint64_t v11 = *a3;
    if (*((unsigned __int8 *)a3 + 16) != v4 && v11 == a2[1] && a3[1] == v5)
    {
      if (*((unsigned char *)a3 + 16)) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v12 = **a4;
      uint64_t v13 = (double *)(v12 + 16 * v11);
      uint64_t v14 = (double *)(v12 + 16 * v5);
      if (*v13 < *v14 || *v13 == *v14 && v13[1] < v14[1])
      {
LABEL_31:
        long long v29 = *(_OWORD *)a2;
        uint64_t v30 = a2[2];
        char v31 = *((unsigned char *)a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *((unsigned char *)a2 + 16) = v31;
        *((unsigned char *)a3 + 16) = v30;
        *(_OWORD *)a3 = v29;
        uint64_t v32 = *a2;
        if (*((unsigned __int8 *)a2 + 16) == *((unsigned __int8 *)a1 + 16))
        {
          uint64_t v33 = *a1;
        }
        else
        {
          uint64_t v33 = *a1;
          if (v32 == a1[1] && a2[1] == v33)
          {
            if (*((unsigned char *)a2 + 16))
            {
LABEL_48:
              long long v43 = *(_OWORD *)a1;
              uint64_t v44 = a1[2];
              char v45 = *((unsigned char *)a2 + 16);
              *(_OWORD *)a1 = *(_OWORD *)a2;
              *((unsigned char *)a1 + 16) = v45;
              *((unsigned char *)a2 + 16) = v44;
              *(_OWORD *)a2 = v43;
              return 2;
            }
            return 1;
          }
        }
        uint64_t v40 = **a4;
        __n128 v41 = (double *)(v40 + 16 * v32);
        long long v42 = (double *)(v40 + 16 * v33);
        if (*v41 < *v42 || *v41 == *v42 && v41[1] < v42[1]) {
          goto LABEL_48;
        }
        return 1;
      }
    }
    return 0;
  }
LABEL_16:
  uint64_t v16 = *a3;
  if (*((unsigned __int8 *)a3 + 16) != v4 && v16 == a2[1] && a3[1] == v5)
  {
    if (!*((unsigned char *)a3 + 16)) {
      goto LABEL_26;
    }
LABEL_24:
    long long v20 = *(_OWORD *)a1;
    uint64_t v21 = a1[2];
    char v22 = *((unsigned char *)a3 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a3;
    *((unsigned char *)a1 + 16) = v22;
    *((unsigned char *)a3 + 16) = v21;
    *(_OWORD *)a3 = v20;
    return 1;
  }
  uint64_t v17 = **a4;
  uint64_t v18 = (double *)(v17 + 16 * v16);
  uint64_t v19 = (double *)(v17 + 16 * v5);
  if (*v18 < *v19 || *v18 == *v19 && v18[1] < v19[1]) {
    goto LABEL_24;
  }
LABEL_26:
  long long v23 = *(_OWORD *)a1;
  uint64_t v24 = a1[2];
  char v25 = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((unsigned char *)a1 + 16) = v25;
  *((unsigned char *)a2 + 16) = v24;
  *(_OWORD *)a2 = v23;
  int v26 = v24;
  uint64_t v27 = *a3;
  if (*((unsigned __int8 *)a3 + 16) == v26)
  {
    uint64_t v28 = *a2;
    goto LABEL_37;
  }
  uint64_t v28 = *a2;
  if (v27 != a2[1] || a3[1] != v28)
  {
LABEL_37:
    uint64_t v34 = **a4;
    unint64_t v35 = (double *)(v34 + 16 * v27);
    uint64_t v36 = (double *)(v34 + 16 * v28);
    if (*v35 >= *v36 && (*v35 != *v36 || v35[1] >= v36[1])) {
      return 1;
    }
    goto LABEL_40;
  }
  if (!*((unsigned char *)a3 + 16)) {
    return 1;
  }
LABEL_40:
  long long v37 = *(_OWORD *)a2;
  uint64_t v38 = a2[2];
  char v39 = *((unsigned char *)a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *((unsigned char *)a2 + 16) = v39;
  *((unsigned char *)a3 + 16) = v38;
  *(_OWORD *)a3 = v37;
  return 2;
}

unint64_t std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(uint64_t *a1, unint64_t a2, uint64_t **a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  int v5 = *((unsigned __int8 *)a1 + 16);
  int v6 = *(unsigned __int8 *)(a2 - 8);
  if (v5 == v6)
  {
    uint64_t v7 = *(void *)(a2 - 24);
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 - 24);
  if (v3 != *(void *)(a2 - 16) || v4 != v7)
  {
LABEL_7:
    uint64_t v9 = *a3;
    uint64_t v10 = **a3;
    uint64_t v11 = (double *)(v10 + 16 * v3);
    uint64_t v12 = (double *)(v10 + 16 * v7);
    if (*v11 >= *v12 && (*v11 != *v12 || v11[1] >= v12[1])) {
      goto LABEL_26;
    }
    goto LABEL_13;
  }
  if (*((unsigned char *)a1 + 16))
  {
    uint64_t v9 = *a3;
LABEL_13:
    for (unint64_t i = (unint64_t)(a1 + 3); ; i += 24)
    {
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        uint64_t v14 = *(void *)i;
      }
      else
      {
        uint64_t v14 = *(void *)i;
        if (v3 == *(void *)(i + 8) && v4 == v14)
        {
          if (*((unsigned char *)a1 + 16)) {
            goto LABEL_40;
          }
          continue;
        }
      }
      uint64_t v16 = (double *)(*v9 + 16 * v3);
      uint64_t v17 = (double *)(*v9 + 16 * v14);
      if (*v16 < *v17 || *v16 == *v17 && v16[1] < v17[1]) {
        goto LABEL_40;
      }
    }
  }
LABEL_26:
  unint64_t i = (unint64_t)(a1 + 3);
  if ((unint64_t)(a1 + 3) < a2)
  {
    uint64_t v18 = *a3;
    do
    {
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        uint64_t v19 = *(void *)i;
      }
      else
      {
        uint64_t v19 = *(void *)i;
        if (v3 == *(void *)(i + 8) && v4 == v19)
        {
          if (*((unsigned char *)a1 + 16)) {
            break;
          }
          goto LABEL_39;
        }
      }
      uint64_t v21 = (double *)(*v18 + 16 * v3);
      char v22 = (double *)(*v18 + 16 * v19);
      if (*v21 < *v22 || *v21 == *v22 && v21[1] < v22[1]) {
        break;
      }
LABEL_39:
      i += 24;
    }
    while (i < a2);
  }
LABEL_40:
  if (i >= a2) {
    goto LABEL_78;
  }
  long long v23 = *a3;
  uint64_t v24 = (void *)(a2 - 16);
  while (v5 != v6)
  {
    uint64_t v25 = *(v24 - 1);
    if (v3 != *v24 || v4 != v25) {
      goto LABEL_48;
    }
    if (!*((unsigned char *)a1 + 16)) {
      goto LABEL_54;
    }
LABEL_53:
    int v6 = *((unsigned __int8 *)v24 - 16);
    v24 -= 3;
  }
  uint64_t v25 = *(v24 - 1);
LABEL_48:
  uint64_t v27 = (double *)(*v23 + 16 * v3);
  uint64_t v28 = (double *)(*v23 + 16 * v25);
  if (*v27 < *v28 || *v27 == *v28 && v27[1] < v28[1]) {
    goto LABEL_53;
  }
LABEL_54:
  a2 = (unint64_t)(v24 - 1);
LABEL_78:
  if (i < a2)
  {
    uint64_t v42 = *(void *)(i + 16);
    long long v41 = *(_OWORD *)i;
    long long v29 = *(_OWORD *)a2;
    *(unsigned char *)(i + 16) = *(unsigned char *)(a2 + 16);
    *(_OWORD *)unint64_t i = v29;
    *(unsigned char *)(a2 + 16) = v42;
    *(_OWORD *)a2 = v41;
    uint64_t v30 = *a3;
    while (1)
    {
      i += 24;
      if (v5 == *(unsigned __int8 *)(i + 16))
      {
        uint64_t v31 = *(void *)i;
LABEL_62:
        uint64_t v33 = (double *)(*v30 + 16 * v3);
        uint64_t v34 = (double *)(*v30 + 16 * v31);
        if (*v33 < *v34 || *v33 == *v34 && v33[1] < v34[1])
        {
          while (1)
          {
LABEL_69:
            a2 -= 24;
            if (v5 == *(unsigned __int8 *)(a2 + 16))
            {
              uint64_t v35 = *(void *)a2;
LABEL_75:
              long long v37 = (double *)(*v30 + 16 * v3);
              uint64_t v38 = (double *)(*v30 + 16 * v35);
              if (*v37 >= *v38 && (*v37 != *v38 || v37[1] >= v38[1])) {
                goto LABEL_78;
              }
            }
            else
            {
              uint64_t v35 = *(void *)a2;
              if (v3 != *(void *)(a2 + 8) || v4 != v35) {
                goto LABEL_75;
              }
              if (!v5) {
                goto LABEL_78;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v31 = *(void *)i;
        if (v3 != *(void *)(i + 8) || v4 != v31) {
          goto LABEL_62;
        }
        if (v5) {
          goto LABEL_69;
        }
      }
    }
  }
  if ((uint64_t *)(i - 24) != a1)
  {
    long long v39 = *(_OWORD *)(i - 24);
    *((unsigned char *)a1 + 16) = *(unsigned char *)(i - 8);
    *(_OWORD *)a1 = v39;
  }
  *(void *)(i - 24) = v3;
  *(void *)(i - 16) = v4;
  *(unsigned char *)(i - _Block_object_dispose(&STACK[0x240], 8) = v5;
  return i;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo *,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &>(uint64_t *a1, unint64_t a2, void **a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  int v6 = *((unsigned __int8 *)a1 + 16);
  uint64_t v7 = *a3;
  while (1)
  {
    uint64_t v8 = a1[v3 + 3];
    if (LOBYTE(a1[v3 + 5]) == v6) {
      break;
    }
    if (v8 != v5 || a1[v3 + 4] != v4) {
      break;
    }
    if (!LOBYTE(a1[v3 + 5])) {
      goto LABEL_13;
    }
LABEL_12:
    v3 += 3;
  }
  uint64_t v10 = (double *)(*v7 + 16 * v8);
  uint64_t v11 = (double *)(*v7 + 16 * v4);
  if (*v10 < *v11 || *v10 == *v11 && v10[1] < v11[1]) {
    goto LABEL_12;
  }
LABEL_13:
  unint64_t v12 = (unint64_t)&a1[v3 + 3];
  if (v3 * 8)
  {
    do
    {
      while (1)
      {
        a2 -= 24;
        uint64_t v13 = *(void *)a2;
        if (*(unsigned __int8 *)(a2 + 16) == v6) {
          break;
        }
        if (v13 != v5 || *(void *)(a2 + 8) != v4) {
          break;
        }
        if (*(unsigned char *)(a2 + 16)) {
          goto LABEL_42;
        }
      }
      uint64_t v15 = (double *)(*v7 + 16 * v13);
      uint64_t v16 = (double *)(*v7 + 16 * v4);
    }
    while (*v15 >= *v16 && (*v15 != *v16 || v15[1] >= v16[1]));
  }
  else
  {
    while (v12 < a2)
    {
      while (1)
      {
        while (1)
        {
          a2 -= 24;
          uint64_t v17 = *(void *)a2;
          if (*(unsigned __int8 *)(a2 + 16) == v6) {
            break;
          }
          if (v17 != v5 || *(void *)(a2 + 8) != v4) {
            break;
          }
          if (*(unsigned char *)(a2 + 16)) {
            BOOL v21 = 1;
          }
          else {
            BOOL v21 = v12 >= a2;
          }
          if (v21) {
            goto LABEL_42;
          }
        }
        uint64_t v19 = (double *)(*v7 + 16 * v17);
        long long v20 = (double *)(*v7 + 16 * v4);
        if (*v19 < *v20) {
          goto LABEL_42;
        }
        if (*v19 != *v20) {
          break;
        }
        if (v12 >= a2 || v19[1] < v20[1]) {
          goto LABEL_42;
        }
      }
    }
  }
LABEL_42:
  unint64_t v22 = v12;
  if (v12 < a2)
  {
    unint64_t v23 = a2;
    do
    {
      uint64_t v37 = *(void *)(v22 + 16);
      long long v36 = *(_OWORD *)v22;
      long long v24 = *(_OWORD *)v23;
      *(unsigned char *)(v22 + 16) = *(unsigned char *)(v23 + 16);
      *(_OWORD *)unint64_t v22 = v24;
      *(unsigned char *)(v23 + 16) = v37;
      *(_OWORD *)unint64_t v23 = v36;
      uint64_t v25 = *a3;
      do
      {
        while (1)
        {
          v22 += 24;
          uint64_t v26 = *(void *)v22;
          if (*(unsigned __int8 *)(v22 + 16) != v6 && v26 == v5 && *(void *)(v22 + 8) == v4) {
            break;
          }
          uint64_t v28 = (double *)(*v25 + 16 * v26);
          long long v29 = (double *)(*v25 + 16 * v4);
          if (*v28 >= *v29 && (*v28 != *v29 || v28[1] >= v29[1])) {
            goto LABEL_57;
          }
        }
      }
      while (*(unsigned char *)(v22 + 16));
      do
      {
LABEL_57:
        while (1)
        {
          v23 -= 24;
          uint64_t v30 = *(void *)v23;
          if (*(unsigned __int8 *)(v23 + 16) == v6) {
            break;
          }
          if (v30 != v5 || *(void *)(v23 + 8) != v4) {
            break;
          }
          if (*(unsigned char *)(v23 + 16)) {
            goto LABEL_65;
          }
        }
        uint64_t v32 = (double *)(*v25 + 16 * v30);
        uint64_t v33 = (double *)(*v25 + 16 * v4);
      }
      while (*v32 >= *v33 && (*v32 != *v33 || v32[1] >= v33[1]));
LABEL_65:
      ;
    }
    while (v22 < v23);
  }
  if ((uint64_t *)(v22 - 24) != a1)
  {
    long long v34 = *(_OWORD *)(v22 - 24);
    *((unsigned char *)a1 + 16) = *(unsigned char *)(v22 - 8);
    *(_OWORD *)a1 = v34;
  }
  *(void *)(v22 - 24) = v4;
  *(void *)(v22 - 16) = v5;
  *(unsigned char *)(v22 - _Block_object_dispose(&STACK[0x240], 8) = v6;
  return v22 - 24;
}

__n128 std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  switch(0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3))
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v6 = (_OWORD *)(a2 - 24);
      uint64_t v7 = *(void *)(a2 - 24);
      if (*(unsigned __int8 *)(a2 - 8) == *(unsigned __int8 *)(a1 + 16))
      {
        uint64_t v8 = *(void *)a1;
        goto LABEL_45;
      }
      uint64_t v8 = *(void *)a1;
      if (v7 != *(void *)(a1 + 8) || *(void *)(a2 - 16) != v8)
      {
LABEL_45:
        uint64_t v32 = **a3;
        uint64_t v33 = (unint64_t *)(v32 + 16 * v7);
        long long v34 = (double *)(v32 + 16 * v8);
        result.n128_u64[0] = *v33;
        if (*(double *)v33 < *v34) {
          goto LABEL_51;
        }
        if (*(double *)v33 == *v34)
        {
          result.n128_u64[0] = v33[1];
          if (result.n128_f64[0] < v34[1]) {
            goto LABEL_51;
          }
        }
        return result;
      }
      if (*(unsigned char *)(a2 - 8))
      {
LABEL_51:
        __n128 result = *(__n128 *)a1;
        uint64_t v35 = *(void *)(a1 + 16);
        char v36 = *(unsigned char *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(unsigned char *)(a1 + 16) = v36;
        *(unsigned char *)(a2 - _Block_object_dispose(&STACK[0x240], 8) = v35;
        _OWORD *v6 = result;
        return result;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a2 - 24), a3);
      return result;
    case 4uLL:
      result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a1 + 24, (uint64_t *)(a1 + 48), (uint64_t *)(a2 - 24), a3).n128_u64[0];
      return result;
    case 5uLL:
      result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a1 + 24, a1 + 48, (uint64_t *)(a1 + 72), (uint64_t *)(a2 - 24), a3).n128_u64[0];
      return result;
    default:
      uint64_t v9 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), a3);
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return result;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      while (2)
      {
        int v14 = *(unsigned __int8 *)(v11 + 16);
        uint64_t v15 = *(void *)v11;
        if (v14 == *(unsigned __int8 *)(v9 + 16))
        {
          uint64_t v16 = *(void *)v9;
        }
        else
        {
          uint64_t v16 = *(void *)v9;
          if (v15 == *(void *)(v9 + 8) && *(void *)(v11 + 8) == v16)
          {
            if (!*(unsigned char *)(v11 + 16)) {
              goto LABEL_35;
            }
            goto LABEL_17;
          }
        }
        uint64_t v18 = **a3;
        uint64_t v19 = (unint64_t *)(v18 + 16 * v15);
        long long v20 = (double *)(v18 + 16 * v16);
        result.n128_u64[0] = *v19;
        if (*(double *)v19 >= *v20)
        {
          if (*(double *)v19 != *v20) {
            goto LABEL_35;
          }
          result.n128_u64[0] = v19[1];
          if (result.n128_f64[0] >= v20[1]) {
            goto LABEL_35;
          }
        }
LABEL_17:
        uint64_t v21 = *(void *)(v11 + 8);
        __n128 result = *(__n128 *)v9;
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v9;
        *(unsigned char *)(v11 + 16) = *(unsigned char *)(v9 + 16);
        uint64_t v22 = a1;
        if (v9 == a1) {
          goto LABEL_34;
        }
        uint64_t v23 = v12;
        while (2)
        {
          long long v24 = (__n128 *)(a1 + v23);
          uint64_t v25 = (__n128 *)(a1 + v23 + 24);
          if (v14 == *(unsigned __int8 *)(a1 + v23 + 40))
          {
            unint64_t v26 = v25->n128_u64[0];
          }
          else
          {
            unint64_t v26 = v25->n128_u64[0];
            if (v15 == v24[2].n128_u64[0] && v21 == v26)
            {
              if (!v14) {
                break;
              }
              goto LABEL_31;
            }
          }
          uint64_t v28 = **a3;
          long long v29 = (unint64_t *)(v28 + 16 * v15);
          uint64_t v30 = (double *)(v28 + 16 * v26);
          result.n128_u64[0] = *v29;
          if (*(double *)v29 < *v30) {
            goto LABEL_31;
          }
          if (*(double *)v29 != *v30)
          {
            uint64_t v22 = a1 + v23 + 48;
            goto LABEL_34;
          }
          result.n128_u64[0] = v29[1];
          if (result.n128_f64[0] < v30[1])
          {
LABEL_31:
            v9 -= 24;
            __n128 result = *v25;
            v24[3] = *v25;
            v24[4].n128_u8[0] = *(unsigned char *)(a1 + v23 + 40);
            v23 -= 24;
            if (v23 == -48)
            {
              uint64_t v22 = a1;
              goto LABEL_34;
            }
            continue;
          }
          break;
        }
        uint64_t v22 = v9;
LABEL_34:
        *(void *)uint64_t v22 = v15;
        *(void *)(v22 + _Block_object_dispose(&STACK[0x240], 8) = v21;
        *(unsigned char *)(v22 + 16) = v14;
        if (++v13 != 8)
        {
LABEL_35:
          uint64_t v9 = v11;
          v12 += 24;
          v11 += 24;
          if (v11 == a2) {
            return result;
          }
          continue;
        }
        return result;
      }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t *)a1, (uint64_t *)a2, a3, a5);
  uint64_t v11 = *a4;
  if (*((unsigned __int8 *)a4 + 16) == *((unsigned __int8 *)a3 + 16))
  {
    uint64_t v12 = *a3;
  }
  else
  {
    uint64_t v12 = *a3;
    if (v11 == a3[1] && a4[1] == v12)
    {
      if (!*((unsigned char *)a4 + 16)) {
        return result;
      }
LABEL_12:
      __n128 result = *(__n128 *)a3;
      uint64_t v17 = a3[2];
      char v18 = *((unsigned char *)a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *((unsigned char *)a3 + 16) = v18;
      *((unsigned char *)a4 + 16) = v17;
      *(__n128 *)a4 = result;
      uint64_t v19 = *a3;
      if (*((unsigned __int8 *)a3 + 16) == *(unsigned __int8 *)(a2 + 16))
      {
        uint64_t v20 = *(void *)a2;
      }
      else
      {
        uint64_t v20 = *(void *)a2;
        if (v19 == *(void *)(a2 + 8) && a3[1] == v20)
        {
          if (!*((unsigned char *)a3 + 16)) {
            return result;
          }
          goto LABEL_21;
        }
      }
      uint64_t v21 = **a5;
      uint64_t v22 = (unint64_t *)(v21 + 16 * v19);
      uint64_t v23 = (double *)(v21 + 16 * v20);
      result.n128_u64[0] = *v22;
      if (*(double *)v22 >= *v23)
      {
        if (*(double *)v22 != *v23) {
          return result;
        }
        result.n128_u64[0] = v22[1];
        if (result.n128_f64[0] >= v23[1]) {
          return result;
        }
      }
LABEL_21:
      __n128 result = *(__n128 *)a2;
      uint64_t v24 = *(void *)(a2 + 16);
      char v25 = *((unsigned char *)a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(unsigned char *)(a2 + 16) = v25;
      *((unsigned char *)a3 + 16) = v24;
      *(__n128 *)a3 = result;
      uint64_t v26 = *(void *)a2;
      if (*(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a1 + 16))
      {
        uint64_t v27 = *(void *)a1;
      }
      else
      {
        uint64_t v27 = *(void *)a1;
        if (v26 == *(void *)(a1 + 8) && *(void *)(a2 + 8) == v27)
        {
          if (!*(unsigned char *)(a2 + 16)) {
            return result;
          }
          goto LABEL_30;
        }
      }
      uint64_t v28 = **a5;
      long long v29 = (unint64_t *)(v28 + 16 * v26);
      uint64_t v30 = (double *)(v28 + 16 * v27);
      result.n128_u64[0] = *v29;
      if (*(double *)v29 >= *v30)
      {
        if (*(double *)v29 != *v30) {
          return result;
        }
        result.n128_u64[0] = v29[1];
        if (result.n128_f64[0] >= v30[1]) {
          return result;
        }
      }
LABEL_30:
      __n128 result = *(__n128 *)a1;
      uint64_t v31 = *(void *)(a1 + 16);
      char v32 = *(unsigned char *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 16) = v32;
      *(unsigned char *)(a2 + 16) = v31;
      *(__n128 *)a2 = result;
      return result;
    }
  }
  uint64_t v14 = **a5;
  uint64_t v15 = (unint64_t *)(v14 + 16 * v11);
  uint64_t v16 = (double *)(v14 + 16 * v12);
  result.n128_u64[0] = *v15;
  if (*(double *)v15 < *v16) {
    goto LABEL_12;
  }
  if (*(double *)v15 == *v16)
  {
    result.n128_u64[0] = v15[1];
    if (result.n128_f64[0] < v16[1]) {
      goto LABEL_12;
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t **a6)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a2, (uint64_t *)a3, a4, a6).n128_u64[0];
  uint64_t v13 = *a5;
  if (*((unsigned __int8 *)a5 + 16) == *((unsigned __int8 *)a4 + 16))
  {
    uint64_t v14 = *a4;
  }
  else
  {
    uint64_t v14 = *a4;
    if (v13 == a4[1] && a5[1] == v14)
    {
      if (!*((unsigned char *)a5 + 16)) {
        return result;
      }
LABEL_12:
      __n128 result = *(__n128 *)a4;
      uint64_t v19 = a4[2];
      char v20 = *((unsigned char *)a5 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a5;
      *((unsigned char *)a4 + 16) = v20;
      *((unsigned char *)a5 + 16) = v19;
      *(__n128 *)a5 = result;
      uint64_t v21 = *a4;
      if (*((unsigned __int8 *)a4 + 16) == *(unsigned __int8 *)(a3 + 16))
      {
        uint64_t v22 = *(void *)a3;
      }
      else
      {
        uint64_t v22 = *(void *)a3;
        if (v21 == *(void *)(a3 + 8) && a4[1] == v22)
        {
          if (!*((unsigned char *)a4 + 16)) {
            return result;
          }
          goto LABEL_21;
        }
      }
      uint64_t v23 = **a6;
      uint64_t v24 = (unint64_t *)(v23 + 16 * v21);
      char v25 = (double *)(v23 + 16 * v22);
      result.n128_u64[0] = *v24;
      if (*(double *)v24 >= *v25)
      {
        if (*(double *)v24 != *v25) {
          return result;
        }
        result.n128_u64[0] = v24[1];
        if (result.n128_f64[0] >= v25[1]) {
          return result;
        }
      }
LABEL_21:
      __n128 result = *(__n128 *)a3;
      uint64_t v26 = *(void *)(a3 + 16);
      char v27 = *((unsigned char *)a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(unsigned char *)(a3 + 16) = v27;
      *((unsigned char *)a4 + 16) = v26;
      *(__n128 *)a4 = result;
      uint64_t v28 = *(void *)a3;
      if (*(unsigned __int8 *)(a3 + 16) == *(unsigned __int8 *)(a2 + 16))
      {
        uint64_t v29 = *(void *)a2;
      }
      else
      {
        uint64_t v29 = *(void *)a2;
        if (v28 == *(void *)(a2 + 8) && *(void *)(a3 + 8) == v29)
        {
          if (!*(unsigned char *)(a3 + 16)) {
            return result;
          }
          goto LABEL_30;
        }
      }
      uint64_t v30 = **a6;
      uint64_t v31 = (unint64_t *)(v30 + 16 * v28);
      char v32 = (double *)(v30 + 16 * v29);
      result.n128_u64[0] = *v31;
      if (*(double *)v31 >= *v32)
      {
        if (*(double *)v31 != *v32) {
          return result;
        }
        result.n128_u64[0] = v31[1];
        if (result.n128_f64[0] >= v32[1]) {
          return result;
        }
      }
LABEL_30:
      __n128 result = *(__n128 *)a2;
      uint64_t v33 = *(void *)(a2 + 16);
      char v34 = *(unsigned char *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(unsigned char *)(a2 + 16) = v34;
      *(unsigned char *)(a3 + 16) = v33;
      *(__n128 *)a3 = result;
      uint64_t v35 = *(void *)a2;
      if (*(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a1 + 16))
      {
        uint64_t v36 = *(void *)a1;
      }
      else
      {
        uint64_t v36 = *(void *)a1;
        if (v35 == *(void *)(a1 + 8) && *(void *)(a2 + 8) == v36)
        {
          if (!*(unsigned char *)(a2 + 16)) {
            return result;
          }
          goto LABEL_39;
        }
      }
      uint64_t v37 = **a6;
      uint64_t v38 = (unint64_t *)(v37 + 16 * v35);
      long long v39 = (double *)(v37 + 16 * v36);
      result.n128_u64[0] = *v38;
      if (*(double *)v38 >= *v39)
      {
        if (*(double *)v38 != *v39) {
          return result;
        }
        result.n128_u64[0] = v38[1];
        if (result.n128_f64[0] >= v39[1]) {
          return result;
        }
      }
LABEL_39:
      __n128 result = *(__n128 *)a1;
      uint64_t v40 = *(void *)(a1 + 16);
      char v41 = *(unsigned char *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 16) = v41;
      *(unsigned char *)(a2 + 16) = v40;
      *(__n128 *)a2 = result;
      return result;
    }
  }
  uint64_t v16 = **a6;
  uint64_t v17 = (unint64_t *)(v16 + 16 * v13);
  char v18 = (double *)(v16 + 16 * v14);
  result.n128_u64[0] = *v17;
  if (*(double *)v17 < *v18) {
    goto LABEL_12;
  }
  if (*(double *)v17 == *v18)
  {
    result.n128_u64[0] = v17[1];
    if (result.n128_f64[0] < v18[1]) {
      goto LABEL_12;
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t **a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = (uint64_t *)a1 + 3 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      while (1)
      {
        unint64_t v15 = v14->n128_u64[0];
        if (v14[1].n128_u8[0] == a1[1].n128_u8[0]) {
          break;
        }
        uint64_t v16 = a1->n128_u64[0];
        if (v15 != a1->n128_u64[1] || v14->n128_u64[1] != v16) {
          goto LABEL_13;
        }
        if (v14[1].n128_u8[0]) {
          goto LABEL_18;
        }
LABEL_19:
        uint64_t v14 = (__n128 *)((char *)v14 + 24);
        if (v14 == a3)
        {
          uint64_t v13 = a3;
          goto LABEL_21;
        }
      }
      uint64_t v16 = a1->n128_u64[0];
LABEL_13:
      uint64_t v18 = **a4;
      uint64_t v19 = (double *)(v18 + 16 * v15);
      char v20 = (double *)(v18 + 16 * v16);
      if (*v19 >= *v20 && (*v19 != *v20 || v19[1] >= v20[1])) {
        goto LABEL_19;
      }
LABEL_18:
      __n128 v21 = *v14;
      uint64_t v22 = v14[1].n128_i64[0];
      unsigned __int8 v23 = a1[1].n128_u8[0];
      __n128 *v14 = *a1;
      v14[1].n128_u8[0] = v23;
      a1[1].n128_u8[0] = v22;
      *a1 = v21;
      std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, a4, v9, (uint64_t *)a1);
      goto LABEL_19;
    }
LABEL_21:
    if (v8 >= 25)
    {
      int64_t v24 = v8 / 0x18uLL;
      char v25 = (__n128 *)((char *)a2 - 24);
      do
      {
        __n128 v30 = *a1;
        unint64_t v31 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(a1, a4, v24);
        if (v25 == v26)
        {
          *uint64_t v26 = v30;
          v26[1].n128_u8[0] = v31;
        }
        else
        {
          __n128 v27 = *v25;
          v26[1].n128_u8[0] = v25[1].n128_u8[0];
          *uint64_t v26 = v27;
          __n128 *v25 = v30;
          v25[1].n128_u8[0] = v31;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>((uint64_t)a1, (uint64_t)&v26[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v26[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        char v25 = (__n128 *)((char *)v25 - 24);
      }
      while (v24-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t result, uint64_t **a2, uint64_t a3, uint64_t *a4)
{
  if (a3 < 2) {
    return result;
  }
  int64_t v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3))) {
    return result;
  }
  uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  int v6 = (uint64_t *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 < a3)
  {
    uint64_t v7 = *v6;
    if (*(unsigned __int8 *)(result + 24 * v5 + 16) == *((unsigned __int8 *)v6 + 40))
    {
      uint64_t v8 = v6[3];
    }
    else
    {
      uint64_t v8 = v6[3];
      if (v7 == v6[4] && *(void *)(result + 24 * v5 + 8) == v8)
      {
        if (!*(unsigned char *)(result + 24 * v5 + 16)) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    uint64_t v10 = **a2;
    unint64_t v11 = (double *)(v10 + 16 * v7);
    uint64_t v12 = (double *)(v10 + 16 * v8);
    if (*v11 >= *v12 && (*v11 != *v12 || v11[1] >= v12[1])) {
      goto LABEL_16;
    }
LABEL_15:
    v6 += 3;
    uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
  }
LABEL_16:
  int v13 = *((unsigned __int8 *)a4 + 16);
  uint64_t v14 = *v6;
  if (*((unsigned __int8 *)v6 + 16) == v13)
  {
    uint64_t v15 = *a4;
    goto LABEL_22;
  }
  uint64_t v15 = *a4;
  if (v14 != a4[1] || v6[1] != v15)
  {
LABEL_22:
    uint64_t v17 = **a2;
    uint64_t v18 = (double *)(v17 + 16 * v14);
    uint64_t v19 = (double *)(v17 + 16 * v15);
    if (*v18 < *v19 || *v18 == *v19 && v18[1] < v19[1]) {
      return result;
    }
    goto LABEL_27;
  }
  if (*((unsigned char *)v6 + 16)) {
    return result;
  }
LABEL_27:
  uint64_t v20 = a4[1];
  long long v21 = *(_OWORD *)v6;
  *((unsigned char *)a4 + 16) = *((unsigned char *)v6 + 16);
  *(_OWORD *)a4 = v21;
  if (v4 < v5) {
    goto LABEL_54;
  }
  while (1)
  {
    uint64_t v22 = v6;
    uint64_t v23 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    int v6 = (uint64_t *)(result + 24 * v5);
    uint64_t v24 = v23 + 2;
    if (v24 < a3)
    {
      uint64_t v25 = *v6;
      if (*(unsigned __int8 *)(result + 24 * v5 + 16) == *((unsigned __int8 *)v6 + 40))
      {
        uint64_t v26 = v6[3];
LABEL_35:
        uint64_t v28 = **a2;
        uint64_t v29 = (double *)(v28 + 16 * v25);
        __n128 v30 = (double *)(v28 + 16 * v26);
        if (*v29 >= *v30 && (*v29 != *v30 || v29[1] >= v30[1])) {
          goto LABEL_41;
        }
LABEL_40:
        v6 += 3;
        uint64_t v5 = v24;
        goto LABEL_41;
      }
      uint64_t v26 = v6[3];
      if (v25 != v6[4] || *(void *)(result + 24 * v5 + 8) != v26) {
        goto LABEL_35;
      }
      if (*(unsigned char *)(result + 24 * v5 + 16)) {
        goto LABEL_40;
      }
    }
LABEL_41:
    uint64_t v31 = *v6;
    if (*((unsigned __int8 *)v6 + 16) == v13) {
      break;
    }
    if (v31 != v20 || v6[1] != v15) {
      break;
    }
    if (*((unsigned char *)v6 + 16)) {
      goto LABEL_53;
    }
LABEL_51:
    long long v36 = *(_OWORD *)v6;
    *((unsigned char *)v22 + 16) = *((unsigned char *)v6 + 16);
    *(_OWORD *)uint64_t v22 = v36;
    if (v4 < v5) {
      goto LABEL_54;
    }
  }
  uint64_t v33 = **a2;
  char v34 = (double *)(v33 + 16 * v31);
  uint64_t v35 = (double *)(v33 + 16 * v15);
  if (*v34 >= *v35 && (*v34 != *v35 || v34[1] >= v35[1])) {
    goto LABEL_51;
  }
LABEL_53:
  int v6 = v22;
LABEL_54:
  uint64_t *v6 = v15;
  v6[1] = v20;
  *((unsigned char *)v6 + 16) = v13;
  return result;
}

__n128 std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(__n128 *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    int v6 = a1;
    uint64_t v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 >= a3) {
      goto LABEL_17;
    }
    int v10 = v6[1].n128_u8[24 * v7];
    unint64_t v11 = a1->n128_u64[0];
    if (v10 == a1[2].n128_u8[8])
    {
      unint64_t v12 = a1[1].n128_u64[1];
    }
    else
    {
      unint64_t v12 = a1[1].n128_u64[1];
      unint64_t v13 = v6->n128_u64[3 * v7 + 1];
      if (v11 == a1[2].n128_u64[0] && v13 == v12)
      {
        if (!v10) {
          goto LABEL_17;
        }
LABEL_16:
        a1 = (__n128 *)((char *)a1 + 24);
        uint64_t v3 = v9;
        goto LABEL_17;
      }
    }
    uint64_t v15 = **a2;
    uint64_t v16 = (double *)(v15 + 16 * v11);
    uint64_t v17 = (double *)(v15 + 16 * v12);
    if (*v16 < *v17 || *v16 == *v17 && v16[1] < v17[1]) {
      goto LABEL_16;
    }
LABEL_17:
    __n128 result = *a1;
    v6[1].n128_u8[0] = a1[1].n128_u8[0];
    __n128 *v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*>(uint64_t result, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 < 2) {
    return result;
  }
  unint64_t v5 = v4 >> 1;
  int v6 = (uint64_t *)(result + 24 * (v4 >> 1));
  uint64_t v7 = (uint64_t *)(a2 - 24);
  int v8 = *(unsigned __int8 *)(a2 - 8);
  uint64_t v9 = *v6;
  if (*((unsigned __int8 *)v6 + 16) == v8)
  {
    uint64_t v10 = *v7;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(a2 - 24);
  if (v9 != *(void *)(a2 - 16) || *(void *)(result + 24 * v5 + 8) != v10)
  {
LABEL_8:
    uint64_t v12 = **a3;
    unint64_t v13 = (double *)(v12 + 16 * v9);
    uint64_t v14 = (double *)(v12 + 16 * v10);
    if (*v13 >= *v14 && (*v13 != *v14 || v13[1] >= v14[1])) {
      return result;
    }
    goto LABEL_13;
  }
  if (!*((unsigned char *)v6 + 16)) {
    return result;
  }
LABEL_13:
  uint64_t v15 = *(void *)(a2 - 16);
  long long v16 = *(_OWORD *)v6;
  *(unsigned char *)(a2 - _Block_object_dispose(&STACK[0x240], 8) = *((unsigned char *)v6 + 16);
  *(_OWORD *)uint64_t v7 = v16;
  if (v4 >= 2)
  {
    while (1)
    {
      unint64_t v18 = v5 - 1;
      unint64_t v5 = (v5 - 1) >> 1;
      uint64_t v17 = (uint64_t *)(result + 24 * v5);
      uint64_t v19 = *v17;
      if (*((unsigned __int8 *)v17 + 16) != v8
        && (v19 == v15 ? (BOOL v20 = *(void *)(result + 24 * v5 + 8) == v10) : (BOOL v20 = 0), v20))
      {
        if (!*((unsigned char *)v17 + 16)) {
          break;
        }
      }
      else
      {
        uint64_t v21 = **a3;
        uint64_t v22 = (double *)(v21 + 16 * v19);
        uint64_t v23 = (double *)(v21 + 16 * v10);
        if (*v22 >= *v23 && (*v22 != *v23 || v22[1] >= v23[1])) {
          break;
        }
      }
      long long v24 = *(_OWORD *)v17;
      *((unsigned char *)v6 + 16) = *((unsigned char *)v17 + 16);
      *(_OWORD *)int v6 = v24;
      int v6 = (uint64_t *)(result + 24 * v5);
      if (v18 <= 1) {
        goto LABEL_26;
      }
    }
  }
  uint64_t v17 = v6;
LABEL_26:
  *uint64_t v17 = v10;
  v17[1] = v15;
  *((unsigned char *)v17 + 16) = v8;
  return result;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__emplace_unique_key_args<gm::LineSegment<double,2>,gm::LineSegment<double,2> const&>(uint64_t **a1, double *a2, _OWORD *a3)
{
  unint64_t v5 = (void **)std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__find_equal<gm::LineSegment<double,2>>((uint64_t)a1, &v10, a2);
  int v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    int v6 = (uint64_t *)operator new(0x40uLL);
    long long v8 = a3[1];
    *((_OWORD *)v6 + 2) = *a3;
    *((_OWORD *)v6 + 3) = v8;
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__insert_node_at(a1, v10, v7, v6);
  }
  return v6;
}

void *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__find_equal<gm::LineSegment<double,2>>(uint64_t a1, void *a2, double *a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        long long v8 = (void *)v4;
        uint64_t v9 = (double *)(v4 + 32);
        if (!geo::Intersect::SHSegmentComparator<double>::operator()(v7, a3, (double *)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        unint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!geo::Intersect::SHSegmentComparator<double>::operator()(v7, v9, a3)) {
        break;
      }
      unint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    long long v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL geo::Intersect::SHSegmentComparator<double>::operator()(uint64_t a1, double *a2, double *a3)
{
  if (gm::LineSegment<double,2>::operator==((uint64_t)a2, (uint64_t)a3)) {
    return 0;
  }
  double v6 = *a2;
  double v7 = *a3;
  if (*a2 > *a3)
  {
    double v8 = a3[1];
    double v9 = v7 + a3[2] - v7;
    double v10 = v8 + a3[3] - v8;
    double v11 = a2[1];
    double v12 = v9 * (v11 - v8) - (v6 - v7) * v10;
    BOOL v13 = v12 < 0.0;
    if (v12 == 0.0) {
      return v9 * (v11 + a2[3] - v8) - (v6 + a2[2] - v7) * v10 <= 0.0;
    }
    return v13;
  }
  double v14 = a2[1];
  double v15 = v6 + a2[2];
  double v16 = v14 + a2[3] - v14;
  double v17 = a3[1];
  double v18 = (v15 - v6) * (v17 - v14) - (v7 - v6) * v16;
  BOOL v19 = v18 <= 0.0;
  if (v18 == 0.0)
  {
    if (v6 == v15) {
      return v14 < v17;
    }
    BOOL v19 = (v15 - v6) * (v17 + a3[3] - v14) - (v7 + a3[2] - v6) * v16 <= 0.0;
  }
  return !v19;
}

BOOL gm::LineSegment<double,2>::operator==(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8)) {
    return 0;
  }
  float64x2_t v4 = vaddq_f64(*(float64x2_t *)a1, *(float64x2_t *)(a1 + 16));
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)a2, *(float64x2_t *)(a2 + 16));
  return *(void *)&v4.f64[0] == *(void *)&v5.f64[0] && *(void *)&v4.f64[1] == *(void *)&v5.f64[1];
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      float64x2_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), float64x2_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            double v9 = (uint64_t **)a2[2];
          }
          else
          {
            double v9 = (uint64_t **)v2[1];
            double v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            void v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            double *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

BOOL gm::LineSegment<double,2>::intersect<double,void>(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5 = a1[2];
  double v6 = a1[3];
  double v7 = a2[2];
  double v8 = a2[3];
  double v9 = v5 * v8 - v6 * v7;
  if (v9 != 0.0)
  {
    double v10 = v5 + *a1 - *a2;
    double v11 = -v6;
    double v12 = v6 + a1[1] - a2[1];
    *a3 = 1.0 / v9 * (v10 * v8 - v12 * v7);
    *a4 = 1.0 / v9 * (v5 * v12 + v10 * v11);
    if (a5)
    {
      double v13 = a1[1] + a1[3] + v11 * *a3;
      *a5 = *a1 + a1[2] + -v5 * *a3;
      a5[1] = v13;
    }
  }
  return v9 != 0.0;
}

uint64_t std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::find<gm::LineSegment<double,2>>(uint64_t a1, double *a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = geo::Intersect::SHSegmentComparator<double>::operator()(v5, (double *)(v3 + 32), a2);
    double v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      double v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || geo::Intersect::SHSegmentComparator<double>::operator()(v5, a2, (double *)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t *std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    float64x2_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      float64x2_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    float64x2_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      float64x2_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  BOOL v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      BOOL v7 = 0;
      __n128 result = (uint64_t *)v2;
    }
    else
    {
      BOOL v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      __n128 result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 != v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v18 = v7[1];
      *(void *)uint64_t v12 = v18;
      if (v18) {
        *(void *)(v18 + 16) = v12;
      }
      v7[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
      v7[1] = v12;
      *(void *)(v12 + 16) = v7;
      if (result == (uint64_t *)v12) {
        __n128 result = v7;
      }
      BOOL v7 = *(uint64_t **)v12;
    }
    BOOL v19 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_68;
    }
    BOOL v20 = (uint64_t *)v7[1];
    if (v20 && !*((unsigned char *)v20 + 24))
    {
      if (v19 && !*((unsigned char *)v19 + 24))
      {
LABEL_68:
        BOOL v20 = v7;
      }
      else
      {
        *((unsigned char *)v20 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v26 = *v20;
        v7[1] = *v20;
        if (v26) {
          *(void *)(v26 + 16) = v7;
        }
        v20[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
        *BOOL v20 = (uint64_t)v7;
        v7[2] = (uint64_t)v20;
        BOOL v19 = v7;
      }
      uint64_t v23 = v20[2];
      *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      long long v24 = *(uint64_t **)v23;
      uint64_t v27 = *(void *)(*(void *)v23 + 8);
      *(void *)uint64_t v23 = v27;
      if (v27) {
        *(void *)(v27 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((unsigned char *)v7 + 24) = 0;
    double v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
LABEL_49:
    BOOL v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    double v13 = *(uint64_t **)(v12 + 8);
    uint64_t v14 = *v13;
    *(void *)(v12 + _Block_object_dispose(&STACK[0x240], 8) = *v13;
    if (v14) {
      *(void *)(v14 + 16) = v12;
    }
    v13[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
    *double v13 = v12;
    *(void *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7) {
      __n128 result = v7;
    }
    BOOL v7 = *(uint64_t **)(*v7 + 8);
  }
  double v15 = (void *)*v7;
  if (!*v7 || *((unsigned char *)v15 + 24))
  {
    double v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_59;
    }
    *((unsigned char *)v7 + 24) = 0;
    double v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      double v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  double v16 = (uint64_t *)v7[1];
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_59:
    double v15 = v7;
  }
  else
  {
    *((unsigned char *)v15 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = v15[1];
    uint64_t *v7 = v22;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v15[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    double v16 = v7;
  }
  uint64_t v23 = v15[2];
  *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  long long v24 = *(uint64_t **)(v23 + 8);
  uint64_t v25 = *v24;
  *(void *)(v23 + _Block_object_dispose(&STACK[0x240], 8) = *v24;
  if (v25) {
    *(void *)(v25 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  *long long v24 = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(a1, *a2);
    std::__tree<gm::LineSegment<double,2>,geo::Intersect::SHSegmentComparator<double>,std::allocator<gm::LineSegment<double,2>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_18BC976A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BC994DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC995D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC996A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC99924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC99CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MKSeparatingAxisExistsBetweenPolygonsWithPoints(MKMapPoint *a1, unint64_t a2, MKMapPoint *a3, uint64_t a4)
{
  if (!a2) {
    return 0;
  }
  BOOL result = a4 == 0;
  uint64_t v6 = 1;
  while (1)
  {
    BOOL v7 = &a1[v6];
    double x = v7[-1].x;
    double y = v7[-1].y;
    uint64_t v10 = v6 == a2 ? 0 : v6;
    uint64_t v11 = &a1[v10];
    double v12 = v11->x - x;
    double v13 = v11->y - y;
    unint64_t v14 = a2;
    p_double y = &a1->y;
    while (1)
    {
      double v16 = v12 * (*p_y - y) - (*(p_y - 1) - x) * v13;
      if (v16 != 0.0) {
        break;
      }
      p_y += 2;
      if (!--v14)
      {
        uint64_t v17 = 1;
        goto LABEL_12;
      }
    }
    uint64_t v17 = v16 >= 0.0;
    if (v16 > 0.0) {
      uint64_t v17 = 2;
    }
LABEL_12:
    uint64_t v18 = a4;
    BOOL v19 = &a3->y;
    if (!a4) {
      return 1;
    }
    while (1)
    {
      double v20 = v12 * (*v19 - y) - (*(v19 - 1) - x) * v13;
      uint64_t v21 = v20 >= 0.0;
      if (v20 > 0.0) {
        uint64_t v21 = 2;
      }
      if (v20 == 0.0 || v21 == v17) {
        break;
      }
      v19 += 2;
      if (!--v18) {
        return 1;
      }
    }
    if (++v6 > a2) {
      return result;
    }
  }
}

void sub_18BC99F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC9A0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC9A288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC9A474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BC9A630(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __ContactsUILibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ContactsUILibraryCore_frameworkLibrardouble y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18BC9C14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_18BC9C2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZL13_makePolylineI10MKMapPointEP18MKGeodesicPolylinePKT_m_block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(a2, a3);
  uint64_t v6 = *(CLLocationCoordinate2D **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(CLLocationCoordinate2D **)v3;
    uint64_t v9 = ((uint64_t)v6 - *(void *)v3) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v13);
      int v8 = *(CLLocationCoordinate2D **)v3;
      uint64_t v6 = *(CLLocationCoordinate2D **)(v3 + 8);
    }
    else
    {
      uint64_t v14 = 0;
    }
    double v15 = (CLLocationCoordinate2D *)(v13 + 16 * v9);
    unint64_t v16 = v13 + 16 * v14;
    CLLocationCoordinate2D *v15 = v4;
    BOOL v7 = v15 + 1;
    if (v6 != v8)
    {
      do
      {
        v15[-1] = v6[-1];
        --v15;
        --v6;
      }
      while (v6 != v8);
      int v8 = *(CLLocationCoordinate2D **)v3;
    }
    *(void *)uint64_t v3 = v15;
    *(void *)(v3 + _Block_object_dispose(&STACK[0x240], 8) = v7;
    *(void *)(v3 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    CLLocationCoordinate2D *v6 = v4;
    BOOL v7 = v6 + 1;
  }
  *(void *)(v3 + _Block_object_dispose(&STACK[0x240], 8) = v7;
}

uint64_t __copy_helper_block_ea8_32c92_ZTSKZL13_makePolylineI10MKMapPointEP18MKGeodesicPolylinePKT_mEUl23GEOLocationCoordinate2DE_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void ___ZL13_makePolylineI22CLLocationCoordinate2DEP18MKGeodesicPolylinePKT_m_block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(a2, a3);
  uint64_t v6 = *(CLLocationCoordinate2D **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(CLLocationCoordinate2D **)v3;
    uint64_t v9 = ((uint64_t)v6 - *(void *)v3) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v13);
      int v8 = *(CLLocationCoordinate2D **)v3;
      uint64_t v6 = *(CLLocationCoordinate2D **)(v3 + 8);
    }
    else
    {
      uint64_t v14 = 0;
    }
    double v15 = (CLLocationCoordinate2D *)(v13 + 16 * v9);
    unint64_t v16 = v13 + 16 * v14;
    CLLocationCoordinate2D *v15 = v4;
    BOOL v7 = v15 + 1;
    if (v6 != v8)
    {
      do
      {
        v15[-1] = v6[-1];
        --v15;
        --v6;
      }
      while (v6 != v8);
      int v8 = *(CLLocationCoordinate2D **)v3;
    }
    *(void *)uint64_t v3 = v15;
    *(void *)(v3 + _Block_object_dispose(&STACK[0x240], 8) = v7;
    *(void *)(v3 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    CLLocationCoordinate2D *v6 = v4;
    BOOL v7 = v6 + 1;
  }
  *(void *)(v3 + _Block_object_dispose(&STACK[0x240], 8) = v7;
}

uint64_t __copy_helper_block_ea8_32c104_ZTSKZL13_makePolylineI22CLLocationCoordinate2DEP18MKGeodesicPolylinePKT_mEUl23GEOLocationCoordinate2DE_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [v5 firstObject];

  if (v7)
  {
    int v8 = [MKWalletMerchantResponse alloc];
    uint64_t v9 = [v5 firstObject];
    uint64_t v10 = [(MKWalletMerchantResponse *)v8 initWithGEOMapItem:v9];
LABEL_3:
    uint64_t v11 = (void *)v10;

    goto LABEL_6;
  }
  if (!v6)
  {
    unint64_t v13 = [MKWalletMerchantResponse alloc];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) merchantLookupResult];
    uint64_t v10 = [(MKWalletMerchantResponse *)v13 initWithMerchantLookupResult:v9];
    goto LABEL_3;
  }
  uint64_t v11 = 0;
LABEL_6:
  BOOL v12 = *(NSObject **)(a1 + 40);
  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke_2;
    block[3] = &unk_1E54B83F8;
    id v17 = *(id *)(a1 + 48);
    id v15 = v11;
    id v16 = v6;
    dispatch_async(v12, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

BOOL MKGuidanceManeuverArrowMetricsEqualToArrowMetrics(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
    && (a1[1] == a2[1] ? (BOOL v2 = a1[2] == a2[2]) : (BOOL v2 = 0),
        v2
     && a1[3] == a2[3]
     && a1[4] == a2[4]
     && a1[5] == a2[5]
     && (a1[6] == a2[6] ? (BOOL v3 = a1[7] == a2[7]) : (BOOL v3 = 0),
         v3
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[11] == a2[11]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && *((void *)a1 + 14) == *((void *)a2 + 14)
      && a1[15] == a2[15]
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19]
      && a1[20] == a2[20]
      && a1[21] == a2[21]
      && a1[22] == a2[22]
      && a1[23] == a2[23]
      && a1[24] == a2[24]
      && a1[25] == a2[25]
      && a1[26] == a2[26]
      && a1[27] == a2[27]
      && a1[28] == a2[28]
      && a1[29] == a2[29]
      && a1[30] == a2[30]
      && a1[31] == a2[31]
      && a1[32] == a2[32]
      && a1[33] == a2[33]
      && a1[34] == a2[34]
      && a1[35] == a2[35]
      && a1[36] == a2[36]
      && *((unsigned __int8 *)a1 + 296) == *((unsigned __int8 *)a2 + 296)
      && a1[38] == a2[38]
      && a1[39] == a2[39]
      && a1[40] == a2[40]
      && a1[41] == a2[41]
      && *((unsigned __int8 *)a1 + 336) == *((unsigned __int8 *)a2 + 336)
      && *((unsigned __int8 *)a1 + 337) == *((unsigned __int8 *)a2 + 337)
      && *((unsigned __int8 *)a1 + 338) == *((unsigned __int8 *)a2 + 338)
      && *((unsigned __int8 *)a1 + 339) == *((unsigned __int8 *)a2 + 339)
      && a1[43] == a2[43]
      && a1[44] == a2[44]
      && a1[45] == a2[45]
      && a1[46] == a2[46]
      && a1[47] == a2[47]
      && a1[48] == a2[48]
      && a1[49] == a2[49]
      && a1[50] == a2[50]
      && a1[51] == a2[51]
      && a1[52] == a2[52]
      && a1[53] == a2[53]
      && a1[54] == a2[54]
      && a1[55] == a2[55]
      && a1[56] == a2[56]
      && a1[57] == a2[57]
      && a1[58] == a2[58]
      && a1[59] == a2[59]
      && a1[60] == a2[60])))
  {
    return a1[61] == a2[61];
  }
  else
  {
    return 0;
  }
}

double _MKUpdatedGuidanceManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = MKDefaultGuidanceManeuverMetrics_referenceSize;
  __asm { FMOV            V0.2D, #7.0 }
  *(_OWORD *)(a1 + 24) = _Q0;
  *(_OWORD *)(a1 + 40) = xmmword_18BD1BAA0;
  *(_OWORD *)(a1 + 56) = xmmword_18BD1BAB0;
  *(_OWORD *)(a1 + 72) = xmmword_18BD1BAC0;
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BAD0;
  *(void *)(a1 + 104) = 0x4026000000000000;
  *(void *)(a1 + 112) = 3;
  *(_OWORD *)(a1 + 120) = xmmword_18BD1BAE0;
  *(_OWORD *)(a1 + 136) = xmmword_18BD1BAF0;
  *(_OWORD *)(a1 + 152) = xmmword_18BD1BB00;
  *(_OWORD *)(a1 + 16_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BB10;
  *(_OWORD *)(a1 + 184) = xmmword_18BD1BB20;
  *(_OWORD *)(a1 + 200) = xmmword_18BD1BB30;
  *(_OWORD *)(a1 + 216) = xmmword_18BD1BB40;
  *(_OWORD *)(a1 + 232) = xmmword_18BD1BB50;
  *(_OWORD *)(a1 + 24_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BB60;
  *(void *)(a1 + 264) = 0x403E8BA2F8000000;
  *(_OWORD *)(a1 + 272) = xmmword_18BD1BB70;
  *(void *)(a1 + 28_Block_object_dispose(&STACK[0x240], 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = xmmword_18BD1BB60;
  *(_OWORD *)(a1 + 320) = xmmword_18BD1BB80;
  *(_DWORD *)(a1 + 336) = 16777217;
  *(void *)(a1 + 48_Block_object_dispose(&STACK[0x240], 8) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 40_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  return result;
}

double MKDefaultGuidanceManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  if (GEOConfigGetBOOL())
  {
    return _MKUpdatedGuidanceManeuverMetrics(a1);
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = MKDefaultGuidanceManeuverMetrics_referenceSize;
    __asm { FMOV            V0.2D, #8.0 }
    *(_OWORD *)(a1 + 24) = _Q0;
    *(_OWORD *)(a1 + 40) = xmmword_18BD1BB90;
    *(_OWORD *)(a1 + 56) = xmmword_18BD1BBA0;
    *(_OWORD *)(a1 + 72) = xmmword_18BD1BBB0;
    *(void *)(a1 + 8_Block_object_dispose(&STACK[0x240], 8) = 0;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = 3;
    *(_OWORD *)(a1 + 120) = xmmword_18BD1BBC0;
    *(_OWORD *)(a1 + 136) = xmmword_18BD1BBD0;
    *(_OWORD *)(a1 + 152) = xmmword_18BD1BBE0;
    *(void *)(a1 + 176) = 0;
    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 16_Block_object_dispose(&STACK[0x240], 8) = 0x402E000000000000;
    *(_OWORD *)(a1 + 192) = xmmword_18BD1BBF0;
    *(_OWORD *)(a1 + 20_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BC00;
    *(_OWORD *)(a1 + 224) = xmmword_18BD1BC10;
    *(_OWORD *)(a1 + 240) = xmmword_18BD1BC20;
    *(_OWORD *)(a1 + 256) = xmmword_18BD1BC30;
    *(_OWORD *)(a1 + 272) = xmmword_18BD1BB70;
    *(void *)(a1 + 28_Block_object_dispose(&STACK[0x240], 8) = 0x4024000000000000;
    *(unsigned char *)(a1 + 296) = 0;
    *(_OWORD *)(a1 + 304) = xmmword_18BD1BC40;
    *(_OWORD *)(a1 + 320) = xmmword_18BD1BC50;
    *(_DWORD *)(a1 + 336) = 1;
    *(void *)(a1 + 48_Block_object_dispose(&STACK[0x240], 8) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 456) = 0u;
    *(_OWORD *)(a1 + 472) = 0u;
    *(_OWORD *)(a1 + 424) = 0u;
    *(_OWORD *)(a1 + 440) = 0u;
    *(_OWORD *)(a1 + 392) = 0u;
    *(_OWORD *)(a1 + 40_Block_object_dispose(&STACK[0x240], 8) = 0u;
    *(_OWORD *)(a1 + 360) = 0u;
    *(_OWORD *)(a1 + 376) = 0u;
    *(_OWORD *)(a1 + 344) = 0u;
  }
  return result;
}

double MKDefaultJunctionManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 44_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 36_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 28_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  MKDefaultGuidanceManeuverMetrics(a1);
  *(void *)(a1 + 24) = 0x401C000000000000;
  *(_OWORD *)(a1 + 136) = xmmword_18BD1BC60;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 240) = 0x4037000000000000;
  int8x16_t v2 = (int8x16_t)vmulq_f64(*(float64x2_t *)(a1 + 8), (float64x2_t)xmmword_18BD1BC70);
  *(int8x16_t *)(a1 + 224) = vextq_s8(v2, v2, 8uLL);
  *(void *)(a1 + 200) = v2.i64[0];
  *(void *)(a1 + 216) = 0x4030000000000000;
  *(void *)(a1 + 384) = 0x4020000000000000;
  double result = 8.0;
  *(_OWORD *)(a1 + 80) = xmmword_18BD1BC80;
  return result;
}

double MKDefaultCompactManeuverMetrics@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = MKDefaultCompactManeuverMetrics_referenceSize;
  *(_OWORD *)(a1 + 24) = xmmword_18BD1BC90;
  *(_OWORD *)(a1 + 40) = xmmword_18BD1BCA0;
  *(_OWORD *)(a1 + 56) = xmmword_18BD1BCB0;
  *(_OWORD *)(a1 + 72) = xmmword_18BD1BCC0;
  *(_OWORD *)(a1 + 8_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1B590;
  *(void *)(a1 + 104) = 0x401C000000000000;
  *(void *)(a1 + 112) = 3;
  *(_OWORD *)(a1 + 120) = xmmword_18BD1BCD0;
  *(_OWORD *)(a1 + 136) = xmmword_18BD1BCE0;
  *(_OWORD *)(a1 + 152) = xmmword_18BD1BCF0;
  *(_OWORD *)(a1 + 16_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BD00;
  *(_OWORD *)(a1 + 184) = xmmword_18BD1BD10;
  *(_OWORD *)(a1 + 200) = xmmword_18BD1BD20;
  *(_OWORD *)(a1 + 216) = xmmword_18BD1BD30;
  *(_OWORD *)(a1 + 232) = xmmword_18BD1BD40;
  *(_OWORD *)(a1 + 24_Block_object_dispose(&STACK[0x240], 8) = xmmword_18BD1BD50;
  *(void *)(a1 + 264) = 0x40305D174E000000;
  *(_OWORD *)(a1 + 272) = xmmword_18BD1BD60;
  *(void *)(a1 + 28_Block_object_dispose(&STACK[0x240], 8) = 0x4014000000000000;
  *(unsigned char *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = xmmword_18BD1BD50;
  *(_OWORD *)(a1 + 320) = xmmword_18BD1BD70;
  *(_DWORD *)(a1 + 336) = 16842753;
  *(void *)(a1 + 48_Block_object_dispose(&STACK[0x240], 8) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 40_Block_object_dispose(&STACK[0x240], 8) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  return result;
}

uint64_t _MKGuidanceManeuverArrowMetricsApplyScaleForContent(uint64_t result, uint64_t a2, int a3, double a4, double a5)
{
  *(unsigned char *)double result = 0;
  v5.f64[0] = *(float64_t *)(a2 + 8);
  if (a3)
  {
    v5.f64[1] = *(float64_t *)(a2 + 16);
    float64x2_t v6 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    *(float64x2_t *)(result + _Block_object_dispose(&STACK[0x240], 8) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v5, a5), a4)), v6);
    *(float64x2_t *)(result + 24) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 24), a5), a4)), v6);
    *(float64x2_t *)(result + 40) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 40), a5), a4)), v6);
    *(float64x2_t *)(result + 56) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 56), a5), a4)), v6);
    *(float64x2_t *)(result + 72) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 72), a5), a4)), v6);
    *(float64x2_t *)(result + 8_Block_object_dispose(&STACK[0x240], 8) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 88), a5), a4)), v6);
    *(double *)(result + 104) = round(*(double *)(a2 + 104) * a5 * a4) / a5;
    *(void *)(result + 112) = *(void *)(a2 + 112);
    *(float64x2_t *)(result + 120) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 120), a5), a4)), v6);
    *(float64x2_t *)(result + 136) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 136), a5), a4)), v6);
    *(double *)(result + 152) = round(*(double *)(a2 + 152) * a5 * a4) / a5;
    float64x2_t v7 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 176), a5), a4)), v6);
    *(_OWORD *)(result + 160) = *(_OWORD *)(a2 + 160);
    *(float64x2_t *)(result + 176) = v7;
    float64x2_t v8 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 208), a5), a4)), v6);
    *(float64x2_t *)(result + 192) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 192), a5), a4)), v6);
    *(float64x2_t *)(result + 20_Block_object_dispose(&STACK[0x240], 8) = v8;
    float64x2_t v9 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 240), a5), a4)), v6);
    *(float64x2_t *)(result + 224) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 224), a5), a4)), v6);
    *(float64x2_t *)(result + 240) = v9;
    float64x2_t v10 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 272), a5), a4)), v6);
    *(float64x2_t *)(result + 256) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 256), a5), a4)), v6);
    *(float64x2_t *)(result + 272) = v10;
    *(double *)(result + 28_Block_object_dispose(&STACK[0x240], 8) = round(*(double *)(a2 + 288) * a5 * a4) / a5;
    *(unsigned char *)(result + 296) = *(unsigned char *)(a2 + 296);
    float64x2_t v11 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 304), a5), a4)), v6);
    double v12 = round(*(double *)(a2 + 320) * a5 * a4) / a5;
  }
  else
  {
    *(double *)(result + _Block_object_dispose(&STACK[0x240], 8) = v5.f64[0] * a4;
    float64x2_t v13 = vmulq_n_f64(*(float64x2_t *)(a2 + 32), a4);
    *(float64x2_t *)(result + 16) = vmulq_n_f64(*(float64x2_t *)(a2 + 16), a4);
    *(float64x2_t *)(result + 32) = v13;
    float64x2_t v14 = vmulq_n_f64(*(float64x2_t *)(a2 + 64), a4);
    *(float64x2_t *)(result + 4_Block_object_dispose(&STACK[0x240], 8) = vmulq_n_f64(*(float64x2_t *)(a2 + 48), a4);
    *(float64x2_t *)(result + 64) = v14;
    float64x2_t v15 = vmulq_n_f64(*(float64x2_t *)(a2 + 96), a4);
    *(float64x2_t *)(result + 80) = vmulq_n_f64(*(float64x2_t *)(a2 + 80), a4);
    *(float64x2_t *)(result + 96) = v15;
    *(void *)(result + 112) = *(void *)(a2 + 112);
    *(float64x2_t *)(result + 120) = vmulq_n_f64(*(float64x2_t *)(a2 + 120), a4);
    *(float64x2_t *)(result + 136) = vmulq_n_f64(*(float64x2_t *)(a2 + 136), a4);
    *(double *)(result + 152) = *(double *)(a2 + 152) * a4;
    float64x2_t v16 = vmulq_n_f64(*(float64x2_t *)(a2 + 176), a4);
    *(_OWORD *)(result + 160) = *(_OWORD *)(a2 + 160);
    *(float64x2_t *)(result + 176) = v16;
    float64x2_t v17 = vmulq_n_f64(*(float64x2_t *)(a2 + 208), a4);
    *(float64x2_t *)(result + 192) = vmulq_n_f64(*(float64x2_t *)(a2 + 192), a4);
    *(float64x2_t *)(result + 20_Block_object_dispose(&STACK[0x240], 8) = v17;
    float64x2_t v18 = vmulq_n_f64(*(float64x2_t *)(a2 + 240), a4);
    *(float64x2_t *)(result + 224) = vmulq_n_f64(*(float64x2_t *)(a2 + 224), a4);
    *(float64x2_t *)(result + 240) = v18;
    float64x2_t v19 = vmulq_n_f64(*(float64x2_t *)(a2 + 272), a4);
    *(float64x2_t *)(result + 256) = vmulq_n_f64(*(float64x2_t *)(a2 + 256), a4);
    *(float64x2_t *)(result + 272) = v19;
    *(double *)(result + 28_Block_object_dispose(&STACK[0x240], 8) = *(double *)(a2 + 288) * a4;
    float64x2_t v11 = vmulq_n_f64(*(float64x2_t *)(a2 + 304), a4);
    double v12 = *(double *)(a2 + 320) * a4;
    *(unsigned char *)(result + 296) = *(unsigned char *)(a2 + 296);
  }
  *(float64x2_t *)(result + 304) = v11;
  uint64_t v20 = *(void *)(a2 + 328);
  *(double *)(result + 320) = v12;
  *(void *)(result + 32_Block_object_dispose(&STACK[0x240], 8) = v20;
  *(_DWORD *)(result + 336) = *(_DWORD *)(a2 + 336);
  v11.f64[0] = *(float64_t *)(a2 + 344);
  if (a3)
  {
    v11.f64[1] = *(float64_t *)(a2 + 352);
    float64x2_t v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    float64x2_t v22 = *(float64x2_t *)(a2 + 376);
    float64x2_t v23 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 360), a5), a4)), v21);
    *(float64x2_t *)(result + 344) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v11, a5), a4)), v21);
    *(float64x2_t *)(result + 360) = v23;
    float64x2_t v24 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v22, a5), a4)), v21);
    float64x2_t v25 = *(float64x2_t *)(a2 + 408);
    float64x2_t v26 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 392), a5), a4)), v21);
    *(float64x2_t *)(result + 376) = v24;
    *(float64x2_t *)(result + 392) = v26;
    float64x2_t v27 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v25, a5), a4)), v21);
    float64x2_t v28 = *(float64x2_t *)(a2 + 440);
    float64x2_t v29 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 424), a5), a4)), v21);
    *(float64x2_t *)(result + 40_Block_object_dispose(&STACK[0x240], 8) = v27;
    *(float64x2_t *)(result + 424) = v29;
    *(float64x2_t *)(result + 440) = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(v28, a5), a4)), v21);
    float64x2_t v30 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 456), a5), a4)), v21);
    float64x2_t v31 = vdivq_f64(vrndaq_f64(vmulq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 472), a5), a4)), v21);
    double v32 = round(*(double *)(a2 + 488) * a5 * a4) / a5;
  }
  else
  {
    *(double *)(result + 344) = v11.f64[0] * a4;
    float64x2_t v33 = vmulq_n_f64(*(float64x2_t *)(a2 + 368), a4);
    *(float64x2_t *)(result + 352) = vmulq_n_f64(*(float64x2_t *)(a2 + 352), a4);
    *(float64x2_t *)(result + 36_Block_object_dispose(&STACK[0x240], 8) = v33;
    float64x2_t v34 = vmulq_n_f64(*(float64x2_t *)(a2 + 400), a4);
    *(float64x2_t *)(result + 384) = vmulq_n_f64(*(float64x2_t *)(a2 + 384), a4);
    *(float64x2_t *)(result + 400) = v34;
    float64x2_t v35 = vmulq_n_f64(*(float64x2_t *)(a2 + 432), a4);
    *(float64x2_t *)(result + 416) = vmulq_n_f64(*(float64x2_t *)(a2 + 416), a4);
    *(float64x2_t *)(result + 432) = v35;
    *(double *)(result + 44_Block_object_dispose(&STACK[0x240], 8) = *(double *)(a2 + 448) * a4;
    float64x2_t v30 = vmulq_n_f64(*(float64x2_t *)(a2 + 456), a4);
    float64x2_t v31 = vmulq_n_f64(*(float64x2_t *)(a2 + 472), a4);
    double v32 = *(double *)(a2 + 488) * a4;
  }
  *(float64x2_t *)(result + 456) = v30;
  *(float64x2_t *)(result + 472) = v31;
  *(double *)(result + 48_Block_object_dispose(&STACK[0x240], 8) = v32;
  return result;
}

uint64_t MKGuidanceManeuverArrowMetricsApplyScale@<X0>(void *__src@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  memcpy(v6, __src, sizeof(v6));
  return _MKGuidanceManeuverArrowMetricsApplyScaleForContent(a2, (uint64_t)v6, 0, a3, 1.0);
}

uint64_t MKGuidanceManeuverArrowMetricsApplyScaleForContent@<X0>(void *__src@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  memcpy(v8, __src, sizeof(v8));
  return _MKGuidanceManeuverArrowMetricsApplyScaleForContent(a2, (uint64_t)v8, 1, a3, a4);
}

void MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(void *a1, uint64_t a2, uint64_t a3, long long *a4, CGFloat a5)
{
  id v8 = a1;
  double v10 = *(double *)(a2 + 48);
  double v9 = *(double *)(a2 + 56);
  double v11 = *(double *)(a2 + 24);
  double v12 = (v10 - v11) * 0.5;
  double v13 = 0.0 - v12;
  double v64 = v11;
  double v14 = v11 + 0.0;
  double v15 = v11 + 0.0 + v12;
  double v16 = (0.0 - v12 + v15) * 0.5;
  double v17 = 0.0 - v9;
  if (v16 == 0.0 - v12)
  {
    double v18 = INFINITY;
    double v19 = (0.0 - v12 + v15) * 0.5;
  }
  else
  {
    double v18 = v17 / (v16 - v13);
    double v19 = v17 - v18 * v16;
  }
  if (v16 == v15)
  {
    double v20 = INFINITY;
    double v21 = v16;
  }
  else
  {
    double v20 = v17 / (v16 - v15);
    double v21 = v17 - v20 * v16;
  }
  double v68 = v21;
  double v69 = v20;
  double v70 = 0.0 - v9;
  double v65 = v18;
  switch(*(void *)(a2 + 112))
  {
    case 0:
      double v62 = *(double *)(a2 + 56);
      goto LABEL_10;
    case 1:
      double v62 = *(double *)(a2 + 56);
      double v22 = *(double *)(a2 + 48);
      float64x2_t v23 = [MEMORY[0x1E4F427D0] bezierPath];
      [v23 moveToPoint:v14];
      double v17 = v70;
      objc_msgSend(v23, "addLineToPoint:", v14, v64 * 1.39999998 + v68 + v69 * v14);
      objc_msgSend(v23, "addLineToPoint:", v15, v64 * 1.39999998 + 0.0);
      objc_msgSend(v23, "addLineToPoint:", v15, 0.0);
      objc_msgSend(v23, "addLineToPoint:", v16, v70);
      objc_msgSend(v23, "addLineToPoint:", v13, 0.0);
      objc_msgSend(v23, "addLineToPoint:", v13, v64 * 1.39999998 + 0.0);
      objc_msgSend(v23, "addLineToPoint:", 0.0, v64 * 1.39999998 + v19 + v18 * 0.0);
      objc_msgSend(v23, "addLineToPoint:", 0.0, 0.0);
      [v23 closePath];
      long long v24 = a4[1];
      long long v72 = *a4;
      long long v73 = v24;
      long long v74 = a4[2];
      [v23 applyTransform:&v72];
      [v8 appendPath:v23];

      double v10 = v22;
LABEL_10:
      double v60 = v10;
      float64x2_t v25 = [MEMORY[0x1E4F427D0] bezierPath];
      objc_msgSend(v25, "moveToPoint:", v16, v17);
      objc_msgSend(v25, "addLineToPoint:", v13, 0.0);
      objc_msgSend(v25, "addCurveToPoint:controlPoint1:controlPoint2:", 0.0, 0.0, v13, 0.0);
      objc_msgSend(v25, "addLineToPoint:", 0.0, 0.0);
      objc_msgSend(v25, "addLineToPoint:", v14, 0.0);
      double v17 = v70;
      objc_msgSend(v25, "addCurveToPoint:controlPoint1:controlPoint2:", v15, 0.0);
      objc_msgSend(v25, "addLineToPoint:", v16, v70);
      [v25 closePath];
      long long v26 = a4[1];
      long long v72 = *a4;
      long long v73 = v26;
      long long v74 = a4[2];
      [v25 applyTransform:&v72];
      [v8 appendPath:v25];

      goto LABEL_12;
    case 2:
      double v60 = *(double *)(a2 + 48);
      double v62 = *(double *)(a2 + 56);
LABEL_12:
      float64x2_t v27 = [MEMORY[0x1E4F427D0] bezierPath];
      objc_msgSend(v27, "moveToPoint:", v14, 0.0);
      objc_msgSend(v27, "addLineToPoint:", v15, 0.0);
      objc_msgSend(v27, "addLineToPoint:", v16, v17);
      objc_msgSend(v27, "addLineToPoint:", v13, 0.0);
      objc_msgSend(v27, "addLineToPoint:", 0.0, 0.0);
      [v27 closePath];
      long long v28 = a4[1];
      long long v72 = *a4;
      long long v73 = v28;
      long long v74 = a4[2];
      [v27 applyTransform:&v72];
      [v8 appendPath:v27];

      double v10 = v60;
      double v9 = v62;
      goto LABEL_13;
    case 3:
LABEL_13:
      if (v10 == 0.0) {
        goto LABEL_34;
      }
      double v59 = v19;
      if (v10 / 24.0 >= v9 / 19.0) {
        double v29 = v9 / 19.0;
      }
      else {
        double v29 = v10 / 24.0;
      }
      double v30 = v29 * 2.0999999;
      double v31 = v29 + v29;
      __double x = *(double *)(a2 + 160) * 0.0174532925;
      double v32 = atan(v9 / v10);
      float64x2_t v33 = [MEMORY[0x1E4F427D0] bezierPath];
      double v58 = v29 + v29;
      double v34 = (v29 + v29) * 0.829037573;
      if (v34 < 0.0) {
        double v34 = v31 * -0.829037573;
      }
      double v35 = v31 * 0.440807097;
      if (v31 * 0.440807097 < 0.0) {
        double v35 = v31 * -0.440807097;
      }
      double v63 = v15;
      double v36 = v70 + v35;
      double v54 = v70 + v35;
      double v57 = v16 + v34;
      double v52 = v16 - v34;
      double v53 = v13 + v30;
      double v61 = -(v29 * 2.0999999);
      double v66 = v16;
      double v55 = v32;
      __double2 v38 = __sincos_stret(1.25663706 - v32);
      double cosval = v38.__cosval;
      if (v38.__cosval < 0.0) {
        double cosval = -v38.__cosval;
      }
      double v39 = v13;
      double v40 = v30 * (1.0 - cosval);
      __double2 v42 = __sincos_stret(v32 + -1.57079633 + 1.25663706);
      double v41 = v42.__cosval;
      if (v42.__cosval < 0.0) {
        double v41 = -v42.__cosval;
      }
      double v43 = v39 + v30 * (v42.__sinval + 1.0);
      double v44 = -(v30 * (1.0 - v41));
      objc_msgSend(v33, "moveToPoint:", v52, v36);
      objc_msgSend(v33, "addLineToPoint:", v39 + v40, -(v30 * (v38.__sinval + 1.0)));
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v53, v61, v30, 1.25663706 - v32 + 3.14159265, 1.25663706 - v32 + 3.14159265 + -2.51327412);
      double v45 = v66 + v64 * -0.5;
      double v46 = tan(__x);
      double v47 = -(v45 - v43);
      if (v45 - v43 < 0.0) {
        double v47 = v45 - v43;
      }
      double v48 = v44 + v47 * v46;
      double v49 = v43 - v39;
      if (v43 - v39 < 0.0) {
        double v49 = -(v43 - v39);
      }
      double v50 = v63 - v49;
      objc_msgSend(v33, "addLineToPoint:", v45, v48);
      objc_msgSend(v33, "addLineToPoint:", v45, -a5);
      double v15 = v63;
      objc_msgSend(v33, "addLineToPoint:", v66 + v64 * 0.5, -a5);
      double v17 = v70;
      objc_msgSend(v33, "addLineToPoint:", v66 + v64 * 0.5, v48);
      objc_msgSend(v33, "addLineToPoint:", v50, v44);
      double v16 = v66;
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v63 - v30, v61, v30, v55 + 1.25663706 + -6.28318531, v55 + 1.25663706 + -6.28318531 + -2.51327412);
      objc_msgSend(v33, "addLineToPoint:", v57, v54);
      objc_msgSend(v33, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v66, v70 + v58, v58, 5.68977336, 3.7350046);
      [v33 closePath];
      if (a5 > 0.0)
      {
        CGAffineTransformMakeTranslation(&v71, 0.0, a5);
        [v33 applyTransform:&v71];
      }
      long long v51 = a4[1];
      long long v72 = *a4;
      long long v73 = v51;
      long long v74 = a4[2];
      [v33 applyTransform:&v72];
      [v8 appendPath:v33];

      double v13 = v39;
      double v18 = v65;
      double v19 = v59;
LABEL_32:
      if (a3)
      {
        *(double *)a3 = v16;
        *(double *)(a3 + _Block_object_dispose(&STACK[0x240], 8) = v17;
        *(double *)(a3 + 16) = v13;
        *(void *)(a3 + 24) = 0;
        *(double *)(a3 + 32) = v15;
        *(void *)(a3 + 40) = 0;
        *(double *)(a3 + 4_Block_object_dispose(&STACK[0x240], 8) = v18;
        *(double *)(a3 + 56) = v19;
        *(double *)(a3 + 64) = v69;
        *(double *)(a3 + 72) = v68;
      }
LABEL_34:

      return;
    default:
      goto LABEL_32;
  }
}

void MKArrowAppendInitialSegmentToPathInvertingCorners(void *a1, uint64_t a2, _OWORD *a3, int a4, double a5)
{
  id v9 = a1;
  double v10 = *(double *)(a2 + 24);
  if (*(double *)(a2 + 64) >= v10 * 0.5) {
    double v11 = v10 * 0.5;
  }
  else {
    double v11 = *(double *)(a2 + 64);
  }
  if (v11 <= 0.0)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, -a5);
  }
  else
  {
    if (a4) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 12;
    }
    double v13 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v12, 0.0, -a5, v10, a5, v11, v11);
  }
  double v14 = v13;
  long long v15 = a3[1];
  *(_OWORD *)&v19.a = *a3;
  *(_OWORD *)&v19.c = v15;
  *(_OWORD *)&v19.tdouble x = a3[2];
  [v13 applyTransform:&v19];
  [v9 appendPath:v14];
  long long v16 = a3[1];
  *(_OWORD *)&v18.a = *a3;
  *(_OWORD *)&v18.c = v16;
  *(_OWORD *)&v18.tdouble x = a3[2];
  CGAffineTransformTranslate(&v19, &v18, 0.0, -a5);
  long long v17 = *(_OWORD *)&v19.c;
  *a3 = *(_OWORD *)&v19.a;
  a3[1] = v17;
  a3[2] = *(_OWORD *)&v19.tx;
}

void MKArrowAppendSegmentToPath(void *a1, uint64_t a2, _OWORD *a3, double a4)
{
  id v7 = a1;
  id v8 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, -a4, *(double *)(a2 + 24), a4);
  long long v9 = a3[1];
  *(_OWORD *)&v13.a = *a3;
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tdouble x = a3[2];
  [v8 applyTransform:&v13];
  [v7 appendPath:v8];
  long long v10 = a3[1];
  *(_OWORD *)&v12.a = *a3;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tdouble x = a3[2];
  CGAffineTransformTranslate(&v13, &v12, 0.0, -a4);
  long long v11 = *(_OWORD *)&v13.c;
  *a3 = *(_OWORD *)&v13.a;
  a3[1] = v11;
  a3[2] = *(_OWORD *)&v13.tx;
}

void MKArrowAppendRightAngleCurveToPath(void *a1, double *a2, _OWORD *a3)
{
  id v5 = a1;
  double v6 = a2[3];
  id v7 = [MEMORY[0x1E4F427D0] bezierPath];
  id v8 = v7;
  double v9 = a2[15];
  if (v9 <= v6) {
    double v10 = v6;
  }
  else {
    double v10 = a2[15];
  }
  double v11 = v9 + 0.0;
  double v12 = 0.0 - v10;
  double v13 = v9 + 0.0 - v9;
  objc_msgSend(v7, "moveToPoint:", 0.0, 0.0);
  objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v11, v12, v13, v12);
  double v14 = v6 - a2[15];
  if (v14 > 0.0)
  {
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v12);
    double v14 = v6 - a2[15];
  }
  double v15 = v6 + v12;
  if (v14 > 0.0) {
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v15);
  }
  objc_msgSend(v8, "addLineToPoint:", v11, v15);
  double v16 = a2[16];
  if (v16 <= 0.0)
  {
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, v15);
  }
  else
  {
    double v17 = v15 + v16;
    objc_msgSend(v8, "addLineToPoint:", v6 + 0.0 + v16, v15);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v6 + 0.0, v17, v6 + 0.0, v15);
  }
  objc_msgSend(v8, "addLineToPoint:", v6 + 0.0, 0.0);
  [v8 closePath];
  long long v18 = a3[1];
  *(_OWORD *)&v24.a = *a3;
  *(_OWORD *)&v24.c = v18;
  *(_OWORD *)&v24.tdouble x = a3[2];
  [v8 applyTransform:&v24];
  [v5 appendPath:v8];
  long long v19 = a3[1];
  *(_OWORD *)&v24.a = *a3;
  *(_OWORD *)&v24.c = v19;
  *(_OWORD *)&v24.tdouble x = a3[2];
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v19;
  *(_OWORD *)&v23.tdouble x = a3[2];
  CGAffineTransformTranslate(&v24, &v23, v10, -v10);
  CGAffineTransform v22 = v24;
  CGAffineTransformRotate(&v23, &v22, 1.57079633);
  long long v21 = *(_OWORD *)&v23.c;
  long long v20 = *(_OWORD *)&v23.tx;
  CGAffineTransform v24 = v23;
  *a3 = *(_OWORD *)&v23.a;
  a3[1] = v21;
  a3[2] = v20;
}

void MKArrowAppendCurveToPathWithOptions(void *a1, char a2, double *__src, _OWORD *a4, double *a5, double a6)
{
  if (fabs(a6 + 0.785398163) >= 0.000001 && fabs(a6 + 2.35619449) >= 0.000001)
  {
    if (fabs(a6 + -0.785398163) >= 0.000001 && fabs(a6 + 3.92699082) >= 0.000001)
    {
      double v12 = __src[9];
      goto LABEL_8;
    }
    double v11 = __src + 26;
  }
  else
  {
    double v11 = __src + 30;
  }
  double v12 = *v11;
LABEL_8:
  memcpy(v13, __src, sizeof(v13));
  MKArrowAppendCurveToPathWithOptionsAndRadius(a1, a2, (uint64_t)v13, a4, a5, a6, v12);
}

void MKArrowAppendCurveToPathWithOptionsAndRadius(void *a1, char a2, uint64_t a3, _OWORD *a4, double *a5, double a6, double a7)
{
  id v13 = a1;
  if (a6 == -1.57079633) {
    goto LABEL_15;
  }
  double v14 = *(double *)(a3 + 24);
  double v56 = fmax(a7 - v14, 0.0);
  double v15 = fmax(v14 - a7, 0.0);
  double v16 = [MEMORY[0x1E4F427D0] bezierPath];
  double v17 = v16;
  long long v18 = a4[1];
  *(_OWORD *)&v59.a = *a4;
  *(_OWORD *)&v59.c = v18;
  *(_OWORD *)&v59.tdouble x = a4[2];
  if (a6 <= -1.57079633)
  {
    double v34 = a6 + 1.57079633;
    objc_msgSend(v16, "moveToPoint:", v14 + 0.0, 0.0);
    double v35 = v14 + 0.0 - a7;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v35, 0.0 - v15, a7, 0.0, v34 * 0.5);
    [v17 currentPoint];
    double v53 = v37;
    double v55 = v36;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v35, 0.0 - v15, a7, v34 * 0.5, v34);
    [v17 currentPoint];
    double v39 = v38;
    double v41 = v40;
    __double2 v42 = __sincos_stret(v34 + 3.14159265);
    double v43 = v39 + v14 * v42.__cosval;
    double v44 = v41 + v14 * v42.__sinval;
    objc_msgSend(v17, "addLineToPoint:", v43, v44);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v35, 0.0 - v15, v56, v34, v34 * 0.5);
    [v17 currentPoint];
    double v52 = v45;
    double v31 = v46;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v35, 0.0 - v15, v56, v34 * 0.5, 0.0);
    if ((a2 & 1) == 0) {
      objc_msgSend(v17, "addLineToPoint:", 0.0, 0.0);
    }
    CGAffineTransform v58 = v59;
    CGAffineTransformTranslate(&v59, &v58, v43, v44);
    CGAffineTransform v57 = v59;
    CGAffineTransformRotate(&v58, &v57, v34);
    CGAffineTransform v59 = v58;
    if (!a5) {
      goto LABEL_12;
    }
    double v33 = v55 + v52;
    double v32 = v53;
  }
  else
  {
    double v19 = a6 + -1.57079633;
    objc_msgSend(v16, "moveToPoint:", 0.0, 0.0);
    double v20 = 0.0 - v15;
    double v51 = a7 + 0.0;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a7 + 0.0, v20, a7, 3.14159265, (a6 + -1.57079633 + -3.14159265) * 0.5);
    [v17 currentPoint];
    double v49 = v22;
    double v50 = v21;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a7 + 0.0, v20, a7, (v19 + -3.14159265) * 0.5, v19);
    [v17 currentPoint];
    double v24 = v23;
    double v26 = v25;
    __double2 v27 = __sincos_stret(a6 + -1.57079633 + 3.14159265);
    CGFloat v54 = v26;
    objc_msgSend(v17, "addLineToPoint:", v24 + v14 * v27.__cosval, v26 + v14 * v27.__sinval);
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v51, v20, v56, v19, (v19 + -3.14159265) * 0.5);
    [v17 currentPoint];
    double v29 = v28;
    double v31 = v30;
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v51, v20, v56, (a6 + -1.57079633 + -3.14159265) * 0.5, 3.14159265);
    if ((a2 & 1) == 0) {
      objc_msgSend(v17, "addLineToPoint:", v14 + 0.0, 0.0);
    }
    CGAffineTransform v58 = v59;
    CGAffineTransformTranslate(&v59, &v58, v24, v54);
    CGAffineTransform v57 = v59;
    CGAffineTransformRotate(&v58, &v57, a6 + 1.57079633);
    CGAffineTransform v59 = v58;
    if (!a5) {
      goto LABEL_12;
    }
    double v32 = v49;
    double v33 = v50 + v29;
  }
  *a5 = v33 * 0.5;
  a5[1] = (v32 + v31) * 0.5;
LABEL_12:
  if ((a2 & 1) == 0) {
    [v17 closePath];
  }
  long long v47 = a4[1];
  *(_OWORD *)&v58.a = *a4;
  *(_OWORD *)&v58.c = v47;
  *(_OWORD *)&v58.tdouble x = a4[2];
  [v17 applyTransform:&v58];
  [v13 appendPath:v17];
  long long v48 = *(_OWORD *)&v59.c;
  *a4 = *(_OWORD *)&v59.a;
  a4[1] = v48;
  a4[2] = *(_OWORD *)&v59.tx;

LABEL_15:
}

void MKArrowAppendUTurnCurveToPath(void *a1, uint64_t a2, _OWORD *a3, double a4)
{
  double v6 = *(double *)(a2 + 24);
  id v7 = (void *)MEMORY[0x1E4F427D0];
  id v8 = a1;
  double v9 = [v7 bezierPath];
  double v10 = v9;
  long long v11 = a3[1];
  *(_OWORD *)&v18.a = *a3;
  *(_OWORD *)&v18.c = v11;
  *(_OWORD *)&v18.tdouble x = a3[2];
  if (a4 >= 0.0)
  {
    objc_msgSend(v9, "moveToPoint:", v6 + 0.0, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v6 + 0.0 + a4, 0.0, a4, 3.14159265, 0.0);
    CGFloat v13 = v6 + v6 + 0.0 + a4 * 2.0;
    objc_msgSend(v10, "addLineToPoint:", v13, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v6 + 0.0 + a4, 0.0, v6 + a4, 0.0, 3.14159265);
    CGAffineTransform v17 = v18;
    CGAffineTransformTranslate(&v18, &v17, v13, 0.0);
    CGAffineTransform v16 = v18;
    CGFloat v12 = -3.14159265;
  }
  else
  {
    objc_msgSend(v9, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a4 + 0.0, 0.0, -a4, 0.0, -3.14159265);
    objc_msgSend(v10, "addLineToPoint:", -(v6 - a4 * 2.0), 0.0);
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a4 + 0.0, 0.0, v6 - a4, 3.14159265, 0.0);
    CGAffineTransform v17 = v18;
    CGAffineTransformTranslate(&v18, &v17, v6 - (v6 - a4 * 2.0), 0.0);
    CGAffineTransform v16 = v18;
    CGFloat v12 = 3.14159265;
  }
  CGAffineTransformRotate(&v17, &v16, v12);
  CGAffineTransform v18 = v17;
  objc_msgSend(v10, "closePath", *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
  long long v14 = a3[1];
  *(_OWORD *)&v17.a = *a3;
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tdouble x = a3[2];
  [v10 applyTransform:&v17];
  [v8 appendPath:v10];

  long long v15 = *(_OWORD *)&v18.c;
  *a3 = *(_OWORD *)&v18.a;
  a3[1] = v15;
  a3[2] = *(_OWORD *)&v18.tx;
}

void MKArrowAppendRightTurnToPathInRect(void *a1, double *a2, double *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  double v16 = a2[7];
  double v17 = a2[3];
  double v18 = fmax(a2[15] - v17, 0.0);
  double v19 = ceil(a2[18] - v18);
  double v20 = ceil(a2[17] - v18);
  if (a3) {
    *a3 = v17 + v19 + -1.0;
  }
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeTranslation(&v21, a5 + a7 - v19, a6 + a8);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v15, (uint64_t)__dst, &v21, 0, v20);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendRightAngleCurveToPath(v15, __dst, &v21);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendSegmentToPath(v15, (uint64_t)__dst, &v21, v19 - v16);
  if (a4) {
    *a4 = (id)[v15 copy];
  }
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v15, (uint64_t)__dst, 0, (long long *)&v21, 0.0);
}

void MKArrowAppendLeftTurnToPathInRect(void *a1, const void *a2, double a3, double a4, double a5, double a6, uint64_t a7, void *a8)
{
  id v14 = a1;
  id v15 = [MEMORY[0x1E4F427D0] bezierPath];
  double v22 = 0.0;
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendRightTurnToPathInRect(v15, (double *)__dst, &v22, a8, a3, a4, a5, a6);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  CGAffineTransform v19 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v20, &v19, -v22, 0.0);
  *(CGAffineTransform *)__dst = v20;
  if (a8)
  {
    double v16 = (void *)*a8;
    CGAffineTransform v20 = *(CGAffineTransform *)__dst;
    [v16 applyTransform:&v20];
    double v17 = (void *)[v14 copy];
    [v17 appendPath:*a8];
    id v18 = v17;
    *a8 = v18;
  }
  CGAffineTransform v20 = *(CGAffineTransform *)__dst;
  [v15 applyTransform:&v20];
  [v14 appendPath:v15];
}

void MKArrowAppendMergeLeftToPathInRect(void *a1, const void *a2, void *a3, double a4, CGFloat a5, double a6, double a7)
{
  id v13 = a1;
  id v14 = [MEMORY[0x1E4F427D0] bezierPath];
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendMergeRightToPathInRect(v14, (double *)__dst, a3, v15, v16, a6, a7);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  CGAffineTransform v20 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v21, &v20, -a4 - a6, a5);
  *(CGAffineTransform *)__dst = v21;
  if (a3)
  {
    double v17 = (void *)*a3;
    CGAffineTransform v21 = *(CGAffineTransform *)__dst;
    [v17 applyTransform:&v21];
    id v18 = (void *)[v13 copy];
    [v18 appendPath:*a3];
    id v19 = v18;
    *a3 = v19;
  }
  CGAffineTransform v21 = *(CGAffineTransform *)__dst;
  [v14 applyTransform:&v21];
  [v13 appendPath:v14];
}

void MKArrowAppendMergeRightToPathInRect(void *a1, double *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  double v14 = (a6 + a2[3] * -2.79999995) * 0.5;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, a4 + v14, a5 + a7);
  double v15 = a2[38];
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v19, 0, v15);
  double v16 = a2[40];
  double v17 = a2[41] * -0.0174532925;
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendCurveToPathWithOptionsAndRadius(v13, 0, (uint64_t)__dst, &v19, 0, v17, v16);
  double v18 = a2[39];
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendSegmentToPath(v13, (uint64_t)__dst, &v19, v18);
  if (a3) {
    *a3 = (id)[v13 copy];
  }
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, 0, (long long *)&v19, 0.0);
}

void MKArrowAppendUTurnToPathInRect(void *a1, int a2, double *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  double v16 = a3[7];
  double v17 = a3[3];
  double v18 = a3[10];
  double v19 = (a3[6] - v17) * 0.5 + v17 + v17 + v18 * 2.0;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, a5 + v19 - v17, a6 + a8);
  if (a2 == 1)
  {
    CGAffineTransform v23 = v24;
    CGAffineTransformScale((CGAffineTransform *)__dst, &v23, -1.0, 1.0);
    CGAffineTransform v24 = *(CGAffineTransform *)__dst;
    CGAffineTransform v23 = *(CGAffineTransform *)__dst;
    CGAffineTransformTranslate((CGAffineTransform *)__dst, &v23, -a7, 0.0);
    CGAffineTransform v24 = *(CGAffineTransform *)__dst;
  }
  double v20 = a8 * 0.522222221;
  double v21 = a8 * 0.522222221 - a3[12];
  double v22 = v20 - a3[13];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v15, (uint64_t)__dst, &v24, 0, v21);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendUTurnCurveToPath(v15, (uint64_t)__dst, &v24, -v18);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v15, (uint64_t)__dst, &v24, v22 - v16);
  if (a4) {
    *a4 = (id)[v15 copy];
  }
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v15, (uint64_t)__dst, 0, (long long *)&v24, 0.0);
}

void MKArrowAppendStraightArrowToPathInRect(void *a1, double *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  double v14 = a2[7];
  double v15 = a2[19];
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a4 + ceil((a6 - a2[3]) * 0.5), a5 + a7);
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v16, 0, a7 - v14 - v15);
  if (a3) {
    *a3 = (id)[v13 copy];
  }
  memcpy(__dst, a2, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, 0, (long long *)&v16, 0.0);
}

void MKArrowAppendExitRoadRightToPathInRect(void *a1, void *a2, _OWORD *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  CGAffineTransform v16 = (void *)MEMORY[0x1E4F427D0];
  id v17 = a2;
  double v18 = [v16 bezierPath];
  double v19 = [MEMORY[0x1E4F427D0] bezierPath];
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v57 = *MEMORY[0x1E4F1DAB8];
  long long v58 = v20;
  long long v59 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v21 = *((double *)a3 + 31);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendInitialSegmentToPathInvertingCorners(v18, (uint64_t)__dst, &v57, 0, v21);
  double v22 = *((double *)a3 + 33);
  double v23 = *((double *)a3 + 3);
  double v24 = *((double *)a3 + 8);
  id v25 = v19;
  double v26 = -v22;
  if (v24 >= v23 * 0.5) {
    double v27 = v23 * 0.5;
  }
  else {
    double v27 = v24;
  }
  if (v27 <= 0.0) {
    objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, v26, v23, v22);
  }
  else {
  double v28 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 15, 0.0, v26, v23, v22, v27, v27);
  }
  __dst[0] = v57;
  __dst[1] = v58;
  __dst[2] = v59;
  [v28 applyTransform:__dst];
  [v25 appendPath:v28];

  long long v29 = a3[3];
  __dst[2] = a3[2];
  __dst[3] = v29;
  *(void *)&__dst[4] = *((void *)a3 + 8);
  long long v30 = a3[1];
  __dst[0] = *a3;
  __dst[1] = v30;
  long long v31 = a3[12];
  __dst[11] = a3[11];
  __dst[12] = v31;
  long long v32 = a3[14];
  __dst[13] = a3[13];
  __dst[14] = v32;
  long long v33 = a3[8];
  __dst[7] = a3[7];
  __dst[8] = v33;
  long long v34 = a3[10];
  __dst[9] = a3[9];
  __dst[10] = v34;
  long long v35 = a3[6];
  __dst[5] = a3[5];
  __dst[6] = v35;
  long long v36 = *(_OWORD *)((char *)a3 + 440);
  long long v37 = *(_OWORD *)((char *)a3 + 472);
  *(_OWORD *)((char *)&__dst[28] + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)((char *)a3 + 456);
  *(_OWORD *)((char *)&__dst[29] + _Block_object_dispose(&STACK[0x240], 8) = v37;
  long long v38 = *(_OWORD *)((char *)a3 + 376);
  long long v39 = *(_OWORD *)((char *)a3 + 408);
  long long v40 = *(_OWORD *)((char *)a3 + 424);
  *(_OWORD *)((char *)&__dst[24] + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)((char *)a3 + 392);
  *(_OWORD *)((char *)&__dst[25] + _Block_object_dispose(&STACK[0x240], 8) = v39;
  *(_OWORD *)((char *)&__dst[26] + _Block_object_dispose(&STACK[0x240], 8) = v40;
  *(_OWORD *)((char *)&__dst[27] + _Block_object_dispose(&STACK[0x240], 8) = v36;
  long long v41 = *(_OWORD *)((char *)a3 + 312);
  long long v42 = *(_OWORD *)((char *)a3 + 344);
  long long v43 = *(_OWORD *)((char *)a3 + 360);
  *(_OWORD *)((char *)&__dst[20] + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)((char *)a3 + 328);
  *(_OWORD *)((char *)&__dst[21] + _Block_object_dispose(&STACK[0x240], 8) = v42;
  *(_OWORD *)((char *)&__dst[22] + _Block_object_dispose(&STACK[0x240], 8) = v43;
  *(_OWORD *)((char *)&__dst[23] + _Block_object_dispose(&STACK[0x240], 8) = v38;
  long long v44 = *(_OWORD *)((char *)a3 + 280);
  long long v45 = *(_OWORD *)((char *)a3 + 296);
  long long v46 = *(_OWORD *)((char *)a3 + 248);
  *(_OWORD *)((char *)&__dst[16] + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)((char *)a3 + 264);
  *(_OWORD *)((char *)&__dst[17] + _Block_object_dispose(&STACK[0x240], 8) = v44;
  *(void *)&long long v42 = *((void *)a3 + 9);
  *(_OWORD *)((char *)&__dst[18] + _Block_object_dispose(&STACK[0x240], 8) = v45;
  *(_OWORD *)((char *)&__dst[19] + _Block_object_dispose(&STACK[0x240], 8) = v41;
  *(void *)&long long v44 = *((void *)a3 + 30);
  *((void *)&__dst[30] + 1) = *((void *)a3 + 61);
  *(_OWORD *)((char *)&__dst[15] + _Block_object_dispose(&STACK[0x240], 8) = v46;
  *((void *)&__dst[4] + 1) = v42;
  *(void *)&__dst[15] = v44;
  MKArrowAppendCurveToPathWithOptionsAndRadius(v18, 0, (uint64_t)__dst, &v57, 0, -0.785398163, *(double *)&v44);
  double v47 = *((double *)a3 + 32);
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendSegmentToPath(v18, (uint64_t)__dst, &v57, v47);
  if (a4) {
    long long v48 = (void *)[v18 copy];
  }
  else {
    long long v48 = 0;
  }
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v18, (uint64_t)__dst, 0, &v57, 0.0);
  [v18 bounds];
  double v50 = a5 + (a7 - v49) * 0.5;
  double v51 = a6 + a8;
  if (a4)
  {
    CGAffineTransformMakeTranslation(&v56, v50, v51);
    [v48 applyTransform:&v56];
    double v52 = (void *)[v15 copy];
    [v52 appendPath:v48];
    id v53 = v52;
    *a4 = v53;
  }
  CGAffineTransformMakeTranslation(&v55, v50, v51);
  [v18 applyTransform:&v55];
  [v15 appendPath:v18];
  CGAffineTransformMakeTranslation(&v54, v50, v51);
  [v25 applyTransform:&v54];
  [v17 appendPath:v25];
}

void MKArrowAppendExitRoadLeftToPathInRect(void *a1, void *a2, const void *a3, void *a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  CGAffineTransform v16 = (void *)MEMORY[0x1E4F427D0];
  id v17 = a2;
  double v18 = [v16 bezierPath];
  double v19 = [MEMORY[0x1E4F427D0] bezierPath];
  memcpy(__dst, a3, sizeof(__dst));
  MKArrowAppendExitRoadRightToPathInRect(v18, v19, __dst, a4, a5, a6, a7, a8);
  memset(__dst, 0, 48);
  CGAffineTransformMakeScale((CGAffineTransform *)__dst, -1.0, 1.0);
  CGAffineTransform v23 = *(CGAffineTransform *)__dst;
  CGAffineTransformTranslate(&v24, &v23, -a7, 0.0);
  *(CGAffineTransform *)__dst = v24;
  if (a4)
  {
    long long v20 = (void *)*a4;
    CGAffineTransform v24 = *(CGAffineTransform *)__dst;
    [v20 applyTransform:&v24];
    double v21 = (void *)[v15 copy];
    [v21 appendPath:*a4];
    id v22 = v21;
    *a4 = v22;
  }
  CGAffineTransform v24 = *(CGAffineTransform *)__dst;
  [v18 applyTransform:&v24];
  CGAffineTransform v24 = *(CGAffineTransform *)__dst;
  [v19 applyTransform:&v24];
  [v15 appendPath:v18];
  [v17 appendPath:v19];
}

double MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(void *a1, void *a2, uint64_t a3, int a4, double a5, CGFloat a6)
{
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  CGFloat v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v13 = [MEMORY[0x1E4F427D0] bezierPath];
  double v14 = a6 * 0.245614037;
  double v15 = a5 - *(double *)(a3 + 24);
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeTranslation(&v46, v15 * 0.5, a6);
  memset(&v45, 0, sizeof(v45));
  if (a4)
  {
    *(CGAffineTransform *)__dst = v46;
    CGAffineTransformTranslate(&v45, (CGAffineTransform *)__dst, 0.0, -v14);
    double v16 = *(double *)(a3 + 56);
    memset(&v44, 0, sizeof(v44));
    *(CGAffineTransform *)__dst = v46;
    CGAffineTransformTranslate(&v44, (CGAffineTransform *)__dst, 0.0, -v16);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v44, 1, v14);
    memset(&v44, 0, sizeof(v44));
    CGAffineTransformMakeScale(&v44, 1.0, -1.0);
    memset(&v43, 0, sizeof(v43));
    *(CGAffineTransform *)__dst = v44;
    CGAffineTransform t2 = v46;
    CGAffineTransformConcat(&v42, (CGAffineTransform *)__dst, &t2);
    CGAffineTransformTranslate(&v43, &v42, 0.0, v16);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    id v17 = (long long *)&v43;
  }
  else
  {
    CGAffineTransform v45 = v46;
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v13, (uint64_t)__dst, &v45, 0, a6 * 0.245614037);
    memcpy(__dst, (const void *)a3, sizeof(__dst));
    id v17 = (long long *)&v45;
  }
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v13, (uint64_t)__dst, (uint64_t)&v47, v17, 0.0);
  id v18 = v13;
  *a2 = v18;
  double v19 = *(double *)(a3 + 288);
  double v20 = v45.tx + *((double *)&v47 + 1) * v45.c + v45.a * *(double *)&v47;
  double v21 = v45.ty + *((double *)&v47 + 1) * v45.d + v45.b * *(double *)&v47 - v19;
  id v22 = [MEMORY[0x1E4F427D0] bezierPath];
  double v23 = v45.tx + *((double *)&v48 + 1) * v45.c + v45.a * *(double *)&v48;
  double v24 = v45.tx + v45.c * *((double *)&v49 + 1) + v45.a * *(double *)&v49;
  double v25 = v45.ty + *((double *)&v48 + 1) * v45.d + v45.b * *(double *)&v48 - v19;
  if (v20 == v23) {
    double v26 = INFINITY;
  }
  else {
    double v26 = (v21 - v25) / (v20 - v23);
  }
  double v27 = v45.ty + v45.d * *((double *)&v49 + 1) + v45.b * *(double *)&v49 - v19;
  double v40 = atan(v26) + 3.14159265;
  if (v20 == v24) {
    double v28 = INFINITY;
  }
  else {
    double v28 = (v21 - v27) / (v20 - v24);
  }
  double v29 = atan(v28);
  double v30 = *(double *)(a3 + 272);
  __double2 v31 = __sincos_stret(v29);
  double v32 = v24 - v30 * v31.__cosval;
  double v33 = v27 - v30 * v31.__sinval;
  objc_msgSend(v22, "moveToPoint:", v23, v25);
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, v21, sqrt((v20 - v23) * (v20 - v23) + (v21 - v25) * (v21 - v25)), v40, v29);
  objc_msgSend(v22, "addLineToPoint:", v32, v33);
  double v34 = sqrt((v20 - v32) * (v20 - v32) + (v21 - v33) * (v21 - v33));
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20, v21, v34, v29, v40);
  objc_msgSend(v22, "addLineToPoint:", v23, v25);
  [v22 closePath];
  [v12 addObject:v22];
  double v35 = v34 - *(double *)(a3 + 280);
  if (*(unsigned char *)(a3 + 296))
  {
    __double2 v36 = __sincos_stret(v40);
    long long v37 = [MEMORY[0x1E4F427D0] bezierPath];

    objc_msgSend(v37, "moveToPoint:", v20, v21);
    objc_msgSend(v37, "addLineToPoint:", v20 + v35 * v36.__cosval, v21 + v35 * v36.__sinval);
    objc_msgSend(v37, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v20, v21, v35, v40, v29);
    objc_msgSend(v37, "addLineToPoint:", v20, v21);
    [v37 closePath];
  }
  else
  {
    long long v37 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v20 - v35, v21 - v35, v35 + v35, v35 + v35);
  }
  [v12 addObject:v37];
  id v38 = v12;
  *a1 = v38;

  return v20;
}

void MKArrowCreateBezierPathsForProceedToRouteWithSizeAndReturnCenter(void *a1, void *a2, void *__src, double a4, CGFloat a5)
{
  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 1, a4, a5);
}

void MKArrowCreateBezierPathsForArrivalWithSizeAndReturnCenter(void *a1, void *a2, void *__src, double a4, CGFloat a5)
{
  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 0, a4, a5);
}

void MKArrowCreateBezierPathsForArrivalWithSize(void *a1, void *a2, void *__src, double a4, CGFloat a5)
{
  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 0, a4, a5);
}

void MKArrowCreateBezierPathsForProceedToRouteWithSize(void *a1, void *a2, void *__src, double a4, CGFloat a5)
{
  memcpy(v9, __src, sizeof(v9));
  MKArrowCreateBezierPathsForEitherProceedToRouteOrArrivalWithSizeAndReturnCenter(a1, a2, (uint64_t)v9, 1, a4, a5);
}

void sub_18BCA7314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18BCA78DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCA7E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BCAA8AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCAAA00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCABAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MapKitConfig_GetUserDefaultStringKeysForWatchSync()
{
  return MEMORY[0x1E4F1CBF0];
}

uint64_t MapKitConfig_GetConfigStoreStringKeysForWatchSync()
{
  return MEMORY[0x1E4F1CBF0];
}

void *_getConfigStoreStringKeysForStateCapture()
{
  return &unk_1ED97F590;
}

void _MKGEOAppEnteredBackground()
{
  if ((_geoInForeground & 1) == 0) {
    _geoInForeground = 1;
  }
}

void sub_18BCADE4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18BCADFCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BCB0E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCB3A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

id _MKOverlayTileLoader()
{
  if (qword_1E9154310 != -1) {
    dispatch_once(&qword_1E9154310, &__block_literal_global_92);
  }
  os_log_t v0 = (void *)qword_1E9154318;

  return v0;
}

void sub_18BCB3FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB41B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB432C(_Unwind_Exception *exception_object)
{
}

void sub_18BCB43D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCB45B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB4708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18BCB4850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB49F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_18BCB4A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCB4D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB5030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB52F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB5374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_MKOverlayTileRequester;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18BCB54CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCB57D8(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

id RequesterRegistry::lookup(RequesterRegistry *this, unsigned int a2)
{
  unsigned int v13 = a2;
  CLLocationCoordinate2D v4 = (std::mutex *)((char *)this + 24);
  std::mutex::lock((std::mutex *)((char *)this + 24));
  uint64_t v5 = *((void *)this + 1);
  if (!v5) {
    goto LABEL_12;
  }
  double v6 = (_DWORD *)((char *)this + 8);
  do
  {
    unsigned int v7 = *(_DWORD *)(v5 + 32);
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      double v9 = (uint64_t *)v5;
    }
    else {
      double v9 = (uint64_t *)(v5 + 8);
    }
    if (v8) {
      double v6 = (_DWORD *)v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v6 != (_DWORD *)((char *)this + 8) && v6[8] <= a2)
  {
    long long v11 = std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>((uint64_t **)this, a2, &v13);
    id WeakRetained = objc_loadWeakRetained((id *)v11 + 5);
  }
  else
  {
LABEL_12:
    id WeakRetained = 0;
  }
  std::mutex::unlock(v4);

  return WeakRetained;
}

void sub_18BCB5964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCB5AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCB5CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN17RequesterRegistry14sharedInstanceEv_block_invoke()
{
}

uint64_t **std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>(uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  double v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        unsigned int v7 = (uint64_t **)v5;
        unsigned int v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2) {
          break;
        }
        uint64_t v5 = *v7;
        double v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v5 = v7[1];
      if (!v5)
      {
        double v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    unsigned int v7 = a1 + 1;
LABEL_9:
    double v9 = (uint64_t *)v7;
    unsigned int v7 = (uint64_t **)operator new(0x30uLL);
    *((_DWORD *)v7 + _Block_object_dispose(&STACK[0x240], 8) = *a3;
    v7[5] = 0;
    void *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    _DWORD *v6 = (uint64_t *)v7;
    double v10 = (uint64_t *)**a1;
    long long v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      long long v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

void ___ZL22_tileRequesterWorkloopv_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.MapKit.MKTileOverlay.Requester");
  uint64_t v1 = (void *)qword_1E9154338;
  qword_1E9154338 = (uint64_t)v0;
}

void ___ZL30_tileRequesterCallbackWorkloopv_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.MapKit.MKTileOverlay.Callback");
  uint64_t v1 = (void *)qword_1E9154348;
  qword_1E9154348 = (uint64_t)v0;
}

void sub_18BCB6440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCB6510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCB8A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

__CFString *_MKPlaceCardFormattedStringForTimeInterval()
{
  if (_MKPlaceCardUseSmallerFont())
  {
    dispatch_workloop_t v0 = (void *)MEMORY[0x1E4F42A30];
    uint64_t v1 = (void *)MEMORY[0x1E4F42A38];
    int v2 = _MKPlaceCardUseSmallerFont();
    BOOL v3 = (void *)MEMORY[0x1E4F43890];
    if (!v2) {
      BOOL v3 = (void *)MEMORY[0x1E4F438C0];
    }
    CLLocationCoordinate2D v4 = [v1 preferredFontDescriptorWithTextStyle:*v3 addingSymbolicTraits:2 options:0];
    uint64_t v5 = [v0 fontWithDescriptor:v4 size:0.0];

    [v5 pointSize];
    _MKPlaceCardUseSmallerFont();
  }
  objc_msgSend(NSString, "_navigation_stringWithSeconds:andAbbreviationType:");
  double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    double v6 = &stru_1ED919588;
  }

  return v6;
}

void sub_18BCBCDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBD360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCBD49C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCBD5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBD6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBD7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBD8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBD9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBDB08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCBDB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCBDCF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCBE210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCBE9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BCBF474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCBF6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  uint64_t v2 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
  if (v2 >= -21) {
    uint64_t v3 = (v2 & (v2 >> 63)) + 21;
  }
  else {
    uint64_t v3 = 0;
  }
  return __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v3] / zoomScale;
}

void sub_18BCC0E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCC0FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_18BCC111C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCC1270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCC13C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCC14F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCC15DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCC16DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGPath *_MKPolygonRendererCreateStrokeClipPathForPolygon(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  unint64_t v10 = [v9 pointCount];
  id v11 = v9;
  uint64_t v12 = [v11 points];
  if (v10 < 3)
  {
    Mutable = 0;
    goto LABEL_18;
  }
  uint64_t v14 = (double *)v12;
  [v11 _mapPointsLength];
  double v16 = v15;
  Mutable = CGPathCreateMutable();
  double v17 = *v14 - a2;
  double v18 = v14[1] - a3;
  CGPathMoveToPoint(Mutable, 0, v17, v18);
  uint64_t v20 = (uint64_t)&v14[2 * v10];
  double v19 = *(double *)(v20 - 8);
  LODWORD(v20) = *v14 != *(double *)(v20 - 16);
  if (v14[1] == v19) {
    uint64_t v20 = v20;
  }
  else {
    uint64_t v20 = 1;
  }
  unint64_t v21 = v10 + v20;
  if (v10 + v20 >= 2)
  {
    double v35 = v16 * a4;
    double v36 = a5;
    double v34 = v16 * a5;
    BOOL v22 = a4 == 0.0;
    double v23 = 0.0;
    unint64_t v24 = 1;
    double v37 = a2;
    double v38 = a3;
    do
    {
      double v25 = &v14[2 * (v24 % v10)];
      double v26 = *v25 - a2;
      double v27 = v25[1] - a3;
      double v28 = v26 - v17;
      double v29 = v27 - v18;
      double v30 = sqrt(v28 * v28 + v29 * v29);
      double v31 = v23 + v30;
      if (!v22)
      {
        if (v31 <= v35)
        {
          BOOL v22 = 0;
          goto LABEL_15;
        }
        CGPathMoveToPoint(Mutable, 0, v17 + v28 * ((v35 - v23) / v30), v18 + v29 * ((v35 - v23) / v30));
        double v31 = v23 + v30;
      }
      if (v36 < 1.0 && v31 >= v34)
      {
        CGPathAddLineToPoint(Mutable, 0, v17 + v28 * ((v34 - v23) / v30), v18 + v29 * ((v34 - v23) / v30));
        break;
      }
      double v32 = v31;
      CGPathAddLineToPoint(Mutable, 0, v26, v27);
      double v31 = v32;
      BOOL v22 = 1;
LABEL_15:
      ++v24;
      double v18 = v27;
      double v17 = v26;
      double v23 = v31;
      a2 = v37;
      a3 = v38;
    }
    while (v21 != v24);
  }
LABEL_18:

  return Mutable;
}

void sub_18BCC38F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCC39C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18BCC686C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCC71DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCC7330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BCC9540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18BCC9720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void MKDistanceBetweenPointAndRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v13.origin.double x = a3;
  v13.origin.double y = a4;
  v13.size.double width = a5;
  v13.size.double height = a6;
  v12.double x = a1;
  v12.double y = a2;
  if (!CGRectContainsPoint(v13, v12))
  {
    v14.origin.double x = a3;
    v14.origin.double y = a4;
    v14.size.double width = a5;
    v14.size.double height = a6;
    CGRectGetMaxX(v14);
    v15.origin.double x = a3;
    v15.origin.double y = a4;
    v15.size.double width = a5;
    v15.size.double height = a6;
    CGRectGetMaxY(v15);
  }
}

double MKClosestMapPointInLineSegmentFromMapPoint(double result, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - result;
  double v7 = a4 - a2;
  if (a3 - result != 0.0 || v7 != 0.0)
  {
    double v8 = (v7 * (a6 - a2) + (a5 - result) * v6) / (v7 * v7 + v6 * v6);
    if (v8 >= 0.0)
    {
      if (v8 <= 1.0) {
        return result + v8 * v6;
      }
      else {
        return a3;
      }
    }
  }
  return result;
}

uint64_t MKBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x1F411C038]();
}

void MKCoordinatesForRegion(CLLocationCoordinate2D *a1, CLLocationCoordinate2D *a2)
{
  GEOMapRectForCoordinateRegion();
  if (v4 == INFINITY && v5 == INFINITY)
  {
    *a1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    *a2 = (CLLocationCoordinate2D)MKCoordinateInvalid;
  }
  else
  {
    double v9 = v4 + v6;
    double v10 = v5 + v7;
    *a1 = MKCoordinateForMapPoint(*(MKMapPoint *)&v4);
    v11.double x = v9;
    v11.double y = v10;
    *a2 = MKCoordinateForMapPoint(v11);
  }
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1 = MKTilePointForCoordinate(coordinate.latitude, coordinate.longitude, 21.0);
  result.double y = v2;
  result.double x = v1;
  return result;
}

long double MKZoomLevelForScaleF(long double a1)
{
  long double result = log2(a1) + 21.0;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

long double MKZoomScaleForZoomLevelF(double a1)
{
  return 1.0 / exp2(21.0 - a1);
}

CLLocationDistance MKMetersPerMapPointAtLatitude(CLLocationDegrees latitude)
{
  GEOMapPointsPerMeterAtLatitude();
  return 1.0 / v1;
}

CLLocationDistance MKMetersBetweenMapPoints(MKMapPoint a, MKMapPoint b)
{
  double y = b.y;
  double x = b.x;
  CLLocationCoordinate2D v4 = MKCoordinateForMapPoint(a);
  v12.double x = x;
  v12.double y = y;
  CLLocationCoordinate2D v5 = MKCoordinateForMapPoint(v12);
  v6.n128_u64[0] = *(void *)&v5.latitude;
  v7.n128_u64[0] = *(void *)&v5.longitude;
  v8.n128_u64[0] = *(void *)&v4.latitude;
  v9.n128_u64[0] = *(void *)&v4.longitude;

  MEMORY[0x1F411C048](v8, v9, v6, v7);
  return result;
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  if (rect1.origin.x == INFINITY && rect1.origin.y == INFINITY)
  {
    rect1.origin.double y = rect2.origin.y;
  }
  else if (rect2.origin.x == INFINITY && rect2.origin.y == INFINITY)
  {
    rect2.origin.double x = rect1.origin.x;
    rect2.size.double width = rect1.size.width;
    rect2.size.double height = rect1.size.height;
  }
  else
  {
    double v4 = rect2.origin.x + rect2.size.width;
    if (rect1.origin.x < rect2.origin.x) {
      rect2.origin.double x = rect1.origin.x;
    }
    double v5 = rect1.origin.y + rect1.size.height;
    if (rect1.origin.y >= rect2.origin.y) {
      rect1.origin.double y = rect2.origin.y;
    }
    double v6 = rect1.origin.x + rect1.size.width;
    if (v6 <= v4) {
      double v6 = v4;
    }
    rect2.size.double width = v6 - rect2.origin.x;
    double v7 = rect2.origin.y + rect2.size.height;
    if (v5 > rect2.origin.y + rect2.size.height) {
      double v7 = v5;
    }
    rect2.size.double height = v7 - rect1.origin.y;
  }
  double x = rect2.origin.x;
  double width = rect2.size.width;
  double height = rect2.size.height;
  rect1.size.double height = height;
  rect1.size.double width = width;
  rect1.origin.double x = x;
  return rect1;
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  double y = rect.origin.y;
  double v4 = INFINITY;
  if (rect.origin.x == INFINITY && y == INFINITY)
  {
    double v6 = INFINITY;
  }
  else
  {
    double v6 = rect.origin.x + dx;
    double v4 = y + dy;
    rect.size.double width = rect.size.width - dx * 2.0;
    rect.size.double height = rect.size.height - dy * 2.0;
  }
  rect.origin.double y = v4;
  rect.origin.double x = v6;
  return rect;
}

MKMapRect MKMapRectOffset(MKMapRect rect, double dx, double dy)
{
  BOOL v3 = rect.origin.x == INFINITY;
  BOOL v4 = rect.origin.y == INFINITY;
  if (v3 && v4) {
    ddouble x = -0.0;
  }
  double v5 = rect.origin.x + dx;
  if (v3 && v4) {
    double v6 = -0.0;
  }
  else {
    double v6 = dy;
  }
  double v7 = rect.origin.y + v6;
  rect.origin.double y = v7;
  rect.origin.double x = v5;
  return rect;
}

void MKMapRectDivide(MKMapRect rect, MKMapRect *slice, MKMapRect *remainder, double amount, CGRectEdge edge)
{
  if (rect.origin.x == INFINITY && rect.origin.y == INFINITY)
  {
    *slice = MKMapRectNull;
    *remainder = MKMapRectNull;
  }
  else
  {
    *remainder = rect;
    MKMapSize size = remainder->size;
    slice->origin = remainder->origin;
    slice->MKMapSize size = size;
    double width = 0.0;
    if (amount >= 0.0) {
      double width = amount;
    }
    if ((edge | 2) == 2)
    {
      if (width > rect.size.width) {
        double width = rect.size.width;
      }
      slice->size.double width = width;
      double v8 = remainder->size.width - width;
      remainder->size.double width = v8;
      if (edge) {
        slice->origin.double x = v8 + slice->origin.x;
      }
      else {
        remainder->origin.double x = width + remainder->origin.x;
      }
    }
    else
    {
      if (width > rect.size.height) {
        double width = rect.size.height;
      }
      slice->size.double height = width;
      double v9 = remainder->size.height - width;
      remainder->size.double height = v9;
      if (edge == CGRectMinYEdge) {
        remainder->origin.double y = width + remainder->origin.y;
      }
      else {
        slice->origin.double y = v9 + slice->origin.y;
      }
    }
  }
}

BOOL MKMapRectSpans180thMeridian(MKMapRect rect)
{
  double v1 = rect.origin.x + rect.size.width;
  if (rect.origin.x < 0.0 && v1 > 0.0) {
    return 1;
  }
  if (v1 <= 268435456.0) {
    return 0;
  }
  return rect.origin.x < 268435456.0;
}

MKMapRect MKMapRectRemainder(MKMapRect rect)
{
  double x = rect.origin.x;
  if (rect.origin.x >= 0.0)
  {
    double v4 = rect.origin.x + rect.size.width;
    if (v4 <= 268435456.0)
    {
      double v3 = 0.0;
      double v2 = INFINITY;
      rect.origin.double y = INFINITY;
      rect.size.double height = 0.0;
    }
    else
    {
      double v3 = v4 + -268435456.0;
      double v2 = 0.0;
    }
  }
  else
  {
    double v2 = rect.origin.x + 268435456.0;
    double v3 = fabs(x);
  }
  rect.size.double width = v3;
  rect.origin.double x = v2;
  return rect;
}

BOOL MKMapRectContainsRectWrappingMeridian(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a5 == INFINITY && a6 == INFINITY) {
    return 1;
  }
  if (a1 == INFINITY && a2 == INFINITY) {
    return 0;
  }
  double v14 = a6;
  if (MKMapRectContainsRect(*(MKMapRect *)&a1, *(MKMapRect *)&a5)) {
    return 1;
  }
  double rect1 = a8;
  double v19 = a1 + a3;
  if (a1 < 0.0 && v19 > 0.0 || (BOOL result = 0, a1 < 268435456.0) && v19 > 268435456.0)
  {
    v64.size.double width = 268435456.0;
    v64.origin.double x = 0.0;
    v64.origin.double y = 0.0;
    v57.origin.double x = a1;
    v57.origin.double y = a2;
    v57.size.double width = a3;
    v57.size.double height = a4;
    v64.size.double height = 268435456.0;
    MKMapRect v58 = MKMapRectIntersection(v57, v64);
    double x = v58.origin.x;
    double height = v58.size.height;
    double width = v58.size.width;
    double y = v58.origin.y;
    double v20 = INFINITY;
    double v21 = v19 + -268435456.0;
    double v22 = 0.0;
    if (v19 > 268435456.0) {
      double v23 = 0.0;
    }
    else {
      double v23 = INFINITY;
    }
    if (v19 <= 268435456.0) {
      double v21 = 0.0;
    }
    else {
      double v20 = a2;
    }
    if (v19 > 268435456.0) {
      double v22 = a4;
    }
    double v24 = fabs(a1);
    BOOL v25 = a1 < 0.0;
    if (a1 < 0.0) {
      double v26 = a1 + 268435456.0;
    }
    else {
      double v26 = v23;
    }
    if (a1 < 0.0) {
      double v27 = a2;
    }
    else {
      double v27 = v20;
    }
    if (v25) {
      double v28 = v24;
    }
    else {
      double v28 = v21;
    }
    if (v25) {
      double v29 = a4;
    }
    else {
      double v29 = v22;
    }
    v65.size.double width = 268435456.0;
    v65.origin.double x = 0.0;
    v65.origin.double y = 0.0;
    v59.origin.double x = a5;
    v59.origin.double y = v14;
    v59.size.double width = a7;
    v59.size.double height = rect1;
    v65.size.double height = 268435456.0;
    MKMapRect v60 = MKMapRectIntersection(v59, v65);
    double v30 = v60.origin.x;
    double v31 = v60.origin.y;
    double v32 = v60.size.width;
    double v33 = v60.size.height;
    double v48 = v28;
    double v49 = v29;
    if (a5 >= 0.0)
    {
      recCGAffineTransform t2 = 0.0;
      if (a5 + a7 <= 268435456.0)
      {
        double v34 = INFINITY;
        double v14 = INFINITY;
        double rect1 = 0.0;
      }
      else
      {
        recCGAffineTransform t2 = a5 + a7 + -268435456.0;
        double v34 = 0.0;
      }
    }
    else
    {
      double v34 = a5 + 268435456.0;
      recCGAffineTransform t2 = fabs(a5);
    }
    v61.size.double height = height;
    v61.origin.double x = x;
    v61.size.double width = width;
    v61.origin.double y = y;
    double v35 = v30;
    double v36 = v31;
    double v37 = v32;
    double v38 = v33;
    BOOL v39 = MKMapRectContainsRect(v61, *(MKMapRect *)(&v31 - 1));
    if (v34 == INFINITY && v14 == INFINITY)
    {
      if (v39) {
        return 1;
      }
      double v40 = v26;
      double v41 = v48;
      double v42 = v27;
      double v43 = v49;
      double v44 = v30;
      double v45 = v36;
      double v46 = v37;
      double v47 = v38;
    }
    else
    {
      if (!v39)
      {
        v62.origin.double x = x;
        v62.size.double width = width;
        v62.origin.double y = y;
        v62.size.double height = height;
        v66.origin.double x = v34;
        v66.origin.double y = v14;
        v66.size.double width = rect2;
        v66.size.double height = rect1;
        BOOL result = MKMapRectContainsRect(v62, v66);
        if (!result) {
          return result;
        }
      }
      v67.origin.double x = v30;
      v63.origin.double x = v26;
      v63.origin.double y = v27;
      v63.size.double width = v48;
      v63.size.double height = v49;
      v67.origin.double y = v36;
      v67.size.double width = v37;
      v67.size.double height = v38;
      if (MKMapRectContainsRect(v63, v67)) {
        return 1;
      }
      double v40 = v26;
      double v42 = v27;
      double v47 = rect1;
      double v41 = v48;
      double v43 = v49;
      double v44 = v34;
      double v45 = v14;
      double v46 = rect2;
    }
    return MKMapRectContainsRect(*(MKMapRect *)&v40, *(MKMapRect *)&v44);
  }
  return result;
}

BOOL MKMapRectIntersectsMapRectWrappingMeridian(double a1, double a2, double width, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = a1;
  v47[8] = *MEMORY[0x1E4F143B8];
  if (a1 == INFINITY && a2 == INFINITY) {
    return 0;
  }
  double v10 = a6;
  double v11 = a5;
  if (a5 == INFINITY && a6 == INFINITY) {
    return 0;
  }
  double v17 = a2;
  if (MKMapRectIntersectsRect(*(MKMapRect *)&a1, *(MKMapRect *)&a5)) {
    return 1;
  }
  double v19 = v8 + width;
  if ((v8 >= 0.0 || v19 <= 0.0) && (v8 >= 268435456.0 || v19 <= 268435456.0))
  {
    double v23 = width;
    double height = a4;
    double y = v17;
    double x = v8;
  }
  else
  {
    double v40 = v8 + width;
    v53.size.double width = 268435456.0;
    v53.origin.double x = 0.0;
    v53.origin.double y = 0.0;
    v48.origin.double x = v8;
    v48.origin.double y = v17;
    v48.size.double width = width;
    v48.size.double height = a4;
    v53.size.double height = 268435456.0;
    MKMapRect v49 = MKMapRectIntersection(v48, v53);
    double x = v49.origin.x;
    double y = v49.origin.y;
    double width = v49.size.width;
    double height = v49.size.height;
    if (v8 >= 0.0)
    {
      if (v40 <= 268435456.0)
      {
        double v17 = INFINITY;
        a4 = 0.0;
        double v8 = INFINITY;
        double v23 = 0.0;
      }
      else
      {
        double v23 = v40 + -268435456.0;
        double v8 = 0.0;
      }
    }
    else
    {
      double v23 = fabs(v8);
      double v8 = v8 + 268435456.0;
    }
  }
  double v24 = v11 + a7;
  if ((v11 >= 0.0 || v24 <= 0.0) && (v11 >= 268435456.0 || v24 <= 268435456.0))
  {
    v51.size.double height = a8;
    v51.size.double width = a7;
    v51.origin.double y = v10;
    v51.origin.double x = v11;
  }
  else
  {
    double v36 = v11 + a7;
    double v37 = x;
    double v38 = y;
    double v39 = height;
    double v41 = v23;
    v54.size.double width = 268435456.0;
    v54.origin.double x = 0.0;
    v54.origin.double y = 0.0;
    v50.origin.double x = v11;
    v50.origin.double y = v10;
    v50.size.double width = a7;
    v50.size.double height = a8;
    v54.size.double height = 268435456.0;
    MKMapRect v51 = MKMapRectIntersection(v50, v54);
    if (v11 >= 0.0)
    {
      if (v36 > 268435456.0)
      {
        a7 = v36 + -268435456.0;
      }
      else
      {
        a8 = 0.0;
        a7 = 0.0;
      }
      if (v36 > 268435456.0)
      {
        double v11 = 0.0;
      }
      else
      {
        double v10 = INFINITY;
        double v11 = INFINITY;
      }
    }
    else
    {
      a7 = fabs(v11);
      double v11 = v11 + 268435456.0;
    }
    double height = v39;
    double v23 = v41;
    double x = v37;
    double y = v38;
  }
  uint64_t v25 = 0;
  *(double *)double v47 = x;
  *(double *)&v47[1] = y;
  *(double *)&v47[2] = width;
  *(double *)&v47[3] = height;
  *(double *)&v47[4] = v8;
  *(double *)&v47[5] = v17;
  *(double *)&v47[6] = v23;
  *(double *)&v47[7] = a4;
  MKMapRect v42 = v51;
  double v43 = v11;
  double v44 = v10;
  char v26 = 1;
  double v45 = a7;
  double v46 = a8;
LABEL_38:
  uint64_t v27 = 0;
  char v28 = v26;
  double v29 = (double *)&v47[4 * v25];
  double v30 = *v29;
  double v31 = v29[1];
  double v32 = v29[2];
  double v33 = v29[3];
  char v34 = 1;
  while (1)
  {
    char v35 = v34;
    v52.origin.double x = v30;
    v52.origin.double y = v31;
    v52.size.double width = v32;
    v52.size.double height = v33;
    BOOL result = MKMapRectIntersectsRect(v52, *(&v42 + v27));
    if (result) {
      return result;
    }
    char v34 = 0;
    uint64_t v27 = 1;
    if ((v35 & 1) == 0)
    {
      char v26 = 0;
      uint64_t v25 = 1;
      if (v28) {
        goto LABEL_38;
      }
      return result;
    }
  }
}

double MKMapRectMakeWithRadialDistance(double a1, double a2, double a3)
{
  double v4 = MKTilePointForCoordinate(a1, a2, 21.0);
  GEOMapPointsPerMeterAtLatitude();
  return v4 - v5 * a3;
}

double MKMapRectBoundingMapPoints(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return INFINITY;
  }
  double v2 = (double *)(a1 + 8);
  double v3 = INFINITY;
  double v4 = -INFINITY;
  double v5 = -INFINITY;
  double result = INFINITY;
  do
  {
    double v7 = *(v2 - 1);
    double v8 = *v2;
    if (v7 < result) {
      double result = *(v2 - 1);
    }
    if (v8 < v3) {
      double v3 = *v2;
    }
    if (v7 > v5) {
      double v5 = *(v2 - 1);
    }
    if (v8 > v4) {
      double v4 = *v2;
    }
    v2 += 2;
    --a2;
  }
  while (a2);
  return result;
}

BOOL _MKPolylineAddToPath(CGPath *a1, double *a2, unint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  unint64_t v10 = a3 - 2;
  if (a3 < 2) {
    return a3 > 1;
  }
  BOOL v19 = a7 == 0.0;
  BOOL v20 = a8 < 1.0 || a7 > 0.0;
  double v21 = *a2 - a4;
  double v22 = a2[1] - a5;
  CGPathMoveToPoint(a1, 0, v21, v22);
  double v23 = a7 * a9;
  double v50 = a8 * a9;
  double v51 = a7 * a9;
  double v24 = a8;
  double v25 = 0.0;
  double v48 = a9;
  double v49 = v24;
  if (a3 - 1 < 2)
  {
    double v32 = v22;
    double v31 = v21;
    double v30 = 1.0;
    goto LABEL_28;
  }
  double v26 = 5.0 / a6 * (5.0 / a6);
  BOOL v27 = v24 >= 1.0;
  char v28 = a2 + 2;
  double v29 = 0.0;
  double v30 = 1.0;
  while (1)
  {
    double v31 = *v28 - a4;
    double v32 = v28[1] - a5;
    if (v20) {
      double v25 = v25
    }
          + sqrt((v31 - (*(v28 - 2) - a4)) * (v31 - (*(v28 - 2) - a4))+ (v32 - (*(v28 - 1) - a5)) * (v32 - (*(v28 - 1) - a5)));
    double v33 = v31 - v21;
    double v34 = v32 - v22;
    if (v33 * v33 + v34 * v34 >= v26) {
      break;
    }
    double v32 = v22;
    double v31 = v21;
LABEL_24:
    v28 += 2;
    double v21 = v31;
    double v22 = v32;
    if (!--v10) {
      goto LABEL_28;
    }
  }
  if (v19)
  {
    BOOL v19 = 1;
  }
  else if (v29 >= v23 || v25 < v23)
  {
    BOOL v19 = 0;
    if (v25 < v23)
    {
LABEL_23:
      double v29 = v25;
      goto LABEL_24;
    }
  }
  else
  {
    double v35 = (v23 - v29) / (v25 - v29);
    double v21 = v21 + v33 * v35;
    double v22 = v22 + v34 * v35;
    CGPathMoveToPoint(a1, 0, v21, v22);
    BOOL v19 = 1;
    double v29 = v51;
  }
  char v36 = v29 >= v50 || v27;
  if ((v36 & 1) != 0 || v25 < v50)
  {
    CGPathAddLineToPoint(a1, 0, v31, v32);
    double v30 = 1.0;
    double v23 = v51;
    goto LABEL_23;
  }
  double v37 = (v50 - v29) / (v25 - v29);
  double v31 = v21 + (v31 - v21) * v37;
  double v32 = v22 + (v32 - v22) * v37;
  CGPathAddLineToPoint(a1, 0, v31, v32);
  double v30 = 1.0;
  double v23 = v51;
  double v25 = v50;
LABEL_28:
  double v38 = &a2[2 * a3 - 2];
  double v39 = *v38 - a4;
  double v40 = v38[1] - a5;
  if (v49 >= v30)
  {
    if (v19)
    {
      double v46 = a1;
      double v44 = v39;
      double v45 = v40;
      goto LABEL_35;
    }
  }
  else
  {
    double v41 = v50;
    if (v25 < v50)
    {
      if (!v19)
      {
        double v42 = (v23 - v25) / (v48 - v25);
        double v31 = v31 + (v39 - v31) * v42;
        double v32 = v32 + (v40 - v32) * v42;
        CGPathMoveToPoint(a1, 0, v31, v32);
        double v41 = v50;
        double v25 = v51;
      }
      double v43 = (v41 - v25) / (v48 - v25);
      double v44 = v31 + (v39 - v31) * v43;
      double v45 = v32 + (v40 - v32) * v43;
      double v46 = a1;
LABEL_35:
      CGPathAddLineToPoint(v46, 0, v44, v45);
    }
  }
  return a3 > 1;
}

uint64_t _MKMapRectThatFits(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17)
{
  unint64_t v23 = +[MKMapView minZoomLevelForMapType:viewSize:](MKMapView, "minZoomLevelForMapType:viewSize:", 0, a5, a6);
  return +[MKMapView _mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:](MKMapView, "_mapRectThatFitsViewBounds:mapRect:viewInsets:edgePadding:minZoomLevel:maxZoomLevel:snapToZoomLevel:", 0, 0.0, 0.0, a5, a6, a1, a2, a3, a4, *MEMORY[0x1E4F437F8], *(void *)(MEMORY[0x1E4F437F8] + 8), *(void *)(MEMORY[0x1E4F437F8] + 16), *(void *)(MEMORY[0x1E4F437F8] + 24), a15, a16, a17, (double)v23,
           0x4035000000000000);
}

long double MKMapRectMakeWithZoomLevel(double a1, double a2, double a3, double a4)
{
  return a1 - a4 / (1.0 / exp2(21.0 - a3)) * 0.5;
}

double MKCoordinateRegionMakeWithZoomLevel(double a1, double a2, double a3, double a4, double a5)
{
  double v8 = MKTilePointForCoordinate(a1, a2, 21.0);
  double v10 = v9;
  long double v11 = 1.0 / exp2(21.0 - a3);
  double v12 = a4 / v11;
  double v13 = a5 / v11;
  double v14 = v8 - a4 / v11 * 0.5;

  double v15 = v10 - v13 * 0.5;
  *(void *)&double result = (unint64_t)MKCoordinateRegionForMapRect(*(MKMapRect *)&v14);
  return result;
}

void MKDirectionBetween(double a1, double a2, double a3, double a4)
{
  double v6 = MKTilePointForCoordinate(a1, a2, 21.0);
  double v8 = v7;
  double v9 = MKTilePointForCoordinate(a3, a4, 21.0);
  double v11 = v10;
  double v12 = v9 - v6;
  double v13 = v8 - v11;
  if ((v8 - v11 >= 0.0000000037252903 || v13 <= -0.0000000037252903)
    && (v12 >= 0.0000000037252903 || v12 <= -0.0000000037252903))
  {
    long double v16 = 1.57079633 - atan2(v13, v12);
    fmod(v16, 6.28318531);
  }
}

id _accuracyRadiusAnimation(uint64_t a1, void *a2, void *a3, void *a4)
{
  long long v14[3] = *MEMORY[0x1E4F143B8];
  double v7 = (void *)MEMORY[0x1E4F39BD8];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  double v11 = [v7 animationWithKeyPath:a1];
  v14[0] = v10;
  v14[1] = v10;
  v14[2] = v9;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  [v11 setValues:v12];
  [v11 setKeyTimes:v8];

  return v11;
}

uint64_t MKFormattedStringOptionsMakeDefault@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)a1 = 1;
  *(_DWORD *)(a1 + 15) = 0;
  *(unsigned char *)(a1 + 1_Block_object_dispose(&STACK[0x240], 8) = MKApplicationLayoutDirectionIsRightToLeft();
  uint64_t result = +[MKTransitItemReferenceDateUpdater referenceDateAsTimeInterval];
  *(void *)(a1 + 24) = v3;
  return result;
}

id MKTransitDepartureColorForThemeWithLiveStatus(void *a1, uint64_t a2)
{
  id v4 = a1;
  double v5 = v4;
  if ((unint64_t)(a2 - 3) < 3)
  {
    uint64_t v6 = [v4 transitDelayedTextColor];
  }
  else if ((unint64_t)(a2 - 1) >= 2)
  {
    if (a2) {
      goto LABEL_8;
    }
    uint64_t v6 = [v4 lightTextColor];
  }
  else
  {
    uint64_t v6 = [v4 transitOntimeTextColor];
  }
  double v2 = (void *)v6;
LABEL_8:

  return v2;
}

id MKTransitLiveDepartureColorForLiveStatus(uint64_t a1)
{
  double v2 = +[MKInfoCardThemeManager currentTheme];
  uint64_t v3 = MKTransitDepartureColorForThemeWithLiveStatus(v2, a1);

  return v3;
}

id MKTransitLiveDepartureColorForViewWithLiveStatus(void *a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(a1, "mk_theme");
  id v4 = MKTransitDepartureColorForThemeWithLiveStatus(v3, a2);

  return v4;
}

void sub_18BCD24B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCD3730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCD378C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCD3808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MKTileOverlay;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18BCD3960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void fillTemplate(NSMutableString *a1, NSString *a2, uint64_t a3)
{
  double v7 = a1;
  double v5 = a2;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v7, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 0, 0, [(NSMutableString *)v7 length]);
}

{
  NSString *v5;
  void *v6;
  NSMutableString *v7;
  uint64_t vars8;

  double v7 = a1;
  double v5 = a2;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v7, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 0, 0, [(NSMutableString *)v7 length]);
}

void sub_18BCD3A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCD3B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18BCD3C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18BCD3EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18BCD3FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCD415C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BCD41C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCD42E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18BCD46B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18BCD475C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCD4958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double mapRectContainingMapItems(void *a1, double a2, double a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if ([v5 count] == 1)
  {
    uint64_t v6 = [v5 firstObject];
    if ([v6 _venueFeatureType])
    {
      [v6 _coordinate];
      double v8 = v7;
      double v10 = v9;
      GEOConfigGetDouble();
      MKCoordinateRegionMakeWithZoomLevel(v8, v10, v11, a2, a3);
      GEOMapRectForCoordinateRegion();
LABEL_42:
      double v16 = v12;
      goto LABEL_43;
    }
    double v13 = [v6 _displayMapRegion];

    if (v13)
    {
      double v14 = [v6 _displayMapRegion];
      GEOMapRectForMapRegion();
      double v16 = v15;

LABEL_43:
      goto LABEL_44;
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    double v21 = 0.0;
    double v22 = 9.22337204e18;
    double v23 = 0.0;
    double v24 = 9.22337204e18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "_coordinate", (void)v37);
        double v28 = MKTilePointForCoordinate(v26, v27, 21.0);
        if (v24 >= v28) {
          double v24 = v28;
        }
        if (v22 >= v29) {
          double v22 = v29;
        }
        if (v21 <= v28) {
          double v21 = v28;
        }
        if (v23 <= v29) {
          double v23 = v29;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v19);
  }
  else
  {
    double v21 = 0.0;
    double v22 = 9.22337204e18;
    double v23 = 0.0;
    double v24 = 9.22337204e18;
  }

  if (v24 <= v21) {
    double v30 = v21;
  }
  else {
    double v30 = v24;
  }
  if (v24 >= v21) {
    double v31 = v21;
  }
  else {
    double v31 = v24;
  }
  if (v30 - v31 <= 0.0
    || (v22 <= v23 ? (double v32 = v23) : (double v32 = v22), v22 >= v23 ? (v33 = v23) : (v33 = v22), v32 - v33 <= 0.0))
  {
    uint64_t v6 = objc_msgSend(v17, "firstObject", (void)v37);
    [v6 _coordinate];
    double v12 = MKMapRectMakeWithRadialDistance(v34, v35, 100.0);
    goto LABEL_42;
  }
  if (v24 == INFINITY && v22 == INFINITY) {
    double v16 = INFINITY;
  }
  else {
    double v16 = v24 + 0.0;
  }
LABEL_44:

  return v16;
}

void sub_18BCD5828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCD63AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCD65CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  std::mutex::unlock(v16);

  _Unwind_Resume(a1);
}

uint64_t geo::_retain_ptr<NSDictionary * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_1ED916FD8;

  return a1;
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_1ED916FF8;

  return a1;
}

void sub_18BCD6A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  std::mutex::unlock(v19);
  objc_storeWeak(&location, 0);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_18BCD6B20()
{
}

void sub_18BCD6DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCD6ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__deallocate_node(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      double v2 = *(void **)v1;
      *((void *)v1 + 2) = &unk_1ED916FF8;

      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + _Block_object_dispose(&STACK[0x240], 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + _Block_object_dispose(&STACK[0x240], 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        id v5 = (uint64_t *)v3[1];
        std::__destroy_at[abi:ne180100]<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,0>((uint64_t)(v3 + 2));
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__destroy_at[abi:ne180100]<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,0>(uint64_t a1)
{
  *(void *)(a1 + 40) = &unk_1ED916FD8;

  *(void *)a1 = &unk_1ED916FF8;
  uint64_t v2 = *(void **)(a1 + 8);
}

void std::__list_imp<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(id *a1)
{
  if (a1[2])
  {
    uint64_t v2 = (void **)*a1;
    uint64_t v3 = (id *)a1[1];
    uint64_t v4 = *v3;
    v4[1] = *((void *)*a1 + 1);
    *v2[1] = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        id v5 = (id *)v3[1];
        objc_storeWeak(v3 + 7, 0);
        objc_destroyWeak(v3 + 7);
        v3[2] = &unk_1ED916FF8;

        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__erase_unique<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(void *a1, uint64_t a2)
{
  uint64_t v3 = std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::find<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(a1, a2);
  if (!v3) {
    return;
  }
  uint64_t v4 = v3;
  int8x8_t v5 = (int8x8_t)a1[1];
  uint64_t v6 = *v3;
  unint64_t v7 = (unint64_t)v3[1];
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    if (v7 >= *(void *)&v5) {
      v7 %= *(void *)&v5;
    }
  }
  else
  {
    v7 &= *(void *)&v5 - 1;
  }
  double v9 = *(uint64_t ***)(*a1 + 8 * v7);
  do
  {
    double v10 = v9;
    double v9 = (uint64_t **)*v9;
  }
  while (v9 != v3);
  if (v10 == a1 + 2) {
    goto LABEL_20;
  }
  double v11 = v10[1];
  if (v8.u32[0] > 1uLL)
  {
    if ((unint64_t)v11 >= *(void *)&v5) {
      double v11 = (uint64_t *)((unint64_t)v11 % *(void *)&v5);
    }
  }
  else
  {
    double v11 = (uint64_t *)((unint64_t)v11 & (*(void *)&v5 - 1));
  }
  if (v11 != (uint64_t *)v7)
  {
LABEL_20:
    if (v6)
    {
      double v12 = (uint64_t *)v6[1];
      if (v8.u32[0] > 1uLL)
      {
        double v13 = (uint64_t *)v6[1];
        if ((unint64_t)v12 >= *(void *)&v5) {
          double v13 = (uint64_t *)((unint64_t)v12 % *(void *)&v5);
        }
      }
      else
      {
        double v13 = (uint64_t *)((unint64_t)v12 & (*(void *)&v5 - 1));
      }
      if (v13 == (uint64_t *)v7) {
        goto LABEL_24;
      }
    }
    *(void *)(*a1 + 8 * v7) = 0;
    uint64_t v6 = *v3;
  }
  if (v6)
  {
    double v12 = (uint64_t *)v6[1];
LABEL_24:
    if (v8.u32[0] > 1uLL)
    {
      if ((unint64_t)v12 >= *(void *)&v5) {
        double v12 = (uint64_t *)((unint64_t)v12 % *(void *)&v5);
      }
    }
    else
    {
      double v12 = (uint64_t *)((unint64_t)v12 & (*(void *)&v5 - 1));
    }
    if (v12 != (uint64_t *)v7)
    {
      *(void *)(*a1 + 8 * (void)v12) = v10;
      uint64_t v6 = *v3;
    }
  }
  void *v10 = v6;
  *uint64_t v3 = 0;
  --a1[3];
  v3[2] = (uint64_t *)&unk_1ED916FF8;

  operator delete(v4);
}

uint64_t **std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::find<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>(void *a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a2 + 8) hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  double v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (uint64_t i = *v10; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if (geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(i[3], a2))return i; {
    }
      }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }
      else
      {
        v12 &= *(void *)&v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = *(id *)(a2 + 8);
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = [v5 isEqual:v6];
  }

  return v7;
}

void sub_18BCD7410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](char a1, uint64_t a2)
{
  if (a1)
  {
    *(void *)(a2 + 16) = &unk_1ED916FF8;
  }
  else if (!a2)
  {
    return;
  }

  operator delete((void *)a2);
}

void *geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(void *a1, void *a2)
{
  id v3 = a2;
  *a1 = &unk_1ED916FF8;
  a1[1] = v3;
  return a1;
}

void geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_1ED916FF8;

  JUMPOUT(0x18C1392D0);
}

uint64_t std::list<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::splice(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  if (a2 != a4)
  {
    id v4 = (uint64_t *)a4[1];
    if (v4 != a2)
    {
      uint64_t v5 = *a4;
      *(void *)(v5 + _Block_object_dispose(&STACK[0x240], 8) = v4;
      *(void *)a4[1] = v5;
      uint64_t v6 = *a2;
      *(void *)(v6 + _Block_object_dispose(&STACK[0x240], 8) = a4;
      *a4 = v6;
      *a2 = (uint64_t)a4;
      a4[1] = (uint64_t)a2;
      --*(void *)(a3 + 16);
      ++*(void *)(result + 16);
    }
  }
  return result;
}

void geo::_retain_ptr<NSDictionary * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::~_retain_ptr(uint64_t a1)
{
  *(void *)a1 = &unk_1ED916FD8;

  JUMPOUT(0x18C1392D0);
}

uint64_t geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator=(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = v3;

  return a1;
}

void *std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v7 = [*(id *)(a2 + 8) hash];
  unint64_t v8 = v7;
  unint64_t v9 = a1[1];
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(void **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)i + 3), a2))return i; {
        }
          }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  double v15 = a1 + 2;
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v8;
  geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((void *)i + 2, *a3);
  *((void *)i + 5) = 0;
  float v16 = (float)(unint64_t)(a1[3] + 1);
  float v17 = *((float *)a1 + 8);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    else {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v9 = a1[1];
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v28 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        unint64_t v28 = std::__next_prime(v28);
      }
      else
      {
        uint64_t v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2) {
          unint64_t v28 = v30;
        }
      }
      if (*(void *)&prime <= v28) {
        int8x8_t prime = (int8x8_t)v28;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          double v22 = operator new(8 * *(void *)&prime);
          double v23 = (void *)*a1;
          *a1 = (uint64_t)v22;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v24++) = 0;
          while (*(void *)&prime != v24);
          double v25 = (void *)*v15;
          if (*v15)
          {
            unint64_t v26 = v25[1];
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(void *)&prime) {
                v26 %= *(void *)&prime;
              }
            }
            else
            {
              v26 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v26) = v15;
            double v31 = (void *)*v25;
            if (*v25)
            {
              do
              {
                unint64_t v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(void *)&prime) {
                    v32 %= *(void *)&prime;
                  }
                }
                else
                {
                  v32 &= *(void *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(void *)(*a1 + 8 * v32))
                  {
                    *(void *)(*a1 + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  void *v25 = *v31;
                  *double v31 = **(void **)(*a1 + 8 * v32);
                  **(void **)(*a1 + 8 * v32) = v31;
                  double v31 = v25;
                }
                unint64_t v32 = v26;
LABEL_55:
                double v25 = v31;
                double v31 = (void *)*v31;
                unint64_t v26 = v32;
              }
              while (v31);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        long long v37 = (void *)*a1;
        *a1 = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v9 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v33 = *a1;
  double v34 = *(void **)(*a1 + 8 * v3);
  if (v34)
  {
    *(void *)uint64_t i = *v34;
LABEL_72:
    void *v34 = i;
    goto LABEL_73;
  }
  *(void *)uint64_t i = *v15;
  void *v15 = i;
  *(void *)(v33 + 8 * v3) = v15;
  if (*(void *)i)
  {
    unint64_t v35 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9) {
        v35 %= v9;
      }
    }
    else
    {
      v35 &= v9 - 1;
    }
    double v34 = (void *)(*a1 + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_18BCD7A38(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void *geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(void *a1, uint64_t a2)
{
  *a1 = &unk_1ED916FF8;
  a1[1] = 0;
  id v3 = *(id *)(a2 + 8);
  id v4 = (void *)a1[1];
  a1[1] = v3;

  return a1;
}

id *geo::_geo_weak_ptr<NSDictionary * {__strong}>::operator=(id *a1, id *location)
{
  if (a1 != location)
  {
    id WeakRetained = objc_loadWeakRetained(location);
    objc_storeWeak(a1, WeakRetained);
  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v7 = [*(id *)(a2 + 8) hash];
  unint64_t v8 = v7;
  unint64_t v9 = a1[1];
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(void **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)i + 3), a2))return i; {
        }
          }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  double v15 = a1 + 2;
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v8;
  geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((void *)i + 2, *a3);
  *((void *)i + 5) = 0;
  float v16 = (float)(unint64_t)(a1[3] + 1);
  float v17 = *((float *)a1 + 8);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    else {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v9 = a1[1];
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v28 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        unint64_t v28 = std::__next_prime(v28);
      }
      else
      {
        uint64_t v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2) {
          unint64_t v28 = v30;
        }
      }
      if (*(void *)&prime <= v28) {
        int8x8_t prime = (int8x8_t)v28;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          double v22 = operator new(8 * *(void *)&prime);
          double v23 = (void *)*a1;
          *a1 = (uint64_t)v22;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v24++) = 0;
          while (*(void *)&prime != v24);
          double v25 = (void *)*v15;
          if (*v15)
          {
            unint64_t v26 = v25[1];
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(void *)&prime) {
                v26 %= *(void *)&prime;
              }
            }
            else
            {
              v26 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v26) = v15;
            double v31 = (void *)*v25;
            if (*v25)
            {
              do
              {
                unint64_t v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(void *)&prime) {
                    v32 %= *(void *)&prime;
                  }
                }
                else
                {
                  v32 &= *(void *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(void *)(*a1 + 8 * v32))
                  {
                    *(void *)(*a1 + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  void *v25 = *v31;
                  *double v31 = **(void **)(*a1 + 8 * v32);
                  **(void **)(*a1 + 8 * v32) = v31;
                  double v31 = v25;
                }
                unint64_t v32 = v26;
LABEL_55:
                double v25 = v31;
                double v31 = (void *)*v31;
                unint64_t v26 = v32;
              }
              while (v31);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        long long v37 = (void *)*a1;
        *a1 = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v9 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v33 = *a1;
  double v34 = *(void **)(*a1 + 8 * v3);
  if (v34)
  {
    *(void *)uint64_t i = *v34;
LABEL_72:
    void *v34 = i;
    goto LABEL_73;
  }
  *(void *)uint64_t i = *v15;
  void *v15 = i;
  *(void *)(v33 + 8 * v3) = v15;
  if (*(void *)i)
  {
    unint64_t v35 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9) {
        v35 %= v9;
      }
    }
    else
    {
      v35 &= v9 - 1;
    }
    double v34 = (void *)(*a1 + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_18BCD7EE4(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__list_iterator<geo::detail::_CacheItem<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},geo::detail::_GEOGenericContainer<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,NSDictionary * {__strong},std::hash<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<_MKPinAnnotationViewImageCacheKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,geo::GEOGenericContainerStrongReferenceTag,64ul,2097152ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void sub_18BCD8620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t containsKey(void *a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v10 = v4;
        id v11 = v9;
        int v12 = objc_msgSend(v10, "keyType", (void)v36);
        if (v12 == [v11 keyType])
        {
          int v13 = [v10 keyType];
          if ((v13 - 4) < 2)
          {
            uint64_t v30 = [v10 imageName];
            double v31 = [v11 imageName];
            int v32 = [v30 isEqualToString:v31];

            if (v32) {
              goto LABEL_26;
            }
          }
          else if (v13 == 2)
          {
            int v33 = [v10 iconAttributeKey];
            if (v33 == [v11 iconAttributeKey])
            {
              int v34 = [v10 iconAttributeValue];
              if (v34 == [v11 iconAttributeValue]) {
                goto LABEL_26;
              }
            }
          }
          else
          {
            if (v13 != 1) {
              goto LABEL_26;
            }
            int v14 = [v10 shieldType];
            if (v14 == [v11 shieldType])
            {
              double v15 = [v10 shieldText];
              float v16 = [v11 shieldText];
              int v17 = [v15 isEqualToString:v16];

              if (v17)
              {
                BOOL v18 = [v10 shieldTextLocale];
                unint64_t v19 = [v11 shieldTextLocale];
                int v20 = [v18 isEqualToString:v19];

                if (v20)
                {
                  [v10 transitLineColor];
                  unint64_t v42 = __PAIR64__(v22, v21);
                  unint64_t v43 = __PAIR64__(v24, v23);
                  [v11 transitLineColor];
                  unint64_t v40 = __PAIR64__(v28, v27);
                  unint64_t v41 = __PAIR64__(v26, v25);
                  if (v42 == __PAIR64__(v28, v27) && v43 == __PAIR64__(v26, v25))
                  {
LABEL_26:

                    uint64_t v6 = 1;
                    goto LABEL_27;
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_27:

  return v6;
}

void sub_18BCE0268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCE034C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BCE04B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18BCE05A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t _MKPointInPolygon(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char v4 = 0;
  if (a2)
  {
    unint64_t v5 = 0;
    uint64_t v6 = (double *)(a1 + 8);
    do
    {
      if (v5 < a2 - 1) {
        unint64_t v7 = v5 + 1;
      }
      else {
        unint64_t v7 = 0;
      }
      unint64_t v8 = (double *)(a1 + 16 * v7);
      double v9 = v8[1];
      if (*v6 > v9 || *v6 == v9 && *(v6 - 1) > *v8)
      {
        unint64_t v10 = v7;
        unint64_t v7 = v5;
      }
      else
      {
        double v9 = *v6;
        unint64_t v10 = v5;
      }
      if (a4 >= v9)
      {
        double v11 = *(double *)(a1 + 16 * v7 + 8);
        if (a4 < v11)
        {
          double v12 = v11 - v9;
          if (v12 != 0.0
            && a3 < *(double *)(a1 + 16 * v10)
                  + (*(double *)(a1 + 16 * v7) - *(double *)(a1 + 16 * v10)) / v12 * (a4 - v9))
          {
            v4 ^= 1u;
          }
        }
      }
      ++v5;
      v6 += 2;
    }
    while (a2 != v5);
  }
  return v4 & 1;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB316220 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchableItemAttributeSetClass_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = qword_1EB316220;
  uint64_t v11 = qword_1EB316220;
  if (!qword_1EB316220)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __CoreSpotlightLibraryCore_block_invoke;
    v5[4] = &unk_1E54B8598;
    uint64_t v6 = &v8;
    unint64_t v7 = v5;
    long long v12 = xmmword_1E54BF268;
    long long v13 = *(_OWORD *)&off_1E54BF278;
    v9[3] = _sl_dlopen();
    qword_1EB316220 = *(void *)(v6[1] + 24);
    uint64_t v2 = v9[3];
  }
  _Block_object_dispose(&v8, 8);
  id v3 = v5[0];
  if (v2)
  {
    if (!v5[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    id v3 = (void *)abort_report_np();
    __break(1u);
  }
  free(v3);
LABEL_5:
  Class result = objc_getClass("CSSearchableItemAttributeSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    abort_report_np();
  }
  qword_1EB316228 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18BCE51A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCE5894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MKTransitArtworkDataSourceAllowMasking(void *a1)
{
  id v1 = a1;
  if ([v1 artworkSourceType] == 1)
  {
    uint64_t v2 = [v1 shieldDataSource];
    if (!v2) {
      goto LABEL_6;
    }
    if (qword_1EB316238 != -1) {
      dispatch_once(&qword_1EB316238, &__block_literal_global_103);
    }
    uint64_t v3 = _MergedGlobals_176;
    char v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "shieldType"));
    LOBYTE(v3) = [(id)v3 containsObject:v4];

    if ((v3 & 1) == 0)
    {
      uint64_t v6 = [v2 shieldText];
      if (v6)
      {
        BOOL v5 = 0;
      }
      else
      {
        unint64_t v7 = [v2 shieldColorString];
        BOOL v5 = v7 == 0;
      }
    }
    else
    {
LABEL_6:
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __MKTransitArtworkDataSourceAllowMasking_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1ED97EFE8, 0);
  id v1 = (void *)_MergedGlobals_176;
  _MergedGlobals_176 = v0;
}

void sub_18BCE7294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MKSnappedRouteFillWithElements(uint64_t a1, uint64_t a2, _OWORD *a3, unsigned int a4)
{
  uint64_t v6 = a2;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  *((void *)a3 + 4) = &kMKSnappedRouteEntryElement;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a2];
  {
    if (*(_DWORD *)(a1 + 8) != 1)
    {
      double v9 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
      [i addObject:v9];
    }
    a1 += 16;
  }
  [i sortUsingComparator:&__block_literal_global_104];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = i;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = (int *)objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v14), "pointerValue", (void)v37);
        unint64_t v16 = 0;
        uint64_t v17 = (**((int **)a3 + 4) - 180) % 360;
        uint64_t v18 = (uint64_t)(*v15 - (v17 + (v17 < 0 ? 0x168uLL : 0))) % 360;
        uint64_t v19 = v18 + 360;
        if (v18 >= 0) {
          uint64_t v19 = v18;
        }
        int v20 = v15[2];
        BOOL v21 = v20 == 2;
        char v22 = a4 & v21;
        int v23 = v21 & (a4 >> 1);
        uint64_t v24 = -v19;
        uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v26 = -1;
        uint64_t v27 = -1;
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          if (v16 < 5) {
            char v29 = v22;
          }
          else {
            char v29 = 0;
          }
          if ((v29 & 1) == 0)
          {
            char v30 = v16 - 4 < 0xFFFFFFFFFFFFFFFDLL ? v23 : 0;
            if ((v30 & 1) == 0)
            {
              uint64_t v31 = *((void *)a3 + v16);
              if (!v31 || !*(_DWORD *)(v31 + 8))
              {
                unint64_t v32 = v19 % 360 + (v19 % 360 < 0 ? 0x168uLL : 0);
                if (v32 >= v24 % 360 + (v24 % 360 < 0 ? 0x168uLL : 0)) {
                  unint64_t v32 = v24 % 360 + (v24 % 360 < 0 ? 0x168uLL : 0);
                }
                if ((uint64_t)v32 < v28)
                {
                  uint64_t v28 = v32;
                  uint64_t v27 = v16;
                }
                BOOL v33 = (uint64_t)v32 >= v25 || v32 > 0x18;
                if (!v33 && !v31)
                {
                  uint64_t v25 = v32;
                  uint64_t v26 = v16;
                }
              }
            }
          }
          ++v16;
          v24 += 45;
          v19 -= 45;
        }
        while (v16 != 8);
        if (v26 != -1)
        {
          int v34 = (void *)a3 + v27;
LABEL_36:
          void *v34 = v15;
          goto LABEL_37;
        }
        if (v27 != -1)
        {
          int v34 = (void *)a3 + v27;
          if (!*v34 || v20 == 2) {
            goto LABEL_36;
          }
        }
LABEL_37:
        ++v14;
      }
      while (v14 != v12);
      uint64_t v36 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v12 = v36;
    }
    while (v36);
  }
}

uint64_t __MKSnappedRouteFillWithElements_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = (_DWORD *)[a2 pointerValue];
  uint64_t v6 = (_DWORD *)[v4 pointerValue];

  LODWORD(v7) = *v5 % 360;
  if ((v7 & 0x80000000) == 0) {
    unint64_t v7 = (int)v7;
  }
  else {
    unint64_t v7 = (int)v7 + 360;
  }
  LODWORD(v_Block_object_dispose(&STACK[0x240], 8) = *v6 % 360;
  if ((v8 & 0x80000000) == 0) {
    unint64_t v8 = (int)v8;
  }
  else {
    unint64_t v8 = (int)v8 + 360;
  }
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 > v8;
  if (v9) {
    return v10;
  }
  else {
    return -1;
  }
}

uint64_t __MKJunctionManeuverShouldShowNAElementsForManeuverTypeInSnappedJunction_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a3)
  {
    int v4 = *(_DWORD *)(a3 + 8);
    if (v4 != 1)
    {
      ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
      if (v4 == 2) {
        *a4 = 1;
      }
    }
  }
  return result;
}

void sub_18BCEABA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BCEB3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BCECA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,char a24)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_18BCECF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCECFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCED0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCED188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCED230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCED4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18BCED5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getCHSIsWidgetExtensionPointSymbolLoc()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCHSIsWidgetExtensionPointSymbolLoc_ptr;
  uint64_t v6 = getCHSIsWidgetExtensionPointSymbolLoc_ptr;
  if (!getCHSIsWidgetExtensionPointSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getCHSIsWidgetExtensionPointSymbolLoc_block_invoke;
    v2[3] = &unk_1E54B8448;
    v2[4] = &v3;
    __getCHSIsWidgetExtensionPointSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18BCED81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCHSIsWidgetExtensionPointSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ChronoServicesLibraryCore();
  if (!v2)
  {
    int v4 = (void *)abort_report_np();
    free(v4);
  }
  Class result = dlsym(v2, "CHSIsWidgetExtensionPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCHSIsWidgetExtensionPointSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18BCEDD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _shouldUseSnapshotService(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!GEOConfigGetBOOL()) {
    goto LABEL_4;
  }
  uint64_t v2 = [v1 _routeOverlay];

  if (v2) {
    goto LABEL_4;
  }
  uint64_t v3 = [v1 _routeContext];

  if (v3) {
    goto LABEL_4;
  }
  uint64_t v6 = [v1 _allOverlayRenderers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v8 = [v1 _allOverlayRenderers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v19 + 1) + 8 * i) conformsToProtocol:&unk_1ED997210])
          {

            goto LABEL_4;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  if (![v1 _useSnapshotService]
    || v1 && ([v1 _cartographicConfiguration], v18 == 2)
    || _MKLinkedOnOrAfterReleaseSet(2310)
    && (_UIApplicationIsExtension() & 1) == 0
    && ([v1 mapType] == 4
     || [v1 mapType] == 3
     || ([v1 scale],
         double v14 = v13,
         [v1 size],
         double v16 = v14 * v15,
         [v1 size],
         GEOConfigGetInteger() < (uint64_t)llround(v16 * v17))))
  {
LABEL_4:
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

void sub_18BCEE21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BCEE5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18C139AE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_18BCEEEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ChronoServicesLibraryCore()
{
  if (!ChronoServicesLibraryCore_frameworkLibrary) {
    ChronoServicesLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  return ChronoServicesLibraryCore_frameworkLibrary;
}

uint64_t __ChronoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChronoServicesLibraryCore_frameworkLibrardouble y = result;
  return result;
}

id _snapshotQueue()
{
  if (qword_1EB316248 != -1) {
    dispatch_once(&qword_1EB316248, &__block_literal_global_166);
  }
  uint64_t v0 = (void *)_MergedGlobals_177;

  return v0;
}

void ___snapshotQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.maps.snapshotter", v2);
  id v1 = (void *)_MergedGlobals_177;
  _MergedGlobals_177 = (uint64_t)v0;
}

void ___gate_block_invoke()
{
  uint64_t Integer = GEOConfigGetInteger();
  GEOConfigGetDouble();
  if (v1 <= 0.0) {
    double v1 = 60.0;
  }
  double v2 = (double)(int)Integer / fmax(v1, 1.0);
  uint64_t v3 = [MKThrottledGate alloc];
  _snapshotQueue();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(MKThrottledGate *)v3 initWithMax:Integer refreshRate:v6 queue:fmax(v2, 0.1)];
  uint64_t v5 = (void *)qword_1EB316250;
  qword_1EB316250 = v4;
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x1F40F4BE0]();
}

uint64_t CALayerGetSuperlayer()
{
  return MEMORY[0x1F40F4BF0]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DRotate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D50](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D78](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
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

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x1F40D9A20](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1F40D9F58]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x1F40D9F78](c);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t CGContextGetLineCap()
{
  return MEMORY[0x1F40D9FC8]();
}

uint64_t CGContextGetLineJoin()
{
  return MEMORY[0x1F40D9FD0]();
}

uint64_t CGContextGetLineWidth()
{
  return MEMORY[0x1F40D9FD8]();
}

uint64_t CGContextGetMiterLimit()
{
  return MEMORY[0x1F40D9FE0]();
}

void CGContextRelease(CGContextRef c)
{
}

uint64_t CGContextResetCTM()
{
  return MEMORY[0x1F40DA070]();
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

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
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

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGPathRef CGPathCreateCopyByDashingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat phase, const CGFloat *lengths, size_t count)
{
  return (CGPathRef)MEMORY[0x1F40DB018](path, transform, lengths, count, phase);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x1F40DB038](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  MEMORY[0x1F40DB0D8](path);
  result.double y = v2;
  result.double x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x1F40DB120](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1F40DB590]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1F40DF330]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x1F40DF650](fontURL, *(void *)&scope, error);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t GEOApplicationIdentifierOrProcessName()
{
  return MEMORY[0x1F411C030]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x1F411C040]();
}

uint64_t GEOCanUserMakeLagunaBeachContributions()
{
  return MEMORY[0x1F411C050]();
}

uint64_t GEOConfigGetArray()
{
  return MEMORY[0x1F411C070]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1F411C078]();
}

uint64_t GEOConfigGetDictionary()
{
  return MEMORY[0x1F411C088]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x1F411C090]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x1F411C098]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x1F411C0A8]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x1F411C0B0]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x1F411C0C0]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x1F411C0C8]();
}

uint64_t GEOConfigSetArray()
{
  return MEMORY[0x1F411C0D0]();
}

uint64_t GEOCoordinateRegionForMapRect()
{
  return MEMORY[0x1F411C110]();
}

uint64_t GEOCoordinateRegionMakeWithDistance()
{
  return MEMORY[0x1F411C118]();
}

uint64_t GEODefaultsDisableServer()
{
  return MEMORY[0x1F411C120]();
}

uint64_t GEODistanceBetweenPointAndLine()
{
  return MEMORY[0x1F411C128]();
}

uint64_t GEODoesUserHaveValidAccountForMakingContributions()
{
  return MEMORY[0x1F411C130]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1F411C140]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x1F411C170]();
}

uint64_t GEOGeodesicEvaluate()
{
  return MEMORY[0x1F411C178]();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return MEMORY[0x1F411C198]();
}

uint64_t GEOIsBAASupported()
{
  return MEMORY[0x1F411C1A0]();
}

uint64_t GEOMachAbsoluteTimeGetCurrent()
{
  return MEMORY[0x1F411C1C8]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1F411C1E8]();
}

uint64_t GEOMapPointsPerMeterAtLatitude()
{
  return MEMORY[0x1F411C1F0]();
}

uint64_t GEOMapRectBoundingMapPoints()
{
  return MEMORY[0x1F411C1F8]();
}

uint64_t GEOMapRectContainsPoint()
{
  return MEMORY[0x1F411C200]();
}

uint64_t GEOMapRectEnclosingCameraProperties()
{
  return MEMORY[0x1F41676E0]();
}

uint64_t GEOMapRectForCoordinateRegion()
{
  return MEMORY[0x1F411C208]();
}

uint64_t GEOMapRectForMapRegion()
{
  return MEMORY[0x1F411C218]();
}

uint64_t GEONetworkDefaultsDisableServerConnection()
{
  return MEMORY[0x1F411C298]();
}

uint64_t GEOOnce()
{
  return MEMORY[0x1F411C2B8]();
}

uint64_t GEOPolylineCoordinateNearestIndex()
{
  return MEMORY[0x1F411C330]();
}

uint64_t GEOResourceFilterScaleForScale()
{
  return MEMORY[0x1F411C388]();
}

uint64_t GEOServerFormatTokenEqual()
{
  return MEMORY[0x1F411C3B0]();
}

uint64_t GEOSupportsOfflineMaps()
{
  return MEMORY[0x1F411C3E8]();
}

uint64_t GEOTileKeyEquals()
{
  return MEMORY[0x1F411C3F8]();
}

uint64_t GEOTileKeyMakeEmpty()
{
  return MEMORY[0x1F411C410]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x1F411C418]();
}

uint64_t GEOTransitDepartureIsImminentDepartureTimeInterval()
{
  return MEMORY[0x1F411C420]();
}

uint64_t GEOTransitIncidentEntityAffectsSequence()
{
  return MEMORY[0x1F411C428]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MNFormattedStringOptionsHash()
{
  return MEMORY[0x1F4130798]();
}

uint64_t MNFormattedStringOptionsIsEqual()
{
  return MEMORY[0x1F41307A0]();
}

uint64_t MNInstructionsDistanceTypeConvertToMeters()
{
  return MEMORY[0x1F41307A8]();
}

uint64_t MNInstructionsLocalizedImperialUnits()
{
  return MEMORY[0x1F41307B0]();
}

uint64_t MNInstructionsLocalizedMetricUnits()
{
  return MEMORY[0x1F41307B8]();
}

uint64_t MNLocaleDidChangeNotification()
{
  return MEMORY[0x1F41307C0]();
}

uint64_t MapKitFeature_IsEnabled_SPRForMapSnapshots()
{
  return MEMORY[0x1F411C450]();
}

uint64_t MapsFeatureFlag_RemoveBlockListener()
{
  return MEMORY[0x1F411C458]();
}

uint64_t MapsFeature_AddBlockListener()
{
  return MEMORY[0x1F411C460]();
}

uint64_t MapsFeature_IsAvailable_Maps298()
{
  return MEMORY[0x1F411C470]();
}

uint64_t MapsFeature_IsEnabled_LagunaBeach()
{
  return MEMORY[0x1F411C4B0]();
}

uint64_t MapsFeature_IsEnabled_Maps269()
{
  return MEMORY[0x1F411C4C0]();
}

uint64_t MapsFeature_IsEnabled_MyPlacesFeatures()
{
  return MEMORY[0x1F411C4D8]();
}

uint64_t MapsFeature_IsEnabled_SearchAndDiscovery()
{
  return MEMORY[0x1F411C500]();
}

uint64_t MapsFeature_IsEnabled_ShelbyvilleMapKit()
{
  return MEMORY[0x1F411C530]();
}

uint64_t MapsFeature_IsEnabled_URLUnification()
{
  return MEMORY[0x1F411C550]();
}

uint64_t MapsFeature_RemoveBlockListener()
{
  return MEMORY[0x1F411C570]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

uint64_t NSIntegerIsValidFloorOrdinal()
{
  return MEMORY[0x1F411C578]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1F4147258]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4102BA8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4102E00]();
}

uint64_t VKAnimationCurveForCAMediaTimingFunction()
{
  return MEMORY[0x1F41676E8]();
}

uint64_t VKAnimationCurveSpring()
{
  return MEMORY[0x1F41676F0]();
}

uint64_t VKCameraPropertiesForRect()
{
  return MEMORY[0x1F41676F8]();
}

uint64_t VKCameraPropertiesForStoreFrontView()
{
  return MEMORY[0x1F4167700]();
}

uint64_t VKLineDrawWithOuterStroke()
{
  return MEMORY[0x1F4167708]();
}

uint64_t VKLocationCoordinate2DMake()
{
  return MEMORY[0x1F4167710]();
}

uint64_t VKRasterTileOverlayTileLoader()
{
  return MEMORY[0x1F4167718]();
}

uint64_t VKShieldColorsFromHexString()
{
  return MEMORY[0x1F4167720]();
}

uint64_t VKTrafficIncidentSetSubtitleBlock()
{
  return MEMORY[0x1F4167728]();
}

uint64_t VKTrafficIncidentSetTitleBlock()
{
  return MEMORY[0x1F4167730]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x1F4178E60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x1F411C580]();
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x1F411C588]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x1F411C590]();
}

uint64_t _GEOMurmurHash3_128_realign()
{
  return MEMORY[0x1F411C5B0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4102EB8]();
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::terminate(void)
{
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__double cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1F40C9E38]();
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x1F411C670]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x1F411C678]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
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

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1F40CBE18]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1F40CBE20]();
}

uint64_t dynamicValueAnimation()
{
  return MEMORY[0x1F4167738]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

uint64_t geo_assert_isolated()
{
  return MEMORY[0x1F411C690]();
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x1F411C698]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x1F411C6A0]();
}

uint64_t geo_dispatch_queue_create_with_target()
{
  return MEMORY[0x1F411C6A8]();
}

uint64_t geo_dispatch_queue_create_with_workloop_qos()
{
  return MEMORY[0x1F411C6B0]();
}

uint64_t geo_dispatch_timer_create_on_qos()
{
  return MEMORY[0x1F411C6B8]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x1F411C6D0]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x1F411C6D8]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x1F411C6E0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1F417F718](*(void *)&c);
}

uint64_t ucnv_close()
{
  return MEMORY[0x1F417FC30]();
}

uint64_t ucnv_fromUChars()
{
  return MEMORY[0x1F417FC58]();
}

uint64_t ucnv_getMaxCharSize()
{
  return MEMORY[0x1F417FC98]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1F417FCB8]();
}

uint64_t unum_close()
{
  return MEMORY[0x1F4180290]();
}

uint64_t unum_formatInt64()
{
  return MEMORY[0x1F41802B8]();
}

uint64_t unum_open()
{
  return MEMORY[0x1F41802F0]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x1F4180320]();
}