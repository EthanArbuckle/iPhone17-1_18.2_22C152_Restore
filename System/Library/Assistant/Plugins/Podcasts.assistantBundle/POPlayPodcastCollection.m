@interface POPlayPodcastCollection
- (id)_playbackQueueIdentifiers:(BOOL *)a3 queueStatus:(unint64_t *)a4;
- (id)_validate;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation POPlayPodcastCollection

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  char v51 = 0;
  uint64_t v50 = 0;
  v8 = objc_msgSend__playbackQueueIdentifiers_queueStatus_(self, v6, (uint64_t)&v51, (uint64_t)&v50, v7);
  v13 = objc_msgSend__validate(self, v9, v10, v11, v12);
  v18 = v13;
  if (v13)
  {
    v19 = objc_msgSend_dictionary(v13, v14, v15, v16, v17);
    v5[2](v5, v19);
  }
  else
  {
    v20 = objc_msgSend_assetInfo(self, v14, v15, v16, v17);
    v25 = objc_msgSend_hashedRouteUIDs(self, v21, v22, v23, v24);
    uint64_t started = objc_msgSend_startPlaying(self, v26, v27, v28, v29);
    v35 = objc_msgSend_requesterSharedUserId(self, v31, v32, v33, v34);
    v40 = objc_msgSend_sharedUserIdFromPlayableITunesAccount(self, v36, v37, v38, v39);
    v45 = objc_msgSend_refId(self, v41, v42, v43, v44);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = sub_222EC93E4;
    v47[3] = &unk_26467BA38;
    char v49 = v51;
    v48 = v5;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_completion_(POUtilities, v46, (uint64_t)v8, (uint64_t)v20, (uint64_t)v25, started, v35, v40, v45, v47);

    v19 = v48;
  }
}

- (id)_playbackQueueIdentifiers:(BOOL *)a3 queueStatus:(unint64_t *)a4
{
  uint64_t v7 = objc_msgSend_podcastCollection(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  uint64_t v11 = objc_msgSend_typeFromDomainObject_(POUtilities, v8, (uint64_t)v7, v9, v10);

  uint64_t v16 = objc_msgSend_podcastCollection(self, v12, v13, v14, v15);
  v20 = objc_msgSend_identifierFromDomainObject_(POUtilities, v17, (uint64_t)v16, v18, v19);

  if (objc_msgSend_isEqualToString_(v11, v21, @"device", v22, v23))
  {
    uint64_t v28 = objc_msgSend_sharedInstance(PODataSource, v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_podcastCollectionWithUUID_(v28, v29, (uint64_t)v20, v30, v31);
    uint64_t v37 = objc_msgSend_feedUrl(v32, v33, v34, v35, v36);

    uint64_t v42 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v38, v39, v40, v41);
    v47 = objc_msgSend_episodePlaybackOrder(self, v43, v44, v45, v46);
    char v49 = objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_sampPlaybackOrder_(v42, v48, (uint64_t)v20, (uint64_t)v37, 0, v47);
  }
  else if (objc_msgSend_isEqualToString_(v11, v24, @"store", v26, v27))
  {
    v54 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v50, v51, v52, v53);
    v59 = objc_msgSend_episodePlaybackOrder(self, v55, v56, v57, v58);
    char v49 = objc_msgSend_playbackQueueIdentifierForPodcastAdamId_sampPlaybackOrder_(v54, v60, (uint64_t)v20, (uint64_t)v59, v61);

    if (a3) {
      *a3 = 1;
    }
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v62 = POLogContextCommand;
    }
    else {
      v62 = &_os_log_internal;
    }
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_222ECAF3C(v62, self);
    }
    char v49 = 0;
  }

  return v49;
}

- (id)_validate
{
  return 0;
}

@end