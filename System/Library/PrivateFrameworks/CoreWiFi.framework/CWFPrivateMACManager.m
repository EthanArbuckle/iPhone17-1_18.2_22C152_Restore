@interface CWFPrivateMACManager
- (BOOL)__calloutToAllowRotation;
- (BOOL)allowUserJoinFailureUIForNetworkProfile:(id)a3;
- (CWFPrivateMACManager)init;
- (CWFPrivateMACManager)initWithInterfaceName:(id)a3 hardwareMACAddress:(id)a4;
- (NSData)deviceKey;
- (NSData)rotationKey;
- (NSDate)rotationKeyUpdatedAt;
- (NSString)hardwareMACAddress;
- (NSString)interfaceName;
- (OS_dispatch_queue)targetQueue;
- (id)__calloutToGetEffectiveHardwareMACAddress;
- (id)allowRotationHandler;
- (id)effectiveHardwareMACAddress;
- (id)privateMACAddressForNetworkProfile:(id)a3;
- (id)updatedDeviceKeyHandler;
- (id)updatedPrivateMACAddressHandler;
- (id)updatedRotationKeyHandler;
- (id)updatedSystemSettingHandler;
- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3;
- (int64_t)systemSetting;
- (int64_t)temporaryUserSettingForNetworkProfile:(id)a3;
- (void)clearTemporaryUserSettings;
- (void)invalidate;
- (void)setAllowRotationHandler:(id)a3;
- (void)setDeviceKey:(id)a3;
- (void)setEffectiveHardwareMACAddress:(id)a3;
- (void)setNetworkIDForAssociationWithMACAddress:(id)a3 networkProfile:(id)a4;
- (void)setRotationKey:(id)a3;
- (void)setRotationKeyUpdatedAt:(id)a3;
- (void)setSystemSetting:(int64_t)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTemporaryUserSetting:(int64_t)a3 networkProfile:(id)a4;
- (void)setUpdatedDeviceKeyHandler:(id)a3;
- (void)setUpdatedPrivateMACAddressHandler:(id)a3;
- (void)setUpdatedRotationKeyHandler:(id)a3;
- (void)setUpdatedSystemSettingHandler:(id)a3;
- (void)setUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4;
- (void)submitPrivateMACStatsMetricWithEventType:(id)a3 networkProfile:(id)a4;
@end

@implementation CWFPrivateMACManager

- (CWFPrivateMACManager)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFPrivateMACManager init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CWFPrivateMACManager)initWithInterfaceName:(id)a3 hardwareMACAddress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CWFPrivateMACManager;
  v9 = [(CWFPrivateMACManager *)&v39 init];
  v10 = v9;
  if (!v7) {
    goto LABEL_16;
  }
  if (!v9)
  {
    rotationKeyUpdatedAt = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v9->_interfaceName, a3);
  if (!v8) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v10->_hardwareMACAddress, a4);
  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v12 = dispatch_queue_create("com.apple.corewifi.private-mac.target", v11);
  targetQueue = v10->_targetQueue;
  v10->_targetQueue = (OS_dispatch_queue *)v12;

  if (!v10->_targetQueue) {
    goto LABEL_16;
  }
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  privateMACAddressCache = v10->_privateMACAddressCache;
  v10->_privateMACAddressCache = v14;

  if (!v10->_privateMACAddressCache) {
    goto LABEL_16;
  }
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  privateMACAddressCacheIDList = v10->_privateMACAddressCacheIDList;
  v10->_privateMACAddressCacheIDList = v16;

  if (!v10->_privateMACAddressCacheIDList) {
    goto LABEL_16;
  }
  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
  v10->_userJoinFailureTimestampMap = v18;

  if (!v10->_userJoinFailureTimestampMap) {
    goto LABEL_16;
  }
  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  userJoinFailureCountMap = v10->_userJoinFailureCountMap;
  v10->_userJoinFailureCountMap = v20;

  if (!v10->_userJoinFailureCountMap) {
    goto LABEL_16;
  }
  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  tempUserSettingMap = v10->_tempUserSettingMap;
  v10->_tempUserSettingMap = v22;

  if (!v10->_tempUserSettingMap) {
    goto LABEL_16;
  }
  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  networkIDCache = v10->_networkIDCache;
  v10->_networkIDCache = v24;

  if (!v10->_networkIDCache) {
    goto LABEL_16;
  }
  v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  networkIDCacheIDList = v10->_networkIDCacheIDList;
  v10->_networkIDCacheIDList = v26;

  if (v10->_networkIDCacheIDList)
  {
    v10->_rotationInterval = 86400;
    if (os_variant_has_internal_content()) {
      _os_feature_enabled_impl();
    }
    uint64_t v28 = sub_1B4F55944(0x100uLL);
    deviceKey = v10->_deviceKey;
    v10->_deviceKey = (NSData *)v28;

    uint64_t v30 = sub_1B4F55944(0x100uLL);
    rotationKey = v10->_rotationKey;
    v10->_rotationKey = (NSData *)v30;

    uint64_t v36 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v32, v33, v34, v35);
    rotationKeyUpdatedAt = v10->_rotationKeyUpdatedAt;
    v10->_rotationKeyUpdatedAt = (NSDate *)v36;
  }
  else
  {
LABEL_16:
    rotationKeyUpdatedAt = v10;
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)invalidate
{
  objc_msgSend_setUpdatedDeviceKeyHandler_(self, a2, 0, v2, v3);
  objc_msgSend_setUpdatedRotationKeyHandler_(self, v5, 0, v6, v7);
  objc_msgSend_setUpdatedSystemSettingHandler_(self, v8, 0, v9, v10);
  MEMORY[0x1F4181798](self, sel_setUpdatedPrivateMACAddressHandler_, 0, v11, v12);
}

