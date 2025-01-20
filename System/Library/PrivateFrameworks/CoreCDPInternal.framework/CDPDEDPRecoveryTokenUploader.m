@interface CDPDEDPRecoveryTokenUploader
- (BOOL)_isTokenUploadable:(id)a3 reason:(unint64_t)a4 error:(id *)a5;
- (CDPDEDPRecoveryTokenUploader)initWithAccount:(id)a3 cdpContext:(id)a4 authProvider:(id)a5;
- (void)_retryableUpload:(id)a3 completion:(id)a4;
- (void)_saveAccount;
- (void)uploadRecoveryToken:(id)a3 tokenId:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
@end

@implementation CDPDEDPRecoveryTokenUploader

- (CDPDEDPRecoveryTokenUploader)initWithAccount:(id)a3 cdpContext:(id)a4 authProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDPDEDPRecoveryTokenUploader;
  v12 = [(CDPDEDPRecoveryTokenUploader *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_cdpContext, a4);
    objc_storeStrong((id *)&v13->_authProvider, a5);
  }

  return v13;
}

- (BOOL)_isTokenUploadable:(id)a3 reason:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(ACAccount *)self->_account accountPropertyForKey:@"edpRecoveryTokenIdCreatedBySelf"];
  objc_opt_class();
  objc_opt_class();
  id v10 = [(ACAccount *)self->_account accountPropertyForKey:@"edpLastRecoveryTokenIdSentToIdMS"];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  char v12 = [v9 isEqualToString:v8];
  int v13 = [v11 isEqualToString:v8];
  if ((v12 & 1) == 0)
  {
    v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "[CDPEDPRecoveryTokenUploader] tokenId: %@ was not created by this device. Nothing to do...", buf, 0xCu);
    }

    if (!a5) {
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31 = @"EDP Recovery Token was not created by this device.";
    v16 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v17 = v20;
    uint64_t v18 = -7204;
    goto LABEL_14;
  }
  if (v13)
  {
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "[CDPEDPRecoveryTokenUploader] tokenId: %@ was already sent to IdMS. Nothing to do...", buf, 0xCu);
    }

    if (!a5) {
      goto LABEL_15;
    }
    objc_super v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"EDP Recovery Token was already uploaded in the past.";
    v16 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v17 = v15;
    uint64_t v18 = -7205;
LABEL_14:
    objc_msgSend(v17, "cdp_errorWithCode:userInfo:", v18, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    BOOL v21 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  objc_opt_class();
  id v23 = [(ACAccount *)self->_account accountPropertyForKey:@"edpRecoveryTokenUploadRetryAttempts"];
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  unint64_t v25 = [v24 unsignedIntegerValue];
  v26 = _CDPLogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (a4 == 4 && v25 >= 8)
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "[CDPEDPRecoveryTokenUploader] tokenId: %@ has crossed max retry threshold. Nothing to do...", buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -7211);
      BOOL v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v27)
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "[CDPEDPRecoveryTokenUploader] tokenId: %@ is uploadable. Proceeding...", buf, 0xCu);
  }

  BOOL v21 = 1;
LABEL_16:

  return v21;
}

- (void)uploadRecoveryToken:(id)a3 tokenId:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v27 = 0;
  BOOL v13 = [(CDPDEDPRecoveryTokenUploader *)self _isTokenUploadable:v11 reason:a5 error:&v27];
  id v14 = v27;
  if (v13)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = [v10 componentsJoinedByString:@"-"];
    [v15 setObject:v16 forKeyedSubscript:@"edpToken"];

    [v15 setObject:v11 forKeyedSubscript:@"edpTokenId"];
    v17 = [NSNumber numberWithUnsignedInteger:a5];
    [v15 setObject:v17 forKeyedSubscript:@"edpTokenReason"];

    if (a5 == 4)
    {
      uint64_t v18 = [(ACAccount *)self->_account accountPropertyForKey:@"edpRecoveryTokenCreationReason"];
      objc_opt_class();
      objc_opt_class();
      id v19 = v18;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }

      [v15 setObject:v20 forKeyedSubscript:@"edpTokenReason"];
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__CDPDEDPRecoveryTokenUploader_uploadRecoveryToken_tokenId_reason_completion___block_invoke;
    v22[3] = &unk_26432FF08;
    id v23 = v11;
    id v24 = self;
    unint64_t v26 = a5;
    id v25 = v12;
    [(CDPDEDPRecoveryTokenUploader *)self _retryableUpload:v15 completion:v22];
  }
  else
  {
    BOOL v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CDPDEDPRecoveryTokenUploader uploadRecoveryToken:tokenId:reason:completion:]();
    }

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v14);
    }
  }
}

