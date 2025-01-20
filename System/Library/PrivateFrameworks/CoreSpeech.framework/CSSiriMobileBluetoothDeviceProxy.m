@interface CSSiriMobileBluetoothDeviceProxy
- (CSSiriMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (CSSiriMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5;
- (NSString)address;
- (NSString)description;
- (NSUUID)deviceUID;
- (id)deviceInfo;
- (id)identifier;
- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_fetchDeviceInfoWithCompletion:(id)a3;
- (void)_getDeviceInfo:(id)a3;
- (void)_invalidate;
- (void)_reload:(BOOL)a3;
- (void)_updateDeviceInfo:(id)a3;
- (void)addObserver:(id)a3;
- (void)connect:(id)a3;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)getConversationAwareness:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getHeadphoneInEarDetectionState:(id)a3;
- (void)getHeadphoneListeningMode:(id)a3;
- (void)getPersonalVolume:(id)a3;
- (void)invalidate;
- (void)prewarm;
- (void)reload;
- (void)removeObserver:(id)a3;
- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4;
- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4;
- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4;
- (void)updateDeviceInfo:(id)a3;
@end

@implementation CSSiriMobileBluetoothDeviceProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_headphoneInEarDetectionState, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (NSString)address
{
  return self->_address;
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v6 = [(NSHashTable *)observers setRepresentation];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __66__CSSiriMobileBluetoothDeviceProxy__enumerateObserversUsingBlock___block_invoke;
      v7[3] = &unk_1E658C288;
      id v8 = v4;
      [v6 enumerateObjectsUsingBlock:v7];
    }
  }
}

uint64_t __66__CSSiriMobileBluetoothDeviceProxy__enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSSiriMobileBluetoothDeviceProxy _invalidate]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_storeWeak((id *)&self->_dataSource, 0);
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = 0;

  headphoneInEarDetectionState = self->_headphoneInEarDetectionState;
  self->_headphoneInEarDetectionState = 0;

  self->_headphoneListeningMode = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CSSiriMobileBluetoothDeviceProxy__invalidate__block_invoke;
  v7[3] = &unk_1E658C260;
  void v7[4] = self;
  [(CSSiriMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v7];
  observers = self->_observers;
  self->_observers = 0;
}

void __47__CSSiriMobileBluetoothDeviceProxy__invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 bluetoothDeviceDidInvalidate:*(void *)(a1 + 32)];
  }
}

- (void)_accessBTDeviceAndAccessoryManagerUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (os_log_t *)MEMORY[0x1E4F4E368];
    v6 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Getting BTDevice and BTAccessoryManager for %@...", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      deviceUID = self->_deviceUID;
      if (deviceUID)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke;
        v16[3] = &unk_1E658C210;
        v16[4] = self;
        id v17 = v4;
        [WeakRetained getBTDeviceWithDeviceUID:deviceUID completion:v16];
        v9 = v17;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      address = self->_address;
      if (address)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_2;
        v14[3] = &unk_1E658C210;
        v14[4] = self;
        id v15 = v4;
        [WeakRetained getBTDeviceWithAddress:address completion:v14];
        v9 = v15;
        goto LABEL_13;
      }
      uint64_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v20 = 2112;
        v21 = self;
        v13 = "%s Device UID and address of %@ are nil.";
LABEL_19:
        _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
        __int16 v20 = 2112;
        v21 = self;
        v13 = "%s Data source of %@ is nil.";
        goto LABEL_19;
      }
    }
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]";
      __int16 v20 = 2112;
      v21 = self;
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s Failed getting BTDevice and BTAccessoryManager for %@.", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_14;
  }
LABEL_15:
}

void __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v14 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Got BTDevice %p and BTAccessoryManager %p for %@.", buf, 0x2Au);
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_125;
  block[3] = &unk_1E658C238;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  dispatch_async(v8, block);
}

void __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v14 = "-[CSSiriMobileBluetoothDeviceProxy _accessBTDeviceAndAccessoryManagerUsingBlock:]_block_invoke_2";
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Got BTDevice %p and BTAccessoryManager %p for %@.", buf, 0x2Au);
  }
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_126;
  block[3] = &unk_1E658C238;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  dispatch_async(v8, block);
}

uint64_t __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_126(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

uint64_t __81__CSSiriMobileBluetoothDeviceProxy__accessBTDeviceAndAccessoryManagerUsingBlock___block_invoke_125(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

- (void)_fetchDeviceInfoWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]";
      __int16 v10 = 2112;
      uint64_t v11 = self;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Fetching device info for %@...", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke;
    v6[3] = &unk_1E658C210;
    v6[4] = self;
    id v7 = v4;
    [(CSSiriMobileBluetoothDeviceProxy *)self _accessBTDeviceAndAccessoryManagerUsingBlock:v6];
  }
}

