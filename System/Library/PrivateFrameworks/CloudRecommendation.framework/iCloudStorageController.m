@interface iCloudStorageController
- (ACAccount)account;
- (iCloudStorageController)initWithAccount:(id)a3;
- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4;
- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchStorageSummary:(id)a3;
- (void)setAccount:(id)a3;
@end

@implementation iCloudStorageController

- (iCloudStorageController)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)iCloudStorageController;
  v6 = [(iCloudStorageController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v7 = (void *)getICQStoragePlanRecommendationClass_softClass;
  uint64_t v24 = getICQStoragePlanRecommendationClass_softClass;
  if (!getICQStoragePlanRecommendationClass_softClass)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __getICQStoragePlanRecommendationClass_block_invoke;
    v20[3] = &unk_2652845F8;
    v20[4] = &v21;
    __getICQStoragePlanRecommendationClass_block_invoke((uint64_t)v20);
    v7 = (void *)v22[3];
  }
  v8 = v7;
  _Block_object_dispose(&v21, 8);
  id v19 = (id)[[v8 alloc] initWithAccount:self->_account];
  objc_super v9 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__iCloudStorageController_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke;
  v11[3] = &unk_265284738;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  v13 = &v14;
  [v9 calculateExtraQuotaNeededToSyncIsAccountFull:v4 completion:v11];

  _Block_object_dispose(&v14, 8);
}

- (void)fetchStorageSummary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v5 = (void *)getICQCloudStorageDataControllerClass_softClass;
  uint64_t v22 = getICQCloudStorageDataControllerClass_softClass;
  if (!getICQCloudStorageDataControllerClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getICQCloudStorageDataControllerClass_block_invoke;
    v18[3] = &unk_2652845F8;
    v18[4] = &v19;
    __getICQCloudStorageDataControllerClass_block_invoke((uint64_t)v18);
    id v5 = (void *)v20[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v19, 8);
  id v17 = (id)[[v6 alloc] initWithAccount:self->_account];
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__iCloudStorageController_fetchStorageSummary___block_invoke;
  v9[3] = &unk_265284760;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  v11 = &v12;
  [v7 fetchStorageSummaryWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v7 = (void *)getICSHomeDataControllerClass_softClass;
  uint64_t v17 = getICSHomeDataControllerClass_softClass;
  if (!getICSHomeDataControllerClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getICSHomeDataControllerClass_block_invoke;
    v13[3] = &unk_2652845F8;
    v13[4] = &v14;
    __getICSHomeDataControllerClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);
  objc_super v9 = (void *)[[v8 alloc] initWithAccount:self->_account];
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__iCloudStorageController_fetchCloudStorageInfo_completion___block_invoke;
    v11[3] = &unk_265284788;
    id v12 = v6;
    [v9 fetchCloudStorageInfo:v4 completion:v11];
  }
  else
  {
    id v10 = _CELogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[iCloudStorageController fetchCloudStorageInfo:completion:](v10);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchCloudStorageInfo:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24A2CB000, log, OS_LOG_TYPE_ERROR, "Future method not implemented in iCS.", v1, 2u);
}

@end