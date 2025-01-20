@interface CERecommendationDataController
- (CERecommendationDataController)initWithAccount:(id)a3;
- (void)fetchCompletedRecommendations:(id)a3 completion:(id)a4;
- (void)fetchCompletedRecommendations:(id)a3 recommendationInfo:(id)a4 completion:(id)a5;
- (void)fetchRecommendationsRulesetWithCompletion:(id)a3;
- (void)fetchRecommendationsRulesetWithInfo:(id)a3 completion:(id)a4;
- (void)fetchRecommendationsWithCompletion:(id)a3;
- (void)fetchRecommendationsWithInfo:(id)a3 completion:(id)a4;
- (void)sendRecommendationStatus:(id)a3 configuration:(id)a4 recommendationIdentifiers:(id)a5 storageRecovered:(id)a6 context:(id)a7 completion:(id)a8;
@end

@implementation CERecommendationDataController

- (CERecommendationDataController)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CERecommendationDataController;
  v6 = [(CERecommendationDataController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)fetchRecommendationsWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];
  int v6 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v7 = [(ACAccount *)self->_account aa_isManagedAppleID];
  v8 = _CELogSystem();
  objc_super v9 = v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v7 == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsWithCompletion:]();
    }

    v13 = _CESignpostLogSystem();
    v14 = objc_opt_new();
    os_signpost_id_t v15 = _CESignpostCreateWithObject(v13, v14);
    uint64_t v17 = v16;

    v18 = _CESignpostLogSystem();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RecommendationsRequest", "", buf, 2u);
    }

    v20 = _CESignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsWithCompletion:]();
    }

    id v12 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke;
    v27[3] = &unk_265284658;
    os_signpost_id_t v29 = v15;
    uint64_t v30 = v17;
    id v21 = v4;
    id v28 = v21;
    v22 = [v12 daemonWithErrorHandler:v27];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1;
    v23[3] = &unk_265284680;
    os_signpost_id_t v25 = v15;
    uint64_t v26 = v17;
    id v24 = v21;
    [v22 fetchRecommendationsForAltDSID:v5 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v5;
      __int16 v33 = 1024;
      int v34 = v6;
      __int16 v35 = 1024;
      int v36 = v7;
      _os_log_error_impl(&dword_24A2CB000, v9, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v12);
  }
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  int v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRequest", "", v9, 2u);
  }

  v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRequest", "", v13, 2u);
  }

  BOOL v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();
  }

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1();
    }

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)fetchRecommendationsWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACAccount *)self->_account aa_altDSID];
  int v9 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v10 = [(ACAccount *)self->_account aa_isManagedAppleID];
  v11 = _CELogSystem();
  id v12 = v11;
  if (v8) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsWithCompletion:]();
    }

    uint64_t v16 = _CESignpostLogSystem();
    uint64_t v17 = objc_opt_new();
    os_signpost_id_t v18 = _CESignpostCreateWithObject(v16, v17);
    uint64_t v20 = v19;

    id v21 = _CESignpostLogSystem();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RecommendationsRequest", "", buf, 2u);
    }

    v23 = _CESignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsWithCompletion:]();
    }

    id v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke;
    v31[3] = &unk_265284658;
    os_signpost_id_t v33 = v18;
    uint64_t v34 = v20;
    id v24 = v7;
    id v32 = v24;
    os_signpost_id_t v25 = [v15 synchronousDaemonWithErrorHandler:v31];
    if (objc_opt_respondsToSelector())
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke_5;
      v27[3] = &unk_265284680;
      os_signpost_id_t v29 = v18;
      uint64_t v30 = v20;
      id v28 = v24;
      [v25 fetchRecommendationsForAltDSID:v8 recommendationInfo:v6 completion:v27];
      uint64_t v26 = v28;
    }
    else
    {
      uint64_t v26 = _CELogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationDataController fetchRecommendationsWithInfo:completion:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int v36 = v8;
      __int16 v37 = 1024;
      int v38 = v9;
      __int16 v39 = 1024;
      int v40 = v10;
      _os_log_error_impl(&dword_24A2CB000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
  }
}