void __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = (os_log_t *)MEMORY[0x1E4F4E368];
  if (!a2)
  {
    v34 = 0;
    goto LABEL_41;
  }
  id v7 = _CSSiriBTDeviceGetAddress(a2);
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  int DeviceId = BTDeviceGetDeviceId();
  BOOL v9 = DeviceId != 0;
  if (DeviceId)
  {
    int v10 = DeviceId;
    uint64_t v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v52) = v10;
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s Failed getting vendor id and product id from BTDevice %p (result = %d).", buf, 0x1Cu);
    }
  }
  int v48 = 0;
  int IsAppleAudioDevice = BTDeviceIsAppleAudioDevice();
  if (IsAppleAudioDevice)
  {
    int v13 = IsAppleAudioDevice;
    v14 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v52) = v13;
      _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s Failed getting vendor id and product id from BTDevice %p (result = %d).", buf, 0x1Cu);
    }
    BOOL v9 = 1;
  }
  int v46 = 0;
  int v47 = 0;
  if (a3)
  {
    int FeatureCapability = BTAccessoryManagerGetFeatureCapability();
    if (FeatureCapability)
    {
      int v16 = FeatureCapability;
      __int16 v17 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a2;
        *(_WORD *)&buf[22] = 2048;
        v52 = a3;
        LOWORD(v53) = 1024;
        *(_DWORD *)((char *)&v53 + 2) = v16;
        _os_log_error_impl(&dword_1C9338000, v17, OS_LOG_TYPE_ERROR, "%s Failed getting InEar capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
      }
      BOOL v9 = 1;
    }
    int v18 = BTAccessoryManagerGetFeatureCapability();
    if (v18)
    {
      int v19 = v18;
      uint64_t v20 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a2;
        *(_WORD *)&buf[22] = 2048;
        v52 = a3;
        LOWORD(v53) = 1024;
        *(_DWORD *)((char *)&v53 + 2) = v19;
        _os_log_error_impl(&dword_1C9338000, v20, OS_LOG_TYPE_ERROR, "%s Failed getting DoAP capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
      }
      BOOL v9 = 1;
    }
  }
  int v45 = 0;
  int v21 = BTAccessoryManagerGetFeatureCapability();
  if (v21)
  {
    int v22 = v21;
    v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v52 = a3;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v22;
      _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s Failed getting ANC capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    BOOL v9 = 1;
  }
  int v44 = 0;
  int v24 = BTAccessoryManagerGetFeatureCapability();
  if (v24)
  {
    int v25 = v24;
    v26 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v52 = a3;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v25;
      _os_log_error_impl(&dword_1C9338000, v26, OS_LOG_TYPE_ERROR, "%s Failed getting Transparency capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    BOOL v9 = 1;
  }
  int v43 = 0;
  int v27 = BTAccessoryManagerGetFeatureCapability();
  if (v27)
  {
    int v28 = v27;
    v29 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v52 = a3;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v28;
      _os_log_error_impl(&dword_1C9338000, v29, OS_LOG_TYPE_ERROR, "%s Failed getting Software Volume capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    BOOL v9 = 1;
  }
  int v42 = 0;
  int AnnounceMessagesSupport = BTAccessoryManagerGetAnnounceMessagesSupport();
  if (AnnounceMessagesSupport)
  {
    int v31 = AnnounceMessagesSupport;
    v32 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v52 = a3;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v31;
      _os_log_error_impl(&dword_1C9338000, v32, OS_LOG_TYPE_ERROR, "%s Failed getting Announce Messages capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    int v41 = 0;
    int AnnounceCallsSupport = BTAccessoryManagerGetAnnounceCallsSupport();
    if (!AnnounceCallsSupport) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  int v41 = 0;
  int AnnounceCallsSupport = BTAccessoryManagerGetAnnounceCallsSupport();
  if (AnnounceCallsSupport)
  {
LABEL_37:
    v35 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "_CSSiriBTDeviceGetDeviceInfo";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      v52 = a3;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = AnnounceCallsSupport;
      _os_log_error_impl(&dword_1C9338000, v35, OS_LOG_TYPE_ERROR, "%s Failed getting Announce Calls capability from BTDevice %p via BTAccessoryManager %p (result = %d).", buf, 0x26u);
    }
    goto LABEL_39;
  }
  if (!v9)
  {
    v39 = (void *)MEMORY[0x1E4F4E3E8];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___CSSiriBTDeviceGetDeviceInfo_block_invoke;
    v52 = &unk_1E658C2B0;
    id v53 = v7;
    int v54 = v50;
    int v55 = HIDWORD(v49);
    int v56 = v48;
    int v57 = v47;
    int v58 = v46;
    int v59 = v42;
    int v60 = v45;
    int v61 = v44;
    int v62 = v41;
    v34 = (void *)[v39 newWithBuilder:buf];

    goto LABEL_40;
  }
LABEL_39:
  v34 = 0;
LABEL_40:

LABEL_41:
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke_2;
  v40[3] = &unk_1E658C1E8;
  v40[4] = *(void *)(a1 + 32);
  v36 = [v34 mutatedCopyWithMutator:v40];

  v37 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v38 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSSiriMobileBluetoothDeviceProxy _fetchDeviceInfoWithCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2112;
    v52 = v38;
    _os_log_impl(&dword_1C9338000, v37, OS_LOG_TYPE_INFO, "%s Fetched device info %@ for %@.", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __67__CSSiriMobileBluetoothDeviceProxy__fetchDeviceInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDeviceUID:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (void)_updateDeviceInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (AFBluetoothDeviceInfo *)a3;
  v5 = (NSObject **)MEMORY[0x1E4F4E368];
  v6 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v19 = "-[CSSiriMobileBluetoothDeviceProxy _updateDeviceInfo:]";
    __int16 v20 = 2112;
    int v21 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s deviceInfo = %@", buf, 0x16u);
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo != v4 && ([(AFBluetoothDeviceInfo *)deviceInfo isEqual:v4] & 1) == 0)
  {
    id v8 = self->_deviceInfo;
    BOOL v9 = (AFBluetoothDeviceInfo *)[(AFBluetoothDeviceInfo *)v4 copy];
    int v10 = self->_deviceInfo;
    self->_deviceInfo = v9;

    uint64_t v11 = self->_deviceInfo;
    uint64_t v12 = *v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v19 = "-[CSSiriMobileBluetoothDeviceProxy _updateDeviceInfo:]";
      __int16 v20 = 2112;
      int v21 = v8;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s deviceInfo changed from %@ to %@", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__CSSiriMobileBluetoothDeviceProxy__updateDeviceInfo___block_invoke;
    v15[3] = &unk_1E658C1C0;
    v15[4] = self;
    int v16 = v8;
    __int16 v17 = v11;
    int v13 = v11;
    v14 = v8;
    [(CSSiriMobileBluetoothDeviceProxy *)self _enumerateObserversUsingBlock:v15];
  }
}

void __54__CSSiriMobileBluetoothDeviceProxy__updateDeviceInfo___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 bluetoothDevice:a1[4] deviceInfoDidChangeFrom:a1[5] to:a1[6]];
  }
}

