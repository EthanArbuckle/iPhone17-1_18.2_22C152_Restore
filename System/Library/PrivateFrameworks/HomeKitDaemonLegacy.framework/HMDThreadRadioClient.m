@interface HMDThreadRadioClient
+ (id)logCategory;
- (BOOL)isGeoAvailable;
- (BOOL)isThreadNetworkUp;
- (BOOL)shouldInformThreadOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4;
- (BOOL)threadNetworkUp;
- (CtrClient)threadClient;
- (HMDThreadCommandTimer)deferredCommandTimer;
- (HMDThreadRadioClient)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)threadEventQueue;
- (OS_dispatch_queue)threadStateCaptureQueue;
- (id)_WEDStateChangeEventFromThreadEvent:(shared_ptr<CtrXPC::Event>)a3;
- (int64_t)_WEDConnectionStateFromStatus:(id)a3 disconnectReason:(id)a4;
- (int64_t)_connectionStateFromString:(id)a3;
- (int64_t)_nodeTypeFromString:(id)a3;
- (int64_t)threadLayerInformedResidentState;
- (void)_notifyObserversOfCallStateChangedEvent:(id)a3;
- (void)_notifyObserversOfPeripheralDeviceNodeTypeEvent:(id)a3;
- (void)_notifyObserversOfThreadNetworkEvent:(id)a3;
- (void)_notifyObserversOfThreadPreferredNetworkUpdatedEvent:(id)a3;
- (void)_notifyObserversOfThreadWakeOnDeviceConnectionStateEvent:(id)a3;
- (void)_registerForThreadNetworkEvents;
- (void)_reportCurrentThreadState:(id)a3;
- (void)_unregisterForThreadNetworkEvents;
- (void)_updateThreadMessageReliabilityParametersWithUserDefinedValues:(BOOL)a3;
- (void)connectToExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4;
- (void)registerForThreadNetworkEvents:(id)a3;
- (void)setDeferredCommandTimer:(id)a3;
- (void)setIsGeoAvailable:(BOOL)a3;
- (void)setThreadClient:(id)a3;
- (void)setThreadLayerInformedResidentState:(int64_t)a3;
- (void)setThreadMessageReliabilityParameters:(id)a3 activeRetransmitMs:(id)a4 activeThresholdMs:(id)a5 additionalRetransmitDelayMs:(id)a6;
- (void)startFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)startThreadNetwork:(id)a3 completion:(id)a4;
- (void)startThreadNetworkWithOperationalDataset:(id)a3 isOwnerUser:(BOOL)a4 completion:(id)a5;
- (void)startThreadPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)stopFirmwareUpdateWithCompletion:(id)a3;
- (void)stopThreadNetworkWithCompletion:(id)a3;
- (void)stopThreadPairingWithCompletion:(id)a3;
- (void)triggerThreadNetworkStateCaptureForAccessories:(id)a3 isSessionFailure:(BOOL)a4 withCompletion:(id)a5;
- (void)triggerThreadNetworkStateCaptureWithCompletion:(id)a3;
- (void)unregisterForThreadNetworkEvents:(id)a3;
@end

@implementation HMDThreadRadioClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_threadEventQueue, 0);
  objc_storeStrong((id *)&self->_deferredCommandTimer, 0);
  objc_storeStrong((id *)&self->_threadStateCaptureQueue, 0);
  objc_storeStrong((id *)&self->_threadClient, 0);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)threadEventQueue
{
  return self->_threadEventQueue;
}

- (void)setDeferredCommandTimer:(id)a3
{
}

- (HMDThreadCommandTimer)deferredCommandTimer
{
  return self->_deferredCommandTimer;
}

- (void)setThreadLayerInformedResidentState:(int64_t)a3
{
  self->_threadLayerInformedResidentState = a3;
}

- (int64_t)threadLayerInformedResidentState
{
  return self->_threadLayerInformedResidentState;
}

- (BOOL)threadNetworkUp
{
  return self->_threadNetworkUp;
}

- (OS_dispatch_queue)threadStateCaptureQueue
{
  return self->_threadStateCaptureQueue;
}

- (void)setThreadClient:(id)a3
{
}

- (CtrClient)threadClient
{
  return self->_threadClient;
}

- (BOOL)shouldInformThreadOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int64_t v6 = [(HMDThreadRadioClient *)self threadLayerInformedResidentState];
  if (v5)
  {
    if (v6 == 1) {
      return 0;
    }
  }
  else if (v4)
  {
    if (v6 == 2) {
      return 0;
    }
  }
  else if (v6 == 3)
  {
    return 0;
  }
  return 1;
}

- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  v7 = [(HMDThreadRadioClient *)self threadClient];

  if (v7)
  {
    v8 = [(HMDThreadRadioClient *)self threadStateCaptureQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__HMDThreadRadioClient_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke;
    v9[3] = &unk_1E6A0F918;
    v9[4] = self;
    BOOL v10 = a3;
    BOOL v11 = a4;
    dispatch_async(v8, v9);
  }
}

