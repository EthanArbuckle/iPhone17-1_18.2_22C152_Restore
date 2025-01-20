uint64_t SCIsAnalyticsEnabled()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  long long *v17;
  long long v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x263EF8340];
  *(void *)&v18 = 0;
  *((void *)&v18 + 1) = &v18;
  v19 = 0x2050000000;
  v0 = (void *)getSTCommunicationClientClass_softClass;
  v20 = getSTCommunicationClientClass_softClass;
  if (!getSTCommunicationClientClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    v14 = 3221225472;
    v15 = __getSTCommunicationClientClass_block_invoke;
    v16 = &unk_2651CA710;
    v17 = &v18;
    __getSTCommunicationClientClass_block_invoke((uint64_t)buf);
    v0 = *(void **)(*((void *)&v18 + 1) + 24);
  }
  v1 = v0;
  _Block_object_dispose(&v18, 8);
  v2 = objc_alloc_init(v1);
  v12 = 0;
  v3 = [v2 currentConfigurationWithError:&v12];
  v4 = v12;
  if (v3)
  {
    v5 = [v3 isCommunicationSafetyAnalyticsEnabled];

    if (v5) {
      return 1;
    }
  }
  else
  {
    if (v4)
    {
      v7 = +[SCLog client];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        SCIsAnalyticsEnabled_cold_1((uint64_t)v4, v7);
      }
    }
    else
    {
      v7 = +[SCLog client];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2451C6000, v7, OS_LOG_TYPE_DEFAULT, "Unavailable CommSafety configuration from ScreenTime", buf, 2u);
      }
    }
  }
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.communicationSafetySettings"];
  v9 = v8;
  if (v8)
  {
    v6 = [v8 BOOLForKey:@"analyticsEnabled"];
  }
  else
  {
    v10 = +[SCLog client];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18) = 138412290;
      *(void *)((char *)&v18 + 4) = @"com.apple.communicationSafetySettings";
      _os_log_impl(&dword_2451C6000, v10, OS_LOG_TYPE_DEFAULT, "Unable to access user preferences domain %@", (uint8_t *)&v18, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

void sub_2451C8CEC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    v18 = +[SCLog client];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_2451C6000, v18, OS_LOG_TYPE_DEFAULT, "Exception fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x2451C8C1CLL);
  }
  _Unwind_Resume(a1);
}

Class __getSTCommunicationClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __ScreenTimeCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2651CA730;
    uint64_t v6 = 0;
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("STCommunicationClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSTCommunicationClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSTCommunicationClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenTimeCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2451C9A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_2451CA9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CACB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_2451CB020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CB37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CB6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CBAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CBE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CC25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CC870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2451CC948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMADServiceClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  Class result = objc_getClass("MADService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMADServiceClass_block_invoke_cold_1();
  }
  getMADServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void MediaAnalysisServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2651CA920;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMADImageSafetyClassificationRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  Class result = objc_getClass("MADImageSafetyClassificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1();
  }
  getMADImageSafetyClassificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMADVideoSafetyClassificationRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  Class result = objc_getClass("MADVideoSafetyClassificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1();
  }
  getMADVideoSafetyClassificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

int SCError(void)
{
  uint64_t v2 = v0;
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263F087E8];
  id v4 = v1;
  id v5 = [v3 alloc];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  uint64_t v7 = (void *)[v5 initWithDomain:@"com.apple.SensitiveContentAnalysis" code:v2 userInfo:v6];

  return (int)v7;
}

id SCErrorCausedBy(uint64_t a1, void *a2, void *a3)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x263F087E8];
    id v7 = a2;
    id v8 = [v6 alloc];
    uint64_t v9 = *MEMORY[0x263F08608];
    v14[0] = *MEMORY[0x263F08320];
    v14[1] = v9;
    v15[0] = v7;
    v15[1] = v5;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    v11 = (void *)[v8 initWithDomain:@"com.apple.SensitiveContentAnalysis" code:a1 userInfo:v10];
  }
  else
  {
    id v12 = a2;
    v11 = SCError();
  }

  return v11;
}

id SCSensitivityAnalyzer.VideoAnalysisHandler.progress.getter()
{
  swift_beginAccess();
  v1 = *(void **)(v0 + 16);

  return v1;
}

void SCSensitivityAnalyzer.VideoAnalysisHandler.progress.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;
}

uint64_t (*SCSensitivityAnalyzer.VideoAnalysisHandler.progress.modify())()
{
  return j__swift_endAccess;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.hasSensitiveContent()()
{
  *(void *)(v1 + 136) = v0;
  return MEMORY[0x270FA2498](sub_2451CD50C, 0, 0);
}

uint64_t sub_2451CD50C()
{
  uint64_t v1 = v0[17];
  id v7 = *(id *)(v1 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer);
  uint64_t v2 = sub_2451DB4F0();
  v0[18] = v2;
  v0[14] = sub_2451CD8B4;
  v0[15] = v1;
  uint64_t v3 = MEMORY[0x263EF8330];
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 1107296256;
  v0[12] = sub_2451CD944;
  v0[13] = &block_descriptor;
  id v4 = _Block_copy(v0 + 10);
  v0[19] = v4;
  swift_retain();
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_2451CD6B8;
  uint64_t v5 = swift_continuation_init();
  v0[10] = v3;
  v0[11] = 0x40000000;
  v0[12] = sub_2451CD9B0;
  v0[13] = &block_descriptor_1;
  v0[14] = v5;
  objc_msgSend(v7, sel_analyzeVideoFile_progressHandler_completionHandler_, v2, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2451CD6B8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_2451CD838;
  }
  else {
    uint64_t v2 = sub_2451CD7C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451CD7C8()
{
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 128);
  _Block_release(*(const void **)(v0 + 152));

  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_2451CD838()
{
  uint64_t v1 = (const void *)v0[19];
  uint64_t v2 = (void *)v0[18];
  swift_willThrow();
  _Block_release(v1);

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

id sub_2451CD8B4(double a1)
{
  id result = (id)swift_beginAccess();
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18) {
    return objc_msgSend(*(id *)(v1 + 16), sel_setCompletedUnitCount_, (uint64_t)a1);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2451CD944(uint64_t a1, double a2)
{
  uint64_t v3 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = swift_retain();
  v3(v4, a2);

  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2451CD9B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC710);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_2451CDA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  uint64_t v7 = v6 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  uint64_t v8 = sub_2451DB500();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a3, v8);
  *(void *)(v6 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer) = a2;
  return v6;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  uint64_t v2 = sub_2451DB500();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer));
  return v0;
}

uint64_t SCSensitivityAnalyzer.VideoAnalysisHandler.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL;
  uint64_t v2 = sub_2451DB500();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)((char *)v0
                     + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer));
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t SCSensitivityAnalyzer.videoAnalysis(forFileAt:)(uint64_t a1)
{
  uint64_t v3 = sub_2451DB500();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_progressWithTotalUnitCount_, 100);
  objc_msgSend(v7, sel_setCompletedUnitCount_, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v8 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_fileURL, v6, v3);
  *(void *)(v8 + OBJC_IVAR____TtCE24SensitiveContentAnalysisCSo21SCSensitivityAnalyzer20VideoAnalysisHandler_analyzer) = v1;
  id v9 = v1;
  return v8;
}