- (void)_getDeviceInfo:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_deviceInfo)
    {
      v4[2](v4);
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __51__CSSiriMobileBluetoothDeviceProxy__getDeviceInfo___block_invoke;
      v6[3] = &unk_1E658C198;
      v6[4] = self;
      id v7 = v4;
      [(CSSiriMobileBluetoothDeviceProxy *)self _fetchDeviceInfoWithCompletion:v6];
    }
  }
}

void __51__CSSiriMobileBluetoothDeviceProxy__getDeviceInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _updateDeviceInfo:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_reload:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_deviceInfo) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    v5 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v8 = "-[CSSiriMobileBluetoothDeviceProxy _reload:]";
      __int16 v9 = 2112;
      int v10 = self;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Reloading device info for %@...", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__CSSiriMobileBluetoothDeviceProxy__reload___block_invoke;
    v6[3] = &unk_1E658C5C0;
    v6[4] = self;
    [(CSSiriMobileBluetoothDeviceProxy *)self _fetchDeviceInfoWithCompletion:v6];
  }
}

void __44__CSSiriMobileBluetoothDeviceProxy__reload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _updateDeviceInfo:v3];
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[CSSiriMobileBluetoothDeviceProxy _reload:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Reloaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CSSiriMobileBluetoothDeviceProxy_invalidate__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__CSSiriMobileBluetoothDeviceProxy_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)setPersonalVolume:(BOOL)a3 completion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a4;
  uint64_t v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    __int16 v8 = "-[CSSiriMobileBluetoothDeviceProxy setPersonalVolume:completion:]";
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v7, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F4E3E0]) initWithValue:0 status:3];
    v4[2](v4, v6);
  }
