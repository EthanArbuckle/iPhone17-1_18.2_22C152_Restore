@interface MXAdditiveRoutingManager
+ (id)sharedInstance;
- (MXAdditiveRoutingManager)init;
- (NSArray)mostRecentActiveSessions;
- (NSDictionary)detailedRoutesDescription;
- (NSDictionary)vadIDToName;
- (NSDictionary)vadNameToID;
- (id)copyActiveSessionsInfo;
- (id)copyActiveVoiceOverSessionPlayingToOnDemandVAD;
- (id)copyAndUpdateSessionInformation:(id)a3;
- (id)copyDetailedRouteDescription:(unsigned int)a3;
- (id)copySessionWithAudioSessionID:(unsigned int)a3;
- (int)sendActiveSessionsInfoToVA;
- (void)dealloc;
- (void)setDetailedRoutesDescription:(id)a3;
- (void)setMostRecentActiveSessions:(id)a3;
- (void)setVadIDToName:(id)a3;
- (void)setVadNameToID:(id)a3;
- (void)updateDetailedRouteDescription:(unsigned int)a3;
@end

@implementation MXAdditiveRoutingManager

- (id)copyAndUpdateSessionInformation:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v90 objects:v104 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v91 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", 0x1EE5EFBA8, v57, v59), "unsignedIntValue");
        if (v8)
        {
          id v9 = [(MXAdditiveRoutingManager *)self copySessionWithAudioSessionID:v8];
          if (v9)
          {
            if (dword_1E9359ED0)
            {
              unsigned int v89 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            if (objc_msgSend(v9, "updateAudioBehaviourFromVARouteConfig:", v7, v57, v59)) {
              [v65 addObject:v9];
            }
            v12 = (void *)[v7 objectForKey:0x1EE5EFB88];
            uint64_t v13 = [v7 objectForKey:0x1EE5EFBC8];
            if (v12 && (uint64_t v14 = v13) != 0)
            {
              [v71 setObject:v13 forKey:v12];
              [v63 setObject:v12 forKey:v14];
              if (dword_1E9359ED0)
              {
                unsigned int v89 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[MXAdditiveRoutingManager updateDetailedRouteDescription:](self, "updateDetailedRouteDescription:", objc_msgSend(v12, "unsignedIntValue", v57, v59));
            }
            else
            {
              unsigned int v89 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            unsigned int v89 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
    }
    while (v4);
  }
  v17 = [(NSDictionary *)[(MXAdditiveRoutingManager *)self vadIDToName] allKeys];
  v18 = (void *)[v71 allKeys];
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v17)
  {
    v19 = (void *)[(NSDictionary *)[(MXAdditiveRoutingManager *)self detailedRoutesDescription] mutableCopy];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v20 = objc_msgSend((id)objc_msgSend(v18, "differenceFromArray:", v17), "removals");
    uint64_t v21 = [v20 countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v85 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          if (dword_1E9359ED0)
          {
            unsigned int v89 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v26 = v89;
            if (os_log_type_enabled(v25, type)) {
              unsigned int v27 = v26;
            }
            else {
              unsigned int v27 = v26 & 0xFFFFFFFE;
            }
            if (v27)
            {
              uint64_t v28 = [v24 object];
              int v97 = 136315394;
              v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
              __int16 v99 = 2114;
              uint64_t v100 = v28;
              LODWORD(v60) = 22;
              v58 = &v97;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(obja, "addObject:", objc_msgSend(v24, "object", v58, v60));
          objc_msgSend(v19, "removeObjectForKey:", objc_msgSend(v24, "object"));
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v84 objects:v96 count:16];
      }
      while (v21);
    }
    [(MXAdditiveRoutingManager *)self setDetailedRoutesDescription:v19];
  }
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = [+[MXSessionManager sharedInstance] copyMXCoreSessionList];
  id v61 = [+[MXSessionManagerSecure sharedInstance] copyMXCoreSessionSecureList];
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v66 addObjectsFromArray:v62];
  [v66 addObjectsFromArray:v61];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v70 = [v66 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v70)
  {
    uint64_t v69 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v70; ++k)
      {
        if (*(void *)v81 != v69) {
          objc_enumerationMutation(v66);
        }
        v30 = *(void **)(*((void *)&v80 + 1) + 8 * k);
        if (!-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", [v30 audioCategory]))
        {
          v31 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:CMSUtility_GetCurrentOutputVADID(v30)];
          v32 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:CMSUtility_GetCurrentInputVADID(v30)];
          uint64_t v33 = [v71 objectForKey:v31];
          uint64_t v34 = [v71 objectForKey:v32];
          if (v34) {
            BOOL v35 = 0;
          }
          else {
            BOOL v35 = v33 == 0;
          }
          if (v35)
          {
            if (([obja containsObject:v31] & 1) != 0
              || [obja containsObject:v32])
            {
              if (dword_1E9359ED0)
              {
                unsigned int v89 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v37 = v89;
                if (os_log_type_enabled(v36, type)) {
                  unsigned int v38 = v37;
                }
                else {
                  unsigned int v38 = v37 & 0xFFFFFFFE;
                }
                if (v38)
                {
                  uint64_t v39 = [v30 clientName];
                  int v97 = 136315394;
                  v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
                  __int16 v99 = 2114;
                  uint64_t v100 = v39;
                  LODWORD(v60) = 22;
                  v58 = &v97;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(v30, "setAudioBehaviour:", 0, v58, v60);
              [v30 setAudioDestinationPriority:0];
              cmsUpdateAudioBehavior(v30);
              [v67 addObject:v30];
              [v65 addObject:v30];
              if ([v30 isMemberOfClass:objc_opt_class()]) {
                CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(v30, 0);
              }
              goto LABEL_80;
            }
          }
          else if (v33 && v34)
          {
LABEL_80:

            continue;
          }
          if (([obja containsObject:v31] & 1) != 0
            || [obja containsObject:v32])
          {
            if (v33) {
              v40 = @"AudioBehaviour_Source";
            }
            else {
              v40 = @"AudioBehaviour_Destination";
            }
            v64 = CMSUtility_CopySessionAudioBehaviour(v30);
            v41 = objc_msgSend((id)objc_msgSend(v30, "audioBehaviour"), "mutableCopy");
            [v41 removeObjectForKey:v40];
            uint64_t v42 = [v64 objectForKey:v40];
            if (v42)
            {
              if (dword_1E9359ED0)
              {
                unsigned int v89 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v44 = v89;
                BOOL v45 = os_log_type_enabled(v43, type);
                unsigned int v46 = v44 & 0xFFFFFFFE;
                if (v45) {
                  unsigned int v46 = v44;
                }
                if (v46)
                {
                  uint64_t v47 = [v30 clientName];
                  int v97 = 136315650;
                  v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
                  __int16 v99 = 2114;
                  uint64_t v100 = v47;
                  __int16 v101 = 2114;
                  id v102 = v41;
                  LODWORD(v60) = 32;
                  v58 = &v97;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              [v41 setObject:v42 forKey:v40];
              [v30 setAudioBehaviour:v41];
              if (!v33) {
                [v30 setAudioDestinationPriority:v42];
              }
              CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(v30);
              if ([v30 isMemberOfClass:objc_opt_class()]) {
                CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(v30, 0);
              }
              objc_msgSend(v67, "addObject:", v30, v58, v60);
              [v65 addObject:v30];
            }
          }
          goto LABEL_80;
        }
      }
      uint64_t v70 = [v66 countByEnumeratingWithState:&v80 objects:v95 count:16];
    }
    while (v70);
  }

  if (dword_1E9359ED0)
  {
    unsigned int v89 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v49 = v89;
    if (os_log_type_enabled(v48, type)) {
      unsigned int v50 = v49;
    }
    else {
      unsigned int v50 = v49 & 0xFFFFFFFE;
    }
    if (v50)
    {
      int v97 = 136315650;
      v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
      __int16 v99 = 2114;
      uint64_t v100 = (uint64_t)v71;
      __int16 v101 = 2114;
      id v102 = v63;
      LODWORD(v60) = 32;
      v58 = &v97;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXAdditiveRoutingManager setVadIDToName:](self, "setVadIDToName:", v71, v58, v60);
  [(MXAdditiveRoutingManager *)self setVadNameToID:v63];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v51 = [v67 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v77 != v52) {
          objc_enumerationMutation(v67);
        }
        v54 = *(void **)(*((void *)&v76 + 1) + 8 * m);
        if ([v54 isActive])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_initWeak(location, v54);
            v55 = MXGetSerialQueue();
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __60__MXAdditiveRoutingManager_copyAndUpdateSessionInformation___block_invoke;
            v74[3] = &unk_1E57CB250;
            objc_copyWeak(&v75, location);
            MXDispatchAsync((uint64_t)"-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]", (uint64_t)"MXAdditiveRoutingManager.m", 380, 0, 0, v55, (uint64_t)v74);
            objc_destroyWeak(&v75);
            objc_destroyWeak(location);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              MXSimulateCrash((uint64_t)"Active MXCoreSessionSecure has lost an on-demand VAD! Please file a radar against"
            }
                                       " 'MediaExperience Session | All'");
          }
        }
      }
      uint64_t v51 = [v67 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v51);
  }

  return v65;
}

