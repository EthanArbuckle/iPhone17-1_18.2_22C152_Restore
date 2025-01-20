@interface HMDMatterAccessoryAdapter
+ (id)logCategory;
- (BOOL)fetchInProgress;
- (BOOL)shouldEncodeNotifications;
- (BOOL)supportsMTRPath:(id)a3;
- (BOOL)supportsRVC;
- (BOOL)useMatterPlugin;
- (HMDMatterAccessoryAdapter)initWithAccessory:(id)a3;
- (HMDMatterAccessoryProtocol)accessory;
- (HMFAsyncContext)workContext;
- (HMFMessageDispatcher)msgDispatcher;
- (MTRDevice)matterDevice;
- (MTRDevice)testMatterDevice;
- (NSArray)attributePaths;
- (NSArray)commandPaths;
- (NSArray)endpoints;
- (NSArray)eventPaths;
- (NSArray)matterPaths;
- (NSArray)mtrAttributePaths;
- (NSArray)mtrCommandPaths;
- (NSArray)mtrEventPaths;
- (NSArray)mtrPaths;
- (NSArray)rvcAreas;
- (NSArray)rvcMaps;
- (NSArray)rvcRooms;
- (NSArray)rvcZones;
- (NSDictionary)bulletinBoardNotificationByEndpoint;
- (NSDictionary)endpointToDeviceTypesMap;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)workQueue;
- (double)retryFetchTimeout;
- (id)_addMatterPaths:(id)a3;
- (id)_fetchAccessoryConfigurations;
- (id)_fetchAttributePathsForCluster:(id)a3 endpoint:(id)a4;
- (id)_fetchCommandPathsForCluster:(id)a3 endpoint:(id)a4;
- (id)_fetchDeviceTypesForEndpoints:(id)a3;
- (id)_fetchEventPathsForCluster:(id)a3 endpoint:(id)a4;
- (id)_fetchMatterPaths;
- (id)_fetchMatterPathsForCluster:(id)a3 endpoint:(id)a4;
- (id)_fetchMatterPathsForEndpoint:(id)a3;
- (id)_fetchRVCConfigForEndpoint:(id)a3 rvcMaps:(id)a4 rvcAreas:(id)a5;
- (id)_fetchRVCSupportedAreasFromEndpoint:(id)a3;
- (id)_fetchRVCSupportedMapsFromEndpoint:(id)a3;
- (id)_processAccessoryConfigurationWithPaths:(id)a3;
- (id)_readFromAttributePath:(id)a3 retryTimeout:(double)a4;
- (id)_removeMatterPaths:(id)a3;
- (id)_runAccessoryTransactions:(id)a3;
- (id)_rvcRoomForArea:(id)a3;
- (id)accessoryServer;
- (id)addMatterPaths:(id)a3;
- (id)backingStoreTransactionWithName:(id)a3;
- (id)deviceTypesForEndpoint:(id)a3;
- (id)eventFieldsForEventReport:(id)a3;
- (id)fetchConfiguration;
- (id)fetchRVCConfig;
- (id)hapAccessory;
- (id)matterAccessory;
- (id)matterPathWithUUID:(id)a3;
- (id)messagePayloadForServiceAreas;
- (id)readFromAttributePath:(id)a3 retryTimeout:(double)a4;
- (id)readFromAttributePaths:(id)a3 retryTimeout:(double)a4;
- (id)removeMatterPaths:(id)a3;
- (id)runTransactions:(id)a3;
- (id)shortDescription;
- (id)uuidForName:(id)a3 nameID:(id)a4;
- (void)_forwardServiceAreaChangesToAllDevices;
- (void)_handleAttributeChangedNotification:(id)a3;
- (void)_updateRVCMaps:(id)a3 areas:(id)a4;
- (void)addMatterPathModel:(id)a3 message:(id)a4;
- (void)configureMatterAccessory;
- (void)createNotifications;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)didUpdatePairingsForAccessoryServer:(id)a3;
- (void)didUpdateRequiresThreadRouterForAccessoryServer:(id)a3;
- (void)executeCascadeDonationsForServiceAreaItems:(id)a3;
- (void)handleActivateMatterPairingModeAndCreateSetupPayloadStringMessage:(id)a3;
- (void)handleActivateMatterPairingModeMessage:(id)a3;
- (void)handleAttributeReport:(id)a3 dictionary:(id)a4 hapAccessory:(id)a5;
- (void)handleEventReport:(id)a3 dictionary:(id)a4 flow:(id)a5 hapAccessory:(id)a6;
- (void)handleFetchMatterPairingsMessage:(id)a3;
- (void)handleHomeNameChangedNotification:(id)a3;
- (void)handleMatterAttribute:(id)a3 dictionary:(id)a4;
- (void)handleMatterEvent:(id)a3 dictionary:(id)a4 flow:(id)a5;
- (void)handleMatterEventMessage:(id)a3;
- (void)handleNotification:(id)a3;
- (void)handleRemoteMatterRequestMessage:(id)a3;
- (void)handleRemoveCorrespondingSystemCommissionerMessage:(id)a3;
- (void)handleRemoveMatterPairingsMessage:(id)a3;
- (void)handleStartUpWithEventNumber:(id)a3;
- (void)identifyEndpoint:(id)a3 identifyTime:(id)a4 message:(id)a5;
- (void)invokeCommand:(id)a3 fields:(id)a4 expectedValues:(id)a5 source:(unint64_t)a6 completion:(id)a7;
- (void)readAttribute:(id)a3 params:(id)a4 completion:(id)a5;
- (void)readFromAttributePath:(id)a3 retryTimeout:(double)a4 completion:(id)a5;
- (void)registerForMessages;
- (void)removeAllMatterPairingsWithCompletion:(id)a3;
- (void)removeMatterPathModel:(id)a3 message:(id)a4;
- (void)routeMessage:(id)a3 localHandler:(id)a4;
- (void)runTransactions:(id)a3 completion:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setBulletinBoardNotificationByEndpoint:(id)a3;
- (void)setEndpointToDeviceTypesMap:(id)a3;
- (void)setFetchInProgress:(BOOL)a3;
- (void)setMatterDevice:(id)a3;
- (void)setMatterReportHandler:(id)a3;
- (void)setRetryFetchTimeout:(double)a3;
- (void)setTestMatterDevice:(id)a3;
- (void)submitLogEventForEventReport:(id)a3;
- (void)submitServiceAreaChangesToCascade;
- (void)submitServiceAreaChangesToCascadeFromMessage:(id)a3;
- (void)testSetMTRPaths:(id)a3;
- (void)testSetMatterDevice:(id)a3 retryTimeout:(double)a4;
- (void)testSetMatterPaths:(id)a3;
- (void)unconfigure;
- (void)updateMatterPropertiesWithAccessoryModel:(id)a3 actions:(id)a4;
- (void)updateNativeMatterSupport:(BOOL)a3;
- (void)updateNotificationsWithEndpoints:(id)a3;
- (void)writeAttribute:(id)a3 value:(id)a4 timedWriteTimeout:(id)a5 completion:(id)a6;
@end

@implementation HMDMatterAccessoryAdapter

- (void)unconfigure
{
  v2 = self;
  sub_22F617DE0();
}

- (void)configureMatterAccessory
{
  v2 = self;
  sub_22F6180C8();
}

- (void)removeAllMatterPairingsWithCompletion:(id)a3
{
}

- (void)updateNativeMatterSupport:(BOOL)a3
{
  v3 = self;
  sub_22F61B864();
}

- (void)setMatterReportHandler:(id)a3
{
}

- (void)runTransactions:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_22F54F4F8(0, &qword_2686D91F0);
  sub_2302DDD80();
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_22F565940;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = self;
  v8 = (void *)sub_2302DDD60();
  id v9 = [(HMDMatterAccessoryAdapter *)v7 runTransactions:v8];

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  *(void *)(v10 + 24) = v6;
  v12[4] = sub_22F628268;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22F61AC78;
  v12[3] = &block_descriptor_30;
  v11 = _Block_copy(v12);
  sub_22F62829C((uint64_t)v5);
  swift_release();
  objc_msgSend(v9, sel_getResultWithCompletion_, v11);
  _Block_release(v11);

  sub_22F6282AC((uint64_t)v5);
  swift_bridgeObjectRelease();
}

- (id)runTransactions:(id)a3
{
  sub_22F54F4F8(0, &qword_2686D91F0);
  unint64_t v4 = sub_2302DDD80();
  v5 = self;
  uint64_t v6 = (void *)sub_22F61C108(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)updateMatterPropertiesWithAccessoryModel:(id)a3 actions:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_22F61C7A8(v6, v7);
}

- (void)identifyEndpoint:(id)a3 identifyTime:(id)a4 message:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_22F61F394(a3, v10, v11);
}

- (void)handleMatterAttribute:(id)a3 dictionary:(id)a4
{
  uint64_t v6 = sub_2302DDB00();
  if (a3)
  {
    id v7 = self;
    id v8 = a3;
    sub_22F6A7C10(v8, v6);
  }
  swift_bridgeObjectRelease();
}

- (void)handleMatterEvent:(id)a3 dictionary:(id)a4 flow:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = self;
  sub_22F6A993C(v7, (uint64_t)v8);
}

- (id)eventFieldsForEventReport:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_22F62032C(v4);

  if (v6)
  {
    id v7 = (void *)sub_2302DDAE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)handleHomeNameChangedNotification:(id)a3
{
  uint64_t v4 = sub_2302DCF50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DCF10();
  id v8 = self;
  sub_22F620D88((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleEventReport:(id)a3 dictionary:(id)a4 flow:(id)a5 hapAccessory:(id)a6
{
  id v10 = self;
  id v11 = a3;
  id v14 = a5;
  id v12 = a6;
  v13 = self;
  LODWORD(v10) = objc_msgSend(objc_msgSend(v10, sel_featuresDataSource), sel_isRVCEnabled);
  swift_unknownObjectRelease();
  if (v10) {
    sub_22F6A993C(v11, (uint64_t)v14);
  }
}

- (void)handleAttributeReport:(id)a3 dictionary:(id)a4 hapAccessory:(id)a5
{
  uint64_t v8 = sub_2302DDB00();
  uint64_t v9 = self;
  id v10 = a3;
  id v13 = a5;
  id v11 = self;
  LODWORD(v9) = objc_msgSend(objc_msgSend(v9, sel_featuresDataSource), sel_isRVCEnabled);
  swift_unknownObjectRelease();
  if (v9 && v10)
  {
    id v12 = v10;
    sub_22F6A7C10(v12, v8);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)handleStartUpWithEventNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  HMDMatterAccessoryAdapter.handleStartUp(withEventNumber:)((NSNumber)v4);
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  HMDMatterAccessoryAdapter.device(_:stateChanged:)((MTRDevice)v6, (MTRDeviceState)a4);
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
}

- (void)didUpdatePairingsForAccessoryServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _sSo25HMDMatterAccessoryAdapterC13HomeKitDaemonE17didUpdatePairings3forySo20HMMTRAccessoryServerC_tF_0();
}

- (void)didUpdateRequiresThreadRouterForAccessoryServer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  HMDMatterAccessoryAdapter.didUpdateRequiresThreadRouter(for:)(v4);
}

- (void)registerForMessages
{
  v2 = self;
  sub_22F6A2A94();
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_22F6A30EC(v8, (uint64_t)sub_22F5B57A8, v7);

  swift_release();
}

- (void)handleRemoteMatterRequestMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A35D0(v4);
}

- (void)handleFetchMatterPairingsMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A3F30(v4);
}

- (void)handleRemoveCorrespondingSystemCommissionerMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A4378(v4);
}

- (void)handleRemoveMatterPairingsMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A48C0(v4);
}

- (void)handleMatterEventMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A5890(v4);
}

- (void)handleActivateMatterPairingModeMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A6C28(v4, sub_22F676DF4, (uint64_t)&unk_26E2D46D8, (unint64_t)sub_22F6A7668, (uint64_t)&block_descriptor_6_0);
}

- (void)handleActivateMatterPairingModeAndCreateSetupPayloadStringMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22F6A6C28(v4, sub_22F67783C, (uint64_t)&unk_26E2D4688, (unint64_t)sub_22F6A762C, (uint64_t)&block_descriptor_19);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t69 != -1) {
    dispatch_once(&logCategory__hmf_once_t69, &__block_literal_global_325_120980);
  }
  v2 = (void *)logCategory__hmf_once_v70;
  return v2;
}

void __40__HMDMatterAccessoryAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v70;
  logCategory__hmf_once_v70 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testMatterDevice, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_endpointToDeviceTypesMap, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationByEndpoint, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_matterDevice, 0);
  objc_storeStrong((id *)&self->_mtrPaths, 0);
  objc_storeStrong((id *)&self->_hmdMatterPaths, 0);
  objc_storeStrong((id *)&self->_rvcAreas, 0);
  objc_storeStrong((id *)&self->_rvcMaps, 0);
  objc_storeStrong((id *)&self->_rvcZones, 0);
  objc_storeStrong((id *)&self->_rvcRooms, 0);
}

- (void)setRetryFetchTimeout:(double)a3
{
  self->_retryFetchTimeout = a3;
}

- (double)retryFetchTimeout
{
  return self->_retryFetchTimeout;
}

- (void)setTestMatterDevice:(id)a3
{
}

- (MTRDevice)testMatterDevice
{
  return self->_testMatterDevice;
}

- (void)setFetchInProgress:(BOOL)a3
{
  self->_fetchInProgress = a3;
}

- (BOOL)fetchInProgress
{
  return self->_fetchInProgress;
}

- (void)setAccessory:(id)a3
{
}

- (HMDMatterAccessoryProtocol)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDMatterAccessoryProtocol *)WeakRetained;
}

- (void)setEndpointToDeviceTypesMap:(id)a3
{
}

- (NSDictionary)endpointToDeviceTypesMap
{
  return self->_endpointToDeviceTypesMap;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v4 = [v3 shortDescription];
  uint64_t v5 = [v2 stringWithFormat:@"(ADAP)%@", v4];

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  v2 = [(HMDMatterAccessoryAdapter *)self accessory];
  v3 = [v2 messageReceiveQueue];

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDMatterAccessoryAdapter *)self accessory];
  v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (HMFMessageDispatcher)msgDispatcher
{
  v2 = [(HMDMatterAccessoryAdapter *)self accessory];
  v3 = [v2 msgDispatcher];

  return (HMFMessageDispatcher *)v3;
}

- (void)submitLogEventForEventReport:(id)a3
{
  id v16 = a3;
  id v4 = +[HMDCoreData featuresDataSource];
  int v5 = [v4 isRVCEnabled];

  id v6 = v16;
  if (v5)
  {
    uint64_t v7 = [v16 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      id v10 = [v9 completionErrorCode];
      id v11 = [v9 totalOperationalTime];
      id v12 = +[HMDRVCOperationCompletionLogEvent eventWithErrorCode:v10 totalOperationalTime:v11];

      id v13 = [(HMDMatterAccessoryAdapter *)self accessory];
      id v14 = [v13 home];
      v15 = [v14 logEventSubmitter];
      [v15 submitLogEvent:v12];
    }
    id v6 = v16;
  }
}

- (BOOL)shouldEncodeNotifications
{
  v2 = [(HMDMatterAccessoryAdapter *)self bulletinBoardNotificationByEndpoint];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSDictionary)bulletinBoardNotificationByEndpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_bulletinBoardNotificationByEndpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBulletinBoardNotificationByEndpoint:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  bulletinBoardNotificationByEndpoint = self->_bulletinBoardNotificationByEndpoint;
  self->_bulletinBoardNotificationByEndpoint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateNotificationsWithEndpoints:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 home];
    if (v7)
    {
      id v8 = [(HMDMatterAccessoryAdapter *)self bulletinBoardNotificationByEndpoint];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __62__HMDMatterAccessoryAdapter_updateNotificationsWithEndpoints___block_invoke;
      v34[3] = &unk_264A1FD80;
      id v9 = v4;
      id v35 = v9;
      id v10 = objc_msgSend(v8, "na_filter:", v34);
      id v11 = (void *)[v10 mutableCopy];

      if (!v11)
      {
        id v11 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __62__HMDMatterAccessoryAdapter_updateNotificationsWithEndpoints___block_invoke_2;
      v30 = &unk_264A1FDA8;
      id v31 = v11;
      id v12 = v7;
      id v32 = v12;
      id v13 = v6;
      id v33 = v13;
      id v14 = v11;
      objc_msgSend(v9, "na_each:", &v27);
      v15 = objc_msgSend(v14, "copy", v27, v28, v29, v30);
      [(HMDMatterAccessoryAdapter *)self setBulletinBoardNotificationByEndpoint:v15];

      id v16 = [v12 homeManager];
      v17 = [v13 uuid];
      [v16 updateGenerationCounterWithReason:@"Bulletin Notifications Supported Updated" sourceUUID:v17 shouldNotifyClients:1];

      v18 = [v12 accessoryBulletinNotificationManager];
      [v18 updateEndpointRegistrationsForAccessory:v13 endpoints:v9];
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        __int16 v38 = 2112;
        v39 = v24;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error updating endpoint set for accessory=%@, nil home", buf, 0x16u);
      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error updating endpoint set, nil accessory", buf, 0xCu);
    }
  }
}

uint64_t __62__HMDMatterAccessoryAdapter_updateNotificationsWithEndpoints___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __62__HMDMatterAccessoryAdapter_updateNotificationsWithEndpoints___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) accessoryBulletinNotificationManager];
    int v5 = [v4 bulletinBoardNotificationForAccessory:*(void *)(a1 + 48) endpointID:v6];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)_handleAttributeChangedNotification:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDMatterAccessoryAdapter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling attribute changed notification", buf, 0xCu);
  }
  id v10 = [v4 object];
  if ([v10 conformsToProtocol:&unk_26E4FFCC0]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  id v13 = [v4 userInfo];
  id v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationEndpointIDKey");
    id v16 = objc_msgSend(v14, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationClusterIDKey");
    v17 = objc_msgSend(v14, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationAttributeIDKey");
    if ([v15 isEqual:&unk_26E471908]
      && [v16 isEqual:&unk_26E471920]
      && [v17 isEqual:&unk_26E4718F0])
    {
      v18 = [v14 valueForKey:@"HMDMatterAttributeChangedNotificationValueKey"];
      v19 = [MEMORY[0x263EFF9C0] set];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __65__HMDMatterAccessoryAdapter__handleAttributeChangedNotification___block_invoke;
      v33[3] = &unk_264A2B368;
      id v20 = v19;
      id v34 = v20;
      objc_msgSend(v18, "na_each:", v33);
      v21 = (void *)[v20 copy];
      if (!objc_msgSend(v21, "hmf_isEmpty") || objc_msgSend(v18, "hmf_isEmpty"))
      {
        id v31 = v20;
        id v32 = v18;
        context = (void *)MEMORY[0x230FBD990]();
        v22 = v7;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v36 = v29;
          __int16 v37 = 2112;
          id v38 = v21;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating endpoints=%@", buf, 0x16u);
        }
        [(HMDMatterAccessoryAdapter *)v22 updateNotificationsWithEndpoints:v21];
        id v20 = v31;
        v18 = v32;
      }
    }
    if ([(HMDMatterAccessoryAdapter *)v7 supportsRVC]
      && [v16 isEqual:&unk_26E4719C8]
      && (([v17 isEqual:&unk_26E471950] & 1) != 0
       || [v17 isEqual:&unk_26E471938]))
    {
      id v24 = [(HMDMatterAccessoryAdapter *)v7 fetchRVCConfig];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v7;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Received HMDMatterAttributeChangedNotification with undefined payload: %@", buf, 0x16u);
    }
  }
}

void __65__HMDMatterAccessoryAdapter__handleAttributeChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v13;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  if (v4)
  {
    int v5 = v4;
    id v6 = [v13 allKeys];
    uint64_t v7 = *MEMORY[0x263F10B90];
    int v8 = [v6 containsObject:*MEMORY[0x263F10B90]];

    if (v8)
    {
      id v9 = [v13 objectForKeyedSubscript:v7];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10C30]];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
      id v12 = v11;

      [*(id *)(a1 + 32) addObject:v12];
    }
  }
}

- (void)createNotifications
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDMatterAccessoryAdapter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDMatterAccessoryAdapter *)self accessory];
  int v5 = v4;
  if (!v4)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      id v14 = "%{public}@Error creating BulletinBoardNotifications, cannot read partslist without accessory";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, buf, 0xCu);
    }
LABEL_10:

    goto LABEL_15;
  }
  id v6 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      id v14 = "%{public}@Not creating BulletinBoardNotifications because this accessory is not a Native Matter accessory";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  int v8 = [v6 home];
  if (v8)
  {
    id v9 = [MEMORY[0x263F10C50] attributePathWithEndpointID:&unk_26E471908 clusterID:&unk_26E471920 attributeID:&unk_26E4718F0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __48__HMDMatterAccessoryAdapter_createNotifications__block_invoke;
    v21[3] = &unk_264A2E660;
    v21[4] = self;
    [(HMDMatterAccessoryAdapter *)self readAttribute:v9 params:0 completion:v21];
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error creating BulletinBoardNotifications for accessory=%@, cannot read partslist without home", buf, 0x16u);
    }
  }

LABEL_15:
}

void __48__HMDMatterAccessoryAdapter_createNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = *(void **)(a1 + 32);
      int v23 = 138543874;
      __int16 v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error reading PartsList on accessory=%@ error=%@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    id v12 = objc_msgSend(v5, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
    uint64_t v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_312);
    id v14 = (void *)v13;
    v15 = (void *)MEMORY[0x263EFFA68];
    if (v13) {
      v15 = (void *)v13;
    }
    id v16 = v15;

    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      __int16 v24 = v20;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Creating notifications for endpoints=%@", (uint8_t *)&v23, 0x16u);
    }
    v21 = *(void **)(a1 + 32);
    v22 = [MEMORY[0x263EFFA08] setWithArray:v16];
    [v21 updateNotificationsWithEndpoints:v22];
  }
}

