@interface SGRadarSuggestion
+ (id)tapToRadarImage;
- (id)_writeEMLtoDiskForMessageWithIdentifier:(id)a3;
- (id)suggestionCategoryImage;
- (id)suggestionImage;
- (id)suggestionPrimaryAction;
- (void)_dismissViewController:(id)a3 andSignalCompletionWithResult:(BOOL)a4;
@end

@implementation SGRadarSuggestion

+ (id)tapToRadarImage
{
  v2 = (void *)tapToRadarImage_image;
  if (!tapToRadarImage_image)
  {
    uint64_t v3 = +[SGUIIconSupport spotlightIconImageWithBundleIdentifier:@"com.apple.TapToRadar"];
    v4 = (void *)tapToRadarImage_image;
    tapToRadarImage_image = v3;

    v2 = (void *)tapToRadarImage_image;
  }
  return v2;
}

- (id)_writeEMLtoDiskForMessageWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)getSGMailClientUtilClass_softClass;
  uint64_t v18 = getSGMailClientUtilClass_softClass;
  if (!getSGMailClientUtilClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSGMailClientUtilClass_block_invoke;
    v14[3] = &unk_1E612E840;
    v14[4] = &v15;
    __getSGMailClientUtilClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  v6 = [v5 sharedInstance];
  v7 = [v6 dataForMessageWithIdentifier:v3 error:0];
  if (v7)
  {
    v8 = NSTemporaryDirectory();
    v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    v11 = [v8 stringByAppendingPathComponent:v10];
    v12 = [v11 stringByAppendingPathExtension:@"eml"];

    if ([v7 writeToFile:v12 atomically:1]) {
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (id)suggestionCategoryImage
{
  v2 = objc_opt_class();
  return (id)[v2 tapToRadarImage];
}

- (id)suggestionImage
{
  v2 = objc_opt_class();
  return (id)[v2 tapToRadarImage];
}

- (void)_dismissViewController:(id)a3 andSignalCompletionWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SGRadarSuggestionBase *)self suggestionDelegate];
  [v7 dismissViewController:v6];

  id v8 = [(SGRadarSuggestionBase *)self suggestionDelegate];
  [v8 suggestion:self actionFinished:v4];
}

- (id)suggestionPrimaryAction
{
  id v3 = [(SGRadarSuggestionBase *)self primaryActionTitle];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke;
  v6[3] = &unk_1E612E548;
  v6[4] = self;
  BOOL v4 = +[SGSuggestionAction actionWithTitle:v3 handler:v6];

  return v4;
}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  v23 = [MEMORY[0x1E4F29088] componentsWithString:@"tap-to-radar://new"];
  v1 = (void *)MEMORY[0x1E4F1CA48];
  v2 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:@"Found in Apps"];
  id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:@"Structured Events"];
  BOOL v4 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:@"580699"];
  id v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Title" value:@"[TTR] Extraction Exception"];
  id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:@"** The original email will be attached to this radar. Please make sure you are OK sharing this email. **"];
  v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:@"Other Bug"];
  id v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducibility" value:@"Not Applicable"];
  v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"AutoDiagnostics" value:@"phone"];
  v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"DeleteOnAttach" value:@"1"];
  v11 = objc_msgSend(v1, "arrayWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);

  v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Would you like to attach the EML file to the radar?" preferredStyle:0];
  v13 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_2;
  v27[3] = &unk_1E612E380;
  v27[4] = *(void *)(a1 + 32);
  id v14 = v11;
  id v28 = v14;
  id v15 = v23;
  id v29 = v15;
  v16 = [v13 actionWithTitle:@"Yes, attach the EML file", 0, v27 style handler];
  [v12 addAction:v16];

  uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_3;
  v24[3] = &unk_1E612E460;
  id v25 = v15;
  id v26 = v14;
  id v18 = v14;
  id v19 = v15;
  v20 = [v17 actionWithTitle:@"No, don't attach", 2, v24 style handler];
  [v12 addAction:v20];

  [v12 setModalPresentationStyle:7];
  v21 = [*(id *)(a1 + 32) suggestionDelegate];
  [v21 presentViewController:v12];
}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _writeEMLtoDiskForMessageWithIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];
  v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Attachments" value:v6];
  [v2 addObject:v3];

  [*(id *)(a1 + 48) setQueryItems:*(void *)(a1 + 40)];
  BOOL v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v5 = [*(id *)(a1 + 48) URL];
  [v4 openURL:v5 configuration:0 completionHandler:0];
}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setQueryItems:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [*(id *)(a1 + 32) URL];
  [v3 openURL:v2 configuration:0 completionHandler:0];
}

@end