- (NSDictionary)vadNameToID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)vadIDToName
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVadNameToID:(id)a3
{
}

- (void)setVadIDToName:(id)a3
{
}

- (int)sendActiveSessionsInfoToVA
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int result = CMSMVAUtility_IsAdditiveRoutingEnabled();
  if (result)
  {
    int v11 = 0;
    id v4 = [(MXAdditiveRoutingManager *)self copyActiveSessionsInfo];
    if ((objc_msgSend(v4, "isEqual:", -[MXAdditiveRoutingManager mostRecentActiveSessions](self, "mostRecentActiveSessions")) & 1) == 0)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:v4 forKey:0x1EE5EF648];
      int v10 = 0;
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      int v11 = vaemSetRouteConfigurationDictionaryOnVAD((uint64_t)v5, 0, 0, &v10);
      if (v11)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXAdditiveRoutingManager setMostRecentActiveSessions:](self, "setMostRecentActiveSessions:", v4, v8, v9);
    }
    return v11;
  }
  return result;
}

- (id)copyActiveSessionsInfo
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [+[MXSessionManager sharedInstance] copyActiveSessionsInfoForAdditiveRouting];
  [v2 addObjectsFromArray:v3];

  id v4 = [+[MXSessionManagerSecure sharedInstance] copyActiveSessionsInfoForAdditiveRouting];
  [v2 addObjectsFromArray:v4];

  return v2;
}

