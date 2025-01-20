@interface MTPlaybackIdentifierUtil
+ (id)__queryStringToQueryDictionary:(id)a3;
+ (id)__stringByRemovingPercentEscapes:(id)a3;
+ (id)__stringWithPercentEscape:(id)a3;
- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3;
- (BOOL)isSubscribeCommandURLString:(id)a3;
- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5;
- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4;
- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3;
- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3;
- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4;
- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3;
- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3;
- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4;
- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4;
- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7;
- (int64_t)_episodeContextFromString:(id)a3;
- (int64_t)_episodeContextSortFromString:(id)a3;
- (int64_t)_episodeOrderFromString:(id)a3;
- (unint64_t)_playQueueTypeForRequestURL:(id)a3;
- (unint64_t)_playReasonFromString:(id)a3;
@end

@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  v5 = objc_msgSend_URLWithString_(NSURL, a2, (uint64_t)a4, (uint64_t)a4, v4);
  v6 = objc_opt_class();
  v11 = objc_msgSend_query(v5, v7, v8, v9, v10);
  v15 = objc_msgSend___queryStringToQueryDictionary_(v6, v12, (uint64_t)v11, v13, v14);

  v16 = NSPersistentStringForMTPlayReason();
  objc_msgSend_setObject_forKey_(v15, v17, (uint64_t)v16, @"playReason", v18);

  id v19 = objc_alloc_init(MEMORY[0x263F08BA0]);
  v24 = objc_msgSend_scheme(v5, v20, v21, v22, v23);
  objc_msgSend_setScheme_(v19, v25, (uint64_t)v24, v26, v27);

  v32 = objc_msgSend_host(v5, v28, v29, v30, v31);
  objc_msgSend_setHost_(v19, v33, (uint64_t)v32, v34, v35);

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_222EC1238;
  v50[3] = &unk_26467B720;
  id v51 = v15;
  id v36 = v15;
  v40 = objc_msgSend_mt_compactMap_(v36, v37, (uint64_t)v50, v38, v39);
  objc_msgSend_setQueryItems_(v19, v41, (uint64_t)v40, v42, v43);

  v48 = objc_msgSend_string(v19, v44, v45, v46, v47);

  return v48;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v5 = a3;
  uint64_t v9 = objc_msgSend_URLWithString_(NSURL, v6, (uint64_t)a4, v7, v8);
  uint64_t v10 = objc_opt_class();
  v15 = objc_msgSend_query(v9, v11, v12, v13, v14);
  id v19 = objc_msgSend___queryStringToQueryDictionary_(v10, v16, (uint64_t)v15, v17, v18);

  v24 = objc_msgSend_stringValue(v5, v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v29 = objc_msgSend_stringValue(v5, v25, v26, v27, v28);
    objc_msgSend_setObject_forKey_(v19, v30, (uint64_t)v29, @"enqueuerDSID", v31);
  }
  id v32 = objc_alloc_init(MEMORY[0x263F08BA0]);
  v37 = objc_msgSend_scheme(v9, v33, v34, v35, v36);
  objc_msgSend_setScheme_(v32, v38, (uint64_t)v37, v39, v40);

  uint64_t v45 = objc_msgSend_host(v9, v41, v42, v43, v44);
  objc_msgSend_setHost_(v32, v46, (uint64_t)v45, v47, v48);

  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_222EC148C;
  v63[3] = &unk_26467B720;
  id v64 = v19;
  id v49 = v19;
  v53 = objc_msgSend_mt_compactMap_(v49, v50, (uint64_t)v63, v51, v52);
  objc_msgSend_setQueryItems_(v32, v54, (uint64_t)v53, v55, v56);

  v61 = objc_msgSend_string(v32, v57, v58, v59, v60);

  return v61;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  id v5 = objc_msgSend_URLWithString_(NSURL, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_host(v5, v6, v7, v8, v9);
  if (objc_msgSend_length(v10, v11, v12, v13, v14))
  {
    if (qword_267F95D68 != -1) {
      dispatch_once(&qword_267F95D68, &unk_26D5D5338);
    }
    char v18 = objc_msgSend_containsObject_((void *)qword_267F95D60, v15, (uint64_t)v10, v16, v17);
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  id v5 = objc_msgSend_URLWithString_(NSURL, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_host(v5, v6, v7, v8, v9);
  char isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"subscribe", v12, v13);

  return isEqualToString;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  id v5 = objc_msgSend_URLWithString_(NSURL, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_host(v5, v6, v7, v8, v9);
  char isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"playItem", v12, v13);

  return isEqualToString;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v5 = a3;
  if (!v5) {
    id v5 = (id)*MEMORY[0x263F659F8];
  }
  v6 = objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, v4, @"playPodcasts", @"playbackOrder", (uint64_t)v5);

  return v6;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return (id)objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, a2, @"playPodcast", @"storeTrackId", (uint64_t)a3);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_localPlaybackQueueIdentifierForPodcastUuid_episodeUuid_sampPlaybackOrder_, a3, 0, a4);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_length(v8, v11, v12, v13, v14) || objc_msgSend_length(v9, v15, v16, v17, v18))
  {
    id v19 = objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, v15, (uint64_t)v8, 0, 0, v9, 0, 0, v10);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, 0, (uint64_t)a3, a4, 0, a5, a6, a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, *MEMORY[0x263F659F8]);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, a6);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return (id)objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, 0, 0, a9);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return (id)objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a9, a10, *MEMORY[0x263F659F8]);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  if (!objc_msgSend_length(v20, v21, v22, v23, v24))
  {
    id v29 = (id)*MEMORY[0x263F659F8];

    id v20 = v29;
  }
  uint64_t v30 = objc_msgSend_length(v18, v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_length(v16, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v36, v37, v38, v39);
  objc_msgSend_setObject_forKey_(v40, v41, (uint64_t)v20, @"playbackOrder", v42);
  if (v35) {
    objc_msgSend_setObject_forKey_(v40, v43, (uint64_t)v16, @"uuid", v46);
  }
  if (v30) {
    objc_msgSend_setObject_forKey_(v40, v43, (uint64_t)v18, @"episodeUuid", v46);
  }
  if (objc_msgSend_length(v17, v43, v44, v45, v46))
  {
    uint64_t v51 = objc_opt_class();
    uint64_t v55 = objc_msgSend___stringWithPercentEscape_(v51, v52, (uint64_t)v17, v53, v54);
    objc_msgSend_setObject_forKey_(v40, v56, (uint64_t)v55, @"podcastFeedUrl", v57);
  }
  if (objc_msgSend_length(v19, v47, v48, v49, v50)) {
    objc_msgSend_setObject_forKey_(v40, v58, (uint64_t)v19, @"episodeGuid", v60);
  }
  uint64_t v61 = *MEMORY[0x263F5EBD0];
  if (a5 && v61 != a5)
  {
    v62 = objc_msgSend_stringWithFormat_(NSString, v58, @"%llu", v59, v60, a5);
    objc_msgSend_setObject_forKey_(v40, v63, (uint64_t)v62, @"storeCollectionId", v64);
  }
  if (a8 && v61 != a8)
  {
    v65 = objc_msgSend_stringWithFormat_(NSString, v58, @"%llu", v59, v60, a8);
    objc_msgSend_setObject_forKey_(v40, v66, (uint64_t)v65, @"storeTrackId", v67);
  }
  v68 = NSPersistentStringForMTEpisodeContext();
  objc_msgSend_setObject_forKey_(v40, v69, (uint64_t)v68, @"context", v70);

  v71 = NSPersistentStringForMTEpisodeContextSortType();
  objc_msgSend_setObject_forKey_(v40, v72, (uint64_t)v71, @"contextSortType", v73);

  v76 = objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v74, @"playPodcast", (uint64_t)v40, v75);

  return v76;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6) {
    id v6 = (id)*MEMORY[0x263F659F8];
  }
  v15[0] = @"storeCollectionId";
  v15[1] = @"playbackOrder";
  v16[0] = a3;
  v16[1] = v6;
  uint64_t v7 = NSDictionary;
  id v8 = a3;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v9, (uint64_t)v16, (uint64_t)v15, 2);
  uint64_t v13 = objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v11, @"playPodcast", (uint64_t)v10, v12);

  return v13;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return (id)objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, a2, @"subscribe", @"storeCollectionId", (uint64_t)a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v9 = objc_msgSend___stringWithPercentEscape_(v5, v6, (uint64_t)v4, v7, v8);

  v11 = objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, v10, @"subscribe", @"podcastFeedUrl", (uint64_t)v9);

  return v11;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return (id)((uint64_t (*)(MTPlaybackIdentifierUtil *, char *, id, void))MEMORY[0x270F9A6D0])(self, sel_localPlaybackQueueIdentifierForStationUuid_episodeUuid_, a3, 0);
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_universalPlaybackQueueIdentifierForStationUuid_episodeUuid_episodeGuid_episodeStoreId_podcastFeedUrl_, a3, a4, 0);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return (id)MEMORY[0x270F9A6D0](self, sel_universalPlaybackQueueIdentifierForStationUuid_episodeUuid_episodeGuid_episodeStoreId_podcastFeedUrl_, a3, 0, a4);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
  id v15 = a3;
  id v19 = objc_msgSend_dictionaryWithCapacity_(v14, v16, 5, v17, v18);
  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v15, @"uuid", v21);

  if (objc_msgSend_length(v11, v22, v23, v24, v25)) {
    objc_msgSend_setObject_forKey_(v19, v26, (uint64_t)v11, @"episodeUuid", v29);
  }
  if (objc_msgSend_length(v12, v26, v27, v28, v29)) {
    objc_msgSend_setObject_forKey_(v19, v30, (uint64_t)v12, @"episodeGuid", v33);
  }
  if (objc_msgSend_length(v13, v30, v31, v32, v33))
  {
    uint64_t v36 = objc_opt_class();
    uint64_t v40 = objc_msgSend___stringWithPercentEscape_(v36, v37, (uint64_t)v13, v38, v39);
    objc_msgSend_setObject_forKey_(v19, v41, (uint64_t)v40, @"podcastFeedUrl", v42);
  }
  uint64_t v43 = objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v34, @"playStation", (uint64_t)v19, v35);

  return v43;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_sharedInstance(MTAccountController, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_activeDsid(v9, v10, v11, v12, v13);
  uint64_t v17 = (_MRSystemAppPlaybackQueue *)objc_msgSend_playbackQueueWithDsid_forIdentifiers_(self, v15, (uint64_t)v14, (uint64_t)v4, v16);

  return v17;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (a3)
  {
    id v9 = a3;
    keys = @"enqueuerDSID";
    CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, MEMORY[0x263EFFF90]);
    MRSystemAppPlaybackQueueSetUserInfo();
    CFRelease(v7);
  }
  return v6;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3 = qword_267F95D70;
  id v8 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_267F95D70, &unk_26D5D5358);
  }
  id v9 = (void *)qword_267F95D78;
  id v10 = objc_msgSend_host(v8, v4, v5, v6, v7);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v10, v12, v13);
  id v15 = (void *)v14;
  uint64_t v16 = &unk_26D5D93D8;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  id v17 = v16;

  unint64_t v22 = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20, v21);
  return v22;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v18 = a4;
  v19[0] = a5;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v8, v12, (uint64_t)v19, (uint64_t)&v18, 1);

  uint64_t v16 = objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v14, (uint64_t)v11, (uint64_t)v13, v15);

  return v16;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
  objc_msgSend_setScheme_(v7, v8, @"podcasts", v9, v10);
  uint64_t v52 = v5;
  objc_msgSend_setHost_(v7, v11, (uint64_t)v5, v12, v13);
  uint64_t v14 = (void *)MEMORY[0x263EFF980];
  uint64_t v19 = objc_msgSend_count(v6, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_arrayWithCapacity_(v14, v20, v19, v21, v22);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v24 = v6;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        id v31 = objc_alloc(MEMORY[0x263F08BD0]);
        uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v24, v32, v30, v33, v34);
        uint64_t v38 = objc_msgSend_initWithName_value_(v31, v36, v30, (uint64_t)v35, v37);

        objc_msgSend_addObject_(v23, v39, (uint64_t)v38, v40, v41);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v42, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v27);
  }

  objc_msgSend_setQueryItems_(v7, v43, (uint64_t)v23, v44, v45);
  uint64_t v50 = objc_msgSend_string(v7, v46, v47, v48, v49);

  return v50;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, *MEMORY[0x263F65A00], v5, v6))
  {
    int64_t v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, *MEMORY[0x263F65A08], v8, v9))
  {
    int64_t v10 = 2;
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7)) {
    unint64_t v8 = MTPlayReasonFromPersistentString();
  }
  else {
    unint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7)) {
    int64_t v8 = MTEpisodeContextFromPersistentString();
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7)) {
    int64_t v8 = MTEpisodeContextSortTypeFromPersistentString();
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  id v3 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)a3, 0, @"\uFFFC!$&'()+,/:;=?@",
                       0x8000100u);

  return v3;
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  id v3 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a3, &stru_26D5D5698);

  return v3;
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_componentsSeparatedByString_(a3, a2, @"&", v3, v4);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v35 + 1) + 8 * i), v9, @"=", v10, v11);
        uint64_t v19 = objc_msgSend_objectAtIndex_(v15, v16, 0, v17, v18);
        id v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v20, v21, v22, v23);
        if ((unint64_t)objc_msgSend_count(v15, v25, v26, v27, v28) >= 2)
        {
          uint64_t v32 = objc_msgSend_objectAtIndex_(v15, v29, 1, v30, v31);

          id v24 = (void *)v32;
        }
        objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v24, (uint64_t)v19, v31);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v12);
  }

  return v6;
}

@end