uint64_t type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler()
{
  uint64_t result = qword_268ECCC10;
  if (!qword_268ECCC10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2451CDDE8()
{
  return type metadata accessor for SCSensitivityAnalyzer.VideoAnalysisHandler();
}

uint64_t sub_2451CDDF0()
{
  uint64_t result = sub_2451DB500();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SCSensitivityAnalyzer.VideoAnalysisHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SCSensitivityAnalyzer.VideoAnalysisHandler);
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

uint64_t SensitiveContentPolicy.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t SensitiveContentPolicy.rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*SensitiveContentPolicy.rawValue.modify())()
{
  return nullsub_1;
}

SensitiveContentAnalysis::SensitiveContentPolicy __swiftcall SensitiveContentPolicy.init(rawValue:)(SensitiveContentAnalysis::SensitiveContentPolicy rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t sub_2451CDF28@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

void *sub_2451CDF80()
{
  return &unk_2451DC948;
}

void static SensitiveContentPolicy.obscureSensitiveMedia.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static SensitiveContentPolicy.presentInterventions.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static SensitiveContentPolicy.requireScreenTimePasscodeToViewMedia.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void sub_2451CDFB0()
{
  byte_268ECCC28 = 1;
}

void sub_2451CDFC0()
{
  byte_268ECCC38 = 1;
}

void sub_2451CDFD0()
{
  byte_268ECCC48 = 1;
}

void *sub_2451CDFE0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2451CDFEC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2451CDFF4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2451CE008@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2451CE01C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2451CE030(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2451CE060@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2451CE08C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2451CE0B0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2451CE0C4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2451CE0D8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2451CE0EC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2451CE100(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2451CE114(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2451CE128(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2451CE13C()
{
  return *v0 == 0;
}

uint64_t sub_2451CE14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2451CE164(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_2451CE178@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2451CE188(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2451CE194(void *a1, void *a2)
{
  return *a1 == *a2;
}

void static SensitiveContentPolicy.prefetch()()
{
  if (qword_268ECCC50 != -1) {
    swift_once();
  }
  PolicyCache.prefetch()();
}

Swift::Void __swiftcall PolicyCache.prefetch()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2451DB6E0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_2451D15D8((uint64_t)v3);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_2451DB6D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2451DB690();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268ECC720;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
}

uint64_t static SensitiveContentPolicy.prefetch()()
{
  return MEMORY[0x270FA2498](sub_2451CE45C, 0, 0);
}

uint64_t sub_2451CE45C()
{
  if (qword_268ECCC50 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268ECCC58;
  *(void *)(v0 + 72) = qword_268ECCC58;
  return MEMORY[0x270FA2498](sub_2451CE4F4, v1, 0);
}

uint64_t sub_2451CE4F4()
{
  PolicyCache.changes(for:)(0, 0, v0 + 2);
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = (uint64_t)v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2451CE5E8;
  return MEMORY[0x270FA20A0](v0 + 7, &unk_268ECC740, 0, v1, v2);
}

uint64_t sub_2451CE5E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v4 = sub_2451CE778;
  }
  else {
    uint64_t v4 = sub_2451CE714;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451CE714()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451CE778()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PolicyCache.prefetch()()
{
  *(void *)(v1 + 72) = v0;
  return MEMORY[0x270FA2498](sub_2451CE4F4, v0, 0);
}

uint64_t SensitiveContentPolicy.description.getter()
{
  unint64_t v1 = 0xD000000000000019;
  uint64_t v2 = *v0;
  if (v2 != 1)
  {
    if (qword_268ECCC30 != -1) {
      swift_once();
    }
    uint64_t v3 = 3;
    if (!byte_268ECCC38) {
      uint64_t v3 = 0;
    }
    if (v3 == v2)
    {
      return 0xD00000000000001ELL;
    }
    else
    {
      if (qword_268ECCC40 != -1) {
        swift_once();
      }
      uint64_t v4 = 7;
      if (!byte_268ECCC48) {
        uint64_t v4 = 0;
      }
      if (v4 == v2)
      {
        return 0xD00000000000001FLL;
      }
      else if (v2)
      {
        sub_2451DB8E0();
        sub_2451DB660();
        swift_bridgeObjectRelease();
        return 0x3A6E776F6E6B6E55;
      }
      else
      {
        return 0x64656C6261736944;
      }
    }
  }
  return v1;
}

BOOL static SensitiveContentPolicy.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SensitiveContentPolicy.Error.hash(into:)()
{
  return sub_2451DB970();
}

uint64_t SensitiveContentPolicy.Error.hashValue.getter()
{
  return sub_2451DB980();
}

BOOL sub_2451CE9FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2451CEA10()
{
  return sub_2451DB980();
}

uint64_t sub_2451CEA58()
{
  return sub_2451DB970();
}

uint64_t sub_2451CEA84()
{
  return sub_2451DB980();
}

uint64_t sub_2451CEAD8()
{
  type metadata accessor for PolicyCache();
  uint64_t v0 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC7A8);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 28) = 0;
  *(void *)(result + 16) = 0;
  *(unsigned char *)(result + 24) = 1;
  v0[14] = result;
  v0[15] = 0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[16] = 0;
  v0[17] = v2;
  v0[18] = 0;
  v0[19] = sub_2451D0428;
  v0[20] = 0;
  qword_268ECCC58 = (uint64_t)v0;
  return result;
}

uint64_t PolicyCache.__allocating_init(policyChangesSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  PolicyCache.init(policyChangesSource:)(a1, a2);
  return v4;
}

uint64_t static SensitiveContentPolicy.changes(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  MEMORY[0x270FA5388](v4 - 8);
  v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC750);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  v14 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v23 - v15;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F680], v6);
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC760);
  a3[4] = sub_2451D27BC(&qword_268ECC768, &qword_268ECC760);
  __swift_allocate_boxed_opaque_existential_1(a3);
  sub_2451DB730();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v17 = sub_2451DB6E0();
  uint64_t v18 = (uint64_t)v24;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v24, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  uint64_t v21 = v26;
  *((void *)v20 + 4) = v25;
  *((void *)v20 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[v19], v14, v10);
  swift_bridgeObjectRetain();
  sub_2451CFDEC(v18, (uint64_t)&unk_268ECC778, (uint64_t)v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t sub_2451CEEF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC780);
  v6[21] = v7;
  v6[22] = *(void *)(v7 - 8);
  v6[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451CEFC0, 0, 0);
}

uint64_t sub_2451CEFC0()
{
  if (qword_268ECCC50 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268ECCC58;
  *(void *)(v0 + 192) = qword_268ECCC58;
  return MEMORY[0x270FA2498](sub_2451CF058, v1, 0);
}

uint64_t sub_2451CF058()
{
  PolicyCache.changes(for:)(v0[18], v0[19], v0 + 7);
  return MEMORY[0x270FA2498](sub_2451CF0C8, 0, 0);
}

uint64_t sub_2451CF0C8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_2451DB710();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[25] = (uint64_t)v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2451CF2B0;
  return MEMORY[0x270FA1E88](v0 + 12, 0, 0, v0 + 14, v5, v6);
}

uint64_t sub_2451CF2B0()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_2451CF568;
  }
  else {
    uint64_t v1 = sub_2451CF3C0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_2451CF3C0()
{
  if (*(unsigned char *)(v0 + 104) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    *(void *)(v0 + 128) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
    sub_2451DB760();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 176);
    uint64_t v3 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 168);
    *(void *)(v0 + 136) = *(void *)(v0 + 96);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
    sub_2451DB750();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 48);
    __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v6);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_2451CF2B0;
    return MEMORY[0x270FA1E88](v0 + 96, 0, 0, v0 + 112, v6, v7);
  }
}

uint64_t sub_2451CF568()
{
  uint64_t v1 = v0[14];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v0[15] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
  sub_2451DB760();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t PolicyCache.changes(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v63 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC780);
  uint64_t v56 = *(void *)(v57 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v55 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC750);
  uint64_t v59 = *(void *)(v10 - 8);
  uint64_t v60 = v10;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v64 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC760);
  uint64_t v61 = *(void *)(v19 - 8);
  uint64_t v62 = v19;
  MEMORY[0x270FA5388](v19);
  v65 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(v4 + 128);
  uint64_t v58 = a2;
  if (a2)
  {
    if (v21 && (*(void *)(v4 + 120) == v63 && v21 == a2 || (sub_2451DB8F0() & 1) != 0)) {
      goto LABEL_15;
    }
  }
  else if (!v21)
  {
    goto LABEL_15;
  }
  uint64_t v54 = v14;
  v53 = v8;
  sub_2451D2258();
  v22 = (void *)swift_allocError();
  *uint64_t v23 = 0;
  swift_beginAccess();
  uint64_t v24 = *(void *)(v4 + 136);
  uint64_t v25 = *(void *)(v24 + 16);
  if (v25)
  {
    v52 = a3;
    uint64_t v26 = v24 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    uint64_t v27 = *(void *)(v54 + 72);
    swift_bridgeObjectRetain();
    do
    {
      v67 = v22;
      id v28 = v22;
      sub_2451DB760();
      v26 += v27;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    a3 = v52;
  }
  *(void *)(v4 + 136) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  *(void *)(v4 + 144) = 0;
  swift_release();

  MEMORY[0x270FA5388](v29);
  *(&v51 - 2) = 0;
  *((unsigned char *)&v51 - 8) = 1;
  uint64_t v31 = (uint64_t)&v30[4];
  v32 = v30 + 7;
  os_unfair_lock_lock(v30 + 7);
  sub_2451D22AC(v31);
  os_unfair_lock_unlock(v32);
  if (*(void *)(v4 + 144))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC710);
    sub_2451DB6F0();
    swift_release();
  }
  uint64_t v8 = v53;
  uint64_t v14 = v54;
  a2 = v58;
  *(void *)(v4 + 144) = 0;
  swift_release();
LABEL_15:
  *(void *)(v4 + 120) = v63;
  *(void *)(v4 + 128) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = v59;
  uint64_t v33 = v60;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v12, *MEMORY[0x263F8F680], v60);
  sub_2451DB730();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v33);
  v35 = *(os_unfair_lock_s **)(v4 + 112);
  uint64_t v36 = (uint64_t)&v35[4];
  v37 = v35 + 7;
  os_unfair_lock_lock(v35 + 7);
  sub_2451D020C(v36, (uint64_t)&v67);
  os_unfair_lock_unlock(v37);
  if (v68 != 1)
  {
    v38 = v55;
    sub_2451DB750();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v38, v57);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v64, v18, v13);
  v39 = (unint64_t *)(v4 + 136);
  swift_beginAccess();
  unint64_t v40 = *(void *)(v4 + 136);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 136) = v40;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v40 = sub_2451D22C0(0, *(void *)(v40 + 16) + 1, 1, v40);
    unint64_t *v39 = v40;
  }
  unint64_t v43 = *(void *)(v40 + 16);
  unint64_t v42 = *(void *)(v40 + 24);
  if (v43 >= v42 >> 1)
  {
    unint64_t v40 = sub_2451D22C0(v42 > 1, v43 + 1, 1, v40);
    unint64_t *v39 = v40;
  }
  *(void *)(v40 + 16) = v43 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v40+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v43, v64, v13);
  swift_endAccess();
  if (!*(void *)(v4 + 144))
  {
    (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(v4 + 152))(&v67, v63, v58);
    uint64_t v44 = sub_2451DB6E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v8, 1, 1, v44);
    sub_2451D2530((uint64_t)&v67, (uint64_t)v66);
    unint64_t v45 = sub_2451D2594();
    v46 = (void *)swift_allocObject();
    v46[2] = v4;
    v46[3] = v45;
    sub_2451D2654(v66, (uint64_t)(v46 + 4));
    v46[9] = v4;
    swift_retain_n();
    uint64_t v47 = sub_2451D0FA8((uint64_t)v8, (uint64_t)&unk_268ECC7A0, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
    *(void *)(v4 + 144) = v47;
    swift_release();
  }
  uint64_t v48 = v62;
  a3[3] = v62;
  a3[4] = sub_2451D27BC(&qword_268ECC768, &qword_268ECC760);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t *, char *, uint64_t))(v61 + 32))(boxed_opaque_existential_1, v65, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v13);
}

uint64_t sub_2451CFDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451DB6E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451DB6D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451D15D8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451DB690();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2451CFF90(uint64_t a1@<X8>)
{
  if (qword_268ECCC50 != -1) {
    swift_once();
  }
  uint64_t v2 = *(os_unfair_lock_s **)(qword_268ECCC58 + 112);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 7;
  os_unfair_lock_lock(v2 + 7);
  sub_2451D020C(v3, a1);

  os_unfair_lock_unlock(v4);
}

void PolicyCache.currentPolicy.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 112);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 7;
  os_unfair_lock_lock(v3 + 7);
  sub_2451D020C(v4, a1);

  os_unfair_lock_unlock(v5);
}

BOOL sub_2451D00A0(void *a1)
{
  return (*(unsigned char *)(v1 + 8) & 1) == 0 && (*a1 & ~*(void *)v1) == 0;
}

void sub_2451D00C4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 112);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 7;
  os_unfair_lock_lock(v3 + 7);
  sub_2451D020C(v4, (uint64_t)&v7);
  os_unfair_lock_unlock(v5);
  char v6 = v8;
  *(void *)a2 = v7;
  *(unsigned char *)(a2 + 8) = v6;
}

void sub_2451D0138(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)a2 + 112);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 7;
  os_unfair_lock_lock(v2 + 7);
  sub_2451D2FD4(v3);
  os_unfair_lock_unlock(v4);
}

void PolicyCache.currentPolicy.setter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 112);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 7;
  os_unfair_lock_lock(v1 + 7);
  sub_2451D2FD4(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2451D020C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void (*PolicyCache.currentPolicy.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 112);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 7;
  os_unfair_lock_lock(v3 + 7);
  sub_2451D020C(v4, a1);
  *(void *)(a1 + 24) = 0;
  os_unfair_lock_unlock(v5);
  return sub_2451D02A4;
}