- (NSData)rotationKey
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_rotationKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKey:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v5 = (NSData *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  rotationKey = v6->_rotationKey;
  if (rotationKey == v5 || v5 && rotationKey && (objc_msgSend_isEqual_(rotationKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }
  else
  {
    objc_storeStrong((id *)&v6->_rotationKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    v19 = CWFGetOSLog();
    if (v19)
    {
      v20 = CWFGetOSLog();
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      v31 = objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      unint64_t rotationInterval = v6->_rotationInterval;
      int v39 = 138543618;
      v40 = v31;
      __int16 v41 = 2048;
      unint64_t v42 = rotationInterval;
      _os_log_send_and_compose_impl();
    }
    v37 = objc_msgSend_targetQueue(v6, v33, v34, v35, v36);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F61C44;
    block[3] = &unk_1E60BB768;
    block[4] = v6;
    dispatch_async(v37, block);
  }
}

- (NSDate)rotationKeyUpdatedAt
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_rotationKeyUpdatedAt;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKeyUpdatedAt:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (NSDate *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  rotationKeyUpdatedAt = v6->_rotationKeyUpdatedAt;
  if (rotationKeyUpdatedAt == v5
    || v5 && rotationKeyUpdatedAt && (objc_msgSend_isEqual_(rotationKeyUpdatedAt, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }
  else
  {
    objc_storeStrong((id *)&v6->_rotationKeyUpdatedAt, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    v19 = CWFGetOSLog();
    if (v19)
    {
      v20 = CWFGetOSLog();
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t rotationInterval = v6->_rotationInterval;
      int v29 = 134217984;
      unint64_t v30 = rotationInterval;
      _os_log_send_and_compose_impl();
    }

    v27 = objc_msgSend_targetQueue(v6, v23, v24, v25, v26);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F61F30;
    block[3] = &unk_1E60BB768;
    block[4] = v6;
    dispatch_async(v27, block);
  }
}

- (NSData)deviceKey
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_deviceKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceKey:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = (NSData *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  deviceKey = v6->_deviceKey;
  if (deviceKey == v5 || v5 && deviceKey && (objc_msgSend_isEqual_(deviceKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);
  }
  else
  {
    objc_storeStrong((id *)&v6->_deviceKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    v19 = CWFGetOSLog();
    if (v19)
    {
      v20 = CWFGetOSLog();
    }
    else
    {
      v20 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      int v37 = 138543362;
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    uint64_t v35 = objc_msgSend_targetQueue(v6, v31, v32, v33, v34);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F62244;
    block[3] = &unk_1E60BB768;
    block[4] = v6;
    dispatch_async(v35, block);
  }
}

- (int64_t)systemSetting
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t systemSetting = v2->_systemSetting;
  objc_sync_exit(v2);

  return systemSetting;
}

- (void)setSystemSetting:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_systemSetting == a3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_int64_t systemSetting = a3;
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCache, v4, v5, v6, v7);
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCacheIDList, v8, v9, v10, v11);
    objc_sync_exit(obj);

    uint64_t v12 = CWFGetOSLog();
    if (v12)
    {
      uint64_t v13 = CWFGetOSLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B4F55A80(a3);
      int v22 = 138543362;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    v19 = objc_msgSend_targetQueue(obj, v15, v16, v17, v18);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F62528;
    block[3] = &unk_1E60BB768;
    block[4] = obj;
    dispatch_async(v19, block);
  }
}

- (BOOL)__calloutToAllowRotation
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA3E90);
  uint64_t v8 = objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B4F62700;
  v11[3] = &unk_1E60BB928;
  uint64_t v13 = &v17;
  id v14 = v15;
  v11[4] = self;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v8, v11);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v8) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v9 = objc_msgSend_identifier(v4, v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 22, 0);
LABEL_46:
    v131 = (void *)v179;
    v55 = 0;
    v50 = 0;
    goto LABEL_48;
  }
  if (objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v10, (uint64_t)v4, v11, v12) == 1)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    goto LABEL_46;
  }
  if (objc_msgSend___calloutToAllowRotation(self, v13, v14, v15, v16))
  {
    id v21 = self;
    objc_sync_enter(v21);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v22, v23, v24, v25);
    double v27 = v26;
    unint64_t rotationInterval = v21->_rotationInterval;
    objc_msgSend_timeIntervalSinceReferenceDate(v21->_rotationKeyUpdatedAt, v29, v30, v31, v32);
    if (ceil(v27 / (double)rotationInterval) != ceil(v33 / (double)v21->_rotationInterval))
    {
      uint64_t v34 = sub_1B4F55944(0x100uLL);
      objc_msgSend_setRotationKey_(v21, v35, (uint64_t)v34, v36, v37);

      unint64_t v42 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v38, v39, v40, v41, v27);
      objc_msgSend_setRotationKeyUpdatedAt_(v21, v43, (uint64_t)v42, v44, v45);
    }
    objc_sync_exit(v21);
  }
  v50 = objc_msgSend_deviceKey(self, v17, v18, v19, v20);
  if (!v50)
  {
    uint64_t v179 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v46, *MEMORY[0x1E4F28798], 6, 0);
    goto LABEL_46;
  }
  v55 = objc_msgSend_rotationKey(self, v46, v47, v48, v49);
  if (v55)
  {
    if (objc_msgSend_isPublicAirPlayNetwork(v4, v51, v52, v53, v54))
    {
      v64 = objc_msgSend_cachedPrivateMACAddress(v4, v56, v57, v58, v59);
      if (!v64) {
        goto LABEL_23;
      }
      v65 = objc_msgSend_lastJoinedAt(v4, v60, v61, v62, v63);
      objc_msgSend_timeIntervalSinceReferenceDate(v65, v66, v67, v68, v69);
      double v71 = v70;
      v76 = objc_msgSend_lastDisconnectTimestamp(v4, v72, v73, v74, v75);
      objc_msgSend_timeIntervalSinceReferenceDate(v76, v77, v78, v79, v80);
      double v82 = v81;

      if (v71 <= v82)
      {
LABEL_23:
        uint64_t v120 = sub_1B4F55944(0x100uLL);

        v125 = objc_msgSend_hardwareMACAddress(self, v121, v122, v123, v124);
        _os_feature_enabled_impl();

        v130 = objc_msgSend_targetQueue(self, v126, v127, v128, v129);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B4F62EAC;
        block[3] = &unk_1E60BB950;
        block[4] = self;
        id v181 = v4;
        id v182 = 0;
        dispatch_async(v130, block);

        v131 = 0;
        v132 = 0;
        v55 = (void *)v120;
        goto LABEL_31;
      }
      goto LABEL_29;
    }
    if (os_variant_has_internal_content()) {
      _os_feature_enabled_impl();
    }
    v94 = objc_msgSend_cachedPrivateMACAddress(v4, v87, v88, v89, v90);
    if (v94 && objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v91, (uint64_t)v4, v92, v93) == 2)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v95, v96, v97, v98);
      double v100 = v99;
      v105 = objc_msgSend_cachedPrivateMACAddressUpdatedAt(v4, v101, v102, v103, v104);
      objc_msgSend_timeIntervalSinceReferenceDate(v105, v106, v107, v108, v109);
      if (v100 - v114 < 1209600.0)
      {

        goto LABEL_29;
      }
      v149 = objc_msgSend_lastJoinedAt(v4, v110, v111, v112, v113);
      objc_msgSend_timeIntervalSinceReferenceDate(v149, v150, v151, v152, v153);
      double v155 = v154;
      v160 = objc_msgSend_lastDisconnectTimestamp(v4, v156, v157, v158, v159);
      objc_msgSend_timeIntervalSinceReferenceDate(v160, v161, v162, v163, v164);
      double v166 = v165;

      if (v155 > v166) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    v118 = objc_msgSend_cachedPrivateMACAddress(v4, v83, v84, v85, v86);
    if (!v118
      || (uint64_t v119 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v115, (uint64_t)v4, v116, v117),
          v118,
          v119 != 3))
    {
      v133 = self;
      objc_sync_enter(v133);
      privateMACAddressCache = v133->_privateMACAddressCache;
      v139 = objc_msgSend_identifier(v4, v135, v136, v137, v138);
      v132 = objc_msgSend_objectForKeyedSubscript_(privateMACAddressCache, v140, (uint64_t)v139, v141, v142);

      if (v132)
      {
        id v147 = v132;
      }
      else
      {
        v148 = objc_msgSend_hardwareMACAddress(v133, v143, v144, v145, v146);
        _os_feature_enabled_impl();
      }
      objc_sync_exit(v133);

      goto LABEL_30;
    }
