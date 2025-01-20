void sub_222EC0CB4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t vars8;

  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void *)(a1 + 32);
  v9 = objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

void sub_222EC0F7C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  v9 = objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

id sub_222EC1238(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F08BD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v4, v7, v8);
  v12 = objc_msgSend_initWithName_value_(v5, v10, (uint64_t)v4, (uint64_t)v9, v11);

  return v12;
}

id sub_222EC148C(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F08BD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v4, v7, v8);
  v12 = objc_msgSend_initWithName_value_(v5, v10, (uint64_t)v4, (uint64_t)v9, v11);

  return v12;
}

void sub_222EC15B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[3] = *MEMORY[0x263EF8340];
  v7[0] = @"playPodcast";
  v7[1] = @"playPodcasts";
  v7[2] = @"playStation";
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 3, a5);
  uint64_t v6 = (void *)qword_267F95D60;
  qword_267F95D60 = v5;
}

void sub_222EC2114(uint64_t a1, const char *a2)
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"playPodcasts";
  v4[1] = @"playPodcast";
  v5[0] = &unk_26D5D9390;
  v5[1] = &unk_26D5D93A8;
  v4[2] = @"playStation";
  v5[2] = &unk_26D5D93C0;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 3);
  v3 = (void *)qword_267F95D78;
  qword_267F95D78 = v2;
}

void sub_222EC34CC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_222EC3624;
  v12[3] = &unk_26467B7A8;
  uint64_t v8 = *(void **)(a1 + 120);
  id v19 = *(id *)(a1 + 112);
  id v9 = *(id *)(a1 + 64);
  char v21 = *(unsigned char *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 120);
  id v13 = v9;
  uint64_t v20 = v10;
  id v14 = *(id *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 129);
  id v15 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 88);
  id v17 = *(id *)(a1 + 96);
  id v18 = *(id *)(a1 + 104);
  objc_msgSend__resolveWithDestination_hashedRouteIdentifiers_decodedRouteIdentifiers_originatingOutputDeviceUID_localPlaybackPermitted_audioRoutingInfo_completion_(v8, v11, v4, v5, v6, v7, 1, a2, v12);
}

void sub_222EC3624(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v23 = *MEMORY[0x263F54C70];
  v24[0] = &unk_26D5D93F0;
  uint64_t v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v24, (uint64_t)&v23, 1);
  id v6 = objc_alloc_init(MEMORY[0x263F54780]);
  uint64_t v7 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_222EC37E4;
  v12[3] = &unk_26467B780;
  id v8 = *(id *)(a1 + 80);
  char v21 = *(unsigned char *)(a1 + 96);
  id v13 = v3;
  uint64_t v9 = *(void *)(a1 + 88);
  id v19 = v8;
  uint64_t v20 = v9;
  id v14 = *(id *)(a1 + 40);
  char v22 = *(unsigned char *)(a1 + 97);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v10 = v3;
  objc_msgSend_sendPlaybackQueueWithResult_toDestination_withOptions_completion_(v6, v11, v7, (uint64_t)v10, (uint64_t)v5, v12);
}

