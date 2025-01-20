id *sub_100001F5C(id *result, void *a2)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  CFStringRef v28;

  if (a2)
  {
    v2 = result;
    [a2 acceleration];
    v4 = v3;
    v6 = fabs(v5);
    v7 = [v2[4] xThreshold];
    [v7 doubleValue];
    if (v6 > fabs(v8))
    {
    }
    else
    {
      v9 = [v2[4] zThreshold];
      [v9 doubleValue];
      v11 = fabs(v10);

      if (fabs(v4) <= v11) {
        return (id *)[v2[4] stop];
      }
    }
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v2[4] xThreshold];
      [v14 doubleValue];
      v16 = fabs(v15);
      v17 = [v2[4] zThreshold];
      [v17 doubleValue];
      v19 = 134219010;
      v20 = v6;
      v21 = 2048;
      v22 = fabs(v4);
      v23 = 2048;
      v24 = v16;
      v25 = 2048;
      v26 = fabs(v18);
      v27 = 2112;
      v28 = @"IncorrectOrientationNotification";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Gyroscope values { x: %f z: %f } are out of the thresholds allowed { x: %f z: %f }. Posting %@", (uint8_t *)&v19, 0x34u);
    }
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"IncorrectOrientationNotification" object:0];

    return (id *)[v2[4] stop];
  }
  return result;
}

void sub_1000026B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100002714(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 acceleration];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v7 > *(double *)(v10 + 24)) {
      *(double *)(v10 + 24) = v7;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v7 < *(double *)(v11 + 24)) {
      *(double *)(v11 + 24) = v7;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 > *(double *)(v12 + 24)) {
      *(double *)(v12 + 24) = v8;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v8 < *(double *)(v13 + 24)) {
      *(double *)(v13 + 24) = v8;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v9 > *(double *)(v14 + 24)) {
      *(double *)(v14 + 24) = v9;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    double v16 = *(double *)(v15 + 24);
    if (v9 < v16)
    {
      *(double *)(v15 + 24) = v9;
      double v16 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v18 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v20 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    double v21 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    double v22 = vabdd_f64(v17, v18);
    double v23 = vabdd_f64(v19, v20);
    double v24 = vabdd_f64(v21, v16);
    if (v23 < v24) {
      double v23 = v24;
    }
    if (v22 >= v23) {
      double v25 = v22;
    }
    else {
      double v25 = v23;
    }
    v26 = [*(id *)(a1 + 32) threshold];
    [v26 doubleValue];
    double v28 = v27;

    if (v25 > v28)
    {
      uint64_t v29 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = [*(id *)(a1 + 32) threshold];
        [v33 doubleValue];
        v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v35 = +[NSNumber numberWithDouble:v17 - v18];
        v36 = +[NSNumber numberWithDouble:v19 - v20];
        v37 = +[NSNumber numberWithDouble:v21 - v16];
        int v38 = 138413058;
        v39 = v34;
        __int16 v40 = 2112;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Motion detection threshold value %@ exceeded. X: %@ Y: %@ Z: %@", (uint8_t *)&v38, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 postNotificationName:@"MotionDetectedNotification" object:0];
    }
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v31 + 24))
    {
      *(unsigned char *)(v31 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x10000000000000;
    }
  }
  else
  {
    v32 = [*(id *)(a1 + 32) motionManager];
    [v32 stopAccelerometerUpdates];
  }
}

void sub_1000033D8(uint64_t a1)
{
  dispatch_semaphore_t dsema = [*(id *)(a1 + 32) chamberReadySemaphore];
  v2 = [*(id *)(a1 + 32) inputs];
  dispatch_time_t v3 = dispatch_time(0, 1000000000 * [v2 detectChamberReadyWaitTime]);
  if (dispatch_semaphore_wait(dsema, v3))
  {
    unsigned int v4 = [*(id *)(a1 + 32) started];

    if (v4)
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [*(id *)(a1 + 32) inputs];
        *(_DWORD *)buf = 67109120;
        unsigned int v10 = [v6 detectChamberReadyWaitTime];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Chamber is not ready within timeout specified: %u", buf, 8u);
      }
      [*(id *)(a1 + 32) stop];
      double v7 = [*(id *)(a1 + 32) delegate];
      [v7 handleChamberStatus:2];
    }
  }
  else
  {
  }
}

void sub_1000039F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id archiveFiles(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = +[DSMutableArchive archive];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v7;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
        id v24 = v14;
        unsigned __int8 v16 = [v8 addURL:v15 error:&v24];
        id v7 = v24;

        if ((v16 & 1) == 0)
        {
          double v21 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10000FC08((uint64_t)v7, v21);
          }

          double v20 = v9;
          goto LABEL_15;
        }
        uint64_t v13 = (char *)v13 + 1;
        uint64_t v14 = v7;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  double v17 = v7;

  double v18 = DKTemporaryDirectoryURL();
  id v23 = v7;
  double v19 = [v8 archiveAsTempFileWithTemplate:v6 directory:v18 suffix:@".tar.gz" error:&v23];
  id v7 = v23;

  if (!v19)
  {
    double v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000FB90((uint64_t)v7, v20);
    }
LABEL_15:

    double v19 = 0;
  }

  return v19;
}

FFTSetup AAT_initWithLength(FFTSetup result)
{
  if (!qword_100024410)
  {
    if (result < 2)
    {
      vDSP_Length v1 = 0;
    }
    else
    {
      vDSP_Length v1 = 0;
      unsigned int v2 = 1;
      do
      {
        v2 *= 2;
        ++v1;
      }
      while (v2 < result);
    }
    result = vDSP_create_fftsetup(v1, 0);
    qword_100024410 = (uint64_t)result;
  }
  return result;
}

void AAT_cleanUp()
{
  qword_100024410 = 0;
}

