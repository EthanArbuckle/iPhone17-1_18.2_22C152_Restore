@interface HMDCoordinationLocalElectionMeshController
+ (id)logCategory;
- (BOOL)isLeader;
- (BOOL)isProcessing;
- (HMDCoordinationLocalElectionMeshController)initWithQueue:(id)a3;
- (HMDLocalElectionMeshControllerDelegate)delegate;
- (HMDLocalElectionMeshNode)leaderNode;
- (NSArray)meshNodes;
- (id)debugDescriptionForControllerType;
- (id)debugDescriptionForMeshState;
- (id)logIdentifier;
- (id)meshNodeFor:(id)a3;
- (void)_setupMessageRegistrations;
- (void)meshControllerDidElectLeader;
- (void)meshControllerDidStartElection;
- (void)meshControllerDidUpdatesNodes;
- (void)sendPingCommandToLeaderWithCompletion:(id)a3;
- (void)sendPingNotificationToFollowersWithPrimaryResident:(id)a3;
- (void)sendPingRequestToNode:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startMeshWithName:(id)a3;
- (void)stop;
@end

@implementation HMDCoordinationLocalElectionMeshController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMDLocalElectionMeshControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDLocalElectionMeshControllerDelegate *)WeakRetained;
}

- (void)meshControllerDidUpdatesNodes
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCoordinationLocalElectionMeshController *)self delegate];
  [v4 meshControllerDidUpdatesNodes:self];
}

- (void)meshControllerDidStartElection
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCoordinationLocalElectionMeshController *)self delegate];
  [v4 meshControllerDidStartElection:self];
}

- (void)meshControllerDidElectLeader
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCoordinationLocalElectionMeshController *)self delegate];
  [v4 meshControllerDidElectLeader:self];
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(COMeshController *)self meshName];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)debugDescriptionForMeshState
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(COMeshController *)self state];
  if (v4 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%d)", -[COMeshController state](self, "state"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_264A29660[v4];
  }
  return v5;
}

- (id)debugDescriptionForControllerType
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(COMeshController *)self me];
  uint64_t v5 = [v4 type];

  switch(v5)
  {
    case 61440:
      v6 = @"LongLived";
      break;
    case 4096:
      v6 = @"Permanent";
      break;
    case -1:
      v6 = @"Ephemeral";
      break;
    default:
      v7 = NSString;
      v8 = [(COMeshController *)self me];
      objc_msgSend(v7, "stringWithFormat:", @"Unknown(%llu)", objc_msgSend(v8, "type"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v6;
}

- (NSArray)meshNodes
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v7.receiver = self;
  v7.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  unint64_t v4 = [(COMeshController *)&v7 nodes];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_22_228707);

  return (NSArray *)v5;
}

HMDCoordinationLocalElectionMeshNode *__55__HMDCoordinationLocalElectionMeshController_meshNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDCoordinationLocalElectionMeshNode alloc] initWithMeshNode:v2];

  return v3;
}

- (HMDLocalElectionMeshNode)leaderNode
{
  v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v9.receiver = self;
  v9.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  unint64_t v4 = [(COMeshController *)&v9 nodes];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCoordinationLocalElectionMeshController_leaderNode__block_invoke;
  v8[3] = &unk_264A295F8;
  v8[4] = self;
  uint64_t v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  v6 = [[HMDCoordinationLocalElectionMeshNode alloc] initWithMeshNode:v5];
  return (HMDLocalElectionMeshNode *)v6;
}

uint64_t __56__HMDCoordinationLocalElectionMeshController_leaderNode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 leader];
  uint64_t v5 = [v3 remote];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (BOOL)isProcessing
{
  id v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  return [(COMeshController *)self state] == 3;
}

- (BOOL)isLeader
{
  id v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(COMeshController *)self leader];
  uint64_t v5 = [(COMeshController *)self me];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (void)sendPingRequestToNode:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  objc_super v9 = [(HMDCoordinationLocalElectionMeshController *)self meshNodeFor:v6];
  if (v9)
  {
    v10 = objc_alloc_init(HMDCoordinationPingRequest);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __83__HMDCoordinationLocalElectionMeshController_sendPingRequestToNode_withCompletion___block_invoke;
    v15[3] = &unk_264A29620;
    id v16 = v7;
    [(COMeshController *)self sendRequest:v10 toPeer:v9 withCompletionHandler:v15];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find the destination node to send the ping request", buf, 0xCu);
    }
  }
}

