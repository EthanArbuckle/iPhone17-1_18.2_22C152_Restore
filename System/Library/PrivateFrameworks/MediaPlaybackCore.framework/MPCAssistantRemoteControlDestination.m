@interface MPCAssistantRemoteControlDestination
+ (BOOL)supportsSecureCoding;
+ (id)iBooksApplicationDestination;
+ (id)nowPlayingApplicationDestination;
+ (id)podcastsApplicationDestination;
+ (id)systemMediaApplicationDestination;
- (BOOL)isCompanion;
- (BOOL)originatingDeviceControl;
- (BOOL)singleGroup;
- (MPCAssistantRemoteControlDestination)init;
- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3;
- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3 playerID:(id)a4 origin:(void *)a5;
- (MPCAssistantRemoteControlDestination)initWithCoder:(id)a3;
- (NSArray)hashedOutputDeviceUIDs;
- (NSArray)outputDeviceUIDs;
- (NSArray)outputGroups;
- (NSString)appBundleID;
- (NSString)originatingOutputDeviceUID;
- (NSString)outputGroupID;
- (NSString)playerID;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_getCompanionOriginWithQueue:(id)a3 completion:(id)a4;
- (void)createPlayerPath;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)origin;
- (void)resolveForWatchControlCommandWithRouteIdentifiers:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)resolveWithHashedRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5;
- (void)resolveWithHashedRouteIdentifiers:(id)a3 completion:(id)a4;
- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7;
- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6;
- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7;
- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6;
- (void)resolveWithRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5;
- (void)resolveWithRouteIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantRemoteControlDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingOutputDeviceUID, 0);
  objc_storeStrong((id *)&self->_outputGroupID, 0);
  objc_storeStrong((id *)&self->_outputGroups, 0);
  objc_storeStrong((id *)&self->_hashedOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_playerID, 0);

  objc_storeStrong((id *)&self->_appBundleID, 0);
}

- (BOOL)isCompanion
{
  return self->_isCompanion;
}

- (BOOL)originatingDeviceControl
{
  return self->_originatingDeviceControl;
}

- (BOOL)singleGroup
{
  return self->_singleGroup;
}

- (NSString)originatingOutputDeviceUID
{
  return self->_originatingOutputDeviceUID;
}

- (NSString)outputGroupID
{
  return self->_outputGroupID;
}

- (NSArray)outputGroups
{
  return self->_outputGroups;
}

- (NSArray)hashedOutputDeviceUIDs
{
  return self->_hashedOutputDeviceUIDs;
}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void)origin
{
  return self->_origin;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (MPCAssistantRemoteControlDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppBundleID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlayerID"];
  v7 = [(MPCAssistantRemoteControlDestination *)self initWithAppBundleID:v5 playerID:v6 origin:0];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginatingOutputDeviceUID"];
    originatingOutputDeviceUID = v7->_originatingOutputDeviceUID;
    v7->_originatingOutputDeviceUID = (NSString *)v8;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  originatingOutputDeviceUID = self->_originatingOutputDeviceUID;
  id v5 = a3;
  [v5 encodeObject:originatingOutputDeviceUID forKey:@"OriginatingOutputDeviceUID"];
  [v5 encodeObject:self->_appBundleID forKey:@"AppBundleID"];
  [v5 encodeObject:self->_playerID forKey:@"PlayerID"];
}

- (void)_getCompanionOriginWithQueue:(id)a3 completion:(id)a4
{
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  id v5 = objc_alloc_init(a4);
  uint64_t v6 = [(NSString *)self->_appBundleID copy];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_playerID copy];
  v9 = (void *)v5[2];
  v5[2] = v8;

  origin = self->_origin;
  if (origin) {
    origin = CFRetain(origin);
  }
  v5[3] = origin;
  uint64_t v11 = [(NSArray *)self->_outputDeviceUIDs copy];
  v12 = (void *)v5[4];
  v5[4] = v11;

  uint64_t v13 = [(NSArray *)self->_hashedOutputDeviceUIDs copy];
  v14 = (void *)v5[5];
  v5[5] = v13;

  uint64_t v15 = [(NSArray *)self->_outputGroups copy];
  v16 = (void *)v5[6];
  v5[6] = v15;

  uint64_t v17 = [(NSString *)self->_outputGroupID copy];
  v18 = (void *)v5[7];
  v5[7] = v17;

  uint64_t v19 = [(NSString *)self->_originatingOutputDeviceUID copy];
  v20 = (void *)v5[8];
  v5[8] = v19;

  *((unsigned char *)v5 + 72) = self->_singleGroup;
  *((unsigned char *)v5 + 73) = self->_originatingDeviceControl;
  *((unsigned char *)v5 + 74) = self->_isCompanion;
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPCAssistantRemoteControlDestination *)self _copyWithZone:a3 usingConcreteClass:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)nowPlayingApplicationDestination
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (id)iBooksApplicationDestination
{
  id v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAppBundleID:@"com.apple.iBooks"];

  return v2;
}

