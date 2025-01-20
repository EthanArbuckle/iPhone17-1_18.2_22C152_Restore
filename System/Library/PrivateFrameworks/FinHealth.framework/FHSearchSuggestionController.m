@interface FHSearchSuggestionController
- (BOOL)cacheConnectionInitiated;
- (FHSearchSuggestionController)init;
- (FHSearchSuggestionController)initWithDelegate:(id)a3;
- (FHSuggestionDelegate)delegate;
- (NSMutableArray)instrumentationCache;
- (NSXPCConnection)connection;
- (id)_clientConnection;
- (id)_newClientConnection;
- (id)_remoteObjectInterface;
- (id)_remoteObjectProxyWithErrorHandler;
- (id)_validateInstrumentationRecord:(id)a3;
- (os_unfair_lock_s)lockCache;
- (os_unfair_lock_s)lockConnection;
- (void)_init;
- (void)_sendAllTransactionFeatures:(BOOL)a3;
- (void)_updateOrRecordCacheEntries:(id)a3 instrumentationCacheSize:(unint64_t)a4;
- (void)aggregateFeaturesWithHandler:(id)a3;
- (void)allFeatureInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6 completion:(id)a7;
- (void)allPeerPaymentForecastingSignals:(id)a3;
- (void)dealloc;
- (void)deleteAllData:(id)a3;
- (void)deleteDataForPassesWithSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)deleteTransactionByTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)featureResponsesForApplication:(id)a3 withCompletion:(id)a4;
- (void)featuresForApplication:(id)a3 withCompletion:(id)a4;
- (void)featuresWithCompletion:(id)a3;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)getDisputeDocumentSuggestionsForTransactionId:(id)a3 completion:(id)a4;
- (void)getTopTransactionCategoriesWithCountryCode:(id)a3 timeWindow:(unint64_t)a4 minRegularTransactionRatio:(double)a5 discretizedTimeOfDay:(unint64_t)a6 completion:(id)a7;
- (void)getTopTransactionCategoriesWithTimeWindow:(unint64_t)a3 completion:(id)a4;
- (void)paymentRingSuggestionsFromSearchFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)peerPaymentForecastingSignals:(id)a3 withCompletion:(id)a4;
- (void)recordUserInteraction:(id)a3;
- (void)reevaluateTransactionFeatures;
- (void)sendAllTransactionFeatures;
- (void)setCacheConnectionInitiated:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstrumentationCache:(id)a3;
- (void)setLockCache:(os_unfair_lock_s)a3;
- (void)setLockConnection:(os_unfair_lock_s)a3;
- (void)transactionUpdated:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5;
- (void)transactionsRequireSyncing;
- (void)updatePeerPaymentAccountBalanceWithTransactionSourceId:(id)a3 amount:(id)a4 currencyCode:(id)a5 completion:(id)a6;
- (void)updatePeerPaymentForecastingSuggestionStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5 completion:(id)a6;
@end

@implementation FHSearchSuggestionController

- (FHSearchSuggestionController)initWithDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[FHSearchSuggestionController initWithDelegate:]";
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)FHSearchSuggestionController;
  v6 = [(FHSearchSuggestionController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    [(FHSearchSuggestionController *)v7 _init];
  }

  return v7;
}

- (FHSearchSuggestionController)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v9 = "-[FHSearchSuggestionController init]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)FHSearchSuggestionController;
  id v4 = [(FHSearchSuggestionController *)&v7 init];
  v5 = v4;
  if (v4) {
    [(FHSearchSuggestionController *)v4 _init];
  }
  return v5;
}

- (void)_init
{
  self->_lockConnection._os_unfair_lock_opaque = 0;
  self->_lockCache._os_unfair_lock_opaque = 0;
  self->_instrumentationCache = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v7 = "-[FHSearchSuggestionController dealloc]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)FHSearchSuggestionController;
  [(FHSearchSuggestionController *)&v5 dealloc];
}

