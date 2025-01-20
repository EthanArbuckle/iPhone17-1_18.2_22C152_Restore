void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return MEMORY[0x1F40E7228](v2, v1, a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _appleIDsDidChange(uint64_t a1, void *a2)
{
  return [a2 _appleIDsDidChange];
}

void onKeybagLockStatusChange()
{
  uint64_t v0 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_INFO, "Keybag lock status changed", v3, 2u);
  }

  uint64_t v1 = +[AXSSPunctuationManager sharedDatabase];
  [v1 _initializeDatabaseStartup];

  uint64_t v2 = +[AXSSPunctuationManager sharedDatabase];
  [v2 _updateCloudKitHelpers];
}

void sub_1B3BA1274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
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

void sub_1B3BA1828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA1F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA2348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA2814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA3C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1B3BA3E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA44A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BA471C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *AXSSAccessibilityDescriptionForSymbolName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if ([v3 length])
  {
    if ([v3 containsString:@"wifi"] && MGGetBoolAnswer())
    {
      uint64_t v6 = [v3 stringByReplacingOccurrencesOfString:@"wifi" withString:@"WLAN"];

      id v3 = (id)v6;
    }
    v7 = AXNSLocalizedStringForLocale();
    if (![v7 length] || objc_msgSend(v7, "isEqual:", @"__--__"))
    {
      uint64_t v8 = AXNSLocalizedStringForLocale();

      v7 = (void *)v8;
    }
  }
  else
  {
    v7 = 0;
  }
  if ([v7 length] && (objc_msgSend(v7, "isEqual:", @"__--__") & 1) == 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = &stru_1F0C5BA58;
  }

  return v9;
}

void AXSSLuminanceForColor(CGColor *a1)
{
  v4[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    AXSSColorGetRGBAComponents(a1, (uint64_t)v4);
    for (uint64_t i = 0; i != 4; ++i)
    {
      double v2 = *(double *)&v4[i];
      if (v2 <= 0.03928) {
        double v3 = v2 / 12.92;
      }
      else {
        double v3 = pow((v2 + 0.055) / 1.055, 2.4);
      }
      *(double *)&v4[i] = v3;
    }
  }
}

__n64 AXSSColorGetRGBAComponents(CGColor *a1, uint64_t a2)
{
  id v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  v5 = CGBitmapContextCreate(data, 1uLL, 1uLL, 8uLL, 4uLL, v4, 5u);
  CGContextSetFillColorWithColor(v5, a1);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  CGContextFillRect(v5, v9);
  CGContextRelease(v5);
  CGColorSpaceRelease(v4);
  for (uint64_t i = 0; i != 4; ++i)
  {
    result.n64_u8[0] = data[i];
    result.n64_f64[0] = (float)((float)result.n64_u32[0] / 255.0);
    *(double *)(a2 + 8 * i) = result.n64_f64[0];
  }
  return result;
}

void AXSSContrastRatioForColor(CGColor *a1, CGColor *a2)
{
}

void AXSSRecommendedColorForColors(CGColor *a1, CGColor *a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, double a6)
{
  v7 = a4;
  v33[4] = *(double *)MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (!a3 && a4)
  {
    RecommendedColorIfNeeded = (CGColor *)_findRecommendedColorIfNeeded(a1, a2, a6);
    if (!RecommendedColorIfNeeded) {
      return;
    }
    v12 = RecommendedColorIfNeeded;
    AXSSLuminanceForColor(RecommendedColorIfNeeded);
    double v14 = v13;
    AXSSLuminanceForColor(a2);
    if (v15 <= v14) {
      double v16 = (v14 + 0.05) / (v15 + 0.05);
    }
    else {
      double v16 = 1.0 / ((v14 + 0.05) / (v15 + 0.05));
    }
    if (v16 < a6) {
      goto LABEL_46;
    }
    goto LABEL_20;
  }
  if (a3 == 1 && a5)
  {
    uint64_t v17 = _findRecommendedColorIfNeeded(a2, a1, a6);
    if (!v17) {
      return;
    }
    v12 = (CGColor *)v17;
    AXSSLuminanceForColor(a1);
    double v19 = v18;
    AXSSLuminanceForColor(v12);
    if (v20 <= v19) {
      double v21 = (v19 + 0.05) / (v20 + 0.05);
    }
    else {
      double v21 = 1.0 / ((v19 + 0.05) / (v20 + 0.05));
    }
    v7 = a5;
    if (v21 < a6) {
      goto LABEL_46;
    }
LABEL_20:
    CFTypeRef *v7 = CGColorCreateCopy(v12);
LABEL_46:
    CFRelease(v12);
    return;
  }
  if (a3 == 2 && a4 && a5)
  {
    v12 = (CGColor *)_findRecommendedColorIfNeeded(a1, a2, a6);
    CFTypeRef *v7 = CGColorCreateCopy(v12);
    AXSSLuminanceForColor(a2);
    double v23 = v22;
    AXSSLuminanceForColor(v12);
    if (v24 <= v23) {
      double v25 = (v23 + 0.05) / (v24 + 0.05);
    }
    else {
      double v25 = 1.0 / ((v23 + 0.05) / (v24 + 0.05));
    }
    if (v25 < a6)
    {
      v26 = (CGColor *)_findRecommendedColorIfNeeded(a2, v12, a6);
      *a5 = CGColorCreateCopy(v26);
      AXSSLuminanceForColor(v26);
      double v28 = v27;
      AXSSLuminanceForColor(v12);
      if (v29 <= v28) {
        double v30 = (v28 + 0.05) / (v29 + 0.05);
      }
      else {
        double v30 = 1.0 / ((v28 + 0.05) / (v29 + 0.05));
      }
      if (v30 <= a6)
      {
        if (*v7) {
          CFRelease(*v7);
        }
        if (*a5) {
          CFRelease(*a5);
        }
        AXSSColorGetRGBAComponents(v26, (uint64_t)v33);
        if (v33[0] >= 0.2) {
          double v31 = 1.0;
        }
        else {
          double v31 = 0.0;
        }
        if (v33[0] >= 0.2) {
          double v32 = 0.0;
        }
        else {
          double v32 = 1.0;
        }
        *a5 = CGColorCreateGenericGray(v31, 1.0);
        CFTypeRef *v7 = CGColorCreateGenericGray(v32, 1.0);
      }
      if (v26) {
        CFRelease(v26);
      }
    }
    if (v12) {
      goto LABEL_46;
    }
  }
}

