@interface HMDPrimaryElectionCoordinationAddOn
+ (id)logCategory;
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3;
- (BOOL)electionGotAborted;
- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3;
- (HMDLocalElectionMeshNode)lastKnownLeaderNode;
- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3;
- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3 meshController:(id)a4 dataSource:(id)a5;
- (HMDPrimaryElectionCoordinationAddOnDataSource)dataSource;
- (HMDPrimaryElectionFindPrimaryMeshOperation)findPrimaryMeshOperation;
- (HMDPrimaryResidentElectionAddOnDelegate)delegate;
- (HMDRemoteDeviceMonitor)remoteDeviceMonitor;
- (HMDResidentDeviceManagerContext)context;
- (HMFFuture)findPrimaryMeshFuture;
- (HMFTimer)activeNodesUpdateDebounceTimer;
- (HMFTimer)debounceTimer;
- (HMFTimer)meshLeaderToPrimaryResidentPingResponseTimer;
- (HMFTimer)pingTimer;
- (HMFTimer)secondaryMeshTimer;
- (NSSet)lastEvaluatedMeshNodes;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (__HMDPrimaryElectionCandidate)candidateRepresentation;
- (__HMDPrimaryElectionCandidate)selectedPrimaryResidentCandidate;
- (dispatch_queue_t)_anotherNodeBecameLeader;
- (dispatch_queue_t)_doesLocalMeshContainPrimaryResident:(dispatch_queue_t *)result;
- (id)_consensusPrimaryFromResidentCandidates:(uint64_t)a1;
- (id)_createDebounceTimerWithInterval:(void *)a1;
- (id)_meshNodesToResidentDevices;
- (id)_retrievePrimaryMeshInformationWithContext:(void *)a3 otherResidents:;
- (id)dumpState;
- (id)logIdentifier;
- (id)meshLeaderResidentDevice;
- (id)meshNodeForResident:(uint64_t)a1;
- (id)primarySortComparatorForCurrentPrimary:(id)a3;
- (id)residentDevicesNotFoundInMesh;
- (id)residentsInMesh;
- (int64_t)inPessimisticSecondaryMesh;
- (uint64_t)_currentStateRequiresElection;
- (uint64_t)_doesLocalMeshContainPrimaryResident:(void *)a3 meshCandidates:;
- (uint64_t)_expectState:(void *)a3 action:;
- (uint64_t)_handlePrimaryResidentPingFailed;
- (uint64_t)_maybeNotifyDelegateUpdatedPrimary:(void *)a3 currentPrimary:;
- (unint64_t)coordinationUpdateElectionTriggerReason;
- (unint64_t)messageTransportRestriction;
- (unint64_t)residentCountDuringLastElection;
- (unint64_t)state;
- (void)_clearPessimisticMeshState;
- (void)_determineIfPrimaryMesh;
- (void)_didBecomeLeaderAndPerformElection:(uint64_t)a1;
- (void)_doMetaMeshElection;
- (void)_findPrimaryMeshWithContext:(id)a3 otherResidents:(id)a4;
- (void)_maybeStartPingTimer;
- (void)_pingPrimaryResident;
- (void)_requestElectionParametersFromCandidates:(void *)a3 completionHandler:;
- (void)_selectPrimaryResidentFromCandidates:(void *)a3 meshCandidates:(void *)a4 meshCandidateNodes:(void *)a5 context:(uint64_t)a6 electionTriggerReason:;
- (void)_selectPrimaryResidentWithReason:(unint64_t)a3;
- (void)_startSecondaryMeshTimer;
- (void)_stopBeingLeader;
- (void)_stopSecondaryMeshTimer;
- (void)createMissingResidentDevicesFromMeshNodes:(void *)a1;
- (void)handleCurrentPrimaryNotification:(id)a3;
- (void)handleCurrentPrimaryRequest:(id)a3;
- (void)handleDeviceCapabilitiesRequest:(id)a3;
- (void)handleMeshInformationRequest:(id)a3;
- (void)handleSetPreferredPrimaryDebugRequest:(id)a3;
- (void)meshController:(id)a3 didReceivePingFromLeaderWithPrimaryResidentUUID:(id)a4;
- (void)meshControllerDidElectLeader:(id)a3;
- (void)meshControllerDidStartElection:(id)a3;
- (void)meshControllerDidUpdatesNodes:(id)a3;
- (void)performElection;
- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4;
- (void)registerForMessages;
- (void)resumeDebounceWithInterval:(void *)a1;
- (void)selectPrimaryResidentWithReason:(unint64_t)a3;
- (void)sendNewPrimaryNotification:(void *)a3 to:;
- (void)setActiveNodesUpdateDebounceTimer:(id)a3;
- (void)setCoordinationUpdateElectionTriggerReason:(unint64_t)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElectionGotAborted:(BOOL)a3;
- (void)setFindPrimaryMeshFuture:(id)a3;
- (void)setFindPrimaryMeshOperation:(id)a3;
- (void)setInPessimisticSecondaryMesh:(int64_t)a3;
- (void)setLastEvaluatedMeshNodes:(id)a3;
- (void)setLastKnownLeaderNode:(id)a3;
- (void)setMeshLeaderToPrimaryResidentPingResponseTimer:(id)a3;
- (void)setPingTimer:(id)a3;
- (void)setResidentCountDuringLastElection:(unint64_t)a3;
- (void)setSecondaryMeshTimer:(id)a3;
- (void)setSelectedPrimaryResidentCandidate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDPrimaryElectionCoordinationAddOn

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvaluatedMeshNodes, 0);
  objc_storeStrong((id *)&self->_selectedPrimaryResidentCandidate, 0);
  objc_storeStrong((id *)&self->_lastKnownLeaderNode, 0);
  objc_storeStrong((id *)&self->_asyncContext, 0);
  objc_storeStrong((id *)&self->_remoteDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_findPrimaryMeshFuture, 0);
  objc_storeStrong((id *)&self->_findPrimaryMeshOperation, 0);
  objc_storeStrong((id *)&self->_meshLeaderToPrimaryResidentPingResponseTimer, 0);
  objc_storeStrong((id *)&self->_secondaryMeshTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_pingTimer, 0);
  objc_storeStrong((id *)&self->_activeNodesUpdateDebounceTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meshController, 0);
}

- (void)setElectionGotAborted:(BOOL)a3
{
  self->_electionGotAborted = a3;
}

- (BOOL)electionGotAborted
{
  return self->_electionGotAborted;
}

- (void)setLastEvaluatedMeshNodes:(id)a3
{
}

- (NSSet)lastEvaluatedMeshNodes
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSelectedPrimaryResidentCandidate:(id)a3
{
}

- (__HMDPrimaryElectionCandidate)selectedPrimaryResidentCandidate
{
  return (__HMDPrimaryElectionCandidate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCoordinationUpdateElectionTriggerReason:(unint64_t)a3
{
  self->_coordinationUpdateElectionTriggerReason = a3;
}

- (unint64_t)coordinationUpdateElectionTriggerReason
{
  return self->_coordinationUpdateElectionTriggerReason;
}

- (void)setInPessimisticSecondaryMesh:(int64_t)a3
{
  self->_inPessimisticSecondaryMesh = a3;
}

- (int64_t)inPessimisticSecondaryMesh
{
  return self->_inPessimisticSecondaryMesh;
}

- (void)setLastKnownLeaderNode:(id)a3
{
}

- (HMDLocalElectionMeshNode)lastKnownLeaderNode
{
  return (HMDLocalElectionMeshNode *)objc_getProperty(self, a2, 144, 1);
}

- (HMDRemoteDeviceMonitor)remoteDeviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFindPrimaryMeshFuture:(id)a3
{
}

- (HMFFuture)findPrimaryMeshFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFindPrimaryMeshOperation:(id)a3
{
}

- (HMDPrimaryElectionFindPrimaryMeshOperation)findPrimaryMeshOperation
{
  return (HMDPrimaryElectionFindPrimaryMeshOperation *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMeshLeaderToPrimaryResidentPingResponseTimer:(id)a3
{
}

- (HMFTimer)meshLeaderToPrimaryResidentPingResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSecondaryMeshTimer:(id)a3
{
}

- (HMFTimer)secondaryMeshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (HMDPrimaryElectionCoordinationAddOnDataSource)dataSource
{
  return (HMDPrimaryElectionCoordinationAddOnDataSource *)objc_getProperty(self, a2, 88, 1);
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (void)setResidentCountDuringLastElection:(unint64_t)a3
{
  self->_residentCountDuringLastElection = a3;
}

- (unint64_t)residentCountDuringLastElection
{
  return self->_residentCountDuringLastElection;
}

- (void)setPingTimer:(id)a3
{
}

- (HMFTimer)pingTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActiveNodesUpdateDebounceTimer:(id)a3
{
}

- (HMFTimer)activeNodesUpdateDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebounceTimer:(id)a3
{
}

- (HMFTimer)debounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDPrimaryResidentElectionAddOnDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPrimaryResidentElectionAddOnDelegate *)WeakRetained;
}

- (id)dumpState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__250139;
  v10 = __Block_byref_object_dispose__250140;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke;
  v5[3] = &unk_264A2F0A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke(uint64_t a1)
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = @"Leader";
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) leaderNode];
  uint64_t v3 = [v2 description];
  v4 = (void *)v3;
  v5 = @"<no leader>";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v18[0] = v5;
  v17[1] = @"Nodes";
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) meshNodes];
  uint64_t v7 = [v6 description];
  uint64_t v8 = (void *)v7;
  v9 = @"<no nodes>";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v18[1] = v9;
  v17[2] = @"Missing Residents";
  v10 = -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh](*(void *)(a1 + 32));
  id v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_126_250146);
  v18[2] = v11;
  v17[3] = @"State";
  unint64_t v12 = [*(id *)(a1 + 32) state];
  if (v12 > 5) {
    v13 = @"<unknown state>";
  }
  else {
    v13 = off_264A2C810[v12];
  }
  v18[3] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (id)residentDevicesNotFoundInMesh
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v2 = [(id)a1 context];
    uint64_t v3 = [v2 availableResidentDevices];
    v4 = (void *)[v3 mutableCopy];

    v5 = [v2 currentResidentDevice];
    [v4 removeObject:v5];

    uint64_t v6 = [*(id *)(a1 + 8) meshNodes];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__HMDPrimaryElectionCoordinationAddOn_residentDevicesNotFoundInMesh__block_invoke;
    v13[3] = &unk_264A2C4F0;
    id v14 = v4;
    id v7 = v4;
    uint64_t v8 = objc_msgSend(v6, "na_map:", v13);

    v9 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v7];
    v10 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v8];
    id v11 = objc_msgSend(v9, "hmf_removedObjectsFromSet:", v10);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

uint64_t __48__HMDPrimaryElectionCoordinationAddOn_dumpState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __68__HMDPrimaryElectionCoordinationAddOn_residentDevicesNotFoundInMesh__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", a2);
}

