void sub_100003EDC()
{
  HRTFEnrollmentLogInit(1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100006314(int a1, void *a2)
{
}

void sub_10000631C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  if (a2) {
    sub_10000AEB0();
  }
  for (uint64_t i = a4; i; --i)
  {
    v7 = *a5++;
    free(v7);
  }
}

void HRTFEnrollmentLogInit(int a1)
{
  if (a1) {
    v1 = "Service";
  }
  else {
    v1 = "Framework";
  }
  os_log_t v2 = os_log_create("com.apple.HRTFEnrollment", v1);
  v3 = (void *)HRTFEnrollmentLog;
  HRTFEnrollmentLog = (uint64_t)v2;

  v4 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "logging initialized", v5, 2u);
  }
}

id sub_1000070CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000071B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  os_log_t v2 = *(void **)(v1 + 24);
  if (v2)
  {
    *(void *)(v1 + 24) = 0;

    uint64_t v1 = *(void *)(a1 + 32);
  }
  v4 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_100007E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100007EC8(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007EDC(uint64_t a1)
{
}

void sub_100007EE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HRTFEnrollmentAssetDownloadProgress alloc];
  id v5 = [v3 totalExpected];
  id v6 = [v3 totalWritten];
  id v7 = [v3 isStalled];
  [v3 expectedTimeRemaining];
  double v9 = v8;

  v11 = [(HRTFEnrollmentAssetDownloadProgress *)v4 initWithTotalBytes:v5 downloadedBytes:v6 isStalled:v7 estimatedRemainingTime:v9];
  v10 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v10 assetDownloadSessionProgressUpdate:v11];
}

void sub_100007FC8(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007FDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  os_log_t v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

void sub_1000080AC(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  id v4 = 0;
  [v2 _checkForAssetExistence:*(unsigned int *)(a1 + 48) assetURL:0 error:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000821C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000822C(uint64_t a1)
{
}

void sub_100008234(uint64_t a1)
{
}

void sub_100008410(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  if (v2[2] && v2[3])
  {
    id v5 = [v2 connection];
    id v3 = [v5 remoteObjectProxy];
    LODWORD(v4) = *(_DWORD *)(a1 + 72);
    [v3 updateState:*(void *)(a1 + 64) withProgress:*(void *)(a1 + 40) facePoseStatus:*(void *)(a1 + 48) earPoseStatus:*(void *)(a1 + 56) errorStatus:v4];
  }
}

void sub_100008524(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  if (v2[2] && v2[3])
  {
    id v4 = [v2 connection];
    id v3 = [v4 remoteObjectProxy];
    [v3 updateResultSize:*(void *)(a1 + 40)];
  }
}

void sub_100008E3C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HRTFEnrollmentService] Initializing Visage session.\n", buf, 2u);
  }
  id v6 = objc_opt_new();
  [v6 setWriteDebugData:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 setDelegate:WeakRetained];

  [v6 setVersion:0];
  [v6 setDebugDataRootPath:0];
  [v6 setModelsRootPath:0];
  if (_os_feature_enabled_impl())
  {
    double v8 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = *(const __CFString **)(*(void *)(a1 + 32) + 112);
      if (!v9) {
        CFStringRef v9 = @"nil";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initializing Visage session with sessionConfig.modelsRootPath %@ .\n", buf, 0xCu);
    }
    [v6 setModelsRootPath:*(void *)(*(void *)(a1 + 32) + 112)];
  }
  id v21 = 0;
  id v10 = [objc_alloc((Class)VGHRTFSession) initWithConfig:v6 error:&v21];
  id v11 = v21;
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v10;

  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    v14 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[HRTFEnrollmentService] Failed to initialize Visage session\n", buf, 2u);
    }
  }
  if (v11)
  {
    id v15 = v11;
    v16 = (void *)HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
      sub_10000B18C(v16, v15);
    }
    v17 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v17 sessionStarted:0 error:v15];
  }
  else
  {
    v18 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[HRTFEnrollmentService] session started\n", buf, 2u);
    }
    v19 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v19 sessionStarted:1 error:0];

    uint64_t v20 = *(void *)(a1 + 32);
    id v15 = *(id *)(v20 + 56);
    *(void *)(v20 + 56) = 0;
  }
}

void sub_100009178(id a1)
{
  uint64_t v1 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "session terminated", v2, 2u);
  }
}

