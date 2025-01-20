@interface PARSession
+ (PARSession)sessionWithConfiguration:(id)a3;
+ (PARSession)sessionWithConfiguration:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5;
+ (id)sharedPARSessionWithConfiguration:(id)a3;
+ (id)sharedSession;
- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (BOOL)loadMoreResults:(id)a3 withCompletionHandler:(id)a4;
- (NSXPCConnection)connection;
- (PARBag)bag;
- (PARSession)initWithConfiguration:(id)a3;
- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4;
- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4 delegate:(id)a5 startImmediately:(BOOL)a6;
- (PARSessionConfiguration)configuration;
- (PARSessionDelegate)delegate;
- (_TtC10CoreParsec15PARSearchClient)client;
- (id)cardLoader;
- (id)imageLoader;
- (id)initInternal:(id)a3 startImmediately:(BOOL)a4;
- (id)internal;
- (id)moreResultsLoader;
- (id)taskWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)enabledStatus;
- (unint64_t)safariAssistantEnabledStatus;
- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3;
- (void)addCompletion:(id)a3 forInput:(id)a4;
- (void)addEngagedResults:(id)a3;
- (void)addEngagedResults:(id)a3 completion:(id)a4;
- (void)allEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5;
- (void)clearEngagedResult:(id)a3 completion:(id)a4;
- (void)clearEngagedResults:(id)a3 completion:(id)a4;
- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4;
- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4;
- (void)didSkipSearch:(int)a3 forInput:(id)a4 queryId:(unint64_t)a5;
- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4;
- (void)loadTask:(id)a3;
- (void)reportFeedback:(id)a3;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4;
- (void)sendCustomFeedback:(id)a3;
- (void)sendCustomFeedback:(id)a3 completion:(id)a4;
- (void)setBag:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)subscribeToChannel:(id)a3 reply:(id)a4;
- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4;
- (void)topEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5;
- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4;
- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4;
@end

@implementation PARSession

- (PARBag)bag
{
  return [(PARSessionSwiftInternal *)self->_internal bag];
}

- (void)setDelegate:(id)a3
{
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
}

+ (id)sharedPARSessionWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (sharedPARSessionWithConfiguration__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      id v5 = v4;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&sharedPARSessionWithConfiguration__onceToken, &__block_literal_global_2509);
    if (v4) {
      goto LABEL_3;
    }
  }
  id v5 = +[PARSessionConfiguration defaultSessionConfiguration];
LABEL_6:
  v6 = v5;
  v7 = [v5 description];
  id v8 = (id)sharedPARSessionWithConfiguration__sharedSessions;
  objc_sync_enter(v8);
  v9 = [(id)sharedPARSessionWithConfiguration__sharedSessions objectForKeyedSubscript:v7];
  v10 = v9;
  if (v9)
  {
    [v9 setConfiguration:v4];
  }
  else
  {
    v10 = +[PARSession sessionWithConfiguration:v6];
  }
  [(id)sharedPARSessionWithConfiguration__sharedSessions setObject:v10 forKeyedSubscript:v7];
  objc_sync_exit(v8);

  return v10;
}

+ (PARSession)sessionWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v4 connection:0 delegate:0 startImmediately:1];

  return (PARSession *)v5;
}

- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4 delegate:(id)a5 startImmediately:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (checkValidParsecHost_once != -1) {
    dispatch_once(&checkValidParsecHost_once, &__block_literal_global_3011);
  }
  if (checkValidParsecHost_isValidHost)
  {
    v13 = [[PARSessionSwiftInternal alloc] initWithSession:self configuration:v10 connection:v11 delegate:v12];
    self = (PARSession *)[(PARSession *)self initInternal:v13 startImmediately:v6];

    v14 = self;
  }
  else
  {
    if (PARLogHandleForCategory_onceToken_2480 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_2480, &__block_literal_global_197);
    }
    v15 = PARLogHandleForCategory_logHandles_2_2481;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2481, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_19C7E7000, v15, OS_LOG_TYPE_ERROR, "PARSession setup failed on host check", v17, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)initInternal:(id)a3 startImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARSession;
  id v8 = [(PARSession *)&v11 init];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_internal, a3);
  }
  if (v4) {
    [(PARSession *)v9 start];
  }

  return v9;
}

- (void)start
{
}

uint64_t __48__PARSession_sharedPARSessionWithConfiguration___block_invoke()
{
  sharedPARSessionWithConfiguration__sharedSessions = [MEMORY[0x1E4F1CA60] dictionary];

  return MEMORY[0x1F41817F8]();
}

- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PARSession *)self internal];
  [v8 subscriptionStatusForChannel:v7 reply:v6];
}

- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PARSession *)self internal];
  [v8 unsubscribeFromChannel:v7 reply:v6];
}

- (void)subscribeToChannel:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PARSession *)self internal];
  [v8 subscribeToChannel:v7 reply:v6];
}

- (void).cxx_destruct
{
}

- (void)clearEngagedResults:(id)a3 completion:(id)a4
{
}

- (void)clearEngagedResult:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v10 count:1];
  -[PARSessionSwiftInternal clearEngagedResults:completion:](internal, "clearEngagedResults:completion:", v9, v7, v10, v11);
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
}

- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4
{
}

- (void)allEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5
{
}

- (void)topEngagedResultsForInput:(id)a3 maxAmount:(int64_t)a4 completion:(id)a5
{
}

- (void)addEngagedResults:(id)a3 completion:(id)a4
{
}

- (void)addEngagedResults:(id)a3
{
}