void __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRequest", "", v9, 2u);
  }

  v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __74__CERecommendationDataController_fetchRecommendationsWithInfo_completion___block_invoke_5(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRequest", "", v13, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1();
  }

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1();
    }

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)fetchRecommendationsRulesetWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];
  int v6 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v7 = [(ACAccount *)self->_account aa_isManagedAppleID];
  v8 = _CELogSystem();
  os_signpost_id_t v9 = v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v7 == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:]();
    }

    BOOL v13 = _CESignpostLogSystem();
    v14 = objc_opt_new();
    os_signpost_id_t v15 = _CESignpostCreateWithObject(v13, v14);
    uint64_t v17 = v16;

    os_signpost_id_t v18 = _CESignpostLogSystem();
    uint64_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RecommendationsRulesetRequest", "", buf, 2u);
    }

    uint64_t v20 = _CESignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:]();
    }

    id v12 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke;
    v27[3] = &unk_265284658;
    os_signpost_id_t v29 = v15;
    uint64_t v30 = v17;
    id v21 = v4;
    id v28 = v21;
    v22 = [v12 daemonWithErrorHandler:v27];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6;
    v23[3] = &unk_2652846A8;
    os_signpost_id_t v25 = v15;
    uint64_t v26 = v17;
    id v24 = v21;
    [v22 fetchRecommendationsRulesetForAltDSID:v5 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v5;
      __int16 v33 = 1024;
      int v34 = v6;
      __int16 v35 = 1024;
      int v36 = v7;
      _os_log_error_impl(&dword_24A2CB000, v9, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v12);
  }
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  int v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRulesetRequest", "", v9, 2u);
  }

  v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRulesetRequest", "", v13, 2u);
  }

  BOOL v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();
  }

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1();
    }

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)fetchRecommendationsRulesetWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACAccount *)self->_account aa_altDSID];
  int v9 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v10 = [(ACAccount *)self->_account aa_isManagedAppleID];
  v11 = _CELogSystem();
  id v12 = v11;
  if (v8) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:]();
    }

    uint64_t v16 = _CESignpostLogSystem();
    uint64_t v17 = objc_opt_new();
    os_signpost_id_t v18 = _CESignpostCreateWithObject(v16, v17);
    uint64_t v20 = v19;

    id v21 = _CESignpostLogSystem();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RecommendationsRulesetRequest", "", buf, 2u);
    }

    v23 = _CESignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchRecommendationsRulesetWithCompletion:]();
    }

    id v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke;
    v31[3] = &unk_265284658;
    os_signpost_id_t v33 = v18;
    uint64_t v34 = v20;
    id v24 = v7;
    id v32 = v24;
    os_signpost_id_t v25 = [v15 synchronousDaemonWithErrorHandler:v31];
    if (objc_opt_respondsToSelector())
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke_10;
      v27[3] = &unk_2652846A8;
      os_signpost_id_t v29 = v18;
      uint64_t v30 = v20;
      id v28 = v24;
      [v25 fetchRecommendationsRulesetForAltDSID:v8 recommendationInfo:v6 completion:v27];
      uint64_t v26 = v28;
    }
    else
    {
      uint64_t v26 = _CELogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationDataController fetchRecommendationsRulesetWithInfo:completion:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int v36 = v8;
      __int16 v37 = 1024;
      int v38 = v9;
      __int16 v39 = 1024;
      int v40 = v10;
      _os_log_error_impl(&dword_24A2CB000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
  }
}