LABEL_29:
    v132 = objc_msgSend_cachedPrivateMACAddress(v4, v83, v84, v85, v86);
LABEL_30:
    v131 = 0;
    goto LABEL_31;
  }
  v131 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v51, *MEMORY[0x1E4F28798], 6, 0);
  v55 = 0;
LABEL_48:
  v132 = 0;
LABEL_31:
  v167 = CWFGetOSLog();
  if (v167)
  {
    v168 = CWFGetOSLog();
  }
  else
  {
    v168 = MEMORY[0x1E4F14500];
    id v169 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
  {
    if (v132) {
      v174 = "Successfully created";
    }
    else {
      v174 = "FAILED to create";
    }
    v175 = objc_msgSend_redactedForWiFi(v132, v170, v171, v172, v173);
    int v183 = 136446978;
    v184 = v174;
    __int16 v185 = 2114;
    v186 = v175;
    __int16 v187 = 2114;
    id v188 = v4;
    __int16 v189 = 2114;
    v190 = v131;
    _os_log_send_and_compose_impl();
  }
  if (v131) {
    v176 = 0;
  }
  else {
    v176 = v132;
  }
  id v177 = v176;

  return v177;
}

- (id)__calloutToGetEffectiveHardwareMACAddress
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1B4F51C1C;
  int v22 = sub_1B4F51BBC;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1F0DA2710);
  uint64_t v8 = objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B4F630C4;
  v12[3] = &unk_1E60BB928;
  uint64_t v14 = &v18;
  uint64_t v15 = v16;
  v12[4] = self;
  id v13 = v3;
  id v9 = v3;
  dispatch_async(v8, v12);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4 = a3;
  int64_t v9 = objc_msgSend_identifier(v4, v5, v6, v7, v8);

  if (v9)
  {
    int64_t v9 = objc_msgSend_privateMACAddressModeUserSetting(v4, v10, v11, v12, v13);
    if (!v9)
    {
      int64_t v9 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v4, v14, v15, v16, v17);
      if (!v9)
      {
        int64_t v9 = objc_msgSend_systemSetting(self, v14, v15, v16, v17);
        if (!v9)
        {
          if (objc_msgSend_privateMACAddressDisabledByEvaluation(v4, v14, v15, v16, v17))
          {
            int64_t v9 = 1;
          }
          else if ((objc_msgSend_isHotspot(v4, v14, v15, v16, v17) & 1) != 0 {
                 || (objc_msgSend_isPublicAirPlayNetwork(v4, v14, v15, v16, v17) & 1) != 0
          }
                 || (objc_msgSend_isCarPlay(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 10
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 17
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 15
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 14
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 18
                 || (objc_msgSend_isOpen(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isOWE(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWEP(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWAPI(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_isWPA(v4, v14, v15, v16, v17))
          {
            int64_t v9 = 2;
          }
          else
          {
            int64_t v9 = 3;
          }
        }
      }
    }
    uint64_t v18 = objc_msgSend_addedAt(v4, v14, v15, v16, v17);

    if (!v18)
    {
      uint64_t v22 = objc_msgSend_temporaryUserSettingForNetworkProfile_(self, v19, (uint64_t)v4, v20, v21);
      if (v22) {
        int64_t v9 = v22;
      }
    }
  }

  return v9;
}

- (void)submitPrivateMACStatsMetricWithEventType:(id)a3 networkProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!objc_opt_class()) {
    goto LABEL_40;
  }
  uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v6, @"privateMacEvent", v14);
  uint64_t v18 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v15, (uint64_t)v7, v16, v17);
  uint64_t v22 = objc_msgSend_privateMACAddressForNetworkProfile_(self, v19, (uint64_t)v7, v20, v21);
  double v27 = objc_msgSend_hardwareMACAddress(self, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend___calloutToGetEffectiveHardwareMACAddress(self, v28, v29, v30, v31);
  uint64_t v37 = v32;
  switch(v18)
  {
    case 3:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, @"Static", @"privateMacType", v36);
        break;
      }
      goto LABEL_20;
    case 2:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, @"Rotating", @"privateMacType", v36);
        break;
      }
      goto LABEL_20;
    case 1:
      if (v32 == v27 || v32 && v27 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v27, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, @"Physical", @"privateMacType", v36);
        break;
      }
