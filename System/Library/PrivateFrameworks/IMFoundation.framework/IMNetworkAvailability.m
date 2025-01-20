@interface IMNetworkAvailability
- (BOOL)_isNetworkAvailablibityCheckingDone:(BOOL)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5 cellular:(BOOL)a6 hasCellularDataConnection:(BOOL)a7 done:(BOOL)a8 withinTimeWindow:(BOOL)a9;
- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 options:(unint64_t)a4 timeout:(double)a5 wifiTimeout:(double)a6 completionBlock:(id)a7;
- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 timeout:(double)a4 wifiTimeout:(double)a5 completionBlock:(id)a6;
- (id)mobileNetworkManager;
- (void)_cancel;
- (void)_setTimer;
- (void)_timerHit:(id)a3;
- (void)cancel;
- (void)context;
- (void)dealloc;
- (void)setContext:(void *)a3;
- (void)start;
@end

@implementation IMNetworkAvailability

- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 options:(unint64_t)a4 timeout:(double)a5 wifiTimeout:(double)a6 completionBlock:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  v36.receiver = self;
  v36.super_class = (Class)IMNetworkAvailability;
  v13 = [(IMNetworkAvailability *)&v36 init];
  if (v13)
  {
    v14 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v38 = a3;
      *(_WORD *)&v38[4] = 2048;
      *(double *)&v38[6] = a5;
      __int16 v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_191892000, v14, OS_LOG_TYPE_DEFAULT, "Creating availabilty with: 0x%X    Timeout: %f  (%@)", buf, 0x1Cu);
    }

    uint64_t v18 = objc_msgSend_copyStringGUID(NSString, v15, v16, v17);
    guid = v13->_guid;
    v13->_guid = (NSString *)v18;

    uint64_t v23 = objc_msgSend_copy(v12, v20, v21, v22);
    id completionBlock = v13->_completionBlock;
    v13->_id completionBlock = (id)v23;

    v13->_flags = a3;
    v13->_options = a4;
    v13->_timeout = a5;
    v13->_wifiTimeout = a6;
    v25 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_flags & 2) != 0) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v26;
      _os_log_impl(&dword_191892000, v25, OS_LOG_TYPE_DEFAULT, "            Wants Cellular: %@", buf, 0xCu);
    }

    v27 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (v13->_flags) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v28;
      _os_log_impl(&dword_191892000, v27, OS_LOG_TYPE_DEFAULT, "                Wants WiFi: %@", buf, 0xCu);
    }

    v29 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      if (v13->_options) {
        v30 = @"YES";
      }
      else {
        v30 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v30;
      _os_log_impl(&dword_191892000, v29, OS_LOG_TYPE_DEFAULT, "       Allow Early Timeout: %@", buf, 0xCu);
    }

    v31 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_options & 2) != 0) {
        v32 = @"YES";
      }
      else {
        v32 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v32;
      _os_log_impl(&dword_191892000, v31, OS_LOG_TYPE_DEFAULT, "      Show Network Options: %@", buf, 0xCu);
    }

    v33 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_options & 4) != 0) {
        v34 = @"YES";
      }
      else {
        v34 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v38 = v34;
      _os_log_impl(&dword_191892000, v33, OS_LOG_TYPE_DEFAULT, "       Don't wait for wifi: %@", buf, 0xCu);
    }
  }
  return v13;
}

- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 timeout:(double)a4 wifiTimeout:(double)a5 completionBlock:(id)a6
{
  return (IMNetworkAvailability *)MEMORY[0x1F4181798](self, sel_initWithFlags_options_timeout_wifiTimeout_completionBlock_, a3, 0);
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t flags = self->_flags;
    *(_DWORD *)buf = 67109378;
    int v10 = flags;
    __int16 v11 = 2112;
    id v12 = self;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc availabilty with: 0x%X  (%@)", buf, 0x12u);
  }

  self->_context = 0;
  objc_msgSend_invalidate(self->_timer, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)IMNetworkAvailability;
  [(IMNetworkAvailability *)&v8 dealloc];
}