void AAT_processFrequencyResponseGxx(const float *a1, unsigned int a2, float *a3, unsigned int a4, uint64_t a5, unsigned int a6, unsigned int a7, void *a8)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000FF08();
  }
  v149 = a8;
  BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13) {
    sub_10000FECC(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  unsigned int v21 = a6 >> 1;
  if (a6 >= 2)
  {
    uint64_t v75 = 0;
    if (v21 <= 1) {
      uint64_t v76 = 1;
    }
    else {
      uint64_t v76 = v21;
    }
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v77 = (float *)(a5 + 8 * v75++);
        double v78 = *v77;
        double v79 = v77[1];
        *(_DWORD *)buf = 67109632;
        int v157 = v75;
        __int16 v158 = 2048;
        double v159 = v78;
        __int16 v160 = 2048;
        double v161 = v79;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "  bin%d: %.0f - %.0f\n", buf, 0x1Cu);
      }
      else
      {
        ++v75;
      }
    }
    while (v75 != v76);
  }
  BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v22) {
    sub_10000FC80(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000FE5C();
  }
  uint64_t v30 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v31 = a3[v30++];
      *(_DWORD *)buf = 67109376;
      int v157 = v30;
      __int16 v158 = 2048;
      double v159 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v30;
    }
  }
  while (v30 != 5);
  BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v32) {
    sub_10000FC80(v32, v33, v34, v35, v36, v37, v38, v39);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000FDEC();
  }
  uint64_t v40 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v41 = a1[v40++];
      *(_DWORD *)buf = 67109376;
      int v157 = v40;
      __int16 v158 = 2048;
      double v159 = v41;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v40;
    }
  }
  while (v40 != 5);
  BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v42) {
    sub_10000FC80(v42, v43, v44, v45, v46, v47, v48, v49);
  }
  uint64_t v148 = a6 >> 1;
  __X = a3;
  uint64_t v50 = 1;
  do
  {
    uint64_t v51 = v50;
    uint64_t v50 = (2 * v50);
  }
  while (v51 < a2);
  v146 = (DSPComplex *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  cblas_scopy(a2, a1, 1, (float *)v146, 1);
  v147 = (DSPComplex *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  v52 = a1;
  vDSP_Length v53 = a2 + a4 - 1;
  if (a4 <= a2) {
    unsigned int v54 = a2 - a4;
  }
  else {
    unsigned int v54 = a4 - a2;
  }
  size_t v55 = v54 + v53;
  v56 = (float *)malloc_type_calloc(v55, 4uLL, 0x100004052888210uLL);
  v57 = (float *)malloc_type_calloc(v53 + a2, 4uLL, 0x100004052888210uLL);
  cblas_scopy(a4, __X, 1, &v57[a2 - 1], 1);
  vDSP_conv(v57, 1, v52, 1, &v56[v54], 1, v53, a2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000FD70();
  }
  if (v53 >= 0xF) {
    int v58 = 15;
  }
  else {
    int v58 = a2 + a4 - 1;
  }
  unsigned int v59 = v55 - v58;
  if (v59 < v55)
  {
    uint64_t v60 = (int)v59;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        float v62 = v56[v60++];
        *(_DWORD *)buf = 67109376;
        int v157 = v60;
        __int16 v158 = 2048;
        double v159 = v62;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d:  %.21g\n", buf, 0x12u);
        unsigned int v61 = v60;
      }
      else
      {
        unsigned int v61 = ++v60;
      }
    }
    while (v61 < v55);
  }
  BOOL v63 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v63) {
    sub_10000FC80(v63, v64, v65, v66, v67, v68, v69, v70);
  }
  free(v57);
  if (v55)
  {
    uint64_t v71 = 0;
    int v72 = 0;
    float v73 = 0.0;
    do
    {
      float v74 = fabsf(v56[v71]);
      if (v74 > v73)
      {
        int v72 = v71;
        float v73 = v74;
      }
      ++v71;
    }
    while (v55 != v71);
  }
  else
  {
    int v72 = 0;
  }
  unsigned int v80 = (v72 - a4 + 1) & ~((int)(v72 - a4 + 1) >> 31);
  if (v80 + a2 > a4) {
    unsigned int v80 = 0;
  }
  cblas_scopy(a2, &__X[v80], 1, (float *)v147, 1);
  free(v56);
  BOOL v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v81) {
    sub_10000FD34(v81, v82, v83, v84, v85, v86, v87, v88);
  }
  uint64_t v89 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v90 = *(&v147->real + v89++);
      *(_DWORD *)buf = 67109376;
      int v157 = v89;
      __int16 v158 = 2048;
      double v159 = v90;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v89;
    }
  }
  while (v89 != 5);
  v91 = (char *)malloc_type_calloc((v51 >> 1) + 1, 4uLL, 0x100004052888210uLL);
  v155 = v91;
  sub_1000057C8(v146, v51, a7, &v155);
  free(v146);
  v92 = (float *)malloc_type_calloc((v51 >> 1) + 1, 4uLL, 0x100004052888210uLL);
  v154 = v92;
  sub_1000057C8(v147, v51, a7, &v154);
  unint64_t v93 = 0;
  do
  {
    v92[v93 / 4] = log10f(v92[v93 / 4] / *(float *)&v91[v93]) * 10.0;
    v93 += 4;
  }
  while (((2 * v51) & 0x1FFFFFFFCLL) + 4 != v93);
  free(v147);
  free(v91);
  v94 = (float *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  v95 = v94;
  if (v51)
  {
    uint64_t v96 = 0;
    float v97 = (float)a7 / (float)v51;
    int64x2_t v98 = (int64x2_t)xmmword_100015530;
    uint64x2_t v99 = (uint64x2_t)vdupq_n_s64((unint64_t)v51 - 1);
    int64x2_t v100 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v101 = vmovn_s64((int64x2_t)vcgeq_u64(v99, (uint64x2_t)v98));
      if (v101.i8[0]) {
        v94[v96] = v97 * (float)(int)v96;
      }
      if (v101.i8[4]) {
        v94[v96 + 1] = v97 * (float)(v96 + 1);
      }
      v96 += 2;
      int64x2_t v98 = vaddq_s64(v98, v100);
    }
    while (((v51 + 1) & 0x1FFFFFFFELL) != v96);
  }
  BOOL v102 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v102) {
    sub_10000FCF8(v102, v103, v104, v105, v106, v107, v108, v109);
  }
  uint64_t v110 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v111 = v92[v110++];
      *(_DWORD *)buf = 67109376;
      int v157 = v110;
      __int16 v158 = 2048;
      double v159 = v111;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v110;
    }
  }
  while (v110 != 5);
  if (a6 > 1)
  {
    uint64_t v112 = 0;
    float v113 = v95[1] - *v95;
    do
    {
      uint64_t v114 = 0;
      v115 = (float *)(a5 + 8 * v112);
      float v116 = v115[1];
      while (v95[v114] <= *v115)
      {
        if ((v51 >> 1) + 1 == ++v114)
        {
          unsigned int v117 = 0;
          goto LABEL_96;
        }
      }
      float v118 = 0.0;
      if (v51 >> 1 < v114) {
        goto LABEL_103;
      }
      unsigned int v117 = v114;
LABEL_96:
      uint64_t v119 = v117;
      uint64_t v120 = v117 - 1;
      uint64_t v121 = v117;
      v122 = &v95[v121];
      while (*v122 <= v116)
      {
        ++v120;
        ++v122;
        if ((unint64_t)v51 >> 1 == v120)
        {
          LODWORD(v120) = 0;
          break;
        }
      }
      float v118 = 0.0;
      if (v119 <= v120)
      {
        uint64_t v123 = (v120 + 1) - v119;
        v124 = &v92[v121];
        do
        {
          float v125 = *v124++;
          float v118 = v118 + (float)(__exp10f(v125 / 10.0) * v113);
          --v123;
        }
        while (v123);
      }
LABEL_103:
      *(float *)(*v149 + 4 * v112++) = log10f(v118) * 10.0;
    }
    while (v112 != v148);
  }
  unint64_t v126 = 0;
  do
  {
    __exp10f(v92[v126 / 4] / 10.0);
    v126 += 4;
  }
  while (((2 * v51) & 0x1FFFFFFFCLL) + 4 != v126);
  BOOL v127 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v127) {
    sub_10000FCBC(v127, v128, v129, v130, v131, v132, v133, v134);
  }
  if (a6 >= 2)
  {
    uint64_t v143 = 0;
    if (v148 <= 1) {
      uint64_t v144 = 1;
    }
    else {
      uint64_t v144 = v148;
    }
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        float v145 = *(float *)(*v149 + 4 * v143++);
        *(_DWORD *)buf = 67109376;
        int v157 = v143;
        __int16 v158 = 2048;
        double v159 = v145;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21f\n", buf, 0x12u);
      }
      else
      {
        ++v143;
      }
    }
    while (v143 != v144);
  }
  BOOL v135 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v135) {
    sub_10000FC80(v135, v136, v137, v138, v139, v140, v141, v142);
  }
  free(v92);
  free(v95);
}

