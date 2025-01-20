@interface IMChorosMonitor
+ (id)chatIdentifierForRoadside:(int64_t)a3;
+ (id)roadsideProviderIDFromChatIdentifier:(id)a3;
+ (id)sharedInstance;
+ (int64_t)serviceFromChatIdentifier:(id)a3;
- (BOOL)_activeServicesHasEmergency:(id)a3;
- (BOOL)isMessagingActiveOverSatellite;
- (BOOL)isSatelliteConnectionActive;
- (BOOL)isStewieActive;
- (BOOL)isStewieEmergencyActive;
- (BOOL)isStewieRoadsideActive;
- (BOOL)shouldShowTextEmergencyServicesButton;
- (BOOL)shouldShowTextRoadsideProviderButton;
- (CTStewieStateMonitor)coreTelephonyStewieMonitor;
- (CoreTelephonyClient)telephonyClient;
- (IMChorosMonitor)init;
- (NSDictionary)emergencyHandles;
- (id)getState;
- (id)mostRecentlyUsedRoadsideChatIdentifier;
- (id)roadsideBusinessIDForChatIdentifier:(id)a3;
- (id)roadsideBusinessIDForProviderId:(int64_t)a3;
- (id)roadsideProviderForProviderId:(int64_t)a3;
- (id)roadsideProviderNameForChatIdentifier:(id)a3;
- (id)roadsideProviderNameForProviderId:(int64_t)a3;
- (int64_t)mostRecentlyUsedConversationForEmergency;
- (int64_t)mostRecentlyUsedConversationForRoadside;
- (void)openStewieAppForChatIdentifier:(id)a3 completion:(id)a4;
- (void)placeEmergencyCallToHandle:(id)a3 completion:(id)a4;
- (void)presentSatelliteConnectionBannerIfNecessaryWithChat:(id)a3 withReason:(id)a4 ignoreTimerLimit:(BOOL)a5;
- (void)setCoreTelephonyStewieMonitor:(id)a3;
- (void)setEmergencyHandles:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)startMonitor;
- (void)stateChanged:(id)a3;
@end

@implementation IMChorosMonitor

- (IMChorosMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMChorosMonitor;
  v2 = [(IMChorosMonitor *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F23A60]);
    uint64_t v5 = objc_msgSend_initWithDelegate_queue_(v3, v4, (uint64_t)v2, MEMORY[0x1E4F14428]);
    coreTelephonyStewieMonitor = v2->_coreTelephonyStewieMonitor;
    v2->_coreTelephonyStewieMonitor = (CTStewieStateMonitor *)v5;

    if (!v2->_coreTelephonyStewieMonitor)
    {
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Failed to load monitor", v9, 2u);
        }
      }
    }
  }
  return v2;
}