void __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationsRulesetRequest", "", v9, 2u);
  }

  v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __81__CERecommendationDataController_fetchRecommendationsRulesetWithInfo_completion___block_invoke_10(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationsRulesetRequest", "", v13, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1();
  }

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1();
    }

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)fetchCompletedRecommendations:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACAccount *)self->_account aa_altDSID];
  int v9 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v10 = [(ACAccount *)self->_account aa_isManagedAppleID];
  v11 = _CELogSystem();
  id v12 = v11;
  if (v8) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v10 == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchCompletedRecommendations:completion:]();
    }

    uint64_t v16 = _CESignpostLogSystem();
    uint64_t v17 = objc_opt_new();
    os_signpost_id_t v18 = _CESignpostCreateWithObject(v16, v17);
    uint64_t v20 = v19;

    id v21 = _CESignpostLogSystem();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CompletedRecommendationsRequest", "", buf, 2u);
    }

    v23 = _CESignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchCompletedRecommendations:completion:]();
    }

    id v15 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke;
    v30[3] = &unk_265284658;
    os_signpost_id_t v32 = v18;
    uint64_t v33 = v20;
    id v24 = v7;
    id v31 = v24;
    os_signpost_id_t v25 = [v15 daemonWithErrorHandler:v30];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11;
    v26[3] = &unk_265284680;
    os_signpost_id_t v28 = v18;
    uint64_t v29 = v20;
    id v27 = v24;
    [v25 fetchCompletedAndDismissedRecommendationsForAltDSID:v8 configuration:v6 completion:v26];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v35 = v8;
      __int16 v36 = 1024;
      int v37 = v9;
      __int16 v38 = 1024;
      int v39 = v10;
      _os_log_error_impl(&dword_24A2CB000, v12, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
  }
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CompletedRecommendationsRequest", "", v9, 2u);
  }

  v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CompletedRecommendationsRequest", "", v13, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();
  }

  if (v5)
  {
    v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1();
    }

    v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)fetchCompletedRecommendations:(id)a3 recommendationInfo:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  os_signpost_id_t v9 = [(ACAccount *)self->_account aa_altDSID];
  int v10 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v11 = [(ACAccount *)self->_account aa_isManagedAppleID];
  id v12 = _CELogSystem();
  BOOL v13 = v12;
  if (v9) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && v11 == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchCompletedRecommendations:completion:]();
    }

    uint64_t v17 = _CESignpostLogSystem();
    os_signpost_id_t v18 = objc_opt_new();
    os_signpost_id_t v19 = _CESignpostCreateWithObject(v17, v18);
    uint64_t v21 = v20;

    v22 = _CESignpostLogSystem();
    v23 = v22;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CompletedRecommendationsRequest", "", buf, 2u);
    }

    id v24 = _CESignpostLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController fetchCompletedRecommendations:completion:]();
    }

    id v16 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke;
    v32[3] = &unk_265284658;
    os_signpost_id_t v34 = v19;
    uint64_t v35 = v21;
    id v25 = v8;
    id v33 = v25;
    uint64_t v26 = [v16 synchronousDaemonWithErrorHandler:v32];
    if (objc_opt_respondsToSelector())
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke_14;
      v28[3] = &unk_265284680;
      os_signpost_id_t v30 = v19;
      uint64_t v31 = v21;
      uint64_t v29 = v25;
      [v26 fetchCompletedAndDismissedRecommendationsForAltDSID:v9 recommendationInfo:v7 completion:v28];
      id v27 = v29;
    }
    else
    {
      id v27 = _CELogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CERecommendationDataController fetchCompletedRecommendations:recommendationInfo:completion:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int v37 = v9;
      __int16 v38 = 1024;
      int v39 = v10;
      __int16 v40 = 1024;
      int v41 = v11;
      _os_log_error_impl(&dword_24A2CB000, v13, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v16);
  }
}

void __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CompletedRecommendationsRequest", "", v9, 2u);
  }

  id v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __94__CERecommendationDataController_fetchCompletedRecommendations_recommendationInfo_completion___block_invoke_14(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _CESignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CompletedRecommendationsRequest", "", v13, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1();
  }

  if (v5)
  {
    int v11 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    id v12 = _CELogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1();
    }

    int v11 = *(void (**)(void))(a1[4] + 16);
  }
  v11();
}

