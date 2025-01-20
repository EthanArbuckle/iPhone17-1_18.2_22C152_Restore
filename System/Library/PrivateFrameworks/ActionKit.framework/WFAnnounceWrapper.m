@interface WFAnnounceWrapper
+ (NSString)afPreferencesLanguageCode;
+ (NSString)currentSiriVoiceVSAssetName;
+ (NSURL)sharedAnnouncementsDirectoryURL;
- (ANAnnounce)announce;
- (WFAnnounceWrapper)init;
- (void)invalidate;
- (void)prewarmWithHandler:(id)a3;
- (void)requestAnnouncementWithAudioFileURL:(id)a3 homeAreaDescriptor:(id)a4 completionHandler:(id)a5;
@end

@implementation WFAnnounceWrapper

- (void).cxx_destruct
{
}

- (ANAnnounce)announce
{
  return self->_announce;
}

- (void)requestAnnouncementWithAudioFileURL:(id)a3 homeAreaDescriptor:(id)a4 completionHandler:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  v11 = (void *)getANAnnouncementContentClass_softClass;
  uint64_t v39 = getANAnnouncementContentClass_softClass;
  if (!getANAnnouncementContentClass_softClass)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __getANAnnouncementContentClass_block_invoke;
    v34 = &unk_264E5EC88;
    v35 = &v36;
    __getANAnnouncementContentClass_block_invoke((uint64_t)&v31);
    v11 = (void *)v37[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v36, 8);
  v13 = [v12 contentWithAudioFileURL:v8];
  uint64_t v14 = [v9 areaType];
  switch(v14)
  {
    case 2:
      id ANAnnouncementDestinationClass = getANAnnouncementDestinationClass();
      v16 = [v9 homeIdentifier];
      v19 = [v9 uniqueIdentifier];
      v40 = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      v17 = [ANAnnouncementDestinationClass destinationWithHomeIdentifier:v16 zoneIdentifiers:MEMORY[0x263EFFA68] roomIdentifiers:v20];

      goto LABEL_9;
    case 1:
      id v21 = getANAnnouncementDestinationClass();
      v16 = [v9 homeIdentifier];
      v22 = [v9 uniqueIdentifier];
      v41[0] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
      v17 = [v21 destinationWithHomeIdentifier:v16 zoneIdentifiers:v23 roomIdentifiers:MEMORY[0x263EFFA68]];

      goto LABEL_9;
    case 0:
      id v15 = getANAnnouncementDestinationClass();
      v16 = [v9 homeIdentifier];
      v17 = [v15 destinationWithHomeIdentifier:v16];
LABEL_9:

      goto LABEL_11;
  }
  v17 = 0;
LABEL_11:
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  v24 = (void *)getANAnnouncementRequestClass_softClass;
  uint64_t v39 = getANAnnouncementRequestClass_softClass;
  if (!getANAnnouncementRequestClass_softClass)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = __getANAnnouncementRequestClass_block_invoke;
    v34 = &unk_264E5EC88;
    v35 = &v36;
    __getANAnnouncementRequestClass_block_invoke((uint64_t)&v31);
    v24 = (void *)v37[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v36, 8);
  v26 = [v25 requestWithContent:v13 destination:v17];
  v27 = [(WFAnnounceWrapper *)self announce];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __94__WFAnnounceWrapper_requestAnnouncementWithAudioFileURL_homeAreaDescriptor_completionHandler___block_invoke;
  v29[3] = &unk_264E56A60;
  id v30 = v10;
  id v28 = v10;
  [v27 sendRequest:v26 completion:v29];
}

uint64_t __94__WFAnnounceWrapper_requestAnnouncementWithAudioFileURL_homeAreaDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v2 = [(WFAnnounceWrapper *)self announce];
  [v2 invalidate];
}

- (void)prewarmWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAnnounceWrapper *)self announce];
  [v5 prewarmWithHandler:v4];
}

- (WFAnnounceWrapper)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFAnnounceWrapper;
  id v2 = [(WFAnnounceWrapper *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getANAnnounceClass_softClass;
    uint64_t v14 = getANAnnounceClass_softClass;
    if (!getANAnnounceClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getANAnnounceClass_block_invoke;
      v10[3] = &unk_264E5EC88;
      v10[4] = &v11;
      __getANAnnounceClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v11, 8);
    id v5 = (ANAnnounce *)objc_alloc_init(v4);
    announce = v2->_announce;
    v2->_announce = v5;

    v7 = v2;
  }

  return v2;
}

+ (NSString)currentSiriVoiceVSAssetName
{
  id v2 = [getAFPreferencesClass() sharedPreferences];
  v3 = [v2 outputVoice];
  id v4 = [v3 name];

  return (NSString *)v4;
}

+ (NSString)afPreferencesLanguageCode
{
  id v2 = [getAFPreferencesClass() sharedPreferences];
  v3 = [v2 outputVoice];
  id v4 = [v3 languageCode];

  return (NSString *)v4;
}

+ (NSURL)sharedAnnouncementsDirectoryURL
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v2 = (void *)getHFUtilitiesClass_softClass;
  uint64_t v10 = getHFUtilitiesClass_softClass;
  if (!getHFUtilitiesClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getHFUtilitiesClass_block_invoke;
    v6[3] = &unk_264E5EC88;
    v6[4] = &v7;
    __getHFUtilitiesClass_block_invoke((uint64_t)v6);
    id v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 sharedAnnouncementsDirectoryURL];
  return (NSURL *)v4;
}

@end