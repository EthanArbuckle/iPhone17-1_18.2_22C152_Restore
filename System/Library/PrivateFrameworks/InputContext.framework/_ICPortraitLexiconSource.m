@interface _ICPortraitLexiconSource
- (_ICPortraitLexiconSource)init;
- (id)_makeContactDelegate;
- (id)_makeNamedEntityDelegate;
- (id)_makePPNamedEntityStore;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)startLoadingWithManager:(id)a3;
@end

@implementation _ICPortraitLexiconSource

- (_ICPortraitLexiconSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)_ICPortraitLexiconSource;
  v2 = [(_ICPortraitLexiconSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    contactStore = v2->_contactStore;
    v2->_contactStore = (PPContactStore *)v3;

    uint64_t v5 = [(_ICPortraitLexiconSource *)v2 _makePPNamedEntityStore];
    namedEntityStore = v2->_namedEntityStore;
    v2->_namedEntityStore = (PPNamedEntityStore *)v5;
  }
  return v2;
}

- (id)_makePPNamedEntityStore
{
  if (_makePPNamedEntityStore_onceToken != -1) {
    dispatch_once(&_makePPNamedEntityStore_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_makePPNamedEntityStore_store;
  return v2;
}

- (void)startLoadingWithManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
  v4 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235496000, v4, OS_LOG_TYPE_INFO, "_ICPortraitLexiconSource loading data", buf, 2u);
  }

  uint64_t v5 = [(_ICPortraitLexiconSource *)self _makeContactDelegate];
  contactDelegate = self->_contactDelegate;
  self->_contactDelegate = v5;

  contactStore = self->_contactStore;
  objc_super v8 = self->_contactDelegate;
  id v21 = 0;
  [(PPContactStore *)contactStore loadContactNameRecordsAndMonitorChangesWithDelegate:v8 error:&v21];
  id v9 = v21;
  if (v9)
  {
    v10 = _ICPersContactOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_ICPortraitLexiconSource startLoadingWithManager:]((uint64_t)v9, v10);
    }
  }
  v11 = [(_ICPortraitLexiconSource *)self _makeNamedEntityDelegate];
  namedEntityDelegate = self->_namedEntityDelegate;
  self->_namedEntityDelegate = v11;

  id v13 = objc_alloc_init(MEMORY[0x263F5D4B0]);
  v14 = +[_ICPortraitUtilities acceptedSourceBundleIds];
  [v13 setMatchingSourceBundleIds:v14];

  v15 = +[_ICPortraitUtilities excludedAlgorithms];
  [v13 setExcludingAlgorithms:v15];

  namedEntityStore = self->_namedEntityStore;
  v17 = self->_namedEntityDelegate;
  id v20 = 0;
  [(PPNamedEntityStore *)namedEntityStore loadNamedEntityRecordsAndMonitorChangesWithDelegate:v17 query:v13 error:&v20];
  id v18 = v20;
  if (v18)
  {
    v19 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_ICPortraitLexiconSource startLoadingWithManager:]((uint64_t)v18, v19);
    }
  }
}

- (id)_makeContactDelegate
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F5D488]) initWithName:@"ICPortraitLexiconSource"];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke;
  v15[3] = &unk_264C56188;
  objc_copyWeak(&v16, &location);
  [v3 setContactNameRecordsSetup:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_2;
  v13[3] = &unk_264C561B0;
  objc_copyWeak(&v14, &location);
  [v3 setContactNameRecordsHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_3;
  v11[3] = &unk_264C561D8;
  objc_copyWeak(&v12, &location);
  [v3 setContactNameRecordsCompletion:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_4;
  v9[3] = &unk_264C56188;
  objc_copyWeak(&v10, &location);
  [v3 setRecentContactNameRecordsSetup:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_5;
  v7[3] = &unk_264C561B0;
  objc_copyWeak(&v8, &location);
  [v3 setRecentContactNameRecordsHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_6;
  v5[3] = &unk_264C561D8;
  objc_copyWeak(&v6, &location);
  [v3 setRecentContactNameRecordsCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_makeNamedEntityDelegate
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F5D4C0]) initWithName:@"ICPortraitLexiconSource"];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke;
  v17[3] = &unk_264C56188;
  objc_copyWeak(&v18, &location);
  [v3 setNamedEntityRecordsSetup:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_2;
  v15[3] = &unk_264C56200;
  objc_copyWeak(&v16, &location);
  [v3 setNamedEntityRecordsHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_3;
  v13[3] = &unk_264C561D8;
  objc_copyWeak(&v14, &location);
  [v3 setNamedEntityRecordsCompletion:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_4;
  v11[3] = &unk_264C56188;
  objc_copyWeak(&v12, &location);
  [v3 setRecentNamedEntityRecordsSetup:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_5;
  v9[3] = &unk_264C56200;
  objc_copyWeak(&v10, &location);
  [v3 setRecentNamedEntityRecordsHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_6;
  v7[3] = &unk_264C561D8;
  objc_copyWeak(&v8, &location);
  [v3 setRecentNamedEntityRecordsCompletion:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_7;
  v5[3] = &unk_264C561D8;
  objc_copyWeak(&v6, &location);
  [v3 setResetNamedEntityRecordData:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v3;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  if (v6 == 3)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithOfferedString:v8];
LABEL_15:
    id v10 = v9;
    v11 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_ICPortraitLexiconSource provideFeedbackForString:type:style:](v5, v6, v11);
    }

    [(PPNamedEntityStore *)self->_namedEntityStore registerFeedback:v10 completion:0];
    goto LABEL_18;
  }
  if (v6 == 1 && v5 == 1)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithExplicitlyEngagedString:v8];
    goto LABEL_15;
  }
  if (v6 == 1 && v5 == 2)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithImplicitlyEngagedString:v8];
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 1)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithExplicitlyRejectedString:v8];
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 2)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithImplicitlyRejectedString:v8];
    goto LABEL_15;
  }
  id v10 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_ICPortraitLexiconSource provideFeedbackForString:type:style:](v6, v5, v10);
  }
LABEL_18:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityDelegate, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactDelegate, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)startLoadingWithManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "failed to load named entity records from Portrait: %@", (uint8_t *)&v2, 0xCu);
}

- (void)startLoadingWithManager:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "failed to load contact name records from Portrait: %@", (uint8_t *)&v2, 0xCu);
}

- (void)provideFeedbackForString:(unsigned __int8)a1 type:(int)a2 style:(os_log_t)log .cold.1(unsigned __int8 a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_235496000, log, OS_LOG_TYPE_DEBUG, "Feedback received by _ICPortraitLexiconSource with type = %d, style = %d", (uint8_t *)v3, 0xEu);
}

- (void)provideFeedbackForString:(int)a1 type:(int)a2 style:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_235496000, log, OS_LOG_TYPE_ERROR, "Error: feedback received by _ICPortraitLexiconSource with unknown type or style: %d / %d", (uint8_t *)v3, 0xEu);
}

@end