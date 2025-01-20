@interface POUtilities
+ (BOOL)assistantErrorIsInformational:(id)a3;
+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3;
+ (BOOL)errorIsMaxStreamCount:(id)a3;
+ (BOOL)errorIsNoNetwork:(id)a3;
+ (BOOL)isPodcastsNowPlaying;
+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7;
+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5;
+ (id)identifierFromDomainObject:(id)a3;
+ (id)typeFromDomainObject:(id)a3;
+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9;
+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10;
+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5;
@end

@implementation POUtilities

+ (id)identifierFromDomainObject:(id)a3
{
  v5 = objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4);
  v10 = objc_msgSend_lastPathComponent(v5, v6, v7, v8, v9);

  return v10;
}

+ (id)typeFromDomainObject:(id)a3
{
  v5 = objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4);
  v10 = objc_msgSend_host(v5, v6, v7, v8, v9);

  return v10;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10
{
  char v10 = 1;
  objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, v10, a10);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11
{
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12
{
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13
{
  BOOL v93 = a8;
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v95 = a4;
  id v18 = a5;
  id v19 = a6;
  id v94 = a7;
  id v20 = a9;
  id v96 = a10;
  id v21 = a11;
  v22 = (void (**)(id, uint64_t, void *))a13;
  if (!objc_msgSend_length(v17, v23, v24, v25, v26))
  {
    v68 = v20;
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v71 = POLogContextCommand;
    }
    else {
      v71 = &_os_log_internal;
    }
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_222ECA97C(v71, (uint64_t)v72, v73, v74, v75, v76, v77, v78);
    }
    v79 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v72, @"POUtilitiesErrorDomain", 102, 0);
    v22[2](v22, 2, v79);

    v35 = v19;
    v65 = v94;
    goto LABEL_15;
  }
  v35 = v19;
  if (!objc_msgSend_count(v18, v27, v28, v29, v30)
    && (!objc_msgSend_count(v19, v31, v32, v33, v34) || !objc_msgSend_length(v94, v80, v81, v82, v83)))
  {
    v84 = objc_msgSend_sharedInstance(PODataSource, v80, v81, v82, v83);
    char isPodcastsInstalled = objc_msgSend_isPodcastsInstalled(v84, v85, v86, v87, v88);

    if ((isPodcastsInstalled & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v90, @"POUtilitiesErrorDomain", 103, 0);
      v91 = v68 = v20;
      v22[2](v22, 2, v91);

      v65 = v94;
LABEL_15:
      v66 = v96;
      goto LABEL_16;
    }
  }
  v36 = v20;
  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v37 = POLogContextCommand;
  }
  else {
    v37 = &_os_log_internal;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v37;
    objc_msgSend_componentsJoinedByString_(v18, v41, @", ", v42, v43);
    v45 = id v44 = v18;
    v49 = objc_msgSend_componentsJoinedByString_(v19, v46, @", ", v47, v48);
    *(_DWORD *)buf = 138413058;
    id v114 = v17;
    __int16 v115 = 2112;
    v116 = v45;
    __int16 v117 = 2112;
    v118 = v49;
    __int16 v119 = 2112;
    id v120 = v94;
    v35 = v19;
    _os_log_impl(&dword_222EBF000, v40, OS_LOG_TYPE_DEFAULT, "Will be setting playbackQueue using MediaRemote to %@ with routeUIDs %@ decodedRouteUIDs %@ originatingOutputDeviceUID %@", buf, 0x2Au);

    id v18 = v44;
  }
  id v112 = v17;
  v50 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)&v112, 1, v39);
  uint64_t PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount = objc_msgSend_createPlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_(a1, v51, (uint64_t)v50, v93, (uint64_t)v95, v36, v96);

  v53 = [MTMPCAssistantGenericPlaybackQueue alloc];
  v56 = objc_msgSend_initWithContextID_playbackQueueRef_(v53, v54, (uint64_t)v21, PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount, v55);
  v61 = objc_msgSend_podcastsApplicationDestination(MEMORY[0x263F547A8], v57, v58, v59, v60);
  objc_msgSend_setSingleGroup_(v61, v62, 1, v63, v64);
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = sub_222EC34CC;
  v97[3] = &unk_26467B7D0;
  id v109 = a1;
  id v98 = v61;
  id v99 = v18;
  id v100 = v35;
  v65 = v94;
  id v101 = v94;
  v108 = v22;
  id v102 = v56;
  BOOL v110 = a12;
  id v103 = v17;
  BOOL v111 = v93;
  id v104 = v95;
  id v105 = v36;
  v66 = v96;
  id v106 = v96;
  id v107 = v21;
  id v67 = v56;
  v68 = v36;
  id v69 = v67;
  id v70 = v61;
  MPAssistantWatchGetCurrentAudioRoutingInfo((uint64_t)v97);

