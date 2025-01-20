@interface HAP2AccessoryServer
+ (HAP2AccessoryServer)_accessoryServerWithMetadata:(void *)a3 browser:(void *)a4 controller:(void *)a5 operationQueue:(BOOL)a6 internallyPaired:;
+ (id)new;
+ (id)pairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 operationQueue:(id)a6;
+ (id)unpairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 pairingDriver:(id)a6 operationQueue:(id)a7;
- (BOOL)hasDiscoveryAdvertisement;
- (BOOL)hasPairings;
- (BOOL)isConfirming;
- (BOOL)isInternallyPaired;
- (HAP2Accessory)primaryAccessory;
- (HAP2AccessoryServer)init;
- (HAP2AccessoryServerBrowserPrivate)browser;
- (HAP2AccessoryServerControllerPrivate)controller;
- (HAP2AccessoryServerDelegate)delegate;
- (HAP2SerializedOperationQueue)operationQueue;
- (HAPDeviceID)deviceID;
- (HMFVersion)protocolVersion;
- (NSData)setupHash;
- (NSString)description;
- (NSString)model;
- (NSString)name;
- (NSString)productData;
- (NSString)reachabilityChangedReason;
- (NSString)setupID;
- (double)sessionCheckInterval;
- (id)_delegateCancelableFor:(void *)a1;
- (id)_findAccessoryAndCharacteristicForInstanceID:(void *)a3 characteristic:;
- (id)_readValuesForCharacteristics:(uint64_t)a3 timeout:(void *)a4 options:(void *)a5 activity:(double)a6 completion:;
- (id)addPairing:(id)a3 completion:(id)a4;
- (id)currentMetadata;
- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4;
- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4;
- (id)getPairingsWithCompletion:(id)a3;
- (id)identifyWithCompletion:(id)a3;
- (id)internalPairingDriver;
- (id)outstandingUpdateAccessoriesRequest;
- (id)pairDelegate;
- (id)pairWithDelegate:(id)a3;
- (id)pairedDelegate;
- (id)privateAccessories;
- (id)reachability;
- (id)reachabilityProfile;
- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5;
- (id)removePairing:(id)a3 completion:(id)a4;
- (id)unpairWithCompletion:(id)a3;
- (id)updateAccessoriesWithReason:(id)a3;
- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5;
- (uint64_t)setInternallyPaired:(uint64_t)result;
- (unint64_t)category;
- (unint64_t)connectionState;
- (unsigned)configNumber;
- (unsigned)stateNumber;
- (void)_handleAccessoryOperationError:(void *)a1;
- (void)_handleFailedAccessoryDiscovery:(void *)a1;
- (void)_kickReachabilityAfterCharacteristicOperation:(void *)a3 withResponse:(char)a4 ignoreCachedCharacteristics:(void *)a5 error:;
- (void)_performBackgroundPollWithCompletion:(id)a3;
- (void)_pollAccessoryWithOptions:(void *)a1;
- (void)_setBackgroundActivityScheduler:(id)a3;
- (void)_stopConfirming;
- (void)_updateConnectionState:(void *)a3 withError:;
- (void)_updateServerMetadata:(void *)a3 controller:;
- (void)becomePairedWithAccessoryServer:(id)a3;
- (void)becomeUnpairedWithAccessoryServer:(id)a3;
- (void)clearAccessories;
- (void)closeSession;
- (void)dealloc;
- (void)handleEvents:(id)a3;
- (void)handleLostDiscoveryAdvertisement;
- (void)handleLostDiscoveryAdvertisementWithWillSleep:(BOOL)a3;
- (void)handleNetworkChanged;
- (void)handleReestablishedSession;
- (void)handleUpdatedCharacteristicValues:(id)a3;
- (void)mergeWithNewlyDiscoveredPairedAccessoryServer:(id)a3;
- (void)mergeWithNewlyDiscoveredUnpairedAccessoryServer:(id)a3;
- (void)pairingDriver:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6;
- (void)pairingDriver:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6;
- (void)pairingDriver:(id)a3 didCompleteWithError:(id)a4;
- (void)pairingDriver:(id)a3 didFinishAuthWithError:(id)a4;
- (void)pairingDriver:(id)a3 didRejectSetupCodeForAccessory:(id)a4 backoffInterval:(double)a5 completion:(id)a6;
- (void)pairingDriver:(id)a3 didRequestLocalPairingIdentityWithCompletion:(id)a4;
- (void)pairingDriver:(id)a3 didSaveRemotePairingIdentity:(id)a4 completion:(id)a5;
- (void)pairingDriver:(id)a3 doesRequirePermission:(unint64_t)a4 accessory:(id)a5 completion:(id)a6;
- (void)pairingDriver:(id)a3 doesRequireSetupCodeForAccessory:(id)a4 completion:(id)a5;
- (void)pairingDriver:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6;
- (void)pairingDriver:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7;
- (void)pollAccessory;
- (void)setBackgroundScheduler:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setHasDiscoveryAdvertisement:(BOOL)a3;
- (void)setInternalPairingDriver:(uint64_t)a1;
- (void)setOutstandingUpdateAccessoriesRequest:(void *)a1;
- (void)setPairDelegate:(void *)a1;
- (void)setPairedName:(uint64_t)a1;
- (void)setPairedProtocolVersion:(uint64_t)a1;
- (void)setPrivateAccessories:(uint64_t)a1;
- (void)setProductData:(id)a3;
- (void)setReachabilityChangedReason:(id)a3;
- (void)setReachabilityProfile:(id *)a1;
- (void)setSetupID:(id)a3;
- (void)startConfirming;
- (void)stopConfirming;
- (void)updateReachability;
- (void)verifyConnection;
@end

@implementation HAP2AccessoryServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_reachabilityProfile, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_destroyWeak((id *)&self->_pairDelegate);
  objc_storeStrong((id *)&self->_internalPairingDriver, 0);
  objc_storeStrong((id *)&self->_outstandingUpdateAccessoriesRequest, 0);
  objc_storeStrong((id *)&self->_pairedProtocolVersion, 0);
  objc_storeStrong((id *)&self->_pairedName, 0);
  objc_storeStrong((id *)&self->_privateAccessories, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_currentMetadata, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2AccessoryServerBrowserPrivate)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);

  return (HAP2AccessoryServerBrowserPrivate *)WeakRetained;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServer;
  v4 = [(HAP2LoggingObject *)&v11 description];
  v5 = [(HAP2AccessoryServer *)self name];
  v6 = [(HAP2AccessoryServer *)self deviceID];
  BOOL v7 = -[HAP2AccessoryServer isInternallyPaired]((uint64_t)self);
  v8 = @"Unpaired";
  if (v7) {
    v8 = @"Paired";
  }
  v9 = [v3 stringWithFormat:@"%@ [%@/%@] (%@)", v4, v5, v6, v8];

  return (NSString *)v9;
}

- (BOOL)isInternallyPaired
{
  BOOL v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    id v2 = *(id *)(a1 + 168);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__HAP2AccessoryServer_isInternallyPaired__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    BOOL v1 = *((unsigned char *)v6 + 24) != 0;
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __41__HAP2AccessoryServer_isInternallyPaired__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (NSData)setupHash
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v3 = [v2 setupHash];

  return (NSData *)v3;
}

- (id)currentMetadata
{
  BOOL v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x3032000000;
    char v8 = __Block_byref_object_copy__4235;
    v9 = __Block_byref_object_dispose__4236;
    id v10 = 0;
    id v2 = a1[21];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__HAP2AccessoryServer_currentMetadata__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    BOOL v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

void __38__HAP2AccessoryServer_currentMetadata__block_invoke(uint64_t a1)
{
}

- (unsigned)configNumber
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  unsigned __int16 v3 = [v2 configNumber];

  return v3;
}

- (unsigned)stateNumber
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  unsigned __int16 v3 = [v2 stateNumber];

  return v3;
}

- (unint64_t)category
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  unint64_t v3 = [v2 category];

  return v3;
}

- (NSString)model
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  unint64_t v3 = [v2 model];

  return (NSString *)v3;
}

- (NSString)name
{
  if (!-[HAP2AccessoryServer isInternallyPaired]((uint64_t)self)) {
    goto LABEL_4;
  }
  if (!self) {
    goto LABEL_4;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = 0;
  unint64_t v3 = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2AccessoryServer_pairedName__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v3 performReadingBlock:v7];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if (!v4)
  {
LABEL_4:
    uint64_t v5 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
    id v4 = [v5 name];
  }

  return (NSString *)v4;
}

void __33__HAP2AccessoryServer_pairedName__block_invoke(uint64_t a1)
{
}

- (HMFVersion)protocolVersion
{
  if (!-[HAP2AccessoryServer isInternallyPaired]((uint64_t)self)) {
    goto LABEL_4;
  }
  if (!self) {
    goto LABEL_4;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = 0;
  unint64_t v3 = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HAP2AccessoryServer_pairedProtocolVersion__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v3 performReadingBlock:v7];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if (!v4)
  {
LABEL_4:
    uint64_t v5 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
    id v4 = [v5 protocolVersion];
  }

  return (HMFVersion *)v4;
}

void __44__HAP2AccessoryServer_pairedProtocolVersion__block_invoke(uint64_t a1)
{
}

- (BOOL)hasPairings
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  char v3 = [v2 hasPairings];

  return v3;
}

- (HAPDeviceID)deviceID
{
  id v2 = -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  char v3 = [v2 deviceID];

  return (HAPDeviceID *)v3;
}

- (void)setSetupID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAP2AccessoryServer *)self operationQueue];
  [v5 assertCurrentQueue];

  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__HAP2AccessoryServer_setSetupID___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v8];
}

void __34__HAP2AccessoryServer_setSetupID___block_invoke(uint64_t a1)
{
}

- (NSString)setupID
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__HAP2AccessoryServer_setupID__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __30__HAP2AccessoryServer_setupID__block_invoke(uint64_t a1)
{
}

- (double)sessionCheckInterval
{
  uint64_t v8 = 0;
  id v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HAP2AccessoryServer_sessionCheckInterval__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __43__HAP2AccessoryServer_sessionCheckInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 128) confirmInterval];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setReachabilityChangedReason:(id)a3
{
  id v4 = a3;
  double v5 = [(HAP2AccessoryServer *)self operationQueue];
  [v5 assertCurrentQueue];

  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__HAP2AccessoryServer_setReachabilityChangedReason___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v8];
}

void __52__HAP2AccessoryServer_setReachabilityChangedReason___block_invoke(uint64_t a1)
{
}

- (NSString)reachabilityChangedReason
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = @"Unknown";
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServer_reachabilityChangedReason__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __48__HAP2AccessoryServer_reachabilityChangedReason__block_invoke(uint64_t a1)
{
}

- (void)setHasDiscoveryAdvertisement:(BOOL)a3
{
  id v5 = [(HAP2AccessoryServer *)self operationQueue];
  [v5 assertCurrentQueue];

  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HAP2AccessoryServer_setHasDiscoveryAdvertisement___block_invoke;
  v7[3] = &unk_1E69F3DF8;
  v7[4] = self;
  BOOL v8 = a3;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v7];
}

uint64_t __52__HAP2AccessoryServer_setHasDiscoveryAdvertisement___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)hasDiscoveryAdvertisement
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServer_hasDiscoveryAdvertisement__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__HAP2AccessoryServer_hasDiscoveryAdvertisement__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (NSString)productData
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__HAP2AccessoryServer_productData__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __34__HAP2AccessoryServer_productData__block_invoke(uint64_t a1)
{
}

- (void)setProductData:(id)a3
{
  id v4 = a3;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HAP2AccessoryServer_setProductData___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v7];
}

void __38__HAP2AccessoryServer_setProductData___block_invoke(uint64_t a1)
{
}

- (HAP2AccessoryServerControllerPrivate)controller
{
  uint64_t v3 = [(HAP2AccessoryServer *)self operationQueue];
  [v3 assertCurrentQueue];

  controller = self->_controller;

  return controller;
}

- (unint64_t)connectionState
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HAP2AccessoryServer_connectionState__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __38__HAP2AccessoryServer_connectionState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__HAP2AccessoryServer_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v7];
}

id __35__HAP2AccessoryServer_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (HAP2AccessoryServerDelegate)delegate
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4235;
  v12 = __Block_byref_object_dispose__4236;
  id v13 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__HAP2AccessoryServer_delegate__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HAP2AccessoryServerDelegate *)v5;
}

uint64_t __31__HAP2AccessoryServer_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(NSBackgroundActivityScheduler *)self->_backgroundScheduler invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServer;
  [(HAP2AccessoryServer *)&v3 dealloc];
}

- (HAP2AccessoryServer)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)pairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 operationQueue:(id)a6
{
  return +[HAP2AccessoryServer _accessoryServerWithMetadata:browser:controller:operationQueue:internallyPaired:]((uint64_t)a1, a3, a4, a5, a6, 1);
}