LABEL_20:
      objc_msgSend_setObject_forKeyedSubscript_(v12, v33, @"Configured", @"privateMacType", v36);
      break;
  }
  uint64_t v38 = objc_msgSend_privateMACAddressModeUserSetting(v7, v33, v34, v35, v36);
  uint64_t v41 = MEMORY[0x1E4F1CC38];
  uint64_t v42 = MEMORY[0x1E4F1CC28];
  if (v38) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v39, MEMORY[0x1E4F1CC38], @"privateMacToggled", v40);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v39, MEMORY[0x1E4F1CC28], @"privateMacToggled", v40);
  }
  if (objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v7, v43, v44, v45, v46) == 1) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v47, v41, @"privateMacDisabledByProfile", v48);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v47, v42, @"privateMacDisabledByProfile", v48);
  }
  if (objc_msgSend_privateMACAddressEnabledForEvaluation(v7, v49, v50, v51, v52)) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v53, v41, @"privateMacClassification", v54);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v53, v42, @"privateMacClassification", v54);
  }
  if (objc_msgSend_networkOfInterestHomeState(v7, v55, v56, v57, v58))
  {
    if (objc_msgSend_networkOfInterestHomeState(v7, v59, v60, v61, v62) == 1) {
      objc_msgSend_setObject_forKeyedSubscript_(v12, v63, v41, @"privateMacNetworkTypeIsHome", v64);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v12, v63, v42, @"privateMacNetworkTypeIsHome", v64);
    }
  }
  v65 = CWFGetOSLog();
  if (v65)
  {
    v66 = CWFGetOSLog();
  }
  else
  {
    v66 = MEMORY[0x1E4F14500];
    id v67 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v69 = v12;
  id v68 = v12;
  AnalyticsSendEventLazy();

LABEL_40:
}

