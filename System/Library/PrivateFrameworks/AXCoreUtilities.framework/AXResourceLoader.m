@interface AXResourceLoader
+ (id)loadImageWithIdentifier:(id)a3 orPath:(id)a4 principalClass:(Class *)a5 error:(id *)a6;
+ (id)loadResource:(unint64_t)a3 principalClass:(Class *)a4 error:(id *)a5;
+ (void)_path:(id *)a3 bundleID:(id *)a4 forRescource:(unint64_t)a5;
@end

@implementation AXResourceLoader

+ (id)loadImageWithIdentifier:(id)a3 orPath:(id)a4 principalClass:(Class *)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9
    || ([MEMORY[0x1E4F28B50] bundleWithIdentifier:v9],
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = [MEMORY[0x1E4F28B50] bundleWithPath:v10];
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXResourceLoader", @"Bundle was nil. Tried ID:%@ and Path:%@", v9, v10);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = v14;
      if (!a5) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  v12 = AXLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_18FC6C000, v12, OS_LOG_TYPE_INFO, "Loading resource: %@", buf, 0xCu);
  }

  if (([v11 isLoaded] & 1) == 0)
  {
    id v16 = 0;
    [v11 loadAndReturnError:&v16];
    id v14 = v16;
    goto LABEL_11;
  }
  v13 = 0;
  if (a5) {
LABEL_12:
  }
    *a5 = (Class)[v11 principalClass];
LABEL_13:
  if (a6) {
    *a6 = v13;
  }

  return v11;
}

+ (id)loadResource:(unint64_t)a3 principalClass:(Class *)a4 error:(id *)a5
{
  id v12 = 0;
  id v13 = 0;
  [a1 _path:&v13 bundleID:&v12 forRescource:a3];
  unint64_t v8 = (unint64_t)v13;
  unint64_t v9 = (unint64_t)v12;
  id v10 = 0;
  if (v8 | v9)
  {
    id v10 = [a1 loadImageWithIdentifier:v9 orPath:v8 principalClass:a4 error:a5];
  }

  return v10;
}

+ (void)_path:(id *)a3 bundleID:(id *)a4 forRescource:(unint64_t)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  switch(a5)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2050000000;
      id v12 = (void *)getCLFSystemShellSwitcherClass_softClass;
      uint64_t v20 = getCLFSystemShellSwitcherClass_softClass;
      if (!getCLFSystemShellSwitcherClass_softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __getCLFSystemShellSwitcherClass_block_invoke;
        v16[3] = &unk_1E56725B8;
        v16[4] = &v17;
        __getCLFSystemShellSwitcherClass_block_invoke((uint64_t)v16);
        id v12 = (void *)v18[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v17, 8);
      id v14 = [v13 sharedSystemShellSwitcher];
      char v15 = [v14 isClarityBoardEnabled];

      if ((v15 & 1) == 0)
      {
        unint64_t v8 = AXAccessibilityPrivateFrameworksDirectory();
        id v10 = [v8 stringByAppendingPathComponent:@"AXSpringBoardServerInstance.framework"];
        v11 = 0;
        goto LABEL_11;
      }
LABEL_8:
      id v10 = 0;
      v11 = 0;
      goto LABEL_12;
    case 3uLL:
      v7 = NSString;
      unint64_t v8 = AXAccessibilityBundlesDirectory();
      v21[0] = v8;
      v21[1] = @"QuickSpeak.bundle";
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      id v10 = [v7 pathWithComponents:v9];

      v11 = @"com.apple.QuickSpeak";
LABEL_11:

LABEL_12:
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_13;
  }
  v11 = 0;
  id v10 = 0;
  *a3 = 0;
  *a4 = 0;
LABEL_13:
  id v10 = v10;
  *a3 = v10;
LABEL_14:
  if (a4) {
    *a4 = v11;
  }
}

@end