uint64_t _findRecommendedColorIfNeeded(CGColor *a1, CGColor *a2, double a3)
{
  AXSSLuminanceForColor(a1);
  double v7 = v6;
  AXSSLuminanceForColor(a2);
  if (v8 <= v7) {
    double v9 = (v7 + 0.05) / (v8 + 0.05);
  }
  else {
    double v9 = 1.0 / ((v7 + 0.05) / (v8 + 0.05));
  }
  if (v9 >= a3) {
    return 0;
  }
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___findRecommendedColor_block_invoke;
  v16[3] = &unk_1E606CDA8;
  v16[6] = a1;
  v16[7] = a2;
  *(double *)&v16[8] = a3;
  v16[4] = &v17;
  v16[5] = &v21;
  uint64_t v10 = (void (**)(double, double))MEMORY[0x1B3EC2350](v16);
  v10[2](1.0, 1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, -1.0, 0.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, -1.0, -1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 1.0, 0.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 0.0, 1.0);
  ((void (*)(void (**)(double, double), double, double))v10[2])(v10, 0.0, -1.0);
  v11 = v18;
  if (!v18[3])
  {
    CGColorRef Copy = CGColorCreateCopy((CGColorRef)v22[3]);
    v11 = v18;
    v18[3] = (uint64_t)Copy;
  }
  double v13 = (const void *)v22[3];
  if (v13)
  {
    CFRelease(v13);
    v11 = v18;
  }
  uint64_t v14 = v11[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

void sub_1B3BA9740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

double *AXSSRgb2hsv(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 >= a5) {
    double v6 = a5;
  }
  else {
    double v6 = a4;
  }
  if (a4 <= a5) {
    double v7 = a5;
  }
  else {
    double v7 = a4;
  }
  if (v6 >= a6) {
    double v6 = a6;
  }
  if (v7 <= a6) {
    double v7 = a6;
  }
  *a3 = v7;
  double v8 = v7 - v6;
  if (v8 >= 0.00001)
  {
    if (v7 <= 0.0)
    {
      *a2 = 0.0;
      double v9 = NAN;
    }
    else
    {
      *a2 = v8 / v7;
      if (v7 <= a4)
      {
        double v12 = (a5 - a6) / v8;
      }
      else
      {
        BOOL v10 = v7 > a5;
        double v11 = (a4 - a5) / v8 + 4.0;
        double v12 = (a6 - a4) / v8 + 2.0;
        if (v10) {
          double v12 = v11;
        }
      }
      double v9 = v12 * 60.0;
      if (v9 < 0.0) {
        double v9 = v9 + 360.0;
      }
    }
  }
  else
  {
    *a2 = 0.0;
    double v9 = 0.0;
  }
  *__n64 result = v9;
  return result;
}

double *AXSSHsv2rgb(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a5 <= 0.0)
  {
    *a3 = a6;
    *a2 = a6;
    *__n64 result = a6;
  }
  else
  {
    double v6 = a4 / 60.0;
    int v7 = vcvtmd_s64_f64(v6);
    double v8 = v6 - (double)v7;
    double v9 = (1.0 - a5) * a6;
    double v10 = (1.0 - a5 * v8) * a6;
    double v11 = (1.0 - a5 * (1.0 - v8)) * a6;
    switch(v7)
    {
      case 0:
        *__n64 result = a6;
        *a2 = v11;
        goto LABEL_7;
      case 1:
        *__n64 result = v10;
        *a2 = a6;
LABEL_7:
        *a3 = v9;
        return result;
      case 2:
        *__n64 result = v9;
        *a2 = a6;
        *a3 = v11;
        return result;
      case 3:
        *__n64 result = v9;
        *a2 = v10;
        goto LABEL_11;
      case 4:
        *__n64 result = v11;
        *a2 = v9;
LABEL_11:
        *a3 = a6;
        break;
      default:
        *__n64 result = a6;
        *a2 = v9;
        *a3 = v10;
        break;
    }
  }
  return result;
}

