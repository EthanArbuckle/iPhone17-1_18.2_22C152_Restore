@interface POSubscribeToPodcastCollection
+ (id)_commandStatusForRemoteStatus:(unsigned int)a3 assistantError:(id)a4;
- (id)_subscribeRequestIdentifier;
- (id)_validate;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation POSubscribeToPodcastCollection

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *))a3;
  v10 = objc_msgSend__validate(self, v6, v7, v8, v9);
  v15 = v10;
  if (v10)
  {
    v16 = objc_msgSend_dictionary(v10, v11, v12, v13, v14);
    v5[2](v5, v16);
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v17 = POLogContextCommand;
    }
    else {
      v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = v17;
      v27 = objc_msgSend__subscribeRequestIdentifier(self, v23, v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      v57 = v27;
      _os_log_impl(&dword_222EBF000, v22, OS_LOG_TYPE_INFO, "Subscribing to Podcast with adamId: %@", buf, 0xCu);
    }
    v32 = objc_msgSend_hashedRouteUID(self, v18, v19, v20, v21);
    if (v32)
    {
      v33 = objc_msgSend_hashedRouteUID(self, v28, v29, v30, v31);
      v55 = v33;
      v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)&v55, 1, v35);
    }
    else
    {
      v36 = (void *)MEMORY[0x263EFFA68];
    }

    v41 = objc_msgSend__subscribeRequestIdentifier(self, v37, v38, v39, v40);
    v46 = objc_msgSend_assetInfo(self, v42, v43, v44, v45);
    v51 = objc_msgSend_refId(self, v47, v48, v49, v50);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = sub_222EC4FB0;
    v53[3] = &unk_26467B6E0;
    v54 = v5;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(POUtilities, v52, (uint64_t)v41, (uint64_t)v46, (uint64_t)v36, 0, 0, 0, v51, 0, v53);
  }
}

- (id)_subscribeRequestIdentifier
{
  v5 = objc_msgSend_podcastCollection(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_identifierFromDomainObject_(POUtilities, v6, (uint64_t)v5, v7, v8);

  uint64_t v14 = objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v10, v11, v12, v13);
  v18 = objc_msgSend_playbackQueueIdentifierForSubscribeToPodcast_(v14, v15, (uint64_t)v9, v16, v17);

  return v18;
}

- (id)_validate
{
  return 0;
}

+ (id)_commandStatusForRemoteStatus:(unsigned int)a3 assistantError:(id)a4
{
  id v5 = a4;
  v10 = objc_msgSend_domain(v5, v6, v7, v8, v9);
  if (objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x263F54760], v12, v13))
  {
    uint64_t v18 = objc_msgSend_code(v5, v14, v15, v16, v17);

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x263F64820]);
      v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"MediaRemote error code %ld", v21, v22, v18);
      v27 = objc_msgSend_initWithReason_(v19, v24, (uint64_t)v23, v25, v26);

      goto LABEL_42;
    }
  }
  else
  {
  }
  if ((int)a3 <= 1)
  {
    if (!a3)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        uint64_t v35 = POLogContextCommand;
      }
      else {
        uint64_t v35 = &_os_log_internal;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_222EBF000, v35, OS_LOG_TYPE_INFO, "Subscribe command succeeded", v43, 2u);
      }
      v36 = (objc_class *)MEMORY[0x263F64830];
      goto LABEL_40;
    }
    if (a3 == 1)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        v28 = POLogContextCommand;
      }
      else {
        v28 = &_os_log_internal;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_222ECAB14(v28);
      }
LABEL_39:
      v36 = (objc_class *)MEMORY[0x263F64820];
LABEL_40:
      id v38 = objc_alloc_init(v36);
      goto LABEL_41;
    }
LABEL_34:
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      uint64_t v39 = POLogContextCommand;
    }
    else {
      uint64_t v39 = &_os_log_internal;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_222ECAA9C(a3, v39);
    }
    goto LABEL_39;
  }
  if (a3 == 2)
  {
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v37 = POLogContextCommand;
    }
    else {
      v37 = &_os_log_internal;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_222EBF000, v37, OS_LOG_TYPE_INFO, "Subscribe command failed because user was already subscribed", v42, 2u);
    }
    id v30 = objc_alloc(MEMORY[0x263F64820]);
    v34 = (uint64_t *)MEMORY[0x263F659C0];
  }
  else
  {
    if (a3 != 10) {
      goto LABEL_34;
    }
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      uint64_t v29 = POLogContextCommand;
    }
    else {
      uint64_t v29 = &_os_log_internal;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222EBF000, v29, OS_LOG_TYPE_INFO, "Subscribe command failed because it is not subscribeable", buf, 2u);
    }
    id v30 = objc_alloc(MEMORY[0x263F64820]);
    v34 = (uint64_t *)MEMORY[0x263F65A40];
  }
  id v38 = (id)objc_msgSend_initWithErrorCode_(v30, v31, *v34, v32, v33);
LABEL_41:
  v27 = v38;
LABEL_42:

  return v27;
}

@end