void sub_100009278(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[3];
  if (v3)
  {
    v2[3] = 0;

    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v4 = v2[4];
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;

    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v7 = v2[5];
  if (v7)
  {
    (*(void (**)(uint64_t, void, void, void))(v7 + 16))(v7, 0, 0, 0);
    uint64_t v8 = *(void *)(a1 + 32);
    CFStringRef v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    id v2 = *(void **)(a1 + 32);
  }
  uint64_t v10 = v2[6];
  if (v10)
  {
    (*(void (**)(uint64_t, void, void, void, void))(v10 + 16))(v10, 0, 0, 0, 0);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = 0;
  }
}

void sub_100009428(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v2 = [*(id *)(a1 + 40) distortionLookupTable];

    uint64_t v3 = objc_opt_new();
    [v3 setLensDistortionLut:v2];
    [*(id *)(a1 + 40) depthIntrinsics];
    objc_msgSend(v3, "setIntrinsicMatrix:");
    [*(id *)(a1 + 40) referenceDimensions];
    float64_t v28 = v4;
    [*(id *)(a1 + 40) referenceDimensions];
    v5.f64[0] = v28;
    v5.f64[1] = v6;
    [v3 setIntrinsicMatrixReferenceDimension:COERCE_DOUBLE(vcvt_f32_f64(v5))];
    [*(id *)(a1 + 40) distortionCenter];
    float64_t v29 = v7;
    [*(id *)(a1 + 40) distortionCenter];
    v8.f64[0] = v29;
    v8.f64[1] = v9;
    [v3 setLensDistortionCenter:COERCE_DOUBLE(vcvt_f32_f64(v8))];
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [*(id *)(a1 + 40) colorSurface];
    [v10 setColorBuffer:v11];

    [*(id *)(a1 + 40) colorIntrinsics];
    objc_msgSend(v10, "setColorIntrinsics:");
    uint64_t v12 = [*(id *)(a1 + 40) depthSurface];
    [v10 setDepthBuffer:v12];

    [v10 setDepthCalibrationData:v3];
    [*(id *)(a1 + 40) timestamp];
    objc_msgSend(v10, "setTimestamp:");
    v13 = *(void **)(a1 + 48);
    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      [v13 bounds];
      v14[10] = v15;
      v14[11] = v16;
      v14[12] = v17;
      v14[13] = v18;
      v19 = objc_opt_new();
      [*(id *)(a1 + 48) bounds];
      objc_msgSend(v19, "setBoundingBox:");
      id v20 = objc_alloc((Class)NSNumber);
      [*(id *)(a1 + 48) yawAngle];
      id v21 = objc_msgSend(v20, "initWithDouble:");
      [v19 setYawAngle:v21];

      id v22 = objc_alloc((Class)NSNumber);
      [*(id *)(a1 + 48) rollAngle];
      id v23 = objc_msgSend(v22, "initWithDouble:");
      [v19 setRollAngle:v23];

      objc_msgSend(v19, "setTrackedId:", objc_msgSend(*(id *)(a1 + 48), "faceID"));
    }
    else
    {
      v19 = 0;
    }
    v24 = *(void **)(*(void *)(a1 + 32) + 24);
    id v30 = 0;
    [v24 processCaptureData:v10 faceData:v19 userData:0 error:&v30];
    id v25 = v30;
    [*(id *)(*(void *)(a1 + 32) + 24) waitWithError:0];
    if (v25)
    {
      id v26 = v25;
      v27 = (void *)HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR)) {
        sub_10000B234(v27, v26);
      }
    }
  }
}