id __48__HMDMatterAccessoryAdapter_createNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  BOOL v3 = objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  return v3;
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterAccessoryAdapter *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDMatterAccessoryAdapter_handleNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDMatterAccessoryAdapter_handleNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) name];
  if ([v2 isEqualToString:@"HMDMatterAttributeChangedNotification"])
  {
    [*(id *)(a1 + 40) _handleAttributeChangedNotification:*(void *)(a1 + 32)];
  }
  else if ([v2 isEqualToString:@"HMDResidentDeviceConfirmedStateChangedNotification"])
  {
    BOOL v3 = [*(id *)(a1 + 40) accessory];
    id v4 = [v3 home];

    id v5 = [*(id *)(a1 + 32) userInfo];
    id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceHomeUUIDNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    id v9 = [v4 uuid];
    int v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9);

    if (v10)
    {
      [*(id *)(a1 + 40) createNotifications];
    }
    else
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = HMFGetLogIdentifier();
        int v15 = 138543618;
        id v16 = v14;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring resident update for other home: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)addMatterPathModel:(id)a3 message:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(HMDMatterAccessoryAdapter *)self matterPathWithUUID:v8];

  if (v9)
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v27 = 138543618;
      id v28 = v13;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Can't add an existing matter path: %@.", (uint8_t *)&v27, 0x16u);
    }
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v7 respondWithError:v14];
  }
  else
  {
    int v15 = [HMDMatterPath alloc];
    id v16 = [(HMDMatterAccessoryAdapter *)self accessory];
    id v9 = [(HMDMatterPath *)v15 initWithPathModel:v6 accessory:v16];

    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = HMFGetLogIdentifier();
      int v27 = 138543618;
      id v28 = v20;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Adding new matter path: %@.", (uint8_t *)&v27, 0x16u);
    }
    p_lock = &v18->_lock;
    os_unfair_lock_lock_with_options();
    hmdMatterPaths = v18->_hmdMatterPaths;
    if (!hmdMatterPaths)
    {
      uint64_t v23 = [MEMORY[0x263EFF980] array];
      p_hmdMatterPaths = (void **)&v18->_hmdMatterPaths;
      __int16 v25 = *p_hmdMatterPaths;
      *p_hmdMatterPaths = (void *)v23;

      hmdMatterPaths = *p_hmdMatterPaths;
    }
    [hmdMatterPaths addObject:v9];
    os_unfair_lock_unlock(p_lock);
    id v26 = [v7 transactionResult];
    [v26 markChanged];

    [v7 respondWithSuccess];
  }
}

- (void)removeMatterPathModel:(id)a3 message:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(HMDMatterAccessoryAdapter *)self matterPathWithUUID:v8];

  if (v9)
  {
    int v10 = +[HMDCoreData featuresDataSource];
    int v11 = [v10 isRVCEnabled];

    if (v11)
    {
      id v12 = [(HMDMatterAccessoryAdapter *)self accessory];
      uint64_t v13 = [v12 home];

      id v14 = [v13 backingStore];
      int v15 = [v7 name];
      id v16 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      __int16 v17 = [v14 transaction:v15 options:v16];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v36 = 0;
      id v18 = [v13 actionSets];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      __int16 v29 = __59__HMDMatterAccessoryAdapter_removeMatterPathModel_message___block_invoke;
      v30 = &unk_264A1FD50;
      id v31 = v9;
      id v34 = buf;
      id v32 = v7;
      id v19 = v17;
      id v33 = v19;
      [v18 enumerateObjectsUsingBlock:&v27];

      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        objc_msgSend(v19, "run", v27, v28, v29, v30, v31, v32);
      }

      _Block_object_dispose(buf, 8);
    }
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_hmdMatterPaths removeObject:v9];
    os_unfair_lock_unlock(&self->_lock);
    id v20 = [v7 transactionResult];
    [v20 markChanged];

    [v7 respondWithSuccess];
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      __int16 v25 = [v6 uuid];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find matter path with UUID %@ to remove.", buf, 0x16u);
    }
    id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v26];
  }
}

void __59__HMDMatterAccessoryAdapter_removeMatterPathModel_message___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 actions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HMDMatterAccessoryAdapter_removeMatterPathModel_message___block_invoke_2;
  v6[3] = &unk_264A1FD28;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v10 = v5;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v3 enumerateObjectsUsingBlock:v6];
}

void __59__HMDMatterAccessoryAdapter_removeMatterPathModel_message___block_invoke_2(void *a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v8;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 matterPaths];
    int v7 = [v6 containsObject:a1[4]];

    if (v7)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      [v5 matterPathRemoved:a1[4] message:a1[5] transaction:a1[6]];
    }
  }
}

- (id)_runAccessoryTransactions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(HMDMatterAccessoryAdapter *)self backingStoreTransactionWithName:@"AccessoryUpdated"];
    [v5 addObjects:v4];
    id v11 = 0;
    id v6 = [MEMORY[0x263F42538] futureWithPromise:&v11];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__HMDMatterAccessoryAdapter__runAccessoryTransactions___block_invoke;
    v8[3] = &unk_264A2E210;
    v8[4] = self;
    id v9 = v4;
    id v10 = v11;
    [v5 run:v8];
  }
  else
  {
    id v6 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v6;
}

void __55__HMDMatterAccessoryAdapter__runAccessoryTransactions___block_invoke(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[5], "count"));
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Ran %@ transactions with error: %@", (uint8_t *)&v9, 0x20u);
  }
  [a1[6] fulfillWithNoValue];
}

- (id)_removeMatterPaths:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  }
  else
  {
    id v5 = 0;
  }
  if ([v5 count])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      __int16 v25 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing %@ matter paths %@", buf, 0x20u);
    }
    __int16 v11 = [(HMDMatterAccessoryAdapter *)v7 accessory];
    id v12 = [v11 uuid];

    __int16 v13 = [v5 allObjects];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48__HMDMatterAccessoryAdapter__removeMatterPaths___block_invoke;
    v18[3] = &unk_264A208F8;
    id v19 = v12;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "na_map:", v18);

    id v16 = [(HMDMatterAccessoryAdapter *)v7 _runAccessoryTransactions:v15];
  }
  else
  {
    id v16 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v16;
}

id __48__HMDMatterAccessoryAdapter__removeMatterPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMDMatterPathModel alloc];
  id v5 = [v3 uuid];
  id v6 = [(HMDBackingStoreModelObject *)v4 initWithObjectChangeType:3 uuid:v5 parentUUID:*(void *)(a1 + 32)];

  [v3 populateModelObject:v6];
  return v3;
}

- (id)_addMatterPaths:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  }
  else
  {
    id v5 = 0;
  }
  if ([v5 count])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      __int16 v25 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding %@ matter paths %@", buf, 0x20u);
    }
    __int16 v11 = [(HMDMatterAccessoryAdapter *)v7 accessory];
    id v12 = [v11 uuid];

    __int16 v13 = [v5 allObjects];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__HMDMatterAccessoryAdapter__addMatterPaths___block_invoke;
    v18[3] = &unk_264A208F8;
    id v19 = v12;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "na_map:", v18);

    id v16 = [(HMDMatterAccessoryAdapter *)v7 _runAccessoryTransactions:v15];
  }
  else
  {
    id v16 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v16;
}

id __45__HMDMatterAccessoryAdapter__addMatterPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMDMatterPathModel alloc];
  id v5 = [v3 uuid];
  id v6 = [(HMDBackingStoreModelObject *)v4 initWithObjectChangeType:1 uuid:v5 parentUUID:*(void *)(a1 + 32)];

  [v3 populateModelObject:v6];
  return v3;
}

- (id)removeMatterPaths:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F42538];
  id v6 = [(HMDMatterAccessoryAdapter *)self workContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HMDMatterAccessoryAdapter_removeMatterPaths___block_invoke;
  v10[3] = &unk_264A2EC78;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v5 inContext:v6 perform:v10];

  return v8;
}

uint64_t __47__HMDMatterAccessoryAdapter_removeMatterPaths___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _removeMatterPaths:*(void *)(a1 + 40)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDMatterAccessoryAdapter *)v4 addMatterPaths:v6];
  }
}

- (id)addMatterPaths:(id)a3
{
  id v4 = a3;
  SEL v5 = (void *)MEMORY[0x263F42538];
  id v6 = [(HMDMatterAccessoryAdapter *)self workContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__HMDMatterAccessoryAdapter_addMatterPaths___block_invoke;
  v10[3] = &unk_264A2EC78;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v5 inContext:v6 perform:v10];

  return v8;
}

uint64_t __44__HMDMatterAccessoryAdapter_addMatterPaths___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _addMatterPaths:*(void *)(a1 + 40)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDMatterAccessoryAdapter *)v4 _processAccessoryConfigurationWithPaths:v6];
  }
}

- (id)_processAccessoryConfigurationWithPaths:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F42538], "futureWithNoValue", a3);
}

- (id)backingStoreTransactionWithName:(id)a3
{
  id v4 = a3;
  SEL v5 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v6 = [v5 home];
  id v7 = [v6 backingStore];
  id v8 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  int v9 = [v7 transaction:v4 options:v8];

  return v9;
}

- (NSArray)eventPaths
{
  v2 = [(HMDMatterAccessoryAdapter *)self matterPaths];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_303_121198);

  return (NSArray *)v3;
}

BOOL __39__HMDMatterAccessoryAdapter_eventPaths__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)commandPaths
{
  v2 = [(HMDMatterAccessoryAdapter *)self matterPaths];
  BOOL v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_301_121201);

  return (NSArray *)v3;
}

BOOL __41__HMDMatterAccessoryAdapter_commandPaths__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 commandID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)attributePaths
{
  v2 = [(HMDMatterAccessoryAdapter *)self matterPaths];
  BOOL v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_299);

  return (NSArray *)v3;
}

BOOL __43__HMDMatterAccessoryAdapter_attributePaths__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 attributeID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)matterPathWithUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableArray *)self->_hmdMatterPaths hmf_firstObjectWithUUID:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSArray)matterPaths
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_hmdMatterPaths copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)supportsMTRPath:(id)a3
{
  id v4 = a3;
  SEL v5 = [(HMDMatterAccessoryAdapter *)self mtrPaths];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HMDMatterAccessoryAdapter_supportsMTRPath___block_invoke;
  v9[3] = &unk_264A1FCD8;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __45__HMDMatterAccessoryAdapter_supportsMTRPath___block_invoke()
{
  return HMFEqualObjects();
}

- (NSArray)mtrEventPaths
{
  v2 = [(HMDMatterAccessoryAdapter *)self mtrPaths];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_295_121204);

  return (NSArray *)v3;
}

id __42__HMDMatterAccessoryAdapter_mtrEventPaths__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSArray)mtrCommandPaths
{
  id v2 = [(HMDMatterAccessoryAdapter *)self mtrPaths];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_293);

  return (NSArray *)v3;
}

id __44__HMDMatterAccessoryAdapter_mtrCommandPaths__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSArray)mtrAttributePaths
{
  id v2 = [(HMDMatterAccessoryAdapter *)self mtrPaths];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_291);

  return (NSArray *)v3;
}

id __46__HMDMatterAccessoryAdapter_mtrAttributePaths__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)deviceTypesForEndpoint:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSDictionary *)self->_endpointToDeviceTypesMap objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSArray)endpoints
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSDictionary *)self->_endpointToDeviceTypesMap allKeys];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)mtrPaths
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_mtrPaths copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)invokeCommand:(id)a3 fields:(id)a4 expectedValues:(id)a5 source:(unint64_t)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  uint64_t v15 = [(HMDMatterAccessoryAdapter *)self matterDevice];

  if (v15)
  {
    id v16 = [(HMDMatterAccessoryAdapter *)self matterDevice];
    __int16 v17 = [v11 endpoint];
    id v18 = [v11 cluster];
    id v19 = [v11 command];
    id v20 = [(HMDMatterAccessoryAdapter *)self workQueue];
    [v16 invokeCommandWithEndpointID:v17 clusterID:v18 commandID:v19 commandFields:v12 expectedValues:v13 expectedValueInterval:&unk_26E4718D8 queue:v20 completion:v14];
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v24;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No matter device to invoke command to path: %@", buf, 0x16u);
    }
    __int16 v25 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    v14[2](v14, 0, v25);
  }
}

