@interface HMDResidentSelectionCoordinationElection
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4;
- (BOOL)residentIsLocallyReachable:(id)a3;
- (HMDPreferredResidentsList)localPreferredResidentsList;
- (HMDPrimaryElectionCoordinationAddOn)coordinationAddOn;
- (HMDResidentDeviceManagerContext)context;
- (HMDResidentSelectionCoordinationElection)initWithContext:(id)a3;
- (HMDResidentSelectionModeDelegate)delegate;
- (NSSet)locallyReachableResidents;
- (id)_residentDeviceWithIdentifier:(id)a3;
- (id)createElectionAddOnWithContext:(id)a3;
- (id)dumpState;
- (id)residentsNotPresentInPreferredResidentsList:(id)a3;
- (id)sortedResidents;
- (unint64_t)currentModeType;
- (unint64_t)primaryChangedReason;
- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3;
- (void)currentDeviceReadyAsAResident;
- (void)didReceiveSelectionMessage:(id)a3;
- (void)didUpdateResidentSelectionModelTo:(id)a3;
- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5;
- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6;
- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4;
- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4;
- (void)registerForMessages;
- (void)setCoordinationAddOn:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDResidentSelectionCoordinationElection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_coordinationAddOn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (void)setCoordinationAddOn:(id)a3
{
}

- (HMDPrimaryElectionCoordinationAddOn)coordinationAddOn
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)primaryChangedReason
{
  return self->_primaryChangedReason;
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentSelectionModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDResidentSelectionModeDelegate *)WeakRetained;
}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionCoordinationElection *)self delegate];
  [v6 primarySelectionMode:self didUpdateResidentDevice:v5];
}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionCoordinationElection *)self delegate];
  [v6 primarySelectionMode:self didUpdateActiveNodes:v5];
}

- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4
{
  id v8 = [(HMDResidentSelectionCoordinationElection *)self _residentDeviceWithIdentifier:a4];
  id v5 = [(HMDResidentSelectionCoordinationElection *)self delegate];
  id v6 = [v8 device];
  v7 = [v6 idsIdentifier];
  [v5 primarySelectionMode:self didReceivePrimaryResidentIdsIdentifier:v7 selectionTimestamp:0];
}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionCoordinationElection *)self delegate];
  [v6 primarySelectionMode:self didFailToSelectWithError:v5];
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = [(HMDResidentSelectionCoordinationElection *)self delegate];
  [v10 primarySelectionMode:self didSelectPrimaryResident:v9 selectionInfo:0 selectionLogEvent:v8 completion:0];
}

- (id)_residentDeviceWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HMDResidentSelectionCoordinationElection *)self context];
  id v6 = [v5 availableResidentDevices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 identifier];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)sortedResidents
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v15 = HMFGetLogIdentifier();
    long long v16 = NSStringFromSelector(a2);
    int v17 = 138543618;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v17, 0x16u);
  }
}

- (void)didReceiveSelectionMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v11, 0x16u);
  }
}

- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v10, 0x16u);
  }
}

- (void)currentDeviceReadyAsAResident
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v9, 0x16u);
  }
}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v11, 0x16u);
  }
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  int v11 = (void *)MEMORY[0x230FBD990]();
  __int16 v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = NSStringFromSelector(a2);
    int v16 = 138543618;
    int v17 = v14;
    __int16 v18 = 2112;
    __int16 v19 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v16, 0x16u);
  }
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  char v7 = [v6 allowExternalUpdateOfPrimaryResidentTo:v5];

  return v7;
}

- (id)dumpState
{
  v2 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  v3 = [v2 dumpState];

  return v3;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = NSStringFromSelector(a2);
    int v12 = 138543618;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" not relevant in REv2", (uint8_t *)&v12, 0x16u);
  }

  return 0;
}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  char v6 = [v5 residentIsPartOfTheCurrentMesh:v4];

  return v6;
}

- (void)registerForMessages
{
  id v2 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  [v2 registerForMessages];
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  [v8 primaryResidentChanged:v7 previousResidentDevice:v6];
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  return 0;
}

- (NSSet)locallyReachableResidents
{
  id v2 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  v3 = [v2 residentsInMesh];

  return (NSSet *)v3;
}

- (void)stop
{
  id v2 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  [v2 stop];
}

- (void)start
{
  v3 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  [v3 registerForMessages];

  id v4 = [(HMDResidentSelectionCoordinationElection *)self coordinationAddOn];
  [v4 start];
}

- (unint64_t)currentModeType
{
  return 1;
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDPrimaryElectionCoordinationAddOn alloc] initWithContext:v3];

  return v4;
}

- (HMDResidentSelectionCoordinationElection)initWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDResidentSelectionCoordinationElection;
  id v3 = a3;
  id v4 = [(HMDResidentSelectionCoordinationElection *)&v8 init];
  objc_storeWeak((id *)&v4->_context, v3);
  uint64_t v5 = -[HMDResidentSelectionCoordinationElection createElectionAddOnWithContext:](v4, "createElectionAddOnWithContext:", v3, v8.receiver, v8.super_class);

  coordinationAddOn = v4->_coordinationAddOn;
  v4->_coordinationAddOn = (HMDPrimaryElectionCoordinationAddOn *)v5;

  [(HMDPrimaryElectionCoordinationAddOn *)v4->_coordinationAddOn setDelegate:v4];
  return v4;
}

@end