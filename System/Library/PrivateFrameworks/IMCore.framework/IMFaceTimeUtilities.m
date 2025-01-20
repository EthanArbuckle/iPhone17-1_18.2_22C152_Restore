@interface IMFaceTimeUtilities
+ (BOOL)activeTUConversationHasActivitySession:(id)a3;
+ (BOOL)conversationIsAVLessSharePlay:(id)a3;
+ (BOOL)conversationIsVideoCall:(id)a3;
+ (BOOL)isScreenShareActivityForTUConversation:(id)a3;
+ (BOOL)platformSupportsStagingArea;
+ (id)activityMetadataForTUConversation:(id)a3;
+ (id)activitySessionForTUConversation:(id)a3;
+ (id)currentCallForTUConversation:(id)a3;
+ (id)remoteParticipantHandleSharingScreenForTUConversation:(id)a3;
+ (void)initiateTUConversationForParticipants:(id)a3 senderAddress:(id)a4 videoEnabled:(BOOL)a5 groupID:(id)a6 displayName:(id)a7 screenShareType:(unint64_t)a8;
+ (void)initiateTUDialRequestForSingleParticipant:(id)a3 videoEnabled:(BOOL)a4;
+ (void)joinExistingConversationForTUCoversation:(id)a3 videoEnabled:(BOOL)a4 wantsStagingArea:(BOOL)a5;
+ (void)leaveTUCall:(id)a3;
+ (void)leaveTUConversation;
@end

@implementation IMFaceTimeUtilities

+ (id)currentCallForTUConversation:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v4, v5, v6);
  v11 = objc_msgSend_currentVideoCalls(v7, v8, v9, v10);

  id obj = v11;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    v18 = 0;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v14, v15, v16);
        v25 = objc_msgSend_activeConversationForCall_(v22, v23, (uint64_t)v21, v24);

        v29 = objc_msgSend_UUID(v25, v26, v27, v28);
        v33 = objc_msgSend_UUID(v3, v30, v31, v32);
        int isEqual = objc_msgSend_isEqual_(v29, v34, (uint64_t)v33, v35);

        if (isEqual)
        {
          id v37 = v21;

          v18 = v37;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)activeTUConversationHasActivitySession:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = objc_msgSend_activitySessionForTUConversation_(IMFaceTimeUtilities, a2, (uint64_t)a3, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

+ (void)joinExistingConversationForTUCoversation:(id)a3 videoEnabled:(BOOL)a4 wantsStagingArea:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FADBE8]);
    v11 = objc_msgSend_initWithConversation_(v8, v9, (uint64_t)v7, v10);
    objc_msgSend_setVideoEnabled_(v11, v12, v6, v13);
    objc_msgSend_setWantsStagingArea_(v11, v14, v5, v15);
    objc_msgSend_setOriginatingUIType_(v11, v16, 19, v17);
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = @"NO";
        *(_DWORD *)uint64_t v27 = 138412802;
        *(void *)&v27[4] = v7;
        *(_WORD *)&v27[12] = 2112;
        if (v6) {
          v22 = @"YES";
        }
        *(void *)&v27[14] = v22;
        __int16 v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Joining TUConversation %@ with videoEnabled %@ using join request: %@", v27, 0x20u);
      }
    }
    v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v18, v19, v20, *(_OWORD *)v27);
    objc_msgSend_launchAppForJoinRequest_(v23, v24, (uint64_t)v11, v25);
  }
  else if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "***** --- We are trying to join a TUConversation, but we do not have a local conversation for this chat --- ****", v27, 2u);
    }
  }
}