- (id)logIdentifier
{
  v2 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  uint64_t v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDPrimaryElectionCoordinationAddOn *)self debounceTimer];

  if (v5 == v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      unint64_t v20 = [(HMDPrimaryElectionCoordinationAddOn *)v17 state];
      if (v20 > 5) {
        v21 = @"<unknown state>";
      }
      else {
        v21 = off_264A2C810[v20];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Debounce expired, current state = %{public}@", buf, 0x16u);
    }
    if ([(HMDLocalElectionMeshController *)v17->_meshController isLeader])
    {
      switch([(HMDPrimaryElectionCoordinationAddOn *)v17 state])
      {
        case 0uLL:
          v64 = (HMDPrimaryElectionCoordinationAddOn *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:self->_queue];
          v67 = [(HMDPrimaryElectionCoordinationAddOn *)v17 context];
          v68 = [v67 firstPrimaryResidentDiscoveryAttemptCompletionFuture];
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke;
          v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_264A2C4A0;
          v119 = v17;
          v116[0] = MEMORY[0x263EF8330];
          v116[1] = 3221225472;
          v116[2] = __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke_2;
          v116[3] = &unk_264A2C4C8;
          v116[4] = v17;
          id v69 = (id)[v68 inContext:v64 then:buf orRecover:v116];
          goto LABEL_75;
        case 1uLL:
        case 3uLL:
        case 5uLL:
          v34 = (void *)MEMORY[0x230FBD990]();
          v35 = v17;
          v36 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
            goto LABEL_68;
          }
          v37 = HMFGetLogIdentifier();
          unint64_t v38 = [(HMDPrimaryElectionCoordinationAddOn *)v35 state];
          if (v38 > 5) {
            v39 = @"<unknown state>";
          }
          else {
            v39 = off_264A2C810[v38];
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          v40 = "%{public}@Primary resident election or mesh change cannot be kicked off while in the state %{public}@";
          v65 = v36;
          uint32_t v66 = 22;
          goto LABEL_67;
        case 2uLL:
          [(HMDPrimaryElectionCoordinationAddOn *)v17 _selectPrimaryResidentWithReason:[(HMDPrimaryElectionCoordinationAddOn *)v17 coordinationUpdateElectionTriggerReason]];
          goto LABEL_99;
        case 4uLL:
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v17);
          v64 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
          v70 = [(HMDPrimaryElectionCoordinationAddOn *)v17 context];
          v67 = [v70 primaryResidentDevice];

          if (v64 && ([(HMDPrimaryElectionCoordinationAddOn *)v64 hmf_isEmpty] & 1) == 0 && v67)
          {
            v71 = (void *)MEMORY[0x230FBD990]();
            v72 = v17;
            v73 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              v74 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v74;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v118 = v64;
              _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_INFO, "%{public}@Broadcasting the current primary %@ to nodes %{public}@", buf, 0x20u);
            }
            -[HMDPrimaryElectionCoordinationAddOn sendNewPrimaryNotification:to:]((dispatch_queue_t *)v72, v67, v64);
          }
          goto LABEL_76;
        default:
          goto LABEL_99;
      }
    }
    v34 = (void *)MEMORY[0x230FBD990]();
    v35 = v17;
    v36 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
      goto LABEL_68;
    }
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v37;
    v40 = "%{public}@Ignoring debounce timer fire because we're no longer leader";
    goto LABEL_45;
  }
  id v6 = [(HMDPrimaryElectionCoordinationAddOn *)self pingTimer];

  if (v6 == v4)
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      unint64_t v26 = [(HMDPrimaryElectionCoordinationAddOn *)v23 state];
      if (v26 > 5) {
        v27 = @"<unknown state>";
      }
      else {
        v27 = off_264A2C810[v26];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Ping timer fired, current state = %{public}@", buf, 0x16u);
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if ([(HMDPrimaryElectionCoordinationAddOn *)v23 state] == 2
      || [(HMDPrimaryElectionCoordinationAddOn *)v23 state] == 4)
    {
      if (![(HMDLocalElectionMeshController *)v23->_meshController isLeader])
      {
        v57 = (void *)MEMORY[0x230FBD990]();
        v58 = v23;
        v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v60;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Ping timer expired and we haven't heard from the leader. Sending a ping command to the leader", buf, 0xCu);
        }
        v61 = [(HMDPrimaryElectionCoordinationAddOn *)v58 pingTimer];
        [v61 suspend];

        v62 = [(HMDPrimaryElectionCoordinationAddOn *)v58 pingTimer];
        meshController = v23->_meshController;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __68__HMDPrimaryElectionCoordinationAddOn__handlePingTimerExpiredAsNode__block_invoke;
        v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_264A2F370;
        v119 = v58;
        v120 = v62;
        v64 = v62;
        [(HMDLocalElectionMeshController *)meshController sendPingCommandToLeaderWithCompletion:buf];

LABEL_77:
        goto LABEL_99;
      }
      v47 = [(HMDPrimaryElectionCoordinationAddOn *)v23 context];
      v48 = v47;
      if (!v47)
      {
LABEL_98:

        goto LABEL_99;
      }
      v49 = [v47 primaryResidentDevice];
      v50 = (void *)MEMORY[0x230FBD990]();
      v51 = v23;
      v52 = HMFGetOSLogHandle();
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v49)
      {
        if (v53)
        {
          v54 = HMFGetLogIdentifier();
          unint64_t v55 = [(HMDPrimaryElectionCoordinationAddOn *)v51 state];
          v115 = v48;
          if (v55 > 5) {
            v56 = @"<unknown state>";
          }
          else {
            v56 = off_264A2C810[v55];
          }
          [v49 shortDescription];
          v83 = v49;
          v84 = (HMDPrimaryElectionCoordinationAddOn *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2114;
          v118 = v84;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@We are the leader in state: %{public}@. Sending periodic ping notification to followers with primary resident: %{public}@", buf, 0x20u);

          v49 = v83;
          v48 = v115;
        }

        v85 = v23->_meshController;
        v86 = [v49 identifier];
        [(HMDLocalElectionMeshController *)v85 sendPingNotificationToFollowersWithPrimaryResident:v86];

        if ([(HMDPrimaryElectionCoordinationAddOn *)v51 state] != 2) {
          goto LABEL_97;
        }
        v87 = [v48 currentResidentDevice];
        int v88 = [v49 isEqual:v87];

        if (!v88)
        {
          v93 = v49;
          id v94 = v49;
          v95 = -[HMDPrimaryElectionCoordinationAddOn meshNodeForResident:]((uint64_t)v51, v94);
          v96 = (void *)MEMORY[0x230FBD990]();
          v97 = v51;
          v98 = HMFGetOSLogHandle();
          v99 = v98;
          if (v95)
          {
            id v114 = v94;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              v100 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v100;
              _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_INFO, "%{public}@We are the leader. Sending periodic ping request to the primary resident", buf, 0xCu);
            }
            v101 = [(HMDPrimaryElectionCoordinationAddOn *)v97 meshLeaderToPrimaryResidentPingResponseTimer];
            [v101 suspend];

            v102 = [(HMDPrimaryElectionCoordinationAddOn *)v97 dataSource];
            v103 = v102;
            if (v102)
            {
              uint64_t v104 = [v102 createPingResponseTimerWithInterval:0 options:20.0];
            }
            else
            {
              uint64_t v104 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:20.0];
            }
            v107 = (void *)v104;

            [(HMDPrimaryElectionCoordinationAddOn *)v97 setMeshLeaderToPrimaryResidentPingResponseTimer:v107];
            v108 = [(HMDPrimaryElectionCoordinationAddOn *)v97 meshLeaderToPrimaryResidentPingResponseTimer];
            [v108 setDelegate:v97];

            queue = self->_queue;
            v110 = [(HMDPrimaryElectionCoordinationAddOn *)v97 meshLeaderToPrimaryResidentPingResponseTimer];
            [v110 setDelegateQueue:queue];

            v111 = [(HMDPrimaryElectionCoordinationAddOn *)v97 meshLeaderToPrimaryResidentPingResponseTimer];
            [(HMDPrimaryElectionCoordinationAddOn *)v111 resume];
            v112 = v23->_meshController;
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __72__HMDPrimaryElectionCoordinationAddOn_sendPingRequestToPrimaryResident___block_invoke;
            v118 = (HMDPrimaryElectionCoordinationAddOn *)&unk_264A2F370;
            v119 = v111;
            v120 = v97;
            v113 = v111;
            [(HMDLocalElectionMeshController *)v112 sendPingRequestToNode:v95 withCompletion:buf];

            id v94 = v114;
          }
          else
          {
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              v105 = HMFGetLogIdentifier();
              v106 = [v94 shortDescription];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v105;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v106;
              _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_ERROR, "%{public}@Not sending the ping request. Unable to find the mesh node for primary resident %{public}@", buf, 0x16u);
            }
          }

          v49 = v93;
          goto LABEL_97;
        }
        uint64_t v89 = MEMORY[0x230FBD990]();
        v90 = v51;
        v91 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          v92 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v92;
          _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_INFO, "%{public}@Not sending the ping request. We are the primary resident.", buf, 0xCu);
        }
        v76 = (void *)v89;
      }
      else
      {
        if (v53)
        {
          v75 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v75;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Not sending the periodic ping request to the primary and notification to the followers. Primary resident is nil.", buf, 0xCu);
        }
        v76 = v50;
      }
LABEL_97:

      goto LABEL_98;
    }
    v34 = (void *)MEMORY[0x230FBD990]();
    v35 = v23;
    v36 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
LABEL_68:

      goto LABEL_99;
    }
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v37;
    v40 = "%{public}@Ignoring ping timer since we're not idle";
LABEL_45:
    v65 = v36;
    uint32_t v66 = 12;
LABEL_67:
    _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, v40, buf, v66);

    goto LABEL_68;
  }
  id v7 = [(HMDPrimaryElectionCoordinationAddOn *)self secondaryMeshTimer];

  if (v7 == v4)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = HMFGetLogIdentifier();
      unint64_t v32 = [(HMDPrimaryElectionCoordinationAddOn *)v29 state];
      if (v32 > 5) {
        v33 = @"<unknown state>";
      }
      else {
        v33 = off_264A2C810[v32];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Secondary mesh timer fired, current state = %{public}@", buf, 0x16u);
    }
    if ([(HMDPrimaryElectionCoordinationAddOn *)v29 state] == 4
      && [(HMDLocalElectionMeshController *)v29->_meshController isLeader])
    {
      -[HMDPrimaryElectionCoordinationAddOn _pingPrimaryResident]((dispatch_queue_t *)v29);
    }
  }
  else
  {
    id v8 = [(HMDPrimaryElectionCoordinationAddOn *)self meshLeaderToPrimaryResidentPingResponseTimer];

    if (v8 == v4)
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        unint64_t v45 = [(HMDPrimaryElectionCoordinationAddOn *)v42 state];
        if (v45 > 5) {
          v46 = @"<unknown state>";
        }
        else {
          v46 = off_264A2C810[v45];
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Timer fired and the primary resident did not respond to ping request from the leader, current state = %{public}@", buf, 0x16u);
      }
      -[HMDPrimaryElectionCoordinationAddOn _handlePrimaryResidentPingFailed]((uint64_t)v42);
      [(HMDPrimaryElectionCoordinationAddOn *)v42 setMeshLeaderToPrimaryResidentPingResponseTimer:0];
    }
    else
    {
      id v9 = [(HMDPrimaryElectionCoordinationAddOn *)self activeNodesUpdateDebounceTimer];

      if (v9 == v4)
      {
        v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = self;
        unint64_t v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = HMFGetLogIdentifier();
          unint64_t v14 = [(HMDPrimaryElectionCoordinationAddOn *)v11 state];
          if (v14 > 5) {
            uint64_t v15 = @"<unknown state>";
          }
          else {
            uint64_t v15 = off_264A2C810[v14];
          }
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Active nodes update timer fired, current state = %{public}@", buf, 0x16u);
        }
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        v77 = [(HMDPrimaryElectionCoordinationAddOn *)v11 context];
        v64 = [v77 currentResidentDevice];

        if (v64)
        {
          -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](v11, v11->_meshController);
          v67 = -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v11);
          v68 = [v67 setByAddingObject:v64];
          v78 = (void *)MEMORY[0x230FBD990]();
          v79 = v11;
          v80 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            v81 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v81;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v68;
            _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate of active mesh nodes: %{public}@", buf, 0x16u);
          }
          v82 = [(HMDPrimaryElectionCoordinationAddOn *)v79 delegate];
          [v82 primaryElectionAddOn:v79 didUpdateActiveNodes:v68];

LABEL_75:
LABEL_76:
        }
        goto LABEL_77;
      }
    }
  }
LABEL_99:
}

- (void)_pingPrimaryResident
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    v2 = [(dispatch_queue_t *)a1 context];
    if (v2)
    {
      if ([(dispatch_queue_t *)a1 inPessimisticSecondaryMesh] == 1)
      {
        uint64_t v3 = (void *)MEMORY[0x230FBD990]();
        id v4 = a1;
        id v5 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          id v6 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v29 = v6;
          _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Pessimistic secondary mesh state pinging over IDS", buf, 0xCu);
        }
        [(dispatch_queue_t *)v4 setInPessimisticSecondaryMesh:2];
      }
      [(dispatch_queue_t *)a1 setState:5];
      id v7 = [v2 primaryResidentDevice];
      if (v7)
      {
        id v8 = [(dispatch_queue_t *)a1 remoteDeviceMonitor];
        if ([v8 isReachable])
        {
          id v9 = [MEMORY[0x263EFFA08] setWithObject:v7];
          v10 = -[HMDPrimaryElectionCoordinationAddOn _retrievePrimaryMeshInformationWithContext:otherResidents:](a1, v2, v9);

          objc_initWeak((id *)buf, a1);
          objc_initWeak(&location, v2);
          id v12 = objc_getProperty(a1, v11, 136, 1);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke;
          v24[3] = &unk_264A2C588;
          objc_copyWeak(&v25, (id *)buf);
          objc_copyWeak(&v26, &location);
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke_58;
          v22[3] = &unk_264A2C5B0;
          objc_copyWeak(&v23, (id *)buf);
          id v13 = (id)[v10 inContext:v12 then:v24 orRecover:v22];

          objc_destroyWeak(&v23);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v18 = (void *)MEMORY[0x230FBD990]();
          v19 = a1;
          unint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v29 = v21;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@We're not online, restarting ping timer", buf, 0xCu);
          }
          [(dispatch_queue_t *)v19 setState:4];
          -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer](v19);
        }
      }
      else
      {
        unint64_t v14 = (void *)MEMORY[0x230FBD990]();
        uint64_t v15 = a1;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v29 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@No current primary resident, doing meta mesh election", buf, 0xCu);
        }
        [(dispatch_queue_t *)v15 setState:2];
        -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection](v15);
      }
    }
  }
}

- (uint64_t)_handlePrimaryResidentPingFailed
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = (void *)result;
    result = [*(id *)(result + 8) isLeader];
    if (result)
    {
      result = [v1 state];
      if (result == 2)
      {
        v2 = (void *)MEMORY[0x230FBD990]();
        id v3 = v1;
        id v4 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          id v5 = HMFGetLogIdentifier();
          int v6 = 138543362;
          id v7 = v5;
          _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@The ping request to the primary resident failed. Starting an election", (uint8_t *)&v6, 0xCu);
        }
        return [v3 _selectPrimaryResidentWithReason:0];
      }
    }
  }
  return result;
}

- (void)createMissingResidentDevicesFromMeshNodes:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 context];
    id v5 = [v4 availableResidentDevices];
    int v6 = [a1 dataSource];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 idsAccountDevices];
    }
    else
    {
      id v9 = +[HMDAppleAccountManager sharedManager];
      v10 = [v9 account];
      uint64_t v8 = [v10 devices];
    }
    SEL v11 = [MEMORY[0x263EFF9C0] set];
    id v12 = [v3 meshNodes];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke;
    v20[3] = &unk_264A2C600;
    id v13 = v5;
    id v21 = v13;
    id v14 = v8;
    id v22 = v14;
    id v23 = a1;
    id v15 = v4;
    id v24 = v15;
    id v16 = v11;
    id v25 = v16;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    v17 = [a1 delegate];
    if (objc_opt_respondsToSelector())
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_64;
      v18[3] = &unk_264A2C628;
      v18[4] = a1;
      id v19 = v17;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
    }
  }
}