+ (HAP2AccessoryServer)_accessoryServerWithMetadata:(void *)a3 browser:(void *)a4 controller:(void *)a5 operationQueue:(BOOL)a6 internallyPaired:
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  self;
  if ([v12 conformsToProtocol:&unk_1F2C98D80]) {
    v14 = v12;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  v38 = v11;
  if ([v11 conformsToProtocol:&unk_1F2CA07A8]) {
    v16 = v11;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;
  v18 = [HAP2AccessoryServer alloc];
  id v19 = v13;
  id v20 = v17;
  id v21 = v15;
  id v22 = v10;
  if (v18)
  {
    v39.receiver = v18;
    v39.super_class = (Class)HAP2AccessoryServer;
    v23 = (HAP2AccessoryServer *)objc_msgSendSuper2(&v39, sel_init);
    v18 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_currentMetadata, a2);
      objc_storeStrong((id *)&v18->_controller, v16);
      objc_storeWeak((id *)&v18->_browser, v21);
      objc_storeStrong((id *)&v18->_operationQueue, a5);
      uint64_t v24 = +[HAP2PropertyLock lockWithName:@"HAP2AccessoryServer.propertyLock"];
      propertyLock = v18->_propertyLock;
      v18->_propertyLock = (HAP2PropertyLock *)v24;

      v18->_internallyPaired = a6;
      privateAccessories = v18->_privateAccessories;
      v18->_privateAccessories = (NSArray *)MEMORY[0x1E4F1CBF0];

      v18->_connectionState = 1;
      v18->_hasDiscoveryAdvertisement = 1;
      reachabilityChangedReason = v18->_reachabilityChangedReason;
      v18->_reachabilityChangedReason = (NSString *)@"Unknown";

      v18->_sessionCheckInterval = 0.0;
      uint64_t v28 = objc_opt_new();
      reachabilityProfile = v18->_reachabilityProfile;
      v18->_reachabilityProfile = (HAPAccessoryReachabilityProfile *)v28;

      v30 = [HAPAccessoryReachabilityClient alloc];
      v31 = [(HAP2AccessoryServer *)v18 deviceID];
      v32 = v18->_reachabilityProfile;
      v33 = objc_opt_new();
      v34 = [(HAPAccessoryReachabilityClient *)v30 initWithIdentifier:v31 profile:v32 operationQueue:v33];

      [(HAPAccessoryReachabilityClient *)v34 setDelegate:v18];
      reachability = v18->_reachability;
      v18->_reachability = v34;
    }
  }

  [v20 setAccessoryServer:v18];

  return v18;
}

+ (id)unpairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 pairingDriver:(id)a6 operationQueue:(id)a7
{
  id v12 = a6;
  id v13 = +[HAP2AccessoryServer _accessoryServerWithMetadata:browser:controller:operationQueue:internallyPaired:]((uint64_t)a1, a3, a4, a5, a7, 0);
  v14 = (void *)v13[14];
  v13[14] = v12;

  return v13;
}

+ (id)new
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (uint64_t)setInternallyPaired:(uint64_t)result
{
  if (result)
  {
    id v2 = *(void **)(result + 168);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__HAP2AccessoryServer_setInternallyPaired___block_invoke;
    v3[3] = &unk_1E69F3DF8;
    v3[4] = result;
    char v4 = a2;
    return [v2 performWritingBlock:v3];
  }
  return result;
}

uint64_t __43__HAP2AccessoryServer_setInternallyPaired___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (id)privateAccessories
{
  BOOL v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__4235;
    id v9 = __Block_byref_object_dispose__4236;
    id v10 = 0;
    id v2 = a1[21];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__HAP2AccessoryServer_privateAccessories__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    BOOL v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

void __41__HAP2AccessoryServer_privateAccessories__block_invoke(uint64_t a1)
{
}

- (void)setPrivateAccessories:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 168);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__HAP2AccessoryServer_setPrivateAccessories___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

uint64_t __45__HAP2AccessoryServer_setPrivateAccessories___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setPairedName:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 168);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__HAP2AccessoryServer_setPairedName___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

uint64_t __37__HAP2AccessoryServer_setPairedName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setPairedProtocolVersion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 168);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__HAP2AccessoryServer_setPairedProtocolVersion___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

void __48__HAP2AccessoryServer_setPairedProtocolVersion___block_invoke(uint64_t a1)
{
}

- (id)outstandingUpdateAccessoriesRequest
{
  BOOL v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__4235;
    id v9 = __Block_byref_object_dispose__4236;
    id v10 = 0;
    id v2 = a1[21];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__HAP2AccessoryServer_outstandingUpdateAccessoriesRequest__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    BOOL v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

void __58__HAP2AccessoryServer_outstandingUpdateAccessoriesRequest__block_invoke(uint64_t a1)
{
}

- (void)setOutstandingUpdateAccessoriesRequest:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    uint64_t v5 = (void *)a1[21];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__HAP2AccessoryServer_setOutstandingUpdateAccessoriesRequest___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

void __62__HAP2AccessoryServer_setOutstandingUpdateAccessoriesRequest___block_invoke(uint64_t a1)
{
}

- (id)reachability
{
  if (a1)
  {
    id v2 = a1;
    id v3 = [a1 operationQueue];
    [v3 assertCurrentQueue];

    a1 = (id *)v2[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)reachabilityProfile
{
  if (a1)
  {
    id v2 = a1;
    id v3 = [a1 operationQueue];
    [v3 assertCurrentQueue];

    a1 = (id *)v2[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setReachabilityProfile:(id *)a1
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    objc_storeStrong(a1 + 17, a2);
  }
}

- (id)internalPairingDriver
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__4235;
    id v9 = __Block_byref_object_dispose__4236;
    id v10 = 0;
    id v2 = a1[21];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__HAP2AccessoryServer_internalPairingDriver__block_invoke;
    v4[3] = &unk_1E69F44F0;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadingBlock:v4];

    uint64_t v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

void __44__HAP2AccessoryServer_internalPairingDriver__block_invoke(uint64_t a1)
{
}

- (void)setInternalPairingDriver:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 168);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__HAP2AccessoryServer_setInternalPairingDriver___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

void __48__HAP2AccessoryServer_setInternalPairingDriver___block_invoke(uint64_t a1)
{
}

- (id)pairDelegate
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [a1 operationQueue];
    [v2 assertCurrentQueue];

    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    id v9 = __Block_byref_object_copy__4235;
    id v10 = __Block_byref_object_dispose__4236;
    id v11 = 0;
    id v3 = v1[21];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__HAP2AccessoryServer_pairDelegate__block_invoke;
    v5[3] = &unk_1E69F44F0;
    v5[4] = v1;
    v5[5] = &v6;
    [v3 performReadingBlock:v5];

    uint64_t v1 = (id *)(id)v7[5];
    _Block_object_dispose(&v6, 8);
  }

  return v1;
}

uint64_t __35__HAP2AccessoryServer_pairDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 120));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (void)setPairDelegate:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    uint64_t v5 = (void *)a1[21];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__HAP2AccessoryServer_setPairDelegate___block_invoke;
    v6[3] = &unk_1E69F46E0;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWritingBlock:v6];
  }
}

id __39__HAP2AccessoryServer_setPairDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (id)_delegateCancelableFor:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__4235;
    v12[4] = __Block_byref_object_dispose__4236;
    id v13 = 0;
    uint64_t v4 = [a1 operationQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke;
    v9[3] = &unk_1E69F0C60;
    id v11 = v12;
    id v10 = v3;
    [v4 addBlock:v9];

    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_2;
    v6[3] = &unk_1E69F3678;
    objc_copyWeak(&v7, &location);
    v6[4] = v12;
    a1 = +[HAP2Cancelable cancelableWithBlock:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

    _Block_object_dispose(v12, 8);
  }

  return a1;
}

uint64_t __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained operationQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_3;
    v7[3] = &unk_1E69F44F0;
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = v3;
    [v6 addBlock:v7];
  }
}

uint64_t __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancelWithError:*(void *)(a1 + 32)];
}

- (void)_updateServerMetadata:(void *)a3 controller:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v28 = a3;
  if (a1)
  {
    v29 = a1;
    uint64_t v5 = [a1 operationQueue];
    [v5 assertCurrentQueue];

    uint64_t v6 = [HAP2AccessoryServerMetadata alloc];
    id v7 = [v30 deviceID];
    uint64_t v8 = [v30 hasPairings];
    uint64_t v9 = [v30 protocolVersion];
    id v10 = [v30 name];
    id v11 = [v30 model];
    uint64_t v12 = [v30 category];
    __int16 v13 = [v30 stateNumber];
    LOWORD(v5) = [v30 configNumber];
    v14 = [v30 setupHash];
    WORD1(v27) = (_WORD)v5;
    LOWORD(v27) = v13;
    id v15 = -[HAP2AccessoryServerMetadata initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:](v6, "initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:", v7, v8, v9, v10, v11, v12, v27, v14);

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__4235;
    v46 = __Block_byref_object_dispose__4236;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    objc_super v39 = __Block_byref_object_copy__4235;
    v40 = __Block_byref_object_dispose__4236;
    id v41 = 0;
    id v16 = v29[21];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __56__HAP2AccessoryServer__updateServerMetadata_controller___block_invoke;
    v31[3] = &unk_1E69F27F0;
    v34 = &v36;
    v31[4] = v29;
    id v17 = v15;
    v32 = v17;
    id v18 = v28;
    id v33 = v18;
    v35 = &v42;
    [v16 performWritingBlock:v31];

    id v19 = (void *)v43[5];
    v43[5] = 0;

    if (v18)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v20 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v29;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%@ Resetting controller on accessory server", buf, 0xCu);
      }
    }
    id v21 = [v29 controller];
    [v21 handleUpdatedMetadataWithOldMetadata:v37[5]];

    id v22 = [v29 delegate];
    LODWORD(v21) = [(id)v37[5] hasPairings];
    if (v21 != [(HAP2AccessoryServerMetadata *)v17 hasPairings]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v22 accessoryServerDidUpdateHasPairings:v29];
    }
    v23 = [(id)v37[5] name];
    uint64_t v24 = [(HAP2AccessoryServerMetadata *)v17 name];
    BOOL v25 = v23 == v24;

    if (!v25 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v22 accessoryServerDidUpdateName:v29];
    }
    uint64_t v26 = [(id)v37[5] category];
    if (v26 != [(HAP2AccessoryServerMetadata *)v17 category] && (objc_opt_respondsToSelector() & 1) != 0) {
      [v22 accessoryServerDidUpdateCategory:v29];
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
}

void __56__HAP2AccessoryServer__updateServerMetadata_controller___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 48));
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 48);
    [v3 setAccessoryServer:v2];
  }
}

- (void)_updateConnectionState:(void *)a3 withError:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 operationQueue];
    [v6 assertCurrentQueue];

    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    unint64_t v20 = a2;
    id v7 = [a1 delegate];
    id v8 = a1[21];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__HAP2AccessoryServer__updateConnectionState_withError___block_invoke;
    v16[3] = &unk_1E69F2DF0;
    v16[5] = &v17;
    v16[6] = a2;
    v16[4] = a1;
    [v8 performWritingBlock:v16];

    if (v5 && a2 <= 5 && ((1 << a2) & 0x31) != 0 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 accessoryServerConnectionFailureReportWithError:v5];
    }
    if (v18[3] != a2)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v10 = v18[3];
        if (v10 > 5) {
          id v11 = @"<unknown>";
        }
        else {
          id v11 = off_1E69F0C80[v10];
        }
        uint64_t v12 = off_1E69F0C80[a2];
        *(_DWORD *)buf = 138412802;
        id v22 = a1;
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        __int16 v25 = 2112;
        uint64_t v26 = v12;
        __int16 v13 = v9;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%@ Connection state changed: %@ -> %@", buf, 0x20u);
      }
      if (objc_opt_respondsToSelector()) {
        [v7 accessoryServerDidUpdateConnectionState:a1];
      }
      if (a2 == 3 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 accessoryServerConnectedWithSecureSession];
      }
      v14 = [a1 browser];
      id v15 = v14;
      if (v14) {
        [v14 accessoryServerDidUpdateConnectionState:a1];
      }
    }
    _Block_object_dispose(&v17, 8);
  }
}

void *__56__HAP2AccessoryServer__updateConnectionState_withError___block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 24);
  if (v1 != result[6])
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = v1;
    *(void *)(result[4] + 24) = result[6];
  }
  return result;
}

- (void)setBackgroundScheduler:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 144), a2);
  }
}

- (void)_setBackgroundActivityScheduler:(id)a3
{
}

- (void)_performBackgroundPollWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Background reachability poll is running", (uint8_t *)&v6, 0xCu);
  }
  [(HAP2AccessoryServer *)self verifyConnection];
  v4[2](v4, 1);
}

