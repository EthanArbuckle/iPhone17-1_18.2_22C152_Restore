@interface MTRContentLauncherClusterLaunchContentParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRContentLauncherClusterContentSearchStruct)search;
- (MTRContentLauncherClusterLaunchContentParams)init;
- (MTRContentLauncherClusterPlaybackPreferencesStruct)playbackPreferences;
- (NSNumber)autoPlay;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)useCurrentContext;
- (NSString)data;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAutoPlay:(NSNumber *)autoPlay;
- (void)setData:(NSString *)data;
- (void)setPlaybackPreferences:(id)a3;
- (void)setSearch:(MTRContentLauncherClusterContentSearchStruct *)search;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUseCurrentContext:(id)a3;
@end

@implementation MTRContentLauncherClusterLaunchContentParams

- (MTRContentLauncherClusterLaunchContentParams)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRContentLauncherClusterLaunchContentParams;
  v2 = [(MTRContentLauncherClusterLaunchContentParams *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    search = v2->_search;
    v2->_search = (MTRContentLauncherClusterContentSearchStruct *)v3;

    autoPlay = v2->_autoPlay;
    v2->_autoPlay = (NSNumber *)&unk_26F9C8548;

    data = v2->_data;
    v2->_data = 0;

    playbackPreferences = v2->_playbackPreferences;
    v2->_playbackPreferences = 0;

    useCurrentContext = v2->_useCurrentContext;
    v2->_useCurrentContext = 0;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterLaunchContentParams);
  v7 = objc_msgSend_search(self, v5, v6);
  objc_msgSend_setSearch_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_autoPlay(self, v9, v10);
  objc_msgSend_setAutoPlay_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_data(self, v13, v14);
  objc_msgSend_setData_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_playbackPreferences(self, v17, v18);
  objc_msgSend_setPlaybackPreferences_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_useCurrentContext(self, v21, v22);
  objc_msgSend_setUseCurrentContext_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: search:%@; autoPlay:%@; data:%@; playbackPreferences:%@; useCurrentContext:%@; >",
    v5,
    self->_search,
    self->_autoPlay,
    self->_data,
    self->_playbackPreferences,
  v7 = self->_useCurrentContext);

  return v7;
}

- (MTRContentLauncherClusterContentSearchStruct)search
{
  return self->_search;
}

- (void)setSearch:(MTRContentLauncherClusterContentSearchStruct *)search
{
}

- (NSNumber)autoPlay
{
  return self->_autoPlay;
}

