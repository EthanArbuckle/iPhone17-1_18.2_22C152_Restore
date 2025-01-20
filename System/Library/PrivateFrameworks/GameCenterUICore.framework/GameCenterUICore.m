void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_22600F8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AuthKitUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AuthKitUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264789F18;
    uint64_t v5 = 0;
    AuthKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AuthKitUILibraryCore_frameworkLibrary) {
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2();
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void _annotateDrawInRectWithContextAndInput(uint64_t a1, CGContext *CurrentContext, void *a3, double a4, double a5, CGFloat a6, CGFloat a7)
{
  id v11 = a3;
  if (v11)
  {
    id v24 = v11;
    if (_annotateDrawInRectWithContextAndInput_onceToken != -1)
    {
      dispatch_once(&_annotateDrawInRectWithContextAndInput_onceToken, &__block_literal_global_248);
      id v11 = v24;
    }
    v12 = objc_getAssociatedObject(v11, @"GK_IMAGE_URL_ANNOTATION_KEY");
    if (v12)
    {
      if (!CurrentContext) {
        CurrentContext = UIGraphicsGetCurrentContext();
      }
      v26.width = a6;
      v26.height = a7;
      CGSize v13 = CGContextConvertSizeToDeviceSpace(CurrentContext, v26);
      v14 = NSString;
      id v15 = v24;
      [v15 size];
      uint64_t v17 = v16;
      [v15 size];
      uint64_t v19 = v18;

      v20 = [v12 absoluteString];
      v21 = [v14 stringWithFormat:@"Server Image Usage: %s rect.size=%g x %g image.size=%g x %g %@\n", a1, *(void *)&v13.width, *(void *)&v13.height, v17, v19, v20];

      id v22 = v21;
      v23 = (const char *)[v22 UTF8String];
      fputs(v23, (FILE *)_annotateDrawInRectWithContextAndInput_output);
      fflush((FILE *)_annotateDrawInRectWithContextAndInput_output);
    }
    id v11 = v24;
  }
}

void sub_2260150A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void ___annotateDrawInRectWithContextAndInput_block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = [v1 objectAtIndex:0];

  v3 = [NSString stringWithFormat:@"%@/Logs", v2];
  id v7 = 0;
  [v0 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;
  if (v4)
  {
    NSLog(&cfstr_FailedToCreate_0.isa, v4);
    exit(1);
  }
  uint64_t v5 = [v3 stringByAppendingPathComponent:@"GKImageAnnotation.log"];
  NSLog(&cfstr_Gkimageannotat_0.isa, v5);
  id v6 = v5;
  _annotateDrawInRectWithContextAndInput_output = (uint64_t)fopen((const char *)[v6 UTF8String], "w+");
}

void sub_2260199D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22601A170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22601B50C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void GKRectsCenterYInRect(uint64_t a1, double **a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a1 >= 1)
  {
    id v7 = a2;
    uint64_t v8 = a1;
    uint64_t v10 = 0;
    double v11 = 0.0;
    do
    {
      double v12 = -0.0;
      if (v10) {
        double v12 = a7;
      }
      double v11 = v11 + v12 + a2[v10++][3];
    }
    while (a1 != v10);
    float v13 = (a6 - v11) * 0.5;
    double v14 = a4 + floorf(v13);
    do
    {
      id v15 = *v7++;
      v15[1] = v14;
      double v16 = *v15;
      uint64_t v17 = *((void *)v15 + 2);
      uint64_t v18 = *((void *)v15 + 3);
      double v14 = CGRectGetMaxY(*(CGRect *)(&v14 - 1)) + a7;
      --v8;
    }
    while (v8);
  }
}

void GKRectsCenterXInRect(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a1 >= 1)
  {
    uint64_t v10 = 0;
    double v11 = a7;
    do
      double v11 = v11 + *(double *)(*(void *)(a2 + 8 * v10++) + 16);
    while (a1 != v10);
    uint64_t v12 = 0;
    float v13 = (a5 - v11) * 0.5;
    double MaxY = a3 + floorf(v13);
    do
    {
      id v15 = *(CGFloat **)(a2 + 8 * v12);
      double v16 = -0.0;
      if (v12) {
        double v16 = a7;
      }
      v17.origin.x = MaxY + v16;
      *id v15 = v17.origin.x;
      v17.origin.y = v15[1];
      v17.size.width = v15[2];
      v17.size.height = v15[3];
      double MaxY = CGRectGetMaxY(v17);
      ++v12;
    }
    while (a1 != v12);
  }
}

double GKRectEnforceMinimumHeight(uint64_t a1, uint64_t a2, double a3)
{
  double v3 = *(double *)(a1 + 24);
  double result = a3 - v3;
  if (result > 0.0)
  {
    *(double *)(a1 + 24) = v3 + result;
    double v5 = *(double *)(a2 + 24);
    if (v5 > result)
    {
      double result = v5 - result;
      *(double *)(a2 + 24) = result;
    }
  }
  return result;
}

CGFloat GKRectDivideYIntoThreeConsumingMiddle(double *a1, double *a2, double *a3, CGFloat a4, double a5, CGFloat a6, double a7, double a8, double a9, double a10)
{
  CGFloat v19 = a7 - (a8 + a9 + a10 * 2.0);
  CGFloat v21 = CGRectGetMaxY(*(CGRect *)&a4) + a10;
  v23.origin.x = a4;
  v23.origin.y = v21;
  v23.size.width = a6;
  v23.size.height = v19;
  CGFloat result = CGRectGetMaxY(v23) + a10;
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a8;
  *a2 = a4;
  a2[1] = v21;
  a2[2] = a6;
  a2[3] = v19;
  *a3 = a4;
  a3[1] = result;
  a3[2] = a6;
  a3[3] = a9;
  return result;
}

