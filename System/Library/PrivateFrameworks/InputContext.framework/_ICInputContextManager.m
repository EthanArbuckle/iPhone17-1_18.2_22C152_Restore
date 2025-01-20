@interface _ICInputContextManager
+ (id)sharedManager;
- (_ICInputContextManager)initWithPredictionSource:(id)a3;
- (id)addContactObserver:(id)a3;
- (id)addNamedEntitiesUpdateObserver:(id)a3;
- (id)getLexiconManager;
- (id)getPredictionManager;
- (id)initForIntegrationTesting;
- (id)lastCachedResultWithInitialCharacters:(id)a3;
- (id)loadLexicons;
- (id)loadLexicons:(id)a3;
- (id)loadLexiconsUsingFilter:(id)a3;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11;
- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9;
- (void)doInitLexiconManager;
- (void)doInitPredictionManager;
- (void)hibernate;
- (void)initLexiconManager;
- (void)initPredictionManager;
- (void)predictedItemSelected:(id)a3;
- (void)provideLexiconFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)providePredictionFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)removeContactObserver:(id)a3;
- (void)removeNamedEntitiesUpdateObserver:(id)a3;
- (void)reset;
- (void)unloadLexicons;
- (void)warmUp;
@end

@implementation _ICInputContextManager

+ (id)sharedManager
{
  if (sharedManager_pred != -1) {
    dispatch_once(&sharedManager_pred, &__block_literal_global);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

- (void)doInitLexiconManager
{
  if (!self->_lexiconManager)
  {
    id v6 = (id)objc_opt_new();
    v3 = objc_opt_new();
    [v6 addObject:v3];

    v4 = [[_ICLexiconManager alloc] initWithLexiconSources:v6];
    lexiconManager = self->_lexiconManager;
    self->_lexiconManager = (_ICLexiconManaging *)v4;
  }
}

- (void)initLexiconManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___ICInputContextManager_initLexiconManager__block_invoke;
  block[3] = &unk_264C55F48;
  block[4] = self;
  if (initLexiconManager_pred != -1) {
    dispatch_once(&initLexiconManager_pred, block);
  }
}

- (void)doInitPredictionManager
{
  if (!self->_predictionManager)
  {
    id v8 = (id)objc_opt_new();
    v3 = objc_opt_new();
    [v8 addObject:v3];

    v4 = objc_opt_new();
    [v8 addObject:v4];

    v5 = objc_opt_new();
    [v8 addObject:v5];

    id v6 = [[_ICPredictionManager alloc] initWithPredictionSources:v8];
    predictionManager = self->_predictionManager;
    self->_predictionManager = v6;
  }
}

- (void)initPredictionManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___ICInputContextManager_initPredictionManager__block_invoke;
  block[3] = &unk_264C55F48;
  block[4] = self;
  if (initPredictionManager_pred != -1) {
    dispatch_once(&initPredictionManager_pred, block);
  }
}

- (id)getPredictionManager
{
  [(_ICInputContextManager *)self initPredictionManager];
  predictionManager = self->_predictionManager;
  return predictionManager;
}

- (id)getLexiconManager
{
  [(_ICInputContextManager *)self initLexiconManager];
  lexiconManager = self->_lexiconManager;
  return lexiconManager;
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(_ICInputContextManager *)self getPredictionManager];
  v20 = [v19 searchWithTriggers:v18 application:v17 recipient:v16 localeIdentifier:v15 timeoutInMilliseconds:v10 resultLimit:v9 error:a9];

  return v20;
}

- (id)lastCachedResultWithInitialCharacters:(id)a3
{
  id v4 = a3;
  v5 = [(_ICInputContextManager *)self getPredictionManager];
  id v6 = [v5 lastCachedResultWithInitialCharacters:v4];

  return v6;
}

- (void)predictedItemSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getPredictionManager];
  [v5 predictedItemSelected:v4];
}

- (void)reset
{
  id v2 = [(_ICInputContextManager *)self getPredictionManager];
  [v2 reset];
}

- (id)searchForMeCardRegions
{
  id v2 = [(_ICInputContextManager *)self getPredictionManager];
  v3 = [v2 searchForMeCardRegions];

  return v3;
}

- (id)searchForMeCardEmailAddresses
{
  id v2 = [(_ICInputContextManager *)self getPredictionManager];
  v3 = [v2 searchForMeCardEmailAddresses];

  return v3;
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  id v6 = [v5 addContactObserver:v4];

  return v6;
}

- (void)removeContactObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  [v5 removeContactObserver:v4];
}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  id v6 = [v5 addNamedEntitiesUpdateObserver:v4];

  return v6;
}

- (void)removeNamedEntitiesUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  [v5 removeNamedEntitiesUpdateObserver:v4];
}

- (id)loadLexicons:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  id v6 = [v5 loadLexicons:v4];

  return v6;
}

- (id)loadLexiconsUsingFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self getLexiconManager];
  id v6 = [v5 loadLexiconsUsingFilter:v4];

  return v6;
}

- (id)loadLexicons
{
  id v2 = [(_ICInputContextManager *)self getLexiconManager];
  v3 = [v2 loadLexicons];

  return v3;
}

- (void)unloadLexicons
{
  id v2 = [(_ICInputContextManager *)self getLexiconManager];
  [v2 unloadLexicons];
}

- (void)warmUp
{
  v3 = [(_ICInputContextManager *)self getPredictionManager];
  [v3 warmUp];

  id v4 = [(_ICInputContextManager *)self getLexiconManager];
  [v4 warmUp];
}

- (void)hibernate
{
  v3 = [(_ICInputContextManager *)self getPredictionManager];
  [v3 hibernate];

  id v4 = [(_ICInputContextManager *)self getLexiconManager];
  [v4 hibernate];
}

- (_ICInputContextManager)initWithPredictionSource:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_ICInputContextManager *)self init];
  if (v5)
  {
    id v6 = [_ICPredictionManager alloc];
    v11[0] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    uint64_t v8 = [(_ICPredictionManager *)v6 initWithPredictionSources:v7];
    predictionManager = v5->_predictionManager;
    v5->_predictionManager = (_ICPredictionManager *)v8;
  }
  return v5;
}

- (id)initForIntegrationTesting
{
  id v2 = [(_ICInputContextManager *)self init];
  v3 = v2;
  if (v2)
  {
    [(_ICInputContextManager *)v2 doInitLexiconManager];
    [(_ICInputContextManager *)v3 doInitPredictionManager];
  }
  return v3;
}

- (void)provideLexiconFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_ICLexiconManaging *)self->_lexiconManager provideFeedbackForString:v8 type:v6 style:v5];
  }
}

- (void)providePredictionFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionManager, 0);
  objc_storeStrong((id *)&self->_lexiconManager, 0);
}

@end