void ___findRecommendedColor_block_invoke(uint64_t a1, double a2, double a3)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    return;
  }
  double v6 = *(CGColor **)(a1 + 56);
  double v39 = *(double *)(a1 + 64);
  AXSSColorGetRGBAComponents(*(CGColor **)(a1 + 48), (uint64_t)&v49);
  double v47 = v50;
  double v48 = v49;
  CGFloat v40 = v52;
  double v46 = v51;
  double v44 = 0.0;
  double v45 = 0.0;
  double v43 = 0.0;
  AXSSRgb2hsv(&v45, &v44, &v43, v49, v50, v51);
  CGColorRef v7 = 0;
  double v9 = v43;
  double v8 = v44;
  double v10 = 1.0;
  double v11 = 1.0 - v44;
  if (a3 <= 0.0) {
    double v11 = v44;
  }
  double v42 = v11 / 70.0;
  double v12 = 1.0 - v43;
  if (a2 <= 0.0) {
    double v12 = v43;
  }
  CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F1DC98];
  double v14 = 0.0;
  double v41 = v12 / 70.0;
  for (uint64_t i = 69; i; --i)
  {
    double v8 = v8 + a3 * v42;
    double v9 = v9 + a2 * v41;
    double v43 = v9;
    double v44 = v8;
    if (v9 < 0.0 || v9 > v10) {
      break;
    }
    if (v8 < 0.0 || v8 > v10) {
      break;
    }
    if (v7)
    {
      CFRelease(v7);
      double v9 = v43;
      double v8 = v44;
    }
    AXSSHsv2rgb(&v48, &v47, &v46, v45, v8, v9);
    CGFloat v19 = v47;
    CGFloat v18 = v48;
    CGFloat v20 = v46;
    uint64_t v21 = CGColorSpaceCreateWithName(v13);
    if (v21)
    {
      double v22 = v21;
      components[0] = v18;
      components[1] = v19;
      components[2] = v20;
      components[3] = v40;
      CGColorRef v7 = CGColorCreate(v21, components);
      CFRelease(v22);
      if (v7)
      {
        AXSSLuminanceForColor(v7);
        double v24 = v23;
        AXSSLuminanceForColor(v6);
        double v10 = 1.0;
        if (v25 <= v24) {
          double v14 = (v24 + 0.05) / (v25 + 0.05);
        }
        else {
          double v14 = 1.0 / ((v24 + 0.05) / (v25 + 0.05));
        }
        if (v14 >= v39) {
          goto LABEL_30;
        }
        continue;
      }
    }
    else
    {
      CGColorRef v7 = 0;
    }
    double v10 = 1.0;
  }
  if (!v7) {
    return;
  }
LABEL_30:
  if (v14 > *(double *)(a1 + 64))
  {
    CGColorRef Copy = CGColorCreateCopy(v7);
    uint64_t v27 = *(void *)(a1 + 32);
    goto LABEL_43;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    double v28 = *(CGColor **)(a1 + 56);
    AXSSLuminanceForColor(v7);
    double v30 = v29;
    AXSSLuminanceForColor(v28);
    if (v31 <= v30) {
      double v32 = (v30 + 0.05) / (v31 + 0.05);
    }
    else {
      double v32 = 1.0 / ((v30 + 0.05) / (v31 + 0.05));
    }
    v33 = *(CGColor **)(a1 + 56);
    AXSSLuminanceForColor(*(CGColor **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    double v35 = v34;
    AXSSLuminanceForColor(v33);
    if (v36 <= v35) {
      double v37 = (v35 + 0.05) / (v36 + 0.05);
    }
    else {
      double v37 = 1.0 / ((v35 + 0.05) / (v36 + 0.05));
    }
    if (v32 > v37)
    {
      v38 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v38) {
        CFRelease(v38);
      }
      goto LABEL_42;
    }
  }
  else
  {
LABEL_42:
    CGColorRef Copy = CGColorCreateCopy(v7);
    uint64_t v27 = *(void *)(a1 + 40);
LABEL_43:
    *(void *)(*(void *)(v27 + 8) + 24) = Copy;
  }
  CFRelease(v7);
}

void sub_1B3BAA0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
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