void sub_222EC37E4(uint64_t a1, void *a2)
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v8 = v3;
  uint64_t v9 = &_os_log_internal;
  if (v3)
  {
    id v10 = objc_msgSend_returnStatuses(v3, v4, v5, v6, v7);
    id v15 = objc_msgSend_firstObject(v10, v11, v12, v13, v14);
    int v20 = objc_msgSend_unsignedIntValue(v15, v16, v17, v18, v19);

    v25 = objc_msgSend_error(v8, v21, v22, v23, v24);
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v26 = POLogContextCommand;
    }
    else {
      v26 = v9;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v32 = objc_msgSend_localizedDescription(v25, v28, v29, v30, v31);
      *(_DWORD *)buf = 138412290;
      *(void *)v115 = v32;
      _os_log_impl(&dword_222EBF000, v27, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Error: %@", buf, 0xCu);
    }
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v33 = POLogContextCommand;
    }
    else {
      v33 = v9;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v115 = v20;
      _os_log_impl(&dword_222EBF000, v33, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Status: %d", buf, 8u);
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    objc_msgSend_underlyingErrors(v25, v34, v35, v36, v37, 0);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v110, (uint64_t)v119, 16);
    if (v40)
    {
      uint64_t v44 = v40;
      uint64_t v45 = *(void *)v111;
      while (2)
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v111 != v45) {
            objc_enumerationMutation(v38);
          }
          if (objc_msgSend_errorIsNoNetwork_(POUtilities, v41, *(void *)(*((void *)&v110 + 1) + 8 * i), v42, v43))
          {
            POLogInitIfNeeded();
            if (POLogContextCommand) {
              v69 = POLogContextCommand;
            }
            else {
              v69 = &_os_log_internal;
            }
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              sub_222ECAA64(v69, v70, v71, v72, v73, v74, v75, v76);
            }
            v77 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
            goto LABEL_63;
          }
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v110, (uint64_t)v119, 16);
        if (v44) {
          continue;
        }
        break;
      }
    }

    int v51 = v20;
    v52 = &_os_log_internal;
    if (*(unsigned char *)(a1 + 96))
    {
      v53 = objc_msgSend_outputDeviceUIDs(*(void **)(a1 + 32), v47, v48, v49, v50);
      if (objc_msgSend_count(v53, v54, v55, v56, v57))
      {

        if ((v51 - 1) <= 1)
        {
          POLogInitIfNeeded();
          if (POLogContextCommand) {
            v58 = POLogContextCommand;
          }
          else {
            v58 = v52;
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v115 = v51;
            _os_log_impl(&dword_222EBF000, v58, OS_LOG_TYPE_DEFAULT, "Falling back to airplay after status: %d", buf, 8u);
          }
          v61 = *(void **)(a1 + 88);
          uint64_t v118 = *(void *)(a1 + 40);
          v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v59, (uint64_t)&v118, 1, v60);
          uint64_t PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount = objc_msgSend_createPlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_(v61, v63, (uint64_t)v62, *(unsigned __int8 *)(a1 + 97), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));

          v65 = [MTMPCAssistantGenericPlaybackQueue alloc];
          id v38 = (id)objc_msgSend_initWithContextID_playbackQueueRef_(v65, v66, *(void *)(a1 + 72), PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount, v67);
          objc_msgSend_modifyContextForAirplay_andPlayLocally_completion_(*(void **)(a1 + 88), v68, *(void *)(a1 + 32), (uint64_t)v38, *(void *)(a1 + 80));
          goto LABEL_64;
        }
      }
      else
      {
      }
    }
    if (!*(void *)(a1 + 80))
    {
LABEL_65:

      goto LABEL_66;
    }
    v86 = objc_msgSend_domain(v25, v47, v48, v49, v50);
    if (objc_msgSend_isEqualToString_(v86, v87, *MEMORY[0x263F54760], v88, v89)) {
      uint64_t v94 = objc_msgSend_code(v25, v90, v91, v92, v93);
    }
    else {
      uint64_t v94 = 0;
    }

    v99 = objc_msgSend_domain(v25, v95, v96, v97, v98);
    if (objc_msgSend_isEqualToString_(v99, v100, *MEMORY[0x263F54758], v101, v102)) {
      uint64_t v107 = objc_msgSend_code(v25, v103, v104, v105, v106);
    }
    else {
      uint64_t v107 = 0;
    }

    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v108 = POLogContextCommand;
    }
    else {
      v108 = v52;
    }
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v115 = v51;
      *(_WORD *)&v115[4] = 2048;
      *(void *)&v115[6] = v94;
      __int16 v116 = 2048;
      uint64_t v117 = v107;
      _os_log_impl(&dword_222EBF000, v108, OS_LOG_TYPE_DEFAULT, "Completed sendPlaybackQueueWithResult with MR status: %d, remote error: %ld, assistant error: %ld", buf, 0x1Cu);
    }
    if (v25 && (MPCAssistantErrorIsInformational() & 1) == 0)
    {
      id v38 = v25;
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        v109 = POLogContextCommand;
      }
      else {
        v109 = v52;
      }
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        sub_222ECA9EC((uint64_t)v38, v109);
      }
    }
    else
    {
      id v38 = 0;
    }
    v77 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_63:
    v77();