void __89__HMDThreadRadioClient_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke(uint64_t a1)
{
  v63[19] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldInformThreadOfResidentChange:*(unsigned __int8 *)(a1 + 40) primaryResidentIsThreadCapable:*(unsigned __int8 *)(a1 + 41)])
  {
    v2 = [*(id *)(a1 + 32) threadClient];
    v3 = v2;
    if (v2)
    {
      [v2 updatePrimaryResident:*(unsigned __int8 *)(a1 + 40) isPrimaryResidentThreadCapable:*(unsigned __int8 *)(a1 + 41) primaryResidentInfo:0];
    }
    else
    {
      *(_OWORD *)v48 = 0u;
      long long v49 = 0u;
    }

    uint64_t v8 = 23;
    switch(LODWORD(v48[0]))
    {
      case 0:
        v9 = (void *)MEMORY[0x1D9452090]();
        id v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        BOOL v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
          v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          __int16 v55 = 2112;
          v56 = v14;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Successfully informed Thread layer of primary resident change (isPrimary=%@ primaryThreadCapable=%@)", buf, 0x20u);
        }
        if (*(unsigned char *)(a1 + 40))
        {
          uint64_t v15 = 1;
        }
        else if (*(unsigned char *)(a1 + 41))
        {
          uint64_t v15 = 2;
        }
        else
        {
          uint64_t v15 = 3;
        }
        [*(id *)(a1 + 32) setThreadLayerInformedResidentState:v15];
        goto LABEL_68;
      case 4:
        goto LABEL_20;
      case 5:
        uint64_t v8 = 48;
        goto LABEL_20;
      case 6:
        uint64_t v8 = 15;
        goto LABEL_20;
      case 7:
        uint64_t v8 = 10;
        goto LABEL_20;
      case 9:
        uint64_t v8 = 27;
        goto LABEL_20;
      case 0xA:
        uint64_t v8 = 3;
        goto LABEL_20;
      case 0xC:
        uint64_t v8 = 80;
        goto LABEL_20;
      default:
        uint64_t v8 = 52;
LABEL_20:
        v16 = (void *)MEMORY[0x1D9452090]();
        v17 = objc_opt_class();
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = LODWORD(v48[0]);
          __int16 v55 = 2048;
          v56 = (void *)v8;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@CoreThreadRadio result code %lu mapped to HMErrorCode %lu", buf, 0x20u);
        }
        v20 = NSString;
        uint64_t v21 = MEMORY[0x1E4FBA498] + 64;
        v63[0] = MEMORY[0x1E4FBA498] + 64;
        v22 = (void *)MEMORY[0x1E4FBA418];
        uint64_t v23 = *(void *)(MEMORY[0x1E4FBA418] + 16);
        *(void *)buf = *(void *)(MEMORY[0x1E4FBA418] + 8);
        *(void *)&buf[*(void *)(*(void *)buf - 24)] = v23;
        v24 = (std::ios_base *)&buf[*(void *)(*(void *)buf - 24)];
        std::ios_base::init(v24, &buf[8]);
        uint64_t v47 = v8;
        uint64_t v25 = MEMORY[0x1E4FBA498] + 24;
        v24[1].__vftable = 0;
        v24[1].__fmtflags_ = -1;
        *(void *)buf = v25;
        v63[0] = v21;
        std::streambuf::basic_streambuf();
        uint64_t v26 = MEMORY[0x1E4FBA470] + 16;
        *(void *)&buf[8] = MEMORY[0x1E4FBA470] + 16;
        long long v60 = 0u;
        long long v61 = 0u;
        int v62 = 16;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Result:'", 8);
        if (LODWORD(v48[0]) > 0xE) {
          v27 = "kInvalidErrorCode";
        }
        else {
          v27 = off_1E6A0F938[LODWORD(v48[0])];
        }
        std::string::basic_string[abi:ne180100]<0>(__p, v27);
        if ((v53 & 0x80u) == 0) {
          v28 = __p;
        }
        else {
          v28 = (void **)__p[0];
        }
        if ((v53 & 0x80u) == 0) {
          uint64_t v29 = v53;
        }
        else {
          uint64_t v29 = (uint64_t)__p[1];
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v28, v29);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"'", 1);
        if ((char)v53 < 0) {
          operator delete(__p[0]);
        }
        uint64_t v30 = HIBYTE(v49);
        if (v49 < 0) {
          uint64_t v30 = v49;
        }
        if (v30)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)" Info:'", 7);
          if (v49 >= 0) {
            v31 = &v48[1];
          }
          else {
            v31 = (void **)v48[1];
          }
          if (v49 >= 0) {
            uint64_t v32 = HIBYTE(v49);
          }
          else {
            uint64_t v32 = v49;
          }
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v31, v32);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"'", 1);
        }
        if ((v62 & 0x10) != 0)
        {
          unint64_t v35 = *((void *)&v61 + 1);
          if (*((void *)&v61 + 1) < v59)
          {
            *((void *)&v61 + 1) = v59;
            unint64_t v35 = v59;
          }
          v36 = __src;
        }
        else
        {
          if ((v62 & 8) == 0)
          {
            size_t v33 = 0;
            HIBYTE(v51) = 0;
            v34 = __dst;
            goto LABEL_58;
          }
          v36 = v56;
          unint64_t v35 = v57;
        }
        size_t v33 = v35 - (void)v36;
        if (v35 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v33 >= 0x17)
        {
          uint64_t v37 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v33 | 7) != 0x17) {
            uint64_t v37 = v33 | 7;
          }
          uint64_t v38 = v37 + 1;
          v34 = (void **)operator new(v37 + 1);
          __dst[1] = (void *)v33;
          int64_t v51 = v38 | 0x8000000000000000;
          __dst[0] = v34;
        }
        else
        {
          HIBYTE(v51) = v35 - (_BYTE)v36;
          v34 = __dst;
          if (!v33) {
            goto LABEL_58;
          }
        }
        memmove(v34, v36, v33);
LABEL_58:
        *((unsigned char *)v34 + v33) = 0;
        *(void *)buf = *v22;
        *(void *)&buf[*(void *)(*(void *)buf - 24)] = v22[3];
        *(void *)&buf[8] = v26;
        if (SBYTE7(v61) < 0) {
          operator delete((void *)v60);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x1D9451450](v63);
        if (v51 >= 0) {
          v39 = __dst;
        }
        else {
          v39 = (void **)__dst[0];
        }
        v40 = [v20 stringWithCString:v39 encoding:4];
        uint64_t v41 = v47;
        if (SHIBYTE(v51) < 0) {
          operator delete(__dst[0]);
        }
        v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v41 description:0 reason:v40 suggestion:0];

        v43 = (void *)MEMORY[0x1D9452090]();
        id v44 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v45 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v42;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform Thread layer of primary resident update: %@", buf, 0x16u);
        }

LABEL_68:
        if (SHIBYTE(v49) < 0) {
          operator delete(v48[1]);
        }
        break;
    }
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    int64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Not informing Thread layer of primary resident change as state has not changed.", buf, 0xCu);
    }
  }
}

