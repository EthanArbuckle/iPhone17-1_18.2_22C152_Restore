@interface MPCPlayerPath
+ (BOOL)supportsSecureCoding;
+ (MPCPlayerPath)pathWithCustomOrigin:(void *)a3 bundleID:(id)a4 playerID:(id)a5;
+ (MPCPlayerPath)pathWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6;
+ (MPCPlayerPath)pathWithDeviceUIDs:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6;
+ (MPCPlayerPath)pathWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5;
+ (MPCPlayerPath)pathWithRoute:(id)a3 mediaRemotePlayerPath:(void *)a4 isResolved:(BOOL)a5;
+ (id)deviceActivePlayerPath;
+ (id)systemMusicPathWithRoute:(id)a3 playerID:(id)a4;
+ (id)systemPodcastsPathWithRoute:(id)a3 playerID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullyResolved;
- (BOOL)isInProcess;
- (BOOL)isLocal;
- (BOOL)isLocalDevice;
- (BOOL)isNativeBooksPath;
- (BOOL)isNativeMusicPath;
- (BOOL)isNativePodcastsPath;
- (BOOL)isResolved;
- (BOOL)isSystemMusicPath;
- (MPAVRoute)route;
- (MPCPlayerPath)initWithCoder:(id)a3;
- (MPCPlayerPath)initWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6;
- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6;
- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5;
- (MRPlayerPath)mrPlayerPath;
- (NSString)bundleID;
- (NSString)deviceUID;
- (NSString)playerID;
- (NSString)representedBundleDisplayName;
- (NSString)representedBundleID;
- (id)description;
- (id)pathByAppendingPlayerIDSuffix:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getPlaybackIntentDestinationWithCompletion:(id)a3;
- (void)mediaRemotePlayerPath;
- (void)origin;
- (void)resolveWithCompletion:(id)a3;
- (void)resolveWithRouteResolvedHandler:(id)a3 completion:(id)a4;
@end

@implementation MPCPlayerPath

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@:", objc_opt_class()];
  v4 = v3;
  route = self->_route;
  BOOL v6 = route != 0;
  if (route) {
    [v3 appendFormat:@" route=%@", self->_route];
  }
  if (self->_deviceUID)
  {
    [v4 appendFormat:@" deviceUID=%@", self->_deviceUID];
    BOOL v6 = 1;
  }
  if (!self->_mediaRemotePlayerPath)
  {
    bundleID = self->_bundleID;
    if (!bundleID) {
      goto LABEL_20;
    }
    v12 = bundleID;
    if ([(NSString *)v12 isEqualToString:*MEMORY[0x263F54E28]])
    {
      v14 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();

      v12 = [v14 stringByAppendingString:@" [system media app]"];
    }
    [v4 appendFormat:@" bundleID=%@", v12];
    goto LABEL_19;
  }
  if (MRNowPlayingPlayerPathGetOrigin())
  {
    uint64_t DisplayName = MROriginGetDisplayName();
    [v4 appendFormat:@" origin[MR]=%@-%d", DisplayName, MROriginGetUniqueIdentifier()];
    BOOL v6 = 1;
  }
  if (MRNowPlayingPlayerPathGetClient())
  {
    v8 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy();
    v9 = [v8 componentsJoinedByString:@"/"];
    [v4 appendFormat:@" bundleID[MR]=%@", v9];

    if (MRNowPlayingClientGetProcessIdentifier())
    {
      v10 = [NSNumber numberWithInt:self->_pid];
      [v4 appendFormat:@" pid[MR]=%@", v10];
    }
    BOOL v6 = 1;
  }
  if (MRNowPlayingPlayerPathGetPlayer())
  {
    uint64_t v11 = MRNowPlayingPlayerGetIdentifier();
    v12 = (NSString *)v11;
    if (v11) {
      [v4 appendFormat:@" playerID[MR]=%@", v11];
    }
LABEL_19:

    BOOL v6 = 1;
  }