void sub_1000057C8(const DSPComplex *a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v6 = a2 >> 1;
  id v7 = (float *)malloc_type_calloc((v6 + 1), 4uLL, 0x100004052888210uLL);
  if (a2 < 2)
  {
    unsigned int v8 = 0;
    int v9 = 1;
  }
  else
  {
    unsigned int v8 = 0;
    int v9 = 1;
    do
    {
      v9 *= 2;
      ++v8;
    }
    while (v9 < a2);
  }
  if (v9 >= 0) {
    int v10 = v9;
  }
  else {
    int v10 = v9 + 1;
  }
  uint64_t v11 = (v10 >> 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001002C();
  }
  __Z.realp = (float *)malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  __Z.imagp = (float *)malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  vDSP_ctoz(a1, 2, &__Z, 1, (int)v11);
  vDSP_fft_zrip((FFTSetup)qword_100024410, &__Z, 1, v8, 1);
  realp = __Z.realp;
  imagp = __Z.imagp;
  if (v9 >= 2)
  {
    uint64_t v14 = __Z.realp;
    uint64_t v15 = __Z.imagp;
    uint64_t v16 = v11;
    do
    {
      *uint64_t v14 = *v14 * 0.5;
      ++v14;
      *uint64_t v15 = *v15 * 0.5;
      ++v15;
      --v16;
    }
    while (v16);
  }
  realp[(int)v11] = *imagp;
  float *imagp = 0.0;
  if ((int)v11 + 1 < v9)
  {
    uint64_t v17 = ~(uint64_t)(int)v11 + v9;
    uint64_t v18 = 4 * (int)v11 + 4;
    uint64_t v19 = (float *)((char *)imagp + v18);
    uint64_t v20 = (_DWORD *)((char *)realp + v18);
    int v21 = v11 - 1;
    do
    {
      *v20++ = LODWORD(realp[v21]);
      *v19++ = -imagp[v21--];
      --v17;
    }
    while (v17);
  }
  float v22 = 1.0 / (float)a3;
  BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v23) {
    sub_10000FFF0(v23, v24, v25, v26, v27, v28, v29, v30);
  }
  for (uint64_t i = 0; i != 5; ++i)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      double v32 = __Z.realp[i];
      double v33 = __Z.imagp[i];
      *(_DWORD *)buf = 67109632;
      int v63 = i + 1;
      __int16 v64 = 2048;
      double v65 = v32;
      __int16 v66 = 2048;
      double v67 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %8g  +  %8gi\n", buf, 0x1Cu);
    }
  }
  unint64_t v34 = 0;
  uint64_t v36 = __Z.realp;
  uint64_t v35 = __Z.imagp;
  do
  {
    float v37 = (float)((float)(v22 * v36[v34 / 4]) * (float)(v22 * v36[v34 / 4]))
        + (float)((float)(v22 * v35[v34 / 4]) * (float)(v22 * v35[v34 / 4]));
    v7[v34 / 4] = (float)(v37 + v37) / (float)(v22 * (float)a2);
    v34 += 4;
  }
  while (((2 * a2) & 0x1FFFFFFFCLL) + 4 != v34);
  free(v35);
  free(__Z.realp);
  *id v7 = *v7 * 0.5;
  if ((a2 & 1) == 0) {
    v7[v6] = v7[v6] * 0.5;
  }
  BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v38) {
    sub_10000FFB4(v38, v39, v40, v41, v42, v43, v44, v45);
  }
  uint64_t v46 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v47 = v7[v46++];
      *(_DWORD *)buf = 67109376;
      int v63 = v46;
      __int16 v64 = 2048;
      double v65 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v46;
    }
  }
  while (v46 != 5);
  uint64_t v48 = 0;
  do
  {
    if (!v48 || v48 == v6)
    {
      *(float *)(*a4 + 4 * v48) = v7[v48];
      ++v48;
    }
    else if (v48 == 1 || v48 == v6 - 1)
    {
      *(float *)(*a4 + 4 * v48) = (float)((float)(v7[(v48 - 1)] + v7[v48]) + v7[v48 + 1]) / 3.0;
      ++v48;
    }
    else
    {
      *(float *)(*a4 + 4 * v48) = (float)((float)((float)((float)(v7[(v48 - 2)]
                                                                + v7[(v48 - 1)])
                                                        + v7[v48])
                                                + v7[v48 + 1])
                                        + v7[v48 + 2])
                                / 5.0;
      ++v48;
    }
  }
  while (v48 != v6 + 1);
  BOOL v49 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v49) {
    sub_10000FF78(v49, v50, v51, v52, v53, v54, v55, v56);
  }
  uint64_t v57 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      float v58 = *(float *)(*a4 + 4 * v57++);
      *(_DWORD *)buf = 67109376;
      int v63 = v57;
      __int16 v64 = 2048;
      double v65 = v58;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v57;
    }
  }
  while (v57 != 5);
  free(v7);
}

void AAT_processCrackledData(const float *a1, int a2, int a3, int a4, int a5, const vDSP_biquad_SetupStruct **a6, float *a7, float *a8, float *a9, _DWORD *a10)
{
  if (a3 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000100B0();
    }
  }
  else if (a4 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100010120();
    }
  }
  else if (a5 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100010190();
    }
  }
  else
  {
    int v11 = (int)(float)(2 * a3 / a4);
    int v12 = v11 - 1;
    if (v11 >= 1)
    {
      float v47 = a9;
      uint64_t v48 = a10;
      vDSP_Length v18 = a2;
      uint64_t v19 = (float *)malloc_type_malloc(4 * a2, 0x100004052888210uLL);
      vDSP_biquad(*a6, a7, a1, 1, v19, 1, v18);
      uint64_t v20 = (v11 + 1);
      __chkstk_darwin();
      float v22 = (int *)((char *)&v46 - v21);
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      do
      {
        double v25 = 0.0;
        if (a2 - v11 >= 1)
        {
          uint64_t v26 = (a2 - v11);
          uint64_t v27 = v19;
          do
          {
            float v28 = v27[v23];
            float v29 = *v27++;
            double v25 = v25 + (float)(v29 * v28);
            --v26;
          }
          while (v26);
        }
        *(float *)&int v30 = v25;
        v22[v24++] = v30;
        ++v23;
      }
      while (v24 != v20);
      free(v19);
      float v31 = *(float *)&v22[v11];
      if (v31 <= *(float *)&v22[v12]) {
        float v31 = *(float *)&v22[v12];
      }
      double v32 = (float)((float)((float)v11 + 1.0) * 0.5);
      double v33 = floor(v32) - (double)a5;
      if (v33 <= (double)(a5 - 1))
      {
        LODWORD(v34) = 0;
        float v35 = 0.0;
        float v37 = v47;
        uint64_t v36 = v48;
      }
      else
      {
        uint64_t v34 = 0;
        float v35 = 0.0;
        float v37 = v47;
        uint64_t v36 = v48;
        do
        {
          float v35 = v35 + fabsf(*(float *)&v22[a5 - 1 + v34]);
          double v38 = (double)(a5 + (int)v34++);
        }
        while (v33 > v38);
      }
      int v39 = *v22;
      int v40 = (int)(ceil(v32) + (double)a5 + -1.0);
      if ((int)v20 - a5 > v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = (float *)&v22[v40];
        uint64_t v43 = v41 + a5 - (int)v20;
        do
        {
          float v44 = *v42++;
          float v35 = v35 + fabsf(v44);
          LODWORD(v34) = v34 + 1;
        }
        while (!__CFADD__(v43++, 1));
      }
      *a8 = v31;
      float *v37 = v31 / (float)(v35 / (float)(int)v34);
      _DWORD *v36 = v39;
    }
  }
}