- (void)presentSatelliteConnectionBannerIfNecessaryWithChat:(id)a3 withReason:(id)a4 ignoreTimerLimit:(BOOL)a5
{
  BOOL v5 = a5;
  v125[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v13 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v10, v11, v12);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v13, v14, v15, v16);

  if (isCarrierPigeonEnabled && (!v8 || objc_msgSend_isSatelliteMessagingCompatible(v8, v18, v19, v20)))
  {
    BOOL v119 = v5;
    v21 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v18, 1, v20);
    v24 = objc_msgSend_objectForKey_(v21, v22, @"when-to-first-show-OTG-banner", v23);
    v122 = objc_msgSend_objectForKey_(v21, v25, @"how-often-to-show-OTG-banner", v26);
    v29 = objc_msgSend_objectForKey_(v21, v27, @"when-to-stop-showing-OTG-banner", v28);
    v33 = objc_msgSend_messagesAppDomain(MEMORY[0x1E4F1CB18], v30, v31, v32);
    v34 = (uint64_t *)MEMORY[0x1E4F6DEB8];
    uint64_t v37 = objc_msgSend_integerForKey_(v33, v35, *MEMORY[0x1E4F6DEB8], v36);

    v41 = objc_msgSend_messagesAppDomain(MEMORY[0x1E4F1CB18], v38, v39, v40);
    uint64_t v121 = objc_msgSend_integerForKey_(v41, v42, *MEMORY[0x1E4F6E428], v43);

    v47 = objc_msgSend_getState(self, v44, v45, v46);
    if ((objc_msgSend_allowedServices(v47, v48, v49, v50) & 0x3D) == 0) {
      goto LABEL_27;
    }
    v120 = v24;
    v54 = objc_msgSend_messagesAppDomain(MEMORY[0x1E4F1CB18], v51, v52, v53);
    objc_msgSend_setInteger_forKey_(v54, v55, v37 + 1, *v34);

    if (objc_msgSend_integerValue(v29, v56, v57, v58) >= 1 && v121 >= objc_msgSend_integerValue(v29, v59, v60, v61))
    {
      v24 = v120;
      if (_IMWillLog())
      {
        objc_msgSend_integerValue(v29, v73, v74, v75);
        goto LABEL_16;
      }
      goto LABEL_27;
    }
    v24 = v120;
    if (objc_msgSend_integerValue(v122, v59, v60, v61) && v37 % objc_msgSend_integerValue(v122, v62, v63, v64))
    {
      if (_IMWillLog())
      {
        objc_msgSend_integerValue(v122, v65, v66, v67);
LABEL_16:
        _IMAlwaysLog();
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (objc_msgSend_integerValue(v120, v62, v63, v64) - 1 > v37)
    {
      if (_IMWillLog())
      {
        objc_msgSend_integerValue(v120, v70, v71, v72);
        goto LABEL_16;
      }
LABEL_27:

      goto LABEL_28;
    }
    v76 = objc_msgSend_objectForKey_(v21, v68, @"limit-to-start-showing-OTG-banner", v69);
    uint64_t v80 = objc_msgSend_integerValue(v76, v77, v78, v79);

    if (v80 <= 0) {
      uint64_t v84 = 600;
    }
    else {
      uint64_t v84 = v80;
    }
    v85 = objc_msgSend_messagesAppDomain(MEMORY[0x1E4F1CB18], v81, v82, v83);
    int v88 = objc_msgSend_BOOLForKey_(v85, v86, IMIgnoreTimerLimit, v87);

    v92 = objc_msgSend_messagesAppDomain(MEMORY[0x1E4F1CB18], v89, v90, v91);
    v95 = objc_msgSend_objectForKey_(v92, v93, *MEMORY[0x1E4F6DDB0], v94);

    v99 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v96, v97, v98);
    objc_msgSend_timeIntervalSinceDate_(v95, v100, (uint64_t)v99, v101);
    double v103 = fabs(v102);

    if (v103 >= (double)v84)
    {
      if (objc_msgSend_isEqualToString_(v9, v104, IMReasonDidBeginTyping, v105))
      {
LABEL_26:

        v24 = v120;
        goto LABEL_27;
      }
    }
    else if (((v119 | v88) & 1) == 0)
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      goto LABEL_26;
    }
    id v106 = objc_alloc_init(MEMORY[0x1E4F23A48]);
    objc_msgSend_setReason_(v106, v107, 8, v108);
    uint64_t v109 = *MEMORY[0x1E4F24270];
    v124[0] = *MEMORY[0x1E4F24268];
    v124[1] = v109;
    v125[0] = MEMORY[0x1E4F1CC38];
    v125[1] = v9;
    v111 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v110, (uint64_t)v125, (uint64_t)v124, 2);
    objc_msgSend_setMetadata_(v106, v112, (uint64_t)v111, v113);

    v117 = objc_msgSend_telephonyClient(self, v114, v115, v116);
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = sub_1A4BADD90;
    v123[3] = &unk_1E5B7CD00;
    v123[4] = v121;
    objc_msgSend_requestStewieWithContext_completion_(v117, v118, (uint64_t)v106, (uint64_t)v123);

    goto LABEL_26;
  }