void sub_2451D02A4(uint64_t a1)
{
  uint64_t v1 = *(os_unfair_lock_s **)(a1 + 16);
  os_unfair_lock_lock(v1 + 7);
  sub_2451D2FD4((uint64_t)&v1[4]);
  os_unfair_lock_unlock(v1 + 7);
}

void *PolicyCache.init(policyChangesSource:)(uint64_t a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC7A8);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 28) = 0;
  *(void *)(v5 + 16) = 0;
  *(unsigned char *)(v5 + 24) = 1;
  uint64_t v6 = MEMORY[0x263F8EE78];
  v2[14] = v5;
  v2[15] = 0;
  v2[16] = 0;
  v2[17] = v6;
  v2[18] = 0;
  if (a1)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a1;
    *(void *)(v7 + 24) = a2;
    char v8 = sub_2451D2778;
  }
  else
  {
    char v8 = sub_2451D0428;
    uint64_t v7 = 0;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v7;
  v2[19] = sub_2451D2740;
  v2[20] = v9;
  return v2;
}

uint64_t sub_2451D0428@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC7B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC7B8);
  MEMORY[0x270FA5388]();
  type metadata accessor for SCAnalysisFeatureEnablement(0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F680], v2);
  sub_2451DB770();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC7C8);
  a1[4] = sub_2451D27BC(&qword_268ECC7D0, &qword_268ECC7C8);
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_2451D27BC(&qword_268ECC7D8, &qword_268ECC7B8);
  return sub_2451DB830();
}

uint64_t sub_2451D0630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC780);
  v5[18] = v7;
  v5[19] = *(void *)(v7 - 8);
  v5[20] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
  v5[21] = v8;
  v5[22] = *(void *)(v8 - 8);
  v5[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2451D0758, a5, 0);
}

uint64_t sub_2451D0758()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v1[3];
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v5, v3, v2);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_2451DB710();
  swift_task_dealloc();
  v0[24] = sub_2451D2594();
  swift_beginAccess();
  uint64_t v6 = v0[24];
  uint64_t v7 = v0[17];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v8);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[25] = (uint64_t)v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2451D0964;
  return MEMORY[0x270FA1E88](v0 + 10, v7, v6, v0 + 12, v8, v9);
}

uint64_t sub_2451D0964()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  if (v0) {
    uint64_t v4 = sub_2451D0E68;
  }
  else {
    uint64_t v4 = sub_2451D0A7C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

void sub_2451D0A7C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = v0 + 16;
  if (*(unsigned char *)(v0 + 88))
  {
    uint64_t v3 = *(void *)(v0 + 136);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v4 = *(void *)(v3 + 136);
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(v0 + 176);
      uint64_t v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v8 = *(void *)(v6 + 72);
      swift_bridgeObjectRetain();
      do
      {
        *(void *)(v0 + 112) = 0;
        sub_2451DB760();
        v7 += v8;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    *(void *)(*(void *)(v0 + 136) + 136) = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v9 = *(void **)(v0 + 208);
  sub_2451DB700();
  uint64_t v10 = *(void *)(v0 + 136);
  if (v9)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v11 = *(void *)(v10 + 136);
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      uint64_t v13 = *(void *)(v0 + 176);
      uint64_t v14 = v11 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      id v15 = v9;
      uint64_t v16 = *(void *)(v13 + 72);
      swift_bridgeObjectRetain();
      do
      {
        *(void *)(v0 + 104) = v9;
        id v17 = v9;
        sub_2451DB760();
        v14 += v16;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v20 = v9;
    }
    uint64_t v21 = *(void *)(v0 + 136);
    *(void *)(v21 + 136) = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    *(void *)(v21 + 144) = 0;
    swift_release();

LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(void (**)(void))(v0 + 8);
    v22();
    return;
  }
  uint64_t v18 = *(os_unfair_lock_s **)(v10 + 112);
  uint64_t v19 = swift_task_alloc();
  *(void *)(v19 + 16) = v1;
  *(unsigned char *)(v19 + 24) = 0;
  os_unfair_lock_lock(v18 + 7);
  sub_2451D2FD4((uint64_t)&v18[4]);
  uint64_t v23 = *(void *)(v0 + 136);
  os_unfair_lock_unlock(v18 + 7);
  swift_task_dealloc();
  uint64_t v24 = *(void *)(v23 + 136);
  uint64_t v25 = *(void *)(v24 + 16);
  if (v25)
  {
    uint64_t v26 = *(void *)(v0 + 176);
    uint64_t v27 = v24 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    uint64_t v41 = *(void *)(v26 + 72);
    unint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    swift_bridgeObjectRetain();
    uint64_t v39 = v1;
    do
    {
      uint64_t v29 = *(void *)(v0 + 176);
      uint64_t v28 = *(void *)(v0 + 184);
      uint64_t v31 = *(void *)(v0 + 160);
      uint64_t v30 = *(void *)(v0 + 168);
      uint64_t v33 = *(void *)(v0 + 144);
      uint64_t v32 = *(void *)(v0 + 152);
      v40(v28, v27, v30);
      *(void *)(v0 + 120) = v39;
      sub_2451DB750();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      v27 += v41;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    uint64_t v2 = v0 + 16;
  }
  uint64_t v34 = *(void *)(v0 + 192);
  uint64_t v35 = *(void *)(v0 + 136);
  uint64_t v36 = *(void *)(v0 + 40);
  uint64_t v37 = *(void *)(v0 + 48);
  __swift_mutable_project_boxed_opaque_existential_1(v2, v36);
  v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v38;
  void *v38 = v0;
  v38[1] = sub_2451D0964;
  MEMORY[0x270FA1E88](v0 + 80, v35, v34, v0 + 96, v36, v37);
}

uint64_t sub_2451D0E68()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = v0[17];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v0[22];
    uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    id v7 = v1;
    uint64_t v8 = *(void *)(v5 + 72);
    swift_bridgeObjectRetain();
    do
    {
      v0[13] = v1;
      id v9 = v1;
      sub_2451DB760();
      v6 += v8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = v1;
  }
  uint64_t v11 = v0[17];
  *(void *)(v11 + 136) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  *(void *)(v11 + 144) = 0;
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_2451D0FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2451DB6E0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2451DB6D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2451D15D8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451DB690();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t PolicyCache.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t PolicyCache.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t PolicyCache.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2451D11D4()
{
  return v0;
}

uint64_t sub_2451D11E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 72) = a4;
  return MEMORY[0x270FA2498](sub_2451D1200, a4, 0);
}

uint64_t sub_2451D1200()
{
  PolicyCache.changes(for:)(0, 0, v0 + 2);
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = (uint64_t)v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2451D12F4;
  return MEMORY[0x270FA20A0](v0 + 7, &unk_268ECC740, 0, v1, v2);
}

uint64_t sub_2451D12F4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v4 = sub_2451D1480;
  }
  else {
    uint64_t v4 = sub_2451D1420;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2451D1420()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2451D1480()
{
  uint64_t v1 = *(void **)(v0 + 88);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2451D14EC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2451D152C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2451D2FF0;
  v3[9] = v2;
  return MEMORY[0x270FA2498](sub_2451D1200, v2, 0);
}

uint64_t sub_2451D15D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2451D1638()
{
  return sub_2451D2FC0(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1);
}

uint64_t sub_2451D1674(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    if (v4 == 1)
    {
      if (qword_268ECCC20 != -1) {
        swift_once();
      }
      uint64_t v4 = byte_268ECCC28;
    }
    else
    {
      if (v4 != 2) {
        return sub_2451DB850();
      }
      if (qword_268ECCC40 != -1) {
        swift_once();
      }
      uint64_t v4 = 7;
      if (!byte_268ECCC48) {
        uint64_t v4 = 0;
      }
    }
  }
  *a1 = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v2 + 8);
  return sub_2451D2CA0(v5);
}

uint64_t sub_2451D17E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC818);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC820);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = self;
  aBlock[0] = objc_msgSend(v10, sel_analysisFeatureEnablement);
  sub_2451DB750();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v11, v5, v2);
  aBlock[4] = sub_2451D2D3C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2451D1B88;
  aBlock[3] = &block_descriptor_0;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  id v14 = objc_msgSend(v10, sel_subscribeForAnalysisAvailabilityChanges_, v13);
  _Block_release(v13);
  *(void *)(swift_allocObject() + 16) = v14;
  return sub_2451DB740();
}

uint64_t sub_2451D1A98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC820);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC818);
  sub_2451DB750();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2451D1B88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_2451D1BDC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2451D1CB8;
  return v6(a1);
}

uint64_t sub_2451D1CB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2451D1DB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2451D2FF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECC728 + dword_268ECC728);
  return v6(a1, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2451D1FA8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2451D2080()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_2451D2164;
  return sub_2451CEEF8((uint64_t)v6, v7, v8, v3, v4, v5);
}

uint64_t sub_2451D2164()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2451D2258()
{
  unint64_t result = qword_268ECC788;
  if (!qword_268ECC788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268ECC788);
  }
  return result;
}

uint64_t sub_2451D22AC(uint64_t result)
{
  char v2 = *(unsigned char *)(v1 + 24);
  *(void *)unint64_t result = *(void *)(v1 + 16);
  *(unsigned char *)(result + 8) = v2;
  return result;
}

uint64_t sub_2451D22C0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC828);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2451DB840();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2451D2E60(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2451D2530(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2451D2594()
{
  unint64_t result = qword_268ECC798;
  if (!qword_268ECC798)
  {
    type metadata accessor for PolicyCache();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC798);
  }
  return result;
}

uint64_t type metadata accessor for PolicyCache()
{
  return self;
}

uint64_t sub_2451D260C()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2451D2654(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2451D266C()
{
  uint64_t v2 = v0 + 32;
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2451D2164;
  return sub_2451D0630((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_2451D2708()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451D2740(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_2451D2778(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

void type metadata accessor for SCAnalysisFeatureEnablement(uint64_t a1)
{
}

uint64_t sub_2451D27BC(unint64_t *a1, uint64_t *a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2451D283C()
{
  unint64_t result = qword_268ECC7E0;
  if (!qword_268ECC7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC7E0);
  }
  return result;
}

unint64_t sub_2451D2894()
{
  unint64_t result = qword_268ECC7E8;
  if (!qword_268ECC7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC7E8);
  }
  return result;
}

unint64_t sub_2451D28EC()
{
  unint64_t result = qword_268ECC7F0;
  if (!qword_268ECC7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC7F0);
  }
  return result;
}

unint64_t sub_2451D2944()
{
  unint64_t result = qword_268ECC7F8;
  if (!qword_268ECC7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC7F8);
  }
  return result;
}

unint64_t sub_2451D299C()
{
  unint64_t result = qword_268ECC800;
  if (!qword_268ECC800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC800);
  }
  return result;
}

ValueMetadata *type metadata accessor for SensitiveContentPolicy()
{
  return &type metadata for SensitiveContentPolicy;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SensitiveContentPolicy.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SensitiveContentPolicy.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2451D2B6CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2451D2B94(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2451D2B9C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SensitiveContentPolicy.Error()
{
  return &type metadata for SensitiveContentPolicy.Error;
}

uint64_t method lookup function for PolicyCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PolicyCache);
}

uint64_t dispatch thunk of PolicyCache.__allocating_init(policyChangesSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_2451D2BF4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
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

uint64_t sub_2451D2CA0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2451D2CA8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC818);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2451D2D3C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC818);

  return sub_2451D1A98(a1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2451D2DC8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2451D2E00()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_cancel);
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

uint64_t sub_2451D2E60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268ECC758) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2451DB870();
  __break(1u);
  return result;
}

