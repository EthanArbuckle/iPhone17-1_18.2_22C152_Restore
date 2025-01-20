@interface AATrustedContactFlowPresenter
- (void)dealloc;
- (void)presentInvitationUIWithCustodianshipInfo:(id)a3 completion:(id)a4;
- (void)presentModel:(id)a3 completion:(id)a4;
@end

@implementation AATrustedContactFlowPresenter

- (void)presentModel:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(AAFlowPresenter *)self setPresentationCompletion:a4];
  id v15 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 setObject:v11 forKeyedSubscript:@"modelType"];
  }
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 objectForKeyedSubscript:@"modelType"];
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "modelType: %@", buf, 0xCu);
  }
  if (!v7)
  {
    v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AATrustedContactFlowPresenter presentModel:completion:]((uint64_t)v8, v14);
    }
  }
  [v9 setObject:v7 forKeyedSubscript:@"modelData"];
  [(AAFlowPresenter *)self launchProcessWithUserInfo:v9];
}

- (void)presentInvitationUIWithCustodianshipInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(AAFlowPresenter *)self setPresentationCompletion:a4];
  v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Presenting invitation UI with info.", buf, 2u);
  }

  id v8 = _AALogSystem();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Will create model for invitation.", v18, 2u);
    }

    v10 = [[AAOBCustodianInvitationModel alloc] initWithCustodianshipInfo:v6];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = 0;
    v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v17];
    id v13 = v17;
    v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    [v11 setObject:v15 forKeyedSubscript:@"modelType"];

    if (!v12)
    {
      v16 = _AALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AATrustedContactFlowPresenter presentModel:completion:]((uint64_t)v13, v16);
      }
    }
    [v11 setObject:v12 forKeyedSubscript:@"modelData"];
    [(AAFlowPresenter *)self launchProcessWithUserInfo:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AATrustedContactFlowPresenter presentInvitationUIWithCustodianshipInfo:completion:](v9);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -3);
    v10 = (AAOBCustodianInvitationModel *)objc_claimAutoreleasedReturnValue();
    [(AAFlowPresenter *)self flowFinishedWithError:v10 completion:0];
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated.", (uint8_t *)&v2, 0xCu);
}

- (void)presentModel:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Context data is nil: %@", (uint8_t *)&v2, 0xCu);
}

- (void)presentInvitationUIWithCustodianshipInfo:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "No contact detected. Will not display UI", v1, 2u);
}

@end