+ (void)initiateTUConversationForParticipants:(id)a3 senderAddress:(id)a4 videoEnabled:(BOOL)a5 groupID:(id)a6 displayName:(id)a7 screenShareType:(unint64_t)a8
{
  BOOL v130 = a5;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v133 = a4;
  id v131 = a6;
  id v132 = a7;
  if (IMDeviceIsGreenTea() && IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "IMFaceTimeUtilities: request to initiate a group facetime for a green tea device. Only TUDialRequests are supported in this configuration, so this request will fail.", buf, 2u);
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v17 = objc_msgSend_count(v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_setWithCapacity_(v16, v18, v17, v19);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id obj = v11;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v136, (uint64_t)v146, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v137 != v26) {
          objc_enumerationMutation(obj);
        }
        __int16 v28 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        v29 = (void *)MEMORY[0x1E4FADBD8];
        uint64_t v30 = objc_msgSend_ID(v28, v22, v23, v24);
        v33 = objc_msgSend_normalizedHandleWithDestinationID_(v29, v31, (uint64_t)v30, v32);

        if (v33)
        {
          id v34 = objc_alloc(MEMORY[0x1E4FADB80]);
          id v37 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v35, (uint64_t)v33, v36);
          long long v40 = objc_msgSend_initWithHandles_(v34, v38, (uint64_t)v37, v39);

          objc_msgSend_addObject_(v20, v41, (uint64_t)v40, v42);
        }
        else if (IMOSLoggingEnabled())
        {
          long long v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v143 = v28;
            _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Skipping handle (%@) as the ID is nil", buf, 0xCu);
          }
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v136, (uint64_t)v146, 16);
    }
    while (v25);
  }

  if (objc_msgSend_count(v20, v44, v45, v46))
  {
    id v47 = objc_alloc(MEMORY[0x1E4FADBE8]);
    v50 = objc_msgSend_initWithRemoteMembers_(v47, v48, (uint64_t)v20, v49);
    v53 = v50;
    if (v130) {
      objc_msgSend_setAvMode_(v50, v51, 2, v52);
    }
    else {
      objc_msgSend_setAvMode_(v50, v51, 1, v52);
    }
    objc_msgSend_setVideoEnabled_(v53, v54, v130, v55);
    objc_msgSend_setRequestToShareMyScreen_(v53, v56, a8 == 1, v57);
    objc_msgSend_setRequestToShareScreen_(v53, v58, a8 == 2, v59);
    objc_msgSend_setShouldSuppressInCallUI_(v53, v60, 1, v61);
    v65 = objc_msgSend_expanseProvider(MEMORY[0x1E4FADBA0], v62, v63, v64);
    objc_msgSend_setProvider_(v53, v66, (uint64_t)v65, v67);

    if (a8) {
      objc_msgSend_setOriginatingUIType_(v53, v68, 32, v69);
    }
    else {
      objc_msgSend_setOriginatingUIType_(v53, v68, 18, v69);
    }
    if (objc_opt_respondsToSelector())
    {
      v73 = objc_msgSend_normalizedHandleWithDestinationID_(MEMORY[0x1E4FADBD8], v70, (uint64_t)v133, v72);
      v77 = objc_msgSend_facetimeService(IMService, v74, v75, v76);
      v78 = IMPreferredAccountForService(v77);

      if (objc_msgSend_hasAlias_(v78, v79, (uint64_t)v133, v80))
      {
        objc_msgSend_setCallerID_(v53, v81, (uint64_t)v73, v82);
      }
      else if (IMOSLoggingEnabled())
      {
        v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          v88 = objc_msgSend_aliases(v78, v85, v86, v87);
          *(_DWORD *)buf = 138412546;
          id v143 = v133;
          __int16 v144 = 2112;
          v145 = v88;
          _os_log_impl(&dword_1A4AF7000, v84, OS_LOG_TYPE_INFO, "IMFaceTimeUtilities: Skipping setting callerID since FT account doesn't contain senderAddress: %@, aliases: %@", buf, 0x16u);
        }
      }
    }
    if ((unint64_t)objc_msgSend_count(obj, v70, v71, v72) < 2)
    {
      id v112 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v113 = objc_alloc(MEMORY[0x1E4FADB68]);
      v92 = objc_msgSend_initWithHandleType_notificationStyles_(v113, v114, 2, 4);
      v140[0] = v92;
      id v115 = objc_alloc(MEMORY[0x1E4FADB68]);
      v100 = objc_msgSend_initWithHandleType_notificationStyles_(v115, v116, 3, 4);
      v140[1] = v100;
      id v117 = objc_alloc(MEMORY[0x1E4FADB68]);
      v103 = objc_msgSend_initWithHandleType_notificationStyles_(v117, v118, 1, 4);
      v140[2] = v103;
      v106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v119, (uint64_t)v140, 3);
      v111 = objc_msgSend_initWithArray_(v112, v120, (uint64_t)v106, v121);
    }
    else
    {
      id v89 = objc_alloc(MEMORY[0x1E4F29128]);
      v92 = objc_msgSend_initWithUUIDString_(v89, v90, (uint64_t)v131, v91);
      objc_msgSend_setMessagesGroupUUID_(v53, v93, (uint64_t)v92, v94);
      objc_msgSend_setMessagesGroupName_(v53, v95, (uint64_t)v132, v96);
      id v97 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v98 = objc_alloc(MEMORY[0x1E4FADB68]);
      v100 = objc_msgSend_initWithHandleType_notificationStyles_(v98, v99, 2, 2);
      v141[0] = v100;
      id v101 = objc_alloc(MEMORY[0x1E4FADB68]);
      v103 = objc_msgSend_initWithHandleType_notificationStyles_(v101, v102, 3, 2);
      v141[1] = v103;
      id v104 = objc_alloc(MEMORY[0x1E4FADB68]);
      v106 = objc_msgSend_initWithHandleType_notificationStyles_(v104, v105, 1, 2);
      v141[2] = v106;
      v108 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v107, (uint64_t)v141, 3);
      v111 = objc_msgSend_initWithArray_(v97, v109, (uint64_t)v108, v110);
    }
    objc_msgSend_setInvitationPreferences_(v53, v122, (uint64_t)v111, v123);
    v127 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v124, v125, v126);
    objc_msgSend_launchAppForJoinRequest_(v127, v128, (uint64_t)v53, v129);
  }
  else if (IMOSLoggingEnabled())
  {
    v83 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v83, OS_LOG_TYPE_INFO, "IMFaceTimeUtilities: Not starting FaceTime as the conversation has no valid participants.", buf, 2u);
    }
  }
}