LABEL_28:
}

+ (id)sharedInstance
{
  if (qword_1EB3F24D0 != -1) {
    dispatch_once(&qword_1EB3F24D0, &unk_1EF8E5458);
  }
  v2 = (void *)qword_1EB3F2530;

  return v2;
}

- (BOOL)isStewieActive
{
  v4 = objc_msgSend_getState(self, a2, v2, v3);
  char isActiveService = 1;
  if ((objc_msgSend_isActiveService_(v4, v6, 1, v7) & 1) == 0) {
    char isActiveService = objc_msgSend_isActiveService_(v4, v8, 8, v9);
  }

  return isActiveService;
}

- (BOOL)isSatelliteConnectionActive
{
  BOOL v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (!isCarrierPigeonEnabled) {
    return 0;
  }
  v13 = objc_msgSend_getState(self, v10, v11, v12);
  char isStewieActiveOverBB = objc_msgSend_isStewieActiveOverBB(v13, v14, v15, v16);

  return isStewieActiveOverBB;
}

- (BOOL)isMessagingActiveOverSatellite
{
  BOOL v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (!isCarrierPigeonEnabled) {
    return 0;
  }
  v13 = objc_msgSend_getState(self, v10, v11, v12);
  char isActiveService = objc_msgSend_isActiveService_(v13, v14, 16, v15);
  int v19 = objc_msgSend_isActiveService_(v13, v17, 32, v18);
  if ((isActiveService & 1) != 0 || v19) {
    char isStewieActiveOverBB = objc_msgSend_isStewieActiveOverBB(v13, v20, v21, v22);
  }
  else {
    char isStewieActiveOverBB = 0;
  }

  return isStewieActiveOverBB;
}

- (id)getState
{
  return (id)objc_msgSend_getState(self->_coreTelephonyStewieMonitor, a2, v2, v3);
}

- (void)startMonitor
{
  char v5 = objc_msgSend_start(self->_coreTelephonyStewieMonitor, a2, v2, v3);
  int v6 = IMOSLoggingEnabled();
  if ((v5 & 1) == 0)
  {
    if (!v6) {
      return;
    }
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Failed to start the monitor", buf, 2u);
    }
    goto LABEL_11;
  }
  if (v6)
  {
    objc_super v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Loaded monitor", v17, 2u);
    }
  }
  if (objc_msgSend_isSatelliteConnectionActive(self, v7, v8, v9))
  {
    v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    objc_msgSend___mainThreadPostNotificationName_object_(v14, v15, @"IMChorosMonitorStewieStatusChangedNotification", 0);
LABEL_11:

    return;
  }
  if ((objc_msgSend_isStewieActive(self, v11, v12, v13) & 1) == 0) {
    objc_msgSend_presentSatelliteConnectionBannerIfNecessaryWithChat_withReason_ignoreTimerLimit_(self, v16, 0, @"AppOpen", 0);
  }
}

- (CoreTelephonyClient)telephonyClient
{
  telephonyClient = self->_telephonyClient;
  if (!telephonyClient)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F23A80]);
    uint64_t v7 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v4, v5, MEMORY[0x1E4F14428], v6);
    uint64_t v8 = self->_telephonyClient;
    self->_telephonyClient = v7;

    telephonyClient = self->_telephonyClient;
  }

  return telephonyClient;
}

- (void)stateChanged:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v22 = 134218752;
      uint64_t active = objc_msgSend_activeServices(v3, v8, v9, v10);
      __int16 v24 = 2048;
      uint64_t v25 = objc_msgSend_allowedServices(v3, v11, v12, v13);
      __int16 v26 = 2048;
      uint64_t v27 = objc_msgSend_status(v3, v14, v15, v16);
      __int16 v28 = 2048;
      uint64_t v29 = objc_msgSend_transportType(v3, v17, v18, v19);
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Stewie status changed to: activeServices: %ld - allowedServices: %ld - status: %ld - transport: %ld", (uint8_t *)&v22, 0x2Au);
    }
  }
  uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  objc_msgSend___mainThreadPostNotificationName_object_(v20, v21, @"IMChorosMonitorStewieStatusChangedNotification", 0);
}