- (void)pollAccessory
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServer *)self delegate];
  int v4 = [v3 onDemandConnectionsAreEnabled];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Ignoring poll requests only on demand connections are allowed", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    -[HAP2AccessoryServer _pollAccessoryWithOptions:](self, 1);
  }
}

- (void)_pollAccessoryWithOptions:(void *)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = a1;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ Scheduling a poll", buf, 0xCu);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__HAP2AccessoryServer_Paired___pollAccessoryWithOptions___block_invoke;
    v7[3] = &unk_1E69F3A58;
    void v7[4] = a1;
    void v7[5] = a2;
    id v5 = (void *)MEMORY[0x1D944E2D0](v7);
    int v6 = [a1 operationQueue];
    [v6 addBlock:v5];
  }
}

void __57__HAP2AccessoryServer_Paired___pollAccessoryWithOptions___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(id **)(a1 + 32);
  if (!v1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) operationQueue];
  [v3 assertCurrentQueue];

  int v4 = -[HAP2AccessoryServer reachabilityProfile](v1);
  id v5 = [v4 pollCharacteristic];

  if (v5) {
    goto LABEL_3;
  }
  uint64_t v19 = [v1 primaryAccessory];

  if (v19)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__20628;
    id v41 = __Block_byref_object_dispose__20629;
    uint64_t v42 = 0;
    unint64_t v20 = [v1 primaryAccessory];
    id v21 = [v20 services];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke;
    v38[3] = &unk_1E69F3A80;
    v38[4] = buf;
    [v21 enumerateObjectsUsingBlock:v38];

    id v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__20628;
    uint64_t v36 = __Block_byref_object_dispose__20629;
    id v37 = 0;
    id v22 = [*(id *)(*(void *)&buf[8] + 40) characteristics];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2;
    v31[3] = &unk_1E69F3898;
    v31[4] = &v32;
    [v22 enumerateObjectsUsingBlock:v31];

    id v5 = v33[5];
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(buf, 8);
    if (v5)
    {
LABEL_3:
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      int v6 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        id v7 = v6;
        uint64_t v8 = [v5 instanceID];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%@ polling characteristic=%@", buf, 0x16u);
      }
      uint64_t v9 = NSString;
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = [v9 stringWithFormat:@"%@ Poll Accessory", v11];

      __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F65518]) initWithName:@"Poll Accessory" timeout:60.0];
      id v32 = 0;
      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v15 = [MEMORY[0x1E4F29128] UUID];
        v45[0] = v13;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
        uint64_t v17 = (void *)[v14 initWithIdentifier:v15 name:v12 parent:0 assertions:v16];
        id v18 = v32;
        id v32 = v17;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v24 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v1;
          _os_log_error_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", buf, 0xCu);
        }
        id v25 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v15 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v26 = (void *)[v25 initWithIdentifier:v15 name:v12 parent:0 options:0];
        id v16 = v32;
        id v32 = v26;
      }

      id v44 = v5;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_243;
      v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69F3AB0;
      id v41 = (void (*)(uint64_t))v32;
      uint64_t v42 = v1;
      v43 = sel__pollAccessoryOnQueueWithOptions_;
      id v28 = -[HAP2AccessoryServer _readValuesForCharacteristics:timeout:options:activity:completion:](v1, v27, v2, v41, buf, 0.0);

      __HMFActivityScopeLeave();
      return;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v23 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v1;
      _os_log_error_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%@ Failed to find polling characteristic", buf, 0xCu);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v29 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v1;
      _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_INFO, "%@ Polling without a primary accessory, updating accessories", buf, 0xCu);
    }
    id v30 = (id)[v1 updateAccessoriesWithReason:@"noAttributeDatabase"];
  }
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 type];
  int v8 = [v7 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 type];
  int v8 = [v7 isEqualToString:@"00000052-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id v21 = *(id *)(a1 + 32);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    int v8 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v8 error];
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v9 = (id)hap2Log_accessory;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [*(id *)(a1 + 40) primaryAccessory];
    uint64_t v17 = [v16 identifier];
    *(_DWORD *)buf = 138413058;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_debug_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%@ %@: completed id=%@, error=%@", buf, 0x2Au);
  }
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_244;
    v19[3] = &unk_1E69F46E0;
    v19[4] = *(void *)(a1 + 40);
    id v20 = v7;
    uint64_t v10 = (void *)MEMORY[0x1D944E2D0](v19);
    id v11 = [*(id *)(a1 + 40) operationQueue];
    [v11 addBlock:v10];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2_248;
  v18[3] = &unk_1E69F4330;
  v18[4] = *(void *)(a1 + 40);
  uint64_t v12 = (void *)MEMORY[0x1D944E2D0](v18);
  __int16 v13 = [*(id *)(a1 + 40) operationQueue];
  [v13 addBlock:v12];

  [*(id *)(a1 + 32) invalidate];
  __HMFActivityScopeLeave();
}

- (id)_readValuesForCharacteristics:(uint64_t)a3 timeout:(void *)a4 options:(void *)a5 activity:(double)a6 completion:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    uint64_t v14 = NSString;
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 stringWithFormat:@"%@ Read", v16];

    id v37 = 0;
    if (v12)
    {
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v17 parent:v12 options:0];
      id v19 = v37;
      id v37 = v18;
    }
    else
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F65518]) initWithName:@"Read" timeout:60.0];
      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v22 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v38 = v20;
        id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        __int16 v24 = (void *)[v21 initWithIdentifier:v22 name:v17 parent:0 assertions:v23];
        id v25 = v37;
        id v37 = v24;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        __int16 v26 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = a1;
          _os_log_error_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", buf, 0xCu);
        }
        id v27 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v22 = [MEMORY[0x1E4F29128] UUID];
        __int16 v28 = (void *)[v27 initWithIdentifier:v22 name:v17 parent:0 options:0];
        id v23 = v37;
        id v37 = v28;
      }

      id v18 = v37;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke;
    v30[3] = &unk_1E69F38F0;
    id v31 = v18;
    id v32 = a1;
    id v34 = v13;
    id v33 = v11;
    double v35 = a6;
    uint64_t v36 = a3;
    a1 = -[HAP2AccessoryServer _delegateCancelableFor:](a1, v30);

    __HMFActivityScopeLeave();
  }

  return a1;
}

id __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v36 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) isPaired])
  {
    uint64_t v27 = 0;
    __int16 v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__20628;
    id v31 = __Block_byref_object_dispose__20629;
    id v32 = 0;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    id v3 = *(void **)(a1 + 48);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3;
    v23[3] = &unk_1E69F38C8;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 40);
    id v24 = v4;
    uint64_t v25 = v5;
    __int16 v26 = &v27;
    [v3 enumerateObjectsUsingBlock:v23];
    if (v28[5])
    {
      id v6 = [*(id *)(a1 + 40) operationQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_215;
      v19[3] = &unk_1E69F3830;
      id v21 = *(id *)(a1 + 56);
      id v22 = &v27;
      id v20 = *(id *)(a1 + 32);
      [v6 addBlock:v19];

      id v7 = +[HAP2Cancelable ignore];

      int v8 = v21;
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2_216;
      v16[3] = &unk_1E69F36A0;
      int8x16_t v15 = *(int8x16_t *)(a1 + 32);
      id v11 = (id)v15.i64[0];
      int8x16_t v17 = vextq_s8(v15, v15, 8uLL);
      id v18 = *(id *)(a1 + 56);
      id v12 = (void *)MEMORY[0x1D944E2D0](v16);
      id v13 = [*(id *)(a1 + 40) controller];
      id v7 = [v13 readValuesForCharacteristics:*(void *)(a1 + 48) timeout:*(void *)(a1 + 72) options:v12 completion:*(double *)(a1 + 64)];

      int v8 = (void *)v17.i64[1];
    }

    _Block_object_dispose(&v27, 8);
    uint64_t v10 = v32;
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) operationQueue];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2;
    v33[3] = &unk_1E69F3C68;
    id v35 = *(id *)(a1 + 56);
    id v34 = *(id *)(a1 + 32);
    [v9 addBlock:v33];

    id v7 = +[HAP2Cancelable ignore];

    uint64_t v10 = v35;
  }

  __HMFActivityScopeLeave();

  return v7;
}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  id v4 = *(void **)(a1 + 32);

  return [v4 invalidate];
}

void __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Denying request to read the same characteristic twice: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_215(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2_216(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3_217;
  id v15 = &unk_1E69F4098;
  id v7 = (void *)a1[5];
  uint64_t v16 = a1[4];
  id v17 = v5;
  id v18 = v6;
  id v19 = v7;
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = (void *)MEMORY[0x1D944E2D0](&v12);
  uint64_t v11 = objc_msgSend((id)a1[4], "operationQueue", v12, v13, v14, v15, v16);
  [v11 addBlock:v10];

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3_217(uint64_t a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](*(void **)(a1 + 32), @"Read", *(void **)(a1 + 40), 1, *(void **)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 56);

  return [v2 invalidate];
}

- (void)_kickReachabilityAfterCharacteristicOperation:(void *)a3 withResponse:(char)a4 ignoreCachedCharacteristics:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = [a1 operationQueue];
    [v12 assertCurrentQueue];

    if (!v11)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __124__HAP2AccessoryServer_Paired___kickReachabilityAfterCharacteristicOperation_withResponse_ignoreCachedCharacteristics_error___block_invoke;
      v14[3] = &unk_1E69F3AD8;
      char v15 = a4;
      v14[4] = a1;
      if ([v10 indexOfObjectPassingTest:v14] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([a1 connectionState] != 3)
        {
          [a1 setReachabilityChangedReason:v9];
          -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 3uLL, 0);
        }
        uint64_t v13 = -[HAP2AccessoryServer reachability]((id *)a1);
        [v13 kick];
      }
    }
  }
}

BOOL __124__HAP2AccessoryServer_Paired___kickReachabilityAfterCharacteristicOperation_withResponse_ignoreCachedCharacteristics_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_6;
  }
  id v5 = [v3 characteristic];
  if ((objc_msgSend(v5, "hap2_canUseCachedValue") & 1) == 0)
  {

    goto LABEL_6;
  }
  id v6 = -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  char v7 = [v6 isRunning];

  if ((v7 & 1) == 0)
  {
LABEL_6:
    id v9 = [v4 error];
    BOOL v8 = v9 == 0;

    goto LABEL_7;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_244(uint64_t a1)
{
  [*(id *)(a1 + 32) setReachabilityChangedReason:@"Ping"];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  -[HAP2AccessoryServer _handleAccessoryOperationError:](v2, v3);
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2_248(uint64_t a1)
{
  -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 kick];
}

- (void)_handleAccessoryOperationError:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      char v7 = NSStringFromSelector(sel__handleAccessoryOperationError_);
      int v12 = 138412546;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      char v15 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v8 = [v3 domain];
    int v9 = [v8 isEqualToString:@"HAPErrorDomain"];

    if (v9 && [v3 code] == 17)
    {
      unint64_t v10 = 4;
LABEL_15:
      -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, v10, v3);
      goto LABEL_16;
    }
    uint64_t v11 = [a1 connectionState];
    if (v11)
    {
      if (v11 == 5)
      {
        if ([a1 hasDiscoveryAdvertisement]) {
          unint64_t v10 = 5;
        }
        else {
          unint64_t v10 = 0;
        }
      }
      else
      {
        unint64_t v10 = 5;
      }
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)verifyConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAP2AccessoryServer *)self delegate];
  int v4 = [v3 onDemandConnectionsAreEnabled];

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      char v7 = self;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Ignoring poll requests only on demand connections are allowed", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    -[HAP2AccessoryServer _pollAccessoryWithOptions:](self, 0);
  }
}

- (void)closeSession
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HAP2AccessoryServer_Paired__closeSession__block_invoke;
  v5[3] = &unk_1E69F4330;
  v5[4] = self;
  id v3 = (void *)MEMORY[0x1D944E2D0](v5, a2);
  int v4 = [(HAP2AccessoryServer *)self operationQueue];
  [v4 addBlock:v3];
}

void __43__HAP2AccessoryServer_Paired__closeSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) controller];
  [v2 closeSession];

  if ([*(id *)(a1 + 32) connectionState] == 2 || objc_msgSend(*(id *)(a1 + 32), "connectionState") == 3)
  {
    id v3 = *(id **)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3202];
    -[HAP2AccessoryServer _updateConnectionState:withError:](v3, 4uLL, v4);
  }
}

