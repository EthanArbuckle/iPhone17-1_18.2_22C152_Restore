@interface CUHomeKitManager
- (BOOL)_isOwnerOfHome:(id)a3;
- (BOOL)selfAccessorySiriEnabled;
- (CUHomeKitManager)init;
- (HMAccessory)selfAccessory;
- (HMAccessory)selfAccessoryMediaSystemCounterpart;
- (HMMediaSystem)selfAccessoryMediaSystem;
- (HMMediaSystemRole)selfAccessoryMediaSystemRole;
- (NSArray)resolvableAccessories;
- (NSDictionary)selfAccessoryAppData;
- (NSString)label;
- (NSString)selfAccessoryMediaAccessPassword;
- (NSString)selfAccessoryMediaSystemName;
- (OS_dispatch_queue)dispatchQueue;
- (id)_bestUserAndLabel:(id *)a3;
- (id)_cuPairingIdentityWithHMFPairingIdentity:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)_selfAccessoryMediaSystemUncached:(id *)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)resolvableAccessoriesChangedHandler;
- selfAccessoryAppDataChangedHandler;
- selfAccessoryMediaAccessUpdatedHandler;
- selfAccessoryMediaSystemUpdatedHandler;
- selfAccessorySiriAccessUpdatedHandler;
- selfAccessoryUpdatedHandler;
- (id)stateChangedHandler;
- (unsigned)flags;
- (unsigned)selfAccessoryMediaAccessFlags;
- (unsigned)state;
- (void)_activateIfNeeded;
- (void)_clearHomeKitState;
- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_findPairedPeerWithContext:(id)a3;
- (void)_findPairedPeerWithContext:(id)a3 label:(id)a4 pairingIdentity:(id)a5 error:(id)a6;
- (void)_getPairingIdentityCompleted:(id)a3 options:(unint64_t)a4 error:(id)a5 label:(id)a6 completion:(id)a7;
- (void)_getPairingIdentityForAccessoryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getPairingIdentityForLegacyWithOptions:(unint64_t)a3 user:(id)a4 nonLegacyIdentity:(id)a5 label:(id)a6 completion:(id)a7;
- (void)_getPairingIdentityForUserWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_updateAccessories;
- (void)_updateHomes;
- (void)_updateSelfAccessoryIfNeeded;
- (void)_updateSelfAccessoryMediaAccess;
- (void)_updateSelfAccessoryMediaSystem;
- (void)_updateSelfAccessorySiriAccess;
- (void)_updateState;
- (void)_updateUsers;
- (void)accessory:(id)a3 didUpdateDevice:(id)a4;
- (void)accessoryDidUpdateApplicationData:(id)a3;
- (void)accessoryDidUpdatePairingIdentity:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getHomeKitLocalPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateMediaPassword:(id)a4;
- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4;
- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)invalidate;
- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4;
- (void)mediaSystem:(id)a3 didUpdateName:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setResolvableAccessoriesChangedHandler:(id)a3;
- (void)setSelfAccessoryAppDataChangedHandler:(id)a3;
- (void)setSelfAccessoryMediaAccessUpdatedHandler:(id)a3;
- (void)setSelfAccessoryMediaSystemName:(id)a3;
- (void)setSelfAccessoryMediaSystemUpdatedHandler:(id)a3;
- (void)setSelfAccessorySiriAccessUpdatedHandler:(id)a3;
- (void)setSelfAccessoryUpdatedHandler:(id)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
- (void)user:(id)a3 didUpdatePairingIdentity:(id)a4;
@end

@implementation CUHomeKitManager

- (unsigned)state
{
  return self->_state;
}

- (HMAccessory)selfAccessory
{
  return self->_selfAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selfAccessorySiriAccessUpdatedHandler, 0);
  objc_storeStrong(&self->_selfAccessoryMediaSystemUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemRole, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemName, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemCounterpart, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystem, 0);
  objc_storeStrong(&self->_selfAccessoryMediaAccessUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaAccessPassword, 0);
  objc_storeStrong(&self->_selfAccessoryUpdatedHandler, 0);
  objc_storeStrong(&self->_selfAccessoryAppDataChangedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryAppData, 0);
  objc_storeStrong((id *)&self->_selfAccessory, 0);
  objc_storeStrong(&self->_resolvableAccessoriesChangedHandler, 0);
  objc_storeStrong((id *)&self->_resolvableAccessories, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_selfAccessoryUser, 0);
  objc_storeStrong((id *)&self->_selfAccessoryRoomID, 0);
  objc_storeStrong((id *)&self->_resolvableAccessoriesMap, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

- (void)setSelfAccessorySiriAccessUpdatedHandler:(id)a3
{
}

- selfAccessorySiriAccessUpdatedHandler
{
  return self->_selfAccessorySiriAccessUpdatedHandler;
}

- (BOOL)selfAccessorySiriEnabled
{
  return self->_selfAccessorySiriEnabled;
}

- (void)setSelfAccessoryMediaSystemUpdatedHandler:(id)a3
{
}

- selfAccessoryMediaSystemUpdatedHandler
{
  return self->_selfAccessoryMediaSystemUpdatedHandler;
}

- (HMMediaSystemRole)selfAccessoryMediaSystemRole
{
  return self->_selfAccessoryMediaSystemRole;
}

- (void)setSelfAccessoryMediaSystemName:(id)a3
{
}

- (NSString)selfAccessoryMediaSystemName
{
  return self->_selfAccessoryMediaSystemName;
}

- (HMAccessory)selfAccessoryMediaSystemCounterpart
{
  return self->_selfAccessoryMediaSystemCounterpart;
}

- (HMMediaSystem)selfAccessoryMediaSystem
{
  return self->_selfAccessoryMediaSystem;
}

- (void)setSelfAccessoryMediaAccessUpdatedHandler:(id)a3
{
}

- selfAccessoryMediaAccessUpdatedHandler
{
  return self->_selfAccessoryMediaAccessUpdatedHandler;
}

- (NSString)selfAccessoryMediaAccessPassword
{
  return self->_selfAccessoryMediaAccessPassword;
}

- (unsigned)selfAccessoryMediaAccessFlags
{
  return self->_selfAccessoryMediaAccessFlags;
}

- (void)setSelfAccessoryUpdatedHandler:(id)a3
{
}

- selfAccessoryUpdatedHandler
{
  return self->_selfAccessoryUpdatedHandler;
}

- (void)setSelfAccessoryAppDataChangedHandler:(id)a3
{
}

- selfAccessoryAppDataChangedHandler
{
  return self->_selfAccessoryAppDataChangedHandler;
}

- (NSDictionary)selfAccessoryAppData
{
  return self->_selfAccessoryAppData;
}

- (void)setResolvableAccessoriesChangedHandler:(id)a3
{
}

- (id)resolvableAccessoriesChangedHandler
{
  return self->_resolvableAccessoriesChangedHandler;
}

- (NSArray)resolvableAccessories
{
  return self->_resolvableAccessories;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (NSString)label
{
  return self->_label;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)user:(id)a3 didUpdatePairingIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke(id *a1)
{
  v2 = a1[4];
  if (!v2[2]) {
    return;
  }
  v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      v2 = a1[4];
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)v2[12];
    }
    v4 = [a1[5] userID];
    v11 = [a1[6] identifier];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager user:didUpdatePairingIdentity:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdatePairingIdentity: user %{mask}, PairingIdentity %@", v5, v6, v7, v8, (uint64_t)v4);

    v2 = a1[4];
  }
LABEL_7:
  [v2 _updateState];
  [a1[4] _updateHomes];
  id v10 = _Block_copy(*((const void **)a1[4] + 19));
  if (v10)
  {
    id v12 = v10;
    (*((void (**)(void *, void))v10 + 2))(v10, *((unsigned int *)a1[4] + 28));
    id v10 = v12;
  }
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    v4 = [*(id *)(a1 + 40) userID];
    id v10 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager user:didUpdateAssistantAccessControl:forHome:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateAssistantAccessControl: user %{mask}, home '%@'", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)accessory:(id)a3 didUpdateDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void *__46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    v4 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 48) uniqueIdentifier];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessory:didUpdateDevice:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateDevice: accessory '%@', device %@\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)accessoryDidUpdatePairingIdentity:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    return;
  }
  v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      v2 = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)v2[12];
    }
    id v4 = [*(id *)(a1 + 40) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessoryDidUpdatePairingIdentity:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdatePairingIdentity: accessory '%@'", v5, v6, v7, v8, (uint64_t)v4);

    v2 = *(void **)(a1 + 32);
  }
LABEL_7:
  [v2 _updateState];
  [*(id *)(a1 + 32) _updateHomes];
  id v10 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  if (v10)
  {
    id v11 = v10;
    (*((void (**)(void *, void))v10 + 2))(v10, *(unsigned int *)(*(void *)(a1 + 32) + 112));
    id v10 = v11;
  }
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void *__54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    id v4 = [*(id *)(a1 + 40) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessoryDidUpdateApplicationData:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateApplicationData: accessory '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)mediaSystem:(id)a3 didUpdateName:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke;
  v8[3] = &unk_1E55BF170;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

uint64_t __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (!v8[2]) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = (int *)v8[12];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void **)(v9 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      id v10 = (int *)v8[12];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateName:]_block_invoke", 0x1Eu, (uint64_t)"MediaSystemDidUpdateName: '%@'\n", a5, a6, a7, a8, *(void *)(v9 + 40));
    uint64_t v8 = *(void **)(v9 + 32);
  }
LABEL_7:
  return [v8 _updateHomes];
}

- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4
{
  id v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke;
  v8[3] = &unk_1E55BF170;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void *__52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    id v4 = [*(id *)(a1 + 40) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateComponents:]_block_invoke", 0x1Eu, (uint64_t)"MediaSystemDidUpdateComponents: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    id v4 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveMediaSystem:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveMediaSystem: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CUHomeKitManager_home_didAddMediaSystem___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__43__CUHomeKitManager_home_didAddMediaSystem___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    id v4 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddMediaSystem:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaSystem: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didUpdateMediaPassword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_4:
      if ([*(id *)(a1 + 40) length]) {
        id v4 = "set";
      }
      else {
        id v4 = "not set";
      }
      id v10 = [*(id *)(a1 + 48) name];
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPassword:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaPassword: %s, home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(void **)(a1 + 32);
      goto LABEL_10;
    }
    BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
    result = *(void **)(a1 + 32);
    if (v9)
    {
      v3 = (int *)result[12];
      goto LABEL_4;
    }
  }
LABEL_10:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke;
  block[3] = &unk_1E55BEAD0;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void *__57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_4:
      if (*(unsigned char *)(a1 + 48)) {
        id v4 = "yes";
      }
      else {
        id v4 = "no";
      }
      id v10 = [*(id *)(a1 + 40) name];
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPeerToPeerEnabled:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaPeerToPeerEnabled: %s, home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(void **)(a1 + 32);
      goto LABEL_10;
    }
    BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
    result = *(void **)(a1 + 32);
    if (v9)
    {
      v3 = (int *)result[12];
      goto LABEL_4;
    }
  }
LABEL_10:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke;
  block[3] = &unk_1E55BEE28;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void *__60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_4:
      unint64_t v4 = *(void *)(a1 + 48);
      if (v4 > 2) {
        uint64_t v5 = "?";
      }
      else {
        uint64_t v5 = off_1E55BE2E0[v4];
      }
      int64_t v11 = [*(id *)(a1 + 40) name];
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMinimumMediaUserPrivilege:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaUserLevel: %s, home '%@'\n", v7, v8, v9, v10, (uint64_t)v5);

      result = *(void **)(a1 + 32);
      goto LABEL_11;
    }
    BOOL v6 = _LogCategory_Initialize(result[12], 0x1Eu);
    result = *(void **)(a1 + 32);
    if (v6)
    {
      v3 = (int *)result[12];
      goto LABEL_4;
    }
  }
LABEL_11:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CUHomeKitManager_home_didRemoveUser___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__39__CUHomeKitManager_home_didRemoveUser___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v5 = [*(id *)(a1 + 40) userID];
    int64_t v11 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveUser:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveUser: %@, %{mask}, home '%@'", v6, v7, v8, v9, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CUHomeKitManager_home_didAddUser___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__36__CUHomeKitManager_home_didAddUser___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v5 = [*(id *)(a1 + 40) userID];
    int64_t v11 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddUser:]_block_invoke", 0x1Eu, (uint64_t)"DidAddUser: %@, %{mask}, home '%@'", v6, v7, v8, v9, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke;
  v15[3] = &unk_1E55BEEC8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