- (id)_meshNodesToResidentDevices
{
  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    v2 = [v1 context];
    id v3 = [v2 availableResidentDevices];

    id v4 = [v1[1] meshNodes];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__HMDPrimaryElectionCoordinationAddOn__meshNodesToResidentDevices__block_invoke;
    v8[3] = &unk_264A2C4F0;
    id v9 = v3;
    id v5 = v3;
    int v6 = objc_msgSend(v4, "na_map:", v8);

    v1 = [MEMORY[0x263EFFA08] setWithArray:v6];
  }
  return v1;
}

uint64_t __66__HMDPrimaryElectionCoordinationAddOn__meshNodesToResidentDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", a2);
}

void __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hmd_residentDeviceForMeshNode:", v3);
  id v4 = (HMDResidentDevice *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_2;
    v14[3] = &unk_264A2C5D8;
    id v6 = v3;
    id v15 = v6;
    id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v14);
    if (v7)
    {
      uint64_t v8 = [HMDResidentDevice alloc];
      id v9 = [*(id *)(a1 + 56) home];
      id v4 = [(HMDResidentDevice *)v8 initWithDevice:v7 home:v9];

      [*(id *)(a1 + 64) addObject:v4];
    }
    else
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 48);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v17 = v13;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find device matching node %@, skipping", buf, 0x16u);
      }
      id v4 = 0;
    }
  }
}

void __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating new resident %@ from mesh node", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) primaryElectionAddOn:*(void *)(a1 + 32) didUpdateResidentDevice:v3];
}

uint64_t __81__HMDPrimaryElectionCoordinationAddOn_createMissingResidentDevicesFromMeshNodes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 idsIdentifier];
  id v4 = [*(id *)(a1 + 32) idsIdentifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUIDString:", v4);

  return v5;
}

- (void)_doMetaMeshElection
{
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    [(dispatch_queue_t *)a1 setState:5];
    v2 = [(dispatch_queue_t *)a1 context];
    id v3 = -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh]((uint64_t)a1);
    id v4 = -[HMDPrimaryElectionCoordinationAddOn _retrievePrimaryMeshInformationWithContext:otherResidents:](a1, v2, v3);

    objc_initWeak(&location, a1);
    objc_initWeak(&from, v2);
    id v6 = objc_getProperty(a1, v5, 136, 1);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke;
    v10[3] = &unk_264A2C588;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(&v12, &from);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_57;
    v8[3] = &unk_264A2C5B0;
    objc_copyWeak(&v9, &location);
    id v7 = (id)[v4 inContext:v6 then:v10 orRecover:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_startSecondaryMeshTimer
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(a1[2]);
  v2 = [(dispatch_queue_t *)a1 secondaryMeshTimer];

  if (!v2)
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting secondary mesh timer", (uint8_t *)&v24, 0xCu);
    }
    id v14 = [(dispatch_queue_t *)v11 dataSource];
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 createSecondaryMeshTimerWithInterval:9 options:300.0];
    }
    else
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:9 options:300.0];
    }
    id v19 = (void *)v16;

    [(dispatch_queue_t *)v11 setSecondaryMeshTimer:v19];
    dispatch_queue_t v20 = a1[2];
    id v21 = [(dispatch_queue_t *)v11 secondaryMeshTimer];
    [v21 setDelegateQueue:v20];

    id v22 = [(dispatch_queue_t *)v11 secondaryMeshTimer];
    [v22 setDelegate:v11];

    __int16 v18 = v11;
    goto LABEL_16;
  }
  id v3 = [(dispatch_queue_t *)a1 secondaryMeshTimer];
  int v4 = [v3 isRunning];

  SEL v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v4)
  {
    if (v8)
    {
      v17 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v17;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resuming secondary mesh timer", (uint8_t *)&v24, 0xCu);
    }
    __int16 v18 = v6;
LABEL_16:
    id v23 = [(dispatch_queue_t *)v18 secondaryMeshTimer];
    [v23 resume];

    return;
  }
  if (v8)
  {
    id v9 = HMFGetLogIdentifier();
    int v24 = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Secondary mesh timer is already running", (uint8_t *)&v24, 0xCu);
  }
}

- (id)_retrievePrimaryMeshInformationWithContext:(void *)a3 otherResidents:
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(a1[2]);
  id v7 = v5;
  id v8 = v6;
  id v9 = [(dispatch_queue_t *)a1 dataSource];
  __int16 v10 = v9;
  if (v9)
  {
    id v11 = [v9 createFindPrimaryMeshOperationWithContext:v7 otherResidents:v8];
  }
  else
  {
    id v11 = [[HMDPrimaryElectionFindPrimaryMeshOperation alloc] initWithContext:v7 otherResidents:v8];
  }
  id v12 = v11;

  [(dispatch_queue_t *)a1 setFindPrimaryMeshOperation:v12];
  id v13 = (void *)MEMORY[0x263F42538];
  id v14 = [(dispatch_queue_t *)a1 findPrimaryMeshOperation];
  id v15 = [v13 futureForOperation:v14];
  [(dispatch_queue_t *)a1 setFindPrimaryMeshFuture:v15];

  objc_initWeak(&location, a1);
  objc_initWeak(&from, v7);
  uint64_t v16 = [(dispatch_queue_t *)a1 findPrimaryMeshFuture];
  id v18 = objc_getProperty(a1, v17, 136, 1);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __97__HMDPrimaryElectionCoordinationAddOn__retrievePrimaryMeshInformationWithContext_otherResidents___block_invoke;
  v25[3] = &unk_264A2C650;
  objc_copyWeak(&v27, &location);
  objc_copyWeak(&v28, &from);
  id v19 = v12;
  uint64_t v26 = v19;
  dispatch_queue_t v20 = [v16 inContext:v18 then:v25];

  id v21 = [MEMORY[0x263F42628] defaultScheduler];
  id v22 = [(dispatch_queue_t *)a1 findPrimaryMeshOperation];
  id v23 = (id)[v21 performOperation:v22];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v20;
}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (WeakRetained
    && v5
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 5, @"pinging primary"))
  {
    if ([v3 count])
    {
      uint64_t v7 = WeakRetained[1];
      id v8 = [v6 home];
      id v9 = +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:v7 home:v8];

      if (!v9)
      {
        [WeakRetained setState:4];
        -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)WeakRetained);
LABEL_29:

        goto LABEL_30;
      }
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = WeakRetained;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v13;
        __int16 v44 = 2112;
        unint64_t v45 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Our mesh info: %@", buf, 0x16u);
      }
      id v14 = [v3 firstObject];
      uint64_t v15 = [v9 reachableIPAccessories];
      uint64_t v16 = [v14 reachableIPAccessories];
      if (v15 && !v16)
      {
        SEL v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v11;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v20 = HMFGetLogIdentifier();
          int v21 = [v9 reachableIPAccessories];
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          __int16 v44 = 1024;
          LODWORD(v45) = v21;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@The current primary mesh has 0 reachable IP accessories and we have %d, taking over the primary mesh", buf, 0x12u);
        }
LABEL_27:

        [v18 setState:2];
        [v18 _selectPrimaryResidentWithReason:2];
        goto LABEL_28;
      }
      if (v15 || !v16)
      {
        v31 = [v14 primary];
        unint64_t v32 = [v14 responder];
        char v33 = [v31 isEqual:v32];

        SEL v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v11;
        id v19 = HMFGetOSLogHandle();
        BOOL v34 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            HMFGetLogIdentifier();
            v35 = v41 = v17;
            v40 = [v14 primary];
            v36 = [v40 identifier];
            v39 = [v14 primary];
            v37 = [v39 name];
            *(_DWORD *)buf = 138543874;
            v43 = v35;
            __int16 v44 = 2114;
            unint64_t v45 = v36;
            __int16 v46 = 2112;
            v47 = v37;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@The current primary thinks the primary is another resident %{public}@ (%@), taking over the primary mesh", buf, 0x20u);

            SEL v17 = v41;
          }
          goto LABEL_27;
        }
        if (v34)
        {
          uint64_t v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v43 = v26;
          id v28 = "%{public}@The current primary responded and we are not better than it, staying in secondary mesh and res"
                "tarting ping timer";
          v29 = v19;
          uint32_t v30 = 12;
          goto LABEL_23;
        }
      }
      else
      {
        SEL v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v11;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          int v27 = [v14 reachableIPAccessories];
          *(_DWORD *)buf = 138543618;
          v43 = v26;
          __int16 v44 = 1024;
          LODWORD(v45) = v27;
          id v28 = "%{public}@The current primary has reachable %d IP accessories (we have 0), staying in secondary mesh and"
                " restarting ping timer";
          v29 = v19;
          uint32_t v30 = 18;
LABEL_23:
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
        }
      }

      [v18 setState:4];
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v18);
LABEL_28:

      goto LABEL_29;
    }
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = WeakRetained;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Primary resident didn't respond, doing meta mesh election", buf, 0xCu);
    }
    [v23 setState:2];
    -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection]((dispatch_queue_t *)v23);
  }
LABEL_30:

  return 1;
}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn__pingPrimaryResident__block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (![v3 isHMError] || objc_msgSend(v3, "code") != 23))
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ping operation completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [v6 setState:4];
    -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v6);
  }

  return 1;
}

- (uint64_t)_expectState:(void *)a3 action:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a1)
  {
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [a1 state];
  if (v6 != a2)
  {
    unint64_t v8 = v6;
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = (void *)v12;
      uint64_t v14 = off_264A2C810[a2];
      if (v8 > 5) {
        uint64_t v15 = @"<unknown state>";
      }
      else {
        uint64_t v15 = off_264A2C810[v8];
      }
      int v17 = 138544130;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      dispatch_queue_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v15;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Expecting state %{public}@, got %{public}@ - action: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    goto LABEL_10;
  }
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

uint64_t __97__HMDPrimaryElectionCoordinationAddOn__retrievePrimaryMeshInformationWithContext_otherResidents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && ([WeakRetained findPrimaryMeshOperation],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = *(void **)(a1 + 32),
        v6,
        v6 == v7))
  {
    [WeakRetained setFindPrimaryMeshOperation:0];
    uint64_t v18 = [WeakRetained setFindPrimaryMeshFuture:0];
    if (v5)
    {
      [v3 results];
      objc_claimAutoreleasedReturnValue();
      uint64_t v16 = 1;
      goto LABEL_10;
    }
    unint64_t v8 = (void *)MEMORY[0x230FBD990](v18);
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      dispatch_queue_t v20 = v11;
      uint64_t v12 = "%{public}@No context, bailing";
      goto LABEL_5;
    }
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      dispatch_queue_t v20 = v11;
      uint64_t v12 = "%{public}@Ignoring stale find primary mesh operation";
LABEL_5:
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, 0xCu);
    }
  }

  id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
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

  uint64_t v16 = 2;
LABEL_10:

  return v16;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (WeakRetained
    && v5
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 5, @"pinging primary"))
  {
    uint64_t v7 = [WeakRetained remoteDeviceMonitor];
    char v8 = [v7 isReachable];

    if (v8)
    {
      if ([v3 count])
      {
        id v9 = [v6 primaryResidentDevice];
        id v10 = v9;
        if (v9)
        {
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_53;
          v42[3] = &unk_264A2C540;
          id v43 = v9;
          id v11 = objc_msgSend(v3, "na_firstObjectPassingTest:", v42);
        }
        else
        {
          id v11 = 0;
        }
        uint64_t v20 = WeakRetained[1];
        uint64_t v21 = [v6 home];
        id v22 = +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:v20 home:v21];

        if (!v22)
        {
          [WeakRetained setState:4];
          BOOL v34 = (dispatch_queue_t *)WeakRetained;
LABEL_32:
          -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer](v34);
LABEL_33:

          goto LABEL_34;
        }
        char v23 = objc_msgSend(v3, "na_any:", &__block_literal_global_250223);
        if ([v22 reachableIPAccessories])
        {
          uint64_t v24 = [v11 reachableIPAccessories];
          uint64_t v25 = (void *)MEMORY[0x230FBD990]();
          uint64_t v26 = WeakRetained;
          int v27 = HMFGetOSLogHandle();
          id v28 = v27;
          if (v24)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v29 = HMFGetLogIdentifier();
              int v30 = [v11 reachableIPAccessories];
              *(_DWORD *)buf = 138543618;
              unint64_t v45 = v29;
              __int16 v46 = 1024;
              int v47 = v30;
              v31 = "%{public}@The current primary responded and has %d accessories, staying secondary";
              unint64_t v32 = v28;
              uint32_t v33 = 18;
LABEL_30:
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, v31, buf, v33);
            }
LABEL_31:

            [v26 setState:4];
            BOOL v34 = (dispatch_queue_t *)v26;
            goto LABEL_32;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v36 = HMFGetLogIdentifier();
            int v37 = [v22 reachableIPAccessories];
            *(_DWORD *)buf = 138543618;
            unint64_t v45 = v36;
            __int16 v46 = 1024;
            int v47 = v37;
            unint64_t v38 = "%{public}@We have %d reachable accessories trying to become primary";
            v39 = v28;
            uint32_t v40 = 18;
LABEL_37:
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);

            goto LABEL_38;
          }
          goto LABEL_38;
        }
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        uint64_t v26 = WeakRetained;
        v35 = HMFGetOSLogHandle();
        id v28 = v35;
        if (v11)
        {
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            goto LABEL_31;
          }
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          unint64_t v45 = v29;
          v31 = "%{public}@The primary responded, staying secondary";
        }
        else
        {
          if ((v23 & 1) == 0)
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              unint64_t v45 = v36;
              unint64_t v38 = "%{public}@Nobody has reachable IP accessories, becoming primary";
              v39 = v28;
              uint32_t v40 = 12;
              goto LABEL_37;
            }