+ (void)initiateTUDialRequestForSingleParticipant:(id)a3 videoEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "initiateTUDialRequestForSingleParticipant", buf, 2u);
    }
  }
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v6, v7, v8);
  uint64_t v14 = objc_msgSend_providerManager(v10, v11, v12, v13);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v18 = objc_msgSend_providers(v14, v15, v16, v17, 0);
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v58, (uint64_t)v64, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v59;
LABEL_7:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v59 != v24) {
        objc_enumerationMutation(v18);
      }
      uint64_t v26 = *(void **)(*((void *)&v58 + 1) + 8 * v25);
      if (objc_msgSend_isFaceTimeProvider(v26, v20, v21, v22)) {
        break;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v58, (uint64_t)v64, 16);
        if (v23) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v27 = v26;

    if (!v27) {
      goto LABEL_16;
    }
    id v28 = objc_alloc(MEMORY[0x1E4FADBC0]);
    uint64_t v31 = objc_msgSend_initWithProvider_(v28, v29, (uint64_t)v27, v30);
    uint64_t v32 = (void *)MEMORY[0x1E4FADBD8];
    uint64_t v36 = objc_msgSend_ID(v5, v33, v34, v35);
    uint64_t v39 = objc_msgSend_normalizedHandleWithDestinationID_(v32, v37, (uint64_t)v36, v38);
    objc_msgSend_setHandle_(v31, v40, (uint64_t)v39, v41);

    objc_msgSend_setVideo_(v31, v42, v4, v43);
    objc_msgSend_setShouldSuppressInCallUI_(v31, v44, 1, v45);
    objc_msgSend_setOriginatingUIType_(v31, v46, 18, v47);
    v51 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v48, v49, v50);
    objc_msgSend_launchAppForDialRequest_completion_(v51, v52, (uint64_t)v31, 0);
  }
  else
  {
LABEL_13:

LABEL_16:
    if (IMOSLoggingEnabled())
    {
      v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = objc_msgSend_providers(v14, v54, v55, v56);
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = v57;
        _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "Could not find FaceTime Provider, all providers: %@", buf, 0xCu);
      }
    }
  }
}