void *__52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) name];
    uint64_t v5 = [*(id *)(a1 + 48) name];
    int64_t v11 = [*(id *)(a1 + 56) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateRoom:forAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateRoom: '%@', accessory '%@', home '%@'\n", v6, v7, v8, v9, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CUHomeKitManager_home_didRemoveAccessory___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__44__CUHomeKitManager_home_didRemoveAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveAccessory: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CUHomeKitManager_home_didAddAccessory___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void *__41__CUHomeKitManager_home_didAddAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) name];
    id v10 = [*(id *)(a1 + 48) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidAddAccessory: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke;
  v8[3] = &unk_1E55BF170;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void *__46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager homeManager:didRemoveHome:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveHome: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CUHomeKitManager_homeManager_didAddHome___block_invoke;
  v8[3] = &unk_1E55BF170;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

void *__43__CUHomeKitManager_homeManager_didAddHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return result;
  }
  v3 = (int *)result[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      v3 = (int *)result[12];
    }
    unint64_t v4 = [*(id *)(a1 + 40) name];
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager homeManager:didAddHome:]_block_invoke", 0x1Eu, (uint64_t)"DidAddHome: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

    result = *(void **)(a1 + 32);
  }
LABEL_7:
  return (void *)[result _updateHomes];
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (!v8[2]) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = (int *)v8[12];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void **)(v9 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      id v10 = (int *)v8[12];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManager:didUpdateStatus:]_block_invoke", 0x1Eu, (uint64_t)"HomeManagerDidUpdateStatus: %d", a5, a6, a7, a8, *(void *)(v9 + 40));
    uint64_t v8 = *(void **)(v9 + 32);
  }
LABEL_7:
  [v8 _updateState];
  id v12 = *(void **)(v9 + 32);
  return [v12 _updateHomes];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(void *)(v8 + 16)) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = *(int **)(v8 + 96);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(v9 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      id v10 = *(int **)(v8 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateHomes:]_block_invoke", 0x1Eu, (uint64_t)"HomeManagerDidUpdateHomes\n", a5, a6, a7, a8, v13);
    uint64_t v8 = *(void *)(v9 + 32);
  }
LABEL_7:
  *(unsigned char *)(v8 + 24) = 1;
  [*(id *)(v9 + 32) _clearHomeKitState];
  [*(id *)(v9 + 32) _updateState];
  id v12 = *(void **)(v9 + 32);
  return [v12 _updateHomes];
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (!v8[2]) {
    return result;
  }
  uint64_t v9 = result;
  id v10 = (int *)v8[12];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void **)(v9 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      id v10 = (int *)v8[12];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateDataSyncState:]_block_invoke", 0x1Eu, (uint64_t)"HomeKit DataSync changed\n", a5, a6, a7, a8, v13);
    uint64_t v8 = *(void **)(v9 + 32);
  }
LABEL_7:
  [v8 _updateState];
  id v12 = *(void **)(v9 + 32);
  return [v12 _updateHomes];
}

- (id)_selfAccessoryMediaSystemUncached:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMAccessory *)self->_selfAccessory uniqueIdentifier];
  uint64_t v6 = [(HMAccessory *)self->_selfAccessory home];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [v6 mediaSystems];
  uint64_t v25 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    v23 = a3;
    v24 = v6;
    uint64_t v8 = *(void *)v33;
    v27 = v7;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v26 = v10;
        BOOL v11 = objc_msgSend(v10, "components", v22);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              id v17 = [v16 mediaProfile];
              id v18 = [v17 accessory];
              v19 = [v18 uniqueIdentifier];

              if ([v19 isEqual:v5])
              {
                if (v23) {
                  id *v23 = v16;
                }
                id v20 = v26;

                uint64_t v6 = v24;
                uint64_t v7 = v27;
                goto LABEL_21;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v27;
        uint64_t v8 = v22;
      }
      id v20 = 0;
      uint64_t v6 = v24;
      uint64_t v25 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }
  else
  {
    id v20 = 0;
  }
LABEL_21:

  return v20;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 currentUser];
  if (v4)
  {
    uint64_t v5 = [v3 homeAccessControlForUser:v4];
    char v6 = [v5 isOwner];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_cuPairingIdentityWithHMFPairingIdentity:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(CUPairingIdentity);
  v15 = [v7 identifier];
  if (v15)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];
    if (!v22)
    {
      if (a5)
      {
        NSErrorWithOSStatusF(4294960579, (uint64_t)"Bad HomeKit pairing identifier: '%@'", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
        long long v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v33 = 0;
      }
      goto LABEL_21;
    }
    [(CUPairingIdentity *)v8 setIdentifier:v22];
    v23 = [v7 publicKey];
    v24 = [v23 data];

    if (v24)
    {
      [(CUPairingIdentity *)v8 setPublicKey:v24];
      if ((v6 & 2) == 0)
      {
LABEL_7:
        long long v33 = v8;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      long long v31 = [v7 privateKey];
      long long v32 = [v31 data];

      if (v32)
      {
        [(CUPairingIdentity *)v8 setSecretKey:v32];

        goto LABEL_7;
      }
      if (a5)
      {
        uint64_t v35 = 4294896142;
        long long v34 = "No HomeKit pairing private key";
        goto LABEL_18;
      }
    }
    else if (a5)
    {
      long long v34 = "No HomeKit pairing public key";
      uint64_t v35 = 4294896141;
LABEL_18:
      NSErrorWithOSStatusF(v35, (uint64_t)v34, v25, v26, v27, v28, v29, v30, v37);
      long long v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    long long v33 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960588, (uint64_t)"No HomeKit pairing identifier", v9, v10, v11, v12, v13, v14, v37);
    long long v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v33 = 0;
  }
LABEL_22:

  return v33;
}

- (id)_bestUserAndLabel:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMHomeManager *)self->_homeManager currentHome];
  uint64_t v6 = [v5 currentUser];
  if (v6)
  {
    id v7 = (id)v6;
    if (a3)
    {
      id v8 = [NSString alloc];
      uint64_t v9 = [v5 name];
      *a3 = (id)[v8 initWithFormat:@"CurrentHome '%@'", v9];
    }
  }
  else
  {
    uint64_t v10 = [(HMHomeManager *)self->_homeManager primaryHome];

    uint64_t v11 = [v10 currentUser];
    if (v11)
    {
      id v7 = (id)v11;
      if (a3)
      {
        id v12 = [NSString alloc];
        uint64_t v13 = [v10 name];
        *a3 = (id)[v12 initWithFormat:@"PrimaryHome '%@'", v13];
      }
      id v5 = v10;
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [(HMHomeManager *)self->_homeManager homes];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        id v5 = v10;
        while (2)
        {
          uint64_t v18 = 0;
          uint64_t v19 = v5;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            id v5 = *(id *)(*((void *)&v25 + 1) + 8 * v18);

            uint64_t v20 = [v5 currentUser];
            if (v20)
            {
              uint64_t v21 = (void *)v20;
              if (a3)
              {
                id v22 = [NSString alloc];
                v23 = [v5 name];
                *a3 = (id)[v22 initWithFormat:@"Home '%@'", v23];
              }
              id v7 = v21;

              goto LABEL_22;
            }
            ++v18;
            uint64_t v19 = v5;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v5 = v10;
      }

      id v7 = 0;
      id v5 = v14;
    }
  }
LABEL_22:

  return v7;
}

- (void)_findPairedPeerWithContext:(id)a3 label:(id)a4 pairingIdentity:(id)a5 error:(id)a6
{
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 20)
    {
      v24 = v60;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u)) {
          goto LABEL_18;
        }
        ucat = self->_ucat;
        v24 = v60;
      }
      long long v25 = [v24 identifier];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x14u, (uint64_t)"FindPairedPeer: '%@', %@, no identity, %{error}\n", v26, v27, v28, v29, (uint64_t)v25);
    }
LABEL_18:
    [(CUHomeKitManager *)self _findPairedPeerWithContext:v60];
    goto LABEL_33;
  }
  uint64_t v13 = [v11 identifier];
  if (!v13)
  {
    uint64_t v30 = self->_ucat;
    long long v31 = v60;
    if (v30->var0 <= 90)
    {
      if (v30->var0 == -1)
      {
        BOOL v56 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au);
        long long v31 = v60;
        if (!v56) {
          goto LABEL_25;
        }
        uint64_t v30 = self->_ucat;
      }
      long long v32 = [v31 identifier];
      LogPrintF((uint64_t)v30, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', %@, no identifier for identity\n", v33, v34, v35, v36, (uint64_t)v32);

      long long v31 = v60;
    }
LABEL_25:
    v54 = self;
    id v55 = v31;
    goto LABEL_26;
  }
  uint64_t v14 = [v60 identifier];
  uint64_t v15 = [v13 caseInsensitiveCompare:v14];

  if (!v15)
  {
    uint64_t v37 = [v11 publicKey];
    uint64_t v38 = [v37 data];

    if (v38)
    {
      uint64_t v39 = mach_absolute_time();
      UpTicksToMilliseconds(v39 - [v60 startTicks]);
      v40 = self->_ucat;
      if (v40->var0 <= 30)
      {
        v41 = v60;
        if (v40->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_28;
          }
          v40 = self->_ucat;
          v41 = v60;
        }
        v42 = [v41 identifier];
        LogPrintF((uint64_t)v40, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x1Eu, (uint64_t)"FindPairedPeer found: '%@', %@, %llu ms\n", v43, v44, v45, v46, (uint64_t)v42);
      }
LABEL_28:
      v57 = [v60 pairedPeer];
      [v57 setPublicKey:v38];

      v58 = [v60 completion];
      v59 = [v60 pairedPeer];
      ((void (**)(void, void *, void))v58)[2](v58, v59, 0);

LABEL_31:
      goto LABEL_32;
    }
    v47 = self->_ucat;
    if (v47->var0 <= 90)
    {
      v48 = v60;
      if (v47->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
          goto LABEL_30;
        }
        v47 = self->_ucat;
        v48 = v60;
      }
      v49 = [v48 identifier];
      LogPrintF((uint64_t)v47, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', %@, no PK\n", v50, v51, v52, v53, (uint64_t)v49);
    }
LABEL_30:
    [(CUHomeKitManager *)self _findPairedPeerWithContext:v60];
    goto LABEL_31;
  }
  uint64_t v16 = self->_ucat;
  if (v16->var0 <= 20)
  {
    uint64_t v17 = v60;
    if (v16->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u)) {
        goto LABEL_23;
      }
      uint64_t v16 = self->_ucat;
      uint64_t v17 = v60;
    }
    uint64_t v18 = [v17 identifier];
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x14u, (uint64_t)"FindPairedPeer: '%@', %@, mismatch '%@'\n", v19, v20, v21, v22, (uint64_t)v18);
  }
LABEL_23:
  v54 = self;
  id v55 = v60;
LABEL_26:
  [(CUHomeKitManager *)v54 _findPairedPeerWithContext:v55];
LABEL_32:

LABEL_33:
}

