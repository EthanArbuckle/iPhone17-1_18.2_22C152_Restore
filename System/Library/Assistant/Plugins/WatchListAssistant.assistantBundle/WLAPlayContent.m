@interface WLAPlayContent
+ (unint64_t)_WLKContentTypeForSAVCSContentType:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation WLAPlayContent

+ (unint64_t)_WLKContentTypeForSAVCSContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAVCSContentTypeMovieValue])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAVCSContentTypeShowValue])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:SAVCSContentTypeSeasonValue])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:SAVCSContentTypeEpisodeValue])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WLAPlayContent *)self utsId];
  v6 = [(WLAPlayContent *)self contentType];
  id v7 = [(id)objc_opt_class() _WLKContentTypeForSAVCSContentType:v6];
  NSLog(@"WLAPlayContent: Got play request for content type '%@', canonical ID '%@'", v6, v5);
  +[NSDate date];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __40__WLAPlayContent_performWithCompletion___block_invoke;
  v20[3] = &unk_82B0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v8;
  id v23 = v7;
  id v9 = v4;
  id v22 = v9;
  v10 = objc_retainBlock(v20);
  if ([v5 length]
    && (([v6 isEqualToString:SAVCSContentTypeMovieValue] & 1) != 0
     || ([v6 isEqualToString:SAVCSContentTypeEpisodeValue] & 1) != 0
     || ([v6 isEqualToString:SAVCSContentTypeShowValue] & 1) != 0
     || [v6 isEqualToString:SAVCSContentTypeSeasonValue]))
  {
    id v11 = [objc_alloc((Class)WLKContentPlayRequest) initWithCanonicalID:v5];
    NSLog(@"WLAPlayContent: Will enqueue playables request: %@", v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_2;
    v14[3] = &unk_8300;
    id v15 = v6;
    id v16 = v5;
    id v19 = v7;
    v17 = v10;
    id v18 = v9;
    [v11 makeRequestWithCompletion:v14];

    v12 = v15;
LABEL_9:

    goto LABEL_10;
  }
  NSLog(@"WLAPlayContent: Unsupported content type for play command: %@, canonical ID: %@", v6, v5);
  if (v9)
  {
    id v13 = objc_alloc((Class)SACommandFailed);
    id v11 = [v13 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
    v12 = [v11 dictionary];
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
    goto LABEL_9;
  }
LABEL_10:
}

void __40__WLAPlayContent_performWithCompletion___block_invoke(void *a1, int a2)
{
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  NSLog(@"WLAPlayContent: Elapsed Time: %.4f", v6);
  uint64_t v7 = a1[6];
  if (a2)
  {
    id v8 = @"WLAPlayContent: Successfully opened playable directly.";
    if (v7 == 4) {
      id v8 = @"WLAPlayContent: Opening episode playable succeeded.";
    }
    if (v7 == 3) {
      NSLog(@"WLAPlayContent: Opening season playable succeeded.");
    }
    else {
      NSLog(&v8->isa);
    }
    uint64_t v9 = a1[5];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)SACommandSucceeded);
LABEL_16:
      id v14 = v10;
      id v13 = [v10 dictionary];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v13);
    }
  }
  else
  {
    id v11 = @"WLAPlayContent: Failed to open playable directly.";
    if (v7 == 4) {
      id v11 = @"WLAPlayContent: Opening episode playable failed.";
    }
    if (v7 == 3) {
      NSLog(@"WLAPlayContent: Opening season playable failed.");
    }
    else {
      NSLog(&v11->isa);
    }
    uint64_t v9 = a1[5];
    if (v9)
    {
      id v12 = objc_alloc((Class)SACommandFailed);
      id v10 = [v12 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
      goto LABEL_16;
    }
  }
}

void __40__WLAPlayContent_performWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 playable];
  id v8 = (void *)v7;
  if (v7)
  {
    NSLog(@"WLAPlayContent: Got a playable: %@", v7);
    if ([*(id *)(a1 + 32) isEqualToString:SAVCSContentTypeSeasonValue])
    {
      NSLog(@"WLAPlayContent: Will enqueue season content request operation.");
      id v9 = [objc_alloc((Class)WLKBasicContentRequestOperation) initWithContentID:*(void *)(a1 + 40) caller:0];
      objc_initWeak(&location, v9);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_3;
      v26[3] = &unk_82D8;
      id v10 = v30;
      objc_copyWeak(v30, &location);
      id v27 = *(id *)(a1 + 40);
      id v11 = v8;
      id v12 = *(void **)(a1 + 64);
      id v28 = v11;
      v30[1] = v12;
      id v29 = *(id *)(a1 + 48);
      [v9 setCompletionBlock:v26];
      id v13 = +[NSOperationQueue wlkDefaultQueue];
      [v13 addOperation:v9];

      id v14 = v27;
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:SAVCSContentTypeEpisodeValue])
      {
        +[WLKPlayableUtilities openPlayable:v8 forContentType:*(void *)(a1 + 64) canonicalID:*(void *)(a1 + 40) showCanonicalID:0 seasonCanonicalID:0];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_10;
      }
      NSLog(@"WLAPlayContent: Will enqueue episode content request operation.");
      id v9 = [objc_alloc((Class)WLKBasicContentRequestOperation) initWithContentID:*(void *)(a1 + 40) caller:0];
      objc_initWeak(&location, v9);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __40__WLAPlayContent_performWithCompletion___block_invoke_4;
      v21[3] = &unk_82D8;
      id v10 = v25;
      objc_copyWeak(v25, &location);
      id v22 = *(id *)(a1 + 40);
      id v18 = v8;
      id v19 = *(void **)(a1 + 64);
      id v23 = v18;
      v25[1] = v19;
      id v24 = *(id *)(a1 + 48);
      [v9 setCompletionBlock:v21];
      v20 = +[NSOperationQueue wlkDefaultQueue];
      [v20 addOperation:v9];

      id v14 = v22;
    }

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  NSLog(@"WLAPlayContent: No playable returned for play request for content type: %@, canonical ID: %@, error: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v6);
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    id v16 = objc_alloc((Class)SACommandFailed);
    id v9 = [v16 initWithErrorCode:SAVCSCannotPlayContentErrorCode];
    v17 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);

LABEL_9:
  }
LABEL_10:
}

void __40__WLAPlayContent_performWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained basicContentMetadata];
  id v3 = *(id *)(a1 + 32);
  id v4 = [v2 canonicalShowID];
  +[WLKPlayableUtilities openPlayable:*(void *)(a1 + 40) forContentType:*(void *)(a1 + 64) canonicalID:v3 showCanonicalID:v4 seasonCanonicalID:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __40__WLAPlayContent_performWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained basicContentMetadata];
  id v3 = *(id *)(a1 + 32);
  id v4 = [v2 canonicalShowID];
  id v5 = [v2 canonicalSeasonID];
  +[WLKPlayableUtilities openPlayable:*(void *)(a1 + 40) forContentType:*(void *)(a1 + 64) canonicalID:v3 showCanonicalID:v4 seasonCanonicalID:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end