LABEL_38:

            [v26 setState:2];
            [v26 _selectPrimaryResidentWithReason:2];
            goto LABEL_33;
          }
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            goto LABEL_31;
          }
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          unint64_t v45 = v29;
          v31 = "%{public}@Another mesh has accessories and we don't, staying secondary";
        }
        unint64_t v32 = v28;
        uint32_t v33 = 12;
        goto LABEL_30;
      }
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      int v17 = WeakRetained;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        unint64_t v45 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@No other residents responded to us, becoming primary", buf, 0xCu);
      }
      [v17 setState:2];
      [v17 _selectPrimaryResidentWithReason:2];
    }
    else
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = WeakRetained;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        unint64_t v45 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@We're not online, going to secondary state and resuming pinging", buf, 0xCu);
      }
      [v13 setState:4];
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v13);
    }
  }
LABEL_34:

  return 1;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (![v3 isHMError] || objc_msgSend(v3, "code") != 23))
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ping operation completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [v6 setState:4];
    -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v6);
  }

  return 1;
}

uint64_t __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = [a2 responder];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

BOOL __58__HMDPrimaryElectionCoordinationAddOn__doMetaMeshElection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reachableIPAccessories] != 0;
}

void __68__HMDPrimaryElectionCoordinationAddOn__handlePingTimerExpiredAsNode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    char v8 = HMFGetLogIdentifier();
    int v29 = 138543618;
    int v30 = v8;
    __int16 v31 = 2112;
    id v32 = v3;
    id v9 = "%{public}@Ping command to leader failed with error: %@.";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    char v8 = HMFGetLogIdentifier();
    int v29 = 138543362;
    int v30 = v8;
    id v9 = "%{public}@Ping command to leader succeeded";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
  }
  _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v29, v12);

LABEL_7:
  id v13 = [*(id *)(a1 + 32) pingTimer];
  uint64_t v14 = v13;
  if (v13 != *(void **)(a1 + 40))
  {

LABEL_13:
    uint64_t v25 = (void *)MEMORY[0x230FBD990](v15, v16, v17, v18);
    id v26 = *(id *)(a1 + 32);
    int v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      int v29 = 138543362;
      int v30 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Not resuming ping timer", (uint8_t *)&v29, 0xCu);
    }
    goto LABEL_16;
  }
  int v19 = [*(id *)(*(void *)(a1 + 32) + 8) isProcessing];

  if (!v19) {
    goto LABEL_13;
  }
  uint64_t v20 = (void *)MEMORY[0x230FBD990](v15, v16, v17, v18);
  id v21 = *(id *)(a1 + 32);
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    char v23 = HMFGetLogIdentifier();
    int v29 = 138543362;
    int v30 = v23;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Resuming ping timer", (uint8_t *)&v29, 0xCu);
  }
  uint64_t v24 = [*(id *)(a1 + 32) pingTimer];
  [v24 resume];

LABEL_16:
}

- (id)meshNodeForResident:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v4 = [v3 device];
    id v5 = [v4 idsIdentifier];
    id v6 = [*(id *)(a1 + 8) leaderNode];
    uint64_t v7 = [v6 idsIdentifier];
    int v8 = objc_msgSend(v5, "hmf_isEqualToUUIDString:", v7);

    if (v8)
    {
      a1 = [*(id *)(a1 + 8) leaderNode];
    }
    else
    {
      id v9 = [v3 device];
      int v10 = [v9 idsIdentifier];

      os_log_type_t v11 = [*(id *)(a1 + 8) meshNodes];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59__HMDPrimaryElectionCoordinationAddOn_meshNodeForResident___block_invoke;
      v14[3] = &unk_264A2C518;
      id v15 = v10;
      id v12 = v10;
      a1 = objc_msgSend(v11, "na_firstObjectPassingTest:", v14);
    }
  }

  return (id)a1;
}

void __72__HMDPrimaryElectionCoordinationAddOn_sendPingRequestToPrimaryResident___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) meshLeaderToPrimaryResidentPingResponseTimer];

  if (v4 == v5)
  {
    int v10 = [*(id *)(a1 + 40) meshLeaderToPrimaryResidentPingResponseTimer];
    [v10 suspend];

    uint64_t v11 = [*(id *)(a1 + 40) setMeshLeaderToPrimaryResidentPingResponseTimer:0];
    if (v3)
    {
      id v12 = (void *)MEMORY[0x230FBD990](v11);
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        uint64_t v17 = v15;
        __int16 v18 = 2112;
        id v19 = v3;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Ping request to the primary resident failed with error: %@.", (uint8_t *)&v16, 0x16u);
      }
      -[HMDPrimaryElectionCoordinationAddOn _handlePrimaryResidentPingFailed](*(void *)(a1 + 40));
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Ignoring the error response to the ping request from the primary resident since the response timer has changed. Error: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

uint64_t __59__HMDPrimaryElectionCoordinationAddOn_meshNodeForResident___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 idsIdentifier];
  uint64_t v4 = objc_msgSend(v2, "hmf_isEqualToUUIDString:", v3);

  return v4;
}

- (void)sendNewPrimaryNotification:(void *)a3 to:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(a1[2]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        id v12 = [HMDRemoteDeviceMessageDestination alloc];
        id v13 = [(dispatch_queue_t *)a1 messageTargetUUID];
        uint64_t v14 = [v11 device];
        id v15 = [(HMDRemoteDeviceMessageDestination *)v12 initWithTarget:v13 device:v14];

        int v16 = [HMDRemoteMessage alloc];
        id v28 = @"uuid";
        uint64_t v17 = [v5 identifier];
        __int16 v18 = [v17 UUIDString];
        int v29 = v18;
        id v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        uint64_t v20 = [(HMDRemoteMessage *)v16 initWithName:@"mesh.currentPrimaryUpdate" qualityOfService:17 destination:v15 payload:v19 type:3 timeout:1 secure:0.0 restriction:[(dispatch_queue_t *)a1 messageTransportRestriction]];

        id v21 = [(dispatch_queue_t *)a1 context];
        id v22 = [v21 messageDispatcher];
        [v22 sendMessage:v20];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }
}

uint64_t __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __101__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMeshAfterWaitingForPrimaryResidentDiscovery__block_invoke_2(uint64_t a1)
{
  return 1;
}

- (void)_determineIfPrimaryMesh
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(a1[2]);
  if (![(dispatch_queue_t *)a1 state])
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]([(dispatch_queue_t *)a1 setState:1]);
    uint64_t v9 = a1;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Determining if we're in the primary mesh", buf, 0xCu);
    }
    id v12 = [v9 context];
    if (v12)
    {
      if ([v9[1] isLeader])
      {
        id v13 = -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v9);
        uint64_t v14 = (void *)MEMORY[0x263EFFA08];
        id v15 = [v9[1] meshNodes];
        int v16 = [v14 setWithArray:v15];

        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __62__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMesh__block_invoke;
        v26[3] = &unk_264A2E868;
        v26[4] = v9;
        id v27 = v12;
        id v28 = v13;
        id v29 = v16;
        id v17 = v16;
        id v18 = v13;
        -[HMDPrimaryElectionCoordinationAddOn _requestElectionParametersFromCandidates:completionHandler:]((dispatch_queue_t *)v9, v18, v26);

LABEL_20:
        return;
      }
      id v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v9;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v22;
        char v23 = "%{public}@No longer leader, waiting for broadcast from the leader";
        long long v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        goto LABEL_18;
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v9;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v22;
        char v23 = "%{public}@Nil context in determineIfPrimaryMesh";
        long long v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
LABEL_18:
        _os_log_impl(&dword_22F52A000, v24, v25, v23, buf, 0xCu);
      }
    }

    [v20 setState:0];
    goto LABEL_20;
  }
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1;
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    unint64_t v6 = [(dispatch_queue_t *)v3 state];
    if (v6 > 5) {
      uint64_t v7 = @"<unknown state>";
    }
    else {
      uint64_t v7 = off_264A2C810[v6];
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Not determining if we are in the primary mesh due to current state: %@", buf, 0x16u);
  }
}

void __62__HMDPrimaryElectionCoordinationAddOn__determineIfPrimaryMesh__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (-[HMDPrimaryElectionCoordinationAddOn _expectState:action:](*(void **)(a1 + 32), 1, @"aborting determining primary mesh"))
  {
    uint64_t v4 = -[HMDPrimaryElectionCoordinationAddOn _consensusPrimaryFromResidentCandidates:](*(void *)(a1 + 32), v3);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) availableResidentDevices];
      unint64_t v6 = objc_msgSend(v5, "hmd_residentWithIdentifier:", v4);

      if (v6)
      {
        if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:meshCandidates:](*(void **)(a1 + 32), v6, *(void **)(a1 + 48)))goto LABEL_17; {
        goto LABEL_10;
        }
      }
      uint64_t v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v18 = 138543618;
        id v19 = v10;
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown resident %{public}@", (uint8_t *)&v18, 0x16u);
      }
    }
    unint64_t v6 = 0;
LABEL_10:
    uint64_t v11 = -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh](*(void *)(a1 + 32));
    if ([v11 count])
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        int v18 = 138543618;
        id v19 = v15;
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Found other residents that could be in a primary mesh, checking if they are: %{public}@", (uint8_t *)&v18, 0x16u);
      }
      if (v6) {
        -[HMDPrimaryElectionCoordinationAddOn _maybeNotifyDelegateUpdatedPrimary:currentPrimary:](*(void **)(a1 + 32), v6, 0);
      }
      [*(id *)(a1 + 32) _findPrimaryMeshWithContext:*(void *)(a1 + 40) otherResidents:v11];
      goto LABEL_18;
    }

LABEL_17:
    uint64_t v11 = -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](*(void **)(a1 + 32));
    int v16 = [*(id *)(a1 + 40) currentResidentDevice];
    [v11 setResidentDevice:v16];

    id v17 = [v3 arrayByAddingObject:v11];

    [*(id *)(a1 + 32) setState:3];
    -[HMDPrimaryElectionCoordinationAddOn _selectPrimaryResidentFromCandidates:meshCandidates:meshCandidateNodes:context:electionTriggerReason:](*(dispatch_queue_t **)(a1 + 32), v17, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 40), 3);
    id v3 = v17;
LABEL_18:
  }
}

- (void)_requestElectionParametersFromCandidates:(void *)a3 completionHandler:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    uint64_t v34 = [(dispatch_queue_t *)a1 context];
    if (v34)
    {
      uint64_t v31 = v6;
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      id v8 = (void *)MEMORY[0x230FBD990]();
      uint64_t v9 = a1;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        unint64_t v45 = v11;
        __int16 v46 = 2114;
        id v47 = v5;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting election parameters from candidates: %{public}@", buf, 0x16u);
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v32 = v5;
      id obj = v5;
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(obj);
            }
            int v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([v16 isCurrentDevice])
            {
              -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](v9);
              id v17 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
              int v18 = [v34 currentResidentDevice];
              [(HMDRemoteDeviceMessageDestination *)v17 setResidentDevice:v18];

              id v19 = [MEMORY[0x263F42538] futureWithValue:v17];
              [v7 addObject:v19];
            }
            else
            {
              __int16 v20 = [HMDRemoteDeviceMessageDestination alloc];
              id v21 = [(dispatch_queue_t *)v9 messageTargetUUID];
              uint64_t v22 = [v16 device];
              id v17 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

              id v19 = [[HMDRemoteMessage alloc] initWithName:@"mesh.requestCapabilities" qualityOfService:17 destination:v17 payload:0 type:0 timeout:1 secure:15.0 restriction:[(dispatch_queue_t *)v9 messageTransportRestriction]];
              char v23 = [v34 messageDispatcher];
              long long v24 = [v23 sendMessageExpectingResponse:v19];

              id Property = objc_getProperty(v9, v25, 136, 1);
              v38[0] = MEMORY[0x263EF8330];
              v38[1] = 3221225472;
              v38[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke;
              v38[3] = &unk_264A2C760;
              v38[4] = v16;
              v38[5] = v9;
              v37[0] = MEMORY[0x263EF8330];
              v37[1] = 3221225472;
              v37[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_93;
              v37[3] = &unk_264A2EC50;
              v37[4] = v9;
              v37[5] = v16;
              id v27 = [v24 inContext:Property then:v38 orRecover:v37];
              [v7 addObject:v27];
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v13);
      }

      id v28 = (void *)MEMORY[0x263F42538];
      id v29 = (void *)[v7 copy];
      int v30 = [v28 allSettled:v29];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_94;
      v35[3] = &unk_264A2C7A8;
      v35[4] = v9;
      id v6 = v31;
      id v36 = v31;
      [v30 getResultWithCompletion:v35];

      id v5 = v32;
    }
    else
    {
      (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x263EFFA68]);
    }
  }
}