void sub_1B3BAA538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BAA73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BAB130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1B3BADA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVMediaTypeMetadataObject()
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAVMediaTypeMetadataObjectSymbolLoc_ptr;
  uint64_t v8 = getAVMediaTypeMetadataObjectSymbolLoc_ptr;
  if (!getAVMediaTypeMetadataObjectSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)AVFoundationLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AVMediaTypeMetadataObject");
    getAVMediaTypeMetadataObjectSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    id v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  double v2 = *v0;

  return v2;
}

Class __getAVCaptureDeviceClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVCaptureDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVCaptureDeviceClass_block_invoke_cold_1();
    return (Class)AVFoundationLibrary();
  }
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AVFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E606CFA0;
    uint64_t v5 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAVMediaTypeVideoSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMediaTypeVideo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeVideoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMediaTypeMetadataObjectSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVMediaTypeMetadataObject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeMetadataObjectSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B3BB0CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

__CFString *AXSSLanguageConvertToCanonicalForm(void *a1)
{
  uint64_t v1 = AXSSLanguageToLocales_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXSSLanguageToLocales_onceToken, &__block_literal_global_139);
  }
  id v3 = (id)AXSSLanguageToLocales_LanguageToLangLocale;
  long long v4 = [v2 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  if ([v4 hasPrefix:@"zh"])
  {
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"Hant-" withString:&stru_1F0C5BA58];

    long long v4 = [v5 stringByReplacingOccurrencesOfString:@"Hans-" withString:&stru_1F0C5BA58];
  }
  if (![v4 length])
  {
    uint64_t v7 = 0;
    goto LABEL_29;
  }
  uint64_t v6 = [v4 lowercaseString];
  uint64_t v7 = [v3 objectForKey:v6];
  if (v7) {
    goto LABEL_34;
  }
  uint64_t v8 = [v4 rangeOfString:@"-"];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = v8;
  double v10 = [v4 substringToIndex:v8];
  double v11 = [v4 substringFromIndex:v9 + 1];
  double v12 = [v11 uppercaseString];
  uint64_t v7 = [v10 stringByAppendingFormat:@"-%@", v12];

  if (v7)
  {
LABEL_34:
    if ((![v6 isEqualToString:@"zh"]
       || ([(__CFString *)v7 hasPrefix:@"zh"] & 1) == 0)
      && (![v6 isEqualToString:@"pt"]
       || ([(__CFString *)v7 hasPrefix:@"pt"] & 1) == 0)
      && (![v6 isEqualToString:@"fr"]
       || ![(__CFString *)v7 hasPrefix:@"fr"]))
    {
      goto LABEL_28;
    }
  }
LABEL_18:
  int v13 = [v6 isEqualToString:@"zh"];
  CFArrayRef v14 = CFLocaleCopyPreferredLanguages();
  double v15 = [(__CFArray *)v14 firstObject];
  if (!v13)
  {

    if (v15)
    {
      uint64_t v17 = [(__CFString *)v15 lowercaseString];
      uint64_t v18 = [v3 objectForKeyedSubscript:v17];
      if (!v18)
      {
LABEL_25:

        goto LABEL_27;
      }
      CGFloat v19 = (void *)v18;
      CGFloat v20 = [(__CFString *)v15 lowercaseString];
      int v21 = [v20 hasPrefix:v6];

      if (v21)
      {
        uint64_t v17 = v7;
        uint64_t v7 = v15;
        goto LABEL_25;
      }
    }
LABEL_27:

    goto LABEL_28;
  }

  double v16 = [(__CFString *)v15 stringByReplacingOccurrencesOfString:@"-Hans" withString:&stru_1F0C5BA58];

  double v15 = [v16 stringByReplacingOccurrencesOfString:@"-Hant" withString:&stru_1F0C5BA58];

  if (([(__CFString *)v15 hasPrefix:@"zh"] & 1) == 0)
  {
    uint64_t v7 = @"zh-CN";
    goto LABEL_27;
  }
  uint64_t v7 = v15;
LABEL_28:

LABEL_29:

  return v7;
}

id AXSSLanguageCanonicalFormToGeneralLanguage(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 lowercaseString];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [&unk_1F0C67098 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&unk_1F0C67098);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([v1 rangeOfString:v6] != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "rangeOfString:", v6));
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      uint64_t v3 = [&unk_1F0C67098 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v7 = v1;
LABEL_11:
  uint64_t v8 = v7;

  return v8;
}

void sub_1B3BB40F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void __AXSSLanguageToLocales_block_invoke()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v4 pathForResource:@"AXLanguageToLocale" ofType:@"plist"];
  uint64_t v2 = [v0 initWithContentsOfFile:v1];
  uint64_t v3 = (void *)AXSSLanguageToLocales_LanguageToLangLocale;
  AXSSLanguageToLocales_LanguageToLangLocale = v2;
}

void sub_1B3BB7708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B3BB7D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BB8240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B3BB8730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B3BB988C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BBAF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

