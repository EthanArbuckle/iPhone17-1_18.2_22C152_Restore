@interface DDNewsPreviewAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
+ (id)urlForURL:(id)a3 result:(__DDResult *)a4;
- (BOOL)requiresEmbeddingNavigationController;
- (id)commitURL;
- (id)createViewController;
- (id)menuActions;
@end

@implementation DDNewsPreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  v4 = [a1 urlForURL:a3 result:a4];
  if (v4
    && (double Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v5),
        objc_msgSend(*(id *)(v7 + 168), "canOpenURL:", v4, Helper_x8__OBJC_CLASS___NSSNewsViewController)))
  {
    int v8 = applicationWithBundleIdentifierIsRestricted(@"com.apple.news") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)createViewController
{
  v3 = +[DDNewsPreviewAction urlForURL:self->super.super._url result:self->super.super._result];
  gotLoadHelper_x20__OBJC_CLASS___NSSNewsViewController(v4);
  if ([*(id *)(v2 + 168) canOpenURL:v3])
  {
    double v5 = (void *)[objc_alloc(*(Class *)(v2 + 168)) initWithURL:v3];
    [v5 setLinkPreviewing:1];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)requiresEmbeddingNavigationController
{
  return 0;
}

- (id)commitURL
{
  uint64_t v2 = +[DDNewsPreviewAction urlForURL:self->super.super._url result:self->super.super._result];
  double Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v3);
  if (objc_msgSend(*(id *)(v5 + 168), "canOpenURL:", v2, Helper_x8__OBJC_CLASS___NSSNewsViewController)) {
    id v6 = v2;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)urlForURL:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    uint64_t v7 = (void *)DDResultCopyExtractedURL();
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

- (id)menuActions
{
  double v3 = +[DDNewsPreviewAction urlForURL:self->super.super._url result:self->super.super._result];
  double Helper_x8__OBJC_CLASS___NSSNewsViewController = gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(v4);
  if (objc_msgSend(*(id *)(v6 + 168), "canOpenURL:", v3, Helper_x8__OBJC_CLASS___NSSNewsViewController))
  {
    +[DDActionGroup emptyGroup]();
    uint64_t v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    int v8 = +[DDAction actionsWithURL:v3 result:self->super.super._result context:self->super.super._context];
    -[DDActionGroup appendActions:](v7, v8);

    if (+[DDAddToReadingListAction isAvailable])
    {
      v9 = [(DDAction *)[DDAddToReadingListAction alloc] initWithURL:v3 result:self->super.super._result context:self->super.super._context];
      -[DDActionGroup appendAction:]((uint64_t)v7, v9);
    }
    v10 = [[DDCopyAction alloc] initWithURL:self->super.super._url result:self->super.super._result context:self->super.super._context];
    -[DDActionGroup appendAction:]((uint64_t)v7, v10);

    v11 = [[DDShareAction alloc] initWithURL:v3 result:self->super.super._result context:self->super.super._context];
    -[DDActionGroup appendAction:]((uint64_t)v7, v11);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end