- (void)writeAttribute:(id)a3 value:(id)a4 timedWriteTimeout:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDMatterAccessoryAdapter *)self matterDevice];

  if (v14)
  {
    uint64_t v15 = [(HMDMatterAccessoryAdapter *)self matterDevice];
    id v16 = [v10 endpoint];
    __int16 v17 = [v10 cluster];
    id v18 = [v10 attribute];
    [v15 writeAttributeWithEndpointID:v16 clusterID:v17 attributeID:v18 value:v11 expectedValueInterval:&unk_26E4719B0 timedWriteTimeout:v12];

    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      int v28 = 138543874;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Did write value: %@ to path: %@", (uint8_t *)&v28, 0x20u);
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    __int16 v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      int v28 = 138543618;
      id v29 = v26;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@No matter device to write to path: %@", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v27 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v27);
  }
}

- (void)readAttribute:(id)a3 params:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(HMDMatterAccessoryAdapter *)self matterDevice];

  if (v11)
  {
    id v12 = [(HMDMatterAccessoryAdapter *)self matterDevice];
    id v13 = [v8 endpoint];
    id v14 = [v8 cluster];
    uint64_t v15 = [v8 attribute];
    id v16 = [v12 readAttributeWithEndpointID:v13 clusterID:v14 attributeID:v15 params:v9];

    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      int v26 = 138543874;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did read %@ from path: %@", (uint8_t *)&v26, 0x20u);
    }
    if (v16)
    {
      v10[2](v10, v16, 0);
    }
    else
    {
      __int16 v25 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v25);

      id v16 = 0;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      int v26 = 138543618;
      uint64_t v27 = v24;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No matter device to read from path: %@", (uint8_t *)&v26, 0x16u);
    }
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:4];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v16);
  }
}

- (void)readFromAttributePath:(id)a3 retryTimeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(HMDMatterAccessoryAdapter *)self readFromAttributePath:a3 retryTimeout:a4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout_completion___block_invoke;
  v12[3] = &unk_264A1FCB0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 then:v12];
}

uint64_t __75__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _Block_copy(*(const void **)(a1 + 32));
  SEL v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v3);
  }

  return 1;
}

- (id)readFromAttributePaths:(id)a3 retryTimeout:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    char v7 = v6;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke;
    v15[3] = &unk_264A1FC88;
    v15[4] = self;
    *(double *)&v15[5] = a4;
    id v8 = objc_msgSend(v6, "na_map:", v15);
    id v9 = [MEMORY[0x263F42538] allSettled:v8];
    id v10 = [(HMDMatterAccessoryAdapter *)self workContext];
    id v11 = [v9 inContext:v10 then:&__block_literal_global_286_121217];

    return v11;
  }
  else
  {
    uint64_t v13 = _HMFPreconditionFailure();
    return (id)__65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke(v13, v14);
  }
}

uint64_t __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readFromAttributePath:a2 retryTimeout:*(double *)(a1 + 40)];
}

uint64_t __65__HMDMatterAccessoryAdapter_readFromAttributePaths_retryTimeout___block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

- (id)readFromAttributePath:(id)a3 retryTimeout:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    char v7 = v6;
    id v8 = (void *)MEMORY[0x263F42538];
    id v9 = [(HMDMatterAccessoryAdapter *)self workContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout___block_invoke;
    v14[3] = &unk_264A1FC60;
    v14[4] = self;
    id v15 = v7;
    double v16 = a4;
    id v10 = v7;
    id v11 = [v8 inContext:v9 perform:v14];

    return v11;
  }
  else
  {
    uint64_t v13 = _HMFPreconditionFailure();
    return (id)__64__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout___block_invoke(v13);
  }
}

uint64_t __64__HMDMatterAccessoryAdapter_readFromAttributePath_retryTimeout___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _readFromAttributePath:*(void *)(a1 + 40) retryTimeout:*(double *)(a1 + 48)];
  if (v1)
  {
    id v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDMatterAccessoryAdapter *)v4 _readFromAttributePath:v6 retryTimeout:v7];
  }
}

- (id)_readFromAttributePath:(id)a3 retryTimeout:(double)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    _HMFPreconditionFailure();
  }
  double v7 = v6;
  id v8 = [(HMDMatterAccessoryAdapter *)self matterDevice];
  if (v8)
  {
    id v9 = [v7 endpointID];
    id v10 = [v7 clusterID];
    id v11 = [v7 attributeID];
    id v12 = [v8 readAttributeWithEndpointID:v9 clusterID:v10 attributeID:v11 params:0];

    uint64_t v13 = [v12 count];
    if (a4 == 0.0 || v13)
    {
      id v20 = [MEMORY[0x263F42538] futureWithValue:v12];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = self;
      double v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        __int16 v17 = HMFGetLogIdentifier();
        id v18 = [NSNumber numberWithDouble:a4];
        *(_DWORD *)buf = 138543874;
        id v29 = v17;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Attempting to retry read from %@ after %@s", buf, 0x20u);
      }
      id v19 = [MEMORY[0x263F42538] futureWithDelay:a4];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __65__HMDMatterAccessoryAdapter__readFromAttributePath_retryTimeout___block_invoke;
      v24[3] = &unk_264A1FE70;
      id v25 = v8;
      id v26 = v7;
      uint64_t v27 = v15;
      id v20 = [v19 then:v24];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x263F42538];
    __int16 v22 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
    id v20 = [v21 futureWithError:v22];
  }
  return v20;
}

uint64_t __65__HMDMatterAccessoryAdapter__readFromAttributePath_retryTimeout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  SEL v5 = [*(id *)(a1 + 40) endpointID];
  id v6 = [*(id *)(a1 + 40) clusterID];
  double v7 = [*(id *)(a1 + 40) attributeID];
  id v8 = [v4 readAttributeWithEndpointID:v5 clusterID:v6 attributeID:v7 params:0];

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 48);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 138543874;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Retried and receive response for path: %@ with result: %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v14 = (void *)MEMORY[0x263EFFA78];
  if (v8) {
    uint64_t v14 = v8;
  }
  v14;

  return 1;
}

- (id)_fetchEventPathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (id v8 = v7) != 0)
  {
    id v9 = +[HMDMatterPath PathWithAttributeID:&unk_26E471998 endpointID:v7 clusterID:v6];
    [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
    id v10 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke;
    v17[3] = &unk_264A22EA0;
    id v18 = v8;
    id v19 = v6;
    __int16 v20 = self;
    id v11 = v6;
    id v12 = v8;
    uint64_t v13 = [v10 then:v17];

    return v13;
  }
  else
  {
    id v15 = (id *)_HMFPreconditionFailure();
    return (id)__65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke(v15, v16);
  }
}

uint64_t __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke_2;
  __int16 v20 = &unk_264A1FBE8;
  id v21 = a1[4];
  id v22 = a1[5];
  SEL v5 = objc_msgSend(v4, "na_map:", &v17);
  id v9 = (void *)MEMORY[0x230FBD990](v5, v6, v7, v8);
  id v10 = a1[6];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    id v14 = a1[4];
    id v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter event paths for EP(%@)/CL(%@): %@", buf, 0x34u);
  }

  return 1;
}

id __65__HMDMatterAccessoryAdapter__fetchEventPathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  if (v4)
  {
    SEL v5 = [MEMORY[0x263F10EA0] eventPathWithEndpointID:*(void *)(a1 + 32) clusterID:*(void *)(a1 + 40) eventID:v4];
  }
  else
  {
    SEL v5 = 0;
  }

  return v5;
}

- (id)_fetchCommandPathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v8 = v7) != 0)
  {
    id v9 = +[HMDMatterPath PathWithAttributeID:&unk_26E471980 endpointID:v7 clusterID:v6];
    [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
    id v10 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke;
    v17[3] = &unk_264A22EA0;
    id v18 = v8;
    id v19 = v6;
    __int16 v20 = self;
    id v11 = v6;
    id v12 = v8;
    uint64_t v13 = [v10 then:v17];

    return v13;
  }
  else
  {
    id v15 = (id *)_HMFPreconditionFailure();
    return (id)__67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke(v15, v16);
  }
}

uint64_t __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke_2;
  __int16 v20 = &unk_264A1FBE8;
  id v21 = a1[4];
  id v22 = a1[5];
  SEL v5 = objc_msgSend(v4, "na_map:", &v17);
  id v9 = (void *)MEMORY[0x230FBD990](v5, v6, v7, v8);
  id v10 = a1[6];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    id v14 = a1[4];
    id v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter command paths for EP(%@)/CL(%@): %@", buf, 0x34u);
  }

  return 1;
}

id __67__HMDMatterAccessoryAdapter__fetchCommandPathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  if (v4)
  {
    SEL v5 = [MEMORY[0x263F10D90] commandPathWithEndpointID:*(void *)(a1 + 32) clusterID:*(void *)(a1 + 40) commandID:v4];
  }
  else
  {
    SEL v5 = 0;
  }

  return v5;
}

- (id)_fetchAttributePathsForCluster:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v8 = v7) != 0)
  {
    id v9 = +[HMDMatterPath PathWithAttributeID:&unk_26E471968 endpointID:v7 clusterID:v6];
    [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
    id v10 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v9);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke;
    v17[3] = &unk_264A22EA0;
    id v18 = v8;
    id v19 = v6;
    __int16 v20 = self;
    id v11 = v6;
    id v12 = v8;
    uint64_t v13 = [v10 then:v17];

    return v13;
  }
  else
  {
    id v15 = (id *)_HMFPreconditionFailure();
    return (id)__69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke(v15, v16);
  }
}

uint64_t __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke(id *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke_2;
  __int16 v20 = &unk_264A1FBE8;
  id v21 = a1[4];
  id v22 = a1[5];
  SEL v5 = objc_msgSend(v4, "na_map:", &v17);
  id v9 = (void *)MEMORY[0x230FBD990](v5, v6, v7, v8);
  id v10 = a1[6];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count", v17, v18, v19, v20, v21));
    id v14 = a1[4];
    id v15 = a1[5];
    *(_DWORD *)buf = 138544386;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read %@ matter attribute paths for EP(%@)/CL(%@): %@", buf, 0x34u);
  }

  return 1;
}

id __69__HMDMatterAccessoryAdapter__fetchAttributePathsForCluster_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  if (v4)
  {
    SEL v5 = [MEMORY[0x263F10C50] attributePathWithEndpointID:*(void *)(a1 + 32) clusterID:*(void *)(a1 + 40) attributeID:v4];
  }
  else
  {
    SEL v5 = 0;
  }

  return v5;
}

