id _rt_log_facility_get_os_log(dispatch_once_t *predicate)
{
  void *v2;
  uint64_t vars8;

  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_rt_log_facility_prepare);
  }
  v2 = (void *)predicate[2];
  return v2;
}

id _RTSafeArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = [MEMORY[0x1E4F1CA48] array];
  v14 = (id *)&a9;
  id v11 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  while (v11 != (id)1)
  {
    objc_msgSend(v10, "addObject:");
    do
    {
LABEL_4:
      v12 = v14++;
      id v11 = *v12;
    }
    while (!*v12);
  }

  return v10;
}

id _RTMultiErrorCreate(void *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v19 = (void *)[a1 copy];
    v1 = [v19 flatten];
    v2 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v1;
    uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v29;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v6 = 0;
        uint64_t v21 = v4;
        do
        {
          if (*(void *)v29 != v5) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = v6;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v8 = v7;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v25;
              do
              {
                uint64_t v12 = 0;
                do
                {
                  if (*(void *)v25 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v35 = "NSError * _Nonnull _RTMultiErrorCreate(NSArray *__strong _Nonnull)";
                      __int16 v36 = 1024;
                      int v37 = 49;
                      _os_log_error_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
                    }
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v2 addObject:v8];
                  }
                  ++v12;
                }
                while (v10 != v12);
                uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
              }
              while (v10);
            }

            uint64_t v5 = v20;
            uint64_t v4 = v21;
            uint64_t v6 = v23;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "NSError * _Nonnull _RTMultiErrorCreate(NSArray *__strong _Nonnull)";
                __int16 v36 = 1024;
                int v37 = 55;
                _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v2 addObject:v7];
            }
          }
          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v4);
    }

    if ((unint64_t)[v2 count] < 2)
    {
      v17 = [v2 firstObject];
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      v32[0] = *MEMORY[0x1E4F28568];
      v32[1] = @"RTDetailedErrorsKey";
      v33[0] = @"Multiple errors occurred.";
      v33[1] = v2;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      v17 = [v15 errorWithDomain:@"RTErrorDomain" code:9 userInfo:v16];
    }
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

os_log_t _rt_log_facility_prepare(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

double RTCommonIsCoordinateValid(double a1, double a2)
{
  double v2 = 1.0;
  if (a2 < -180.0) {
    double v2 = 0.0;
  }
  if (a2 > 180.0 || a1 < -90.0 || a1 > 90.0) {
    return 0.0;
  }
  else {
    return v2;
  }
}

void RTCommonCalculateDistanceHighPrecision(double a1, double a2, double a3, double a4)
{
}

void RTCommonCalculateDistanceRadius(int a1, double a2, double a3, double a4, double a5)
{
  double v7 = (a2 + a4) * 0.0174532925;
  if (a3 < 0.0) {
    a3 = a3 + 360.0;
  }
  if (a5 < 0.0) {
    a5 = a5 + 360.0;
  }
  double v8 = a5 - a3;
  if (v8 <= 180.0)
  {
    if (v8 < -180.0) {
      double v8 = v8 + 360.0;
    }
  }
  else
  {
    double v8 = v8 + -360.0;
  }
  double v9 = v7 * 0.5;
  double v10 = (a4 - a2) * 0.0174532925;
  unsigned int v11 = (int)v8;
  if ((int)v8 < 0) {
    unsigned int v11 = -v11;
  }
  int v12 = (int)a4 - (int)a2;
  if (v12 < 0) {
    int v12 = (int)a2 - (int)a4;
  }
  double v13 = v8 * 0.0174532925;
  if (v12 > 2 || v11 > 2)
  {
    if (a1) {
      sin(v9);
    }
    long double v14 = sin(v10 * 0.5);
    long double v15 = v14 * v14;
    double v16 = cos(a2 * 0.0174532925);
    long double v17 = v16 * cos(a4 * 0.0174532925);
    long double v18 = sin(v13 * 0.5);
    double v19 = v15 + v17 * (v18 * v18);
    double v20 = 1.0 - v19;
    if (v19 < 0.0) {
      double v19 = 0.0;
    }
    if (v20 < 0.0) {
      double v20 = 0.0;
    }
    atan2(sqrt(v19), sqrt(v20));
  }
  else
  {
    __sincos_stret(v9);
  }
}

double RTCommonGetDestinationCoordinate(double *a1, double *a2, double a3, double a4, double a5, double a6)
{
  double v8 = a4 * 0.0174532925;
  double v9 = a5 * 0.0174532925;
  double v10 = a6 / 6378137.0;
  __double2 v11 = __sincos_stret(a3 * 0.0174532925);
  __double2 v12 = __sincos_stret(v10);
  __double2 v13 = __sincos_stret(v9);
  long double v14 = asin(v13.__cosval * (v11.__cosval * v12.__sinval) + v11.__sinval * v12.__cosval);
  long double v15 = sin(v14);
  long double v16 = atan2(v11.__cosval * (v13.__sinval * v12.__sinval), v12.__cosval - v11.__sinval * v15);
  *a1 = v14 / 0.0174532925;
  double result = (v8 + v16) / 0.0174532925;
  *a2 = result;
  return result;
}

void RTCommonCalculateBoundingBox(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  if (a1 && a2 && a3)
  {
    if (a4)
    {
      double v16 = 0.0;
      double v17 = 0.0;
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 0.0, a7);
      double v14 = vabdd_f64(v17, a5);
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 90.0, a7);
      double v15 = vabdd_f64(v16, a6);
      *a1 = a5 - v14;
      *a3 = v14 + a5;
      *a2 = a6 - v15;
      *a4 = v15 + a6;
    }
  }
}