- (void)transactionUpdated:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = FinHealthLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[FHSearchSuggestionController transactionUpdated:deferFeatureComputation:completion:]";
    _os_log_impl(&dword_236773000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__FHSearchSuggestionController_transactionUpdated_deferFeatureComputation_completion___block_invoke;
  v13[3] = &unk_264CAF158;
  id v14 = v8;
  id v12 = v8;
  [v11 transactionUpdated:v9 deferFeatureComputation:v5 completion:v13];
}

uint64_t __86__FHSearchSuggestionController_transactionUpdated_deferFeatureComputation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDataForPassesWithSourceIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[FHSearchSuggestionController deleteDataForPassesWithSourceIdentifiers:completion:]";
    _os_log_impl(&dword_236773000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v9 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__FHSearchSuggestionController_deleteDataForPassesWithSourceIdentifiers_completion___block_invoke;
  v11[3] = &unk_264CAF180;
  id v12 = v6;
  id v10 = v6;
  [v9 deleteDataForPasses:v7 completion:v11];
}

uint64_t __84__FHSearchSuggestionController_deleteDataForPassesWithSourceIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteTransactionByTransactionIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[FHSearchSuggestionController deleteTransactionByTransactionIdentifier:completion:]";
    _os_log_impl(&dword_236773000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v9 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__FHSearchSuggestionController_deleteTransactionByTransactionIdentifier_completion___block_invoke;
  v11[3] = &unk_264CAF1A8;
  id v12 = v6;
  id v10 = v6;
  [v9 deleteTransactionById:v7 completion:v11];
}

uint64_t __84__FHSearchSuggestionController_deleteTransactionByTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAllData:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[FHSearchSuggestionController deleteAllData:]";
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v6 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__FHSearchSuggestionController_deleteAllData___block_invoke;
  v8[3] = &unk_264CAF180;
  id v9 = v4;
  id v7 = v4;
  [v6 deleteAllData:v8];
}

void __46__FHSearchSuggestionController_deleteAllData___block_invoke(uint64_t a1, char a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v4 = *(void (**)(uint64_t, uint64_t, id))(v3 + 16);
    id v5 = a3;
    v4(v3, 1, v5);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F3C750];
    uint64_t v11 = *MEMORY[0x263F08608];
    v12[0] = a3;
    id v8 = NSDictionary;
    id v9 = a3;
    id v5 = [v8 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v6 errorWithDomain:v7 code:20002 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v10);
  }
}

- (void)featuresWithCompletion:(id)a3
{
}

- (void)featuresForApplication:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    id v8 = [v9 processName];
  }
  id v10 = FinHealthLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[FHSearchSuggestionController featuresForApplication:withCompletion:]";
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_236773000, v10, OS_LOG_TYPE_DEBUG, "%s process/application name: %@", buf, 0x16u);
  }

  uint64_t v11 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__FHSearchSuggestionController_featuresForApplication_withCompletion___block_invoke;
  v13[3] = &unk_264CAF1D0;
  void v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 featuresForApplication:v8 withCompletion:v13];
}

uint64_t __70__FHSearchSuggestionController_featuresForApplication_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__FHSearchSuggestionController_fetchUserProperties_withParameters_completion___block_invoke;
  v11[3] = &unk_264CAF1F8;
  v13 = self;
  id v14 = v8;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [(FHSearchSuggestionController *)self featuresForApplication:@"Messaging" withCompletion:v11];
}

void __78__FHSearchSuggestionController_fetchUserProperties_withParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [v5 predicateWithFormat:@"self IN %@", v6];
  id v9 = [v7 allKeys];
  id v10 = [v9 filteredArrayUsingPredicate:v8];
  uint64_t v11 = [v7 dictionaryWithValuesForKeys:v10];

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v11, v13);
  }
}

