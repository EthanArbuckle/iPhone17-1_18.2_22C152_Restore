@interface HMDMPCResolveDestinationOperation
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)forceSingleGroup;
- (HMDMPCAssistantRemoteControlDestinationFactory)remoteControlDestinationFactory;
- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7;
- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7 remoteControlDestinationFactory:(id)a8;
- (MPCAssistantMutableRemoteControlDestination)resolvedDestination;
- (NSArray)attributeDescriptions;
- (NSArray)hashedRouteIDs;
- (NSString)description;
- (NSString)mediaApplicationIdentifier;
- (NSString)shortDescription;
- (id)resolveDestinationCompletionBlock;
- (int64_t)mediaApplicationDestination;
- (void)main;
- (void)setCompletionBlock:(id)a3;
- (void)setRemoteControlDestinationFactory:(id)a3;
- (void)setResolveDestinationCompletionBlock:(id)a3;
- (void)setResolvedDestination:(id)a3;
@end

@implementation HMDMPCResolveDestinationOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteControlDestinationFactory, 0);
  objc_storeStrong(&self->_resolveDestinationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_mediaApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hashedRouteIDs, 0);
  objc_storeStrong((id *)&self->_resolvedDestination, 0);
}

- (BOOL)forceSingleGroup
{
  return self->_forceSingleGroup;
}

- (int64_t)mediaApplicationDestination
{
  return self->_mediaApplicationDestination;
}

- (void)setRemoteControlDestinationFactory:(id)a3
{
}

- (HMDMPCAssistantRemoteControlDestinationFactory)remoteControlDestinationFactory
{
  return (HMDMPCAssistantRemoteControlDestinationFactory *)objc_getProperty(self, a2, 352, 1);
}

- (void)setResolveDestinationCompletionBlock:(id)a3
{
}

- (id)resolveDestinationCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (NSString)mediaApplicationIdentifier
{
  return self->_mediaApplicationIdentifier;
}

- (NSArray)hashedRouteIDs
{
  return self->_hashedRouteIDs;
}

- (void)setResolvedDestination:(id)a3
{
}

- (MPCAssistantMutableRemoteControlDestination)resolvedDestination
{
  return (MPCAssistantMutableRemoteControlDestination *)objc_getProperty(self, a2, 320, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDMPCResolveDestinationOperation *)self hashedRouteIDs];
  v5 = (void *)[v3 initWithName:@"Hashed Route IDs" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDMPCResolveDestinationOperation *)self hashedRouteIDs];
  v6 = [v3 stringWithFormat:@"%@ route IDs: %@", v4, v5];

  return (NSString *)v6;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HMDMPCResolveDestinationOperation_setCompletionBlock___block_invoke;
  aBlock[3] = &unk_264A21B18;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)HMDMPCResolveDestinationOperation;
  [(HMDMPCResolveDestinationOperation *)&v7 setCompletionBlock:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__HMDMPCResolveDestinationOperation_setCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained resolveDestinationCompletionBlock];
  id v3 = [WeakRetained error];
  if (v3)
  {
    v2[2](v2, 0);
  }
  else
  {
    id v4 = [WeakRetained resolvedDestination];
    ((void (**)(void, void *))v2)[2](v2, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int64_t v3 = [(HMDMPCResolveDestinationOperation *)self mediaApplicationDestination];
  if (!self)
  {
    v14 = 0;
    goto LABEL_15;
  }
  if (!v3)
  {
    v6 = self;
    goto LABEL_13;
  }
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      id v4 = [(HMDMPCResolveDestinationOperation *)self remoteControlDestinationFactory];
      uint64_t v5 = [v4 nowPlayingApplicationDestination];
LABEL_14:
      v14 = (void *)v5;

      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDMPCResolveDestinationOperation mediaApplicationDestination](v16, "mediaApplicationDestination"));
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown destination %@ for resolve destination operation, using system media destination", buf, 0x16u);
    }
    v6 = v16;
