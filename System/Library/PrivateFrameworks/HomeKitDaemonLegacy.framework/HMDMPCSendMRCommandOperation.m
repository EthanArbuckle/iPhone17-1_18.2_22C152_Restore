@interface HMDMPCSendMRCommandOperation
+ (id)logCategory;
+ (id)shortDescription;
- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6;
- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 options:(id)a4 destination:(id)a5;
- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6;
- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 options:(id)a4 destination:(id)a5;
- (HMDMPCSendMRCommandOperationExternalObjectInterface)externalObjectInterface;
- (MPCAssistantRemoteControlDestination)destination;
- (MPPlaybackArchive)playbackArchive;
- (NSArray)attributeDescriptions;
- (NSDictionary)options;
- (NSNumber)mediaRemoteCommand;
- (NSString)description;
- (NSString)shortDescription;
- (int64_t)errorCodeForCurrentOperation;
- (void)generateMPCErrorOrFinishWithError:(void *)a3 statuses:;
- (void)main;
@end

@implementation HMDMPCSendMRCommandOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalObjectInterface, 0);
  objc_storeStrong((id *)&self->_mediaRemoteCommand, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (HMDMPCSendMRCommandOperationExternalObjectInterface)externalObjectInterface
{
  return (HMDMPCSendMRCommandOperationExternalObjectInterface *)objc_getProperty(self, a2, 344, 1);
}

- (NSNumber)mediaRemoteCommand
{
  return self->_mediaRemoteCommand;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (MPCAssistantRemoteControlDestination)destination
{
  return self->_destination;
}

- (int64_t)errorCodeForCurrentOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];

  if (!v3)
  {
    v8 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];

    if (v8)
    {
      v9 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];
      int v10 = [v9 unsignedIntValue];

      switch(v10)
      {
        case 0:
          return 2959;
        case 1:
          return 2960;
        case 3:
          return 2961;
      }
      v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      v17 = HMFGetLogIdentifier();
      v18 = [(HMDMPCSendMRCommandOperation *)v15 mediaRemoteCommand];
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 1024;
      int v22 = [v18 unsignedIntValue];
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unhandled MR command case %u", (uint8_t *)&v19, 0x12u);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        return 2957;
      }
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Generic MR command error", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_19;
  }
  v4 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];
  v5 = [v4 bundleIdentifier];
  char v6 = [v5 hasPrefix:@"com.apple.SoundScapes"];

  if (v6) {
    return 2964;
  }
  v11 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];
  v12 = [v11 bundleIdentifier];
  int v13 = [v12 hasPrefix:@"com.apple.Music"];

  if (v13) {
    return 2963;
  }
  else {
    return 2958;
  }
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];
  v5 = (void *)[v3 initWithName:@"Media Remote Command" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDMPCSendMRCommandOperation *)self options];
  v8 = (void *)[v6 initWithName:@"Options" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v10 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];
  v11 = (void *)[v9 initWithName:@"Playback Archive" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v13 = [(HMDMPCSendMRCommandOperation *)self destination];
  v14 = (void *)[v12 initWithName:@"Destination" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];
  id v6 = [(HMDMPCSendMRCommandOperation *)self options];
  v7 = [(HMDMPCSendMRCommandOperation *)self destination];
  v8 = [v3 stringWithFormat:@"%@ MR Command: %@, options: %@ destination: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)main
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(HMDMPCSendMRCommandOperation *)self dependencies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = [v8 error];

        if (v9)
        {
          id v12 = [v8 error];
          [(HMFOperation *)self cancelWithError:v12];
          goto LABEL_18;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  int v10 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];

  if (v10)
  {
    id v3 = [(HMDMPCSendMRCommandOperation *)self mediaRemoteCommand];
    uint64_t v11 = [v3 unsignedIntValue];
    id v12 = [(HMDMPCSendMRCommandOperation *)self destination];
    int v13 = [(HMDMPCSendMRCommandOperation *)self options];
    v14 = v13;
    if (!self) {
      goto LABEL_17;
    }
    id v15 = v13;
    id v16 = v12;
    v17 = [(HMDMPCSendMRCommandOperation *)self externalObjectInterface];
    v18 = [v17 createMPCAssistantCommand];

    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __66__HMDMPCSendMRCommandOperation_sendMRCommand_destination_options___block_invoke;
    v32 = &unk_1E6A14DC8;
    v33 = self;
    id v34 = v18;
    id v19 = v18;
    [v19 sendCommand:v11 toDestination:v16 withOptions:v15 completion:&v29];
    goto LABEL_16;
  }
  v20 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];

  if (!v20)
  {
    id v3 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2962 description:@"No command or queue in SendCommandOperation" underlyingError:0];
    [(HMFOperation *)self cancelWithError:v3];
    goto LABEL_19;
  }
  id v3 = [(HMDMPCSendMRCommandOperation *)self playbackArchive];
  id v12 = [(HMDMPCSendMRCommandOperation *)self destination];
  __int16 v21 = [(HMDMPCSendMRCommandOperation *)self options];
  v14 = v21;
  if (self)
  {
    id v22 = v21;
    id v15 = v12;
    id v16 = v3;
    uint64_t v23 = [(HMDMPCSendMRCommandOperation *)self externalObjectInterface];
    v24 = [v23 createMPCAssistantCommand];

    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __72__HMDMPCSendMRCommandOperation_sendPlaybackArchive_destination_options___block_invoke;
    v32 = &unk_1E6A14DC8;
    v33 = self;
    id v34 = v24;
    id v19 = v24;
    [v19 sendPlaybackArchive:v16 toDestination:v15 withOptions:v22 completion:&v29];

LABEL_16:
  }