- (void)setUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_identifier(v6, v7, v8, v9, v10);

  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = self;
  objc_sync_enter(v12);
  userJoinFailureTimestampMap = v12->_userJoinFailureTimestampMap;
  uint64_t v18 = objc_msgSend_identifier(v6, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v19, (uint64_t)v18, v20, v21);

  userJoinFailureCountMap = v12->_userJoinFailureCountMap;
  uint64_t v28 = objc_msgSend_identifier(v6, v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v29, (uint64_t)v28, v30, v31);
  uint64_t v37 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35, v36);

  uint64_t v42 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v38, v39, v40, v41);
  uint64_t v47 = v42;
  if (v4)
  {
    _os_feature_enabled_impl();
    id v48 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    objc_msgSend_setHour_(v48, v49, 5, v50, v51);
    objc_msgSend_setMinute_(v48, v52, 0, v53, v54);
    objc_msgSend_setSecond_(v48, v55, 0, v56, v57);
    uint64_t v62 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v58, v59, v60, v61);
    uint64_t v64 = objc_msgSend_nextDateAfterDate_matchingComponents_options_(v62, v63, (uint64_t)v47, (uint64_t)v48, 1024);

    v65 = v12->_userJoinFailureCountMap;
    double v70 = objc_msgSend_identifier(v6, v66, v67, v68, v69);
    objc_msgSend_setObject_forKeyedSubscript_(v65, v71, 0, (uint64_t)v70, v72);

    uint64_t v73 = v12->_userJoinFailureTimestampMap;
    uint64_t v78 = objc_msgSend_identifier(v6, v74, v75, v76, v77);
    objc_msgSend_setObject_forKeyedSubscript_(v73, v79, v64, (uint64_t)v78, v80);
    uint64_t v22 = (void *)v64;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(v42, v43, v44, v45, v46);
  double v82 = v81;
  objc_msgSend_timeIntervalSinceReferenceDate(v22, v83, v84, v85, v86);
  if (v82 >= v90)
  {
    uint64_t v78 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v87, v37 + 1, v88, v89);
    v91 = v12->_userJoinFailureCountMap;
    uint64_t v96 = objc_msgSend_identifier(v6, v92, v93, v94, v95);
    objc_msgSend_setObject_forKeyedSubscript_(v91, v97, (uint64_t)v78, (uint64_t)v96, v98);

    goto LABEL_6;
  }