- (void)paymentRingSuggestionsFromSearchFeatures:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if (!v10)
  {
    id v14 = FinHealthLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[FHSearchSuggestionController paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:]";
      _os_log_impl(&dword_236773000, v14, OS_LOG_TYPE_DEBUG, "applicationName cannot be nil %s", buf, 0xCu);
    }

    uint64_t v15 = objc_opt_new();
    v13[2](v13, v15);
  }
  v16 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__FHSearchSuggestionController_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion___block_invoke;
  v18[3] = &unk_264CAF220;
  uint64_t v19 = v13;
  __int16 v17 = v13;
  [v16 paymentRingSuggestionsFromSearchFeatures:v10 startDate:v11 endDate:v12 completion:v18];
}

uint64_t __102__FHSearchSuggestionController_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)featureResponsesForApplication:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    id v8 = [v9 processName];
  }
  id v10 = FinHealthLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[FHSearchSuggestionController featureResponsesForApplication:withCompletion:]";
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_236773000, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  id v11 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__FHSearchSuggestionController_featureResponsesForApplication_withCompletion___block_invoke;
  v14[3] = &unk_264CAF248;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [v11 featureResponsesForApplication:v8 completion:v14];
}

void __78__FHSearchSuggestionController_featureResponsesForApplication_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
    }
    id v8 = FinHealthLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[FHSearchSuggestionController featureResponsesForApplication:withCompletion:]_block_invoke";
      _os_log_impl(&dword_236773000, v8, OS_LOG_TYPE_DEBUG, "%s sending next batch", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) featureResponsesForApplication:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
}

- (void)getDisputeDocumentSuggestionsForTransactionId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__FHSearchSuggestionController_getDisputeDocumentSuggestionsForTransactionId_completion___block_invoke;
  v10[3] = &unk_264CAF270;
  id v11 = v6;
  id v9 = v6;
  [v8 getDisputeDocumentSuggestionsForTransactionId:v7 completion:v10];
}

uint64_t __89__FHSearchSuggestionController_getDisputeDocumentSuggestionsForTransactionId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendAllTransactionFeatures
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[FHSearchSuggestionController sendAllTransactionFeatures]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(FHSearchSuggestionController *)self _sendAllTransactionFeatures:1];
}

- (void)reevaluateTransactionFeatures
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FHSearchSuggestionController reevaluateTransactionFeatures]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  int v4 = [(FHSearchSuggestionController *)self _clientConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke;
  v7[3] = &unk_264CAF298;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v7];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_88;
  v6[3] = &unk_264CAF2E8;
  v6[4] = self;
  v6[5] = &buf;
  [v5 recomputeFeaturesForTransactions:v6];
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 localizedDescription];
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    id v7 = v16;
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) delegate];
      [v12 didUpdateFeatures:0 moreComing:0 readyForNextBatch:0 error:v3];
    }
  }
}

void __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 == *MEMORY[0x263F3C830];
  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) delegate];
      int v13 = v12;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_2;
        v17[3] = &unk_264CAF2C0;
        v17[4] = *(void *)(a1 + 32);
        id v14 = v17;
        id v15 = v5;
        uint64_t v16 = 1;
      }
      else
      {
        id v15 = v5;
        uint64_t v16 = 0;
        id v14 = 0;
      }
      [v12 didUpdateFeatures:v15 moreComing:v16 readyForNextBatch:v14 error:v6];
    }
  }
}

uint64_t __61__FHSearchSuggestionController_reevaluateTransactionFeatures__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendAllTransactionFeatures:0];
}

- (void)_sendAllTransactionFeatures:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FHSearchSuggestionController _sendAllTransactionFeatures:]";
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  id v6 = [(FHSearchSuggestionController *)self _clientConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke;
  v9[3] = &unk_264CAF298;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_90;
  v8[3] = &unk_264CAF2E8;
  void v8[4] = self;
  v8[5] = &buf;
  [v7 getComputedFeaturesForTransactions:v3 completion:v8];
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 localizedDescription];
    int v13 = 138412546;
    char v14 = v6;
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    id v7 = v16;
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) delegate];
      [v12 didUpdateFeatures:0 moreComing:0 readyForNextBatch:0 error:v3];
    }
  }
}