void sub_10000603C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100006064(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100006080(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1000064B4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) testCompletionSemaphore];
  dispatch_time_t v3 = [*(id *)(a1 + 32) inputs];
  unsigned int v4 = [v3 sequenceTimeout];
  id v5 = [v4 unsignedLongValue];
  uint64_t v6 = [*(id *)(a1 + 32) inputs];
  id v7 = [v6 sequences];
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * (void)v5 * (void)[v7 count]);
  intptr_t v9 = dispatch_semaphore_wait(v2, v8);

  if (v9)
  {
    int v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Audio test has timed out while waiting for completion.", v11, 2u);
    }

    [*(id *)(a1 + 32) endTesting:4294966292 immediately:0];
  }
}

id sub_100006AF4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) testEndedSemaphore];
  dispatch_time_t v3 = [*(id *)(a1 + 32) airpodsInputs];
  unsigned int v4 = [v3 chamberInputs];
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * [v4 testCompleteAlertTime]);
  dispatch_semaphore_wait(v2, v5);

  [*(id *)(a1 + 32) stopAlerts];
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 setFinished:1];
}

void sub_100008844(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [*(id *)(a1 + 32) setAudioSystemResults:v2];

  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  dispatch_time_t v3 = [*(id *)(a1 + 32) inputs];
  unsigned int v4 = [v3 sequences];

  id v5 = [v4 countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v70 = 0;
    uint64_t v7 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v82 != v7) {
          objc_enumerationMutation(v4);
        }
        intptr_t v9 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) testFailed])
        {
          dispatch_semaphore_signal(dsema);
        }
        else
        {
          int v10 = [v9 outputs];
          id v11 = [v10 count];

          if (v11 == (id)1)
          {
            [*(id *)(a1 + 32) testSequence:v9 completionSemaphore:dsema];
          }
          else
          {
            NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
            CFStringRef v96 = @"Sequence has more than 1 output.";
            int v12 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
            uint64_t v13 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-64 userInfo:v12];

            [*(id *)(a1 + 32) failedToExecuteWithError:v13];
            dispatch_semaphore_signal(dsema);
            uint64_t v70 = (void *)v13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v81 objects:v97 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v70 = 0;
  }

  uint64_t v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Waiting for sequences to complete...", buf, 2u);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) inputs];
  uint64_t v16 = [v15 sequences];

  uint64_t v17 = (char *)[v16 countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (!v17)
  {
LABEL_28:

    uint64_t v27 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "All sequences complete", buf, 2u);
    }

    id v28 = v70;
    if (*(unsigned char *)(a1 + 40))
    {
      float v29 = [*(id *)(a1 + 32) rawRecordings];
      int v30 = [@"RecordedAudio" stringByAppendingString:@"XXXXXX"];
      uint64_t v16 = archiveFiles(v29, v30, v70);

      float v31 = DiagnosticLogHandleForCategory();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v70)
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v93 = (const char *)v70;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ERROR archiving recording data: %@", buf, 0xCu);
        }
      }
      else
      {
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v93 = (const char *)v16;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully archived raw audio to [%@]", buf, 0xCu);
        }

        float v31 = objc_alloc_init((Class)NSFileManager);
        float v35 = [*(id *)(a1 + 32) tmpdir];
        uint64_t v36 = [@"RecordedAudio" stringByAppendingString:@".tar.gz"];
        float v37 = [v35 URLByAppendingPathComponent:v36];

        id v76 = 0;
        unsigned int v38 = [v31 moveItemAtURL:v16 toURL:v37 error:&v76];
        id v28 = v76;
        int v39 = DiagnosticLogHandleForCategory();
        int v40 = v39;
        if (v38)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v93 = v37;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Successfully renamed raw audio archive to [%@]", buf, 0xCu);
          }

          int v40 = v16;
          uint64_t v16 = v37;
        }
        else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          sub_100010358();
        }
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    if ([*(id *)(a1 + 32) isCancelled]) {
      goto LABEL_78;
    }
    if (([*(id *)(a1 + 32) testFailed] & 1) == 0)
    {
      uint64_t v41 = [*(id *)(a1 + 32) result];
      [v41 setStatusCode:&off_10001D700];
    }
    CFStringRef v88 = @"dbResults";
    uint64_t v42 = [*(id *)(a1 + 32) audioSystemResults];
    uint64_t v89 = v42;
    uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    float v44 = [*(id *)(a1 + 32) result];
    [v44 setData:v43];

    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_78;
    }
    uint64_t v45 = v16;
    id v46 = v28;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    float v47 = [*(id *)(a1 + 32) inputs];
    uint64_t v48 = [v47 sequences];

    id v49 = [v48 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = 0;
      uint64_t v52 = *(void *)v73;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(void *)v73 != v52) {
            objc_enumerationMutation(v48);
          }
          uint64_t v54 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)j) completedResultCount];
          v51 += (int)[v54 intValue];
        }
        id v50 = [v48 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v50);
    }
    else
    {
      uint64_t v51 = 0;
    }

    if (v45
      && ([*(id *)(a1 + 32) rawRecordings],
          uint64_t v55 = objc_claimAutoreleasedReturnValue(),
          uint64_t v56 = (char *)[v55 count],
          v55,
          v56 == v51))
    {
      uint64_t v57 = [*(id *)(a1 + 32) writeCurrentResultsToJson];
      float v58 = (void *)v57;
      id v28 = v46;
      if (v57)
      {
        v86[0] = v45;
        v86[1] = v57;
        unsigned int v59 = +[NSArray arrayWithObjects:v86 count:2];
        uint64_t v60 = [*(id *)(a1 + 32) archiveNameTemplate];
        archiveFiles(v59, v60, v28);
        unsigned int v61 = (char *)objc_claimAutoreleasedReturnValue();

        float v62 = DiagnosticLogHandleForCategory();
        int v63 = v62;
        if (v28)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            sub_1000102F0();
          }
        }
        else
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v93 = v61;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Successfully created combined results archive at [%@]", buf, 0xCu);
          }

          uint64_t v85 = v61;
          int v63 = +[NSArray arrayWithObjects:&v85 count:1];
          uint64_t v68 = [*(id *)(a1 + 32) result];
          [v68 setFiles:v63];
        }
        uint64_t v16 = v45;
      }
      else
      {
        __int16 v64 = DiagnosticLogHandleForCategory();
        uint64_t v16 = v45;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Unable to include test results in archive. Prioritizing Kets over recorded audio", buf, 2u);
        }

        double v65 = [*(id *)(a1 + 32) result];
        __int16 v66 = [v65 statusCode];
        unsigned int v67 = [v66 isEqualToNumber:&off_10001D700];

        if (!v67) {
          goto LABEL_77;
        }
        unsigned int v61 = [*(id *)(a1 + 32) result];
        [v61 setStatusCode:&off_10001D718];
      }
    }
    else
    {
      float v58 = [*(id *)(a1 + 32) result];
      [v58 setStatusCode:&off_10001D718];
      id v28 = v46;
      uint64_t v16 = v45;
    }