- (void)setAutoPlay:(NSNumber *)autoPlay
{
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(NSString *)data
{
}

- (MTRContentLauncherClusterPlaybackPreferencesStruct)playbackPreferences
{
  return self->_playbackPreferences;
}

- (void)setPlaybackPreferences:(id)a3
{
}

- (NSNumber)useCurrentContext
{
  return self->_useCurrentContext;
}

- (void)setUseCurrentContext:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_useCurrentContext, 0);
  objc_storeStrong((id *)&self->_playbackPreferences, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_autoPlay, 0);

  objc_storeStrong((id *)&self->_search, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v113 = 0;
  char v115 = 0;
  LOBYTE(v120) = 0;
  long long v111 = 0uLL;
  char v112 = 0;
  v110[0] = 0;
  v110[1] = 0;
  v109 = v110;
  v5 = objc_msgSend_search(self, a3, (uint64_t)a4);
  v8 = objc_msgSend_parameterList(v5, v6, v7);
  uint64_t v11 = objc_msgSend_count(v8, v9, v10);

  if (v11) {
    operator new();
  }
  long long v111 = 0uLL;
  uint64_t v14 = objc_msgSend_autoPlay(self, v12, v13);
  char v112 = objc_msgSend_BOOLValue(v14, v15, v16);

  v19 = objc_msgSend_data(self, v17, v18);

  if (v19)
  {
    char v113 = 1;
    long long v114 = 0uLL;
    objc_msgSend_data(self, v20, v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    uint64_t v25 = objc_msgSend_UTF8String(v22, v23, v24);
    uint64_t v27 = objc_msgSend_lengthOfBytesUsingEncoding_(v22, v26, 4);
    sub_24479476C(v103, v25, v27);

    long long v114 = *(_OWORD *)v103;
  }
  v28 = objc_msgSend_playbackPreferences(self, v20, v21);

  if (v28)
  {
    char v115 = 1;
    memset(v116, 0, sizeof(v116));
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v31 = objc_msgSend_playbackPreferences(self, v29, v30);
    v34 = objc_msgSend_playbackPosition(v31, v32, v33);
    v116[0] = objc_msgSend_unsignedLongLongValue(v34, v35, v36);

    v39 = objc_msgSend_playbackPreferences(self, v37, v38);
    v42 = objc_msgSend_textTrack(v39, v40, v41);
    objc_msgSend_languageCode(v42, v43, v44);
    id v45 = objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_UTF8String(v45, v46, v47);
    uint64_t v50 = objc_msgSend_lengthOfBytesUsingEncoding_(v45, v49, 4);
    sub_24479476C(v103, v48, v50);

    *(_OWORD *)&v116[1] = *(_OWORD *)v103;
    v53 = objc_msgSend_playbackPreferences(self, v51, v52);
    v56 = objc_msgSend_textTrack(v53, v54, v55);
    v59 = objc_msgSend_characteristics(v56, v57, v58);

    if (v59)
    {
      LOBYTE(v116[3]) = 1;
      long long v117 = 0uLL;
      v62 = objc_msgSend_playbackPreferences(self, v60, v61);
      v65 = objc_msgSend_textTrack(v62, v63, v64);
      v68 = objc_msgSend_characteristics(v65, v66, v67);
      uint64_t v71 = objc_msgSend_count(v68, v69, v70);

      if (v71) {
        operator new();
      }
      long long v117 = 0uLL;
    }
    v72 = objc_msgSend_playbackPreferences(self, v60, v61);
    v75 = objc_msgSend_textTrack(v72, v73, v74);
    v78 = objc_msgSend_audioOutputIndex(v75, v76, v77);
    LOBYTE(v118) = objc_msgSend_unsignedCharValue(v78, v79, v80);

    v83 = objc_msgSend_playbackPreferences(self, v81, v82);
    v86 = objc_msgSend_audioTracks(v83, v84, v85);

    if (v86)
    {
      BYTE8(v118) = 1;
      long long v119 = 0uLL;
      v87 = objc_msgSend_playbackPreferences(self, v29, v30);
      v90 = objc_msgSend_audioTracks(v87, v88, v89);
      uint64_t v93 = objc_msgSend_count(v90, v91, v92);

      if (v93) {
        operator new();
      }
      long long v119 = 0uLL;
    }
  }
  v94 = objc_msgSend_useCurrentContext(self, v29, v30);

  if (v94)
  {
    __int16 v120 = 1;
    v97 = objc_msgSend_useCurrentContext(self, v95, v96);
    HIBYTE(v120) = objc_msgSend_BOOLValue(v97, v98, v99);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v108);
  if (v108)
  {
    sub_244CB62B8((uint64_t)v103);
    v105 = 0;
    v106 = 0;
    v104 = &unk_26F9536C8;
    char v107 = 0;
    sub_2447945A0((uint64_t)&v104, &v108, 0);
    sub_244CB6318((uint64_t)v103, (uint64_t)&v104, 0xFFFFFFFF, (uint64_t)v121);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244836F74((uint64_t)&v111, v103, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v103, &v108, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v108);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v104 = &unk_26F9536C8;
    sub_244794634(&v106);
    sub_244794634(&v105);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 29545;
  }
  sub_244794634(&v108);
  return (ChipError *)sub_24479466C((uint64_t)&v109);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 29574;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end