uint64_t sub_2451D2FC0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_2451D2FD4(uint64_t a1)
{
  return sub_2451D22AC(a1);
}

BOOL static Sensitivity.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Sensitivity.hash(into:)()
{
  return sub_2451DB970();
}

BOOL sub_2451D3044(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2451D3064()
{
  if (*v0) {
    return 0x69736E6553746F6ELL;
  }
  else {
    return 0x76697469736E6573;
  }
}

uint64_t sub_2451D30AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2451D403C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2451D30D4()
{
  return 0;
}

void sub_2451D30E0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2451D30EC(uint64_t a1)
{
  unint64_t v2 = sub_2451D3540();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2451D3128(uint64_t a1)
{
  unint64_t v2 = sub_2451D3540();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2451D3164()
{
  return 0;
}

uint64_t sub_2451D3170@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_2451D31A0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2451D31AC(uint64_t a1)
{
  unint64_t v2 = sub_2451D3594();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2451D31E8(uint64_t a1)
{
  unint64_t v2 = sub_2451D3594();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2451D3224(uint64_t a1)
{
  unint64_t v2 = sub_2451D35E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2451D3260(uint64_t a1)
{
  unint64_t v2 = sub_2451D35E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Sensitivity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC838);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC840);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC848);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451D3540();
  sub_2451DB9A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_2451D3594();
    size_t v14 = v18;
    sub_2451DB8C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_2451D35E8();
    sub_2451DB8C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_2451D3540()
{
  unint64_t result = qword_268ECD170;
  if (!qword_268ECD170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECD170);
  }
  return result;
}

unint64_t sub_2451D3594()
{
  unint64_t result = qword_268ECD178;
  if (!qword_268ECD178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECD178);
  }
  return result;
}

unint64_t sub_2451D35E8()
{
  unint64_t result = qword_268ECD180[0];
  if (!qword_268ECD180[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECD180);
  }
  return result;
}

uint64_t Sensitivity.hashValue.getter()
{
  return sub_2451DB980();
}

uint64_t Sensitivity.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC850);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC858);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC860);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451D3540();
  unint64_t v11 = v32;
  sub_2451DB990();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  size_t v14 = v10;
  uint64_t v15 = sub_2451DB8B0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_2451DB820();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC868);
    void *v22 = &type metadata for Sensitivity;
    sub_2451DB890();
    sub_2451DB810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_2451D3594();
    unint64_t v18 = v14;
    sub_2451DB880();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_2451D35E8();
    sub_2451DB880();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_2451D3ADC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return Sensitivity.init(from:)(a1, a2);
}

uint64_t sub_2451D3AF4(void *a1)
{
  return Sensitivity.encode(to:)(a1);
}

uint64_t Sensitivity.description.getter()
{
  if (*v0) {
    return 0x736E655320746F4ELL;
  }
  else {
    return 0x76697469736E6553;
  }
}

unint64_t sub_2451D3B5C()
{
  unint64_t result = qword_268ECC870;
  if (!qword_268ECC870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC870);
  }
  return result;
}

uint64_t sub_2451D3BB0()
{
  if (*v0) {
    return 0x736E655320746F4ELL;
  }
  else {
    return 0x76697469736E6553;
  }
}

ValueMetadata *type metadata accessor for Sensitivity()
{
  return &type metadata for Sensitivity;
}

uint64_t getEnumTagSinglePayload for SensitivityAnalysis.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s24SensitiveContentAnalysis11SensitivityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451D3D70);
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

unsigned char *sub_2451D3D98(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Sensitivity.CodingKeys()
{
  return &type metadata for Sensitivity.CodingKeys;
}

ValueMetadata *type metadata accessor for Sensitivity.SensitiveCodingKeys()
{
  return &type metadata for Sensitivity.SensitiveCodingKeys;
}

ValueMetadata *type metadata accessor for Sensitivity.NotSensitiveCodingKeys()
{
  return &type metadata for Sensitivity.NotSensitiveCodingKeys;
}

unint64_t sub_2451D3DD8()
{
  unint64_t result = qword_268ECD710[0];
  if (!qword_268ECD710[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECD710);
  }
  return result;
}

unint64_t sub_2451D3E30()
{
  unint64_t result = qword_268ECD820;
  if (!qword_268ECD820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECD820);
  }
  return result;
}

unint64_t sub_2451D3E88()
{
  unint64_t result = qword_268ECD828[0];
  if (!qword_268ECD828[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECD828);
  }
  return result;
}

unint64_t sub_2451D3EE0()
{
  unint64_t result = qword_268ECD8B0;
  if (!qword_268ECD8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECD8B0);
  }
  return result;
}

unint64_t sub_2451D3F38()
{
  unint64_t result = qword_268ECD8B8[0];
  if (!qword_268ECD8B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECD8B8);
  }
  return result;
}

unint64_t sub_2451D3F90()
{
  unint64_t result = qword_268ECD940;
  if (!qword_268ECD940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECD940);
  }
  return result;
}

unint64_t sub_2451D3FE8()
{
  unint64_t result = qword_268ECD948[0];
  if (!qword_268ECD948[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECD948);
  }
  return result;
}

uint64_t sub_2451D403C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x76697469736E6573 && a2 == 0xE900000000000065;
  if (v2 || (sub_2451DB8F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69736E6553746F6ELL && a2 == 0xEC00000065766974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2451DB8F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2451D4160@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *(unsigned __int8 *)(result + 8) != 255;
  return result;
}

void **sub_2451D4204@<X0>(void **result@<X0>, void *a2@<X8>)
{
  int v3 = *((unsigned __int8 *)result + 8);
  if (v3 != 255)
  {
    unsigned int v4 = *result;
    if ((v3 & 1) == 0)
    {
      *a2 = v4;
      return (void **)v4;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC710);
    unint64_t result = (void **)swift_willThrowTypedImpl();
  }
  *a2 = 0;
  return result;
}

void sub_2451D4358(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_2451D4488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_2451DB4D0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_2451D44F8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

id sub_2451D4508(uint64_t a1)
{
  int v3 = v1;
  poolOut[1] = *(CVPixelBufferPoolRef *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_2451DB570();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR___SCVideoStreamAnalyzer_lastAnalysisTime;
  uint64_t v10 = v3;
  sub_2451DB540();
  sub_2451DB550();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&v3[v9] = v12;
  uint64_t v13 = OBJC_IVAR___SCVideoStreamAnalyzer_task;
  *(void *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_task] = 0;
  uint64_t v14 = OBJC_IVAR___SCVideoStreamAnalyzer__analysis;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC880);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 28) = 0;
  *(void *)(v15 + 16) = 0;
  *(unsigned char *)(v15 + 24) = -1;
  *(void *)&v10[v14] = v15;
  char v16 = (uint64_t *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_analysisChanged];
  uint64_t *v16 = 0;
  v16[1] = 0;
  *(void *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_options] = a1;
  id v17 = objc_msgSend(objc_allocWithZone((Class)SCSensitivityAnalyzer), sel_init);
  uint64_t v18 = OBJC_IVAR___SCVideoStreamAnalyzer_analyzer;
  *(void *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_analyzer] = v17;
  VTPixelTransferSessionRef v59 = 0;
  OSStatus v19 = VTPixelTransferSessionCreate(0, &v59);
  VTPixelTransferSessionRef v20 = v59;
  BOOL v21 = v19 != sub_2451DB5E0() || v20 == 0;
  int v22 = !v21;
  int v57 = v22;
  if (v21)
  {
    sub_2451DAA40(53, v19);
    swift_willThrow();

    goto LABEL_13;
  }
  uint64_t v52 = v18;
  v53 = v16;
  uint64_t v54 = v13;
  uint64_t v55 = v14;
  v51[0] = v2;
  *(void *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_transferSession] = v20;
  CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent() + 100.0;
  v51[1] = _s15PixelBufferPoolCMa();
  uint64_t v56 = swift_allocObject();
  poolOut[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC930);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2451DD090;
  uint64_t v25 = (void *)*MEMORY[0x263F041B0];
  *(void *)(inited + 32) = *MEMORY[0x263F041B0];
  uint64_t v26 = MEMORY[0x263F8D538];
  *(CFAbsoluteTime *)(inited + 40) = v23;
  uint64_t v27 = (void *)*MEMORY[0x263F041C0];
  *(void *)(inited + 64) = v26;
  *(void *)(inited + 72) = v27;
  uint64_t v28 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 80) = 1;
  uint64_t v29 = (void *)*MEMORY[0x263F041A8];
  *(void *)(inited + 104) = v28;
  *(void *)(inited + 112) = v29;
  *(void *)(inited + 120) = 10;
  uint64_t v30 = (void *)*MEMORY[0x263F04180];
  *(void *)(inited + 144) = v28;
  *(void *)(inited + 152) = v30;
  uint64_t v31 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 160) = 1111970369;
  uint64_t v32 = (void *)*MEMORY[0x263F04240];
  *(void *)(inited + 184) = v31;
  *(void *)(inited + 192) = v32;
  uint64_t v33 = MEMORY[0x263F8D9D0];
  *(void *)(inited + 200) = 299;
  char v34 = (void *)*MEMORY[0x263F04118];
  *(void *)(inited + 224) = v33;
  *(void *)(inited + 232) = v34;
  *(void *)(inited + 240) = 299;
  uint64_t v35 = (void *)*MEMORY[0x263F04130];
  *(void *)(inited + 264) = v33;
  *(void *)(inited + 272) = v35;
  id v36 = v25;
  id v37 = v27;
  id v38 = v29;
  id v39 = v30;
  id v40 = v32;
  id v41 = v34;
  id v42 = v35;
  unint64_t v43 = sub_2451D5D78(MEMORY[0x263F8EE78]);
  *(void *)(inited + 304) = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC938);
  *(void *)(inited + 280) = v43;
  sub_2451D5EBC(inited);
  type metadata accessor for CFString(0);
  sub_2451D7538(&qword_268ECC940, type metadata accessor for CFString);
  CFDictionaryRef v44 = (const __CFDictionary *)sub_2451DB5F0();
  swift_bridgeObjectRelease();
  CVReturn v45 = CVPixelBufferPoolCreate(0, 0, v44, poolOut);

  CVPixelBufferPoolRef v46 = poolOut[0];
  if (v45 != sub_2451DB5E0() || !v46)
  {
    uint64_t v50 = sub_2451DAA40(52, v45);
    swift_willThrow();

    uint64_t v47 = v56;
    swift_deallocPartialClassInstance();
    if (v50) {
      goto LABEL_11;
    }
LABEL_17:
    *(void *)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_bufferPool] = v47;

    v58.receiver = v10;
    v58.super_class = (Class)SCVideoStreamAnalyzer;
    return objc_msgSendSuper2(&v58, sel_init);
  }
  uint64_t v47 = v56;
  *(void *)(v56 + 16) = v46;
  if (!v51[0]) {
    goto LABEL_17;
  }