void sub_22601C0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t GKIsXRUIIdiom()
{
  return 0;
}

uint64_t GKIsXRUIIdiomShouldUsePadUI()
{
  return 0;
}

uint64_t GKIsXRUIIdiomShouldUsePhoneUI()
{
  return 0;
}

uint64_t GKHostUsesXRUIIdiom()
{
  return 0;
}

uint64_t GKIsAvatarEditingSupported()
{
  if (GKIsAvatarEditingSupported_onceToken != -1) {
    dispatch_once(&GKIsAvatarEditingSupported_onceToken, &__block_literal_global_7);
  }
  return GKIsAvatarEditingSupported_sIsSupported;
}

uint64_t __GKIsAvatarEditingSupported_block_invoke()
{
  uint64_t result = AVTUIAreAvatarsSupported();
  GKIsAvatarEditingSupported_sIsSupported = result;
  return result;
}

uint64_t GKCurrentMedusaMode()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v0 userInterfaceIdiom] != 1) {
    goto LABEL_5;
  }
  int v1 = *MEMORY[0x263F402F8];

  if (!v1)
  {
    double v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 bounds];
    double v5 = v4;

    id v6 = [(id)*MEMORY[0x263F1D020] windows];
    v0 = [v6 objectAtIndexedSubscript:0];

    [v0 bounds];
    double v8 = v7 / v5;
    if (v7 / v5 != 0.0)
    {
      if (v8 >= 0.4)
      {
        if (v8 >= 0.6)
        {
          if (v8 >= 0.9) {
            uint64_t v2 = 3;
          }
          else {
            uint64_t v2 = 2;
          }
        }
        else
        {
          uint64_t v2 = 1;
        }
      }
      else
      {
        uint64_t v2 = 0;
      }
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v2;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

BOOL GKShouldLayoutRTL()
{
  return [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] == 1;
}

void sub_22601D938(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

double GKRoundToScreenScale(double a1)
{
  uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  return round(v4 * a1) / v4;
}

void sub_226024FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t __GKThemeBundle_block_invoke()
{
  GKThemeBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

uint64_t sub_22602B630()
{
  sub_226042FE8();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v0 = sub_226042F48();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  double v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_226043068();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = sub_226042F58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v16[-v9];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v0, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, v11, v0);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v12 = sub_226043098();
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  qword_26811E978 = v12;
  unk_26811E980 = v14;
  return result;
}

uint64_t static GCUILocalizedStrings.ACHIEVEMENT_PENDING_APPROVAL.getter()
{
  return sub_2260406C4(&qword_26811E970, &qword_26811E978);
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT(_:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_46(v0, v1, v2);
  uint64_t v4 = OUTLINED_FUNCTION_8(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_32();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_33();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_34();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  sub_226043028();
  sub_226043018();
  OUTLINED_FUNCTION_42();
  uint64_t v12 = sub_226043058();
  if (qword_26811F1D0 != -1) {
    uint64_t v12 = swift_once();
  }
  uint64_t v13 = OUTLINED_FUNCTION_27(v12, (uint64_t)qword_26811F1D8);
  v14(v13);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_12();
  v15();
  sub_226040970();
  OUTLINED_FUNCTION_45();
  uint64_t v16 = OUTLINED_FUNCTION_36();
  v17(v16);
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT_LESS_THAN_FRACTION(_:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_46(v0, v1, v2);
  uint64_t v4 = OUTLINED_FUNCTION_8(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_32();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_33();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_34();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  sub_226043028();
  sub_226043018();
  OUTLINED_FUNCTION_42();
  uint64_t v12 = sub_226043058();
  if (qword_26811F1D0 != -1) {
    uint64_t v12 = swift_once();
  }
  uint64_t v13 = OUTLINED_FUNCTION_27(v12, (uint64_t)qword_26811F1D8);
  v14(v13);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_12();
  v15();
  sub_226040970();
  OUTLINED_FUNCTION_45();
  uint64_t v16 = OUTLINED_FUNCTION_36();
  v17(v16);
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT_ONLY(_:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v3 = OUTLINED_FUNCTION_46(v0, v1, v2);
  uint64_t v4 = OUTLINED_FUNCTION_8(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_32();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_33();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_34();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  sub_226043028();
  sub_226043018();
  OUTLINED_FUNCTION_42();
  uint64_t v12 = sub_226043058();
  if (qword_26811F1D0 != -1) {
    uint64_t v12 = swift_once();
  }
  uint64_t v13 = OUTLINED_FUNCTION_27(v12, (uint64_t)qword_26811F1D8);
  v14(v13);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_12();
  v15();
  sub_226040970();
  OUTLINED_FUNCTION_45();
  uint64_t v16 = OUTLINED_FUNCTION_36();
  v17(v16);
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22602BFD8()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811E990 = v14;
  *(void *)algn_26811E998 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.DEVELOPER.getter()
{
  return sub_2260406C4(&qword_26811E988, &qword_26811E990);
}

id sub_22602C318(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v3 = (void *)sub_226043078();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22602C364()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811E9A8 = v14;
  unk_26811E9B0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_INVITE_CODE_FETCH_IN_PROGRESS_ERROR.getter()
{
  return sub_2260406C4(&qword_26811E9A0, &qword_26811E9A8);
}

uint64_t sub_22602C6A4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811E9C0 = v14;
  *(void *)algn_26811E9C8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SENDER_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811E9B8, &qword_26811E9C0);
}

uint64_t sub_22602C9E4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811E9D8 = v14;
  unk_26811E9E0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811E9D0, &qword_26811E9D8);
}

void static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_UPSELL(playerName:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = OUTLINED_FUNCTION_47(v0, v1);
  uint64_t v3 = OUTLINED_FUNCTION_8(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  uint64_t v6 = OUTLINED_FUNCTION_8(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_2_2();
  uint64_t v8 = OUTLINED_FUNCTION_8(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_21();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  OUTLINED_FUNCTION_48();
  sub_226043028();
  sub_226043018();
  sub_226043028();
  uint64_t v11 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v11 = swift_once();
  }
  uint64_t v12 = OUTLINED_FUNCTION_22(v11, (uint64_t)qword_26811F1D8);
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  v14();
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_18();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22602CF5C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811E9F0 = v14;
  *(void *)algn_26811E9F8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_CELL_FROM_CONTACTS_LABEL.getter()
{
  return sub_2260406C4(&qword_26811E9E8, &qword_26811E9F0);
}

uint64_t sub_22602D2A4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EA08 = v14;
  unk_26811EA10 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.GAME_CENTER.getter()
{
  return sub_2260406C4(&qword_26811EA00, &qword_26811EA08);
}

uint64_t sub_22602D5E8()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EA20 = v14;
  *(void *)algn_26811EA28 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.GAME_CENTER_FRIEND_REQUEST_ACCEPTED.getter()
{
  return sub_2260406C4(&qword_26811EA18, &qword_26811EA20);
}

uint64_t sub_22602D928()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EA38 = v14;
  unk_26811EA40 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.LEADERBOARD_PENDING_APPROVAL.getter()
{
  return sub_2260406C4(&qword_26811EA30, &qword_26811EA38);
}

uint64_t sub_22602DC68()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  v17[0] = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_226042F48();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226043068();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_226042F58();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v17 - v12;
  uint64_t v14 = sub_226042F08();
  __swift_allocate_value_buffer(v14, qword_26811EA50);
  __swift_project_value_buffer(v14, (uint64_t)qword_26811EA50);
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_26811F1D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  sub_226040970();
  sub_226042EF8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t static GCUILocalizedStrings.NO_ACHIEVEMENT_RARITY.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26811EA48 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226042F08();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26811EA50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_22602E048()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EA70 = v14;
  *(void *)algn_26811EA78 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.NO_FRIENDS_EMPTY_STATE_DESCRIPTION.getter()
{
  return sub_2260406C4(&qword_26811EA68, &qword_26811EA70);
}

uint64_t sub_22602E388()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EA88 = v14;
  unk_26811EA90 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_CARD_BUTTON_INVITE.getter()
{
  return sub_2260406C4(&qword_26811EA80, &qword_26811EA88);
}

uint64_t sub_22602E6C0()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EAA0 = v14;
  *(void *)algn_26811EAA8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_PICKER_NEARBY_OR_BOOP_INSTRUCTIONAL_MESSAGE.getter()
{
  return sub_2260406C4(&qword_26811EA98, &qword_26811EAA0);
}

uint64_t sub_22602EA00()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EAB8 = v14;
  unk_26811EAC0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_PICKER_NEARBY_OR_BOOP_INSTRUCTIONAL_MESSAGE_WLAN.getter()
{
  return sub_2260406C4(&qword_26811EAB0, &qword_26811EAB8);
}

uint64_t sub_22602ED40()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EAD0 = v14;
  *(void *)algn_26811EAD8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PRERELEASE_ITEM.getter()
{
  return sub_2260406C4(&qword_26811EAC8, &qword_26811EAD0);
}

uint64_t sub_22602F080()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EAE8 = v14;
  unk_26811EAF0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.READY_FOR_REVIEW.getter()
{
  return sub_2260406C4(&qword_26811EAE0, &qword_26811EAE8);
}

uint64_t sub_22602F3C0()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB00 = v14;
  *(void *)algn_26811EB08 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.RETRY.getter()
{
  return sub_2260406C4(&qword_26811EAF8, &qword_26811EB00);
}

uint64_t sub_22602F700()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB18 = v14;
  unk_26811EB20 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BANNER_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EB10, &qword_26811EB18);
}

uint64_t sub_22602FA40()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB30 = v14;
  *(void *)algn_26811EB38 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BANNER_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EB28, &qword_26811EB30);
}

uint64_t sub_22602FD80()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB48 = v14;
  unk_26811EB50 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_TITLE_MESSAGE.getter()
{
  return sub_2260406C4(&qword_26811EB40, &qword_26811EB48);
}

uint64_t sub_2260300C0()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB60 = v14;
  *(void *)algn_26811EB68 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_WITH_APPLEID_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EB58, &qword_26811EB60);
}

uint64_t sub_226030400()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB78 = v14;
  unk_26811EB80 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EB70, &qword_26811EB78);
}

uint64_t sub_22603073C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EB90 = v14;
  *(void *)algn_26811EB98 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_PROMPT_MESSAGE_TEXT.getter()
{
  return sub_2260406C4(&qword_26811EB88, &qword_26811EB90);
}

uint64_t sub_226030A7C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EBA8 = v14;
  unk_26811EBB0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_PROMPT_MESSAGE_TEXT_WITH_APPLEID.getter()
{
  return sub_2260406C4(&qword_26811EBA0, &qword_26811EBA8);
}

uint64_t sub_226030DBC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EBC0 = v14;
  *(void *)algn_26811EBC8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIENDS_WHO_HAVE_THIS.getter()
{
  return sub_2260406C4(&qword_26811EBB8, &qword_26811EBC0);
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SEC_AGO(sec:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_37();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_MIN_AGO(min:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_37();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

id sub_2260314EC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  a4(a3);
  uint64_t v4 = (void *)sub_226043078();
  swift_bridgeObjectRelease();
  return v4;
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_HOUR_AGO(hr:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_37();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_DAY_AGO(day:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_37();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_WEEK_AGO(week:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_37();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_AVATAR_COUNT(COUNT:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  sub_226043028();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_26();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_226031D3C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EBD8 = v14;
  unk_26811EBE0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SECTION_SHOW_MORE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EBD0, &qword_26811EBD8);
}

uint64_t sub_22603207C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EBF0 = v14;
  *(void *)algn_26811EBF8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SECTION_SHOW_LESS_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EBE8, &qword_26811EBF0);
}

void static GCUILocalizedStrings.LEADERBOARD_LIST_ITEM_SUBTITLE_FRIENDS_PLAYING(COUNT:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  sub_226043028();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_2260325D4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC08 = v14;
  unk_26811EC10 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PROFILE_CREATION_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EC00, &qword_26811EC08);
}

uint64_t sub_226032914()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC20 = v14;
  *(void *)algn_26811EC28 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CHOOSE_NICKNAME_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EC18, &qword_26811EC20);
}

uint64_t sub_226032C54()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC38 = v14;
  unk_26811EC40 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_HEADER.getter()
{
  return sub_2260406C4(&qword_26811EC30, &qword_26811EC38);
}

uint64_t sub_226032F94()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC50 = v14;
  *(void *)algn_26811EC58 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_DESCRIPTION.getter()
{
  return sub_2260406C4(&qword_26811EC48, &qword_26811EC50);
}

uint64_t sub_2260332D4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC68 = v14;
  unk_26811EC70 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_DESCRIPTION_TVOS.getter()
{
  return sub_2260406C4(&qword_26811EC60, &qword_26811EC68);
}

uint64_t sub_226033614()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC80 = v14;
  *(void *)algn_26811EC88 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.AVATAR_DESCRIPTION_TVOS.getter()
{
  return sub_2260406C4(&qword_26811EC78, &qword_26811EC80);
}

uint64_t sub_226033954()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EC98 = v14;
  unk_26811ECA0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_CONTACT_INTEGRATION_HEADER_TEXT.getter()
{
  return sub_2260406C4(&qword_26811EC90, &qword_26811EC98);
}

uint64_t sub_226033C9C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ECB0 = v14;
  *(void *)algn_26811ECB8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_CUSTOMIZE_PROFILE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ECA8, &qword_26811ECB0);
}