- (void)handleNetworkChanged
{
  objc_initWeak(&location, self);
  id v3 = [(HAP2AccessoryServer *)self operationQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__HAP2AccessoryServer_Paired__handleNetworkChanged__block_invoke;
  v4[3] = &unk_1E69F4658;
  objc_copyWeak(&v5, &location);
  [v3 addBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__HAP2AccessoryServer_Paired__handleNetworkChanged__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained delegate];
  int v3 = [v2 onDemandConnectionsAreEnabled];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    unint64_t v6 = [WeakRetained connectionState];
    if (v6 > 5) {
      char v7 = @"<unknown>";
    }
    else {
      char v7 = off_1E69F0C80[v6];
    }
    uint64_t v8 = v7;
    int v9 = 138412802;
    id v10 = WeakRetained;
    __int16 v11 = 1024;
    int v12 = v3;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ event=networkchanged onDemand=%i connectionState=%@", (uint8_t *)&v9, 0x1Cu);
  }
  if ((v3 & 1) != 0 || (unint64_t)([WeakRetained connectionState] - 2) <= 3) {
    -[HAP2AccessoryServer updateReachability](WeakRetained);
  }
}

- (void)updateReachability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = [a1 delegate];
  char v3 = [v2 onDemandConnectionsAreEnabled];

  if (v3)
  {
    if ([a1 hasDiscoveryAdvertisement])
    {
      if ([a1 connectionState] == 5)
      {
        -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 1uLL, 0);
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v4 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          id v5 = v4;
          if ([a1 hasDiscoveryAdvertisement]) {
            unint64_t v6 = @"Found";
          }
          else {
            unint64_t v6 = @"Lost";
          }
          unint64_t v7 = [a1 connectionState];
          if (v7 > 5) {
            uint64_t v8 = @"<unknown>";
          }
          else {
            uint64_t v8 = off_1E69F0C80[v7];
          }
          int v9 = v8;
          *(_DWORD *)buf = 138412802;
          int v12 = a1;
          __int16 v13 = 2112;
          __int16 v14 = v6;
          __int16 v15 = 2112;
          uint64_t v16 = v9;
          _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Ignoring %@ Bonjour advertisement in %@", buf, 0x20u);
        }
      }
      return;
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
    -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 0, v10);
  }
  else
  {
    -[HAP2AccessoryServer reachability]((id *)a1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v10 confirm];
  }
}

- (void)handleLostDiscoveryAdvertisementWithWillSleep:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServer *)self operationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HAP2AccessoryServer_Paired__handleLostDiscoveryAdvertisementWithWillSleep___block_invoke;
  v6[3] = &unk_1E69F3768;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  [v5 addBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __77__HAP2AccessoryServer_Paired__handleLostDiscoveryAdvertisementWithWillSleep___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasDiscoveryAdvertisement:0];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = (void *)hap2Log_accessory;
  BOOL v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      int v9 = v4;
      unint64_t v10 = [WeakRetained connectionState];
      if (v10 > 5) {
        __int16 v11 = @"<unknown>";
      }
      else {
        __int16 v11 = off_1E69F0C80[v10];
      }
      __int16 v13 = v11;
      int v15 = 138412546;
      id v16 = WeakRetained;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Handling lost discovery advertisement in connectionState: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = [WeakRetained connectionState];
    if ((unint64_t)(v14 - 3) < 3)
    {
      -[HAP2AccessoryServer updateReachability](WeakRetained);
      goto LABEL_19;
    }
    if (v14 != 1) {
      goto LABEL_19;
    }
    unint64_t v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
    -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)WeakRetained, 0, v6);
    goto LABEL_12;
  }
  if (v5)
  {
    unint64_t v6 = v4;
    unint64_t v7 = [WeakRetained connectionState];
    if (v7 > 5) {
      BOOL v8 = @"<unknown>";
    }
    else {
      BOOL v8 = off_1E69F0C80[v7];
    }
    int v12 = v8;
    int v15 = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%@ Ignoring lost advertisement while going to sleep in connectionState: %@", (uint8_t *)&v15, 0x16u);

LABEL_12:
  }
LABEL_19:
}

- (void)handleLostDiscoveryAdvertisement
{
}

- (void)handleReestablishedSession
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = [(HAP2AccessoryServer *)self operationQueue];
  [v3 assertCurrentQueue];

  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    __int16 v11 = self;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ We've re-established our session", (uint8_t *)&v10, 0xCu);
  }
  -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)&self->super.super.isa, 3uLL, 0);
  BOOL v5 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  unint64_t v6 = [(HAP2AccessoryServer *)self deviceID];
  unint64_t v7 = [v6 deviceIDString];
  BOOL v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAP2AccessoryServer category](self, "category"));
  [v5 reportConnection:v7 linkType:1 accessoryCategory:v8];

  int v9 = -[HAP2AccessoryServer pairedDelegate](self);
  if (objc_opt_respondsToSelector()) {
    [v9 accessoryServerDidUpdateAccessories:self];
  }
}

- (id)pairedDelegate
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 delegate];
    if (v2)
    {
      int v3 = [v1 delegate];
      if ([v3 conformsToProtocol:&unk_1F2C9A290])
      {
        id v1 = [v1 delegate];
      }
      else
      {
        id v1 = 0;
      }
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

- (void)handleUpdatedCharacteristicValues:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndexedSubscript:0];
    unint64_t v6 = [v5 instanceID];

    unint64_t v7 = -[HAP2AccessoryServer _findAccessoryAndCharacteristicForInstanceID:characteristic:]((id *)&self->super.super.isa, v6, 0);
    BOOL v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__HAP2AccessoryServer_Paired__handleUpdatedCharacteristicValues___block_invoke;
      v12[3] = &unk_1E69F3740;
      id v13 = v7;
      [v4 enumerateObjectsUsingBlock:v12];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      int v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        int v10 = v9;
        __int16 v11 = [v4 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138412546;
        int v15 = self;
        __int16 v16 = 2112;
        __int16 v17 = v11;
        _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Ignoring update for characteristic that we cannot find: %@", buf, 0x16u);
      }
    }
  }
}

- (id)_findAccessoryAndCharacteristicForInstanceID:(void *)a3 characteristic:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__20628;
    id v23 = __Block_byref_object_dispose__20629;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    __int16 v16 = __Block_byref_object_copy__20628;
    __int16 v17 = __Block_byref_object_dispose__20629;
    id v18 = 0;
    unint64_t v6 = -[HAP2AccessoryServer privateAccessories](a1);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke;
    v9[3] = &unk_1E69F3968;
    id v10 = v5;
    __int16 v11 = &v19;
    uint64_t v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v9];

    if (a3) {
      *a3 = (id) v14[5];
    }
    id v7 = (id)v20[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __65__HAP2AccessoryServer_Paired__handleUpdatedCharacteristicValues___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) characteristicValueChanged:a2];
}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 services];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_2;
  v12[3] = &unk_1E69F3940;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v8;
  uint64_t v15 = v9;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v14 = v10;
  uint64_t v16 = v11;
  [v7 enumerateObjectsUsingBlock:v12];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 characteristics];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_3;
  v9[3] = &unk_1E69F3918;
  id v10 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v8;
  long long v11 = v8;
  uint64_t v12 = *(void *)(a1 + 56);
  [v6 enumerateObjectsUsingBlock:v9];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    *a4 = 1;
  }
}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 instanceID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)handleEvents:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __44__HAP2AccessoryServer_Paired__handleEvents___block_invoke;
  long long v11 = &unk_1E69F46E0;
  uint64_t v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  id v7 = [(HAP2AccessoryServer *)self operationQueue];
  [v7 addBlock:v6];
}

void __44__HAP2AccessoryServer_Paired__handleEvents___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    int v3 = [v1 operationQueue];
    [v3 assertCurrentQueue];

    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    id v4 = [MEMORY[0x1E4F65520] sharedPowerLogger];
    id v5 = [v1 deviceID];
    id v6 = [v5 deviceIDString];
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1, "category"));
    [v4 reportIncomingIPEvent:v6 accessoryCategory:v7];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__HAP2AccessoryServer_Paired___handleEvents___block_invoke;
    v9[3] = &unk_1E69F3990;
    void v9[4] = v1;
    v9[5] = &v10;
    [v2 enumerateObjectsUsingBlock:v9];
    if (*((unsigned char *)v11 + 24))
    {
      uint64_t v8 = -[HAP2AccessoryServer reachability]((id *)v1);
      [v8 kick];
    }
    _Block_object_dispose(&v10, 8);
  }
}

void __45__HAP2AccessoryServer_Paired___handleEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 instanceID];
  id v5 = *(id **)(a1 + 32);
  id v40 = 0;
  id v6 = -[HAP2AccessoryServer _findAccessoryAndCharacteristicForInstanceID:characteristic:](v5, v4, &v40);
  id v7 = v40;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v4;
      uint64_t v12 = "%@ Ignoring event for characteristic %@ that doesn't match any we know about";
LABEL_21:
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
    }
  }
  else
  {
    char v13 = [v7 metadata];
    id v14 = [v13 format];
    uint64_t v15 = HAPCharacteristicFormatFromString(v14);

    if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 32) controller];
      __int16 v17 = [v16 encoding];
      id v18 = [v3 encodedValueData];
      id v39 = 0;
      uint64_t v19 = [v17 decodeBodyData:v18 format:v15 error:&v39];
      id v38 = v39;

      if (v19)
      {
        id v20 = [v8 service];
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v21 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          log = v21;
          uint64_t v30 = [v6 instanceID];
          id v35 = [v20 type];
          id v31 = +[HAPCharacteristic hap2_shortTypeFromUUID:v35];
          [v20 instanceID];
          id v22 = v37 = v19;
          [v8 type];
          id v33 = v36 = v20;
          id v23 = +[HAPCharacteristic hap2_shortTypeFromUUID:v33];
          id v24 = [v8 instanceID];
          uint64_t v25 = [v3 encodedContextData];
          *(_DWORD *)buf = 138414083;
          uint64_t v42 = v32;
          __int16 v43 = 2048;
          uint64_t v44 = v30;
          __int16 v45 = 2112;
          id v46 = v31;
          __int16 v47 = 2112;
          v48 = v22;
          __int16 v49 = 2112;
          uint64_t v50 = v23;
          __int16 v51 = 2112;
          v52 = v24;
          __int16 v53 = 2113;
          v54 = v37;
          __int16 v55 = 2112;
          v56 = v25;
          _os_log_impl(&dword_1D4758000, log, OS_LOG_TYPE_DEFAULT, "%@ Received event for accessory %lu, service %@ [%@], characteristic %@ [%@] -> %{private}@ notificationContext %@", buf, 0x52u);

          id v20 = v36;
          uint64_t v19 = v37;
        }
        [v8 setValue:v19];
        __int16 v26 = [v3 encodedContextData];
        [v8 setNotificationContext:v26];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        [v6 characteristicValueChanged:v8];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        __int16 v28 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          uint64_t v42 = v29;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)v4;
          __int16 v45 = 2112;
          id v46 = v38;
          _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%@ Ignoring event for characteristic %@ because value failed to parse: %@", buf, 0x20u);
        }
      }

      goto LABEL_27;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v4;
      uint64_t v12 = "%@ Ignoring event for characteristic %@ that doesn't have metadata we can act on";
      goto LABEL_21;
    }
  }
LABEL_27:
}

- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke;
  v12[3] = &unk_1E69F3718;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);

  return v10;
}

id __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPaired])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_3;
    v8[3] = &unk_1E69F36F0;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v2 = (void *)MEMORY[0x1D944E2D0](v8);
    id v3 = [*(id *)(a1 + 32) controller];
    id v4 = [v3 disableNotificationsForCharacteristics:*(void *)(a1 + 40) options:0 completion:v2];

    id v5 = v9;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_2;
    v10[3] = &unk_1E69F3B20;
    id v11 = *(id *)(a1 + 48);
    [v6 addBlock:v10];

    id v4 = +[HAP2Cancelable ignore];
    id v5 = v11;
  }

  return v4;
}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_4;
  v11[3] = &unk_1E69F4708;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x1D944E2D0](v11);
  uint64_t v10 = [*(id *)(a1 + 32) operationQueue];
  [v10 addBlock:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_4(void **a1)
{
}

- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke;
  v12[3] = &unk_1E69F3718;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);

  return v10;
}

id __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPaired])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_3;
    v8[3] = &unk_1E69F36F0;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v2 = (void *)MEMORY[0x1D944E2D0](v8);
    id v3 = [*(id *)(a1 + 32) controller];
    id v4 = [v3 enableNotificationsForCharacteristics:*(void *)(a1 + 40) options:0 completion:v2];

    id v5 = v9;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) operationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_2;
    v10[3] = &unk_1E69F3B20;
    id v11 = *(id *)(a1 + 48);
    [v6 addBlock:v10];

    id v4 = +[HAP2Cancelable ignore];
    id v5 = v11;
  }

  return v4;
}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_4;
  v11[3] = &unk_1E69F4708;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x1D944E2D0](v11);
  uint64_t v10 = [*(id *)(a1 + 32) operationQueue];
  [v10 addBlock:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_4(void **a1)
{
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = NSString;
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  id v13 = [v10 stringWithFormat:@"%@ Write", v12];

  id v24 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v13];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke;
  v18[3] = &unk_1E69F36C8;
  id v19 = v24;
  id v20 = self;
  id v14 = v9;
  id v22 = v14;
  id v15 = v8;
  id v21 = v15;
  double v23 = a4;
  uint64_t v16 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v18);

  __HMFActivityScopeLeave();

  return v16;
}