LABEL_4:
}

- (void)setConversationAwareness:(BOOL)a3 completion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a4;
  uint64_t v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    __int16 v8 = "-[CSSiriMobileBluetoothDeviceProxy setConversationAwareness:completion:]";
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v7, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F4E3E0]) initWithValue:0 status:3];
    v4[2](v4, v6);
  }
LABEL_4:
}

- (void)getPersonalVolume:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *))a3;
  id v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSSiriMobileBluetoothDeviceProxy getPersonalVolume:]";
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F4E3E0]) initWithValue:0 status:3];
    v3[2](v3, v5);
  }
LABEL_4:
}

- (void)getConversationAwareness:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, void *))a3;
  id v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSSiriMobileBluetoothDeviceProxy getConversationAwareness:]";
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3)
  {
LABEL_3:
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F4E3E0]) initWithValue:0 status:3];
    v3[2](v3, v5);
  }
LABEL_4:
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__CSSiriMobileBluetoothDeviceProxy_removeObserver___block_invoke;
    v7[3] = &unk_1E658D4B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __51__CSSiriMobileBluetoothDeviceProxy_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__CSSiriMobileBluetoothDeviceProxy_addObserver___block_invoke;
    v7[3] = &unk_1E658D4B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __48__CSSiriMobileBluetoothDeviceProxy_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke;
  v7[3] = &unk_1E658D3A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke_2;
  v2[3] = &unk_1E658C170;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _accessBTDeviceAndAccessoryManagerUsingBlock:v2];
}

uint64_t __47__CSSiriMobileBluetoothDeviceProxy_disconnect___block_invoke_2(uint64_t a1)
{
  int v2 = BTDeviceDisconnect();
  uint64_t v3 = _CSSiriBTResultGetError(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
  }
  return MEMORY[0x1F4181820]();
}

- (void)connect:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke;
  v7[3] = &unk_1E658D3A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke_2;
  v2[3] = &unk_1E658C170;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _accessBTDeviceAndAccessoryManagerUsingBlock:v2];
}

uint64_t __44__CSSiriMobileBluetoothDeviceProxy_connect___block_invoke_2(uint64_t a1)
{
  int v2 = BTDeviceConnect();
  uint64_t v3 = _CSSiriBTResultGetError(v2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
  }
  return MEMORY[0x1F4181820]();
}

- (void)setHeadphoneListeningMode:(int64_t)a3 completion:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a4;
  uint64_t v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    int v7 = "-[CSSiriMobileBluetoothDeviceProxy setHeadphoneListeningMode:completion:]";
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v6, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4) {
LABEL_3:
  }
    v4[2](v4, 0);
LABEL_4:
}

- (void)getHeadphoneListeningMode:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    int v6 = "-[CSSiriMobileBluetoothDeviceProxy getHeadphoneListeningMode:]";
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v5, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    v3[2](v3, 1);
LABEL_4:
}

- (void)getHeadphoneInEarDetectionState:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    int v6 = "-[CSSiriMobileBluetoothDeviceProxy getHeadphoneInEarDetectionState:]";
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Method not supported", (uint8_t *)&v5, 0xCu);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v3) {
LABEL_3:
  }
    v3[2](v3, 0);
LABEL_4:
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__CSSiriMobileBluetoothDeviceProxy_getDeviceInfo___block_invoke;
    v7[3] = &unk_1E658D3A0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __50__CSSiriMobileBluetoothDeviceProxy_getDeviceInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getDeviceInfo:*(void *)(a1 + 40)];
}

- (id)deviceInfo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__23697;
  int v19 = __Block_byref_object_dispose__23698;
  id v20 = 0;
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__23697;
  int v13 = __Block_byref_object_dispose__23698;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke;
  block[3] = &unk_1E658C148;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  uint64_t v3 = v10[5];
  if (v3 && (dispatch_time_t v4 = dispatch_time(0, 4000000000), dispatch_semaphore_wait(v3, v4)))
  {
    int v5 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]";
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Slow path timed out after 4 seconds.", buf, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = (id)v16[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v2);
  }
  else
  {
    uint64_t v3 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v13 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]_block_invoke";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s Using slow path...", buf, 0xCu);
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)a1[4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke_117;
    v9[3] = &unk_1E658C120;
    CFAbsoluteTime v11 = Current;
    long long v10 = *(_OWORD *)(a1 + 5);
    [v8 _getDeviceInfo:v9];
  }
}