- (void)sendRecommendationStatus:(id)a3 configuration:(id)a4 recommendationIdentifiers:(id)a5 storageRecovered:(id)a6 context:(id)a7 completion:(id)a8
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v43 = a4;
  id v15 = a5;
  id v16 = a6;
  v44 = (__CFString *)a7;
  id v17 = a8;
  os_signpost_id_t v18 = [(ACAccount *)self->_account aa_altDSID];
  int v19 = [(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]];
  int v20 = [(ACAccount *)self->_account aa_isManagedAppleID];
  uint64_t v21 = _CELogSystem();
  v22 = v21;
  if (v18 && (v19 ? (BOOL v23 = v20 == 0) : (BOOL v23 = 0), v23))
  {
    id v42 = v15;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:]();
    }

    id v24 = _CESignpostLogSystem();
    id v25 = objc_opt_new();
    os_signpost_id_t v26 = _CESignpostCreateWithObject(v24, v25);
    uint64_t v28 = v27;

    uint64_t v29 = _CESignpostLogSystem();
    os_signpost_id_t v30 = v29;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24A2CB000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "RecommendationStatusRequest", "", buf, 2u);
    }

    uint64_t v31 = _CESignpostLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[CERecommendationDataController sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:]();
    }

    id v32 = objc_alloc_init((Class)getINDaemonConnectionClass());
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke;
    v49[3] = &unk_265284658;
    os_signpost_id_t v51 = v26;
    uint64_t v52 = v28;
    id v41 = v17;
    id v33 = v17;
    uint64_t v34 = v28;
    id v35 = v33;
    id v50 = v33;
    __int16 v36 = [v32 daemonWithErrorHandler:v49];
    id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v37 setObject:v42 forKeyedSubscript:@"recommendations"];
    if (v44) {
      __int16 v38 = v44;
    }
    else {
      __int16 v38 = @"main";
    }
    [v37 setObject:v38 forKeyedSubscript:@"context"];
    [v37 setObject:v16 forKeyedSubscript:@"storageRecovered"];
    [v37 setObject:v14 forKeyedSubscript:@"action"];
    if (objc_opt_respondsToSelector())
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_31;
      v47[3] = &unk_265284658;
      v48[1] = v26;
      v48[2] = v34;
      int v39 = (id *)v48;
      v48[0] = v35;
      __int16 v40 = v43;
      [v36 sendStatusForRecommendationsWithAltDSID:v18 configuration:v43 params:v37 completion:v47];
    }
    else
    {
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_32;
      v45[3] = &unk_265284658;
      v46[1] = v26;
      v46[2] = v34;
      int v39 = (id *)v46;
      v46[0] = v35;
      __int16 v40 = v43;
      [v36 sendStatusForRecommendationsWithAltDSID:v18 configuration:v43 status:v14 recommendationIdentifiers:v42 storageRecovered:v16 completion:v45];
    }

    id v17 = v41;
    id v15 = v42;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v54 = v18;
      __int16 v55 = 1024;
      int v56 = v19;
      __int16 v57 = 1024;
      int v58 = v20;
      _os_log_error_impl(&dword_24A2CB000, v22, OS_LOG_TYPE_ERROR, "Invalid account. altDSID: %@ isPrimary: %d isManaged: %d.", buf, 0x18u);
    }

    CECreateError(12);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v17 + 2))(v17, v32);
    __int16 v40 = v43;
  }
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _CELogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_2();
  }

  _CESignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _CESignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RecommendationStatusRequest", "", v9, 2u);
  }

  id v8 = _CESignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_31(void *a1, void *a2)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v3 = a1 + 5;
  id v6 = a2;
  _CESignpostGetNanoseconds(v4, v5);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = *v3;
  if (*v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)int v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationStatusRequest", "", v11, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_32(void *a1, void *a2)
{
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v3 = a1 + 5;
  id v6 = a2;
  _CESignpostGetNanoseconds(v4, v5);
  os_signpost_id_t v7 = _CESignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = *v3;
  if (*v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)int v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_24A2CB000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecommendationStatusRequest", "", v11, 2u);
  }

  int v10 = _CESignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void).cxx_destruct
{
}