void __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 == *MEMORY[0x263F3C830];
  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [*(id *)(a1 + 32) delegate];
      int v13 = v12;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_2;
        v17[3] = &unk_264CAF2C0;
        v17[4] = *(void *)(a1 + 32);
        char v14 = v17;
        id v15 = v5;
        uint64_t v16 = 1;
      }
      else
      {
        id v15 = v5;
        uint64_t v16 = 0;
        char v14 = 0;
      }
      [v12 didUpdateFeatures:v15 moreComing:v16 readyForNextBatch:v14 error:v6];
    }
  }
}

uint64_t __60__FHSearchSuggestionController__sendAllTransactionFeatures___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendAllTransactionFeatures:0];
}

- (void)transactionsRequireSyncing
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[FHSearchSuggestionController transactionsRequireSyncing]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  [v4 transactionsRequireSyncing:&__block_literal_global];
}

void __58__FHSearchSuggestionController_transactionsRequireSyncing__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = [v2 localizedDescription];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "transactionsRequireSyncing error :%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)recordUserInteraction:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = [(FHSearchSuggestionController *)self _validateInstrumentationRecord:a3];
  int v5 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  [v5 recordUserInteraction:v4 completion:&__block_literal_global_92];
  id v6 = FinHealthLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[FHSearchSuggestionController recordUserInteraction:]";
    _os_log_impl(&dword_236773000, v6, OS_LOG_TYPE_DEBUG, "Ended %s", (uint8_t *)&v7, 0xCu);
  }
}

- (id)_validateInstrumentationRecord:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x263F3C7B0];
    uint64_t v10 = *MEMORY[0x263F3C7B8];
    uint64_t v19 = *MEMORY[0x263F3C7A8];
    uint64_t v18 = *MEMORY[0x263F3C798];
    uint64_t v17 = *MEMORY[0x263F3C790];
    uint64_t v16 = *MEMORY[0x263F3C7A0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        char v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v16);
        if ([v12 isEqualToString:v9]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v12 isEqualToString:v10]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v12 isEqualToString:v19]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v12 isEqualToString:v18]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v12 isEqualToString:v17]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v12 isEqualToString:v16]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v4 setObject:v13 forKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  char v14 = [NSDictionary dictionaryWithDictionary:v4];

  return v14;
}

- (void)_updateOrRecordCacheEntries:(id)a3 instrumentationCacheSize:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lockCache);
  uint64_t v7 = FinHealthLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    char v12 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]";
    _os_log_impl(&dword_236773000, v7, OS_LOG_TYPE_DEBUG, "Started %s", (uint8_t *)&v11, 0xCu);
  }

  if (v6) {
    [(NSMutableArray *)self->_instrumentationCache addObject:v6];
  }
  if ([(NSMutableArray *)self->_instrumentationCache count] == a4)
  {
    self->_cacheConnectionInitiated = 1;
    uint64_t v8 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
    uint64_t v9 = (void *)[(NSMutableArray *)self->_instrumentationCache copy];
    [v8 recordUserInteractions:v9 completion:&__block_literal_global_97];

    uint64_t v10 = FinHealthLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315138;
      char v12 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]";
      _os_log_impl(&dword_236773000, v10, OS_LOG_TYPE_DEBUG, "Ended %s", (uint8_t *)&v11, 0xCu);
    }

    [(NSMutableArray *)self->_instrumentationCache removeAllObjects];
  }
  os_unfair_lock_unlock(&self->_lockCache);
}

void __85__FHSearchSuggestionController__updateOrRecordCacheEntries_instrumentationCacheSize___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = FinHealthLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315138;
    id v2 = "-[FHSearchSuggestionController _updateOrRecordCacheEntries:instrumentationCacheSize:]_block_invoke";
    _os_log_impl(&dword_236773000, v0, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)peerPaymentForecastingSignals:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = FinHealthLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    char v14 = "-[FHSearchSuggestionController peerPaymentForecastingSignals:withCompletion:]";
    _os_log_impl(&dword_236773000, v8, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v9 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__FHSearchSuggestionController_peerPaymentForecastingSignals_withCompletion___block_invoke;
  v11[3] = &unk_264CAF270;
  id v12 = v6;
  id v10 = v6;
  [v9 peerPaymentForecastingSignals:v7 withCompletion:v11];
}