void sub_100009760(void *a1)
{
  id v2 = *(void **)(a1[4] + 56);
  if (v2)
  {
    uint64_t v3 = (char *)a1[6];
    unint64_t v4 = a1[7];
    if (v4 >= (unint64_t)[v2 length])
    {
      uint64_t v3 = 0;
    }
    else if (v3 > (char *)[*(id *)(a1[4] + 56) length] - a1[7])
    {
      uint64_t v3 = (char *)[*(id *)(a1[4] + 56) length] - a1[7];
    }
    id v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", (char *)objc_msgSend(*(id *)(a1[4] + 56), "bytes") + a1[7], v3);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void sub_100009DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 240), 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100009E1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  double v7 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 134217984;
    uint64_t v38 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Download completed for HRTF asset with status: %zu", (uint8_t *)&v37, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  if (a2 > 50)
  {
    if (a2 == 51)
    {
      uint64_t v8 = 4;
      goto LABEL_13;
    }
    if (a2 == 65)
    {
      uint64_t v8 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (a2 == 37)
    {
      uint64_t v8 = 3;
      goto LABEL_13;
    }
    if (a2 == 48)
    {
      uint64_t v8 = 2;
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
LABEL_13:
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v9)
  {
    if (v9 != 10)
    {
      v24 = (void *)HRTFEnrollmentLog;
      if (!os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      id v25 = *(void **)(a1 + 32);
      id v26 = v24;
      v27 = [v25 assetId];
      CFStringRef v28 = *(const __CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v37 = 138412546;
      uint64_t v38 = (uint64_t)v27;
      __int16 v39 = 2048;
      CFStringRef v40 = v28;
      float64_t v29 = "Downloading of HRTF asset failed for asset id %@ with result: %zu";
      id v30 = v26;
      uint32_t v31 = 22;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v37, v31);

      goto LABEL_34;
    }
    uint64_t v10 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HRTF asset already installed", (uint8_t *)&v37, 2u);
    }
  }
  unsigned __int8 v11 = [*(id *)(a1 + 32) refreshState];
  uint64_t v12 = (void *)HRTFEnrollmentLog;
  BOOL v13 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (!v13) {
      goto LABEL_34;
    }
    v32 = *(void **)(a1 + 32);
    id v26 = v12;
    v27 = [v32 assetId];
    int v37 = 138412290;
    uint64_t v38 = (uint64_t)v27;
    float64_t v29 = "Failed to refresh state for asset id: %@";
    id v30 = v26;
    uint32_t v31 = 12;
    goto LABEL_26;
  }
  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    uint64_t v15 = v12;
    uint64_t v16 = [v14 assetId];
    uint64_t v17 = [*(id *)(a1 + 32) getLocalFileUrl];
    uint64_t v18 = [v17 path];
    int v37 = 138412546;
    uint64_t v38 = (uint64_t)v16;
    __int16 v39 = 2112;
    CFStringRef v40 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Download of HRTF asset with id: %@ successful, at download path: %@", (uint8_t *)&v37, 0x16u);
  }
  v19 = [*(id *)(a1 + 32) getLocalFileUrl];
  uint64_t v20 = [v19 path];
  uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  }
  else
  {
    id v23 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 112), v23);
  v33 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    CFStringRef v35 = *(const __CFString **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v35) {
      CFStringRef v35 = @"nil";
    }
    int v37 = 138412546;
    uint64_t v38 = v34;
    __int16 v39 = 2112;
    CFStringRef v40 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "downloadAsset succeeded path %@ error %@", (uint8_t *)&v37, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
  if (*(void *)(a1 + 112) == 1) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
LABEL_34:
  uint64_t v36 = *(void *)(a1 + 56);
  if (v36) {
    (*(void (**)(uint64_t, void, void, void, void))(v36 + 16))(v36, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  }
}

