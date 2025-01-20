@interface WLAAddContentToWatchList
- (void)performWithCompletion:(id)a3;
@end

@implementation WLAAddContentToWatchList

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  NSLog(@"WLAAddContentToWatchList: Got add content request.");
  v5 = +[WLKSettingsStore sharedSettings];
  unsigned __int8 v6 = [v5 optedIn];

  if (v6)
  {
    v7 = [(WLAAddContentToWatchList *)self canonicalId];

    if (v7)
    {
      id v8 = objc_alloc((Class)WLKAddToUpNextRequest);
      v9 = [(WLAAddContentToWatchList *)self canonicalId];
      id v10 = [v8 initWithCanonicalID:v9];

      v11 = [(WLAAddContentToWatchList *)self canonicalId];
      NSLog(@"WLAAddContentToWatchList: Will perform add favorite request: %p for canonical: %@", v10, v11);

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __50__WLAAddContentToWatchList_performWithCompletion___block_invoke;
      v15[3] = &unk_83C8;
      id v16 = v10;
      id v17 = v4;
      id v12 = v10;
      [v12 makeRequestWithCompletion:v15];

LABEL_9:
      goto LABEL_10;
    }
    NSLog(@"WLAAddContentToWatchList: No canonical ID provided.");
    if (v4)
    {
      id v13 = objc_alloc_init((Class)SACommandFailed);
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(@"WLAAddContentToWatchList: Not opted in.  Bailing out.");
    if (v4)
    {
      id v13 = [objc_alloc((Class)SACommandFailed) initWithErrorCode:9056];
LABEL_8:
      id v12 = v13;
      v14 = [v13 dictionary];
      (*((void (**)(id, void *))v4 + 2))(v4, v14);

      goto LABEL_9;
    }
  }
LABEL_10:
}

void __50__WLAAddContentToWatchList_performWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (!a2)
  {
    NSLog(@"WLAAddContentToWatchList: Add favorite request failed: %@", v5);
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_12;
    }
    v11 = (objc_class *)SACommandFailed;
LABEL_9:
    id v10 = objc_alloc_init(v11);
    id v8 = v10;
    goto LABEL_10;
  }
  NSLog(@"WLAAddContentToWatchList: Add favorite request succeeded.");
  unsigned __int8 v6 = [*(id *)(a1 + 32) response];
  v7 = (char *)[v6 responseType];

  if (v7 != (unsigned char *)&dword_0 + 1)
  {
    NSLog(@"WLAAddContentToWatchList: Added favorite was not on the list.");
    uint64_t v9 = *(void *)(a1 + 40);
    if (!v9) {
      goto LABEL_12;
    }
    v11 = (objc_class *)SACommandSucceeded;
    goto LABEL_9;
  }
  NSLog(@"WLAAddContentToWatchList: Added favorite was already on the list.");
  id v8 = objc_alloc_init((Class)SACommandFailed);
  [v8 setErrorCode:SAWLAllItemsInListErrorCode];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    id v10 = v8;
LABEL_10:
    id v12 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
  }
LABEL_12:
}

@end