+ (id)podcastsApplicationDestination
{
  id v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAppBundleID:*MEMORY[0x263F54E30]];

  return v2;
}

+ (id)systemMediaApplicationDestination
{
  id v2 = (__CFString *)(id)*MEMORY[0x263F54E28];
  v3 = [MEMORY[0x263F12178] standardUserDefaults];
  int v4 = [v3 sonicHijack];

  if (v4)
  {

    id v2 = @"com.apple.Sonic";
  }
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAppBundleID:v2];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPCAssistantRemoteControlDestination *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (void)resolveForWatchControlCommandWithRouteIdentifiers:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  uint64_t v11 = (void *)[(MPCAssistantRemoteControlDestination *)self mutableCopy];
  if ([v8 count])
  {
    [v11 setOutputDeviceUIDs:v8];
    v10[2](v10, v11);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke;
    aBlock[3] = &unk_2643C5620;
    aBlock[4] = self;
    id v12 = v11;
    id v29 = v12;
    uint64_t v13 = v10;
    v30 = v13;
    v14 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_49;
    v23[3] = &unk_2643C4420;
    v23[4] = self;
    id v24 = v9;
    id v25 = v12;
    v26 = v13;
    id v15 = v14;
    id v27 = v15;
    v16 = _Block_copy(v23);
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: GetElectedPlayerPath start", buf, 2u);
    }

    v20 = v16;
    v21 = v15;
    id v18 = v15;
    id v19 = v16;
    MRMediaRemoteGetElectedPlayerPath();
  }
}

uint64_t __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Using local origin", v4, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 8) isEqualToString:@"com.apple.iBooks"]) {
    [*(id *)(a1 + 40) setAppBundleID:@"com.apple.NanoBooks"];
  }
  [*(id *)(a1 + 40) setOrigin:MRMediaRemoteGetLocalOrigin()];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_49(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Attempting to fetch companion origin", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_50;
  v5[3] = &unk_2643C43F8;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v3 _getCompanionOriginWithQueue:v4 completion:v5];
}

void __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 origin];
  int v5 = [v4 identifier];

  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 origin];
    v9[0] = 67109376;
    v9[1] = [v7 identifier];
    __int16 v10 = 1024;
    BOOL v11 = v5 == 1129140302;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: GetElectedPlayerPath finish. identifier:'%d'  isCompanionOriginElected:%{BOOL}u", (uint8_t *)v9, 0xEu);
  }
  uint64_t v8 = 40;
  if (v5 == 1129140302) {
    uint64_t v8 = 32;
  }
  (*(void (**)(void))(*(void *)(a1 + v8) + 16))();
}

uint64_t __107__MPCAssistantRemoteControlDestination_resolveForWatchControlCommandWithRouteIdentifiers_queue_completion___block_invoke_50(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = a2;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "resolveForWatchControlCommand: Found companion origin: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) setOrigin:a2];
    [*(id *)(a1 + 32) setIsCompanion:1];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "resolveForWatchControlCommand: Companion origin not found. Falling back to local origin.", (uint8_t *)&v7, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7
{
  id v12 = a4;
  uint64_t v9 = (void (**)(id, void *))a7;
  __int16 v10 = (void *)[(MPCAssistantRemoteControlDestination *)self mutableCopy];
  if ([v12 count])
  {
    [v10 setOutputDeviceUIDs:v12];
    v9[2](v9, v10);
  }
  else
  {
    uint64_t v11 = [(MPCAssistantRemoteControlDestination *)self copy];
    v9[2](v9, (void *)v11);

    uint64_t v9 = (void (**)(id, void *))v11;
  }
}

- (void)resolveWithQueue:(id)a3 routeIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6
{
}

- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 audioRoutingInfo:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if ([v13 count])
  {
    id v15 = (void *)[(MPCAssistantRemoteControlDestination *)self mutableCopy];
    v16 = objc_alloc_init(MPCAssistantEncodings);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __131__MPCAssistantRemoteControlDestination_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion___block_invoke;
    v19[3] = &unk_2643C43D0;
    v20 = v16;
    id v21 = v15;
    id v22 = v14;
    id v17 = v15;
    id v18 = v16;
    [(MPCAssistantEncodings *)v18 decodeHashedRouteUIDs:v13 completion:v19];
  }
  else
  {
    [(MPCAssistantRemoteControlDestination *)self resolveWithQueue:v12 routeIdentifiers:0 localPlaybackPermitted:v9 audioRoutingInfo:*(unsigned int *)&a6 completion:v14];
  }
}