- (void)_cancel
{
  timer = self->_timer;
  if (timer)
  {
    objc_msgSend_invalidate(timer, a2, v2, v3);
    uint64_t v6 = self->_timer;
    self->_timer = 0;
  }
  unint64_t flags = self->_flags;
  if (flags)
  {
    objc_super v8 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "  => Removing assertion for WiFi desired", buf, 2u);
    }

    id v12 = objc_msgSend_mobileNetworkManager(self, v9, v10, v11);
    objc_msgSend_removeWiFiAutoAssociationClientToken_(v12, v13, (uint64_t)self->_guid, v14);

    unint64_t flags = self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v15 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_191892000, v15, OS_LOG_TYPE_DEFAULT, "  => Removing assertion for Cellular desired", v22, 2u);
    }

    v19 = objc_msgSend_mobileNetworkManager(self, v16, v17, v18);
    objc_msgSend_removeCellularAutoAssociationClientToken_(v19, v20, (uint64_t)self->_guid, v21);
  }
}

- (BOOL)_isNetworkAvailablibityCheckingDone:(BOOL)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5 cellular:(BOOL)a6 hasCellularDataConnection:(BOOL)a7 done:(BOOL)a8 withinTimeWindow:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    if (a7 && a8 && !a6)
    {
      if (a4)
      {
        if (a3) {
          return v9;
        }
        id v12 = OSLogHandleForIDSCategory("NetworkAvailability");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_DEFAULT, "Cellular is not yet reachable and we don't have a usable wifi, we're not done", (uint8_t *)&v17, 2u);
        }
      }
      else
      {
        id v12 = OSLogHandleForIDSCategory("NetworkAvailability");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_DEFAULT, "Cellular is not yet reachable and we don't want wifi, we're not done", (uint8_t *)&v17, 2u);
        }
      }

      BOOL v9 = 0;
    }
    if (!a3 && !a6)
    {
      uint64_t v13 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = @"NO";
        if (a9) {
          v15 = @"YES";
        }
        else {
          v15 = @"NO";
        }
        if (v9) {
          uint64_t v14 = @"YES";
        }
        int v17 = 138412546;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_191892000, v13, OS_LOG_TYPE_DEFAULT, "No available interfaces, withinTimeWindow: %@, done: %@", (uint8_t *)&v17, 0x16u);
      }

      LOBYTE(v9) = v9 && !a9;
    }
  }
  return v9;
}