- (void)fetchRecommendationsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_24A2CB000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationsRequest ", v2, v3, v4, v5, v6);
}

- (void)fetchRecommendationsWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_24A2CB000, v0, v1, "Reaching out to daemon to fetch recommendations", v2, v3, v4, v5, v6);
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24A2CB000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationsRequest ", v2, v3, v4, v5, v6);
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "XPC Error while reaching out to daemon to fetch recommendations", v2, v3, v4, v5, v6);
}

void __69__CERecommendationDataController_fetchRecommendationsWithCompletion___block_invoke_1_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_24A2CB000, v0, v1, "Failed to fetch Recommendations with error: %@", v2, v3, v4, v5, v6);
}

- (void)fetchRecommendationsWithInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Method [INDaemon fetchRecommendationsForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
}

- (void)fetchRecommendationsRulesetWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_24A2CB000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationsRulesetRequest ", v2, v3, v4, v5, v6);
}

- (void)fetchRecommendationsRulesetWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_24A2CB000, v0, v1, "Reaching out to daemon to fetch recommendations ruleset", v2, v3, v4, v5, v6);
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24A2CB000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationsRulesetRequest ", v2, v3, v4, v5, v6);
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "XPC Error while reaching out to daemon to fetch recommendations ruleset", v2, v3, v4, v5, v6);
}

void __76__CERecommendationDataController_fetchRecommendationsRulesetWithCompletion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_24A2CB000, v0, v1, "Failed to fetch Recommendations rules with error: %@", v2, v3, v4, v5, v6);
}

- (void)fetchRecommendationsRulesetWithInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Method [INDaemon fetchRecommendationsRulesetForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
}

- (void)fetchCompletedRecommendations:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_24A2CB000, v0, v1, "SIGNPOST BEGIN [id: %hu]: CompletedRecommendationsRequest ", v2, v3, v4, v5, v6);
}

- (void)fetchCompletedRecommendations:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_24A2CB000, v0, v1, "Reaching out to daemon to fetch completed & dismissed recommendations", v2, v3, v4, v5, v6);
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24A2CB000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) CompletedRecommendationsRequest ", v2, v3, v4, v5, v6);
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "XPC Error while reaching out to daemon to fetch completed recommendations", v2, v3, v4, v5, v6);
}

void __75__CERecommendationDataController_fetchCompletedRecommendations_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_24A2CB000, v0, v1, "Failed to fetch completed and dismissed recommendations with error: %@", v2, v3, v4, v5, v6);
}

- (void)fetchCompletedRecommendations:recommendationInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_24A2CB000, v0, v1, "Method [INDaemon fetchCompletedAndDismissedRecommendationsForAltDSID:details:completion:] not implemented yet.", v2, v3, v4, v5, v6);
}

- (void)sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_24A2CB000, v0, v1, "SIGNPOST BEGIN [id: %hu]: RecommendationStatusRequest ", v2, v3, v4, v5, v6);
}

- (void)sendRecommendationStatus:configuration:recommendationIdentifiers:storageRecovered:context:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_24A2CB000, v0, v1, "Reaching out to daemon to fetch send recommendations status", v2, v3, v4, v5, v6);
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24A2CB000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) RecommendationStatusRequest ", v2, v3, v4, v5, v6);
}

void __135__CERecommendationDataController_sendRecommendationStatus_configuration_recommendationIdentifiers_storageRecovered_context_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_24A2CB000, v0, v1, "XPC Error while reaching out to daemon to send recommendations status %@", v2, v3, v4, v5, v6);
}

@end