uint64_t __77__FHSearchSuggestionController_peerPaymentForecastingSignals_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)allPeerPaymentForecastingSignals:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v12 = "-[FHSearchSuggestionController allPeerPaymentForecastingSignals:]";
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v6 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  id v7 = [MEMORY[0x263EFF910] now];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__FHSearchSuggestionController_allPeerPaymentForecastingSignals___block_invoke;
  v9[3] = &unk_264CAF270;
  id v10 = v4;
  id v8 = v4;
  [v6 peerPaymentForecastingSignals:v7 withCompletion:v9];
}

uint64_t __65__FHSearchSuggestionController_allPeerPaymentForecastingSignals___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updatePeerPaymentForecastingSuggestionStatus:(unint64_t)a3 counterpartHandle:(id)a4 amount:(id)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = FinHealthLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v19 = "-[FHSearchSuggestionController updatePeerPaymentForecastingSuggestionStatus:counterpartHandle:amount:completion:]";
    _os_log_impl(&dword_236773000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  char v14 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __113__FHSearchSuggestionController_updatePeerPaymentForecastingSuggestionStatus_counterpartHandle_amount_completion___block_invoke;
  v16[3] = &unk_264CAF180;
  id v17 = v10;
  id v15 = v10;
  [v14 updatePeerPaymentForecastingSuggestionStatus:a3 counterpartHandle:v12 amount:v11 completion:v16];
}

uint64_t __113__FHSearchSuggestionController_updatePeerPaymentForecastingSuggestionStatus_counterpartHandle_amount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePeerPaymentAccountBalanceWithTransactionSourceId:(id)a3 amount:(id)a4 currencyCode:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = FinHealthLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v20 = "-[FHSearchSuggestionController updatePeerPaymentAccountBalanceWithTransactionSourceId:amount:currencyCode:completion:]";
    _os_log_impl(&dword_236773000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v15 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __118__FHSearchSuggestionController_updatePeerPaymentAccountBalanceWithTransactionSourceId_amount_currencyCode_completion___block_invoke;
  v17[3] = &unk_264CAF180;
  id v18 = v10;
  id v16 = v10;
  [v15 updatePeerPaymentAccountBalanceWithTransactionSourceId:v13 amount:v12 currencyCode:v11 completion:v17];
}

uint64_t __118__FHSearchSuggestionController_updatePeerPaymentAccountBalanceWithTransactionSourceId_amount_currencyCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allFeatureInsightsWithStartDate:(id)a3 endDate:(id)a4 insightTypeItems:(id)a5 trendWindow:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __112__FHSearchSuggestionController_allFeatureInsightsWithStartDate_endDate_insightTypeItems_trendWindow_completion___block_invoke;
  v18[3] = &unk_264CAF220;
  id v19 = v12;
  id v17 = v12;
  [v16 allInsightsForDateRange:v15 endDate:v14 insightTypeItems:v13 trendWindow:a6 completion:v18];
}

uint64_t __112__FHSearchSuggestionController_allFeatureInsightsWithStartDate_endDate_insightTypeItems_trendWindow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTopTransactionCategoriesWithTimeWindow:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__FHSearchSuggestionController_getTopTransactionCategoriesWithTimeWindow_completion___block_invoke;
  v8[3] = &unk_264CAF350;
  id v9 = v6;
  id v7 = v6;
  [(FHSearchSuggestionController *)self getTopTransactionCategoriesWithCountryCode:0 timeWindow:a3 minRegularTransactionRatio:0 discretizedTimeOfDay:v8 completion:0.0];
}

