@interface MFSoundController
+ (id)lazyAlertWithType:(int64_t)a3 topic:(id)a4;
+ (void)_playAlertWithType:(int64_t)a3 topic:(id)a4;
+ (void)playNewMailSoundStyle:(unint64_t)a3 forAccount:(id)a4;
+ (void)playSentMailSound;
@end

@implementation MFSoundController

+ (id)lazyAlertWithType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc(getTLAlertConfigurationClass()) initWithType:a3];
  [v6 setTopic:v5];
  v7 = [(objc_class *)getTLAlertClass() alertWithConfiguration:v6];
  v8 = (void *)MEMORY[0x1E4F60D70];
  if (v7)
  {
    v9 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__MFSoundController_lazyAlertWithType_topic___block_invoke;
    v13[3] = &unk_1E5F7D270;
    id v14 = v7;
    v10 = [v8 onScheduler:v9 lazyFutureWithBlock:v13];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFSoundControllerErrorDomain" code:0 userInfo:0];
    v10 = [v8 futureWithError:v11];
  }

  return v10;
}

id __45__MFSoundController_lazyAlertWithType_topic___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x1E4F60E18] promise];
  id v5 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__MFSoundController_lazyAlertWithType_topic___block_invoke_2;
  v10[3] = &unk_1E5F7D248;
  id v6 = v4;
  id v11 = v6;
  [v5 playWithCompletionHandler:v10];
  v7 = [v6 future];
  v8 = [v7 result:a2];

  return v8;
}

void __45__MFSoundController_lazyAlertWithType_topic___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (v5)
  {
    id v6 = v5;
    v7 = 0;
  }
  else
  {
    v7 = [NSNumber numberWithInteger:a2];
    id v6 = 0;
  }
  [*(id *)(a1 + 32) finishWithResult:v7 error:v6];
}

+ (void)_playAlertWithType:(int64_t)a3 topic:(id)a4
{
  id v6 = a4;
  v20 = [a1 lazyAlertWithType:a3 topic:v6];
  v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke;
  v29[3] = &unk_1E5F7D298;
  id v8 = v7;
  id v30 = v8;
  v31 = &v32;
  uint64_t v9 = [v8 beginBackgroundTaskWithExpirationHandler:v29];
  v33[3] = v9;
  v10 = (void *)MEMORY[0x1E4F60D80];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_22;
  v26[3] = &unk_1E5F7D298;
  id v11 = v8;
  id v27 = v11;
  v28 = &v32;
  v12 = [v10 tokenWithInvocationBlock:v26];
  v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_2;
  v23[3] = &unk_1E5F79038;
  id v14 = v20;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  id v16 = (id)[v13 afterDelay:v23 performBlock:30.0];
  v17 = [(objc_class *)getFMDFMIPManagerClass() sharedInstance];
  LODWORD(v10) = [v17 lostModeIsActive];

  if (v10)
  {
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFSoundControllerErrorDomain" code:2 userInfo:0];
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[MFSoundController _playAlertWithType:topic:]((uint64_t)v18, a3, v19);
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__MFSoundController__playAlertWithType_topic___block_invoke_23;
    v21[3] = &unk_1E5F79088;
    id v22 = v15;
    [v14 onScheduler:v13 always:v21];
    v18 = v22;
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke(uint64_t a1)
{
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_INFO, "Background task expired (play alert)", v4, 2u);
  }

  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = *(void **)(a1 + 40);

  return [v2 invoke];
}

uint64_t __46__MFSoundController__playAlertWithType_topic___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

+ (void)playSentMailSound
{
}

+ (void)playNewMailSoundStyle:(unint64_t)a3 forAccount:(id)a4
{
  id v9 = a4;
  id v6 = v9;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      v7 = (void **)MEMORY[0x1E4F73E30];
      goto LABEL_6;
    case 3uLL:
      v7 = (void **)MEMORY[0x1E4F73E28];
      goto LABEL_6;
    case 4uLL:
      v7 = (void **)MEMORY[0x1E4F73E20];
LABEL_6:
      id v6 = *v7;
LABEL_7:
      id v8 = v6;
      if (v8) {
        [a1 _playAlertWithType:5 topic:v8];
      }
      break;
    default:
      id v8 = 0;
      break;
  }
}

+ (void)_playAlertWithType:(os_log_t)log topic:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Not playing alert of type %ld: %@", (uint8_t *)&v3, 0x16u);
}

@end