- (void)_timerHit:(id)a3
{
  uint64_t v238 = *MEMORY[0x1E4F143B8];
  id v222 = a3;
  v4 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v237 = self;
    _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEFAULT, "Timer hit: %@", buf, 0xCu);
  }

  objc_super v8 = objc_msgSend_mobileNetworkManager(self, v5, v6, v7);
  int isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v8, v9, v10, v11);

  unint64_t options = self->_options;
  int v17 = objc_msgSend_mobileNetworkManager(self, v14, v15, v16);
  int isWiFiEnabled = objc_msgSend_isWiFiEnabled(v17, v18, v19, v20);

  v25 = objc_msgSend_mobileNetworkManager(self, v22, v23, v24);
  int isWiFiAssociated = objc_msgSend_isWiFiAssociated(v25, v26, v27, v28);

  v32 = objc_msgSend_mobileNetworkManager(self, v29, v30, v31);
  int isWiFiCaptive = objc_msgSend_isWiFiCaptive(v32, v33, v34, v35);

  __int16 v39 = objc_msgSend_mobileNetworkManager(self, v36, v37, v38);
  int v43 = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v39, v40, v41, v42);

  v47 = objc_msgSend_mobileNetworkManager(self, v44, v45, v46);
  int v223 = objc_msgSend_willTryToSearchForWiFiNetwork(v47, v48, v49, v50);

  unint64_t v235 = self->_options;
  v54 = objc_msgSend_mobileNetworkManager(self, v51, v52, v53);
  int isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v54, v55, v56, v57);

  v62 = objc_msgSend_mobileNetworkManager(self, v59, v60, v61);
  int valid = objc_msgSend_inValidSIMState(v62, v63, v64, v65);

  v70 = objc_msgSend_mobileNetworkManager(self, v67, v68, v69);
  int v229 = objc_msgSend_dataConnectionExists(v70, v71, v72, v73);

  v77 = objc_msgSend_mobileNetworkManager(self, v74, v75, v76);
  int isDataSwitchEnabled = objc_msgSend_isDataSwitchEnabled(v77, v78, v79, v80);

  v84 = objc_msgSend_mobileNetworkManager(self, v81, v82, v83);
  int isDataConnectionActive = objc_msgSend_isDataConnectionActive(v84, v85, v86, v87);

  v91 = objc_msgSend_mobileNetworkManager(self, v88, v89, v90);
  int hasLTEDataConnection = objc_msgSend_hasLTEDataConnection(v91, v92, v93, v94);

  v230 = objc_msgSend_reachabilityForInternetConnection(IMNetworkReachability, v95, v96, v97);
  uint64_t v104 = objc_msgSend_currentReachabilityStatus(v230, v98, v99, v100);
  int v105 = isWiFiAssociated;
  if (v104 == 1) {
    int v105 = 1;
  }
  int v221 = v105;
  unint64_t flags = self->_flags;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v101, v102, v103);
  double v108 = v107;
  int v232 = isWiFiEnabled & (isHostingWiFiHotSpot ^ 1);
  int v226 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid;
  if (flags)
  {
    int v109 = isWiFiEnabled & (isHostingWiFiHotSpot ^ 1) & isWiFiAssociated;
    if (v104 != 1) {
      int v109 = 0;
    }
    unsigned int v234 = v109 & (isWiFiCaptive ^ 1) | isHostingWiFiHotSpot & (options >> 4);
  }
  else
  {
    unsigned int v234 = 0;
  }
  double wifiTimeout = self->_wifiTimeout;
  double startTime = self->_startTime;
  unsigned int v225 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid & isDataConnectionActive;
  if (v104 == 2) {
    uint64_t v112 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid & isDataConnectionActive & (flags >> 1);
  }
  else {
    uint64_t v112 = 0;
  }
  v113 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v113, OS_LOG_TYPE_DEFAULT, "****************************** NETWORK AVAILABILITY CHECK ******************************", buf, 2u);
  }

  double v114 = v108 - startTime;
  v115 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&v114;
    _os_log_impl(&dword_191892000, v115, OS_LOG_TYPE_DEFAULT, "               Time Passed: %f", buf, 0xCu);
  }

  v116 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    double timeout = self->_timeout;
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&timeout;
    _os_log_impl(&dword_191892000, v116, OS_LOG_TYPE_DEFAULT, "                   Timeout: %f", buf, 0xCu);
  }

  v118 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&wifiTimeout;
    _os_log_impl(&dword_191892000, v118, OS_LOG_TYPE_DEFAULT, "              WiFi Timeout: %f", buf, 0xCu);
  }

  v119 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    v120 = @"YES";
    if ((v235 & 1) == 0) {
      v120 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v120;
    _os_log_impl(&dword_191892000, v119, OS_LOG_TYPE_DEFAULT, "       Allow Early Timeout: %@", buf, 0xCu);
  }

  v121 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    v122 = @"NO";
    if ((options & 0x10) != 0) {
      v122 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v122;
    _os_log_impl(&dword_191892000, v121, OS_LOG_TYPE_DEFAULT, "        Allow WiFi HotSpot: %@", buf, 0xCu);
  }

  v123 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
  {
    v124 = @"YES";
    if ((v235 & 2) == 0) {
      v124 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v124;
    _os_log_impl(&dword_191892000, v123, OS_LOG_TYPE_DEFAULT, "      Show Network Options: %@", buf, 0xCu);
  }

  v125 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    v126 = @"NO";
    if ((v235 & 4) != 0) {
      v126 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v126;
    _os_log_impl(&dword_191892000, v125, OS_LOG_TYPE_DEFAULT, "             Wait For WiFi: %@", buf, 0xCu);
  }

  v127 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    v128 = @"NO";
    if ((v235 & 8) != 0) {
      v128 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v128;
    _os_log_impl(&dword_191892000, v127, OS_LOG_TYPE_DEFAULT, "      Wait For WiFi or LTE: %@", buf, 0xCu);
  }

  v129 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v129, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  v130 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    v131 = @"NO";
    if (v232) {
      v131 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v131;
    _os_log_impl(&dword_191892000, v130, OS_LOG_TYPE_DEFAULT, "       WiFi Switch Enabled: %@", buf, 0xCu);
  }

  v132 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    v133 = @"NO";
    if (isDataSwitchEnabled) {
      v133 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v133;
    _os_log_impl(&dword_191892000, v132, OS_LOG_TYPE_DEFAULT, "       Data Switch Enabled: %@", buf, 0xCu);
  }

  v134 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
  {
    v135 = @"NO";
    if (isAirplaneModeEnabled) {
      v135 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v135;
    _os_log_impl(&dword_191892000, v134, OS_LOG_TYPE_DEFAULT, "     Airplane Mode Enabled: %@", buf, 0xCu);
  }

  v136 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    v137 = @"NO";
    if (isHostingWiFiHotSpot) {
      v137 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v137;
    _os_log_impl(&dword_191892000, v136, OS_LOG_TYPE_DEFAULT, "      WiFi HotSpot Enabled: %@", buf, 0xCu);
  }

  v138 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
  {
    v139 = @"NO";
    if (valid) {
      v139 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v139;
    _os_log_impl(&dword_191892000, v138, OS_LOG_TYPE_DEFAULT, "        In Valid SIM State: %@", buf, 0xCu);
  }

  v140 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v140, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  v141 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    v142 = @"NO";
    if (v43) {
      v142 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v142;
    _os_log_impl(&dword_191892000, v141, OS_LOG_TYPE_DEFAULT, "  Will Auto-Associate WiFi: %@", buf, 0xCu);
  }

  int v143 = v223 | v43;
  v144 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    v145 = @"NO";
    if (v143) {
      v145 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v145;
    _os_log_impl(&dword_191892000, v144, OS_LOG_TYPE_DEFAULT, "      Will Search For WiFi: %@", buf, 0xCu);
  }

  v146 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
  {
    v147 = @"NO";
    if (isWiFiAssociated) {
      v147 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v147;
    _os_log_impl(&dword_191892000, v146, OS_LOG_TYPE_DEFAULT, "           WiFi Associated: %@", buf, 0xCu);
  }

  v148 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
  {
    v149 = @"NO";
    if (isWiFiCaptive) {
      v149 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v149;
    _os_log_impl(&dword_191892000, v148, OS_LOG_TYPE_DEFAULT, "              WiFi Captive: %@", buf, 0xCu);
  }

  v150 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v150, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  v151 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
  {
    v152 = @"NO";
    if (v226) {
      v152 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v152;
    _os_log_impl(&dword_191892000, v151, OS_LOG_TYPE_DEFAULT, "              Data Enabled: %@", buf, 0xCu);
  }

  v153 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
  {
    v154 = @"NO";
    if (v229) {
      v154 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v154;
    _os_log_impl(&dword_191892000, v153, OS_LOG_TYPE_DEFAULT, "    Data Connection Exists: %@", buf, 0xCu);
  }

  v155 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    v156 = @"NO";
    if (isDataConnectionActive) {
      v156 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v156;
    _os_log_impl(&dword_191892000, v155, OS_LOG_TYPE_DEFAULT, " Data Connection Is Active: %@", buf, 0xCu);
  }

  v157 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
  {
    v158 = @"NO";
    if (v225) {
      v158 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v158;
    _os_log_impl(&dword_191892000, v157, OS_LOG_TYPE_DEFAULT, "             Has Cell Data: %@", buf, 0xCu);
  }

  v159 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
  {
    v160 = @"NO";
    if (hasLTEDataConnection) {
      v160 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v160;
    _os_log_impl(&dword_191892000, v159, OS_LOG_TYPE_DEFAULT, "              Has LTE Data: %@", buf, 0xCu);
  }

  v161 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
  {
    v162 = @"NO";
    if (isDataSwitchEnabled) {
      v162 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v162;
    _os_log_impl(&dword_191892000, v161, OS_LOG_TYPE_DEFAULT, "       Data Switch Enabled: %@", buf, 0xCu);
  }

  v163 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v163, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  v164 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
  {
    v165 = @"NO";
    if (v221) {
      v165 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v165;
    _os_log_impl(&dword_191892000, v164, OS_LOG_TYPE_DEFAULT, "       WiFi Network Active: %@", buf, 0xCu);
  }

  v166 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
  {
    v167 = @"NO";
    if (v104 == 1) {
      v167 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v167;
    _os_log_impl(&dword_191892000, v166, OS_LOG_TYPE_DEFAULT, "    WiFi Network Reachable: %@", buf, 0xCu);
  }

  v168 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
  {
    v169 = @"NO";
    if (v104 == 2) {
      v169 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v169;
    _os_log_impl(&dword_191892000, v168, OS_LOG_TYPE_DEFAULT, "               Data Active: %@", buf, 0xCu);
  }

  v170 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
  {
    v171 = @"NO";
    if (v104 == 2) {
      v171 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v171;
    _os_log_impl(&dword_191892000, v170, OS_LOG_TYPE_DEFAULT, "            Data Reachable: %@", buf, 0xCu);
  }

  v172 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v172, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  v173 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
  {
    v174 = @"NO";
    if (flags) {
      v174 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v174;
    _os_log_impl(&dword_191892000, v173, OS_LOG_TYPE_DEFAULT, "                Wants WiFi: %@", buf, 0xCu);
  }

  v175 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
  {
    v176 = @"NO";
    if ((flags & 2) != 0) {
      v176 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v176;
    _os_log_impl(&dword_191892000, v175, OS_LOG_TYPE_DEFAULT, "            Wants Cellular: %@", buf, 0xCu);
  }

  v177 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    v178 = @"NO";
    if (v234) {
      v178 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v178;
    _os_log_impl(&dword_191892000, v177, OS_LOG_TYPE_DEFAULT, "           Has Usable WiFi: %@", buf, 0xCu);
  }

  v179 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
  {
    v180 = @"NO";
    if (v112) {
      v180 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v180;
    _os_log_impl(&dword_191892000, v179, OS_LOG_TYPE_DEFAULT, "       Has Usable Cellular: %@", buf, 0xCu);
  }

  int v181 = v112 & hasLTEDataConnection;
  v182 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
  {
    v183 = @"NO";
    if (v181) {
      v183 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v183;
    _os_log_impl(&dword_191892000, v182, OS_LOG_TYPE_DEFAULT, "            Has Usable LTE: %@", buf, 0xCu);
  }

  v184 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v184, OS_LOG_TYPE_DEFAULT, "****************************************************************************************", buf, 2u);
  }

  int v188 = v112 & v232;
  if (v235)
  {
    int v193 = v188 & v143;
    BOOL v194 = v112;
    if (v193 == 1)
    {
      BOOL v194 = v112;
      if (flags)
      {
        BOOL v194 = (v235 & 0xC) == 0;
        if (v114 > wifiTimeout) {
          BOOL v194 = 1;
        }
      }
    }
    if (v143) {
      int v195 = 0;
    }
    else {
      int v195 = flags & ((flags & 2) == 0);
    }
    int v190 = v194 | v195;
    int v191 = v232;
    int v192 = v226;
  }
  else
  {
    int v189 = v188 & flags;
    int v190 = v112;
    int v191 = v232;
    int v192 = v226;
    if (v189 == 1)
    {
      int v190 = (v235 & 0xC) == 0;
      if (v114 > wifiTimeout) {
        int v190 = 1;
      }
    }
  }
  uint64_t v196 = (flags >> 1) & 1;
  int v197 = v196 & ~v192 & flags;
  if (v114 <= wifiTimeout) {
    int v197 = 0;
  }
  int v198 = v191 | v196;
  if ((flags & 1) == 0) {
    int v198 = 1;
  }
  unsigned int v199 = v234;
  if ((v198 | v234))
  {
    uint64_t v200 = v197 | v234 | v190 | (v191 | v192) ^ 1 | v181 & ((v235 & 8) != 0);
  }
  else
  {
    v201 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v201, OS_LOG_TYPE_DEFAULT, "Wifi is not enabled, but we only want wifi, marking as done.", buf, 2u);
    }

    uint64_t v200 = 1;
    unsigned int v199 = v234;
  }
  if (((v200 & flags & isWiFiAssociated ^ 1 | v199) & 1) == 0)
  {
    if ((flags & 2) == 0)
    {
      v202 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v202, OS_LOG_TYPE_DEFAULT, "Wifi is not yet reachable and we don't want cellular, we're not done", buf, 2u);
      }
      goto LABEL_179;
    }
    if ((v235 & 4) != 0 && v114 < wifiTimeout)
    {
      v202 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v202, OS_LOG_TYPE_DEFAULT, "Wifi is not yet reachable and we haven't timed out waiting for wifi, we're not done", buf, 2u);
      }
LABEL_179:

      uint64_t v200 = 0;
    }
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v185, v186, v187);
  int hasCellularDataConnection_done_withinTimeWindow = objc_msgSend__isNetworkAvailablibityCheckingDone_wantsWiFi_wantsCellular_cellular_hasCellularDataConnection_done_withinTimeWindow_(self, v204, v234, flags & 1, (flags >> 1) & 1, v112, v225, v200, v203 <= self->_startTime + 4.0);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v206, v207, v208);
  if (((v209 <= self->_timeout + self->_startTime) & ~hasCellularDataConnection_done_withinTimeWindow) != 0)
  {
    v216 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v216, OS_LOG_TYPE_DEFAULT, "        => Continuing", buf, 2u);
    }

    objc_msgSend__setTimer(self, v217, v218, v219);
  }
  else
  {
    v210 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191892000, v210, OS_LOG_TYPE_DEFAULT, "        ******* Done", buf, 2u);
    }

    objc_msgSend__cancel(self, v211, v212, v213);
    if (self->_completionBlock)
    {
      if (v234)
      {
        v214 = OSLogHandleForIDSCategory("NetworkAvailability");
        if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_191892000, v214, OS_LOG_TYPE_DEFAULT, "  => WiFi is Usable", buf, 2u);
        }

        if (!v112)
        {
LABEL_188:
          v215 = OSLogHandleForIDSCategory("NetworkAvailability");
          if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_191892000, v215, OS_LOG_TYPE_DEFAULT, "  => Cellular is *NOT* usable", buf, 2u);
          }
LABEL_199:

          (*((void (**)(void))self->_completionBlock + 2))();
          goto LABEL_200;
        }
      }
      else
      {
        v220 = OSLogHandleForIDSCategory("NetworkAvailability");
        if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_191892000, v220, OS_LOG_TYPE_DEFAULT, "  => WiFi is *NOT* usable", buf, 2u);
        }

        if (!v112) {
          goto LABEL_188;
        }
      }
      v215 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v215, OS_LOG_TYPE_DEFAULT, "  => Cellular is usable", buf, 2u);
      }
      goto LABEL_199;
    }
  }