uint64_t __85__FHSearchSuggestionController_getTopTransactionCategoriesWithTimeWindow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getTopTransactionCategoriesWithCountryCode:(id)a3 timeWindow:(unint64_t)a4 minRegularTransactionRatio:(double)a5 discretizedTimeOfDay:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __145__FHSearchSuggestionController_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion___block_invoke;
  v16[3] = &unk_264CAF350;
  id v17 = v12;
  id v15 = v12;
  [v14 getTopTransactionCategoriesWithCountryCode:v13 timeWindow:a4 minRegularTransactionRatio:a6 discretizedTimeOfDay:v16 completion:a5];
}

uint64_t __145__FHSearchSuggestionController_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_clientConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    id v10 = "-[FHSearchSuggestionController _clientConnection]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_lockConnection);
  id v4 = [(FHSearchSuggestionController *)self connection];

  id v5 = FinHealthLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      int v9 = 136315138;
      id v10 = "-[FHSearchSuggestionController _clientConnection]";
      _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s, reusing _clientConnection", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      int v9 = 136315138;
      id v10 = "-[FHSearchSuggestionController _clientConnection]";
      _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s, _clientConnection nil", (uint8_t *)&v9, 0xCu);
    }

    id v5 = [(FHSearchSuggestionController *)self _newClientConnection];
    [(FHSearchSuggestionController *)self setConnection:v5];
  }

  os_unfair_lock_unlock(&self->_lockConnection);
  id v7 = [(FHSearchSuggestionController *)self connection];
  return v7;
}

- (id)_newClientConnection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = FinHealthLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v15 = "-[FHSearchSuggestionController _newClientConnection]";
    _os_log_impl(&dword_236773000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.FinHealth.FinHealthXPCServices"];
  id v5 = [(FHSearchSuggestionController *)self _remoteObjectInterface];
  [v4 setRemoteObjectInterface:v5];

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __52__FHSearchSuggestionController__newClientConnection__block_invoke;
  v12[3] = &unk_264CAF378;
  objc_copyWeak(&v13, (id *)buf);
  [v4 setInvalidationHandler:v12];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  int v9 = __52__FHSearchSuggestionController__newClientConnection__block_invoke_104;
  id v10 = &unk_264CAF378;
  objc_copyWeak(&v11, (id *)buf);
  [v4 setInterruptionHandler:&v7];
  objc_msgSend(v4, "resume", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return v4;
}

void __52__FHSearchSuggestionController__newClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = FinHealthLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "-[FHSearchSuggestionController _newClientConnection]_block_invoke";
    _os_log_impl(&dword_236773000, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection invalidated", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setConnection:0];
}

void __52__FHSearchSuggestionController__newClientConnection__block_invoke_104(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = FinHealthLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "-[FHSearchSuggestionController _newClientConnection]_block_invoke";
    _os_log_impl(&dword_236773000, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setConnection:0];
}

- (id)_remoteObjectInterface
{
  v91 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E9B91B8];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v91 setClasses:v12 forSelector:sel_featuresWithCompletion_ argumentIndex:0 ofReply:1];

  id v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  long long v22 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [v91 setClasses:v22 forSelector:sel_featuresForApplication_withCompletion_ argumentIndex:0 ofReply:1];

  long long v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
  [v91 setClasses:v30 forSelector:sel_featureResponsesForApplication_completion_ argumentIndex:0 ofReply:1];

  v31 = (void *)MEMORY[0x263EFFA08];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, v35, v36, v37, objc_opt_class(), 0);
  [v91 setClasses:v38 forSelector:sel_paymentRingSuggestionsFromSearchFeatures_startDate_endDate_completion_ argumentIndex:0 ofReply:1];

  v39 = (void *)MEMORY[0x263EFFA08];
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, v44, v45, objc_opt_class(), 0);
  [v91 setClasses:v46 forSelector:sel_recomputeFeaturesForTransactions_ argumentIndex:0 ofReply:1];

  v47 = (void *)MEMORY[0x263EFFA08];
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  v54 = objc_msgSend(v47, "setWithObjects:", v48, v49, v50, v51, v52, v53, objc_opt_class(), 0);
  [v91 setClasses:v54 forSelector:sel_getComputedFeaturesForTransactions_completion_ argumentIndex:0 ofReply:1];

  v90 = (void *)MEMORY[0x263EFFA08];
  uint64_t v89 = objc_opt_class();
  uint64_t v88 = objc_opt_class();
  uint64_t v87 = objc_opt_class();
  uint64_t v86 = objc_opt_class();
  uint64_t v85 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  v64 = objc_msgSend(v90, "setWithObjects:", v89, v88, v87, v86, v85, v55, v56, v57, v58, v59, v60, v61, v62, v63, objc_opt_class(), 0);
  [v91 setClasses:v64 forSelector:sel_peerPaymentForecastingSignals_withCompletion_ argumentIndex:0 ofReply:1];

  v65 = (void *)MEMORY[0x263EFFA08];
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  v69 = objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
  [v91 setClasses:v69 forSelector:sel_getDisputeDocumentSuggestionsForTransactionId_completion_ argumentIndex:0 ofReply:1];

  v70 = (void *)MEMORY[0x263EFFA08];
  uint64_t v71 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  uint64_t v73 = objc_opt_class();
  uint64_t v74 = objc_opt_class();
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  v78 = objc_msgSend(v70, "setWithObjects:", v71, v72, v73, v74, v75, v76, v77, objc_opt_class(), 0);
  [v91 setClasses:v78 forSelector:sel_allInsightsForDateRange_endDate_insightTypeItems_trendWindow_completion_ argumentIndex:0 ofReply:1];

  v79 = (void *)MEMORY[0x263EFFA08];
  uint64_t v80 = objc_opt_class();
  uint64_t v81 = objc_opt_class();
  uint64_t v82 = objc_opt_class();
  v83 = objc_msgSend(v79, "setWithObjects:", v80, v81, v82, objc_opt_class(), 0);
  [v91 setClasses:v83 forSelector:sel_getTopTransactionCategoriesWithCountryCode_timeWindow_minRegularTransactionRatio_discretizedTimeOfDay_completion_ argumentIndex:0 ofReply:1];

  return v91;
}