void RTCommonCalculateDistance(double a1, double a2, double a3, double a4)
{
}

BOOL RTCommonConvertGeodeticToLocalFrame(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9 = vabdd_f64(a4, a7);
  if (v9 <= 2.0)
  {
    double v16 = (a4 + a7) * 0.5 * 0.0174532925;
    double v17 = (a7 - a4) * 0.0174532925;
    double v18 = 360.0;
    if (a5 < 0.0) {
      a5 = a5 + 360.0;
    }
    double v19 = a8 + 360.0;
    if (a8 >= 0.0) {
      double v19 = a8;
    }
    double v20 = v19 - a5;
    if (v20 <= 180.0)
    {
      if (v20 >= -180.0)
      {
LABEL_10:
        double v21 = v20 * 0.0174532925;
        __double2 v22 = __sincos_stret(v16);
        double v23 = sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
        *a1 = v17 * (6335439.33 / (v23 * (v23 * v23)) + a6);
        *a2 = v22.__cosval * (6378137.0 / v23 + a6) * v21;
        *a3 = a9 - a6;
        return v9 <= 2.0;
      }
    }
    else
    {
      double v18 = -360.0;
    }
    double v20 = v20 + v18;
    goto LABEL_10;
  }
  return v9 <= 2.0;
}

BOOL RTCommonConvertLocalFrameToGeodetic(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  BOOL v8 = a3 >= -90.0 && a3 <= 90.0;
  if (v8)
  {
    __double2 v15 = __sincos_stret(a3 * 0.0174532925);
    double v16 = sqrt(v15.__sinval * -0.00669437999 * v15.__sinval + 1.0);
    double v17 = 6335439.33 / (v16 * (v16 * v16)) + a5;
    double v18 = v15.__cosval * (6378137.0 / v16 + a5);
    if (v18 < 10.0) {
      double v18 = 10.0;
    }
    *a1 = a3 + a6 / v17 * 57.2957795;
    *a2 = a4 + a7 / v18 * 57.2957795;
  }
  return v8;
}

double RTCommonRandomDouble(double a1, double a2)
{
  return a1 + (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 * (a2 - a1);
}

uint64_t RTCommonRandomInt(unsigned int a1)
{
  return arc4random_uniform(0x7FFFFFFFu) % a1;
}

BOOL RTCommonRandomFlip(double a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1 < 0.0 || a1 > 1.0)
  {
    uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      double v6 = a1;
      _os_log_error_impl(&dword_1A8FEF000, v3, OS_LOG_TYPE_ERROR, "RTCommonRandomFlip, invalid probability, %f, probability must be between 0 and 1", (uint8_t *)&v5, 0xCu);
    }
  }
  return (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 < a1;
}

BOOL RTCommonValidConfidence(double a1)
{
  return a1 <= 1.0 && a1 >= 0.0;
}

void RTCommonSafeLog(long double a1)
{
}

uint64_t sub_1A8FFBE74()
{
  return 0;
}

uint64_t sub_1A8FFD04C()
{
  return 0;
}

uint64_t sub_1A8FFD9F0()
{
  return 0;
}

uint64_t sub_1A8FFDE1C()
{
  return 0;
}

uint64_t sub_1A8FFEB18()
{
  return 0;
}