id AXSSHumanReadableDescriptionForMotionTrackingFacialExpression(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_NONE";
      goto LABEL_13;
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_BROWS_UP";
      goto LABEL_13;
    case 2:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_JAW_OPEN";
      goto LABEL_13;
    case 3:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_SMILE";
      goto LABEL_13;
    case 4:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_TONGUE_OUT";
      goto LABEL_13;
    case 5:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EYE_BLINK";
      goto LABEL_13;
    case 6:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_NOSE_SNEER";
      goto LABEL_13;
    case 7:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_CENTER";
      goto LABEL_13;
    case 8:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_RIGHT";
      goto LABEL_13;
    case 9:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_MOUTH_PUCKER_LEFT";
LABEL_13:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

id AXSSHumanReadableExplanationForMotionTrackingFacialExpression(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_BROWS_UP";
      goto LABEL_12;
    case 2:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_JAW_OPEN";
      goto LABEL_12;
    case 3:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_SMILE";
      goto LABEL_12;
    case 4:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_TONGUE_OUT";
      goto LABEL_12;
    case 5:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_EYE_BLINK";
      goto LABEL_12;
    case 6:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_NOSE_SNEER";
      goto LABEL_12;
    case 7:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_CENTER";
      goto LABEL_12;
    case 8:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_RIGHT";
      goto LABEL_12;
    case 9:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_EXPLANATION_MOUTH_PUCKER_LEFT";
LABEL_12:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingFacialExpressionSensitivity(uint64_t a1)
{
  switch(a1)
  {
    case 3:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_SENSITIVITY_HIGH";
      goto LABEL_7;
    case 2:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_SENSITIVITY_MED";
      goto LABEL_7;
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_FACIAL_EXPRESSION_SENSITIVITY_LOW";
LABEL_7:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      goto LABEL_9;
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingMode(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_ABSOLUTE";
      goto LABEL_7;
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_JOYSTICK";
      goto LABEL_7;
    case 2:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_ACCELERATION";
      goto LABEL_7;
    case 3:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_HID";
LABEL_7:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

id AXSSHumanReadableExplanationForMotionTrackingMode(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_EXPLANATION_ACCELERATION";
      goto LABEL_7;
    case 1:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_EXPLANATION_JOYSTICK";
      goto LABEL_7;
    case 0:
      uint64_t v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v2 = v1;
      uint64_t v3 = @"AXMT_MODE_EXPLANATION_ABSOLUTE";
LABEL_7:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

      goto LABEL_9;
  }
  id v4 = 0;
LABEL_9:

  return v4;
}

id AXSSHumanReadableDescriptionForMotionTrackingErrorCode(uint64_t a1)
{
  return AXSSHumanReadableDescriptionForMotionTrackingErrorCodeAndTrackingType(a1, 0);
}

id AXSSHumanReadableDescriptionForMotionTrackingErrorCodeAndTrackingType(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_FACE_LOST";
      break;
    case 2:
    case 3:
      if (AXSSDeviceGetType() == 3)
      {
        uint64_t v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
        int v4 = [v3 usesMetricSystem];

        uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
        if (v4)
        {
          if (a2 == 3) {
            uint64_t v9 = @"AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC_IPAD";
          }
          else {
            uint64_t v9 = @"AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC_IPAD";
          }
        }
        else if (a2 == 3)
        {
          uint64_t v9 = @"AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_IPAD";
        }
        else
        {
          uint64_t v9 = @"AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_IPAD";
        }
      }
      else
      {
        id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
        int v8 = [v7 usesMetricSystem];

        uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
        if (v8)
        {
          if (a2 == 3) {
            uint64_t v9 = @"AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC";
          }
          else {
            uint64_t v9 = @"AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA_METRIC";
          }
        }
        else if (a2 == 3)
        {
          uint64_t v9 = @"AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA";
        }
        else
        {
          uint64_t v9 = @"AXMT_HEAD_TRACKING_FAILURE_REASON_FACE_TOO_FAR_FROM_CAMERA";
        }
      }
      goto LABEL_29;
    case 4:
      uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      if (a2 == 3) {
        uint64_t v9 = @"AXMT_ON_DEVICE_EYE_TRACKING_FAILURE_REASON_FACE_MOVED_SIGNIFICANTLY";
      }
      else {
        uint64_t v9 = @"AXMT_FAILURE_REASON_FACE_MOVED_SIGNIFICANTLY";
      }
LABEL_29:
      uint64_t v6 = v5;
      break;
    case 5:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_TOO_DARK";
      break;
    case 6:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_SENSOR_COVERED";
      break;
    case 7:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_CAMERA_STOLEN";
      break;
    case 8:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_DEVICE_IN_MOTION";
      break;
    case 11:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_INITIALIZING";
      break;
    case 14:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_HID_DEVICE_CONFIGURING";
      break;
    default:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
      uint64_t v5 = v6;
      uint64_t v9 = @"AXMT_FAILURE_REASON_UNDEFINED";
      break;
  }
  uint64_t v10 = [v6 localizedStringForKey:v9 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

  return v10;
}

void sub_1B3BC0700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3BC20AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B3BC29C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BC4B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

void sub_1B3BC5B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXSSDeviceGetType()
{
  if (AXSSDeviceGetType__AXSSCurrentDeviceTypeOnceToken != -1) {
    dispatch_once(&AXSSDeviceGetType__AXSSCurrentDeviceTypeOnceToken, &__block_literal_global_11);
  }
  return AXSSDeviceGetType__AXSSDeviceType;
}

uint64_t __AXSSDeviceGetType_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  AXSSDeviceGetType__AXSSDeviceType = result;
  return result;
}

BOOL AXSSDeviceFrontCameraPhysicallyMountedUpsideDown()
{
  return MGGetSInt32Answer() == 180;
}

id __AXSSCastAsClass(NSString *a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(a1);
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

uint64_t AXSSIsAppleInternalBuild()
{
  return MEMORY[0x1F40CD658]("com.apple.Accessibility");
}

uint64_t AXSSHasClientsWithAccessRemoteDeviceContent()
{
  return 0;
}

id AXSSVoiceOverAvailableTextualContextIdentifiers()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AXSSVoiceOverTextualContextWordProcessing";
  v2[1] = @"AXSSVoiceOverTextualContextNarrative";
  v2[2] = @"AXSSVoiceOverTextualContextMessaging";
  v2[3] = @"AXSSVoiceOverTextualContextSocialMedia";
  v2[4] = @"AXSSVoiceOverTextualContextSpreadsheet";
  v2[5] = @"AXSSVoiceOverTextualContextFileSystem";
  v2[6] = @"AXSSVoiceOverTextualContextSourceCode";
  v2[7] = @"AXSSVoiceOverTextualContextConsole";
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];

  return v0;
}

id AXSSVoiceOverLocalizedNameForTextualContextIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextWordProcessing"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.word.processing";
LABEL_17:
    id v5 = [v2 localizedStringForKey:v4 value:&stru_1F0C5BA58 table:@"AccessibilitySharedSupport"];

    goto LABEL_18;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextNarrative"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.reading";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextMessaging"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.messaging";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSourceCode"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.source.code";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSocialMedia"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.social.media";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSpreadsheet"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.spreadsheet";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextConsole"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.console";
    goto LABEL_17;
  }
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextFileSystem"])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AccessibilitySharedSupport"];
    id v3 = v2;
    int v4 = @"punctuation.context.file.system";
    goto LABEL_17;
  }
  id v5 = 0;