uint64_t sub_226033FDC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ECC8 = v14;
  unk_26811ECD0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_MAC_CUSTOMIZE_PROFILE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ECC0, &qword_26811ECC8);
}

uint64_t sub_22603431C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ECE0 = v14;
  *(void *)algn_26811ECE8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_CUSTOMIZE_PROFILE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ECD8, &qword_26811ECE0);
}

uint64_t sub_22603465C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ECF8 = v14;
  unk_26811ED00 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_ONBOARDING_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ECF0, &qword_26811ECF8);
}

uint64_t sub_2260349A4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED10 = v14;
  *(void *)algn_26811ED18 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_ONBOARDING_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811ED08, &qword_26811ED10);
}

uint64_t sub_226034CE4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED28 = v14;
  unk_26811ED30 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ED20, &qword_26811ED28);
}

uint64_t sub_22603502C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED40 = v14;
  *(void *)algn_26811ED48 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_HEADER.getter()
{
  return sub_2260406C4(&qword_26811ED38, &qword_26811ED40);
}

uint64_t sub_226035370()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED58 = v14;
  unk_26811ED60 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SEARCH_SHEET_HEADER.getter()
{
  return sub_2260406C4(&qword_26811ED50, &qword_26811ED58);
}

uint64_t sub_2260356AC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED70 = v14;
  *(void *)algn_26811ED78 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_SEARCH_PLACEHOLDER.getter()
{
  return sub_2260406C4(&qword_26811ED68, &qword_26811ED70);
}

