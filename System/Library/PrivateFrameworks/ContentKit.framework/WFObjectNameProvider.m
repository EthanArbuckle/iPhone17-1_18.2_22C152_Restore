@interface WFObjectNameProvider
+ (id)sharedProvider;
- (NSDictionary)contents;
- (WFObjectNameProvider)init;
- (id)nameForObject:(id)a3;
@end

@implementation WFObjectNameProvider

- (void).cxx_destruct
{
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (id)nameForObject:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  while (1)
  {
    v6 = [(WFObjectNameProvider *)self contents];
    v7 = NSStringFromClass(v5);
    v8 = [v6 objectForKey:v7];

    if (v8) {
      break;
    }
    v5 = (objc_class *)[(objc_class *)v5 superclass];
    if (!v5)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
  v9 = ((void (**)(void, id))v8)[2](v8, v4);

LABEL_6:
  return v9;
}

- (WFObjectNameProvider)init
{
  v9[8] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)WFObjectNameProvider;
  v2 = [(WFObjectNameProvider *)&v7 init];
  if (v2)
  {
    v8[0] = @"PHAsset";
    v8[1] = @"PHAssetCollection";
    v9[0] = &__block_literal_global_31_20746;
    v9[1] = &__block_literal_global_37;
    v8[2] = @"EKCalendarItem";
    v8[3] = @"REMReminder";
    v9[2] = &__block_literal_global_51_20749;
    v9[3] = &__block_literal_global_57;
    v8[4] = @"MKMapItem";
    v8[5] = @"CLPlacemark";
    v9[4] = &__block_literal_global_63;
    v9[5] = &__block_literal_global_69;
    v8[6] = @"MPMediaItem";
    v8[7] = @"AVAsset";
    v9[6] = &__block_literal_global_75;
    v9[7] = &__block_literal_global_81;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:8];
    contents = v2->_contents;
    v2->_contents = (NSDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

id __28__WFObjectNameProvider_init__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v20 = a2;
  id v2 = [v20 commonMetadata];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v7 = [v6 commonKey];
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x2020000000;
        v8 = (void *)getAVMetadataCommonKeyTitleSymbolLoc_ptr_20756;
        uint64_t v33 = getAVMetadataCommonKeyTitleSymbolLoc_ptr_20756;
        if (!getAVMetadataCommonKeyTitleSymbolLoc_ptr_20756)
        {
          uint64_t v25 = MEMORY[0x263EF8330];
          uint64_t v26 = 3221225472;
          v27 = __getAVMetadataCommonKeyTitleSymbolLoc_block_invoke_20757;
          v28 = &unk_26428AC60;
          v29 = &v30;
          v9 = AVFoundationLibrary_20758();
          v10 = dlsym(v9, "AVMetadataCommonKeyTitle");
          *(void *)(v29[1] + 24) = v10;
          getAVMetadataCommonKeyTitleSymbolLoc_ptr_20756 = *(void *)(v29[1] + 24);
          v8 = (void *)v31[3];
        }
        _Block_object_dispose(&v30, 8);
        if (!v8)
        {
          v18 = [MEMORY[0x263F08690] currentHandler];
          v19 = [NSString stringWithUTF8String:"AVMetadataKey getAVMetadataCommonKeyTitle(void)"];
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFObjectNameProvider.m", 40, @"%s", dlerror());

          __break(1u);
        }
        char v11 = [v7 isEqual:*v8];

        if (v11)
        {
          v16 = [v6 stringValue];
          goto LABEL_19;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v34 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v2 = v20;
  if (!v2) {
    goto LABEL_18;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v12 = (void *)getAVURLAssetClass_softClass_20765;
  uint64_t v33 = getAVURLAssetClass_softClass_20765;
  if (!getAVURLAssetClass_softClass_20765)
  {
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __getAVURLAssetClass_block_invoke_20766;
    v28 = &unk_26428AC60;
    v29 = &v30;
    __getAVURLAssetClass_block_invoke_20766((uint64_t)&v25);
    v12 = (void *)v31[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v30, 8);
  if (objc_opt_isKindOfClass())
  {
    v14 = [v2 URL];
    v15 = [v14 lastPathComponent];
    v16 = [v15 stringByDeletingPathExtension];
  }
  else
  {
LABEL_18:
    v16 = 0;
  }
LABEL_19:

  return v16;
}

void __28__WFObjectNameProvider_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (void *)getMPMediaItemPropertyTitleSymbolLoc_ptr_20783;
  uint64_t v12 = getMPMediaItemPropertyTitleSymbolLoc_ptr_20783;
  if (!getMPMediaItemPropertyTitleSymbolLoc_ptr_20783)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMPMediaItemPropertyTitleSymbolLoc_block_invoke_20784;
    v8[3] = &unk_26428AC60;
    v8[4] = &v9;
    __getMPMediaItemPropertyTitleSymbolLoc_block_invoke_20784(v8);
    uint64_t v3 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    uint64_t v4 = [v2 valueForProperty:*v3];

    id v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    objc_super v7 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyTitle(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"WFObjectNameProvider.m", 36, @"%s", dlerror());

    __break(1u);
  }
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __28__WFObjectNameProvider_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 title];
  uint64_t v3 = [v2 string];

  return v3;
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 title];
}

id __28__WFObjectNameProvider_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 localizedTitle];

  if (v3)
  {
    uint64_t v4 = [v2 localizedTitle];
    goto LABEL_10;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v5 = (void *)getPHImportSessionClass_softClass;
  uint64_t v17 = getPHImportSessionClass_softClass;
  if (!getPHImportSessionClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getPHImportSessionClass_block_invoke;
    v13[3] = &unk_26428AC60;
    v13[4] = &v14;
    __getPHImportSessionClass_block_invoke((uint64_t)v13);
    id v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v4 = [v2 startDate];
  if (!v4) {
    goto LABEL_10;
  }
  objc_super v7 = (void *)MEMORY[0x263F08790];
  v8 = [v2 startDate];
  uint64_t v9 = [v7 localizedStringFromDate:v8 dateStyle:1 timeStyle:0];

  if (v9)
  {
    v10 = NSString;
    uint64_t v11 = WFLocalizedString(@"Imported on %@");
    uint64_t v4 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
  }
  else
  {
LABEL_9:
    uint64_t v4 = 0;
  }
LABEL_10:

  return v4;
}

id __28__WFObjectNameProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 originalFilename];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 stringByDeletingPathExtension];
  }
  else
  {
    id v6 = [v2 filename];
    id v5 = [v6 stringByDeletingPathExtension];
  }
  return v5;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken_20829 != -1) {
    dispatch_once(&sharedProvider_onceToken_20829, &__block_literal_global_20830);
  }
  id v2 = (void *)sharedProvider_sharedProvider;
  return v2;
}

uint64_t __38__WFObjectNameProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedProvider = objc_alloc_init(WFObjectNameProvider);
  return MEMORY[0x270F9A758]();
}

@end