LABEL_18:

  return v5;
}

__CFString *AXSSVoiceOverSymbolNameForTextualContextIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextWordProcessing"])
  {
    uint64_t v2 = @"doc.text";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextNarrative"])
  {
    uint64_t v2 = @"book";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextMessaging"])
  {
    uint64_t v2 = @"message";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSourceCode"])
  {
    uint64_t v2 = @"curlybraces";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSocialMedia"])
  {
    uint64_t v2 = @"person.2";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextSpreadsheet"])
  {
    uint64_t v2 = @"tablecells";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextConsole"])
  {
    uint64_t v2 = @"terminal";
  }
  else if ([v1 isEqualToString:@"AXSSVoiceOverTextualContextFileSystem"])
  {
    uint64_t v2 = @"folder";
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id getAVCaptureDeviceWasConnectedNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr;
  uint64_t v8 = getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr;
  if (!getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVCaptureDeviceWasConnectedNotification");
    getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    int v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getAVCaptureDeviceWasDisconnectedNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr;
  uint64_t v8 = getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr;
  if (!getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVCaptureDeviceWasDisconnectedNotification");
    getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    int v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getAVCaptureDeviceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAVCaptureDeviceClass_softClass_0;
  uint64_t v7 = getAVCaptureDeviceClass_softClass_0;
  if (!getAVCaptureDeviceClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVCaptureDeviceClass_block_invoke_0;
    v3[3] = &unk_1E606CF80;
    v3[4] = &v4;
    __getAVCaptureDeviceClass_block_invoke_0((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B3BC8058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVMediaTypeVideo()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVMediaTypeVideoSymbolLoc_ptr_0;
  uint64_t v8 = getAVMediaTypeVideoSymbolLoc_ptr_0;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_0)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVMediaTypeVideo");
    getAVMediaTypeVideoSymbolLoc_ptr_0 = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1B3BC8980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr;
  uint64_t v8 = getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
    getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getAVCaptureDeviceTypeBuiltInWideAngleMetadataCamera()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr;
  uint64_t v8 = getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
    getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getAVCaptureDeviceTypeBuiltInWideAngleCamera()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  uint64_t v8 = getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr)
  {
    id v1 = (void *)AVFoundationLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
    getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1B3BC9860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVCaptureDeviceWasConnectedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  uint64_t result = dlsym(v2, "AVCaptureDeviceWasConnectedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceWasConnectedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AVFoundationLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AVFoundationLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E606DAD0;
    uint64_t v5 = 0;
    AVFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!AVFoundationLibraryCore_frameworkLibrary_0)
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

uint64_t __AVFoundationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  uint64_t result = dlsym(v2, "AVCaptureDeviceWasDisconnectedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceWasDisconnectedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVCaptureDeviceClass_block_invoke_0(uint64_t a1)
{
  AVFoundationLibrary_0();
  Class result = objc_getClass("AVCaptureDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAVCaptureDeviceClass_block_invoke_cold_1();
    return (Class)__getAVMediaTypeVideoSymbolLoc_block_invoke_0(v3);
  }
  return result;
}

void *__getAVMediaTypeVideoSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVMediaTypeVideo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeVideoSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVMediaTypeMetadataObjectSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVMediaTypeMetadataObject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVMediaTypeMetadataObjectSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInWideAngleMetadataCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInDualCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInTelephotoCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInTelephotoCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AVFoundationLibrary_0();
  Class result = dlsym(v2, "AVCaptureDeviceTypeBuiltInUltraWideCamera");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVCaptureDeviceTypeBuiltInUltraWideCameraSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVCaptureDeviceDiscoverySessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary_0();
  Class result = objc_getClass("AVCaptureDeviceDiscoverySession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceDiscoverySessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getAVCaptureDeviceDiscoverySessionClass_block_invoke_cold_1();
    return (Class)+[AXSSWordDescriptionManager sharedInstance];
  }
  return result;
}

void sub_1B3BCA190(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3BCF35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *a37,id *a38,id *a39,id *a40,id *a41,id *a42,id *a43,id *a44,id *a45,id *a46,id *a47,id *a48,id *a49,id *a50,id *a51,id *a52,id *a53,id *a54,id *a55,id *a56,id *a57,id *a58,id *a59,id *a60,id *a61,id *a62,id *a63)
{
  objc_destroyWeak(v64);
  objc_destroyWeak(location);
  objc_destroyWeak(a62);
  objc_destroyWeak(a63);
  objc_destroyWeak(a47);
  objc_destroyWeak(a48);
  objc_destroyWeak(a49);
  objc_destroyWeak(a50);
  objc_destroyWeak(a51);
  objc_destroyWeak(a52);
  objc_destroyWeak(a53);
  objc_destroyWeak(a54);
  objc_destroyWeak(a55);
  objc_destroyWeak(a56);
  objc_destroyWeak(a57);
  objc_destroyWeak(a58);
  objc_destroyWeak(a59);
  objc_destroyWeak(a60);
  objc_destroyWeak(a61);
  objc_destroyWeak(a46);
  objc_destroyWeak(a44);
  objc_destroyWeak(a45);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak(a28);
  objc_destroyWeak(a29);
  objc_destroyWeak(a30);
  objc_destroyWeak(a31);
  objc_destroyWeak(a32);
  objc_destroyWeak(a33);
  objc_destroyWeak(a34);
  objc_destroyWeak(a35);
  objc_destroyWeak(a36);
  objc_destroyWeak(a37);
  objc_destroyWeak(a38);
  objc_destroyWeak(a39);
  objc_destroyWeak(a40);
  objc_destroyWeak(a41);
  objc_destroyWeak(a42);
  objc_destroyWeak(a43);
  objc_destroyWeak(a23);
  objc_destroyWeak(a22);
  objc_destroyWeak(a21);
  objc_destroyWeak(a20);
  objc_destroyWeak(a19);
  objc_destroyWeak(a18);
  objc_destroyWeak(a17);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)&STACK[0x1308]);
  _Unwind_Resume(a1);
}

id AXSSLogForCategory(uint64_t a1)
{
  if (a1 < 4)
  {
    if (AXSSLogForCategory_onceToken != -1) {
      dispatch_once(&AXSSLogForCategory_onceToken, &__block_literal_global_15);
    }
    id v1 = (id)AXSSLogForCategory_AllLogObjects[a1];
  }
  else
  {
    id v1 = (id)MEMORY[0x1E4F14500];
    id v2 = MEMORY[0x1E4F14500];
  }

  return v1;
}

uint64_t __AXSSLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Accessibility", "default");
  id v1 = (void *)AXSSLogForCategory_AllLogObjects[0];
  AXSSLogForCategory_AllLogObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.Accessibility", "idc");
  uint64_t v3 = (void *)qword_1E9CDFCD8;
  qword_1E9CDFCD8 = (uint64_t)v2;

  qword_1E9CDFCE0 = (uint64_t)os_log_create("com.apple.Accessibility", "motiontracking");

  return MEMORY[0x1F41817F8]();
}

void sub_1B3BD2A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t __GetHiraganaSet_block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[[:Hiragana:][:Katakana_Or_Hiragana:]]"];
  GetHiraganaSet___hiraganaSet = result;
  return result;
}

uint64_t __GetKatakanaSet_block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[[:Katakana:][:Katakana_Or_Hiragana:]]"];
  GetKatakanaSet___katakanaSet = result;
  return result;
}

uint64_t __GetHalfWidthLatinSet_block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[a-zA-Z]"];
  GetHalfWidthLatinSet___halfWidthLatinSet = result;
  return result;
}

uint64_t __GetFullWidthLatinSet_block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[ａ-ｚＡ-Ｚ]"];
  GetFullWidthLatinSet___fullWidthLatinSet = result;
  return result;
}

void sub_1B3BD3448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

Class __getHIDManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HIDLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HIDLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E606DBA8;
    uint64_t v6 = 0;
    HIDLibraryCore_frameworkLibrary = _sl_dlopen();
    os_log_t v2 = (void *)v4[0];
    if (!HIDLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("HIDManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    os_log_t v2 = (void *)__getHIDManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHIDManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HIDLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HIDLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B3BD5A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BD6684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BD6A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BD6F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3BD7CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCPeerIDClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCPeerID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCPeerIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCPeerIDClass_block_invoke_cold_1();
    return (Class)MultipeerConnectivityLibrary();
  }
  return result;
}

uint64_t MultipeerConnectivityLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MultipeerConnectivityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E606DCA8;
    uint64_t v5 = 0;
    MultipeerConnectivityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MultipeerConnectivityLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
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

uint64_t __MultipeerConnectivityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MultipeerConnectivityLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMCSessionClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getMCSessionClass_block_invoke_cold_1();
    return (Class)__getMCNearbyServiceBrowserClass_block_invoke(v3);
  }
  return result;
}

Class __getMCNearbyServiceBrowserClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCNearbyServiceBrowser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCNearbyServiceBrowserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getMCNearbyServiceBrowserClass_block_invoke_cold_1();
    return (Class)__getMCNearbyServiceAdvertiserClass_block_invoke(v3);
  }
  return result;
}