- (NSArray)mostRecentActiveSessions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (id)copyActiveVoiceOverSessionPlayingToOnDemandVAD
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [+[MXSessionManager sharedInstance] mxCoreSessionListBeginIteration];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [+[MXSessionManager sharedInstance] mxCoreSessionList];
  uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 hasAudioCategory:@"VoiceOver"]
          && [v7 isActive]
          && [(id)CMSUtility_GetCurrentAudioDestination(v7) containsString:0x1EE5EBFC8])
        {
          id v8 = v7;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_13:
  [+[MXSessionManager sharedInstance] mxCoreSessionListEndIteration];
  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_74);
  }
  return (id)sharedInstance_sSharedInstance_11;
}

- (void)updateDetailedRouteDescription:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    CFMutableDictionaryRef v5 = vaemCopyDetailedRouteDescription(a3);
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXAdditiveRoutingManager detailedRoutesDescription](self, "detailedRoutesDescription"));
    objc_msgSend(v7, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v3));
    -[MXAdditiveRoutingManager setDetailedRoutesDescription:](self, "setDetailedRoutesDescription:", [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7]);
  }
}

- (NSDictionary)detailedRoutesDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDetailedRoutesDescription:(id)a3
{
}

- (void)setMostRecentActiveSessions:(id)a3
{
}

- (id)copyDetailedRouteDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(MXAdditiveRoutingManager *)self detailedRoutesDescription];
  id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v3]);
  if (!v5)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

MXAdditiveRoutingManager *__42__MXAdditiveRoutingManager_sharedInstance__block_invoke()
{
  int result = objc_alloc_init(MXAdditiveRoutingManager);
  sharedInstance_sSharedInstance_11 = (uint64_t)result;
  return result;
}

- (MXAdditiveRoutingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MXAdditiveRoutingManager;
  id v2 = [(MXAdditiveRoutingManager *)&v4 init];
  if (v2)
  {
    v2->_detailedRoutesDescription = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v2->_mostRecentActiveSessions = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  return v2;
}

- (void)dealloc
{
  self->_detailedRoutesDescription = 0;
  self->_mostRecentActiveSessions = 0;

  self->_vadIDToName = 0;
  self->_vadNameToID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXAdditiveRoutingManager;
  [(MXAdditiveRoutingManager *)&v3 dealloc];
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id result = [+[MXSessionManager sharedInstance] copySessionWithAudioSessionID:*(void *)&a3];
  if (!result)
  {
    id v5 = +[MXSessionManagerSecure sharedInstance];
    return [(MXSessionManagerSecure *)v5 copySessionWithAudioSessionID:v3];
  }
  return result;
}

void __60__MXAdditiveRoutingManager_copyAndUpdateSessionInformation___block_invoke(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    id v2 = Weak;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (cmsBeginInterruptionGuts(v2, 0, 2))
    {
      if (dword_1E9359ED0)
      {
        objc_super v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSUtilityApplier_PostNotification_StopCommand(v2, 0);
    }
  }
}

@end