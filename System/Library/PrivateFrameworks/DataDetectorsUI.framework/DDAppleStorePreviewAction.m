@interface DDAppleStorePreviewAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
+ (id)urlForURL:(id)a3 result:(__DDResult *)a4;
- (BOOL)showMenuTitle;
- (id)commitURL;
- (id)createViewController;
- (id)menuActions;
- (id)previewActionsWithValidatedURL:(id)a3;
@end

@implementation DDAppleStorePreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  v4 = [a1 urlForURL:a3 result:a4];
  if (objc_msgSend(v4, "dd_isAppleStore"))
  {
    v5 = objc_msgSend(v4, "dd_productIdentifierFromAppleStoreScheme");
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)createViewController
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = +[DDAppleStorePreviewAction urlForURL:self->super.super._url result:self->super.super._result];
  v3 = objc_msgSend(v2, "dd_productIdentifierFromAppleStoreScheme");
  if (v3)
  {
    gotLoadHelper_x8__OBJC_CLASS___SKStoreProductViewController(v4);
    id v6 = objc_alloc_init(*(Class *)(v5 + 784));
    v7 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v8 = 1 << [v7 statusBarOrientation];

    if (([v6 supportedInterfaceOrientations] & v8) != 0)
    {
      double Helper_x8__SKStoreProductParameterITunesItemIdentifier = gotLoadHelper_x8__SKStoreProductParameterITunesItemIdentifier(v9);
      uint64_t v14 = **(void **)(v11 + 936);
      v15[0] = v3;
      v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, Helper_x8__SKStoreProductParameterITunesItemIdentifier);
      [v6 loadProductWithParameters:v12 completionBlock:&__block_literal_global_3];

      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

void __49__DDAppleStorePreviewAction_createViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __49__DDAppleStorePreviewAction_createViewController__block_invoke_cold_1();
  }
}

- (id)commitURL
{
  return +[DDAppleStorePreviewAction urlForURL:self->super.super._url result:self->super.super._result];
}

- (BOOL)showMenuTitle
{
  return 0;
}

+ (id)urlForURL:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    v7 = (void *)DDResultCopyExtractedURL();
    if (v7)
    {
      id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)previewActionsWithValidatedURL:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v4 = self->super.super._result;
  context = self->super.super._context;
  id v6 = a3;
  v7 = +[DDAction actionsWithURL:v6 result:v4 context:context];
  uint64_t v8 = [[DDCopyAction alloc] initWithURL:self->super.super._url result:self->super.super._result context:self->super.super._context];
  v13[0] = v8;
  double v9 = [[DDShareAction alloc] initWithURL:v6 result:self->super.super._result context:self->super.super._context];

  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v11 = [v7 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)menuActions
{
  id v3 = +[DDAppleStorePreviewAction urlForURL:self->super.super._url result:self->super.super._result];
  +[DDActionGroup emptyGroup]();
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  id v5 = +[DDAction actionsWithURL:v3 result:self->super.super._result context:self->super.super._context];
  -[DDActionGroup appendActions:](v4, v5);

  id v6 = [[DDCopyAction alloc] initWithURL:self->super.super._url result:self->super.super._result context:self->super.super._context];
  -[DDActionGroup appendAction:]((uint64_t)v4, v6);

  v7 = [[DDShareAction alloc] initWithURL:v3 result:self->super.super._result context:self->super.super._context];
  -[DDActionGroup appendAction:]((uint64_t)v4, v7);

  return v4;
}

void __49__DDAppleStorePreviewAction_createViewController__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error loading Apple Store content", v0, 2u);
}

@end