- (void)_findPairedPeerWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 triedHomeRepairFlow])
  {
    if ([v4 triedHAP])
    {
LABEL_16:
      if (([v4 triedAccessory] & 1) == 0)
      {
        [v4 setTriedAccessory:1];
        if (objc_opt_respondsToSelector())
        {
          homeManager = self->_homeManager;
          uint64_t v36 = [v4 identifier];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2;
          v76[3] = &unk_1E55BE228;
          v76[4] = self;
          id v77 = v4;
          [(HMHomeManager *)homeManager pairingIdentityForAccessoryWithIdentifier:v36 completionHandler:v76];

          goto LABEL_39;
        }
        ucat = self->_ucat;
        if (ucat->var0 <= 90)
        {
          if (ucat->var0 != -1)
          {
LABEL_21:
            uint64_t v38 = [v4 identifier];
            LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no accessory identity SPI\n", v39, v40, v41, v42, (uint64_t)v38);

            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          {
            ucat = self->_ucat;
            goto LABEL_21;
          }
        }
      }
LABEL_23:
      unint64_t v43 = [v4 userIndex];
      if (v43 < [v4 userCount])
      {
        do
        {
          uint64_t v44 = [v4 users];
          uint64_t v45 = [v4 userIndex];
          [v4 setUserIndex:v45 + 1];
          uint64_t v46 = [v44 objectAtIndexedSubscript:v45];

          if (objc_opt_respondsToSelector())
          {
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_4;
            v74[3] = &unk_1E55BE278;
            v74[4] = self;
            v74[5] = v46;
            id v75 = v4;
            [v46 pairingIdentityWithCompletionHandler:v74];

            goto LABEL_39;
          }
          v47 = self->_ucat;
          if (v47->var0 <= 90)
          {
            if (v47->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
                goto LABEL_29;
              }
              v47 = self->_ucat;
            }
            v48 = [v4 identifier];
            v73 = [v46 name];
            LogPrintF((uint64_t)v47, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no user identity SPI '%@'\n", v49, v50, v51, v52, (uint64_t)v48);
          }
LABEL_29:

          unint64_t v53 = [v4 userIndex];
        }
        while (v53 < [v4 userCount]);
      }
      uint64_t v54 = mach_absolute_time();
      UpTicksToMilliseconds(v54 - [v4 startTicks]);
      NSErrorWithOSStatusF(4294960569, (uint64_t)"Not found via HAP, accessory, or user", v55, v56, v57, v58, v59, v60, v72);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v61 = self->_ucat;
      if (v61->var0 <= 90)
      {
        if (v61->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
            goto LABEL_37;
          }
          v61 = self->_ucat;
        }
        v62 = [v4 identifier];
        LogPrintF((uint64_t)v61, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer failed: '%@', %{error}, %llu ms\n", v63, v64, v65, v66, (uint64_t)v62);
      }
LABEL_37:
      v67 = [v4 completion];
      ((void (**)(void, void, id))v67)[2](v67, 0, v7);

LABEL_38:
      goto LABEL_39;
    }
    [v4 setTriedHAP:1];
    id v5 = [(Class)getHAPSystemKeychainStoreClass[0]() systemStore];
    id v78 = 0;
    uint64_t v6 = [v5 getLocalPairingIdentity:&v78];
    id v7 = v78;

    if (v6)
    {
      id v8 = [v6 identifier];
      if (!v8) {
        goto LABEL_14;
      }
      uint64_t v9 = [v4 identifier];
      uint64_t v10 = [v8 caseInsensitiveCompare:v9];

      if (v10) {
        goto LABEL_14;
      }
      id v11 = [v6 publicKey];
      id v12 = [v11 data];

      if (v12)
      {
        uint64_t v17 = mach_absolute_time();
        UpTicksToMilliseconds(v17 - [v4 startTicks]);
        uint64_t v18 = self->_ucat;
        if (v18->var0 <= 30)
        {
          if (v18->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
              goto LABEL_46;
            }
            uint64_t v18 = self->_ucat;
          }
          uint64_t v19 = [v4 identifier];
          LogPrintF((uint64_t)v18, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x1Eu, (uint64_t)"FindPairedPeer found: '%@', HAP, %llu ms\n", v20, v21, v22, v23, (uint64_t)v19);
        }
LABEL_46:
        v69 = [v4 pairedPeer];
        [v69 setPublicKey:v12];

        v70 = [v4 completion];
        v71 = [v4 pairedPeer];
        ((void (**)(void, void *, void))v70)[2](v70, v71, 0);

        goto LABEL_38;
      }
      v68 = self->_ucat;
      if (v68->var0 > 90) {
        goto LABEL_14;
      }
      if (v68->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v68, 0x5Au)) {
          goto LABEL_14;
        }
        v68 = self->_ucat;
      }
      LogPrintF((uint64_t)v68, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no HAP public key\n", v13, v14, v15, v16, (uint64_t)v8);
    }
    else
    {
      uint64_t v30 = self->_ucat;
      if (v30->var0 > 90)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (v30->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
          goto LABEL_15;
        }
        uint64_t v30 = self->_ucat;
      }
      id v8 = [v4 identifier];
      LogPrintF((uint64_t)v30, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no HAP identity, %{error}\n", v31, v32, v33, v34, (uint64_t)v8);
    }
LABEL_14:

    goto LABEL_15;
  }
  [v4 setTriedHomeRepairFlow:1];
  v24 = self->_homeManager;
  id v83 = 0;
  long long v25 = [(HMHomeManager *)v24 allPairingIdentitiesInRankOrderWithError:&v83];
  id v26 = v83;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke;
  block[3] = &unk_1E55BEEC8;
  block[4] = self;
  id v80 = v4;
  id v81 = v25;
  id v82 = v26;
  id v28 = v26;
  id v29 = v25;
  dispatch_async(dispatchQueue, block);

LABEL_39:
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) firstObject];
  [v2 _findPairedPeerWithContext:v3 label:@"allIdentities" pairingIdentity:v4 error:*(void *)(a1 + 56)];
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 120);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3;
  v11[3] = &unk_1E55BEEC8;
  v11[4] = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v8 = *(void *)(a1 + 32);
  block[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5;
  block[3] = &unk_1E55BE250;
  id v9 = *(NSObject **)(v8 + 120);
  int8x16_t v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) name];
  NSPrintF((uint64_t)"user '%{mask}'", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) _findPairedPeerWithContext:*(void *)(a1 + 48) label:v10 pairingIdentity:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

uint64_t __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeerWithContext:*(void *)(a1 + 40) label:@"accessory" pairingIdentity:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  uint64_t v14 = [v8 identifierStr];
  if (!v14)
  {
    id v15 = [v8 identifier];
    uint64_t v14 = [v15 UUIDString];

    if (!v14)
    {
      uint64_t v37 = NSErrorWithOSStatusF(4294960591, (uint64_t)"Bad peer identifier: '%@'", v16, v17, v10, v11, v12, v13, (uint64_t)v8);
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
            goto LABEL_29;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeer:options:completion:]", 0x5Au, (uint64_t)"### FindPairedPeer failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v37);
      }
LABEL_29:
      v9[2](v9, 0, v37);

      goto LABEL_24;
    }
  }
  uint64_t v18 = self->_ucat;
  if (v18->var0 <= 30)
  {
    if (v18->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu)) {
        goto LABEL_7;
      }
      uint64_t v18 = self->_ucat;
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUHomeKitManager _findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"FindPairedPeer start: '%@', %#{flags}\n", v10, v11, v12, v13, v14);
  }
LABEL_7:
  uint64_t v19 = objc_alloc_init(CUHomeKitFindPairedPeerContext);
  uint64_t v42 = v9;
  [(CUHomeKitFindPairedPeerContext *)v19 setCompletion:v9];
  uint64_t v40 = (void *)v14;
  [(CUHomeKitFindPairedPeerContext *)v19 setIdentifier:v14];
  [(CUHomeKitFindPairedPeerContext *)v19 setOptions:a4];
  id v43 = v8;
  [(CUHomeKitFindPairedPeerContext *)v19 setPairedPeer:v8];
  uint64_t v39 = v19;
  [(CUHomeKitFindPairedPeerContext *)v19 setStartTicks:mach_absolute_time()];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v41 = self;
  uint64_t v21 = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v27 = [v26 currentUser];
        if (v27) {
          [v20 addObject:v27];
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v28 = [v26 users];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v28);
              }
              [v20 addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v30);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v23);
  }

  [(CUHomeKitFindPairedPeerContext *)v39 setUsers:v20];
  [(CUHomeKitFindPairedPeerContext *)v39 setUserIndex:0];
  -[CUHomeKitFindPairedPeerContext setUserCount:](v39, "setUserCount:", [v20 count]);
  [(CUHomeKitManager *)v41 _findPairedPeerWithContext:v39];

  uint64_t v9 = v42;
  id v8 = v43;
LABEL_24:
}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke;
  v13[3] = &unk_1E55BE6D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_getPairingIdentityCompleted:(id)a3 options:(unint64_t)a4 error:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void *, void))a7;
  id v22 = v12;
  if (v22 && !v13)
  {
    id v42 = 0;
    uint64_t v23 = [(CUHomeKitManager *)self _cuPairingIdentityWithHMFPairingIdentity:v22 options:a4 error:&v42];
    id v30 = v42;
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v23)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_18;
          }
          ucat = self->_ucat;
        }
        uint64_t v41 = [v23 identifier];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity finish: %#{flags}, %@ (%@)\n", v33, v34, v35, v36, a4);
      }
LABEL_18:
      v15[2](v15, v23, 0);
LABEL_21:

      goto LABEL_22;
    }
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
          goto LABEL_20;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x5Au, (uint64_t)"### GetPairingIdentity convert failed: %{error}\n", v26, v27, v28, v29, (uint64_t)v30);
    }
LABEL_20:
    uint64_t v39 = NSErrorWithOSStatusF(4294960596, (uint64_t)"No converted identity, no error", v24, v25, v26, v27, v28, v29, v40);
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v39);

    goto LABEL_21;
  }
  uint64_t v37 = self->_ucat;
  if (v37->var0 <= 90)
  {
    if (v37->var0 != -1)
    {
LABEL_9:
      LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x5Au, (uint64_t)"### GetPairingIdentity failed: %{error}\n", v18, v19, v20, v21, (uint64_t)v13);
      goto LABEL_14;
    }
    if (_LogCategory_Initialize((uint64_t)v37, 0x5Au))
    {
      uint64_t v37 = self->_ucat;
      goto LABEL_9;
    }
  }
LABEL_14:
  if (v13)
  {
    ((void (**)(id, void *, id))v15)[2](v15, 0, v13);
  }
  else
  {
    uint64_t v38 = NSErrorWithOSStatusF(4294960596, (uint64_t)"No identity, no error", v16, v17, v18, v19, v20, v21, v40);
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v38);
  }
LABEL_22:
}

- (void)_getPairingIdentityForLegacyWithOptions:(unint64_t)a3 user:(id)a4 nonLegacyIdentity:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (objc_opt_respondsToSelector())
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      uint64_t v29 = [v12 name];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityForLegacyWithOptions:user:nonLegacyIdentity:label:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags} via fetch all SPI '%{mask}", v17, v18, v19, v20, a3);
    }
LABEL_7:
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke;
    v30[3] = &unk_1E55BE200;
    v30[4] = self;
    id v31 = v13;
    id v32 = v12;
    unint64_t v35 = a3;
    id v33 = v14;
    id v34 = v15;
    [v32 fetchAllPairingIdentitiesWithCompletionHandler:v30];

    goto LABEL_8;
  }
  uint64_t v21 = [v12 name];
  uint64_t v28 = NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit pairing identity, no fetch all SPI, '%{mask}'", v22, v23, v24, v25, v26, v27, (uint64_t)v21);

  [(CUHomeKitManager *)self _getPairingIdentityCompleted:0 options:a3 error:v28 label:v14 completion:v15];
LABEL_8:
}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 120);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2;
  v11[3] = &unk_1E55BE1D8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v6;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v19 = v8;
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v30 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
      id v9 = [v8 identifier];
      id v10 = v9;
      id v11 = v9 ? v9 : @"?";
      [v2 addObject:v11];

      id v12 = [v8 identifier];
      id v13 = [*(id *)(a1 + 40) identifier];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v15 = v8;

    if (!v15) {
      goto LABEL_15;
    }
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 88);
    id v19 = *(id *)(a1 + 56);
    id v18 = *(void **)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 72);
    id v21 = v15;
  }
  else
  {
LABEL_12:

LABEL_15:
    uint64_t v22 = [*(id *)(a1 + 48) name];
    NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit legacy pairing identity, user '%{mask}', all %##@, error %{error}", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    id v18 = *(void **)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 88);
    id v21 = 0;
    id v19 = v15;
  }
  [v18 _getPairingIdentityCompleted:v21 options:v16 error:v19 label:v20 completion:v17];
}

- (void)_getPairingIdentityForUserWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v35 = 0;
  uint64_t v7 = [(CUHomeKitManager *)self _bestUserAndLabel:&v35];
  id v14 = v35;
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_9;
          }
          ucat = self->_ucat;
        }
        long long v30 = [v7 name];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityForUserWithOptions:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags} via SPI '%{mask}", v16, v17, v18, v19, a3);
      }