uint64_t sub_2260359F4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811ED88 = v14;
  unk_26811ED90 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_DONE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ED80, &qword_26811ED88);
}

uint64_t sub_226035D28()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EDA0 = v14;
  *(void *)algn_26811EDA8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_EMPTY_STATE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811ED98, &qword_26811EDA0);
}

uint64_t sub_226036068()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EDB8 = v14;
  unk_26811EDC0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_EMPTY_STATE_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EDB0, &qword_26811EDB8);
}

uint64_t sub_2260363A8()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EDD0 = v14;
  *(void *)algn_26811EDD8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_EMPTY_STATE_ACTION_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EDC8, &qword_26811EDD0);
}

uint64_t sub_2260366E8()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EDE8 = v14;
  unk_26811EDF0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_SEARCH_EMPTY_STATE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EDE0, &qword_26811EDE8);
}

void static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_SEARCH_EMPTY_STATE_SUBTITLE(searchTerm:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = OUTLINED_FUNCTION_47(v0, v1);
  uint64_t v3 = OUTLINED_FUNCTION_8(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  uint64_t v6 = OUTLINED_FUNCTION_8(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_2_2();
  uint64_t v8 = OUTLINED_FUNCTION_8(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_21();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  sub_226043028();
  sub_226043018();
  sub_226043028();
  uint64_t v11 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v11 = swift_once();
  }
  uint64_t v12 = OUTLINED_FUNCTION_22(v11, (uint64_t)qword_26811F1D8);
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  v14();
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_18();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

id sub_226036C50(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_226043088();
  a4(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_226043078();
  swift_bridgeObjectRelease();
  return v6;
}

void static GCUILocalizedStrings.FRIEND_SUGGESTION_ALREADY_FRIENDS_SUBTITLE(friendPlayerName:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = OUTLINED_FUNCTION_47(v0, v1);
  uint64_t v3 = OUTLINED_FUNCTION_8(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  uint64_t v6 = OUTLINED_FUNCTION_8(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_2_2();
  uint64_t v8 = OUTLINED_FUNCTION_8(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_21();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  OUTLINED_FUNCTION_48();
  sub_226043028();
  sub_226043018();
  sub_226043028();
  uint64_t v11 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v11 = swift_once();
  }
  uint64_t v12 = OUTLINED_FUNCTION_22(v11, (uint64_t)qword_26811F1D8);
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  v14();
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_18();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_226036EEC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE00 = v14;
  *(void *)algn_26811EE08 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_FROM_CONTACTS_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EDF8, &qword_26811EE00);
}

uint64_t sub_226037230()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE18 = v14;
  unk_26811EE20 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_INVITE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EE10, &qword_26811EE18);
}

uint64_t sub_226037568()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE30 = v14;
  *(void *)algn_26811EE38 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_HIDE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EE28, &qword_26811EE30);
}

uint64_t sub_22603789C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE48 = v14;
  unk_26811EE50 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_NO_CONTACT_AVAILABLE.getter()
{
  return sub_2260406C4(&qword_26811EE40, &qword_26811EE48);
}

uint64_t sub_226037BDC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE60 = v14;
  *(void *)algn_26811EE68 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_SENT_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EE58, &qword_26811EE60);
}

