@interface ATXHeuristicNowPlaying
+ (id)_defaults;
- (ATXHeuristicNowPlaying)init;
- (ATXHeuristicNowPlaying)initWithPersistenceIdentifier:(id)a3;
- (id)_expirationDate;
- (id)_expirationDateKey;
- (id)_produceSuggestions;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (void)_setExpirationDate:(uint64_t)a1;
@end

@implementation ATXHeuristicNowPlaying

- (ATXHeuristicNowPlaying)init
{
  return [(ATXHeuristicNowPlaying *)self initWithPersistenceIdentifier:@"ATXHeuristicNowPlaying"];
}

- (ATXHeuristicNowPlaying)initWithPersistenceIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXHeuristicNowPlaying.m", 41, @"Invalid parameter not satisfying: %@", @"persistenceIdentifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)ATXHeuristicNowPlaying;
  v7 = [(ATXHeuristicNowPlaying *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F93B68]) initWithBlock:&__block_literal_global_9];
    mediaRemoteNowPlaying = v7->_mediaRemoteNowPlaying;
    v7->_mediaRemoteNowPlaying = (_PASLazyResult *)v8;

    objc_storeStrong((id *)&v7->_persistenceIdentifier, a3);
  }

  return v7;
}

id __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke()
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__12;
  v14 = __Block_byref_object_dispose__12;
  id v15 = 0;
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  v1 = [MEMORY[0x1E4F77080] proactiveEndpointController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke_22;
  v7[3] = &unk_1E68A5518;
  v9 = &v10;
  v2 = v0;
  uint64_t v8 = v2;
  [v1 performRequestWithCompletion:v7];

  v3 = v2;
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v3, v4);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __56__ATXHeuristicNowPlaying_initWithPersistenceIdentifier___block_invoke_22(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)permanentRefreshTriggers
{
  v2 = (void *)MEMORY[0x1D25F43D0](self, a2);
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"com.apple.MediaRemote.lockScreenControlsDidChange" type:1];
  id v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4 = [ATXContextHeuristicResult alloc];
  id v5 = -[ATXHeuristicNowPlaying _produceSuggestions]((id *)&self->super.isa);
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  v7 = [(ATXContextHeuristicResult *)v4 initWithSuggestions:v5 additionalRefreshTriggers:v6];

  return v7;
}

- (id)_produceSuggestions
{
  if (a1)
  {
    v2 = [a1[2] result];
    id v3 = [v2 playerPath];
    id v4 = [v3 origin];
    char v5 = [v4 isLocal];

    if (v5)
    {
      id v6 = 0;
      double v7 = 0.0;
    }
    else
    {
      uint64_t v8 = [v2 playerPath];
      v9 = [v8 origin];
      id v6 = [v9 displayName];

      double v7 = 50.0;
    }
    uint64_t v10 = -[ATXHeuristicNowPlaying _expirationDate](a1);
    int v11 = [v2 playbackState];
    switch(v11)
    {
      case 5:
        goto LABEL_8;
      case 2:
        if (!v10)
        {
          uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
          -[ATXHeuristicNowPlaying _setExpirationDate:]((uint64_t)a1, v10);
          if (v7 == 0.0) {
            double v7 = 60.0;
          }
          goto LABEL_12;
        }
        [v10 timeIntervalSinceNow];
        break;
      case 1:
LABEL_8:
        if (v10)
        {

          -[ATXHeuristicNowPlaying _setExpirationDate:]((uint64_t)a1, 0);
        }
        uint64_t v10 = 0;
        if (v7 == 0.0) {
          double v7 = 60.0;
        }
LABEL_12:
        uint64_t v12 = objc_msgSend(v2, "playbackQueue", 60.0);
        v13 = [v12 contentItems];
        v14 = [v13 firstObject];

        if (!v14) {
          goto LABEL_21;
        }
        id v15 = [v2 playerPath];
        v16 = [v15 client];
        v17 = [v16 bundleIdentifier];
        int v18 = [v17 hasPrefix:@"com.apple."];

        if (v18)
        {
          v19 = [[ATXContextMediaSuggestionProducer alloc] initWithMediaRemoteContentItem:v14 destDisplayName:v6 expirationDate:v10];
          v20 = objc_opt_new();
          v21 = [(ATXContextMediaSuggestionProducer *)v19 suggestionForTrackWithReason:0x40000 score:v7];
          if (v21) {
            [v20 addObject:v21];
          }
          v22 = [(ATXContextMediaSuggestionProducer *)v19 suggestionForArtistWithReason:0x40000 score:v7];
          if (v22) {
            [v20 addObject:v22];
          }
          v23 = [(ATXContextMediaSuggestionProducer *)v19 suggestionForAlbumWithReason:0x40000 score:v7];
          if (v23) {
            [v20 addObject:v23];
          }
        }
        else
        {
LABEL_21:
          v20 = (void *)MEMORY[0x1E4F1CBF0];
        }

        goto LABEL_26;
    }
    v20 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_26:

    goto LABEL_27;
  }
  v20 = 0;
LABEL_27:

  return v20;
}

+ (id)_defaults
{
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x1E4F4B688]];

  return v1;
}

- (id)_expirationDateKey
{
  if (a1)
  {
    a1 = [a1[1] stringByAppendingString:@"Expiration"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_expirationDate
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = +[ATXHeuristicNowPlaying _defaults]();
    id v3 = [v1[1] stringByAppendingString:@"Expiration"];
    uint64_t v1 = [v2 objectForKey:v3];
  }

  return v1;
}

- (void)_setExpirationDate:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    +[ATXHeuristicNowPlaying _defaults]();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [*(id *)(a1 + 8) stringByAppendingString:@"Expiration"];
    [v5 setObject:v3 forKey:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteNowPlaying, 0);

  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end