void __78__CDPDEDPRecoveryTokenUploader_uploadRecoveryToken_tokenId_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v7;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "[CDPEDPRecoveryTokenUploader] tokenId: %@ uploaded to IdMS.", (uint8_t *)&v16, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) setAccountProperty:*(void *)(a1 + 32) forKey:@"edpLastRecoveryTokenIdSentToIdMS"];
    [*(id *)(*(void *)(a1 + 40) + 8) setAccountProperty:&unk_26C9D30D0 forKey:@"edpRecoveryTokenUploadRetryAttempts"];
  }
  else if (*(void *)(a1 + 56) == 4)
  {
    objc_opt_class();
    objc_opt_class();
    id v8 = [*(id *)(*(void *)(a1 + 40) + 8) accountPropertyForKey:@"edpRecoveryTokenUploadRetryAttempts"];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v10 = [v9 unsignedIntegerValue];
    id v11 = *(void **)(*(void *)(a1 + 40) + 8);
    id v12 = [NSNumber numberWithUnsignedInteger:v10 + 1];
    [v11 setAccountProperty:v12 forKey:@"edpRecoveryTokenUploadRetryAttempts"];
  }
  if (*(void *)(a1 + 56) != 4)
  {
    BOOL v13 = *(void **)(*(void *)(a1 + 40) + 8);
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v13 setAccountProperty:v14 forKey:@"edpRecoveryTokenCreationReason"];
  }
  [*(id *)(a1 + 40) _saveAccount];
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);
  }
}

- (void)_saveAccount
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "[CDPEDPRecoveryTokenUploader] Saving account failed. Error %@", v2, v3, v4, v5, v6);
}

- (void)_retryableUpload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDEDPRecoveryTokenUploader _retryableUpload:completion:](v6, v8);
  }

  id v9 = (void *)[objc_alloc(MEMORY[0x263F203F8]) initWithMaxRetries:10];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke;
  aBlock[3] = &unk_264330148;
  aBlock[4] = self;
  id v16 = v6;
  id v10 = v6;
  id v11 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_56;
  v13[3] = &unk_264330170;
  id v14 = v7;
  id v12 = v7;
  [v9 scheduleTask:v11 shouldRetry:&__block_literal_global_5 completionHandler:v13];
}

void __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(v4 + 16);
  id v6 = *(void **)(v4 + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_2;
  v9[3] = &unk_26432F680;
  id v10 = v3;
  id v8 = v3;
  [v6 cdpContext:v7 persistRecoveryKey:v5 keyType:1 completion:v9];
}

void __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithBool:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_3_cold_1();
  }

  return 1;
}

void __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }

  [v7 BOOLValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authProvider, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)uploadRecoveryToken:tokenId:reason:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "[CDPEDPRecoveryTokenUploader] Token is not uploadable. Nothing to do... Error: %@", v2, v3, v4, v5, v6);
}

- (void)_retryableUpload:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 objectForKeyedSubscript:@"edpTokenId"];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Attempting to upload token with id: %@", v4, 0xCu);
}

void __60__CDPDEDPRecoveryTokenUploader__retryableUpload_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "[CDPEDPRecoveryTokenUploader] Attempt to upload recovery token failed. Will retry one more time. Error %@", v2, v3, v4, v5, v6);
}

@end