LABEL_64:

    goto LABEL_65;
  }
  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v78 = POLogContextCommand;
  }
  else {
    v78 = v9;
  }
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
    sub_222ECA9B4(v78, v79, v80, v81, v82, v83, v84, v85);
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_66:
}

uint64_t sub_222EC3F20()
{
  qword_267F95D80 = (uint64_t)objc_alloc_init(MEMORY[0x263F547A0]);

  return MEMORY[0x270F9A758]();
}

void sub_222EC3F5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, 2, v3);
    }
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263F54780]);
    id v6 = objc_alloc(MEMORY[0x263F547D0]);
    id v8 = objc_msgSend_initWithAppBundleID_playerID_origin_(v6, v7, *MEMORY[0x263F5EB90], @"Podcasts", 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_222EC4074;
    v11[3] = &unk_26467B7F8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    objc_msgSend_sendPlaybackQueue_toDestination_completion_(v5, v10, v9, (uint64_t)v8, (uint64_t)v11);
  }
}

void sub_222EC4074(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v10 = objc_msgSend_firstObject(a3, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_unsignedIntValue(v10, v11, v12, v13, v14);

  int v20 = objc_msgSend_domain(v5, v16, v17, v18, v19);
  if (objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x263F54760], v22, v23)) {
    uint64_t v28 = objc_msgSend_code(v5, v24, v25, v26, v27);
  }
  else {
    uint64_t v28 = 0;
  }

  v33 = objc_msgSend_domain(v5, v29, v30, v31, v32);
  if (objc_msgSend_isEqualToString_(v33, v34, *MEMORY[0x263F54758], v35, v36)) {
    uint64_t v41 = objc_msgSend_code(v5, v37, v38, v39, v40);
  }
  else {
    uint64_t v41 = 0;
  }

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    uint64_t v42 = POLogContextCommand;
  }
  else {
    uint64_t v42 = &_os_log_internal;
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v44[0] = 67109632;
    v44[1] = v15;
    __int16 v45 = 2048;
    uint64_t v46 = v28;
    __int16 v47 = 2048;
    uint64_t v48 = v41;
    _os_log_impl(&dword_222EBF000, v42, OS_LOG_TYPE_DEFAULT, "Completed Airplay fallback with MR status: %d, remote error: %ld, assistant error: %ld", (uint8_t *)v44, 0x1Cu);
  }
  uint64_t v43 = *(void *)(a1 + 32);
  if (v43) {
    (*(void (**)(uint64_t, uint64_t, id))(v43 + 16))(v43, v15, v5);
  }
}

void sub_222EC47A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_222EC47B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_222EC47C8(uint64_t a1)
{
}

void sub_222EC47D0(uint64_t a1)
{
  id v16 = (id)MRNowPlayingClientCopyBundleIdentifierHierarchy();
  uint64_t v2 = MRNowPlayingClientGetParentAppBundleIdentifier();
  if (objc_msgSend_count(v16, v3, v4, v5, v6))
  {
    uint64_t v11 = objc_msgSend_lastObject(v16, v7, v8, v9, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v2;
    uint64_t v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_222EC4A50(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = a2;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v28, (uint64_t)v34, 16);
  if (!v5)
  {

LABEL_26:
    id v12 = objc_alloc_init(MEMORY[0x263F64830]);
    goto LABEL_27;
  }
  uint64_t v11 = v5;
  id v12 = 0;
  uint64_t v13 = *(void *)v29;
  uint64_t v14 = &_os_log_internal;
  *(void *)&long long v10 = 67109120;
  long long v27 = v10;
LABEL_3:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v29 != v13) {
      objc_enumerationMutation(v3);
    }
    int v16 = objc_msgSend_integerValue(*(void **)(*((void *)&v28 + 1) + 8 * v15), v6, v7, v8, v9, v27, (void)v28);
    int v17 = v16;
    if (v16) {
      BOOL v18 = v16 == 3;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        uint64_t v19 = POLogContextCommand;
      }
      else {
        uint64_t v19 = v14;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v27;
        int v33 = v17;
        _os_log_error_impl(&dword_222EBF000, v19, OS_LOG_TYPE_ERROR, "MediaRemote command failed with status %u", buf, 8u);
      }
      id v20 = objc_alloc(MEMORY[0x263F64820]);
      uint64_t v24 = objc_msgSend_initWithErrorCode_(v20, v21, *(void *)(a1 + 40), v22, v23);

      id v12 = (id)v24;
    }
    if (v17 != 3 && v17 != 0) {
      break;
    }
    if (v11 == ++v15)
    {
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v28, (uint64_t)v34, 16);
      if (v11) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (!v12) {
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v26 = *(void *)(a1 + 32);
  if (v26) {
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v12);
  }
}