+ (void)leaveTUConversation
{
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Leaving active video call", v13, 2u);
    }
  }
  BOOL v6 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v2, v3, v4);
  uint64_t v10 = objc_msgSend_activeVideoCall(v6, v7, v8, v9);
  objc_msgSend_leaveTUCall_(IMFaceTimeUtilities, v11, (uint64_t)v10, v12);
}

+ (void)leaveTUCall:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Leaving TUCall %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v4, v5, v6);
  objc_msgSend_disconnectCall_(v8, v9, (uint64_t)v3, v10);
}

+ (BOOL)isScreenShareActivityForTUConversation:(id)a3
{
  uint64_t v4 = objc_msgSend_activitySessionForTUConversation_(IMFaceTimeUtilities, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_activity(v4, v5, v6, v7);

  if (v8) {
    char isScreenSharingActivity = objc_msgSend_isScreenSharingActivity(v8, v9, v10, v11);
  }
  else {
    char isScreenSharingActivity = 0;
  }

  return isScreenSharingActivity;
}

+ (id)activitySessionForTUConversation:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isAVLessSharePlayEnabled = objc_msgSend_isAVLessSharePlayEnabled(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_activitySessions(v4, v13, v14, v15);
  uint64_t v20 = v16;
  if (isAVLessSharePlayEnabled)
  {
    uint64_t v21 = objc_msgSend_anyObject(v16, v17, v18, v19);

    if (!v21)
    {
      if (objc_msgSend_conversationIsAVLessSharePlay_(a1, v22, (uint64_t)v4, v23))
      {
        uint64_t v21 = objc_msgSend_stagedActivitySession(v4, v24, v25, v26);
      }
      else
      {
        uint64_t v21 = 0;
      }
    }
  }
  else
  {
    id v27 = objc_msgSend_allObjects(v16, v17, v18, v19);
    uint64_t v21 = objc_msgSend_firstObject(v27, v28, v29, v30);
  }

  return v21;
}

+ (id)remoteParticipantHandleSharingScreenForTUConversation:(id)a3
{
  id v4 = objc_msgSend_activitySessionForTUConversation_(IMFaceTimeUtilities, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_activity(v4, v5, v6, v7);

  if (objc_msgSend_isScreenSharingActivity(v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_originator(v8, v12, v13, v14);
    uint64_t v19 = objc_msgSend_value(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)activityMetadataForTUConversation:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6E778];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_sharedFeatureFlags(v4, v6, v7, v8);
  int isAVLessSharePlayEnabled = objc_msgSend_isAVLessSharePlayEnabled(v9, v10, v11, v12);

  if (isAVLessSharePlayEnabled)
  {
    uint64_t v17 = objc_msgSend_activitySessionForTUConversation_(a1, v14, (uint64_t)v5, v16);

    uint64_t v21 = objc_msgSend_activity(v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_metadata(v21, v22, v23, v24);
  }
  else
  {
    uint64_t v17 = objc_msgSend_activitySessions(v5, v14, v15, v16);

    uint64_t v21 = objc_msgSend_allObjects(v17, v26, v27, v28);
    uint64_t v32 = objc_msgSend_firstObject(v21, v29, v30, v31);
    uint64_t v36 = objc_msgSend_activity(v32, v33, v34, v35);
    uint64_t v25 = objc_msgSend_metadata(v36, v37, v38, v39);
  }

  return v25;
}

+ (BOOL)conversationIsVideoCall:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_avMode(v3, v4, v5, v6);
  SEL v8 = NSSelectorFromString(&cfstr_Resolvedaudiov.isa);
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = objc_msgSend_performSelector_(v3, v9, (uint64_t)v8, v10);
  }

  return v7 == 2;
}

+ (BOOL)conversationIsAVLessSharePlay:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v4, v5, v6);
  int isAVLessSharePlayEnabled = objc_msgSend_isAVLessSharePlayEnabled(v7, v8, v9, v10);

  if (isAVLessSharePlayEnabled) {
    BOOL v15 = objc_msgSend_avMode(v3, v12, v13, v14) == 0;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)platformSupportsStagingArea
{
  return 1;
}

@end