LABEL_20:
  if (self->_pid)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInt:");
    [v4 appendFormat:@" pid=%@", v15];
  }
  if (self->_playerID)
  {
    [v4 appendFormat:@" playerID=%@", self->_playerID];
  }
  else if (!v6)
  {
    [v4 appendString:@" local active"];
  }
  [v4 appendString:@">"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_playerID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)systemMusicPathWithRoute:(id)a3 playerID:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F12178];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 standardUserDefaults];
  int v10 = [v9 sonicHijack];

  id v11 = objc_alloc((Class)a1);
  if (v10) {
    v12 = @"com.apple.Sonic";
  }
  else {
    v12 = (__CFString *)*MEMORY[0x263F54E28];
  }
  v13 = (void *)[v11 initWithRoute:v8 bundleID:v12 playerID:v7];

  return v13;
}

- (void)resolveWithRouteResolvedHandler:(id)a3 completion:(id)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(MPCPlayerPath *)self isResolved])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke;
    aBlock[3] = &unk_2643C43F8;
    aBlock[4] = self;
    id v8 = v6;
    id v46 = v8;
    id v9 = v7;
    id v47 = v9;
    int v10 = _Block_copy(aBlock);
    uint64_t Origin = MRNowPlayingPlayerPathGetOrigin();
    if (Origin && !MROriginIsLocalOrigin()
      || self->_deviceUID
      || ([(MPCPlayerPath *)self route], (id v24 = (id)objc_claimAutoreleasedReturnValue()) != 0)
      && (v25 = v24, int v26 = [v24 isDeviceRoute], v25, v25, !v26))
    {
      if (self->_deviceUID)
      {
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_3;
        v42[3] = &unk_2643C1D38;
        v42[4] = self;
        id v43 = v9;
        id v44 = v8;
        v12 = (void (**)(void *, void *, void))_Block_copy(v42);
        deviceUID = self->_deviceUID;
        v14 = [MEMORY[0x263F54898] localDeviceUID];
        LODWORD(deviceUID) = [(NSString *)deviceUID isEqualToString:v14];

        if (deviceUID)
        {
          v15 = [MEMORY[0x263F54890] sharedLocalEndpoint];
          v51[0] = v15;
          v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
          v12[2](v12, v16, 0);
        }
        else
        {
          v15 = objc_opt_new();
          v50 = self->_deviceUID;
          v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
          [v15 discoverRemoteControlEndpointsMatchingUIDs:v16 completion:v12];
        }

        v28 = v43;
      }
      else
      {
        v17 = [(MPCPlayerPath *)self route];

        if (v17)
        {
          v18 = [(MPCPlayerPath *)self route];
          v19 = [v18 connection];

          if (v19)
          {
            v20 = [(MPCPlayerPath *)self route];
            v21 = [v20 connection];

            [v21 reset];
            uint64_t v48 = *MEMORY[0x263F11188];
            v49 = @"MPCPlayerPath";
            v22 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_6;
            v32[3] = &unk_2643C1D88;
            id v33 = v21;
            id v34 = v10;
            id v35 = v9;
            id v23 = v21;
            [v23 connectWithUserInfo:v22 completion:v32];
          }
          else
          {
            v29 = (void *)MEMORY[0x263F087E8];
            v22 = [(MPCPlayerPath *)self route];
            v30 = objc_msgSend(v29, "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"%@ did not have connection", v22);
            (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v30);
          }
          goto LABEL_23;
        }
        if (Origin)
        {
          (*((void (**)(void *, uint64_t))v10 + 2))(v10, Origin);
          goto LABEL_23;
        }
        v31 = dispatch_get_global_queue(21, 0);
        uint64_t v36 = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        v38 = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_5;
        v39 = &unk_2643C1D60;
        id v40 = v10;
        id v41 = v9;
        MRMediaRemoteGetActiveOrigin();

        v28 = v40;
      }
    }
    else
    {
      Localuint64_t Origin = MRMediaRemoteGetLocalOrigin();
      (*((void (**)(void *, uint64_t))v10 + 2))(v10, LocalOrigin);
    }
LABEL_23:

    goto LABEL_24;
  }
  (*((void (**)(id, MPCPlayerPath *, void))v7 + 2))(v7, self, 0);
