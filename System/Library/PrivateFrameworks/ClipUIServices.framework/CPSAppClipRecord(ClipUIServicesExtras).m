@interface CPSAppClipRecord(ClipUIServicesExtras)
+ (void)getApplicationIconForBundleIdentifier:()ClipUIServicesExtras imageDescriptor:resultHandler:;
- (void)getApplicationIconForImageDescriptor:()ClipUIServicesExtras resultHandler:;
@end

@implementation CPSAppClipRecord(ClipUIServicesExtras)

- (void)getApplicationIconForImageDescriptor:()ClipUIServicesExtras resultHandler:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(a1, "debug_fullApplicationIcon");
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6F248]);
    id v10 = objc_alloc(MEMORY[0x1E4F6F238]);
    id v11 = v8;
    uint64_t v12 = [v11 CGImage];
    [v11 scale];
    v13 = objc_msgSend(v10, "initWithCGImage:scale:", v12);
    v19[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15 = (void *)[v9 initWithImages:v14];

    v16 = [v15 imageForImageDescriptor:v6];
    sendResult(v16, v7);
  }
  else
  {
    v17 = objc_opt_class();
    v18 = [a1 bundleID];
    [v17 getApplicationIconForBundleIdentifier:v18 imageDescriptor:v6 resultHandler:v7];
  }
}

+ (void)getApplicationIconForBundleIdentifier:()ClipUIServicesExtras imageDescriptor:resultHandler:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 length];
  if (v10)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  }
  uint64_t v12 = v11;
  v13 = [v11 imageForImageDescriptor:v8];
  sendResult(v13, v9);
  char v14 = [v13 placeholder];
  if (v10) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  if (v15)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke;
    v16[3] = &unk_1E6AE8D78;
    id v17 = v9;
    [v12 getImageForImageDescriptor:v8 completion:v16];
  }
}

@end