LABEL_9:
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke;
      v31[3] = &unk_1E55BE1B0;
      unint64_t v34 = a3;
      v31[4] = self;
      v31[5] = v7;
      id v32 = v14;
      id v33 = v6;
      [v7 pairingIdentityWithCompletionHandler:v31];

      goto LABEL_10;
    }
    id v21 = [v7 name];
    uint64_t v28 = NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit user pairing identity, no SPI, '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)v21);

    [(CUHomeKitManager *)self _getPairingIdentityCompleted:0 options:a3 error:v28 label:v14 completion:v6];
  }
  else
  {
    uint64_t v20 = NSErrorWithOSStatusF(4294896143, (uint64_t)"No HomeKit user for pairing identity", v8, v9, v10, v11, v12, v13, v29);
    [(CUHomeKitManager *)self _getPairingIdentityCompleted:0 options:a3 error:v20 label:v14 completion:v6];
  }
LABEL_10:
}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E55BE188;
  id v12 = v5;
  uint64_t v17 = *(void *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v5 = (*(void *)(a1 + 80) & 0x100) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  id v6 = v2;
  if (v5) {
    [v4 _getPairingIdentityCompleted:*(void *)(a1 + 32) options:v3 error:*(void *)(a1 + 64) label:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  }
  else {
    [v4 _getPairingIdentityForLegacyWithOptions:v3 user:*(void *)(a1 + 48) nonLegacyIdentity:v2 label:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  }
}

- (void)_getPairingIdentityForAccessoryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  long long v13 = [(HMHomeManager *)self->_homeManager currentAccessory];
  if (!v13)
  {
    id v14 = "No HomeKit Self Accessory";
LABEL_6:
    id v15 = NSErrorWithOSStatusF(4294960569, (uint64_t)v14, v7, v8, v9, v10, v11, v12, v16);
    [(CUHomeKitManager *)self _getPairingIdentityCompleted:0 options:a3 error:v15 label:@"SelfAccessory" completion:v6];

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v14 = "No HomeKit Self Accessory Identity SPI";
    goto LABEL_6;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke;
  v17[3] = &unk_1E55BE160;
  v17[4] = self;
  unint64_t v19 = a3;
  id v18 = v6;
  [v13 pairingIdentityWithPrivateKey:(a3 >> 1) & 1 completionHandler:v17];

LABEL_7:
}

void __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  uint64_t v8 = *(NSObject **)(v7 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E55BE4D8;
  void block[4] = v7;
  id v13 = v5;
  uint64_t v9 = (void *)a1[5];
  uint64_t v16 = a1[6];
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairingIdentityCompleted:*(void *)(a1 + 40) options:*(void *)(a1 + 64) error:*(void *)(a1 + 48) label:@"SelfAccessory" completion:*(void *)(a1 + 56)];
}

- (void)getHomeKitLocalPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager getHomeKitLocalPairingIdentityWithOptions:completion:]", 0x5Au, (uint64_t)"### getHomeKitLocalPairingIdentityWithOptions: no identities for repair flow SPI\n", v9, v10, v11, v12, v20[0]);
    }
LABEL_7:
    NSErrorWithOSStatusF(4294960561, (uint64_t)"HomeKit does not support this SPI on this platform", v7, v8, v9, v10, v11, v12, v20[0]);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v17);
    goto LABEL_8;
  }
  homeManager = self->_homeManager;
  id v25 = 0;
  id v14 = [(HMHomeManager *)homeManager allPairingIdentitiesInRankOrderWithError:&v25];
  id v15 = v25;
  dispatchQueue = self->_dispatchQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = (uint64_t)__73__CUHomeKitManager_getHomeKitLocalPairingIdentityWithOptions_completion___block_invoke;
  v20[3] = (uint64_t)&unk_1E55BE4D8;
  v20[4] = (uint64_t)self;
  id v21 = v14;
  unint64_t v24 = a3;
  id v22 = v15;
  uint64_t v23 = v6;
  id v17 = v15;
  id v18 = v14;
  dispatch_async(dispatchQueue, v20);

LABEL_8:
}

void __73__CUHomeKitManager_getHomeKitLocalPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) firstObject];
  [v2 _getPairingIdentityCompleted:v3 options:*(void *)(a1 + 64) error:*(void *)(a1 + 48) label:@"HomeKitLocalKey" completion:*(void *)(a1 + 56)];
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E55BE630;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = (int *)v9[12];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager getPairingIdentityWithOptions:completion:]_block_invoke", 0x1Eu, (uint64_t)"GetPairingIdentity start: %#{flags}\n", a5, a6, a7, a8, *(void *)(a1 + 48));
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      id v10 = (int *)v9[12];
      goto LABEL_3;
    }
  }
LABEL_5:
  if ((*(void *)(a1 + 48) & 0x10) != 0)
  {
    return objc_msgSend(v9, "_getPairingIdentityForAccessoryWithOptions:completion:");
  }
  else
  {
    return objc_msgSend(v9, "_getPairingIdentityForUserWithOptions:completion:");
  }
}

- (void)_updateUsers
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v4 = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v64 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v63 + 1) + 8 * i) currentUser];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v6);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (!v10)
  {
    char v48 = 0;
    goto LABEL_31;
  }
  uint64_t v11 = v10;
  char v48 = 0;
  uint64_t v12 = *(void *)v60;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v60 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
      id v15 = [v14 uniqueIdentifier];
      if (v15)
      {
        uint64_t v16 = [(NSMutableDictionary *)self->_users objectForKeyedSubscript:v15];
        if (!v16)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1) {
              goto LABEL_19;
            }
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_19:
              long long v45 = [v14 userID];
              LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateUsers]", 0x1Eu, (uint64_t)"FoundCurrentUser: %@, %{mask}", v18, v19, v20, v21, (uint64_t)v15);
            }
          }
          [v14 setDelegate:self];
          users = self->_users;
          if (!users)
          {
            uint64_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            unint64_t v24 = self->_users;
            self->_users = v23;

            users = self->_users;
          }
          [(NSMutableDictionary *)users setObject:v14 forKeyedSubscript:v15];
          char v48 = 1;
        }
      }
      ++v13;
    }
    while (v11 != v13);
    uint64_t v25 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    uint64_t v11 = v25;
  }
  while (v25);
LABEL_31:

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v47 = [(NSMutableDictionary *)self->_users allKeys];
  uint64_t v26 = [v47 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (!v26) {
    goto LABEL_53;
  }
  uint64_t v27 = v26;
  uint64_t v49 = *(void *)v56;
  while (2)
  {
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(v47);
      }
      uint64_t v29 = *(void *)(*((void *)&v55 + 1) + 8 * v28);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v30 = obj;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (!v31)
      {
LABEL_44:

        id v30 = [(NSMutableDictionary *)self->_users objectForKeyedSubscript:v29];
        uint64_t v37 = self->_ucat;
        if (v37->var0 <= 30)
        {
          if (v37->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
              goto LABEL_48;
            }
            uint64_t v37 = self->_ucat;
          }
          uint64_t v38 = [v30 uniqueIdentifier];
          long long v46 = [v30 userID];
          LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _updateUsers]", 0x1Eu, (uint64_t)"LostCurrentUser: %@, %{mask}", v39, v40, v41, v42, (uint64_t)v38);
        }
LABEL_48:
        [v30 setDelegate:0];
        [(NSMutableDictionary *)self->_users setObject:0 forKeyedSubscript:v29];
        char v48 = 1;
        goto LABEL_49;
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v52;
LABEL_38:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = [*(id *)(*((void *)&v51 + 1) + 8 * v34) uniqueIdentifier];
        char v36 = [v35 isEqual:v29];

        if (v36) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v32) {
            goto LABEL_38;
          }
          goto LABEL_44;
        }
      }
LABEL_49:

      if (++v28 != v27) {
        continue;
      }
      break;
    }
    uint64_t v43 = [v47 countByEnumeratingWithState:&v55 objects:v68 count:16];
    uint64_t v27 = v43;
    if (v43) {
      continue;
    }
    break;
  }
LABEL_53:

  if ((v48 & 1) != 0 && self->_state == 1)
  {
    stateChangedHandler = (void (**)(id, uint64_t))self->_stateChangedHandler;
    if (stateChangedHandler) {
      stateChangedHandler[2](stateChangedHandler, 1);
    }
  }
}

- (void)_updateState
{
  if (self->_homeManagerDidUpdateHomes
    && (unint64_t v7 = [(HMHomeManager *)self->_homeManager dataSyncState], v7 <= 5))
  {
    unsigned int v8 = dword_18E4176CC[v7];
  }
  else
  {
    unsigned int v8 = 0;
  }
  unsigned int state = self->_state;
  if (v8 != state)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_14;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_14;
      }
      ucat = self->_ucat;
      unsigned int state = self->_state;
    }
    if (state > 5) {
      uint64_t v11 = "?";
    }
    else {
      uint64_t v11 = off_1E55BE2B0[state];
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateState]", 0x1Eu, (uint64_t)"HomeKit state updated: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v11);
LABEL_14:
    self->_unsigned int state = v8;
    id stateChangedHandler = self->_stateChangedHandler;
    if (stateChangedHandler)
    {
      uint64_t v13 = (void (*)(void))*((void *)stateChangedHandler + 2);
      v13();
    }
  }
}

- (void)_updateSelfAccessorySiriAccess
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_selfAccessorySiriAccessEnabled)
  {
    uint64_t v3 = [(HMAccessory *)self->_selfAccessory home];
    uint64_t v4 = v3;
    if (!v3)
    {
LABEL_30:

      return;
    }
    uint64_t v5 = [v3 currentUser];
    uint64_t v6 = v5;
    if (!v5)
    {
LABEL_29:

      goto LABEL_30;
    }
    unint64_t v7 = [v5 assistantAccessControlForHome:v4];
    selfAccessorySiriEnabled = self->_selfAccessorySiriEnabled;
    if ([v7 isEnabled])
    {
      uint64_t v9 = [(HMAccessory *)self->_selfAccessory uniqueIdentifier];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v10 = [v7 accessories];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        int v23 = selfAccessorySiriEnabled;
        unint64_t v24 = v7;
        uint64_t v12 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) uniqueIdentifier];
            char v15 = [v14 isEqual:v9];

            if (v15)
            {
              LODWORD(v11) = 1;
              goto LABEL_16;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_16:
        unint64_t v7 = v24;
        selfAccessorySiriEnabled = v23;
      }
    }
    else
    {
      LODWORD(v11) = 0;
    }
    if (selfAccessorySiriEnabled == v11)
    {
LABEL_28:

      goto LABEL_29;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_21:
        if (selfAccessorySiriEnabled) {
          id v17 = "yes";
        }
        else {
          id v17 = "no";
        }
        [v7 isEnabled];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessorySiriAccess]", 0x1Eu, (uint64_t)"SelfAccessory SiriAccess per-accessory updated: %s -> %s (global %s)\n", v18, v19, v20, v21, (uint64_t)v17);
        goto LABEL_26;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_21;
      }
    }
LABEL_26:
    self->_selfAccessorySiriEnabled = v11;
    selfAccessorySiriAccessUpdatedHandler = (void (**)(void))self->_selfAccessorySiriAccessUpdatedHandler;
    if (selfAccessorySiriAccessUpdatedHandler) {
      selfAccessorySiriAccessUpdatedHandler[2]();
    }
    goto LABEL_28;
  }
}

