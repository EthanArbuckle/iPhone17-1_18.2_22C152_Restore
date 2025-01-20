double LAUIPhysicalButtonNormalizedFrame()
{
  if (LAUIPhysicalButtonNormalizedFrame::onceToken != -1) {
    dispatch_once(&LAUIPhysicalButtonNormalizedFrame::onceToken, &__block_literal_global);
  }
  return *(double *)&LAUIPhysicalButtonNormalizedFrame::frame;
}

void __LAUIPhysicalButtonNormalizedFrame_block_invoke()
{
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = (long long *)CFDataGetBytePtr(v1);
      long long v4 = BytePtr[1];
      LAUIPhysicalButtonNormalizedFrame::frame = *BytePtr;
      *(_OWORD *)&qword_26ACDF378 = v4;
    }
    CFRelease(v1);
  }
}

void sub_214465830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21446591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LAUIPhysicalButtonView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_214465A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214465C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LA_LOG_LAUIPhysicalButtonView(void)
{
  if (LA_LOG_LAUIPhysicalButtonView(void)::once != -1) {
    dispatch_once(&LA_LOG_LAUIPhysicalButtonView(void)::once, &__block_literal_global_102);
  }
  CFDataRef v0 = (void *)LA_LOG_LAUIPhysicalButtonView(void)::log;
  return v0;
}

void sub_214465D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21446638C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2144664AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21446655C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144666AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214466BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214467334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_21446753C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214467600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144676F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL29LA_LOG_LAUIPhysicalButtonViewv_block_invoke()
{
  LA_LOG_LAUIPhysicalButtonView(void)::log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LAUIPhysicalButtonView");
  return MEMORY[0x270F9A758]();
}

void sub_214467E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id LA_LOG_LAUIAuthenticationView()
{
  if (LA_LOG_LAUIAuthenticationView_once != -1) {
    dispatch_once(&LA_LOG_LAUIAuthenticationView_once, &__block_literal_global_158);
  }
  CFDataRef v0 = (void *)LA_LOG_LAUIAuthenticationView_log;
  return v0;
}

void sub_214469314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id LA_LOG_LAUIPKGlyphWrapper()
{
  if (LA_LOG_LAUIPKGlyphWrapper_once != -1) {
    dispatch_once(&LA_LOG_LAUIPKGlyphWrapper_once, &__block_literal_global_70);
  }
  CFDataRef v0 = (void *)LA_LOG_LAUIPKGlyphWrapper_log;
  return v0;
}

void sub_214469E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_21446A1C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_21446B268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::create_mask<std::map<CALayer *,CALayer * {__strong}>>(uint64_t **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
    id v8 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    [v7 setCornerCurve:*MEMORY[0x263F15A20]];
    [v7 setActions:v6];
    [v5 setMask:v7];
    v12 = &v11;
    uint64_t v9 = std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>(a1, (unint64_t *)&v11, (uint64_t)&std::piecewise_construct, (uint64_t **)&v12);
    v10 = (void *)v9[5];
    v9[5] = (uint64_t)v7;
  }
}

void sub_21446B430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21446B4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)LAUIPearlGlyphLabel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21446B62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21446C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  if (v23) {
  _Unwind_Resume(a1);
  }
}

void LAUI_CA_utilities::set_layer_transform(void *a1, long long *a2, LAUI_CA_utilities::spring_factory *a3)
{
  id v5 = a1;
  id v6 = v5;
  memset(&v29, 0, sizeof(v29));
  if (v5) {
    [v5 transform];
  }
  CATransform3D a = v29;
  long long v7 = *a2;
  long long v8 = a2[1];
  long long v9 = a2[3];
  *(_OWORD *)&b.m21 = a2[2];
  *(_OWORD *)&b.m23 = v9;
  *(_OWORD *)&b.m11 = v7;
  *(_OWORD *)&b.m13 = v8;
  long long v10 = a2[4];
  long long v11 = a2[5];
  long long v12 = a2[7];
  *(_OWORD *)&b.m41 = a2[6];
  *(_OWORD *)&b.m43 = v12;
  *(_OWORD *)&b.m31 = v10;
  *(_OWORD *)&b.m33 = v11;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    long long v13 = a2[5];
    v26[4] = a2[4];
    v26[5] = v13;
    long long v14 = a2[7];
    v26[6] = a2[6];
    v26[7] = v14;
    long long v15 = a2[1];
    v26[0] = *a2;
    v26[1] = v15;
    long long v16 = a2[3];
    v26[2] = a2[2];
    v26[3] = v16;
    [v6 setTransform:v26];
    if (*((unsigned char *)a3 + 56))
    {
      CATransform3D v25 = v29;
      long long v17 = *a2;
      long long v18 = a2[1];
      long long v19 = a2[3];
      v24[2] = a2[2];
      v24[3] = v19;
      v24[0] = v17;
      v24[1] = v18;
      long long v20 = a2[4];
      long long v21 = a2[5];
      long long v22 = a2[7];
      v24[6] = a2[6];
      v24[7] = v22;
      v24[4] = v20;
      v24[5] = v21;
      id v23 = LAUI_CA_utilities::add_additive_animation<CATransform3D>(v6, @"transform", a3, &v25, v24);
    }
  }
}

void sub_21446C8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21446CDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  _Unwind_Resume(a1);
}

char *std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>(char **a1, id *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  long long v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v25 = v4;
    if (v12) {
      long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    }
    else {
      long long v13 = 0;
    }
    long long v14 = &v13[8 * v9];
    long long v15 = &v13[8 * v12];
    v24 = v15;
    *(void *)long long v14 = *a2;
    long long v8 = v14 + 8;
    v23.i64[1] = (uint64_t)(v14 + 8);
    long long v17 = *a1;
    long long v16 = a1[1];
    if (v16 == *a1)
    {
      int64x2_t v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *(void *)long long v16 = 0;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      int64x2_t v19 = *(int64x2_t *)a1;
      long long v8 = (char *)v23.i64[1];
      long long v15 = v24;
    }
    *a1 = v14;
    a1[1] = v8;
    int64x2_t v23 = v19;
    long long v20 = a1[2];
    a1[2] = v15;
    v24 = v20;
    uint64_t v22 = v19.i64[0];
    std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    *(void *)long long v7 = *a2;
    long long v8 = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_21446D088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<UIView * {__strong}>::shrink_to_fit(char **a1)
{
  v3 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  unint64_t v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    uint64_t v19 = result;
    if (v5 == v4)
    {
      uint64_t v11 = 0;
      uint64_t v9 = 8 * v6;
    }
    else
    {
      long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      uint64_t v4 = *a1;
      long long v8 = a1[1];
      uint64_t v9 = (uint64_t)&v7[8 * v6];
      uint64_t v11 = &v7[8 * v10];
      uint64_t v17 = v9;
      uint64_t v18 = v11;
      if (v8 != v4)
      {
        unint64_t v12 = &v7[8 * v6];
        do
        {
          uint64_t v13 = *((void *)v8 - 1);
          v8 -= 8;
          *(void *)long long v8 = 0;
          *((void *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        long long v14 = *a1;
        uint64_t v4 = a1[1];
        uint64_t v9 = v17;
        uint64_t v11 = v18;
        goto LABEL_9;
      }
    }
    long long v14 = v4;
    unint64_t v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    long long v15 = a1[2];
    a1[2] = v11;
    uint64_t v17 = (uint64_t)v4;
    uint64_t v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_21446D15C(void *a1)
{
}

void sub_21446D4E4(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21446DD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,char a42)
{
  if (a42) {
  _Unwind_Resume(a1);
  }
}

id LAUI_CA_utilities::add_additive_animation<double>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  uint64_t v11 = LAUI_CA_utilities::spring_factory::create_animation(a3, v10);
  unint64_t v12 = [NSNumber numberWithDouble:a4 - a5];
  [(CAAnimation *)v11 setFromValue:v12];

  [(CAAnimation *)v11 setToValue:&unk_26C5341A8];
  uint64_t v13 = LAUILayerAddAdditiveAnimation(v9, v10, v11);

  return v13;
}

void sub_21446E200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21446E4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LAUI_CA_utilities::add_additive_animation<CGSize>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = a1;
  long long v14 = a2;
  long long v15 = LAUI_CA_utilities::spring_factory::create_animation(a3, v14);
  long long v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSize:", a4 - a6, a5 - a7);
  [(CAAnimation *)v15 setFromValue:v16];

  uint64_t v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [(CAAnimation *)v15 setToValue:v17];

  uint64_t v18 = LAUILayerAddAdditiveAnimation(v13, v14, v15);

  return v18;
}

void sub_21446E850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

LAUI_CA_utilities::spring_factory *LAUI_CA_utilities::spring_factory::spring_factory(LAUI_CA_utilities::spring_factory *this, double a2, double a3, double a4, double a5, CAMediaTimingFunction *a6)
{
  uint64_t v11 = a6;
  unint64_t v12 = v11;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  if (v11)
  {
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  }
  *((void *)this + 4) = v13;
  *((unsigned char *)this + 40) = 0;
  *((void *)this + 6) = 0;

  return this;
}

uint64_t LAUI_CA_utilities::set_layer_geometry(void *a1, LAUI_CA_utilities::spring_factory *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v13 = a1;
  [v13 position];
  double v15 = v14;
  double v17 = v16;
  [v13 bounds];
  double v30 = v19;
  double v31 = v18;
  double v21 = v20;
  double v23 = v22;
  if (v15 == a3 && v17 == a4)
  {
    uint64_t v26 = 0;
  }
  else
  {
    objc_msgSend(v13, "setPosition:", a3, a4);
    if (*((unsigned char *)a2 + 56)) {
      id v25 = LAUI_CA_utilities::add_additive_animation<CGPoint>(v13, @"position", a2, v15, v17, a3, a4);
    }
    uint64_t v26 = 1;
  }
  v34.origin.x = v21;
  v34.origin.y = v23;
  v34.size.height = v30;
  v34.size.width = v31;
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.height = a8;
  v35.size.width = a7;
  if (!CGRectEqualToRect(v34, v35))
  {
    objc_msgSend(v13, "setBounds:", a5, a6, a7, a8);
    uint64_t v26 = v26 | 2;
    if (*((unsigned char *)a2 + 56))
    {
      if (v21 != a5 || v23 != a6) {
        id v27 = LAUI_CA_utilities::add_additive_animation<CGPoint>(v13, @"bounds.origin", a2, v21, v23, a5, a6);
      }
      if (v31 != a7 || v30 != a8) {
        id v28 = LAUI_CA_utilities::add_additive_animation<CGSize>(v13, @"bounds.size", a2, v31, v30, a7, a8);
      }
    }
  }

  return v26;
}

id LAUI_CA_utilities::add_additive_animation<CGPoint>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a1;
  double v14 = a2;
  double v15 = LAUI_CA_utilities::spring_factory::create_animation(a3, v14);
  double v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", a4 - a6, a5 - a7);
  [(CAAnimation *)v15 setFromValue:v16];

  double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CAAnimation *)v15 setToValue:v17];

  double v18 = LAUILayerAddAdditiveAnimation(v13, v14, v15);

  return v18;
}

id LAUI_CA_utilities::add_additive_animation<CATransform3D>(void *a1, void *a2, LAUI_CA_utilities::spring_factory *a3, _OWORD *a4, _OWORD *a5)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  animation = LAUI_CA_utilities::spring_factory::create_animation(a3, v10);
  long long v12 = a4[5];
  v24[4] = a4[4];
  v24[5] = v12;
  long long v13 = a4[7];
  v24[6] = a4[6];
  v24[7] = v13;
  long long v14 = a4[1];
  v24[0] = *a4;
  v24[1] = v14;
  long long v15 = a4[3];
  v24[2] = a4[2];
  v24[3] = v15;
  long long v16 = a5[3];
  v23[2] = a5[2];
  v23[3] = v16;
  long long v17 = a5[1];
  v23[0] = *a5;
  v23[1] = v17;
  long long v18 = a5[7];
  v23[6] = a5[6];
  v23[7] = v18;
  long long v19 = a5[5];
  v23[4] = a5[4];
  v23[5] = v19;
  updated = (CAAnimation *)LAUI_CA_utilities::animation::update_animation<CASpringAnimation * {__strong}>(animation, v24, v23);
  double v21 = LAUILayerAddAdditiveAnimation(v9, v10, updated);

  return v21;
}

id LAUI_CA_utilities::animation::update_animation<CASpringAnimation * {__strong}>(void *a1, _OWORD *a2, _OWORD *a3)
{
  id v5 = a1;
  unint64_t v6 = (void *)MEMORY[0x263F08D40];
  long long v7 = a2[5];
  *(_OWORD *)&a.m31 = a2[4];
  *(_OWORD *)&a.m33 = v7;
  long long v8 = a2[7];
  *(_OWORD *)&a.m41 = a2[6];
  *(_OWORD *)&a.m43 = v8;
  long long v9 = a2[1];
  *(_OWORD *)&a.m11 = *a2;
  *(_OWORD *)&a.m13 = v9;
  long long v10 = a2[3];
  *(_OWORD *)&a.m21 = a2[2];
  *(_OWORD *)&a.m23 = v10;
  long long v11 = a3[7];
  *(_OWORD *)&b.m41 = a3[6];
  *(_OWORD *)&b.m43 = v11;
  long long v12 = a3[5];
  *(_OWORD *)&b.m31 = a3[4];
  *(_OWORD *)&b.m33 = v12;
  long long v13 = a3[3];
  *(_OWORD *)&b.m21 = a3[2];
  *(_OWORD *)&b.m23 = v13;
  long long v14 = a3[1];
  *(_OWORD *)&b.m11 = *a3;
  *(_OWORD *)&b.m13 = v14;
  BOOL v15 = CATransform3DEqualToTransform(&a, &b);
  long long v16 = (_OWORD *)MEMORY[0x263F15740];
  if (v15)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v42.m33 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v42.m43 = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v42.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v42.m13 = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v42.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v42.m23 = v20;
  }
  else
  {
    long long v21 = a3[5];
    *(_OWORD *)&v38.m31 = a3[4];
    *(_OWORD *)&v38.m33 = v21;
    long long v22 = a3[7];
    *(_OWORD *)&v38.m41 = a3[6];
    *(_OWORD *)&v38.m43 = v22;
    long long v23 = a3[1];
    *(_OWORD *)&v38.m11 = *a3;
    *(_OWORD *)&v38.m13 = v23;
    long long v24 = a3[3];
    *(_OWORD *)&v38.m21 = a3[2];
    *(_OWORD *)&v38.m23 = v24;
    CATransform3DInvert(&v39, &v38);
    long long v25 = a2[5];
    *(_OWORD *)&v37.m31 = a2[4];
    *(_OWORD *)&v37.m33 = v25;
    long long v26 = a2[7];
    *(_OWORD *)&v37.m41 = a2[6];
    *(_OWORD *)&v37.m43 = v26;
    long long v27 = a2[1];
    *(_OWORD *)&v37.m11 = *a2;
    *(_OWORD *)&v37.m13 = v27;
    long long v28 = a2[3];
    *(_OWORD *)&v37.m21 = a2[2];
    *(_OWORD *)&v37.m23 = v28;
    CATransform3DConcat(&v42, &v39, &v37);
  }
  CATransform3D v29 = [v6 valueWithCATransform3D:&v42];
  [v5 setFromValue:v29];

  long long v30 = v16[5];
  v36[4] = v16[4];
  v36[5] = v30;
  long long v31 = v16[7];
  v36[6] = v16[6];
  v36[7] = v31;
  long long v32 = v16[1];
  v36[0] = *v16;
  v36[1] = v32;
  long long v33 = v16[3];
  v36[2] = v16[2];
  v36[3] = v33;
  CGRect v34 = [MEMORY[0x263F08D40] valueWithCATransform3D:v36];
  [v5 setToValue:v34];

  return v5;
}

void std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_21446F080(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  CFDataRef v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__split_buffer<UIView * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,UIView * {__strong}*,UIView * {__strong}*,UIView * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      unint64_t v6 = *v4;
      *v4++ = 0;
      long long v7 = *a3;
      *a3++ = v6;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void ___ZZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__ENK3__2cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
}

__n128 __copy_helper_block_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  __int16 v5 = *(_WORD *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 104) = 0;
  if (*(unsigned char *)(a2 + 104))
  {
    long long v6 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v6;
    *(void *)(a1 + 80) = *(id *)(a2 + 80);
    __n128 result = *(__n128 *)(a2 + 88);
    *(__n128 *)(a1 + 88) = result;
    *(unsigned char *)(a1 + 104) = 1;
  }
  return result;
}

void __destroy_helper_block_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104)) {

  }
  objc_destroyWeak((id *)(a1 + 32));
}

void std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  CFDataRef v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    __int16 v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        long long v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      __int16 v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t *std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  long long v7 = a1 + 1;
  long long v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        long long v6 = *v9;
        long long v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      long long v6 = v9[1];
      if (!v6)
      {
        long long v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    long long v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  __int16 v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
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
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), __int16 v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            CALayer *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), __int16 v5 = v4 + 3, v6))
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

void std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

void sub_21446F9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21446FA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unint64_t v10 = v9;

  a9.super_class = (Class)LAUIHorizontalArrowView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21446FB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::detach_animation(id *this)
{
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)this);
  if (this[1])
  {
    id WeakRetained = objc_loadWeakRetained(this + 2);
    [WeakRetained removeAnimationForKey:this[1]];

    objc_storeWeak(this + 2, 0);
    id v3 = this[1];
    this[1] = 0;
  }
}

void sub_214470678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a22) {
  _Unwind_Resume(a1);
  }
}

void sub_2144709EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214470C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)&a9);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214470CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3(uint64_t a1)
{
}

void sub_214470F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v14 = v13;

  _Unwind_Resume(a1);
}

void sub_214471358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::attach_animation(id *this, CALayer *a2, CAAnimation *a3, NSString *a4)
{
  obj = a2;
  uint64_t v7 = a3;
  int v8 = a4;
  LAUI_CA_utilities::periodic_animation_state::detach_animation(this);
  if (v7 && v8)
  {
    objc_storeWeak(this + 2, obj);
    uint64_t v9 = [(NSString *)v8 copy];
    id v10 = this[1];
    this[1] = (id)v9;

    [(CALayer *)obj addAnimation:v7 forKey:v8];
  }
}

void sub_214471588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214471838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::periodic_animation_state::clear_removal_timer(LAUI_CA_utilities::periodic_animation_state *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    dispatch_source_cancel(v2);
    id v3 = (void *)*((void *)this + 3);
    *((void *)this + 3) = 0;
  }
}

id LAUILayerAddAdditiveAnimation(CALayer *a1, NSString *a2, CAAnimation *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  __int16 v5 = a1;
  int v6 = a2;
  uint64_t v7 = a3;
  int v8 = v7;
  uint64_t v9 = 0;
  if (v5 && v7) {
    id v10 = {;
  }
    uint64_t v11 = [v10 unsignedIntegerValue];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [(CALayer *)v5 animationKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v21 + 1) + 8 * v15) hasPrefix:@"com.apple.laui.additive"]) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v11 = 0;
    }

    v18 = long long v16 = NSString;
    uint64_t v9 = [v16 stringWithFormat:@"%@.%lu", v18, v11];

    long long v19 = [NSNumber numberWithUnsignedInteger:v11 + 1];

    [(CALayer *)v5 addAnimation:v8 forKey:v9];
  }

  return v9;
}

void sub_214472100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *anonymous namespace'::prefix_for_key_path(_anonymous_namespace_ *this, NSString *a2)
{
  uint64_t v2 = this;
  id v3 = @"com.apple.laui.additive";
  if ([(_anonymous_namespace_ *)v2 length])
  {
    id v3 = [NSString stringWithFormat:@"%@.%@", @"com.apple.laui.additive", v2];
  }

  return v3;
}

void sub_2144721E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LAUILayerRemoveAdditiveAnimations(CALayer *a1, NSString *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  int v6 = v4;
  if (v3) {
    uint64_t v7 = {;
  }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = [(CALayer *)v3 animationKeys];
    uint64_t v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v13 hasPrefix:v7]) {
            [(CALayer *)v3 removeAnimationForKey:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void sub_21447234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double LAUILayerAnimationElapsedDuration(CALayer *a1, CAAnimation *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  __int16 v5 = v4;
  double v6 = 0.0;
  if (v3 && v4)
  {
    [(CALayer *)v3 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v8 = v7;
    [(CAAnimation *)v5 beginTime];
    double v6 = v8 - v9;
  }

  return v6;
}

void sub_214472410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double LAUILayerAnimationRemainingDuration(CALayer *a1, CAAnimation *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  __int16 v5 = v4;
  double v6 = 0.0;
  if (v3 && v4)
  {
    [(CAAnimation *)v4 repeatCount];
    float v8 = v7;
    [(CAAnimation *)v5 duration];
    double v10 = v9;
    long double v11 = LAUILayerAnimationElapsedDuration(v3, v5);
    if ([(CAAnimation *)v5 autoreverses]) {
      double v10 = v10 + v10;
    }
    if (v8 > 0.0)
    {
      if (v8 >= 3.4028e38) {
        long double v11 = fmod(v11, v10);
      }
      else {
        double v10 = (v8 + 1.0) * v10;
      }
    }
    double v12 = v10 - v11;
    if (v10 - v11 < 0.0) {
      double v12 = 0.0;
    }
    if (*(uint64_t *)&v12 > -1 && ((*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
      || (unint64_t)(*(void *)&v12 - 1) < 0xFFFFFFFFFFFFFLL
      || (*(void *)&v12 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    {
      double v6 = v12;
    }
    else
    {
      double v6 = 0.0;
    }
  }

  return v6;
}

void sub_214472540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double LAUILayerAnimationElapsedDuration(CALayer *a1, NSString *a2)
{
  id v3 = a1;
  uint64_t v4 = [(CALayer *)v3 animationForKey:a2];
  double v5 = LAUILayerAnimationElapsedDuration(v3, v4);

  return v5;
}

void sub_2144725C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double LAUILayerAnimationRemainingDuration(CALayer *a1, NSString *a2)
{
  id v3 = a1;
  uint64_t v4 = [(CALayer *)v3 animationForKey:a2];
  double v5 = LAUILayerAnimationRemainingDuration(v3, v4);

  return v5;
}

void sub_214472640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *LAUI_CA_utilities::spring_factory::create_animation(LAUI_CA_utilities::spring_factory *this, NSString *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F15890] animationWithKeyPath:v3];
  [v4 setAdditive:1];
  [v4 setMass:*(double *)this];
  [v4 setStiffness:*((double *)this + 1)];
  [v4 setDamping:*((double *)this + 2)];
  [v4 setVelocity:*((double *)this + 3)];
  [v4 setTimingFunction:*((void *)this + 4)];
  [v4 setBeginTimeMode:*MEMORY[0x263F15980]];
  if (*((unsigned char *)this + 40))
  {
    double v5 = *((double *)this + 6);
  }
  else
  {
    *((unsigned char *)this + 40) = 1;
    [v4 durationForEpsilon:0.001];
    *((double *)this + 6) = v5;
  }
  [v4 setDuration:v5];

  return v4;
}

void sub_2144727BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)LAUIAnimationDelegate;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_214472864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144728F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214472998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214472A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214472B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214472C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214472D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *CASecureFlipBookLayerBaseNameFromLAUISecureFaceIDViewType(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = [MEMORY[0x263F52548] sharedInstance];
    int v3 = [v2 isDynamicIslandAvailable];
    uint64_t v4 = @"FaceID-40";
    double v5 = @"faceid-spinner-111";
    goto LABEL_5;
  }
  int v1 = a1;
  if (!a1)
  {
    uint64_t v2 = [MEMORY[0x263F52548] sharedInstance];
    int v3 = [v2 isDynamicIslandAvailable];
    uint64_t v4 = @"FaceID-70";
    double v5 = @"FaceID-69";
LABEL_5:
    if (v3) {
      uint64_t v4 = v5;
    }
    double v6 = v4;

    goto LABEL_11;
  }
  float v7 = LACLogFaceIDUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    CASecureFlipBookLayerBaseNameFromLAUISecureFaceIDViewType_cold_1(v1, v7);
  }

  double v6 = 0;
LABEL_11:
  return v6;
}

__CFString *NSStringFromLAUISecureFaceIDViewType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"Small";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid LAUISecureFaceIDViewType: %d", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"Default";
  }
  return v2;
}

uint64_t LAUIIsSecureFaceIDUISupported()
{
  CFDataRef v0 = [MEMORY[0x263F52498] sharedInstance];
  uint64_t v1 = [v0 isSupported];

  return v1;
}

uint64_t LAUIIsSecureFaceIDUIEnabled()
{
  CFDataRef v0 = [MEMORY[0x263F52498] sharedInstance];
  uint64_t v1 = [v0 isEnabled];

  return v1;
}

uint64_t LAUIIsSecureFaceIDAvailableAndEnabled()
{
  uint64_t result = LAUIIsSecureFaceIDUISupported();
  if (result)
  {
    return LAUIIsSecureFaceIDUIEnabled();
  }
  return result;
}

id NSStringFromLAUISecureFaceIDViewState(uint64_t a1)
{
  uint64_t v2 = +[LAUISecureFaceIDView _transitionDictForFullFlow];
  int v3 = [NSNumber numberWithInteger:a1];
  uint64_t v4 = [v2 objectForKey:v3];

  return v4;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_214475130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGColorSpaceRef anonymous namespace'::create_default_color_space(_anonymous_namespace_ *this, MTLPixelFormat a2)
{
  uint64_t v2 = (CFStringRef *)MEMORY[0x263F002C8];
  if ((uint64_t)this <= 114)
  {
    if (this == (_anonymous_namespace_ *)80) {
      goto LABEL_9;
    }
    if (this != (_anonymous_namespace_ *)81) {
      return 0;
    }
    goto LABEL_8;
  }
  if (this != (_anonymous_namespace_ *)115 && this != (_anonymous_namespace_ *)552)
  {
    if (this != (_anonymous_namespace_ *)553) {
      return 0;
    }
LABEL_8:
    uint64_t v2 = (CFStringRef *)MEMORY[0x263F002D8];
  }
LABEL_9:
  if (*v2) {
    return CGColorSpaceCreateWithName(*v2);
  }
  return 0;
}

void sub_2144751FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LAUIMetalRenderLoop;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_214475424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144757A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447581C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144758A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214475944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214475AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214475B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)LAUIRenderLoop;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_214475CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214475E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214475FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214476168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214476220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144762F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getLAErrorHelperClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFDataRef v0 = (void *)getLAErrorHelperClass_softClass;
  uint64_t v7 = getLAErrorHelperClass_softClass;
  if (!getLAErrorHelperClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getLAErrorHelperClass_block_invoke;
    v3[3] = &unk_26420CA80;
    v3[4] = &v4;
    __getLAErrorHelperClass_block_invoke((uint64_t)v3);
    CFDataRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_214476898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214476B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id LA_LOG_LAUIAuthenticationCore()
{
  if (LA_LOG_LAUIAuthenticationCore_once != -1) {
    dispatch_once(&LA_LOG_LAUIAuthenticationCore_once, &__block_literal_global_162);
  }
  CFDataRef v0 = (void *)LA_LOG_LAUIAuthenticationCore_log;
  return v0;
}

void sub_2144772A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2144778EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2144779DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_214477B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_214478174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getLAErrorHelperClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SharedUtilsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SharedUtilsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26420CAA0;
    uint64_t v6 = 0;
    SharedUtilsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SharedUtilsLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LAErrorHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLAErrorHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAErrorHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SharedUtilsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharedUtilsLibraryCore_frameworkLibrary = result;
  return result;
}

double LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t::transform(float32x4_t *this)
{
  *(double *)v2.i64 = simd_matrix4x4(this[3]);
  uint64_t v6 = 0;
  *(void *)&long long v7 = 0;
  LODWORD(v8) = 0;
  HIDWORD(v8) = 0;
  *(void *)((char *)&v8 + 4) = HIDWORD(this[4].i64[0]);
  *((void *)&v7 + 1) = this[4].i64[1];
  long long v51 = *(_OWORD *)&this[4];
  long long v52 = v8;
  long long v53 = v7;
  long long v54 = xmmword_214498B80;
  do
  {
    *(long long *)((char *)&v55 + v6) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v2, COERCE_FLOAT(*(long long *)((char *)&v51 + v6))), v3, *(float32x2_t *)((char *)&v51 + v6), 1), v4, *(float32x4_t *)((char *)&v51 + v6), 2), v5, *(float32x4_t *)((char *)&v51 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  float32x4_t v9 = this[1];
  int8x16_t v10 = (int8x16_t)vmulq_f32(v9, (float32x4_t)xmmword_214498B80);
  if (vaddv_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))) == 1.0)
  {
    uint64_t v24 = 0;
    float32x4_t v25 = *this;
    v25.i32[3] = 1.0;
    long long v51 = v55;
    long long v52 = v56;
    long long v53 = v57;
    long long v54 = v58;
    do
    {
      *(long long *)((char *)&v55 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_214498B90, COERCE_FLOAT(*(long long *)((char *)&v51 + v24))), (float32x4_t)xmmword_214498BA0, *(float32x2_t *)((char *)&v51 + v24), 1), (float32x4_t)xmmword_214498BB0, *(float32x4_t *)((char *)&v51 + v24), 2), v25, *(float32x4_t *)((char *)&v51 + v24), 3);
      v24 += 16;
    }
    while (v24 != 64);
  }
  else
  {
    long long v47 = v55;
    long long v48 = v56;
    long long v49 = v57;
    long long v50 = v58;
    float32x4_t v11 = this[2];
    uint32x4_t v12 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v11));
    v12.i32[3] = v12.i32[2];
    float32x4_t v13 = *this;
    if ((vmaxvq_u32(v12) & 0x80000000) != 0)
    {
      float32x4_t v46 = this[2];
      float32x4_t v26 = vsubq_f32(v13, v11);
      v26.i32[3] = 1.0;
      float32x4_t v44 = v26;
      *(double *)&long long v27 = simd_matrix4x4(v9);
      uint64_t v28 = 0;
      long long v51 = v27;
      long long v52 = v29;
      long long v53 = v30;
      long long v54 = v31;
      do
      {
        *(long long *)((char *)&v55 + v28) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_214498B90, COERCE_FLOAT(*(long long *)((char *)&v51 + v28))), (float32x4_t)xmmword_214498BA0, *(float32x2_t *)((char *)&v51 + v28), 1), (float32x4_t)xmmword_214498BB0, *(float32x4_t *)((char *)&v51 + v28), 2), v44, *(float32x4_t *)((char *)&v51 + v28), 3);
        v28 += 16;
      }
      while (v28 != 64);
      uint64_t v32 = 0;
      float32x4_t v33 = (float32x4_t)v55;
      float32x4_t v34 = (float32x4_t)v56;
      float32x4_t v35 = (float32x4_t)v57;
      float32x4_t v36 = (float32x4_t)v58;
      long long v37 = (__int128)v46;
      HIDWORD(v37) = 1.0;
      long long v51 = xmmword_214498B90;
      long long v52 = xmmword_214498BA0;
      long long v53 = xmmword_214498BB0;
      long long v54 = v37;
      do
      {
        *(long long *)((char *)&v55 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(long long *)((char *)&v51 + v32))), v34, *(float32x2_t *)((char *)&v51 + v32), 1), v35, *(float32x4_t *)((char *)&v51 + v32), 2), v36, *(float32x4_t *)((char *)&v51 + v32), 3);
        v32 += 16;
      }
      while (v32 != 64);
      uint64_t v38 = 0;
      float32x4_t v39 = (float32x4_t)v55;
      float32x4_t v40 = (float32x4_t)v56;
      float32x4_t v41 = (float32x4_t)v57;
      float32x4_t v42 = (float32x4_t)v58;
      long long v51 = v47;
      long long v52 = v48;
      long long v53 = v49;
      long long v54 = v50;
      do
      {
        *(long long *)((char *)&v55 + v38) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(long long *)((char *)&v51 + v38))), v40, *(float32x2_t *)((char *)&v51 + v38), 1), v41, *(float32x4_t *)((char *)&v51 + v38), 2), v42, *(float32x4_t *)((char *)&v51 + v38), 3);
        v38 += 16;
      }
      while (v38 != 64);
    }
    else
    {
      v13.i32[3] = 1.0;
      float32x4_t v45 = v13;
      *(double *)&long long v14 = simd_matrix4x4(v9);
      uint64_t v15 = 0;
      long long v51 = v14;
      long long v52 = v16;
      long long v53 = v17;
      long long v54 = v18;
      do
      {
        *(long long *)((char *)&v55 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_214498B90, COERCE_FLOAT(*(long long *)((char *)&v51 + v15))), (float32x4_t)xmmword_214498BA0, *(float32x2_t *)((char *)&v51 + v15), 1), (float32x4_t)xmmword_214498BB0, *(float32x4_t *)((char *)&v51 + v15), 2), v45, *(float32x4_t *)((char *)&v51 + v15), 3);
        v15 += 16;
      }
      while (v15 != 64);
      uint64_t v19 = 0;
      float32x4_t v20 = (float32x4_t)v55;
      float32x4_t v21 = (float32x4_t)v56;
      float32x4_t v22 = (float32x4_t)v57;
      float32x4_t v23 = (float32x4_t)v58;
      long long v51 = v47;
      long long v52 = v48;
      long long v53 = v49;
      long long v54 = v50;
      do
      {
        *(long long *)((char *)&v55 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(*(long long *)((char *)&v51 + v19))), v21, *(float32x2_t *)((char *)&v51 + v19), 1), v22, *(float32x4_t *)((char *)&v51 + v19), 2), v23, *(float32x4_t *)((char *)&v51 + v19), 3);
        v19 += 16;
      }
      while (v19 != 64);
    }
  }
  return *(double *)&v55;
}

double simd_matrix4x4(float32x4_t a1)
{
  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  float v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(void *a1@<X0>, LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *a2@<X8>)
{
  id v3 = a1;
  id v4 = v3;
  if (v3 && ([v3 supportsFamily:1003] & 1) != 0)
  {
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::locuint64_t k = 0;
    }
    char v98 = 1;
    id v5 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((uint64_t)&v97, v4);
    uint64_t v6 = (void *)MEMORY[0x2166A1B20](v5);
    os_unfair_lock_lock((os_unfair_lock_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::lock);
    id WeakRetained = objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device);

    if (WeakRetained != v4)
    {
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device, v4);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::depth_stencil_state, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline, 0);
      id location = 0;
      std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100]((uint64_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines, &location);
      objc_destroyWeak(&location);
      id v95 = 0;
      std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100]((uint64_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines, &v95);
      objc_destroyWeak(&v95);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline, 0);
      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline, 0);
    }
    long long v8 = (MTLDepthStencilState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::depth_stencil_state);
    depth_stencil_state = v97._depth_stencil_state;
    v97._depth_stencil_state = v8;

    float v10 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline);
    tesselation_factor_pipeline = v97._tesselation_factor_pipeline;
    v97._tesselation_factor_pipeline = v10;

    uint32x4_t v12 = (MTLRenderPipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline);
    tube_pipeline = v97._tube_pipeline;
    v97._tube_pipeline = v12;

    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v15 = (MTLRenderPipelineState *)objc_loadWeakRetained((id *)((char *)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines
                                                                 + i * 8));
      long long v16 = v97._begin_cap_pipelines.__elems_[i];
      v97._begin_cap_pipelines.__elems_[i] = v15;
    }
    for (uint64_t j = 0; j != 3; ++j)
    {
      long long v18 = (MTLRenderPipelineState *)objc_loadWeakRetained((id *)((char *)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines
                                                                 + j * 8));
      uint64_t v19 = v97._end_cap_pipelines.__elems_[j];
      v97._end_cap_pipelines.__elems_[j] = v18;
    }
    float32x4_t v20 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline);
    horizontal_blur_pipeline = v97._horizontal_blur_pipeline;
    v97._horizontal_blur_pipeline = v20;

    float32x4_t v22 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline);
    vertical_blur_pipeline = v97._vertical_blur_pipeline;
    v97._vertical_blur_pipeline = v22;

    uint64_t v24 = (MTLComputePipelineState *)objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline);
    accumulator_pipeline = v97._accumulator_pipeline;
    v97._accumulator_pipeline = v24;

    char v94 = 0;
    v92 = 0;
    id v93 = 0;
    v91 = 0;
    v89[0] = &v94;
    v89[1] = &v98;
    v89[2] = &v93;
    v89[3] = &v92;
    v89[4] = &v91;
    id v90 = v4;
    id v88 = 0;
    v86 = &v88;
    id v26 = v90;
    id v87 = v26;
    if (!v97._tube_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      long long v27 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      uint64_t v28 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_main"];
      [v27 setVertexFunction:v28];

      long long v29 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v27 error:0];
      long long v30 = v97._tube_pipeline;
      v97._tube_pipeline = v29;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tube_pipeline, v29);
    }
    if (!v97._begin_cap_pipelines.__elems_[0]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      long long v31 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      uint64_t v32 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_begin_0"];
      [v31 setVertexFunction:v32];

      float32x4_t v33 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v31 error:0];
      float32x4_t v34 = v97._begin_cap_pipelines.__elems_[0];
      v97._begin_cap_pipelines.__elems_[0] = v33;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::begin_cap_pipelines, v33);
    }
    if (!v97._begin_cap_pipelines.__elems_[1]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      float32x4_t v35 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      float32x4_t v36 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_begin_1"];
      [v35 setVertexFunction:v36];

      long long v37 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v35 error:0];
      uint64_t v38 = v97._begin_cap_pipelines.__elems_[1];
      v97._begin_cap_pipelines.__elems_[1] = v37;

      objc_storeWeak(&qword_26780B910, v37);
    }
    if (!v97._begin_cap_pipelines.__elems_[2]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      float32x4_t v39 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      float32x4_t v40 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_begin_2"];
      [v39 setVertexFunction:v40];

      float32x4_t v41 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v39 error:0];
      float32x4_t v42 = v97._begin_cap_pipelines.__elems_[2];
      v97._begin_cap_pipelines.__elems_[2] = v41;

      objc_storeWeak(&qword_26780B918, v41);
    }
    if (!v97._end_cap_pipelines.__elems_[0]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      v43 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      float32x4_t v44 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_end_0"];
      [v43 setVertexFunction:v44];

      float32x4_t v45 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v43 error:0];
      float32x4_t v46 = v97._end_cap_pipelines.__elems_[0];
      v97._end_cap_pipelines.__elems_[0] = v45;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::end_cap_pipelines, v45);
    }
    if (!v97._end_cap_pipelines.__elems_[1]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      long long v47 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      long long v48 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_end_1"];
      [v47 setVertexFunction:v48];

      long long v49 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v47 error:0];
      long long v50 = v97._end_cap_pipelines.__elems_[1];
      v97._end_cap_pipelines.__elems_[1] = v49;

      objc_storeWeak(&qword_26780B928, v49);
    }
    if (!v97._end_cap_pipelines.__elems_[2]
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      long long v51 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(&v86, v92, v91);
      long long v52 = (void *)[v92 newFunctionWithName:@"tessellation_vertex_end_2"];
      [v51 setVertexFunction:v52];

      long long v53 = (MTLRenderPipelineState *)[v26 newRenderPipelineStateWithDescriptor:v51 error:0];
      long long v54 = v97._end_cap_pipelines.__elems_[2];
      v97._end_cap_pipelines.__elems_[2] = v53;

      objc_storeWeak(&qword_26780B930, v53);
    }
    if (v97._tesselation_factor_pipeline
      || !LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      id v58 = 0;
    }
    else
    {
      long long v55 = v92;
      long long v56 = v91;
      if (v55)
      {
        id v57 = objc_alloc_init(MEMORY[0x263F12850]);
        long long v55 = v57;
        if (v56) {
          [v57 setPipelineLibrary:v56];
        }
      }
      id v58 = v55;

      v59 = (void *)[v92 newFunctionWithName:@"tessellation_kernel_main"];
      [v58 setComputeFunction:v59];

      v60 = (MTLComputePipelineState *)[v26 newComputePipelineStateWithDescriptor:v58 options:0 reflection:0 error:0];
      v61 = v97._tesselation_factor_pipeline;
      v97._tesselation_factor_pipeline = v60;
      v62 = v60;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::tesselation_factor_pipeline, v62);
    }
    if (!v97._horizontal_blur_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      v63 = v92;
      v64 = v91;
      if (!v58)
      {
        if (v63)
        {
          id v65 = objc_alloc_init(MEMORY[0x263F12850]);
          id v58 = v65;
          if (v64) {
            [v65 setPipelineLibrary:v64];
          }
        }
      }
      id v58 = v58;

      v66 = (void *)[v92 newFunctionWithName:@"linear_horizontal_blur"];
      [v58 setComputeFunction:v66];

      v67 = (MTLComputePipelineState *)[v26 newComputePipelineStateWithDescriptor:v58 options:0 reflection:0 error:0];
      v68 = v97._horizontal_blur_pipeline;
      v97._horizontal_blur_pipeline = v67;
      v69 = v67;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::horizontal_blur_pipeline, v69);
    }
    if (!v97._vertical_blur_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      v70 = v92;
      v71 = v91;
      if (!v58)
      {
        if (v70)
        {
          id v72 = objc_alloc_init(MEMORY[0x263F12850]);
          id v58 = v72;
          if (v71) {
            [v72 setPipelineLibrary:v71];
          }
        }
      }
      id v58 = v58;

      v73 = (void *)[v92 newFunctionWithName:@"linear_vertical_blur"];
      [v58 setComputeFunction:v73];

      v74 = (MTLComputePipelineState *)[v26 newComputePipelineStateWithDescriptor:v58 options:0 reflection:0 error:0];
      v75 = v97._vertical_blur_pipeline;
      v97._vertical_blur_pipeline = v74;
      v76 = v74;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::vertical_blur_pipeline, v76);
    }
    if (!v97._accumulator_pipeline
      && LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v89))
    {
      v77 = v92;
      v78 = v91;
      if (!v58)
      {
        if (v77)
        {
          id v79 = objc_alloc_init(MEMORY[0x263F12850]);
          id v58 = v79;
          if (v78) {
            [v79 setPipelineLibrary:v78];
          }
        }
      }
      id v58 = v58;

      v80 = (void *)[v92 newFunctionWithName:@"composite_blurred_accumulate"];
      [v58 setComputeFunction:v80];

      v81 = (MTLComputePipelineState *)[v26 newComputePipelineStateWithDescriptor:v58 options:0 reflection:0 error:0];
      v82 = v97._accumulator_pipeline;
      v97._accumulator_pipeline = v81;
      v83 = v81;

      objc_storeWeak(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::accumulator_pipeline, v83);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::lock);
    char v84 = v98;
    if (v98)
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(a2, &v97);
      char v84 = 1;
    }
    else
    {
      *(unsigned char *)a2 = 0;
    }
    *((unsigned char *)a2 + 104) = v84;

    for (uint64_t k = 72; k != 48; k -= 8)
    do
    {

      k -= 8;
    }
    while (k != 24);
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *((unsigned char *)a2 + 104) = 0;
  }
}

void sub_214479498(void *a1)
{
  __clang_call_terminate(a1);
}

void std::array<objc_object  {objcproto22MTLRenderPipelineState}* {__weak},3ul>::fill[abi:ne180100](uint64_t a1, id *location)
{
  for (uint64_t i = 0; i != 24; i += 8)
  {
    id WeakRetained = objc_loadWeakRetained(location);
    objc_storeWeak((id *)(a1 + i), WeakRetained);
  }
}

BOOL LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(uint64_t a1)
{
  if (**(unsigned char **)a1) {
    return **(unsigned char **)(a1 + 8) != 0;
  }
  **(unsigned char **)a1 = 1;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = *(void ***)(a1 + 16);
  uint64_t v6 = *v5;
  uint64_t *v5 = (void *)v4;

  uint64_t v7 = **(void **)(a1 + 16);
  if (v7)
  {
    long long v8 = *(void **)(a1 + 40);
    id v20 = 0;
    uint64_t v9 = [v8 newDefaultLibraryWithBundle:v7 error:&v20];
    id v10 = v20;
    double v11 = *(void ***)(a1 + 24);
    uint32x4_t v12 = *v11;
    void *v11 = (void *)v9;

    if (**(void **)(a1 + 24))
    {

      float32x4_t v13 = [**(id **)(a1 + 16) pathForResource:@"LAUICubicBSplineRenderer" ofType:@"pipelinelib"];
      if (v13)
      {
        id WeakRetained = objc_loadWeakRetained(&LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::device);
        id v19 = 0;
        long long v14 = (void *)[WeakRetained newPipelineLibraryWithFilePath:v13 error:&v19];
        id v15 = v19;
      }
      else
      {
        id v15 = 0;
        long long v14 = 0;
      }
      objc_storeStrong(*(id **)(a1 + 32), v14);
      if (v13)
      {

        if (**(void **)(a1 + 32))
        {
LABEL_21:

          return **(unsigned char **)(a1 + 8) != 0;
        }
        long long v18 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v15, v18);
        }
      }
      else
      {
        long long v18 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v18);
        }
      }

      goto LABEL_21;
    }
    long long v17 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()((uint64_t)v10, v17);
    }

    **(unsigned char **)(a1 + 8) = 0;
    return 0;
  }
  else
  {
    long long v16 = os_log_create("com.apple.LocalAuthentication", "LAUICubicBSplineRenderer");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v16);
    }

    BOOL result = 0;
    **(unsigned char **)(a1 + 8) = 0;
  }
  return result;
}

void sub_214479788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_2::operator()(void ***a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = **a1;
  if (v5 && !v7)
  {
    if ([a1[1] supportsTextureSampleCount:4]) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 1;
    }
    id v9 = objc_alloc_init(MEMORY[0x263F12A80]);
    float32x4_t v21 = [v9 attributes];
    id v10 = [v21 objectAtIndexedSubscript:0];
    [v10 setFormat:30];
    [v10 setOffset:0];
    [v10 setBufferIndex:0];
    double v11 = [v9 layouts];
    uint32x4_t v12 = [v11 objectAtIndexedSubscript:0];

    [v12 setStride:16];
    [v12 setStepRate:1];
    [v12 setStepFunction:4];
    id v13 = objc_alloc_init(MEMORY[0x263F129C0]);
    long long v14 = v13;
    if (v6) {
      [v13 setPipelineLibrary:v6];
    }
    id v15 = (void *)[v5 newFunctionWithName:@"tessellation_fragment_main"];
    [v14 setFragmentFunction:v15];

    [v14 setVertexDescriptor:v9];
    [v14 setRasterSampleCount:v8];
    [v14 setMaxTessellationFactor:16];
    [v14 setTessellationFactorScaleEnabled:0];
    [v14 setTessellationFactorFormat:0];
    [v14 setTessellationControlPointIndexType:1];
    [v14 setTessellationFactorStepFunction:0];
    [v14 setTessellationOutputWindingOrder:0];
    [v14 setTessellationPartitionMode:3];
    long long v16 = [v14 colorAttachments];
    long long v17 = [v16 objectAtIndexedSubscript:0];
    [v17 setPixelFormat:80];

    [v14 setDepthAttachmentPixelFormat:0];
    long long v18 = **a1;
    **a1 = v14;

    uint64_t v7 = **a1;
  }
  id v19 = v7;

  return v19;
}

void sub_2144799E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *LAUI_uniform_cubic_b_spline_renderer::renderer_t::renderer_t(uint64_t a1, void *a2, const shared_state_t *a3, uint64_t a4)
{
  id v7 = a2;
  *(unsigned char *)(a1 + 8) = 0;
  id v8 = v7;
  *(void *)(a1 + 16) = v8;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)(a1 + 24), a3);
  *(unsigned char *)(a1 + 128) = 0;
  id v9 = (long long *)MEMORY[0x263EF8990];
  long long v11 = *(_OWORD *)(MEMORY[0x263EF8990] + 64);
  long long v10 = *(_OWORD *)(MEMORY[0x263EF8990] + 80);
  long long v12 = *(_OWORD *)(MEMORY[0x263EF8990] + 48);
  *(_OWORD *)(a1 + 208) = v11;
  *(_OWORD *)(a1 + 224) = v10;
  long long v14 = v9[6];
  long long v13 = v9[7];
  long long v15 = v9[5];
  *(_OWORD *)(a1 + 240) = v14;
  *(_OWORD *)(a1 + 256) = v13;
  *(_OWORD *)(a1 + 368) = v14;
  *(_OWORD *)(a1 + 384) = v13;
  *(_OWORD *)(a1 + 336) = v11;
  *(_OWORD *)(a1 + 352) = v10;
  long long v16 = v9[2];
  long long v17 = v9[3];
  long long v19 = *v9;
  long long v18 = v9[1];
  *(_OWORD *)(a1 + 176) = v16;
  *(_OWORD *)(a1 + 192) = v17;
  *(_OWORD *)(a1 + 304) = v16;
  *(_OWORD *)(a1 + 320) = v17;
  long long v20 = v9[1];
  long long v21 = v9[2];
  long long v22 = *v9;
  *(_OWORD *)(a1 + 144) = v19;
  *(_OWORD *)(a1 + 160) = v20;
  *(_OWORD *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 288) = v20;
  *(_OWORD *)(a1 + 400) = v22;
  *(_OWORD *)(a1 + 416) = v18;
  long long v23 = v9[7];
  *(_OWORD *)(a1 + 496) = v14;
  *(_OWORD *)(a1 + 512) = v23;
  *(_OWORD *)(a1 + 464) = v11;
  *(_OWORD *)(a1 + 480) = v15;
  *(_OWORD *)(a1 + 432) = v21;
  *(_OWORD *)(a1 + 448) = v12;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 528) = 0u;
  BOOL result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  *((unsigned char *)result + 24) = 0;
  *BOOL result = &unk_26C52EE20;
  *(void *)(a1 + 576) = result + 3;
  *(void *)(a1 + 584) = result;
  *(unsigned char *)(a1 + 592) = 0;
  *(_OWORD *)(a1 + 600) = 0u;
  *(_OWORD *)(a1 + 616) = 0u;
  *(_OWORD *)(a1 + 625) = 0u;
  *(void *)(a1 + 648) = 0;
  *(void *)(a1 + 664) = 0;
  *(void *)(a1 + 656) = 0;
  *(unsigned char *)(a1 + 672) = 0;
  *(void *)(a1 + 712) = 0;
  *(_OWORD *)(a1 + 680) = 0u;
  *(_OWORD *)(a1 + 696) = 0u;
  *(void *)(a1 + 848) = 0;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_OWORD *)(a1 + 800) = 0u;
  *(_OWORD *)(a1 + 752) = 0u;
  *(_OWORD *)(a1 + 768) = 0u;
  *(_OWORD *)(a1 + 736) = 0u;
  if (v8)
  {
    id v25 = *(id *)(a1 + 24);
    uint64_t v26 = [v25 newCommandQueue];
    long long v27 = *(void **)(a1 + 528);
    *(void *)(a1 + 528) = v26;

    int v28 = *(_DWORD *)(a4 + 8);
    *(void *)(a1 + 720) = *(void *)a4;
    *(_DWORD *)(a1 + 728) = v28;
    *(_DWORD *)(a1 + 732) = *(_DWORD *)(a4 + 12);
    [*(id *)(a1 + 16) setFramebufferOnly:0];
    if ([*(id *)(a1 + 16) pixelFormat] != 80) {
      __assert_rtn("renderer_t", "LAUICubicBSplineRenderer.mm", 697, "[_render_loop pixelFormat] == pixel_format");
    }
    uint64_t v29 = 3;
    do
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      long long v30 = *(_OWORD **)(a1 + 560);
      if ((unint64_t)v30 >= *(void *)(a1 + 568))
      {
        uint64_t v31 = std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>((uint64_t *)(a1 + 552), &v32);
      }
      else
      {
        *((void *)&v32 + 1) = 0;
        *long long v30 = 0uLL;
        long long v33 = 0uLL;
        v30[1] = 0uLL;
        long long v34 = 0uLL;
        uint64_t v31 = (uint64_t)(v30 + 3);
        v30[2] = 0uLL;
      }
      *(void *)(a1 + 560) = v31;

      --v29;
    }
    while (v29);

    return (void *)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

float LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 720) = *(void *)a2;
  *(_DWORD *)(a1 + 728) = v2;
  float result = *(float *)(a2 + 12);
  *(float *)(a1 + 732) = result;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(uint64_t a1, unint64_t *a2, long long **a3)
{
  if (*(unsigned char *)(a1 + 8)) {
    return -1;
  }
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 696) - *(void *)(a1 + 688)) >> 3);
  uint64_t v14 = v3;
  uint64_t v7 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::reserve_spline_control_points(a1, a2);
  *(void *)&long long v13 = v7;
  *((void *)&v13 + 1) = v8;
  id v9 = *(uint64_t **)(a1 + 696);
  if ((unint64_t)v9 >= *(void *)(a1 + 704))
  {
    uint64_t v11 = std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t const&,std::span<LAUI_uniform_cubic_b_spline_renderer_private::control_point,18446744073709551615ul> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&>((uint64_t *)(a1 + 688), &v14, (uint64_t *)a2, &v13, a3);
    uint64_t v3 = v14;
  }
  else
  {
    uint64_t *v9 = v3;
    unint64_t v10 = *a2;
    v9[1] = *a2;
    v9[2] = v7;
    v9[3] = v8;
    v9[4] = 0;
    v9[5] = 0;
    v9[6] = 0;
    if (v10) {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(v9, a3);
    }
    uint64_t v11 = (uint64_t)(v9 + 7);
  }
  *(void *)(a1 + 696) = v11;
  return v3;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::reserve_spline_control_points(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  id v5 = *(char **)(a1 + 744);
  uint64_t v6 = *(void *)(a1 + 736);
  long long v70 = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 736, v5, v4, (char *)&v70);
  uint64_t v7 = *(void *)(a1 + 736);
  unint64_t v8 = (*(void *)(a1 + 744) - v7) >> 4;
  id v9 = *(void **)(a1 + 688);
  unint64_t v10 = *(void **)(a1 + 696);
  if (v9 != v10)
  {
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = v9[1];
      unint64_t v13 = v8 - v11;
      if (v12 != -1) {
        unint64_t v13 = v9[1];
      }
      if (v13 != v9[3]) {
        break;
      }
      v9[2] = v7 + 16 * v11;
      v9[3] = v13;
      BOOL v14 = __CFADD__(v11, v12);
      v11 += v12;
      if (v14) {
        break;
      }
      v9 += 7;
      if (v9 == v10)
      {
        if (v11 <= v8) {
          goto LABEL_11;
        }
        break;
      }
    }
    __break(1u);
  }
  unint64_t v11 = 0;
LABEL_11:
  if (v4 != v8 - v11)
  {
    v67 = "control_point_count == (count - offset)";
    int v66 = 740;
    goto LABEL_88;
  }
  uint64_t v68 = v7;
  uint64_t v15 = *a2;
  if (*a2 <= 3) {
    uint64_t v15 = 3;
  }
  uint64_t v16 = v15 - 3;
  long long v17 = (void **)(a1 + 760);
  std::vector<unsigned short>::reserve((void **)(a1 + 760), ((uint64_t)(*(void *)(a1 + 768) - *(void *)(a1 + 760)) >> 1) + 4 * (v15 - 3));
  if (v16)
  {
    uint64_t v18 = 0;
    uint64_t v69 = (uint64_t)&v5[-v6] >> 4;
    long long v19 = (char **)(a1 + 776);
    long long v20 = *(char **)(a1 + 768);
    while (1)
    {
      uint64_t v21 = v18 + v69;
      long long v22 = *v19;
      if (v20 >= *v19)
      {
        uint64_t v24 = (char *)*v17;
        uint64_t v25 = v20 - (unsigned char *)*v17;
        if (v25 <= -3) {
          goto LABEL_90;
        }
        uint64_t v26 = v25 >> 1;
        unint64_t v27 = v22 - v24;
        if (v27 <= (v25 >> 1) + 1) {
          unint64_t v28 = v26 + 1;
        }
        else {
          unint64_t v28 = v27;
        }
        if (v27 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v29 = v28;
        }
        if (v29)
        {
          long long v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v29);
          long long v20 = *(char **)(a1 + 768);
          uint64_t v24 = *(char **)(a1 + 760);
        }
        else
        {
          long long v30 = 0;
        }
        uint64_t v31 = &v30[2 * v26];
        *(_WORD *)uint64_t v31 = v21;
        long long v23 = v31 + 2;
        while (v20 != v24)
        {
          __int16 v32 = *((_WORD *)v20 - 1);
          v20 -= 2;
          *((_WORD *)v31 - 1) = v32;
          v31 -= 2;
        }
        *(void *)(a1 + 760) = v31;
        long long v22 = &v30[2 * v29];
        *(void *)(a1 + 768) = v23;
        *(void *)(a1 + 776) = v22;
        if (v24)
        {
          operator delete(v24);
          long long v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)long long v20 = v21;
        long long v23 = v20 + 2;
      }
      *(void *)(a1 + 768) = v23;
      __int16 v33 = v21 + 1;
      if (v23 >= v22)
      {
        float32x4_t v35 = (char *)*v17;
        uint64_t v36 = v23 - (unsigned char *)*v17;
        if (v36 < -2) {
          goto LABEL_90;
        }
        uint64_t v37 = v36 >> 1;
        unint64_t v38 = v22 - v35;
        if (v38 <= (v36 >> 1) + 1) {
          unint64_t v39 = v37 + 1;
        }
        else {
          unint64_t v39 = v38;
        }
        if (v38 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v40 = v39;
        }
        if (v40)
        {
          float32x4_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v40);
          long long v23 = *(char **)(a1 + 768);
          float32x4_t v35 = *(char **)(a1 + 760);
        }
        else
        {
          float32x4_t v41 = 0;
        }
        float32x4_t v42 = &v41[2 * v37];
        *(_WORD *)float32x4_t v42 = v33;
        long long v34 = v42 + 2;
        while (v23 != v35)
        {
          __int16 v43 = *((_WORD *)v23 - 1);
          v23 -= 2;
          *((_WORD *)v42 - 1) = v43;
          v42 -= 2;
        }
        *(void *)(a1 + 760) = v42;
        long long v22 = &v41[2 * v40];
        *(void *)(a1 + 768) = v34;
        *(void *)(a1 + 776) = v22;
        if (v35)
        {
          operator delete(v35);
          long long v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)long long v23 = v33;
        long long v34 = v23 + 2;
      }
      *(void *)(a1 + 768) = v34;
      __int16 v44 = v21 + 2;
      if (v34 >= v22)
      {
        float32x4_t v46 = (char *)*v17;
        uint64_t v47 = v34 - (unsigned char *)*v17;
        if (v47 < -2) {
          goto LABEL_90;
        }
        uint64_t v48 = v47 >> 1;
        unint64_t v49 = v22 - v46;
        if (v49 <= (v47 >> 1) + 1) {
          unint64_t v50 = v48 + 1;
        }
        else {
          unint64_t v50 = v49;
        }
        if (v49 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v51 = v50;
        }
        if (v51)
        {
          long long v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v51);
          long long v34 = *(char **)(a1 + 768);
          float32x4_t v46 = *(char **)(a1 + 760);
        }
        else
        {
          long long v52 = 0;
        }
        long long v53 = &v52[2 * v48];
        *(_WORD *)long long v53 = v44;
        float32x4_t v45 = v53 + 2;
        while (v34 != v46)
        {
          __int16 v54 = *((_WORD *)v34 - 1);
          v34 -= 2;
          *((_WORD *)v53 - 1) = v54;
          v53 -= 2;
        }
        *(void *)(a1 + 760) = v53;
        long long v22 = &v52[2 * v51];
        *(void *)(a1 + 768) = v45;
        *(void *)(a1 + 776) = v22;
        if (v46)
        {
          operator delete(v46);
          long long v22 = *v19;
        }
      }
      else
      {
        *(_WORD *)long long v34 = v44;
        float32x4_t v45 = v34 + 2;
      }
      *(void *)(a1 + 768) = v45;
      unint64_t v55 = v21 + 3;
      if (v45 >= v22)
      {
        long long v56 = (char *)*v17;
        uint64_t v57 = v45 - (unsigned char *)*v17;
        if (v57 < -2) {
LABEL_90:
        }
          std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
        uint64_t v58 = v57 >> 1;
        unint64_t v59 = v22 - v56;
        uint64_t v60 = v59 <= (v57 >> 1) + 1 ? v58 + 1 : v59;
        uint64_t v61 = v59 >= 0x7FFFFFFFFFFFFFFELL ? 0x7FFFFFFFFFFFFFFFLL : v60;
        if (v61)
        {
          v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 776, v61);
          float32x4_t v45 = *(char **)(a1 + 768);
          long long v56 = *(char **)(a1 + 760);
        }
        else
        {
          v62 = 0;
        }
        v63 = &v62[2 * v58];
        *(_WORD *)v63 = v55;
        long long v20 = v63 + 2;
        while (v45 != v56)
        {
          __int16 v64 = *((_WORD *)v45 - 1);
          v45 -= 2;
          *((_WORD *)v63 - 1) = v64;
          v63 -= 2;
        }
        *(void *)(a1 + 760) = v63;
        *(void *)(a1 + 768) = v20;
        *(void *)(a1 + 776) = &v62[2 * v61];
        if (v56) {
          operator delete(v56);
        }
      }
      else
      {
        *(_WORD *)float32x4_t v45 = v55;
        long long v20 = v45 + 2;
      }
      *(void *)(a1 + 768) = v20;
      if (v55 >= (uint64_t)(*(void *)(a1 + 744) - *(void *)(a1 + 736)) >> 4) {
        break;
      }
      if (++v18 == v16) {
        return v68 + 16 * v11;
      }
    }
    int v66 = 754;
    v67 = "control_point_start_index + 3 < _control_points.size()";
LABEL_88:
    __assert_rtn("reserve_spline_control_points", "LAUICubicBSplineRenderer.mm", v66, v67);
  }
  return v68 + 16 * v11;
}

char *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(uint64_t a1, char *__src, unint64_t a3, char *a4)
{
  unint64_t v4 = __src;
  if (a3)
  {
    id v5 = a4;
    uint64_t v10 = *(void *)(a1 + 16);
    uint64_t v8 = a1 + 16;
    uint64_t v9 = v10;
    unint64_t v11 = *(char **)(v8 - 8);
    if (a3 <= (v10 - (uint64_t)v11) >> 4)
    {
      uint64_t v18 = v11 - __src;
      if (a3 <= (v11 - __src) >> 4)
      {
        uint64_t v21 = *(char **)(v8 - 8);
        uint64_t v20 = a3;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v20 = v18 >> 4;
        uint64_t v21 = &v11[16 * (a3 - (v18 >> 4))];
        do
        {
          *(_OWORD *)&v11[v19] = *(_OWORD *)a4;
          v19 += 16;
        }
        while (16 * a3 - 16 * v20 != v19);
        *(void *)(a1 + 8) = v21;
        if (v11 == __src) {
          return v4;
        }
      }
      long long v22 = &__src[16 * a3];
      long long v23 = &v21[-16 * a3];
      uint64_t v24 = v21;
      if (v23 < v11)
      {
        uint64_t v24 = v21;
        do
        {
          long long v25 = *(_OWORD *)v23;
          v23 += 16;
          *(_OWORD *)uint64_t v24 = v25;
          v24 += 16;
        }
        while (v23 < v11);
      }
      *(void *)(a1 + 8) = v24;
      if (v21 != v22) {
        memmove(&v21[-16 * ((v21 - v22) >> 4)], __src, v21 - v22);
      }
      if (v4 <= v5)
      {
        if (*(void *)(a1 + 8) <= (unint64_t)v5) {
          unint64_t v26 = 0;
        }
        else {
          unint64_t v26 = a3;
        }
        v5 += 16 * v26;
      }
      unint64_t v27 = v4;
      do
      {
        *(_OWORD *)unint64_t v27 = *(_OWORD *)v5;
        v27 += 16;
        --v20;
      }
      while (v20);
    }
    else
    {
      uint64_t v12 = *(unsigned char **)a1;
      unint64_t v13 = a3 + ((uint64_t)&v11[-*(void *)a1] >> 4);
      if (v13 >> 60) {
        std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = (__src - v12) >> 4;
      uint64_t v15 = v9 - (void)v12;
      if (v15 >> 3 > v13) {
        unint64_t v13 = v15 >> 3;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v13;
      }
      uint64_t v36 = v8;
      if (v16) {
        long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v8, v16);
      }
      else {
        long long v17 = 0;
      }
      unint64_t v28 = &v17[16 * v14];
      __p = v17;
      __int16 v33 = v28;
      float32x4_t v35 = &v17[16 * v16];
      uint64_t v29 = 16 * a3;
      long long v30 = &v28[16 * a3];
      do
      {
        *(_OWORD *)unint64_t v28 = *(_OWORD *)v5;
        v28 += 16;
        v29 -= 16;
      }
      while (v29);
      long long v34 = v30;
      unint64_t v4 = (char *)std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
      if (v34 != v33) {
        v34 += (v33 - v34 + 15) & 0xFFFFFFFFFFFFFFF0;
      }
      if (__p) {
        operator delete(__p);
      }
    }
  }
  return v4;
}

void sub_21447A430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned short>::reserve(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFELL];
    uint64_t v9 = &v6[2 * v8];
    uint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        __int16 v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
      }
      while (v11 != v10);
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

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(uint64_t a1, uint64_t *a2, long long *a3, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a4)
{
  if (*(unsigned char *)(a1 + 8)) {
    return -1;
  }
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 696);
  uint64_t v7 = *(void *)(a1 + 688);
  if (*a2 >= (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 3))) {
    return -1;
  }
  uint64_t v9 = 0;
  if (v5)
  {
    uint64_t v10 = 56 * v5;
    unint64_t v11 = (void *)(v7 + 40);
    do
    {
      v9 -= 0x3333333333333333 * ((uint64_t)(*v11 - *(v11 - 1)) >> 4);
      v11 += 7;
      v10 -= 56;
    }
    while (v10);
  }
  uint64_t v12 = 0;
  if (v7 != v6)
  {
    uint64_t v13 = *(void *)(a1 + 688);
    do
    {
      v12 -= 0x3333333333333333 * ((uint64_t)(*(void *)(v13 + 40) - *(void *)(v13 + 32)) >> 4);
      v13 += 56;
    }
    while (v13 != v6);
  }
  uint64_t v14 = (void *)(v7 + 56 * v5);
  uint64_t v15 = (uint64_t)(v14[5] - v14[4]) >> 4;
  uint64_t v16 = *(void *)(a1 + 784) + 96 * v9;
  memset(v26, 0, sizeof(v26));
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::insert(a1 + 784, (char *)(v16 - 0x3333333333333320 * v15), v26);
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::reserve((void **)(a1 + 808), ((uint64_t)(*(void *)(a1 + 816) - *(void *)(a1 + 808)) >> 4) + 10);
  unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * v15;
  uint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * v15 + v9;
  uint64_t v19 = (char *)(*(void *)(a1 + 808) + 80 * v18);
  v26[0] = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 808, v19, 5uLL, (char *)v26);
  uint64_t v20 = 5 * (v9 + v12 + v17) + 5;
  uint64_t v21 = (char *)(*(void *)(a1 + 808) + 16 * v20);
  v26[0] = 0u;
  std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::insert(a1 + 808, v21, 5uLL, (char *)v26);
  *(unsigned char *)(a1 + 672) = 1;
  uint64_t v22 = *(void *)(a1 + 808);
  *(void *)&v26[0] = *(void *)(a1 + 784) + 96 * v18;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::add_instance(v14, a3, v26, v22 + 80 * v18, 5, v22 + 16 * v20, 5, a4);
  ++*(void *)(a1 + 712);
  if (v23 != v17) {
    __assert_rtn("add_instance", "LAUICubicBSplineRenderer.mm", 796, "actual_instance_id.index() == instance_id.index()");
  }
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::remap_instances((void *)a1);
  return v5;
}

char *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::insert(uint64_t a1, char *__src, _OWORD *a3)
{
  unint64_t v4 = __src;
  uint64_t v6 = *(char **)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  uint64_t v7 = a1 + 16;
  unint64_t v8 = v9;
  if ((unint64_t)v6 >= v9)
  {
    unint64_t v17 = *(unsigned char **)a1;
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*(void *)a1] >> 5) + 1;
    if (v18 > 0x2AAAAAAAAAAAAAALL) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((__src - v17) >> 5);
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (void)v17) >> 5);
    if (2 * v20 > v18) {
      unint64_t v18 = 2 * v20;
    }
    if (v20 >= 0x155555555555555) {
      unint64_t v21 = 0x2AAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v21 = v18;
    }
    uint64_t v36 = v7;
    if (v21) {
      uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(v7, v21);
    }
    else {
      uint64_t v22 = 0;
    }
    __p = v22;
    __int16 v33 = &v22[96 * v19];
    long long v34 = v33;
    float32x4_t v35 = &v22[96 * v21];
    std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::push_back(&__p, (uint64_t)a3);
    unint64_t v4 = (char *)std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v34 != v33) {
      long long v34 = &v33[(v34 - v33 - 96) % 0x60uLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    long long v27 = a3[1];
    *(_OWORD *)__src = *a3;
    *((_OWORD *)__src + 1) = v27;
    long long v28 = a3[2];
    long long v29 = a3[3];
    long long v30 = a3[5];
    *((_OWORD *)__src + 4) = a3[4];
    *((_OWORD *)__src + 5) = v30;
    *((_OWORD *)__src + 2) = v28;
    *((_OWORD *)__src + 3) = v29;
    *(void *)(a1 + 8) = __src + 96;
  }
  else
  {
    uint64_t v10 = __src + 96;
    unint64_t v11 = v6 - 96;
    uint64_t v12 = v6;
    while (v11 < v6)
    {
      long long v13 = *((_OWORD *)v11 + 1);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v11;
      *((_OWORD *)v12 + 1) = v13;
      long long v14 = *((_OWORD *)v11 + 2);
      long long v15 = *((_OWORD *)v11 + 3);
      long long v16 = *((_OWORD *)v11 + 5);
      *((_OWORD *)v12 + 4) = *((_OWORD *)v11 + 4);
      *((_OWORD *)v12 + 5) = v16;
      *((_OWORD *)v12 + 2) = v14;
      *((_OWORD *)v12 + 3) = v15;
      v11 += 96;
      v12 += 96;
    }
    *(void *)(a1 + 8) = v12;
    if (v6 != v10) {
      memmove(__src + 96, __src, v6 - v10);
    }
    long long v23 = a3[1];
    *(_OWORD *)unint64_t v4 = *a3;
    *((_OWORD *)v4 + 1) = v23;
    long long v24 = a3[2];
    long long v25 = a3[3];
    long long v26 = a3[5];
    *((_OWORD *)v4 + 4) = a3[4];
    *((_OWORD *)v4 + 5) = v26;
    *((_OWORD *)v4 + 2) = v24;
    *((_OWORD *)v4 + 3) = v25;
  }
  return v4;
}

void sub_21447A944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::reserve(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    unint64_t v9 = &v6[16 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
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

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::add_instance(void *a1, long long *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a8)
{
  long long v16 = (void **)(a1 + 4);
  uint64_t v15 = a1[4];
  unint64_t v17 = a1[5];
  uint64_t v18 = (uint64_t)(v17 - v15) / 80;
  uint64_t v39 = *a1;
  unint64_t v21 = a1[6];
  uint64_t v19 = (uint64_t)(a1 + 6);
  unint64_t v20 = v21;
  if (v17 >= v21)
  {
    if ((unint64_t)(v18 + 1) > 0x333333333333333) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v20 - v15) >> 4);
    uint64_t v25 = 2 * v24;
    if (2 * v24 <= v18 + 1) {
      uint64_t v25 = v18 + 1;
    }
    if (v24 >= 0x199999999999999) {
      unint64_t v26 = 0x333333333333333;
    }
    else {
      unint64_t v26 = v25;
    }
    long long v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(v19, v26);
    long long v28 = &v27[80 * v18];
    uint64_t v37 = &v27[80 * v29];
    *(void *)long long v28 = a1;
    long long v30 = *a2;
    *(_OWORD *)(v28 + 24) = a2[1];
    *(_OWORD *)(v28 + 8) = v30;
    *((void *)v28 + 5) = *a3;
    *((void *)v28 + 6) = a4;
    *((void *)v28 + 7) = a5;
    *((void *)v28 + 8) = a6;
    *((void *)v28 + 9) = a7;
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)v28, a8, 1);
    long long v23 = v28 + 80;
    __int16 v32 = (char *)a1[4];
    uint64_t v31 = (char *)a1[5];
    if (v31 != v32)
    {
      do
      {
        *((_OWORD *)v28 - 5) = *((_OWORD *)v31 - 5);
        long long v33 = *((_OWORD *)v31 - 4);
        long long v34 = *((_OWORD *)v31 - 3);
        long long v35 = *((_OWORD *)v31 - 1);
        *((_OWORD *)v28 - 2) = *((_OWORD *)v31 - 2);
        *((_OWORD *)v28 - 1) = v35;
        *((_OWORD *)v28 - 4) = v33;
        *((_OWORD *)v28 - 3) = v34;
        v28 -= 80;
        v31 -= 80;
      }
      while (v31 != v32);
      uint64_t v31 = (char *)*v16;
    }
    a1[4] = v28;
    a1[5] = v23;
    a1[6] = v37;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    *(void *)unint64_t v17 = a1;
    long long v22 = *a2;
    *(_OWORD *)(v17 + 24) = a2[1];
    *(_OWORD *)(v17 + 8) = v22;
    *(void *)(v17 + 40) = *a3;
    *(void *)(v17 + 48) = a4;
    *(void *)(v17 + 56) = a5;
    *(void *)(v17 + 64) = a6;
    *(void *)(v17 + 72) = a7;
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)v17, a8, 1);
    long long v23 = (char *)(v17 + 80);
  }
  uint64_t result = v39;
  a1[5] = v23;
  return result;
}

void *LAUI_uniform_cubic_b_spline_renderer::renderer_t::remap_instances(void *this)
{
  uint64_t v1 = this[86];
  uint64_t v2 = this[87];
  if (v1 != v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[86];
    do
    {
      uint64_t v5 = v3;
      unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v4 + 40) - *(void *)(v4 + 32)) >> 4);
      v3 += v6;
      v4 += 56;
    }
    while (v4 != v2);
    if (v1 != v2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = this[101];
      uint64_t v9 = v5 + v6;
      do
      {
        uint64_t v10 = *(void **)(v1 + 32);
        unint64_t v11 = *(void **)(v1 + 40);
        if (v10 != v11)
        {
          uint64_t v12 = v8 + 80 * v7;
          uint64_t v13 = v8 + 80 * (v9 + v7);
          uint64_t v14 = 96 * v7;
          do
          {
            v10[5] = v14 + this[98];
            v10[6] = v12;
            v10[7] = 5;
            v10[8] = v13;
            v10[9] = 5;
            ++v7;
            v10 += 10;
            v12 += 80;
            v13 += 80;
            v14 += 96;
          }
          while (v10 != v11);
        }
        v1 += 56;
      }
      while (v1 != v2);
    }
  }
  return this;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::rebuild_cap_control_point_indices(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  if (*((unsigned char *)this + 672))
  {
    *((unsigned char *)this + 672) = 0;
    uint64_t v2 = (char *)*((void *)this + 104);
    *((void *)this + 105) = v2;
    uint64_t v3 = *((void *)this + 86);
    uint64_t v300 = *((void *)this + 87);
    if (v3 != v300)
    {
      __int16 v4 = 0;
      v312 = (void **)((char *)this + 832);
      uint64_t v5 = (char **)((char *)this + 848);
      do
      {
        uint64_t v306 = v3;
        uint64_t v6 = *(void *)(v3 + 40) - *(void *)(v3 + 32);
        if (v6)
        {
          uint64_t v7 = 0;
          unint64_t v8 = v6 / 80;
          if (v8 <= 1) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = v8;
          }
          do
          {
            uint64_t v10 = *v5;
            if (v2 >= *v5)
            {
              uint64_t v12 = (char *)*v312;
              uint64_t v13 = v2 - (unsigned char *)*v312;
              if (v13 < -2) {
                goto LABEL_458;
              }
              uint64_t v14 = v13 >> 1;
              unint64_t v15 = v10 - v12;
              if (v15 <= (v13 >> 1) + 1) {
                unint64_t v16 = v14 + 1;
              }
              else {
                unint64_t v16 = v15;
              }
              if (v15 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v17 = v16;
              }
              if (v17)
              {
                uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v17);
                uint64_t v2 = (char *)*((void *)this + 105);
                uint64_t v12 = (char *)*((void *)this + 104);
              }
              else
              {
                uint64_t v18 = 0;
              }
              uint64_t v19 = &v18[2 * v14];
              *(_WORD *)uint64_t v19 = v4;
              unint64_t v11 = v19 + 2;
              while (v2 != v12)
              {
                __int16 v20 = *((_WORD *)v2 - 1);
                v2 -= 2;
                *((_WORD *)v19 - 1) = v20;
                v19 -= 2;
              }
              *((void *)this + 104) = v19;
              uint64_t v10 = &v18[2 * v17];
              *((void *)this + 105) = v11;
              *((void *)this + 106) = v10;
              if (v12)
              {
                operator delete(v12);
                uint64_t v10 = *v5;
              }
            }
            else
            {
              *(_WORD *)uint64_t v2 = v4;
              unint64_t v11 = v2 + 2;
            }
            *((void *)this + 105) = v11;
            __int16 v21 = v4 + 3;
            if (v11 >= v10)
            {
              long long v23 = (char *)*v312;
              uint64_t v24 = v11 - (unsigned char *)*v312;
              if (v24 < -2) {
                goto LABEL_458;
              }
              uint64_t v25 = v24 >> 1;
              unint64_t v26 = v10 - v23;
              if (v26 <= (v24 >> 1) + 1) {
                unint64_t v27 = v25 + 1;
              }
              else {
                unint64_t v27 = v26;
              }
              if (v26 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v28 = v27;
              }
              if (v28)
              {
                uint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v28);
                unint64_t v11 = (char *)*((void *)this + 105);
                long long v23 = (char *)*((void *)this + 104);
              }
              else
              {
                uint64_t v29 = 0;
              }
              long long v30 = &v29[2 * v25];
              *(_WORD *)long long v30 = v21;
              long long v22 = v30 + 2;
              while (v11 != v23)
              {
                __int16 v31 = *((_WORD *)v11 - 1);
                v11 -= 2;
                *((_WORD *)v30 - 1) = v31;
                v30 -= 2;
              }
              *((void *)this + 104) = v30;
              uint64_t v10 = &v29[2 * v28];
              *((void *)this + 105) = v22;
              *((void *)this + 106) = v10;
              if (v23)
              {
                operator delete(v23);
                uint64_t v10 = *v5;
              }
            }
            else
            {
              *(_WORD *)unint64_t v11 = v21;
              long long v22 = v11 + 2;
            }
            *((void *)this + 105) = v22;
            __int16 v32 = v4 + 4;
            if (v22 >= v10)
            {
              long long v33 = (char *)*v312;
              uint64_t v34 = v22 - (unsigned char *)*v312;
              if (v34 < -2) {
LABEL_458:
              }
                std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
              uint64_t v35 = v34 >> 1;
              unint64_t v36 = v10 - v33;
              if (v36 <= (v34 >> 1) + 1) {
                unint64_t v37 = v35 + 1;
              }
              else {
                unint64_t v37 = v36;
              }
              if (v36 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v38 = v37;
              }
              if (v38)
              {
                uint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v38);
                long long v22 = (char *)*((void *)this + 105);
                long long v33 = (char *)*((void *)this + 104);
              }
              else
              {
                uint64_t v39 = 0;
              }
              uint64_t v40 = &v39[2 * v35];
              *(_WORD *)uint64_t v40 = v32;
              uint64_t v2 = v40 + 2;
              while (v22 != v33)
              {
                __int16 v41 = *((_WORD *)v22 - 1);
                v22 -= 2;
                *((_WORD *)v40 - 1) = v41;
                v40 -= 2;
              }
              *((void *)this + 104) = v40;
              *((void *)this + 105) = v2;
              *((void *)this + 106) = &v39[2 * v38];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              *(_WORD *)long long v22 = v32;
              uint64_t v2 = v22 + 2;
            }
            *((void *)this + 105) = v2;
            v4 += 5;
            ++v7;
          }
          while (v7 != v9);
        }
        uint64_t v3 = v306 + 56;
      }
      while (v306 + 56 != v300);
      uint64_t v42 = *((void *)this + 86);
      uint64_t v301 = *((void *)this + 87);
      if (v42 != v301)
      {
        __int16 v43 = 0;
        do
        {
          uint64_t v307 = v42;
          uint64_t v44 = *(void *)(v42 + 40) - *(void *)(v42 + 32);
          if (v44)
          {
            uint64_t v45 = 0;
            unint64_t v46 = v44 / 80;
            if (v46 <= 1) {
              uint64_t v47 = 1;
            }
            else {
              uint64_t v47 = v46;
            }
            do
            {
              uint64_t v48 = *v5;
              if (v2 >= *v5)
              {
                unint64_t v50 = (char *)*v312;
                uint64_t v51 = v2 - (unsigned char *)*v312;
                if (v51 < -2) {
                  goto LABEL_458;
                }
                uint64_t v52 = v51 >> 1;
                unint64_t v53 = v48 - v50;
                if (v53 <= (v51 >> 1) + 1) {
                  unint64_t v54 = v52 + 1;
                }
                else {
                  unint64_t v54 = v53;
                }
                if (v53 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v55 = v54;
                }
                if (v55)
                {
                  long long v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v55);
                  uint64_t v2 = (char *)*((void *)this + 105);
                  unint64_t v50 = (char *)*((void *)this + 104);
                }
                else
                {
                  long long v56 = 0;
                }
                uint64_t v57 = &v56[2 * v52];
                *(_WORD *)uint64_t v57 = v43;
                unint64_t v49 = v57 + 2;
                while (v2 != v50)
                {
                  __int16 v58 = *((_WORD *)v2 - 1);
                  v2 -= 2;
                  *((_WORD *)v57 - 1) = v58;
                  v57 -= 2;
                }
                *((void *)this + 104) = v57;
                uint64_t v48 = &v56[2 * v55];
                *((void *)this + 105) = v49;
                *((void *)this + 106) = v48;
                if (v50)
                {
                  operator delete(v50);
                  uint64_t v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)uint64_t v2 = v43;
                unint64_t v49 = v2 + 2;
              }
              *((void *)this + 105) = v49;
              __int16 v59 = v43 + 1;
              if (v49 >= v48)
              {
                uint64_t v61 = (char *)*v312;
                uint64_t v62 = v49 - (unsigned char *)*v312;
                if (v62 < -2) {
                  goto LABEL_458;
                }
                uint64_t v63 = v62 >> 1;
                unint64_t v64 = v48 - v61;
                if (v64 <= (v62 >> 1) + 1) {
                  unint64_t v65 = v63 + 1;
                }
                else {
                  unint64_t v65 = v64;
                }
                if (v64 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v66 = v65;
                }
                if (v66)
                {
                  v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v66);
                  unint64_t v49 = (char *)*((void *)this + 105);
                  uint64_t v61 = (char *)*((void *)this + 104);
                }
                else
                {
                  v67 = 0;
                }
                uint64_t v68 = &v67[2 * v63];
                *(_WORD *)uint64_t v68 = v59;
                uint64_t v60 = v68 + 2;
                while (v49 != v61)
                {
                  __int16 v69 = *((_WORD *)v49 - 1);
                  v49 -= 2;
                  *((_WORD *)v68 - 1) = v69;
                  v68 -= 2;
                }
                *((void *)this + 104) = v68;
                uint64_t v48 = &v67[2 * v66];
                *((void *)this + 105) = v60;
                *((void *)this + 106) = v48;
                if (v61)
                {
                  operator delete(v61);
                  uint64_t v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)unint64_t v49 = v59;
                uint64_t v60 = v49 + 2;
              }
              *((void *)this + 105) = v60;
              __int16 v70 = v43 + 3;
              if (v60 >= v48)
              {
                id v72 = (char *)*v312;
                uint64_t v73 = v60 - (unsigned char *)*v312;
                if (v73 < -2) {
                  goto LABEL_458;
                }
                uint64_t v74 = v73 >> 1;
                unint64_t v75 = v48 - v72;
                if (v75 <= (v73 >> 1) + 1) {
                  unint64_t v76 = v74 + 1;
                }
                else {
                  unint64_t v76 = v75;
                }
                if (v75 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v77 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v77 = v76;
                }
                if (v77)
                {
                  v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v77);
                  uint64_t v60 = (char *)*((void *)this + 105);
                  id v72 = (char *)*((void *)this + 104);
                }
                else
                {
                  v78 = 0;
                }
                id v79 = &v78[2 * v74];
                *(_WORD *)id v79 = v70;
                v71 = v79 + 2;
                while (v60 != v72)
                {
                  __int16 v80 = *((_WORD *)v60 - 1);
                  v60 -= 2;
                  *((_WORD *)v79 - 1) = v80;
                  v79 -= 2;
                }
                *((void *)this + 104) = v79;
                uint64_t v48 = &v78[2 * v77];
                *((void *)this + 105) = v71;
                *((void *)this + 106) = v48;
                if (v72)
                {
                  operator delete(v72);
                  uint64_t v48 = *v5;
                }
              }
              else
              {
                *(_WORD *)uint64_t v60 = v70;
                v71 = v60 + 2;
              }
              *((void *)this + 105) = v71;
              __int16 v81 = v43 + 4;
              if (v71 >= v48)
              {
                v82 = (char *)*v312;
                uint64_t v83 = v71 - (unsigned char *)*v312;
                if (v83 < -2) {
                  goto LABEL_458;
                }
                uint64_t v84 = v83 >> 1;
                unint64_t v85 = v48 - v82;
                if (v85 <= (v83 >> 1) + 1) {
                  unint64_t v86 = v84 + 1;
                }
                else {
                  unint64_t v86 = v85;
                }
                if (v85 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v87 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v87 = v86;
                }
                if (v87)
                {
                  id v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v87);
                  v71 = (char *)*((void *)this + 105);
                  v82 = (char *)*((void *)this + 104);
                }
                else
                {
                  id v88 = 0;
                }
                v89 = &v88[2 * v84];
                *(_WORD *)v89 = v81;
                uint64_t v2 = v89 + 2;
                while (v71 != v82)
                {
                  __int16 v90 = *((_WORD *)v71 - 1);
                  v71 -= 2;
                  *((_WORD *)v89 - 1) = v90;
                  v89 -= 2;
                }
                *((void *)this + 104) = v89;
                *((void *)this + 105) = v2;
                *((void *)this + 106) = &v88[2 * v87];
                if (v82) {
                  operator delete(v82);
                }
              }
              else
              {
                *(_WORD *)v71 = v81;
                uint64_t v2 = v71 + 2;
              }
              *((void *)this + 105) = v2;
              v43 += 5;
              ++v45;
            }
            while (v45 != v47);
          }
          uint64_t v42 = v307 + 56;
        }
        while (v307 + 56 != v301);
        uint64_t v91 = *((void *)this + 86);
        uint64_t v302 = *((void *)this + 87);
        if (v91 != v302)
        {
          __int16 v92 = 0;
          do
          {
            uint64_t v308 = v91;
            uint64_t v93 = *(void *)(v91 + 40) - *(void *)(v91 + 32);
            if (v93)
            {
              uint64_t v94 = 0;
              unint64_t v95 = v93 / 80;
              if (v95 <= 1) {
                uint64_t v96 = 1;
              }
              else {
                uint64_t v96 = v95;
              }
              do
              {
                shared_state_t v97 = *v5;
                if (v2 >= *v5)
                {
                  v99 = (char *)*v312;
                  uint64_t v100 = v2 - (unsigned char *)*v312;
                  if (v100 < -2) {
                    goto LABEL_458;
                  }
                  uint64_t v101 = v100 >> 1;
                  unint64_t v102 = v97 - v99;
                  if (v102 <= (v100 >> 1) + 1) {
                    unint64_t v103 = v101 + 1;
                  }
                  else {
                    unint64_t v103 = v102;
                  }
                  if (v102 >= 0x7FFFFFFFFFFFFFFELL) {
                    uint64_t v104 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    uint64_t v104 = v103;
                  }
                  if (v104)
                  {
                    v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v104);
                    uint64_t v2 = (char *)*((void *)this + 105);
                    v99 = (char *)*((void *)this + 104);
                  }
                  else
                  {
                    v105 = 0;
                  }
                  v106 = &v105[2 * v101];
                  *(_WORD *)v106 = v92;
                  char v98 = v106 + 2;
                  while (v2 != v99)
                  {
                    __int16 v107 = *((_WORD *)v2 - 1);
                    v2 -= 2;
                    *((_WORD *)v106 - 1) = v107;
                    v106 -= 2;
                  }
                  *((void *)this + 104) = v106;
                  shared_state_t v97 = &v105[2 * v104];
                  *((void *)this + 105) = v98;
                  *((void *)this + 106) = v97;
                  if (v99)
                  {
                    operator delete(v99);
                    shared_state_t v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)uint64_t v2 = v92;
                  char v98 = v2 + 2;
                }
                *((void *)this + 105) = v98;
                __int16 v108 = v92 + 1;
                if (v98 >= v97)
                {
                  v110 = (char *)*v312;
                  uint64_t v111 = v98 - (unsigned char *)*v312;
                  if (v111 < -2) {
                    goto LABEL_458;
                  }
                  uint64_t v112 = v111 >> 1;
                  unint64_t v113 = v97 - v110;
                  if (v113 <= (v111 >> 1) + 1) {
                    unint64_t v114 = v112 + 1;
                  }
                  else {
                    unint64_t v114 = v113;
                  }
                  if (v113 >= 0x7FFFFFFFFFFFFFFELL) {
                    uint64_t v115 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    uint64_t v115 = v114;
                  }
                  if (v115)
                  {
                    v116 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v115);
                    char v98 = (char *)*((void *)this + 105);
                    v110 = (char *)*((void *)this + 104);
                  }
                  else
                  {
                    v116 = 0;
                  }
                  v117 = &v116[2 * v112];
                  *(_WORD *)v117 = v108;
                  v109 = v117 + 2;
                  while (v98 != v110)
                  {
                    __int16 v118 = *((_WORD *)v98 - 1);
                    v98 -= 2;
                    *((_WORD *)v117 - 1) = v118;
                    v117 -= 2;
                  }
                  *((void *)this + 104) = v117;
                  shared_state_t v97 = &v116[2 * v115];
                  *((void *)this + 105) = v109;
                  *((void *)this + 106) = v97;
                  if (v110)
                  {
                    operator delete(v110);
                    shared_state_t v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)char v98 = v108;
                  v109 = v98 + 2;
                }
                *((void *)this + 105) = v109;
                __int16 v119 = v92 + 2;
                if (v109 >= v97)
                {
                  v121 = (char *)*v312;
                  uint64_t v122 = v109 - (unsigned char *)*v312;
                  if (v122 < -2) {
                    goto LABEL_458;
                  }
                  uint64_t v123 = v122 >> 1;
                  unint64_t v124 = v97 - v121;
                  if (v124 <= (v122 >> 1) + 1) {
                    unint64_t v125 = v123 + 1;
                  }
                  else {
                    unint64_t v125 = v124;
                  }
                  if (v124 >= 0x7FFFFFFFFFFFFFFELL) {
                    uint64_t v126 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    uint64_t v126 = v125;
                  }
                  if (v126)
                  {
                    v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v126);
                    v109 = (char *)*((void *)this + 105);
                    v121 = (char *)*((void *)this + 104);
                  }
                  else
                  {
                    v127 = 0;
                  }
                  v128 = &v127[2 * v123];
                  *(_WORD *)v128 = v119;
                  v120 = v128 + 2;
                  while (v109 != v121)
                  {
                    __int16 v129 = *((_WORD *)v109 - 1);
                    v109 -= 2;
                    *((_WORD *)v128 - 1) = v129;
                    v128 -= 2;
                  }
                  *((void *)this + 104) = v128;
                  shared_state_t v97 = &v127[2 * v126];
                  *((void *)this + 105) = v120;
                  *((void *)this + 106) = v97;
                  if (v121)
                  {
                    operator delete(v121);
                    shared_state_t v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v109 = v119;
                  v120 = v109 + 2;
                }
                *((void *)this + 105) = v120;
                __int16 v130 = v92 + 3;
                if (v120 >= v97)
                {
                  v132 = (char *)*v312;
                  uint64_t v133 = v120 - (unsigned char *)*v312;
                  if (v133 < -2) {
                    goto LABEL_458;
                  }
                  uint64_t v134 = v133 >> 1;
                  unint64_t v135 = v97 - v132;
                  if (v135 <= (v133 >> 1) + 1) {
                    unint64_t v136 = v134 + 1;
                  }
                  else {
                    unint64_t v136 = v135;
                  }
                  if (v135 >= 0x7FFFFFFFFFFFFFFELL) {
                    uint64_t v137 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    uint64_t v137 = v136;
                  }
                  if (v137)
                  {
                    v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v137);
                    v120 = (char *)*((void *)this + 105);
                    v132 = (char *)*((void *)this + 104);
                  }
                  else
                  {
                    v138 = 0;
                  }
                  v139 = &v138[2 * v134];
                  *(_WORD *)v139 = v130;
                  v131 = v139 + 2;
                  while (v120 != v132)
                  {
                    __int16 v140 = *((_WORD *)v120 - 1);
                    v120 -= 2;
                    *((_WORD *)v139 - 1) = v140;
                    v139 -= 2;
                  }
                  *((void *)this + 104) = v139;
                  shared_state_t v97 = &v138[2 * v137];
                  *((void *)this + 105) = v131;
                  *((void *)this + 106) = v97;
                  if (v132)
                  {
                    operator delete(v132);
                    shared_state_t v97 = *v5;
                  }
                }
                else
                {
                  *(_WORD *)v120 = v130;
                  v131 = v120 + 2;
                }
                *((void *)this + 105) = v131;
                __int16 v141 = v92 + 4;
                if (v131 >= v97)
                {
                  v142 = (char *)*v312;
                  uint64_t v143 = v131 - (unsigned char *)*v312;
                  if (v143 < -2) {
                    goto LABEL_458;
                  }
                  uint64_t v144 = v143 >> 1;
                  unint64_t v145 = v97 - v142;
                  if (v145 <= (v143 >> 1) + 1) {
                    unint64_t v146 = v144 + 1;
                  }
                  else {
                    unint64_t v146 = v145;
                  }
                  if (v145 >= 0x7FFFFFFFFFFFFFFELL) {
                    uint64_t v147 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    uint64_t v147 = v146;
                  }
                  if (v147)
                  {
                    v148 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v147);
                    v131 = (char *)*((void *)this + 105);
                    v142 = (char *)*((void *)this + 104);
                  }
                  else
                  {
                    v148 = 0;
                  }
                  v149 = &v148[2 * v144];
                  *(_WORD *)v149 = v141;
                  uint64_t v2 = v149 + 2;
                  while (v131 != v142)
                  {
                    __int16 v150 = *((_WORD *)v131 - 1);
                    v131 -= 2;
                    *((_WORD *)v149 - 1) = v150;
                    v149 -= 2;
                  }
                  *((void *)this + 104) = v149;
                  *((void *)this + 105) = v2;
                  *((void *)this + 106) = &v148[2 * v147];
                  if (v142) {
                    operator delete(v142);
                  }
                }
                else
                {
                  *(_WORD *)v131 = v141;
                  uint64_t v2 = v131 + 2;
                }
                *((void *)this + 105) = v2;
                v92 += 5;
                ++v94;
              }
              while (v94 != v96);
            }
            uint64_t v91 = v308 + 56;
          }
          while (v308 + 56 != v302);
          uint64_t v151 = *((void *)this + 86);
          uint64_t v303 = *((void *)this + 87);
          if (v151 != v303)
          {
            __int16 v152 = 5 * *((_WORD *)this + 356);
            __int16 v153 = v152;
            do
            {
              uint64_t v309 = v151;
              uint64_t v154 = *(void *)(v151 + 40) - *(void *)(v151 + 32);
              if (v154)
              {
                uint64_t v155 = 0;
                unint64_t v156 = v154 / 80;
                if (v156 <= 1) {
                  uint64_t v157 = 1;
                }
                else {
                  uint64_t v157 = v156;
                }
                do
                {
                  __int16 v158 = v153 + 2;
                  v159 = *v5;
                  if (v2 >= *v5)
                  {
                    v161 = (char *)*v312;
                    uint64_t v162 = v2 - (unsigned char *)*v312;
                    if (v162 < -2) {
                      goto LABEL_458;
                    }
                    uint64_t v163 = v162 >> 1;
                    unint64_t v164 = v159 - v161;
                    if (v164 <= (v162 >> 1) + 1) {
                      unint64_t v165 = v163 + 1;
                    }
                    else {
                      unint64_t v165 = v164;
                    }
                    if (v164 >= 0x7FFFFFFFFFFFFFFELL) {
                      uint64_t v166 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      uint64_t v166 = v165;
                    }
                    if (v166)
                    {
                      v167 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v166);
                      uint64_t v2 = (char *)*((void *)this + 105);
                      v161 = (char *)*((void *)this + 104);
                    }
                    else
                    {
                      v167 = 0;
                    }
                    v168 = &v167[2 * v163];
                    *(_WORD *)v168 = v158;
                    v160 = v168 + 2;
                    while (v2 != v161)
                    {
                      __int16 v169 = *((_WORD *)v2 - 1);
                      v2 -= 2;
                      *((_WORD *)v168 - 1) = v169;
                      v168 -= 2;
                    }
                    *((void *)this + 104) = v168;
                    v159 = &v167[2 * v166];
                    *((void *)this + 105) = v160;
                    *((void *)this + 106) = v159;
                    if (v161)
                    {
                      operator delete(v161);
                      v159 = *v5;
                    }
                  }
                  else
                  {
                    *(_WORD *)uint64_t v2 = v158;
                    v160 = v2 + 2;
                  }
                  *((void *)this + 105) = v160;
                  __int16 v170 = v153 + 3;
                  if (v160 >= v159)
                  {
                    v172 = (char *)*v312;
                    uint64_t v173 = v160 - (unsigned char *)*v312;
                    if (v173 < -2) {
                      goto LABEL_458;
                    }
                    uint64_t v174 = v173 >> 1;
                    unint64_t v175 = v159 - v172;
                    if (v175 <= (v173 >> 1) + 1) {
                      unint64_t v176 = v174 + 1;
                    }
                    else {
                      unint64_t v176 = v175;
                    }
                    if (v175 >= 0x7FFFFFFFFFFFFFFELL) {
                      uint64_t v177 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      uint64_t v177 = v176;
                    }
                    if (v177)
                    {
                      v178 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v177);
                      v160 = (char *)*((void *)this + 105);
                      v172 = (char *)*((void *)this + 104);
                    }
                    else
                    {
                      v178 = 0;
                    }
                    v179 = &v178[2 * v174];
                    *(_WORD *)v179 = v170;
                    v171 = v179 + 2;
                    while (v160 != v172)
                    {
                      __int16 v180 = *((_WORD *)v160 - 1);
                      v160 -= 2;
                      *((_WORD *)v179 - 1) = v180;
                      v179 -= 2;
                    }
                    *((void *)this + 104) = v179;
                    v159 = &v178[2 * v177];
                    *((void *)this + 105) = v171;
                    *((void *)this + 106) = v159;
                    if (v172)
                    {
                      operator delete(v172);
                      v159 = *v5;
                    }
                  }
                  else
                  {
                    *(_WORD *)v160 = v170;
                    v171 = v160 + 2;
                  }
                  *((void *)this + 105) = v171;
                  __int16 v181 = v153 + 4;
                  if (v171 >= v159)
                  {
                    v182 = (char *)*v312;
                    uint64_t v183 = v171 - (unsigned char *)*v312;
                    if (v183 < -2) {
                      goto LABEL_458;
                    }
                    uint64_t v184 = v183 >> 1;
                    unint64_t v185 = v159 - v182;
                    if (v185 <= (v183 >> 1) + 1) {
                      unint64_t v186 = v184 + 1;
                    }
                    else {
                      unint64_t v186 = v185;
                    }
                    if (v185 >= 0x7FFFFFFFFFFFFFFELL) {
                      uint64_t v187 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      uint64_t v187 = v186;
                    }
                    if (v187)
                    {
                      v188 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v187);
                      v171 = (char *)*((void *)this + 105);
                      v182 = (char *)*((void *)this + 104);
                    }
                    else
                    {
                      v188 = 0;
                    }
                    v189 = &v188[2 * v184];
                    *(_WORD *)v189 = v181;
                    uint64_t v2 = v189 + 2;
                    while (v171 != v182)
                    {
                      __int16 v190 = *((_WORD *)v171 - 1);
                      v171 -= 2;
                      *((_WORD *)v189 - 1) = v190;
                      v189 -= 2;
                    }
                    *((void *)this + 104) = v189;
                    *((void *)this + 105) = v2;
                    *((void *)this + 106) = &v188[2 * v187];
                    if (v182) {
                      operator delete(v182);
                    }
                  }
                  else
                  {
                    *(_WORD *)v171 = v181;
                    uint64_t v2 = v171 + 2;
                  }
                  *((void *)this + 105) = v2;
                  v153 += 5;
                  ++v155;
                }
                while (v155 != v157);
              }
              uint64_t v151 = v309 + 56;
            }
            while (v309 + 56 != v303);
            uint64_t v191 = *((void *)this + 86);
            uint64_t v304 = *((void *)this + 87);
            if (v191 != v304)
            {
              __int16 v192 = v152;
              do
              {
                uint64_t v310 = v191;
                uint64_t v193 = *(void *)(v191 + 40) - *(void *)(v191 + 32);
                if (v193)
                {
                  uint64_t v194 = 0;
                  unint64_t v195 = v193 / 80;
                  if (v195 <= 1) {
                    uint64_t v196 = 1;
                  }
                  else {
                    uint64_t v196 = v195;
                  }
                  do
                  {
                    __int16 v197 = v192 + 1;
                    v198 = *v5;
                    if (v2 >= *v5)
                    {
                      v200 = (char *)*v312;
                      uint64_t v201 = v2 - (unsigned char *)*v312;
                      if (v201 < -2) {
                        goto LABEL_458;
                      }
                      uint64_t v202 = v201 >> 1;
                      unint64_t v203 = v198 - v200;
                      if (v203 <= (v201 >> 1) + 1) {
                        unint64_t v204 = v202 + 1;
                      }
                      else {
                        unint64_t v204 = v203;
                      }
                      if (v203 >= 0x7FFFFFFFFFFFFFFELL) {
                        uint64_t v205 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        uint64_t v205 = v204;
                      }
                      if (v205)
                      {
                        v206 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v205);
                        uint64_t v2 = (char *)*((void *)this + 105);
                        v200 = (char *)*((void *)this + 104);
                      }
                      else
                      {
                        v206 = 0;
                      }
                      v207 = &v206[2 * v202];
                      *(_WORD *)v207 = v197;
                      v199 = v207 + 2;
                      while (v2 != v200)
                      {
                        __int16 v208 = *((_WORD *)v2 - 1);
                        v2 -= 2;
                        *((_WORD *)v207 - 1) = v208;
                        v207 -= 2;
                      }
                      *((void *)this + 104) = v207;
                      v198 = &v206[2 * v205];
                      *((void *)this + 105) = v199;
                      *((void *)this + 106) = v198;
                      if (v200)
                      {
                        operator delete(v200);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)uint64_t v2 = v197;
                      v199 = v2 + 2;
                    }
                    *((void *)this + 105) = v199;
                    __int16 v209 = v192 + 2;
                    if (v199 >= v198)
                    {
                      v211 = (char *)*v312;
                      uint64_t v212 = v199 - (unsigned char *)*v312;
                      if (v212 < -2) {
                        goto LABEL_458;
                      }
                      uint64_t v213 = v212 >> 1;
                      unint64_t v214 = v198 - v211;
                      if (v214 <= (v212 >> 1) + 1) {
                        unint64_t v215 = v213 + 1;
                      }
                      else {
                        unint64_t v215 = v214;
                      }
                      if (v214 >= 0x7FFFFFFFFFFFFFFELL) {
                        uint64_t v216 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        uint64_t v216 = v215;
                      }
                      if (v216)
                      {
                        v217 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v216);
                        v199 = (char *)*((void *)this + 105);
                        v211 = (char *)*((void *)this + 104);
                      }
                      else
                      {
                        v217 = 0;
                      }
                      v218 = &v217[2 * v213];
                      *(_WORD *)v218 = v209;
                      v210 = v218 + 2;
                      while (v199 != v211)
                      {
                        __int16 v219 = *((_WORD *)v199 - 1);
                        v199 -= 2;
                        *((_WORD *)v218 - 1) = v219;
                        v218 -= 2;
                      }
                      *((void *)this + 104) = v218;
                      v198 = &v217[2 * v216];
                      *((void *)this + 105) = v210;
                      *((void *)this + 106) = v198;
                      if (v211)
                      {
                        operator delete(v211);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)v199 = v209;
                      v210 = v199 + 2;
                    }
                    *((void *)this + 105) = v210;
                    __int16 v220 = v192 + 3;
                    if (v210 >= v198)
                    {
                      v222 = (char *)*v312;
                      uint64_t v223 = v210 - (unsigned char *)*v312;
                      if (v223 < -2) {
                        goto LABEL_458;
                      }
                      uint64_t v224 = v223 >> 1;
                      unint64_t v225 = v198 - v222;
                      if (v225 <= (v223 >> 1) + 1) {
                        unint64_t v226 = v224 + 1;
                      }
                      else {
                        unint64_t v226 = v225;
                      }
                      if (v225 >= 0x7FFFFFFFFFFFFFFELL) {
                        uint64_t v227 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        uint64_t v227 = v226;
                      }
                      if (v227)
                      {
                        v228 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v227);
                        v210 = (char *)*((void *)this + 105);
                        v222 = (char *)*((void *)this + 104);
                      }
                      else
                      {
                        v228 = 0;
                      }
                      v229 = &v228[2 * v224];
                      *(_WORD *)v229 = v220;
                      v221 = v229 + 2;
                      while (v210 != v222)
                      {
                        __int16 v230 = *((_WORD *)v210 - 1);
                        v210 -= 2;
                        *((_WORD *)v229 - 1) = v230;
                        v229 -= 2;
                      }
                      *((void *)this + 104) = v229;
                      v198 = &v228[2 * v227];
                      *((void *)this + 105) = v221;
                      *((void *)this + 106) = v198;
                      if (v222)
                      {
                        operator delete(v222);
                        v198 = *v5;
                      }
                    }
                    else
                    {
                      *(_WORD *)v210 = v220;
                      v221 = v210 + 2;
                    }
                    *((void *)this + 105) = v221;
                    __int16 v231 = v192 + 4;
                    if (v221 >= v198)
                    {
                      v232 = (char *)*v312;
                      uint64_t v233 = v221 - (unsigned char *)*v312;
                      if (v233 < -2) {
                        goto LABEL_458;
                      }
                      uint64_t v234 = v233 >> 1;
                      unint64_t v235 = v198 - v232;
                      if (v235 <= (v233 >> 1) + 1) {
                        unint64_t v236 = v234 + 1;
                      }
                      else {
                        unint64_t v236 = v235;
                      }
                      if (v235 >= 0x7FFFFFFFFFFFFFFELL) {
                        uint64_t v237 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        uint64_t v237 = v236;
                      }
                      if (v237)
                      {
                        v238 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v237);
                        v221 = (char *)*((void *)this + 105);
                        v232 = (char *)*((void *)this + 104);
                      }
                      else
                      {
                        v238 = 0;
                      }
                      v239 = &v238[2 * v234];
                      *(_WORD *)v239 = v231;
                      uint64_t v2 = v239 + 2;
                      while (v221 != v232)
                      {
                        __int16 v240 = *((_WORD *)v221 - 1);
                        v221 -= 2;
                        *((_WORD *)v239 - 1) = v240;
                        v239 -= 2;
                      }
                      *((void *)this + 104) = v239;
                      *((void *)this + 105) = v2;
                      *((void *)this + 106) = &v238[2 * v237];
                      if (v232) {
                        operator delete(v232);
                      }
                    }
                    else
                    {
                      *(_WORD *)v221 = v231;
                      uint64_t v2 = v221 + 2;
                    }
                    *((void *)this + 105) = v2;
                    v192 += 5;
                    ++v194;
                  }
                  while (v194 != v196);
                }
                uint64_t v191 = v310 + 56;
              }
              while (v310 + 56 != v304);
              uint64_t v241 = *((void *)this + 86);
              uint64_t v305 = *((void *)this + 87);
              if (v241 != v305)
              {
                do
                {
                  uint64_t v311 = v241;
                  uint64_t v242 = *(void *)(v241 + 40) - *(void *)(v241 + 32);
                  if (v242)
                  {
                    uint64_t v243 = 0;
                    unint64_t v244 = v242 / 80;
                    if (v244 <= 1) {
                      uint64_t v245 = 1;
                    }
                    else {
                      uint64_t v245 = v244;
                    }
                    do
                    {
                      v246 = *v5;
                      if (v2 >= *v5)
                      {
                        v248 = (char *)*v312;
                        uint64_t v249 = v2 - (unsigned char *)*v312;
                        if (v249 < -2) {
                          goto LABEL_458;
                        }
                        uint64_t v250 = v249 >> 1;
                        unint64_t v251 = v246 - v248;
                        if (v251 <= (v249 >> 1) + 1) {
                          unint64_t v252 = v250 + 1;
                        }
                        else {
                          unint64_t v252 = v251;
                        }
                        if (v251 >= 0x7FFFFFFFFFFFFFFELL) {
                          uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v253 = v252;
                        }
                        if (v253)
                        {
                          v254 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v253);
                          uint64_t v2 = (char *)*((void *)this + 105);
                          v248 = (char *)*((void *)this + 104);
                        }
                        else
                        {
                          v254 = 0;
                        }
                        v255 = &v254[2 * v250];
                        *(_WORD *)v255 = v152;
                        v247 = v255 + 2;
                        while (v2 != v248)
                        {
                          __int16 v256 = *((_WORD *)v2 - 1);
                          v2 -= 2;
                          *((_WORD *)v255 - 1) = v256;
                          v255 -= 2;
                        }
                        *((void *)this + 104) = v255;
                        v246 = &v254[2 * v253];
                        *((void *)this + 105) = v247;
                        *((void *)this + 106) = v246;
                        if (v248)
                        {
                          operator delete(v248);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)uint64_t v2 = v152;
                        v247 = v2 + 2;
                      }
                      *((void *)this + 105) = v247;
                      __int16 v257 = v152 + 1;
                      if (v247 >= v246)
                      {
                        v259 = (char *)*v312;
                        uint64_t v260 = v247 - (unsigned char *)*v312;
                        if (v260 < -2) {
                          goto LABEL_458;
                        }
                        uint64_t v261 = v260 >> 1;
                        unint64_t v262 = v246 - v259;
                        if (v262 <= (v260 >> 1) + 1) {
                          unint64_t v263 = v261 + 1;
                        }
                        else {
                          unint64_t v263 = v262;
                        }
                        if (v262 >= 0x7FFFFFFFFFFFFFFELL) {
                          uint64_t v264 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v264 = v263;
                        }
                        if (v264)
                        {
                          v265 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v264);
                          v247 = (char *)*((void *)this + 105);
                          v259 = (char *)*((void *)this + 104);
                        }
                        else
                        {
                          v265 = 0;
                        }
                        v266 = &v265[2 * v261];
                        *(_WORD *)v266 = v257;
                        v258 = v266 + 2;
                        while (v247 != v259)
                        {
                          __int16 v267 = *((_WORD *)v247 - 1);
                          v247 -= 2;
                          *((_WORD *)v266 - 1) = v267;
                          v266 -= 2;
                        }
                        *((void *)this + 104) = v266;
                        v246 = &v265[2 * v264];
                        *((void *)this + 105) = v258;
                        *((void *)this + 106) = v246;
                        if (v259)
                        {
                          operator delete(v259);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v247 = v257;
                        v258 = v247 + 2;
                      }
                      *((void *)this + 105) = v258;
                      __int16 v268 = v152 + 2;
                      if (v258 >= v246)
                      {
                        v270 = (char *)*v312;
                        uint64_t v271 = v258 - (unsigned char *)*v312;
                        if (v271 < -2) {
                          goto LABEL_458;
                        }
                        uint64_t v272 = v271 >> 1;
                        unint64_t v273 = v246 - v270;
                        if (v273 <= (v271 >> 1) + 1) {
                          unint64_t v274 = v272 + 1;
                        }
                        else {
                          unint64_t v274 = v273;
                        }
                        if (v273 >= 0x7FFFFFFFFFFFFFFELL) {
                          uint64_t v275 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v275 = v274;
                        }
                        if (v275)
                        {
                          v276 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v275);
                          v258 = (char *)*((void *)this + 105);
                          v270 = (char *)*((void *)this + 104);
                        }
                        else
                        {
                          v276 = 0;
                        }
                        v277 = &v276[2 * v272];
                        *(_WORD *)v277 = v268;
                        v269 = v277 + 2;
                        while (v258 != v270)
                        {
                          __int16 v278 = *((_WORD *)v258 - 1);
                          v258 -= 2;
                          *((_WORD *)v277 - 1) = v278;
                          v277 -= 2;
                        }
                        *((void *)this + 104) = v277;
                        v246 = &v276[2 * v275];
                        *((void *)this + 105) = v269;
                        *((void *)this + 106) = v246;
                        if (v270)
                        {
                          operator delete(v270);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v258 = v268;
                        v269 = v258 + 2;
                      }
                      *((void *)this + 105) = v269;
                      __int16 v279 = v152 + 3;
                      if (v269 >= v246)
                      {
                        v281 = (char *)*v312;
                        uint64_t v282 = v269 - (unsigned char *)*v312;
                        if (v282 < -2) {
                          goto LABEL_458;
                        }
                        uint64_t v283 = v282 >> 1;
                        unint64_t v284 = v246 - v281;
                        if (v284 <= (v282 >> 1) + 1) {
                          unint64_t v285 = v283 + 1;
                        }
                        else {
                          unint64_t v285 = v284;
                        }
                        if (v284 >= 0x7FFFFFFFFFFFFFFELL) {
                          uint64_t v286 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v286 = v285;
                        }
                        if (v286)
                        {
                          v287 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v286);
                          v269 = (char *)*((void *)this + 105);
                          v281 = (char *)*((void *)this + 104);
                        }
                        else
                        {
                          v287 = 0;
                        }
                        v288 = &v287[2 * v283];
                        *(_WORD *)v288 = v279;
                        v280 = v288 + 2;
                        while (v269 != v281)
                        {
                          __int16 v289 = *((_WORD *)v269 - 1);
                          v269 -= 2;
                          *((_WORD *)v288 - 1) = v289;
                          v288 -= 2;
                        }
                        *((void *)this + 104) = v288;
                        v246 = &v287[2 * v286];
                        *((void *)this + 105) = v280;
                        *((void *)this + 106) = v246;
                        if (v281)
                        {
                          operator delete(v281);
                          v246 = *v5;
                        }
                      }
                      else
                      {
                        *(_WORD *)v269 = v279;
                        v280 = v269 + 2;
                      }
                      *((void *)this + 105) = v280;
                      __int16 v290 = v152 + 4;
                      if (v280 >= v246)
                      {
                        v291 = (char *)*v312;
                        uint64_t v292 = v280 - (unsigned char *)*v312;
                        if (v292 <= -3) {
                          goto LABEL_458;
                        }
                        uint64_t v293 = v292 >> 1;
                        unint64_t v294 = v246 - v291;
                        if (v294 <= (v292 >> 1) + 1) {
                          unint64_t v295 = v293 + 1;
                        }
                        else {
                          unint64_t v295 = v294;
                        }
                        if (v294 >= 0x7FFFFFFFFFFFFFFELL) {
                          uint64_t v296 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v296 = v295;
                        }
                        if (v296)
                        {
                          v297 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 848, v296);
                          v280 = (char *)*((void *)this + 105);
                          v291 = (char *)*((void *)this + 104);
                        }
                        else
                        {
                          v297 = 0;
                        }
                        v298 = &v297[2 * v293];
                        *(_WORD *)v298 = v290;
                        uint64_t v2 = v298 + 2;
                        while (v280 != v291)
                        {
                          __int16 v299 = *((_WORD *)v280 - 1);
                          v280 -= 2;
                          *((_WORD *)v298 - 1) = v299;
                          v298 -= 2;
                        }
                        *((void *)this + 104) = v298;
                        *((void *)this + 105) = v2;
                        *((void *)this + 106) = &v297[2 * v296];
                        if (v291) {
                          operator delete(v291);
                        }
                      }
                      else
                      {
                        *(_WORD *)v280 = v290;
                        uint64_t v2 = v280 + 2;
                      }
                      *((void *)this + 105) = v2;
                      v152 += 5;
                      ++v243;
                    }
                    while (v243 != v245);
                  }
                  uint64_t v241 = v311 + 56;
                }
                while (v311 + 56 != v305);
              }
            }
          }
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state(LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *this, const LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a2, char a3)
{
  uint64_t v6 = *((void *)this + 5);
  uint64_t v7 = *(void *)this;
  double v8 = *((double *)this + 3);
  double v9 = *((double *)this + 4);
  if (v8 == v9)
  {
    double v10 = NAN;
    double v11 = NAN;
LABEL_3:
    double v12 = v11;
    goto LABEL_12;
  }
  double v14 = *((double *)a2 + 13);
  double v13 = *((double *)a2 + 14);
  double v15 = v9 - v8;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v8 != v14)
  {
    double v11 = 1.0;
    BOOL v16 = v9 == v14;
    double v17 = (v14 - v8) / v15;
    if (!v16) {
      double v11 = v17;
    }
  }
  if (v8 != v13)
  {
    double v10 = 1.0;
    if (v9 != v13) {
      double v10 = (v13 - v8) / v15;
    }
  }
  double v12 = 0.0;
  if (v11 >= 0.0)
  {
    double v12 = 1.0;
    if (v11 <= 1.0) {
      goto LABEL_3;
    }
  }
LABEL_12:
  float v19 = *(float *)(v6 + 80);
  float v18 = *(float *)(v6 + 84);
  float v20 = *(float *)(v6 + 88);
  if (v10 <= 1.0) {
    double v21 = v10;
  }
  else {
    double v21 = 1.0;
  }
  if (v10 >= 0.0) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  if (v12 <= v22) {
    double v23 = v12;
  }
  else {
    double v23 = v22;
  }
  if (v12 <= v22) {
    double v24 = v22;
  }
  else {
    double v24 = v12;
  }
  *(double *)&long long v25 = LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t::transform((float32x4_t *)a2);
  long long v29 = *((_OWORD *)a2 + 5);
  int v30 = *((_DWORD *)a2 + 24);
  unint64_t v32 = *(void *)(v7 + 8);
  if (v32 <= 3) {
    unint64_t v32 = 3;
  }
  *(_OWORD *)uint64_t v6 = v25;
  *(_OWORD *)(v6 + 16) = v26;
  float v33 = 1.0 - v24;
  *(_OWORD *)(v6 + 32) = v27;
  *(_OWORD *)(v6 + 48) = v28;
  *(_OWORD *)(v6 + 64) = v29;
  *(_DWORD *)(v6 + 80) = v30;
  float v31 = v23;
  *(float *)(v6 + 84) = v31;
  *(float *)(v6 + 88) = v33;
  *(float *)(v6 + 92) = (float)(v32 - 3);
  if ((a3 & 1) != 0 || (uint64_t v34 = (float *)*((void *)this + 5), v19 != v34[20]) || v18 != v34[21] || v20 != v34[22])
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(this);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *this)
{
  uint64_t v2 = (float *)*((void *)this + 5);
  unint64_t v3 = *(void *)(*(void *)this + 8);
  uint64_t v4 = *(void *)(*(void *)this + 16);
  if (v3 <= 3) {
    unint64_t v3 = 3;
  }
  float v5 = v2[21];
  if (v2[20] * 0.5 * (v2[20] * 0.5) * 1.5625 >= 2.22507386e-308) {
    double v6 = v2[20] * 0.5 * (v2[20] * 0.5) * 1.5625;
  }
  else {
    double v6 = 2.22507386e-308;
  }
  uint64_t v7 = *(void *)(*(void *)this + 24);
  unint64_t v8 = v3 - 3;
  if (v5 <= 0.0)
  {
    unint64_t v11 = 0;
    v12.columns[0].i32[0] = 0;
  }
  else
  {
    float v9 = 1.0 / (double)v8;
    float v10 = v5 / v9;
    unint64_t v11 = (unint64_t)v10;
    v12.columns[0].f32[0] = fmodf(v10, 1.0);
  }
  if (v8 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v8;
  }
  unint64_t v14 = v13 - 1;
  if (v13 - 1 >= v11) {
    unint64_t v15 = v11;
  }
  else {
    unint64_t v15 = v13 - 1;
  }
  BOOL v16 = (float32x4_t *)(v4 + 16 * v15);
  float32x4_t v18 = *v16;
  float32x4_t v17 = v16[1];
  float32x4_t v19 = v16[2];
  float32x4_t v20 = v16[3];
  v12.columns[2] = *(simd_float4 *)&_PromotedConst[32];
  v12.columns[3] = *(simd_float4 *)&_PromotedConst[48];
  v12.columns[1] = *(simd_float4 *)&_PromotedConst[16];
  if (v12.columns[0].f32[0] > 0.0)
  {
    float32x4_t v139 = v16[2];
    float32x4_t v141 = *v16;
    float32x4_t v143 = v16[1];
    float32x4_t v145 = v16[3];
    float v133 = 1.0 - v12.columns[0].f32[0];
    *(float *)&unsigned int v135 = (float)(1.0 - v12.columns[0].f32[0]) * (float)(1.0 - v12.columns[0].f32[0]);
    float v137 = v133 * (float)(v133 * v133);
    v12.columns[0] = *(simd_float4 *)_PromotedConst;
    simd_float4x4 v155 = __invert_f4(v12);
    uint64_t v21 = 0;
    *(float *)&unint64_t v22 = 1.0 - v133;
    *((float *)&v22 + 1) = v133;
    *(float *)&long long v23 = (float)((float)(v133 * -2.0) + 1.0) + *(float *)&v135;
    *((float *)&v23 + 1) = (float)(*(float *)&v135 * -2.0) + (float)(v133 * 2.0);
    *((void *)&v23 + 1) = v135;
    *(float *)&long long v24 = (float)((float)((float)(v133 * -3.0) + 1.0) + (float)(*(float *)&v135 * 3.0)) - v137;
    *((float *)&v24 + 1) = (float)((float)(*(float *)&v135 * -6.0) + (float)(v137 * 3.0)) + (float)(v133 * 3.0);
    *((float *)&v24 + 2) = (float)(v137 * -3.0) + (float)(*(float *)&v135 * 3.0);
    *((float *)&v24 + 3) = v137;
    long long v147 = xmmword_214498B90;
    long long v148 = v22;
    long long v149 = v23;
    long long v150 = v24;
    do
    {
      *(float32x4_t *)((char *)&v151 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v155.columns[0], COERCE_FLOAT(*(long long *)((char *)&v147 + v21))), (float32x4_t)v155.columns[1], *(float32x2_t *)((char *)&v147 + v21), 1), (float32x4_t)v155.columns[2], *(float32x4_t *)((char *)&v147 + v21), 2), (float32x4_t)v155.columns[3], *(float32x4_t *)((char *)&v147 + v21), 3);
      v21 += 16;
    }
    while (v21 != 64);
    uint64_t v25 = 0;
    float32x4_t v26 = v151;
    float32x4_t v27 = v152;
    float32x4_t v28 = v153;
    float32x4_t v29 = v154;
    long long v147 = xmmword_214498BC0;
    long long v148 = xmmword_214498BD0;
    long long v149 = xmmword_214498BE0;
    long long v150 = xmmword_214498B80;
    do
    {
      *(float32x4_t *)((char *)&v151 + v25) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(long long *)((char *)&v147 + v25))), v27, *(float32x2_t *)((char *)&v147 + v25), 1), v28, *(float32x4_t *)((char *)&v147 + v25), 2), v29, *(float32x4_t *)((char *)&v147 + v25), 3);
      v25 += 16;
    }
    while (v25 != 64);
    float32x4_t v18 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v143, v152.f32[0]), v141, v151.f32[0]), v139, v153.f32[0]), v145, v154.f32[0]);
    float32x4_t v17 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v143, *(float32x2_t *)v152.f32, 1), v141, *(float32x2_t *)v151.f32, 1), v139, *(float32x2_t *)v153.f32, 1), v145, *(float32x2_t *)v154.f32, 1);
    float32x4_t v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v143, v152, 2), v141, v151, 2), v139, v153, 2), v145, v154, 2);
    float32x4_t v20 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v143, v152, 3), v141, v151, 3), v139, v153, 3), v145, v154, 3);
  }
  double v30 = 1.79769313e308;
  __asm { FMOV            V21.4S, #4.0 }
  v36.i64[0] = 0x3E0000003E000000;
  v36.i64[1] = 0x3E0000003E000000;
  __asm { FMOV            V20.4S, #6.0 }
  do
  {
    float32x4_t v38 = vmulq_f32(vmlaq_f32(vmulq_f32(v17, _Q21), _Q21, v18), v36);
    float32x4_t v39 = vmulq_f32(vaddq_f32(v19, vmlaq_f32(v18, _Q20, v17)), v36);
    float32x4_t v40 = vmulq_f32(vmlaq_f32(vmulq_f32(v19, _Q21), _Q21, v17), v36);
    float32x4_t v41 = vaddq_f32(v20, vmlaq_f32(v17, _Q20, v19));
    float32x4_t v42 = vsubq_f32(v38, v39);
    float32x4_t v43 = vmulq_f32(v42, v42);
    float32x4_t v44 = vsubq_f32(v38, v40);
    float32x4_t v45 = vmulq_f32(v44, v44);
    float32x4_t v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1)));
    float32x4_t v47 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1)));
    float32x4_t v20 = vmulq_f32(v41, v36);
    float32x4_t v48 = vsubq_f32(v38, v20);
    float32x4_t v49 = vmulq_f32(v48, v48);
    float32x4_t v50 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v49.f32, 1);
    if ((vmovn_s32(vcgtq_f32(v46, v47)).u8[0] & 1) == 0) {
      v46.f32[0] = v47.f32[0];
    }
    float v51 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2), vaddq_f32(v49, v50)).f32[0];
    float32x4_t v52 = vsubq_f32(v39, v40);
    float32x4_t v53 = vmulq_f32(v52, v52);
    float32x4_t v54 = vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1));
    if (v51 < v46.f32[0]) {
      float v51 = v46.f32[0];
    }
    float v55 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), v54).f32[0];
    float32x4_t v56 = vsubq_f32(v39, v20);
    float32x4_t v57 = vmulq_f32(v56, v56);
    float32x4_t v58 = vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1));
    float32x4_t v59 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2);
    if (v55 >= v51) {
      float v51 = v55;
    }
    float v60 = vaddq_f32(v59, v58).f32[0];
    float32x4_t v61 = vsubq_f32(v40, v20);
    float32x4_t v62 = vmulq_f32(v61, v61);
    float32x4_t v63 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1);
    if (v60 >= v51) {
      float v51 = v60;
    }
    float v64 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 2), vaddq_f32(v62, v63)).f32[0];
    if (v64 >= v51) {
      float v51 = v64;
    }
    if ((LODWORD(v51) & 0x7FFFFFFFu) >= 0x7F800000) {
      double v65 = 0.0;
    }
    else {
      double v65 = v51;
    }
    BOOL v66 = v6 < v65 && v30 > v65;
    float32x4_t v18 = v38;
    float32x4_t v17 = v39;
    float32x4_t v19 = v40;
    double v30 = v65;
  }
  while (v66);
  if (*((void *)this + 7) != 5) {
    goto LABEL_72;
  }
  __asm
  {
    FMOV            V7.4S, #-3.0
    FMOV            V16.4S, #3.0
  }
  float32x4_t v69 = vsubq_f32(vmlaq_f32(vmlaq_f32(v20, _Q7, v40), _Q16, v39), v38);
  __asm { FMOV            V4.4S, #-6.0 }
  float32x4_t v138 = _Q4;
  float32x4_t v140 = _Q16;
  float32x4_t v71 = vmlaq_f32(vmlaq_f32(vmulq_f32(v39, _Q4), _Q16, v40), _Q16, v38);
  float32x4_t v72 = vmlaq_f32(v71, (float32x4_t)0, v69);
  float32x4_t v142 = _Q7;
  float32x4_t v73 = vmlaq_f32(vmulq_f32(v38, _Q7), _Q16, v40);
  float32x4_t v74 = vaddq_f32(v73, vmlaq_f32(vmulq_f32(v72, (float32x4_t)0), (float32x4_t)0, vmlaq_f32(v71, (float32x4_t)0, vaddq_f32(v69, v69))));
  float32x4_t v75 = vdivq_f32(vmlaq_f32(vaddq_f32(v38, vmlaq_f32(v40, _Q21, v39)), (float32x4_t)0, vmlaq_f32(v73, (float32x4_t)0, v72)), _Q20);
  float32x4_t v76 = vdivq_f32(v74, _Q20);
  int32x4_t v77 = (int32x4_t)vmulq_f32(v76, v76);
  v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
  *(float32x2_t *)v72.f32 = vrsqrte_f32((float32x2_t)v77.u32[0]);
  *(float32x2_t *)v72.f32 = vmul_f32(*(float32x2_t *)v72.f32, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(*(float32x2_t *)v72.f32, *(float32x2_t *)v72.f32)));
  *(float32x4_t *)*((void *)this + 6) = v38;
  *(float32x4_t *)(*((void *)this + 6) + 16) = v39;
  *(float32x4_t *)(*((void *)this + 6) + 32) = v40;
  *(float32x4_t *)(*((void *)this + 6) + 48) = v75;
  *(float32x4_t *)(*((void *)this + 6) + 64) = vmulq_n_f32(v76, vmul_f32(*(float32x2_t *)v72.f32, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(*(float32x2_t *)v72.f32, *(float32x2_t *)v72.f32))).f32[0]);
  float v78 = v2[22];
  float32x4_t v144 = _Q21;
  float32x4_t v146 = _Q20;
  if (v78 <= 0.0)
  {
    unint64_t v81 = 0;
    float v82 = 0.0;
  }
  else
  {
    float v79 = 1.0 / (double)v8;
    float v80 = v78 / v79;
    unint64_t v81 = (unint64_t)v80;
    float v82 = fmodf(v80, 1.0);
    _Q21 = v144;
    _Q20 = v146;
  }
  if (v14 >= v81) {
    unint64_t v83 = v81;
  }
  else {
    unint64_t v83 = v14;
  }
  uint64_t v84 = v4 + 16 * (v7 - v83);
  float32x4_t v86 = *(float32x4_t *)(v84 - 64);
  float32x4_t v85 = *(float32x4_t *)(v84 - 48);
  float32x4_t v87 = *(float32x4_t *)(v84 - 32);
  float32x4_t v88 = *(float32x4_t *)(v84 - 16);
  if (v82 > 0.0)
  {
    float32x4_t v131 = *(float32x4_t *)(v84 - 48);
    float32x4_t v132 = *(float32x4_t *)(v84 - 32);
    float32x4_t v134 = *(float32x4_t *)(v84 - 64);
    float32x4_t v136 = *(float32x4_t *)(v84 - 16);
    float v130 = 1.0 - v82;
    simd_float4x4 v156 = __invert_f4(*(simd_float4x4 *)_PromotedConst);
    uint64_t v89 = 0;
    LODWORD(v90) = 0;
    *((float *)&v90 + 1) = v130;
    *(void *)&long long v91 = 0;
    HIDWORD(v91) = 0;
    *((float *)&v91 + 2) = *((float *)&v90 + 1) * *((float *)&v90 + 1);
    *(void *)&long long v92 = 0;
    DWORD2(v92) = 0;
    *((float *)&v92 + 3) = v130 * (float)(*((float *)&v90 + 1) * *((float *)&v90 + 1));
    long long v147 = xmmword_214498B90;
    long long v148 = v90;
    long long v149 = v91;
    long long v150 = v92;
    do
    {
      *(float32x4_t *)((char *)&v151 + v89) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v156.columns[0], COERCE_FLOAT(*(long long *)((char *)&v147 + v89))), (float32x4_t)v156.columns[1], *(float32x2_t *)((char *)&v147 + v89), 1), (float32x4_t)v156.columns[2], *(float32x4_t *)((char *)&v147 + v89), 2), (float32x4_t)v156.columns[3], *(float32x4_t *)((char *)&v147 + v89), 3);
      v89 += 16;
    }
    while (v89 != 64);
    uint64_t v93 = 0;
    float32x4_t v94 = v151;
    float32x4_t v95 = v152;
    float32x4_t v96 = v153;
    float32x4_t v97 = v154;
    long long v147 = xmmword_214498BC0;
    long long v148 = xmmword_214498BD0;
    long long v149 = xmmword_214498BE0;
    long long v150 = xmmword_214498B80;
    _Q21 = v144;
    _Q20 = v146;
    do
    {
      *(float32x4_t *)((char *)&v151 + v93) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v94, COERCE_FLOAT(*(long long *)((char *)&v147 + v93))), v95, *(float32x2_t *)((char *)&v147 + v93), 1), v96, *(float32x4_t *)((char *)&v147 + v93), 2), v97, *(float32x4_t *)((char *)&v147 + v93), 3);
      v93 += 16;
    }
    while (v93 != 64);
    float32x4_t v86 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v131, v152.f32[0]), v134, v151.f32[0]), v132, v153.f32[0]), v136, v154.f32[0]);
    float32x4_t v85 = vmlaq_lane_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v131, *(float32x2_t *)v152.f32, 1), v134, *(float32x2_t *)v151.f32, 1), v132, *(float32x2_t *)v153.f32, 1), v136, *(float32x2_t *)v154.f32, 1);
    float32x4_t v87 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v131, v152, 2), v134, v151, 2), v132, v153, 2), v136, v154, 2);
    float32x4_t v88 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v131, v152, 3), v134, v151, 3), v132, v153, 3), v136, v154, 3);
  }
  double v98 = 1.79769313e308;
  v99.i64[0] = 0x3E0000003E000000;
  v99.i64[1] = 0x3E0000003E000000;
  do
  {
    float32x4_t v100 = vmulq_f32(vmlaq_f32(vmulq_f32(v87, _Q21), _Q21, v85), v99);
    float32x4_t v86 = vmulq_f32(vaddq_f32(v87, vmlaq_f32(v86, _Q20, v85)), v99);
    float32x4_t v101 = vmulq_f32(vaddq_f32(v88, vmlaq_f32(v85, _Q20, v87)), v99);
    float32x4_t v88 = vmulq_f32(vmlaq_f32(vmulq_f32(v88, _Q21), _Q21, v87), v99);
    float32x4_t v102 = vsubq_f32(v86, v100);
    float32x4_t v103 = vmulq_f32(v102, v102);
    float32x4_t v104 = vsubq_f32(v86, v101);
    float32x4_t v105 = vmulq_f32(v104, v104);
    float32x4_t v106 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1)));
    float32x4_t v107 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v105, 2), vaddq_f32(v105, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v105.f32, 1)));
    float32x4_t v108 = vsubq_f32(v86, v88);
    float32x4_t v109 = vmulq_f32(v108, v108);
    LODWORD(v110) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v109, 2), vaddq_f32(v109, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v109.f32, 1))).u32[0];
    if ((vmovn_s32(vcgtq_f32(v106, v107)).u8[0] & 1) == 0) {
      v106.f32[0] = v107.f32[0];
    }
    float32x4_t v111 = vsubq_f32(v100, v101);
    float32x4_t v112 = vmulq_f32(v111, v111);
    LODWORD(v113) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 2), vaddq_f32(v112, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v112.f32, 1))).u32[0];
    float32x4_t v114 = vsubq_f32(v100, v88);
    float32x4_t v115 = vmulq_f32(v114, v114);
    if (v110 >= v106.f32[0]) {
      v106.f32[0] = v110;
    }
    LODWORD(v116) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).u32[0];
    float32x4_t v117 = vsubq_f32(v101, v88);
    float32x4_t v118 = vmulq_f32(v117, v117);
    float32x4_t v119 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1);
    if (v113 >= v106.f32[0]) {
      v106.f32[0] = v113;
    }
    LODWORD(v120) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, v119)).u32[0];
    if (v116 >= v106.f32[0]) {
      v106.f32[0] = v116;
    }
    if (v120 >= v106.f32[0]) {
      v106.f32[0] = v120;
    }
    if ((v106.i32[0] & 0x7FFFFFFFu) >= 0x7F800000) {
      double v121 = 0.0;
    }
    else {
      double v121 = v106.f32[0];
    }
    BOOL v122 = v6 < v121 && v98 > v121;
    float32x4_t v85 = v100;
    float32x4_t v87 = v101;
    double v98 = v121;
  }
  while (v122);
  if (*((void *)this + 9) == 5)
  {
    float32x4_t v123 = vsubq_f32(vmlaq_f32(vmlaq_f32(v88, v142, v101), v140, v100), v86);
    float32x4_t v124 = vmlaq_f32(vmlaq_f32(vmulq_f32(v100, v138), v140, v101), v140, v86);
    float32x4_t v125 = vaddq_f32(v124, v123);
    float32x4_t v126 = vmlaq_f32(vmulq_f32(v86, v142), v140, v101);
    float32x4_t v127 = vdivq_f32(vaddq_f32(vaddq_f32(v86, vmlaq_f32(v101, _Q21, v100)), vaddq_f32(v126, v125)), _Q20);
    float32x4_t v128 = vdivq_f32(vaddq_f32(v126, vaddq_f32(v125, vaddq_f32(v124, vaddq_f32(v123, v123)))), _Q20);
    int32x4_t v129 = (int32x4_t)vmulq_f32(v128, v128);
    v129.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v129, 2), vadd_f32(*(float32x2_t *)v129.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v129.i8, 1))).u32[0];
    *(float32x2_t *)v125.f32 = vrsqrte_f32((float32x2_t)v129.u32[0]);
    *(float32x2_t *)v125.f32 = vmul_f32(*(float32x2_t *)v125.f32, vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(*(float32x2_t *)v125.f32, *(float32x2_t *)v125.f32)));
    *(float32x4_t *)*((void *)this + 8) = v100;
    *(float32x4_t *)(*((void *)this + 8) + 16) = v101;
    *(float32x4_t *)(*((void *)this + 8) + 32) = v88;
    *(float32x4_t *)(*((void *)this + 8) + 48) = v127;
    *(float32x4_t *)(*((void *)this + 8) + 64) = vmulq_n_f32(v128, vmul_f32(*(float32x2_t *)v125.f32, vrsqrts_f32((float32x2_t)v129.u32[0], vmul_f32(*(float32x2_t *)v125.f32, *(float32x2_t *)v125.f32))).f32[0]);
  }
  else
  {
LABEL_72:
    __break(1u);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, void *a2, long long **a3)
{
  uint64_t v3 = *(void *)(a1 + 688);
  if (*a2 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*(void *)(a1 + 696) - v3) >> 3))) {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state((void *)(v3 + 56 * *a2), a3);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(void *a1, long long **a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (a1[3] == v2 - *a2)
  {
    if (v3 != v2)
    {
      uint64_t v4 = a1[2];
      do
      {
        long long v5 = *v3++;
        *(_DWORD *)(v4 + 8) = DWORD2(v5);
        *(void *)uint64_t v4 = v5;
        v4 += 16;
      }
      while (v3 != v2);
    }
    double v6 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)a1[4];
    uint64_t v7 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)a1[5];
    while (v6 != v7)
    {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::update_caps(v6);
      double v6 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)((char *)v6 + 80);
    }
  }
  else
  {
    __break(1u);
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(uint64_t a1, void *a2, LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 688);
  if (*a2 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*(void *)(a1 + 696) - v3) >> 3)))
  {
    unint64_t v4 = a2[1];
    double v6 = (uint64_t *)(v3 + 56 * *a2 + 32);
    uint64_t v5 = *v6;
    if (v4 < 0xCCCCCCCCCCCCCCCDLL * ((v6[1] - *v6) >> 4)) {
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t::set_state((LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t *)(v5 + 80 * v4), a3, 0);
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_render_pass_descriptor(uint64_t a1, void *a2)
{
  id v23 = a2;
  uint64_t v3 = [v23 texture];
  uint64_t v4 = [v3 width];
  uint64_t v5 = [v3 height];
  if (*(void *)(a1 + 608) != v4 || *(void *)(a1 + 616) != v5)
  {
    *(void *)(a1 + 608) = v4;
    *(void *)(a1 + 616) = v5;
    double v6 = *(void **)(a1 + 536);
    *(void *)(a1 + 536) = 0;

    uint64_t v7 = *(void **)(a1 + 624);
    *(void *)(a1 + 624) = 0;

    unint64_t v8 = *(void **)(a1 + 632);
    *(void *)(a1 + 632) = 0;

    uint64_t v4 = *(void *)(a1 + 608);
    uint64_t v5 = *(void *)(a1 + 616);
  }
  if (v5 * v4)
  {
    id v9 = *(id *)(a1 + 24);
    int v10 = [v9 supportsTextureSampleCount:4];
    unint64_t v11 = *(void **)(a1 + 536);
    simd_float4x4 v12 = v11;
    if (!v11)
    {
      if (v10)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v3, "pixelFormat"), *(void *)(a1 + 608), *(void *)(a1 + 616), 0);
        [v13 setTextureType:4];
        [v13 setSampleCount:4];
        [v13 setUsage:0];
        [v13 setStorageMode:2];
        uint64_t v14 = [v9 newTextureWithDescriptor:v13];
        unint64_t v15 = *(void **)(a1 + 624);
        *(void *)(a1 + 624) = v14;
      }
      id v16 = objc_alloc_init(MEMORY[0x263F129A0]);
      float32x4_t v17 = *(void **)(a1 + 536);
      *(void *)(a1 + 536) = v16;

      simd_float4x4 v12 = *(void **)(a1 + 536);
    }
    float32x4_t v18 = [v12 colorAttachments];
    float32x4_t v19 = [v18 objectAtIndexedSubscript:0];
    float32x4_t v20 = v19;
    if (v11)
    {
      if (!v10) {
        goto LABEL_16;
      }
    }
    else
    {
      [v19 setLoadAction:2];
      objc_msgSend(v20, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      if (!v10)
      {
        [v20 setStoreAction:1];
LABEL_16:
        [v20 setTexture:v3];
LABEL_17:
        if (!v11 && *(void *)(a1 + 632))
        {
          uint64_t v21 = [*(id *)(a1 + 536) depthAttachment];
          [v21 setTexture:*(void *)(a1 + 632)];
          [v21 setLoadAction:2];
          [v21 setStoreAction:0];
          [v21 setClearDepth:1.0];
          unint64_t v22 = [*(id *)(a1 + 536) stencilAttachment];
          [v22 setTexture:*(void *)(a1 + 632)];
          [v22 setLoadAction:2];
          [v22 setStoreAction:0];
          [v22 setClearStencil:0];
        }
        goto LABEL_21;
      }
      [v20 setStoreAction:2];
    }
    [v20 setTexture:*(void *)(a1 + 624)];
    [v20 setResolveTexture:v3];
    goto LABEL_17;
  }
LABEL_21:
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  if (!*((unsigned char *)this + 8) && *((void *)this + 87) != *((void *)this + 86))
  {
    uint64_t v2 = *((void *)this + 85) + 1;
    *((void *)this + 85) = v2;
    int v3 = atomic_load((unsigned __int8 *)this + 592);
    int v4 = v3 + 1 - 3 * ((1431655766 * (unint64_t)(v3 + 1)) >> 32);
    unsigned int v5 = atomic_load(*((unsigned __int8 **)this + 72));
    int v6 = v5 - 3 * ((1431655766 * (unint64_t)v5) >> 32);
    if (v4 == v6) {
      NSLog(&cfstr_Cubicbsplinere.isa, this, v2);
    }
    if ([*((id *)this + 2) isDrawableAvailable])
    {
      uint64_t v7 = [*((id *)this + 2) currentDrawable];
    }
    else
    {
      uint64_t v7 = 0;
    }
    float32x4_t v153 = [v7 texture];
    if (v4 != v6)
    {
      unint64_t v8 = @"CubicBSplineRenderer (%p): missing drawable, dropping frame %llu.";
      if (v7)
      {
        id v9 = this;
        if (v153)
        {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_render_pass_descriptor((uint64_t)this, v7);
          if (*((void *)this + 67))
          {
            LAUI_uniform_cubic_b_spline_renderer::renderer_t::rebuild_cap_control_point_indices(this);
            int add = atomic_fetch_add((atomic_uchar *volatile)this + 592, 1u);
            unsigned int v11 = 3 * ((171 * add) >> 9);
            if (3 * ((171 * add) >> 9)) {
              atomic_fetch_add((atomic_uchar *volatile)this + 592, 0xFDu);
            }
            id v12 = *((id *)this + 3);
            long long v149 = [*((id *)this + 66) commandBuffer];
            uint64_t v13 = this;
            if (!*((void *)this + 75))
            {
              uint64_t v14 = [v149 computeCommandEncoder];
              id v15 = *((id *)this + 5);
              [v14 setComputePipelineState:v15];

              uint64_t v16 = [v12 newBufferWithLength:60 options:33];
              float32x4_t v17 = (void *)*((void *)this + 75);
              *((void *)this + 75) = v16;

              [v14 setBuffer:*((void *)this + 75) offset:0 atIndex:0];
              int64x2_t v186 = vdupq_n_s64(1uLL);
              uint64_t v187 = 1;
              int64x2_t v184 = v186;
              uint64_t v185 = 1;
              [v14 dispatchThreadgroups:&v186 threadsPerThreadgroup:&v184];
              [v14 endEncoding];

              uint64_t v13 = this;
            }
            uint64_t v18 = *((void *)v13 + 69);
            uint64_t v147 = [v153 width];
            uint64_t v146 = [v153 height];
            unsigned int v19 = (add - v11);
            float32x4_t v20 = (id *)(v18 + 48 * (add - v11));
            float v21 = *((float *)this + 181);
            BOOL v22 = 1;
            if (*((float *)this + 180) >= 1.0 && v21 <= 0.0) {
              BOOL v22 = *((float *)this + 182) > 0.0;
            }
            v161 = (id *)(v18 + 48 * v19 + 8);
            float32x4_t v145 = (id *)(v18 + 48 * v19 + 16);
            long long v148 = v20;
            uint64_t v23 = v18 + 48 * v19;
            id v24 = v12;
            uint64_t v25 = this;
            float32x4_t v26 = (unsigned char *)*((void *)this + 99);
            float32x4_t v27 = (unsigned char *)*((void *)this + 98);
            id v28 = v24;
            float v31 = *(void **)(v23 + 32);
            double v30 = (id *)(v23 + 32);
            float32x4_t v29 = v31;
            if (!v31 || [v29 length] != v26 - v27)
            {
              if (v26 == v27) {
                uint64_t v32 = 0;
              }
              else {
                uint64_t v32 = [v28 newBufferWithLength:v26 - v27 options:1];
              }
              id v34 = *v30;
              *double v30 = (id)v32;
            }
            if (*v30) {
              memcpy((void *)[*v30 contents], v27, v26 - v27);
            }

            uint64_t v35 = v18 + 48 * v19;
            float64x2_t v122 = *((float64x2_t *)this + 9);
            float64x2_t v123 = *((float64x2_t *)this + 11);
            float64x2_t v124 = *((float64x2_t *)this + 10);
            float64x2_t v125 = *((float64x2_t *)this + 13);
            float64x2_t v126 = *((float64x2_t *)this + 12);
            float64x2_t v128 = *((float64x2_t *)this + 14);
            float64x2_t v129 = *((float64x2_t *)this + 16);
            float64x2_t v127 = *((float64x2_t *)this + 15);
            float64x2_t v135 = *((float64x2_t *)this + 20);
            float64x2_t v136 = *((float64x2_t *)this + 18);
            float64x2_t v132 = *((float64x2_t *)this + 19);
            float64x2_t v133 = *((float64x2_t *)this + 17);
            float64x2_t v134 = *((float64x2_t *)this + 22);
            float64x2_t v130 = *((float64x2_t *)this + 23);
            float64x2_t v131 = *((float64x2_t *)this + 21);
            float64x2_t v150 = *((float64x2_t *)this + 26);
            float64x2_t v137 = *((float64x2_t *)this + 25);
            float64x2_t v138 = *((float64x2_t *)this + 27);
            float64x2_t v139 = *((float64x2_t *)this + 24);
            float64x2_t v158 = *((float64x2_t *)this + 30);
            float64x2_t v142 = *((float64x2_t *)this + 29);
            float64x2_t v143 = *((float64x2_t *)this + 28);
            float64x2_t v154 = *((float64x2_t *)this + 32);
            float64x2_t v140 = *((float64x2_t *)this + 31);
            id v157 = v28;
            float32x4_t v38 = *(void **)(v35 + 40);
            unint64_t v37 = (id *)(v35 + 40);
            float32x4_t v36 = v38;
            if (!v38 || [v36 length] != 192)
            {
              uint64_t v39 = [v157 newBufferWithLength:192 options:1];
              id v40 = *v37;
              *unint64_t v37 = (id)v39;
            }
            if (*v37)
            {
              float32x4_t v41 = (float32x4_t *)[*v37 contents];
              *float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v122), v124);
              v41[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v123), v126);
              v41[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v125), v128);
              v41[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v127), v129);
              v41[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v133), v136);
              v41[5] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v132), v135);
              v41[6] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v131), v134);
              v41[7] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v130), v139);
              v41[8] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v137), v150);
              v41[9] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v138), v143);
              v41[10] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v142), v158);
              v41[11] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v140), v154);
            }
            float32x4_t v151 = v37;
            simd_float4x4 v155 = v30;

            char v42 = 0;
            char v43 = 0;
            uint64_t v44 = 0;
            id v45 = 0;
            BOOL v144 = v22;
            char v46 = v21 > 0.0 || v22;
            char v141 = v46;
            v159 = (char *)this + 648;
            while (2)
            {
              float32x4_t v47 = (char *)this + 648;
              while (1)
              {
                uint64_t v48 = v44;
                float32x4_t v49 = *(void **)&v47[8 * v44];
                if (v49)
                {
                  if ([v49 width] == v147 && objc_msgSend(*(id *)&v159[8 * v48], "height") == v146) {
                    break;
                  }
                }
                uint64_t v50 = [*((id *)this + 2) pixelFormat];
                if (v45)
                {
                  [v45 setPixelFormat:v50];
                }
                else
                {
                  id v45 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v50 width:v147 height:v146 mipmapped:0];
                  [v45 setStorageMode:2];
                  [v45 setUsage:7];
                }
                id v45 = v45;
                uint64_t v51 = [v157 newTextureWithDescriptor:v45];
                float32x4_t v47 = (char *)this + 648;
                float32x4_t v52 = *(void **)&v159[8 * v48];
                *(void *)&v159[8 * v48] = v51;

                char v43 = 1;
                uint64_t v44 = 1;
                if (v48)
                {
                  if ((v42 & 1) == 0)
                  {
                    *((void *)this + 83) = 0;
                    *((unsigned char *)this + 640) = 0;
                    goto LABEL_67;
                  }
                  goto LABEL_57;
                }
              }
              char v42 = 1;
              uint64_t v44 = 1;
              if (!v48) {
                continue;
              }
              break;
            }
            if (v43)
            {
LABEL_57:

              goto LABEL_58;
            }

            if (v141) {
              goto LABEL_68;
            }
LABEL_58:
            if (!*((unsigned char *)this + 640)) {
              goto LABEL_68;
            }
            *((void *)this + 83) = 0;
            *((unsigned char *)this + 640) = 0;
            float32x4_t v53 = (void *)*((void *)this + 68);
            if (!v53)
            {
              id v54 = objc_alloc_init(MEMORY[0x263F129A0]);
              float v55 = (void *)*((void *)this + 68);
              *((void *)this + 68) = v54;

              float32x4_t v56 = [*((id *)this + 68) colorAttachments];
              uint64_t v57 = 0;
              char v58 = 1;
              do
              {
                char v59 = v58;
                float v60 = [v56 objectAtIndexedSubscript:v57];
                [v60 setLoadAction:2];
                objc_msgSend(v60, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
                [v60 setStoreAction:1];

                char v58 = 0;
                uint64_t v57 = 1;
              }
              while ((v59 & 1) != 0);

              float32x4_t v53 = (void *)*((void *)this + 68);
            }
            id v45 = [v53 colorAttachments];
            uint64_t v61 = 0;
            char v62 = 1;
            do
            {
              char v63 = v62;
              float v64 = [v45 objectAtIndexedSubscript:v61];
              [v64 setTexture:*(void *)&v159[8 * v61]];

              char v62 = 0;
              uint64_t v61 = 1;
            }
            while ((v63 & 1) != 0);
            double v65 = [v149 renderCommandEncoderWithDescriptor:*((void *)this + 68)];
            [v65 endEncoding];

            uint64_t v25 = this;
LABEL_67:

LABEL_68:
            id v183 = [v149 renderCommandEncoderWithDescriptor:*((void *)v25 + 67)];
            [v183 setTriangleFillMode:*((unsigned __int8 *)this + 128)];
            id v66 = *((id *)this + 4);
            if (v66)
            {
              [v183 setDepthStencilState:v66];
              [v183 setFrontFacingWinding:0];
              [v183 setCullMode:2];
            }

            [v183 setVertexBuffer:*v148 offset:0 atIndex:0];
            [v183 setVertexBuffer:*v155 offset:0 atIndex:1];
            [v183 setVertexBuffer:*v151 offset:0 atIndex:2];
            char v182 = 0;
            id v67 = *((id *)this + 6);
            [v183 setRenderPipelineState:v67];

            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:0 instanceStride:0];
            uint64_t v68 = (void *)*((void *)this + 86);
            simd_float4x4 v156 = (void *)*((void *)this + 87);
            float32x4_t v152 = v7;
            if (v68 != v156)
            {
              uint64_t v69 = 0;
              uint64_t v70 = 0;
              uint64_t v71 = 0;
              do
              {
                unint64_t v72 = v68[1];
                if (v72 <= 3) {
                  unint64_t v72 = 3;
                }
                unint64_t v73 = v72 - 3;
                uint64_t v75 = v68[4];
                uint64_t v74 = v68[5];
                uint64_t v76 = v74 - v75;
                if (v74 != v75)
                {
                  [v183 setVertexBufferOffset:v71 atIndex:1];
                  unint64_t v77 = 0xCCCCCCCCCCCCCCCDLL * (v76 >> 4);
                  uint64_t v78 = *((void *)this + 98) + 96 * v70;
                  float v79 = (float *)(v78 - 0x3333333333333320 * (v76 >> 4));
                  float v80 = (float *)v78;
                  do
                  {
                    while (v80[19] < 0.0039216 || (float)(v80[21] + v80[22]) >= 1.0)
                    {
                      v80 += 24;
                      if (v80 == v79) {
                        goto LABEL_95;
                      }
                    }
                    float v82 = v79;
                    if (v80 != v79)
                    {
                      float v82 = v80;
                      while (v82[19] >= 0.0039216 && (float)(v82[21] + v82[22]) < 1.0)
                      {
                        v82 += 24;
                        if (v82 == v79)
                        {
                          float v82 = v79;
                          break;
                        }
                      }
                    }
                    if (v80 != v79 && v80 != v82) {
                      [v183 drawIndexedPatches:4 patchStart:0 patchCount:v73 patchIndexBuffer:0 patchIndexBufferOffset:0 controlPointIndexBuffer:*v161 controlPointIndexBufferOffset:v69 instanceCount:0xAAAAAAAAAAAAAAABLL * (((char *)v82 - (char *)v80) >> 5) baseInstance:0xAAAAAAAAAAAAAAABLL * (((uint64_t)v80 - v78) >> 5)];
                    }
                    float v80 = v82;
                  }
                  while (v82 != v79);
LABEL_95:
                  v70 += v77;
                  v71 += 96 * v77;
                  uint64_t v7 = v152;
                }
                v69 += 8 * v73;
                v68 += 7;
              }
              while (v68 != v156);
            }
            [v183 setVertexBuffer:*v145 offset:0 atIndex:0];
            uint64_t v180 = 3;
            uint64_t v181 = 0;
            uint64_t v178 = 0;
            uint64_t v179 = 0;
            [v183 setRenderPipelineState:*((void *)this + 7)];
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:12 instanceStride:0];
            uint64_t v84 = *((void *)this + 86);
            uint64_t v85 = *((void *)this + 87);
            v177[0] = &v183;
            v177[1] = &v178;
            v177[2] = &v182;
            v177[3] = this;
            v177[4] = &v179;
            v177[5] = &v180;
            v177[6] = v148;
            v177[7] = &v181;
            *(void *)&double v86 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v84, v85, (uint64_t)v177, (uint64_t)v176).n128_u64[0];
            uint64_t v179 = 0;
            uint64_t v180 = 4;
            uint64_t v178 = 0;
            objc_msgSend(v183, "setRenderPipelineState:", *((void *)this + 8), v86);
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:36 instanceStride:0];
            uint64_t v87 = *((void *)this + 86);
            uint64_t v88 = *((void *)this + 87);
            v175[0] = &v183;
            v175[1] = &v178;
            v175[2] = &v182;
            v175[3] = this;
            v175[4] = &v179;
            v175[5] = &v180;
            v175[6] = v148;
            v175[7] = &v181;
            *(void *)&double v89 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v87, v88, (uint64_t)v175, (uint64_t)v176).n128_u64[0];
            uint64_t v179 = 0;
            uint64_t v180 = 5;
            uint64_t v178 = 0;
            objc_msgSend(v183, "setRenderPipelineState:", *((void *)this + 9), v89);
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:48 instanceStride:0];
            uint64_t v90 = *((void *)this + 86);
            uint64_t v91 = *((void *)this + 87);
            v174[0] = &v183;
            v174[1] = &v178;
            v174[2] = &v182;
            v174[3] = this;
            v174[4] = &v179;
            v174[5] = &v180;
            v174[6] = v148;
            v174[7] = &v181;
            *(void *)&double v92 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v90, v91, (uint64_t)v174, (uint64_t)v176).n128_u64[0];
            uint64_t v179 = 0;
            uint64_t v180 = 3;
            uint64_t v178 = 0;
            objc_msgSend(v183, "setRenderPipelineState:", *((void *)this + 10), v92);
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:24 instanceStride:0];
            uint64_t v93 = *((void *)this + 86);
            uint64_t v94 = *((void *)this + 87);
            v173[0] = &v183;
            v173[1] = &v178;
            v173[2] = &v182;
            v173[3] = this;
            v173[4] = &v179;
            v173[5] = &v180;
            v173[6] = v148;
            v173[7] = &v181;
            *(void *)&double v95 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v93, v94, (uint64_t)v173, (uint64_t)v176).n128_u64[0];
            uint64_t v179 = 0;
            uint64_t v180 = 4;
            uint64_t v178 = 0;
            objc_msgSend(v183, "setRenderPipelineState:", *((void *)this + 11), v95);
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:36 instanceStride:0];
            uint64_t v96 = *((void *)this + 86);
            uint64_t v97 = *((void *)this + 87);
            v172[0] = &v183;
            v172[1] = &v178;
            v172[2] = &v182;
            v172[3] = this;
            v172[4] = &v179;
            v172[5] = &v180;
            v172[6] = v148;
            v172[7] = &v181;
            *(void *)&double v98 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v96, v97, (uint64_t)v172, (uint64_t)v176).n128_u64[0];
            uint64_t v179 = 0;
            uint64_t v180 = 5;
            uint64_t v178 = 0;
            objc_msgSend(v183, "setRenderPipelineState:", *((void *)this + 12), v98);
            [v183 setTessellationFactorBuffer:*((void *)this + 75) offset:48 instanceStride:0];
            uint64_t v99 = *((void *)this + 86);
            uint64_t v100 = *((void *)this + 87);
            v171[0] = &v183;
            v171[1] = &v178;
            v171[2] = &v182;
            v171[3] = this;
            v171[4] = &v179;
            v171[5] = &v180;
            v171[6] = v148;
            v171[7] = &v181;
            *(void *)&double v101 = std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>(v99, v100, (uint64_t)v171, (uint64_t)v176).n128_u64[0];
            objc_msgSend(v183, "endEncoding", v101);
            int v102 = v21 > 0.0 || v144;
            if (v102 == 1)
            {
              float32x4_t v103 = [v149 computeCommandEncoder];
              if (v144)
              {
                float32x4_t v104 = this;
                if (*((unsigned char *)this + 640))
                {
                  id v105 = *(id *)&v159[8 * *((void *)this + 83)];
                  float32x4_t v106 = v105;
                  if (v105)
                  {
                    if ([v105 width] != v147 && objc_msgSend(v106, "height") != v146)
                    {

                      float32x4_t v106 = 0;
                    }
                    float32x4_t v104 = this;
                  }
                }
                else
                {
                  float32x4_t v106 = 0;
                }
                id v107 = *((id *)v104 + 15);
                [v103 setComputePipelineState:v107];

                [v103 setBytes:(char *)this + 720 length:12 atIndex:0];
                [v103 setTexture:v153 atIndex:0];
                [v103 setTexture:v106 atIndex:1];
                id v108 = *((id *)this + 15);
                unint64_t v109 = [v108 threadExecutionWidth];
                unint64_t v110 = [v108 maxTotalThreadsPerThreadgroup] / v109;

                v170[0] = (v147 + v109 - 1) / v109;
                v170[1] = (v146 + v110 - 1) / v110;
                v170[2] = 1;
                v169[0] = v109;
                v169[1] = v110;
                v169[2] = 1;
                [v103 dispatchThreadgroups:v170 threadsPerThreadgroup:v169];
                uint64_t v7 = v152;
              }
              if (v21 > 0.0)
              {
                *((unsigned char *)this + 640) = 1;
                id v111 = *((id *)this + 13);
                [v103 setComputePipelineState:v111];

                [v103 setBytes:(char *)this + 732 length:4 atIndex:0];
                *((void *)this + 83) = (*((_DWORD *)this + 166) & 1) == 0;
                [v103 setTexture:v153 atIndex:0];
                [v103 setTexture:*(void *)&v159[8 * *((void *)this + 83)] atIndex:1];
                id v112 = *((id *)this + 13);
                unint64_t v113 = [v112 threadExecutionWidth];
                unint64_t v114 = [v112 maxTotalThreadsPerThreadgroup] / v113;

                v168[0] = (v113 + v147 - 1) / v113;
                v168[1] = (v114 + v146 - 1) / v114;
                v168[2] = 1;
                v167[0] = v113;
                v167[1] = v114;
                v167[2] = 1;
                [v103 dispatchThreadgroups:v168 threadsPerThreadgroup:v167];
                id v115 = *((id *)this + 14);
                [v103 setComputePipelineState:v115];

                [v103 setTexture:*(void *)&v159[8 * *((void *)this + 83)] atIndex:0];
                BOOL v116 = (*((_DWORD *)this + 166) & 1) == 0;
                *((void *)this + 83) = v116;
                [v103 setTexture:*(void *)&v159[8 * v116] atIndex:1];
                id v117 = *((id *)this + 14);
                unint64_t v118 = [v117 threadExecutionWidth];
                unint64_t v119 = [v117 maxTotalThreadsPerThreadgroup] / v118;

                v166[0] = (v118 + v147 - 1) / v118;
                v166[1] = (v119 + v146 - 1) / v119;
                v166[2] = 1;
                v165[0] = v118;
                v165[1] = v119;
                v165[2] = 1;
                [v103 dispatchThreadgroups:v166 threadsPerThreadgroup:v165];
              }
              [v103 endEncoding];
            }
            [v149 presentDrawable:v7];
            v162[0] = MEMORY[0x263EF8330];
            v162[1] = 3321888768;
            v162[2] = ___ZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEv_block_invoke;
            v162[3] = &__block_descriptor_48_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7_e28_v16__0___MTLCommandBuffer__8l;
            uint64_t v120 = *((void *)this + 72);
            double v121 = (std::__shared_weak_count *)*((void *)this + 73);
            if (v121)
            {
              atomic_fetch_add_explicit(&v121->__shared_owners_, 1uLL, memory_order_relaxed);
              uint64_t v163 = v120;
              unint64_t v164 = v121;
              atomic_fetch_add_explicit(&v121->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            else
            {
              uint64_t v163 = *((void *)this + 72);
              unint64_t v164 = 0;
            }
            [v149 addCompletedHandler:v162];
            if (v121) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v121);
            }
            [v149 commit];
            if (v164) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v164);
            }

            uint64_t v1 = 1;
            goto LABEL_28;
          }
          unint64_t v8 = @"CubicBSplineRenderer (%p): missing render pass descriptor, dropping frame %llu.";
        }
      }
      else
      {
        id v9 = this;
      }
      NSLog(&v8->isa, v9, v2);
    }
    uint64_t v1 = 0;
LABEL_28:

    return v1;
  }
  return 1;
}

void sub_21447DF4C(void *a1)
{
  __clang_call_terminate(a1);
}

void anonymous namespace'::copy_into_buffer<std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = *(const void **)a2;
  uint64_t v7 = *(const void **)(a2 + 8);
  size_t v8 = (size_t)v7 - *(void *)a2;
  id v11 = v5;
  if (!*a1 || [*a1 length] != v8)
  {
    if (v7 == v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v11 newBufferWithLength:v8 options:1];
    }
    id v10 = *a1;
    *a1 = (id)v9;
  }
  if (*a1) {
    memcpy((void *)[*a1 contents], v6, v8);
  }
}

void sub_21447E070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void anonymous namespace'::copy_into_buffer<std::vector<unsigned short>>(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = *(const void **)a2;
  uint64_t v7 = *(const void **)(a2 + 8);
  size_t v8 = (size_t)v7 - *(void *)a2;
  id v11 = v5;
  if (!*a1 || [*a1 length] != v8)
  {
    if (v7 == v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v11 newBufferWithLength:v8 options:1];
    }
    id v10 = *a1;
    *a1 = (id)v9;
  }
  if (*a1) {
    memcpy((void *)[*a1 contents], v6, v8);
  }
}

void sub_21447E14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 std::for_each[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t *>,LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(void)::$_2>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a1 != a2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = **(void **)(a3 + 8);
    do
    {
      uint64_t v8 = *(void *)(a3 + 24);
      uint64_t v10 = *(void *)(v6 + 32);
      uint64_t v9 = *(void *)(v6 + 40);
      [**(id **)a3 setVertexBufferOffset:v7 atIndex:1];
      BOOL v11 = v9 == v10;
      uint64_t v12 = (unsigned __int128)((v9 - v10) * (__int128)0x6666666666666667) >> 64;
      unint64_t v13 = (v9 - v10) / 80;
      if (!v11)
      {
        uint64_t v14 = 0;
        if (v13 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = (v12 >> 5) + ((unint64_t)v12 >> 63);
        }
        uint64_t v16 = *(void **)(a3 + 40);
        float32x4_t v17 = *(void **)(a3 + 56);
        do
        {
          uint64_t v18 = (float *)(*(void *)(v8 + 784) + 96 * (v14 + **(void **)(a3 + 32)));
          if (v18[19] >= 0.0039216 && (float)(v18[21] + v18[22]) < 1.0)
          {
            [**(id **)a3 drawIndexedPatches:*v16 patchStart:0 patchCount:1 patchIndexBuffer:0 patchIndexBufferOffset:0 controlPointIndexBuffer:*(void *)(*(void *)(a3 + 48) + 24) controlPointIndexBufferOffset:*v17 instanceCount:1 baseInstance:v14];
            uint64_t v16 = *(void **)(a3 + 40);
            float32x4_t v17 = *(void **)(a3 + 56);
          }
          *v17 += 2 * *v16;
          ++v14;
        }
        while (v15 != v14);
      }
      **(void **)(a3 + 32) += v13;
      float32x4_t v20 = *(uint64_t **)(a3 + 8);
      uint64_t v7 = *v20 + 96 * v13;
      *float32x4_t v20 = v7;
      v6 += 56;
    }
    while (v6 != a2);
  }
  long long v21 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a3;
  *(_OWORD *)(a4 + 16) = v21;
  __n128 result = *(__n128 *)(a3 + 32);
  long long v23 = *(_OWORD *)(a3 + 48);
  *(__n128 *)(a4 + 32) = result;
  *(_OWORD *)(a4 + 48) = v23;
  return result;
}

uint64_t ___ZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEv_block_invoke(uint64_t result)
{
  if (3 * (atomic_fetch_add(*(atomic_uchar *volatile *)(result + 32), 1u) / 3u)) {
    atomic_fetch_add(*(atomic_uchar *volatile *)(result + 32), 0xFDu);
  }
  return result;
}

uint64_t __copy_helper_block_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_ea8_32c71_ZTSKZN36LAUI_uniform_cubic_b_spline_renderer10renderer_t6renderEvE3__7(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

id LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)a1 = result;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  if (result)
  {

    return (id)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *this, const shared_state_t *a2)
{
  *(void *)this = a2->_device;
  *((void *)this + 1) = a2->_depth_stencil_state;
  *((void *)this + 2) = a2->_tesselation_factor_pipeline;
  *((void *)this + 3) = a2->_tube_pipeline;
  for (uint64_t i = 32; i != 56; i += 8)
    *(void *)((char *)this + i) = *(id *)((char *)&a2->_device + i);
  do
  {
    *(void *)((char *)this + i) = *(id *)((char *)&a2->_device + i);
    i += 8;
  }
  while (i != 80);
  *((void *)this + 10) = a2->_horizontal_blur_pipeline;
  *((void *)this + 11) = a2->_vertical_blur_pipeline;
  *((void *)this + 12) = a2->_accumulator_pipeline;
  return this;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v18[4] = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>>(v7, v9);
  BOOL v11 = &v10[48 * v4];
  v18[0] = v10;
  v18[1] = v11;
  v18[3] = &v10[48 * v12];
  long long v13 = *a2;
  *a2 = 0u;
  *(_OWORD *)BOOL v11 = v13;
  long long v14 = a2[1];
  a2[1] = 0u;
  *((_OWORD *)v11 + 1) = v14;
  long long v15 = a2[2];
  a2[2] = 0u;
  *((_OWORD *)v11 + 2) = v15;
  v18[2] = v11 + 48;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__swap_out_circular_buffer(a1, v18);
  uint64_t v16 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer((uint64_t)v18);
  return v16;
}

void sub_21447E568(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>>((uint64_t)(a1 + 2), a1[1], (_OWORD *)a1[1], *a1, (_OWORD *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t*>>(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, _OWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t result = a6;
  if (a3 != a5)
  {
    unint64_t v9 = (_OWORD *)(a7 - 16);
    do
    {
      long long v10 = *(a3 - 3);
      a3 -= 3;
      *a3 = 0uLL;
      *(v9 - 2) = v10;
      long long v11 = a3[1];
      a3[1] = 0uLL;
      *(v9 - 1) = v11;
      long long v12 = a3[2];
      a3[2] = 0uLL;
      _OWORD *v9 = v12;
      v9 -= 3;
      v7 -= 48;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>(void **a1)
{
  uint64_t v2 = *a1;
}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>((void **)(i - 48));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__emplace_back_slow_path<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t const&,std::span<LAUI_uniform_cubic_b_spline_renderer_private::control_point,18446744073709551615ul> const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&>(uint64_t *a1, void *a2, uint64_t *a3, long long *a4, long long **a5)
{
  uint64_t v6 = *a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x492492492492492) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = (uint64_t)(a1 + 2);
  unint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v6) >> 3);
  if (2 * v14 > v8) {
    unint64_t v8 = 2 * v14;
  }
  if (v14 >= 0x249249249249249) {
    unint64_t v15 = 0x492492492492492;
  }
  else {
    unint64_t v15 = v8;
  }
  v22[4] = a1 + 2;
  if (v15) {
    uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>>(v13, v15);
  }
  else {
    uint64_t v16 = 0;
  }
  float32x4_t v17 = &v16[56 * v7];
  v22[0] = v16;
  v22[1] = v17;
  v22[3] = &v16[56 * v15];
  long long v18 = *a4;
  *(void *)float32x4_t v17 = *a2;
  uint64_t v19 = *a3;
  *((void *)v17 + 1) = *a3;
  *((_OWORD *)v17 + 1) = v18;
  *((void *)v17 + 5) = 0;
  *((void *)v17 + 6) = 0;
  *((void *)v17 + 4) = 0;
  if (v19) {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::set_state(v17, a5);
  }
  v22[2] = v17 + 56;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__swap_out_circular_buffer(a1, v22);
  uint64_t v20 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer((uint64_t)v22);
  return v20;
}

void sub_21447E874(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 56;
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::spline_container_t(v7 - 56, v9);
      uint64_t v7 = *((void *)&v15 + 1) - 56;
      *((void *)&v15 + 1) -= 56;
    }
    while (v9 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t::spline_container_t(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = -1;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  for (uint64_t i = (void **)(a1 + 32); v4 != v5; v4 += 80)
  {
    uint64_t v8 = a1;
    long long v6 = *(_OWORD *)(v4 + 24);
    long long v9 = *(_OWORD *)(v4 + 8);
    long long v10 = v6;
    uint64_t v11 = *(void *)(v4 + 40);
    long long v12 = *(_OWORD *)(v4 + 48);
    long long v13 = *(_OWORD *)(v4 + 64);
    std::back_insert_iterator<std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>::operator=[abi:ne180100](&i, &v8);
  }
  return a1;
}

void ***std::back_insert_iterator<std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>::operator=[abi:ne180100](void ***a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*a1)[1];
  long long v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    unint64_t v14 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v5 - (unsigned char *)*v4) >> 4);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0x333333333333333) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v8 - (void)*v4) >> 4);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x199999999999999) {
      unint64_t v17 = 0x333333333333333;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      long long v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(v7, v17);
    }
    else {
      long long v18 = 0;
    }
    uint64_t v19 = &v18[80 * v14];
    uint64_t v20 = &v18[80 * v17];
    *(_OWORD *)uint64_t v19 = *a2;
    long long v21 = a2[1];
    long long v22 = a2[2];
    long long v23 = a2[4];
    *((_OWORD *)v19 + 3) = a2[3];
    *((_OWORD *)v19 + 4) = v23;
    *((_OWORD *)v19 + 1) = v21;
    *((_OWORD *)v19 + 2) = v22;
    long long v13 = v19 + 80;
    uint64_t v25 = (char *)*v4;
    id v24 = (char *)v4[1];
    if (v24 != *v4)
    {
      do
      {
        *((_OWORD *)v19 - 5) = *((_OWORD *)v24 - 5);
        long long v26 = *((_OWORD *)v24 - 4);
        long long v27 = *((_OWORD *)v24 - 3);
        long long v28 = *((_OWORD *)v24 - 1);
        *((_OWORD *)v19 - 2) = *((_OWORD *)v24 - 2);
        *((_OWORD *)v19 - 1) = v28;
        *((_OWORD *)v19 - 4) = v26;
        *((_OWORD *)v19 - 3) = v27;
        v19 -= 80;
        v24 -= 80;
      }
      while (v24 != v25);
      id v24 = (char *)*v4;
    }
    *uint64_t v4 = v19;
    v4[1] = v13;
    v4[2] = v20;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    _OWORD *v5 = *a2;
    long long v10 = a2[1];
    long long v11 = a2[2];
    long long v12 = a2[4];
    v5[3] = a2[3];
    v5[4] = v12;
    v5[1] = v10;
    v5[2] = v11;
    long long v13 = v5 + 5;
  }
  v4[1] = v13;
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::instance_container_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    long long v3 = *(void **)(v1 + 32);
    if (v3)
    {
      *(void *)(v1 + 40) = v3;
      operator delete(v3);
    }
    v1 += 56;
  }
}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 56;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
}

void *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::control_point>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  long long v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    unint64_t v8 = __src;
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
  long long v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  long long v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  unint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

__n128 std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::push_back(void **a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    if (v5 <= *a1)
    {
      if (v4 == *a1) {
        unint64_t v13 = 1;
      }
      else {
        unint64_t v13 = 0x5555555555555556 * ((v4 - (unsigned char *)*a1) >> 5);
      }
      unint64_t v14 = v13 >> 2;
      unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>((uint64_t)a1[4], v13);
      unint64_t v17 = &v15[96 * v14];
      long long v18 = a1[1];
      uint64_t v4 = v17;
      int64_t v19 = (unsigned char *)a1[2] - (unsigned char *)v18;
      if (v19)
      {
        uint64_t v4 = &v17[96 * (v19 / 96)];
        uint64_t v20 = 96 * (v19 / 96);
        long long v21 = &v15[96 * v14];
        do
        {
          long long v22 = v18[1];
          *(_OWORD *)long long v21 = *v18;
          *((_OWORD *)v21 + 1) = v22;
          long long v23 = v18[2];
          long long v24 = v18[3];
          long long v25 = v18[5];
          *((_OWORD *)v21 + 4) = v18[4];
          *((_OWORD *)v21 + 5) = v25;
          *((_OWORD *)v21 + 2) = v23;
          *((_OWORD *)v21 + 3) = v24;
          v21 += 96;
          v18 += 6;
          v20 -= 96;
        }
        while (v20);
      }
      long long v26 = *a1;
      *a1 = v15;
      a1[1] = v17;
      a1[2] = v4;
      a1[3] = &v15[96 * v16];
      if (v26)
      {
        operator delete(v26);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      int64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 5);
      if (v6 >= -1) {
        uint64_t v7 = v6 + 1;
      }
      else {
        uint64_t v7 = v6 + 2;
      }
      uint64_t v8 = -(v7 >> 1);
      uint64_t v9 = -96 * (v7 >> 1);
      long long v10 = &v5[v9];
      int64_t v11 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[v9], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      int64_t v12 = &v4[96 * v8];
      uint64_t v4 = &v10[v11];
      a1[1] = v12;
      a1[2] = &v10[v11];
    }
  }
  long long v27 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v27;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v29 = *(_OWORD *)(a2 + 48);
  long long v30 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v30;
  *((__n128 *)v4 + 2) = result;
  *((_OWORD *)v4 + 3) = v29;
  a1[2] = (char *)a1[2] + 96;
  return result;
}

void *std::vector<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  int64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *((_OWORD *)v8 - 5);
      *(_OWORD *)(v9 - 96) = *((_OWORD *)v8 - 6);
      *(_OWORD *)(v9 - 80) = v10;
      long long v11 = *((_OWORD *)v8 - 4);
      long long v12 = *((_OWORD *)v8 - 3);
      long long v13 = *((_OWORD *)v8 - 1);
      uint64_t v7 = (void *)(v9 - 96);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v13;
      *(_OWORD *)(v9 - 64) = v11;
      *(_OWORD *)(v9 - 48) = v12;
      v8 -= 96;
      v9 -= 96;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  unint64_t v14 = a1[1];
  uint64_t v15 = *(void *)(a2 + 16);
  int64_t v16 = v14 - __src;
  if (v14 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v14 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v15 + v16;
  unint64_t v17 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v17;
  long long v18 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v18;
  int64_t v19 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v19;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(96 * a2);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__shared_ptr_emplace<std::atomic<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C52EE20;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::atomic<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C52EE20;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166A17E0);
}

void sub_21447F3E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447F4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447F5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447F960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447FA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21447FB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double LAUI_CA_utilities::periodic_animation_state::elapsed_duration(LAUI_CA_utilities::periodic_animation_state *this)
{
  if (!*((void *)this + 1)) {
    return 0.0;
  }
  id WeakRetained = (CALayer *)objc_loadWeakRetained((id *)this + 2);
  long long v3 = WeakRetained;
  if (WeakRetained) {
    double v4 = LAUILayerAnimationElapsedDuration(WeakRetained, *((NSString **)this + 1));
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

double LAUI_CA_utilities::periodic_animation_state::remaining_duration(LAUI_CA_utilities::periodic_animation_state *this)
{
  if (!*((void *)this + 1)) {
    return 0.0;
  }
  id WeakRetained = (CALayer *)objc_loadWeakRetained((id *)this + 2);
  long long v3 = WeakRetained;
  if (WeakRetained) {
    double v4 = LAUILayerAnimationRemainingDuration(WeakRetained, *((NSString **)this + 1));
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

void LAUI_CA_utilities::periodic_animation_state::create_removal_timer(dispatch_source_t *a1, void *a2, double a3)
{
  id v5 = a2;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)a1);
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  dispatch_source_t v7 = a1[3];
  a1[3] = v6;

  uint64_t v8 = a1[3];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_source_set_event_handler(a1[3], v5);

  long long v10 = a1[3];
  dispatch_resume(v10);
}

void __copy_helper_block_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4(uint64_t a1)
{
}

void sub_21448015C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214480758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
  _Unwind_Resume(a1);
}

id LAUI_CA_utilities::animation::update_animation<CABasicAnimation * {__strong}>(void *a1, _OWORD *a2, _OWORD *a3)
{
  id v5 = a1;
  dispatch_source_t v6 = (void *)MEMORY[0x263F08D40];
  long long v7 = a2[5];
  *(_OWORD *)&a.m31 = a2[4];
  *(_OWORD *)&a.m33 = v7;
  long long v8 = a2[7];
  *(_OWORD *)&a.m41 = a2[6];
  *(_OWORD *)&a.m43 = v8;
  long long v9 = a2[1];
  *(_OWORD *)&a.m11 = *a2;
  *(_OWORD *)&a.m13 = v9;
  long long v10 = a2[3];
  *(_OWORD *)&a.m21 = a2[2];
  *(_OWORD *)&a.m23 = v10;
  long long v11 = a3[7];
  *(_OWORD *)&b.m41 = a3[6];
  *(_OWORD *)&b.m43 = v11;
  long long v12 = a3[5];
  *(_OWORD *)&b.m31 = a3[4];
  *(_OWORD *)&b.m33 = v12;
  long long v13 = a3[3];
  *(_OWORD *)&b.m21 = a3[2];
  *(_OWORD *)&b.m23 = v13;
  long long v14 = a3[1];
  *(_OWORD *)&b.m11 = *a3;
  *(_OWORD *)&b.m13 = v14;
  BOOL v15 = CATransform3DEqualToTransform(&a, &b);
  int64_t v16 = (_OWORD *)MEMORY[0x263F15740];
  if (v15)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v42.m33 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v42.m43 = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v42.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v42.m13 = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v42.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v42.m23 = v20;
  }
  else
  {
    long long v21 = a3[5];
    *(_OWORD *)&v38.m31 = a3[4];
    *(_OWORD *)&v38.m33 = v21;
    long long v22 = a3[7];
    *(_OWORD *)&v38.m41 = a3[6];
    *(_OWORD *)&v38.m43 = v22;
    long long v23 = a3[1];
    *(_OWORD *)&v38.m11 = *a3;
    *(_OWORD *)&v38.m13 = v23;
    long long v24 = a3[3];
    *(_OWORD *)&v38.m21 = a3[2];
    *(_OWORD *)&v38.m23 = v24;
    CATransform3DInvert(&v39, &v38);
    long long v25 = a2[5];
    *(_OWORD *)&v37.m31 = a2[4];
    *(_OWORD *)&v37.m33 = v25;
    long long v26 = a2[7];
    *(_OWORD *)&v37.m41 = a2[6];
    *(_OWORD *)&v37.m43 = v26;
    long long v27 = a2[1];
    *(_OWORD *)&v37.m11 = *a2;
    *(_OWORD *)&v37.m13 = v27;
    long long v28 = a2[3];
    *(_OWORD *)&v37.m21 = a2[2];
    *(_OWORD *)&v37.m23 = v28;
    CATransform3DConcat(&v42, &v39, &v37);
  }
  long long v29 = [v6 valueWithCATransform3D:&v42];
  [v5 setFromValue:v29];

  long long v30 = v16[5];
  v36[4] = v16[4];
  v36[5] = v30;
  long long v31 = v16[7];
  v36[6] = v16[6];
  v36[7] = v31;
  long long v32 = v16[1];
  v36[0] = *v16;
  v36[1] = v32;
  long long v33 = v16[3];
  v36[2] = v16[2];
  v36[3] = v33;
  id v34 = [MEMORY[0x263F08D40] valueWithCATransform3D:v36];
  [v5 setToValue:v34];

  return v5;
}

void sub_214480A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

void sub_214480F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_214481430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, id a20)
{
  long long v24 = v22;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

void sub_214481520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

void sub_214481878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214481908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214481A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214481AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214481B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_214481F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id anonymous namespace'::shape_layer_clone(_anonymous_namespace_ *this, CAShapeLayer *a2)
{
  uint64_t v2 = this;
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F15880]);
    [(_anonymous_namespace_ *)v2 bounds];
    objc_msgSend(v3, "setBounds:");
    [(_anonymous_namespace_ *)v2 position];
    objc_msgSend(v3, "setPosition:");
    [(_anonymous_namespace_ *)v2 zPosition];
    objc_msgSend(v3, "setZPosition:");
    [(_anonymous_namespace_ *)v2 anchorPoint];
    objc_msgSend(v3, "setAnchorPoint:");
    [(_anonymous_namespace_ *)v2 anchorPointZ];
    objc_msgSend(v3, "setAnchorPointZ:");
    [(_anonymous_namespace_ *)v2 transform];
    [v3 setTransform:&v10];
    objc_msgSend(v3, "setHidden:", -[_anonymous_namespace_ isHidden](v2, "isHidden"));
    objc_msgSend(v3, "setGeometryFlipped:", -[_anonymous_namespace_ isGeometryFlipped](v2, "isGeometryFlipped"));
    [(_anonymous_namespace_ *)v2 opacity];
    objc_msgSend(v3, "setOpacity:");
    double v4 = [(_anonymous_namespace_ *)v2 actions];
    [v3 setActions:v4];

    objc_msgSend(v3, "setPath:", -[_anonymous_namespace_ path](v2, "path"));
    objc_msgSend(v3, "setFillColor:", -[_anonymous_namespace_ fillColor](v2, "fillColor"));
    id v5 = [(_anonymous_namespace_ *)v2 fillRule];
    [v3 setFillRule:v5];

    objc_msgSend(v3, "setStrokeColor:", -[_anonymous_namespace_ strokeColor](v2, "strokeColor"));
    [(_anonymous_namespace_ *)v2 strokeStart];
    objc_msgSend(v3, "setStrokeStart:");
    [(_anonymous_namespace_ *)v2 strokeEnd];
    objc_msgSend(v3, "setStrokeEnd:");
    [(_anonymous_namespace_ *)v2 lineWidth];
    objc_msgSend(v3, "setLineWidth:");
    [(_anonymous_namespace_ *)v2 miterLimit];
    objc_msgSend(v3, "setMiterLimit:");
    dispatch_source_t v6 = [(_anonymous_namespace_ *)v2 lineCap];
    [v3 setLineCap:v6];

    long long v7 = [(_anonymous_namespace_ *)v2 lineJoin];
    [v3 setLineJoin:v7];

    [(_anonymous_namespace_ *)v2 lineDashPhase];
    objc_msgSend(v3, "setLineDashPhase:");
    long long v8 = [(_anonymous_namespace_ *)v2 lineDashPattern];
    [v3 setLineDashPattern:v8];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_214482210(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2144822B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)LAUICheckmarkLayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void LAUI_CA_utilities::animation_completion_handler_container::execute(LAUI_CA_utilities::animation_completion_handler_container **a1, char a2)
{
  memset(v6, 0, sizeof(v6));
  std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::reserve(v6, (a1[1] - *a1) >> 3);
  double v4 = *a1;
  id v5 = a1[1];
  while (v4 != v5)
  {
    LAUI_CA_utilities::animation_completion_handler_container::acquire_completion(v4);
    long long v7 = (char **)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(v6, &v7);
    }
    double v4 = (LAUI_CA_utilities::animation_completion_handler_container *)((char *)v4 + 8);
  }
  LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>((uint64_t)v6, a2);
  long long v7 = v6;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
}

void sub_21448272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144828CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_214482A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(uint64_t *a1, void **a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v19 = v4;
    if (v12) {
      long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    }
    else {
      long long v13 = 0;
    }
    BOOL v15 = v13;
    int64_t v16 = &v13[8 * v9];
    long long v18 = &v13[8 * v12];
    LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(v16, *a2);
    long long v17 = v16 + 8;
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(a1, &v15);
    uint64_t v8 = a1[1];
    std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(*(void **)(v4 - 8), *a2);
    uint64_t v8 = v7 + 8;
    a1[1] = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_214482B40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x2166A1D50](*(void *)(a2 + 32));
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0(uint64_t a1)
{
}

void sub_214483008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2144830E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
}

void __destroy_helper_block_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1(uint64_t a1)
{
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::shrink_to_fit(uint64_t *a1)
{
  uint64_t v3 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    uint64_t v13 = result;
    if (v5 == v4)
    {
      unint64_t v7 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      unint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
    }
    uint64_t v9 = v7;
    uint64_t v10 = &v7[8 * v6];
    uint64_t v11 = v10;
    unint64_t v12 = &v7[8 * v8];
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(a1, &v9);
    return std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer((uint64_t)&v9);
  }
  return result;
}

void sub_214483214(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

uint64_t std::vector<CAShapeLayer * {__strong}>::shrink_to_fit(char **a1)
{
  uint64_t v3 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    uint64_t v19 = result;
    if (v5 == v4)
    {
      uint64_t v11 = 0;
      uint64_t v9 = 8 * v6;
    }
    else
    {
      unint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      uint64_t v4 = *a1;
      uint64_t v8 = a1[1];
      uint64_t v9 = (uint64_t)&v7[8 * v6];
      uint64_t v11 = &v7[8 * v10];
      uint64_t v17 = v9;
      long long v18 = v11;
      if (v8 != v4)
      {
        unint64_t v12 = &v7[8 * v6];
        do
        {
          uint64_t v13 = *((void *)v8 - 1);
          v8 -= 8;
          *(void *)uint64_t v8 = 0;
          *((void *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        long long v14 = *a1;
        uint64_t v4 = a1[1];
        uint64_t v9 = v17;
        uint64_t v11 = v18;
        goto LABEL_9;
      }
    }
    long long v14 = v4;
    unint64_t v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    BOOL v15 = a1[2];
    a1[2] = v11;
    uint64_t v17 = (uint64_t)v4;
    long long v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_2144833C4(void *a1)
{
}

uint64_t std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::reserve(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, a2);
    uint64_t v9 = *a1;
    uint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *(void *)uint64_t v8 = 0;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    uint64_t v13 = a1[2];
    a1[2] = &v6[8 * v7];
    int64_t v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

id LAUI_CA_utilities::animation_completion_handler_container::acquire_completion(LAUI_CA_utilities::animation_completion_handler_container *this)
{
  uint64_t v2 = (void *)MEMORY[0x2166A1D50](*(void *)this);
  uint64_t v3 = *(void **)this;
  *(void *)this = 0;

  uint64_t v4 = (void *)MEMORY[0x2166A1D50](v2);
  return v4;
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>(char **a1, void *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v25 = v4;
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    int64x2_t v15 = &v13[8 * v12];
    long long v24 = v15;
    *(void *)uint64_t v14 = MEMORY[0x2166A1D50](*a2);
    uint64_t v8 = v14 + 8;
    v23.i64[1] = (uint64_t)(v14 + 8);
    uint64_t v17 = *a1;
    int64_t v16 = a1[1];
    if (v16 == *a1)
    {
      int64x2_t v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *(void *)int64_t v16 = 0;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      int64x2_t v19 = *(int64x2_t *)a1;
      uint64_t v8 = (char *)v23.i64[1];
      int64x2_t v15 = v24;
    }
    *a1 = v14;
    a1[1] = v8;
    int64x2_t v23 = v19;
    long long v20 = a1[2];
    a1[2] = v15;
    long long v24 = v20;
    uint64_t v22 = v19.i64[0];
    std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    *(void *)uint64_t v7 = MEMORY[0x2166A1D50](*a2);
    uint64_t v8 = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 8) != *(void *)a1)
  {
    id v4 = MEMORY[0x263EF83A0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3321888768;
    block[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke;
    block[3] = &__block_descriptor_64_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE__e5_v8__0l;
    uint64_t v8 = *(void ***)a1;
    unint64_t v5 = (uint64_t *)v8;
    long long v9 = *(_OWORD *)(a1 + 8);
    unint64_t v6 = (uint64_t *)v9;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    char v10 = a2;
    memset(v12, 0, sizeof(v12));
    std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>((char *)v12, v5, v6, v6 - v5);
    char v13 = a2;
    uint64_t v7 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v14 = &v8;
    std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);

    uint64_t v8 = (void **)v12;
    std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v8);
  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *(uint64_t **)(result + 40);
  if (v1 != v2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t result = *v1;
      if (*v1) {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(v3 + 56));
      }
      ++v1;
    }
    while (v1 != v2);
  }
  return result;
}

char *__copy_helper_block_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE_(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v3 = a1 + 32;
  *(void *)(a1 + 48) = 0;
  uint64_t result = std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>((char *)(a1 + 32), *(uint64_t **)(a2 + 32), *(uint64_t **)(a2 + 40), (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3);
  *(unsigned char *)(v3 + 24) = *(unsigned char *)(a2 + 56);
  return result;
}

void __destroy_helper_block_ea8_32c155_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_bEUlvE_(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v1);
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(BOOL),void({block_pointer} {__strong}*)(BOOL)>(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (char **)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2++;
      uint64_t result = (char *)MEMORY[0x2166A1D50](v8);
      *v7++ = result;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_214483944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *LAUI_CA_utilities::animation_completion_handler_container::animation_completion_handler_container(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[v3 copy];
  *a1 = MEMORY[0x2166A1D50]();

  return a1;
}

uint64_t std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>((uint64_t)(a1 + 2), a1[1], (void **)a1[1], *a1, (void **)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, void **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    long long v9 = a3;
    do
    {
      uint64_t v10 = (uint64_t)*--v9;
      *(void *)(v7 - 8) = MEMORY[0x2166A1D50](v10);
      uint64_t v11 = *v9;
      char *v9 = 0;

      uint64_t v7 = *((void *)&v17 + 1) - 8;
      *((void *)&v17 + 1) -= 8;
    }
    while (v9 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<LAUI_CA_utilities::animation_completion_handler_container>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>,std::reverse_iterator<std::reverse_iterator<LAUI_CA_utilities::animation_completion_handler_container*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    LAUI_CA_utilities::animation_completion_handler_container::operator()(i, 0);

    uint64_t i = (void **)(*(void *)(a2 + 32) + 8);
  }
}

void LAUI_CA_utilities::animation_completion_handler_container::operator()(void **a1, char a2)
{
  if (*a1)
  {
    uint64_t v4 = (void *)MEMORY[0x2166A1D50]();
    uint64_t v5 = *a1;
    *a1 = 0;

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3321888768;
    v7[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke;
    v7[3] = &__block_descriptor_48_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE__e5_v8__0l;
    uint64_t v6 = (void *)MEMORY[0x2166A1D50](v4);
    id v8 = (id)MEMORY[0x2166A1D50]();
    char v9 = a2;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __copy_helper_block_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x2166A1D50](*(void *)(a2 + 32));
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return result;
}

void __destroy_helper_block_ea8_32c76_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_containerclEbEUlvE_(uint64_t a1)
{
}

uint64_t std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<LAUI_CA_utilities::animation_completion_handler_container>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(i - 8), 0);
  }
}

void std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1;
    do
    {
      LAUI_CA_utilities::animation_completion_handler_container::operator()(v5, 0);
      uint64_t v7 = *v6--;

      BOOL v8 = v5 == a2;
      uint64_t v5 = v6;
    }
    while (!v8);
  }
  *(void *)(a1 + 8) = a2;
}

void std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (void ***)*a1;
  if (*v2)
  {
    std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_214483F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *anonymous namespace'::create_static_resources(_anonymous_namespace_ *this)
{
  {
  }
  if (!WeakRetained)
  {
    id v3 = MTLCreateSystemDefaultDevice();
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(v3, (LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)&v5);

    if (v6)
    {
      id WeakRetained = -[LAUIPearlGlyphViewStaticResources initWithState:]([LAUIPearlGlyphViewStaticResources alloc], &v5);
      if (v6)
      {

        for (uint64_t i = 72; i != 48; i -= 8)
        do
        {

          i -= 8;
        }
        while (i != 24);
      }
    }
    else
    {
      id WeakRetained = 0;
    }
  }
  return WeakRetained;
}

void sub_214484178(_Unwind_Exception *a1)
{
}

void sub_214484234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2144842D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21448436C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2144857B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_214485C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214485D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2144868D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_214486A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)LAUIPearlGlyphView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_214486FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214487198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214487284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current - *(double *)this;
  double v4 = 0.0;
  if (v3 > 0.0)
  {
    *(double *)this = Current;
    return v3;
  }
  return v4;
}

void sub_2144876CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LAUI_uniform_cubic_b_spline_renderer::renderer_t *std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100](LAUI_uniform_cubic_b_spline_renderer::renderer_t **a1, LAUI_uniform_cubic_b_spline_renderer::renderer_t *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::~renderer_t(result);
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t *std::unique_ptr<anonymous namespace'::face_id_animator_t>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    double v3 = *(void **)(v2 + 1160);
    if (v3)
    {
      do
      {
        double v4 = (void *)*v3;
        operator delete(v3);
        double v3 = v4;
      }
      while (v4);
    }
    shared_state_t v5 = *(void **)(v2 + 1144);
    *(void *)(v2 + 1144) = 0;
    if (v5) {
      operator delete(v5);
    }
    char v6 = *(void **)(v2 + 1120);
    if (v6)
    {
      *(void *)(v2 + 1128) = v6;
      operator delete(v6);
    }
    if (*(unsigned char *)(v2 + 1104))
    {
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v2 + 1088);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 992);
    }
    uint64_t v7 = *(void *)(v2 + 872);
    if (v7)
    {
      uint64_t v8 = *(void *)(v2 + 880);
      char v9 = *(void **)(v2 + 872);
      if (v8 != v7)
      {
        do
        {
          _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v8 - 16);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v8 - 112);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v8 - 216);
          v8 -= 288;
        }
        while (v8 != v7);
        char v9 = *(void **)(v2 + 872);
      }
      *(void *)(v2 + 880) = v7;
      operator delete(v9);
    }
    uint64_t v10 = *(void *)(v2 + 848);
    if (v10)
    {
      uint64_t v11 = *(void *)(v2 + 856);
      uint64_t v12 = *(void **)(v2 + 848);
      if (v11 != v10)
      {
        do
        {
          v11 -= 240;
        }
        while (v11 != v10);
        uint64_t v12 = *(void **)(v2 + 848);
      }
      *(void *)(v2 + 856) = v10;
      operator delete(v12);
    }
    if (*(unsigned char *)(v2 + 832))
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 808);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 736);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 680);
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(v2 + 624);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 480);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 424);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 368);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 + 312);
    }
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(v2 + 56), 0);

    if (*(unsigned char *)(v2 + 40))
    {
      char v13 = *(void **)v2;
      if (*(void *)v2)
      {
        *(void *)(v2 + 8) = v13;
        operator delete(v13);
      }
    }
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  uint64_t v2 = *((void *)this + 69);
  uint64_t v3 = *((void *)this + 70);
  while (v2 != v3)
  {
    double v4 = *(void **)v2;
    *(void *)uint64_t v2 = 0;

    shared_state_t v5 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;

    char v6 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    uint64_t v7 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;

    uint64_t v8 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;

    char v9 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    v2 += 48;
  }
  uint64_t v10 = 0;
  *((void *)this + 83) = 0;
  *((unsigned char *)this + 640) = 0;
  uint64_t v11 = (char *)this + 648;
  do
  {
    uint64_t v12 = *(void **)&v11[v10];
    *(void *)&v11[v10] = 0;

    v10 += 8;
  }
  while (v10 != 16);
  char v13 = (void *)*((void *)this + 67);
  *((void *)this + 67) = 0;

  uint64_t v14 = (void *)*((void *)this + 68);
  *((void *)this + 68) = 0;

  uint64_t v15 = (void *)*((void *)this + 78);
  *((void *)this + 78) = 0;

  uint64_t v16 = (void *)*((void *)this + 79);
  *((void *)this + 79) = 0;
}

id anonymous namespace'::color_from_overlayable_color(uint64_t a1, CGColorSpaceRef space)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(void **)a1;
    return v2;
  }
  else
  {
    float32x4_t v4 = *(float32x4_t *)(a1 + 16);
    v7[0] = vcvtq_f64_f32(*(float32x2_t *)v4.f32);
    v7[1] = vcvt_hight_f64_f32(v4);
    CGColorRef v5 = CGColorCreate(space, (const CGFloat *)v7);
    if (!v5) {
      return 0;
    }
    uint64_t v6 = [MEMORY[0x263F1C550] colorWithCGColor:v5];
    CFRelease(v5);
    return (id)v6;
  }
}

void sub_214487DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214487EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_214488018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, char a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_2144888CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214488A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LAUI_uniform_cubic_b_spline_renderer::targetable_animator_t<anonymous namespace'::face_id_animator_t,anonymous namespace'::face_id_state_t,anonymous namespace'::face_id_target_t>::set_targets<LAUI_uniform_cubic_b_spline_renderer::targets_t<anonymous namespace'::face_id_target_t>>(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 48))
  {
    if (v5)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3321888768;
      v9[2] = ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
      v9[3] = &__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
      uint64_t v7 = (void *)MEMORY[0x2166A1D50](v5);
      id v10 = (id)MEMORY[0x2166A1D50]();
      char v11 = 0;
      dispatch_async(MEMORY[0x263EF83A0], v9);
    }
  }
  else
  {
    LAUI_CA_utilities::animation_completion_handler_container::set_completion((void **)(a1 + 56), v5);
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v8 = *(void **)a1;
      if (*(void *)a1)
      {
        *(void *)(a1 + 8) = v8;
        operator delete(v8);
        *(void *)a1 = 0;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
      }
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    }
    else
    {
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(unsigned char *)(a1 + 40) = 1;
    }
  }
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::targets_t<anonymous namespace'::face_id_target_t>::targets_t<anonymous namespace'::face_id_target_t&>(uint64_t a1, long long *a2)
{
  long long v9 = a2[4];
  *(_OWORD *)id v10 = a2[5];
  *(_OWORD *)&v10[9] = *(long long *)((char *)a2 + 89);
  long long v5 = *a2;
  long long v6 = a2[1];
  long long v7 = a2[2];
  long long v8 = a2[3];
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  uint64_t v3 = operator new(0x70uLL);
  *(void *)(a1 + 8) = v3 + 7;
  *(void *)(a1 + 16) = v3 + 7;
  v3[4] = v9;
  void v3[5] = *(_OWORD *)v10;
  *(_OWORD *)((char *)v3 + 89) = *(_OWORD *)&v10[9];
  _OWORD *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return a1;
}

void sub_214488CE8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_214488E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::shrink_to_fit(char **a1)
{
  uint64_t v3 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  float32x4_t v4 = *a1;
  long long v5 = a1[1];
  unint64_t v6 = (v5 - *a1) >> 3;
  if (v6 < (v3 - *a1) >> 3)
  {
    uint64_t v19 = result;
    if (v5 == v4)
    {
      char v11 = 0;
      uint64_t v9 = 8 * v6;
    }
    else
    {
      long long v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>(result, v6);
      float32x4_t v4 = *a1;
      long long v8 = a1[1];
      uint64_t v9 = (uint64_t)&v7[8 * v6];
      char v11 = &v7[8 * v10];
      uint64_t v17 = v9;
      uint64_t v18 = v11;
      if (v8 != v4)
      {
        uint64_t v12 = &v7[8 * v6];
        do
        {
          uint64_t v13 = *((void *)v8 - 1);
          v8 -= 8;
          *(void *)long long v8 = 0;
          *((void *)v12 - 1) = v13;
          v12 -= 8;
        }
        while (v8 != v4);
        uint64_t v14 = *a1;
        float32x4_t v4 = a1[1];
        uint64_t v9 = v17;
        char v11 = v18;
        goto LABEL_9;
      }
    }
    uint64_t v14 = v4;
    uint64_t v12 = (char *)v9;
LABEL_9:
    *a1 = v12;
    a1[1] = (char *)v9;
    uint64_t v15 = a1[2];
    a1[2] = v11;
    uint64_t v17 = (uint64_t)v4;
    uint64_t v18 = v15;
    v16[0] = v14;
    v16[1] = v14;
    return std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)v16);
  }
  return result;
}

void sub_214488FC4(void *a1)
{
}

void sub_2144890C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_214489D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *std::optional<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t>::operator=[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t const&,void>(id *this, shared_state_t *a2)
{
  if (*((unsigned char *)this + 104))
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::operator=(this, (id *)&a2->_device);
  }
  else
  {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::shared_state_t((LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t *)this, a2);
    *((unsigned char *)this + 104) = 1;
  }
  return this;
}

void sub_21448A224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::~shared_state_t(id *this)
{
  for (uint64_t i = 9; i != 6; --i)
  do

  while (i != 3);
}

void std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(id *location, uint64_t a2)
{
  if (*((unsigned __int8 *)location + 8) == *(unsigned __int8 *)(a2 + 8))
  {
    if (*((unsigned char *)location + 8))
    {
      id v3 = *(id *)a2;
      objc_storeStrong(location, v3);
    }
  }
  else if (*((unsigned char *)location + 8))
  {

    *((unsigned char *)location + 8) = 0;
  }
  else
  {
    *id location = *(id *)a2;
    *((unsigned char *)location + 8) = 1;
  }
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __copy_helper_block_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x2166A1D50](*(void *)(a2 + 32));
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return result;
}

void __destroy_helper_block_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE_(uint64_t a1)
{
}

id *LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::operator=(id *a1, id *a2)
{
  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
  objc_storeStrong(a1 + 2, a2[2]);
  objc_storeStrong(a1 + 3, a2[3]);
  for (uint64_t i = 4; i != 7; ++i)
    objc_storeStrong(&a1[i], a2[i]);
  do
  {
    objc_storeStrong(&a1[i], a2[i]);
    ++i;
  }
  while (i != 10);
  objc_storeStrong(a1 + 10, a2[10]);
  objc_storeStrong(a1 + 11, a2[11]);
  objc_storeStrong(a1 + 12, a2[12]);
  return a1;
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeINSt3__16vectorIU8__strongU13block_pointerFvbENS2_9allocatorIS6_EEEEEEvOT_b_block_invoke_0(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 32);
  uint64_t v2 = *(uint64_t **)(result + 40);
  if (v1 != v2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t result = *v1;
      if (*v1) {
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(v3 + 56));
      }
      ++v1;
    }
    while (v1 != v2);
  }
  return result;
}

uint64_t std::vector<anonymous namespace'::face_id_animator_t::ring_context_t>::emplace_back<anonymous namespace'::face_id_animator_t::ring_context_t::static_state_t,anonymous namespace'::face_id_state_t &>(uint64_t *a1, unsigned __int8 *a2, int8x16_t *a3)
{
  unint64_t v6 = a1[2];
  unint64_t v7 = a1[1];
  if (v7 >= v6)
  {
    unint64_t v10 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - *a1) >> 5);
    if (v10 + 1 > 0xE38E38E38E38E3) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v6 - *a1) >> 5);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x71C71C71C71C71) {
      unint64_t v13 = 0xE38E38E38E38E3;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = a1 + 2;
    if (v13)
    {
      if (v13 > 0xE38E38E38E38E3) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v14 = (char *)operator new(288 * v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = v14;
    uint64_t v16 = &v14[288 * v10];
    uint64_t v18 = &v14[288 * v13];
    uint64_t v17 = v16 + 288;
    uint64_t v9 = a1[1];
  }
  else
  {
    uint64_t v9 = v7 + 288;
  }
  a1[1] = v9;
  return result;
}

void anonymous namespace'::face_id_animator_t::face_id_animator_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t &,LAUIPearlGlyphPathStyle,float,anonymous namespace'::face_id_state_t const&)::{lambda(anonymous namespace'::quadrant_t)#1}::operator()(uint64_t a1, unsigned int a2)
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  float32x4_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  if (a2 <= 3)
  {
    uint64_t v5 = qword_214499220[(char)a2];
    uint64_t v6 = qword_214499240[(char)a2];
  }
  unint64_t v7 = 0;
  uint64_t v149 = v6;
  uint64_t v150 = v5;
  if (a2) {
    _ZF = a2 == 3;
  }
  else {
    _ZF = 1;
  }
  float v9 = 1.0;
  if (!_ZF) {
    float v9 = -1.0;
  }
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v92 = _Q1;
  float32x4_t v14 = _Q1;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  float32x4_t v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  float32x4_t v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  float32x4_t v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  float32x4_t v103 = 0u;
  long long v104 = 0u;
  float v15 = (float)(**(float **)a1 * 0.5) * 3.0;
  v14.f32[0] = v9;
  float32x4_t v91 = v14;
  float32x4_t v103 = 0u;
  long long v104 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  float v16 = v15 / 2.9659;
  do
  {
    __float2 v18 = __sincosf_stret((float)((float)v7 * 0.2618) + 2.8798);
    *(float *)&unint64_t v19 = v16 * v18.__cosval;
    *((float *)&v19 + 1) = v16 * v18.__sinval;
    *((_OWORD *)&v103 + v7++) = v19;
  }
  while (v7 != 9);
  v17.i32[0] = 1.0;
  if (a2 > 1) {
    v17.f32[0] = -1.0;
  }
  __int32 v90 = v17.i32[0];
  unint64_t v20 = 0;
  float v21 = (float)(**(float **)(a1 + 8) * 0.5) * 3.0;
  float32x4_t v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  float v22 = v21 / 2.9659;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  do
  {
    __float2 v24 = __sincosf_stret((float)((float)v20 * 0.2618) + 2.8798);
    *((_OWORD *)&v112 + v20++) = __PAIR64__(v22 * v24.__sinval, v22 * v24.__cosval);
  }
  while (v20 != 9);
  v23.f32[0] = v22 * v24.__sinval;
  double v25 = **(float **)(a1 + 16);
  double v26 = **(double **)(a1 + 24) * 0.96;
  double v27 = **(double **)(a1 + 32);
  float32x4_t v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  double v28 = v25 * -0.5;
  double v29 = 2.0 / v26;
  for (uint64_t i = 21; i != 24; ++i)
  {
    __double2 v31 = __sincos_stret((double)(unint64_t)(i - 20) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(i - 20) * 0.25) * 0.0);
    float v32 = v28 * pow(fmax(v31.__cosval, 0.0), v29);
    float v93 = v32;
    *(double *)v33.i64 = v28 * pow(fmax(v31.__sinval, 0.0), v29);
    v33.f32[0] = *(double *)v33.i64;
    *((_OWORD *)&v103 + i) = __PAIR64__(v33.u32[0], LODWORD(v93));
  }
  v33.f32[0] = v28;
  LODWORD(v34) = v33.i32[0];
  float v35 = v27 * (float)(*((float *)&v125 + 1) - *((float *)&v124 + 1));
  float32x4_t v36 = (float32x4_t)v33.u32[0];
  v36.f32[1] = -v35;
  float32x4_t v121 = v36;
  long long v122 = v33.u32[0];
  *((float *)&v34 + 1) = v35;
  long long v123 = v34;
  *(float *)&unint64_t v34 = v27 * (float)(*(float *)&v125 - *(float *)&v126);
  *(float *)&unint64_t v37 = -*(float *)&v34;
  HIDWORD(v37) = v33.i32[0];
  LODWORD(v38) = 0;
  HIDWORD(v38) = v33.i32[0];
  long long v128 = v38;
  long long v129 = v37;
  long long v127 = __PAIR64__(v33.u32[0], v34);
  double v39 = **(double **)(a1 + 24);
  double v40 = **(float **)(a1 + 40);
  double v41 = **(double **)(a1 + 32);
  float32x4_t v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  double v42 = v40 * -0.5;
  double v43 = 2.0 / v39;
  for (uint64_t j = 30; j != 33; ++j)
  {
    __double2 v45 = __sincos_stret((double)(unint64_t)(j - 29) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(j - 29) * 0.25) * 0.0);
    float v46 = v42 * pow(fmax(v45.__cosval, 0.0), v43);
    float v94 = v46;
    *(double *)v47.i64 = v42 * pow(fmax(v45.__sinval, 0.0), v43);
    v47.f32[0] = *(double *)v47.i64;
    *((_OWORD *)&v103 + j) = __PAIR64__(v47.u32[0], LODWORD(v94));
  }
  v47.f32[0] = v42;
  LODWORD(v48) = v47.i32[0];
  float v49 = v41 * (float)(*((float *)&v134 + 1) - *((float *)&v133 + 1));
  float32x4_t v50 = (float32x4_t)v47.u32[0];
  v50.f32[1] = -v49;
  float32x4_t v130 = v50;
  long long v131 = v47.u32[0];
  *((float *)&v48 + 1) = v49;
  long long v132 = v48;
  *(float *)&unint64_t v48 = v41 * (float)(*(float *)&v134 - *(float *)&v135);
  *(float *)&unint64_t v51 = -*(float *)&v48;
  HIDWORD(v51) = v47.i32[0];
  LODWORD(v52) = 0;
  HIDWORD(v52) = v47.i32[0];
  long long v137 = v52;
  long long v138 = v51;
  long long v136 = __PAIR64__(v47.u32[0], v48);
  double v53 = **(float **)(a1 + 48);
  double v54 = **(double **)(a1 + 24) * 1.04;
  double v55 = **(double **)(a1 + 32);
  float32x4_t v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  double v56 = v53 * -0.5;
  double v57 = 2.0 / v54;
  for (uint64_t k = 39; k != 42; ++k)
  {
    __double2 v59 = __sincos_stret((double)(unint64_t)(k - 38) * 0.25 * 1.57079633+ (1.0 - (double)(unint64_t)(k - 38) * 0.25) * 0.0);
    float v60 = v56 * pow(fmax(v59.__cosval, 0.0), v57);
    float v95 = v60;
    *(double *)v61.i64 = v56 * pow(fmax(v59.__sinval, 0.0), v57);
    v61.f32[0] = *(double *)v61.i64;
    *((_OWORD *)&v103 + k) = __PAIR64__(v61.u32[0], LODWORD(v95));
  }
  v61.f32[0] = v56;
  LODWORD(v62) = v61.i32[0];
  float v63 = v55 * (float)(*((float *)&v143 + 1) - *((float *)&v142 + 1));
  float32x4_t v64 = (float32x4_t)v61.u32[0];
  v64.f32[1] = -v63;
  float32x4_t v139 = v64;
  long long v140 = v61.u32[0];
  *((float *)&v62 + 1) = v63;
  long long v141 = v62;
  *(float *)&unint64_t v62 = v55 * (float)(*(float *)&v143 - *(float *)&v144);
  *(float *)&unint64_t v65 = -*(float *)&v62;
  HIDWORD(v65) = v61.i32[0];
  LODWORD(v66) = 0;
  HIDWORD(v66) = v61.i32[0];
  long long v146 = v66;
  long long v147 = v65;
  long long v145 = __PAIR64__(v61.u32[0], v62);
  memset(v154, 0, 24);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::reserve((uint64_t *)v154, 5uLL);
  uint64_t v67 = 0;
  float32x4_t v68 = v91;
  v68.i32[1] = v90;
  v68.i32[2] = v91.i32[2];
  float32x4_t v96 = v68;
  do
  {
    memset(__p, 0, 24);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(__p, (char *)&v103 + v67, (uint64_t)&v112 + v67, 9uLL);
    uint64_t v69 = *(void *)&v154[8];
    if (*(void *)&v154[8] >= *(void *)&v154[16])
    {
      *(void *)&v154[8] = _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer8spline_t7state_tENS_9allocatorIS3_EEE24__emplace_back_slow_pathIJNS0_IDv3_fNS4_IS8_EEEEEEEPS3_DpOT_((uint64_t *)v154, (uint64_t)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    else
    {
      **(void **)&v154[8] = 0;
      *(void *)(v69 + 8) = 0;
      *(void *)(v69 + 16) = 0;
      *(_OWORD *)uint64_t v69 = *(_OWORD *)__p;
      *(void **)(v69 + 16) = __p[2];
      memset(__p, 0, 24);
      if (*(void *)(v69 + 8) - *(void *)v69 <= 0x3FuLL) {
        goto LABEL_50;
      }
      *(void *)&v154[8] = v69 + 24;
    }
    v67 += 144;
  }
  while (v67 != 720);
  LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>((uint64_t)&v100, (uint64_t)v154);
  __p[0] = v154;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  uint64_t v70 = v4[8];
  long long v152 = 0u;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(__p, v100, &v152);
  uint64_t v71 = __p[0];
  *(void **)float64x2_t v154 = __p[0];
  *(_OWORD *)&v154[8] = *(_OWORD *)&__p[1];
  memset(__p, 0, 24);
  if (*(void *)&v154[8] - (void)v71 <= 0x3FuLL)
  {
LABEL_50:
    __break(1u);
    return;
  }
  uint64_t v99 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_spline(v70, &v100, (long long **)v154);
  if (*(void *)v154)
  {
    *(void *)&v154[8] = *(void *)v154;
    operator delete(*(void **)v154);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v72 = *(void *)(a1 + 64);
  *(_OWORD *)float64x2_t v154 = 0u;
  *(_OWORD *)&v154[16] = xmmword_214498B80;
  *(_OWORD *)simd_float4x4 v155 = 0u;
  *(_OWORD *)&v155[16] = xmmword_214498B80;
  float32x4_t v156 = v92;
  float32x4_t v157 = 0uLL;
  *(_OWORD *)&v158[8] = xmmword_214498E20;
  *(_DWORD *)float64x2_t v158 = 1065353216;
  int v159 = 0;
  uint64_t v160 = 0;
  *(void *)&long long v98 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v72, &v99, &v148, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v154);
  *((void *)&v98 + 1) = v73;
  uint64_t v74 = *(void *)(a1 + 64);
  *(_OWORD *)float64x2_t v154 = 0u;
  *(_OWORD *)&v154[16] = xmmword_214498B80;
  *(_OWORD *)simd_float4x4 v155 = 0u;
  *(_OWORD *)&v155[16] = xmmword_214498B80;
  float32x4_t v156 = v92;
  float32x4_t v157 = 0uLL;
  *(_OWORD *)&v158[8] = xmmword_214498E20;
  *(_DWORD *)float64x2_t v158 = 1065353216;
  int v159 = 0;
  uint64_t v160 = 0;
  v97.i64[0] = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v74, &v99, &v148, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v154);
  v97.i64[1] = v75;
  long long v152 = v98;
  float32x4_t v153 = v97;
  uint64_t v76 = operator new(0x20uLL);
  float32x4_t v77 = v153;
  _OWORD *v76 = v152;
  v76[1] = v77;
  v77.i32[3] = 0;
  v78.i32[3] = 0;
  v78.i32[0] = **(_DWORD **)(a1 + 88);
  *(uint64_t *)((char *)v78.i64 + 4) = v78.u32[0];
  v79.i32[3] = 0;
  v79.i32[0] = **(_DWORD **)(a1 + 96);
  *(uint64_t *)((char *)v79.i64 + 4) = v79.u32[0];
  v77.i32[0] = **(_DWORD **)(a1 + 104);
  *(uint64_t *)((char *)v77.i64 + 4) = v77.u32[0];
  *(void *)float64x2_t v154 = v99;
  *(void *)&v154[8] = v76;
  *(void *)&v154[16] = v76 + 2;
  *(void *)&v154[24] = v76 + 2;
  *(_OWORD *)&v155[8] = v101;
  *(void *)simd_float4x4 v155 = v100;
  *(void *)&v155[24] = v102;
  long long v101 = 0uLL;
  uint64_t v102 = 0;
  float32x4_t v156 = vmulq_f32(v96, v78);
  float32x4_t v157 = vmulq_f32(v96, v79);
  *(float32x4_t *)float64x2_t v158 = vmulq_f32(v96, v77);
  unint64_t v80 = v4[107];
  unint64_t v81 = v4[108];
  if (v80 >= v81)
  {
    uint64_t v83 = v4[106];
    unint64_t v84 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v80 - v83) >> 4);
    if (v84 + 1 > 0x111111111111111) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v85 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v81 - v83) >> 4);
    uint64_t v86 = 2 * v85;
    if (2 * v85 <= v84 + 1) {
      uint64_t v86 = v84 + 1;
    }
    if (v85 >= 0x88888888888888) {
      unint64_t v87 = 0x111111111111111;
    }
    else {
      unint64_t v87 = v86;
    }
    __p[4] = v4 + 108;
    if (v87)
    {
      if (v87 > 0x111111111111111) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v88 = (char *)operator new(240 * v87);
    }
    else
    {
      uint64_t v88 = 0;
    }
    uint64_t v89 = (uint64_t)&v88[240 * v84];
    __p[0] = v88;
    __p[1] = (void *)v89;
    __p[3] = &v88[240 * v87];
    __p[2] = (void *)(v89 + 240);
    unint64_t v82 = v4[107];
  }
  else
  {
    unint64_t v82 = v80 + 240;
  }
  v4[107] = v82;
  __p[0] = &v155[8];
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (*(void *)&v154[8])
  {
    *(void *)&v154[16] = *(void *)&v154[8];
    operator delete(*(void **)&v154[8]);
  }
  *(void *)float64x2_t v154 = &v101;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)v154);
}

void sub_21448B120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  STACK[0x3D0] = (unint64_t)&a24;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x3D0]);
  _Unwind_Resume(a1);
}

void _ZZN12_GLOBAL__N_118face_id_animator_tC1ERN36LAUI_uniform_cubic_b_spline_renderer10renderer_tE23LAUIPearlGlyphPathStylefRKNS_15face_id_state_tEENKUlDv3_fE_clES8_(uint64_t a1, __n128 a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  float32x4_t v4 = *(void **)a1;
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  uint64_t v29 = 0;
  long long v30 = xmmword_214498E10;
  uint64_t v31 = 0x3FF0000000000000;
  v32[0] = 0u;
  v32[1] = xmmword_214498B80;
  v32[2] = 0u;
  v32[3] = xmmword_214498B80;
  __asm { FMOV            V0.4S, #1.0 }
  v32[4] = _Q0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  int v35 = 1065353216;
  long long v36 = xmmword_214498E20;
  int v37 = 0;
  uint64_t v38 = 0;
  uint64_t v11 = LAUI_uniform_cubic_b_spline_renderer::renderer_t::add_instance(v5, v3, (long long *)&v29, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)v32);
  uint64_t v13 = v11;
  unint64_t v14 = v12;
  float v15 = **(float **)(a1 + 16) * 1.133333;
  float v16 = (__n128 *)v4[141];
  unint64_t v17 = v4[142];
  if ((unint64_t)v16 >= v17)
  {
    unint64_t v19 = (__n128 *)v4[140];
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (v16 - v19) + 1;
    if (v20 > 0x555555555555555) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (void)v19) >> 4);
    if (2 * v21 > v20) {
      unint64_t v20 = 2 * v21;
    }
    if (v21 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v22 = 0x555555555555555;
    }
    else {
      unint64_t v22 = v20;
    }
    __n128 v23 = a2;
    if (v22)
    {
      if (v22 > 0x555555555555555) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      __float2 v24 = (char *)operator new(48 * v22);
      __n128 v23 = a2;
    }
    else
    {
      __float2 v24 = 0;
    }
    double v25 = (__n128 *)&v24[16 * (v16 - v19)];
    v25->n128_u64[0] = v13;
    v25->n128_u64[1] = v14;
    v25[1].n128_f32[0] = v15;
    v25[2] = v23;
    __float2 v18 = v25 + 3;
    if (v16 != v19)
    {
      do
      {
        __n128 v26 = v16[-3];
        __n128 v27 = v16[-1];
        v25[-2] = v16[-2];
        v25[-1] = v27;
        v25[-3] = v26;
        v25 -= 3;
        v16 -= 3;
      }
      while (v16 != v19);
      float v16 = (__n128 *)v4[140];
    }
    v4[140] = v25;
    v4[141] = v18;
    v4[142] = &v24[48 * v22];
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    v16->n128_u64[0] = v11;
    v16->n128_u64[1] = v12;
    v16[1].n128_f32[0] = v15;
    __float2 v18 = v16 + 3;
    void v16[2] = a2;
  }
  v4[141] = v18;
}

void anonymous namespace'::face_id_animator_t::push_state(_anonymous_namespace_::face_id_animator_t *this)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  float64x2_t v2 = *((float64x2_t *)this + 38);
  v49[0] = *((float64x2_t *)this + 37);
  v49[1] = v2;
  LODWORD(v2.f64[0]) = *((_DWORD *)this + 91);
  unsigned int v3 = *((_DWORD *)this + 105);
  int v4 = *((_DWORD *)this + 119);
  LODWORD(v50) = *((_DWORD *)this + 77);
  *(void *)((char *)&v50 + 4) = __PAIR64__(v3, LODWORD(v2.f64[0]));
  HIDWORD(v50) = v4;
  int v51 = *((_DWORD *)this + 60);
  v2.f64[0] = *((float *)this + 183);
  *(double *)&long long v52 = *((float *)this + 169);
  *((void *)&v52 + 1) = *(void *)&v2.f64[0];
  uint64_t v5 = (_OWORD *)*((void *)this + 8);
  long long v6 = v57;
  v5[21] = v56;
  v5[22] = v6;
  long long v7 = *(_OWORD *)&v58[16];
  v5[23] = *(_OWORD *)v58;
  v5[24] = v7;
  long long v8 = *(_OWORD *)&__p[16];
  v5[17] = *(_OWORD *)__p;
  v5[18] = v8;
  long long v9 = v55;
  v5[19] = v54;
  v5[20] = v9;
  uint64_t v10 = *((void *)this + 8);
  *(_OWORD *)__p = v50;
  LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v10, (uint64_t)__p);
  uint64_t v11 = *((void *)this + 106);
  uint64_t v12 = *((void *)this + 107);
  if (v11 != v12)
  {
    __asm { FMOV            V0.4S, #1.0 }
    long long v43 = _Q0;
    do
    {
      long long v17 = 0uLL;
      memset(__p, 0, 24);
      uint64_t v18 = *(void *)(v11 + 208);
      uint64_t v19 = *(void *)(v11 + 216);
      unint64_t v48 = (void **)__p;
      if (v18 == v19)
      {
        uint64_t v20 = 0;
      }
      else
      {
        do
        {
          *(_OWORD *)float v46 = *(_OWORD *)(v18 + 64);
          _ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(&v48, v46);
          v18 += 96;
        }
        while (v18 != v19);
        uint64_t v20 = *(void *)__p;
        long long v17 = *(_OWORD *)&__p[8];
      }
      *(void *)float v46 = v20;
      *(_OWORD *)&v46[8] = v17;
      memset(__p, 0, 24);
      if ((unint64_t)(v17 - v20) <= 0x3F) {
        __break(1u);
      }
      long long v47 = *(_OWORD *)(v11 + 176);
      uint64_t v21 = *((void *)this + 8);
      LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t::state_t(__p, (uint64_t)v46);
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v21, (void *)v11, (long long **)__p);
      if (*(void *)__p)
      {
        *(void *)&__p[8] = *(void *)__p;
        operator delete(*(void **)__p);
      }
      unint64_t v22 = *(void **)(v11 + 8);
      __n128 v23 = *(void **)(v11 + 16);
LABEL_11:
      if (v22 != v23)
      {
        int8x8_t v24 = *(int8x8_t *)((char *)this + 1152);
        if (!*(void *)&v24) {
          goto LABEL_40;
        }
        unint64_t v25 = v22[1];
        uint8x8_t v26 = (uint8x8_t)vcnt_s8(v24);
        v26.i16[0] = vaddlv_u8(v26);
        if (v26.u32[0] > 1uLL)
        {
          unint64_t v27 = v22[1];
          if (v25 >= *(void *)&v24) {
            unint64_t v27 = v25 % *(void *)&v24;
          }
        }
        else
        {
          unint64_t v27 = (*(void *)&v24 - 1) & v25;
        }
        double v28 = *(void **)(*((void *)this + 143) + 8 * v27);
        if (!v28 || (uint64_t v29 = (void *)*v28) == 0) {
LABEL_40:
        }
          std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
        while (1)
        {
          unint64_t v30 = v29[1];
          if (v25 == v30)
          {
            if (v29[2] == *v22 && v29[3] == v25)
            {
              uint64_t v32 = *((void *)this + 109) + 288 * v29[4];
              long long v33 = *(_OWORD *)(v32 + 160);
              long long v34 = *(_OWORD *)(v32 + 256);
              uint64_t v35 = *((void *)this + 8);
              *(_DWORD *)&v58[24] = 0;
              uint64_t v59 = 0;
              *(_OWORD *)&v58[8] = v52;
              *(_DWORD *)char v58 = v51;
              long long v54 = v47;
              long long v55 = xmmword_214498B80;
              *(_OWORD *)__p = v47;
              *(_OWORD *)&__p[16] = v33;
              long long v56 = v43;
              long long v57 = v34;
              LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v35, v22, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
              v22 += 2;
              goto LABEL_11;
            }
          }
          else
          {
            if (v26.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&v24) {
                v30 %= *(void *)&v24;
              }
            }
            else
            {
              v30 &= *(void *)&v24 - 1;
            }
            if (v30 != v27) {
              goto LABEL_40;
            }
          }
          uint64_t v29 = (void *)*v29;
          if (!v29) {
            goto LABEL_40;
          }
        }
      }
      if (*(void *)v46)
      {
        *(void *)&v46[8] = *(void *)v46;
        operator delete(*(void **)v46);
      }
      v11 += 240;
    }
    while (v11 != v12);
  }
  uint64_t v36 = *((void *)this + 140);
  uint64_t v37 = *((void *)this + 141);
  if (v36 != v37)
  {
    long long v44 = *((_OWORD *)this + 67);
    long long v45 = *((_OWORD *)this + 61);
    __asm { FMOV            V0.4S, #1.0 }
    long long v42 = _Q0;
    do
    {
      int v39 = *(_DWORD *)(v36 + 16);
      long long v40 = *(_OWORD *)(v36 + 32);
      uint64_t v41 = *((void *)this + 8);
      *(_OWORD *)&v58[8] = xmmword_214498E20;
      *(_DWORD *)&v58[24] = 0;
      uint64_t v59 = 0;
      *(_DWORD *)char v58 = v39;
      long long v54 = v40;
      long long v55 = xmmword_214498B80;
      *(_OWORD *)__p = v40;
      *(_OWORD *)&__p[16] = v45;
      long long v56 = v42;
      long long v57 = v44;
      LAUI_uniform_cubic_b_spline_renderer::renderer_t::set_state(v41, (void *)v36, (LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t::state_t *)__p);
      v36 += 48;
    }
    while (v36 != v37);
  }
}

void sub_21448B76C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F188 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDnEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDnEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1A0 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSK_1EJS8_SF_SI_EEEEEEDcSM_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1B8 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EEC2IRKS1_EEOT_(uint64_t a1, long long *a2)
{
  long long v7 = a2[1];
  long long v8 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v7;
  float v3 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
  *(float *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 36) = 0;
  *(unsigned char *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  BOOL v4 = v3 <= 0.0;
  float v5 = INFINITY;
  if (v4) {
    float v5 = 0.0;
  }
  *(float *)(a1 + 48) = v5;
  *(float *)(a1 + 52) = v5;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = v7;
  *(_DWORD *)(a1 + 136) = 0;
  return a1;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 48)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  }
  float v6 = *(float *)a1;
  long long v7 = (_OWORD *)(a2 + 4);
  float v8 = *(float *)a2;
  if (*(float *)a1 == *(float *)a2)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(a1, (uint64_t)v7, a3);
  }
  else
  {
    float v9 = *(float *)(a2 + 28);
    if (v9 < 0.0) {
      operator new();
    }
    *(_OWORD *)uint64_t v12 = *v7;
    *(void *)&v12[16] = *(void *)(a2 + 20);
    *(_DWORD *)&v12[24] = 0;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (long long *)v12);
    float v10 = *(float *)a2;
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)&v12[12];
    *(_OWORD *)(a1 + 4) = *(_OWORD *)v12;
    if (*(float *)(a1 + 20) <= 0.0)
    {
      *(float *)(a1 + 32) = v10;
      *(float *)(a1 + 36) = v10;
    }
    else if (v9 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v9);
    }
  }
  return v6 != v8;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)(result + 48)) {
    uint64_t result = std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(result + 40);
  }
  if (a3)
  {
    uint64_t v15 = v5;
    uint64_t v6 = *(unsigned int *)(v5 + 48);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    float v16 = &v15;
    uint64_t result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_26C52F1D0 + v6))(&v16, v5 + 40);
    if (result)
    {
      float v7 = *(float *)(v5 + 28);
      float v8 = *(float *)(v5 + 20) - v7;
      float v9 = *(float *)(v5 + 24) - v7;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(v5, (long long *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t result, long long *a2)
{
  float v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  float v3 = *((float *)a2 + 4);
  BOOL v4 = (float *)(result + 4);
  if (*(float *)(result + 20) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    float v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    unsigned int v6 = (COERCE_INT(fabs(v5)) - 0x800000) >> 24;
    BOOL v7 = v5 < 0.0 || v6 > 0x7E;
    if (!v7 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      float v9 = *(float *)(result + 32);
      float v10 = (float)((float)(1.0 - v5) * *(float *)result) + (float)((float)(1.0 - (float)(1.0 - v5)) * v9);
      if (v9 == *(float *)result) {
        float v10 = *(float *)(result + 32);
      }
      *(float *)(result + 32) = v10;
    }
  }
  long long v11 = *a2;
  *(_OWORD *)(result + 16) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)BOOL v4 = v11;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0) {
      return result;
    }
  }
  else
  {
    *(_DWORD *)(result + 28) = 0;
    if (v3 > 0.0) {
      return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(result, v2);
    }
  }
  float v12 = *(float *)result;
  *(_DWORD *)(result + 32) = *(_DWORD *)result;
  *(float *)(result + 36) = v12;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  float v11 = a2;
  float v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 40;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F1D0 + v2))(v10, a1 + 40))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 48);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F1E8 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  }
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1A0 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 20) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1A0 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(float *result, float a2)
{
  float v3 = result[5];
  if (v3 <= 0.0) {
    goto LABEL_12;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = result;
    float v5 = result[7] + a2;
    result[7] = v5;
    if (v5 < v3)
    {
      float v6 = powf(result[1], a2);
      int v7 = 0;
      float v8 = fmax((float)(1.0 - v6), 0.0);
      float v9 = v4[8];
      float v10 = v4[9];
      float v11 = (float)(*v4 * v8) + (float)((float)(1.0 - v8) * v9);
      if (v9 == *v4) {
        float v11 = v4[8];
      }
      float v12 = (float)(v11 * v8) + (float)((float)(1.0 - v8) * v10);
      if (v10 == v11) {
        float v12 = v4[9];
      }
      v4[8] = v11;
      v4[9] = v12;
      BOOL v13 = v5 >= v4[6];
      return (float *)(v13 | (v7 << 8));
    }
    float v14 = nexttowardf(1.0, 0.0);
    float v15 = 0.0;
    float v16 = fmaxf(fminf(v14, 0.0), 0.0);
    if (v16 > 0.0) {
      float v15 = INFINITY;
    }
    v4[1] = v16;
    *((unsigned char *)v4 + 8) = 0;
    *((unsigned char *)v4 + 16) = 0;
    v4[5] = v15;
    void v4[6] = v15;
    v4[7] = 0.0;
    float v17 = *v4;
    v4[8] = *v4;
    v4[9] = v17;
LABEL_12:
    BOOL v13 = 1;
    int v7 = 1;
    return (float *)(v13 | (v7 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 28);
    *(float *)(*a2 + 28) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 28) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C4099C38B47);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_21448C25C(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C4099C38B47);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1A0 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 48)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  }
  float v6 = *(float *)a1;
  char v7 = (_OWORD *)(a2 + 4);
  float v8 = *(float *)a2;
  if (*(float *)a1 == *(float *)a2)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(a1, (uint64_t)v7, a3);
  }
  else
  {
    float v9 = *(float *)(a2 + 28);
    if (v9 < 0.0) {
      operator new();
    }
    *(_OWORD *)float v12 = *v7;
    *(void *)&v12[16] = *(void *)(a2 + 20);
    *(_DWORD *)&v12[24] = 0;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(a1, (long long *)v12);
    float v10 = *(float *)a2;
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)&v12[12];
    *(_OWORD *)(a1 + 4) = *(_OWORD *)v12;
    if (*(float *)(a1 + 20) <= 0.0)
    {
      *(float *)(a1 + 32) = v10;
      *(float *)(a1 + 36) = v10;
    }
    else if (v9 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(a1, v9);
    }
  }
  return v6 != v8;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 48)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 40);
  }
  if (a3)
  {
    uint64_t v15 = a1;
    uint64_t v6 = *(unsigned int *)(a1 + 48);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    float v16 = &v15;
    if (((unsigned int (*)(uint64_t **, uint64_t))*(&off_26C52F200 + v6))(&v16, a1 + 40))
    {
      float v7 = *(float *)(a1 + 28);
      float v8 = *(float *)(a1 + 20) - v7;
      float v9 = *(float *)(a1 + 24) - v7;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(a1, (long long *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_set_timing(uint64_t a1, long long *a2)
{
  float v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return;
  }
  float v5 = *((float *)a2 + 4);
  uint64_t v6 = a1 + 4;
  if (*(float *)(a1 + 20) > 0.0 && v5 > 0.0 && *(float *)v6 != *(float *)a2)
  {
    float v7 = (float)(*(float *)a2 * (float)(1.0 - *(float *)v6)) / (float)(*(float *)v6 * (float)(1.0 - *(float *)a2));
    unsigned int v8 = (COERCE_INT(fabs(v7)) - 0x800000) >> 24;
    BOOL v9 = v7 < 0.0 || v8 > 0x7E;
    if (!v9 || (LODWORD(v7) - 1) <= 0x7FFFFE)
    {
      float v11 = *(float *)(a1 + 32);
      float v12 = *(float *)a1;
      if (v11 == *(float *)a1)
      {
LABEL_45:
        *(float *)(a1 + 32) = v11;
        goto LABEL_46;
      }
      float v13 = 1.0 - v7;
      BOOL v14 = v11 < 0.0;
      if (v12 <= 0.0) {
        BOOL v14 = 0;
      }
      if (v12 < 0.0 && v11 > 0.0 || v14)
      {
        float v11 = (float)(v13 * v12) + (float)((float)(1.0 - v13) * v11);
        goto LABEL_45;
      }
      if (v11 == 0.0)
      {
        if (v13 <= 0.0) {
          goto LABEL_45;
        }
      }
      else if (v13 == 0.0)
      {
        goto LABEL_45;
      }
      if (v12 == 0.0)
      {
        if (v13 < 1.0)
        {
LABEL_29:
          BOOL v17 = v12 < 0.0 || v11 < 0.0;
          float v18 = fabsf(v11);
          float v19 = fabsf(v12);
          if (!v17)
          {
            float v18 = *(float *)(a1 + 32);
            float v19 = *(float *)a1;
          }
          if (v11 == 0.0) {
            float v20 = 1.1755e-38;
          }
          else {
            float v20 = v18;
          }
          if (v12 == 0.0) {
            float v21 = 1.1755e-38;
          }
          else {
            float v21 = v19;
          }
          float v22 = powf(v20, 1.0 - v13);
          float v23 = v22 * powf(v21, v13);
          float v11 = -v23;
          if (!v17) {
            float v11 = v23;
          }
          goto LABEL_45;
        }
      }
      else if (v13 != 1.0)
      {
        goto LABEL_29;
      }
      float v11 = *(float *)a1;
      goto LABEL_45;
    }
  }
LABEL_46:
  long long v24 = *a2;
  *(_OWORD *)(v6 + 12) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)uint64_t v6 = v24;
  if (v2 <= 0.0)
  {
    if (v5 > 0.0) {
      return;
    }
    goto LABEL_52;
  }
  *(_DWORD *)(a1 + 28) = 0;
  if (v5 <= 0.0)
  {
LABEL_52:
    float v25 = *(float *)a1;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)a1;
    *(float *)(a1 + 36) = v25;
    return;
  }
  LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(a1, v2);
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(uint64_t a1, float a2)
{
  float v11 = a2;
  float v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 40;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F200 + v2))(v10, a1 + 40))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 48);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F218 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 20) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIfLNS8_27animator_interpolation_typeE1EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIfEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update(float *result, float a2)
{
  float v3 = result[5];
  if (v3 <= 0.0) {
    goto LABEL_18;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = result;
    float v5 = result[7] + a2;
    result[7] = v5;
    if (v5 < v3)
    {
      float v6 = fmax((float)(1.0 - powf(result[1], a2)), 0.0);
      float v7 = v4[8];
      float v8 = *v4;
      if (v7 == *v4) {
        goto LABEL_40;
      }
      BOOL v9 = v7 < 0.0;
      if (v8 <= 0.0) {
        BOOL v9 = 0;
      }
      if (v8 < 0.0 && v7 > 0.0 || v9)
      {
        float v7 = (float)(v8 * v6) + (float)((float)(1.0 - v6) * v7);
        goto LABEL_40;
      }
      if (v7 == 0.0)
      {
        if (v6 <= 0.0) {
          goto LABEL_40;
        }
      }
      else if (v6 == 0.0)
      {
        goto LABEL_40;
      }
      if (v8 == 0.0)
      {
        if (v6 < 1.0)
        {
LABEL_25:
          BOOL v18 = v8 < 0.0 || v7 < 0.0;
          float v19 = fabsf(v7);
          float v20 = fabsf(v8);
          if (!v18)
          {
            float v19 = v4[8];
            float v20 = *v4;
          }
          if (v7 == 0.0) {
            float v19 = 1.1755e-38;
          }
          if (v8 == 0.0) {
            float v21 = 1.1755e-38;
          }
          else {
            float v21 = v20;
          }
          float v22 = powf(v19, 1.0 - v6);
          float v7 = v22 * powf(v21, v6);
          if (v18) {
            float v7 = -v7;
          }
LABEL_40:
          v4[8] = v7;
          float v23 = v4[9];
          if (v23 == v7)
          {
LABEL_73:
            int v17 = 0;
            v4[9] = v23;
            BOOL v16 = v5 >= v4[6];
            return (float *)(v16 | (v17 << 8));
          }
          BOOL v24 = v7 > 0.0;
          if (v23 >= 0.0) {
            BOOL v24 = 0;
          }
          if (v23 > 0.0 && v7 < 0.0 || v24)
          {
            float v23 = (float)(v7 * v6) + (float)((float)(1.0 - v6) * v23);
            goto LABEL_73;
          }
          if (v23 == 0.0)
          {
            if (v6 <= 0.0) {
              goto LABEL_73;
            }
          }
          else if (v6 == 0.0)
          {
            goto LABEL_73;
          }
          if (v7 == 0.0)
          {
            if (v6 < 1.0)
            {
LABEL_57:
              BOOL v27 = v23 < 0.0 || v7 < 0.0;
              float v28 = fabsf(v23);
              float v29 = fabsf(v7);
              if (!v27)
              {
                float v28 = v4[9];
                float v29 = v7;
              }
              if (v23 == 0.0) {
                float v30 = 1.1755e-38;
              }
              else {
                float v30 = v28;
              }
              if (v7 == 0.0) {
                float v31 = 1.1755e-38;
              }
              else {
                float v31 = v29;
              }
              float v32 = powf(v30, 1.0 - v6);
              float v33 = v32 * powf(v31, v6);
              float v23 = -v33;
              if (!v27) {
                float v23 = v33;
              }
              goto LABEL_73;
            }
          }
          else if (v6 != 1.0)
          {
            goto LABEL_57;
          }
          float v23 = v7;
          goto LABEL_73;
        }
      }
      else if (v6 != 1.0)
      {
        goto LABEL_25;
      }
      float v7 = *v4;
      goto LABEL_40;
    }
    float v12 = nexttowardf(1.0, 0.0);
    float v13 = 0.0;
    float v14 = fmaxf(fminf(v12, 0.0), 0.0);
    if (v14 > 0.0) {
      float v13 = INFINITY;
    }
    v4[1] = v14;
    *((unsigned char *)v4 + 8) = 0;
    *((unsigned char *)v4 + 16) = 0;
    v4[5] = v13;
    void v4[6] = v13;
    v4[7] = 0.0;
    float v15 = *v4;
    v4[8] = *v4;
    v4[9] = v15;
LABEL_18:
    BOOL v16 = 1;
    int v17 = 1;
    return (float *)(v16 | (v17 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 28);
    *(float *)(*a2 + 28) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 28) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C4099C38B47);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_21448CE04(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C4099C38B47);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(float)::{lambda(float &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 48)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 40);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_timing(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 136)) {
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 128);
  }
  float64x2_t v6 = *(float64x2_t *)a2;
  float64x2_t v7 = *(float64x2_t *)(a2 + 16);
  double v8 = vmulq_f64(*(float64x2_t *)(a1 + 16), v7).f64[0];
  double v9 = v8 + vaddvq_f64(vmulq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2));
  uint64_t v10 = (_OWORD *)(a2 + 32);
  if (v9 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)v10, a3);
  }
  else
  {
    float v11 = *(float *)(a2 + 56);
    if (v11 < 0.0) {
      operator new();
    }
    *(_OWORD *)float v15 = *v10;
    *(void *)&v15[16] = *(void *)(a2 + 48);
    *(_DWORD *)&v15[24] = 0;
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (long long *)v15, *(double *)v15, v8, v6, v7);
    float64x2_t v12 = *(float64x2_t *)a2;
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(_OWORD *)(a1 + 44) = *(_OWORD *)&v15[12];
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v15;
    if (*(float *)(a1 + 48) <= 0.0)
    {
      *(float64x2_t *)(a1 + 64) = v12;
      *(_OWORD *)(a1 + 80) = v13;
      *(float64x2_t *)(a1 + 96) = v12;
      *(_OWORD *)(a1 + 112) = v13;
    }
    else if (v11 > 0.0)
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(a1, v11);
    }
  }
  return v9 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)(result + 136)) {
    uint64_t result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 128);
  }
  if (a3)
  {
    uint64_t v15 = v5;
    uint64_t v6 = *(unsigned int *)(v5 + 136);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    BOOL v16 = &v15;
    uint64_t result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_26C52F230 + v6))(&v16, v5 + 128);
    if (result)
    {
      float v11 = *(float *)(v5 + 56);
      *(float *)&double v7 = *(float *)(v5 + 48) - v11;
      *(float *)v9.f64 = *(float *)(v5 + 52) - v11;
      LODWORD(v8) = *(_DWORD *)(a2 + 24);
      float v12 = *(float *)(a2 + 16) - *(float *)&v8;
      *(float *)v10.f64 = *(float *)(a2 + 20) - *(float *)&v8;
      if ((a3 & 2) != 0 && (v12 < *(float *)&v7 || *(float *)v10.f64 < *(float *)v9.f64)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v12 > *(float *)&v7 || *(float *)v10.f64 > *(float *)v9.f64))
      {
LABEL_16:
        if (*(float *)&v8 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (long long *)a2, v7, v8, v9, v10);
        }
        else if ((float)(*(float *)&v7 + *(float *)&v8) > 0.0)
        {
          operator new();
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, long long *a2, double a3, double a4, float64x2_t a5, float64x2_t a6)
{
  float v6 = *((float *)a2 + 6);
  if (v6 < 0.0)
  {
    __break(1u);
    return result;
  }
  float v7 = *((float *)a2 + 4);
  double v8 = (float *)(result + 32);
  if (*(float *)(result + 48) > 0.0 && v7 > 0.0 && *v8 != *(float *)a2)
  {
    *(float *)a6.f64 = (float)(*(float *)a2 * (float)(1.0 - *v8)) / (float)(*v8 * (float)(1.0 - *(float *)a2));
    unsigned int v9 = (COERCE_INT(fabs(*(float *)a6.f64)) - 0x800000) >> 24;
    BOOL v10 = SLODWORD(a6.f64[0]) < 0 || v9 > 0x7E;
    if (!v10 || (LODWORD(a6.f64[0]) - 1) <= 0x7FFFFE)
    {
      float64x2_t v12 = *(float64x2_t *)(result + 64);
      float64x2_t v13 = *(float64x2_t *)(result + 80);
      float64x2_t v14 = *(float64x2_t *)(result + 16);
      double v15 = vmulq_f64(v13, v14).f64[0] + vaddvq_f64(vmulq_f64(v12, *(float64x2_t *)result));
      *(float *)a6.f64 = 1.0 - *(float *)a6.f64;
      a5.f64[0] = (float)(1.0 - *(float *)a6.f64);
      a6.f64[0] = *(float *)a6.f64;
      float64x2_t v16 = vmulq_n_f64(*(float64x2_t *)result, a6.f64[0]);
      *(void *)&a6.f64[0] = *(_OWORD *)&vmlaq_f64(vmulq_f64(a6, v14), v13, a5);
      int8x16_t v17 = (int8x16_t)vmlaq_n_f64(v16, v12, a5.f64[0]);
      int8x16_t v18 = vextq_s8(v17, v17, 8uLL);
      *(void *)&double v19 = vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL).u64[0];
      if (v15 == 1.0) {
        *(double *)v18.i64 = v19;
      }
      else {
        v12.f64[0] = *(double *)v17.i64;
      }
      *(void *)&v12.f64[1] = v18.i64[0];
      if (v15 == 1.0) {
        v18.i64[0] = *(void *)(result + 80);
      }
      else {
        *(double *)v18.i64 = a6.f64[0];
      }
      *(float64x2_t *)(result + 64) = v12;
      *(int8x16_t *)(result + 80) = v18;
    }
  }
  long long v20 = *a2;
  *(_OWORD *)(result + 44) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)double v8 = v20;
  if (v6 <= 0.0)
  {
    if (v7 > 0.0) {
      return result;
    }
  }
  else
  {
    *(_DWORD *)(result + 56) = 0;
    if (v7 > 0.0) {
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(result, v6);
    }
  }
  float64x2_t v21 = *(float64x2_t *)result;
  long long v22 = *(_OWORD *)(result + 16);
  *(_OWORD *)(result + 64) = *(_OWORD *)result;
  *(_OWORD *)(result + 80) = v22;
  *(float64x2_t *)(result + 96) = v21;
  *(_OWORD *)(result + 112) = v22;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  float v11 = a2;
  float64x2_t v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 136);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 128;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F230 + v2))(v10, a1 + 128))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 136);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float64x2_t v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F248 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  }
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1B8 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 48) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1B8 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3 = result[12];
  if (v3 <= 0.0) {
    goto LABEL_18;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = result;
    float v5 = result[14] + a2;
    result[14] = v5;
    if (v5 < v3)
    {
      *(float *)v12.f64 = powf(result[8], a2);
      int v6 = 0;
      *(float *)v12.f64 = fmax((float)(1.0 - *(float *)v12.f64), 0.0);
      float64x2_t v7 = *(float64x2_t *)(v4 + 16);
      float64x2_t v8 = *(float64x2_t *)(v4 + 20);
      float64x2_t v9 = *(float64x2_t *)(v4 + 4);
      BOOL v10 = vmulq_f64(v8, v9).f64[0] + vaddvq_f64(vmulq_f64(v7, *(float64x2_t *)v4)) == 1.0;
      v11.f64[0] = (float)(1.0 - *(float *)v12.f64);
      v12.f64[0] = *(float *)v12.f64;
      *(void *)&double v13 = *(_OWORD *)&vmlaq_f64(vmulq_f64(v9, v12), v8, v11);
      int8x16_t v14 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)v4, v12.f64[0]), v7, v11.f64[0]);
      unint64_t v15 = vextq_s8(v14, v14, 8uLL).u64[0];
      unint64_t v16 = vextq_s8((int8x16_t)v7, (int8x16_t)v7, 8uLL).u64[0];
      if (v10)
      {
        float64_t v17 = *(double *)&v16;
      }
      else
      {
        v7.f64[0] = *(double *)v14.i64;
        float64_t v17 = *(double *)&v15;
      }
      if (!v10) {
        v8.f64[0] = v13;
      }
      v18.f64[0] = v7.f64[0];
      v18.f64[1] = v17;
      *((float64x2_t *)v4 + 4) = v18;
      *((float64x2_t *)v4 + 5) = v8;
      float64x2_t v20 = *(float64x2_t *)(v4 + 24);
      float64x2_t v19 = *(float64x2_t *)(v4 + 28);
      double v21 = vmulq_f64(v8, v19).f64[0] + vaddvq_f64(vmulq_f64(v18, v20));
      v7.f64[1] = v17;
      float64x2_t v22 = vmulq_n_f64(v7, v12.f64[0]);
      float64x2_t v23 = vmlaq_f64(vmulq_f64(v12, v8), v19, v11);
      int8x16_t v24 = (int8x16_t)vmlaq_n_f64(v22, v20, v11.f64[0]);
      unint64_t v25 = vextq_s8(v24, v24, 8uLL).u64[0];
      unint64_t v26 = vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL).u64[0];
      if (v21 == 1.0)
      {
        v24.i64[0] = *((void *)v4 + 12);
        unint64_t v25 = v26;
      }
      v24.i64[1] = v25;
      if (v21 == 1.0) {
        v23.f64[0] = *((float64_t *)v4 + 14);
      }
      *((int8x16_t *)v4 + 6) = v24;
      *((float64x2_t *)v4 + 7) = v23;
      BOOL v27 = v5 >= v4[13];
      return (float *)(v27 | (v6 << 8));
    }
    float v28 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    v4[8] = v28;
    *((unsigned char *)v4 + 36) = 0;
    BOOL v29 = v28 <= 0.0;
    float v30 = INFINITY;
    if (v29) {
      float v30 = 0.0;
    }
    *((unsigned char *)v4 + 44) = 0;
    v4[12] = v30;
    v4[13] = v30;
    v4[14] = 0.0;
    float64x2_t v31 = *(float64x2_t *)v4;
    long long v32 = *((_OWORD *)v4 + 1);
    *((_OWORD *)v4 + 4) = *(_OWORD *)v4;
    *((_OWORD *)v4 + 5) = v32;
    *((float64x2_t *)v4 + 6) = v31;
    *((_OWORD *)v4 + 7) = v32;
LABEL_18:
    BOOL v27 = 1;
    int v6 = 1;
    return (float *)(v27 | (v6 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 56);
    *(float *)(*a2 + 56) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 56) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 136)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 128);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C4001F72B7BLL);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_21448D818(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C4001F72B7BLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 136)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 128);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_dEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F1B8 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *std::vector<anonymous namespace'::face_id_animator_t::ring_context_t>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v6 + v7;
      float v9 = (_OWORD *)(v6 + v7 - 288);
      long long v10 = *(_OWORD *)(v4 + v7 - 272);
      _OWORD *v9 = *(_OWORD *)(v4 + v7 - 288);
      v9[1] = v10;
      long long v11 = *(_OWORD *)(v4 + v7 - 256);
      long long v12 = *(_OWORD *)(v4 + v7 - 240);
      *(void *)(v8 - 224) = *(void *)(v4 + v7 - 224);
      *(_OWORD *)(v8 - 256) = v11;
      *(_OWORD *)(v8 - 240) = v12;
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(v6 + v7 - 216, v4 + v7 - 216);
      *(_DWORD *)(v8 - 200) = *(_DWORD *)(v4 + v7 - 200);
      *(_OWORD *)(v8 - 192) = *(_OWORD *)(v4 + v7 - 192);
      long long v13 = *(_OWORD *)(v4 + v7 - 176);
      long long v14 = *(_OWORD *)(v4 + v7 - 160);
      long long v15 = *(_OWORD *)(v4 + v7 - 128);
      *(_OWORD *)(v8 - 144) = *(_OWORD *)(v4 + v7 - 144);
      *(_OWORD *)(v8 - 128) = v15;
      *(_OWORD *)(v8 - 176) = v13;
      *(_OWORD *)(v8 - 160) = v14;
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(v6 + v7 - 112, v4 + v7 - 112);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(v4 + v7 - 96);
      long long v16 = *(_OWORD *)(v4 + v7 - 80);
      long long v17 = *(_OWORD *)(v4 + v7 - 64);
      long long v18 = *(_OWORD *)(v4 + v7 - 32);
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(v4 + v7 - 48);
      *(_OWORD *)(v8 - 32) = v18;
      *(_OWORD *)(v8 - 80) = v16;
      *(_OWORD *)(v8 - 64) = v17;
      uint64_t result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 + v7 - 16, v4 + v7 - 16);
      v7 -= 288;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  uint64_t v19 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v19;
  uint64_t v20 = v3[1];
  v3[1] = a2[2];
  a2[2] = v20;
  uint64_t v21 = v3[2];
  v3[2] = a2[3];
  a2[3] = v21;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<anonymous namespace'::face_id_animator_t::ring_context_t>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 288;
    _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(i - 16);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(i - 112);
    std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(i - 216);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(a1, a2);
  return a1;
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 8);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*(&off_26C52F1A0 + v4))(&v7, result);
  }
  *(_DWORD *)(v3 + 8) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_26C52F260 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISJ_LNS0_6_TraitE1EEEEEvRSK_OT_EUlRSQ_OT0_E_JRNS0_6__baseILSN_1EJS8_SF_SI_EEEOSY_EEEDcSQ_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIfEENS_14default_deleteISC_EEEENS9_INSA_18animation_timing_tENSD_ISG_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISJ_LNS0_6_TraitE1EEEEEvRSK_OT_EUlRSQ_OT0_E_JRNS0_6__baseILSN_1EJS8_SF_SI_EEEOSY_EEEDcSQ_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::__move_constructor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(a1, a2);
  return a1;
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__move_constructor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 8);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*(&off_26C52F278 + v4))(&v7, result);
  }
  *(_DWORD *)(v3 + 8) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_26C52F290 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSM_1EJS8_SH_SK_EEEEEEDcSO_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSM_1EJS8_SH_SK_EEEEEEDcSO_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISL_LNS0_6_TraitE1EEEEEvRSM_OT_EUlRSS_OT0_E_JRNS0_6__baseILSP_1EJS8_SH_SK_EEEOS10_EEEDcSS_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIN4simd5quatfEEENS_14default_deleteISE_EEEENS9_INSA_18animation_timing_tENSF_ISI_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISL_LNS0_6_TraitE1EEEEEvRSM_OT_EUlRSS_OT0_E_JRNS0_6__baseILSP_1EJS8_SH_SK_EEEOS10_EEEDcSS_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(a1, a2);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 8);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*(&off_26C52F2A8 + v4))(&v7, result);
  }
  *(_DWORD *)(v3 + 8) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_26C52F2C0 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F2A8 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F278 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

BOOL std::allocator_traits<std::allocator<anonymous namespace'::face_id_animator_t::ring_context_t>>::construct[abi:ne180100]<anonymous namespace'::face_id_animator_t::ring_context_t,anonymous namespace'::face_id_animator_t::ring_context_t::static_state_t,anonymous namespace'::face_id_state_t &,void,void>(uint64_t a1, unsigned __int8 *a2, int8x16_t *a3)
{
  __int32 v5 = *a2;
  *(unsigned char *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 0;
  float v6 = nexttowardf(1.0, 0.0);
  *(_OWORD *)(a1 + 96) = xmmword_214498B80;
  uint64_t v7 = a1 + 96;
  v8.i32[1] = 0;
  float v9 = fmaxf(fminf(v6, 0.0), 0.0);
  *(void *)(v7 - 80) = 0;
  *(void *)(v7 - 72) = 0;
  *(_DWORD *)(v7 - 64) = 0;
  *(float *)(v7 - 60) = v9;
  *(unsigned char *)(v7 - 56) = 0;
  *(unsigned char *)(v7 - 48) = 0;
  if (v9 <= 0.0) {
    float v10 = 0.0;
  }
  else {
    float v10 = INFINITY;
  }
  *(float *)(v7 - 44) = v10;
  *(float *)(v7 - 40) = v10;
  *(void *)(v7 - 36) = 0;
  *(_DWORD *)(v7 - 28) = 0;
  *(_DWORD *)(v7 - 16) = 0;
  *(_DWORD *)(v7 - 8) = 0;
  *(float *)(v7 + 16) = v9;
  *(unsigned char *)(v7 + 20) = 0;
  *(unsigned char *)(v7 + 28) = 0;
  *(_DWORD *)(v7 + 40) = 0;
  *(float *)(v7 + 32) = v10;
  *(float *)(v7 + 36) = v10;
  int8x16_t v11 = *(int8x16_t *)v7;
  *(_OWORD *)(v7 + 48) = *(_OWORD *)v7;
  *(int8x16_t *)(v7 + 64) = v11;
  *(_DWORD *)(v7 + 88) = 0;
  *(_DWORD *)(v7 + 96) = 0;
  *(void *)(v7 + 104) = 0;
  *(_DWORD *)(v7 + 100) = 0;
  *(float *)(v7 + 112) = v9;
  *(unsigned char *)(v7 + 116) = 0;
  *(unsigned char *)(v7 + 124) = 0;
  *(_DWORD *)(v7 + 136) = 0;
  *(float *)(v7 + 128) = v10;
  *(float *)(v7 + 132) = v10;
  *(_DWORD *)(v7 + 184) = 0;
  v11.i32[1] = 0;
  v11.i64[1] = 0;
  *(_OWORD *)(v7 + 144) = 0u;
  *(_OWORD *)(v7 + 160) = 0u;
  unsigned int v12 = a3[4].u8[8];
  if (v12 > 6) {
    goto LABEL_11;
  }
  if (((1 << v12) & 0x37) != 0)
  {
    v11.i32[0] = 0;
    v8.i32[0] = v5;
    int8x16_t v13 = *a3;
    v13.i32[3] = 0;
    int8x16_t v16 = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v8, v11), 0), v13, *a3);
    if (v12 != 3) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v12 != 3)
    {
LABEL_12:
      int8x16_t v14 = *a3;
      v14.i32[3] = 0;
      int8x16_t v16 = v14;
      goto LABEL_13;
    }
    int8x16_t v16 = *a3;
  }
  if (a3[3].i64[1] >= 0xAuLL)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  long long v17 = xmmword_214498B80;
  float v18 = v9;
  char v19 = 0;
  char v20 = 0;
  int v23 = 0;
  float v21 = v10;
  float v22 = v10;
  LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v7, (float32x4_t *)&v17, 0);
  long long v17 = (__int128)v16;
  float v18 = v9;
  char v19 = 0;
  char v20 = 0;
  int v23 = 0;
  float v21 = v10;
  float v22 = v10;
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v7 + 96, (float32x4_t *)&v17, 0);
}

uint64_t anonymous namespace'::ring_updater_t<0ul,true,true>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 562.5) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EB0, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v38 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  uint64_t v11 = 0;
  float32x4_t v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v39), v10.__sinval);
  int32x4_t v13 = (int32x4_t)vnegq_f32(v38);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  float32x4_t v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  float32x4_t v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  float32x4_t v18 = vmulq_f32(v17, (float32x4_t)xmmword_214498ED0);
  int32x4_t v19 = (int32x4_t)vnegq_f32(v18);
  int8x16_t v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  float32x4_t v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  float32x4_t v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  float32x4_t v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  int32x4_t v24 = (int32x4_t)vnegq_f32(v23);
  int8x16_t v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  float32x4_t v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  float32x4_t v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  float32x4_t v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_214498BB0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  float v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  float32x4_t v30 = vmlaq_n_f32((float32x4_t)xmmword_214498EF0, (float32x4_t)xmmword_214498EE0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  float32x4_t v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_214498F00, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  float32x4_t v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_214498F10, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    float32x4_t v42 = v32;
    float v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      float v34 = v33 / 12.92;
    }
    else
    {
      float32x4_t v40 = v32;
      float v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      float32x4_t v32 = v40;
    }
    float32x4_t v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    float32x4_t v35 = v41;
    float32x4_t v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    float32x4_t v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 675000.0) {
    *a2 = fmodf(*a2, 675000.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<1ul,true,true>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 562.5) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498F20, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v38 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  uint64_t v11 = 0;
  float32x4_t v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v39), v10.__sinval);
  int32x4_t v13 = (int32x4_t)vnegq_f32(v38);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  float32x4_t v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  float32x4_t v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  float32x4_t v18 = vmulq_f32(v17, (float32x4_t)xmmword_214498ED0);
  int32x4_t v19 = (int32x4_t)vnegq_f32(v18);
  int8x16_t v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  float32x4_t v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  float32x4_t v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  float32x4_t v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  int32x4_t v24 = (int32x4_t)vnegq_f32(v23);
  int8x16_t v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  float32x4_t v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  float32x4_t v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  float32x4_t v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_214498B90);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  float v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  float32x4_t v30 = vmlaq_n_f32((float32x4_t)xmmword_214498EF0, (float32x4_t)xmmword_214498EE0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  float32x4_t v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_214498F00, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  float32x4_t v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_214498F10, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    float32x4_t v42 = v32;
    float v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      float v34 = v33 / 12.92;
    }
    else
    {
      float32x4_t v40 = v32;
      float v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      float32x4_t v32 = v40;
    }
    float32x4_t v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    float32x4_t v35 = v41;
    float32x4_t v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    float32x4_t v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 675000.0) {
    *a2 = fmodf(*a2, 675000.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<0ul,true,false>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 562.5) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EB0, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v17 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  float32x4_t v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v18), v10.__sinval);
  int32x4_t v12 = (int32x4_t)vnegq_f32(v17);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  float32x4_t v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 675000.0) {
    *a2 = fmodf(*a2, 675000.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<1ul,true,false>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 562.5) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498F20, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v17 = v9;
  v9.f32[0] = (float)(v4 / 1200.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  float32x4_t v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v18), v10.__sinval);
  int32x4_t v12 = (int32x4_t)vnegq_f32(v17);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  float32x4_t v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 675000.0) {
    *a2 = fmodf(*a2, 675000.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<0ul,false,true>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 1280.0) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EB0, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v38 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  uint64_t v11 = 0;
  float32x4_t v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v39), v10.__sinval);
  int32x4_t v13 = (int32x4_t)vnegq_f32(v38);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  float32x4_t v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  float32x4_t v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  float32x4_t v18 = vmulq_f32(v17, (float32x4_t)xmmword_214498ED0);
  int32x4_t v19 = (int32x4_t)vnegq_f32(v18);
  int8x16_t v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  float32x4_t v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  float32x4_t v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  float32x4_t v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  int32x4_t v24 = (int32x4_t)vnegq_f32(v23);
  int8x16_t v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  float32x4_t v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  float32x4_t v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  float32x4_t v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_214498BB0);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  float v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  float32x4_t v30 = vmlaq_n_f32((float32x4_t)xmmword_214498EF0, (float32x4_t)xmmword_214498EE0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  float32x4_t v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_214498F00, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  float32x4_t v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_214498F10, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    float32x4_t v42 = v32;
    float v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      float v34 = v33 / 12.92;
    }
    else
    {
      float32x4_t v40 = v32;
      float v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      float32x4_t v32 = v40;
    }
    float32x4_t v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    float32x4_t v35 = v41;
    float32x4_t v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    float32x4_t v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 3366400.0) {
    *a2 = fmodf(*a2, 3366400.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<1ul,false,true>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 1280.0) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v39) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498F20, v39), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v38 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  uint64_t v11 = 0;
  float32x4_t v12 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v39), v10.__sinval);
  int32x4_t v13 = (int32x4_t)vnegq_f32(v38);
  int8x16_t v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v38, vtrn1q_s32((int32x4_t)v38, v13));
  float32x4_t v15 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v38, (int8x16_t)v13, 8uLL), *(float32x2_t *)v12.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v12.f32[0]);
  float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v38);
  v16.i32[0] = v13.i32[1];
  v16.i32[3] = v13.i32[2];
  float32x4_t v17 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v38, v10.__cosval), v16, v12, 2), v15);
  a1[1] = v17;
  float32x4_t v18 = vmulq_f32(v17, (float32x4_t)xmmword_214498ED0);
  int32x4_t v19 = (int32x4_t)vnegq_f32(v18);
  int8x16_t v20 = (int8x16_t)vtrn2q_s32((int32x4_t)v18, vtrn1q_s32((int32x4_t)v18, v19));
  float32x4_t v21 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v19, 8uLL), (float32x4_t)0);
  float32x4_t v22 = (float32x4_t)vrev64q_s32((int32x4_t)v18);
  v22.i32[0] = v19.i32[1];
  v22.i32[3] = v19.i32[2];
  float32x4_t v23 = vaddq_f32(v22, vmlaq_f32(v21, (float32x4_t)0, (float32x4_t)vextq_s8(v20, v20, 8uLL)));
  int32x4_t v24 = (int32x4_t)vnegq_f32(v23);
  int8x16_t v25 = (int8x16_t)vtrn2q_s32((int32x4_t)v23, vtrn1q_s32((int32x4_t)v23, v24));
  float32x4_t v26 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v24, 8uLL), *(float32x2_t *)v17.f32, 1), (float32x4_t)vextq_s8(v25, v25, 8uLL), v17.f32[0]);
  float32x4_t v27 = (float32x4_t)vrev64q_s32((int32x4_t)v23);
  v27.i32[0] = v24.i32[1];
  v27.i32[3] = v24.i32[2];
  float32x4_t v28 = vmulq_f32(vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v23, v17, 3), v27, v17, 2), v26), (float32x4_t)xmmword_214498B90);
  v28.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0];
  *(float *)v24.i32 = fminf(fmaxf((float)(v28.f32[0] + 1.0) / 0.7, 0.0), 1.0);
  float v29 = fminf(fmaxf((float)(v28.f32[0] + 0.3) / 0.6, 0.0), 1.0);
  v28.f32[0] = fminf(fmaxf((float)(v28.f32[0] + -0.3) / 0.7, 0.0), 1.0);
  float32x4_t v30 = vmlaq_n_f32((float32x4_t)xmmword_214498EF0, (float32x4_t)xmmword_214498EE0, (float)(*(float *)v24.i32 * *(float *)v24.i32) * (float)((float)(*(float *)v24.i32 * -2.0) + 3.0));
  float32x4_t v31 = vmlaq_n_f32(v30, vsubq_f32((float32x4_t)xmmword_214498F00, v30), (float)(v29 * v29) * (float)((float)(v29 * -2.0) + 3.0));
  float32x4_t v32 = vmlaq_n_f32(v31, vsubq_f32((float32x4_t)xmmword_214498F10, v31), (float)(v28.f32[0] * v28.f32[0]) * (float)((float)(v28.f32[0] * -2.0) + 3.0));
  do
  {
    float32x4_t v42 = v32;
    float v33 = *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
    if (v33 <= 0.04045)
    {
      float v34 = v33 / 12.92;
    }
    else
    {
      float32x4_t v40 = v32;
      float v34 = powf((float)(v33 + 0.055) / 1.055, 2.4);
      float32x4_t v32 = v40;
    }
    float32x4_t v41 = v32;
    *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v34;
    float32x4_t v35 = v41;
    float32x4_t v36 = v41;
    v36.i32[3] = v32.i32[3];
    ++v11;
    float32x4_t v32 = v36;
  }
  while (v11 != 3);
  v35.i32[3] = 1.0;
  a1[5] = v35;
  if (*a2 >= 3366400.0) {
    *a2 = fmodf(*a2, 3366400.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<0ul,false,false>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 1280.0) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EB0, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v17 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  float32x4_t v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v18), v10.__sinval);
  int32x4_t v12 = (int32x4_t)vnegq_f32(v17);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  float32x4_t v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 3366400.0) {
    *a2 = fmodf(*a2, 3366400.0);
  }
  return 0;
}

uint64_t anonymous namespace'::ring_updater_t<1ul,false,false>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  float v5 = (float)(*a2 / 1280.0) * 6.28318531;
  float32x2_t v6 = vrsqrte_f32((float32x2_t)0x40000000);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v6, v6)));
  LODWORD(v18) = vmul_f32(v7, vrsqrts_f32((float32x2_t)0x40000000, vmul_f32(v7, v7))).u32[0];
  __float2 v8 = __sincosf_stret(v5 * 0.5);
  float32x4_t v9 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498F20, v18), v8.__sinval);
  v9.i32[3] = LODWORD(v8.__cosval);
  float32x4_t v17 = v9;
  v9.f32[0] = (float)(v4 / 2630.0) * 6.28318531;
  __float2 v10 = __sincosf_stret(v9.f32[0] * 0.5);
  float32x4_t v11 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_214498EC0, v18), v10.__sinval);
  int32x4_t v12 = (int32x4_t)vnegq_f32(v17);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v17, vtrn1q_s32((int32x4_t)v17, v12));
  float32x4_t v14 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v12, 8uLL), *(float32x2_t *)v11.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v11.f32[0]);
  float32x4_t v15 = (float32x4_t)vrev64q_s32((int32x4_t)v17);
  v15.i32[0] = v12.i32[1];
  v15.i32[3] = v12.i32[2];
  a1[1] = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v17, v10.__cosval), v15, v11, 2), v14);
  if (*a2 >= 3366400.0) {
    *a2 = fmodf(*a2, 3366400.0);
  }
  return 0;
}

uint64_t anonymous namespace'::coplanar_ring_updater<false>::function(float32x4_t *a1, float *a2)
{
  float v3 = *a2;
  if (*a2 >= 1000.0)
  {
    float v3 = fmodf(v3, 1000.0);
    *a2 = v3;
  }
  float v5 = v3 * 0.00628318531;
  __float2 v6 = __sincosf_stret(v5 * 0.5);
  float32x4_t v7 = vmulq_n_f32((float32x4_t)xmmword_214498F30, v6.__sinval);
  v7.i32[3] = LODWORD(v6.__cosval);
  a1[1] = v7;
  return 0;
}

BOOL LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(uint64_t a1, float32x4_t *a2, int a3)
{
  if (*(_DWORD *)(a1 + 88)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 80);
  }
  f32 = (_OWORD *)a2[1].f32;
  int8x16_t v7 = (int8x16_t)vmulq_f32(*(float32x4_t *)a1, *a2);
  float v8 = vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
  if (v8 == 1.0)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(a1, (uint64_t)f32, a3);
  }
  else
  {
    float v9 = a2[2].f32[2];
    if (v9 < 0.0) {
      operator new();
    }
    *(_OWORD *)int8x16_t v13 = *f32;
    *(void *)&v13[16] = a2[2].i64[0];
    *(_DWORD *)&v13[24] = 0;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (long long *)v13, *(float32x4_t *)v13);
    *(_OWORD *)int32x4_t v12 = *(_OWORD *)v13;
    *(_OWORD *)&v12[12] = *(_OWORD *)&v13[12];
    *(float32x4_t *)a1 = *a2;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v12;
    *(_OWORD *)(a1 + 28) = *(_OWORD *)&v12[12];
    if (*(float *)(a1 + 32) <= 0.0)
    {
      float32x4_t v10 = *(float32x4_t *)a1;
      *(_OWORD *)(a1 + 48) = *(_OWORD *)a1;
      *(float32x4_t *)(a1 + 64) = v10;
    }
    else if (v9 > 0.0)
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v9);
    }
  }
  return v8 != 1.0;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 88)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 80);
  }
  if (a3)
  {
    uint64_t v15 = a1;
    uint64_t v6 = *(unsigned int *)(a1 + 88);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    float32x4_t v16 = &v15;
    if (((unsigned int (*)(uint64_t **, uint64_t))*(&off_26C52F2D8 + v6))(&v16, a1 + 80))
    {
      float v8 = *(float *)(a1 + 40);
      v7.f32[0] = *(float *)(a1 + 32) - v8;
      float v9 = *(float *)(a1 + 36) - v8;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v7.f32[0] || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v7.f32[0] || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (long long *)a2, v7);
        }
        else if ((float)(v7.f32[0] + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t a1, long long *a2, float32x4_t a3)
{
  float v3 = *((float *)a2 + 6);
  if (v3 < 0.0)
  {
    __break(1u);
    return;
  }
  float v6 = *((float *)a2 + 4);
  uint64_t v7 = a1 + 16;
  if (*(float *)(a1 + 32) > 0.0 && v6 > 0.0 && *(float *)v7 != *(float *)a2)
  {
    float v8 = (float)(*(float *)a2 * (float)(1.0 - *(float *)v7)) / (float)(*(float *)v7 * (float)(1.0 - *(float *)a2));
    unsigned int v9 = (COERCE_INT(fabs(v8)) - 0x800000) >> 24;
    BOOL v10 = v8 < 0.0 || v9 > 0x7E;
    if (!v10 || (LODWORD(v8) - 1) <= 0x7FFFFE)
    {
      float32x4_t v12 = *(float32x4_t *)(a1 + 48);
      float32x4_t v13 = vmulq_f32(v12, *(float32x4_t *)a1);
      *(float32x2_t *)v13.f32 = vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL));
      v13.f32[0] = vaddv_f32(*(float32x2_t *)v13.f32);
      if (v13.f32[0] != 1.0)
      {
        float v14 = 1.0 - v8;
        a3.i64[0] = 0;
        float32x4_t v15 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v13, a3)), 0), (int8x16_t)vnegq_f32(*(float32x4_t *)a1), *(int8x16_t *)a1);
        float v16 = 1.0;
        float v17 = 1.0 - (float)(1.0 - v8);
        float32x4_t v18 = vsubq_f32(v12, v15);
        int8x16_t v19 = (int8x16_t)vmulq_f32(v18, v18);
        float32x4_t v45 = v15;
        float32x4_t v46 = *(float32x4_t *)(a1 + 48);
        float32x4_t v20 = vaddq_f32(v12, v15);
        int8x16_t v21 = (int8x16_t)vmulq_f32(v20, v20);
        float v22 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)))));
        float v23 = v22 + v22;
        BOOL v24 = (float)(v22 + v22) == 0.0;
        float v25 = 1.0;
        if (!v24) {
          float v25 = sinf(v23) / v23;
        }
        float v26 = v25;
        float32x2_t v27 = vrecpe_f32((float32x2_t)LODWORD(v25));
        float32x2_t v28 = vmul_f32(v27, vrecps_f32((float32x2_t)LODWORD(v26), v27));
        LODWORD(v29) = vmul_f32(v28, vrecps_f32((float32x2_t)LODWORD(v26), v28)).u32[0];
        if ((float)(v17 * v23) != 0.0)
        {
          float v43 = v29;
          v28.f32[0] = sinf(v17 * v23);
          float v29 = v43;
          float v16 = v28.f32[0] / (float)(v17 * v23);
        }
        v28.f32[0] = v17 * (float)(v29 * v16);
        float32x4_t v30 = (float32x4_t)vdupq_lane_s32((int32x2_t)v28, 0);
        float v31 = v14 * v23;
        float v32 = 1.0;
        if (v31 != 0.0)
        {
          float32x4_t v42 = v30;
          float v44 = v29;
          float v33 = sinf(v31);
          float32x4_t v30 = v42;
          float v29 = v44;
          float v32 = v33 / v31;
        }
        float32x4_t v34 = vmlaq_f32(vmulq_n_f32(v45, v14 * (float)(v29 * v32)), v46, v30);
        int8x16_t v35 = (int8x16_t)vmulq_f32(v34, v34);
        float32x2_t v36 = vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
        if (vaddv_f32(v36) == 0.0)
        {
          float32x4_t v12 = (float32x4_t)xmmword_214498B80;
        }
        else
        {
          unsigned __int32 v37 = vadd_f32(v36, (float32x2_t)vdup_lane_s32((int32x2_t)v36, 1)).u32[0];
          float32x2_t v38 = vrsqrte_f32((float32x2_t)v37);
          float32x2_t v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)));
          float32x4_t v12 = vmulq_n_f32(v34, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      *(float32x4_t *)(a1 + 48) = v12;
    }
  }
  long long v40 = *a2;
  *(_OWORD *)(v7 + 12) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)uint64_t v7 = v40;
  if (v3 <= 0.0)
  {
    if (v6 > 0.0) {
      return;
    }
    goto LABEL_29;
  }
  *(_DWORD *)(a1 + 40) = 0;
  if (v6 <= 0.0)
  {
LABEL_29:
    float32x4_t v41 = *(float32x4_t *)a1;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)a1;
    *(float32x4_t *)(a1 + 64) = v41;
    return;
  }
  LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v3);
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  float v11 = a2;
  float32x4_t v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F2D8 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 88);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float32x4_t v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F2F0 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  }
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F278 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F278 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(float ***a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t **a1, float32x4_t **a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISB_EENS_14default_deleteISO_EEEENSM_INS8_18animation_timing_tENSP_ISS_EEEEEEEEEEDcSE_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

float *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(float *result, float a2)
{
  float v3 = result[8];
  if (v3 <= 0.0) {
    goto LABEL_16;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = (float32x4_t *)result;
    float v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      float v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      float32x4_t v7 = v4[3];
      float32x4_t v9 = vmulq_f32(v7, *v4);
      float32x4_t v8 = (float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v9, 8uLL);
      *(float32x2_t *)v9.f32 = vadd_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v8.f32);
      v9.f32[0] = vaddv_f32(*(float32x2_t *)v9.f32);
      if (v9.f32[0] != 1.0)
      {
        v8.i64[0] = 0;
        float32x4_t v10 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v9, v8)), 0), (int8x16_t)vnegq_f32(*v4), *(int8x16_t *)v4);
        float v11 = 1.0 - v6;
        float32x4_t v12 = vsubq_f32(v7, v10);
        int8x16_t v13 = (int8x16_t)vmulq_f32(v12, v12);
        float32x4_t v73 = v10;
        float32x4_t v75 = v4[3];
        float32x4_t v14 = vaddq_f32(v7, v10);
        int8x16_t v15 = (int8x16_t)vmulq_f32(v14, v14);
        float v16 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL)))));
        float v17 = 1.0;
        float v18 = v16 + v16;
        if ((float)(v16 + v16) != 0.0) {
          float v17 = sinf(v16 + v16) / v18;
        }
        float v19 = v17;
        float32x2_t v20 = vrecpe_f32((float32x2_t)LODWORD(v17));
        float32x2_t v21 = vmul_f32(v20, vrecps_f32((float32x2_t)LODWORD(v19), v20));
        float32x2_t v24 = vrecps_f32((float32x2_t)LODWORD(v19), v21);
        LODWORD(v22) = vmul_f32(v21, v24).u32[0];
        float v23 = 1.0;
        v24.i32[0] = 1.0;
        if ((float)(v11 * v18) != 0.0)
        {
          float v69 = v22;
          v24.f32[0] = sinf(v11 * v18);
          float v22 = v69;
          v24.f32[0] = v24.f32[0] / (float)(v11 * v18);
        }
        v24.f32[0] = v11 * (float)(v22 * v24.f32[0]);
        float32x4_t v25 = (float32x4_t)vdupq_lane_s32((int32x2_t)v24, 0);
        float v26 = v18 * v6;
        if (v26 != 0.0)
        {
          float32x4_t v67 = v25;
          float v70 = v22;
          float v27 = sinf(v26);
          float32x4_t v25 = v67;
          float v22 = v70;
          float v23 = v27 / v26;
        }
        float32x4_t v28 = vmlaq_f32(vmulq_n_f32(v73, (float)(v22 * v23) * v6), v75, v25);
        int8x16_t v29 = (int8x16_t)vmulq_f32(v28, v28);
        float32x2_t v30 = vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
        if (vaddv_f32(v30) == 0.0)
        {
          float32x4_t v7 = (float32x4_t)xmmword_214498B80;
        }
        else
        {
          unsigned __int32 v37 = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
          float32x2_t v38 = vrsqrte_f32((float32x2_t)v37);
          float32x2_t v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)));
          float32x4_t v7 = vmulq_n_f32(v28, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      v4[3] = v7;
      float32x4_t v40 = v4[4];
      float32x4_t v42 = vmulq_f32(v7, v40);
      float32x4_t v41 = (float32x4_t)vextq_s8((int8x16_t)v42, (int8x16_t)v42, 8uLL);
      *(float32x2_t *)v42.f32 = vadd_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v41.f32);
      v42.f32[0] = vaddv_f32(*(float32x2_t *)v42.f32);
      if (v42.f32[0] != 1.0)
      {
        v41.i64[0] = 0;
        float32x4_t v43 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v42, v41)), 0), (int8x16_t)vnegq_f32(v7), (int8x16_t)v7);
        float v44 = 1.0 - v6;
        float32x4_t v45 = vsubq_f32(v40, v43);
        int8x16_t v46 = (int8x16_t)vmulq_f32(v45, v45);
        float32x4_t v74 = v43;
        float32x4_t v76 = v4[4];
        float32x4_t v47 = vaddq_f32(v40, v43);
        int8x16_t v48 = (int8x16_t)vmulq_f32(v47, v47);
        float v49 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v46.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v46, v46, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)))));
        float v50 = 1.0;
        float v51 = v49 + v49;
        if ((float)(v49 + v49) != 0.0) {
          float v50 = sinf(v49 + v49) / v51;
        }
        float v52 = v50;
        float32x2_t v53 = vrecpe_f32((float32x2_t)LODWORD(v50));
        float32x2_t v54 = vmul_f32(v53, vrecps_f32((float32x2_t)LODWORD(v52), v53));
        float32x2_t v57 = vrecps_f32((float32x2_t)LODWORD(v52), v54);
        LODWORD(v55) = vmul_f32(v54, v57).u32[0];
        float v56 = 1.0;
        v57.i32[0] = 1.0;
        if ((float)(v44 * v51) != 0.0)
        {
          float v71 = v55;
          v57.f32[0] = sinf(v44 * v51);
          float v55 = v71;
          v57.f32[0] = v57.f32[0] / (float)(v44 * v51);
        }
        v57.f32[0] = v44 * (float)(v55 * v57.f32[0]);
        float32x4_t v58 = (float32x4_t)vdupq_lane_s32((int32x2_t)v57, 0);
        float v59 = v51 * v6;
        if (v59 != 0.0)
        {
          float32x4_t v68 = v58;
          float v72 = v55;
          float v60 = sinf(v59);
          float32x4_t v58 = v68;
          float v55 = v72;
          float v56 = v60 / v59;
        }
        float32x4_t v61 = vmlaq_f32(vmulq_n_f32(v74, (float)(v55 * v56) * v6), v76, v58);
        int8x16_t v62 = (int8x16_t)vmulq_f32(v61, v61);
        float32x2_t v63 = vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL));
        if (vaddv_f32(v63) == 0.0)
        {
          float32x4_t v40 = (float32x4_t)xmmword_214498B80;
        }
        else
        {
          unsigned __int32 v64 = vadd_f32(v63, (float32x2_t)vdup_lane_s32((int32x2_t)v63, 1)).u32[0];
          float32x2_t v65 = vrsqrte_f32((float32x2_t)v64);
          float32x2_t v66 = vmul_f32(v65, vrsqrts_f32((float32x2_t)v64, vmul_f32(v65, v65)));
          float32x4_t v40 = vmulq_n_f32(v61, vmul_f32(v66, vrsqrts_f32((float32x2_t)v64, vmul_f32(v66, v66))).f32[0]);
        }
      }
      int v36 = 0;
      v4[4] = v40;
      BOOL v35 = v5 >= v4[2].f32[1];
      return (float *)(v35 | (v36 << 8));
    }
    float v31 = nexttowardf(1.0, 0.0);
    float v32 = 0.0;
    float v33 = fmaxf(fminf(v31, 0.0), 0.0);
    if (v33 > 0.0) {
      float v32 = INFINITY;
    }
    v4[1].f32[0] = v33;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v32;
    v4[2].f32[1] = v32;
    v4[2].i32[2] = 0;
    float32x4_t v34 = *v4;
    v4[3] = *v4;
    v4[4] = v34;
LABEL_16:
    BOOL v35 = 1;
    int v36 = 1;
    return (float *)(v35 | (v36 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t *result, float32x4_t **a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    float v5 = *a2;
    float v6 = *v2 + (*a2)[2].f32[2];
    (*a2)[2].f32[2] = v6;
    if (v6 >= 0.0)
    {
      v5[2].i32[2] = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      float32x4_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 80);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40FC2635F5);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_2144900BC(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C40FC2635F5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(simd::quatf &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 80);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F278 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, float32x4_t *a2, int a3)
{
  if (*(_DWORD *)(a1 + 88)) {
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 80);
  }
  f32 = (_OWORD *)a2[1].f32;
  int8x16_t v7 = (int8x16_t)vmulq_f32(*(float32x4_t *)a1, *a2);
  float v8 = vaddv_f32(vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
  if (v8 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)f32, a3);
  }
  else
  {
    float v9 = a2[2].f32[2];
    if (v9 < 0.0) {
      operator new();
    }
    *(_OWORD *)int8x16_t v13 = *f32;
    *(void *)&v13[16] = a2[2].i64[0];
    *(_DWORD *)&v13[24] = 0;
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (long long *)v13);
    float32x4_t v10 = *a2;
    *(_OWORD *)(a1 + 28) = *(_OWORD *)&v13[12];
    long long v11 = *(_OWORD *)v13;
    *(float32x4_t *)a1 = v10;
    *(_OWORD *)(a1 + 16) = v11;
    if (*(float *)(a1 + 32) <= 0.0)
    {
      *(float32x4_t *)(a1 + 48) = v10;
      *(float32x4_t *)(a1 + 64) = v10;
    }
    else if (v9 > 0.0)
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(a1, v9);
    }
  }
  return v8 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)(result + 88)) {
    uint64_t result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 80);
  }
  if (a3)
  {
    uint64_t v15 = v5;
    uint64_t v6 = *(unsigned int *)(v5 + 88);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    float v16 = &v15;
    uint64_t result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_26C52F308 + v6))(&v16, v5 + 80);
    if (result)
    {
      float v7 = *(float *)(v5 + 40);
      float v8 = *(float *)(v5 + 32) - v7;
      float v9 = *(float *)(v5 + 36) - v7;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (long long *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, long long *a2)
{
  float v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  float v3 = *((float *)a2 + 4);
  uint64_t v4 = (float *)(result + 16);
  if (*(float *)(result + 32) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    float v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    BOOL v6 = v5 < 0.0
      || (COERCE_INT(fabs((float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4
                                                                                           * (float)(1.0 - *(float *)a2))))
                      - 0x800000) >> 24 > 0x7E;
    if (!v6 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      float32x4_t v8 = *(float32x4_t *)(result + 48);
      int8x16_t v9 = (int8x16_t)vmulq_f32(v8, *(float32x4_t *)result);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL))) != 1.0) {
        float32x4_t v8 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)result, 1.0 - v5), v8, 1.0 - (float)(1.0 - v5));
      }
      *(float32x4_t *)(result + 48) = v8;
    }
  }
  long long v10 = *a2;
  *(_OWORD *)(result + 28) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)uint64_t v4 = v10;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0) {
      return result;
    }
  }
  else
  {
    *(_DWORD *)(result + 40) = 0;
    if (v3 > 0.0) {
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(result, v2);
    }
  }
  float32x4_t v11 = *(float32x4_t *)result;
  *(_OWORD *)(result + 48) = *(_OWORD *)result;
  *(float32x4_t *)(result + 64) = v11;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  float v11 = a2;
  float v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F308 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 88);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F320 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  }
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F2A8 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F2A8 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, float32x4_t **a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3 = result[8];
  if (v3 <= 0.0) {
    goto LABEL_12;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = (float32x4_t *)result;
    float v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      float v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      float32x4_t v7 = v4[3];
      int8x16_t v8 = (int8x16_t)vmulq_f32(v7, *v4);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL))) != 1.0) {
        float32x4_t v7 = vmlaq_n_f32(vmulq_n_f32(*v4, v6), v7, 1.0 - v6);
      }
      v4[3] = v7;
      float32x4_t v9 = v4[4];
      int8x16_t v10 = (int8x16_t)vmulq_f32(v7, v9);
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))) != 1.0) {
        float32x4_t v9 = vmlaq_n_f32(vmulq_n_f32(v7, v6), v9, 1.0 - v6);
      }
      int v11 = 0;
      v4[4] = v9;
      BOOL v12 = v5 >= v4[2].f32[1];
      return (float *)(v12 | (v11 << 8));
    }
    float v13 = nexttowardf(1.0, 0.0);
    float v14 = 0.0;
    float v15 = fmaxf(fminf(v13, 0.0), 0.0);
    if (v15 > 0.0) {
      float v14 = INFINITY;
    }
    v4[1].f32[0] = v15;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v14;
    v4[2].f32[1] = v14;
    v4[2].i32[2] = 0;
    float32x4_t v16 = *v4;
    v4[3] = *v4;
    v4[4] = v16;
LABEL_12:
    BOOL v12 = 1;
    int v11 = 1;
    return (float *)(v12 | (v11 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, float32x4_t **a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    float v5 = *a2;
    float v6 = *v2 + (*a2)[2].f32[2];
    (*a2)[2].f32[2] = v6;
    if (v6 >= 0.0)
    {
      v5[2].i32[2] = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      int8x16_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40FC2635F5);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_214490B08(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C40FC2635F5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv4_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F2A8 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *std::vector<anonymous namespace'::face_id_animator_t::quadrant_context_t>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v6 + v7;
      uint64_t v9 = v4 + v7;
      *(void *)(v8 - 240) = *(void *)(v4 + v7 - 240);
      *(void *)(v8 - 232) = 0;
      *(void *)(v8 - 224) = 0;
      *(void *)(v8 - 216) = 0;
      *(_OWORD *)(v8 - 232) = *(_OWORD *)(v4 + v7 - 232);
      uint64_t v10 = *(void *)(v4 + v7 - 208);
      *(void *)(v8 - 216) = *(void *)(v4 + v7 - 216);
      *(void *)(v9 - 224) = 0;
      *(void *)(v9 - 216) = 0;
      *(void *)(v9 - 232) = 0;
      *(void *)(v8 - 192) = 0;
      *(void *)(v8 - 184) = 0;
      *(void *)(v8 - 208) = v10;
      *(void *)(v8 - 200) = 0;
      *(_OWORD *)(v8 - 200) = *(_OWORD *)(v4 + v7 - 200);
      *(void *)(v8 - 184) = *(void *)(v4 + v7 - 184);
      *(void *)(v9 - 200) = 0;
      *(void *)(v9 - 192) = 0;
      *(void *)(v9 - 184) = 0;
      long long v11 = *(_OWORD *)(v4 + v7 - 176);
      long long v12 = *(_OWORD *)(v4 + v7 - 144);
      *(_OWORD *)(v8 - 160) = *(_OWORD *)(v4 + v7 - 160);
      *(_OWORD *)(v8 - 144) = v12;
      *(_OWORD *)(v8 - 176) = v11;
      long long v13 = *(_OWORD *)(v4 + v7 - 64);
      long long v15 = *(_OWORD *)(v4 + v7 - 112);
      long long v14 = *(_OWORD *)(v4 + v7 - 96);
      *(_OWORD *)(v8 - 80) = *(_OWORD *)(v4 + v7 - 80);
      *(_OWORD *)(v8 - 64) = v13;
      *(_OWORD *)(v8 - 112) = v15;
      *(_OWORD *)(v8 - 96) = v14;
      *(_OWORD *)(v8 - 128) = *(_OWORD *)(v4 + v7 - 128);
      uint64_t result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 + v7 - 48, v4 + v7 - 48);
      *(void *)(v8 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      *(void *)(v8 - 16) = 0;
      *(_OWORD *)(v8 - 32) = *(_OWORD *)(v4 + v7 - 32);
      *(void *)(v8 - 16) = *(void *)(v4 + v7 - 16);
      *(void *)(v9 - 32) = 0;
      *(void *)(v9 - 24) = 0;
      *(void *)(v9 - 16) = 0;
      v7 -= 240;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  uint64_t v16 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v16;
  uint64_t v17 = v3[1];
  v3[1] = a2[2];
  a2[2] = v17;
  uint64_t v18 = v3[2];
  v3[2] = a2[3];
  a2[3] = v18;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<anonymous namespace'::face_id_animator_t::quadrant_context_t>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 240;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(a1, a2);
  return a1;
}

uint64_t _ZNSt3__116__variant_detail6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISF_LNS0_6_TraitE1EEEEEvRSG_OT_(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 8);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*(&off_26C52F338 + v4))(&v7, result);
  }
  *(_DWORD *)(v3 + 8) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))*(&off_26C52F350 + v5))(&v6, v3, a2);
    *(_DWORD *)(v3 + 8) = v5;
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSL_1EJS8_SG_SJ_EEEEEEDcSN_DpT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteISD_EEEENS9_INSA_18animation_timing_tENSE_ISH_EEEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISK_LNS0_6_TraitE1EEEEEvRSL_OT_EUlRSR_OT0_E_JRNS0_6__baseILSO_1EJS8_SG_SJ_EEEOSZ_EEEDcSR_DpT0_(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *a2 = v3;
}

void std::allocator_traits<std::allocator<anonymous namespace'::face_id_animator_t::quadrant_context_t>>::destroy[abi:ne180100]<anonymous namespace'::face_id_animator_t::quadrant_context_t,void,void>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 208);
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE16__destroy_vectorclB8ne180100Ev(&v3);
  _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(a1 + 192);
  uint64_t v3 = (void **)(a1 + 40);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t::~static_state_t(_anonymous_namespace_::face_id_animator_t::quadrant_context_t::static_state_t *this)
{
  uint64_t v3 = (void **)((char *)this + 40);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE16__destroy_vectorclB8ne180100Ev(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        char v6 = v4 - 96;
        _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev((uint64_t)(v4 - 16));
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F338 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = -1;
  return a1;
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      char v6 = *(void **)(v4 - 24);
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

void std::__hash_table<std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t>>,std::__unordered_map_hasher<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t>>,std::hash<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,std::equal_to<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,true>,std::__unordered_map_equal<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t>>,std::equal_to<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,std::hash<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>>,true>,std::allocator<std::__hash_value_type<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t>>>>::__rehash_unique[abi:ne180100](uint64_t a1, size_t __n)
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
  uint64_t v5 = operator new(8 * prime);
  char v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint64_t v8 = *(void **)(a1 + 16);
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
    long long v14 = (void *)*v8;
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
          *uint64_t v8 = *v14;
          *long long v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          long long v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint64_t v8 = v14;
        long long v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void std::unordered_map<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<LAUI_uniform_cubic_b_spline_renderer::spline_t::instance_t,LAUI_uniform_cubic_b_spline_renderer::spline_t>,LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t>>::try_emplace[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::indexed_identifier_t<anonymous namespace'::face_id_animator_t::ring_context_t> const&>(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = a2[1];
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = a2[1];
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
    uint8x8_t v10 = *(void **)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      for (uint64_t i = (void *)*v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == v7) {
            return;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v3) {
            break;
          }
        }
      }
    }
  }
  long long v14 = operator new(0x28uLL);
  *long long v14 = 0;
  v14[1] = v7;
  *((_OWORD *)v14 + 1) = *(_OWORD *)a2;
  v14[4] = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v21 = *(void *)a1;
  float v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *long long v14 = *v22;
LABEL_42:
    void *v22 = v14;
    goto LABEL_43;
  }
  *long long v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    unint64_t v23 = *(void *)(*v14 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    float v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
}

void sub_2144915F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

float32x4_t anonymous namespace'::morphable_quadrant_t<9ul>::convert(float32x4_t *a1, unsigned int a2, float32x4_t result)
{
  if (a2 != 2)
  {
    BOOL v4 = a2 == 3 || a2 == 0;
    if (a2 >= 2 && a2 != 3) {
    uint64_t v5 = 0;
    }
    float v6 = -1.0;
    if (v4) {
      float v7 = -1.0;
    }
    else {
      float v7 = 1.0;
    }
    if (a2 >= 2) {
      float v6 = 1.0;
    }
    __asm { FMOV            V0.4S, #1.0 }
    result.i64[0] = __PAIR64__(LODWORD(v6), LODWORD(v7));
    do
    {
      a1[v5] = vmulq_f32(result, a1[v5]);
      ++v5;
    }
    while (v5 != 9);
    if (((a2 < 2) ^ v4))
    {
      unint64_t v11 = a1 + 8;
      unint64_t v12 = (unint64_t)&a1[1];
      do
      {
        uint64_t result = *(float32x4_t *)(v12 - 16);
        *(float32x4_t *)(v12 - 16) = *v11;
        *v11-- = result;
        _CF = v12 >= (unint64_t)v11;
        v12 += 16;
      }
      while (!_CF);
    }
  }
  return result;
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    void v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(result, a2);
    v7[1] = v7[0] + v5;
    _OWORD v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_21449175C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>,std::reverse_iterator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer8spline_t7state_tENS_9allocatorIS3_EEE24__emplace_back_slow_pathIJNS0_IDv3_fNS4_IS8_EEEEEEEPS3_DpOT_(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_13:
  }
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
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
  v14[4] = a1 + 2;
  if (v9) {
    uint8x8_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(v7, v9);
  }
  else {
    uint8x8_t v10 = 0;
  }
  unint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  void v14[3] = &v10[24 * v9];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  *(_OWORD *)unint64_t v11 = *(_OWORD *)a2;
  *((void *)v11 + 2) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (*((void *)v11 + 1) - *(void *)v11 <= 0x3FuLL)
  {
    __break(1u);
    goto LABEL_13;
  }
  v14[2] = v11 + 24;
  std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_214491B00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_214491B74(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(void *)(a1 + 24) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  uint64_t v5 = a1 + 8;
  uint64_t result = *(uint64_t **)(a1 + 8);
  uint64_t v4 = *(uint64_t **)(v5 + 8);
  if (v4 == result)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__identity,LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t> &&)::{lambda(LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const)#1}>(result, v4);
    uint64_t v7 = (v6[1] - *v6) >> 4;
    if (v7 != (uint64_t)(v8[1] - *v8) >> 4) {
      __assert_rtn("weighted_spline_t", "LAUICubicBSplineRenderer.h", 1505, "minimum_control_point_count == maximum_control_point_count");
    }
    *(void *)a1 = v7;
    return (uint64_t *)a1;
  }
  return result;
}

uint64_t *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__wrap_iter<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t *>,std::__identity,LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::weighted_spline_t<std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t>>(std::vector<LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t> &&)::{lambda(LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const&,LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t const)#1}>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = result;
  if (result != a2 && result + 3 != a2)
  {
    uint64_t v4 = result[3];
    unint64_t v5 = result[4] - v4;
    uint64_t v6 = *result;
    unint64_t v7 = result[1] - *result;
    if (v5 >= v7)
    {
      size_t v8 = result + 3;
    }
    else
    {
      result += 3;
      size_t v8 = v2;
    }
    unint64_t v9 = v2 + 6;
    if (v9 != a2)
    {
      BOOL v10 = v5 >= v7;
      if (v5 >= v7) {
        uint64_t v11 = v4;
      }
      else {
        uint64_t v11 = v6;
      }
      if (v10) {
        uint64_t v4 = v6;
      }
      while (v9 + 3 != a2)
      {
        unint64_t v12 = v9[4] - v9[3];
        unint64_t v13 = v9[1] - *v9;
        uint64_t v14 = result[1];
        if (v12 >= v13)
        {
          if (v13 < v14 - v4)
          {
            uint64_t v4 = *v9;
            uint64_t result = v9;
          }
          if (v12 >= v8[1] - v11)
          {
            uint64_t v11 = v9[3];
            size_t v8 = v9 + 3;
          }
        }
        else
        {
          uint64_t v4 = *result;
          if (v12 < v14 - *result)
          {
            uint64_t v4 = v9[3];
            uint64_t result = v9 + 3;
          }
          unint64_t v15 = v8[1] - *v8;
          BOOL v16 = v13 >= v15;
          if (v13 >= v15) {
            uint64_t v11 = *v9;
          }
          else {
            uint64_t v11 = *v8;
          }
          if (v16) {
            size_t v8 = v9;
          }
        }
        v9 += 6;
        if (v9 == a2) {
          return result;
        }
      }
      if (v9[1] - *v9 < (unint64_t)(result[1] - *result)) {
        return v9;
      }
    }
  }
  return result;
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(void *a1, unint64_t a2, _OWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    uint64_t v6 = (_OWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 16 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 16;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_214491E04(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator_traits<std::allocator<anonymous namespace'::face_id_animator_t::quadrant_context_t>>::construct[abi:ne180100]<anonymous namespace'::face_id_animator_t::quadrant_context_t,anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t,anonymous namespace'::face_id_state_t &,void,void>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  long long v6 = *(_OWORD *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 112) = 0u;
  uint64_t v8 = a1 + 112;
  float v9 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
  *(float *)(a1 + 128) = v9;
  *(unsigned char *)(a1 + 132) = 0;
  *(unsigned char *)(a1 + 140) = 0;
  *(_DWORD *)(a1 + 152) = 0;
  if (v9 <= 0.0) {
    float v10 = 0.0;
  }
  else {
    float v10 = INFINITY;
  }
  *(float *)(a1 + 144) = v10;
  *(float *)(a1 + 148) = v10;
  *(_DWORD *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  float32x4_t v16 = v15;
  float v17 = v9;
  char v18 = 0;
  char v19 = 0;
  int v22 = 0;
  float v20 = v10;
  float v21 = v10;
  _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v8, &v16, 0);
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE7reserveEm((uint64_t *)(a1 + 208), v14 - v13);
  uint64_t v11 = v13;
  unint64_t v12 = v14;
  float v26 = (uint64_t *)(a1 + 208);
  if (v13 != v14)
  {
    do
    {
      float32x4_t v16 = *v11;
      float v17 = v9;
      char v18 = 0;
      char v19 = 0;
      int v22 = 0;
      float v20 = v10;
      float v21 = v10;
      float32x4_t v23 = v16;
      float32x4_t v24 = v16;
      v25[2] = 0;
      _ZNSt3__120back_insert_iteratorINS_6vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS2_27animator_interpolation_typeE0EEENS_9allocatorIS6_EEEEEaSB8ne180100EOS6_(&v26, &v16);
      _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev((uint64_t)v25);
      ++v11;
    }
    while (v11 != v12);
    uint64_t v11 = v13;
  }
  if (v11)
  {
    uint64_t v14 = v11;
    operator delete(v11);
  }
}

void sub_214491FD4(void *a1)
{
}

void anonymous namespace'::face_id_animator_t::quadrant_context_t::static_state_t::target_state(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = *(char *)(a2 + 72);
  if (v4 < 7)
  {
    uint64_t v7 = qword_214499260[v4];
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(v11, v7 + 1, __p);
    long long v8 = *(_OWORD *)v11;
    *((_DWORD *)v11[0] + v7) = 1065353216;
    *(_OWORD *)__p = v8;
    uint64_t v14 = v12;
    v11[1] = 0;
    uint64_t v12 = 0;
    v11[0] = 0;
    LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state((unint64_t *)(a1 + 32), __p, a3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v11[0])
    {
      v11[1] = v11[0];
      operator delete(v11[0]);
    }
    long long v9 = 0uLL;
    switch(*(unsigned char *)(a2 + 72))
    {
      case 0:
        float v10 = (long long *)(a1 + 80);
        goto LABEL_10;
      case 1:
        float v10 = (long long *)(a1 + 64);
        goto LABEL_10;
      case 2:
        float v10 = (long long *)(a1 + 96);
LABEL_10:
        long long v9 = *v10;
        goto LABEL_11;
      case 3:
      case 4:
      case 5:
      case 6:
LABEL_11:
        *(_OWORD *)(a3 + 32) = v9;
        return;
      default:
        break;
    }
  }
  __break(1u);
  JUMPOUT(0x2144920FCLL);
}

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE7reserveEm(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 5) < a2)
  {
    if (a2 >= 0x2AAAAAAAAAAAAABLL) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    void v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(result, a2);
    v7[1] = v7[0] + v5;
    _OWORD v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 96 * v6;
    _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(a1, v7);
    return _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)v7);
  }
  return result;
}

void sub_2144921BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

void *LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state@<X0>(unint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *a1;
  long long v17 = 0u;
  uint64_t result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2EmRKS1_(&v18, v6, &v17);
  unint64_t v10 = a1[1];
  unint64_t v9 = a1[2];
  if (v9 != v10)
  {
    unint64_t v11 = 0;
    do
    {
      if (v11 >= (uint64_t)(a2[1] - *a2) >> 2) {
        break;
      }
      v8.i32[0] = *(_DWORD *)(*a2 + 4 * v11);
      if (v8.f32[0] != 0.0)
      {
        uint64_t v12 = (uint64_t *)(v10 + 24 * v11);
        uint64_t v13 = *v12;
        if (v12[1] != *v12)
        {
          unint64_t v14 = 0;
          float32x4_t v8 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 0);
          do
          {
            if (v14 >= ((uint64_t)v19 - v18) >> 4) {
              break;
            }
            *(float32x4_t *)(v18 + 16 * v14) = vmlaq_f32(*(float32x4_t *)(v18 + 16 * v14), *(float32x4_t *)(v13 + 16 * v14), v8);
            ++v14;
            uint64_t v13 = *v12;
          }
          while (v14 < (v12[1] - *v12) >> 4);
          unint64_t v10 = a1[1];
          unint64_t v9 = a1[2];
        }
      }
      ++v11;
    }
    while (v11 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v10) >> 3));
  }
  uint64_t v15 = v18;
  *(void *)a3 = v18;
  uint64_t v16 = v19;
  *(_OWORD *)(a3 + 8) = v19;
  long long v19 = 0uLL;
  uint64_t v18 = 0;
  if ((unint64_t)(v16 - v15) <= 0x3F) {
    __break(1u);
  }
  return result;
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_214492358(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

BOOL _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(uint64_t a1, float32x4_t *a2, int a3)
{
  if (*(_DWORD *)(a1 + 88)) {
    _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(a1 + 80);
  }
  f32 = (_OWORD *)a2[1].f32;
  float32x4_t v7 = vmulq_f32(*(float32x4_t *)a1, *a2);
  float v12 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0];
  if (v12 == 1.0)
  {
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(a1, (uint64_t)f32, a3);
  }
  else
  {
    float v8 = a2[2].f32[2];
    if (v8 < 0.0) {
      operator new();
    }
    *(_OWORD *)uint64_t v13 = *f32;
    *(void *)&v13[16] = a2[2].i64[0];
    *(_DWORD *)&v13[24] = 0;
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(a1, (long long *)v13);
    float32x4_t v9 = *a2;
    *(_OWORD *)(a1 + 28) = *(_OWORD *)&v13[12];
    long long v10 = *(_OWORD *)v13;
    *(float32x4_t *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v10;
    if (*(float *)(a1 + 32) <= 0.0)
    {
      *(float32x4_t *)(a1 + 48) = v9;
      *(float32x4_t *)(a1 + 64) = v9;
    }
    else if (v8 > 0.0)
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(a1, v8);
    }
  }
  return v12 != 1.0;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)(result + 88)) {
    uint64_t result = _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(result + 80);
  }
  if (a3)
  {
    uint64_t v15 = v5;
    uint64_t v6 = *(unsigned int *)(v5 + 88);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    uint64_t v16 = &v15;
    uint64_t result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_26C52F368 + v6))(&v16, v5 + 80);
    if (result)
    {
      float v7 = *(float *)(v5 + 40);
      float v8 = *(float *)(v5 + 32) - v7;
      float v9 = *(float *)(v5 + 36) - v7;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(v5, (long long *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE11_set_timingERKNS_18animation_timing_tE(uint64_t result, long long *a2)
{
  float v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  float v3 = *((float *)a2 + 4);
  uint64_t v4 = (float *)(result + 16);
  if (*(float *)(result + 32) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    float v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    BOOL v6 = v5 < 0.0
      || (COERCE_INT(fabs((float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4
                                                                                           * (float)(1.0 - *(float *)a2))))
                      - 0x800000) >> 24 > 0x7E;
    if (!v6 || (LODWORD(v5) - 1) <= 0x7FFFFE)
    {
      float32x4_t v8 = *(float32x4_t *)(result + 48);
      float32x4_t v9 = vmulq_f32(v8, *(float32x4_t *)result);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0] != 1.0)float32x4_t v8 = vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)result, 1.0 - v5), v8, 1.0 - (float)(1.0 - v5)); {
      *(float32x4_t *)(result + 48) = v8;
      }
    }
  }
  long long v10 = *a2;
  *(_OWORD *)(result + 28) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)uint64_t v4 = v10;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0) {
      return result;
    }
  }
  else
  {
    *(_DWORD *)(result + 40) = 0;
    if (v3 > 0.0) {
      return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(result, v2);
    }
  }
  float32x4_t v11 = *(float32x4_t *)result;
  *(_OWORD *)(result + 48) = *(_OWORD *)result;
  *(float32x4_t *)(result + 64) = v11;
  return result;
}

uint64_t _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(uint64_t a1, float a2)
{
  float v11 = a2;
  float v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 80;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F368 + v2))(v10, a1 + 80))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 88);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F380 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(a1);
  }
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm0EJS3_EEERDaDpOT0_(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F338 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 32) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm2ESE_SE_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm2EJSE_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F338 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

float *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(float ***a1)
{
  return _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf(**a1, *(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, float32x4_t **a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tISA_EENS_14default_deleteISN_EEEENSL_INS8_18animation_timing_tENSO_ISR_EEEEEEEEEEDcSD_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return _ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(*a1, a2);
}

float *_ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf(float *result, float a2)
{
  float v3 = result[8];
  if (v3 <= 0.0) {
    goto LABEL_12;
  }
  if (a2 >= 0.0)
  {
    uint64_t v4 = (float32x4_t *)result;
    float v5 = result[10] + a2;
    result[10] = v5;
    if (v5 < v3)
    {
      double v6 = fmax((float)(1.0 - powf(result[4], a2)), 0.0);
      float32x4_t v7 = v4[3];
      float32x4_t v8 = vmulq_f32(v7, *v4);
      float v9 = v6;
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0] != 1.0)float32x4_t v7 = vmlaq_n_f32(vmulq_n_f32(*v4, v9), v7, 1.0 - v9); {
      v4[3] = v7;
      }
      float32x4_t v10 = v4[4];
      float32x4_t v11 = vmulq_f32(v7, v10);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0] != 1.0)float32x4_t v10 = vmlaq_n_f32(vmulq_n_f32(v7, v9), v10, 1.0 - v9); {
      int v12 = 0;
      }
      v4[4] = v10;
      BOOL v13 = v5 >= v4[2].f32[1];
      return (float *)(v13 | (v12 << 8));
    }
    float v14 = nexttowardf(1.0, 0.0);
    float v15 = 0.0;
    float v16 = fmaxf(fminf(v14, 0.0), 0.0);
    if (v16 > 0.0) {
      float v15 = INFINITY;
    }
    v4[1].f32[0] = v16;
    v4[1].i8[4] = 0;
    v4[1].i8[12] = 0;
    v4[2].f32[0] = v15;
    v4[2].f32[1] = v15;
    v4[2].i32[2] = 0;
    float32x4_t v17 = *v4;
    v4[3] = *v4;
    v4[4] = v17;
LABEL_12:
    BOOL v13 = 1;
    int v12 = 1;
    return (float *)(v13 | (v12 << 8));
  }
  __break(1u);
  return result;
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_target_tIS1_EENS8_14default_deleteISB_EEEEEENS_15animator_statusES5_(uint64_t *result, float32x4_t **a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    float v5 = *a2;
    float v6 = *v2 + (*a2)[2].f32[2];
    (*a2)[2].f32[2] = v6;
    if (v6 >= 0.0)
    {
      v5[2].i32[2] = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      float32x4_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40FC2635F5);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_214492C7C(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1000C40FC2635F5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *_ZZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEfENKUlRT_E_clINSt3__110unique_ptrINS_18animation_timing_tENS8_14default_deleteISA_EEEEEENS_15animator_statusES5_(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 88)) {
        _ZNSt3__17variantIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS6_EEEENS2_INS3_18animation_timing_tENS7_ISA_EEEEEEaSB8ne180100IS1_Li0ES1_Lm0ELi0EEERSD_OT_(v4 + 80);
      }
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_timingERKNS_18animation_timing_tENS_25animation_target_option_tE(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE7_updateEf((float *)v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE12__assign_altB8ne180100ILm1ESB_SB_EEvRNS0_5__altIXT_ET0_EEOT1_(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t _ZNSt3__116__variant_detail12__assignmentINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEEE9__emplaceB8ne180100ILm1EJSB_EEERDaDpOT0_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F338 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

uint64_t *_ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 96;
      uint64_t v8 = v4 - 96;
      *(_OWORD *)(v6 - 96) = *(_OWORD *)(v4 - 96);
      long long v9 = *(_OWORD *)(v4 - 80);
      long long v10 = *(_OWORD *)(v4 - 64);
      long long v11 = *(_OWORD *)(v4 - 32);
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v4 - 48);
      *(_OWORD *)(v6 - 32) = v11;
      *(_OWORD *)(v6 - 80) = v9;
      *(_OWORD *)(v6 - 64) = v10;
      uint64_t result = (uint64_t *)_ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_(v6 - 16, v4 - 16);
      uint64_t v4 = v8;
      uint64_t v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  uint64_t v12 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v12;
  uint64_t v13 = v3[1];
  v3[1] = a2[2];
  a2[2] = v13;
  uint64_t v14 = v3[2];
  v3[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

uint64_t _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    _ZNSt3__116__variant_detail6__dtorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EED2Ev(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t **_ZNSt3__120back_insert_iteratorINS_6vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS2_27animator_interpolation_typeE0EEENS_9allocatorIS6_EEEEEaSB8ne180100EOS6_(uint64_t **a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (_OWORD *)(*a1)[1];
  if ((unint64_t)v4 >= (*a1)[2])
  {
    uint64_t v8 = _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE21__push_back_slow_pathIS5_EEPS5_OT_(*a1, a2);
  }
  else
  {
    *uint64_t v4 = *a2;
    long long v5 = a2[1];
    long long v6 = a2[2];
    long long v7 = a2[4];
    v4[3] = a2[3];
    v4[4] = v7;
    v4[1] = v5;
    v4[2] = v6;
    _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_((uint64_t)(v4 + 5), (uint64_t)(a2 + 5));
    uint64_t v8 = (uint64_t)(v4 + 6);
  }
  v3[1] = v8;
  return a1;
}

uint64_t _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE21__push_back_slow_pathIS5_EEPS5_OT_(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v17[4] = a1 + 2;
  if (v9) {
    long long v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::instance_uniform>>(v7, v9);
  }
  else {
    long long v10 = 0;
  }
  long long v11 = &v10[96 * v4];
  v17[0] = v10;
  v17[1] = v11;
  v17[3] = &v10[96 * v9];
  long long v12 = a2[1];
  long long v13 = a2[2];
  long long v14 = a2[4];
  *((_OWORD *)v11 + 3) = a2[3];
  *((_OWORD *)v11 + 4) = v14;
  *((_OWORD *)v11 + 2) = v13;
  *(_OWORD *)long long v11 = *a2;
  *((_OWORD *)v11 + 1) = v12;
  _ZNSt3__116__variant_detail18__move_constructorINS0_8__traitsIJNS_9monostateENS_10unique_ptrIN36LAUI_uniform_cubic_b_spline_renderer18animation_target_tIDv3_fEENS_14default_deleteIS8_EEEENS4_INS5_18animation_timing_tENS9_ISC_EEEEEEELNS0_6_TraitE1EEC2EOSH_((uint64_t)(v11 + 80), (uint64_t)(a2 + 5));
  v17[2] = v11 + 96;
  _ZNSt3__16vectorIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEENS_9allocatorIS5_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS5_RS7_EE(a1, v17);
  uint64_t v15 = a1[1];
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)v17);
  return v15;
}

void sub_2144930E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _ZNSt3__114__split_bufferIN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS1_27animator_interpolation_typeE0EEERNS_9allocatorIS5_EEED2Ev((uint64_t)va);
  _Unwind_Resume(a1);
}

double _ZN21LAUI_metal_transforms20look_at_transform_LHIDv3_ddEEN4simd6MatrixIT0_Lm4ELm4EE4typeERKT_S9_S9_@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X2>, uint64_t a4@<X8>)
{
  float64x2_t v4 = a1[1];
  float64x2_t v5 = vsubq_f64(*a2, *a1);
  float64x2_t v6 = vsubq_f64(a2[1], v4);
  float64x2_t v7 = vmulq_f64(v6, v6);
  float64x2_t v8 = vmulq_f64(v5, v5);
  v8.f64[0] = 1.0 / sqrt(v7.f64[0] + vaddvq_f64(v8));
  float64x2_t v9 = vmulq_n_f64(v5, v8.f64[0]);
  float64x2_t v10 = vmulq_f64(v6, v8);
  float64x2_t v11 = a3[1];
  float64x2_t v12 = vmlaq_laneq_f64(vmulq_laneq_f64(vnegq_f64(v11), v9, 1), v10, *a3, 1);
  float64x2_t v13 = vnegq_f64(v10);
  float64_t v14 = v10.f64[0];
  double v15 = vmulq_f64(v4, v10).f64[0];
  v10.f64[1] = v9.f64[0];
  v11.f64[1] = a3->f64[0];
  float64x2_t v16 = vmlaq_f64(vmulq_f64(v10, vnegq_f64(*a3)), v9, v11);
  float64x2_t v17 = vmulq_f64(v16, v16);
  double v18 = vmulq_f64(v12, v12).f64[0];
  v12.f64[1] = v16.f64[0];
  v17.f64[0] = 1.0 / sqrt(v17.f64[1] + v18 + v17.f64[0]);
  float64x2_t v19 = vmulq_n_f64(v12, v17.f64[0]);
  float64x2_t v20 = vmulq_laneq_f64(v17, v16, 1);
  *(void *)&v17.f64[0] = vdupq_laneq_s64((int64x2_t)v19, 1).u64[0];
  v21.f64[0] = v20.f64[0];
  v21.f64[1] = v19.f64[0];
  float64x2_t v22 = vmlaq_f64(vmulq_f64(v21, vnegq_f64(v9)), v19, v10);
  float64x2_t v23 = vmlaq_laneq_f64(vmulq_laneq_f64(v13, v19, 1), v20, v9, 1);
  float64x2_t v24 = vmulq_f64(v22, v22);
  double v25 = vmulq_f64(v23, v23).f64[0];
  v23.f64[1] = v22.f64[0];
  v7.f64[0] = 1.0 / sqrt(v24.f64[1] + v25 + v24.f64[0]);
  float64x2_t v26 = vmulq_laneq_f64(v7, v22, 1);
  float64x2_t v27 = vmulq_n_f64(v23, v7.f64[0]);
  v17.f64[1] = v27.f64[1];
  *(double *)&long long v28 = -(vmulq_f64(v4, v20).f64[0] + vaddvq_f64(vmulq_f64(*a1, v19)));
  *((double *)&v28 + 1) = -(vmulq_f64(v4, v26).f64[0] + vaddvq_f64(vmulq_f64(*a1, v27)));
  __asm { FMOV            V0.2D, #1.0 }
  *(double *)&_Q0 = -(v15 + vaddvq_f64(vmulq_f64(*a1, v9)));
  *(int64x2_t *)a4 = vzip1q_s64((int64x2_t)v19, (int64x2_t)v27);
  *(_OWORD *)(a4 + 16) = *(unint64_t *)&v9.f64[0];
  *(float64x2_t *)(a4 + 32) = v17;
  *(_OWORD *)(a4 + 48) = *(unint64_t *)&v9.f64[1];
  *(int64x2_t *)(a4 + 64) = vzip1q_s64((int64x2_t)v20, (int64x2_t)v26);
  *(_OWORD *)(a4 + 80) = *(unint64_t *)&v14;
  *(_OWORD *)(a4 + 96) = v28;
  *(_OWORD *)(a4 + 112) = _Q0;
  return *(double *)&_Q0;
}

void ***_ZNSt3__120back_insert_iteratorINS_6vectorIDv3_fNS_9allocatorIS2_EEEEEaSB8ne180100EOS2_(void ***a1, _OWORD *a2)
{
  float64x2_t v4 = *a1;
  float64x2_t v5 = (*a1)[1];
  float64x2_t v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = ((char *)v5 - (unsigned char *)*v4) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v8 - (void)*v4;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      double v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<LAUI_uniform_cubic_b_spline_renderer_private::control_point>>(v7, v14);
    }
    else {
      double v15 = 0;
    }
    float64x2_t v16 = &v15[16 * v11];
    float64x2_t v17 = &v15[16 * v14];
    *(_OWORD *)float64x2_t v16 = *a2;
    float64x2_t v10 = v16 + 16;
    float64x2_t v19 = (char *)*v4;
    double v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        long long v20 = *((_OWORD *)v18 - 1);
        v18 -= 16;
        *((_OWORD *)v16 - 1) = v20;
        v16 -= 16;
      }
      while (v18 != v19);
      double v18 = (char *)*v4;
    }
    *float64x2_t v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    _OWORD *v5 = *a2;
    float64x2_t v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

void *LAUI_uniform_cubic_b_spline_renderer::spline_t::state_t::state_t(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4);
  return a1;
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    float64x2_t v6 = result;
    uint64_t result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2144933D4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_214493438(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

CGColor *LAUI_CA_utilities::create_converted_color(CGColor *color, CGColor *a2, CGColorSpace *a3)
{
  if (color)
  {
    float64x2_t v4 = color;
    if (!a2) {
      return CGColorRetain(v4);
    }
    ColorSpace = CGColorGetColorSpace(color);
    if (!ColorSpace || ColorSpace == a2) {
      return CGColorRetain(v4);
    }
    CFStringRef v6 = CGColorSpaceCopyName(ColorSpace);
    CFStringRef v7 = v6;
    size_t v8 = (CFStringRef *)MEMORY[0x263F00238];
    if (!v6)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      goto LABEL_16;
    }
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x263F00238], 0))
    {
      if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x263F00230], 0))
      {
        if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x263F002D8], 0))
        {
          int v9 = 0;
          int v10 = CFEqual(v7, (CFStringRef)*MEMORY[0x263F002C8]);
          int v11 = v10;
LABEL_15:
          CFRelease(v7);
LABEL_16:
          CFStringRef v12 = CGColorSpaceCopyName(a2);
          CFStringRef v13 = v12;
          if (!v12)
          {
            CGColorRenderingIntent v17 = kCGRenderingIntentPerceptual;
            return CGColorCreateCopyByMatchingToColorSpace(a2, v17, v4, 0);
          }
          if (CFStringCompare(v12, *v8, 0))
          {
            if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x263F00230], 0))
            {
              if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x263F002D8], 0))
              {
                int v14 = 0;
                int v15 = CFEqual(v13, (CFStringRef)*MEMORY[0x263F002C8]);
                int v16 = v15;
LABEL_26:
                CFRelease(v13);
                CGColorRenderingIntent v17 = kCGRenderingIntentPerceptual;
                if (v11 && v16 && ((((v14 << 16) | (v15 << 8) | v16) ^ ((v9 << 16) | (v10 << 8) | v11)) & 0x10000) == 0)
                {
                  if ((((unsigned __int16)(((_WORD)v15 << 8) | v16) ^ (unsigned __int16)(((_WORD)v10 << 8) | v11)) & 0x100) == 0) {
                    return CGColorRetain(v4);
                  }
                  CGColorRenderingIntent v17 = kCGRenderingIntentAbsoluteColorimetric;
                }
                return CGColorCreateCopyByMatchingToColorSpace(a2, v17, v4, 0);
              }
              int v14 = 0;
              int v15 = 0;
            }
            else
            {
              int v14 = 1;
              int v15 = 1;
            }
          }
          else
          {
            int v15 = 0;
            int v14 = 1;
          }
          int v16 = 1;
          goto LABEL_26;
        }
        int v9 = 0;
        int v10 = 0;
      }
      else
      {
        int v9 = 1;
        int v10 = 1;
      }
    }
    else
    {
      int v10 = 0;
      int v9 = 1;
    }
    int v11 = 1;
    goto LABEL_15;
  }
  return color;
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::~renderer_t(LAUI_uniform_cubic_b_spline_renderer::renderer_t *this)
{
  uint64_t v2 = (void *)*((void *)this + 104);
  if (v2)
  {
    *((void *)this + 105) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 101);
  if (v3)
  {
    *((void *)this + 102) = v3;
    operator delete(v3);
  }
  float64x2_t v4 = (void *)*((void *)this + 98);
  if (v4)
  {
    *((void *)this + 99) = v4;
    operator delete(v4);
  }
  float64x2_t v5 = (void *)*((void *)this + 95);
  if (v5)
  {
    *((void *)this + 96) = v5;
    operator delete(v5);
  }
  CFStringRef v6 = (void *)*((void *)this + 92);
  if (v6)
  {
    *((void *)this + 93) = v6;
    operator delete(v6);
  }
  int v9 = (void **)((char *)this + 688);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destroy_vector::operator()[abi:ne180100](&v9);
  for (uint64_t i = 656; i != 640; i -= 8)

  size_t v8 = (std::__shared_weak_count *)*((void *)this + 73);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  int v9 = (void **)((char *)this + 552);
  std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__destroy_vector::operator()[abi:ne180100](&v9);

  LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::~shared_state_t((id *)this + 3);
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::spline_container_t>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 56)
  {
    float64x2_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    float64x2_t v4 = (void **)v1[1];
    float64x2_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 6;
        std::__destroy_at[abi:ne180100]<LAUI_uniform_cubic_b_spline_renderer::renderer_t::buffers_t,0>(v4);
      }
      while (v4 != v2);
      float64x2_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void LAUI_CA_utilities::animation_completion_handler_container::set_completion(void **a1, void *a2)
{
  id v5 = a2;
  LAUI_CA_utilities::animation_completion_handler_container::operator()(a1, 0);
  uint64_t v3 = [v5 copy];
  float64x2_t v4 = *a1;
  *a1 = (void *)v3;
}

uint64_t ___ZN17LAUI_CA_utilities38animation_completion_handler_containerclEb_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void LAUI_uniform_cubic_b_spline_renderer::targetable_animator_t<anonymous namespace'::face_id_animator_t,anonymous namespace'::face_id_state_t,anonymous namespace'::face_id_target_t>::set_target(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 49) = 1;
  __int32 v2 = *(__int32 *)(a2 + 100);
  v150.i32[0] = 953267991;
  v150.i32[1] = v2;
  if (*(float *)&v2 <= 0.0 || *(float *)&v2 >= 1.0) {
    goto LABEL_236;
  }
  if (*(float *)&v2 < 0.0001) {
    v150.i32[0] = v2;
  }
  LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v149, &v150, *(float *)(a2 + 80));
  if (*(unsigned char *)(a2 + 88))
  {
    LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v148, &v150, *(float *)(a2 + 84));
  }
  else
  {
    *(_OWORD *)long long v148 = *(_OWORD *)v149;
    *(_OWORD *)&v148[12] = *(_OWORD *)&v149[12];
  }
  if (*(unsigned char *)(a2 + 96))
  {
    LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v147, &v150, *(float *)(a2 + 92));
  }
  else
  {
    v147[0] = *(float32x4_t *)v149;
    *(float32x4_t *)((char *)v147 + 12) = *(float32x4_t *)&v149[12];
  }
  unsigned int v6 = *(unsigned __int8 *)(a2 + 72);
  if (v6 - 3 >= 2)
  {
    int v8 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      BOOL v7 = (unint64_t)((*(void *)(a1 + 8) - *(void *)a1) / 112) > 1;
      int v8 = 2 * v7;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    int v8 = 0;
  }
  int v9 = *(float *)&v149[16] <= 0.0 ? 6 : v8;
  if (v6 >= 7) {
    goto LABEL_236;
  }
  unint64_t v10 = 0x1020403uLL >> (8 * v6);
  v142.i8[0] = v10;
  LOBYTE(v143) = 0;
  LOBYTE(v145) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a2;
  long long v12 = *(_OWORD *)(a2 + 32);
  float64x2_t v11 = *(float64x2_t *)(a2 + 48);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 112) = v12;
  *(float64x2_t *)(a1 + 128) = v11;
  *(_OWORD *)(a1 + 96) = v13;
  int v14 = *(float32x4_t **)(a1 + 872);
  int v15 = *(float32x4_t **)(a1 + 880);
  v11.f64[0] = v145;
  double v16 = v143;
  uint64_t v132 = a2;
  float64x2_t v134 = v11;
  if (v14 != v15)
  {
    unsigned int v17 = *(unsigned __int8 *)(a2 + 72);
    if (v17 > 6) {
      goto LABEL_236;
    }
    int v18 = 0;
    int v19 = 0;
    BOOL v21 = v17 != 3 || *(void *)(a2 + 56) < 0xAuLL;
    while (1)
    {
      if (!v21) {
        goto LABEL_236;
      }
      if (v10 - 2 >= 3 && v10 != 0)
      {
        if (v10 != 1) {
          goto LABEL_236;
        }
        goto LABEL_58;
      }
      float32x4_t v23 = v14[10];
      float32x4_t v24 = vmulq_f32(v23, (float32x4_t)xmmword_214498B80);
      float32x4_t v25 = (float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v24, 8uLL);
      *(float32x2_t *)v24.f32 = vadd_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v25.f32);
      v24.f32[0] = vaddv_f32(*(float32x2_t *)v24.f32);
      v25.i64[0] = 0;
      float32x4_t v26 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v25, v24), 0), (int8x16_t)vnegq_f32(v23), (int8x16_t)v23);
      int8x16_t v27 = (int8x16_t)vmulq_f32(v26, v26);
      *(float32x2_t *)v27.i8 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
      v27.i32[0] = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)).u32[0];
      *(float32x2_t *)v25.f32 = vrecpe_f32((float32x2_t)v27.u32[0]);
      *(float32x2_t *)v25.f32 = vmul_f32(*(float32x2_t *)v25.f32, vrecps_f32((float32x2_t)v27.u32[0], *(float32x2_t *)v25.f32));
      float32x4_t v28 = vmulq_n_f32(vmulq_f32(v26, (float32x4_t)xmmword_214498ED0), vmul_f32(*(float32x2_t *)v25.f32, vrecps_f32((float32x2_t)v27.u32[0], *(float32x2_t *)v25.f32)).f32[0]);
      int32x4_t v29 = (int32x4_t)vnegq_f32(v28);
      int8x16_t v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v28, vtrn1q_s32((int32x4_t)v28, v29));
      float32x4_t v31 = (float32x4_t)vrev64q_s32((int32x4_t)v28);
      v31.i32[0] = v29.i32[1];
      v31.i32[3] = v29.i32[2];
      float32x4_t v32 = vaddq_f32(vmlaq_f32(v28, (float32x4_t)0, v31), vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v29, 8uLL), (float32x4_t)0), (float32x4_t)0, (float32x4_t)vextq_s8(v30, v30, 8uLL)));
      float32x4_t v33 = vmulq_f32(v32, v32);
      LODWORD(v137) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u32[0];
      float32x4_t v139 = v32;
      float v34 = atan2f(sqrtf(v137), v32.f32[3]);
      double v35 = fabsf(v34 + v34) / 0.785398163;
      if (v35 != 0.0)
      {
        float32x2_t v36 = vrsqrte_f32((float32x2_t)LODWORD(v137));
        float32x2_t v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)LODWORD(v137), vmul_f32(v36, v36)));
        float32x4_t v38 = vmulq_n_f32(v139, vmul_f32(v37, vrsqrts_f32((float32x2_t)LODWORD(v137), vmul_f32(v37, v37))).f32[0]);
        float32x4_t v39 = vmulq_f32(v38, (float32x4_t)xmmword_214498F30);
        float32x4_t v40 = vmulq_f32(v38, v38);
        double v41 = acos((float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v39, 2), vaddq_f32(v39, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v39.f32, 1))).f32[0]/ sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).f32[0])));
        if (v41 >= 1.57079633) {
          double v41 = 3.14159265 - v41;
        }
        double v42 = v41 / 1.57079633;
        if (v10 - 2 >= 3)
        {
          if (v10 >= 2u) {
            goto LABEL_236;
          }
          if (v42 == 0.0) {
            goto LABEL_58;
          }
          double v35 = v35 * v42;
        }
        if (v35 != 0.0)
        {
          double v43 = fmin(v35, 1.0);
          double v44 = fmin(v42, 1.0);
          float64x2_t v45 = v134;
          if (v134.f64[0] < v44 || v18 == 0) {
            v45.f64[0] = v44;
          }
          float64x2_t v134 = v45;
          if (v19)
          {
            if (v16 < v43) {
              double v16 = v43;
            }
          }
          else
          {
            int v19 = 1;
            double v16 = v43;
          }
          int v18 = 1;
        }
      }
LABEL_58:
      v14 += 18;
      if (v14 == v15) {
        goto LABEL_61;
      }
    }
  }
  LOBYTE(v19) = 0;
  int v18 = 0;
LABEL_61:
  char v146 = v18;
  float64_t v145 = v134.f64[0];
  char v144 = v19;
  double v143 = v16;
  if (*(unsigned char *)(a1 + 144))
  {
    __int32 v47 = 0;
    __int32 v48 = 1.0;
    double v49 = -3.14159265;
    double v50 = 3.14159265;
    __int32 v51 = 0;
    switch(*(unsigned char *)(a1 + 152))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        goto LABEL_68;
      case 4:
        goto LABEL_66;
      case 6:
        goto LABEL_67;
      default:
        goto LABEL_236;
    }
  }
  __int32 v47 = 0;
  __int32 v48 = 1.0;
  double v49 = -3.14159265;
  double v50 = 3.14159265;
  __int32 v51 = 0;
  switch(*(unsigned char *)(a1 + 152))
  {
    case 0:
    case 1:
    case 2:
    case 5:
      goto LABEL_68;
    case 3:
      unint64_t v52 = *(void *)(a1 + 136);
      if (v52 >= 0xA) {
        goto LABEL_236;
      }
      __int32 v47 = dword_214499298[v52];
      __int32 v51 = dword_2144992C0[v52];
      __int32 v48 = 1045220557;
LABEL_68:
      __p[0].i32[0] = v48;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v148;
      __p[1] = *(float32x4_t *)&v148[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 272, (uint64_t)__p, v9);
      __p[0].i32[0] = v47;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v148;
      __p[1] = *(float32x4_t *)&v148[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 328, (uint64_t)__p, v9);
      __p[0].i32[0] = v51;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v148;
      __p[1] = *(float32x4_t *)&v148[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 384, (uint64_t)__p, v9);
      __p[0].i32[0] = 1066285284;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v148;
      __p[1] = *(float32x4_t *)&v148[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 440, (uint64_t)__p, v9);
      *(_OWORD *)&v155[12] = *(_OWORD *)&v149[12];
      *(_OWORD *)simd_float4x4 v155 = *(_OWORD *)v149;
      if (*(float *)&v149[16] <= 0.0) {
        goto LABEL_80;
      }
      if (v10 - 2 >= 3)
      {
        if (v10 >= 2u) {
          goto LABEL_236;
        }
      }
      else
      {
        if (v153)
        {
          if (v18 && v134.f64[0] > 0.0)
          {
            if (v134.f64[0] >= 1.0)
            {
              int8x16_t v55 = *(int8x16_t *)(a1 + 176);
              v53.f64[0] = *(float64_t *)(a1 + 192);
            }
            else
            {
              v54.f64[0] = 1.0 - v134.f64[0];
              float64x2_t v53 = vmlaq_f64(vmulq_f64(v134, *(float64x2_t *)(a1 + 192)), *(float64x2_t *)(a1 + 224), v54);
              int8x16_t v55 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 176), v134.f64[0]), *(float64x2_t *)(a1 + 208), 1.0 - v134.f64[0]);
            }
          }
          else
          {
            int8x16_t v55 = *(int8x16_t *)(a1 + 208);
            v53.f64[0] = *(float64_t *)(a1 + 224);
          }
          v55.i64[1] = vextq_s8(v55, v55, 8uLL).u64[0];
          __p[0] = (float32x4_t)v55;
          __p[1] = (float32x4_t)v53;
          __p[2] = *(float32x4_t *)v155;
          *(float32x4_t *)((char *)&__p[2] + 12) = *(float32x4_t *)&v155[12];
          _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(a1 + 496, (uint64_t)__p, v9);
          *(_OWORD *)simd_float4x4 v155 = *(_OWORD *)v152;
          *(_OWORD *)&v155[12] = *(_OWORD *)&v152[12];
        }
      }
LABEL_80:
      __p[0] = 0uLL;
      __asm { FMOV            V0.2D, #-3.0 }
      __p[1] = _Q0;
      __p[2] = *(float32x4_t *)v155;
      *(float32x4_t *)((char *)&__p[2] + 12) = *(float32x4_t *)&v155[12];
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(a1 + 496, (uint64_t)__p, v9);
      float32_t v59 = v49;
      __p[0].f32[0] = v59;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v149;
      __p[1] = *(float32x4_t *)&v149[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 640, (uint64_t)__p, v9);
      float32_t v60 = v50;
      __p[0].f32[0] = v60;
      *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v149;
      __p[1] = *(float32x4_t *)&v149[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(a1 + 696, (uint64_t)__p, v9);
      char v63 = (*(float *)&v149[16] > 0.0) & ~v7;
      unsigned __int32 v64 = (int8x16_t *)(a1 + 80);
      if ((v63 & 1) == 0)
      {
        __p[0].i64[0] = 0;
        *(float32x4_t *)((char *)__p + 8) = *(float32x4_t *)v149;
        *(float32x4_t *)((char *)&__p[1] + 4) = *(float32x4_t *)&v149[12];
        LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(a1 + 752, (uint64_t)__p);
      }
      float32x2_t v65 = *(float32x4_t **)(a1 + 848);
      long long v133 = *(float32x4_t **)(a1 + 856);
      if (v65 == v133) {
        goto LABEL_224;
      }
      int v136 = v9;
      break;
    case 4:
LABEL_66:
      double v49 = *(double *)(a1 + 248);
      double v50 = *(double *)(a1 + 256);
      goto LABEL_68;
    case 6:
LABEL_67:
      double v50 = 0.0;
      double v49 = 0.0;
      goto LABEL_68;
    default:
      goto LABEL_236;
  }
  do
  {
    *(_OWORD *)&v157[12] = *(_OWORD *)&v149[12];
    *(_OWORD *)float32x4_t v157 = *(_OWORD *)v149;
    long long v135 = v65;
    if (*(float *)&v149[16] > 0.0 && v142.u8[0] - 2 >= 3)
    {
      if (v142.u8[0] >= 2u) {
        goto LABEL_237;
      }
      if (v156)
      {
        uint64_t v66 = 4;
        uint64_t v67 = 1;
        switch(*(unsigned char *)(a1 + 152))
        {
          case 0:
            uint64_t v66 = 3;
            goto LABEL_91;
          case 1:
            goto LABEL_91;
          case 2:
            uint64_t v66 = 2;
LABEL_91:
            uint64_t v67 = v66;
            goto LABEL_92;
          case 3:
          case 4:
          case 5:
          case 6:
LABEL_92:
            __p[0].i32[0] = 0;
            std::vector<float>::vector(&v158, v67 + 1, __p);
            float32x4_t v68 = v158;
            *(_DWORD *)(v158.i64[0] + 4 * v67) = 1065353216;
            __p[0] = v68;
            __p[1].i64[0] = v159;
            uint64_t v159 = 0;
            float32x4_t v158 = 0uLL;
            LAUI_uniform_cubic_b_spline_renderer::weighted_spline_t::state((unint64_t *)&v65[2], __p, (uint64_t)v152);
            if (__p[0].i64[0])
            {
              __p[0].i64[1] = __p[0].i64[0];
              operator delete((void *)__p[0].i64[0]);
            }
            unsigned __int32 v64 = (int8x16_t *)(a1 + 80);
            if (v158.i64[0])
            {
              v158.i64[1] = v158.i64[0];
              operator delete((void *)v158.i64[0]);
            }
            unsigned int v69 = *(unsigned __int8 *)(a1 + 152);
            if (v69 >= 7) {
              goto LABEL_236;
            }
            unint64_t v70 = 0x1020403uLL >> (8 * v69);
            if (v142.u8[0] - 2 < 3)
            {
              float32x4_t v71 = 0uLL;
              switch((char)v70)
              {
                case 0:
                case 1:
                  goto LABEL_105;
                case 2:
                  goto LABEL_101;
                case 3:
                  goto LABEL_102;
                case 4:
                  goto LABEL_103;
                default:
                  goto LABEL_236;
              }
            }
            if (v142.u8[0] >= 2u) {
              goto LABEL_238;
            }
            float32x4_t v71 = 0uLL;
            switch((char)v70)
            {
              case 0:
              case 1:
                goto LABEL_105;
              case 2:
LABEL_101:
                float v72 = v65 + 6;
                goto LABEL_104;
              case 3:
LABEL_102:
                float v72 = v65 + 5;
                goto LABEL_104;
              case 4:
LABEL_103:
                float v72 = v65 + 4;
LABEL_104:
                float32x4_t v71 = *v72;
LABEL_105:
                float32x4_t v154 = v71;
                __p[0] = v71;
                __p[1] = *(float32x4_t *)v157;
                *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v157[12];
                _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE((uint64_t)&v65[7], __p, v9);
                float32x4_t v73 = *(float32x4_t **)v152;
                uint64_t v75 = v65[13].i64[0];
                uint64_t v74 = v65[13].i64[1];
                if (0xAAAAAAAAAAAAAAABLL * ((v74 - v75) >> 5) != (uint64_t)(*(void *)&v152[8] - *(void *)v152) >> 4) {
                  goto LABEL_236;
                }
                if (v75 != v74)
                {
                  do
                  {
                    __p[0] = *v73;
                    __p[1] = *(float32x4_t *)v157;
                    *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v157[12];
                    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v75, __p, v9);
                    ++v73;
                    v75 += 96;
                  }
                  while (v75 != v74);
                  float32x4_t v73 = *(float32x4_t **)v152;
                }
                *(_OWORD *)float32x4_t v157 = *(_OWORD *)v155;
                *(_OWORD *)&v157[12] = *(_OWORD *)&v155[12];
                if (v73)
                {
                  *(void *)&v152[8] = v73;
                  operator delete(v73);
                }
                break;
              default:
                goto LABEL_236;
            }
            break;
          default:
            goto LABEL_236;
        }
      }
    }
    __p[0] = v154;
    __p[1] = *(float32x4_t *)v157;
    *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v157[12];
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE((uint64_t)&v65[7], __p, v9);
    float32x4_t v77 = *(float32x4_t **)v152;
    uint64_t v79 = v65[13].i64[0];
    uint64_t v78 = v65[13].i64[1];
    if (0xAAAAAAAAAAAAAAABLL * ((v78 - v79) >> 5) != (uint64_t)(*(void *)&v152[8] - *(void *)v152) >> 4) {
      goto LABEL_236;
    }
    if (v79 != v78)
    {
      do
      {
        __p[0] = *v77;
        __p[1] = *(float32x4_t *)v157;
        *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v157[12];
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v79, __p, v9);
        ++v77;
        v79 += 96;
      }
      while (v79 != v78);
      float32x4_t v77 = *(float32x4_t **)v152;
    }
    if (v77)
    {
      *(void *)&v152[8] = v77;
      operator delete(v77);
    }
    unint64_t v80 = (void *)v65->i64[1];
    long long v138 = (void *)v65[1].i64[0];
    if (v80 == v138) {
      goto LABEL_223;
    }
    do
    {
      int8x8_t v81 = *(int8x8_t *)(a1 + 1152);
      if (!*(void *)&v81) {
        goto LABEL_235;
      }
      unint64_t v82 = v80[1];
      *(int8x8_t *)v61.i8 = vcnt_s8(v81);
      v61.i16[0] = vaddlv_u8(*(uint8x8_t *)v61.i8);
      if (v61.u32[0] > 1uLL)
      {
        unint64_t v83 = v80[1];
        if (v82 >= *(void *)&v81) {
          unint64_t v83 = v82 % *(void *)&v81;
        }
      }
      else
      {
        unint64_t v83 = (*(void *)&v81 - 1) & v82;
      }
      unint64_t v84 = *(void **)(*(void *)(a1 + 1144) + 8 * v83);
      if (!v84 || (unint64_t v85 = (void *)*v84) == 0) {
LABEL_235:
      }
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      while (1)
      {
        unint64_t v86 = v85[1];
        if (v86 == v82) {
          break;
        }
        if (v61.u32[0] > 1uLL)
        {
          if (v86 >= *(void *)&v81) {
            v86 %= *(void *)&v81;
          }
        }
        else
        {
          v86 &= *(void *)&v81 - 1;
        }
        if (v86 != v83) {
          goto LABEL_235;
        }
LABEL_137:
        unint64_t v85 = (void *)*v85;
        if (!v85) {
          goto LABEL_235;
        }
      }
      if (v85[2] != *v80 || v85[3] != v82) {
        goto LABEL_137;
      }
      unsigned int v88 = *(unsigned __int8 *)(a1 + 152);
      if (v88 > 6) {
        goto LABEL_236;
      }
      uint64_t v89 = v85[4];
      uint64_t v90 = *(void *)(a1 + 872);
      float32x4_t v91 = (__int8 *)(v90 + 288 * v89);
      if (((1 << v88) & 0x37) == 0)
      {
        if (v88 != 3)
        {
          int8x16_t v61 = *v64;
          v61.i32[3] = 0;
          float32x4_t v140 = (float32x4_t)v61;
          goto LABEL_152;
        }
        int8x16_t v61 = *v64;
        float32x4_t v140 = *(float32x4_t *)v64;
LABEL_146:
        unint64_t v93 = *(void *)(a1 + 136);
        if (v93 >= 0xA) {
          goto LABEL_236;
        }
        unsigned int v94 = 0x157u >> v93;
        if (v93 - 3 >= 7)
        {
          if (v93 >= 3) {
            goto LABEL_236;
          }
          if (v94)
          {
          }
          else
          {
          }
          if (!*v91) {
            float v95 = v117;
          }
          uint64_t v97 = 2228224;
          uint64_t v104 = 34;
        }
        else
        {
          if (v94)
          {
          }
          else
          {
          }
          if (!*v91) {
            float v95 = v96;
          }
          uint64_t v97 = 0x20000;
LABEL_162:
          uint64_t v104 = 2;
        }
        uint64_t v103 = v104 | v97;
        uint64_t v105 = v90 + 288 * v89;
        long long v107 = *(uint64_t (**)(float32x4_t *, float *))(v105 + 16);
        unint64_t v100 = (uint64_t (**)(float32x4_t *, float *))(v105 + 16);
        long long v106 = v107;
        uint64_t v102 = (uint64_t *)(v100 - 1);
        if (v107
        {
          int v9 = v136;
LABEL_198:
          *uint64_t v102 = v103;
          *(void *)(v90 + 288 * v89 + 16) = v95;
          goto LABEL_217;
        }
        *uint64_t v102 = v103;
        *unint64_t v100 = v95;
        if (v95 != v106)
        {
          {
            float v109 = 0.988;
          }
          else
          {
            float v109 = 0.99986;
          }
          if (v106) {
            float v109 = 0.979;
          }
          uint64_t v110 = v90 + 288 * v89;
          *(float *)(v110 + 28) = v109;
          long long v111 = (__int32 *)(v110 + 28);
          float v112 = *(float *)&v149[8];
          if (!v149[12]) {
            float v112 = 0.001;
          }
          *(float *)(v110 + 88) = v112;
          long long v113 = (float *)(v110 + 88);
          __p[0].f32[0] = v109;
          __p[0].i32[1] = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
          __p[0].i8[8] = 0;
          __p[1].i8[0] = 0;
          __p[1].i32[3] = 0;
          float v114 = INFINITY;
          if (__p[0].f32[1] <= 0.0) {
            float v114 = 0.0;
          }
          __p[1].f32[2] = v114;
          __p[1].f32[1] = v114;
          LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>((uint64_t)(v113 - 14), (uint64_t)__p, 6);
          v61.i32[0] = *v111;
          if (*(float *)v111 <= 0.0)
          {
            int v9 = v136;
            goto LABEL_216;
          }
          __int32 v115 = *(__int32 *)v113;
          __p[0].i32[0] = 953267991;
          __p[0].i32[1] = v115;
          BOOL v116 = *(float *)&v115 > 0.0 && *(float *)&v115 < 1.0;
          unsigned __int32 v64 = (int8x16_t *)(a1 + 80);
          if (v116)
          {
            if (*(float *)&v115 < 0.0001) {
              __p[0].i32[0] = v115;
            }
            LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v152, (float32x2_t *)__p, *(float *)v61.i32);
            __p[0].i32[0] = 0;
            *(float32x4_t *)((char *)__p + 4) = *(float32x4_t *)v152;
            __p[1] = *(float32x4_t *)&v152[12];
            LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>((uint64_t)(v113 - 14), (uint64_t)__p, 0);
            int v9 = v136;
            goto LABEL_217;
          }
          goto LABEL_236;
        }
        int v9 = v136;
LABEL_191:
        if ((v104 & 0x20) == 0) {
          goto LABEL_221;
        }
        goto LABEL_222;
      }
      v61.i32[0] = 0;
      int8x16_t v62 = *v64;
      v76.i8[0] = *v91;
      int8x16_t v92 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v76, v61), 0);
      int8x16_t v76 = *v64;
      v76.i32[3] = 0;
      int8x16_t v61 = vbslq_s8(v92, v76, *v64);
      float32x4_t v140 = (float32x4_t)v61;
      if (v88 == 4)
      {
        uint64_t v97 = 0;
        goto LABEL_162;
      }
      if (v88 == 3) {
        goto LABEL_146;
      }
LABEL_152:
      uint64_t v98 = v90 + 288 * v89;
      long long v101 = *(uint64_t (**)(float32x4_t *, float *))(v98 + 16);
      unint64_t v100 = (uint64_t (**)(float32x4_t *, float *))(v98 + 16);
      uint64_t v99 = v101;
      uint64_t v102 = (uint64_t *)(v100 - 1);
      if (!v101)
      {
        *uint64_t v102 = 0;
        *unint64_t v100 = 0;
        goto LABEL_219;
      }
      {
        if (v88 - 3 < 4)
        {
          uint64_t v103 = 2;
          goto LABEL_198;
        }
        if (v88 >= 3) {
          goto LABEL_236;
        }
      }
      *uint64_t v102 = 0;
      *unint64_t v100 = 0;
      uint64_t v118 = v90 + 288 * v89;
      float v120 = *(float *)(v118 + 88);
      long long v119 = (_DWORD *)(v118 + 88);
      float v121 = v120;
      *(_DWORD *)long long v152 = 953267991;
      BOOL v122 = v120 > 0.0;
      if (v120 <= 0.0)
      {
        *(_DWORD *)&v152[4] = 981668463;
      }
      else
      {
        *(float *)&v152[4] = v121;
        if (!v122 || v121 >= 1.0) {
          goto LABEL_236;
        }
        if (v121 < 0.0001) {
          *(float *)long long v152 = v121;
        }
      }
      uint64_t v124 = v90 + 288 * v89;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration(v124 + 96, (float32x2_t *)v152);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE(v124 + 192, (float32x2_t *)v152);
      *(void *)(v124 + 24) = 0;
      *long long v119 = 0;
      __p[0].i32[0] = 0;
      __p[0].i32[1] = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
      __p[0].i8[8] = 0;
      __p[1].i8[0] = 0;
      __p[1].i32[3] = 0;
      float v125 = INFINITY;
      if (__p[0].f32[1] <= 0.0) {
        float v125 = 0.0;
      }
      __p[1].f32[2] = v125;
      __p[1].f32[1] = v125;
      LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>(v124 + 32, (uint64_t)__p, 6);
LABEL_216:
      unsigned __int32 v64 = (int8x16_t *)(a1 + 80);
LABEL_217:
      if (*v100)
      {
        LOWORD(v104) = *(_WORD *)v102;
        if ((*(_WORD *)v102 & 2) != 0) {
          goto LABEL_191;
        }
      }
LABEL_219:
      __p[0] = (float32x4_t)xmmword_214498B80;
      __p[1] = *(float32x4_t *)v149;
      *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v149[12];
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(v90 + 288 * v89 + 96, __p, v9);
      if (!*v100 || (*(_WORD *)v102 & 0x20) == 0)
      {
LABEL_221:
        __p[0] = v140;
        __p[1] = *(float32x4_t *)v149;
        *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)&v149[12];
        _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(v90 + 288 * v89 + 192, __p, v9);
      }
LABEL_222:
      v80 += 2;
    }
    while (v80 != v138);
LABEL_223:
    float32x2_t v65 = v135 + 15;
  }
  while (&v135[15] != v133);
LABEL_224:
  if (*(unsigned char *)(v132 + 104))
  {
    __p[0] = (float32x4_t)xmmword_214498F40;
    __p[1].i32[0] = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    __p[1].i8[4] = 0;
    __p[1].i8[12] = 0;
    __p[2].i32[2] = 0;
    float v126 = INFINITY;
    if (__p[1].f32[0] <= 0.0) {
      float v126 = 0.0;
    }
    __p[2].f32[1] = v126;
    __p[2].f32[0] = v126;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(a1 + 912, __p, 6);
  }
  long long v127 = (int8x16_t *)(a1 + 80);
  if (*(unsigned char *)(a1 + 112)) {
    long long v127 = (int8x16_t *)(a1 + 96);
  }
  unsigned int v128 = *(unsigned __int8 *)(a1 + 152);
  if (v128 <= 6)
  {
    int8x16_t v129 = *v127;
    if (((1 << v128) & 0x27) != 0)
    {
      v61.i32[0] = 0;
      v62.i8[0] = *(unsigned char *)(a1 + 128);
      int8x16_t v130 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v62, v61), 0);
      int8x16_t v131 = *v127;
      v131.i32[3] = 0;
      int8x16_t v129 = vbslq_s8(v130, v131, v129);
    }
    else
    {
      v129.i32[3] = 0;
    }
    float32x4_t v141 = (float32x4_t)v129;
    __p[0] = (float32x4_t)xmmword_214498B80;
    __p[1] = v147[0];
    *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)((char *)v147 + 12);
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>(a1 + 912, __p, v9);
    __p[0] = v141;
    __p[1] = v147[0];
    *(float32x4_t *)((char *)&__p[1] + 12) = *(float32x4_t *)((char *)v147 + 12);
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE(a1 + 1008, __p, v9);
    return;
  }
LABEL_236:
  __break(1u);
LABEL_237:
  __break(1u);
LABEL_238:
  __break(1u);
}

float32x2_t *LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t(float32x2_t *a1, float32x2_t *a2, float a3)
{
  float v5 = fmaxf(fminf(a3, nexttowardf(1.0, 0.0)), 0.0);
  a1->f32[0] = v5;
  a1->i8[4] = 0;
  a1[1].i8[4] = 0;
  a1[3].i32[0] = 0;
  if (v5 <= 0.0) {
    goto LABEL_4;
  }
  *(float *)v6.i32 = logf(v5);
  int32x2_t v26 = v6;
  __asm { FMOV            V8.2S, #1.0 }
  float32x2_t v12 = vsqrt_f32(vsub_f32(_D8, *a2));
  float32x2_t v13 = vadd_f32(v12, _D8);
  float v23 = v13.f32[0];
  float v24 = logf(v13.f32[1]);
  v14.f32[0] = logf(v23);
  v14.f32[1] = v24;
  float32x2_t v15 = (float32x2_t)vdup_lane_s32(v26, 0);
  float32x2_t v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
  float32x2_t v17 = vsub_f32(_D8, v12);
  float v25 = v17.f32[0];
  v26.i32[0] = logf(v17.f32[1]);
  v18.f32[0] = logf(v25);
  v18.i32[1] = v26.i32[0];
  float32x2_t v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
  float32x2_t v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
  a1[2] = v20;
  float32x2_t v21 = *a2;
  a1[1].i8[4] = 1;
  *(float32x2_t *)((char *)a1 + 4) = v21;
  if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0])
  {
    __break(1u);
LABEL_4:
    a1[2] = 0;
  }
  return a1;
}

float32x2_t *anonymous namespace'::face_id_state_t::transition_t::restriction_delayed_timing@<X0>(float32x2_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result[2].i8[0]
    && *(float *)(a2 + 16) > 0.0
    && (float32x2_t v4 = *(float32x2_t *)(a2 + 4), v5 = *(_DWORD *)(a2 + 12), v24 = v4, v25 = v5, (_BYTE)v5))
  {
    int32x2_t v6 = result;
    float v7 = sqrtf(1.0 - v4.f32[1]);
    float v8 = logf(*(float *)a2);
    float v9 = v7 + 1.0;
    float v10 = fmax((float)(logf(v7 + 1.0) / v8), 0.0);
    float v11 = 1.0 - v7;
    float v12 = fmax((float)(logf(v11) / v8), 0.0);
    BOOL v13 = v12 <= 0.0 || v10 <= 0.0;
    float v14 = fminf(v10, v12);
    float v15 = fmaxf(v10, v12);
    if (!v13) {
      float v15 = v14;
    }
    float v16 = *(double *)&v6[1] * v15;
    float v17 = 1.0 / (float)(v15 / 1.618);
    float v18 = fmax(powf(v9, v17), 0.0);
    float v19 = fmax(powf(v11, v17), 0.0);
    if (v18 <= 0.0 || v19 <= 0.0 || (v18 < 1.0 ? (BOOL v20 = v19 < 1.0) : (BOOL v20 = 0), v20)) {
      float v21 = fmaxf(v18, v19);
    }
    else {
      float v21 = fminf(v18, v19);
    }
    float v22 = nexttowardf(1.0, 0.0);
    uint64_t result = LAUI_uniform_cubic_b_spline_renderer::animation_timing_t::animation_timing_t((float32x2_t *)v23, &v24, fmaxf(fminf(v21, v22), 0.0));
    *(float *)&v23[24] = -v16;
    *(_OWORD *)a3 = *(_OWORD *)v23;
    *(_OWORD *)(a3 + 12) = *(_OWORD *)&v23[12];
    *(unsigned char *)(a3 + 28) = 1;
  }
  else
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 28) = 0;
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 64)) {
    std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(a1 + 56);
  }
  float v4 = *(float *)(a2 + 32);
  if (v4 < 0.0) {
    operator new();
  }
  *(_OWORD *)int32x2_t v6 = *(_OWORD *)(a2 + 8);
  *(void *)&v6[16] = *(void *)(a2 + 24);
  *(_DWORD *)&v6[24] = 0;
  LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(a1, (long long *)v6);
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 20) = *(_OWORD *)&v6[12];
  *(_OWORD *)(a1 + 8) = *(_OWORD *)v6;
  if (*(float *)(a1 + 24) <= 0.0)
  {
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
  }
  else if (v4 > 0.0)
  {
    LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(a1, v4);
  }
  return 1;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)(result + 64)) {
    uint64_t result = std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(result + 56);
  }
  if (a3)
  {
    uint64_t v15 = v5;
    uint64_t v6 = *(unsigned int *)(v5 + 64);
    if (v6 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    float v16 = &v15;
    uint64_t result = ((uint64_t (*)(uint64_t **, uint64_t))*(&off_26C52F398 + v6))(&v16, v5 + 56);
    if (result)
    {
      float v7 = *(float *)(v5 + 32);
      float v8 = *(float *)(v5 + 24) - v7;
      float v9 = *(float *)(v5 + 28) - v7;
      float v10 = *(float *)(a2 + 24);
      float v11 = *(float *)(a2 + 16) - v10;
      float v12 = *(float *)(a2 + 20) - v10;
      if ((a3 & 2) != 0 && (v11 < v8 || v12 < v9)) {
        goto LABEL_16;
      }
      if ((a3 & 4) != 0 && (v11 > v8 || v12 > v9))
      {
LABEL_16:
        if (v10 >= 0.0)
        {
          return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(v5, (long long *)a2);
        }
        else if ((float)(v8 + v10) > 0.0)
        {
          operator new();
        }
      }
    }
  }
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_set_timing(uint64_t result, long long *a2)
{
  float v2 = *((float *)a2 + 6);
  if (v2 < 0.0)
  {
    __break(1u);
    return result;
  }
  float v3 = *((float *)a2 + 4);
  float v4 = (float *)(result + 8);
  if (*(float *)(result + 24) > 0.0 && v3 > 0.0 && *v4 != *(float *)a2)
  {
    float v5 = (float)(*(float *)a2 * (float)(1.0 - *v4)) / (float)(*v4 * (float)(1.0 - *(float *)a2));
    unsigned int v6 = (COERCE_INT(fabs(v5)) - 0x800000) >> 24;
    if (v5 >= 0.0 && v6 <= 0x7E || (LODWORD(v5) - 1) <= 0x7FFFFE) {
      *(void *)(result + 40) = 0;
    }
  }
  long long v9 = *a2;
  *(_OWORD *)(result + 20) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)float v4 = v9;
  if (v2 <= 0.0)
  {
    if (v3 > 0.0) {
      return result;
    }
  }
  else
  {
    *(_DWORD *)(result + 32) = 0;
    if (v3 > 0.0) {
      return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(result, v2);
    }
  }
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(uint64_t a1, float a2)
{
  float v11 = a2;
  float v12 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = a1 + 56;
  v10[0] = &v12;
  if (((unsigned int (*)(void *, uint64_t))*(&off_26C52F398 + v2))(v10, a1 + 56))
  {
    if (a2 == 0.0)
    {
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    else
    {
      v10[0] = a1;
      v10[1] = &v11;
      uint64_t v6 = *(unsigned int *)(a1 + 64);
      if (v6 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      float v12 = v10;
      __int16 v7 = ((uint64_t (*)(void **, uint64_t))*(&off_26C52F3B0 + v6))(&v12, v5);
      int v8 = HIBYTE(v7);
    }
  }
  else
  {
    LOBYTE(v7) = 1;
    int v8 = 1;
  }
  return v7 | (v8 << 8);
}

uint64_t std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(a1);
  }
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<0ul,std::monostate>(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F188 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 8) = 0;
  return a1;
}

BOOL _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t a1)
{
  return *(float *)(**(void **)a1 + 24) > 0.0;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE12is_animatingEvEUlOT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_()
{
  return 1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<2ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F188 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 2;
  return a1;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(**a1, *(float *)(*a1)[1]);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(*a1, a2);
}

uint64_t *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDnLNS8_27animator_interpolation_typeE0EE6updateEfEUlRT_E_EEJRNS0_6__baseILNS0_6_TraitE1EJNS_9monostateENS_10unique_ptrINS8_18animation_target_tIDnEENS_14default_deleteISM_EEEENSK_INS8_18animation_timing_tENSN_ISQ_EEEEEEEEEEDcSC_DpT0_(uint64_t **a1, uint64_t *a2)
{
  return LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(*a1, a2);
}

uint64_t LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(uint64_t result, float a2)
{
  float v2 = *(float *)(result + 24);
  if (v2 <= 0.0) {
    goto LABEL_9;
  }
  if (a2 >= 0.0)
  {
    uint64_t v3 = result;
    float v4 = *(float *)(result + 32) + a2;
    *(float *)(result + 32) = v4;
    if (v4 < v2)
    {
      int v5 = 0;
      *(void *)(result + 40) = 0;
      *(void *)(result + 48) = 0;
      BOOL v6 = v4 >= *(float *)(result + 28);
      return v6 | (v5 << 8);
    }
    float v7 = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    BOOL v8 = v7 <= 0.0;
    *(float *)(v3 + 8) = v7;
    *(unsigned char *)(v3 + 12) = 0;
    float v9 = INFINITY;
    *(unsigned char *)(v3 + 20) = 0;
    if (v8) {
      float v9 = 0.0;
    }
    *(float *)(v3 + 24) = v9;
    *(float *)(v3 + 28) = v9;
    *(_DWORD *)(v3 + 32) = 0;
    *(void *)(v3 + 40) = 0;
    *(void *)(v3 + 48) = 0;
LABEL_9:
    BOOL v6 = 1;
    int v5 = 1;
    return v6 | (v5 << 8);
  }
  __break(1u);
  return result;
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t *result, uint64_t *a2)
{
  float v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 32);
    *(float *)(*a2 + 32) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 32) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 64)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 56);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>(v4, v10);
      MEMORY[0x2166A17E0](v10, 0x1080C405E4FE669);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

void sub_21449567C(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x2166A17E0](v1, 0x1080C405E4FE669);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(float)::{lambda(decltype(nullptr) &)#1}::operator()<std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>(uint64_t *result, uint64_t *a2)
{
  float v2 = (float *)result[1];
  if (*v2 < 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = *a2;
    float v6 = *v2 + *(float *)(*a2 + 24);
    *(float *)(*a2 + 24) = v6;
    if (v6 >= 0.0)
    {
      *(_DWORD *)(v5 + 24) = 0;
      float v9 = fmax((float)(*v2 - v6), 0.0);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, v9);
      uint64_t v10 = *a2;
      *a2 = 0;
      if (*(_DWORD *)(v4 + 64)) {
        std::variant<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>::operator=[abi:ne180100]<std::monostate,0,std::monostate,0ul,0>(v4 + 56);
      }
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_timing(v4, v10, 6);
      MEMORY[0x2166A17E0](v10, 0x1000C40CBDA3C1BLL);
      __int16 v7 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v4, v6);
      int v8 = HIBYTE(v7);
    }
    else
    {
      LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::_update(v4, *v2);
      LOBYTE(v7) = 0;
      int v8 = 0;
    }
    return (uint64_t *)(v7 | (v8 << 8));
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__assign_alt[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(a1, a3);
  }
  uint64_t v3 = *a3;
  *a3 = 0;
  uint64_t result = *a2;
  *a2 = v3;
  if (result) {
    JUMPOUT(0x2166A17E0);
  }
  return result;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<std::monostate,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_timing_t>>>::__emplace[abi:ne180100]<1ul,std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<decltype(nullptr)>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_26C52F188 + v4))(&v7, a1);
  }
  uint64_t v5 = *a2;
  *a2 = 0;
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = 1;
  return a1;
}

BOOL anonymous namespace'::coplanar_ring_updater<true>::function(float32x4_t *a1, float *a2)
{
  float v4 = *a2;
  if (*a2 > 1000.0) {
    float v4 = 1000.0;
  }
  *a2 = v4;
  float v5 = v4 * 0.00628318531;
  __float2 v6 = __sincosf_stret(v5 * 0.5);
  float32x4_t v7 = vmulq_n_f32((float32x4_t)xmmword_214498F30, v6.__sinval);
  v7.i32[3] = LODWORD(v6.__cosval);
  a1[1] = v7;
  return *a2 == 1000.0;
}

void LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration(uint64_t a1, float32x2_t *a2)
{
  int32x2_t v26 = a2;
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  int8x16_t v27 = &v26;
  ((void (*)(float32x2_t ***, uint64_t))*(&off_26C52F3C8 + v2))(&v27, a1 + 80);
  if (*(float *)(a1 + 32) == INFINITY)
  {
    float v5 = *(float *)(a1 + 16);
    if (v5 <= 0.0)
    {
LABEL_8:
      *(void *)(a1 + 32) = 0;
      return;
    }
    *(float *)v6.i32 = logf(v5);
    int32x2_t v25 = v6;
    __asm { FMOV            V8.2S, #1.0 }
    float32x2_t v12 = vsqrt_f32(vsub_f32(_D8, *a2));
    float32x2_t v13 = vadd_f32(v12, _D8);
    float v22 = v13.f32[0];
    float v23 = logf(v13.f32[1]);
    v14.f32[0] = logf(v22);
    v14.f32[1] = v23;
    float32x2_t v15 = (float32x2_t)vdup_lane_s32(v25, 0);
    float32x2_t v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
    float32x2_t v17 = vsub_f32(_D8, v12);
    float v24 = v17.f32[0];
    v25.i32[0] = logf(v17.f32[1]);
    v18.f32[0] = logf(v24);
    v18.i32[1] = v25.i32[0];
    float32x2_t v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
    float32x2_t v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
    *(float32x2_t *)(a1 + 32) = v20;
    float32x2_t v21 = *a2;
    if (!*(unsigned char *)(a1 + 28)) {
      *(unsigned char *)(a1 + 28) = 1;
    }
    *(float32x2_t *)(a1 + 20) = v21;
    if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0])
    {
      __break(1u);
      goto LABEL_8;
    }
  }
}

void _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE(uint64_t a1, float32x2_t *a2)
{
  int32x2_t v26 = a2;
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  int8x16_t v27 = &v26;
  ((void (*)(float32x2_t ***, uint64_t))*(&off_26C52F3E0 + v2))(&v27, a1 + 80);
  if (*(float *)(a1 + 32) == INFINITY)
  {
    float v5 = *(float *)(a1 + 16);
    if (v5 <= 0.0)
    {
LABEL_8:
      *(void *)(a1 + 32) = 0;
      return;
    }
    *(float *)v6.i32 = logf(v5);
    int32x2_t v25 = v6;
    __asm { FMOV            V8.2S, #1.0 }
    float32x2_t v12 = vsqrt_f32(vsub_f32(_D8, *a2));
    float32x2_t v13 = vadd_f32(v12, _D8);
    float v22 = v13.f32[0];
    float v23 = logf(v13.f32[1]);
    v14.f32[0] = logf(v22);
    v14.f32[1] = v23;
    float32x2_t v15 = (float32x2_t)vdup_lane_s32(v25, 0);
    float32x2_t v16 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v14, v15)), (float64x2_t)0));
    float32x2_t v17 = vsub_f32(_D8, v12);
    float v24 = v17.f32[0];
    v25.i32[0] = logf(v17.f32[1]);
    v18.f32[0] = logf(v24);
    v18.i32[1] = v25.i32[0];
    float32x2_t v19 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v18, v15)), (float64x2_t)0));
    float32x2_t v20 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v16), (int8x8_t)vcgtz_f32(v19)), (int8x8_t)vminnm_f32(v16, v19), (int8x8_t)vmaxnm_f32(v16, v19));
    *(float32x2_t *)(a1 + 32) = v20;
    float32x2_t v21 = *a2;
    if (!*(unsigned char *)(a1 + 28)) {
      *(unsigned char *)(a1 + 28) = 1;
    }
    *(float32x2_t *)(a1 + 20) = v21;
    if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v20, 1), v20).u32[0])
    {
      __break(1u);
      goto LABEL_8;
    }
  }
}

void _ZNKSt3__116__variant_detail12__visitation9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS4_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS4_18animation_timing_t23epsilon_configuration_tEEUlOT_E_EclB8ne180100IJRNS0_5__altILm1ENS_10unique_ptrINS4_18animation_target_tIS7_EENS_14default_deleteISM_EEEEEEEEEDcDpOT_(float32x2_t ***a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*(float *)(*a2 + 32) == INFINITY)
  {
    float v3 = *(float *)(v2 + 16);
    if (v3 <= 0.0)
    {
LABEL_7:
      *(void *)(v2 + 32) = 0;
      return;
    }
    float v4 = **a1;
    *(float *)v5.i32 = logf(v3);
    int32x2_t v24 = v5;
    __asm { FMOV            V8.2S, #1.0 }
    float32x2_t v11 = vsqrt_f32(vsub_f32(_D8, *v4));
    float32x2_t v12 = vadd_f32(v11, _D8);
    float v21 = v12.f32[0];
    float v22 = logf(v12.f32[1]);
    v13.f32[0] = logf(v21);
    v13.f32[1] = v22;
    float32x2_t v14 = (float32x2_t)vdup_lane_s32(v24, 0);
    float32x2_t v15 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v13, v14)), (float64x2_t)0));
    float32x2_t v16 = vsub_f32(_D8, v11);
    float v23 = v16.f32[0];
    v24.i32[0] = logf(v16.f32[1]);
    v17.f32[0] = logf(v23);
    v17.i32[1] = v24.i32[0];
    float32x2_t v18 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v17, v14)), (float64x2_t)0));
    float32x2_t v19 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v15), (int8x8_t)vcgtz_f32(v18)), (int8x8_t)vminnm_f32(v15, v18), (int8x8_t)vmaxnm_f32(v15, v18));
    *(float32x2_t *)(v2 + 32) = v19;
    float32x2_t v20 = *v4;
    if (!*(unsigned char *)(v2 + 28)) {
      *(unsigned char *)(v2 + 28) = 1;
    }
    *(float32x2_t *)(v2 + 20) = v20;
    if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v19, 1), v19).u32[0])
    {
      __break(1u);
      goto LABEL_7;
    }
  }
}

void _ZNKSt3__116__variant_detail12__visitation9__variant15__value_visitorIZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIN4simd5quatfELNS4_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS4_18animation_timing_t23epsilon_configuration_tEEUlOT_E_EclB8ne180100IJRNS0_5__altILm2ENS_10unique_ptrISA_NS_14default_deleteISA_EEEEEEEEEDcDpOT_(float32x2_t ***a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*(float *)(*a2 + 16) == INFINITY)
  {
    if (*(float *)v2 <= 0.0)
    {
LABEL_7:
      *(void *)(v2 + 16) = 0;
      return;
    }
    float v3 = **a1;
    *(float *)v4.i32 = logf(*(float *)v2);
    int32x2_t v23 = v4;
    __asm { FMOV            V8.2S, #1.0 }
    float32x2_t v10 = vsqrt_f32(vsub_f32(_D8, *v3));
    float32x2_t v11 = vadd_f32(v10, _D8);
    float v20 = v11.f32[0];
    float v21 = logf(v11.f32[1]);
    v12.f32[0] = logf(v20);
    v12.f32[1] = v21;
    float32x2_t v13 = (float32x2_t)vdup_lane_s32(v23, 0);
    float32x2_t v14 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v12, v13)), (float64x2_t)0));
    float32x2_t v15 = vsub_f32(_D8, v10);
    float v22 = v15.f32[0];
    v23.i32[0] = logf(v15.f32[1]);
    v16.f32[0] = logf(v22);
    v16.i32[1] = v23.i32[0];
    float32x2_t v17 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(vdiv_f32(v16, v13)), (float64x2_t)0));
    float32x2_t v18 = (float32x2_t)vbsl_s8(vand_s8((int8x8_t)vcgtz_f32(v14), (int8x8_t)vcgtz_f32(v17)), (int8x8_t)vminnm_f32(v14, v17), (int8x8_t)vmaxnm_f32(v14, v17));
    *(float32x2_t *)(v2 + 16) = v18;
    float32x2_t v19 = *v3;
    if (!*(unsigned char *)(v2 + 12)) {
      *(unsigned char *)(v2 + 12) = 1;
    }
    *(float32x2_t *)(v2 + 4) = v19;
    if (vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v18, 1), v18).u32[0])
    {
      __break(1u);
      goto LABEL_7;
    }
  }
}

void CASecureFlipBookLayerBaseNameFromLAUISecureFaceIDViewType_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214463000, a2, OS_LOG_TYPE_ERROR, "Invalid LAUISecureFaceIDViewType: %d", (uint8_t *)v2, 8u);
}

uint64_t __getLAErrorHelperClass_block_invoke_cold_1()
{
  CFDataRef v0 = abort_report_np();
  return LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(v0);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_214463000, log, OS_LOG_TYPE_FAULT, "Could not create find bundle for LAUICubicBSplineRenderer", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_214463000, log, OS_LOG_TYPE_FAULT, "Could not find Metal pipeline library in bundle", v1, 2u);
}

void LAUI_uniform_cubic_b_spline_renderer::renderer_t::shared_state_t::create(objc_object  {objcproto9MTLDevice}*)::$_1::operator()(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_214463000, a2, OS_LOG_TYPE_FAULT, "Could not create Metal library: %@", (uint8_t *)&v2, 0xCu);
}

{
  int v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_214463000, a2, OS_LOG_TYPE_FAULT, "Could not create Metal pipeline library: %@", (uint8_t *)&v2, 0xCu);
}

void anonymous namespace'::morphable_quadrant_t<9ul>::convert()
{
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x270EFB7A8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

uint64_t LACLogFaceIDUI()
{
  return MEMORY[0x270F47888]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSUIHardwareButtonHintViewsSupported()
{
  return MEMORY[0x270F77248]();
}

uint64_t SBSUIRegisterHardwareButtonHintViewAsync()
{
  return MEMORY[0x270F77258]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  return MEMORY[0x270F90920]();
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
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

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_suspend(dispatch_object_t object)
{
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

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

float nexttowardf(float a1, long double a2)
{
  MEMORY[0x270EDA720](a1, a2);
  return result;
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}