- (__HMDPrimaryElectionCandidate)candidateRepresentation
{
  if (a1)
  {
    v2 = [a1 context];
    id v3 = [v2 currentResidentDevice];
    uint64_t v4 = [v3 device];

    id v5 = [a1 dataSource];
    if (v5)
    {
      id v6 = [a1 dataSource];
      SEL v25 = [v6 homeKitVersion];
    }
    else
    {
      SEL v25 = +[HMDHomeKitVersion currentVersion];
    }

    uint64_t v7 = [a1 dataSource];
    if (v7)
    {
      id v8 = [a1 dataSource];
      char v9 = [v8 pcsEnabled];
    }
    else
    {
      id v8 = [v2 home];
      uint64_t v10 = [v8 homeManager];
      char v9 = [v10 pcsEnabled];
    }
    uint64_t v11 = [a1 dataSource];

    if (v11)
    {
      default_evaluator = [a1 dataSource];
      uint64_t v13 = [default_evaluator connectionType];
    }
    else
    {
      default_evaluator = (void *)nw_path_create_default_evaluator();
      uint64_t v14 = nw_path_evaluator_copy_path();
      uint64_t v13 = nw_path_uses_interface_type(v14, nw_interface_type_wired);
    }
    id v15 = [v4 productInfo];
    int v16 = [v15 softwareVersion];

    id v17 = [__HMDPrimaryElectionCandidate alloc];
    int v18 = [v4 idsIdentifier];
    id v19 = [v4 name];
    __int16 v20 = [v2 primaryResidentDevice];
    id v21 = [v20 identifier];
    LOBYTE(v24) = v9;
    uint64_t v22 = -[__HMDPrimaryElectionCandidate initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:](v17, "initWithVersion:deviceIdentifier:name:currentPrimaryIdentifier:enabledAsResident:supportsPingRequest:connectionType:pcsEnabled:swVersion:", v25, v18, v19, v21, [v2 isCurrentDeviceAvailableResident], 1, v13, v24, v16);
  }
  else
  {
    uint64_t v22 = 0;
  }
  return v22;
}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[__HMDPrimaryElectionCandidate fromMessagePayload:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x230FBD990]([v4 setResidentDevice:*(void *)(a1 + 32)]);
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      char v9 = HMFGetLogIdentifier();
      uint64_t v10 = [*(id *)(a1 + 32) device];
      uint64_t v11 = [v10 shortDescription];
      int v22 = 138543874;
      char v23 = v9;
      __int16 v24 = 2114;
      SEL v25 = v11;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Adding election candidate %{public}@: %@", (uint8_t *)&v22, 0x20u);
    }
    v5;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 40);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      id v17 = *(void **)(a1 + 32);
      int v22 = 138543874;
      char v23 = v16;
      __int16 v24 = 2112;
      SEL v25 = v17;
      __int16 v26 = 2112;
      id v27 = v3;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Candidate %@ responded with invalid payload: %@", (uint8_t *)&v22, 0x20u);
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    id v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v12 = 2;
  }

  return v12;
}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Candidate %@ responded with error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = v3;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

void __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_2;
  v6[3] = &unk_264A2F870;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "na_filter:", &__block_literal_global_96_250258);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __98__HMDPrimaryElectionCoordinationAddOn__requestElectionParametersFromCandidates_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_consensusPrimaryFromResidentCandidates:(uint64_t)a1
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x263F08760];
    id v3 = objc_msgSend(a2, "na_map:", &__block_literal_global_84_250404);
    uint64_t v4 = [v2 setWithArray:v3];

    id v5 = v4;
    if ([v5 count])
    {
      if ([v5 count] == 1)
      {
        id v6 = [v5 anyObject];
      }
      else
      {
        id v7 = [v5 allObjects];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __74__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentUUIDs___block_invoke;
        v14[3] = &unk_264A2C710;
        id v8 = v5;
        id v15 = v8;
        id v9 = [v7 sortedArrayUsingComparator:v14];

        uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
        id v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 2);
        unint64_t v12 = [v8 countForObject:v10];
        if (v12 <= [v8 countForObject:v11]) {
          id v6 = 0;
        }
        else {
          id v6 = v10;
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (uint64_t)_doesLocalMeshContainPrimaryResident:(void *)a3 meshCandidates:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  id v7 = [a1 context];
  id v8 = [v7 currentResidentDevice];
  int v9 = [v5 isEqual:v8];

  if (!v9)
  {
    int v16 = [v6 containsObject:v5];
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    unint64_t v12 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (!v16)
    {
      if (v18)
      {
        uint64_t v19 = HMFGetLogIdentifier();
        int v21 = 138543362;
        int v22 = v19;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@We are not the current primary and it isn't in our mesh", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    if (!v18)
    {
      uint64_t v13 = 1;
      goto LABEL_13;
    }
    id v14 = HMFGetLogIdentifier();
    int v21 = 138543362;
    int v22 = v14;
    id v15 = "%{public}@The current primary resident is in our mesh, we are in the primary mesh";
    uint64_t v13 = 1;
    goto LABEL_8;
  }
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1;
  unint64_t v12 = HMFGetOSLogHandle();
  uint64_t v13 = 1;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v21 = 138543362;
    int v22 = v14;
    id v15 = "%{public}@We are the current primary resident, we are in the primary mesh";
LABEL_8:
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0xCu);
  }
LABEL_13:

LABEL_14:

  return v13;
}

- (uint64_t)_maybeNotifyDelegateUpdatedPrimary:(void *)a3 currentPrimary:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (([v5 isEqual:v6] & 1) == 0)
    {
      id v14 = [a1 delegate];
      uint64_t v13 = 1;
      [v14 primaryElectionAddOn:a1 didElectPrimaryResident:v5 confirmed:1 electionLogEvent:0];

      goto LABEL_8;
    }
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [v8 context];
      unint64_t v12 = [v11 primaryResidentDevice];
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Selected primary is current primary: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v13 = 0;
LABEL_8:

  return v13;
}

- (void)_selectPrimaryResidentFromCandidates:(void *)a3 meshCandidates:(void *)a4 meshCandidateNodes:(void *)a5 context:(uint64_t)a6 electionTriggerReason:
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v58 = a3;
  id v12 = a4;
  id v13 = a5;
  v56 = v13;
  if (a1)
  {
    id v14 = v13;
    dispatch_assert_queue_V2(a1[2]);
    if (![(__CFString *)v11 count]) {
      _HMFPreconditionFailure();
    }
    uint64_t v51 = a6;
    uint64_t v15 = -[HMDPrimaryElectionCoordinationAddOn _consensusPrimaryFromResidentCandidates:]((uint64_t)a1, v11);
    int v16 = [v14 availableResidentDevices];
    uint64_t v17 = objc_msgSend(v16, "hmd_residentWithIdentifier:", v15);

    v59 = (void *)v17;
    v54 = [(dispatch_queue_t *)a1 primarySortComparatorForCurrentPrimary:v17];
    -[__CFString sortedArrayUsingComparator:](v11, "sortedArrayUsingComparator:");
    __int16 v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = a1;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v62 = v22;
      __int16 v63 = 2114;
      v64 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Sorted primary candidates: %{public}@", buf, 0x16u);
    }
    uint64_t v23 = [(__CFString *)v18 lastObject];
    [v20 setSelectedPrimaryResidentCandidate:v23];
    v57 = [v23 residentDevice];
    unint64_t v60 = 0;
    unint64_t v55 = (void *)v15;
    if ((unint64_t)[(__CFString *)v18 count] >= 2)
    {
      __int16 v24 = [(__CFString *)v18 objectAtIndexedSubscript:[(__CFString *)v18 count] - 2];
      SEL v25 = (void *)MEMORY[0x230FBD990]([v23 compare:v24 currentPrimary:v59 outCriteria:&v60]);
      __int16 v26 = v20;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        BOOL v53 = v25;
        if (v60 > 0x11) {
          id v29 = @"unknown reason";
        }
        else {
          id v29 = off_264A1EE00[v60];
        }
        int v30 = v29;
        *(_DWORD *)buf = 138543618;
        v62 = v28;
        __int16 v63 = 2114;
        v64 = v30;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@The primary resident was chosen because of: %{public}@", buf, 0x16u);

        SEL v25 = v53;
      }

      uint64_t v15 = (uint64_t)v55;
      id v14 = v56;
    }
    objc_msgSend(v20, "setElectionGotAborted:", 0, v51);
    [v20 setLastEvaluatedMeshNodes:v12];
    uint64_t v31 = [v14 primaryResidentDevice];
    uint64_t v32 = -[HMDPrimaryElectionCoordinationAddOn _maybeNotifyDelegateUpdatedPrimary:currentPrimary:](v20, v57, v31);

    uint64_t v33 = [v14 currentResidentDevice];
    uint64_t v34 = [v33 identifier];
    uint64_t v35 = [v34 isEqual:v15];

    uint64_t v36 = [(__CFString *)v18 count];
    BOOL v37 = v36 == [v58 count];
    uint64_t v38 = [v58 containsObject:v59];
    long long v39 = [HMDCoordinationPrimaryElectionDetailedLogEvent alloc];
    long long v40 = [(HMDCoordinationPrimaryElectionDetailedLogEvent *)v39 initWithIsPrimary:v35 didChangePrimary:v32 electionTriggerReason:v52 confirmationCriteria:v60 meshAndPrimaryCandidateCountEqual:v37 previousPrimaryInMesh:v38];
    long long v41 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v41 submitLogEvent:v40];

    [v20 setState:2];
    -[HMDPrimaryElectionCoordinationAddOn sendNewPrimaryNotification:to:]((dispatch_queue_t *)v20, v57, v58);
    -[HMDPrimaryElectionCoordinationAddOn _maybeStartPingTimer]((uint64_t)v20);
    dispatch_assert_queue_V2(a1[2]);
    if ([v20[1] isLeader])
    {
      long long v42 = (void *)MEMORY[0x230FBD990]();
      id v43 = v20;
      __int16 v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v62 = v45;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_DEBUG, "%{public}@Checking for split network", buf, 0xCu);
      }
      -[HMDPrimaryElectionCoordinationAddOn residentDevicesNotFoundInMesh]((uint64_t)v43);
      __int16 v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ([(__CFString *)v46 count])
      {
        id v47 = (void *)MEMORY[0x230FBD990]();
        uint64_t v48 = v43;
        v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v62 = v50;
          __int16 v63 = 2114;
          v64 = v46;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Expected resident devices not found in mesh, we have a split network: %{public}@", buf, 0x16u);
        }
      }
    }
    id v11 = v18;
  }
}

- (void)_maybeStartPingTimer
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([*(id *)(a1 + 8) isProcessing])
    {
      int v2 = [*(id *)(a1 + 8) isLeader];
      id v3 = (void *)MEMORY[0x230FBD990]();
      id v4 = (id)a1;
      id v5 = HMFGetOSLogHandle();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v2)
      {
        if (v6)
        {
          id v7 = HMFGetLogIdentifier();
          int v25 = 138543362;
          __int16 v26 = v7;
          _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ping timer as a leader", (uint8_t *)&v25, 0xCu);
        }
        double v8 = 60.0;
        uint64_t v9 = 5;
      }
      else
      {
        if (v6)
        {
          uint64_t v15 = HMFGetLogIdentifier();
          int v25 = 138543362;
          __int16 v26 = v15;
          _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting ping timer as a node", (uint8_t *)&v25, 0xCu);
        }
        uint64_t v9 = 0;
        double v8 = (double)arc4random() * 2.32830644e-10 * 11.25 + 75.0;
      }
      int v16 = [v4 pingTimer];
      [v16 suspend];

      uint64_t v17 = [v4 dataSource];
      __int16 v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 createPingTimerWithInterval:v9 options:v8];
      }
      else
      {
        uint64_t v19 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:v9 options:v8];
      }
      uint64_t v20 = (void *)v19;

      [v4 setPingTimer:v20];
      int v21 = [v4 pingTimer];
      [v21 setDelegate:v4];

      uint64_t v22 = *(void *)(a1 + 16);
      uint64_t v23 = [v4 pingTimer];
      [v23 setDelegateQueue:v22];

      __int16 v24 = [v4 pingTimer];
      [v24 resume];
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = (id)a1;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = HMFGetLogIdentifier();
        id v14 = [*(id *)(a1 + 8) debugDescriptionForMeshState];
        int v25 = 138543618;
        __int16 v26 = v13;
        __int16 v27 = 2114;
        uint64_t v28 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Not starting ping timer in state %{public}@", (uint8_t *)&v25, 0x16u);
      }
    }
  }
}

uint64_t __74__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentUUIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

uint64_t __79__HMDPrimaryElectionCoordinationAddOn__consensusPrimaryFromResidentCandidates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 currentPrimaryIdentifier];
}

- (void)meshControllerDidUpdatesNodes:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([v4 isEqual:self->_meshController] & 1) == 0) {
    _HMFPreconditionFailure();
  }
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = HMFGetLogIdentifier();
    int v34 = 138543362;
    uint64_t v35 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Mesh nodes updated", (uint8_t *)&v34, 0xCu);
  }
  -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](v6, self->_meshController);
  -[HMDPrimaryElectionCoordinationAddOn _clearPessimisticMeshState](v6);
  unint64_t v9 = [(HMDPrimaryElectionCoordinationAddOn *)v6 state];
  uint64_t v10 = [(HMDPrimaryElectionCoordinationAddOn *)v6 context];
  id v11 = [v10 primaryResidentDevice];
  unsigned int v12 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v6, v11);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v13 = [(HMDPrimaryElectionCoordinationAddOn *)v6 activeNodesUpdateDebounceTimer];
  [v13 suspend];

  id v14 = [(HMDPrimaryElectionCoordinationAddOn *)v6 dataSource];
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 createActiveNodesUpdateDebounceTimerWithInterval:0 options:5.0];
  }
  else
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:5.0];
  }
  uint64_t v17 = (void *)v16;

  [(HMDPrimaryElectionCoordinationAddOn *)v6 setActiveNodesUpdateDebounceTimer:v17];
  __int16 v18 = [(HMDPrimaryElectionCoordinationAddOn *)v6 activeNodesUpdateDebounceTimer];
  [v18 setDelegate:v6];

  queue = self->_queue;
  uint64_t v20 = [(HMDPrimaryElectionCoordinationAddOn *)v6 activeNodesUpdateDebounceTimer];
  [v20 setDelegateQueue:queue];

  int v21 = [(HMDPrimaryElectionCoordinationAddOn *)v6 activeNodesUpdateDebounceTimer];
  [v21 resume];

  if (([(HMDPrimaryElectionCoordinationAddOn *)v6 state] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v22 = [(HMDPrimaryElectionCoordinationAddOn *)v6 context];
    uint64_t v23 = [v22 primaryResidentDevice];
    unsigned int v24 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v6, v23);

    if (v24)
    {
      int v25 = (void *)MEMORY[0x230FBD990]();
      __int16 v26 = v6;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        int v34 = 138543362;
        uint64_t v35 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Primary resident is in our mesh", (uint8_t *)&v34, 0xCu);
      }
      [(HMDPrimaryElectionCoordinationAddOn *)v26 setState:2];
    }
  }
  if ([v4 isProcessing])
  {
    if ([v4 isLeader])
    {
      int v29 = -[HMDPrimaryElectionCoordinationAddOn _currentStateRequiresElection]((uint64_t)v6);
      -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:]((uint64_t)v6, v29);
    }
    else
    {
      -[HMDPrimaryElectionCoordinationAddOn _anotherNodeBecameLeader]((dispatch_queue_t *)v6);
    }
  }
  uint64_t v30 = (v9 < 6) & (0xCu >> v9) & (v12 ^ 1);
  uint64_t v31 = objc_alloc_init(HMDCoordinationPrimaryMeshLogEvent);
  -[HMDCoordinationPrimaryMeshLogEvent setIsLeader:](v31, "setIsLeader:", [v4 isLeader]);
  [(HMDCoordinationPrimaryMeshLogEvent *)v31 setDidChangeLeader:0];
  [(HMDCoordinationPrimaryMeshLogEvent *)v31 setDidElectLeader:0];
  unint64_t v32 = [(HMDPrimaryElectionCoordinationAddOn *)v6 state];
  [(HMDCoordinationPrimaryMeshLogEvent *)v31 setIsInSecondaryMesh:(v32 < 6) & (0x30u >> v32)];
  [(HMDCoordinationPrimaryMeshLogEvent *)v31 setDidCurrentDeviceLeavePrimaryMesh:v30];
  uint64_t v33 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v33 submitLogEvent:v31];
}