LABEL_77:

LABEL_78:
    [*(id *)(a1 + 32) testFinishedSuccessfully];
    goto LABEL_79;
  }
  uint64_t v19 = v17;
  uint64_t v20 = *(void *)v78;
  *(void *)&long long v18 = 136315138;
  long long v69 = v18;
  while (1)
  {
    if (*(void *)v78 != v20) {
      objc_enumerationMutation(v16);
    }
    uint64_t v21 = [*(id *)(a1 + 32) inputs:v69];
    float v22 = [v21 sequenceTimeout];
    dispatch_time_t v23 = dispatch_time(0, 1000000000 * (void)[v22 unsignedLongValue]);
    intptr_t v24 = dispatch_semaphore_wait(dsema, v23);

    double v25 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = "timed out";
      if (!v24) {
        uint64_t v26 = "finished";
      }
      *(_DWORD *)buf = v69;
      unint64_t v93 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sequence has %s while waiting for completion.", buf, 0xCu);
    }

    if (v24) {
      break;
    }
    if (!--v19)
    {
      uint64_t v19 = (char *)[v16 countByEnumeratingWithState:&v77 objects:v94 count:16];
      if (!v19) {
        goto LABEL_28;
      }
    }
  }
  double v33 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Timed out while waiting on sequence completion semaphore. Ending test.", buf, 2u);
  }

  NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
  CFStringRef v91 = @"Timed out waiting for sequences to finish running.";
  uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  id v28 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-71 userInfo:v34];

  [*(id *)(a1 + 32) failedToExecuteWithError:v28];
  [*(id *)(a1 + 32) setFinished:1];
LABEL_79:
}

void sub_1000095E4(uint64_t a1)
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "This is the first time failedToExecuteWithError was called. Using this error for the failing status code", v7, 2u);
  }

  dispatch_time_t v3 = [*(id *)(a1 + 32) result];
  [v3 setData:&__NSDictionary0__struct];

  unsigned int v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) code]);
  id v5 = [*(id *)(a1 + 32) result];
  [v5 setStatusCode:v4];

  [*(id *)(a1 + 32) setTestFailed:1];
  id v6 = [*(id *)(a1 + 32) audioTest];
  [v6 cancel];
}

void sub_10000A328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10000A354(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A364(uint64_t a1)
{
}

void sub_10000A36C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000A820(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) testFailed])
  {
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v8;
      intptr_t v9 = "Test appears to have already failed. Not proceeding with completion block for sequence {%@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v5)
  {
    if ([v5 count])
    {
      id v10 = objc_alloc_init((Class)NSMutableArray);
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = [*(id *)(a1 + 72) index];
      [v11 parseTestResults:v5 fromOutput:v12 withFile:v13 parsedResults:v10 sequenceIndex:v14 error:v6];

      uint64_t v15 = [*(id *)(a1 + 32) audioSystemResults];
      [v15 addObject:v10];

      uint64_t v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
      [*(id *)(a1 + 72) setCompletedResultCount:v16];

      goto LABEL_7;
    }
LABEL_27:
    intptr_t v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000104BC(a1, v24, v25, v26, v27, v28, v29, v30);
    }

    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Sequence completed with no results";
    float v31 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    BOOL v32 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-72 userInfo:v31];

    [*(id *)(a1 + 32) failedToExecuteWithError:v32];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

    goto LABEL_11;
  }
  long long v18 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100010594();
  }

  if (v6)
  {
    if ([v6 code] == (id)-2 || objc_msgSend(v6, "code") == (id)-3)
    {
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      uint64_t v19 = [v6 localizedDescription];
      int v40 = v19;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v21 = -56;
    }
    else
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      uint64_t v19 = [v6 localizedDescription];
      unsigned int v38 = v19;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v21 = -67;
    }
    float v22 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:v21 userInfo:v20];
  }
  else
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"Sequence completed with nil result";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    float v22 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-72 userInfo:v19];
  }

  if (!v22)
  {
    if ([0 count])
    {
      [*(id *)(a1 + 72) setCompletedResultCount:&off_10001D730];
LABEL_7:
      uint64_t v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v17;
        intptr_t v9 = "Completion finished for test sequence %@";
        goto LABEL_9;
      }
LABEL_10:

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  dispatch_time_t v23 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10001052C();
  }

  [*(id *)(a1 + 32) failedToExecuteWithError:v22];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

LABEL_11:
}

void sub_10000C498(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000C4C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10000C4DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10000CB50(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanAvailableNetworks];
}

uint64_t sensorEventTypeToString(unsigned int a1)
{
  if (a1 < 5) {
    return (uint64_t)*(&off_10001C660 + (int)a1);
  }
  +[NSException raise:NSGenericException format:@"Unexpected DAChamberSensorEventType."];
  return 0;
}

void ALSHIDEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0) {
    [v6 handleHIDEvent:a4];
  }
}

void sub_10000D6AC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) HIDSystemClient])
  {
    CFRelease([*(id *)(a1 + 32) HIDSystemClient]);
    [*(id *)(a1 + 32) setHIDSystemClient:0];
    id v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Release system client", buf, 2u);
    }
  }
  if ([*(id *)(a1 + 32) HIDServiceClient])
  {
    CFRelease([*(id *)(a1 + 32) HIDServiceClient]);
    [*(id *)(a1 + 32) setHIDServiceClient:0];
    dispatch_time_t v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Release service client", v4, 2u);
    }
  }
}

BOOL sub_10000E52C(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x101;

  return v3;
}

BOOL sub_10000E57C(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x33;

  return v3;
}