uint64_t sub_226037F10()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE78 = v14;
  unk_26811EE80 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUESTS_SHEET_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EE70, &qword_26811EE78);
}

uint64_t sub_226038258()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EE90 = v14;
  *(void *)algn_26811EE98 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ALL_FRIENDS_SHEET_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EE88, &qword_26811EE90);
}

uint64_t sub_22603859C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EEA8 = v14;
  unk_26811EEB0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_SECTION_FOOTER.getter()
{
  return sub_2260406C4(&qword_26811EEA0, &qword_26811EEA8);
}

uint64_t sub_2260388DC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EEC0 = v14;
  *(void *)algn_26811EEC8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_CONTACTS_TOGGLE_LABEL.getter()
{
  return sub_2260406C4(&qword_26811EEB8, &qword_26811EEC0);
}

uint64_t sub_226038C1C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EED8 = v14;
  unk_26811EEE0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_CONTACTS_TOGGLE_FOOTER.getter()
{
  return sub_2260406C4(&qword_26811EED0, &qword_26811EED8);
}

uint64_t sub_226038F5C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EEF0 = v14;
  *(void *)algn_26811EEF8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_INVITE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EEE8, &qword_26811EEF0);
}

uint64_t sub_22603929C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF08 = v14;
  unk_26811EF10 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_INVITE_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EF00, &qword_26811EF08);
}

uint64_t sub_2260395DC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF20 = v14;
  *(void *)algn_26811EF28 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_EMPTY_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EF18, &qword_26811EF20);
}

uint64_t sub_22603991C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF38 = v14;
  unk_26811EF40 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_EMPTY_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EF30, &qword_26811EF38);
}

uint64_t sub_226039C5C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF50 = v14;
  *(void *)algn_26811EF58 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_SUGGESTIONS_SECTION_HEADER.getter()
{
  return sub_2260406C4(&qword_26811EF48, &qword_26811EF50);
}

void static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_SECTION_HEADER(count:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_49();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22603A1A4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF68 = v14;
  unk_26811EF70 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_EMPTY_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EF60, &qword_26811EF68);
}

uint64_t sub_22603A4EC()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF80 = v14;
  *(void *)algn_26811EF88 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_EMPTY_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811EF78, &qword_26811EF80);
}

uint64_t sub_22603A82C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EF98 = v14;
  unk_26811EFA0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_NICKNAME_MESSAGE.getter()
{
  return sub_2260406C4(&qword_26811EF90, &qword_26811EF98);
}

uint64_t sub_22603AB6C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EFB0 = v14;
  *(void *)algn_26811EFB8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_SUGGESTIONS_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EFA8, &qword_26811EFB0);
}

uint64_t sub_22603AEB0()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EFC8 = v14;
  unk_26811EFD0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_VIEW_PROFILE_BUTTON_TEXT.getter()
{
  return sub_2260406C4(&qword_26811EFC0, &qword_26811EFC8);
}

uint64_t sub_22603B1E4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EFE0 = v14;
  *(void *)algn_26811EFE8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_MAC_INVITE_FRIENDS_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EFD8, &qword_26811EFE0);
}

uint64_t sub_22603B524()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811EFF8 = v14;
  unk_26811F000 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CONTACTS_INTEGRATION_ONBOARDING_TITLE.getter()
{
  return sub_2260406C4(&qword_26811EFF0, &qword_26811EFF8);
}

uint64_t sub_22603B864()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F010 = v14;
  *(void *)algn_26811F018 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CONTACTS_INTEGRATION_ONBOARDING_SUBTITLE.getter()
{
  return sub_2260406C4(&qword_26811F008, &qword_26811F010);
}