- (void)_clearPessimisticMeshState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = result;
    result = (void *)[result inPessimisticSecondaryMesh];
    if (result)
    {
      if (result == (void *)2)
      {
        int v2 = (void *)MEMORY[0x230FBD990]();
        id v7 = v1;
        id v4 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          id v5 = HMFGetLogIdentifier();
          *(_DWORD *)unint64_t v8 = 138543362;
          *(void *)&void v8[4] = v5;
          id v6 = "%{public}@Pessimistic secondary mesh state terminated while performing an IDS ping";
          goto LABEL_9;
        }
      }
      else
      {
        if (result != (void *)1) {
          return objc_msgSend(v1, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v8);
        }
        int v2 = (void *)MEMORY[0x230FBD990]();
        id v3 = v1;
        id v4 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          id v5 = HMFGetLogIdentifier();
          *(_DWORD *)unint64_t v8 = 138543362;
          *(void *)&void v8[4] = v5;
          id v6 = "%{public}@Pessimistic secondary mesh state terminated before an IDS ping";
LABEL_9:
          _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, v6, v8, 0xCu);
        }
      }

      return objc_msgSend(v1, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v8);
    }
  }
  return result;
}

- (dispatch_queue_t)_doesLocalMeshContainPrimaryResident:(dispatch_queue_t *)result
{
  if (result)
  {
    int v2 = result;
    id v3 = a2;
    id v4 = -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices](v2);
    uint64_t v5 = -[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:meshCandidates:](v2, v3, v4);

    return (dispatch_queue_t *)v5;
  }
  return result;
}

- (uint64_t)_currentStateRequiresElection
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  __int16 v27 = [*(id *)(a1 + 8) leaderNode];
  int v2 = [(id)a1 lastKnownLeaderNode];
  int v3 = [v27 isEqual:v2];

  id v4 = [(id)a1 context];
  uint64_t v5 = [v4 primaryResidentDevice];

  id v6 = [v5 device];
  id v7 = [v6 idsIdentifier];

  uint64_t v36 = 0;
  BOOL v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  char v35 = [v5 isCurrentDevice] ^ 1;
  unint64_t v8 = [*(id *)(a1 + 8) meshNodes];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __68__HMDPrimaryElectionCoordinationAddOn__currentStateRequiresElection__block_invoke;
  v28[3] = &unk_264A2C7D0;
  uint64_t v30 = &v36;
  v28[4] = a1;
  uint64_t v31 = &v32;
  id v9 = v7;
  id v29 = v9;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

  if (*((unsigned char *)v37 + 24)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *((unsigned char *)v33 + 24) != 0;
  }
  if (v3 && (v10 | [(id)a1 electionGotAborted]) != 1)
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = (id)a1;
    HMFGetOSLogHandle();
    unsigned int v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v41 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@We don't need an election now. No major changes since the last election", buf, 0xCu);
    }
    uint64_t v21 = 0;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = (id)a1;
    HMFGetOSLogHandle();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      [v12 electionGotAborted];
      uint64_t v17 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      id v41 = v14;
      __int16 v42 = 2112;
      id v43 = v15;
      __int16 v44 = 2112;
      id v45 = v16;
      __int16 v46 = 2112;
      id v47 = v17;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@We need an election, leader changed: %@, nodes changed: %@, previous election aborted: %@", buf, 0x2Au);
    }
    uint64_t v18 = 4;
    if (!*((unsigned char *)v33 + 24)) {
      uint64_t v18 = 1;
    }
    uint64_t v19 = 5;
    if (!*((unsigned char *)v37 + 24)) {
      uint64_t v19 = v18;
    }
    if (v3) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 6;
    }
    [v12 setCoordinationUpdateElectionTriggerReason:v20];
    uint64_t v21 = 1;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

- (void)_didBecomeLeaderAndPerformElection:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v4 = [(id)a1 state];
    switch(v4)
    {
      case 4:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:]((void *)a1, 5.0);
        -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)a1);
        break;
      case 2:
        if (a2)
        {
          [(id)a1 performElection];
        }
        else
        {
          uint64_t v5 = (void *)MEMORY[0x263EFFA08];
          id v8 = [*(id *)(a1 + 8) meshNodes];
          uint64_t v6 = [v5 setWithArray:v8];
          id v7 = *(void **)(a1 + 176);
          *(void *)(a1 + 176) = v6;
        }
        break;
      case 0:
        -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:]((void *)a1, 5.0);
        break;
    }
  }
}

- (dispatch_queue_t)_anotherNodeBecameLeader
{
  if (result)
  {
    v1 = result;
    -[HMDPrimaryElectionCoordinationAddOn _stopBeingLeader](result);
    uint64_t v2 = [MEMORY[0x263EFFA08] set];
    dispatch_queue_t v3 = v1[22];
    v1[22] = (dispatch_queue_t)v2;

    return (dispatch_queue_t *)[(dispatch_queue_t *)v1 setElectionGotAborted:0];
  }
  return result;
}

- (void)_stopBeingLeader
{
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(a1[2]);
  uint64_t v2 = [(dispatch_queue_t *)a1 state];
  switch(v2)
  {
    case 5:
      dispatch_queue_t v3 = a1;
      uint64_t v4 = 4;
      goto LABEL_8;
    case 3:
      [(dispatch_queue_t *)a1 setState:2];
      [(dispatch_queue_t *)a1 setElectionGotAborted:1];
      break;
    case 1:
      dispatch_queue_t v3 = a1;
      uint64_t v4 = 0;
LABEL_8:
      [(dispatch_queue_t *)v3 setState:v4];
      break;
  }
  -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer](a1);
}

- (void)_stopSecondaryMeshTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    uint64_t v2 = [(dispatch_queue_t *)a1 secondaryMeshTimer];

    if (v2)
    {
      dispatch_queue_t v3 = (void *)MEMORY[0x230FBD990]();
      uint64_t v4 = a1;
      uint64_t v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = HMFGetLogIdentifier();
        int v8 = 138543362;
        id v9 = v6;
        _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping secondary mesh timer", (uint8_t *)&v8, 0xCu);
      }
      id v7 = [(dispatch_queue_t *)v4 secondaryMeshTimer];
      [v7 suspend];

      [(dispatch_queue_t *)v4 setSecondaryMeshTimer:0];
    }
  }
}

- (void)resumeDebounceWithInterval:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 debounceTimer];
    [v4 timeInterval];
    double v6 = v5;

    if (v6 != a2)
    {
      id v7 = [a1 debounceTimer];
      [v7 suspend];

      int v8 = -[HMDPrimaryElectionCoordinationAddOn _createDebounceTimerWithInterval:](a1, a2);
      [a1 setDebounceTimer:v8];

      uint64_t v9 = a1[2];
      uint64_t v10 = [a1 debounceTimer];
      [v10 setDelegateQueue:v9];

      id v11 = [a1 debounceTimer];
      [v11 setDelegate:a1];
    }
    id v12 = [a1 debounceTimer];
    [v12 resume];
  }
}

- (id)_createDebounceTimerWithInterval:(void *)a1
{
  if (a1)
  {
    dispatch_queue_t v3 = [a1 dataSource];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 createDebounceTimerWithInterval:0 options:a2];
    }
    else
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a2];
    }
    double v6 = (void *)v5;
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

void __68__HMDPrimaryElectionCoordinationAddOn__currentStateRequiresElection__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 176), "containsObject:") ^ 1;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    double v6 = (void *)a1[5];
    id v7 = [v8 idsIdentifier];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = objc_msgSend(v6, "hmf_isEqualToUUIDString:", v7) ^ 1;
  }
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

- (void)meshControllerDidElectLeader:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(HMDLocalElectionMeshController *)self->_meshController leaderNode];
  double v6 = [(HMDPrimaryElectionCoordinationAddOn *)self lastKnownLeaderNode];
  int v7 = [v5 isEqual:v6];

  if ([v4 isLeader])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      unint64_t v12 = [(HMDPrimaryElectionCoordinationAddOn *)v9 state];
      if (v12 > 5) {
        id v13 = @"<unknown state>";
      }
      else {
        id v13 = off_264A2C810[v12];
      }
      int v25 = 138543618;
      __int16 v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@We are now the mesh leader in state: %{public}@", (uint8_t *)&v25, 0x16u);
    }
    int v19 = -[HMDPrimaryElectionCoordinationAddOn _currentStateRequiresElection]((uint64_t)v9);
    -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:]((uint64_t)v9, v19);
  }
  else
  {
    -[HMDPrimaryElectionCoordinationAddOn meshLeaderResidentDevice]((dispatch_queue_t *)self);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v25 = 138543618;
      __int16 v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Other device elected mesh leader: %@", (uint8_t *)&v25, 0x16u);
    }
    -[HMDPrimaryElectionCoordinationAddOn _anotherNodeBecameLeader]((dispatch_queue_t *)v16);
  }
  uint64_t v20 = v7 ^ 1u;
  uint64_t v21 = [(HMDLocalElectionMeshController *)self->_meshController meshNodes];
  -[HMDPrimaryElectionCoordinationAddOn setResidentCountDuringLastElection:](self, "setResidentCountDuringLastElection:", [v21 count]);

  uint64_t v22 = objc_alloc_init(HMDCoordinationPrimaryMeshLogEvent);
  -[HMDCoordinationPrimaryMeshLogEvent setIsLeader:](v22, "setIsLeader:", [v4 isLeader]);
  [(HMDCoordinationPrimaryMeshLogEvent *)v22 setDidChangeLeader:v20];
  [(HMDCoordinationPrimaryMeshLogEvent *)v22 setDidElectLeader:1];
  unint64_t v23 = [(HMDPrimaryElectionCoordinationAddOn *)self state];
  [(HMDCoordinationPrimaryMeshLogEvent *)v22 setIsInSecondaryMesh:(v23 < 6) & (0x30u >> v23)];
  [(HMDCoordinationPrimaryMeshLogEvent *)v22 setDidCurrentDeviceLeavePrimaryMesh:0];
  unsigned int v24 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v24 submitLogEvent:v22];

  [(HMDPrimaryElectionCoordinationAddOn *)self setLastKnownLeaderNode:v5];
  -[HMDPrimaryElectionCoordinationAddOn _maybeStartPingTimer]((uint64_t)self);
}

- (id)meshLeaderResidentDevice
{
  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    uint64_t v2 = [v1[1] leaderNode];
    dispatch_queue_t v3 = [v1 context];
    id v4 = [v3 availableResidentDevices];

    objc_msgSend(v4, "hmd_residentDeviceForMeshNode:", v2);
    v1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (void)meshControllerDidStartElection:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  double v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    unint64_t v12 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Election started, suspending ping timer", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [(HMDPrimaryElectionCoordinationAddOn *)v6 pingTimer];
  [v9 suspend];

  [(HMDPrimaryElectionCoordinationAddOn *)v6 setPingTimer:0];
  uint64_t v10 = [(HMDPrimaryElectionCoordinationAddOn *)v6 meshLeaderToPrimaryResidentPingResponseTimer];
  [v10 suspend];

  [(HMDPrimaryElectionCoordinationAddOn *)v6 setMeshLeaderToPrimaryResidentPingResponseTimer:0];
  -[HMDPrimaryElectionCoordinationAddOn _clearPessimisticMeshState](v6);
  -[HMDPrimaryElectionCoordinationAddOn _stopBeingLeader]((dispatch_queue_t *)v6);
}

- (void)meshController:(id)a3 didReceivePingFromLeaderWithPrimaryResidentUUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDPrimaryElectionCoordinationAddOn *)self pingTimer];
  [v8 kick];

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  unint64_t v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received ping from leader. The leader is alive. Primary resident UUID sent by the leader is %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v14 = [(HMDPrimaryElectionCoordinationAddOn *)v10 delegate];
    [v14 primaryElectionAddOn:v10 didReceivePrimaryResidentUUIDFromLeader:v7];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received ping from leader. The leader is alive.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)handleSetPreferredPrimaryDebugRequest:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [v4 messagePayload];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", @"preferred.primary.identifier");

  id v7 = [v4 messagePayload];
  int v8 = objc_msgSend(v7, "hmf_BOOLForKey:", @"preferred.primary.one.time");

  uint64_t v9 = [v4 messagePayload];
  int v10 = objc_msgSend(v9, "hmf_BOOLForKey:", @"preferred.primary.trigger.election");

  int v11 = (void *)MEMORY[0x230FBD990]();
  unint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v14)
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = HMFBooleanToString();
      int v31 = 138543874;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      uint64_t v34 = v6;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received SetPreferredPrimaryDebugRequest with primary: %@ ...isOneTime: %@", (uint8_t *)&v31, 0x20u);
    }
    setPrimaryPreference(v6, v8);
    if (!v10) {
      goto LABEL_22;
    }