LABEL_17:

LABEL_18:
LABEL_19:
}

void __72__HMDMPCSendMRCommandOperation_sendPlaybackArchive_destination_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2080;
    v14 = "-[HMDMPCSendMRCommandOperation sendPlaybackArchive:destination:options:]_block_invoke";
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[HMDMPCSendMRCommandOperation] %s", (uint8_t *)&v11, 0x16u);
  }
  -[HMDMPCSendMRCommandOperation generateMPCErrorOrFinishWithError:statuses:](*(void **)(a1 + 32), v5, v6);
}

- (void)generateMPCErrorOrFinishWithError:(void *)a3 statuses:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_35;
  }
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v40 = v10;
    __int16 v41 = 2112;
    id v42 = v5;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDMPCSendMRCommandOperation] error %@ statuses %@", buf, 0x20u);
  }
  int v11 = [v8 mediaRemoteCommand];
  if (v11)
  {
    id v12 = [v8 mediaRemoteCommand];
    BOOL v13 = [v12 unsignedIntValue] == 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  if (!v5) {
    goto LABEL_16;
  }
  if (MRMediaRemoteErrorIsInformational())
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v8;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v17;
      v18 = "%{public}@[HMDMPCSendMRCommandOperation] discarding informational media remote error";
      id v19 = v16;
      uint32_t v20 = 12;
LABEL_14:
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (MPCAssistantErrorIsInformational())
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    id v21 = v8;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      __int16 v41 = 2112;
      id v42 = v5;
      v18 = "%{public}@[HMDMPCSendMRCommandOperation] discarding informational media playback core assistant error: %@";
      id v19 = v16;
      uint32_t v20 = 22;
      goto LABEL_14;
    }
LABEL_15:

