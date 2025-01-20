@interface POPlayPodcasts
- (id)_playbackRequestIdentifier;
- (id)_validate;
- (void)performWithCompletion:(id)a3;
@end

@implementation POPlayPodcasts

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v9 = objc_msgSend__validate(self, v5, v6, v7, v8);
  v14 = v9;
  if (v9)
  {
    v15 = objc_msgSend_dictionary(v9, v10, v11, v12, v13);
    v4[2](v4, v15);
  }
  else
  {
    v16 = objc_msgSend__playbackRequestIdentifier(self, v10, v11, v12, v13);
    v21 = objc_msgSend_hashedRouteUIDs(self, v17, v18, v19, v20);
    uint64_t started = objc_msgSend_startPlaying(self, v22, v23, v24, v25);
    v31 = objc_msgSend_requesterSharedUserId(self, v27, v28, v29, v30);
    v36 = objc_msgSend_sharedUserIdFromPlayableITunesAccount(self, v32, v33, v34, v35);
    v41 = objc_msgSend_refId(self, v37, v38, v39, v40);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = sub_222EC8024;
    v43[3] = &unk_26467B6E0;
    v44 = v4;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_completion_(POUtilities, v42, (uint64_t)v16, 0, (uint64_t)v21, started, v31, v36, v41, v43);
  }
}

- (id)_playbackRequestIdentifier
{
  uint64_t v6 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_episodePlaybackOrder(self, v7, v8, v9, v10);
  v15 = objc_msgSend_playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder_(v6, v12, (uint64_t)v11, v13, v14);

  return v15;
}

- (id)_validate
{
  return 0;
}

@end