LABEL_9:
    id v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = v12;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v31 = 138543362;
      uint64_t v32 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - Triggering resident election", (uint8_t *)&v31, 0xCu);
    }
    if ([v20[1] isLeader])
    {
      uint64_t v23 = [v20 state];
      unsigned int v24 = (void *)MEMORY[0x230FBD990]();
      int v25 = v20;
      __int16 v26 = HMFGetOSLogHandle();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v23 == 2)
      {
        if (v27)
        {
          uint64_t v28 = HMFGetLogIdentifier();
          int v31 = 138543362;
          uint64_t v32 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Handling force resident election request: This device is the leader. Starting election.", (uint8_t *)&v31, 0xCu);
        }
        [v25 _selectPrimaryResidentWithReason:7];
        goto LABEL_22;
      }
      if (v27)
      {
        uint64_t v29 = HMFGetLogIdentifier();
        int v31 = 138543362;
        uint64_t v32 = v29;
        uint64_t v30 = "%{public}@Handling force resident election request: This device is not in the primary mesh. Discarding message.";
        goto LABEL_20;
      }
    }
    else
    {
      unsigned int v24 = (void *)MEMORY[0x230FBD990]();
      int v25 = v20;
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        int v31 = 138543362;
        uint64_t v32 = v29;
        uint64_t v30 = "%{public}@Handling force resident election request: This device is not the leader. Discarding message.";
LABEL_20:
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 0xCu);
      }
    }

    goto LABEL_22;
  }
  if (v14)
  {
    uint64_t v17 = HMFGetLogIdentifier();
    __int16 v18 = HMFBooleanToString();
    int v31 = 138543618;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    uint64_t v34 = v18;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received SetPreferredPrimaryDebugRequest with nil primary, requireOneTime: %@", (uint8_t *)&v31, 0x16u);
  }
  clearPrimaryPreference(v8);
  if (v10) {
    goto LABEL_9;
  }
LABEL_22:
}

- (void)handleMeshInformationRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  id v6 = v5;
  if (v5)
  {
    meshController = self->_meshController;
    int v8 = [v5 home];
    uint64_t v9 = +[HMDPrimaryElectionMeshInformation meshInformationWithMeshController:meshController home:v8];

    int v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    unint64_t v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        BOOL v14 = HMFGetLogIdentifier();
        int v17 = 138543618;
        __int16 v18 = v14;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request and responding with: %@", (uint8_t *)&v17, 0x16u);
      }
      id v15 = [v9 toMessagePayload];
      [v4 respondWithPayload:v15];
    }
    else
    {
      if (v13)
      {
        int v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        __int16 v18 = v16;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request and responding with error", (uint8_t *)&v17, 0xCu);
      }
      id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v9];
  }
}

- (void)handleCurrentPrimaryNotification:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v4 respondWithSuccess];
  uint64_t v5 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  if (v5)
  {
    id v6 = [v4 messagePayload];
    id v7 = objc_msgSend(v6, "hmf_UUIDForKey:", @"uuid");

    if (v7)
    {
      int v8 = -[HMDPrimaryElectionCoordinationAddOn meshLeaderResidentDevice]((dispatch_queue_t *)self);
      if (v8
        && ([v4 remoteSourceDevice],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v8 device],
            int v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v9 isEqual:v10],
            v10,
            v9,
            (v11 & 1) == 0))
      {
        uint64_t v20 = (void *)MEMORY[0x230FBD990]();
        uint64_t v21 = self;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          unsigned int v24 = [v8 shortDescription];
          [v4 remoteSourceDevice];
          uint64_t v52 = v20;
          __int16 v26 = v25 = v8;
          BOOL v27 = [v26 shortDescription];
          *(_DWORD *)buf = 138543874;
          unint64_t v55 = v23;
          __int16 v56 = 2114;
          v57 = v24;
          __int16 v58 = 2114;
          v59 = v27;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received a current primary update from an unexpected device: Leader: %{public}@, Source: %{public}@", buf, 0x20u);

          int v8 = v25;
          uint64_t v20 = v52;
        }
      }
      else
      {
        unint64_t v12 = [v5 availableResidentDevices];
        BOOL v13 = objc_msgSend(v12, "hmd_residentWithIdentifier:", v7);

        if (v13)
        {
          BOOL v14 = self;
          id v15 = v13;
        }
        else
        {
          uint64_t v28 = (void *)MEMORY[0x230FBD990]();
          uint64_t v29 = self;
          uint64_t v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v32 = v31 = v8;
            *(_DWORD *)buf = 138543618;
            unint64_t v55 = v32;
            __int16 v56 = 2114;
            v57 = v7;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to map %{public}@ to known resident", buf, 0x16u);

            int v8 = v31;
          }

          BOOL v14 = v29;
          id v15 = 0;
        }
        if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:]((dispatch_queue_t *)v14, v15))uint64_t v33 = 2; {
        else
        }
          uint64_t v33 = 4;
        [(HMDPrimaryElectionCoordinationAddOn *)self setState:v33];
        uint64_t v34 = [v5 primaryResidentDevice];
        __int16 v35 = [v34 identifier];
        int v36 = [v35 isEqual:v7];

        uint64_t v37 = (void *)MEMORY[0x230FBD990]();
        uint64_t v38 = self;
        char v39 = HMFGetOSLogHandle();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
        if (v36)
        {
          if (v40)
          {
            HMFGetLogIdentifier();
            v41 = BOOL v53 = v8;
            __int16 v42 = [v5 primaryResidentDevice];
            *(_DWORD *)buf = 138543618;
            unint64_t v55 = v41;
            __int16 v56 = 2112;
            v57 = v42;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Broadcasted primary is current primary: %@", buf, 0x16u);

            int v8 = v53;
          }
        }
        else
        {
          if (v40)
          {
            HMFGetLogIdentifier();
            __int16 v44 = v43 = v8;
            *(_DWORD *)buf = 138543618;
            unint64_t v55 = v44;
            __int16 v56 = 2112;
            v57 = v13;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Received update for current primary: %@", buf, 0x16u);

            int v8 = v43;
          }

          if (v13)
          {
            id v45 = [(HMDPrimaryElectionCoordinationAddOn *)v38 delegate];
            [v45 primaryElectionAddOn:v38 didElectPrimaryResident:v13 confirmed:1 electionLogEvent:0];
          }
        }
        uint64_t v46 = v36 ^ 1u;
        id v47 = [v5 currentResidentDevice];
        uint64_t v48 = [v47 identifier];
        uint64_t v49 = [v48 isEqual:v7];

        v50 = [[HMDCoordinationPrimaryElectionLogEvent alloc] initWithIsPrimary:v49 didChangePrimary:v46];
        uint64_t v51 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v51 submitLogEvent:v50];
      }
    }
    else
    {
      int v16 = (void *)MEMORY[0x230FBD990]();
      int v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        unint64_t v55 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain a primary resident value", buf, 0xCu);
      }
    }
  }
}

- (void)handleCurrentPrimaryRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(HMDLocalElectionMeshController *)self->_meshController isLeader] & 1) == 0)
  {
    BOOL v13 = (void *)MEMORY[0x230FBD990]();
    BOOL v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because we're not the leader", buf, 0xCu);
    }
    char v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 91;
    goto LABEL_9;
  }
  uint64_t v5 = [(HMDPrimaryElectionCoordinationAddOn *)self debounceTimer];
  int v6 = [v5 isRunning];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because we are debouncing an election", buf, 0xCu);
    }
    char v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 15;
LABEL_9:
    int v17 = [v11 hmErrorWithCode:v12];
    [v4 respondWithError:v17];
    goto LABEL_18;
  }
  __int16 v18 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  int v17 = [v18 primaryResidentDevice];

  __int16 v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  uint64_t v22 = v21;
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      unsigned int v24 = [v4 remoteSourceDevice];
      int v25 = [v17 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v23;
      __int16 v34 = 2114;
      __int16 v35 = v24;
      __int16 v36 = 2114;
      uint64_t v37 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Responding to current primary request from: %{public}@ with: %{public}@", buf, 0x20u);
    }
    __int16 v26 = objc_msgSend(v17, "identifier", @"uuid");
    BOOL v27 = [v26 UUIDString];
    int v31 = v27;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v4 respondWithPayload:v28];
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v29;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not responding to current primary request because our primary resident is nil", buf, 0xCu);
    }
    __int16 v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v26];
  }

LABEL_18:
}

- (void)handleDeviceCapabilitiesRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 remoteSourceDevice];
    int v13 = 138543618;
    BOOL v14 = v8;
    __int16 v15 = 2112;
    int v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received capabilities request from: %@", (uint8_t *)&v13, 0x16u);
  }
  int v10 = [(HMDPrimaryElectionCoordinationAddOn *)v6 pingTimer];
  [v10 kick];

  char v11 = -[HMDPrimaryElectionCoordinationAddOn candidateRepresentation](v6);
  uint64_t v12 = [v11 toMessagePayload];
  [v4 respondWithPayload:v12];
}

- (unint64_t)messageTransportRestriction
{
  return 14;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  uint64_t v2 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  dispatch_queue_t v3 = [v2 home];
  id v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (id)primarySortComparatorForCurrentPrimary:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HMDPrimaryElectionCoordinationAddOn_primarySortComparatorForCurrentPrimary___block_invoke;
  aBlock[3] = &unk_264A2C738;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __78__HMDPrimaryElectionCoordinationAddOn_primarySortComparatorForCurrentPrimary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 currentPrimary:*(void *)(a1 + 32) outCriteria:0];
}

- (void)_selectPrimaryResidentWithReason:(unint64_t)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    BOOL v40 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Electing a primary resident", buf, 0xCu);
  }
  if (a3 == 7)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = v6;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v40 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Calling _selectPrimaryResidentFromCandidates due to forced primary election from debug/tools", buf, 0xCu);
    }
  }
  int v13 = [(HMDPrimaryElectionCoordinationAddOn *)v6 debounceTimer];
  int v14 = [v13 isRunning];

  if (v14)
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = v6;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v40 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Debounce timer active, deferring election", buf, 0xCu);
    }
  }
  else
  {
    __int16 v19 = [(HMDPrimaryElectionCoordinationAddOn *)v6 context];
    uint64_t v20 = [v19 currentResidentDevice];

    if (v20)
    {
      [(HMDPrimaryElectionCoordinationAddOn *)v6 setState:3];
      uint64_t v21 = [(HMDPrimaryElectionCoordinationAddOn *)v6 context];
      uint64_t v22 = (void *)MEMORY[0x263EFFA08];
      uint64_t v23 = [(HMDLocalElectionMeshController *)v6->_meshController meshNodes];
      unsigned int v24 = [v22 setWithArray:v23];

      int v25 = -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)v6);
      __int16 v26 = [v25 setByAddingObject:v20];
      objc_initWeak((id *)buf, v6);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __72__HMDPrimaryElectionCoordinationAddOn__selectPrimaryResidentWithReason___block_invoke;
      v34[3] = &unk_264A2C6C8;
      objc_copyWeak(v38, (id *)buf);
      id v27 = v25;
      id v35 = v27;
      id v28 = v24;
      id v36 = v28;
      id v29 = v21;
      id v37 = v29;
      v38[1] = (id)a3;
      -[HMDPrimaryElectionCoordinationAddOn _requestElectionParametersFromCandidates:completionHandler:]((dispatch_queue_t *)v6, v26, v34);

      objc_destroyWeak(v38);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      int v31 = v6;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        BOOL v40 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@No current resident device, bailing", buf, 0xCu);
      }
    }
  }
}

void __72__HMDPrimaryElectionCoordinationAddOn__selectPrimaryResidentWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained
    && -[HMDPrimaryElectionCoordinationAddOn _expectState:action:](WeakRetained, 3, @"aborting election"))
  {
    -[HMDPrimaryElectionCoordinationAddOn _selectPrimaryResidentFromCandidates:meshCandidates:meshCandidateNodes:context:electionTriggerReason:](v4, v5, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 64));
    clearPrimaryPreference(1);
  }
}

- (void)selectPrimaryResidentWithReason:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__HMDPrimaryElectionCoordinationAddOn_selectPrimaryResidentWithReason___block_invoke;
  v4[3] = &unk_264A2C6A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __71__HMDPrimaryElectionCoordinationAddOn_selectPrimaryResidentWithReason___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 8) isLeader])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _selectPrimaryResidentWithReason:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not running primary resident election because this device is not the leader", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_findPrimaryMeshWithContext:(id)a3 otherResidents:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v6 = (void *)[objc_alloc(MEMORY[0x263F42520]) initWithQueue:self->_queue];
  id v7 = [v5 cloudReady];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__HMDPrimaryElectionCoordinationAddOn__findPrimaryMeshWithContext_otherResidents___block_invoke;
  v10[3] = &unk_264A2C678;
  void v10[4] = self;
  id v11 = v5;
  id v8 = v5;
  id v9 = (id)[v7 inContext:v6 then:v10];
}