- (id)_fetchMatterPathsForCluster:(id)a3 endpoint:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v7 = a4;
  if (!v6 || (uint64_t v8 = v7) == 0) {
    _HMFPreconditionFailure();
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v23 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Read matter paths from EP(%@)/CL(%@)", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__121238;
  __int16 v24 = __Block_byref_object_dispose__121239;
  id v25 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = [(HMDMatterAccessoryAdapter *)v10 _fetchAttributePathsForCluster:v6 endpoint:v8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke;
  v18[3] = &unk_264A1FC38;
  id v21 = buf;
  void v18[4] = v10;
  id v14 = v6;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  int v16 = [v13 then:v18];

  _Block_object_dispose(buf, 8);
  return v16;
}

uint64_t __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v3];
  id v4 = [*(id *)(a1 + 32) _fetchCommandPathsForCluster:*(void *)(a1 + 40) endpoint:*(void *)(a1 + 48)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2;
  v10[3] = &unk_264A1FC10;
  v10[4] = *(void *)(a1 + 56);
  id v5 = [v4 then:v10];
  if (v5)
  {
    uint64_t v6 = v5;

    return 3;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2(v8, v9);
  }
}

uint64_t __66__HMDMatterAccessoryAdapter__fetchMatterPathsForCluster_endpoint___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_fetchMatterPathsForEndpoint:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching matter paths from EP(%@)", buf, 0x16u);
  }
  id v10 = +[HMDMatterPath PathWithAttributeID:&unk_26E471950 endpointID:v5 clusterID:&unk_26E471920];
  [(HMDMatterAccessoryAdapter *)v7 retryFetchTimeout];
  id v11 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](v7, "readFromAttributePath:retryTimeout:", v10);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke;
  v15[3] = &unk_264A2C760;
  v15[4] = v7;
  id v16 = v5;
  id v12 = v5;
  uint64_t v13 = [v11 then:v15];

  return v13;
}

uint64_t __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2;
  id v16 = &unk_264A1FBE8;
  id v5 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_map:", &v13);
  id v7 = objc_msgSend(MEMORY[0x263F42538], "allSettled:", v6, v13, v14, v15, v16, v17);
  id v8 = [v7 then:&__block_literal_global_265_121243];
  if (v8)
  {
    uint64_t v9 = v8;

    return 3;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return (uint64_t)__58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2(v11, v12);
  }
}

id __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) _fetchMatterPathsForCluster:v4 endpoint:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __58__HMDMatterAccessoryAdapter__fetchMatterPathsForEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  return 1;
}

- (id)_fetchDeviceTypesForEndpoints:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke;
    v13[3] = &unk_264A1FB98;
    v13[4] = self;
    uint64_t v6 = objc_msgSend(v4, "na_map:", v13);
    id v7 = [MEMORY[0x263F42538] allSettled:v6];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_3;
    v12[3] = &unk_264A2BEF0;
    void v12[4] = self;
    id v8 = [v7 then:v12];

    return v8;
  }
  else
  {
    uint64_t v10 = _HMFPreconditionFailure();
    return __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke(v10, v11);
  }
}

id __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching deviceType from EP(%@)", buf, 0x16u);
  }
  id v8 = +[HMDMatterPath PathWithAttributeID:&unk_26E471938 endpointID:v3 clusterID:&unk_26E471920];
  uint64_t v9 = *(void **)(a1 + 32);
  [v9 retryFetchTimeout];
  uint64_t v10 = objc_msgSend(v9, "_readFromAttributePath:retryTimeout:", v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_251;
  v14[3] = &unk_264A25860;
  id v15 = v3;
  id v11 = v3;
  id v12 = [v10 then:v14];

  return v12;
}

uint64_t __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_4;
  v11[3] = &unk_264A2B368;
  id v5 = v4;
  id v12 = v5;
  uint64_t v6 = (void *)MEMORY[0x230FBD990](objc_msgSend(v3, "na_each:", v11));
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Did fetch device types: %@", buf, 0x16u);
  }
  [v5 copy];

  return 1;
}

void __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_4(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_5;
  v3[3] = &unk_264A1FBC0;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_each:", v3);
}

uint64_t __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_251(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F10C30];
  id v4 = [a2 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F10B90]];

  id v11 = [v10 objectForKeyedSubscript:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
  {
    uint64_t v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_255);
    __int16 v15 = (void *)v14;
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v16 = MEMORY[0x263EFFA68];
    if (v14) {
      uint64_t v16 = v14;
    }
    v19[0] = v16;
    [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  return 1;
}

id __59__HMDMatterAccessoryAdapter__fetchDeviceTypesForEndpoints___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F10C30]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_fetchMatterPaths
{
  uint64_t v3 = +[HMDMatterPath PathWithAttributeID:&unk_26E4718F0 endpointID:&unk_26E471908 clusterID:&unk_26E471920];
  [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
  id v4 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke;
  v7[3] = &unk_264A25860;
  void v7[4] = self;
  id v5 = [v4 then:v7];

  return v5;
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", *MEMORY[0x263F10C30]);
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_121255);
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  [v6 insertObject:&unk_26E471908 atIndex:0];
  id v7 = [*(id *)(a1 + 32) _fetchDeviceTypesForEndpoints:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3;
  v14[3] = &unk_264A2C760;
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v6;
  id v8 = [v7 then:v14];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 3;

LABEL_5:
    return v10;
  }
  uint64_t v12 = _HMFPreconditionFailure();
  return __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3(v12, v13);
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), a2);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_4;
  v13[3] = &unk_264A1FB98;
  id v5 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_map:", v13);
  id v7 = [MEMORY[0x263F42538] allSettled:v6];
  id v8 = [v7 then:&__block_literal_global_240_121256];
  if (v8)
  {
    id v9 = v8;

    return 3;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_4(v11, v12);
  }
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchMatterPathsForEndpoint:a2];
}

uint64_t __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "na_arrayByFlattening");
  objc_msgSend(v2, "na_map:", &__block_literal_global_243);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __46__HMDMatterAccessoryAdapter__fetchMatterPaths__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hmf_dictionaryForKey:", *MEMORY[0x263F10B90]);
  id v3 = objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x263F10C30]);

  return v3;
}

- (id)_fetchAccessoryConfigurations
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(HMDMatterAccessoryAdapter *)self supportsRVC])
  {
    id v4 = [(HMDMatterAccessoryAdapter *)self fetchRVCConfig];
    [v3 addObject:v4];
  }
  if ([v3 count])
  {
    id v5 = [MEMORY[0x263F42538] allSettled:v3];
    id v6 = [v5 ignoreResult];
  }
  else
  {
    id v6 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v6;
}

- (id)fetchConfiguration
{
  id v3 = (void *)MEMORY[0x263F42538];
  id v4 = [(HMDMatterAccessoryAdapter *)self workContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke;
  v7[3] = &unk_264A22E78;
  void v7[4] = self;
  id v5 = [v3 inContext:v4 perform:v7];

  return v5;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) matterDevice];
  if (!v2)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil MTRDevice found", buf, 0xCu);
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 2;
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) fetchInProgress])
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      id v28 = v2;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration is in progress for device: %@", buf, 0x16u);
    }
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = 15;
LABEL_9:
    id v13 = [v7 hmErrorWithCode:v8];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v22 = 2;
    goto LABEL_17;
  }
  uint64_t v16 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setFetchInProgress:1]);
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    id v28 = v2;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration from device: %@", buf, 0x16u);
  }
  uint64_t v14 = [*(id *)(a1 + 32) _fetchMatterPaths];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_221;
  v24[3] = &unk_264A2BEF0;
  void v24[4] = *(void *)(a1 + 32);
  id v20 = [v14 then:v24];
  if (!v20) {
    _HMFPreconditionFailure();
  }
  uint64_t v21 = v20;

  uint64_t v22 = 3;
LABEL_17:

  return v22;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x263EFFA08] setWithArray:v3];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138543874;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    __int16 v24 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Fetch configuration completed with %@ matter paths: %@", buf, 0x20u);
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v4 allObjects];
  uint64_t v12 = [v10 _processAccessoryConfigurationWithPaths:v11];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_224;
  v17[3] = &unk_264A2D7C8;
  void v17[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v18 = v13;
  id v14 = [v12 then:v17];
  if (!v14) {
    _HMFPreconditionFailure();
  }
  id v15 = v14;

  return 3;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [*(id *)(a1 + 40) allObjects];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;

  os_unfair_lock_unlock(v4);
  uint64_t v8 = [*(id *)(a1 + 32) _fetchAccessoryConfigurations];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_2;
  v14[3] = &unk_264A2D7C8;
  id v9 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v9;
  id v10 = [(os_unfair_lock_s *)v8 then:v14];
  if (!v10)
  {
    id v13 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v8);
    _Unwind_Resume(v13);
  }
  uint64_t v11 = v10;

  return 3;
}

uint64_t __47__HMDMatterAccessoryAdapter_fetchConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetch configuration completed", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) setFetchInProgress:0];
  [*(id *)(a1 + 40) allObjects];
  objc_claimAutoreleasedReturnValue();

  return 1;
}

- (BOOL)useMatterPlugin
{
  id v3 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v4 = [v3 home];
  id v5 = [v4 featureDataSource];
  int v6 = [v5 isRVCEnabled];

  if (v6)
  {
    id v7 = [(HMDMatterAccessoryAdapter *)self matterAccessory];
    if (v7)
    {
      char v8 = 1;
    }
    else
    {
      [v3 supportsCHIP];
      int v9 = [v3 category];
      char v8 = canSupportNativeMatter();
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setMatterDevice:(id)a3
{
  id v4 = (MTRDevice *)a3;
  os_unfair_lock_lock_with_options();
  matterDevice = self->_matterDevice;
  self->_matterDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (MTRDevice)matterDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  matterDevice = self->_matterDevice;
  if (!matterDevice) {
    matterDevice = self->_testMatterDevice;
  }
  id v5 = matterDevice;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)accessoryServer
{
  id v3 = [(HMDMatterAccessoryAdapter *)self hapAccessory];
  id v4 = [v3 chipAccessoryServer];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(HMDMatterAccessoryAdapter *)self matterAccessory];
    id v6 = [v7 accessoryServer];
  }
  return v6;
}

- (id)matterAccessory
{
  id v2 = [(HMDMatterAccessoryAdapter *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hapAccessory
{
  id v2 = [(HMDMatterAccessoryAdapter *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (HMFAsyncContext)workContext
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDMatterAccessoryAdapter_workContext__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  if (workContext__hmf_once_t1 != -1) {
    dispatch_once(&workContext__hmf_once_t1, block);
  }
  return (HMFAsyncContext *)(id)workContext__hmf_once_v2;
}

void __40__HMDMatterAccessoryAdapter_workContext__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F42520]);
  id v5 = [*(id *)(a1 + 32) workQueue];
  uint64_t v3 = [v2 initWithQueue:v5];
  id v4 = (void *)workContext__hmf_once_v2;
  workContext__hmf_once_id v2 = v3;
}

- (HMDMatterAccessoryAdapter)initWithAccessory:(id)a3
{
  id v4 = a3;
  char v5 = [v4 conformsToProtocol:&unk_26E4FFCC0];

  if (v4 && (v5 & 1) != 0)
  {
    id v6 = [(HMDMatterAccessoryAdapter *)self init];
    id v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_accessory, v4);
      v7->_retryFetchTimeout = 20.0;
      uint64_t v8 = [v4 workQueue];
      workQueue = v7->_workQueue;
      v7->_workQueue = (OS_dispatch_queue *)v8;

      id v10 = +[HMDCoreData featuresDataSource];
      int v11 = [v10 isRVCEnabled];

      if (v11)
      {
        uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
        [v12 addObserver:v7 selector:sel_handleNotification_ name:@"HMDMatterAttributeChangedNotification" object:v4];

        id v13 = [MEMORY[0x263F08A00] defaultCenter];
        [v13 addObserver:v7 selector:sel_handleNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];
      }
    }

    return v7;
  }
  else
  {
    id v15 = (HMDMatterAccessoryAdapter *)_HMFPreconditionFailure();
    [(HMDMatterAccessoryAdapter *)v15 testSetMTRPaths:v17];
  }
  return result;
}

- (void)testSetMTRPaths:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 mutableCopy];
  mtrPaths = self->_mtrPaths;
  self->_mtrPaths = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)testSetMatterDevice:(id)a3 retryTimeout:(double)a4
{
  [(HMDMatterAccessoryAdapter *)self setTestMatterDevice:a3];
  [(HMDMatterAccessoryAdapter *)self setRetryFetchTimeout:a4];
}