LABEL_200:
}

- (void)_setTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_timer)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("NetworkAvailability");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double timeout = self->_timeout;
      *(_DWORD *)buf = 134218240;
      uint64_t v12 = 0x3FF0000000000000;
      __int16 v13 = 2048;
      double v14 = timeout;
      _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Starting timer with time interval: %f   (Timeout: %f)", buf, 0x16u);
    }

    v5 = [IMDispatchTimer alloc];
    uint64_t v6 = im_primary_queue();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1918D8F2C;
    v10[3] = &unk_1E57246A0;
    v10[4] = self;
    objc_super v8 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v5, v7, (uint64_t)v6, 1, 1, v10);
    timer = self->_timer;
    self->_timer = v8;
  }
}

- (void)start
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v54 = 138412290;
    v55 = self;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Client requested start availability check: %@", (uint8_t *)&v54, 0xCu);
  }

  if (self->_startTime == 0.0)
  {
    if (self->_flags)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "  => Asserting WiFi desired", (uint8_t *)&v54, 2u);
      }

      uint64_t v11 = objc_msgSend_mobileNetworkManager(self, v8, v9, v10);
      objc_msgSend_addWiFiAutoAssociationClientToken_(v11, v12, (uint64_t)self->_guid, v13);

      int v17 = objc_msgSend_mobileNetworkManager(self, v14, v15, v16);
      LODWORD(v11) = objc_msgSend_isWiFiEnabled(v17, v18, v19, v20);

      uint64_t v24 = objc_msgSend_mobileNetworkManager(self, v21, v22, v23);
      char isWiFiAssociated = objc_msgSend_isWiFiAssociated(v24, v25, v26, v27);

      v32 = objc_msgSend_mobileNetworkManager(self, v29, v30, v31);
      char isWiFiCaptive = objc_msgSend_isWiFiCaptive(v32, v33, v34, v35);

      if (v11) {
        char v37 = isWiFiAssociated & (isWiFiCaptive ^ 1);
      }
      else {
        char v37 = 0;
      }
      if ((self->_options & 2) != 0 && (v37 & 1) == 0)
      {
        uint64_t v38 = OSLogHandleForIDSCategory("NetworkAvailability");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v54) = 0;
          _os_log_impl(&dword_191892000, v38, OS_LOG_TYPE_DEFAULT, "  => Show Network Options", (uint8_t *)&v54, 2u);
        }

        uint64_t v42 = objc_msgSend_mobileNetworkManager(self, v39, v40, v41);
        objc_msgSend_showNetworkOptions(v42, v43, v44, v45);
      }
    }
    if ((self->_flags & 2) != 0)
    {
      uint64_t v46 = OSLogHandleForIDSCategory("NetworkAvailability");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_191892000, v46, OS_LOG_TYPE_DEFAULT, "  => Asserting Cellular desired", (uint8_t *)&v54, 2u);
      }

      uint64_t v50 = objc_msgSend_mobileNetworkManager(self, v47, v48, v49);
      objc_msgSend_addCellularAutoAssociationClientToken_(v50, v51, (uint64_t)self->_guid, v52);
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v4, v5, v6);
    self->_double startTime = v53;
  }
  objc_msgSend__timerHit_(self, v4, (uint64_t)self->_timer, v6);
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    objc_super v8 = self;
    _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "Client requested cancel availability check: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend__cancel(self, v4, v5, v6);
}

- (id)mobileNetworkManager
{
  return (id)objc_msgSend_sharedInstance(IMMobileNetworkManager, a2, v2, v3);
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end