id __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  id v16 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) isPaired])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_3;
    v10[3] = &unk_1E69F36A0;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v2 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v12 = *(id *)(a1 + 56);
    id v3 = (void *)MEMORY[0x1D944E2D0](v10);
    id v4 = [*(id *)(a1 + 40) controller];
    id v5 = [v4 writeValuesForCharacteristics:*(void *)(a1 + 48) timeout:0 options:v3 completion:*(double *)(a1 + 64)];

    id v6 = (void *)v11.i64[1];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) operationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_2;
    v13[3] = &unk_1E69F3C68;
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 32);
    [v7 addBlock:v13];

    id v5 = +[HAP2Cancelable ignore];

    id v6 = v15;
  }

  __HMFActivityScopeLeave();

  return v5;
}

uint64_t __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  id v4 = *(void **)(a1 + 32);

  return [v4 invalidate];
}

void __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_3(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_4;
  id v15 = &unk_1E69F4098;
  id v7 = (void *)a1[5];
  uint64_t v16 = a1[4];
  id v17 = v5;
  id v18 = v6;
  id v19 = v7;
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = (void *)MEMORY[0x1D944E2D0](&v12);
  int8x16_t v11 = objc_msgSend((id)a1[4], "operationQueue", v12, v13, v14, v15, v16);
  [v11 addBlock:v10];

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_4(uint64_t a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](*(void **)(a1 + 32), @"Write", *(void **)(a1 + 40), 0, *(void **)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 56);

  return [v2 invalidate];
}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  return -[HAP2AccessoryServer _readValuesForCharacteristics:timeout:options:activity:completion:](self, a3, 0, 0, a5, a4);
}

- (void)mergeWithNewlyDiscoveredPairedAccessoryServer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HAP2AccessoryServer *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HAP2AccessoryServer_Paired__mergeWithNewlyDiscoveredPairedAccessoryServer___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __77__HAP2AccessoryServer_Paired__mergeWithNewlyDiscoveredPairedAccessoryServer___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = [WeakRetained hasDiscoveryAdvertisement];
  [WeakRetained setHasDiscoveryAdvertisement:1];
  if ((v3 & 1) == 0 && [WeakRetained connectionState] == 5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = WeakRetained;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ New advertisement while unreachable", (uint8_t *)&v17, 0xCu);
    }
    -[HAP2AccessoryServer updateReachability](WeakRetained);
  }
  id v5 = [WeakRetained protocolVersion];
  id v6 = [*(id *)(a1 + 32) protocolVersion];
  char v7 = [v5 isEqualToVersion:v6];

  if (v7) {
    goto LABEL_14;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    uint64_t v10 = [WeakRetained protocolVersion];
    int8x16_t v11 = [*(id *)(a1 + 32) protocolVersion];
    int v17 = 138412802;
    id v18 = WeakRetained;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Accessory protocol version changed (%@ -> %@)", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) controller];
  if (!v12)
  {
LABEL_14:
    uint64_t v13 = [WeakRetained controller];
    id v14 = [*(id *)(a1 + 32) controller];
    char v15 = [v13 mergeWithNewController:v14];

    if (v15)
    {
      uint64_t v12 = 0;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v16 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = WeakRetained;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%@ Controller requested that we replace our current controller", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v12 = [*(id *)(a1 + 32) controller];
    }
  }
  -[HAP2AccessoryServer _updateServerMetadata:controller:]((id *)WeakRetained, *(void **)(a1 + 32), v12);
}

- (void)becomeUnpairedWithAccessoryServer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Accessory becoming unpaired", buf, 0xCu);
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int8x16_t v11 = __65__HAP2AccessoryServer_Paired__becomeUnpairedWithAccessoryServer___block_invoke;
  uint64_t v12 = &unk_1E69F46E0;
  uint64_t v13 = self;
  id v14 = v4;
  id v6 = v4;
  char v7 = (void *)MEMORY[0x1D944E2D0](&v9);
  id v8 = [(HAP2AccessoryServer *)self operationQueue];
  [v8 addBlock:v7];
}

void __65__HAP2AccessoryServer_Paired__becomeUnpairedWithAccessoryServer___block_invoke(uint64_t a1)
{
  -[HAP2AccessoryServer setInternallyPaired:](*(void *)(a1 + 32), 0);
  -[HAP2AccessoryServer setPrivateAccessories:](*(void *)(a1 + 32), MEMORY[0x1E4F1CBF0]);
  -[HAP2AccessoryServer setReachabilityProfile:](*(id **)(a1 + 32), 0);
  -[HAP2AccessoryServer setPairedName:](*(void *)(a1 + 32), 0);
  -[HAP2AccessoryServer setPairedProtocolVersion:](*(void *)(a1 + 32), 0);
  uint64_t v2 = [*(id *)(a1 + 40) pairingDriver];
  -[HAP2AccessoryServer setInternalPairingDriver:](*(void *)(a1 + 32), v2);

  -[HAP2AccessoryServer _updateConnectionState:withError:](*(id **)(a1 + 32), 1uLL, 0);
  char v3 = *(id **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = [v4 controller];
  -[HAP2AccessoryServer _updateServerMetadata:controller:](v3, v4, v5);

  -[HAP2AccessoryServer _stopConfirming](*(id **)(a1 + 32));
  -[HAP2AccessoryServer pairedDelegate](*(id *)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    [v6 accessoryServerDidBecomeUnpaired:*(void *)(a1 + 32)];
  }
}

- (void)_stopConfirming
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 operationQueue];
    [v2 assertCurrentQueue];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    char v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v7) = 138412290;
      *(void *)((char *)&v7 + 4) = a1;
      _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%@ Stopping reachability confirmations", (uint8_t *)&v7, 0xCu);
    }
    id v4 = a1[18];
    [v4 invalidate];

    objc_storeStrong(a1 + 18, 0);
    id v5 = [a1 operationQueue];
    [v5 assertCurrentQueue];

    id v6 = -[HAP2AccessoryServer reachability](a1);
    *(void *)&long long v7 = MEMORY[0x1E4F143A8];
    *((void *)&v7 + 1) = 3221225472;
    id v8 = __54__HAP2AccessoryServer_Paired___stopReachabilityClient__block_invoke;
    uint64_t v9 = &unk_1E69F4380;
    uint64_t v10 = a1;
    [v6 stopWithCompletionHandler:&v7];
  }
}

void __54__HAP2AccessoryServer_Paired___stopReachabilityClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v4 = hap2Log_accessory;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        int v5 = 138412546;
        uint64_t v6 = v2;
        __int16 v7 = 2112;
        id v8 = v3;
        _os_log_error_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to stop reachability client: %@", (uint8_t *)&v5, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ Reachability client stopped", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)stopConfirming
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(HAP2AccessoryServer *)self isPaired])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__HAP2AccessoryServer_Paired__stopConfirming__block_invoke;
    v6[3] = &unk_1E69F4330;
    void v6[4] = self;
    id v3 = (void *)MEMORY[0x1D944E2D0](v6);
    id v4 = [(HAP2AccessoryServer *)self operationQueue];
    [v4 addBlock:v3];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Server no longer paired, ignoring request to stop confirmations", buf, 0xCu);
    }
  }
}

void __45__HAP2AccessoryServer_Paired__stopConfirming__block_invoke(uint64_t a1)
{
}

- (void)startConfirming
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(HAP2AccessoryServer *)self isPaired])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__HAP2AccessoryServer_Paired__startConfirming__block_invoke;
    v6[3] = &unk_1E69F4330;
    void v6[4] = self;
    id v3 = (void *)MEMORY[0x1D944E2D0](v6);
    id v4 = [(HAP2AccessoryServer *)self operationQueue];
    [v4 addBlock:v3];
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Server no longer paired, ignoring request to start confirmations", buf, 0xCu);
    }
  }
}

void __46__HAP2AccessoryServer_Paired__startConfirming__block_invoke(uint64_t a1)
{
  v25[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [*(id *)(a1 + 32) operationQueue];
    [v2 assertCurrentQueue];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_1D4758000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting reachability confirmations", (uint8_t *)&buf, 0xCu);
    }
    id v4 = v1[18];

    if (v4)
    {
      id v5 = v1[18];
      [v5 invalidate];
    }
    uint64_t v6 = NSString;
    __int16 v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = [v1 deviceID];
    uint64_t v10 = [v6 stringWithFormat:@"%@/%@", v8, v9];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:v10];
    [v11 setRepeats:1];
    [v11 setInterval:57600.0];
    [v11 setTolerance:28800.0];
    objc_storeStrong(v1 + 18, v11);
    uint64_t v12 = [v11 description];
    objc_initWeak(location, v11);
    objc_initWeak(&from, v1);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    __int16 v21 = __57__HAP2AccessoryServer_Paired___scheduleBackgroundPolling__block_invoke;
    id v22 = &unk_1E69F39B8;
    objc_copyWeak((id *)&v24, &from);
    uint64_t v13 = v12;
    uint64_t v23 = v13;
    objc_copyWeak(v25, location);
    [v11 scheduleWithBlock:&buf];
    objc_destroyWeak(v25);

    objc_destroyWeak((id *)&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __47__HAP2AccessoryServer_Paired___startConfirming__block_invoke;
    location[3] = &unk_1E69F4380;
    location[4] = v1;
    id v14 = location;
    char v15 = [v1 operationQueue];
    [v15 assertCurrentQueue];

    uint64_t v16 = -[HAP2AccessoryServer reachability](v1);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    __int16 v21 = __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke;
    id v22 = &unk_1E69F3E20;
    uint64_t v23 = v1;
    uint64_t v17 = v14;
    id v24 = v17;
    [v16 startWithCompletionHandler:&buf];
  }
}

void __47__HAP2AccessoryServer_Paired___startConfirming__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 confirm];
  }
}

void __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke_2;
  v8[3] = &unk_1E69F4070;
  id v4 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v4;
  id v5 = v3;
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](v8);
  __int16 v7 = [*(id *)(a1 + 32) operationQueue];
  [v7 addBlock:v6];
}

uint64_t __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  id v4 = v3;
  if (v2)
  {
    if (v3)
    {
      if ([v3 code] == 4
        && ([v4 domain],
            id v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [v5 isEqualToString:@"HAPErrorDomain"],
            v5,
            v6))
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        __int16 v7 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          int v12 = 138412290;
          uint64_t v13 = v2;
          _os_log_debug_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%@ reachability already running", (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        id v8 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          int v12 = 138412546;
          uint64_t v13 = v2;
          __int16 v14 = 2112;
          char v15 = v4;
          _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ reachability start failed: %@", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v2;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ reachability started", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

void __57__HAP2AccessoryServer_Paired___scheduleBackgroundPolling__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    if ([v5 shouldDefer])
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      int v6 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412290;
        id v10 = WeakRetained;
        _os_log_debug_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%@ Background reachability poll was deferred", (uint8_t *)&v9, 0xCu);
      }
      v3[2](v3, 2);
    }
    else
    {
      [WeakRetained _performBackgroundPollWithCompletion:v3];
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      id v8 = *(void **)(a1 + 32);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_debug_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%@ Background reachability poll fired but server is gone", (uint8_t *)&v9, 0xCu);
    }
    v3[2](v3, 1);
  }
}

- (BOOL)isConfirming
{
  uint64_t v2 = -[HAP2AccessoryServer reachability]((id *)&self->super.super.isa);
  char v3 = [v2 isRunning];

  return v3;
}

- (id)updateAccessoriesWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__20628;
  void v16[4] = __Block_byref_object_dispose__20629;
  id v17 = 0;
  id v5 = -[HAP2AccessoryServer outstandingUpdateAccessoriesRequest]((id *)&self->super.super.isa);

  if (v5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      __int16 v21 = self;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%@ Ignoring updateAccessories request with reason:%@ one already running", buf, 0x16u);
    }
    __int16 v7 = +[HAP2Cancelable ignore];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v8 = [(HAP2AccessoryServer *)self operationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke;
    v12[3] = &unk_1E69F3650;
    objc_copyWeak(&v15, (id *)buf);
    __int16 v14 = v16;
    id v13 = v4;
    [v8 addBlock:v12];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_92;
    v10[3] = &unk_1E69F3678;
    objc_copyWeak(&v11, (id *)buf);
    void v10[4] = v16;
    __int16 v7 = +[HAP2Cancelable cancelableWithBlock:v10];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(v16, 8);

  return v7;
}