- (void)triggerThreadNetworkStateCaptureForAccessories:(id)a3 isSessionFailure:(BOOL)a4 withCompletion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(HMDThreadRadioClient *)self threadClient];

  if (v8)
  {
    v9 = [(HMDThreadRadioClient *)self threadStateCaptureQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_2;
    v14[3] = &unk_1E6A113D0;
    BOOL v16 = a4;
    v14[4] = self;
    id v15 = v7;
    id v10 = v7;
    dispatch_async(v9, v14);

    BOOL v11 = v15;
  }
  else
  {
    id v12 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v18 = v7;
    id v13 = v7;
    dispatch_async(v12, block);

    BOOL v11 = v18;
  }
}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, 0, 0);
}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  BOOL v3 = *(unsigned char *)(a1 + 48) == 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_3;
  v4[3] = &unk_1E6A0F8F0;
  id v5 = *(id *)(a1 + 40);
  [v2 captureTriggerData:0 triggerId:v3 accessoryInfoList:0 completionHandler:v4];
}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v23)
  {
    uint64_t v21 = *(void *)(a1 + 32);
    if (!v8)
    {
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      char v22 = 1;
LABEL_15:
      (*(void (**)(uint64_t, void, void, id))(v21 + 16))(v21, 0, 0, v12);
      if ((v22 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    char v22 = 0;
LABEL_13:
    id v12 = v8;
    goto LABEL_15;
  }
  if (v8)
  {
    v9 = [v8 domain];
    if ([v9 isEqualToString:@"com.threadradiod.ctr"])
    {
      uint64_t v10 = [v8 code];

      if (!v10) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    char v22 = 0;
    uint64_t v21 = *(void *)(a1 + 32);
    goto LABEL_13;
  }
LABEL_5:
  if ([v23 duration]) {
    BOOL v11 = v23;
  }
  else {
    BOOL v11 = v7;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v15 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
  BOOL v16 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "num_apple_BRs"));
  v17 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
  id v18 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
  v19 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
  v20 = objc_msgSend(v14, "initWithObjectsAndKeys:", v15, @"numAdvertisedBRs", v16, @"numAppleBRs", v17, @"numThirdPartyBRs", v18, @"numThreadNetworks", v19, @"maxSimuIPPrefixesDetected", 0);
  (*(void (**)(uint64_t, void *, void, void))(v13 + 16))(v13, v20, 0, 0);

LABEL_16:
LABEL_17:
}

- (void)triggerThreadNetworkStateCaptureWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadRadioClient *)self threadClient];

  if (v5)
  {
    int64_t v6 = [(HMDThreadRadioClient *)self threadStateCaptureQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_2;
    block[3] = &unk_1E6A19530;
    void block[4] = self;
    id v12 = v4;
    id v7 = v4;
    dispatch_async(v6, block);

    id v8 = v12;
  }
  else
  {
    v9 = dispatch_get_global_queue(21, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke;
    v13[3] = &unk_1E6A186E0;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(v9, v13);

    id v8 = v14;
  }
}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_3;
  v3[3] = &unk_1E6A0F8F0;
  id v4 = *(id *)(a1 + 40);
  [v2 captureTriggerData:0 triggerId:2 accessoryInfoList:0 completionHandler:v3];
}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v17)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (!v8)
    {
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      char v16 = 1;
LABEL_15:
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v12);
      if ((v16 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    char v16 = 0;
LABEL_13:
    id v12 = v8;
    goto LABEL_15;
  }
  if (v8)
  {
    v9 = [v8 domain];
    if ([v9 isEqualToString:@"com.threadradiod.ctr"])
    {
      uint64_t v10 = [v8 code];

      if (!v10) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    char v16 = 0;
    uint64_t v15 = *(void *)(a1 + 32);
    goto LABEL_13;
  }
LABEL_5:
  if ([v17 duration]) {
    BOOL v11 = v17;
  }
  else {
    BOOL v11 = v7;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", objc_msgSend(v12, "num_border_routers_advertised"), objc_msgSend(v12, "num_apple_BRs"), objc_msgSend(v12, "num_thirdparty_BRs"), objc_msgSend(v12, "num_thread_networks"), objc_msgSend(v12, "max_simultaneous_prefix_detected"), objc_msgSend(v12, "tx_total"), objc_msgSend(v12, "tx_total_success"), objc_msgSend(v12, "tx_delayavg"), objc_msgSend(v12, "rx_total"), objc_msgSend(v12, "rx_total_success"), objc_msgSend(v12, "duration"));
  (*(void (**)(uint64_t, HMDThreadNetworkStatusReport *, void))(v13 + 16))(v13, v14, 0);

LABEL_16:
LABEL_17:
}

- (BOOL)isThreadNetworkUp
{
  return self->_threadNetworkUp;
}

- (void)_unregisterForThreadNetworkEvents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  HMFGetOSLogHandle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int64_t v6 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@registerForThreadNetworkEvents", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [(HMDThreadRadioClient *)v4 threadClient];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    BOOL v11 = v4;
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v9 = [(HMDThreadRadioClient *)v4 threadClient];
    [v9 setClientEventsOff];
  }
}