LABEL_11:
  uint64_t v18 = v52;
  char v16 = v53;
LABEL_13:
  swift_release();

  swift_release();
  sub_2451D44F8(*v16);
  uint64_t v48 = (OpaqueVTPixelTransferSession *)v10;
  if (v57)
  {
    uint64_t v48 = *(OpaqueVTPixelTransferSession **)&v10[OBJC_IVAR___SCVideoStreamAnalyzer_transferSession];

    VTPixelTransferSessionInvalidate(v48);
  }

  type metadata accessor for SCVideoStreamAnalyzer();
  return (id)swift_deallocPartialClassInstance();
}

unint64_t type metadata accessor for SCVideoStreamAnalyzer()
{
  unint64_t result = qword_268ECD9D8[0];
  if (!qword_268ECD9D8[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_268ECD9D8);
  }
  return result;
}

void sub_2451D4ABC(__CVBuffer *a1)
{
  uint64_t v2 = v1;
  CVPixelBufferRef v28 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2451DB570();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(os_unfair_lock_s **)&v1[OBJC_IVAR___SCVideoStreamAnalyzer__analysis];
  uint64_t v11 = (uint64_t)&v10[4];
  uint64_t v12 = v10 + 7;
  os_unfair_lock_lock(v10 + 7);
  sub_2451D4160(v11, &v30);
  os_unfair_lock_unlock(v12);
  if (!v30)
  {
    sub_2451DB560();
    sub_2451DB550();
    double v14 = v13;
    uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
    v15(v9, v6);
    os_unfair_lock_lock(v12);
    sub_2451D4160(v11, &v29);
    os_unfair_lock_unlock(v12);
    if (!v29)
    {
      uint64_t v16 = OBJC_IVAR___SCVideoStreamAnalyzer_lastAnalysisTime;
      if (v14 - *(double *)&v1[OBJC_IVAR___SCVideoStreamAnalyzer_lastAnalysisTime] >= 3.0)
      {
        sub_2451DB560();
        sub_2451DB550();
        uint64_t v18 = v17;
        v15(v9, v6);
        *(void *)&v1[v16] = v18;
        uint64_t v19 = OBJC_IVAR___SCVideoStreamAnalyzer_task;
        if (*(void *)&v1[OBJC_IVAR___SCVideoStreamAnalyzer_task])
        {
          swift_retain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC710);
          sub_2451DB6F0();
          swift_release();
        }
        swift_retain();
        VTPixelTransferSessionRef v20 = sub_2451D5FEC();
        swift_release();
        BOOL v21 = v28;
        OSStatus v22 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)&v2[OBJC_IVAR___SCVideoStreamAnalyzer_transferSession], v28, v20);
        if (v22 == sub_2451DB5E0())
        {
          CVBufferPropagateAttachments(v21, v20);
          uint64_t v23 = sub_2451DB6E0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
          uint64_t v24 = (void *)swift_allocObject();
          v24[2] = 0;
          v24[3] = 0;
          v24[4] = v2;
          v24[5] = v20;
          uint64_t v25 = v2;
          *(void *)&v2[v19] = sub_2451D0FA8((uint64_t)v5, (uint64_t)&unk_268ECC8C8, (uint64_t)v24);
          swift_release();
        }
        else
        {
          uint64_t v26 = (void *)sub_2451DAA40(54, v22);
          swift_willThrow();

          id v27 = v26;
          sub_2451D52BC(v26, 1);
        }
      }
    }
  }
}

uint64_t sub_2451D4E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 128) = a4;
  *(void *)(v5 + 136) = a5;
  return MEMORY[0x270FA2498](sub_2451D4E5C, 0, 0);
}

uint64_t sub_2451D4E5C()
{
  uint64_t v10 = v0;
  uint64_t v1 = *(os_unfair_lock_s **)(v0[16] + OBJC_IVAR___SCVideoStreamAnalyzer__analysis);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 7;
  os_unfair_lock_lock(v1 + 7);
  sub_2451D4160(v2, &v9);
  os_unfair_lock_unlock(v3);
  if (v9)
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    sub_2451DB700();
    v0[18] = 0;
    uint64_t v6 = v0[17];
    uint64_t v7 = *(void **)(v0[16] + OBJC_IVAR___SCVideoStreamAnalyzer_analyzer);
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_2451D502C;
    uint64_t v8 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_2451CD9B0;
    v0[13] = &block_descriptor_9;
    v0[14] = v8;
    objc_msgSend(v7, sel_analyzePixelBuffer_orientation_completionHandler_, v6, 1, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
}

uint64_t sub_2451D502C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_2451D51F8;
  }
  else {
    uint64_t v2 = sub_2451D513C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2451D513C()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = v0[18];
  sub_2451DB700();
  if (!v2) {
    sub_2451D52BC(v1, v0[19] != 0);
  }
  sub_2451D639C(v1);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2451D51F8()
{
  swift_willThrow();
  uint64_t v1 = *(void **)(v0 + 152);
  sub_2451DB700();
  sub_2451D52BC(v1, *(void *)(v0 + 152) != 0);
  sub_2451D639C(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_2451D52BC(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCB60);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v9 = *(os_unfair_lock_s **)&v2[OBJC_IVAR___SCVideoStreamAnalyzer__analysis];
  uint64_t v33 = a1;
  char v34 = a2 & 1;
  uint64_t v10 = (unsigned __int8 *)&v9[4];
  uint64_t v11 = v9 + 7;
  os_unfair_lock_lock(v9 + 7);
  sub_2451D63A8(v10, &v35);
  os_unfair_lock_unlock(v11);
  if (v35 == 1)
  {
    if (a2)
    {
      uint64_t v35 = (uint64_t)a1;
      id v12 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC710);
      swift_willThrowTypedImpl();
      if (qword_268ECD9D0 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_2451DB5D0();
      __swift_project_value_buffer(v13, (uint64_t)qword_268ECEB30);
      id v14 = a1;
      id v15 = a1;
      uint64_t v16 = sub_2451DB5B0();
      os_log_type_t v17 = sub_2451DB780();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 138412290;
        id v20 = a1;
        uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v35 = v21;
        sub_2451DB7A0();
        *uint64_t v19 = v21;
        sub_2451D639C(a1);
        sub_2451D639C(a1);
        _os_log_impl(&dword_2451C6000, v16, v17, "Analysis failed with error: %@", v18, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC8F8);
        swift_arrayDestroy();
        MEMORY[0x24569A9F0](v19, -1, -1);
        MEMORY[0x24569A9F0](v18, -1, -1);
      }
      else
      {
        sub_2451D639C(a1);
        sub_2451D639C(a1);
      }

      uint64_t v27 = sub_2451DB6E0();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
      sub_2451DB6C0();
      sub_2451D6434(a1);
      id v28 = v3;
      uint64_t v29 = sub_2451DB6B0();
      BOOL v30 = (void *)swift_allocObject();
      uint64_t v31 = MEMORY[0x263F8F500];
      v30[2] = v29;
      v30[3] = v31;
      v30[4] = v28;
      v30[5] = a1;
      sub_2451D5880((uint64_t)v8, (uint64_t)&unk_268ECC8F0, (uint64_t)v30);
      sub_2451D639C(a1);
    }
    else
    {
      uint64_t v22 = sub_2451DB6E0();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 1, 1, v22);
      sub_2451DB6C0();
      sub_2451D6434(a1);
      uint64_t v23 = v2;
      uint64_t v24 = sub_2451DB6B0();
      uint64_t v25 = (void *)swift_allocObject();
      uint64_t v26 = MEMORY[0x263F8F500];
      v25[2] = v24;
      v25[3] = v26;
      v25[4] = v23;
      v25[5] = a1;
      sub_2451D5880((uint64_t)v8, (uint64_t)&unk_268ECC908, (uint64_t)v25);
    }
    swift_release();
  }
}

uint64_t sub_2451D5730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  void v5[2] = a1;
  sub_2451DB6C0();
  v5[5] = sub_2451DB6B0();
  uint64_t v7 = sub_2451DB690();
  return MEMORY[0x270FA2498](sub_2451D57CC, v7, v6);
}

uint64_t sub_2451D57CC()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  id v2 = objc_msgSend(v1, sel_analysisChanged);
  uint64_t v3 = v2;
  if (v2)
  {
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(v0 + 32), 0);
    _Block_release(v3);
  }
  **(unsigned char **)(v0 + 16) = v3 == 0;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2451D5880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451DB6E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451DB6D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451D15D8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451DB690();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC920);
  return swift_task_create();
}

uint64_t sub_2451D5A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  void v5[2] = a1;
  sub_2451DB6C0();
  v5[5] = sub_2451DB6B0();
  uint64_t v7 = sub_2451DB690();
  return MEMORY[0x270FA2498](sub_2451D5AC8, v7, v6);
}