LABEL_7:
  double v99 = CWFGetOSLog();
  if (v99)
  {
    double v100 = CWFGetOSLog();
  }
  else
  {
    double v100 = MEMORY[0x1E4F14500];
    id v101 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v102 = sub_1B4F3D76C(v22);
    _os_log_send_and_compose_impl();
  }
  objc_sync_exit(v12);

LABEL_13:
}

- (BOOL)allowUserJoinFailureUIForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_identifier(v4, v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v11, v12, v13, v14);
    double v16 = v15;
    userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
    uint64_t v22 = objc_msgSend_identifier(v4, v18, v19, v20, v21);
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v23, (uint64_t)v22, v24, v25);
    objc_msgSend_timeIntervalSinceReferenceDate(v26, v27, v28, v29, v30);
    if (v16 >= v35)
    {
      userJoinFailureCountMap = v10->_userJoinFailureCountMap;
      uint64_t v38 = objc_msgSend_identifier(v4, v31, v32, v33, v34);
      uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v39, (uint64_t)v38, v40, v41);
      BOOL v36 = (unint64_t)objc_msgSend_unsignedIntegerValue(v42, v43, v44, v45, v46) > 1;
    }
    else
    {
      BOOL v36 = 0;
    }

    objc_sync_exit(v10);
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (int64_t)temporaryUserSettingForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v10 = objc_msgSend_identifier(v4, v6, v7, v8, v9);

  if (v10)
  {
    tempUserSettingMap = v5->_tempUserSettingMap;
    double v16 = objc_msgSend_identifier(v4, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(tempUserSettingMap, v17, (uint64_t)v16, v18, v19);
    int64_t v25 = objc_msgSend_integerValue(v20, v21, v22, v23, v24);
  }
  else
  {
    int64_t v25 = 0;
  }
  objc_sync_exit(v5);

  return v25;
}