- (void)_registerForThreadNetworkEvents
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDThreadRadioClient *)self threadClient];

  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = [(HMDThreadRadioClient *)self threadClient];
    std::string::basic_string[abi:ne180100]<0>(buf, "NCP:State");
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke;
    v37[3] = &unk_1E6A0F8C8;
    objc_copyWeak(&v38, &location);
    id v36 = [(HMDThreadRadioClient *)self threadEventQueue];
    id v5 = v36;
    [v4 setEventHandler:buf EventBlock:v37 dqueue:&v36];
    id v6 = v36;
    id v36 = 0;

    if (v41 < 0) {
      operator delete(*(void **)buf);
    }

    id v7 = [(HMDThreadRadioClient *)self threadClient];
    std::string::basic_string[abi:ne180100]<0>(buf, "Network:NodeType");
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_299;
    v34[3] = &unk_1E6A0F8C8;
    objc_copyWeak(&v35, &location);
    id v33 = [(HMDThreadRadioClient *)self threadEventQueue];
    id v8 = v33;
    [v7 setEventHandler:buf EventBlock:v34 dqueue:&v33];
    id v9 = v33;
    id v33 = 0;

    if (v41 < 0) {
      operator delete(*(void **)buf);
    }

    uint64_t v10 = [(HMDThreadRadioClient *)self threadClient];
    std::string::basic_string[abi:ne180100]<0>(buf, "WakeOnDeviceConnectionStatus");
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_301;
    v31[3] = &unk_1E6A0F8C8;
    objc_copyWeak(&v32, &location);
    id v30 = [(HMDThreadRadioClient *)self threadEventQueue];
    id v11 = v30;
    [v10 setEventHandler:buf EventBlock:v31 dqueue:&v30];
    id v12 = v30;
    id v30 = 0;

    if (v41 < 0) {
      operator delete(*(void **)buf);
    }

    uint64_t v13 = [(HMDThreadRadioClient *)self threadClient];
    std::string::basic_string[abi:ne180100]<0>(buf, "PeripheralDeviceType");
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_303;
    v28[3] = &unk_1E6A0F8C8;
    objc_copyWeak(&v29, &location);
    id v27 = [(HMDThreadRadioClient *)self threadEventQueue];
    id v14 = v27;
    [v13 setEventHandler:buf EventBlock:v28 dqueue:&v27];
    id v15 = v27;
    id v27 = 0;

    if (v41 < 0) {
      operator delete(*(void **)buf);
    }

    uint64_t v16 = [(HMDThreadRadioClient *)self threadClient];
    std::string::basic_string[abi:ne180100]<0>(buf, "bt_airpod_esco");
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_306;
    v25[3] = &unk_1E6A0F8C8;
    objc_copyWeak(&v26, &location);
    id v24 = [(HMDThreadRadioClient *)self threadEventQueue];
    id v17 = v24;
    [v16 setEventHandler:buf EventBlock:v25 dqueue:&v24];
    id v18 = v24;
    id v24 = 0;

    if (v41 < 0) {
      operator delete(*(void **)buf);
    }

    v19 = [(HMDThreadRadioClient *)self threadClient];
    [v19 setClientEventsOn];

    [(HMDThreadRadioClient *)self _reportCurrentThreadState:0];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    HMFGetOSLogHandle();
    char v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke(uint64_t a1, CtrXPC::Event **a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = WeakRetained;
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName((uint64_t *)__p, *a2);
      int v8 = v18;
      id v9 = (void **)__p[0];
      uint64_t v10 = CtrXPC::Event::getDataValue(*a2);
      id v11 = (void *)v10;
      id v12 = __p;
      *(_DWORD *)buf = 138543874;
      if (v8 < 0) {
        id v12 = v9;
      }
      id v20 = v7;
      __int16 v21 = 2080;
      char v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
    id v13 = [NSString alloc];
    id v14 = CtrXPC::Event::getDataValue(*a2);
    id v15 = (void *)[v13 initWithCString:xpc_string_get_string_ptr(v14)];

    uint64_t v16 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 0, [v5 _connectionStateFromString:v15]);
    [v5 _notifyObserversOfThreadNetworkEvent:v16];
  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_299(uint64_t a1, CtrXPC::Event **a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = WeakRetained;
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName((uint64_t *)__p, *a2);
      int v8 = v18;
      id v9 = (void **)__p[0];
      uint64_t v10 = CtrXPC::Event::getDataValue(*a2);
      id v11 = (void *)v10;
      id v12 = __p;
      *(_DWORD *)buf = 138543874;
      if (v8 < 0) {
        id v12 = v9;
      }
      id v20 = v7;
      __int16 v21 = 2080;
      char v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
    id v13 = [NSString alloc];
    id v14 = CtrXPC::Event::getDataValue(*a2);
    id v15 = (void *)[v13 initWithCString:xpc_string_get_string_ptr(v14)];

    uint64_t v16 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 1, [v5 _nodeTypeFromString:v15]);
    [v5 _notifyObserversOfThreadNetworkEvent:v16];
  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_301(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(std::__shared_weak_count **)(a2 + 8);
    id v14 = *(CtrXPC::Event **)a2;
    id v15 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v6 = [WeakRetained _WEDStateChangeEventFromThreadEvent:&v14];
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (v6)
    {
      [v4 _notifyObserversOfThreadWakeOnDeviceConnectionStateEvent:v6];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = v4;
      HMFGetOSLogHandle();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        CtrXPC::Event::getName((uint64_t *)__p, *(CtrXPC::Event **)a2);
        if (v13 >= 0) {
          id v11 = __p;
        }
        else {
          id v11 = (void **)__p[0];
        }
        *(_DWORD *)buf = 138543618;
        id v17 = v10;
        __int16 v18 = 2080;
        v19 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring thread event: event name - %s", buf, 0x16u);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_303(uint64_t a1, CtrXPC::Event **a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = WeakRetained;
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName((uint64_t *)__p, *a2);
      int v8 = v18;
      id v9 = (void **)__p[0];
      uint64_t v10 = CtrXPC::Event::getDataValue(*a2);
      id v11 = (void *)v10;
      id v12 = __p;
      *(_DWORD *)buf = 138543874;
      if (v8 < 0) {
        id v12 = v9;
      }
      id v20 = v7;
      __int16 v21 = 2080;
      char v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
    id v13 = [NSString alloc];
    id v14 = CtrXPC::Event::getDataValue(*a2);
    id v15 = (void *)[v13 initWithCString:xpc_string_get_string_ptr(v14)];

    uint64_t v16 = -[HMDThreadNetworkPeripheralDeviceNodeTypeEvent initWithPeripheralDeviceNodeType:]([HMDThreadNetworkPeripheralDeviceNodeTypeEvent alloc], "initWithPeripheralDeviceNodeType:", [v5 _nodeTypeFromString:v15]);
    [v5 _notifyObserversOfPeripheralDeviceNodeTypeEvent:v16];
  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_306(uint64_t a1, CtrXPC::Event **a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = WeakRetained;
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName((uint64_t *)__p, *a2);
      int v8 = v17;
      id v9 = (void **)__p[0];
      uint64_t v10 = CtrXPC::Event::getDataValue(*a2);
      id v11 = (void *)v10;
      id v12 = __p;
      *(_DWORD *)buf = 138543874;
      if (v8 < 0) {
        id v12 = v9;
      }
      id v19 = v7;
      __int16 v20 = 2080;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v17 < 0) {
        operator delete(__p[0]);
      }
    }
    id v13 = CtrXPC::Event::getDataValue(*a2);
    BOOL value = xpc_BOOL_get_value(v13);

    id v15 = [[HMDThreadNetworkBTCallStateEvent alloc] initWithCallState:value];
    [v5 _notifyObserversOfCallStateChangedEvent:v15];
  }
}