void sub_222EC4D34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_222EC4FB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend__commandStatusForRemoteStatus_assistantError_(POSubscribeToPodcastCollection, a2, (uint64_t)a2, a3, a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v11 = objc_msgSend_dictionary(v12, v7, v8, v9, v10);
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v11);
}

uint64_t sub_222EC5434()
{
  qword_26ABFD540 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

void sub_222EC5984(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_msgSend_URLByAppendingPathComponent_(v6, v7, @"Documents/PodcastsDB.plist", v8, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_URLByAppendingPathComponent_(v6, v10, @"Documents/PodcastsDiff.plist", v11, v12);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_222EC5AC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_222EC5B6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_222EC6108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222EC6120(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v10 = a3;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8, v9);
    int v16 = objc_msgSend_path(v5, v12, v13, v14, v15);
    uint64_t v19 = objc_msgSend_attributesOfItemAtPath_error_(v11, v17, (uint64_t)v16, 0, v18);
    uint64_t v24 = objc_msgSend_fileModificationDate(v19, v20, v21, v22, v23);
    long long v29 = objc_msgSend_revisionsDataPlistLastModified(*(void **)(a1 + 32), v25, v26, v27, v28);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_isEqual_(v24, v30, (uint64_t)v29, v31, v32) ^ 1;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      int v33 = POLogContextSync;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_222ECAC48();
    }
  }
}

void sub_222EC62EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222EC6304(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v10 = a3;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8, v9);
    int v16 = objc_msgSend_path(v5, v12, v13, v14, v15);
    uint64_t v19 = objc_msgSend_attributesOfItemAtPath_error_(v11, v17, (uint64_t)v16, 0, v18);
    uint64_t v24 = objc_msgSend_fileModificationDate(v19, v20, v21, v22, v23);
    long long v29 = objc_msgSend_podcastDataPlistLastModified(*(void **)(a1 + 32), v25, v26, v27, v28);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_isEqual_(v24, v30, (uint64_t)v29, v31, v32) ^ 1;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      int v33 = POLogContextSync;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_222ECACB0();
    }
  }
}

void sub_222EC6500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222EC65EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222EC6764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222EC6850(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  if (v9)
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      id v10 = POLogContextSync;
    }
    else {
      id v10 = &_os_log_internal;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_222ECAD5C();
    }
  }
  else
  {
    objc_msgSend__withExtensionParseDataDictionary_revisionDictionary_(*(void **)(a1 + 32), v7, a2, a3, v8);
  }
}