void sub_10000A7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10000A810(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  double v7 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 134217984;
    int v37 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Download completed for HRTF asset with status: %zu", (uint8_t *)&v36, 0xCu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8)
  {
    if (v8 != 10)
    {
      id v23 = (void *)HRTFEnrollmentLog;
      if (!os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      v24 = *(void **)(a1 + 32);
      id v25 = v23;
      id v26 = [v24 assetId];
      CFStringRef v27 = *(const __CFString **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v36 = 138412546;
      int v37 = v26;
      __int16 v38 = 2048;
      CFStringRef v39 = v27;
      CFStringRef v28 = "Downloading of HRTF asset failed for asset id %@ with result: %zu";
      float64_t v29 = v25;
      uint32_t v30 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v36, v30);

      goto LABEL_24;
    }
    uint64_t v9 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HRTF asset already installed", (uint8_t *)&v36, 2u);
    }
  }
  unsigned __int8 v10 = [*(id *)(a1 + 32) refreshState];
  unsigned __int8 v11 = (void *)HRTFEnrollmentLog;
  BOOL v12 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) == 0)
  {
    if (!v12) {
      goto LABEL_24;
    }
    uint32_t v31 = *(void **)(a1 + 32);
    id v25 = v11;
    id v26 = [v31 assetId];
    int v36 = 138412290;
    int v37 = v26;
    CFStringRef v28 = "Failed to refresh state for asset id: %@";
    float64_t v29 = v25;
    uint32_t v30 = 12;
    goto LABEL_16;
  }
  if (v12)
  {
    BOOL v13 = *(void **)(a1 + 32);
    v14 = v11;
    uint64_t v15 = [v13 assetId];
    uint64_t v16 = [*(id *)(a1 + 32) getLocalFileUrl];
    uint64_t v17 = [v16 path];
    int v36 = 138412546;
    int v37 = v15;
    __int16 v38 = 2112;
    CFStringRef v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Download of HRTF asset with id: %@ successful, at download path: %@", (uint8_t *)&v36, 0x16u);
  }
  uint64_t v18 = [*(id *)(a1 + 32) getLocalFileUrl];
  uint64_t v19 = [v18 path];
  uint64_t v20 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  }
  else
  {
    id v22 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 112), v22);
  v32 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    CFStringRef v34 = *(const __CFString **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (!v34) {
      CFStringRef v34 = @"nil";
    }
    int v36 = 138412546;
    int v37 = v33;
    __int16 v38 = 2112;
    CFStringRef v39 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "downloadAsset succeeded path %@ error %@", (uint8_t *)&v36, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  if (*(void *)(a1 + 104) == 1) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
LABEL_24:
  uint64_t v35 = *(void *)(a1 + 56);
  if (v35) {
    (*(void (**)(uint64_t, void, void, void))(v35 + 16))(v35, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
}

void sub_10000AD28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000AD50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000AD68()
{
  __assert_rtn("-[ServiceDelegate listener:shouldAcceptNewConnection:]", "main.m", 26, "newConnection.remoteObjectProxy != nil");
}

void sub_10000AD94()
{
  __assert_rtn("-[HRTFSerializableFaceData initWithCoder:]", "HRTFSerializableFaceData.m", 62, "data.length == sizeof(CGRect)");
}

void sub_10000ADC0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to create CVPixelBuffer: %d", (uint8_t *)v2, 8u);
}

void sub_10000AE38(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to create planar CVPixelBuffer: %d", (uint8_t *)v2, 8u);
}

void sub_10000AEB0()
{
  __assert_rtn("__planarDeallocateHelper", "HRTFSerializableCaptureData.m", 21, "dataPtr == NULL");
}

void sub_10000AEDC()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 323, "data.length == sizeof(CGPoint)");
}

void sub_10000AF08()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 319, "data.length == sizeof(CGSize)");
}

void sub_10000AF34()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 313, "data.length == sizeof(simd_float3x3)");
}

void sub_10000AF60()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 309, "data.length == sizeof(simd_float3x3)");
}

void sub_10000AF8C()
{
  sub_10000AD44();
  sub_10000AD28((void *)&_mh_execute_header, v0, v1, "No asset found in the catalog", v2, v3, v4, v5, v6);
}

void sub_10000AFC0()
{
  sub_10000AD44();
  sub_10000AD28((void *)&_mh_execute_header, v0, v1, "No compatible version found in the catalog", v2, v3, v4, v5, v6);
}

void sub_10000AFF4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_10000AD50((void *)&_mh_execute_header, a2, a3, "asset download failed: %lu", (uint8_t *)&v4);
}

void sub_10000B06C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_10000AD50((void *)&_mh_execute_header, a2, a3, "Catalog download failed: %lu", (uint8_t *)&v4);
}

void sub_10000B0E4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_10000AD50((void *)&_mh_execute_header, a3, (uint64_t)a3, "Query failed: %lu", (uint8_t *)a1);
}

void sub_10000B124()
{
  sub_10000AD44();
  sub_10000AD28((void *)&_mh_execute_header, v0, v1, "ML asset does not exist", v2, v3, v4, v5, v6);
}

void sub_10000B158()
{
  sub_10000AD44();
  sub_10000AD28((void *)&_mh_execute_header, v0, v1, "failed to retreive audio profile.", v2, v3, v4, v5, v6);
}

void sub_10000B18C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 description];
  int v6 = 136315138;
  id v7 = [v4 UTF8String];
  sub_10000AD50((void *)&_mh_execute_header, v3, v5, "failed to create Visage session: %s", (uint8_t *)&v6);
}