Class __getMCNearbyServiceAdvertiserClass_block_invoke(uint64_t a1)
{
  MultipeerConnectivityLibrary();
  Class result = objc_getClass("MCNearbyServiceAdvertiser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCNearbyServiceAdvertiserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1();
    return (Class)__getMCErrorDomainSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getMCErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  os_log_t v2 = (void *)MultipeerConnectivityLibrary();
  Class result = dlsym(v2, "MCErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t userAuthDidChange(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    return [a2 userAuthChanged];
  }
  return result;
}

void sub_1B3BDC2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void *__getkSBSLockStateNotifyKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E606DD90;
    uint64_t v7 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    os_log_t v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  os_log_t v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "kSBSLockStateNotifyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSBSLockStateNotifyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getAVCaptureDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[NSDictionary(ClassChecking) axssDecodeBoolForKey:](v0);
}

uint64_t __getAVCaptureDeviceDiscoverySessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXSSPunctuationEntryCloudKitHelper clearRecordsForPurging:](v0);
}

uint64_t __getHIDManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXSSActionManager goToNextElementOfType:](v0);
}

uint64_t __getMCPeerIDClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMCSessionClass_block_invoke_cold_1(v0);
}

uint64_t __getMCSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMCNearbyServiceBrowserClass_block_invoke_cold_1(v0);
}

uint64_t __getMCNearbyServiceBrowserClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1(v0);
}

id __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  return +[AXSSDatabaseManager sharedDatabase];
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x1F41787D0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogPunctuationStorage()
{
  return MEMORY[0x1F4106050]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x1F41787F8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1F40D7BD8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9998](gray, alpha);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t FKALogCommon()
{
  return MEMORY[0x1F4106320]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1F4122BD0]();
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8EC8](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1F40E9158](*(void *)&entry, properties, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x1F40E9180](*(void *)&entry, plane, *(void *)&options, iterator);
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

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t NLLanguageIdentifierConsumeString()
{
  return MEMORY[0x1F4113F58]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1F4113F60]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1F4113F68]();
}

uint64_t NLLanguageIdentifierReset()
{
  return MEMORY[0x1F4113F90]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1F4113FA0]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1F4114100]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1F4114108]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1F4114110]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1F4114130]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1F40E70B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
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

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t SFAppleIDCommonNameForCertificate()
{
  return MEMORY[0x1F4150218]();
}

uint64_t SFAppleIDVerifyCertificateChain()
{
  return MEMORY[0x1F4150220]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x1F40F7048]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1F40F7228](trust);
}

uint64_t _AXSKeyRepeatDelay()
{
  return MEMORY[0x1F4178D20]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1F4178DA8]();
}

uint64_t _AppleIDAuthenticationCopyAppleIDs()
{
  return MEMORY[0x1F40DEE80]();
}

uint64_t _AppleIDAuthenticationCopyCertificateInfo()
{
  return MEMORY[0x1F40DEE88]();
}

uint64_t _AppleIDCopySecIdentityForAppleIDAccount()
{
  return MEMORY[0x1F40DEE90]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
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

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}