void sub_10000E7A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000E7C0(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8) + 24;
  id v5 = a2;
  [v3 dk_numberFromRequiredKey:v5 lowerBound:&off_10001D808 upperBound:&off_10001D820 failed:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [*(id *)(a1 + 40) inputValueToName];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void sub_10000E868(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E968;
  v10[3] = &unk_10001C718;
  id v11 = objc_alloc_init(OutputSpecification);
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 40);
  id v7 = v5;
  uint64_t v8 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v9 = [*(id *)(a1 + 32) outputSpecifications];
  [v9 setObject:v8 forKeyedSubscript:v6];
}

void sub_10000E968(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) dk_numberFromRequiredKey:@"mode" lowerBound:&off_10001D808 upperBound:&off_10001D838 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  [*(id *)(a1 + 32) setMode:v2];

  [*(id *)(a1 + 40) dk_numberFromRequiredKey:@"channel" lowerBound:&off_10001D808 upperBound:&off_10001D838 failed:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setChannel:v3];
}

void sub_10000FB90(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR archiving logs: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FC08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR finding log(s): %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FCBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FD70()
{
  sub_10000609C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "xcorr output in the end:  input size = (%d, %d) \n", v0, 0xEu);
}

void sub_10000FDEC()
{
  sub_100006058();
  sub_100006080((void *)&_mh_execute_header, &_os_log_default, v0, "\nAAT_processFrequencyResponseGxx input stimulus (length=%d): \n", v1, v2, v3, v4, v5);
}

void sub_10000FE5C()
{
  sub_100006058();
  sub_100006080((void *)&_mh_execute_header, &_os_log_default, v0, "\nAAT_processFrequencyResponseGxx input data (length=%d): \n", v1, v2, v3, v4, v5);
}

void sub_10000FECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FF08()
{
  sub_100006058();
  sub_100006080((void *)&_mh_execute_header, &_os_log_default, v0, "\nfs = %d\n", v1, v2, v3, v4, v5);
}

void sub_10000FF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001002C()
{
  sub_10000609C();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\nAAT_fft: n = %d, log2n = %d, xLength = %d", v2, 0x14u);
}