void __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = -[HAP2AccessoryServer outstandingUpdateAccessoriesRequest](WeakRetained);
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
    else
    {
      id v5 = NSString;
      int v6 = (objc_class *)objc_opt_class();
      __int16 v7 = NSStringFromClass(v6);
      id v34 = [v5 stringWithFormat:@"%@ Update Accessories", v7];

      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F65518]) initWithName:@"Update Activities" timeout:60.0];
      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v10 = [MEMORY[0x1E4F29128] UUID];
        id v36 = v8;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        id v35 = (void *)[v9 initWithIdentifier:v10 name:v34 parent:0 assertions:v11];
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        int v12 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v3;
          _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", (uint8_t *)&buf, 0xCu);
        }
        id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
        id v10 = [MEMORY[0x1E4F29128] UUID];
        id v11 = 0;
        id v35 = (void *)[v13 initWithIdentifier:v10 name:v34 parent:0 options:0];
      }

      __int16 v14 = *(void **)(a1 + 32);
      id v15 = v35;
      id v16 = v14;
      id v17 = [v3 operationQueue];
      [v17 assertCurrentQueue];

      uint64_t v18 = [v3 connectionState];
      char v19 = [v3 isPaired];
      if (v18) {
        char v20 = v19;
      }
      else {
        char v20 = 0;
      }
      if (v20)
      {
        unint64_t v21 = [v3 connectionState];
        if (v21 <= 4 && ((1 << v21) & 0x16) != 0)
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v22 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v3;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%@ Connecting", (uint8_t *)&buf, 0xCu);
          }
          -[HAP2AccessoryServer _updateConnectionState:withError:](v3, 2uLL, 0);
        }
        uint64_t v23 = [MEMORY[0x1E4F65520] sharedPowerLogger];
        id v24 = [v3 deviceID];
        uint64_t v25 = [v24 deviceIDString];
        __int16 v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));
        [v23 reportConnection:v25 linkType:1 accessoryCategory:v26];

        uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
        __int16 v28 = [v3 controller];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v38 = __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke;
        id v39 = &unk_1E69F37B8;
        id v40 = v15;
        uint64_t v41 = v3;
        id v42 = v27;
        id v43 = v16;
        id v29 = v27;
        uint64_t v30 = [v28 readAttributeDatabaseWithCompletion:&buf];
      }
      else
      {
        -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](v3, 0);
        id v31 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
        -[HAP2AccessoryServer _handleFailedAccessoryDiscovery:](v3, v31);

        uint64_t v30 = +[HAP2Cancelable ignore];
      }

      uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v30;

      -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](v3, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      __HMFActivityScopeLeave();
    }
  }
}

void __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained operationQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_2;
    v7[3] = &unk_1E69F44F0;
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = v3;
    [v6 addBlock:v7];
  }
}

uint64_t __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancelWithError:*(void *)(a1 + 32)];
}

- (void)_handleFailedAccessoryDiscovery:(void *)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 operationQueue];
    [v4 assertCurrentQueue];

    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412546;
      id v8 = a1;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1D4758000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to discover accessories: %@", (uint8_t *)&v7, 0x16u);
    }
    [a1 setReachabilityChangedReason:@"AttributeDatabaseRead"];
    -[HAP2AccessoryServer _handleAccessoryOperationError:](a1, v3);
    int v6 = [a1 delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 accessoryServer:a1 didFailToUpdateAccessoriesWithError:v3];
    }
  }
}

void __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v146[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id v95 = *(id *)(a1 + 32);
  int v7 = [*(id *)(a1 + 40) operationQueue];
  [v7 assertCurrentQueue];

  -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](*(void **)(a1 + 40), 0);
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
  double v10 = v9;

  id v11 = *(id *)(a1 + 32);
  id v12 = (id)[NSNumber numberWithDouble:v10];
  [v6 domain];

  [v6 code];
  id v13 = -[HAP2AccessoryServer reachability](*(id **)(a1 + 40));
  [v13 kick];

  __int16 v14 = *(id **)(a1 + 40);
  if (!v6)
  {
    -[HAP2AccessoryServer _updateConnectionState:withError:](v14, 3uLL, 0);
    id v15 = *(void **)(a1 + 40);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke_2;
    v94[3] = &unk_1E69F3790;
    v94[4] = v15;
    id v93 = v5;
    v90 = v94;
    if (!v15)
    {
LABEL_72:

      goto LABEL_73;
    }
    id v16 = [v15 operationQueue];
    [v16 assertCurrentQueue];

    id v17 = NSString;
    uint64_t v18 = (objc_class *)objc_opt_class();
    char v19 = NSStringFromClass(v18);
    v91 = [v17 stringWithFormat:@"%@ HandleDiscoveredAccessories", v19];

    v92 = (void *)[objc_alloc(MEMORY[0x1E4F65518]) initWithName:@"Discover Accessories" timeout:60.0];
    id v112 = 0;
    if (v92)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F653F0]);
      unint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      v134 = v92;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
      uint64_t v23 = (void *)[v20 initWithIdentifier:v21 name:v91 parent:0 assertions:v22];
      id v24 = v112;
      id v112 = v23;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v25 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v139 = 138412290;
        *(void *)&v139[4] = v15;
        _os_log_error_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", v139, 0xCu);
      }
      id v26 = objc_alloc(MEMORY[0x1E4F653F0]);
      unint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v27 = (void *)[v26 initWithIdentifier:v21 name:v91 parent:0 options:0];
      id v22 = v112;
      id v112 = v27;
    }

    v110[0] = 0;
    v110[1] = v110;
    v110[2] = 0x2020000000;
    char v111 = 0;
    __int16 v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v93, "count"));
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke;
    v108[3] = &unk_1E69F37E0;
    id v89 = v28;
    id v109 = v89;
    [v93 enumerateObjectsUsingBlock:v108];
    id v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v93, "count"));
    uint64_t v30 = -[HAP2AccessoryServer privateAccessories]((id *)v15);
    v107[0] = 0;
    v107[1] = v107;
    v107[2] = 0x2020000000;
    v107[3] = 0;
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_2;
    v102[3] = &unk_1E69F3808;
    v105 = v107;
    id v87 = v30;
    id v103 = v87;
    id v31 = v29;
    id v104 = v31;
    v106 = v110;
    [v89 enumerateObjectsUsingBlock:v102];
    uint64_t v32 = (void *)[v31 copy];
    -[HAP2AccessoryServer setPrivateAccessories:]((uint64_t)v15, v32);

    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v97 = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_3;
    v98 = &unk_1E69F3830;
    v100 = v90;
    v101 = v110;
    id v99 = v112;
    v88 = v96;
    id v33 = [v15 operationQueue];
    [v33 assertCurrentQueue];

    id v34 = -[HAP2AccessoryServer privateAccessories]((id *)v15);
    BOOL v35 = [v34 count] == 0;

    if (v35)
    {
      -[HAP2AccessoryServer setPairedName:]((uint64_t)v15, 0);
      -[HAP2AccessoryServer setPairedProtocolVersion:]((uint64_t)v15, 0);
      v97((uint64_t)v88);
LABEL_71:

      _Block_object_dispose(v107, 8);
      _Block_object_dispose(v110, 8);
      __HMFActivityScopeLeave();

      goto LABEL_72;
    }
    id v36 = [v15 primaryAccessory];
    uint64_t v120 = 0;
    v121 = &v120;
    uint64_t v122 = 0x3032000000;
    v123 = __Block_byref_object_copy__20628;
    v124 = __Block_byref_object_dispose__20629;
    id v125 = 0;
    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x3032000000;
    v117 = __Block_byref_object_copy__20628;
    v118 = __Block_byref_object_dispose__20629;
    id v119 = 0;
    v85 = v36;
    id v37 = [v36 services];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __71__HAP2AccessoryServer_Paired___handleUpdatedAccessoriesWithCompletion___block_invoke;
    v113[3] = &unk_1E69F3868;
    v113[4] = &v120;
    v113[5] = &v114;
    [v37 enumerateObjectsUsingBlock:v113];

    id v38 = (id)v121[5];
    id v39 = [v15 operationQueue];
    [v39 assertCurrentQueue];

    *(void *)v139 = 0;
    *(void *)&v139[8] = v139;
    *(void *)&v139[16] = 0x3032000000;
    v140 = __Block_byref_object_copy__20628;
    v141 = __Block_byref_object_dispose__20629;
    id v142 = 0;
    id v40 = [v38 characteristics];
    uint64_t v128 = MEMORY[0x1E4F143A8];
    uint64_t v129 = 3221225472;
    uint64_t v130 = (uint64_t)__73__HAP2AccessoryServer_Paired___handleUpdatedAccessoryInformationService___block_invoke;
    v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69F3898;
    v132 = (void (*)(uint64_t))v139;
    [v40 enumerateObjectsUsingBlock:&v128];

    uint64_t v41 = *(void **)(*(void *)&v139[8] + 40);
    if (v41) {
      -[HAP2AccessoryServer setPairedName:]((uint64_t)v15, v41);
    }
    _Block_object_dispose(v139, 8);

    id v42 = (id)v115[5];
    id v43 = [v15 operationQueue];
    [v43 assertCurrentQueue];

    *(void *)v139 = 0;
    *(void *)&v139[8] = v139;
    *(void *)&v139[16] = 0x3032000000;
    v140 = __Block_byref_object_copy__20628;
    v141 = __Block_byref_object_dispose__20629;
    id v142 = 0;
    uint64_t v44 = [v42 characteristics];
    uint64_t v128 = MEMORY[0x1E4F143A8];
    uint64_t v129 = 3221225472;
    uint64_t v130 = (uint64_t)__72__HAP2AccessoryServer_Paired___handleUpdatedProtocolInformationService___block_invoke;
    v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69F3898;
    v132 = (void (*)(uint64_t))v139;
    [v44 enumerateObjectsUsingBlock:&v128];

    if (*(void *)(*(void *)&v139[8] + 40))
    {
      id v45 = objc_alloc(MEMORY[0x1E4F65590]);
      id v46 = (void *)[v45 initWithVersionString:*(void *)(*(void *)&v139[8] + 40)];
      if (v46)
      {
LABEL_25:
        -[HAP2AccessoryServer setPairedProtocolVersion:]((uint64_t)v15, v46);

        _Block_object_dispose(v139, 8);
        uint64_t v50 = v88;
        __int16 v51 = [v15 operationQueue];
        [v51 assertCurrentQueue];

        v52 = [v15 operationQueue];
        [v52 assertCurrentQueue];

        __int16 v53 = [v15 primaryAccessory];
        BOOL v54 = v53 == 0;

        if (!v54)
        {
          __int16 v55 = [HAPAccessoryReachabilityProfile alloc];
          v56 = [v15 primaryAccessory];
          uint64_t v57 = [v56 services];
          v58 = [(HAPAccessoryReachabilityProfile *)v55 initWithDiscoveredServices:v57];
          -[HAP2AccessoryServer setReachabilityProfile:]((id *)v15, v58);

          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          v59 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
          {
            v81 = v59;
            v82 = -[HAP2AccessoryServer reachabilityProfile]((id *)v15);
            *(_DWORD *)v139 = 138412546;
            *(void *)&v139[4] = v15;
            *(_WORD *)&v139[12] = 2112;
            *(void *)&v139[14] = v82;
            _os_log_debug_impl(&dword_1D4758000, v81, OS_LOG_TYPE_DEBUG, "%@ Updated reachability profile: %@", v139, 0x16u);
          }
        }
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __66__HAP2AccessoryServer_Paired___prepareReachabilityWithCompletion___block_invoke;
        v126[3] = &unk_1E69F3B20;
        v60 = v50;
        id v127 = v60;
        v61 = v126;
        v62 = [v15 operationQueue];
        [v62 assertCurrentQueue];

        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __66__HAP2AccessoryServer_Paired___updateSleepIntervalWithCompletion___block_invoke;
        v136 = &unk_1E69F39E0;
        v137 = v15;
        v63 = v61;
        id v138 = v63;
        v64 = buf;
        v65 = [v15 operationQueue];
        [v65 assertCurrentQueue];

        v66 = [v15 primaryAccessory];
        LODWORD(v65) = v66 == 0;

        if (v65)
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          v68 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v139 = 138412290;
            *(void *)&v139[4] = v15;
            _os_log_impl(&dword_1D4758000, v68, OS_LOG_TYPE_INFO, "%@ No primary accessory yet, using default sleep interval", v139, 0xCu);
          }
          (*(void (**)(unsigned char *, void *))&buf[16])(v64, &unk_1F2C80B50);
        }
        else
        {
          v67 = [v15 primaryAccessory];
          if ([v67 conformsToProtocol:&unk_1F2CA0090])
          {
            v86 = [v15 primaryAccessory];
          }
          else
          {
            v86 = 0;
          }

          uint64_t v128 = 0;
          uint64_t v129 = (uint64_t)&v128;
          uint64_t v130 = 0x3032000000;
          v131 = __Block_byref_object_copy__20628;
          v132 = __Block_byref_object_dispose__20629;
          id v133 = [v86 internalSleepIntervalMs];
          if (*(void *)(v129 + 40))
          {
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            v69 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
            {
              uint64_t v70 = *(void *)(v129 + 40);
              *(_DWORD *)v139 = 138412546;
              *(void *)&v139[4] = v15;
              *(_WORD *)&v139[12] = 2112;
              *(void *)&v139[14] = v70;
              _os_log_impl(&dword_1D4758000, v69, OS_LOG_TYPE_INFO, "%@ Using primary accessory's sleep interval: %@", v139, 0x16u);
            }
            (*(void (**)(unsigned char *, void))&buf[16])(v64, *(void *)(v129 + 40));
          }
          else
          {
            v71 = -[HAP2AccessoryServer reachabilityProfile]((id *)v15);
            v84 = [v71 sleepIntervalCharacteristic];

            if (v84)
            {
              v72 = [v84 value];

              if (v72)
              {
                v83 = [v84 value];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                if (isKindOfClass)
                {
                  v74 = [v84 value];
                }
                else
                {
                  v74 = 0;
                }
                objc_storeStrong((id *)(v129 + 40), v74);
                if (isKindOfClass) {

                }
                [v86 setInternalSleepIntervalMs:*(void *)(v129 + 40)];
                if (hap2LogInitialize_onceToken != -1) {
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                }
                v79 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
                {
                  uint64_t v80 = *(void *)(v129 + 40);
                  *(_DWORD *)v139 = 138412546;
                  *(void *)&v139[4] = v15;
                  *(_WORD *)&v139[12] = 2112;
                  *(void *)&v139[14] = v80;
                  _os_log_impl(&dword_1D4758000, v79, OS_LOG_TYPE_INFO, "%@ Using previously cached sleep interval: %@", v139, 0x16u);
                }
                (*(void (**)(unsigned char *, void))&buf[16])(v64, *(void *)(v129 + 40));
              }
              else
              {
                if (hap2LogInitialize_onceToken != -1) {
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
                }
                v76 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v139 = 138412290;
                  *(void *)&v139[4] = v15;
                  _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_INFO, "%@ Reading sleep interval from primary accessory", v139, 0xCu);
                }
                v146[0] = v84;
                v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:1];
                *(void *)v139 = MEMORY[0x1E4F143A8];
                *(void *)&v139[8] = 3221225472;
                *(void *)&v139[16] = __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke;
                v140 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E69F3A30;
                v141 = (void (*)(uint64_t))v15;
                v144 = v64;
                id v142 = v84;
                v145 = &v128;
                id v143 = v86;
                id v78 = (id)[v15 readValuesForCharacteristics:v77 timeout:v139 completion:0.0];
              }
            }
            else
            {
              if (hap2LogInitialize_onceToken != -1) {
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
              }
              v75 = hap2Log_accessory;
              if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v139 = 138412290;
                *(void *)&v139[4] = v15;
                _os_log_impl(&dword_1D4758000, v75, OS_LOG_TYPE_INFO, "%@ No sleep interval characteristic present, using default sleep interval", v139, 0xCu);
              }
              (*(void (**)(unsigned char *, void *))&buf[16])(v64, &unk_1F2C80B50);
            }
          }
          _Block_object_dispose(&v128, 8);
        }
        _Block_object_dispose(&v114, 8);

        _Block_object_dispose(&v120, 8);
        goto LABEL_71;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v47 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        __int16 v49 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v15;
          _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_INFO, "%@ Unable to retrieve paired protocol version", buf, 0xCu);
        }
        id v46 = 0;
        goto LABEL_25;
      }
      uint64_t v48 = *(void *)(*(void *)&v139[8] + 40);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v48;
      _os_log_error_impl(&dword_1D4758000, v47, OS_LOG_TYPE_ERROR, "%@ Failed to parse protocol version: %@", buf, 0x16u);
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    goto LABEL_22;
  }
  -[HAP2AccessoryServer _handleFailedAccessoryDiscovery:](v14, v6);