LABEL_16:
}

+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  id v27 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  if (objc_msgSend_length(v16, v18, v19, v20, v21)) {
    objc_msgSend_setOriginatingOutputDeviceUID_(v27, v22, (uint64_t)v16, v24, v25);
  }
  if (objc_msgSend_count(v15, v22, v23, v24, v25)) {
    objc_msgSend_resolveWithQueue_routeIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion_(v27, v26, 0, (uint64_t)v15, v10, *(unsigned int *)&a8, v17);
  }
  else {
    objc_msgSend_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion_(v27, v26, 0, (uint64_t)v14, v10, *(unsigned int *)&a8, v17);
  }
}

+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = qword_267F95D88;
  id v10 = a3;
  if (v9 != -1) {
    dispatch_once(&qword_267F95D88, &unk_26D5D5378);
  }
  v11 = (void *)qword_267F95D80;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_222EC3F5C;
  v16[3] = &unk_26467B820;
  id v17 = v7;
  id v18 = v8;
  id v12 = v7;
  id v13 = v8;
  objc_msgSend_modifySystemMusicContextForDestination_completion_(v11, v14, (uint64_t)v10, (uint64_t)v16, v15);
}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  id v18 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v15, 2, v16, v17);
  uint64_t v21 = v18;
  if (v10) {
    objc_msgSend_setObject_forKey_(v18, v19, (uint64_t)v10, @"requesterUserId", v20);
  }
  if (v11) {
    objc_msgSend_setObject_forKey_(v21, v19, (uint64_t)v11, @"sharedUserId", v20);
  }
  MRSystemAppPlaybackQueueSetUserInfo();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  return v14;
}