uint64_t sub_22603BBA4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F028 = v14;
  unk_26811F030 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F020, &qword_26811F028);
}

void static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_SUBTITLE(recipientName:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v20 = v0;
  uint64_t v1 = sub_226042FE8();
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  CGRect v23 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_226042F48();
  OUTLINED_FUNCTION_0_3();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  id v22 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_226043068();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = OUTLINED_FUNCTION_2_2();
  uint64_t v11 = OUTLINED_FUNCTION_8(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_21();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  OUTLINED_FUNCTION_48();
  sub_226043028();
  sub_226043018();
  sub_226043028();
  sub_226043018();
  sub_226043028();
  OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v14 = v21;
  uint64_t v15 = __swift_project_value_buffer(v21, (uint64_t)qword_26811F1D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v22, v15, v14);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  CGFloat v19 = "Subtitle for the Activity Sharing Re-prompt";
  uint64_t v20 = 43;
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_12();
  v16();
  sub_226043098();
  uint64_t v17 = OUTLINED_FUNCTION_18();
  v18(v17);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22603C1B4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F040 = v14;
  *(void *)algn_26811F048 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_SHARE_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F038, &qword_26811F040);
}

uint64_t sub_22603C4F4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F058 = v14;
  unk_26811F060 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_NOT_NOW_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F050, &qword_26811F058);
}

uint64_t sub_22603C830()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F070 = v14;
  *(void *)algn_26811F078 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_AU_SAFETY_LINK_BUTTON_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F068, &qword_26811F070);
}

uint64_t sub_22603CB70()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F088 = v14;
  unk_26811F090 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_WELCOME_BANNER_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F080, &qword_26811F088);
}

uint64_t sub_22603CEB0()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F0A0 = v14;
  *(void *)algn_26811F0A8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_WELCOME_BANNER_TITLE_SHORT.getter()
{
  return sub_2260406C4(&qword_26811F098, &qword_26811F0A0);
}

uint64_t sub_22603D1F4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F0B8 = v14;
  unk_26811F0C0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACCESS_POINT_GAMES_FOR_YOU.getter()
{
  return sub_2260406C4(&qword_26811F0B0, &qword_26811F0B8);
}

uint64_t sub_22603D530()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F0D0 = v14;
  *(void *)algn_26811F0D8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F0C8, &qword_26811F0D0);
}

