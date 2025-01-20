@interface WFMicrophoneAccessResource
+ (BOOL)isSystemResource;
- (id)icon;
- (id)name;
- (unint64_t)status;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFMicrophoneAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v8 = (void *)getAVAudioSessionClass_softClass_38146;
  uint64_t v18 = getAVAudioSessionClass_softClass_38146;
  if (!getAVAudioSessionClass_softClass_38146)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getAVAudioSessionClass_block_invoke_38147;
    v14[3] = &unk_264E5EC88;
    v14[4] = &v15;
    __getAVAudioSessionClass_block_invoke_38147((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);
  v10 = (void *)[v9 performSelector:sel_sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__WFMicrophoneAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v12[3] = &unk_264E5ADE8;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 requestRecordPermission:v12];
}

uint64_t __79__WFMicrophoneAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAvailabilityWithForcedNotification];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (unint64_t)status
{
  return 4;
}

- (id)icon
{
  return (id)[MEMORY[0x263F85308] workflowKitImageNamed:@"Microphone"];
}

- (id)name
{
  return WFLocalizedString(@"Microphone");
}

@end