- (void)testSetMatterPaths:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSMutableArray *)[v6 mutableCopy];
  hmdMatterPaths = self->_hmdMatterPaths;
  self->_hmdMatterPaths = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)executeCascadeDonationsForServiceAreaItems:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263F317A0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDMatterAccessoryAdapter_RVC__executeCascadeDonationsForServiceAreaItems___block_invoke;
  v7[3] = &unk_264A20040;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fullSetDonationWithItemType:17034 descriptors:MEMORY[0x263EFFA68] completion:v7];
}

void __77__HMDMatterAccessoryAdapter_RVC__executeCascadeDonationsForServiceAreaItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v35 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v10;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Donation rejected: %@ ", buf, 0x16u);
    }
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      id v6 = 0;
      uint64_t v14 = *(void *)v39;
      *(void *)&long long v12 = 138543618;
      long long v33 = v12;
      while (2)
      {
        uint64_t v15 = 0;
        SEL v16 = v6;
        do
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
          id v37 = v16;
          char v18 = objc_msgSend(v35, "registerItem:error:", v17, &v37, v33);
          id v6 = v37;

          id v19 = (void *)MEMORY[0x230FBD990]();
          id v20 = *(id *)(a1 + 32);
          __int16 v21 = HMFGetOSLogHandle();
          uint64_t v22 = v21;
          if ((v18 & 1) == 0)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              __int16 v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v43 = v24;
              __int16 v44 = 2112;
              uint64_t v45 = (uint64_t)v17;
              __int16 v46 = 2112;
              id v47 = v6;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to register item: %@ error: %@", buf, 0x20u);
            }

            goto LABEL_20;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            __int16 v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v33;
            v43 = v23;
            __int16 v44 = 2112;
            uint64_t v45 = (uint64_t)v17;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully registered item for Cascade donation. item=%@", buf, 0x16u);
          }
          ++v15;
          SEL v16 = v6;
        }
        while (v13 != v15);
        uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v25 = v6;

    id v36 = v6;
    char v26 = [v35 finish:&v36];
    id v6 = v36;

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    uint64_t v29 = v28;
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        uint64_t v31 = [*(id *)(a1 + 40) count];
        *(_DWORD *)buf = 138543618;
        v43 = v30;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Finished donating %lu item(s)", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v32;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v6;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to finish donation: %@", buf, 0x16u);
    }
  }
LABEL_20:
}

- (void)submitServiceAreaChangesToCascadeFromMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v6 = [v5 home];
  int v7 = [v6 isCurrentDevicePrimaryResident];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not submitting RVC service area changes to cascade from message because this is the primary resident. message=%@", buf, 0x16u);
    }
  }
  else
  {
    long long v12 = [MEMORY[0x263EFF980] array];
    uint64_t v13 = [v4 arrayForKey:@"HMDRVCServiceAreaMessageMapsKey"];
    uint64_t v14 = [v4 arrayForKey:@"HMDRVCServiceAreaMessageAreasKey"];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __79__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascadeFromMessage___block_invoke;
    v22[3] = &unk_264A28CB0;
    v22[4] = self;
    id v15 = v4;
    id v23 = v15;
    id v24 = v5;
    id v16 = v12;
    id v25 = v16;
    objc_msgSend(v13, "na_each:", v22);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __79__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascadeFromMessage___block_invoke_92;
    v19[3] = &unk_264A20018;
    v19[4] = self;
    id v20 = v15;
    id v21 = v16;
    id v17 = v16;
    objc_msgSend(v14, "na_each:", v19);
    char v18 = (void *)[v17 copy];
    [(HMDMatterAccessoryAdapter *)self executeCascadeDonationsForServiceAreaItems:v18];
  }
}

void __79__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascadeFromMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDRVCServiceAreaMessageMapIDKey");
    int v7 = objc_msgSend(v5, "hmf_stringForKey:", @"HMDRVCServiceAreaMessageMapNameKey");
    id v53 = 0;
    id v8 = (void *)[objc_alloc(MEMORY[0x263F50048]) initWithName:v7 mapIdentifier:v6 error:&v53];
    id v9 = v53;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v55 = v14;
        __int16 v56 = 2112;
        v57 = v6;
        __int16 v58 = 2112;
        v59 = v7;
        __int16 v60 = 2112;
        id v61 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade map creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);
      }
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x263F50040]);
      id v21 = [*(id *)(a1 + 48) matterNodeID];
      id v52 = 0;
      uint64_t v22 = (void *)[v20 initWithMatterDeviceIdentifier:v21 serviceArea:v8 serviceAreaType:2 error:&v52];
      id v10 = v52;

      if (v10)
      {
        id v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 32);
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          char v26 = v48 = v22;
          *(_DWORD *)buf = 138544130;
          v55 = v26;
          __int16 v56 = 2112;
          v57 = v6;
          __int16 v58 = 2112;
          v59 = v7;
          __int16 v60 = 2112;
          id v61 = v10;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade homeServiceAreaContent creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);

          uint64_t v22 = v48;
        }
      }
      else
      {
        uint64_t v49 = v22;
        id v27 = *(void **)(a1 + 32);
        __int16 v28 = CCHomeServiceAreaTypeAsString();
        id v29 = [v27 uuidForName:v28 nameID:v6];
        uint64_t v30 = [v29 UUIDString];

        id v51 = 0;
        uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F50050]) initWithSourceItemIdentifier:v30 error:&v51];
        id v32 = v51;
        if (v32)
        {
          id v10 = v32;
          __int16 v44 = v31;
          __int16 v46 = v30;
          long long v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = *(id *)(a1 + 32);
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            id v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v55 = v36;
            __int16 v56 = 2112;
            v57 = v6;
            __int16 v58 = 2112;
            v59 = v7;
            __int16 v60 = 2112;
            id v61 = v10;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade homeServiceAreaMetaContent creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);
          }
          uint64_t v30 = v46;
          uint64_t v22 = v49;
          uint64_t v31 = v44;
        }
        else
        {
          id v50 = 0;
          uint64_t v22 = v49;
          uint64_t v43 = [objc_alloc(MEMORY[0x263F31710]) initWithContent:v49 metaContent:v31 error:&v50];
          id v10 = v50;
          if (v10)
          {
            uint64_t v45 = v31;
            id v47 = v30;
            id v37 = (void *)MEMORY[0x230FBD990]();
            id v38 = *(id *)(a1 + 32);
            long long v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              long long v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v55 = v40;
              __int16 v56 = 2112;
              v57 = v6;
              __int16 v58 = 2112;
              v59 = v7;
              __int16 v60 = 2112;
              id v61 = v10;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade item instance creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);

              uint64_t v22 = v49;
            }

            uint64_t v31 = v45;
            uint64_t v30 = v47;
            long long v41 = (void *)v43;
          }
          else
          {
            v42 = *(void **)(a1 + 56);
            long long v41 = (void *)v43;
            [v42 addObject:v43];
          }
        }
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      char v18 = HMFGetLogIdentifier();
      id v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v55 = v18;
      __int16 v56 = 2112;
      v57 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade map creation from message=%@", buf, 0x16u);
    }
  }
}

void __79__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascadeFromMessage___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDRVCServiceAreaMessageAreaIDKey");
    int v7 = objc_msgSend(v5, "hmf_stringForKey:", @"HMDRVCServiceAreaMessageAreaNameKey");
    id v8 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDRVCServiceAreaMessageMapIDKey");
    id v56 = 0;
    id v9 = (void *)[objc_alloc(MEMORY[0x263F50038]) initWithName:v7 areaIdentifier:v6 associatedMapIdentifier:v8 error:&v56];
    id v10 = v56;
    if (v10)
    {
      id v11 = v10;
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v15 = v51 = v9;
        *(_DWORD *)buf = 138544386;
        __int16 v58 = v15;
        __int16 v59 = 2112;
        __int16 v60 = v6;
        __int16 v61 = 2112;
        uint64_t v62 = v7;
        __int16 v63 = 2112;
        v64 = v8;
        __int16 v65 = 2112;
        id v66 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade area creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);

        id v9 = v51;
      }
    }
    else
    {
      id v52 = v9;
      id v21 = objc_alloc(MEMORY[0x263F50040]);
      uint64_t v22 = [*(id *)(a1 + 32) accessory];
      id v23 = [v22 matterNodeID];
      id v55 = 0;
      id v24 = v21;
      id v9 = v52;
      id v50 = (void *)[v24 initWithMatterDeviceIdentifier:v23 serviceArea:v52 serviceAreaType:1 error:&v55];
      id v11 = v55;

      if (v11)
      {
        id v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = *(id *)(a1 + 32);
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int16 v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544386;
          __int16 v58 = v28;
          __int16 v59 = 2112;
          __int16 v60 = v6;
          __int16 v61 = 2112;
          uint64_t v62 = v7;
          __int16 v63 = 2112;
          v64 = v8;
          __int16 v65 = 2112;
          id v66 = v11;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade home service area content creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);

          id v9 = v52;
        }
      }
      else
      {
        id v29 = *(void **)(a1 + 32);
        uint64_t v30 = CCHomeServiceAreaTypeAsString();
        uint64_t v31 = [v29 uuidForName:v30 nameID:v6];
        id v32 = [v31 UUIDString];

        id v54 = 0;
        long long v33 = (void *)[objc_alloc(MEMORY[0x263F50050]) initWithSourceItemIdentifier:v32 error:&v54];
        id v34 = v54;
        if (v34)
        {
          id v11 = v34;
          __int16 v46 = v33;
          v48 = v32;
          id v35 = (void *)MEMORY[0x230FBD990]();
          id v36 = *(id *)(a1 + 32);
          id v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            id v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544386;
            __int16 v58 = v38;
            __int16 v59 = 2112;
            __int16 v60 = v6;
            __int16 v61 = 2112;
            uint64_t v62 = v7;
            __int16 v63 = 2112;
            v64 = v8;
            __int16 v65 = 2112;
            id v66 = v11;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade home service area meta content creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);
          }
          id v9 = v52;
          long long v33 = v46;
          id v32 = v48;
        }
        else
        {
          id v53 = 0;
          uint64_t v39 = [objc_alloc(MEMORY[0x263F31710]) initWithContent:v50 metaContent:v33 error:&v53];
          id v11 = v53;
          if (v11)
          {
            uint64_t v45 = (void *)v39;
            id v47 = v33;
            uint64_t v49 = v32;
            long long v40 = (void *)MEMORY[0x230FBD990]();
            id v41 = *(id *)(a1 + 32);
            v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              uint64_t v43 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544386;
              __int16 v58 = v43;
              __int16 v59 = 2112;
              __int16 v60 = v6;
              __int16 v61 = 2112;
              uint64_t v62 = v7;
              __int16 v63 = 2112;
              v64 = v8;
              __int16 v65 = 2112;
              id v66 = v11;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade item instance creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);
            }
            id v9 = v52;
            long long v33 = v47;
            id v32 = v49;
            __int16 v44 = v45;
          }
          else
          {
            [*(id *)(a1 + 48) addObject:v39];
            __int16 v44 = (void *)v39;
            id v9 = v52;
          }
        }
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v58 = v19;
      __int16 v59 = 2112;
      __int16 v60 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade area creation from message=%@", buf, 0x16u);
    }
  }
}