- (void)_updateSelfAccessoryMediaSystem
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (self->_selfAccessoryMediaSystemEnabled)
  {
    id v92 = 0;
    uint64_t v3 = [(CUHomeKitManager *)self _selfAccessoryMediaSystemUncached:&v92];
    id v4 = v92;
    uint64_t v5 = v4;
    if (v3 && v4)
    {
      uint64_t v6 = [v3 uniqueIdentifier];
      unint64_t v7 = [(HMMediaSystem *)self->_selfAccessoryMediaSystem uniqueIdentifier];
      id v8 = v6;
      id v9 = v7;
      BOOL v10 = v8 != v9;
      if (v8 == v9)
      {

        selfAccessoryMediaSystem = (HMMediaSystem *)v8;
LABEL_22:

LABEL_23:
        uint64_t v31 = self->_selfAccessoryMediaSystemName;
        uint64_t v32 = [v3 name];
        uint64_t v33 = v31;
        uint64_t v34 = v32;
        id v35 = v34;
        if (v33 == v34)
        {

          selfAccessoryMediaSystemName = v33;
LABEL_34:

          goto LABEL_35;
        }
        if ((v33 == 0) != (v34 != 0))
        {
          char v36 = [(NSString *)v33 isEqual:v34];

          if (v36)
          {
LABEL_35:
            int v83 = v10;
            v84 = v35;
            v85 = v33;
            v86 = v8;
            v87 = v5;
            long long v44 = [v5 role];
            unint64_t v45 = [v44 type];
            selfAccessoryMediaSystemRole = self->_selfAccessoryMediaSystemRole;
            id v47 = v44;
            char v48 = selfAccessoryMediaSystemRole;
            if (v47 == v48)
            {

              long long v55 = v47;
LABEL_50:

              goto LABEL_51;
            }
            uint64_t v49 = v48;
            if ((v47 == 0) != (v48 != 0))
            {
              char v50 = [(HMMediaSystemRole *)v47 isEqual:v48];

              if (v50)
              {
LABEL_51:
                if (v45 == 1) {
                  uint64_t v59 = 2;
                }
                else {
                  uint64_t v59 = v45 == 2;
                }
                if (v59)
                {
                  long long v90 = 0u;
                  long long v91 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  long long v60 = [v3 components];
                  long long v61 = (void *)[v60 countByEnumeratingWithState:&v88 objects:v93 count:16];
                  if (v61)
                  {
                    id v82 = v3;
                    uint64_t v62 = *(void *)v89;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v61; uint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v89 != v62) {
                          objc_enumerationMutation(v60);
                        }
                        long long v64 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                        long long v65 = [v64 role];
                        uint64_t v66 = [v65 type];

                        if (v66 == v59)
                        {
                          v67 = [v64 mediaProfile];
                          long long v61 = [v67 accessory];

                          goto LABEL_65;
                        }
                      }
                      long long v61 = (void *)[v60 countByEnumeratingWithState:&v88 objects:v93 count:16];
                      if (v61) {
                        continue;
                      }
                      break;
                    }
LABEL_65:
                    uint64_t v3 = v82;
                  }
                }
                else
                {
                  long long v61 = 0;
                }
                v68 = [(HMAccessory *)self->_selfAccessoryMediaSystemCounterpart uniqueIdentifier];
                id v69 = [v61 uniqueIdentifier];
                id v70 = v68;
                uint64_t v71 = v70;
                if (v69 == v70)
                {
                }
                else
                {
                  if ((v70 != 0) == (v69 == 0))
                  {

                    goto LABEL_76;
                  }
                  char v72 = [v69 isEqual:v70];

                  if ((v72 & 1) == 0)
                  {
LABEL_76:
                    ucat = self->_ucat;
                    if (ucat->var0 <= 30)
                    {
                      if (ucat->var0 == -1)
                      {
                        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
                          goto LABEL_80;
                        }
                        ucat = self->_ucat;
                      }
                      id v81 = [v61 name];
                      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemCounterpart updated: %@ '%@'\n", v74, v75, v76, v77, (uint64_t)v69);
                    }
LABEL_80:
                    objc_storeStrong((id *)&self->_selfAccessoryMediaSystemCounterpart, v61);
                    goto LABEL_81;
                  }
                }
                if (!v83)
                {
LABEL_83:

                  uint64_t v5 = v87;
                  goto LABEL_84;
                }
LABEL_81:
                selfAccessoryMediaSystemUpdatedHandler = (void (**)(void))self->_selfAccessoryMediaSystemUpdatedHandler;
                if (selfAccessoryMediaSystemUpdatedHandler) {
                  selfAccessoryMediaSystemUpdatedHandler[2]();
                }
                goto LABEL_83;
              }
            }
            else
            {
            }
            long long v56 = self->_ucat;
            if (v56->var0 <= 30)
            {
              if (v56->var0 != -1)
              {
LABEL_43:
                if (v45 > 2) {
                  long long v57 = "?";
                }
                else {
                  long long v57 = off_1E55BE298[v45];
                }
                LogPrintF((uint64_t)v56, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemRole updated: %s\n", v51, v52, v53, v54, (uint64_t)v57);
                goto LABEL_49;
              }
              if (_LogCategory_Initialize((uint64_t)v56, 0x1Eu))
              {
                long long v56 = self->_ucat;
                goto LABEL_43;
              }
            }
LABEL_49:
            long long v58 = v47;
            long long v55 = self->_selfAccessoryMediaSystemRole;
            self->_selfAccessoryMediaSystemRole = v58;
            int v83 = 1;
            goto LABEL_50;
          }
        }
        else
        {
        }
        uint64_t v42 = self->_ucat;
        if (v42->var0 <= 30)
        {
          if (v42->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v42, 0x1Eu)) {
              goto LABEL_33;
            }
            uint64_t v42 = self->_ucat;
          }
          LogPrintF((uint64_t)v42, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem name updated: '%@' -> '%@'\n", v37, v38, v39, v40, (uint64_t)v33);
        }
LABEL_33:
        uint64_t v43 = v35;
        selfAccessoryMediaSystemName = self->_selfAccessoryMediaSystemName;
        self->_selfAccessoryMediaSystemName = v43;
        BOOL v10 = 1;
        goto LABEL_34;
      }
      uint64_t v11 = v9;
      if ((v8 == 0) != (v9 != 0))
      {
        char v12 = [v8 isEqual:v9];

        if (v12)
        {
          BOOL v10 = 0;
          goto LABEL_23;
        }
      }
      else
      {
      }
      unint64_t v24 = self->_ucat;
      if (v24->var0 <= 30)
      {
        if (v24->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
            goto LABEL_21;
          }
          unint64_t v24 = self->_ucat;
        }
        id v80 = [v3 name];
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem ID updated: %@ '%@'\n", v25, v26, v27, v28, (uint64_t)v8);
      }
LABEL_21:
      [v3 setDelegate:self];
      uint64_t v30 = v3;
      selfAccessoryMediaSystem = self->_selfAccessoryMediaSystem;
      self->_selfAccessoryMediaSystem = v30;
      goto LABEL_22;
    }
    uint64_t v13 = self->_selfAccessoryMediaSystem;
    [(HMMediaSystem *)v13 setDelegate:0];
    id v14 = self->_selfAccessoryMediaSystem;
    self->_selfAccessoryMediaSystem = 0;

    selfAccessoryMediaSystemCounterpart = self->_selfAccessoryMediaSystemCounterpart;
    self->_selfAccessoryMediaSystemCounterpart = 0;

    uint64_t v16 = self->_selfAccessoryMediaSystemName;
    self->_selfAccessoryMediaSystemName = 0;

    id v17 = self->_selfAccessoryMediaSystemRole;
    self->_selfAccessoryMediaSystemRole = 0;

    if (!v13)
    {
LABEL_84:

      return;
    }
    id v22 = self->_ucat;
    if (v22->var0 <= 30)
    {
      if (v22->var0 != -1)
      {
LABEL_11:
        LogPrintF((uint64_t)v22, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem removed\n", v18, v19, v20, v21, v79);
        goto LABEL_18;
      }
      if (_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
      {
        id v22 = self->_ucat;
        goto LABEL_11;
      }
    }
LABEL_18:
    uint64_t v29 = (void (**)(void))self->_selfAccessoryMediaSystemUpdatedHandler;
    if (v29) {
      v29[2]();
    }
    goto LABEL_84;
  }
}

- (void)_updateSelfAccessoryMediaAccess
{
  if (!self->_selfAccessoryMediaAccessEnabled) {
    return;
  }
  uint64_t v3 = [(HMAccessory *)self->_selfAccessory home];
  if (v3)
  {
    selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags;
    id v40 = v3;
    int v5 = [v3 isMediaPeerToPeerEnabled];
    int v10 = (selfAccessoryMediaAccessFlags >> 1) & 1;
    BOOL v11 = v10 != v5;
    if (v10 == v5)
    {
      unsigned int v15 = self->_selfAccessoryMediaAccessFlags;
      goto LABEL_17;
    }
    int v12 = v5;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_6:
        if ((selfAccessoryMediaAccessFlags & 2) != 0) {
          id v14 = "yes";
        }
        else {
          id v14 = "no";
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess P2PAllowed updated: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v14);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_6;
      }
    }
LABEL_13:
    unsigned int v16 = self->_selfAccessoryMediaAccessFlags & 0xFFFFFFFD;
    if (v12) {
      int v17 = 2;
    }
    else {
      int v17 = 0;
    }
    LOBYTE(v15) = v16 | v17;
    self->_selfAccessoryMediaAccessFlags = v16 | v17;
LABEL_17:
    uint64_t v18 = [v40 minimumMediaUserPrivilege];
    if (((v15 & 1) == 0) != (v18 != 0)) {
      goto LABEL_26;
    }
    uint64_t v23 = v18;
    unint64_t v24 = self->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_20:
        if (v15) {
          uint64_t v25 = "yes";
        }
        else {
          uint64_t v25 = "no";
        }
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess HomeOnly updated: %s -> %s\n", v19, v20, v21, v22, (uint64_t)v25);
        goto LABEL_25;
      }
      if (_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
      {
        unint64_t v24 = self->_ucat;
        goto LABEL_20;
      }
    }
LABEL_25:
    self->_selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags & 0xFFFFFFFE | (v23 != 0);
    BOOL v11 = 1;
LABEL_26:
    uint64_t v26 = [v40 mediaPassword];
    selfAccessoryMediaAccessPassword = self->_selfAccessoryMediaAccessPassword;
    uint64_t v28 = v26;
    uint64_t v29 = selfAccessoryMediaAccessPassword;
    if (v28 == v29)
    {
    }
    else
    {
      uint64_t v30 = v29;
      if ((v28 == 0) == (v29 != 0))
      {

        goto LABEL_34;
      }
      char v31 = [(NSString *)v28 isEqual:v29];

      if ((v31 & 1) == 0)
      {
LABEL_34:
        uint64_t v32 = self->_ucat;
        if (v32->var0 <= 30)
        {
          if (v32->var0 != -1)
          {
LABEL_36:
            uint64_t v33 = [(NSString *)v28 length];
            uint64_t v38 = "set";
            if (!v33) {
              uint64_t v38 = "not set";
            }
            LogPrintF((uint64_t)v32, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess password updated: %s\n", v34, v35, v36, v37, (uint64_t)v38);
            goto LABEL_40;
          }
          if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          {
            uint64_t v32 = self->_ucat;
            goto LABEL_36;
          }
        }
LABEL_40:
        objc_storeStrong((id *)&self->_selfAccessoryMediaAccessPassword, v26);
        goto LABEL_41;
      }
    }
    if (!v11)
    {
LABEL_43:

      uint64_t v3 = v40;
      goto LABEL_44;
    }
LABEL_41:
    selfAccessoryMediaAccessUpdatedHandler = (void (**)(void))self->_selfAccessoryMediaAccessUpdatedHandler;
    if (selfAccessoryMediaAccessUpdatedHandler) {
      selfAccessoryMediaAccessUpdatedHandler[2]();
    }
    goto LABEL_43;
  }
LABEL_44:
}

- (void)_updateSelfAccessoryIfNeeded
{
  if (!self->_selfAccessoryEnabled) {
    return;
  }
  uint64_t v3 = [(HMHomeManager *)self->_homeManager currentAccessory];
  obuint64_t j = v3;
  if (v3)
  {
    id v4 = [v3 uniqueIdentifier];
    int v5 = [(HMAccessory *)self->_selfAccessory uniqueIdentifier];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      if ((v6 == 0) == (v7 != 0))
      {

        goto LABEL_18;
      }
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) == 0)
      {
LABEL_18:
        ucat = self->_ucat;
        if (ucat->var0 <= 30)
        {
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
              goto LABEL_27;
            }
            ucat = self->_ucat;
          }
          uint64_t v66 = [obj name];
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"FoundSelfAccessory: %@ (%@)\n", v27, v28, v29, v30, (uint64_t)v6);
        }
