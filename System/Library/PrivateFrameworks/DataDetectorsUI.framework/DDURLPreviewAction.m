@interface DDURLPreviewAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
+ (id)validatedURLWithURL:(id)a3 result:(__DDResult *)a4;
- (BOOL)requiresEmbeddingNavigationController;
- (BOOL)showMenuTitle;
- (id)commitURL;
- (id)createViewController;
- (id)menuActions;
- (void)setPreviewMode:(BOOL)a3;
@end

@implementation DDURLPreviewAction

- (BOOL)showMenuTitle
{
  return 0;
}

- (id)menuActions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(DDAction *)self url];
  if (v3
    || [(DDAction *)self result]
    && (_DDURLFromResult((uint64_t)[(DDAction *)self result]),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = +[DDURLPreviewAction validatedURLWithURL:v3 result:0];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = +[DDAction actionsWithURL:result:context:](DDOpenURLAction, "actionsWithURL:result:context:", v4, 0, self->super.super._context, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    if (+[DDAddToReadingListAction isAvailable])
    {
      v11 = [(DDAction *)[DDAddToReadingListAction alloc] initWithURL:v4 result:0 context:self->super.super._context];
      [v5 addObject:v11];
    }
    v12 = [[DDCopyAction alloc] initWithURL:v3 result:0 context:self->super.super._context];
    [v5 addObject:v12];

    v13 = [[DDShareAction alloc] initWithURL:v4 result:0 context:self->super.super._context];
    [v5 addObject:v13];

    v14 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v5);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)validatedURLWithURL:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  if (a4)
  {
    uint64_t v6 = DDShipmentTrackingUrlForResult();
    if (v6)
    {
      id v7 = (id)v6;
      goto LABEL_16;
    }
    uint64_t v8 = (void *)DDResultCopyExtractedURL();
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }

    id v5 = (id)v9;
  }
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_17;
  }
  v10 = [v5 scheme];
  v11 = [v10 lowercaseString];

  if ((([v11 isEqualToString:@"http"] & 1) != 0
     || [v11 isEqualToString:@"https"])
    && (objc_msgSend(v5, "dd_isMaps:", 1) & 1) == 0)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

LABEL_16:
LABEL_17:
  return v7;
}

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    v4 = 0;
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(a1, "validatedURLWithURL:result:");
  if (!v4 || (applicationWithBundleIdentifierIsRestricted(@"com.apple.mobilesafari") & 1) != 0) {
    goto LABEL_6;
  }
  int v5 = objc_msgSend(v4, "dd_isCloudLink") ^ 1;
LABEL_7:

  return v5;
}

- (id)createViewController
{
  v3 = +[DDURLPreviewAction validatedURLWithURL:self->super.super._url result:self->super.super._result];
  viewController = self->super.super._viewController;
  if (!viewController)
  {
    int v5 = (UIViewController *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v3];
    uint64_t v6 = self->super.super._viewController;
    self->super.super._viewController = v5;

    viewController = self->super.super._viewController;
  }
  id v7 = viewController;

  return v7;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (void)setPreviewMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DDPreviewAction *)self viewController];
  [v4 _setShowingLinkPreview:v3];
}

- (id)commitURL
{
  return +[DDURLPreviewAction validatedURLWithURL:self->super.super._url result:self->super.super._result];
}

@end