- (id)messagePayloadForServiceAreas
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDMatterAccessoryAdapter *)self rvcMaps];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_86);

  id v5 = [(HMDMatterAccessoryAdapter *)self rvcAreas];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_89_122631);

  v11[0] = @"HMDRVCServiceAreaMessageMapsKey";
  int v7 = (void *)[v4 copy];
  v11[1] = @"HMDRVCServiceAreaMessageAreasKey";
  v12[0] = v7;
  id v8 = (void *)[v6 copy];
  v12[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

id __63__HMDMatterAccessoryAdapter_RVC__messagePayloadForServiceAreas__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 areaID];
  id v4 = [v2 mapID];
  id v5 = [v2 areaInfo];

  id v6 = [v5 locationInfo];
  int v7 = [v6 locationName];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v3 forKeyedSubscript:@"HMDRVCServiceAreaMessageAreaIDKey"];
  if (v4) {
    [v8 setObject:v4 forKeyedSubscript:@"HMDRVCServiceAreaMessageMapIDKey"];
  }
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"HMDRVCServiceAreaMessageAreaNameKey"];
  }

  return v8;
}

id __63__HMDMatterAccessoryAdapter_RVC__messagePayloadForServiceAreas__block_invoke(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 mapID];
  id v4 = [v2 name];

  v7[0] = @"HMDRVCServiceAreaMessageMapIDKey";
  v7[1] = @"HMDRVCServiceAreaMessageMapNameKey";
  v8[0] = v3;
  v8[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)_forwardServiceAreaChangesToAllDevices
{
  id v3 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v4 = [(HMDMatterAccessoryAdapter *)self messagePayloadForServiceAreas];
  id v5 = [v3 home];
  id v6 = [v5 users];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HMDMatterAccessoryAdapter_RVC___forwardServiceAreaChangesToAllDevices__block_invoke;
  v9[3] = &unk_264A1FFB0;
  void v9[4] = self;
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  objc_msgSend(v6, "na_each:", v9);
}

void __72__HMDMatterAccessoryAdapter_RVC___forwardServiceAreaChangesToAllDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accountHandle];
  if (v4)
  {
    id v5 = [HMDRemoteAccountMessageDestination alloc];
    id v6 = [*(id *)(a1 + 40) messageTargetUUID];
    id v7 = [(HMDRemoteAccountMessageDestination *)v5 initWithTarget:v6 handle:v4 multicast:1];

    id v8 = objc_alloc(MEMORY[0x263F42568]);
    id v9 = (void *)[v8 initWithName:HMDRVCServiceAreaMessageName destination:v7 payload:*(void *)(a1 + 48)];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [*(id *)(a1 + 40) messageTargetUUID];
      [v3 account];
      v15 = id v24 = v10;
      [v15 identifier];
      id v16 = v25 = v7;
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending HMDRVCServiceAreaMessage to target=%@ for account=%@ with payload=%@", buf, 0x2Au);

      id v7 = v25;
      id v10 = v24;
    }
    char v18 = [*(id *)(a1 + 40) msgDispatcher];
    [v18 sendMessage:v9];
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      id v23 = [v3 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Cannot send RVC service area message because no account handle was found for user: %@", buf, 0x16u);
    }
  }
}

- (void)submitServiceAreaChangesToCascade
{
  [(HMDMatterAccessoryAdapter *)self _forwardServiceAreaChangesToAllDevices];
  id v3 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [(HMDMatterAccessoryAdapter *)self rvcMaps];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __67__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascade__block_invoke;
  v19[3] = &unk_264A1FF60;
  v19[4] = self;
  id v6 = v3;
  id v20 = v6;
  id v7 = v4;
  id v21 = v7;
  objc_msgSend(v5, "na_each:", v19);

  id v8 = [(HMDMatterAccessoryAdapter *)self rvcAreas];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __67__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascade__block_invoke_78;
  id v15 = &unk_264A1FF88;
  id v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "na_each:", &v12);

  id v11 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
  [(HMDMatterAccessoryAdapter *)self executeCascadeDonationsForServiceAreaItems:v11];
}

void __67__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascade__block_invoke(id *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 mapID];
  id v5 = [v3 name];
  id v42 = 0;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F50048]) initWithName:v5 mapIdentifier:v4 error:&v42];
  id v7 = v42;
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[4];
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v44 = v12;
      __int16 v45 = 2112;
      __int16 v46 = v4;
      __int16 v47 = 2112;
      v48 = v5;
      __int16 v49 = 2112;
      id v50 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade map creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);
    }
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F50040]);
    uint64_t v14 = [a1[5] matterNodeID];
    id v41 = 0;
    id v15 = (void *)[v13 initWithMatterDeviceIdentifier:v14 serviceArea:v6 serviceAreaType:2 error:&v41];
    id v8 = v41;

    if (v8)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = a1[4];
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        __int16 v44 = v19;
        __int16 v45 = 2112;
        __int16 v46 = v4;
        __int16 v47 = 2112;
        v48 = v5;
        __int16 v49 = 2112;
        id v50 = v8;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade homeServiceAreaContent creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);
      }
    }
    else
    {
      id v20 = a1[4];
      id v21 = CCHomeServiceAreaTypeAsString();
      uint64_t v22 = [v20 uuidForName:v21 nameID:v4];
      id v23 = [v22 UUIDString];

      id v40 = 0;
      id v24 = (void *)[objc_alloc(MEMORY[0x263F50050]) initWithSourceItemIdentifier:v23 error:&v40];
      id v25 = v40;
      if (v25)
      {
        id v8 = v25;
        id v37 = v24;
        id v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = a1[4];
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = id v35 = v23;
          *(_DWORD *)buf = 138544130;
          __int16 v44 = v29;
          __int16 v45 = 2112;
          __int16 v46 = v4;
          __int16 v47 = 2112;
          v48 = v5;
          __int16 v49 = 2112;
          id v50 = v8;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade homeServiceAreaMetaContent creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);

          id v23 = v35;
        }

        id v24 = v37;
      }
      else
      {
        id v39 = 0;
        __int16 v30 = (void *)[objc_alloc(MEMORY[0x263F31710]) initWithContent:v15 metaContent:v24 error:&v39];
        id v8 = v39;
        if (v8)
        {
          id v38 = v24;
          context = (void *)MEMORY[0x230FBD990]();
          id v31 = a1[4];
          __int16 v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v33 = v36 = v23;
            *(_DWORD *)buf = 138544130;
            __int16 v44 = v33;
            __int16 v45 = 2112;
            __int16 v46 = v4;
            __int16 v47 = 2112;
            v48 = v5;
            __int16 v49 = 2112;
            id v50 = v8;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade item instance creation with mapID=%@ mapName=%@ error=%@", buf, 0x2Au);

            id v23 = v36;
          }

          id v24 = v38;
        }
        else
        {
          [a1[6] addObject:v30];
        }
      }
    }
  }
}

void __67__HMDMatterAccessoryAdapter_RVC__submitServiceAreaChangesToCascade__block_invoke_78(id *a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 areaID];
  id v5 = [v3 mapID];
  id v6 = [v3 areaInfo];
  v48 = [v6 locationInfo];
  id v7 = [v48 locationName];
  id v52 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F50038]) initWithName:v7 areaIdentifier:v4 associatedMapIdentifier:v5 error:&v52];
  id v9 = v52;
  if (v9)
  {
    id v10 = v9;
    id v11 = v8;
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1[4];
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v15 = v46 = v6;
      *(_DWORD *)buf = 138544386;
      id v54 = v15;
      __int16 v55 = 2112;
      id v56 = v4;
      __int16 v57 = 2112;
      __int16 v58 = v7;
      __int16 v59 = 2112;
      __int16 v60 = v5;
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade area creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);

      id v6 = v46;
    }

    id v8 = v11;
  }
  else
  {
    __int16 v47 = v6;
    id v16 = objc_alloc(MEMORY[0x263F50040]);
    id v17 = [a1[5] matterNodeID];
    id v51 = 0;
    id v18 = (void *)[v16 initWithMatterDeviceIdentifier:v17 serviceArea:v8 serviceAreaType:1 error:&v51];
    id v10 = v51;

    if (v10)
    {
      uint64_t v43 = v8;
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = a1[4];
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544386;
        id v54 = v22;
        __int16 v55 = 2112;
        id v56 = v4;
        __int16 v57 = 2112;
        __int16 v58 = v7;
        __int16 v59 = 2112;
        __int16 v60 = v5;
        __int16 v61 = 2112;
        id v62 = v10;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade home service area content creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);
      }
      id v8 = v43;
      id v6 = v47;
    }
    else
    {
      id v23 = a1[4];
      id v24 = CCHomeServiceAreaTypeAsString();
      id v25 = [v23 uuidForName:v24 nameID:v4];
      uint64_t v26 = [v25 UUIDString];

      id v50 = 0;
      id v42 = (void *)v26;
      id v27 = (void *)[objc_alloc(MEMORY[0x263F50050]) initWithSourceItemIdentifier:v26 error:&v50];
      id v28 = v50;
      if (v28)
      {
        id v10 = v28;
        id v40 = v27;
        __int16 v44 = v8;
        id v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = a1[4];
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544386;
          id v54 = v32;
          __int16 v55 = 2112;
          id v56 = v4;
          __int16 v57 = 2112;
          __int16 v58 = v7;
          __int16 v59 = 2112;
          __int16 v60 = v5;
          __int16 v61 = 2112;
          id v62 = v10;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade home service area meta content creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);
        }
        id v8 = v44;
        id v6 = v47;
        id v27 = v40;
      }
      else
      {
        id v49 = 0;
        __int16 v45 = v18;
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x263F31710]) initWithContent:v18 metaContent:v27 error:&v49];
        id v10 = v49;
        id v6 = v47;
        if (v10)
        {
          id v39 = v33;
          id v41 = v27;
          uint64_t v34 = v8;
          id v35 = (void *)MEMORY[0x230FBD990]();
          id v36 = a1[4];
          id v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            id v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544386;
            id v54 = v38;
            __int16 v55 = 2112;
            id v56 = v4;
            __int16 v57 = 2112;
            __int16 v58 = v7;
            __int16 v59 = 2112;
            __int16 v60 = v5;
            __int16 v61 = 2112;
            id v62 = v10;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error for cascade item instance creation with areaID=%@ areaName=%@ mapName=%@ error=%@", buf, 0x34u);

            id v6 = v47;
          }

          id v8 = v34;
          uint64_t v33 = v39;
          id v27 = v41;
        }
        else
        {
          [a1[6] addObject:v33];
        }

        id v18 = v45;
      }
    }
  }
}