LABEL_24:
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bundleID];
  v3 = [*(id *)(a1 + 32) playerID];
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
  id v5 = v2;
  id v6 = v3;
  id v7 = v6;
  if (v5)
  {
    if (!v4)
    {
      if (MROriginIsLocalOrigin())
      {
        id v8 = [MEMORY[0x263F086E0] mainBundle];
        id v9 = [v8 bundleIdentifier];
        int v10 = [v5 isEqualToString:v9];

        if (v10)
        {
          id v11 = [MEMORY[0x263F08AB0] processInfo];
          [v11 processIdentifier];
        }
      }
    }
    v12 = (const void *)MRNowPlayingClientCreate();
    if (v7) {
      goto LABEL_9;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_9:
  v13 = (const void *)MRNowPlayingPlayerCreate();
LABEL_10:
  uint64_t v14 = MRNowPlayingPlayerPathCreate();
  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    CFRelease(v13);
  }

  if (*(void *)(a1 + 40))
  {
    v15 = +[MPCPlayerPath pathWithRoute:*(void *)(*(void *)(a1 + 32) + 40) mediaRemotePlayerPath:v14 isResolved:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v16 = dispatch_get_global_queue(21, 0);
  id v17 = *(id *)(a1 + 48);
  MRMediaRemoteNowPlayingResolvePlayerPath();
}

- (void)dealloc
{
  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath) {
    CFRelease(mediaRemotePlayerPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCPlayerPath;
  [(MPCPlayerPath *)&v4 dealloc];
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    goto LABEL_2;
  }
  if (!MRNowPlayingPlayerPathGetOrigin())
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"resolved player path %@ did not have an origin. (unresolved player path %@)", a2, a1[6]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_2:
    id v6 = v5;
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  uint64_t v7 = +[MPCPlayerPath pathWithRoute:*(void *)(a1[4] + 40) mediaRemotePlayerPath:a2 isResolved:1];
  id v6 = 0;
LABEL_5:
  id v9 = (id)v7;
  (*(void (**)(void))(a1[5] + 16))();
  id v8 = (const void *)a1[6];
  if (v8) {
    CFRelease(v8);
  }
}

+ (MPCPlayerPath)pathWithRoute:(id)a3 mediaRemotePlayerPath:(void *)a4 isResolved:(BOOL)a5
{
  id v7 = a3;
  MRNowPlayingPlayerPathGetClient();
  id v8 = MRNowPlayingClientGetBundleIdentifier();
  MRNowPlayingPlayerPathGetPlayer();
  id v9 = MRNowPlayingPlayerGetIdentifier();
  uint64_t v10 = [a1 pathWithRoute:v7 bundleID:v8 playerID:v9];

  *(void *)(v10 + 32) = MRNowPlayingPlayerPathCopy();
  *(_DWORD *)(v10 + 8) = MRNowPlayingClientGetProcessIdentifier();
  *(unsigned char *)(v10 + 12) = a5;

  return (MPCPlayerPath *)(id)v10;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

+ (MPCPlayerPath)pathWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithRoute:v10 bundleID:v9 playerID:v8];

  return (MPCPlayerPath *)v11;
}

+ (id)deviceActivePlayerPath
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRoute:0 bundleID:0 playerID:0];

  return v2;
}

- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 playerID:(id)a5
{
  return [(MPCPlayerPath *)self initWithRoute:a3 bundleID:a4 pid:0 playerID:a5];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (MPCPlayerPath *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      route = self->_route;
      id v7 = [(MPCPlayerPath *)v5 route];
      if (route == v7) {
        int v8 = 0;
      }
      else {
        int v8 = [(MPAVRoute *)route isEqual:v7] ^ 1;
      }

      bundleID = self->_bundleID;
      id v11 = [(MPCPlayerPath *)v5 bundleID];
      if (bundleID == v11) {
        int v12 = 0;
      }
      else {
        int v12 = [(NSString *)bundleID isEqual:v11] ^ 1;
      }

      int pid = self->_pid;
      int v14 = v5->_pid;
      playerID = self->_playerID;
      v16 = [(MPCPlayerPath *)v5 playerID];
      if (playerID == v16) {
        int v17 = 0;
      }
      else {
        int v17 = [(NSString *)playerID isEqual:v16] ^ 1;
      }

      if (self->_mediaRemotePlayerPath == v5->_mediaRemotePlayerPath)
      {
        BOOL v18 = 1;
      }
      else
      {
        MRNowPlayingPlayerPathGetOrigin();
        MRNowPlayingPlayerPathGetOrigin();
        BOOL v18 = MROriginEqualToOrigin() != 0;
      }
      deviceUID = v5->_deviceUID;
      v20 = self->_deviceUID;
      v21 = v20;
      if (v20 == deviceUID) {
        char v22 = 1;
      }
      else {
        char v22 = [(NSString *)v20 isEqual:deviceUID];
      }

      int v23 = v8 | v12;
      if (pid != v14) {
        int v23 = 1;
      }
      if ((v23 | v17)) {
        char v9 = 0;
      }
      else {
        char v9 = v18 & v22;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isSystemMusicPath
{
  v2 = [(MPCPlayerPath *)self representedBundleID];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F54E28]];
  char IsSystemMediaApplication = v3;
  if (v2 && (v3 & 1) == 0) {
    char IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();
  }

  return IsSystemMediaApplication;
}

- (NSString)representedBundleID
{
  char v3 = self->_bundleID;
  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    objc_super v4 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy();
    id v5 = MRNowPlayingClientGetParentAppBundleIdentifier();
    if ([v4 count])
    {
      id v6 = [v4 lastObject];
    }
    else
    {
      if (![v5 length])
      {
LABEL_7:

        goto LABEL_8;
      }
      id v6 = v5;
    }
    id v7 = v6;

    char v3 = v7;
    goto LABEL_7;
  }
LABEL_8:

  return v3;
}

- (BOOL)isLocal
{
  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath) {
    LOBYTE(mediaRemotePlayerPath) = MRNowPlayingPlayerPathIsLocal();
  }
  return (char)mediaRemotePlayerPath;
}

- (MPCPlayerPath)initWithRoute:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"MPCPlayerPath.m", 85, @"Unsupported route type %@", objc_opt_class() object file lineNumber description];
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)MPCPlayerPath;
  v15 = [(MPCPlayerPath *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_route, a3);
    uint64_t v17 = [v13 copy];
    bundleID = v16->_bundleID;
    v16->_bundleID = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    playerID = v16->_playerID;
    v16->_playerID = (NSString *)v19;

    v16->_int pid = a5;
  }

  return v16;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)mediaRemotePlayerPath
{
  return self->_mediaRemotePlayerPath;
}

