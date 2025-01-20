@interface AFMultiUserConnection
+ (id)sharedInstance;
- (AFMultiUserConnection)init;
- (AFMultiUserConnection)initWithConnectionFactory:(id)a3;
- (id)_connection;
- (id)_multiUserServiceWithErrorHandler:(id)a3;
- (void)_clearConnection;
- (void)dealloc;
- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getConformingSharedUserIds:(id)a3;
- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3;
- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3;
- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3;
- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSharedUserProfileLimitWithCompletion:(id)a3;
- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4;
- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3;
- (void)homeUserIdToNames:(id)a3;
- (void)triggerVoiceProfileUploadWithCompletion:(id)a3;
@end

@implementation AFMultiUserConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getUserAgentStringForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getUserAgentStringForSharedUserID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __70__AFMultiUserConnection_getUserAgentStringForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getUserAgentStringForSharedUserID:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getUserAgentStringForSharedUserID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getSharedUserIdForiCloudAltDSID:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AFMultiUserConnection_getSharedUserIdForiCloudAltDSID_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __68__AFMultiUserConnection_getSharedUserIdForiCloudAltDSID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AFMultiUserConnection_getSharedUserIdForiCloudAltDSID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getSharedUserIdForiCloudAltDSID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __68__AFMultiUserConnection_getSharedUserIdForiCloudAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getSharedUserIdForiCloudAltDSID:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getSharedUserIdForiCloudAltDSID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getSharedUserInfoForiCloudAltDSID:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getSharedUserInfoForiCloudAltDSID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __70__AFMultiUserConnection_getSharedUserInfoForiCloudAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getSharedUserInfoForiCloudAltDSID:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getSharedUserInfoForiCloudAltDSID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getSharedUserInfoForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getSharedUserInfoForSharedUserID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __69__AFMultiUserConnection_getSharedUserInfoForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getSharedUserInfoForSharedUserID:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getSharedUserInfoForSharedUserID:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)homeUserIdToNames:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection homeUserIdToNames:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__AFMultiUserConnection_homeUserIdToNames___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __43__AFMultiUserConnection_homeUserIdToNames___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AFMultiUserConnection_homeUserIdToNames___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 homeUserIdToNames:*(void *)(a1 + 40)];
}

void __43__AFMultiUserConnection_homeUserIdToNames___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection homeUserIdToNames:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in homeUserIdToNames:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFMultiUserConnection getPreferredMediaUserHomeUserIDWithCompletion:]";
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
LABEL_4:
}

void __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getPreferredMediaUserHomeUserIDWithCompletion:*(void *)(a1 + 40)];
}

void __71__AFMultiUserConnection_getPreferredMediaUserHomeUserIDWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getPreferredMediaUserHomeUserIDWithCompletion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getPreferredMediaUserHomeUserIDWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getiCloudAltDSIDOfRecognizedUserWithCompletion:*(void *)(a1 + 40)];
}

void __72__AFMultiUserConnection_getiCloudAltDSIDOfRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getiCloudAltDSIDOfRecognizedUserWithCompletion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getiCloudAltDSIDOfRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getHomeUserIdOfRecognizedUserWithCompletion:*(void *)(a1 + 40)];
}

void __69__AFMultiUserConnection_getHomeUserIdOfRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getHomeUserIdOfRecognizedUserWithCompletion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getHomeUserIdOfRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getMultiUserSettingsForRecognizedUserWithCompletion:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getMultiUserSettingsForRecognizedUserWithCompletion:*(void *)(a1 + 40)];
}

void __77__AFMultiUserConnection_getMultiUserSettingsForRecognizedUserWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getMultiUserSettingsForRecognizedUserWithCompletion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s Error in getMultiUserSettingsForRecognizedUserWithCompletion:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getMultiUserSettingsForSharedUserID:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getMultiUserSettingsForSharedUserID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __72__AFMultiUserConnection_getMultiUserSettingsForSharedUserID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection getMultiUserSettingsForSharedUserID:completion:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s ErrorABCD:%@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getRecognizableUsersConfromingSharedUserIds:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getRecognizableUsersConfromingSharedUserIds:*(void *)(a1 + 40)];
}

uint64_t __69__AFMultiUserConnection_getRecognizableUsersConfromingSharedUserIds___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getConformingSharedUserIds:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFMultiUserConnection getConformingSharedUserIds:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

void __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getConformingSharedUserIds:*(void *)(a1 + 40)];
}

uint64_t __52__AFMultiUserConnection_getConformingSharedUserIds___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFMultiUserConnection getConformingSharedUserIdForHomeUserId:completion:]";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke;
    block[3] = &unk_1E592C598;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(targetQueue, block);
  }
}

void __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getConformingSharedUserIdForHomeUserId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __75__AFMultiUserConnection_getConformingSharedUserIdForHomeUserId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSharedUserProfileLimitWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[AFMultiUserConnection getSharedUserProfileLimitWithCompletion:]";
    _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    v3[2](v3, 6, 0);