uint64_t sub_2451D5AC8()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  id v2 = objc_msgSend(v1, sel_analysisChanged);
  uint64_t v3 = (void (**)(void, void, void))v2;
  if (v2)
  {
    _Block_copy(v2);
    uint64_t v4 = (void *)sub_2451DB4D0();
    ((void (**)(void, void, void *))v3)[2](v3, 0, v4);

    _Block_release(v3);
    _Block_release(v3);
  }
  **(unsigned char **)(v0 + 16) = v3 == 0;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void __swiftcall SCVideoStreamAnalyzer.init()(SCVideoStreamAnalyzer *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void SCVideoStreamAnalyzer.init()()
{
}

uint64_t _s15PixelBufferPoolCMa()
{
  return self;
}

unint64_t sub_2451D5D78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC960);
  uint64_t v2 = sub_2451DB860();
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
    sub_2451D7580(v6, (uint64_t)v15, &qword_268ECC968);
    unint64_t result = sub_2451D6FB4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2451D7514(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_2451D5EBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC948);
  uint64_t v2 = sub_2451DB860();
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
    sub_2451D7580(v6, (uint64_t)&v13, &qword_268ECC950);
    uint64_t v7 = v13;
    unint64_t result = sub_2451D6F00(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_2451D7514(&v14, (_OWORD *)(v3[7] + 32 * result));
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

CVPixelBufferRef sub_2451D5FEC()
{
  pixelBufferOut[1] = *(CVPixelBufferRef *)MEMORY[0x263EF8340];
  pixelBufferOut[0] = 0;
  CVReturn PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(v0 + 16), pixelBufferOut);
  CVPixelBufferRef v2 = pixelBufferOut[0];
  if (PixelBuffer) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = pixelBufferOut[0] == 0;
  }
  if (v3)
  {
    type metadata accessor for SCError(0);
    sub_2451D6B10(MEMORY[0x263F8EE78]);
    sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);
    sub_2451DB4C0();
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_2451D60F8()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2451D2164;
  *(_OWORD *)(v2 + 128) = v3;
  return MEMORY[0x270FA2498](sub_2451D4E5C, 0, 0);
}

uint64_t sub_2451D61A4()
{
  uint64_t v1 = *(__CVPixelBufferPool **)(v0 + 16);
  CVPixelBufferPoolFlush(v1, 1uLL);

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2451D61F0()
{
  uint64_t v0 = sub_2451DB5D0();
  __swift_allocate_value_buffer(v0, qword_268ECEB30);
  __swift_project_value_buffer(v0, (uint64_t)qword_268ECEB30);
  return sub_2451DB5C0();
}

unint64_t sub_2451D6274()
{
  unint64_t result = qword_268ECCA10;
  if (!qword_268ECCA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA10);
  }
  return result;
}

unint64_t sub_2451D62C8()
{
  unint64_t result = qword_268ECC8D0;
  if (!qword_268ECC8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC8D0);
  }
  return result;
}