void static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_TITLE(count:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_48();
  sub_226043028();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE_INPROGRESS(completed:total:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v0 = sub_226042FE8();
  uint64_t v1 = OUTLINED_FUNCTION_8(v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = OUTLINED_FUNCTION_39(v2, v18);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = OUTLINED_FUNCTION_38(v5, v19);
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_2_2();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_44();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25();
  sub_226043028();
  OUTLINED_FUNCTION_25();
  sub_226043028();
  OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v3, (uint64_t)qword_26811F1D8);
  uint64_t v12 = OUTLINED_FUNCTION_40();
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_29();
  uint64_t v14 = OUTLINED_FUNCTION_9();
  v15(v14);
  sub_226043098();
  uint64_t v16 = OUTLINED_FUNCTION_41();
  v17(v16);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE(total:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_35(v0);
  uint64_t v2 = OUTLINED_FUNCTION_8(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  uint64_t v5 = OUTLINED_FUNCTION_8(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_44();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  sub_226043028();
  uint64_t v10 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v10 = swift_once();
  }
  uint64_t v11 = OUTLINED_FUNCTION_7(v10, (uint64_t)qword_26811F1D8);
  v12(v11);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = OUTLINED_FUNCTION_3_0();
  v14(v13);
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_11();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22603DF00()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F0E8 = v14;
  unk_26811F0F0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F0E0, &qword_26811F0E8);
}

void static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_FRIEND_RANK(rank:total:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v0 = sub_226042FE8();
  uint64_t v1 = OUTLINED_FUNCTION_8(v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = OUTLINED_FUNCTION_39(v2, v18);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = OUTLINED_FUNCTION_38(v5, v19);
  uint64_t v7 = OUTLINED_FUNCTION_8(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_2_2();
  uint64_t v9 = OUTLINED_FUNCTION_8(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  sub_226043028();
  OUTLINED_FUNCTION_25();
  sub_226043028();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v3, (uint64_t)qword_26811F1D8);
  uint64_t v12 = OUTLINED_FUNCTION_40();
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_29();
  uint64_t v14 = OUTLINED_FUNCTION_9();
  v15(v14);
  sub_226043098();
  uint64_t v16 = OUTLINED_FUNCTION_41();
  v17(v16);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

id sub_22603E498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  a5(a3, a4);
  uint64_t v5 = (void *)sub_226043078();
  swift_bridgeObjectRelease();
  return v5;
}

void static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_GET_STARTED(leaderboardName:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = OUTLINED_FUNCTION_47(v0, v1);
  uint64_t v3 = OUTLINED_FUNCTION_8(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_5_0();
  uint64_t v6 = OUTLINED_FUNCTION_8(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_2_2();
  uint64_t v8 = OUTLINED_FUNCTION_8(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_21();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_226043038();
  sub_226043028();
  sub_226043018();
  OUTLINED_FUNCTION_26();
  uint64_t v11 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v11 = swift_once();
  }
  uint64_t v12 = OUTLINED_FUNCTION_22(v11, (uint64_t)qword_26811F1D8);
  v13(v12);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  v14();
  sub_226043098();
  uint64_t v15 = OUTLINED_FUNCTION_18();
  v16(v15);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

void static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_SUBTITLE(alias:count:)()
{
  OUTLINED_FUNCTION_14();
  uint64_t v0 = sub_226042FE8();
  uint64_t v1 = OUTLINED_FUNCTION_8(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = OUTLINED_FUNCTION_5_0();
  uint64_t v4 = OUTLINED_FUNCTION_8(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_2_2();
  uint64_t v6 = OUTLINED_FUNCTION_8(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24();
  sub_226043038();
  OUTLINED_FUNCTION_26();
  sub_226043018();
  sub_226043028();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
  sub_226043028();
  uint64_t v9 = OUTLINED_FUNCTION_23();
  if (qword_26811F1D0 != -1) {
    uint64_t v9 = swift_once();
  }
  uint64_t v10 = OUTLINED_FUNCTION_7(v9, (uint64_t)qword_26811F1D8);
  v11(v10);
  sub_226042FD8();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0();
  uint64_t v12 = OUTLINED_FUNCTION_3_0();
  v13(v12);
  sub_226043098();
  uint64_t v14 = OUTLINED_FUNCTION_11();
  v15(v14);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_22603E9B4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F100 = v14;
  *(void *)algn_26811F108 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_TITLE.getter()
{
  return sub_2260406C4(&qword_26811F0F8, &qword_26811F100);
}

uint64_t sub_22603ECF4()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F118 = v14;
  unk_26811F120 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_ON.getter()
{
  return sub_2260406C4(&qword_26811F110, &qword_26811F118);
}

uint64_t sub_22603F024()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F130 = v14;
  *(void *)algn_26811F138 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_OFF.getter()
{
  return sub_2260406C4(&qword_26811F128, &qword_26811F130);
}

uint64_t sub_22603F358()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F148 = v14;
  unk_26811F150 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_TOGGLE_AX_HINT.getter()
{
  return sub_2260406C4(&qword_26811F140, &qword_26811F148);
}

uint64_t sub_22603F698()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F160 = v14;
  *(void *)algn_26811F168 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ONBOARDING_WELCOME_SUBTITLE_CRYSTAL.getter()
{
  return sub_2260406C4(&qword_26811F158, &qword_26811F160);
}

uint64_t sub_22603F9D8()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F178 = v14;
  unk_26811F180 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ONBOARDING_WHATSNEW_SUBTITLE_CRYSTAL.getter()
{
  return sub_2260406C4(&qword_26811F170, &qword_26811F178);
}

uint64_t sub_22603FD18()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F190 = v14;
  *(void *)algn_26811F198 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_SHARE_FRIENDS_LIST_SHOW_APPS.getter()
{
  return sub_2260406C4(&qword_26811F188, &qword_26811F190);
}

uint64_t sub_22604005C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F1A8 = v14;
  unk_26811F1B0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FAILED_TO_ACCEPT_FRIEND_INVITE.getter()
{
  return sub_2260406C4(&qword_26811F1A0, &qword_26811F1A8);
}

uint64_t sub_22604039C()
{
  uint64_t v0 = sub_226042FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_226042F48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_226043068();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_226042F58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v18[-v11];
  sub_226042FF8();
  if (qword_26811F1D0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v1, (uint64_t)qword_26811F1D8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_226042FD8();
  sub_226042F68();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = sub_226043098();
  uint64_t v16 = v15;
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  qword_26811F1C0 = v14;
  *(void *)algn_26811F1C8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLEASE_TRY_AGAIN.getter()
{
  return sub_2260406C4(&qword_26811F1B8, &qword_26811F1C0);
}

uint64_t sub_2260406C4(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id sub_226040730()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GCUILocalizedStrings.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2260407C8()
{
  uint64_t v0 = sub_226042FC8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226042F48();
  __swift_allocate_value_buffer(v4, qword_26811F1D8);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26811F1D8);
  id v6 = (id)GKGameCenterUIFrameworkBundle();
  id v7 = objc_msgSend(v6, sel_bundleURL);

  sub_226042FB8();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 104))(v5, *MEMORY[0x263F06D20], v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_226040970()
{
  unint64_t result = qword_26811F1F0;
  if (!qword_26811F1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F1F0);
  }
  return result;
}

uint64_t type metadata accessor for GCUILocalizedStrings()
{
  return self;
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

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_226042F58();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return MEMORY[0x270EF1938](0);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_226042F68();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_226043068();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_226042F48();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return MEMORY[0x270EF18F0](v0 - 88, 1684827173, 0xE400000000000000);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_226043038();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_226043058();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return MEMORY[0x270EF18F0](v0 - 88, 1684827173, 0xE400000000000000);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_226043028();
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_226042F68();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_226042F68();
}

void OUTLINED_FUNCTION_30()
{
  *(void *)(v0 - 8_Block_object_dispose(&STACK[0x230], 8) = *(void *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_226042F48();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_226043068();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return MEMORY[0x270EF1938](0);
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return sub_226042FE8();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_226043028();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_226043068();
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_226042F48();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_226043028();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return 13;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_226042EF8();
}

uint64_t OUTLINED_FUNCTION_46@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(v3 - 112) = a1;
  *(void *)(v3 - 104) = a2;
  *(void *)(v3 - 96) = a3;
  return sub_226042FE8();
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 96) = a2;
  return sub_226042FE8();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_226043028();
}

uint64_t AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2260430D8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.rawValue.getter()
{
  return 0x7A69736168706D65;
}

uint64_t sub_22604109C()
{
  return 1;
}

uint64_t sub_2260410A8()
{
  return sub_2260430F8();
}

uint64_t sub_226041104()
{
  return sub_2260430A8();
}

uint64_t sub_226041124()
{
  return sub_2260430F8();
}

uint64_t sub_226041178@<X0>(BOOL *a1@<X8>)
{
  return AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.init(rawValue:)(a1);
}

void sub_226041184(void *a1@<X8>)
{
  *a1 = 0x7A69736168706D65;
  a1[1] = 0xEA00000000006465;
}

uint64_t sub_2260411A4()
{
  return sub_2260430C8();
}

uint64_t sub_226041204()
{
  return sub_2260430B8();
}

uint64_t static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.getter()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aEmdColor;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.setter(uint64_t a1, uint64_t a2)
{
  *(void *)aEmdColor = a1;
  *(void *)&aEmdColor[8] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_226041360()
{
  return sub_226042F78();
}

uint64_t sub_2260413C0()
{
  return sub_226042F88();
}

uint64_t sub_226041420()
{
  return sub_226042F98();
}

unint64_t sub_22604149C()
{
  unint64_t result = qword_26811F208;
  if (!qword_26811F208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F208);
  }
  return result;
}

unint64_t sub_2260414EC()
{
  unint64_t result = qword_26811F210;
  if (!qword_26811F210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F210);
  }
  return result;
}

unint64_t sub_22604153C()
{
  unint64_t result = qword_26811F218;
  if (!qword_26811F218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F218);
  }
  return result;
}

unint64_t sub_22604158C()
{
  unint64_t result = qword_26811F220;
  if (!qword_26811F220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F220);
  }
  return result;
}

unint64_t sub_2260415DC()
{
  unint64_t result = qword_26811F228;
  if (!qword_26811F228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F228);
  }
  return result;
}

void sub_226041630()
{
  sub_226040970();
  JUMPOUT(0x22A643F90);
}

void sub_22604167C()
{
  sub_226040970();
  JUMPOUT(0x22A643FA0);
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes()
{
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color()
{
}

uint64_t _s31ExtendedMarkdownStyleAttributesV5ColorO5ValueOwet(unsigned int *a1, int a2)
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

unsigned char *_s31ExtendedMarkdownStyleAttributesV5ColorO5ValueOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2260417D4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2260417FC()
{
  return 0;
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value()
{
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownAttributes()
{
}

unint64_t sub_226041820()
{
  unint64_t result = qword_26811F230;
  if (!qword_26811F230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F230);
  }
  return result;
}

unint64_t sub_22604186C()
{
  unint64_t result = qword_26811F238;
  if (!qword_26811F238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F238);
  }
  return result;
}

unint64_t sub_2260418B8()
{
  unint64_t result = qword_26811F240;
  if (!qword_26811F240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F240);
  }
  return result;
}

unint64_t sub_226041904()
{
  unint64_t result = qword_26811F248;
  if (!qword_26811F248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26811F248);
  }
  return result;
}

uint64_t sub_226041950()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *AuthKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GKSoftLinkedClassesUI.h", 25, @"%s", *a1);

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAKAppleIDAuthenticationInAppContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKSoftLinkedClassesUI.h", 27, @"Unable to find class %s", "AKAppleIDAuthenticationInAppContext");

  __break(1u);
}

uint64_t sub_226042EF8()
{
  return MEMORY[0x270EEEDB8]();
}

uint64_t sub_226042F08()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_226042F18()
{
  return MEMORY[0x270EEF138]();
}

uint64_t sub_226042F28()
{
  return MEMORY[0x270EEF140]();
}

uint64_t sub_226042F38()
{
  return MEMORY[0x270EEF150]();
}

uint64_t sub_226042F48()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_226042F58()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_226042F68()
{
  return MEMORY[0x270EEF8C8]();
}

uint64_t sub_226042F78()
{
  return MEMORY[0x270EEFA90]();
}

uint64_t sub_226042F88()
{
  return MEMORY[0x270EEFA98]();
}

uint64_t sub_226042F98()
{
  return MEMORY[0x270EEFB90]();
}

uint64_t sub_226042FA8()
{
  return MEMORY[0x270EEFB98]();
}

uint64_t sub_226042FB8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_226042FC8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_226042FD8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_226042FE8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_226042FF8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_226043018()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_226043028()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_226043038()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_226043058()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_226043068()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_226043078()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226043088()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_226043098()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_2260430A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2260430B8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2260430C8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2260430D8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2260430E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2260430F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AVTUIAreAvatarsSupported()
{
  return MEMORY[0x270F10428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
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

CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size)
{
  MEMORY[0x270EE5E98](c, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
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

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x270EE60D8]();
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

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t GKGameCenterUIFrameworkBundle()
{
  return MEMORY[0x270F2E4B8]();
}

uint64_t GKGetLocalizedStringFromTableInBundle()
{
  return MEMORY[0x270F2E4C0]();
}

uint64_t GKImageCacheRoot()
{
  return MEMORY[0x270F2E4C8]();
}

uint64_t GKOSLoggers()
{
  return MEMORY[0x270F2E4D0]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _gkMarkFileAsPurgeable()
{
  return MEMORY[0x270F2E4D8]();
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
  return MEMORY[0x270F76310]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x270ED9310]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

uint64_t gk_dispatch_as_group()
{
  return MEMORY[0x270F2E4E0]();
}

uint64_t gk_dispatch_group_do()
{
  return MEMORY[0x270F2E4E8]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}