void __32__PARSession_addEngagedResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (PARLogHandleForCategory_onceToken_2480 != -1) {
    dispatch_once(&PARLogHandleForCategory_onceToken_2480, &__block_literal_global_197);
  }
  id v3 = PARLogHandleForCategory_logHandles_2_2481;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2481, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_debug_impl(&dword_19C7E7000, v3, OS_LOG_TYPE_DEBUG, "No completion provided. Please use the new SPI for addEngagedResults and provide a non null completion", v8, 2u);
    if (v2)
    {
      if (PARLogHandleForCategory_onceToken_2480 != -1) {
        dispatch_once(&PARLogHandleForCategory_onceToken_2480, &__block_literal_global_197);
      }
      goto LABEL_5;
    }
    if (PARLogHandleForCategory_onceToken_2480 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_2480, &__block_literal_global_197);
    }
  }
  else if (v2)
  {
LABEL_5:
    BOOL v4 = PARLogHandleForCategory_logHandles_2_2481;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2481, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C7E7000, v4, OS_LOG_TYPE_ERROR, "Failed to add engagement to cache", buf, 2u);
    }
    goto LABEL_14;
  }
  id v5 = PARLogHandleForCategory_logHandles_2_2481;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2481, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C7E7000, v5, OS_LOG_TYPE_INFO, "Engagement added to cache.", v6, 2u);
  }
LABEL_14:
}

- (void)addCompletion:(id)a3 forInput:(id)a4
{
}

- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4
{
}

- (void)reportFeedback:(id)a3
{
  internal = self->_internal;
  id v6 = a3;
  unint64_t v4 = [v6 queryId];
  if (v4 >> 31) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = v4;
  }
  [(PARSessionSwiftInternal *)internal reportFeedback:v6 queryId:v5];
}

- (void)didSkipSearch:(int)a3 forInput:(id)a4 queryId:(unint64_t)a5
{
}

- (void)sendCustomFeedback:(id)a3 completion:(id)a4
{
}

- (void)sendCustomFeedback:(id)a3
{
}

- (id)moreResultsLoader
{
  return self->_internal;
}

- (id)cardLoader
{
  return self->_internal;
}

- (id)imageLoader
{
  return self->_internal;
}

- (BOOL)loadMoreResults:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PARSession *)self moreResultsLoader];
  int v9 = [v8 canLoadMoreResults:v6];
  if (v9) {
    [v8 loadMoreResults:v6 completionHandler:v7];
  }

  return v9;
}

- (BOOL)loadCard:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PARSession *)self cardLoader];
  int v9 = [v8 canLoadCard:v6];
  if (v9) {
    [v8 loadCard:v6 completionHandler:v7];
  }

  return v9;
}

- (BOOL)loadImage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PARSession *)self imageLoader];
  int v9 = [v8 canLoadImage:v6 context:0];
  if (v9) {
    [v8 loadImage:v6 context:0 completionHandler:v7];
  }

  return v9;
}

- (BOOL)loadImage:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PARSession *)self imageLoader];
  int v12 = [v11 canLoadImage:v8 context:v9];
  if (v12) {
    [v11 loadImage:v8 context:v9 completionHandler:v10];
  }

  return v12;
}

- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3
{
  return [(PARSessionSwiftInternal *)self->_internal safariAssistantEnabledStatusForPageLanguage:a3];
}

- (unint64_t)safariAssistantEnabledStatus
{
  return [(PARSessionSwiftInternal *)self->_internal safariAssistantEnabledStatus];
}

- (unint64_t)enabledStatus
{
  return [(PARSessionSwiftInternal *)self->_internal enabledStatus];
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
}

- (void)loadTask:(id)a3
{
}

- (id)taskWithRequest:(id)a3 completion:(id)a4
{
  return [(PARSessionSwiftInternal *)self->_internal taskWith:a3 completion:a4];
}

- (_TtC10CoreParsec15PARSearchClient)client
{
  return [(PARSessionSwiftInternal *)self->_internal client];
}

- (void)setBag:(id)a3
{
}

- (PARSessionDelegate)delegate
{
  return [(PARSessionSwiftInternal *)self->_internal delegate];
}

- (void)setConfiguration:(id)a3
{
}

- (PARSessionConfiguration)configuration
{
  return [(PARSessionSwiftInternal *)self->_internal configuration];
}

- (NSXPCConnection)connection
{
  return [(PARSessionSwiftInternal *)self->_internal connection];
}

- (PARSession)initWithConfiguration:(id)a3
{
  return [(PARSession *)self initWithConfiguration:a3 connection:0 delegate:0 startImmediately:1];
}

- (PARSession)initWithConfiguration:(id)a3 connection:(id)a4
{
  return [(PARSession *)self initWithConfiguration:a3 connection:a4 delegate:0 startImmediately:1];
}

- (id)internal
{
  return self->_internal;
}

+ (PARSession)sessionWithConfiguration:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v9 connection:0 delegate:v8 startImmediately:v5];

  return (PARSession *)v10;
}

+ (id)sharedSession
{
  if (checkValidParsecHost_once != -1) {
    dispatch_once(&checkValidParsecHost_once, &__block_literal_global_3011);
  }
  if (checkValidParsecHost_isValidHost)
  {
    if (sharedSession_onceToken != -1) {
      dispatch_once(&sharedSession_onceToken, &__block_literal_global_8_2506);
    }
    id v2 = (id)sharedSession_sharedSession;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __27__PARSession_sharedSession__block_invoke()
{
  id v2 = +[PARSessionConfiguration defaultSessionConfiguration];
  uint64_t v0 = +[PARSession sessionWithConfiguration:v2];
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = v0;
}

@end