LABEL_4:
}

- (void)triggerVoiceProfileUploadWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AFMultiUserConnection triggerVoiceProfileUploadWithCompletion:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__AFMultiUserConnection_triggerVoiceProfileUploadWithCompletion___block_invoke;
  v10[3] = &unk_1E592B9A0;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(AFMultiUserConnection *)self _multiUserServiceWithErrorHandler:v10];
  id v8 = v7;
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = &__block_literal_global_15_44127;
  }
  [v7 triggerVoiceProfileUploadWithCompletion:v9];
}

void __65__AFMultiUserConnection_triggerVoiceProfileUploadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AFMultiUserConnection triggerVoiceProfileUploadWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Complete with error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection downloadVoiceProfileForiCloudAltDSID:completion:]";
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__AFMultiUserConnection_downloadVoiceProfileForiCloudAltDSID_completion___block_invoke;
  v13[3] = &unk_1E592B9A0;
  id v14 = v7;
  id v9 = v7;
  uint64_t v10 = [(AFMultiUserConnection *)self _multiUserServiceWithErrorHandler:v13];
  id v11 = v10;
  if (v9) {
    id v12 = v9;
  }
  else {
    id v12 = &__block_literal_global_44131;
  }
  [v10 downloadVoiceProfileForiCloudAltDSID:v6 completion:v12];
}

void __73__AFMultiUserConnection_downloadVoiceProfileForiCloudAltDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFMultiUserConnection downloadVoiceProfileForiCloudAltDSID:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Complete with error: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getSharedUserIdForHomeUserId:completion:]";
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke;
  block[3] = &unk_1E592C598;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

void __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getSharedUserIdForHomeUserId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __65__AFMultiUserConnection_getSharedUserIdForHomeUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getFirstNameForSharedUserId:completion:]";
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke;
  block[3] = &unk_1E592C598;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

void __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getFirstNameForSharedUserId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __64__AFMultiUserConnection_getFirstNameForSharedUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFMultiUserConnection getMultiUserAudioAppSignalsForSharedUserID:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Getting music preference data for shared user id %@", buf, 0x16u);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke;
  block[3] = &unk_1E592C598;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

void __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getMultiUserAudioAppSignalsForSharedUserID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __79__AFMultiUserConnection_getMultiUserAudioAppSignalsForSharedUserID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMultiUserConnection getHomeUserIdForSharedUserId:completion:]";
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  targetQueue = self->_targetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke;
  block[3] = &unk_1E592C598;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(targetQueue, block);
}

void __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _multiUserServiceWithErrorHandler:v4];
  [v3 getHomeUserIdForSharedUserId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __65__AFMultiUserConnection_getHomeUserIdForSharedUserId_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (id)_multiUserServiceWithErrorHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_connection)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      id v10 = "-[AFMultiUserConnection _multiUserServiceWithErrorHandler:]";
      _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s No connection.", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [(AFMultiUserConnection *)self _connection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v4];

  return v7;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFMultiUserConnection dealloc]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  [(AFMultiUserConnection *)self _clearConnection];
  v4.receiver = self;
  v4.super_class = (Class)AFMultiUserConnection;
  [(AFMultiUserConnection *)&v4 dealloc];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    objc_super v4 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.multiuser.service" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection _setQueue:self->_targetQueue];
    objc_initWeak(&location, self);
    id v6 = self->_connection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __36__AFMultiUserConnection__connection__block_invoke;
    id v13 = &unk_1E592B978;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:&v10];
    __int16 v7 = self->_connection;
    __int16 v8 = AFMultiUserServiceXPCInterface();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8, v10, v11, v12, v13);

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __36__AFMultiUserConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[AFMultiUserConnection _clearConnection]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (AFMultiUserConnection)init
{
  id v3 = +[AFInstanceContext defaultContext];
  objc_super v4 = [(AFMultiUserConnection *)self initWithConnectionFactory:v3];

  return v4;
}

- (AFMultiUserConnection)initWithConnectionFactory:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFMultiUserConnection;
  int v5 = [(AFMultiUserConnection *)&v12 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.multiuser.connection", v6);

    targetQueue = v5->_targetQueue;
    v5->_targetQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      uint64_t v9 = (AFInstanceContext *)v4;
    }
    else
    {
      uint64_t v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;
  }
  return v5;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AFMultiUserConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_44149 != -1) {
    dispatch_once(&sharedInstance_onceToken_44149, block);
  }
  v2 = (void *)sharedInstance_singleton_44150;
  return v2;
}

void __39__AFMultiUserConnection_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[AFMultiUserConnection sharedInstance]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  id v4 = (void *)sharedInstance_singleton_44150;
  sharedInstance_singleton_44150 = (uint64_t)v3;
}

@end