void __46__CSSiriMobileBluetoothDeviceProxy_deviceInfo__block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_time_t v4 = (void *)*MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    dispatch_semaphore_t v5 = v4;
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    int v10 = 136315394;
    CFAbsoluteTime v11 = "-[CSSiriMobileBluetoothDeviceProxy deviceInfo]_block_invoke";
    __int16 v12 = 2048;
    CFAbsoluteTime v13 = v6;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Slow path took %f seconds.", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)identifier
{
  address = [(NSUUID *)self->_deviceUID UUIDString];
  dispatch_time_t v4 = address;
  if (!address) {
    address = self->_address;
  }
  id v5 = address;

  return v5;
}

- (void)prewarm
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CSSiriMobileBluetoothDeviceProxy_prewarm__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__CSSiriMobileBluetoothDeviceProxy_prewarm__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reload:0];
}

- (void)reload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CSSiriMobileBluetoothDeviceProxy_reload__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__CSSiriMobileBluetoothDeviceProxy_reload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reload:1];
}

- (void)updateDeviceInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CSSiriMobileBluetoothDeviceProxy_updateDeviceInfo___block_invoke;
  v7[3] = &unk_1E658D4B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__CSSiriMobileBluetoothDeviceProxy_updateDeviceInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDeviceInfo:*(void *)(a1 + 40)];
}

- (CSSiriMobileBluetoothDeviceProxy)initWithDeviceUID:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  CFAbsoluteTime v11 = [(CSSiriMobileBluetoothDeviceProxy *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    deviceUID = v11->_deviceUID;
    v11->_deviceUID = (NSUUID *)v12;

    uint64_t v14 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]";
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke;
    block[3] = &unk_1E658D4D8;
    int v18 = v11;
    dispatch_async(queue, block);
  }
  return v11;
}

void __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_INFO, "%s Loading device info for %@...", buf, 0x16u);
  }
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke_116;
  v5[3] = &unk_1E658C5C0;
  id v6 = v4;
  [v6 _fetchDeviceInfoWithCompletion:v5];
}

void __71__CSSiriMobileBluetoothDeviceProxy_initWithDeviceUID_dataSource_queue___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _updateDeviceInfo:v3];
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[CSSiriMobileBluetoothDeviceProxy initWithDeviceUID:dataSource:queue:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Loaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }
}

- (CSSiriMobileBluetoothDeviceProxy)initWithAddress:(id)a3 dataSource:(id)a4 queue:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  uint64_t v11 = [(CSSiriMobileBluetoothDeviceProxy *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    address = v11->_address;
    v11->_address = (NSString *)v12;

    uint64_t v14 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]";
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    objc_storeStrong((id *)&v11->_queue, a5);
    queue = v11->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke;
    block[3] = &unk_1E658D4D8;
    int v18 = v11;
    dispatch_async(queue, block);
  }
  return v11;
}

void __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_INFO, "%s Loading device info for %@...", buf, 0x16u);
  }
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke_115;
  v5[3] = &unk_1E658C5C0;
  id v6 = v4;
  [v6 _fetchDeviceInfoWithCompletion:v5];
}

void __69__CSSiriMobileBluetoothDeviceProxy_initWithAddress_dataSource_queue___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _updateDeviceInfo:v3];
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[CSSiriMobileBluetoothDeviceProxy initWithAddress:dataSource:queue:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Loaded device info %@ for %@.", (uint8_t *)&v6, 0x20u);
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "-[CSSiriMobileBluetoothDeviceProxy dealloc]";
    __int16 v7 = 2112;
    __int16 v8 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  [(CSSiriMobileBluetoothDeviceProxy *)&v4 dealloc];
}

- (NSString)description
{
  if (self->_deviceUID)
  {
    id v3 = [NSString alloc];
    v11.receiver = self;
    v11.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
    objc_super v4 = [(CSSiriMobileBluetoothDeviceProxy *)&v11 description];
    uint64_t v5 = [v3 initWithFormat:@"%@ {deviceUID = %@}", v4, self->_deviceUID];
LABEL_5:
    __int16 v7 = (void *)v5;

    goto LABEL_6;
  }
  if (self->_address)
  {
    id v6 = [NSString alloc];
    v10.receiver = self;
    v10.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
    objc_super v4 = [(CSSiriMobileBluetoothDeviceProxy *)&v10 description];
    uint64_t v5 = [v6 initWithFormat:@"%@ {address = %@}", v4, self->_address];
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)CSSiriMobileBluetoothDeviceProxy;
  __int16 v7 = [(CSSiriMobileBluetoothDeviceProxy *)&v9 description];
LABEL_6:
  return (NSString *)v7;
}

@end