void __131__MPCAssistantRemoteControlDestination_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = *(id *)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 allKeys];
  [*(id *)(a1 + 40) setOutputDeviceUIDs:v5];

  id v6 = [v4 allValues];

  [*(id *)(a1 + 40) setHashedOutputDeviceUIDs:v6];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)resolveWithQueue:(id)a3 hashedRouteIdentifiers:(id)a4 localPlaybackPermitted:(BOOL)a5 completion:(id)a6
{
}

- (void)resolveWithRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
}

- (void)resolveWithRouteIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)resolveWithHashedRouteIdentifiers:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
}

- (void)resolveWithHashedRouteIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)createPlayerPath
{
  if (self->_appBundleID) {
    id v3 = (const void *)MRNowPlayingClientCreate();
  }
  else {
    id v3 = 0;
  }
  if (self->_playerID) {
    id v4 = (const void *)MRNowPlayingPlayerCreate();
  }
  else {
    id v4 = 0;
  }
  int v5 = (void *)MRNowPlayingPlayerPathCreate();
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p ", v5, self];

  if ([(NSArray *)self->_outputDeviceUIDs count]) {
    [v6 appendFormat:@"outputDeviceUIDs=%@ ", self->_outputDeviceUIDs];
  }
  if ([(NSArray *)self->_outputGroups count]) {
    [v6 appendFormat:@"outputGroups=%@ ", self->_outputGroups];
  }
  if (self->_outputGroupID) {
    [v6 appendFormat:@"outputGroupID=%@ ", self->_outputGroupID];
  }
  if (self->_origin) {
    objc_msgSend(v6, "appendFormat:", @"origin=%d ", MROriginGetUniqueIdentifier());
  }
  if (self->_originatingOutputDeviceUID) {
    [v6 appendFormat:@"originatingOutputDeviceUID=%@", self->_originatingOutputDeviceUID];
  }
  if (self->_appBundleID) {
    [v6 appendFormat:@"bundleID=%@ ", self->_appBundleID];
  }
  if (self->_playerID) {
    [v6 appendFormat:@"playerID=%@ ", self->_playerID];
  }
  if (self->_isCompanion) {
    [v6 appendFormat:@"isCompanion=%@ ", @"YES"];
  }
  id v7 = @"NO";
  if (self->_singleGroup) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_originatingDeviceControl) {
    id v7 = @"YES";
  }
  [v6 appendFormat:@"SG=%@ ODC=%@>", v8, v7];

  return v6;
}

- (void)dealloc
{
  origin = self->_origin;
  if (origin) {
    CFRelease(origin);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCAssistantRemoteControlDestination;
  [(MPCAssistantRemoteControlDestination *)&v4 dealloc];
}

- (MPCAssistantRemoteControlDestination)init
{
  return [(MPCAssistantRemoteControlDestination *)self initWithAppBundleID:0 playerID:0 origin:0];
}

- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3
{
  return [(MPCAssistantRemoteControlDestination *)self initWithAppBundleID:a3 playerID:0 origin:0];
}

- (MPCAssistantRemoteControlDestination)initWithAppBundleID:(id)a3 playerID:(id)a4 origin:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCAssistantRemoteControlDestination;
  __int16 v10 = [(MPCAssistantRemoteControlDestination *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    appBundleID = v10->_appBundleID;
    v10->_appBundleID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    playerID = v10->_playerID;
    v10->_playerID = (NSString *)v13;

    if (a5) {
      id v15 = (void *)CFRetain(a5);
    }
    else {
      id v15 = 0;
    }
    v10->_origin = v15;
  }

  return v10;
}

@end