- (void)setTemporaryUserSetting:(int64_t)a3 networkProfile:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v12 = objc_msgSend_identifier(v6, v8, v9, v10, v11);

  if (v12)
  {
    if (a3)
    {
      uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v13, a3, v15, v16);
      tempUserSettingMap = v7->_tempUserSettingMap;
      uint64_t v23 = objc_msgSend_identifier(v6, v19, v20, v21, v22);
      objc_msgSend_setObject_forKeyedSubscript_(tempUserSettingMap, v24, (uint64_t)v17, (uint64_t)v23, v25);

      uint64_t v26 = CWFGetOSLog();
      if (v26)
      {
        uint64_t v27 = CWFGetOSLog();
      }
      else
      {
        uint64_t v27 = MEMORY[0x1E4F14500];
        id v33 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v35 = sub_1B4F55A80(a3);
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      uint64_t v28 = v7->_tempUserSettingMap;
      uint64_t v29 = objc_msgSend_identifier(v6, v13, v14, v15, v16);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v30, 0, (uint64_t)v29, v31);

      uint64_t v32 = CWFGetOSLog();
      if (v32)
      {
        uint64_t v27 = CWFGetOSLog();
      }
      else
      {
        uint64_t v27 = MEMORY[0x1E4F14500];
        id v34 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        _os_log_send_and_compose_impl();
      }
    }
  }
  objc_sync_exit(v7);
}

- (void)clearTemporaryUserSettings
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_removeAllObjects(v2->_tempUserSettingMap, v3, v4, v5, v6);
  uint64_t v7 = CWFGetOSLog();
  if (v7)
  {
    uint64_t v8 = CWFGetOSLog();
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  objc_sync_exit(v2);
}

- (void)setNetworkIDForAssociationWithMACAddress:(id)a3 networkProfile:(id)a4
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v11 = a4;
  uint64_t v12 = v6;
  if (!v6)
  {
    uint64_t v12 = objc_msgSend_hardwareMACAddress(self, v7, v8, v9, v10);
  }
  v135 = v6;
  BOOL v13 = v6 == 0;
  id v137 = 0;
  uint64_t v14 = sub_1B4F55B20(v11, v12, &v137);
  id v136 = v137;
  if (v13) {

  }
  if (v14)
  {
    uint64_t v15 = self;
    objc_sync_enter(v15);
    networkIDCache = v15->_networkIDCache;
    uint64_t v21 = objc_msgSend_identifier(v11, v17, v18, v19, v20);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(networkIDCache, v22, (uint64_t)v21, v23, v24);
    if (v14 == v29)
    {
      char isEqual = 1;
    }
    else
    {
      uint64_t v30 = v15->_networkIDCache;
      uint64_t v31 = objc_msgSend_identifier(v11, v25, v26, v27, v28);
      uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)v31, v33, v34);
      if (v39)
      {
        uint64_t v40 = v15->_networkIDCache;
        uint64_t v41 = objc_msgSend_identifier(v11, v35, v36, v37, v38);
        uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v40, v42, (uint64_t)v41, v43, v44);
        char isEqual = objc_msgSend_isEqual_(v14, v46, (uint64_t)v45, v47, v48);
      }
      else
      {
        char isEqual = 0;
      }
    }
    uint64_t v50 = v15->_networkIDCache;
    v55 = objc_msgSend_identifier(v11, v51, v52, v53, v54);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v56, (uint64_t)v14, (uint64_t)v55, v57);

    networkIDCacheIDList = v15->_networkIDCacheIDList;
    uint64_t v63 = objc_msgSend_identifier(v11, v59, v60, v61, v62);
    objc_msgSend_removeObject_(networkIDCacheIDList, v64, (uint64_t)v63, v65, v66);

    uint64_t v67 = v15->_networkIDCacheIDList;
    uint64_t v72 = objc_msgSend_identifier(v11, v68, v69, v70, v71);
    objc_msgSend_insertObject_atIndex_(v67, v73, (uint64_t)v72, 0, v74);

    if (objc_msgSend_count(v15->_networkIDCacheIDList, v75, v76, v77, v78) == 10)
    {
      v83 = v15->_networkIDCache;
      uint64_t v84 = objc_msgSend_lastObject(v15->_networkIDCacheIDList, v79, v80, v81, v82);
      objc_msgSend_setObject_forKeyedSubscript_(v83, v85, 0, (uint64_t)v84, v86);

      objc_msgSend_removeLastObject(v15->_networkIDCacheIDList, v87, v88, v89, v90);
    }
    objc_sync_exit(v15);

    if ((isEqual & 1) == 0)
    {
      uint64_t v95 = objc_msgSend_networkName(v11, v91, v92, v93, v94);

      if (v95)
      {
        uint64_t v96 = CWFGetOSLog();
        if (v96)
        {
          uint64_t v97 = CWFGetOSLog();
        }
        else
        {
          uint64_t v97 = MEMORY[0x1E4F14500];
          id v98 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          int v138 = 138543362;
          v139 = (const char *)v11;
          int v134 = 12;
          v133 = &v138;
          _os_log_send_and_compose_impl();
        }

        uint64_t v103 = objc_msgSend_interfaceName(v15, v99, v100, v101, v102);
        uint64_t v108 = objc_msgSend_networkName(v11, v104, v105, v106, v107);
        IPConfigurationForgetNetwork();
      }
    }

    uint64_t v113 = objc_msgSend_interfaceName(v15, v109, v110, v111, v112);
    sub_1B4F55D30(v14, v113);
    id v136 = 0;
  }
  else
  {
    v131 = CWFGetOSLog();
    if (v131)
    {
      uint64_t v113 = CWFGetOSLog();
    }
    else
    {
      uint64_t v113 = MEMORY[0x1E4F14500];
      id v132 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      int v138 = 138412546;
      v139 = (const char *)v136;
      __int16 v140 = 2114;
      id v141 = v11;
      int v134 = 22;
      v133 = &v138;
      _os_log_send_and_compose_impl();
    }
  }

  double v114 = CWFGetOSLog();
  if (v114)
  {
    v115 = CWFGetOSLog();
  }
  else
  {
    v115 = MEMORY[0x1E4F14500];
    id v116 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v115, (os_log_type_t)(16 * (v136 != 0))))
  {
    if (v136) {
      uint64_t v119 = "FAILED to";
    }
    else {
      uint64_t v119 = "Successfully";
    }
    uint64_t v120 = objc_msgSend_subdataWithRange_(v14, v117, 0, 32, v118, v133, v134, v135);
    v125 = CWFHexadecimalStringFromData(v120, v121, v122, v123, v124);
    v130 = objc_msgSend_redactedForWiFi(v125, v126, v127, v128, v129);
    int v138 = 136446722;
    v139 = v119;
    __int16 v140 = 2114;
    id v141 = v130;
    __int16 v142 = 2114;
    id v143 = v11;
    _os_log_send_and_compose_impl();
  }
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)hardwareMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)updatedSystemSettingHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setUpdatedSystemSettingHandler:(id)a3
{
}