uint64_t sub_1A9000084()
{
  return 0;
}

uint64_t sub_1A90005C0()
{
  return 0;
}

uint64_t onDaemonStartNotification(uint64_t a1, void *a2)
{
  return [a2 handleDaemonStart];
}

id RTErrorConnectionCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v10 = (objc_class *)NSString;
  id v11 = a2;
  __double2 v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  __double2 v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28568];
  double v14 = NSString;
  __double2 v15 = NSStringFromSelector(a1);
  double v16 = [v14 stringWithFormat:@"connection failure while servicing %@, %@", v15, v12];
  v21[0] = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v18 = [v13 errorWithDomain:@"RTErrorDomain" code:8 userInfo:v17];

  return v18;
}

id RTErrorInvalidParameterCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v10 = (objc_class *)NSString;
  id v11 = a2;
  __double2 v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  __double2 v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28568];
  double v14 = NSString;
  __double2 v15 = NSStringFromSelector(a1);
  double v16 = [v14 stringWithFormat:@"invalid parameter passed to %@, %@", v15, v12];
  v21[0] = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v18 = [v13 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v17];

  return v18;
}

void sub_1A9003DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A900437C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
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

void sub_1A90049DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A9005828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A9010F9C()
{
  return 0;
}

uint64_t sub_1A90120A0()
{
  return 0;
}

uint64_t sub_1A9013080()
{
  return 0;
}

void _RTRequireInitializer(uint64_t a1, SEL aSelector)
{
  uint64_t v3 = NSString;
  uint64_t v4 = NSStringFromSelector(aSelector);
  uint64_t v5 = [v3 stringWithFormat:@"%@ requires the use of the initializer: %@", a1, v4];

  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

uint64_t sub_1A9013C90()
{
  return 0;
}

uint64_t sub_1A9015A6C()
{
  return 0;
}

uint64_t sub_1A90193D4()
{
  return 0;
}

void log_analytics_submission(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  [v5 appendFormat:@"\n=== BEGIN analytics submission for event %@ ===\n", v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v4 allKeys];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_2];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        __double2 v13 = [v4 objectForKeyedSubscript:v12];
        [v5 appendFormat:@"%@ : %@\n", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  [v5 appendFormat:@"=== END analytics submission for event %@ ===\n", v3];
  double v14 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

uint64_t __log_analytics_submission_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t sub_1A9019EC4()
{
  return 0;
}

void sub_1A901B0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
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

void sub_1A901C784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_1A901CBB4()
{
  return 0;
}

uint64_t sub_1A901D788()
{
  return 0;
}

uint64_t sub_1A901EDE4()
{
  return 0;
}

uint64_t sub_1A901F6EC()
{
  return 0;
}

uint64_t sub_1A901F98C()
{
  return 0;
}

uint64_t sub_1A901FC18()
{
  return 0;
}

uint64_t sub_1A90218D4()
{
  return 0;
}

uint64_t sub_1A9021D20()
{
  return 0;
}

uint64_t sub_1A90228CC()
{
  return 0;
}

uint64_t sub_1A9023214()
{
  return 0;
}

uint64_t sub_1A9023E24()
{
  return 0;
}

uint64_t sub_1A90248D0()
{
  return 0;
}

uint64_t sub_1A9025298()
{
  return 0;
}

uint64_t sub_1A9025E70()
{
  return 0;
}

uint64_t sub_1A9026FCC()
{
  return 0;
}

uint64_t sub_1A9027874()
{
  return 0;
}

uint64_t sub_1A9027D60()
{
  return 0;
}

uint64_t sub_1A902A454()
{
  return 0;
}

uint64_t sub_1A902B3BC()
{
  return 0;
}

uint64_t sub_1A902BDAC()
{
  return 0;
}

uint64_t sub_1A902CB58()
{
  return 0;
}

uint64_t sub_1A902D0A8()
{
  return 0;
}

uint64_t sub_1A902E2D0()
{
  return 0;
}

uint64_t sub_1A902FDC0()
{
  return 0;
}

__CFString *RTLinkQualityToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"RTLinkQualityUnknown";
  }
  else {
    return off_1E5D74768[a1 - 1];
  }
}

BOOL RTLinkQualityIsConnected(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

uint64_t sub_1A90307BC()
{
  return 0;
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFRelease(CFTypeRef cf)
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double asin(long double __x)
{
  MEMORY[0x1F40CA3D0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
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

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1F40CE780]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}