- (BOOL)isInProcess
{
  if (!self->_mediaRemotePlayerPath) {
    return 0;
  }
  MRNowPlayingPlayerPathGetClient();
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  id v4 = (id)MRNowPlayingClientGetBundleIdentifier();
  if (v3 == v4)
  {
  }
  else
  {
    id v5 = v4;
    char v6 = [v3 isEqual:v4];

    if ((v6 & 1) == 0) {
      return 0;
    }
  }

  return MRNowPlayingPlayerPathIsLocal();
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = [(MPAVRoute *)self->_route hash];
  uint64_t v10 = v5 ^ 0x7465646279746573 ^ v9;
  uint64_t v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v12 = v8 + v10;
  uint64_t v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  uint64_t v14 = v13 + __ROR8__(v6 + v7, 32);
  uint64_t v85 = __ROR8__(v12 + v11, 32);
  uint64_t v90 = v14 ^ __ROR8__(v13, 43);
  uint64_t v15 = v14 ^ v9;
  uint64_t v80 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_bundleID;
  uint64_t v17 = [(NSString *)v16 hash];
  uint64_t v18 = (v15 + v80) ^ __ROR8__(v80, 51);
  uint64_t v19 = v85 + (v90 ^ v17);
  uint64_t v20 = __ROR8__(v90 ^ v17, 48);
  uint64_t v21 = (v19 ^ v20) + __ROR8__(v15 + v80, 32);
  uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  uint64_t v23 = v19 + v18;
  uint64_t v86 = __ROR8__(v23, 32);
  uint64_t v91 = v22;
  uint64_t v76 = v21 ^ v17;
  uint64_t v81 = v23 ^ __ROR8__(v18, 47);

  uint64_t pid = self->_pid;
  uint64_t v25 = (v76 + v81) ^ __ROR8__(v81, 51);
  uint64_t v26 = v86 + (v91 ^ pid);
  uint64_t v27 = __ROR8__(v91 ^ pid, 48);
  uint64_t v28 = (v26 ^ v27) + __ROR8__(v76 + v81, 32);
  uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  uint64_t v30 = v26 + v25;
  uint64_t v87 = __ROR8__(v30, 32);
  uint64_t v92 = v29;
  uint64_t v77 = v28 ^ pid;
  uint64_t v82 = v30 ^ __ROR8__(v25, 47);
  v31 = self->_playerID;
  uint64_t v32 = [(NSString *)v31 hash];
  uint64_t v33 = (v77 + v82) ^ __ROR8__(v82, 51);
  uint64_t v34 = v87 + (v92 ^ v32);
  uint64_t v35 = __ROR8__(v92 ^ v32, 48);
  uint64_t v36 = (v34 ^ v35) + __ROR8__(v77 + v82, 32);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  uint64_t v38 = v34 + v33;
  uint64_t v88 = __ROR8__(v38, 32);
  uint64_t v93 = v37;
  uint64_t v78 = v36 ^ v32;
  uint64_t v83 = v38 ^ __ROR8__(v33, 47);

  v39 = self->_deviceUID;
  uint64_t v40 = [(NSString *)v39 hash];
  uint64_t v41 = (v78 + v83) ^ __ROR8__(v83, 51);
  uint64_t v42 = v88 + (v93 ^ v40);
  uint64_t v43 = __ROR8__(v93 ^ v40, 48);
  uint64_t v44 = (v42 ^ v43) + __ROR8__(v78 + v83, 32);
  uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  uint64_t v46 = v42 + v41;
  uint64_t v89 = __ROR8__(v46, 32);
  uint64_t v94 = v45;
  uint64_t v79 = v44 ^ v40;
  uint64_t v84 = v46 ^ __ROR8__(v41, 47);

  uint64_t v47 = (v79 + v84) ^ __ROR8__(v84, 51);
  uint64_t v48 = v89 + (v94 ^ 0x2800000000000000);
  uint64_t v49 = __ROR8__(v94 ^ 0x2800000000000000, 48);
  uint64_t v50 = (v48 ^ v49) + __ROR8__(v79 + v84, 32);
  uint64_t v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
  uint64_t v52 = v48 + v47;
  uint64_t v53 = v52 ^ __ROR8__(v47, 47);
  uint64_t v54 = (v50 ^ 0x2800000000000000) + v53;
  uint64_t v55 = v54 ^ __ROR8__(v53, 51);
  uint64_t v56 = (__ROR8__(v52, 32) ^ 0xFFLL) + v51;
  uint64_t v57 = __ROR8__(v51, 48);
  uint64_t v58 = __ROR8__(v54, 32) + (v56 ^ v57);
  uint64_t v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
  uint64_t v60 = v55 + v56;
  uint64_t v61 = v60 ^ __ROR8__(v55, 47);
  uint64_t v62 = v61 + v58;
  uint64_t v63 = v62 ^ __ROR8__(v61, 51);
  uint64_t v64 = __ROR8__(v60, 32) + v59;
  uint64_t v65 = __ROR8__(v59, 48);
  uint64_t v66 = __ROR8__(v62, 32) + (v64 ^ v65);
  uint64_t v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
  uint64_t v68 = v63 + v64;
  uint64_t v69 = v68 ^ __ROR8__(v63, 47);
  uint64_t v70 = v69 + v66;
  uint64_t v71 = v70 ^ __ROR8__(v69, 51);
  uint64_t v72 = __ROR8__(v68, 32) + v67;
  uint64_t v73 = __ROR8__(v67, 48);
  uint64_t v74 = __ROR8__(v70, 32) + (v72 ^ v73);
  return (v71 + v72) ^ __ROR8__(v71, 47) ^ v74 ^ __ROR8__(v71 + v72, 32) ^ v74 ^ __ROR8__(v72 ^ v73, 43);
}

- (void)getPlaybackIntentDestinationWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __90__MPCPlayerPath_MPCPlaybackIntentDestination__getPlaybackIntentDestinationWithCompletion___block_invoke;
  v6[3] = &unk_2643C03A0;
  id v7 = v4;
  id v5 = v4;
  [(MPCPlayerPath *)self resolveWithCompletion:v6];
}

void __90__MPCPlayerPath_MPCPlaybackIntentDestination__getPlaybackIntentDestinationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (a3)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if ([v5 isInProcess])
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  [v7 isLocalDevice];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_6:
}

- (MRPlayerPath)mrPlayerPath
{
  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath) {
    id v3 = mediaRemotePlayerPath;
  }

  return (MRPlayerPath *)mediaRemotePlayerPath;
}

- (id)pathByAppendingPlayerIDSuffix:(id)a3
{
  if (self->_mediaRemotePlayerPath)
  {
    id v4 = a3;
    id v5 = (const void *)MRNowPlayingPlayerPathCopy();
    MRNowPlayingPlayerPathGetPlayer();
    uint64_t v6 = MRNowPlayingPlayerGetIdentifier();
    id v7 = [v6 stringByAppendingString:v4];

    MRNowPlayingPlayerSetIdentifier();
    uint64_t v8 = +[MPCPlayerPath pathWithRoute:self->_route mediaRemotePlayerPath:v5 isResolved:self->_resolved];
    CFRelease(v5);
  }
  else
  {
    playerID = self->_playerID;
    id v10 = a3;
    id v7 = [(NSString *)playerID stringByAppendingString:v10];

    uint64_t v8 = [[MPCPlayerPath alloc] initWithRoute:self->_route bundleID:self->_bundleID pid:self->_pid playerID:v7];
  }

  return v8;
}

- (void)origin
{
  return (void *)MRNowPlayingPlayerPathGetOrigin();
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];

    id v5 = (void *)[objc_alloc(MEMORY[0x263F11CF8]) initWithEndpoint:v4];
    uint64_t ExternalDevice = MRAVEndpointGetExternalDevice();
    if ((MRAVEndpointIsLocalEndpoint() & 1) != 0 || ExternalDevice)
    {
      if (ExternalDevice)
      {
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F11D20]) initWithExternalDevice:ExternalDevice];
        [v5 setConnection:v11];
      }
      uint64_t v12 = [[MPCPlayerPath alloc] initWithRoute:v5 bundleID:*(void *)(*(void *)(a1 + 32) + 16) pid:*(unsigned int *)(*(void *)(a1 + 32) + 8) playerID:*(void *)(*(void *)(a1 + 32) + 24)];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_4;
      v15[3] = &unk_2643C1D10;
      v16 = v12;
      uint64_t v13 = *(void *)(a1 + 48);
      id v17 = *(id *)(a1 + 40);
      uint64_t v14 = v12;
      [(MPCPlayerPath *)v14 resolveWithRouteResolvedHandler:v13 completion:v15];
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"Missing external device for endpoint %@.", v4);
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"Could not discover endpoint for device UID (%@).", *(void *)(*(void *)(a1 + 32) + 48));
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"Could not get active origin.");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    id v7 = v3;
LABEL_3:
    v4();

    return;
  }
  [*(id *)(a1 + 32) externalDevice];
  uint64_t v5 = MRExternalDeviceCopyCustomOrigin();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 5000, @"external device %@ did not have an origin. (connection %@, isConnected:%d isInvalidated:%d)", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "externalDevice"), objc_msgSend(*(id *)(a1 + 32), "isConnected"), objc_msgSend(*(id *)(a1 + 32), "isInvalidated"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  uint64_t v6 = (const void *)v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  CFRelease(v6);
}

void __60__MPCPlayerPath_resolveWithRouteResolvedHandler_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)resolveWithCompletion:(id)a3
{
}