- (BOOL)isStewieEmergencyActive
{
  id v4 = objc_msgSend_getState(self, a2, v2, v3);
  char isActiveService = objc_msgSend_isActiveService_(v4, v5, 1, v6);

  return isActiveService;
}

- (BOOL)shouldShowTextEmergencyServicesButton
{
  id v4 = objc_msgSend_getState(self, a2, v2, v3);
  if (objc_msgSend_isActiveService_(v4, v5, 1, v6)) {
    char isAllowedService = 0;
  }
  else {
    char isAllowedService = objc_msgSend_isAllowedService_(v4, v7, 1, v8);
  }

  return isAllowedService;
}

- (void)openStewieAppForChatIdentifier:(id)a3 completion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F23A48]);
  if (!IMIsStringStewieEmergency())
  {
    if (IMIsStringStewieRoadside())
    {
      uint64_t v13 = objc_msgSend_roadsideProviderIDFromChatIdentifier_(IMChorosMonitor, v11, (uint64_t)v6, v12);
      uint64_t v15 = (void *)v13;
      if (v13)
      {
        uint64_t v31 = *MEMORY[0x1E4F24278];
        v32[0] = v13;
        uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v32, (uint64_t)&v31, 1);
        objc_msgSend_setMetadata_(v8, v17, (uint64_t)v16, v18);

        objc_msgSend_setReason_(v8, v19, 7, v20);
        goto LABEL_6;
      }
      uint64_t v27 = IMLogHandleForCategory();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v27 = IMLogHandleForCategory();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    sub_1A4CB8370();
    goto LABEL_11;
  }
  objc_msgSend_setReason_(v8, v9, 2, v10);
LABEL_6:
  if (IMOSLoggingEnabled())
  {
    __int16 v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Requesting to open application", buf, 2u);
    }
  }
  uint64_t v25 = objc_msgSend_telephonyClient(self, v21, v22, v23);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1A4BC1F58;
  v28[3] = &unk_1E5B7D110;
  uint64_t v29 = v7;
  objc_msgSend_requestStewieWithContext_completion_(v25, v26, (uint64_t)v8, (uint64_t)v28);

  uint64_t v27 = v29;
LABEL_11:
}

- (void)placeEmergencyCallToHandle:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
  id v8 = objc_alloc(MEMORY[0x1E4FADBC0]);
  uint64_t v12 = objc_msgSend_emergencyProvider(v7, v9, v10, v11);
  uint64_t v15 = objc_msgSend_initWithProvider_(v8, v13, (uint64_t)v12, v14);

  objc_msgSend_setDialType_(v15, v16, 1, v17);
  if (v5)
  {
    objc_msgSend_setHandle_(v15, v18, (uint64_t)v5, v19);
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = objc_msgSend_handle(v15, v21, v22, v23);
        __int16 v28 = objc_msgSend_value(v24, v25, v26, v27);
        *(_DWORD *)buf = 138412290;
        v44 = v28;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Requesting a specific handle %@ in the dial request.", buf, 0xCu);
      }
    }
  }
  uint64_t v29 = IMLogHandleForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB84D8();
  }

  if (objc_msgSend_isValid(v15, v30, v31, v32))
  {
    uint64_t v36 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v33, v34, v35);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1A4BC230C;
    v41[3] = &unk_1E5B7D110;
    id v42 = v6;
    objc_msgSend_launchAppForDialRequest_completion_(v36, v37, (uint64_t)v15, (uint64_t)v41);

    v38 = v42;
  }
  else
  {
    uint64_t v39 = IMLogHandleForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8470();
    }

    v38 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v40, @"IMChorosMonitorPlaceEmergencyCallErrorDomain", 1, 0);
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v38);
    }
  }
}