uint64_t __82__HMDPrimaryElectionCoordinationAddOn__findPrimaryMeshWithContext_otherResidents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (-[HMDPrimaryElectionCoordinationAddOn _expectState:action:](*(void **)(a1 + 32), 1, @"deciding if we're in primary mesh"))
  {
    id v4 = [*(id *)(a1 + 40) primaryResidentDevice];
    if (v4)
    {
      if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:](*(dispatch_queue_t **)(a1 + 32), v4))
      {
        [*(id *)(a1 + 32) setState:2];
        [*(id *)(a1 + 32) _selectPrimaryResidentWithReason:2];
      }
      else
      {
        id v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = *(id *)(a1 + 32);
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          int v14 = 138543362;
          __int16 v15 = v12;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Pinging primary resident", (uint8_t *)&v14, 0xCu);
        }
        [*(id *)(a1 + 32) setState:4];
        -[HMDPrimaryElectionCoordinationAddOn _pingPrimaryResident](*(dispatch_queue_t **)(a1 + 32));
      }
    }
    else
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v14 = 138543362;
        __int16 v15 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@No primary resident after cloud ready, doing a meta mesh election", (uint8_t *)&v14, 0xCu);
      }
      [*(id *)(a1 + 32) setState:2];
      -[HMDPrimaryElectionCoordinationAddOn _doMetaMeshElection](*(dispatch_queue_t **)(a1 + 32));
    }
  }
  return 1;
}

- (id)residentsInMesh
{
  -[HMDPrimaryElectionCoordinationAddOn createMissingResidentDevicesFromMeshNodes:](self, self->_meshController);
  return -[HMDPrimaryElectionCoordinationAddOn _meshNodesToResidentDevices]((dispatch_queue_t *)self);
}

- (void)setState:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t state = self->_state;
  if (state != a3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = (void *)v9;
      if (state > 5) {
        id v11 = @"<unknown state>";
      }
      else {
        id v11 = off_264A2C810[state];
      }
      if (a3 > 5) {
        uint64_t v12 = @"<unknown state>";
      }
      else {
        uint64_t v12 = off_264A2C810[a3];
      }
      *(_DWORD *)uint64_t v21 = 138543874;
      *(void *)&v21[4] = v9;
      *(_WORD *)&v21[12] = 2114;
      *(void *)&v21[14] = v11;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Transitioning state from %{public}@ -> %{public}@", v21, 0x20u);
    }
    self->_unint64_t state = a3;
    if (state != 5)
    {
      if (state != 4)
      {
        if (state == 1)
        {
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          int v13 = [(HMDPrimaryElectionCoordinationAddOn *)v7 findPrimaryMeshOperation];
          [(HMDPrimaryElectionCoordinationAddOn *)v7 setFindPrimaryMeshOperation:0];
          [(HMDPrimaryElectionCoordinationAddOn *)v7 setFindPrimaryMeshFuture:0];
          [v13 cancel];
        }
        return;
      }
LABEL_24:
      -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer]((dispatch_queue_t *)v7);
      return;
    }
    if ([(HMDPrimaryElectionCoordinationAddOn *)v7 inPessimisticSecondaryMesh] != 2) {
      goto LABEL_24;
    }
    uint64_t v14 = [(HMDPrimaryElectionCoordinationAddOn *)v7 state];
    if (v14 == 4)
    {
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v7;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v21 = 138543362;
        *(void *)&v21[4] = v18;
        __int16 v19 = "%{public}@Staying in secondary mesh state after being in pessimistic secondary mesh";
        goto LABEL_21;
      }
    }
    else
    {
      if (v14 != 2)
      {
LABEL_23:
        -[HMDPrimaryElectionCoordinationAddOn setInPessimisticSecondaryMesh:](v7, "setInPessimisticSecondaryMesh:", 0, *(_OWORD *)v21);
        goto LABEL_24;
      }
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = v7;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v21 = 138543362;
        *(void *)&v21[4] = v18;
        __int16 v19 = "%{public}@Becoming primary after pinging in pessimistic secondary mesh";
LABEL_21:
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, v19, v21, 0xCu);
      }
    }

    goto LABEL_23;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  id v6 = [v5 primaryResidentDevice];
  char v7 = [v4 isEqual:v6];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = [(HMDPrimaryElectionCoordinationAddOn *)self residentIsPartOfTheCurrentMesh:v4];
    BOOL v8 = 1;
    if ([(HMDLocalElectionMeshController *)self->_meshController isLeader] && v9)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v4 shortDescription];
        int v16 = 138543618;
        uint64_t v17 = v13;
        __int16 v18 = 2114;
        __int16 v19 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not allowing external update of primary resident to: %{public}@ because we are the leader and this resident is in our mesh.", (uint8_t *)&v16, 0x16u);
      }
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = -[HMDPrimaryElectionCoordinationAddOn meshNodeForResident:]((uint64_t)self, v5);

  return v6 != 0;
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__HMDPrimaryElectionCoordinationAddOn_primaryResidentChanged_previousResidentDevice___block_invoke;
  block[3] = &unk_264A2F2F8;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __85__HMDPrimaryElectionCoordinationAddOn_primaryResidentChanged_previousResidentDevice___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(id **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [v2 state];
    if ([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 48)]) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 40);
      BOOL v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = *(__CFString **)(a1 + 32);
        int v22 = 138543618;
        uint64_t v23 = v9;
        __int16 v24 = 2112;
        int v25 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling new primary resident: %@", (uint8_t *)&v22, 0x16u);
      }
      if (-[HMDPrimaryElectionCoordinationAddOn _doesLocalMeshContainPrimaryResident:](*(dispatch_queue_t **)(a1 + 40), *(void **)(a1 + 32)))uint64_t v11 = 2; {
      else
      }
        uint64_t v11 = 4;
      if (v11 != v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "setState:");
        if ([*(id *)(*(void *)(a1 + 40) + 8) isLeader])
        {
          id v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = *(id *)(a1 + 40);
          id v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            __int16 v15 = HMFGetLogIdentifier();
            unint64_t v16 = [*(id *)(a1 + 40) state];
            if (v16 > 5) {
              uint64_t v17 = @"<unknown state>";
            }
            else {
              uint64_t v17 = off_264A2C810[v16];
            }
            int v22 = 138543618;
            uint64_t v23 = v15;
            __int16 v24 = 2112;
            int v25 = v17;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received a primary resident change while we are the leader in state: %@.", (uint8_t *)&v22, 0x16u);
          }
          -[HMDPrimaryElectionCoordinationAddOn _didBecomeLeaderAndPerformElection:](*(void *)(a1 + 40), 1);
        }
      }
    }
  }
  else if ([v2[1] isLeader] && objc_msgSend(*(id *)(a1 + 40), "state") == 2)
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Primary resident was set to nil, calling an election", (uint8_t *)&v22, 0xCu);
    }
    [*(id *)(a1 + 40) performElection];
  }
}

- (void)performElection
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDLocalElectionMeshController *)self->_meshController meshNodes];
  uint64_t v4 = [v3 count];

  if ([(HMDPrimaryElectionCoordinationAddOn *)self residentCountDuringLastElection] < 2
    || v4)
  {
    -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:](self, 5.0);
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = [(HMDPrimaryElectionCoordinationAddOn *)v6 residentCountDuringLastElection];
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Rapportd might have died (%lu -> %lu visible devices)", (uint8_t *)&v18, 0x20u);
    }
    id v9 = [(HMDPrimaryElectionCoordinationAddOn *)v6 context];
    id v10 = [v9 primaryResidentDevice];
    char v11 = [v10 isCurrentDevice];

    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = v6;
    id v14 = HMFGetOSLogHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        unint64_t v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@We are the current primary resident, using the cautious debounce timeout", (uint8_t *)&v18, 0xCu);
      }
      -[HMDPrimaryElectionCoordinationAddOn resumeDebounceWithInterval:](v13, 45.0);
    }
    else
    {
      if (v15)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v17;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@We are not the current primary, going to pessimistic secondary mesh state", (uint8_t *)&v18, 0xCu);
      }
      [(HMDPrimaryElectionCoordinationAddOn *)v13 setState:4];
      [(HMDPrimaryElectionCoordinationAddOn *)v13 setInPessimisticSecondaryMesh:1];
      -[HMDPrimaryElectionCoordinationAddOn _startSecondaryMeshTimer]((dispatch_queue_t *)v13);
    }
  }
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  uint64_t v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDLocalElectionMeshController *)v4->_meshController debugDescriptionForControllerType];
    int v10 = 138543618;
    char v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping mesh controller with type: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  BOOL v8 = [(HMDPrimaryElectionCoordinationAddOn *)v4 debounceTimer];
  [v8 suspend];

  id v9 = [(HMDPrimaryElectionCoordinationAddOn *)v4 pingTimer];
  [v9 suspend];

  -[HMDPrimaryElectionCoordinationAddOn _stopSecondaryMeshTimer]((dispatch_queue_t *)v4);
  [(HMDLocalElectionMeshController *)v4->_meshController stop];
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = NSString;
  uint64_t v4 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  BOOL v5 = [v4 home];
  id v6 = [v5 uuid];
  id v7 = [v3 stringWithFormat:@"%@.%@", @"com.apple.HomeKit.HH2", v6];

  BOOL v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = HMFGetLogIdentifier();
    __int16 v12 = [(HMDLocalElectionMeshController *)v9->_meshController debugDescriptionForControllerType];
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    unint64_t v16 = v12;
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting mesh controller with type: %{public}@, name: %{public}@", buf, 0x20u);
  }
  [(HMDLocalElectionMeshController *)v9->_meshController startMeshWithName:v7];
}

- (void)registerForMessages
{
  v20[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(HMDPrimaryElectionCoordinationAddOn *)self context];
  uint64_t v4 = [v3 messageDispatcher];
  BOOL v5 = [v3 home];
  id v6 = +[HMDRemoteMessagePolicy defaultPolicy];
  [v6 setRequiresSecureMessage:1];
  [v6 setRequiresAccountMessage:1];
  id v7 = (void *)[v6 copy];
  BOOL v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:3 remoteAccessRequired:0];
  v20[0] = v7;
  v20[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v4 registerForMessage:@"mesh.requestCapabilities" receiver:self policies:v9 selector:sel_handleDeviceCapabilitiesRequest_];

  v19[0] = v7;
  v19[1] = v8;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v4 registerForMessage:@"mesh.requestCurrentPrimary" receiver:self policies:v10 selector:sel_handleCurrentPrimaryRequest_];

  v18[0] = v7;
  v18[1] = v8;
  char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v4 registerForMessage:@"mesh.currentPrimaryUpdate" receiver:self policies:v11 selector:sel_handleCurrentPrimaryNotification_];

  if (isInternalBuild())
  {
    v17[0] = v7;
    v17[1] = v8;
    __int16 v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [v4 registerForMessage:@"mesh.setPreferredPrimary.debug" receiver:self policies:v12 selector:sel_handleSetPreferredPrimaryDebugRequest_];
  }
  id v13 = +[HMDRemoteMessagePolicy defaultPolicy];
  [v13 setRequiresSecureMessage:1];
  [v6 setRequiresAccountMessage:1];
  objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
  uint64_t v14 = (void *)[v13 copy];
  v16[0] = v14;
  v16[1] = v8;
  __int16 v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v4 registerForMessage:@"mesh.meshInformationRequest" receiver:self policies:v15 selector:sel_handleMeshInformationRequest_];
}

- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3 meshController:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HMDPrimaryElectionCoordinationAddOn;
  char v11 = [(HMDPrimaryElectionCoordinationAddOn *)&v32 init];
  objc_storeWeak((id *)v11 + 10, v8);
  uint64_t v12 = [v8 queue];
  id v13 = (void *)*((void *)v11 + 2);
  *((void *)v11 + 2) = v12;

  uint64_t v14 = [objc_alloc(MEMORY[0x263F42520]) initWithQueue:*((void *)v11 + 2)];
  __int16 v15 = (void *)*((void *)v11 + 17);
  *((void *)v11 + 17) = v14;

  if (v9)
  {
    id v16 = v9;
    __int16 v17 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v16;
  }
  else
  {
    id v18 = *((id *)v11 + 2);
    uint64_t v19 = [[HMDCoordinationLocalElectionMeshController alloc] initWithQueue:v18];

    __int16 v17 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v19;
  }

  [*((id *)v11 + 1) setDelegate:v11];
  objc_storeStrong((id *)v11 + 11, a5);
  uint64_t v20 = -[HMDPrimaryElectionCoordinationAddOn _createDebounceTimerWithInterval:](v11, 5.0);
  uint64_t v21 = (void *)*((void *)v11 + 6);
  *((void *)v11 + 6) = v20;

  [*((id *)v11 + 6) setDelegate:v11];
  [*((id *)v11 + 6) setDelegateQueue:*((void *)v11 + 2)];
  __int16 v22 = [v10 remoteDeviceMonitor];
  uint64_t v23 = v22;
  if (v22)
  {
    id v24 = v22;
    int v25 = (void *)*((void *)v11 + 16);
    *((void *)v11 + 16) = v24;
  }
  else
  {
    int v25 = [v8 messageDispatcher];
    uint64_t v26 = [v25 secureRemoteTransport];
    uint64_t v27 = [v26 deviceMonitor];
    id v28 = (void *)*((void *)v11 + 16);
    *((void *)v11 + 16) = v27;
  }
  *((void *)v11 + 5) = 0;
  uint64_t v29 = [MEMORY[0x263EFFA08] set];
  uint64_t v30 = (void *)*((void *)v11 + 22);
  *((void *)v11 + 22) = v29;

  v11[24] = 0;
  *(_OWORD *)(v11 + 152) = xmmword_2303D40F0;

  return (HMDPrimaryElectionCoordinationAddOn *)v11;
}

- (HMDPrimaryElectionCoordinationAddOn)initWithContext:(id)a3
{
  return [(HMDPrimaryElectionCoordinationAddOn *)self initWithContext:a3 meshController:0 dataSource:0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t125 != -1) {
    dispatch_once(&logCategory__hmf_once_t125, &__block_literal_global_105_250490);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v126;
  return v2;
}

void __50__HMDPrimaryElectionCoordinationAddOn_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v126;
  logCategory__hmf_once_v126 = v0;
}

@end