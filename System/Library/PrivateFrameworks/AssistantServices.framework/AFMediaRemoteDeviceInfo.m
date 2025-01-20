@interface AFMediaRemoteDeviceInfo
+ (id)localDeviceInfo;
- (AFMediaRemoteDeviceInfo)init;
- (OS_dispatch_queue)serialQueue;
- (void)_activeDeviceInfoChanged:(id)a3;
- (void)_getMRDeviceInfoWithCompletion:(id)a3;
- (void)_updateWithRouteIdentifier:(id)a3 groupIdentifier:(id)a4;
- (void)getGroupIdentifierWithCompletion:(id)a3;
- (void)getRouteIdentifierWithCompletion:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation AFMediaRemoteDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)getGroupIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1E59278A8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _getMRDeviceInfoWithCompletion:v2];
}

void __60__AFMediaRemoteDeviceInfo_getGroupIdentifierWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 groupUID];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315395;
    id v6 = "-[AFMediaRemoteDeviceInfo getGroupIdentifierWithCompletion:]_block_invoke_2";
    __int16 v7 = 2113;
    id v8 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Retrieved groupId: %{private}@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) _updateWithRouteIdentifier:*(void *)(*(void *)(a1 + 32) + 8) groupIdentifier:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getRouteIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1E59278A8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _getMRDeviceInfoWithCompletion:v2];
}

void __60__AFMediaRemoteDeviceInfo_getRouteIdentifierWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  int v5 = [v4 deviceUID];

  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315395;
    id v8 = "-[AFMediaRemoteDeviceInfo getRouteIdentifierWithCompletion:]_block_invoke_2";
    __int16 v9 = 2113;
    v10 = v5;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Retrieved routeId: %{private}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) _updateWithRouteIdentifier:v5 groupIdentifier:*(void *)(*(void *)(a1 + 32) + 16)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_getMRDeviceInfoWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__AFMediaRemoteDeviceInfo__getMRDeviceInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E5927880;
  id v5 = v4;
  id v11 = v5;
  id v6 = (void *)MEMORY[0x19F3A50D0](v10);
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AFMediaRemoteDeviceInfo _getMRDeviceInfoWithCompletion:]";
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Retrieving MRDeviceInfo for local origin.", buf, 0xCu);
  }
  id v8 = (void *)MEMORY[0x1E4F77030];
  __int16 v9 = [MEMORY[0x1E4F77098] localOrigin];
  [v8 deviceInfoForOrigin:v9 queue:self->_serialQueue completion:v6];
}

void __58__AFMediaRemoteDeviceInfo__getMRDeviceInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[AFMediaRemoteDeviceInfo _getMRDeviceInfoWithCompletion:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s Error retrieving MRDeviceInfo: %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)_updateWithRouteIdentifier:(id)a3 groupIdentifier:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  int v7 = (NSString *)a4;
  routeIdentifier = self->_routeIdentifier;
  if (routeIdentifier == v6 || [(NSString *)routeIdentifier isEqualToString:v6])
  {
    int v9 = 0;
  }
  else
  {
    v18 = (NSString *)[(NSString *)v6 copy];
    v19 = self->_routeIdentifier;
    self->_routeIdentifier = v18;

    v20 = AFSiriLogContextConnection;
    int v9 = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v21 = self->_routeIdentifier;
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFMediaRemoteDeviceInfo _updateWithRouteIdentifier:groupIdentifier:]";
      __int16 v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_INFO, "%s Local route identifier: %@", buf, 0x16u);
    }
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier == v7 || [(NSString *)groupIdentifier isEqualToString:v7])
  {
    int v11 = 0;
  }
  else
  {
    v22 = (NSString *)[(NSString *)v7 copy];
    v23 = self->_groupIdentifier;
    self->_groupIdentifier = v22;

    v24 = AFSiriLogContextConnection;
    int v11 = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v25 = self->_groupIdentifier;
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFMediaRemoteDeviceInfo _updateWithRouteIdentifier:groupIdentifier:]";
      __int16 v32 = 2112;
      v33 = v25;
      _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s Local group identifier: %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v28 = @"identifier";
    uint64_t v13 = v6;
    if (!v6)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    }
    v29 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [v12 postNotificationName:@"AFMediaRemoteDeviceInfoRouteIdentifierDidChangeNotification" object:self userInfo:v14];

    if (!v6) {
  }
    }
  if (v11)
  {
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = @"identifier";
    v16 = v7;
    if (!v7)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v26);
    }
    v27 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v15 postNotificationName:@"AFMediaRemoteDeviceInfoGroupIdentifierDidChangeNotification" object:self userInfo:v17];

    if (!v7) {
  }
    }
}

- (void)_activeDeviceInfoChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke()
{
  return MRMediaRemoteGetDeviceInfo();
}

void __52__AFMediaRemoteDeviceInfo__activeDeviceInfoChanged___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = a3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to fetch local route identifier: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v6 = (void *)MRPairedDeviceCopyLocalReceiverPairingIdentity();
    int v7 = (void *)MRPairedDeviceCopyGroupUID();
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      v10 = "-[AFMediaRemoteDeviceInfo _activeDeviceInfoChanged:]_block_invoke_2";
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched local route identifier: %@, group identifier: %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 32) _updateWithRouteIdentifier:v6 groupIdentifier:v7];
  }
}

- (AFMediaRemoteDeviceInfo)init
{
  v16.receiver = self;
  v16.super_class = (Class)AFMediaRemoteDeviceInfo;
  v2 = [(AFMediaRemoteDeviceInfo *)&v16 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.MediaRemoteDeviceInfo", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[AFInstanceContext currentContext];
    instanceContext = v2->_instanceContext;
    v2->_instanceContext = (AFInstanceContext *)v7;

    if (!v2->_instanceContext)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v13 = [NSString stringWithUTF8String:"-[AFMediaRemoteDeviceInfo init]"];
      [v12 handleFailureInFunction:v13, @"AFMediaRemoteDeviceInfo.m", 55, @"Invalid parameter not satisfying: %@", @"_instanceContext != nil" file lineNumber description];
    }
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__activeDeviceInfoChanged_ name:*MEMORY[0x1E4F77148] object:0];

    MRMediaRemoteRegisterWantsSystemAppDidSkipTrackNotifications();
    v10 = v2->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__AFMediaRemoteDeviceInfo_init__block_invoke;
    block[3] = &unk_1E592C678;
    uint64_t v15 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

uint64_t __31__AFMediaRemoteDeviceInfo_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activeDeviceInfoChanged:0];
}

+ (id)localDeviceInfo
{
  if (localDeviceInfo_onceToken != -1) {
    dispatch_once(&localDeviceInfo_onceToken, &__block_literal_global_16852);
  }
  v2 = (void *)localDeviceInfo_localDeviceInfo;
  return v2;
}

void __42__AFMediaRemoteDeviceInfo_localDeviceInfo__block_invoke()
{
  v0 = objc_alloc_init(AFMediaRemoteDeviceInfo);
  v1 = (void *)localDeviceInfo_localDeviceInfo;
  localDeviceInfo_localDeviceInfo = (uint64_t)v0;
}

@end