- (void)aggregateFeaturesWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = "-[FHSearchSuggestionController aggregateFeaturesWithHandler:]";
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v6 = [(FHSearchSuggestionController *)self _remoteObjectProxyWithErrorHandler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__FHSearchSuggestionController_aggregateFeaturesWithHandler___block_invoke;
  v8[3] = &unk_264CAF3A0;
  id v9 = v4;
  id v7 = v4;
  [v6 aggregateFeaturesWithHandler:v8];
}

uint64_t __61__FHSearchSuggestionController_aggregateFeaturesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(FHSearchSuggestionController *)self _clientConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__FHSearchSuggestionController__remoteObjectProxyWithErrorHandler__block_invoke;
  v6[3] = &unk_264CAF3C8;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void __66__FHSearchSuggestionController__remoteObjectProxyWithErrorHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 localizedDescription];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = (id)objc_opt_class();
    id v7 = v11;
    _os_log_impl(&dword_236773000, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (FHSuggestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FHSuggestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (os_unfair_lock_s)lockConnection
{
  return self->_lockConnection;
}

- (void)setLockConnection:(os_unfair_lock_s)a3
{
  self->_lockConnection = a3;
}

- (os_unfair_lock_s)lockCache
{
  return self->_lockCache;
}

- (void)setLockCache:(os_unfair_lock_s)a3
{
  self->_lockCache = a3;
}

- (BOOL)cacheConnectionInitiated
{
  return self->_cacheConnectionInitiated;
}

- (void)setCacheConnectionInitiated:(BOOL)a3
{
  self->_cacheConnectionInitiated = a3;
}

- (NSMutableArray)instrumentationCache
{
  return self->_instrumentationCache;
}

- (void)setInstrumentationCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationCache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end