LABEL_16:
    if (v13 & [v6 containsObject:&unk_1F2DC9BE0])
    {
      id v5 = 0;
      goto LABEL_18;
    }
    if ([v6 containsObject:&unk_1F2DC9BF8])
    {
      id v5 = 0;
LABEL_24:
      [v8 finish];
      goto LABEL_35;
    }
    long long v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28228];
    long long v27 = [NSString stringWithFormat:@"statuses %@", v6];
    v38 = v27;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v29 = [v26 hmErrorWithCode:2005 userInfo:v28];

    id v5 = 0;
    if (!v29) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  uint64_t v30 = [v5 domain];
  if ([v30 isEqualToString:*MEMORY[0x1E4F76DE8]]) {
    BOOL v31 = [v5 code] == 1 || objc_msgSend(v5, "code") == 18;
  }
  else {
    BOOL v31 = 0;
  }

  if ((v13 & ([v6 containsObject:&unk_1F2DC9BE0] | v31)) == 1)
  {
LABEL_18:
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = v8;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDMPCSendMRCommandOperation] discarding pause media remote error and assuming success as there is no now playing application (%@)", buf, 0x16u);
    }
    goto LABEL_24;
  }
  id v29 = v5;
  id v5 = v29;
LABEL_32:
  v32 = objc_msgSend(MEMORY[0x1E4F28C58], "hmPrivateErrorWithCode:description:underlyingError:", objc_msgSend(v8, "errorCodeForCurrentOperation"), @"Media remote MPC command failure", v29);
  v33 = (void *)MEMORY[0x1D9452090]();
  id v34 = v8;
  v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v40 = v36;
    __int16 v41 = 2112;
    id v42 = v32;
    __int16 v43 = 2112;
    id v44 = v29;
    _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HMDMPCSendMRCommandOperation] Cancel with error %@, underlying error: %@", buf, 0x20u);
  }
  [v34 cancelWithError:v32];

LABEL_35:
}

void __66__HMDMPCSendMRCommandOperation_sendMRCommand_destination_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2080;
    v14 = "-[HMDMPCSendMRCommandOperation sendMRCommand:destination:options:]_block_invoke";
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[HMDMPCSendMRCommandOperation] %s", (uint8_t *)&v11, 0x16u);
  }
  -[HMDMPCSendMRCommandOperation generateMPCErrorOrFinishWithError:statuses:](*(void **)(a1 + 32), v5, v6);
}

- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDMPCSendMRCommandOperation;
  uint64_t v15 = [(HMFOperation *)&v20 initWithTimeout:0.0];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_playbackArchive, a3);
    objc_storeStrong((id *)&v16->_destination, a4);
    uint64_t v17 = [v13 copy];
    options = v16->_options;
    v16->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v16->_externalObjectInterface, a6);
  }

  return v16;
}

- (HMDMPCSendMRCommandOperation)initWithPlaybackArchive:(id)a3 options:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDMPCSendMRCommandOperationDefaultExternalObjectInterface);
  id v12 = [(HMDMPCSendMRCommandOperation *)self initWithPlaybackArchive:v10 destination:v8 options:v9 externalObjectInterface:v11];

  return v12;
}

- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 destination:(id)a4 options:(id)a5 externalObjectInterface:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDMPCSendMRCommandOperation;
  id v14 = [(HMFOperation *)&v20 initWithTimeout:0.0];
  if (v14)
  {
    uint64_t v15 = [NSNumber numberWithUnsignedInt:v9];
    mediaRemoteCommand = v14->_mediaRemoteCommand;
    v14->_mediaRemoteCommand = (NSNumber *)v15;

    uint64_t v17 = [v12 copy];
    options = v14->_options;
    v14->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_destination, a4);
    objc_storeStrong((id *)&v14->_externalObjectInterface, a6);
  }

  return v14;
}

- (HMDMPCSendMRCommandOperation)initWithCommand:(unsigned int)a3 options:(id)a4 destination:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(HMDMPCSendMRCommandOperationDefaultExternalObjectInterface);
  id v11 = [(HMDMPCSendMRCommandOperation *)self initWithCommand:v6 destination:v8 options:v9 externalObjectInterface:v10];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_161363 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_161363, &__block_literal_global_161364);
  }
  v2 = (void *)logCategory__hmf_once_v10_161365;
  return v2;
}

uint64_t __43__HMDMPCSendMRCommandOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_161365;
  logCategory__hmf_once_v10_161365 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  return @"HMDMPCSendMRCommandOperation";
}

@end