- (void)_reportCurrentThreadState:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  id v6 = [(HMDThreadRadioClient *)self threadClient];
  id v7 = v6;
  if (v6)
  {
    [v6 getProperty:"NCP:State" output:v5];
  }
  else
  {
    *(_OWORD *)__p = 0u;
    long long v34 = 0u;
  }

  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  if (LODWORD(__p[0]))
  {
    HMFGetOSLogHandle();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@failed to fetch kWPANTUNDProperty_NCPState", buf, 0xCu);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@fetched kWPANTUNDProperty_NCPState got value =%@", buf, 0x16u);
    }
    id v14 = [NSString alloc];
    id v15 = xpc_dictionary_get_value(v5, "PropVal");
    uint64_t v16 = (void *)[v14 initWithCString:xpc_string_get_string_ptr(v15)];

    char v17 = [[HMDThreadNetworkStateChangeEvent alloc] initWithEventType:0 eventValue:[(HMDThreadRadioClient *)v9 _connectionStateFromString:v16]];
    if (v4) {
      [v4 threadNetworkStateChange:v17];
    }
    else {
      [(HMDThreadRadioClient *)v9 _notifyObserversOfThreadNetworkEvent:v17];
    }
  }
  char v18 = [(HMDThreadRadioClient *)v9 threadClient];
  id v19 = v18;
  if (v18)
  {
    [v18 getProperty:"Network:NodeType" output:v5];
    int v20 = *(_DWORD *)buf;
  }
  else
  {
    int v20 = 0;
    memset(buf, 0, 32);
  }
  int __pa = v20;
  if (SHIBYTE(v34) < 0) {
    operator delete(__p[1]);
  }
  __p_8 = *(void **)&buf[8];
  signed __int8 v35 = buf[31];
  buf[31] = 0;
  buf[8] = 0;

  __int16 v21 = (void *)MEMORY[0x1D9452090]();
  __int16 v22 = v9;
  if (__pa)
  {
    HMFGetOSLogHandle();
    uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@failed to fetch kWPANTUNDEvent_NetworkNodeType", buf, 0xCu);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetched kWPANTUNDEvent_NetworkNodeType got value =%@", buf, 0x16u);
    }
    id v27 = [NSString alloc];
    v28 = xpc_dictionary_get_value(v5, "PropVal");
    id v29 = (void *)[v27 initWithCString:xpc_string_get_string_ptr(v28)];

    id v30 = [[HMDThreadNetworkStateChangeEvent alloc] initWithEventType:1 eventValue:[(HMDThreadRadioClient *)v22 _nodeTypeFromString:v29]];
    [(HMDThreadRadioClient *)v22 _notifyObserversOfThreadNetworkEvent:v30];
    if (v4) {
      [v4 threadNetworkStateChange:v30];
    }
    else {
      [(HMDThreadRadioClient *)v22 _notifyObserversOfThreadNetworkEvent:v30];
    }
  }
  if (v35 < 0) {
    operator delete(__p_8);
  }
}

- (void)_notifyObserversOfCallStateChangedEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDThreadRadioClient *)self observers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "threadBTCallStateChange:", v4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversOfPeripheralDeviceNodeTypeEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDThreadRadioClient *)self observers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "threadPeripheralDeviceNodeTypeChange:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversOfThreadWakeOnDeviceConnectionStateEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDThreadRadioClient *)self observers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "threadWakeOnDeviceConnectionStateChange:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversOfThreadPreferredNetworkUpdatedEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDThreadRadioClient *)self observers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "threadPreferredNetworkUpdated:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversOfThreadNetworkEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDThreadRadioClient *)self observers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "threadNetworkStateChange:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_WEDStateChangeEventFromThreadEvent:(shared_ptr<CtrXPC::Event>)a3
{
  var0 = (CtrXPC::Event **)a3.var0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = (void *)MEMORY[0x1D9452090](self, a2, a3.var0, a3.var1);
  uint64_t v25 = self;
  HMFGetOSLogHandle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    CtrXPC::Event::getName((uint64_t *)__p, *var0);
    if (v32 >= 0) {
      id v8 = __p;
    }
    else {
      id v8 = *(unsigned char **)__p;
    }
    *(_DWORD *)buf = 138543618;
    id v34 = v7;
    __int16 v35 = 2080;
    id v36 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received thread event: event name - %s", buf, 0x16u);
    if (v32 < 0) {
      operator delete(*(void **)__p);
    }
  }
  CtrXPC::Event::getDataValue(*var0);
  xpc_object_t xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  size_t count = xpc_array_get_count(xarray);
  if (count)
  {
    uint64_t v11 = 0;
    id v26 = 0;
    id v27 = 0;
    size_t v12 = 0;
    *(void *)&long long v10 = 138543618;
    long long v24 = v10;
    while (1)
    {
      long long v13 = xpc_array_get_dictionary(xarray, v12);
      long long v14 = objc_msgSend([NSString alloc], "initWithCString:", xpc_dictionary_get_string(v13, "key"));
      long long v15 = objc_msgSend([NSString alloc], "initWithCString:", xpc_dictionary_get_string(v13, "value"));
      if ([v14 isEqualToString:@"extendedMACAddress"])
      {
        long long v16 = [v15 stringByReplacingOccurrencesOfString:@":" withString:&stru_1F2C9F1A8];

        uint64_t v11 = [v16 uppercaseString];
      }
      else if ([v14 isEqualToString:@"status"])
      {
        long long v16 = v27;
        id v27 = v15;
      }
      else
      {
        if (![v14 isEqualToString:@"wed_unsolicted_disconnect"])
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          uint64_t v18 = v25;
          HMFGetOSLogHandle();
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v20 = HMFGetLogIdentifier();
            *(_DWORD *)__p = v24;
            *(void *)&__p[4] = v20;
            __int16 v30 = 2112;
            v31 = v14;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring key: %@", __p, 0x16u);
          }
          goto LABEL_17;
        }
        long long v16 = v26;
        id v26 = v15;
      }

LABEL_17:
      if (count == ++v12) {
        goto LABEL_23;
      }
    }
  }
  id v26 = 0;
  id v27 = 0;
  uint64_t v11 = 0;
LABEL_23:
  uint64_t v21 = -[HMDThreadRadioClient _WEDConnectionStateFromStatus:disconnectReason:](v25, "_WEDConnectionStateFromStatus:disconnectReason:", v27, v26, v24);
  __int16 v22 = 0;
  if (v11 && v21) {
    __int16 v22 = [[HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent alloc] initWitheMACAddress:v11 connectionState:v21];
  }

  return v22;
}