void type metadata accessor for CVPixelBufferPool(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

uint64_t sub_2451D6344()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2451D637C(uint64_t a1, uint64_t a2)
{
  sub_2451D4488(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_2451D639C(id a1)
{
}

unsigned __int8 *sub_2451D63A8@<X0>(unsigned __int8 *result@<X0>, unsigned char *a2@<X8>)
{
  if (result[8] == 255
    && ((v4 = result, uint64_t v5 = *(void **)(v2 + 16), v6 = *(unsigned char *)(v2 + 24), (v6 & 1) != 0)
     || (unint64_t result = (unsigned __int8 *)objc_msgSend(*(id *)(v2 + 16), sel_isSensitive), (result & 1) != 0)))
  {
    *(void *)uint64_t v4 = v5;
    v4[8] = v6;
    *a2 = 1;
    return (unsigned __int8 *)sub_2451D6434(v5);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

id sub_2451D6434(id a1)
{
  return a1;
}

uint64_t sub_2451D6440()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2451D6488(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *char v8 = v2;
  v8[1] = sub_2451D2FF0;
  return sub_2451D5A2C(a1, v6, v7, v5, v4);
}

uint64_t sub_2451D6534(uint64_t a1)
{
  uint64_t v2 = sub_2451D7538(&qword_268ECC988, type metadata accessor for SCError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_2451D65A0(uint64_t a1)
{
  uint64_t v2 = sub_2451D7538(&qword_268ECC988, type metadata accessor for SCError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_2451D660C(uint64_t a1)
{
  uint64_t v2 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);

  return MEMORY[0x270EEF788](a1, v2);
}

id sub_2451D6678()
{
  return *v0;
}

uint64_t sub_2451D6680@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2451D6688()
{
  return sub_2451DB5A0();
}

uint64_t sub_2451D66D4()
{
  return sub_2451DB590();
}

uint64_t sub_2451D672C()
{
  return sub_2451DB980();
}

uint64_t sub_2451D6794()
{
  return sub_2451DB640();
}

uint64_t sub_2451D67A4(uint64_t a1)
{
  uint64_t v2 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_2451D6810(uint64_t a1)
{
  uint64_t v2 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_2451D687C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_2451D690C()
{
  id v1 = *v0;
  uint64_t v2 = sub_2451DB790();

  return v2;
}

uint64_t sub_2451D6944(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_2451D69C0()
{
  return sub_2451DB980();
}

uint64_t sub_2451D6A20()
{
  swift_getWitnessTable();

  return sub_2451DB580();
}

uint64_t sub_2451D6A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

unint64_t sub_2451D6B10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC928);
  uint64_t v2 = sub_2451DB860();
  long long v3 = (void *)v2;
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
    sub_2451D7580(v6, (uint64_t)&v15, &qword_268ECCBB0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2451D6C48(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2451D7514(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2451D6C48(uint64_t a1, uint64_t a2)
{
  sub_2451DB960();
  sub_2451DB650();
  uint64_t v4 = sub_2451DB980();

  return sub_2451D6CC0(a1, a2, v4);
}

unint64_t sub_2451D6CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_2451DB8F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_2451DB8F0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_2451DB8F0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2451D6E54(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2451D2164;
  return sub_2451D5730(a1, v6, v7, v5, v4);
}

unint64_t sub_2451D6F00(uint64_t a1)
{
  sub_2451DB960();
  type metadata accessor for CFString(0);
  sub_2451D7538(&qword_268ECC958, type metadata accessor for CFString);
  sub_2451DB590();
  uint64_t v2 = sub_2451DB980();

  return sub_2451D6FF8(a1, v2);
}

unint64_t sub_2451D6FB4(uint64_t a1)
{
  uint64_t v2 = sub_2451DB7E0();

  return sub_2451D7154(a1, v2);
}

unint64_t sub_2451D6FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_2451D7538(&qword_268ECC958, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_2451DB580();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_2451DB580();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_2451D7154(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2451D75E4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x245699FB0](v9, a1);
      sub_2451D7640((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2451D721C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2451D72FC;
  return v5(v2 + 32);
}

uint64_t sub_2451D72FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_2451D7410()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451D7448(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2451D2FF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECC910 + dword_268ECC910);
  return v6(a1, v4);
}

void type metadata accessor for SCError(uint64_t a1)
{
}

_OWORD *sub_2451D7514(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_2451D7538(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2451D7580(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2451D75E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2451D7640(uint64_t a1)
{
  return a1;
}

uint64_t sub_2451D7694()
{
  return sub_2451D7538(&qword_268ECC978, type metadata accessor for SCError);
}

uint64_t sub_2451D76DC()
{
  return sub_2451D7538((unint64_t *)&unk_268ECCB20, type metadata accessor for SCError);
}

uint64_t sub_2451D7724()
{
  return sub_2451D7538(&qword_268ECC940, type metadata accessor for CFString);
}

uint64_t sub_2451D776C()
{
  return sub_2451D7538(&qword_268ECC980, type metadata accessor for CFString);
}

uint64_t sub_2451D77B4()
{
  return sub_2451D7538(&qword_268ECC988, type metadata accessor for SCError);
}

uint64_t sub_2451D77FC()
{
  return sub_2451D7538((unint64_t *)&unk_268ECCB30, type metadata accessor for SCError);
}

uint64_t sub_2451D7844()
{
  return sub_2451D7538(&qword_268ECC990, type metadata accessor for SCError);
}

uint64_t sub_2451D788C()
{
  return sub_2451D7538((unint64_t *)&unk_268ECCB40, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_2451D78E8()
{
  return sub_2451D7538(&qword_268ECC998, type metadata accessor for Code);
}

unint64_t sub_2451D7934()
{
  unint64_t result = qword_268ECCB50;
  if (!qword_268ECCB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCB50);
  }
  return result;
}

uint64_t sub_2451D7988()
{
  return sub_2451D7538(&qword_268ECC9A0, type metadata accessor for Code);
}

uint64_t sub_2451D79D0()
{
  return sub_2451D7538(&qword_268ECC9C0, type metadata accessor for SCError);
}

Swift::Void __swiftcall SCSensitivityAnalysis.encode(with:)(NSCoder with)
{
  int v3 = *(_DWORD *)(v1 + OBJC_IVAR___SCSensitivityAnalysis__analysis);
  uint64_t v4 = swift_slowAlloc();
  *(unsigned char *)uint64_t v4 = 1;
  *(_DWORD *)(v4 + 2) = v3;
  uint64_t v5 = sub_2451D9B04((unsigned char *)v4, (unsigned char *)(v4 + 6));
  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  MEMORY[0x24569A9F0](v4, -1, -1);
  uint64_t v8 = (void *)sub_2451DB520();
  sub_2451D9C7C(v5, v7);
  id v9 = (id)sub_2451DB630();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];
}

void SCSensitivityAnalysis.analysis.getter(_DWORD *a1@<X8>)
{
  *a1 = *(_DWORD *)(v1 + OBJC_IVAR___SCSensitivityAnalysis__analysis);
}

uint64_t SensitivityAnalysis.dataRepresentation.getter()
{
  int v1 = *v0;
  uint64_t v2 = swift_slowAlloc();
  *(unsigned char *)uint64_t v2 = 1;
  *(_DWORD *)(v2 + 2) = v1;
  uint64_t v3 = sub_2451D9B04((unsigned char *)v2, (unsigned char *)(v2 + 6));
  MEMORY[0x24569A9F0](v2, -1, -1);
  return v3;
}

void __swiftcall SCSensitivityAnalysis.init(coder:)(SCSensitivityAnalysis_optional *__return_ptr retstr, NSCoder coder)
{
}

id SCSensitivityAnalysis.init(coder:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (void *)sub_2451DB630();
  id v5 = objc_msgSend(a1, sel_decodeObjectForKey_, v4);

  if (v5)
  {
    sub_2451DB7B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_2451D9CD4((uint64_t)v12, (uint64_t)v13);
  if (!v14)
  {

    uint64_t v6 = sub_2451DA89C((uint64_t)v13, &qword_268ECC9B8);
LABEL_9:
    type metadata accessor for SCSensitivityAnalysis(v6);
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_9;
  }
  SensitivityAnalysis.init(from:)(v10, v11, v13);
  *(_DWORD *)&v3[OBJC_IVAR___SCSensitivityAnalysis__analysis] = v13[0];

  v9.receiver = v3;
  v9.super_class = (Class)SCSensitivityAnalysis;
  id v8 = objc_msgSendSuper2(&v9, sel_init);

  return v8;
}

uint64_t SensitivityAnalysis.init(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _WORD *a3@<X8>)
{
  unint64_t v4 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 != 6) {
        goto LABEL_19;
      }
      if (v4)
      {
        if (v4 == 1)
        {
          if ((int)a1 <= a1 >> 32)
          {
            uint64_t v11 = sub_2451DB420();
            if (!v11)
            {
LABEL_25:
              sub_2451DB430();
              __break(1u);
              goto LABEL_26;
            }
            unint64_t v12 = v11;
            uint64_t v13 = sub_2451DB440();
            uint64_t v14 = (int)a1 - v13;
            if (!__OFSUB__((int)a1, v13))
            {
              sub_2451DB430();
              unint64_t v15 = v12 + v14;
              int v16 = *(unsigned __int8 *)(v12 + v14);
              LOWORD(v12) = *(_WORD *)(v15 + 2);
              LOWORD(v17) = *(_WORD *)(v15 + 4);
              if (v16 != 1) {
                goto LABEL_19;
              }
LABEL_15:
              uint64_t result = sub_2451D9C7C(a1, a2);
              *a3 = v12;
              a3[1] = v17;
              return result;
            }
LABEL_24:
            __break(1u);
            goto LABEL_25;
          }
          goto LABEL_22;
        }
        uint64_t v19 = *(void *)(a1 + 16);
        swift_retain();
        swift_retain();
        uint64_t v20 = sub_2451DB420();
        if (!v20)
        {
LABEL_26:
          sub_2451DB430();
          __break(1u);
          JUMPOUT(0x2451D8044);
        }
        unint64_t v12 = v20;
        uint64_t v21 = sub_2451DB440();
        BOOL v10 = __OFSUB__(v19, v21);
        uint64_t v22 = v19 - v21;
        if (v10) {
          goto LABEL_23;
        }
        sub_2451DB430();
        uint64_t v23 = v12 + v22;
        int v24 = *(unsigned __int8 *)(v12 + v22);
        LOWORD(v12) = *(_WORD *)(v23 + 2);
        LOWORD(v17) = *(_WORD *)(v23 + 4);
        swift_release();
        swift_release();
        if (v24 == 1) {
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v12 = (unint64_t)a1 >> 16;
        unint64_t v17 = HIDWORD(a1);
        if (a1 == 1) {
          goto LABEL_15;
        }
      }
LABEL_19:
      type metadata accessor for SCError(0);
      sub_2451D6B10(MEMORY[0x263F8EE78]);
      sub_2451DA384(&qword_268ECC9C0, type metadata accessor for SCError);
      sub_2451DB4C0();
      swift_willThrow();
      return sub_2451D9C7C(a1, a2);
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_21;
    case 3uLL:
      goto LABEL_19;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL SCSensitivityAnalysis.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_2451D7580(a1, (uint64_t)v7, &qword_268ECC9B8);
  if (v8)
  {
    type metadata accessor for SCSensitivityAnalysis(v2);
    if (swift_dynamicCast())
    {
      int v3 = *(unsigned __int16 *)&v6[OBJC_IVAR___SCSensitivityAnalysis__analysis];
      int v4 = *(unsigned __int16 *)&v6[OBJC_IVAR___SCSensitivityAnalysis__analysis + 2];

      if (v3 == *(unsigned __int16 *)(v1 + OBJC_IVAR___SCSensitivityAnalysis__analysis)) {
        return v4 == *(unsigned __int16 *)(v1 + OBJC_IVAR___SCSensitivityAnalysis__analysis + 2);
      }
    }
  }
  else
  {
    sub_2451DA89C((uint64_t)v7, &qword_268ECC9B8);
  }
  return 0;
}

BOOL static SensitivityAnalysis.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void __swiftcall SCSensitivityAnalysis.init()(SCSensitivityAnalysis *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void SCSensitivityAnalysis.init()()
{
}

uint64_t static SCSensitivityAnalysis.prefetchSensitiveContentPolicy()()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2451D2164;
  return static SensitiveContentPolicy.prefetch()();
}

uint64_t sub_2451D847C(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_2451D8514;
  return static SensitiveContentPolicy.prefetch()();
}

uint64_t sub_2451D8514()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v7 = (void *)sub_2451DB4D0();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v8 = *(uint64_t (**)(void))(v5 + 8);
  return v8();
}

uint64_t SCSensitivityAnalysis.dataRepresentation.getter()
{
  int v1 = *(_DWORD *)(v0 + OBJC_IVAR___SCSensitivityAnalysis__analysis);
  uint64_t v2 = swift_slowAlloc();
  *(unsigned char *)uint64_t v2 = 1;
  *(_DWORD *)(v2 + 2) = v1;
  uint64_t v3 = sub_2451D9B04((unsigned char *)v2, (unsigned char *)(v2 + 6));
  MEMORY[0x24569A9F0](v2, -1, -1);
  return v3;
}

id SCSensitivityAnalysis.init(dataRepresentation:)(uint64_t a1, unint64_t a2)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_2451DB520();
  v10[0] = 0;
  id v6 = objc_msgSend(v4, sel_initWithDataRepresentation_error_, v5, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_2451DB4E0();

    swift_willThrow();
  }
  sub_2451D9C7C(a1, a2);
  return v6;
}

objc_class *SCSensitivityAnalysis.init(dataRepresentation:)(uint64_t a1, unint64_t a2)
{
  ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();
  sub_2451D9D50(a1, a2);
  SensitivityAnalysis.init(from:)(a1, a2, &v8);
  if (!v2)
  {
    int v6 = v8;
    ObjCClassFromObject = (objc_class *)objc_msgSend(objc_allocWithZone(ObjCClassFromObject), sel_initWithNudityDetectionValue_, 0);
    *(_DWORD *)((char *)ObjCClassFromObject + OBJC_IVAR___SCSensitivityAnalysis__analysis) = v6;
  }
  sub_2451D9C7C(a1, a2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return ObjCClassFromObject;
}

char *SCSensitivityAnalysis.init(analysis:)(int *a1)
{
  int v1 = *a1;
  uint64_t result = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNudityDetectionValue_, 0);
  *(_DWORD *)&result[OBJC_IVAR___SCSensitivityAnalysis__analysis] = v1;
  return result;
}

uint64_t SensitivityAnalysis.Harms.rawValue.getter()
{
  return *v0;
}

void static SensitivityAnalysis.Harms.gore.getter(_WORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2451D8B24()
{
  return sub_2451DB680();
}

uint64_t sub_2451D8B84()
{
  return sub_2451DB670();
}

uint64_t sub_2451D8BDC@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  return sub_2451D8BF4(a1, a2);
}

uint64_t sub_2451D8BF4@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (unsigned __int16 *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    LOWORD(v4) = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t SensitivityAnalysis.Flags.rawValue.getter()
{
  return *v0;
}

uint64_t SensitivityAnalysis.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static SensitivityAnalysis.Flags.userOptedToShow.getter(_WORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2451D8C68()
{
  return sub_2451DB680();
}

uint64_t sub_2451D8CC8()
{
  return sub_2451DB670();
}

_WORD *sub_2451D8D18@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2451D8D24(_WORD *a1@<X8>)
{
  *a1 = 0;
}

_WORD *sub_2451D8D2C@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_WORD *sub_2451D8D40@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_WORD *sub_2451D8D54@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2451D8D68(_WORD *a1, unsigned __int16 *a2)
{
  int v3 = *a2;
  int v4 = (unsigned __int16)*v2;
  if ((v4 & v3) != v3) {
    _WORD *v2 = v4 | v3;
  }
  *a1 = v3;
  return (v4 & v3) != v3;
}

unsigned __int16 *sub_2451D8D98@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = (unsigned __int16)*v2;
  int v5 = v4 & v3;
  if ((v4 & v3) != 0) {
    _WORD *v2 = v4 & ~(_WORD)v3;
  }
  *(_WORD *)a2 = v5;
  *(unsigned char *)(a2 + 2) = v5 == 0;
  return result;
}

unsigned __int16 *sub_2451D8DC4@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = (unsigned __int16)*v2;
  _WORD *v2 = v4 | v3;
  int v5 = v4 & v3;
  *(_WORD *)a2 = v5;
  *(unsigned char *)(a2 + 2) = v5 == 0;
  return result;
}

_WORD *sub_2451D8DE8(_WORD *result)
{
  *v1 |= *result;
  return result;
}

_WORD *sub_2451D8DFC(_WORD *result)
{
  *v1 &= *result;
  return result;
}

_WORD *sub_2451D8E10(_WORD *result)
{
  *v1 ^= *result;
  return result;
}

_WORD *sub_2451D8E24@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2451D8E38(unsigned __int16 *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2451D8E4C(_WORD *a1)
{
  return (unsigned __int16)(*v1 & *a1) == 0;
}

BOOL sub_2451D8E60(unsigned __int16 *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2451D8E74()
{
  return *v0 == 0;
}

_WORD *sub_2451D8E84(_WORD *result)
{
  *v1 &= ~*result;
  return result;
}

_WORD *sub_2451D8E98@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void sub_2451D8EA8(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2451D8EB4(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

void SensitivityAnalysis.harmsDetected.getter(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

void SensitivityAnalysis.flags.getter(_WORD *a1@<X8>)
{
  *a1 = *(_WORD *)(v1 + 2);
}

_WORD *SensitivityAnalysis.flags.setter(_WORD *result)
{
  *(_WORD *)(v1 + 2) = *result;
  return result;
}

uint64_t (*SensitivityAnalysis.flags.modify())()
{
  return nullsub_1;
}

_WORD *SensitivityAnalysis.init(harmsDetected:flags:)@<X0>(_WORD *result@<X0>, __int16 *a2@<X1>, _WORD *a3@<X8>)
{
  __int16 v3 = *a2;
  *a3 = *result;
  a3[1] = v3;
  return result;
}

unsigned __int16 *SensitivityAnalysis.init(harms:)@<X0>(unsigned __int16 *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2451D8F30()
{
  if (*v0) {
    return 0x7367616C66;
  }
  else {
    return 0x746544736D726168;
  }
}

uint64_t sub_2451D8F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2451DA4D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2451D8F9C(uint64_t a1)
{
  unint64_t v2 = sub_2451D9DA8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2451D8FD8(uint64_t a1)
{
  unint64_t v2 = sub_2451D9DA8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SensitivityAnalysis.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC9D0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v8 = *v1;
  int v11 = (unsigned __int16)v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451D9DA8();
  sub_2451DB9A0();
  __int16 v15 = v8;
  char v14 = 0;
  sub_2451D9DFC();
  sub_2451DB8D0();
  if (!v2)
  {
    __int16 v12 = v11;
    char v13 = 1;
    sub_2451D9E50();
    sub_2451DB8D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SensitivityAnalysis.init(from:)@<X0>(void *a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC9E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  __int16 v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2451D9DA8();
  sub_2451DB990();
  if (!v2)
  {
    char v15 = 0;
    sub_2451D9EA4();
    sub_2451DB8A0();
    __int16 v9 = v16;
    char v14 = 1;
    sub_2451D9EF8();
    sub_2451DB8A0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __int16 v10 = v13;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2451D9380@<X0>(void *a1@<X0>, _WORD *a2@<X8>)
{
  return SensitivityAnalysis.init(from:)(a1, a2);
}

uint64_t sub_2451D9398(void *a1)
{
  return SensitivityAnalysis.encode(to:)(a1);
}

BOOL sub_2451D93B0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_2451D9404()
{
  if (*(_WORD *)(v0 + OBJC_IVAR___SCSensitivityAnalysis__analysis)) {
    BOOL v1 = (*(_WORD *)(v0 + OBJC_IVAR___SCSensitivityAnalysis__analysis + 2) & 1) == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    sub_2451CFF90((uint64_t)&v8);
    uint64_t v3 = v8;
    char v4 = v9;
    v6[0] = *(void *)sub_2451CDF80();
    v6[1] = v3;
    char v7 = v4;
    return sub_2451D00A0(v6);
  }
  else
  {
    return 0;
  }
}

BOOL sub_2451D9488()
{
  if (*v0) {
    BOOL v1 = (v0[1] & 1) == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    sub_2451CFF90((uint64_t)&v8);
    uint64_t v3 = v8;
    char v4 = v9;
    v6[0] = *(void *)sub_2451CDF80();
    v6[1] = v3;
    char v7 = v4;
    return sub_2451D00A0(v6);
  }
  else
  {
    return 0;
  }
}

id sub_2451D9550(uint64_t a1)
{
  id v2 = v1;
  id v7 = (id)sub_2451DB640();
  sub_2451DB800();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_2451D6FB4((uint64_t)v8), (v5 & 1) != 0))
  {
    sub_2451D9F88(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2451D7640((uint64_t)v8);
  if (!*((void *)&v10 + 1))
  {
    sub_2451DA89C((uint64_t)&v9, &qword_268ECC9B8);
    goto LABEL_9;
  }
  sub_2451D9F4C(0, &qword_268ECCA00);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    type metadata accessor for SCError(0);
    *(void *)&long long v9 = 51;
    sub_2451D6B10(MEMORY[0x263F8EE78]);
    sub_2451DA384(&qword_268ECC9C0, type metadata accessor for SCError);
    sub_2451DB4C0();
    swift_willThrow();
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v2;
  }
  id v2 = objc_msgSend(v2, sel_initWithNudityDetectionValue_, objc_msgSend(v7, sel_BOOLValue));

  return v2;
}

uint64_t sub_2451D97C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unint64_t v4 = v3;
  v4[1] = sub_2451D2FF0;
  return v6();
}

uint64_t sub_2451D988C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *char v5 = v4;
  v5[1] = sub_2451D2FF0;
  return v7();
}

uint64_t sub_2451D9958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2451DB6E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2451DB6D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2451DA89C(a1, &qword_268ECCB60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2451DB690();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2451D9B04(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_2451D9BC8(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_2451D9B04(__src, &__src[a2]);
  }
  sub_2451DB450();
  swift_allocObject();
  sub_2451DB410();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_2451DB510();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_2451D9C7C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2451D9CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC9B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SCSensitivityAnalysis(uint64_t a1)
{
  return sub_2451D9F4C(a1, qword_268ECE870);
}

uint64_t sub_2451D9D50(uint64_t a1, unint64_t a2)
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

unint64_t sub_2451D9DA8()
{
  unint64_t result = qword_268ECDFE0[0];
  if (!qword_268ECDFE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECDFE0);
  }
  return result;
}

unint64_t sub_2451D9DFC()
{
  unint64_t result = qword_268ECC9D8;
  if (!qword_268ECC9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC9D8);
  }
  return result;
}

unint64_t sub_2451D9E50()
{
  unint64_t result = qword_268ECC9E0;
  if (!qword_268ECC9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC9E0);
  }
  return result;
}

unint64_t sub_2451D9EA4()
{
  unint64_t result = qword_268ECC9F0;
  if (!qword_268ECC9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC9F0);
  }
  return result;
}

unint64_t sub_2451D9EF8()
{
  unint64_t result = qword_268ECC9F8;
  if (!qword_268ECC9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECC9F8);
  }
  return result;
}

uint64_t sub_2451D9F4C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2451D9F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2451D9FE8()
{
  unint64_t result = qword_268ECCA08;
  if (!qword_268ECCA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA08);
  }
  return result;
}

unint64_t sub_2451DA048()
{
  unint64_t result = qword_268ECCA20;
  if (!qword_268ECCA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA20);
  }
  return result;
}

unint64_t sub_2451DA0A0()
{
  unint64_t result = qword_268ECCA28;
  if (!qword_268ECCA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA28);
  }
  return result;
}

unint64_t sub_2451DA0F8()
{
  unint64_t result = qword_268ECCA30;
  if (!qword_268ECCA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA30);
  }
  return result;
}

unint64_t sub_2451DA150()
{
  unint64_t result = qword_268ECCA38;
  if (!qword_268ECCA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA38);
  }
  return result;
}

unint64_t sub_2451DA1A8()
{
  unint64_t result = qword_268ECCA40;
  if (!qword_268ECCA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECCA40);
  }
  return result;
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SensitivityAnalysis(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SensitivityAnalysis(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SensitivityAnalysis()
{
  return &type metadata for SensitivityAnalysis;
}

ValueMetadata *type metadata accessor for SensitivityAnalysis.Harms()
{
  return &type metadata for SensitivityAnalysis.Harms;
}

ValueMetadata *type metadata accessor for SensitivityAnalysis.Flags()
{
  return &type metadata for SensitivityAnalysis.Flags;
}

unsigned char *storeEnumTagSinglePayload for SensitivityAnalysis.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2451DA34CLL);
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

ValueMetadata *type metadata accessor for SensitivityAnalysis.CodingKeys()
{
  return &type metadata for SensitivityAnalysis.CodingKeys;
}

uint64_t sub_2451DA384(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2451DA3D0()
{
  unint64_t result = qword_268ECE980[0];
  if (!qword_268ECE980[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECE980);
  }
  return result;
}

unint64_t sub_2451DA428()
{
  unint64_t result = qword_268ECEA90;
  if (!qword_268ECEA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECEA90);
  }
  return result;
}

unint64_t sub_2451DA480()
{
  unint64_t result = qword_268ECEA98[0];
  if (!qword_268ECEA98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268ECEA98);
  }
  return result;
}

uint64_t sub_2451DA4D4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746544736D726168 && a2 == 0xED00006465746365;
  if (v2 || (sub_2451DB8F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2451DB8F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2451DA5E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451DA61C()
{
  BOOL v2 = *(const void **)(v0 + 16);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_2451D2FF0;
  unsigned int v4 = (uint64_t (*)(const void *))((char *)&dword_268ECCB68 + dword_268ECCB68);
  return v4(v2);
}

uint64_t sub_2451DA6CC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2451D2FF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268ECCB78 + dword_268ECCB78);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_17Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2451DA7D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2451D2164;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268ECCB88 + dword_268ECCB88);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2451DA89C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2451DA8F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2451DA930(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2451D2164;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268ECCB98 + dword_268ECCB98);
  return v6(a1, v4);
}

uint64_t sub_2451DAA40(uint64_t a1, int a2)
{
  type metadata accessor for SCError(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCBB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2451DD9E0;
  *(void *)(inited + 32) = sub_2451DB640();
  *(void *)(inited + 40) = v4;
  sub_2451DB640();
  id v5 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v6 = (void *)sub_2451DB630();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithDomain_code_userInfo_, v6, a2, 0);

  *(void *)(inited + 72) = sub_2451DAB98();
  *(void *)(inited + 48) = v7;
  sub_2451DABD8(inited);
  sub_2451DA384(&qword_268ECC9C0, type metadata accessor for SCError);
  sub_2451DB4C0();
  return v9;
}

unint64_t sub_2451DAB98()
{
  unint64_t result = qword_268ECCBC0;
  if (!qword_268ECCBC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268ECCBC0);
  }
  return result;
}

unint64_t sub_2451DABD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECC928);
  uint64_t v2 = sub_2451DB860();
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
    sub_2451DAD7C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2451DAD04(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2451D7514(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2451DAD04(uint64_t a1, uint64_t a2)
{
  sub_2451DB960();
  sub_2451DB650();
  uint64_t v4 = sub_2451DB980();

  return sub_2451DADE4(a1, a2, v4);
}

uint64_t sub_2451DAD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECCBB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2451DADE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2451DB8F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2451DB8F0() & 1) == 0);
    }
  }
  return v6;
}

void SCIsAnalyticsEnabled_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2451C6000, a2, OS_LOG_TYPE_ERROR, "Error fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getSTCommunicationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SCSensitivityAnalyzer _mapMOScanningPolicyEnumValue:](v0);
}

void __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1(v0);
}

void __getMADImageSafetyClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1(v0);
}

void __getMADVideoSafetyClassificationRequestClass_block_invoke_cold_1()
{
}

uint64_t sub_2451DB410()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2451DB420()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2451DB430()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2451DB440()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2451DB450()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2451DB4C0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2451DB4D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2451DB4E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2451DB4F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2451DB500()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2451DB510()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2451DB520()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2451DB530()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2451DB540()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2451DB550()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2451DB560()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2451DB570()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2451DB580()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2451DB590()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2451DB5A0()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2451DB5B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2451DB5C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2451DB5D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2451DB5E0()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_2451DB5F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2451DB600()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2451DB610()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2451DB620()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2451DB630()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2451DB640()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2451DB650()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2451DB660()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2451DB670()
{
  return MEMORY[0x270F9DAD0]();
}

uint64_t sub_2451DB680()
{
  return MEMORY[0x270F9DB50]();
}

uint64_t sub_2451DB690()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2451DB6B0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2451DB6C0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2451DB6D0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2451DB6E0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2451DB6F0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2451DB700()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2451DB710()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2451DB730()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_2451DB740()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_2451DB750()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2451DB760()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2451DB770()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_2451DB780()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2451DB790()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2451DB7A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2451DB7B0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2451DB7D0()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_2451DB7E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2451DB7F0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2451DB800()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2451DB810()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2451DB820()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2451DB830()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_2451DB840()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2451DB850()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2451DB860()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2451DB870()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2451DB880()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2451DB890()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2451DB8A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2451DB8B0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2451DB8C0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2451DB8D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2451DB8E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2451DB8F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2451DB920()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2451DB930()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2451DB940()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2451DB950()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2451DB960()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2451DB970()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2451DB980()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2451DB990()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2451DB9A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x270FA03D8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}