uint64_t __83__HMDCoordinationLocalElectionMeshController_sendPingRequestToNode_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)meshNodeFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  v12.receiver = self;
  v12.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  id v6 = [(COMeshController *)&v12 nodes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__HMDCoordinationLocalElectionMeshController_meshNodeFor___block_invoke;
  v10[3] = &unk_264A295F8;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __58__HMDCoordinationLocalElectionMeshController_meshNodeFor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 idsIdentifier];
  uint64_t v5 = [v3 IDSIdentifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)sendPingNotificationToFollowersWithPrimaryResident:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [[HMDCoordinationPingNotification alloc] initWithPrimaryResidentUUID:v4];
  [(COMeshController *)self sendNotification:v6];
}

- (void)sendPingCommandToLeaderWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_alloc_init(HMDCoordinationPingCommand);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HMDCoordinationLocalElectionMeshController_sendPingCommandToLeaderWithCompletion___block_invoke;
  v8[3] = &unk_264A295D0;
  id v9 = v4;
  id v7 = v4;
  [(COMeshController *)self sendCommand:v6 withCompletionHandler:v8];
}

uint64_t __84__HMDCoordinationLocalElectionMeshController_sendPingCommandToLeaderWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stop
{
  id v3 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  [(COMeshController *)&v4 stop];
}

- (void)startMeshWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(COMeshController *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  [(COMeshController *)self setMeshName:v4];
  [(COMeshController *)self start];
}

- (void)_setupMessageRegistrations
{
  objc_initWeak(&location, self);
  [(COMeshController *)self registerHandler:&__block_literal_global_228781 forCommandClass:objc_opt_class()];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_2;
  v6[3] = &unk_264A29580;
  objc_copyWeak(&v7, &location);
  [(COMeshController *)self registerHandler:v6 forNotificationClass:objc_opt_class()];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_3;
  v4[3] = &unk_264A295A8;
  objc_copyWeak(&v5, &location);
  [(COMeshController *)self registerHandler:v4 forRequestClass:objc_opt_class()];
  id v3 = objc_alloc_init(HMDCoordinationAddOnImpl);
  [(HMDCoordinationAddOnImpl *)v3 setDelegate:self];
  [(COMeshController *)self addAddOn:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = [WeakRetained delegate];
    v8 = [v6 primaryResidentUUID];

    [v7 meshController:WeakRetained didReceivePingFromLeaderWithPrimaryResidentUUID:v8];
  }
}

void __72__HMDCoordinationLocalElectionMeshController__setupMessageRegistrations__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to ping request", (uint8_t *)&v13, 0xCu);
    }
    objc_super v12 = objc_alloc_init(HMDCoordinationPingResponse);
    v6[2](v6, v12, 0);
  }
}

- (HMDCoordinationLocalElectionMeshController)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F42608] sharedPreferences];
  id v6 = [v5 preferenceForKey:@"meshElectionConstituentType"];
  id v7 = [v6 numberValue];

  if (v7) {
    uint64_t v8 = [v7 unsignedLongLongValue];
  }
  else {
    uint64_t v8 = 4096;
  }
  v12.receiver = self;
  v12.super_class = (Class)HMDCoordinationLocalElectionMeshController;
  id v9 = [(COMeshController *)&v12 initWithConstituentType:v8];
  v10 = v9;
  if (v9)
  {
    [(COMeshController *)v9 setDispatchQueue:v4];
    [(HMDCoordinationLocalElectionMeshController *)v10 _setupMessageRegistrations];
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_228808 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_228808, &__block_literal_global_59_228809);
  }
  id v2 = (void *)logCategory__hmf_once_v4_228810;
  return v2;
}

void __57__HMDCoordinationLocalElectionMeshController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_228810;
  logCategory__hmf_once_v4_228810 = v0;
}

@end