LABEL_27:
        objc_storeStrong((id *)&self->_selfAccessory, obj);
        [(HMAccessory *)self->_selfAccessory setDelegate:self];
        int v25 = 1;
        goto LABEL_28;
      }
    }
    uint64_t v18 = [obj room];
    uint64_t v19 = [v18 uniqueIdentifier];

    selfAccessoryRoomID = self->_selfAccessoryRoomID;
    uint64_t v21 = v19;
    uint64_t v22 = selfAccessoryRoomID;
    if (v21 == v22)
    {

      int v25 = 0;
      char v31 = v21;
    }
    else
    {
      uint64_t v23 = v22;
      if ((v21 == 0) != (v22 != 0))
      {
        char v24 = [(NSUUID *)v21 isEqual:v22];

        if (v24)
        {
          int v25 = 0;
LABEL_25:

LABEL_28:
          BOOL v12 = v25 != 0;
          goto LABEL_32;
        }
      }
      else
      {
      }
      uint64_t v32 = v21;
      char v31 = self->_selfAccessoryRoomID;
      self->_selfAccessoryRoomID = v32;
      int v25 = 1;
    }

    goto LABEL_25;
  }
  int v10 = [(HMAccessory *)self->_selfAccessory uniqueIdentifier];
  selfAccessory = self->_selfAccessory;
  BOOL v12 = selfAccessory != 0;
  if (selfAccessory)
  {
    uint64_t v13 = self->_ucat;
    if (v13->var0 <= 30)
    {
      if (v13->var0 == -1)
      {
        BOOL v33 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
        selfAccessory = self->_selfAccessory;
        if (!v33) {
          goto LABEL_30;
        }
        uint64_t v13 = self->_ucat;
      }
      long long v65 = [(HMAccessory *)selfAccessory name];
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"LostSelfAccessory: %@ (%@)\n", v14, v15, v16, v17, (uint64_t)v10);

      selfAccessory = self->_selfAccessory;
    }
LABEL_30:
    [(HMAccessory *)selfAccessory setDelegate:self];
    uint64_t v34 = self->_selfAccessory;
    self->_selfAccessory = 0;
  }
LABEL_32:
  uint64_t v35 = [obj home];
  uint64_t v36 = [v35 currentUser];

  uint64_t v37 = [(HMUser *)v36 uniqueIdentifier];
  uint64_t v38 = [(HMUser *)self->_selfAccessoryUser uniqueIdentifier];
  id v39 = v37;
  id v40 = v38;
  if (v39 == v40)
  {

    if (!v12) {
      goto LABEL_50;
    }
    goto LABEL_48;
  }
  uint64_t v41 = v40;
  if ((v39 == 0) == (v40 != 0))
  {
  }
  else
  {
    char v42 = [v39 isEqual:v40];

    if (v42)
    {
      if (!v12) {
        goto LABEL_50;
      }
      goto LABEL_48;
    }
  }
  uint64_t v43 = self->_ucat;
  if (v43->var0 <= 30)
  {
    if (v43->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_44;
      }
      uint64_t v43 = self->_ucat;
    }
    long long v44 = [(HMUser *)v36 userID];
    LogPrintF((uint64_t)v43, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"SelfAccessory user updated: %{mask}", v45, v46, v47, v48, (uint64_t)v44);
  }
LABEL_44:
  if (v36)
  {
    selfAccessoryUser = v36;
    char v50 = self;
  }
  else
  {
    selfAccessoryUser = self->_selfAccessoryUser;
    char v50 = 0;
  }
  [(HMUser *)selfAccessoryUser setDelegate:v50];
  objc_storeStrong((id *)&self->_selfAccessoryUser, v36);
LABEL_48:
  selfAccessoryUpdatedHandler = (void (**)(void))self->_selfAccessoryUpdatedHandler;
  if (selfAccessoryUpdatedHandler) {
    selfAccessoryUpdatedHandler[2]();
  }
LABEL_50:
  uint64_t v52 = [(HMAccessory *)self->_selfAccessory applicationData];
  uint64_t v53 = [v52 dictionary];

  selfAccessoryAppData = self->_selfAccessoryAppData;
  long long v55 = v53;
  long long v56 = selfAccessoryAppData;
  if (v55 != v56)
  {
    long long v57 = v56;
    if ((v55 == 0) != (v56 != 0))
    {
      char v58 = [(NSDictionary *)v55 isEqual:v56];

      if (v58) {
        goto LABEL_62;
      }
    }
    else
    {
    }
    long long v63 = self->_ucat;
    if (v63->var0 <= 30)
    {
      if (v63->var0 != -1)
      {
LABEL_58:
        LogPrintF((uint64_t)v63, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"SelfAccessory AppData changed: %##@", v59, v60, v61, v62, (uint64_t)v55);
        goto LABEL_60;
      }
      if (_LogCategory_Initialize((uint64_t)v63, 0x1Eu))
      {
        long long v63 = self->_ucat;
        goto LABEL_58;
      }
    }
LABEL_60:
    objc_storeStrong((id *)&self->_selfAccessoryAppData, v53);
    selfAccessoryAppDataChangedHandler = (void (**)(id, id))self->_selfAccessoryAppDataChangedHandler;
    if (selfAccessoryAppDataChangedHandler) {
      selfAccessoryAppDataChangedHandler[2](selfAccessoryAppDataChangedHandler, v55);
    }
    goto LABEL_62;
  }

LABEL_62:
  [(CUHomeKitManager *)self _updateSelfAccessoryMediaAccess];
  [(CUHomeKitManager *)self _updateSelfAccessoryMediaSystem];
  [(CUHomeKitManager *)self _updateSelfAccessorySiriAccess];
}

- (void)_updateHomes
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (self->_homeManagerDidUpdateHomes)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v7 = [(HMHomeManager *)self->_homeManager homes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
        uint64_t v13 = [v12 uniqueIdentifier];
        uint64_t v14 = [(NSMutableDictionary *)self->_homes objectForKeyedSubscript:v13];

        if (!v14)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1) {
              goto LABEL_10;
            }
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_10:
              char v42 = [v12 name];
              LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"FoundHome: %@ (%@)\n", v16, v17, v18, v19, (uint64_t)v13);
            }
          }
          [v12 setDelegate:self];
          homes = self->_homes;
          if (!homes)
          {
            uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            uint64_t v22 = self->_homes;
            self->_homes = v21;

            homes = self->_homes;
          }
          [(NSMutableDictionary *)homes setObject:v12 forKeyedSubscript:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v23 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
      uint64_t v9 = v23;
      if (!v23)
      {
LABEL_19:

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        obuint64_t j = [(NSMutableDictionary *)self->_homes allKeys];
        uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (!v24) {
          goto LABEL_41;
        }
        uint64_t v25 = v24;
        uint64_t v45 = *(void *)v51;
        while (1)
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v51 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * v26);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v28 = [(HMHomeManager *)self->_homeManager homes];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (!v29)
            {
LABEL_32:

              uint64_t v28 = [(NSMutableDictionary *)self->_homes objectForKeyedSubscript:v27];
              uint64_t v35 = self->_ucat;
              if (v35->var0 <= 30)
              {
                if (v35->var0 != -1) {
                  goto LABEL_34;
                }
                if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                {
                  uint64_t v35 = self->_ucat;
LABEL_34:
                  uint64_t v43 = [v28 name];
                  LogPrintF((uint64_t)v35, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"LostHome: %@ (%@)\n", v36, v37, v38, v39, v27);
                }
              }
              [v28 setDelegate:0];
              [(NSMutableDictionary *)self->_homes setObject:0 forKeyedSubscript:v27];
              goto LABEL_37;
            }
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v47;
LABEL_26:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v47 != v31) {
                objc_enumerationMutation(v28);
              }
              BOOL v33 = [*(id *)(*((void *)&v46 + 1) + 8 * v32) uniqueIdentifier];
              char v34 = [v33 isEqual:v27];

              if (v34) {
                break;
              }
              if (v30 == ++v32)
              {
                uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
                if (v30) {
                  goto LABEL_26;
                }
                goto LABEL_32;
              }
            }
LABEL_37:

            ++v26;
          }
          while (v26 != v25);
          uint64_t v40 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
          uint64_t v25 = v40;
          if (!v40)
          {
LABEL_41:

            [(CUHomeKitManager *)self _updateUsers];
            [(CUHomeKitManager *)self _updateSelfAccessoryIfNeeded];
            [(CUHomeKitManager *)self _updateAccessories];
            return;
          }
        }
      }
    }
  }
  uint64_t v41 = self->_ucat;
  if (v41->var0 <= 30)
  {
    if (v41->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v41, 0x1Eu)) {
        return;
      }
      uint64_t v41 = self->_ucat;
    }
    LogPrintF((uint64_t)v41, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"Ignoring update homes before homeManagerDidUpdateHomes", v2, v3, v4, v5, v63);
  }
}

- (void)_updateAccessories
{
  uint64_t v2 = self;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = [(NSMutableDictionary *)self->_resolvableAccessoriesMap allKeys];
  int v83 = v2;
  uint64_t v78 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (!v78)
  {
    char v77 = 0;
    goto LABEL_38;
  }
  char v77 = 0;
  uint64_t v75 = *(void *)v104;
  do
  {
    uint64_t v3 = 0;
    do
    {
      if (*(void *)v104 != v75) {
        objc_enumerationMutation(obj);
      }
      uint64_t v80 = v3;
      uint64_t v4 = *(void *)(*((void *)&v103 + 1) + 8 * v3);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v82 = [(HMHomeManager *)v2->_homeManager homes];
      uint64_t v5 = [v82 countByEnumeratingWithState:&v99 objects:v110 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v84 = *(void *)v100;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v100 != v84) {
              objc_enumerationMutation(v82);
            }
            uint64_t v8 = *(void **)(*((void *)&v99 + 1) + 8 * i);
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            uint64_t v9 = [v8 accessories];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v96;
LABEL_13:
              uint64_t v13 = 0;
              while (1)
              {
                if (*(void *)v96 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v95 + 1) + 8 * v13);
                uint64_t v15 = [v14 uniqueIdentifier];
                char v16 = [v15 isEqual:v4];

                if (v16) {
                  break;
                }
                if (v11 == ++v13)
                {
                  uint64_t v11 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
                  if (v11) {
                    goto LABEL_13;
                  }
                  goto LABEL_19;
                }
              }
              id v17 = v14;

              if (!v17) {
                goto LABEL_21;
              }
              uint64_t v2 = v83;
              goto LABEL_29;
            }
LABEL_19:

LABEL_21:
            uint64_t v2 = v83;
          }
          uint64_t v6 = [v82 countByEnumeratingWithState:&v99 objects:v110 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      id v17 = [(NSMutableDictionary *)v2->_resolvableAccessoriesMap objectForKeyedSubscript:v4];
      [(NSMutableDictionary *)v2->_resolvableAccessoriesMap setObject:0 forKeyedSubscript:v4];
      id v82 = [v17 accessory];
      [v82 setDelegate:0];
      ucat = v2->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
          uint64_t v19 = v80;
          goto LABEL_26;
        }
        uint64_t v19 = v80;
        if (_LogCategory_Initialize((uint64_t)v2->_ucat, 0x1Eu))
        {
          ucat = v2->_ucat;
LABEL_26:
          uint64_t v20 = [v17 irkData];
          v67 = [v82 name];
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory removed: %@, %{mask}, '%@'\n", v21, v22, v23, v24, v4);
        }
        char v77 = 1;
        goto LABEL_32;
      }
      char v77 = 1;
LABEL_29:
      uint64_t v19 = v80;
LABEL_32:

      uint64_t v3 = v19 + 1;
    }
    while (v3 != v78);
    uint64_t v25 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
    uint64_t v78 = v25;
  }
  while (v25);