LABEL_73:
  __HMFActivityScopeLeave();
}

void __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v3 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      id v4 = *(id **)(a1 + 32);
      id v5 = v3;
      id v6 = -[HAP2AccessoryServer privateAccessories](v4);
      int v7 = [v6 count];
      id v8 = -[HAP2AccessoryServer privateAccessories](*(id **)(a1 + 32));
      uint64_t v9 = [v8 count];
      double v10 = "ies";
      int v12 = 138412802;
      id v13 = v4;
      if (v9 == 1) {
        double v10 = "y";
      }
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 2080;
      id v17 = v10;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Informing delegate of %d updated accessor%s", (uint8_t *)&v12, 0x1Cu);
    }
    id v11 = -[HAP2AccessoryServer pairedDelegate](*(id *)(a1 + 32));
    if (objc_opt_respondsToSelector()) {
      [v11 accessoryServerDidUpdateAccessories:*(void *)(a1 + 32)];
    }
  }
}

void __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_1F2CA0090]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  [*(id *)(a1 + 32) addObject:v3];
}

void __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 instanceID];
  while (1)
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4 >= [*(id *)(a1 + 32) count]) {
      goto LABEL_8;
    }
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v6 = [v5 instanceID];

    if (v6 == v3) {
      break;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (!v7)
  {
LABEL_8:
    [*(id *)(a1 + 40) addObject:v11];
    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [v11 services];
  int v10 = [v8 updateDiscoveredServices:v9];

  if (!v10) {
    goto LABEL_10;
  }
  [*(id *)(a1 + 40) addObject:v8];
LABEL_9:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_10:
}

uint64_t __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __71__HAP2AccessoryServer_Paired___handleUpdatedAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v7 = [v13 type];
  int v8 = [v7 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    uint64_t v9 = a1 + 32;
  }
  else
  {
    int v10 = [v13 type];
    int v11 = [v10 isEqualToString:@"000000A2-0000-1000-8000-0026BB765291"];

    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v9 = a1 + 40;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a2);
LABEL_6:
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v12) {
    LOBYTE(v12) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  }
  *a4 = v12;
}

uint64_t __66__HAP2AccessoryServer_Paired___prepareReachabilityWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__HAP2AccessoryServer_Paired___updateSleepIntervalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 operationQueue];
  [v5 assertCurrentQueue];

  +[HAPAccessoryReachabilityProfile timeIntervalFromMillisecondNumberValue:v4];
  double v7 = v6;

  int v8 = -[HAP2AccessoryServer reachabilityProfile](*(id **)(a1 + 32));
  [v8 setSleepInterval:v7];

  uint64_t v9 = -[HAP2AccessoryServer reachabilityProfile](*(id **)(a1 + 32));
  int v10 = -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  [v10 setProfile:v9];

  double v11 = v7 * 1.1;
  BOOL v12 = fabs(v11) >= 2.22044605e-16 && v11 > 0.0;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v13 = hap2Log_accessory;
  BOOL v14 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)id v22 = 138412546;
      *(void *)&v22[4] = v15;
      *(_WORD *)&v22[12] = 2048;
      *(double *)&v22[14] = v11;
      __int16 v16 = "%@ Updating maximum request timeout to %f seconds";
      id v17 = v13;
      uint32_t v18 = 22;
LABEL_11:
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, v16, v22, v18);
    }
  }
  else if (v14)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)id v22 = 138412290;
    *(void *)&v22[4] = v19;
    __int16 v16 = "%@ Using default maximum request timeout";
    id v17 = v13;
    uint32_t v18 = 12;
    goto LABEL_11;
  }
  id v20 = objc_msgSend(*(id *)(a1 + 32), "controller", *(_OWORD *)v22, *(void *)&v22[16], v23);
  [v20 updateMaxRequestTimeout:v11];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) operationQueue];
  [v7 assertCurrentQueue];

  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v27 = 138412546;
      *(void *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v6;
      _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to read sleep interval, using default sleep interval: %@", v27, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    *(void *)uint64_t v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x3032000000;
    __int16 v28 = __Block_byref_object_copy__20628;
    id v29 = __Block_byref_object_dispose__20629;
    id v30 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke_228;
    v19[3] = &unk_1E69F3A08;
    id v20 = *(id *)(a1 + 40);
    unint64_t v21 = v27;
    uint64_t v22 = *(void *)(a1 + 64);
    [v5 enumerateObjectsUsingBlock:v19];
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Read sleep interval from primary accessory: %@", buf, 0x16u);
      }
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 2 * objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "unsignedIntegerValue"));
      uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      [*(id *)(a1 + 48) setInternalSleepIntervalMs:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v15 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void *)(*(void *)&v27[8] + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ Failed to read sleep interval, using default sleep interval: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    _Block_object_dispose(v27, 8);
  }
}

void __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke_228(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v6 = [v18 characteristic];
  double v7 = [v6 type];
  int v8 = [*(id *)(a1 + 32) type];
  int v9 = [v7 isEqualToString:v8];

  uint64_t v10 = v18;
  if (v9)
  {
    uint64_t v11 = [v18 error];

    if (v11)
    {
      uint64_t v12 = [v18 error];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      uint64_t v15 = [v18 value];

      if (!v15) {
        goto LABEL_5;
      }
      BOOL v14 = [v18 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v17 = [v18 value];
      }
      else
      {
        uint64_t v17 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v17);
      if (isKindOfClass) {
    }
      }
LABEL_5:
    *a4 = 1;
    uint64_t v10 = v18;
  }
}

void __72__HAP2AccessoryServer_Paired___handleUpdatedProtocolInformationService___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 type];
  int v7 = [v6 isEqualToString:@"00000037-0000-1000-8000-0026BB765291"];

  int v8 = v12;
  if (v7)
  {
    int v9 = [v12 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      uint64_t v11 = [v12 value];
    }
    else
    {
      uint64_t v11 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v11);
    if (isKindOfClass) {

    }
    *a4 = 1;
    int v8 = v12;
  }
}

void __73__HAP2AccessoryServer_Paired___handleUpdatedAccessoryInformationService___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 type];
  int v7 = [v6 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];

  int v8 = v12;
  if (v7)
  {
    int v9 = [v12 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      uint64_t v11 = [v12 value];
    }
    else
    {
      uint64_t v11 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v11);
    if (isKindOfClass) {

    }
    *a4 = 1;
    int v8 = v12;
  }
}

- (id)getPairingsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HAP2AccessoryServer_Paired__getPairingsWithCompletion___block_invoke;
  v8[3] = &unk_1E69F4220;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

id __57__HAP2AccessoryServer_Paired__getPairingsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained controller];
  id v4 = [v3 listPairingsWithCompletion:*(void *)(a1 + 32)];

  return v4;
}

- (id)removePairing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke;
  v12[3] = &unk_1E69F3628;
  objc_copyWeak(&v15, &location);
  id v8 = v7;
  id v14 = v8;
  id v9 = v6;
  id v13 = v9;
  id v10 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

HAP2CancelableObject *__56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained browser];
  if (v3)
  {
    id v4 = objc_alloc_init(HAP2CancelableObject);
    id v5 = [WeakRetained deviceID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_81;
    v13[3] = &unk_1E69F35B0;
    id v6 = v4;
    id v14 = v6;
    id v17 = a1[5];
    id v15 = WeakRetained;
    id v16 = a1[4];
    [v3 retrieveLocalPairingIdentityForDeviceID:v5 completion:v13];

    id v7 = v16;
    id v8 = v6;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = WeakRetained;
      _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%@ Unable to get the accessory server browser", buf, 0xCu);
    }
    id v10 = (void (**)(id, void *))a1[5];
    uint64_t v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    v10[2](v10, v11);

    id v8 = +[HAP2Cancelable ignore];
  }

  return v8;
}

void __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_81(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] cancelError];
  if (v7)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v5)
    {
      id v8 = [v5 identifier];
      id v9 = [a1[6] identifier];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        id v15 = a1[5];
        *(_DWORD *)long long buf = 138412546;
        id v25 = v15;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ Unable to lookup local pairing identity: %@", buf, 0x16u);
      }
      char v10 = 0;
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_82;
    id v19 = &unk_1E69F3600;
    id v12 = a1[6];
    id v20 = a1[5];
    id v21 = v12;
    char v23 = v10;
    id v22 = a1[7];
    id v13 = (void *)MEMORY[0x1D944E2D0](&v16);
    id v14 = objc_msgSend(a1[5], "operationQueue", v16, v17, v18, v19, v20);
    [v14 addBlock:v13];
  }
}

void __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_82(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) controller];
  id v2 = (id)[v3 removePairing:*(void *)(a1 + 40) cleanupLocalData:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (id)addPairing:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HAP2AccessoryServer_Paired__addPairing_completion___block_invoke;
  v12[3] = &unk_1E69F3628;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  char v10 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

id __53__HAP2AccessoryServer_Paired__addPairing_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained controller];
  id v4 = [v3 addPairing:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];

  return v4;
}