- (int64_t)_WEDConnectionStateFromStatus:(id)a3 disconnectReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"wed_added"])
  {
    int64_t v7 = 1;
  }
  else if ([v5 isEqualToString:@"wed_removed"])
  {
    if ([v6 isEqualToString:@"none"])
    {
      int64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"linkloss"])
    {
      int64_t v7 = 3;
    }
    else if ([v6 isEqualToString:@"threadradiod-daemon-crash"])
    {
      int64_t v7 = 4;
    }
    else
    {
      int64_t v7 = 2;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_nodeTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"sleepy-router"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"router"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"end-device"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"sleepy-end-device"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"synchronized-sleepy-end-device"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"commissioner"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"leader"])
  {
    int64_t v4 = 7;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_connectionStateFromString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"uninitialized"] & 1) != 0
    || ([v3 isEqualToString:@"uninitialized:fault"] & 1) != 0
    || ([v3 isEqualToString:@"uninitialized:upgrading"] & 1) != 0)
  {
    int64_t v4 = 0;
  }
  else if (([v3 isEqualToString:@"offline:deep-sleep"] & 1) != 0 {
         || ([v3 isEqualToString:@"offline"] & 1) != 0
  }
         || ([v3 isEqualToString:@"offline:commissioned"] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if (([v3 isEqualToString:@"associating"] & 1) != 0 {
         || ([v3 isEqualToString:@"associating:credentials-needed"] & 1) != 0)
  }
  {
    int64_t v4 = 2;
  }
  else if (([v3 isEqualToString:@"associated"] & 1) != 0 {
         || ([v3 isEqualToString:@"associated:no-parent"] & 1) != 0
  }
         || ([v3 isEqualToString:@"associated:netwake-asleep"] & 1) != 0)
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"associated:netwake-waking"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)unregisterForThreadNetworkEvents:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  int64_t v4 = [(HMDThreadRadioClient *)self observers];
  uint64_t v5 = [v4 count];

  id v6 = [(HMDThreadRadioClient *)self observers];
  [v6 removeObject:v9];

  int64_t v7 = [(HMDThreadRadioClient *)self observers];
  uint64_t v8 = [v7 count];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5) {
    [(HMDThreadRadioClient *)self _unregisterForThreadNetworkEvents];
  }
}

- (void)registerForThreadNetworkEvents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(HMDThreadRadioClient *)self observers];
  uint64_t v6 = [v5 count];

  int64_t v7 = [(HMDThreadRadioClient *)self observers];
  [v7 addObject:v4];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  if (v6)
  {
    HMFGetOSLogHandle();
    long long v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@registerForThreadNetworkEvents - events already setup, reading and notifying current state", (uint8_t *)&v14, 0xCu);
    }
    [(HMDThreadRadioClient *)v9 _reportCurrentThreadState:v4];
  }
  else
  {
    HMFGetOSLogHandle();
    size_t v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@registerForThreadNetworkEvents - setting up events for first observer", (uint8_t *)&v14, 0xCu);
    }
    [(HMDThreadRadioClient *)v9 _registerForThreadNetworkEvents];
  }
}

- (void)stopThreadNetworkWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMDThreadRadioClient *)self _updateThreadMessageReliabilityParametersWithUserDefinedValues:0];
  uint64_t v5 = [(HMDThreadRadioClient *)self threadClient];

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  int64_t v7 = self;
  if (v5)
  {
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to stop the thread network", buf, 0xCu);
    }
    long long v10 = [(HMDThreadRadioClient *)v7 threadClient];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      size_t v12 = [MEMORY[0x1E4F65550] defaultScheduler];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_196;
      v22[3] = &unk_1E6A19530;
      v22[4] = v7;
      id v23 = v4;
      id v13 = (id)[v12 performWithQualityOfService:17 block:v22];
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = v7;
      HMFGetOSLogHandle();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v27 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - threadStopWithCompletion:", buf, 0xCu);
      }
      uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v4 + 2))(v4, v21);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    int v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    uint64_t v16 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v25 = v4;
    dispatch_async(v16, block);
  }
}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_196(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v10 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to stop thread network", buf, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) threadClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_197;
  v7[3] = &unk_1E6A17D78;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v6 threadStopWithCompletion:v7];

  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_197(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  if (v3)
  {
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      long long v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread network: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      long long v10 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully stopped thread network", (uint8_t *)&v9, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateThreadMessageReliabilityParametersWithUserDefinedValues:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v6 = self;
  HMFGetOSLogHandle();
  int64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v19 = 138543618;
    int v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Should use user defined values for thread message reliability parameters: %@", (uint8_t *)&v19, 0x16u);
  }
  if (v3)
  {
    LOBYTE(v19) = 0;
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    __int16 v11 = &unk_1F2DC88A8;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"matter.thread.idleRetransmitMs", (CFStringRef)*MEMORY[0x1E4F1D3D8], (Boolean *)&v19);
    if ((_BYTE)v19 && AppIntegerValue)
    {
      __int16 v11 = [NSNumber numberWithLong:AppIntegerValue];
    }
    uint64_t v13 = &unk_1F2DC88A8;
    CFIndex v14 = CFPreferencesGetAppIntegerValue(@"matter.thread.activeRetransmitMs", v10, (Boolean *)&v19);
    if ((_BYTE)v19 && v14)
    {
      uint64_t v13 = [NSNumber numberWithLong:v14];
    }
    long long v15 = &unk_1F2DC88A8;
    CFIndex v16 = CFPreferencesGetAppIntegerValue(@"matter.thread.activeThresholdMs", v10, (Boolean *)&v19);
    if ((_BYTE)v19 && v16)
    {
      long long v15 = [NSNumber numberWithLong:v16];
    }
    CFIndex v17 = CFPreferencesGetAppIntegerValue(@"matter.thread.additionalRetransmitDelayMs", v10, (Boolean *)&v19);
    uint64_t v18 = &unk_1F2DC88A8;
    if ((_BYTE)v19 && v17)
    {
      uint64_t v18 = [NSNumber numberWithLong:v17];
    }
  }
  else
  {
    __int16 v11 = &unk_1F2DC88A8;
    uint64_t v13 = &unk_1F2DC88A8;
    long long v15 = &unk_1F2DC88A8;
    uint64_t v18 = &unk_1F2DC88A8;
  }
  [(HMDThreadRadioClient *)v6 setThreadMessageReliabilityParameters:v11 activeRetransmitMs:v13 activeThresholdMs:v15 additionalRetransmitDelayMs:v18];
}