LABEL_38:

  uint64_t v26 = [(HMHomeManager *)v2->_homeManager currentAccessory];
  uint64_t v27 = [v26 uniqueIdentifier];

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v70 = [(HMHomeManager *)v2->_homeManager homes];
  uint64_t v72 = [v70 countByEnumeratingWithState:&v91 objects:v108 count:16];
  if (!v72) {
    goto LABEL_83;
  }
  uint64_t v71 = *(void *)v92;
  uint64_t v79 = v27;
  while (2)
  {
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v92 != v71) {
        objc_enumerationMutation(v70);
      }
      obja = v28;
      uint64_t v29 = *(void **)(*((void *)&v91 + 1) + 8 * (void)v28);
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      uint64_t v30 = [v29 accessories];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v87 objects:v107 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v88;
        id v81 = v30;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v88 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void **)(*((void *)&v87 + 1) + 8 * v34);
            uint64_t v36 = [v35 uniqueIdentifier];
            uint64_t v37 = v36;
            if (v36 && ([v36 isEqual:v27] & 1) == 0)
            {
              uint64_t v38 = [v35 device];
              if (v38)
              {
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v39 = [v38 rapportIRK];
                  uint64_t v40 = [v39 data];

                  uint64_t v41 = [(NSMutableDictionary *)v2->_resolvableAccessoriesMap objectForKeyedSubscript:v37];
                  char v42 = v41;
                  v85 = v40;
                  if (v41)
                  {
                    uint64_t v43 = [v41 irkData];
                    long long v44 = v40;
                    uint64_t v45 = v43;
                    if (v44 == v45)
                    {

                      uint64_t v2 = v83;
                      uint64_t v30 = v81;
                    }
                    else
                    {
                      long long v46 = v45;
                      uint64_t v30 = v81;
                      if ((v44 == 0) != (v45 != 0))
                      {
                        char v76 = [(CUHomeKitResolvableAccessory *)v44 isEqual:v45];

                        uint64_t v2 = v83;
                        if (v76)
                        {
LABEL_74:

                          uint64_t v27 = v79;
                          goto LABEL_75;
                        }
                      }
                      else
                      {

                        uint64_t v2 = v83;
                      }
                      [v42 setIrkData:v44];
                      p_int var0 = &v2->_ucat->var0;
                      if (*p_var0 > 30) {
                        goto LABEL_73;
                      }
                      if (*p_var0 != -1) {
                        goto LABEL_67;
                      }
                      if (!_LogCategory_Initialize((uint64_t)p_var0, 0x1Eu))
                      {
LABEL_73:
                        char v77 = 1;
                        uint64_t v2 = v83;
                        goto LABEL_74;
                      }
                      p_int var0 = &v83->_ucat->var0;
LABEL_67:
                      uint64_t v69 = [v35 name];
                      LogPrintF((uint64_t)p_var0, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory updated: %@, %{mask}, '%@'\n", v56, v57, v58, v59, (uint64_t)v37);
                      char v77 = 1;
                      long long v44 = (CUHomeKitResolvableAccessory *)v69;
LABEL_70:
                      uint64_t v2 = v83;
                    }

                    goto LABEL_74;
                  }
                  long long v44 = objc_alloc_init(CUHomeKitResolvableAccessory);
                  [(CUHomeKitResolvableAccessory *)v44 setAccessory:v35];
                  [(CUHomeKitResolvableAccessory *)v44 setIrkData:v40];
                  resolvableAccessoriesMap = v2->_resolvableAccessoriesMap;
                  if (!resolvableAccessoriesMap)
                  {
                    long long v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    long long v49 = v2->_resolvableAccessoriesMap;
                    v2->_resolvableAccessoriesMap = v48;

                    resolvableAccessoriesMap = v2->_resolvableAccessoriesMap;
                  }
                  [(NSMutableDictionary *)resolvableAccessoriesMap setObject:v44 forKeyedSubscript:v37];
                  [v35 setDelegate:v2];
                  long long v50 = v2->_ucat;
                  uint64_t v30 = v81;
                  if (v50->var0 <= 30)
                  {
                    if (v50->var0 != -1) {
                      goto LABEL_62;
                    }
                    if (_LogCategory_Initialize((uint64_t)v50, 0x1Eu))
                    {
                      long long v50 = v83->_ucat;
LABEL_62:
                      v68 = [v35 name];
                      LogPrintF((uint64_t)v50, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory added: %@, %{mask}, '%@'\n", v51, v52, v53, v54, (uint64_t)v37);
                    }
                  }
                  char v77 = 1;
                  goto LABEL_70;
                }
              }
              else
              {
                [v35 setDelegate:v2];
              }
LABEL_75:
            }
            ++v34;
          }
          while (v32 != v34);
          uint64_t v60 = [v30 countByEnumeratingWithState:&v87 objects:v107 count:16];
          uint64_t v32 = v60;
        }
        while (v60);
      }

      uint64_t v28 = obja + 1;
      if (obja + 1 != (char *)v72) {
        continue;
      }
      break;
    }
    uint64_t v72 = [v70 countByEnumeratingWithState:&v91 objects:v108 count:16];
    if (v72) {
      continue;
    }
    break;
  }
LABEL_83:

  if (v77)
  {
    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v62 = v2->_resolvableAccessoriesMap;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __38__CUHomeKitManager__updateAccessories__block_invoke;
    v86[3] = &unk_1E55BE138;
    v86[4] = v61;
    [(NSMutableDictionary *)v62 enumerateKeysAndObjectsUsingBlock:v86];
    uint64_t v63 = [v61 copy];
    resolvableAccessories = v2->_resolvableAccessories;
    v2->_resolvableAccessories = (NSArray *)v63;

    long long v65 = _Block_copy(v2->_resolvableAccessoriesChangedHandler);
    uint64_t v66 = v65;
    if (v65) {
      (*((void (**)(void *))v65 + 2))(v65);
    }
  }
}

void __38__CUHomeKitManager__updateAccessories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [v8 irkData];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v8 accessory];
    [v6 addObject:v7];
  }
}

- (void)_clearHomeKitState
{
  homes = self->_homes;
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __38__CUHomeKitManager__clearHomeKitState__block_invoke;
  v99[3] = &unk_1E55BE110;
  v99[4] = self;
  [(NSMutableDictionary *)homes enumerateKeysAndObjectsUsingBlock:v99];
  [(NSMutableDictionary *)self->_homes removeAllObjects];
  uint64_t v4 = self->_homes;
  self->_homes = 0;

  [(NSMutableDictionary *)self->_users removeAllObjects];
  users = self->_users;
  self->_users = 0;

  uint64_t v6 = self->_selfAccessory;
  BOOL v7 = v6 != 0;
  if (v6)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      uint64_t v9 = [(HMAccessory *)v6 uniqueIdentifier];
      long long v96 = [(HMAccessory *)v6 name];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"LostSelfAccessory: %@ (%@), HK clear", v10, v11, v12, v13, (uint64_t)v9);
    }
LABEL_6:
    selfAccessory = self->_selfAccessory;
    self->_selfAccessory = 0;
  }
  selfAccessoryRoomID = self->_selfAccessoryRoomID;
  if (selfAccessoryRoomID)
  {
    self->_selfAccessoryRoomID = 0;

    BOOL v7 = 1;
  }
  char v16 = self->_selfAccessoryUser;
  if (v16)
  {
    id v17 = self->_ucat;
    if (v17->var0 <= 30)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
          goto LABEL_14;
        }
        id v17 = self->_ucat;
      }
      uint64_t v18 = [(HMUser *)v16 userID];
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory user updated: %{mask}, HK clear", v19, v20, v21, v22, (uint64_t)v18);
    }
LABEL_14:
    selfAccessoryUser = self->_selfAccessoryUser;
    self->_selfAccessoryUser = 0;

    BOOL v7 = 1;
  }

  uint64_t v28 = self->_selfAccessoryAppData;
  if (!v28) {
    goto LABEL_21;
  }
  uint64_t v29 = self->_ucat;
  if (v29->var0 <= 30)
  {
    if (v29->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v29, 0x1Eu)) {
        goto LABEL_20;
      }
      uint64_t v29 = self->_ucat;
    }
    LogPrintF((uint64_t)v29, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory AppData changed: %##@, HK clear", v24, v25, v26, v27, (uint64_t)v28);
  }
LABEL_20:
  selfAccessoryAppData = self->_selfAccessoryAppData;
  self->_selfAccessoryAppData = 0;

LABEL_21:
  selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags;
  BOOL v36 = selfAccessoryMediaAccessFlags != 0;
  if (!selfAccessoryMediaAccessFlags) {
    goto LABEL_27;
  }
  uint64_t v37 = self->_ucat;
  if (v37->var0 <= 30)
  {
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x1Eu)) {
        goto LABEL_26;
      }
      uint64_t v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess changed: HK clear", v31, v32, v33, v34, v95);
  }
LABEL_26:
  self->_selfAccessoryMediaAccessFlags = 0;
LABEL_27:
  if (!self->_selfAccessoryMediaAccessPassword) {
    goto LABEL_33;
  }
  uint64_t v38 = self->_ucat;
  if (v38->var0 <= 30)
  {
    if (v38->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v38, 0x1Eu)) {
        goto LABEL_32;
      }
      uint64_t v38 = self->_ucat;
    }
    LogPrintF((uint64_t)v38, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess password updated: HK clear", v31, v32, v33, v34, v95);
  }
LABEL_32:
  selfAccessoryMediaAccessPassword = self->_selfAccessoryMediaAccessPassword;
  self->_selfAccessoryMediaAccessPassword = 0;

  BOOL v36 = 1;
LABEL_33:
  uint64_t v40 = self->_selfAccessoryMediaSystem;
  BOOL v41 = v40 != 0;
  if (!v40) {
    goto LABEL_39;
  }
  char v42 = self->_ucat;
  if (v42->var0 <= 30)
  {
    if (v42->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_38;
      }
      char v42 = self->_ucat;
    }
    uint64_t v43 = [(HMMediaSystem *)v40 uniqueIdentifier];
    long long v97 = [(HMMediaSystem *)v40 name];
    LogPrintF((uint64_t)v42, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem ID updated: %@ '%@', HK clear", v44, v45, v46, v47, (uint64_t)v43);
  }
LABEL_38:
  selfAccessoryMediaSystem = self->_selfAccessoryMediaSystem;
  self->_selfAccessoryMediaSystem = 0;

LABEL_39:
  long long v49 = self->_selfAccessoryMediaSystemCounterpart;
  if (!v49) {
    goto LABEL_45;
  }
  long long v50 = self->_ucat;
  if (v50->var0 <= 30)
  {
    if (v50->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_44;
      }
      long long v50 = self->_ucat;
    }
    uint64_t v51 = [(HMAccessory *)v49 uniqueIdentifier];
    long long v98 = [(HMAccessory *)v49 name];
    LogPrintF((uint64_t)v50, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemCounterpart updated: %@ '%@', HK clear\n", v52, v53, v54, v55, (uint64_t)v51);
  }
LABEL_44:
  selfAccessoryMediaSystemCounterpart = self->_selfAccessoryMediaSystemCounterpart;
  self->_selfAccessoryMediaSystemCounterpart = 0;

  BOOL v41 = 1;
LABEL_45:

  id v61 = self->_selfAccessoryMediaSystemName;
  if (!v61) {
    goto LABEL_51;
  }
  uint64_t v62 = self->_ucat;
  if (v62->var0 <= 30)
  {
    if (v62->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v62, 0x1Eu)) {
        goto LABEL_50;
      }
      uint64_t v62 = self->_ucat;
    }
    LogPrintF((uint64_t)v62, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem name updated: '%@', HK clear", v57, v58, v59, v60, (uint64_t)v61);
  }
LABEL_50:
  selfAccessoryMediaSystemName = self->_selfAccessoryMediaSystemName;
  self->_selfAccessoryMediaSystemName = 0;

  BOOL v41 = 1;
LABEL_51:

  long long v64 = self->_selfAccessoryMediaSystemRole;
  if (!v64) {
    goto LABEL_61;
  }
  long long v65 = self->_ucat;
  if (v65->var0 <= 30)
  {
    if (v65->var0 != -1)
    {
LABEL_54:
      unint64_t v66 = [(HMMediaSystemRole *)v64 type];
      if (v66 > 2) {
        uint64_t v71 = "?";
      }
      else {
        uint64_t v71 = off_1E55BE298[v66];
      }
      LogPrintF((uint64_t)v65, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemRole updated: %s, HK clear", v67, v68, v69, v70, (uint64_t)v71);
      goto LABEL_60;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      long long v65 = self->_ucat;
      goto LABEL_54;
    }
  }
LABEL_60:
  selfAccessoryMediaSystemRole = self->_selfAccessoryMediaSystemRole;
  self->_selfAccessoryMediaSystemRole = 0;

  BOOL v41 = 1;
LABEL_61:

  selfAccessorySiriEnabled = self->_selfAccessorySiriEnabled;
  if (!self->_selfAccessorySiriEnabled) {
    goto LABEL_67;
  }
  uint64_t v78 = self->_ucat;
  if (v78->var0 <= 30)
  {
    if (v78->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v78, 0x1Eu)) {
        goto LABEL_66;
      }
      uint64_t v78 = self->_ucat;
    }
    LogPrintF((uint64_t)v78, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory SiriAccess per-accessory updated: HK clear", v73, v74, v75, v76, v95);
  }
LABEL_66:
  self->_selfAccessorySiriEnabled = 0;
LABEL_67:
  resolvableAccessories = self->_resolvableAccessories;
  if (!resolvableAccessories) {
    goto LABEL_73;
  }
  uint64_t v80 = self->_ucat;
  if (v80->var0 <= 30)
  {
    if (v80->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v80, 0x1Eu)) {
        goto LABEL_72;
      }
      uint64_t v80 = self->_ucat;
    }
    LogPrintF((uint64_t)v80, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"ResolvableAccessory updated: HK clear", v73, v74, v75, v76, v95);
  }