- (id)unpairWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%@ Unpairing with accessory server", buf, 0xCu);
  }
  if ([(HAP2AccessoryServer *)self isPaired])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke;
    v10[3] = &unk_1E69F35D8;
    void v10[4] = self;
    id v11 = v4;
    id v6 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v10);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = self;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%@ Trying to unpair an unpaired server", buf, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);

    id v6 = +[HAP2Cancelable ignore];
  }

  return v6;
}

HAP2CancelableObject *__52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) browser];
  if (v2)
  {
    id v3 = objc_alloc_init(HAP2CancelableObject);
    id v4 = [*(id *)(a1 + 32) deviceID];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_76;
    v15[3] = &unk_1E69F35B0;
    id v5 = v3;
    uint64_t v16 = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v19 = v6;
    uint64_t v17 = v7;
    id v18 = v2;
    [v18 retrieveLocalPairingIdentityForDeviceID:v4 completion:v15];

    id v8 = v18;
    id v9 = v5;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    char v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v14;
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Unable to get the accessory server browser", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    id v9 = +[HAP2Cancelable ignore];
  }

  return v9;
}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_76(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] cancelError];
  if (v7)
  {
    id v8 = (void (*)(void))*((void *)a1[7] + 2);
  }
  else
  {
    if (v5)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_77;
      uint64_t v16 = &unk_1E69F3D58;
      id v17 = a1[5];
      id v18 = v5;
      id v19 = a1[6];
      id v20 = a1[7];
      id v9 = (void *)MEMORY[0x1D944E2D0](&v13);
      char v10 = objc_msgSend(a1[5], "operationQueue", v13, v14, v15, v16, v17);
      [v10 addBlock:v9];

      goto LABEL_6;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v12 = a1[5];
      *(_DWORD *)long long buf = 138412546;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ Unable to get the local pairing identity: %@", buf, 0x16u);
    }
    id v8 = (void (*)(void))*((void *)a1[7] + 2);
  }
  v8();
LABEL_6:
}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_77(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_2;
  v5[3] = &unk_1E69F3E98;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v4 = (id)[v2 removePairing:v3 cleanupLocalData:1 completion:v5];
}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%@ Remove pairing completed with error: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) deviceID];
  [v6 removePublicKeyForAccessoryWithID:v7 completion:*(void *)(a1 + 48)];
}

- (void)clearAccessories
{
  -[HAP2AccessoryServer setPrivateAccessories:]((uint64_t)self, MEMORY[0x1E4F1CBF0]);

  -[HAP2AccessoryServer setReachabilityProfile:]((id *)&self->super.super.isa, 0);
}

- (HAP2Accessory)primaryAccessory
{
  id v2 = -[HAP2AccessoryServer privateAccessories]((id *)&self->super.super.isa);
  id v3 = [v2 firstObject];

  return (HAP2Accessory *)v3;
}

- (void)pairingDriver:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  id v17 = [(HAP2AccessoryServer *)self operationQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__HAP2AccessoryServer_Unpaired__pairingDriver_validateSoftwareAuthUUID_token_model_completion___block_invoke;
  v22[3] = &unk_1E69F42C0;
  objc_copyWeak(&v27, &location);
  id v18 = v13;
  id v23 = v18;
  id v19 = v14;
  id v24 = v19;
  id v20 = v15;
  id v25 = v20;
  id v21 = v16;
  id v26 = v21;
  [v17 addBlock:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __95__HAP2AccessoryServer_Unpaired__pairingDriver_validateSoftwareAuthUUID_token_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained validateSoftwareAuthUUID:*(void *)(a1 + 32) token:*(void *)(a1 + 40) model:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)pairingDriver:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAP2AccessoryServer *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HAP2AccessoryServer_Unpaired__pairingDriver_validatePairingCert_model_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v11;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v13;
  id v21 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __84__HAP2AccessoryServer_Unpaired__pairingDriver_validatePairingCert_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained validatePairingCert:*(void *)(a1 + 32) model:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)pairingDriver:(id)a3 didFinishAuthWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [(HAP2AccessoryServer *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HAP2AccessoryServer_Unpaired__pairingDriver_didFinishAuthWithError___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__HAP2AccessoryServer_Unpaired__pairingDriver_didFinishAuthWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained didFinishAuthWithError:*(void *)(a1 + 32)];
  }
}

- (void)pairingDriver:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAP2AccessoryServer *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__HAP2AccessoryServer_Unpaired__pairingDriver_confirmSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v11;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v13;
  id v21 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __88__HAP2AccessoryServer_Unpaired__pairingDriver_confirmSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained confirmSoftwareAuthUUID:*(void *)(a1 + 32) token:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)pairingDriver:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(HAP2AccessoryServer *)self operationQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__HAP2AccessoryServer_Unpaired__pairingDriver_authenticateSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E69F4298;
  objc_copyWeak(&v22, &location);
  id v15 = v11;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v13;
  id v21 = v17;
  [v14 addBlock:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __93__HAP2AccessoryServer_Unpaired__pairingDriver_authenticateSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained authenticateSoftwareAuthUUID:*(void *)(a1 + 32) token:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)pairingDriver:(id)a3 doesRequireSetupCodeForAccessory:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(HAP2AccessoryServer *)self operationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequireSetupCodeForAccessory_completion___block_invoke;
  v13[3] = &unk_1E69F4630;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [v11 addBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __91__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequireSetupCodeForAccessory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained doesRequireSetupCodeWithCompletion:*(void *)(a1 + 32)];
  }
}

- (void)pairingDriver:(id)a3 doesRequirePermission:(unint64_t)a4 accessory:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(HAP2AccessoryServer *)self operationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequirePermission_accessory_completion___block_invoke;
  v15[3] = &unk_1E69F4248;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  id v14 = v12;
  id v16 = v14;
  [v13 addBlock:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __90__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequirePermission_accessory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained doesRequirePermission:*(void *)(a1 + 48) completion:*(void *)(a1 + 32)];
  }
}

- (void)pairingDriver:(id)a3 didSaveRemotePairingIdentity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(HAP2AccessoryServer *)self operationQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__HAP2AccessoryServer_Unpaired__pairingDriver_didSaveRemotePairingIdentity_completion___block_invoke;
  v14[3] = &unk_1E69F4270;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v15 = v13;
  [v11 addBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __87__HAP2AccessoryServer_Unpaired__pairingDriver_didSaveRemotePairingIdentity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained browser];
  if (v2)
  {
    id v3 = [HAPDeviceID alloc];
    id v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = [(HAPDeviceID *)v3 initWithDeviceIDString:v4];

    id v6 = [*(id *)(a1 + 32) publicKey];
    id v7 = [v6 data];

    [v2 savePublicKey:v7 forAccessoryWithID:v5 completion:*(void *)(a1 + 40)];
    if (WeakRetained)
    {
      id v8 = [WeakRetained delegate];
      if (v8)
      {
        id v9 = [WeakRetained delegate];
        if ([v9 conformsToProtocol:&unk_1F2C9A2F0])
        {
          id v10 = [WeakRetained delegate];
        }
        else
        {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    [v10 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v7];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:6];
    (*(void (**)(uint64_t, HAPDeviceID *))(v11 + 16))(v11, v5);
  }
}

- (void)pairingDriver:(id)a3 didRequestLocalPairingIdentityWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServer *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__HAP2AccessoryServer_Unpaired__pairingDriver_didRequestLocalPairingIdentityWithCompletion___block_invoke;
  v10[3] = &unk_1E69F4630;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __92__HAP2AccessoryServer_Unpaired__pairingDriver_didRequestLocalPairingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained browser];
  if (!v2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:6];
    id v6 = *(void (**)(void))(v7 + 16);
    goto LABEL_5;
  }
  id v3 = [WeakRetained delegate];
  id v4 = [v3 pairingRequest];
  uint64_t v5 = [v4 pairingIdentity];

  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_7;
  }
  id v8 = [WeakRetained deviceID];
  [v2 retrieveLocalPairingIdentityForDeviceID:v8 completion:*(void *)(a1 + 32)];

  uint64_t v5 = 0;
LABEL_7:
}

- (void)pairingDriver:(id)a3 didRejectSetupCodeForAccessory:(id)a4 backoffInterval:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [(HAP2AccessoryServer *)self operationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__HAP2AccessoryServer_Unpaired__pairingDriver_didRejectSetupCodeForAccessory_backoffInterval_completion___block_invoke;
  v15[3] = &unk_1E69F4248;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a5;
  id v14 = v12;
  id v16 = v14;
  [v13 addBlock:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __105__HAP2AccessoryServer_Unpaired__pairingDriver_didRejectSetupCodeForAccessory_backoffInterval_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2) {
    [v2 accessoryServer:WeakRetained didRejectSetupCodeWithBackoffInterval:*(void *)(a1 + 32) completion:*(double *)(a1 + 48)];
  }
}

- (void)pairingDriver:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HAP2AccessoryServer *)self operationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HAP2AccessoryServer_Unpaired__pairingDriver_didCompleteWithError___block_invoke;
  v10[3] = &unk_1E69F4540;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 addBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__HAP2AccessoryServer_Unpaired__pairingDriver_didCompleteWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[HAP2AccessoryServer pairDelegate](WeakRetained);
  id v3 = v2;
  if (v2)
  {
    [v2 accessoryServer:WeakRetained didCompleteWithError:*(void *)(a1 + 32)];
    -[HAP2AccessoryServer setPairDelegate:](WeakRetained, 0);
  }
}

- (void)mergeWithNewlyDiscoveredUnpairedAccessoryServer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HAP2AccessoryServer *)self operationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HAP2AccessoryServer_Unpaired__mergeWithNewlyDiscoveredUnpairedAccessoryServer___block_invoke;
  v7[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __81__HAP2AccessoryServer_Unpaired__mergeWithNewlyDiscoveredUnpairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer _updateServerMetadata:controller:](WeakRetained, *(void **)(a1 + 32), 0);
}

- (void)becomePairedWithAccessoryServer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = self;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%@ Accessory is now paired", buf, 0xCu);
  }
  -[HAP2AccessoryServer setInternallyPaired:]((uint64_t)self, 1);
  -[HAP2AccessoryServer setInternalPairingDriver:]((uint64_t)self, 0);
  objc_initWeak((id *)buf, self);
  id v6 = [(HAP2AccessoryServer *)self operationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HAP2AccessoryServer_Unpaired__becomePairedWithAccessoryServer___block_invoke;
  v8[3] = &unk_1E69F4540;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [v6 addBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __65__HAP2AccessoryServer_Unpaired__becomePairedWithAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 controller];
  -[HAP2AccessoryServer _updateServerMetadata:controller:](WeakRetained, v2, v3);
}

- (id)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HAP2AccessoryServer_Unpaired__identifyWithCompletion___block_invoke;
  v8[3] = &unk_1E69F4220;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

id __56__HAP2AccessoryServer_Unpaired__identifyWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (-[HAP2AccessoryServer isInternallyPaired]((uint64_t)WeakRetained))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id v5 = +[HAP2Cancelable ignore];
  }
  else
  {
    id v6 = [WeakRetained controller];
    id v5 = [v6 unpairedIdentifyWithCompletion:*(void *)(a1 + 32)];
  }

  return v5;
}

- (id)pairWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F653F0] currentActivity];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HAP2AccessoryServer_Unpaired__pairWithDelegate___block_invoke;
  v10[3] = &unk_1E69F41F8;
  void v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = -[HAP2AccessoryServer _delegateCancelableFor:](self, v10);

  return v8;
}

id __50__HAP2AccessoryServer_Unpaired__pairWithDelegate___block_invoke(uint64_t a1)
{
  id v2 = -[HAP2AccessoryServer pairDelegate](*(id **)(a1 + 32));

  if (v2)
  {
    uint64_t v5 = a1 + 32;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v5 + 8);
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:5];
    [v4 accessoryServer:v3 didCompleteWithError:v6];

LABEL_5:
    id v11 = +[HAP2Cancelable ignore];
    goto LABEL_6;
  }
  BOOL v7 = -[HAP2AccessoryServer isInternallyPaired](*(void *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  if (v7)
  {
    id v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:18];
    [v8 accessoryServer:v9 didCompleteWithError:v10];

    goto LABEL_5;
  }
  -[HAP2AccessoryServer setPairDelegate:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  [*(id *)(a1 + 48) begin];
  id v14 = *(id *)(a1 + 48);
  uint64_t v13 = -[HAP2AccessoryServer internalPairingDriver](*(id **)(a1 + 32));
  id v11 = [v13 pairAccessory:*(void *)(a1 + 32) delegate:*(void *)(a1 + 32)];

  __HMFActivityScopeLeave();
LABEL_6:

  return v11;
}

@end