- (id)_rvcRoomForArea:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v6 = [v5 home];

  id v7 = [v4 areaInfo];
  id v8 = [v7 locationInfo];
  id v9 = [v8 locationName];

  id v10 = [v4 areaID];

  id v11 = [(HMDMatterAccessoryAdapter *)self uuidForName:v9 nameID:v10];
  uint64_t v12 = [[HMDRoom alloc] initWithName:v9 uuid:v11 home:v6];

  return v12;
}

- (id)_fetchRVCSupportedAreasFromEndpoint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = +[HMDMatterPath PathWithAttributeID:&unk_26E471A88 endpointID:v4 clusterID:&unk_26E471A58];
    [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
    id v7 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v6);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedAreasFromEndpoint___block_invoke;
    v13[3] = &unk_264A2C760;
    v13[4] = self;
    id v14 = v6;
    id v8 = v6;
    id v9 = [v7 then:v13];

    return v9;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return (id)__70__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedAreasFromEndpoint___block_invoke(v11, v12);
  }
}

uint64_t __70__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedAreasFromEndpoint___block_invoke(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Did read supported areas %@", buf, 0x16u);
  }
  v30[0] = *MEMORY[0x263F10B70];
  id v8 = [*(id *)(a1 + 40) attributePath];
  v30[1] = *MEMORY[0x263F10B90];
  v31[0] = v8;
  v31[1] = v3;
  id v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  id v23 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F10C58]) initWithResponseValue:v9 error:&v23];
  id v11 = v23;
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v10 value];
    *(_DWORD *)buf = 138543874;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Attribute report %@. Parse error: %@", buf, 0x20u);
  }
  id v17 = [v10 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  id v20 = (void *)MEMORY[0x263EFFA68];
  if (v19) {
    id v20 = v19;
  }
  id v21 = v20;

  return 1;
}

- (id)_fetchRVCSupportedMapsFromEndpoint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = +[HMDMatterPath PathWithAttributeID:&unk_26E471A70 endpointID:v4 clusterID:&unk_26E471A58];
    [(HMDMatterAccessoryAdapter *)self retryFetchTimeout];
    id v7 = -[HMDMatterAccessoryAdapter readFromAttributePath:retryTimeout:](self, "readFromAttributePath:retryTimeout:", v6);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedMapsFromEndpoint___block_invoke;
    v13[3] = &unk_264A2C760;
    v13[4] = self;
    id v14 = v6;
    id v8 = v6;
    id v9 = [v7 then:v13];

    return v9;
  }
  else
  {
    uint64_t v11 = _HMFPreconditionFailure();
    return (id)__69__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedMapsFromEndpoint___block_invoke(v11, v12);
  }
}

uint64_t __69__HMDMatterAccessoryAdapter_RVC___fetchRVCSupportedMapsFromEndpoint___block_invoke(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Did read supported maps %@", buf, 0x16u);
  }
  v30[0] = *MEMORY[0x263F10B70];
  id v8 = [*(id *)(a1 + 40) attributePath];
  v30[1] = *MEMORY[0x263F10B90];
  v31[0] = v8;
  v31[1] = v3;
  id v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  id v23 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F10C58]) initWithResponseValue:v9 error:&v23];
  id v11 = v23;
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v10 value];
    *(_DWORD *)buf = 138543874;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Attribute report %@. Parse error: %@", buf, 0x20u);
  }
  id v17 = [v10 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  id v20 = (void *)MEMORY[0x263EFFA68];
  if (v19) {
    id v20 = v19;
  }
  id v21 = v20;

  return 1;
}

- (void)_updateRVCMaps:(id)a3 areas:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v7 = a4;
  id v29 = [(HMDMatterAccessoryAdapter *)self accessory];
  id v8 = [v29 home];
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = [MEMORY[0x263EFF980] array];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  void v30[2] = __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke;
  v30[3] = &unk_264A1FF38;
  v30[4] = self;
  id v26 = v8;
  id v31 = v26;
  id v25 = v7;
  id v32 = v25;
  id v11 = v10;
  id v33 = v11;
  id v27 = v9;
  id v34 = v27;
  objc_msgSend(v28, "na_each:", v30);
  os_unfair_lock_lock_with_options();
  BOOL v12 = ![v11 isEqual:self->_rvcRooms]
     || objc_msgSend(v27, "isEqual:", self->_rvcZones, v25);
  objc_storeStrong((id *)&self->_rvcAreas, a4);
  objc_storeStrong((id *)&self->_rvcMaps, a3);
  objc_storeStrong((id *)&self->_rvcRooms, v10);
  objc_storeStrong((id *)&self->_rvcZones, v9);
  os_unfair_lock_unlock(&self->_lock);
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    id v17 = [(HMDMatterAccessoryAdapter *)v14 rvcRooms];
    id v18 = [(HMDMatterAccessoryAdapter *)v14 rvcZones];
    *(_DWORD *)buf = 138543874;
    id v36 = v16;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2112;
    id v40 = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Did update RVC Rooms: %@ and Zones %@", buf, 0x20u);
  }
  if (v12)
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v14;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v36 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating generation counter to kick off HMDAssistantGather sync", buf, 0xCu);
    }
    id v23 = [v26 homeManager];
    id v24 = [v29 uuid];
    [v23 updateGenerationCounterWithReason:@"RVC Location Change" sourceUUID:v24 shouldNotifyClients:1];

    [(HMDMatterAccessoryAdapter *)v20 submitServiceAreaChangesToCascade];
  }
}

void __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 name];
  id v6 = [v3 mapID];
  id v7 = [v4 uuidForName:v5 nameID:v6];

  id v8 = [HMDZone alloc];
  id v9 = [v3 name];
  id v10 = [(HMDZone *)v8 initWithName:v9 uuid:v7 home:*(void *)(a1 + 40)];

  id v11 = *(void **)(a1 + 48);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_2;
  v19[3] = &unk_264A1FEE8;
  id v20 = v3;
  id v12 = v3;
  id v13 = objc_msgSend(v11, "na_filter:", v19);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_3;
  v18[3] = &unk_264A1FF10;
  void v18[4] = *(void *)(a1 + 32);
  id v14 = objc_msgSend(v13, "na_map:", v18);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_4;
  v16[3] = &unk_264A25258;
  id v17 = v10;
  id v15 = v10;
  objc_msgSend(v14, "na_each:", v16);
  [*(id *)(a1 + 56) addObjectsFromArray:v14];
  [*(id *)(a1 + 64) addObject:v15];
}

uint64_t __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 mapID];
  id v4 = [*(id *)(a1 + 32) mapID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _rvcRoomForArea:a2];
}

uint64_t __55__HMDMatterAccessoryAdapter_RVC___updateRVCMaps_areas___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRoomIfNotPresent:a2];
}

- (id)_fetchRVCConfigForEndpoint:(id)a3 rvcMaps:(id)a4 rvcAreas:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching RVC config for endpoint: %@", buf, 0x16u);
  }
  id v15 = [(HMDMatterAccessoryAdapter *)v12 _fetchRVCSupportedMapsFromEndpoint:v8];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__HMDMatterAccessoryAdapter_RVC___fetchRVCConfigForEndpoint_rvcMaps_rvcAreas___block_invoke;
  v21[3] = &unk_264A1FEC0;
  v21[4] = v12;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = [v15 then:v21];

  return v19;
}

uint64_t __78__HMDMatterAccessoryAdapter_RVC___fetchRVCConfigForEndpoint_rvcMaps_rvcAreas___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetched RVC endpoint: %@ supported maps: %@", buf, 0x20u);
  }
  if (v3) {
    [*(id *)(a1 + 48) addObjectsFromArray:v3];
  }
  id v9 = [*(id *)(a1 + 32) _fetchRVCSupportedAreasFromEndpoint:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HMDMatterAccessoryAdapter_RVC___fetchRVCConfigForEndpoint_rvcMaps_rvcAreas___block_invoke_51;
  v14[3] = &unk_264A1FE98;
  id v10 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v10;
  id v16 = *(id *)(a1 + 56);
  id v11 = [v9 then:v14];
  if (!v11) {
    _HMFPreconditionFailure();
  }
  id v12 = v11;

  return 3;
}

uint64_t __78__HMDMatterAccessoryAdapter_RVC___fetchRVCConfigForEndpoint_rvcMaps_rvcAreas___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetched RVC endpoint: %@ supported areas: %@", (uint8_t *)&v10, 0x20u);
  }
  if (v3) {
    [*(id *)(a1 + 48) addObjectsFromArray:v3];
  }

  return 1;
}

- (id)fetchRVCConfig
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(HMDMatterAccessoryAdapter *)self mtrPaths];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_41_122671);
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x263EFFA68];
  }
  int v10 = [v5 setWithArray:v9];

  id v11 = [v10 allObjects];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_45;
  v25[3] = &unk_264A1FE48;
  v25[4] = self;
  id v12 = v3;
  id v26 = v12;
  id v13 = v4;
  id v27 = v13;
  __int16 v14 = objc_msgSend(v11, "na_map:", v25);

  if ([v14 count])
  {
    id v15 = [MEMORY[0x263F42538] allSettled:v14];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_49;
    v22[3] = &unk_264A1FE70;
    v22[4] = self;
    id v23 = v12;
    id v24 = v13;
    uint64_t v16 = [v15 then:v22];
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@No endpoints to fetch RVC config", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v16;
}

id __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F42538];
  id v5 = [*(id *)(a1 + 32) workContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_2;
  v10[3] = &unk_264A2BEA0;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = [v4 inContext:v5 perform:v10];

  return v8;
}

uint64_t __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_49(uint64_t a1)
{
  return 1;
}

uint64_t __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _fetchRVCConfigForEndpoint:*(void *)(a1 + 40) rvcMaps:*(void *)(a1 + 48) rvcAreas:*(void *)(a1 + 56)];
  if (v1)
  {
    id v2 = v1;

    return 3;
  }
  else
  {
    uint64_t v4 = _HMFPreconditionFailure();
    return __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke(v4);
  }
}

id __48__HMDMatterAccessoryAdapter_RVC__fetchRVCConfig__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 cluster];
  if ([v3 isEqualToNumber:&unk_26E471A58])
  {
    uint64_t v4 = [v2 endpoint];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)uuidForName:(id)a3 nameID:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@-%@", a3, a4];
  id v6 = (void *)MEMORY[0x263F08C38];
  id v7 = [(HMDMatterAccessoryAdapter *)self accessory];
  uint64_t v8 = [v7 uuid];
  uint64_t v9 = [v5 dataUsingEncoding:4];
  int v10 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v8, v9);

  return v10;
}

- (NSArray)rvcAreas
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_rvcAreas;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)rvcMaps
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_rvcMaps;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)rvcZones
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_rvcZones;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)rvcRooms
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_rvcRooms;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsRVC
{
  id v2 = [(HMDMatterAccessoryAdapter *)self endpointToDeviceTypesMap];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_122678);

  return v3;
}

uint64_t __45__HMDMatterAccessoryAdapter_RVC__supportsRVC__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_31_122680);
}

uint64_t __45__HMDMatterAccessoryAdapter_RVC__supportsRVC__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToNumber:&unk_26E471A40];
}

@end