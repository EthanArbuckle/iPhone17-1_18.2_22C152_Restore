@interface MTRScenesManagementClusterAddSceneParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRScenesManagementClusterAddSceneParams)init;
- (NSArray)extensionFieldSets;
- (NSNumber)groupID;
- (NSNumber)sceneID;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)transitionTime;
- (NSString)sceneName;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setExtensionFieldSets:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setSceneName:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setTransitionTime:(id)a3;
@end

@implementation MTRScenesManagementClusterAddSceneParams

- (MTRScenesManagementClusterAddSceneParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRScenesManagementClusterAddSceneParams;
  v2 = [(MTRScenesManagementClusterAddSceneParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    groupID = v2->_groupID;
    v2->_groupID = (NSNumber *)&unk_26F9C8548;

    sceneID = v3->_sceneID;
    v3->_sceneID = (NSNumber *)&unk_26F9C8548;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_26F9C8548;

    sceneName = v3->_sceneName;
    v3->_sceneName = (NSString *)&stru_26F969DC8;

    uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    extensionFieldSets = v3->_extensionFieldSets;
    v3->_extensionFieldSets = (NSArray *)v10;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterAddSceneParams);
  v7 = objc_msgSend_groupID(self, v5, v6);
  objc_msgSend_setGroupID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_sceneID(self, v9, v10);
  objc_msgSend_setSceneID_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_transitionTime(self, v13, v14);
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_sceneName(self, v17, v18);
  objc_msgSend_setSceneName_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_extensionFieldSets(self, v21, v22);
  objc_msgSend_setExtensionFieldSets_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupID:%@; sceneID:%@; transitionTime:%@; sceneName:%@; extensionFieldSets:%@; >",
    v5,
    self->_groupID,
    self->_sceneID,
    self->_transitionTime,
    self->_sceneName,
  v7 = self->_extensionFieldSets);

  return v7;
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSNumber)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
}

- (NSString)sceneName
{
  return self->_sceneName;
}

- (void)setSceneName:(id)a3
{
}

- (NSArray)extensionFieldSets
{
  return self->_extensionFieldSets;
}

- (void)setExtensionFieldSets:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_extensionFieldSets, 0);
  objc_storeStrong((id *)&self->_sceneName, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v43 = 0;
  char v44 = 0;
  memset(v45, 0, sizeof(v45));
  v42[0] = 0;
  v42[1] = 0;
  v41 = v42;
  v5 = objc_msgSend_groupID(self, a3, (uint64_t)a4);
  __int16 v43 = objc_msgSend_unsignedShortValue(v5, v6, v7);

  uint64_t v10 = objc_msgSend_sceneID(self, v8, v9);
  char v44 = objc_msgSend_unsignedCharValue(v10, v11, v12);

  objc_super v15 = objc_msgSend_transitionTime(self, v13, v14);
  v45[0] = objc_msgSend_unsignedIntValue(v15, v16, v17);

  objc_msgSend_sceneName(self, v18, v19);
  id v20 = objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_UTF8String(v20, v21, v22);
  uint64_t v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
  sub_24479476C(v35, v23, v25);

  *(_OWORD *)&v45[1] = *(_OWORD *)v35;
  v28 = objc_msgSend_extensionFieldSets(self, v26, v27);
  uint64_t v31 = objc_msgSend_count(v28, v29, v30);

  if (v31) {
    operator new();
  }
  *(void *)&v45[5] = 0;
  *(void *)&v45[7] = 0;
  sub_244CC8F5C(0x62FuLL, 0, &v40);
  if (v40)
  {
    sub_244CB62B8((uint64_t)v35);
    v37 = 0;
    v38 = 0;
    v36 = &unk_26F9536C8;
    char v39 = 0;
    sub_2447945A0((uint64_t)&v36, &v40, 0);
    sub_244CB6318((uint64_t)v35, (uint64_t)&v36, 0xFFFFFFFF, (uint64_t)v46);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244810F90((uint64_t)&v43, v35, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v35, &v40, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v40);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v36 = &unk_26F9536C8;
    sub_244794634(&v38);
    sub_244794634(&v37);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 14018;
  }
  sub_244794634(&v40);
  return (ChipError *)sub_24479466C((uint64_t)&v41);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  objc_super v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 14047;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end