void sub_222EC7E5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_222EC8024(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

uint64_t sub_222EC83B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_222EC83C0(uint64_t a1)
{
}

void sub_222EC83C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  if (!v2) {
    uint64_t v2 = *(void **)(v1 + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void sub_222EC8498(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_222EBF000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_222EC8684(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((objc_msgSend_hasFetchedInitialAccount(*(void **)(a1 + 32), a2, a3, a4, a5) & 1) == 0) {
    objc_msgSend__updateActiveAccount(*(void **)(a1 + 32), v6, v7, v8, v9);
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_222EC8738;
    block[3] = &unk_26467B9E8;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

uint64_t sub_222EC8738(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_222EC8A9C(uint64_t a1)
{
  uint64_t v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_222EBF000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v25, 2u);
  }

  uint64_t v7 = objc_msgSend__activeAccountBlocking(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_ams_DSID(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_stringValue(v12, v13, v14, v15, v16);

  unint64_t v21 = *(void *)(a1 + 40);
  if (v21 | v17 && (objc_msgSend_isEqualToString_((void *)v21, v18, v17, v19, v20) & 1) == 0) {
    dispatch_async(MEMORY[0x263EF83A0], &unk_26D5D5398);
  }
  objc_msgSend_setActiveAccount_(*(void **)(a1 + 32), v18, (uint64_t)v7, v19, v20);
  objc_msgSend_setHasFetchedInitialAccount_(*(void **)(a1 + 32), v22, 1, v23, v24);
}

void sub_222EC8B88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v7, v5, @"AccountDSIDChangedNotification", 0, v6);
}

void sub_222EC93E4(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, *(unsigned __int8 *)(a1 + 40));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

void POLogInitIfNeeded()
{
  if (qword_26ABFD530 != -1) {
    dispatch_once(&qword_26ABFD530, &unk_26D5D53B8);
  }
}

uint64_t sub_222EC968C()
{
  os_log_t v0 = os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);
  uint64_t v1 = (void *)POLogContextCommand;
  POLogContextCommand = (uint64_t)v0;

  POLogContextSync = (uint64_t)os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);

  return MEMORY[0x270F9A758]();
}

id POAssistantDecodeHashedRouteUIDs(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init((Class)MSVWeakLinkClass());
  uint64_t v4 = dispatch_group_create();
  dispatch_queue_t v5 = dispatch_queue_create("DecodeSerialQueue", 0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v15 = objc_msgSend_initWithBase64EncodedString_options_(v12, v13, v11, 0, v14);
        dispatch_group_enter(v4);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = sub_222EC9C68;
        v21[3] = &unk_26467BA88;
        uint64_t v22 = v5;
        uint64_t v23 = v11;
        id v24 = v2;
        uint64_t v25 = v4;
        objc_msgSend_processData_usingProcedure_completion_(v3, v16, (uint64_t)v15, 2, (uint64_t)v21);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v8);
  }

  dispatch_time_t v18 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v18);

  return v2;
}

void sub_222EC9C68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      uint64_t v7 = POLogContextCommand;
    }
    else {
      uint64_t v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_222ECAFFC((uint64_t)v6, v7);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_222EC9D78;
    block[3] = &unk_26467BA60;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    dispatch_sync(v8, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_222EC9D78(uint64_t a1)
{
  id v2 = [NSString alloc];
  id v5 = objc_msgSend_initWithData_encoding_(v2, v3, *(void *)(a1 + 32), 4, v4);
  POLogInitIfNeeded();
  if (POLogContextCommand) {
    id v6 = POLogContextCommand;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_222ECB074(a1, (uint64_t)v5, v6);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v5) {
LABEL_6:
  }
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v7, *(void *)(a1 + 40), (uint64_t)v5, v8);
LABEL_7:
}

uint64_t sub_222ECA66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a2, sel_compare_options_, a3, 64, a5);
}

uint64_t MPAssistantWatchIsConnectedToCompanion()
{
  return 0;
}

uint64_t MPAssistantWatchGetCompanionOriginUniqueIdentifier()
{
  return 1129140302;
}

uint64_t MPAssistantWatchGetCurrentAudioRoutingInfo(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a1, 0);
}

void sub_222ECA97C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_222ECA9B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_222ECA9EC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222EBF000, a2, OS_LOG_TYPE_ERROR, "sendPlaybackQueueWithResult encountered error %@", (uint8_t *)&v2, 0xCu);
}

void sub_222ECAA64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_222ECAA9C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222EBF000, a2, OS_LOG_TYPE_ERROR, "Subscribe command failed with an unexpected error code: %u", (uint8_t *)v2, 8u);
}