void sub_1000100B0()
{
  sub_100006058();
  sub_100006064((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleSamplingRate: %d", v1, v2, v3, v4, v5);
}

void sub_100010120()
{
  sub_100006058();
  sub_100006064((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleBaseFrequency: %d", v1, v2, v3, v4, v5);
}

void sub_100010190()
{
  sub_100006058();
  sub_100006064((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleNeighborDistance: %d", v1, v2, v3, v4, v5);
}

void sub_100010200(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to disable headphone exposure notifications: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100010278(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to restore original headphone exposure notification setting: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000102F0()
{
  sub_10000C4B4();
  sub_10000C498((void *)&_mh_execute_header, v0, v1, "Failed to create combined results archive with error [%@]", v2, v3, v4, v5, v6);
}

void sub_100010358()
{
  sub_10000C4B4();
  sub_10000C498((void *)&_mh_execute_header, v0, v1, "Failed to rename raw audio archive. Will use existing name in upload. Error: [%@]", v2, v3, v4, v5, v6);
}

void sub_1000103C0(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Error clearing temporary files: %@", a1, 0xCu);
}

void sub_100010438(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C4B4();
  sub_10000C4DC((void *)&_mh_execute_header, v2, v3, "Error clearing temporary files: %@", v4, v5, v6, v7, v8);
}

void sub_1000104BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001052C()
{
  sub_10000C4B4();
  sub_10000C498((void *)&_mh_execute_header, v0, v1, "AVF audio playback error resolved to: %@", v2, v3, v4, v5, v6);
}

void sub_100010594()
{
  sub_10000C4B4();
  sub_10000C498((void *)&_mh_execute_header, v0, v1, "ERROR during audio playback: %@", v2, v3, v4, v5, v6);
}

void sub_1000105FC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 outputDevice];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Sample rate mismatch between audio file %@ and speaker %@", (uint8_t *)&v6, 0x16u);
}

void sub_1000106B0(void *a1)
{
  [a1 inputID];
  sub_10000C4B4();
  sub_10000C4DC((void *)&_mh_execute_header, v1, v2, "Input name missing for mic %ld", v3, v4, v5, v6, v7);
}

void sub_100010728(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010760(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010798(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000107D0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DAWifiSensor: Scan completed with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100010868(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DAALSSensor: Failed to setup service client for ALS.", v1, 2u);
}

void sub_1000108AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DAALSSensor: HIDSystemClient and HIDServiceClient were already set up.", v1, 2u);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return _AudioServicesPlaySystemSoundWithOptions();
}

uint64_t AudioServicesStopSystemSound()
{
  return _AudioServicesStopSystemSound();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t DKTemporaryDirectoryURL()
{
  return _DKTemporaryDirectoryURL();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return _IOHIDEventSystemClientActivate();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return _IOHIDEventSystemClientRegisterEventCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return _IOHIDEventSystemClientSetCancelHandler();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return _IOHIDEventSystemClientUnregisterEventCallback();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t _AXSLeftRightAudioBalance()
{
  return __AXSLeftRightAudioBalance();
}

uint64_t _AXSMonoAudioEnabled()
{
  return __AXSMonoAudioEnabled();
}

uint64_t _AXSMonoAudioSetEnabled()
{
  return __AXSMonoAudioSetEnabled();
}

uint64_t _AXSSetLeftRightAudioBalance()
{
  return __AXSSetLeftRightAudioBalance();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

float __exp10f(float a1)
{
  return ___exp10f(a1);
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

void bzero(void *a1, size_t a2)
{
}

void cblas_scopy(const int __N, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

float log10f(float a1)
{
  return _log10f(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void vDSP_biquad(const vDSP_biquad_SetupStruct *__Setup, float *__Delay, const float *__X, vDSP_Stride __IX, float *__Y, vDSP_Stride __IY, vDSP_Length __N)
{
}

vDSP_biquad_Setup vDSP_biquad_CreateSetup(const double *__Coefficients, vDSP_Length __M)
{
  return _vDSP_biquad_CreateSetup(__Coefficients, __M);
}

void vDSP_biquad_DestroySetup(vDSP_biquad_Setup __setup)
{
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return _vDSP_create_fftsetup(__Log2n, __Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

id objc_msgSend_ALSSamples(void *a1, const char *a2, ...)
{
  return [a1 ALSSamples];
}

id objc_msgSend_HIDEventQueue(void *a1, const char *a2, ...)
{
  return [a1 HIDEventQueue];
}

id objc_msgSend_HIDServiceClient(void *a1, const char *a2, ...)
{
  return [a1 HIDServiceClient];
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return [a1 HIDSystemClient];
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return [a1 RSSI];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_accessoryDetectorModelNumbers(void *a1, const char *a2, ...)
{
  return [a1 accessoryDetectorModelNumbers];
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnectDetector];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_airpodsInputs(void *a1, const char *a2, ...)
{
  return [a1 airpodsInputs];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_archiveNameTemplate(void *a1, const char *a2, ...)
{
  return [a1 archiveNameTemplate];
}

id objc_msgSend_audioDataAnalysisSettingsManager(void *a1, const char *a2, ...)
{
  return [a1 audioDataAnalysisSettingsManager];
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return [a1 audioRouteChanged];
}

id objc_msgSend_audioSystemResultClass(void *a1, const char *a2, ...)
{
  return [a1 audioSystemResultClass];
}

id objc_msgSend_audioSystemResults(void *a1, const char *a2, ...)
{
  return [a1 audioSystemResults];
}

id objc_msgSend_audioTest(void *a1, const char *a2, ...)
{
  return [a1 audioTest];
}

id objc_msgSend_audioTestType(void *a1, const char *a2, ...)
{
  return [a1 audioTestType];
}

id objc_msgSend_avAudioDeviceTestClass(void *a1, const char *a2, ...)
{
  return [a1 avAudioDeviceTestClass];
}

id objc_msgSend_avAudioDeviceTestSequenceClass(void *a1, const char *a2, ...)
{
  return [a1 avAudioDeviceTestSequenceClass];
}

id objc_msgSend_averageSampleValue(void *a1, const char *a2, ...)
{
  return [a1 averageSampleValue];
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return [a1 balanceChanged];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calculateCrossCorrelationPeak(void *a1, const char *a2, ...)
{
  return [a1 calculateCrossCorrelationPeak];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_chamberDetector(void *a1, const char *a2, ...)
{
  return [a1 chamberDetector];
}

id objc_msgSend_chamberInputs(void *a1, const char *a2, ...)
{
  return [a1 chamberInputs];
}

id objc_msgSend_chamberReadinessSemaphore(void *a1, const char *a2, ...)
{
  return [a1 chamberReadinessSemaphore];
}

id objc_msgSend_chamberReadySemaphore(void *a1, const char *a2, ...)
{
  return [a1 chamberReadySemaphore];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_checkChamberIsReady(void *a1, const char *a2, ...)
{
  return [a1 checkChamberIsReady];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedResultCount(void *a1, const char *a2, ...)
{
  return [a1 completedResultCount];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crackleBaseFrequency(void *a1, const char *a2, ...)
{
  return [a1 crackleBaseFrequency];
}

id objc_msgSend_crackleFilterCoeffs(void *a1, const char *a2, ...)
{
  return [a1 crackleFilterCoeffs];
}

id objc_msgSend_crackleNeighborDistance(void *a1, const char *a2, ...)
{
  return [a1 crackleNeighborDistance];
}

id objc_msgSend_crackleNumberOfStages(void *a1, const char *a2, ...)
{
  return [a1 crackleNumberOfStages];
}

id objc_msgSend_crackleSamplingRate(void *a1, const char *a2, ...)
{
  return [a1 crackleSamplingRate];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataCroppingLength(void *a1, const char *a2, ...)
{
  return [a1 dataCroppingLength];
}

id objc_msgSend_dataFrontCroppingLength(void *a1, const char *a2, ...)
{
  return [a1 dataFrontCroppingLength];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dbValue(void *a1, const char *a2, ...)
{
  return [a1 dbValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteTemporaryFiles(void *a1, const char *a2, ...)
{
  return [a1 deleteTemporaryFiles];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detectChamberReadyALSThreshold(void *a1, const char *a2, ...)
{
  return [a1 detectChamberReadyALSThreshold];
}

id objc_msgSend_detectChamberReadyWaitTime(void *a1, const char *a2, ...)
{
  return [a1 detectChamberReadyWaitTime];
}

id objc_msgSend_detectChamberSensor(void *a1, const char *a2, ...)
{
  return [a1 detectChamberSensor];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return [a1 diagnosticResponder];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_energyValues(void *a1, const char *a2, ...)
{
  return [a1 energyValues];
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return [a1 eventQueue];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expectations(void *a1, const char *a2, ...)
{
  return [a1 expectations];
}

id objc_msgSend_fileDownloadTimeout(void *a1, const char *a2, ...)
{
  return [a1 fileDownloadTimeout];
}

id objc_msgSend_fileNameToURL(void *a1, const char *a2, ...)
{
  return [a1 fileNameToURL];
}

id objc_msgSend_filterDelay(void *a1, const char *a2, ...)
{
  return [a1 filterDelay];
}

id objc_msgSend_filterSetup(void *a1, const char *a2, ...)
{
  return [a1 filterSetup];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return [a1 floatChannelData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return [a1 frameLength];
}

id objc_msgSend_freeFilter(void *a1, const char *a2, ...)
{
  return [a1 freeFilter];
}

id objc_msgSend_frequencyBins(void *a1, const char *a2, ...)
{
  return [a1 frequencyBins];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return [a1 headphoneDetector];
}

id objc_msgSend_headphoneExposureNotificationsChanged(void *a1, const char *a2, ...)
{
  return [a1 headphoneExposureNotificationsChanged];
}

id objc_msgSend_headphoneExposureNotificationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 headphoneExposureNotificationsEnabled];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_initFilter(void *a1, const char *a2, ...)
{
  return [a1 initFilter];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_inputID(void *a1, const char *a2, ...)
{
  return [a1 inputID];
}

id objc_msgSend_inputNameToValue(void *a1, const char *a2, ...)
{
  return [a1 inputNameToValue];
}

id objc_msgSend_inputValueToName(void *a1, const char *a2, ...)
{
  return [a1 inputValueToName];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerActive];
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerAvailable];
}

id objc_msgSend_isAccessoryDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryDetectorActive];
}

id objc_msgSend_isBalanceChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isBalanceChangeRequired];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDeviceConnectedToAccessory(void *a1, const char *a2, ...)
{
  return [a1 isDeviceConnectedToAccessory];
}

id objc_msgSend_isDeviceWatch(void *a1, const char *a2, ...)
{
  return [a1 isDeviceWatch];
}

id objc_msgSend_isDeviceiPad(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPad];
}

id objc_msgSend_isDeviceiPhone(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPhone];
}

id objc_msgSend_isDeviceiPod(void *a1, const char *a2, ...)
{
  return [a1 isDeviceiPod];
}

id objc_msgSend_isHeadphonesDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isHeadphonesDetectorActive];
}

id objc_msgSend_isMonoChangeRequired(void *a1, const char *a2, ...)
{
  return [a1 isMonoChangeRequired];
}

id objc_msgSend_isMotionDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isMotionDetectorActive];
}

id objc_msgSend_isOrientationDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isOrientationDetectorActive];
}

id objc_msgSend_isOriginallyMono(void *a1, const char *a2, ...)
{
  return [a1 isOriginallyMono];
}

id objc_msgSend_isOtherAudioPlaying(void *a1, const char *a2, ...)
{
  return [a1 isOtherAudioPlaying];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSoundRecognitionRequired(void *a1, const char *a2, ...)
{
  return [a1 isSoundRecognitionRequired];
}

id objc_msgSend_isUsingDBValuesFromSystem(void *a1, const char *a2, ...)
{
  return [a1 isUsingDBValuesFromSystem];
}

id objc_msgSend_isUsingMeasurementMode(void *a1, const char *a2, ...)
{
  return [a1 isUsingMeasurementMode];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_micBufferNumbers(void *a1, const char *a2, ...)
{
  return [a1 micBufferNumbers];
}

id objc_msgSend_minimalALSSampleCount(void *a1, const char *a2, ...)
{
  return [a1 minimalALSSampleCount];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return [a1 modelNumbers];
}

id objc_msgSend_monoChanged(void *a1, const char *a2, ...)
{
  return [a1 monoChanged];
}

id objc_msgSend_mostRecentEvent(void *a1, const char *a2, ...)
{
  return [a1 mostRecentEvent];
}

id objc_msgSend_motionDetector(void *a1, const char *a2, ...)
{
  return [a1 motionDetector];
}

id objc_msgSend_motionDetectorThreshold(void *a1, const char *a2, ...)
{
  return [a1 motionDetectorThreshold];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_mutableAudioBufferList(void *a1, const char *a2, ...)
{
  return [a1 mutableAudioBufferList];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfChannels(void *a1, const char *a2, ...)
{
  return [a1 numberOfChannels];
}

id objc_msgSend_orientationDetector(void *a1, const char *a2, ...)
{
  return [a1 orientationDetector];
}

id objc_msgSend_orientationDetectorXThreshold(void *a1, const char *a2, ...)
{
  return [a1 orientationDetectorXThreshold];
}

id objc_msgSend_orientationDetectorZThreshold(void *a1, const char *a2, ...)
{
  return [a1 orientationDetectorZThreshold];
}

id objc_msgSend_originalBalance(void *a1, const char *a2, ...)
{
  return [a1 originalBalance];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return [a1 outputDevice];
}

id objc_msgSend_outputSpecifications(void *a1, const char *a2, ...)
{
  return [a1 outputSpecifications];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_outputsClass(void *a1, const char *a2, ...)
{
  return [a1 outputsClass];
}

id objc_msgSend_overrideOriginalHeadphoneExposureNotification(void *a1, const char *a2, ...)
{
  return [a1 overrideOriginalHeadphoneExposureNotification];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_previousAudioChanged(void *a1, const char *a2, ...)
{
  return [a1 previousAudioChanged];
}

id objc_msgSend_previousDeviceVolumeAudioVideo(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumeAudioVideo];
}

id objc_msgSend_previousDeviceVolumePlayAndRecord(void *a1, const char *a2, ...)
{
  return [a1 previousDeviceVolumePlayAndRecord];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_rawRecordings(void *a1, const char *a2, ...)
{
  return [a1 rawRecordings];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_releaseALSClient(void *a1, const char *a2, ...)
{
  return [a1 releaseALSClient];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_restoreAccesibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return [a1 restoreAccesibilityStateIfRequired];
}

id objc_msgSend_restoreOriginalHeadphoneExposureNotification(void *a1, const char *a2, ...)
{
  return [a1 restoreOriginalHeadphoneExposureNotification];
}

id objc_msgSend_restoreOriginalVolumes(void *a1, const char *a2, ...)
{
  return [a1 restoreOriginalVolumes];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_saveOriginalVolumes(void *a1, const char *a2, ...)
{
  return [a1 saveOriginalVolumes];
}

id objc_msgSend_saveRawRecording(void *a1, const char *a2, ...)
{
  return [a1 saveRawRecording];
}

id objc_msgSend_scanInterval(void *a1, const char *a2, ...)
{
  return [a1 scanInterval];
}

id objc_msgSend_scanQueue(void *a1, const char *a2, ...)
{
  return [a1 scanQueue];
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return [a1 sensorType];
}

id objc_msgSend_sensors(void *a1, const char *a2, ...)
{
  return [a1 sensors];
}

id objc_msgSend_sequenceTimeout(void *a1, const char *a2, ...)
{
  return [a1 sequenceTimeout];
}

id objc_msgSend_sequences(void *a1, const char *a2, ...)
{
  return [a1 sequences];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setAccessibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityStateIfRequired];
}

id objc_msgSend_setUpEventNotifications(void *a1, const char *a2, ...)
{
  return [a1 setUpEventNotifications];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupALSClient(void *a1, const char *a2, ...)
{
  return [a1 setupALSClient];
}

id objc_msgSend_setupHIDSystemClient(void *a1, const char *a2, ...)
{
  return [a1 setupHIDSystemClient];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionEnabled];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionState];
}

id objc_msgSend_soundRecognitionChanged(void *a1, const char *a2, ...)
{
  return [a1 soundRecognitionChanged];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return [a1 sources];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return [a1 started];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stimulusCroppingLength(void *a1, const char *a2, ...)
{
  return [a1 stimulusCroppingLength];
}

id objc_msgSend_stimulusFrontCroppingLength(void *a1, const char *a2, ...)
{
  return [a1 stimulusFrontCroppingLength];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopAccelerometerUpdates];
}

id objc_msgSend_stopAlerts(void *a1, const char *a2, ...)
{
  return [a1 stopAlerts];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_systemSoundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 systemSoundDetectionState];
}

id objc_msgSend_testCompleteAlertTime(void *a1, const char *a2, ...)
{
  return [a1 testCompleteAlertTime];
}

id objc_msgSend_testCompleteChimeAlertEnabled(void *a1, const char *a2, ...)
{
  return [a1 testCompleteChimeAlertEnabled];
}

id objc_msgSend_testCompleteVibrationAlertEnabled(void *a1, const char *a2, ...)
{
  return [a1 testCompleteVibrationAlertEnabled];
}

id objc_msgSend_testCompletionSemaphore(void *a1, const char *a2, ...)
{
  return [a1 testCompletionSemaphore];
}

id objc_msgSend_testEndedSemaphore(void *a1, const char *a2, ...)
{
  return [a1 testEndedSemaphore];
}

id objc_msgSend_testFailed(void *a1, const char *a2, ...)
{
  return [a1 testFailed];
}

id objc_msgSend_testFinishedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 testFinishedSuccessfully];
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return [a1 testID];
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return [a1 threshold];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_tmpdir(void *a1, const char *a2, ...)
{
  return [a1 tmpdir];
}

id objc_msgSend_unpairAirPodsOnFinish(void *a1, const char *a2, ...)
{
  return [a1 unpairAirPodsOnFinish];
}

id objc_msgSend_unpairSessionAccessoryOnTestCompletion(void *a1, const char *a2, ...)
{
  return [a1 unpairSessionAccessoryOnTestCompletion];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_useBundledAudioStimulus(void *a1, const char *a2, ...)
{
  return [a1 useBundledAudioStimulus];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validOutputDeviceSet(void *a1, const char *a2, ...)
{
  return [a1 validOutputDeviceSet];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_writeCurrentResultsToJson(void *a1, const char *a2, ...)
{
  return [a1 writeCurrentResultsToJson];
}

id objc_msgSend_xCorrCenter(void *a1, const char *a2, ...)
{
  return [a1 xCorrCenter];
}

id objc_msgSend_xCorrPNR(void *a1, const char *a2, ...)
{
  return [a1 xCorrPNR];
}

id objc_msgSend_xCorrPeak(void *a1, const char *a2, ...)
{
  return [a1 xCorrPeak];
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return [a1 xThreshold];
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return [a1 zThreshold];
}