- (BOOL)isNativeBooksPath
{
  return MEMORY[0x270F49E48](self->_bundleID, a2);
}

- (BOOL)isNativePodcastsPath
{
  return MRMediaRemoteApplicationIsSystemPodcastApplication();
}

- (BOOL)isNativeMusicPath
{
  return MRMediaRemoteApplicationIsSystemMediaApplication();
}

- (NSString)representedBundleDisplayName
{
  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    v2 = MRNowPlayingClientGetBundleIdentifier();
    id v3 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
    id v4 = [v3 localizedStringForKey:v2 value:&stru_26CBCA930 table:@"PlayerPathDisplayName"];

    if ([v4 isEqualToString:v2])
    {
      MRNowPlayingClientGetDisplayName();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = v4;
    }
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (void *)[v6 copy];

  return (NSString *)v7;
}

- (BOOL)isLocalDevice
{
  BOOL result = 0;
  if (self->_mediaRemotePlayerPath)
  {
    if (MRNowPlayingPlayerPathIsLocal()) {
      return 1;
    }
    MRNowPlayingPlayerPathGetOrigin();
    if (MROriginIsLocalOrigin()) {
      return 1;
    }
  }
  return result;
}

- (BOOL)isFullyResolved
{
  mediaRemotePlayerPath = self->_mediaRemotePlayerPath;
  if (mediaRemotePlayerPath) {
    LOBYTE(mediaRemotePlayerPath) = MRNowPlayingPlayerPathGetIsResolved();
  }
  return (char)mediaRemotePlayerPath;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_route forKey:@"route"];
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
  if (self->_mediaRemotePlayerPath)
  {
    MRNowPlayingPlayerPathGetClient();
    [v4 encodeInt32:MRNowPlayingClientGetProcessIdentifier() forKey:@"pid"];
  }
  [v4 encodeObject:self->_playerID forKey:@"playerID"];
}

- (MPCPlayerPath)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerID"];
  uint64_t v8 = [v4 decodeInt32ForKey:@"pid"];

  uint64_t v9 = [(MPCPlayerPath *)self initWithRoute:v5 bundleID:v6 pid:v8 playerID:v7];
  return v9;
}

- (MPCPlayerPath)initWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MPCPlayerPath;
  uint64_t v13 = [(MPCPlayerPath *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    deviceUID = v13->_deviceUID;
    v13->_deviceUID = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    playerID = v13->_playerID;
    v13->_playerID = (NSString *)v18;

    v13->_uint64_t pid = a5;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPCPlayerPath)pathWithCustomOrigin:(void *)a3 bundleID:(id)a4 playerID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (MROriginIsLocalOrigin())
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MPCPlayerPath.m", 68, @"%s is only for use with custom origins.", "+[MPCPlayerPath pathWithCustomOrigin:bundleID:playerID:]");
  }
  id v10 = (const void *)MRNowPlayingClientCreate();
  id v11 = (const void *)MRNowPlayingPlayerCreate();

  id v12 = (const void *)MRNowPlayingPlayerPathCreate();
  CFRelease(v11);
  CFRelease(v10);
  uint64_t v13 = [a1 pathWithRoute:0 mediaRemotePlayerPath:v12 isResolved:0];
  CFRelease(v12);

  return (MPCPlayerPath *)v13;
}

+ (MPCPlayerPath)pathWithDeviceUID:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithDeviceUID:v12 bundleID:v11 pid:v6 playerID:v10];

  return (MPCPlayerPath *)v13;
}

+ (MPCPlayerPath)pathWithDeviceUIDs:(id)a3 bundleID:(id)a4 pid:(int)a5 playerID:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  uint64_t v14 = [v12 firstObject];

  uint64_t v15 = (void *)[v13 initWithDeviceUID:v14 bundleID:v11 pid:v6 playerID:v10];

  return (MPCPlayerPath *)v15;
}

+ (id)systemPodcastsPathWithRoute:(id)a3 playerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = (void *)[v8 initWithRoute:v7 bundleID:*MEMORY[0x263F54E30] playerID:v6];

  return v9;
}

@end