- (void)setThreadMessageReliabilityParameters:(id)a3 activeRetransmitMs:(id)a4 activeThresholdMs:(id)a5 additionalRetransmitDelayMs:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFIndex v14 = (void *)MEMORY[0x1D9452090]();
  long long v15 = self;
  HMFGetOSLogHandle();
  CFIndex v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    CFIndex v17 = HMFGetLogIdentifier();
    int v24 = 138544386;
    id v25 = v17;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating thread message reliability parameters, idleRetransmitMs=%@, activeRetransmitMs=%@, activeThresholdMs=%@, additionalRetransmitDelayMs=%@", (uint8_t *)&v24, 0x34u);
  }
  uint64_t v18 = [(HMDThreadRadioClient *)v15 threadClient];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    int v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = v15;
    HMFGetOSLogHandle();
    __int16 v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device, not setting thread reliability parameters", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    MTRSetMessageReliabilityParameters();
  }
}

- (void)stopFirmwareUpdateWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDThreadRadioClient *)self threadClient];

  if (v5)
  {
    uint64_t v6 = [(HMDThreadRadioClient *)self threadClient];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_180;
      aBlock[3] = &unk_1E6A19530;
      aBlock[4] = self;
      id v22 = v4;
      id v8 = _Block_copy(aBlock);
      int v9 = [MEMORY[0x1E4F65550] defaultScheduler];
      id v10 = (id)[v9 performWithQualityOfService:17 block:v8];
    }
    else
    {
      CFIndex v16 = (void *)MEMORY[0x1D9452090]();
      CFIndex v17 = self;
      HMFGetOSLogHandle();
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        BOOL v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v26 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - stopFWUpdate:", buf, 0xCu);
      }
      int v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v4 + 2))(v4, v20);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    HMFGetOSLogHandle();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFIndex v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    long long v15 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v24 = v4;
    dispatch_async(v15, block);
  }
}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_180(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A17D78;
  BOOL v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 stopFWUpdate:v4];
}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of stopFWUpdate, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(HMDThreadRadioClient *)self threadClient];

  if (v10)
  {
    id v11 = [(HMDThreadRadioClient *)self threadClient];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_177;
      aBlock[3] = &unk_1E6A16328;
      aBlock[4] = self;
      id v27 = v8;
      BOOL v29 = a4;
      id v28 = v9;
      id v13 = _Block_copy(aBlock);
      CFIndex v14 = [MEMORY[0x1E4F65550] defaultScheduler];
      id v15 = (id)[v14 performWithQualityOfService:17 block:v13];
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = self;
      HMFGetOSLogHandle();
      uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - startFWUpdate:isWedDevice:completion", buf, 0xCu);
      }
      id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v9 + 2))(v9, v25);
    }
  }
  else
  {
    CFIndex v16 = (void *)MEMORY[0x1D9452090]();
    CFIndex v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    int v20 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v31 = v9;
    dispatch_async(v20, block);
  }
}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_177(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v5[3] = &unk_1E6A0F8A0;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v8 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [v2 startFWUpdate:v6 isWedDevice:v3 completion:v5];
}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = HMFBooleanToString();
      int v10 = 138544130;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of startFWUpdate (emac: %@, isWed: %@), error: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stopThreadPairingWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDThreadRadioClient *)self threadClient];

  if (v5)
  {
    id v6 = [(HMDThreadRadioClient *)self threadClient];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_174;
      aBlock[3] = &unk_1E6A19530;
      aBlock[4] = self;
      id v22 = v4;
      uint64_t v8 = _Block_copy(aBlock);
      id v9 = [MEMORY[0x1E4F65550] defaultScheduler];
      id v10 = (id)[v9 performWithQualityOfService:17 block:v8];
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = self;
      HMFGetOSLogHandle();
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        BOOL v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v26 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - stopPairing:", buf, 0xCu);
      }
      int v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v4 + 2))(v4, v20);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    __int16 v12 = self;
    HMFGetOSLogHandle();
    uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v26 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    id v15 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v24 = v4;
    dispatch_async(v15, block);
  }
}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_174(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A17D78;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 stopPairing:v4];
}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of pairing stop, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startThreadPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(HMDThreadRadioClient *)self threadClient];

  if (v10)
  {
    id v11 = [(HMDThreadRadioClient *)self threadClient];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_171;
      aBlock[3] = &unk_1E6A16328;
      aBlock[4] = self;
      id v27 = v8;
      BOOL v29 = a4;
      id v28 = v9;
      uint64_t v13 = _Block_copy(aBlock);
      __int16 v14 = [MEMORY[0x1E4F65550] defaultScheduler];
      id v15 = (id)[v14 performWithQualityOfService:17 block:v13];
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = self;
      HMFGetOSLogHandle();
      uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - startPairingForExtendedMACAddress:isWedDevice:completion", buf, 0xCu);
      }
      id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v9 + 2))(v9, v25);
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    int v20 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v31 = v9;
    dispatch_async(v20, block);
  }
}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_171(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) threadClient];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v5[3] = &unk_1E6A17D78;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v2 startPairingForExtendedMACAddress:v4 isWedDevice:v3 completion:v5];
}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of pairing start, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectToExtendedMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDThreadRadioClient *)self threadClient];

  if (v8)
  {
    id v9 = [(HMDThreadRadioClient *)self threadClient];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      BOOL v29 = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_167;
      __int16 v30 = &unk_1E6A193D0;
      id v11 = v6;
      id v31 = v11;
      __int16 v32 = self;
      id v12 = v7;
      id v33 = v12;
      uint64_t v13 = _Block_copy(&v27);
      [(HMDThreadRadioClient *)self deferredCommandTimer];
      if (v11) {
        __int16 v14 = {;
      }
        [v14 abort];

        id v15 = [MEMORY[0x1E4F65550] defaultScheduler];
        id v16 = (id)[v15 performWithQualityOfService:17 block:v13];
      }
      else {
        id v15 = {;
      }
        [v15 startWithBlock:v13 completion:v12 commandType:1];
      }

      id v22 = v31;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - provideExtendedMACAddress:completion", buf, 0xCu);
      }
      id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, void *))v7 + 2))(v7, v22);
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    HMFGetOSLogHandle();
    BOOL v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    __int16 v21 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v35 = v7;
    dispatch_async(v21, block);

    id v22 = v35;
  }
}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_167(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  if (v2)
  {
    HMFGetOSLogHandle();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to connect to device with eMAC address %@", buf, 0x16u);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Received nil eMAC, disconnecting from current device", buf, 0xCu);
    }
  }

  id v9 = [*(id *)(a1 + 40) threadClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_168;
  v12[3] = &unk_1E6A18F68;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = *(id *)(a1 + 48);
  [v9 provideExtendedMACAddress:v10 completion:v12];
}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_168(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while trying to connect to emac address: %@ error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)startThreadNetworkWithOperationalDataset:(id)a3 isOwnerUser:(BOOL)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(HMDThreadRadioClient *)self _updateThreadMessageReliabilityParametersWithUserDefinedValues:1];
  id v10 = [(HMDThreadRadioClient *)self threadClient];

  if (v10)
  {
    __int16 v11 = +[HMDLocation sharedManager];
    uint64_t v12 = [v11 locationAuthorized];

    BOOL v13 = v12 == 1 && [(HMDThreadRadioClient *)self isGeoAvailable];
    uint64_t v19 = objc_msgSend(v8, "hmf_hexadecimalStringWithOptions:", 0);
    int v20 = [v19 dataUsingEncoding:4];
    __int16 v21 = [MEMORY[0x1E4F65550] defaultScheduler];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_2;
    v24[3] = &unk_1E6A0F878;
    v24[4] = self;
    id v22 = v20;
    id v25 = v22;
    BOOL v27 = v13;
    BOOL v28 = a4;
    id v26 = v9;
    id v23 = (id)[v21 performWithQualityOfService:17 block:v24];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    HMFGetOSLogHandle();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
    }
    uint64_t v18 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v30 = v9;
    dispatch_async(v18, block);

    uint64_t v19 = v30;
  }
}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to start thread network with operation data set: %@", buf, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) threadClient];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 57);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_163;
  v11[3] = &unk_1E6A17D78;
  v11[4] = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v7 threadStart:v10 geoAvailable:v8 isPrimaryUser:v9 waitForSync:0 completion:v11];
}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 13) = 1;
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully started thread network", (uint8_t *)&v9, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startThreadNetwork:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDThreadRadioClient *)self threadClient];

  if (v8)
  {
    if (v6)
    {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      __int16 v11 = self;
      if (v9)
      {
        HMFGetOSLogHandle();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v38 = v13;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to join an existing thread network", buf, 0xCu);
        }
        id v14 = (void *)MEMORY[0x1D9452090]();
        __int16 v15 = v11;
        HMFGetOSLogHandle();
        uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v17;
          __int16 v39 = 2112;
          id v40 = v9;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Thread networkID: %@", buf, 0x16u);
        }
        goto LABEL_17;
      }
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        BOOL v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v27;
        __int16 v39 = 2112;
        id v40 = v6;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@NetworkID is not valid for thread unique id: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to create a new thread network", buf, 0xCu);
      }
    }

    id v9 = 0;