LABEL_13:
    id v4 = [(HMDMPCResolveDestinationOperation *)v6 remoteControlDestinationFactory];
    uint64_t v5 = [v4 systemMediaApplicationDestination];
    goto LABEL_14;
  }
  objc_super v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    v11 = [(HMDMPCResolveDestinationOperation *)v8 mediaApplicationIdentifier];
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Using custom media application destination for bundle identifier %@", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x263F547D0]);
  v13 = [(HMDMPCResolveDestinationOperation *)v8 mediaApplicationIdentifier];
  v14 = (void *)[v12 initWithAppBundleID:v13];

LABEL_15:
  v20 = [(HMDMPCResolveDestinationOperation *)self remoteControlDestinationFactory];
  v21 = [(HMDMPCResolveDestinationOperation *)self hashedRouteIDs];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __41__HMDMPCResolveDestinationOperation_main__block_invoke;
  v22[3] = &unk_264A21AF0;
  v22[4] = self;
  [v20 resolveMPCDestination:v14 withHashedRouteIdentifiers:v21 audioRoutingInfo:0 completion:v22];
}

void __41__HMDMPCResolveDestinationOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = v3;
  if (v2)
  {
    if (v3
      && ([v3 outputDeviceUIDs],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 count],
          v5,
          v6))
    {
      objc_super v7 = [v2 remoteControlDestinationFactory];
      v8 = (void *)[v7 mutableCopyForMPCDestination:v4];

      objc_msgSend(v8, "setSingleGroup:", objc_msgSend(v2, "forceSingleGroup"));
      [v2 setResolvedDestination:v8];
      [v2 finish];
    }
    else
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = v2;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        v13 = NSNumber;
        v14 = [v10 hashedRouteIDs];
        v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v16 = NSNumber;
        v17 = [v4 outputDeviceUIDs];
        v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        *(_DWORD *)buf = 138543874;
        v28 = v12;
        __int16 v29 = 2112;
        v30 = v15;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve hashed media profiles given %@ hashedRouteIDs, resolved to %@", buf, 0x20u);
      }
      v19 = NSString;
      v20 = NSNumber;
      v21 = [v10 hashedRouteIDs];
      v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v23 = NSNumber;
      v24 = [v4 outputDeviceUIDs];
      __int16 v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
      v8 = [v19 stringWithFormat:@"Resolved destination failed, given %@ hashedRouteIDs, resolved to %@", v22, v25];

      v26 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2950 description:v8 underlyingError:0];
      [v10 cancelWithError:v26];
    }
  }
}

- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7 remoteControlDestinationFactory:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDMPCResolveDestinationOperation;
  v19 = [(HMFOperation *)&v24 initWithTimeout:0.0];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_hashedRouteIDs, a3);
    v21 = _Block_copy(v17);
    id resolveDestinationCompletionBlock = v20->_resolveDestinationCompletionBlock;
    v20->_id resolveDestinationCompletionBlock = v21;

    v20->_mediaApplicationDestination = a4;
    objc_storeStrong((id *)&v20->_mediaApplicationIdentifier, a5);
    v20->_forceSingleGroup = a6;
    objc_storeStrong((id *)&v20->_remoteControlDestinationFactory, a8);
    [(HMDMPCResolveDestinationOperation *)v20 setCompletionBlock:0];
  }

  return v20;
}

- (HMDMPCResolveDestinationOperation)initWithHashedRouteIDs:(id)a3 mediaApplicationDestination:(int64_t)a4 mediaApplicationIdentifier:(id)a5 forceSingleGroup:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(HMDMPCAssistantRemoteControlDestinationFactory);
  id v16 = [(HMDMPCResolveDestinationOperation *)self initWithHashedRouteIDs:v14 mediaApplicationDestination:a4 mediaApplicationIdentifier:v13 forceSingleGroup:v7 completion:v12 remoteControlDestinationFactory:v15];

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_146592 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_146592, &__block_literal_global_146593);
  }
  v2 = (void *)logCategory__hmf_once_v4_146594;
  return v2;
}

void __48__HMDMPCResolveDestinationOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_146594;
  logCategory__hmf_once_v4_146594 = v0;
}

+ (id)shortDescription
{
  return @"HMDMPCResolveDestinationOperation";
}

@end