+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v12 = objc_msgSend_domain(v7, v8, v9, v10, v11);
  if (objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x263F54760], v14, v15))
  {
    uint64_t v20 = objc_msgSend_code(v7, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v21 = objc_msgSend_domain(v7, v16, v17, v18, v19);
    if (objc_msgSend_isEqualToString_(v21, v22, @"POUtilitiesMRSendCommandErrorDomain", v23, v24))uint64_t v20 = objc_msgSend_code(v7, v25, v26, v27, v28); {
    else
    }
      uint64_t v20 = 0;
  }
  uint64_t v33 = objc_msgSend_domain(v7, v29, v30, v31, v32);
  if (objc_msgSend_isEqualToString_(v33, v34, *MEMORY[0x263F54758], v35, v36)) {
    uint64_t v41 = objc_msgSend_code(v7, v37, v38, v39, v40);
  }
  else {
    uint64_t v41 = 0;
  }

  v46 = objc_msgSend_domain(v7, v42, v43, v44, v45);
  if (objc_msgSend_isEqualToString_(v46, v47, @"POUtilitiesErrorDomain", v48, v49)) {
    uint64_t v54 = objc_msgSend_code(v7, v50, v51, v52, v53);
  }
  else {
    uint64_t v54 = 0;
  }

  if (v20)
  {
    id v59 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v63 = objc_msgSend_stringWithFormat_(NSString, v60, @"MediaRemote error code %ld", v61, v62, v20);
    id v67 = objc_msgSend_initWithReason_(v59, v64, (uint64_t)v63, v65, v66);

    goto LABEL_48;
  }
  if ((int)a3 > 9)
  {
    if (a3 == 20)
    {
      v68 = (uint64_t *)MEMORY[0x263F65A38];
      goto LABEL_28;
    }
    if (a3 == 10)
    {
      v68 = (uint64_t *)MEMORY[0x263F659D8];
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  if (!a3)
  {
    uint64_t v69 = 0;
    goto LABEL_29;
  }
  if (a3 != 1)
  {
LABEL_23:
    if (v5) {
      uint64_t v69 = *MEMORY[0x263F65A30];
    }
    else {
      uint64_t v69 = -1;
    }
    goto LABEL_29;
  }
  if (v5)
  {
    v68 = (uint64_t *)MEMORY[0x263F65A18];
LABEL_28:
    uint64_t v69 = *v68;
    goto LABEL_29;
  }
  v79 = objc_msgSend_sharedInstance(PODataSource, v55, v56, v57, v58);
  v84 = objc_msgSend_podcastCollections(v79, v80, v81, v82, v83);
  uint64_t v89 = objc_msgSend_count(v84, v85, v86, v87, v88);
  v90 = (uint64_t *)MEMORY[0x263F659E8];
  if (!v89) {
    v90 = (uint64_t *)MEMORY[0x263F659F0];
  }
  uint64_t v69 = *v90;

LABEL_29:
  switch(v54)
  {
    case 'e':
      id v70 = (uint64_t *)MEMORY[0x263F65A10];
      goto LABEL_34;
    case 'g':
      id v70 = (uint64_t *)MEMORY[0x263F659E0];
      goto LABEL_34;
    case 'h':
      id v70 = (uint64_t *)MEMORY[0x263F659D0];
      goto LABEL_34;
    case 'i':
      id v70 = (uint64_t *)MEMORY[0x263F659C8];
LABEL_34:
      uint64_t v69 = *v70;
      break;
    default:
      break;
  }
  if (v69)
  {
    if (v41 != 1) {
      goto LABEL_43;
    }
    v71 = (uint64_t *)MEMORY[0x263F659C8];
  }
  else if (v41 == 6)
  {
    v71 = (uint64_t *)MEMORY[0x263F65A20];
  }
  else
  {
    if (v41 != 7)
    {
LABEL_45:
      v72 = (objc_class *)MEMORY[0x263F64830];
      goto LABEL_46;
    }
    v71 = (uint64_t *)MEMORY[0x263F65A28];
  }
  uint64_t v69 = *v71;
  if (!*v71) {
    goto LABEL_45;
  }
LABEL_43:
  v72 = (objc_class *)MEMORY[0x263F64820];
  if (v69 == -1)
  {
LABEL_46:
    id v77 = objc_alloc_init(v72);
    goto LABEL_47;
  }
  id v73 = objc_alloc(MEMORY[0x263F64820]);
  id v77 = (id)objc_msgSend_initWithErrorCode_(v73, v74, v69, v75, v76);
LABEL_47:
  id v67 = v77;
LABEL_48:

  return v67;
}

+ (BOOL)isPodcastsNowPlaying
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_222EC47B8;
  uint64_t v14 = sub_222EC47C8;
  id v15 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = v2;
  MRMediaRemoteGetNowPlayingClient();

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = objc_msgSend_isEqual_((void *)v11[5], v4, @"com.apple.podcasts", v5, v6, v8, 3221225472, sub_222EC47D0, &unk_26467B848);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a5;
  v20[0] = *MEMORY[0x263F54D20];
  *(float *)&double v7 = a3;
  uint64_t v12 = objc_msgSend_numberWithFloat_(NSNumber, v8, v9, v10, v11, v7);
  v20[1] = *MEMORY[0x263F54CC0];
  v21[0] = v12;
  v21[1] = MEMORY[0x263EFFA88];
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v21, (uint64_t)v20, 2);

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    id v15 = POLogContextCommand;
  }
  else {
    id v15 = &_os_log_internal;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v19 = a3;
    _os_log_impl(&dword_222EBF000, v15, OS_LOG_TYPE_INFO, "Will be setting currentPlaybackRate using MediaRemote to %f", buf, 0xCu);
  }
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  id v17 = v6;
  MRMediaRemoteSendCommandWithReply();
}

+ (BOOL)assistantErrorIsInformational:(id)a3
{
  return 0;
}

+ (BOOL)errorIsMaxStreamCount:(id)a3
{
  return 0;
}

+ (BOOL)errorIsNoNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_domain(v3, v4, v5, v6, v7);
  if (objc_msgSend_isEqualToString_(v8, v9, @"MTSetPlaybackQueueUtilErrorDomain", v10, v11))BOOL v16 = objc_msgSend_code(v3, v12, v13, v14, v15) == -433001; {
  else
  }
    BOOL v16 = 0;

  return v16;
}

+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_domain(v3, v4, v5, v6, v7);
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x263F54760], v10, v11)) {
    BOOL v16 = objc_msgSend_code(v3, v12, v13, v14, v15) == 15;
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

@end