- (id)updatedDeviceKeyHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setUpdatedDeviceKeyHandler:(id)a3
{
}

- (id)updatedPrivateMACAddressHandler
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setUpdatedPrivateMACAddressHandler:(id)a3
{
}

- (id)updatedRotationKeyHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setUpdatedRotationKeyHandler:(id)a3
{
}

- (id)effectiveHardwareMACAddress
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setEffectiveHardwareMACAddress:(id)a3
{
}

- (id)allowRotationHandler
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setAllowRotationHandler:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_allowRotationHandler, 0);
  objc_storeStrong(&self->_effectiveHardwareMACAddress, 0);
  objc_storeStrong(&self->_updatedRotationKeyHandler, 0);
  objc_storeStrong(&self->_updatedPrivateMACAddressHandler, 0);
  objc_storeStrong(&self->_updatedDeviceKeyHandler, 0);
  objc_storeStrong(&self->_updatedSystemSettingHandler, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_networkIDCacheIDList, 0);
  objc_storeStrong((id *)&self->_networkIDCache, 0);
  objc_storeStrong((id *)&self->_tempUserSettingMap, 0);
  objc_storeStrong((id *)&self->_userJoinFailureCountMap, 0);
  objc_storeStrong((id *)&self->_userJoinFailureTimestampMap, 0);
  objc_storeStrong((id *)&self->_privateMACAddressCacheIDList, 0);
  objc_storeStrong((id *)&self->_privateMACAddressCache, 0);
  objc_storeStrong((id *)&self->_rotationKeyUpdatedAt, 0);
  objc_storeStrong((id *)&self->_rotationKey, 0);
  objc_storeStrong((id *)&self->_deviceKey, 0);
}

@end