void sub_10000B234(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 description];
  int v6 = 136315138;
  id v7 = [v4 UTF8String];
  sub_10000AD50((void *)&_mh_execute_header, v3, v5, "error in HRTF processing: %s", (uint8_t *)&v6);
}

void sub_10000B2DC()
{
  sub_10000AD44();
  sub_10000AD28((void *)&_mh_execute_header, v0, v1, "No asset provided for downloading", v2, v3, v4, v5, v6);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return _CVBufferRetain(buffer);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreateWithBytes(allocator, width, height, pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithPlanarBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *dataPtr, size_t dataSize, size_t numberOfPlanes, void **planeBaseAddress, size_t *planeWidth, size_t *planeHeight, size_t *planeBytesPerRow, CVPixelBufferReleasePlanarBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreateWithPlanarBytes(allocator, width, height, pixelFormatType, dataPtr, dataSize, numberOfPlanes, planeBaseAddress, planeWidth, planeHeight, planeBytesPerRow, releaseCallback, releaseRefCon, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetDataSize(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPlaneCount(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return [a1 angle];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return [a1 boundingBox];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_captureUpdateData(void *a1, const char *a2, ...)
{
  return [a1 captureUpdateData];
}

id objc_msgSend_captured(void *a1, const char *a2, ...)
{
  return [a1 captured];
}

id objc_msgSend_colorIntrinsics(void *a1, const char *a2, ...)
{
  return [a1 colorIntrinsics];
}

id objc_msgSend_colorSurface(void *a1, const char *a2, ...)
{
  return [a1 colorSurface];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return [a1 components];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_depthIntrinsics(void *a1, const char *a2, ...)
{
  return [a1 depthIntrinsics];
}

id objc_msgSend_depthSurface(void *a1, const char *a2, ...)
{
  return [a1 depthSurface];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detectionData(void *a1, const char *a2, ...)
{
  return [a1 detectionData];
}

id objc_msgSend_distortionCenter(void *a1, const char *a2, ...)
{
  return [a1 distortionCenter];
}

id objc_msgSend_distortionLookupTable(void *a1, const char *a2, ...)
{
  return [a1 distortionLookupTable];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_earCaptureUpdateData(void *a1, const char *a2, ...)
{
  return [a1 earCaptureUpdateData];
}

id objc_msgSend_earSide(void *a1, const char *a2, ...)
{
  return [a1 earSide];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 expectedTimeRemaining];
}

id objc_msgSend_faceCaptureUpdateData(void *a1, const char *a2, ...)
{
  return [a1 faceCaptureUpdateData];
}

id objc_msgSend_faceID(void *a1, const char *a2, ...)
{
  return [a1 faceID];
}

id objc_msgSend_getAssetDownloadOptions(void *a1, const char *a2, ...)
{
  return [a1 getAssetDownloadOptions];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_hasRollAngle(void *a1, const char *a2, ...)
{
  return [a1 hasRollAngle];
}

id objc_msgSend_hasYawAngle(void *a1, const char *a2, ...)
{
  return [a1 hasYawAngle];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_leftEarStatusList(void *a1, const char *a2, ...)
{
  return [a1 leftEarStatusList];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pitchAngle(void *a1, const char *a2, ...)
{
  return [a1 pitchAngle];
}

id objc_msgSend_poseStatusList(void *a1, const char *a2, ...)
{
  return [a1 poseStatusList];
}

id objc_msgSend_postProcessUpdateData(void *a1, const char *a2, ...)
{
  return [a1 postProcessUpdateData];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_referenceDimensions(void *a1, const char *a2, ...)
{
  return [a1 referenceDimensions];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestedVersion(void *a1, const char *a2, ...)
{
  return [a1 requestedVersion];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultCode(void *a1, const char *a2, ...)
{
  return [a1 resultCode];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightEarStatusList(void *a1, const char *a2, ...)
{
  return [a1 rightEarStatusList];
}

id objc_msgSend_rollAngle(void *a1, const char *a2, ...)
{
  return [a1 rollAngle];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_trackedData(void *a1, const char *a2, ...)
{
  return [a1 trackedData];
}

id objc_msgSend_wasLocal(void *a1, const char *a2, ...)
{
  return [a1 wasLocal];
}

id objc_msgSend_yawAngle(void *a1, const char *a2, ...)
{
  return [a1 yawAngle];
}