- (NSDictionary)emergencyHandles
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  emergencyHandles = self->_emergencyHandles;
  if (!emergencyHandles)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
    uint64_t v9 = objc_msgSend_emergencyProvider(v5, v6, v7, v8);
    uint64_t v13 = v9;
    if (v9)
    {
      uint64_t v14 = objc_msgSend_emergencyLabeledHandles(v9, v10, v11, v12);

      if (v14)
      {
        id v43 = v5;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v15 = objc_msgSend_emergencyLabeledHandles(v13, v10, v11, v12);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v44, (uint64_t)v48, 16);
        if (v17)
        {
          uint64_t v21 = v17;
          uint64_t v22 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v15);
              }
              __int16 v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              uint64_t v25 = objc_msgSend_label(v24, v18, v19, v20);

              uint64_t v32 = objc_msgSend_handle(v24, v26, v27, v28);
              if (v25)
              {
                v33 = objc_msgSend_label(v24, v29, v30, v31);
                objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v32, (uint64_t)v33);
              }
              else
              {
                v33 = objc_msgSend_handle(v24, v29, v30, v31);
                v38 = objc_msgSend_value(v33, v35, v36, v37);
                objc_msgSend_setObject_forKeyedSubscript_(v4, v39, (uint64_t)v32, (uint64_t)v38);
              }
            }
            uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v44, (uint64_t)v48, 16);
          }
          while (v21);
        }

        id v5 = v43;
      }
    }
    uint64_t v40 = (NSDictionary *)objc_msgSend_copy(v4, v10, v11, v12);
    v41 = self->_emergencyHandles;
    self->_emergencyHandles = v40;

    emergencyHandles = self->_emergencyHandles;
  }

  return emergencyHandles;
}

- (BOOL)_activeServicesHasEmergency:(id)a3
{
  return objc_msgSend_activeServices(a3, a2, (uint64_t)a3, v3) & 1;
}

- (int64_t)mostRecentlyUsedConversationForEmergency
{
  return IMGetDomainIntForKey();
}

+ (int64_t)serviceFromChatIdentifier:(id)a3
{
  id v3 = a3;
  if (IMIsStringStewieEmergency())
  {
    int64_t v4 = 1;
  }
  else if (IMIsStringStewieRoadside())
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isStewieRoadsideActive
{
  int64_t v4 = objc_msgSend_getState(self, a2, v2, v3);
  char isActiveService = objc_msgSend_isActiveService_(v4, v5, 8, v6);

  return isActiveService;
}

- (BOOL)shouldShowTextRoadsideProviderButton
{
  int64_t v4 = objc_msgSend_getState(self, a2, v2, v3);
  if (objc_msgSend_isActiveService_(v4, v5, 8, v6)) {
    char isAllowedService = 0;
  }
  else {
    char isAllowedService = objc_msgSend_isAllowedService_(v4, v7, 8, v8);
  }

  return isAllowedService;
}

+ (id)chatIdentifierForRoadside:(int64_t)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@:%lld", v3, *MEMORY[0x1E4F6E350], a3);
}

- (id)mostRecentlyUsedRoadsideChatIdentifier
{
  uint64_t v2 = IMGetDomainIntForKey();

  return (id)MEMORY[0x1F4181798](IMChorosMonitor, sel_chatIdentifierForRoadside_, v2, v3);
}

- (int64_t)mostRecentlyUsedConversationForRoadside
{
  return IMGetDomainIntForKey();
}

