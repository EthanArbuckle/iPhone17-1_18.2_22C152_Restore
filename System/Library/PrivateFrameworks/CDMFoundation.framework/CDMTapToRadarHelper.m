@interface CDMTapToRadarHelper
+ (BOOL)createProblemWithTitle:(id)a3 description:(id)a4 displayReason:(id)a5;
@end

@implementation CDMTapToRadarHelper

+ (BOOL)createProblemWithTitle:(id)a3 description:(id)a4 displayReason:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!+[CDMPlatformUtils isInternalInstall])
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Not on internal build. Not issuing a TTR", buf, 0xCu);
    }
    goto LABEL_8;
  }
  BOOL v10 = +[CDMUserDefaultsUtils isTapToRadarDisabled];
  v11 = CDMOSLoggerForCategory(0);
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s TTR disabled via User Default. Skipping", buf, 0xCu);
    }
LABEL_8:

    BOOL v13 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Creating Tap To Radar with title: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v27 = 0;
  id v14 = objc_alloc_init(getRadarDraftClass());
  [v14 setTitle:v7];
  [v14 setProblemDescription:v8];
  [v14 setIsUserInitiated:0];
  [v14 setClassification:7];
  [v14 setReproducibility:5];
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v16 = (void *)[objc_alloc(getRadarComponentClass()) initWithName:@"Siri NLX Runtime" version:@"All" identifier:1110226];
  [v14 setComponent:v16];
  v17 = [(objc_class *)getTapToRadarServiceClass() shared];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __72__CDMTapToRadarHelper_createProblemWithTitle_description_displayReason___block_invoke;
  v23[3] = &unk_2647A5408;
  v25 = buf;
  v18 = v15;
  v24 = v18;
  [v17 createDraft:v14 forProcessNamed:@"Siri" withDisplayReason:v9 completionHandler:v23];

  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  intptr_t v20 = dispatch_semaphore_wait(v18, v19);
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  BOOL v13 = v21;

  _Block_object_dispose(buf, 8);
LABEL_18:

  return v13;
}

void __72__CDMTapToRadarHelper_createProblemWithTitle_description_displayReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v3 localizedDescription];
      int v6 = 136315394;
      id v7 = "+[CDMTapToRadarHelper createProblemWithTitle:description:displayReason:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: TapToRadarKitHelper#createProblem error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end