LABEL_17:
    BOOL v28 = (void *)MEMORY[0x1D9452090]();
    BOOL v29 = self;
    HMFGetOSLogHandle();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Incorrect startThread API used", buf, 0xCu);
    }
    __int16 v32 = dispatch_get_global_queue(21, 0);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke_160;
    v33[3] = &unk_1E6A186E0;
    id v34 = v7;
    id v23 = v7;
    dispatch_async(v32, v33);

    goto LABEL_20;
  }
  uint64_t v18 = (void *)MEMORY[0x1D9452090]();
  uint64_t v19 = self;
  HMFGetOSLogHandle();
  int v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v21;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);
  }
  id v22 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke;
  block[3] = &unk_1E6A186E0;
  id v36 = v7;
  id v9 = v7;
  dispatch_async(v22, block);

  id v23 = v36;
LABEL_20:
}

void __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke_160(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

- (BOOL)isGeoAvailable
{
  return self->_isGeoAvailable;
}

- (void)setIsGeoAvailable:(BOOL)a3
{
  self->_isGeoAvailable = a3;
}

- (HMDThreadRadioClient)init
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)HMDThreadRadioClient;
  id v2 = [(HMDThreadRadioClient *)&v30 init];
  if (!v2) {
    return v2;
  }
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = v2;
    HMFGetOSLogHandle();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Thread service not enabled", buf, 0xCu);
    }
    goto LABEL_10;
  }
  id v3 = +[HMDDeviceCapabilities deviceCapabilities];
  char v4 = [v3 supportsThreadService];

  if ((v4 & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    BOOL v27 = v2;
    HMFGetOSLogHandle();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      BOOL v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v28;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@This device doesn't support thread service", buf, 0xCu);
    }
LABEL_10:

    return v2;
  }
  if (objc_opt_class())
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F5E010]) init:"HomeD"];
    threadClient = v2->_threadClient;
    v2->_threadClient = (CtrClient *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("thread-state-capture", v8);
    threadStateCaptureQueue = v2->_threadStateCaptureQueue;
    v2->_threadStateCaptureQueue = (OS_dispatch_queue *)v9;

    v2->_threadNetworkUp = 0;
    v2->_threadLayerInformedResidentState = 0;
    v2->_isGeoAvailable = 0;
    __int16 v11 = [HMDThreadCommandTimer alloc];
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v14 = dispatch_queue_create("thread-command-timer", v13);
    uint64_t v15 = [(HMDThreadCommandTimer *)v11 initWithQueue:v14 delayInSecs:&unk_1F2DC88C0];
    deferredCommandTimer = v2->_deferredCommandTimer;
    v2->_deferredCommandTimer = (HMDThreadCommandTimer *)v15;

    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v19 = dispatch_queue_create("thread-event", v18);
    threadEventQueue = v2->_threadEventQueue;
    v2->_threadEventQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v21;
  }
  return v2;
}

+ (id)logCategory
{
  if (+[HMDThreadRadioClient logCategory]::_hmf_once_t1 != -1) {
    dispatch_once(&+[HMDThreadRadioClient logCategory]::_hmf_once_t1, &__block_literal_global_112215);
  }
  id v2 = (void *)+[HMDThreadRadioClient logCategory]::_hmf_once_v2;
  return v2;
}

uint64_t __35__HMDThreadRadioClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = +[HMDThreadRadioClient logCategory]::_hmf_once_v2;
  +[HMDThreadRadioClient logCategory]::_hmf_once_id v2 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end