LABEL_72:
  id v81 = self->_resolvableAccessories;
  self->_resolvableAccessories = 0;

LABEL_73:
  resolvableAccessoriesMap = self->_resolvableAccessoriesMap;
  self->_resolvableAccessoriesMap = 0;

  if (v7)
  {
    int v83 = _Block_copy(self->_selfAccessoryUpdatedHandler);
    uint64_t v84 = v83;
    if (v83) {
      (*((void (**)(void *))v83 + 2))(v83);
    }
  }
  if (v28)
  {
    v85 = _Block_copy(self->_selfAccessoryAppDataChangedHandler);
    v86 = v85;
    if (v85) {
      (*((void (**)(void *, void))v85 + 2))(v85, 0);
    }
  }
  if (v36)
  {
    long long v87 = _Block_copy(self->_selfAccessoryMediaAccessUpdatedHandler);
    long long v88 = v87;
    if (v87) {
      (*((void (**)(void *))v87 + 2))(v87);
    }

    if (!v41)
    {
LABEL_83:
      if (!selfAccessorySiriEnabled) {
        goto LABEL_84;
      }
      goto LABEL_92;
    }
  }
  else if (!v41)
  {
    goto LABEL_83;
  }
  long long v89 = _Block_copy(self->_selfAccessoryMediaSystemUpdatedHandler);
  long long v90 = v89;
  if (v89) {
    (*((void (**)(void *))v89 + 2))(v89);
  }

  if (!selfAccessorySiriEnabled)
  {
LABEL_84:
    if (!resolvableAccessories) {
      return;
    }
    goto LABEL_95;
  }
LABEL_92:
  long long v91 = _Block_copy(self->_selfAccessorySiriAccessUpdatedHandler);
  long long v92 = v91;
  if (v91) {
    (*((void (**)(void *))v91 + 2))(v91);
  }

  if (resolvableAccessories)
  {
LABEL_95:
    long long v93 = _Block_copy(self->_resolvableAccessoriesChangedHandler);
    long long v94 = v93;
    if (v93) {
      (*((void (**)(void *))v93 + 2))(v93);
    }
  }
}

void __38__CUHomeKitManager__clearHomeKitState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(int **)(*(void *)(a1 + 32) + 96);
  if (*v6 <= 30)
  {
    if (*v6 != -1)
    {
LABEL_3:
      uint64_t v11 = [v5 name];
      LogPrintF((uint64_t)v6, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]_block_invoke", 0x1Eu, (uint64_t)"LostHome: %@ (%@), HK clear", v7, v8, v9, v10, (uint64_t)v12);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize(*(void *)(*(void *)(a1 + 32) + 96), 0x1Eu))
    {
      uint64_t v6 = *(int **)(*(void *)(a1 + 32) + 96);
      goto LABEL_3;
    }
  }
LABEL_5:
  [v5 setDelegate:0];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v22);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  selfAccessoryAppDataChangedHandler = self->_selfAccessoryAppDataChangedHandler;
  self->_selfAccessoryAppDataChangedHandler = 0;

  selfAccessoryMediaAccessUpdatedHandler = self->_selfAccessoryMediaAccessUpdatedHandler;
  self->_selfAccessoryMediaAccessUpdatedHandler = 0;

  selfAccessoryMediaSystemUpdatedHandler = self->_selfAccessoryMediaSystemUpdatedHandler;
  self->_selfAccessoryMediaSystemUpdatedHandler = 0;

  selfAccessorySiriAccessUpdatedHandler = self->_selfAccessorySiriAccessUpdatedHandler;
  self->_selfAccessorySiriAccessUpdatedHandler = 0;

  selfAccessoryUpdatedHandler = self->_selfAccessoryUpdatedHandler;
  self->_selfAccessoryUpdatedHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id v15 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  id stateChangedHandler = self->_stateChangedHandler;
  self->_id stateChangedHandler = 0;

  self->_invalidateDone = 1;
  uint64_t v21 = self->_ucat;
  if (v21->var0 <= 10)
  {
    if (v21->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v21, 0xAu)) {
        return;
      }
      uint64_t v21 = self->_ucat;
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUHomeKitManager _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v17, v18, v19, v20, v24);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUHomeKitManager_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(unsigned char *)(v8 + 88)) {
    return result;
  }
  uint64_t v9 = result;
  *(unsigned char *)(v8 + 88) = 1;
  uint64_t v10 = *(void *)(result + 32);
  uint64_t v11 = *(int **)(v10 + 96);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      uint64_t v11 = *(int **)(v10 + 96);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUHomeKitManager invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v33);
    uint64_t v10 = *(void *)(v9 + 32);
  }
LABEL_6:
  int v13 = *(_DWORD *)(v10 + 8);
  if (v13 != -1)
  {
    notify_cancel(v13);
    *(_DWORD *)(*(void *)(v9 + 32) + 8) = -1;
    uint64_t v10 = *(void *)(v9 + 32);
  }
  [*(id *)(v10 + 16) setDelegate:0];
  uint64_t v14 = *(void *)(v9 + 32);
  id v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = 0;

  [*(id *)(*(void *)(v9 + 32) + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3477];
  [*(id *)(*(void *)(v9 + 32) + 32) removeAllObjects];
  uint64_t v16 = *(void *)(v9 + 32);
  uint64_t v17 = *(void **)(v16 + 32);
  *(void *)(v16 + 32) = 0;

  [*(id *)(*(void *)(v9 + 32) + 40) removeAllObjects];
  [*(id *)(*(void *)(v9 + 32) + 176) setDelegate:0];
  uint64_t v18 = *(void *)(v9 + 32);
  uint64_t v19 = *(void **)(v18 + 176);
  *(void *)(v18 + 176) = 0;

  [*(id *)(*(void *)(v9 + 32) + 224) setDelegate:0];
  uint64_t v20 = *(void *)(v9 + 32);
  uint64_t v21 = *(void **)(v20 + 224);
  *(void *)(v20 + 224) = 0;

  uint64_t v22 = *(void *)(v9 + 32);
  uint64_t v23 = *(void **)(v22 + 232);
  *(void *)(v22 + 232) = 0;

  uint64_t v24 = *(void *)(v9 + 32);
  uint64_t v25 = *(void **)(v24 + 240);
  *(void *)(v24 + 240) = 0;

  uint64_t v26 = *(void *)(v9 + 32);
  uint64_t v27 = *(void **)(v26 + 248);
  *(void *)(v26 + 248) = 0;

  [*(id *)(*(void *)(v9 + 32) + 72) setDelegate:0];
  uint64_t v28 = *(void *)(v9 + 32);
  uint64_t v29 = *(void **)(v28 + 72);
  *(void *)(v28 + 72) = 0;

  [*(id *)(*(void *)(v9 + 32) + 80) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_112_3478];
  [*(id *)(*(void *)(v9 + 32) + 80) removeAllObjects];
  uint64_t v30 = *(void *)(v9 + 32);
  uint64_t v31 = *(void **)(v30 + 80);
  *(void *)(v30 + 80) = 0;

  uint64_t v32 = *(void **)(v9 + 32);
  return [v32 _invalidated];
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDelegate:0];
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDelegate:0];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)_activateIfNeeded
{
  if ([(Class)getHMClientConnectionClass[0]() areHomesConfigured])
  {
    int homeKitPrefsNotifyToken = self->_homeKitPrefsNotifyToken;
    if (homeKitPrefsNotifyToken != -1)
    {
      notify_cancel(homeKitPrefsNotifyToken);
      self->_int homeKitPrefsNotifyToken = -1;
    }
    unsigned int flags = self->_flags;
    if ((flags & 2) != 0 || self->_selfAccessoryAppDataChangedHandler || self->_selfAccessoryUpdatedHandler) {
      self->_selfAccessoryEnabled = 1;
    }
    if (self->_selfAccessoryMediaAccessUpdatedHandler) {
      self->_selfAccessoryMediaAccessEnabled = 1;
    }
    if (self->_selfAccessoryMediaSystemUpdatedHandler) {
      self->_selfAccessoryMediaSystemEnabled = 1;
    }
    if ((flags & 0x10) != 0 || self->_selfAccessorySiriAccessUpdatedHandler) {
      self->_selfAccessorySiriAccessEnabled = 1;
    }
    if (self->_homeManager) {
      goto LABEL_43;
    }
    if ((flags & 0x21) != 0)
    {
      uint64_t v9 = -1;
    }
    else
    {
      if (self->_selfAccessoryEnabled) {
        unint64_t v11 = ((unint64_t)(self->_resolvableAccessoriesChangedHandler != 0) << 6) | 0x10;
      }
      else {
        unint64_t v11 = (unint64_t)(self->_resolvableAccessoriesChangedHandler != 0) << 6;
      }
      if (self->_selfAccessoryMediaSystemEnabled || self->_selfAccessoryMediaAccessEnabled) {
        v11 |= 0x80uLL;
      }
      if (self->_selfAccessorySiriAccessEnabled) {
        v11 |= 8uLL;
      }
      if ((flags & 4) != 0) {
        v11 |= 0xAuLL;
      }
      uint64_t v9 = v11 | (flags >> 2) & 0x20 | (flags >> 1) & 4 | (flags >> 3) & 8 | (((flags >> 10) & 1) << 11);
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_39;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _activateIfNeeded]", 0x1Eu, (uint64_t)"Create HMHomeManager %#ll{flags} %s\n", v3, v4, v5, v6, v9);
    }
LABEL_39:
    if ((flags & 0x200) != 0)
    {
      uint64_t v14 = (HMHomeManager *)[objc_alloc((Class)getHMHomeManagerConfigurationClass[0]()) initWithOptions:v9 cachePolicy:2];
      id v15 = (HMHomeManager *)[objc_alloc((Class)getHMHomeManagerClass[0]()) initWithConfiguration:v14];
      homeManager = self->_homeManager;
      self->_homeManager = v15;
    }
    else
    {
      int v13 = (HMHomeManager *)[objc_alloc((Class)getHMHomeManagerClass[0]()) initWithOptions:v9];
      uint64_t v14 = self->_homeManager;
      self->_homeManager = v13;
    }

    [(HMHomeManager *)self->_homeManager setDelegate:self];
LABEL_43:
    [(CUHomeKitManager *)self _updateState];
    return;
  }
  uint64_t v10 = self->_ucat;
  if (v10->var0 > 30) {
    return;
  }
  if (v10->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu)) {
      return;
    }
    uint64_t v10 = self->_ucat;
  }
  LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager _activateIfNeeded]", 0x1Eu, (uint64_t)"Deferring HomeKit init until prefs indicate it's configured\n", v3, v4, v5, v6, v18);
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUHomeKitManager_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CUHomeKitManager_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 96);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager activate]_block_invoke", 0x1Eu, (uint64_t)"Activate %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 108));
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_5:
  if (*(_DWORD *)(v9 + 8) == -1 && getHMHomeManagerPreferencesChangedNotification[0]())
  {
    BOOL v12 = (const char *)getHMHomeManagerPreferencesChangedNotification[0]();
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(v13 + 120);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __28__CUHomeKitManager_activate__block_invoke_2;
    handler[3] = &unk_1E55BF010;
    handler[4] = v13;
    notify_register_dispatch(v12, (int *)(v13 + 8), v14, handler);
  }
  return [*(id *)(a1 + 32) _activateIfNeeded];
}

uint64_t __28__CUHomeKitManager_activate__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(_DWORD *)(v8 + 8) == -1) {
    return result;
  }
  uint64_t v9 = result;
  uint64_t v10 = *(int **)(v8 + 96);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(v9 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v8 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager activate]_block_invoke_2", 0x1Eu, (uint64_t)"HomeKit prefs changed\n", a5, a6, a7, a8, v12);
    uint64_t v8 = *(void *)(v9 + 32);
  }
LABEL_7:
  return [(id)v8 _activateIfNeeded];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CB988;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUHomeKitManager;
  [(CUHomeKitManager *)&v4 dealloc];
}

- (CUHomeKitManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUHomeKitManager;
  uint64_t v2 = [(CUHomeKitManager *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_int homeKitPrefsNotifyToken = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUHomeKitManager;
  }
  return v2;
}

@end