+ (id)roadsideProviderIDFromChatIdentifier:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_serviceFromChatIdentifier_(IMChorosMonitor, v4, (uint64_t)v3, v5) == 8)
  {
    uint64_t v8 = objc_msgSend_componentsSeparatedByString_(v3, v6, @":", v7);
    if ((unint64_t)objc_msgSend_count(v8, v9, v10, v11) >= 3)
    {
      uint64_t v13 = objc_opt_new();
      uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v8, v14, 2, v15);
      uint64_t v12 = objc_msgSend_numberFromString_(v13, v17, (uint64_t)v16, v18);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)roadsideProviderForProviderId:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_telephonyClient(self, a2, a3, v3);
  uint64_t v6 = objc_opt_new();
  id v21 = 0;
  uint64_t v8 = objc_msgSend_fetchRoadsideProvidersWithContext_error_(v5, v7, (uint64_t)v6, (uint64_t)&v21);
  id v9 = v21;

  if (v9)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB85EC();
    }
LABEL_4:
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB85A8(v13);
    }
    goto LABEL_4;
  }
  uint64_t v13 = objc_msgSend_providers(v8, v10, v11, v12);
  uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v15, a3, v16);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v13, v18, (uint64_t)v17, v19);

LABEL_7:

  return v14;
}

- (id)roadsideProviderNameForProviderId:(int64_t)a3
{
  int64_t v4 = objc_msgSend_roadsideProviderForProviderId_(self, a2, a3, v3);
  uint64_t v8 = objc_msgSend_providerName(v4, v5, v6, v7);

  return v8;
}

- (id)roadsideBusinessIDForProviderId:(int64_t)a3
{
  int64_t v4 = objc_msgSend_roadsideProviderForProviderId_(self, a2, a3, v3);
  uint64_t v8 = objc_msgSend_bizId(v4, v5, v6, v7);

  if (objc_msgSend__appearsToBeBusinessID(v8, v9, v10, v11)) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)roadsideProviderNameForChatIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedRegistry(IMChatRegistry, v5, v6, v7);
  uint64_t v11 = objc_msgSend_existingChatWithChatIdentifier_(v8, v9, (uint64_t)v4, v10);

  uint64_t v15 = objc_msgSend_displayName(v11, v12, v13, v14);
  if (v15)
  {
    id v18 = v15;
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v20 = objc_msgSend_roadsideProviderIDFromChatIdentifier_(IMChorosMonitor, v16, (uint64_t)v4, v17);
    __int16 v24 = v20;
    if (v20
      && (uint64_t v25 = objc_msgSend_integerValue(v20, v21, v22, v23),
          objc_msgSend_roadsideProviderNameForProviderId_(self, v26, v25, v27),
          (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v18 = v28;
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v29 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v29, v30, @"STEWIE_ROADSIDE_FALLBACK_HANDLE_NAME", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable-Avocet");
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v19 = 0;
    }
  }

  return v18;
}

- (id)roadsideBusinessIDForChatIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedRegistry(IMChatRegistry, v5, v6, v7);
  uint64_t v11 = objc_msgSend_existingChatWithChatIdentifier_(v8, v9, (uint64_t)v4, v10);

  uint64_t v15 = objc_msgSend_associatedBusinessID(v11, v12, v13, v14);
  if (v15)
  {
    id v18 = v15;
  }
  else
  {
    uint64_t v19 = objc_msgSend_roadsideProviderIDFromChatIdentifier_(IMChorosMonitor, v16, (uint64_t)v4, v17);
    uint64_t v23 = v19;
    if (v19)
    {
      uint64_t v24 = objc_msgSend_integerValue(v19, v20, v21, v22);
      uint64_t v19 = objc_msgSend_roadsideBusinessIDForProviderId_(self, v25, v24, v26);
    }
    id v18 = v19;
  }

  return v18;
}

- (void)setEmergencyHandles:(id)a3
{
}

- (CTStewieStateMonitor)coreTelephonyStewieMonitor
{
  return self->_coreTelephonyStewieMonitor;
}

- (void)setCoreTelephonyStewieMonitor:(id)a3
{
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyStewieMonitor, 0);

  objc_storeStrong((id *)&self->_emergencyHandles, 0);
}

@end