void sub_222ECAB14(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222EBF000, log, OS_LOG_TYPE_ERROR, "Subscribe command failed because we could not find the podcast at this time", v1, 2u);
}

void sub_222ECAB58()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_222EC7E84();
  _os_log_fault_impl(&dword_222EBF000, v0, OS_LOG_TYPE_FAULT, "Error reading plist from path: %@ - with error: %@", v1, 0x16u);
}

void sub_222ECABD0()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_222EC7E84();
  _os_log_error_impl(&dword_222EBF000, v0, OS_LOG_TYPE_ERROR, "Error reading plist at %@: %@", v1, 0x16u);
}

void sub_222ECAC48()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "Failed to get revision URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

void sub_222ECACB0()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "Failed to get database URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

void sub_222ECAD18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222EBF000, log, OS_LOG_TYPE_ERROR, "Recursive call to initializeData while constructing. This is a programming error.  Please fix.", v1, 2u);
}

void sub_222ECAD5C()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "Failed to get plist URLs for PODataSource with error: %@", v2, v3, v4, v5, v6);
}

void sub_222ECADC4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222EBF000, log, OS_LOG_TYPE_ERROR, "Unable to get UUID for first revision.", buf, 2u);
}

void sub_222ECAE04()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "Unable to get UUID for root object, sync data will not have proper validity.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

void sub_222ECAE6C()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "Unable to locate root child array.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

void sub_222ECAED4()
{
  sub_222EC7E78();
  sub_222EC7E5C(&dword_222EBF000, v0, v1, "First child's children isn't of length 2.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
}

void sub_222ECAF3C(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v8 = objc_msgSend_podcastCollection(a2, v4, v5, v6, v7);
  id v13 = objc_msgSend_identifier(v8, v9, v10, v11, v12);
  int v14 = 138412290;
  id v15 = v13;
  _os_log_error_impl(&dword_222EBF000, v3, OS_LOG_TYPE_ERROR, "unable to create a play queue for identifier: %@", (uint8_t *)&v14, 0xCu);
}

void sub_222ECAFFC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_222EBF000, a2, OS_LOG_TYPE_DEBUG, "Error decoding route UID: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_222ECB074(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_222EBF000, log, OS_LOG_TYPE_DEBUG, "%@ => %@", (uint8_t *)&v4, 0x16u);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE53D8](allocator, originalString, charactersToLeaveEscaped);
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x270F49BA0]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x270F49FA0]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x270F4A068]();
}

uint64_t MRNowPlayingClientCopyBundleIdentifierHierarchy()
{
  return MEMORY[0x270F4A0B8]();
}

uint64_t MRNowPlayingClientGetParentAppBundleIdentifier()
{
  return MEMORY[0x270F4A0D8]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x270F4A210]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x270F4A250]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x270F4A258]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x270F4A280]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriAssetInfo()
{
  return MEMORY[0x270F4A290]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistShuffleMode()
{
  return MEMORY[0x270F4A2B8]();
}

uint64_t MRSystemAppPlaybackQueueSetUserInfo()
{
  return MEMORY[0x270F4A2C8]();
}

uint64_t MSVWeakLinkClass()
{
  return MEMORY[0x270F4A420]();
}

uint64_t MTEpisodeContextFromPersistentString()
{
  return MEMORY[0x270F54738]();
}

uint64_t MTEpisodeContextSortTypeFromPersistentString()
{
  return MEMORY[0x270F54740]();
}

uint64_t MTPlayReasonFromPersistentString()
{
  return MEMORY[0x270F54748]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSPersistentStringForMTEpisodeContext()
{
  return MEMORY[0x270F54760]();
}

uint64_t NSPersistentStringForMTEpisodeContextSortType()
{
  return MEMORY[0x270F54768]();
}

uint64_t NSPersistentStringForMTPlayReason()
{
  return MEMORY[0x270F54770]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryDefault()
{
  return MEMORY[0x270F54788]();
}

uint64_t _MTLogCategorySiri()
{
  return MEMORY[0x270F547A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x270ED90B8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}