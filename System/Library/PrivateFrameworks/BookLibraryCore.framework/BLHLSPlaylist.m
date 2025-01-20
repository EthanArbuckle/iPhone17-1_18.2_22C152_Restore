@interface BLHLSPlaylist
+ (BOOL)_rewritePlaylistWithParser:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6;
+ (BOOL)rewritePlaylistData:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6;
+ (BOOL)rewritePlaylistURL:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6;
+ (id)_playlistUsingParser:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5;
+ (id)playlistParsingData:(id)a3 error:(id *)a4;
+ (id)playlistParsingURL:(id)a3 error:(id *)a4;
+ (id)playlistParsingURL:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5;
- (BLHLSPlaylist)initWithRequestedBitrates:(id)a3;
- (BLHLSPlaylistState)state;
- (BOOL)_parseUsingParser:(id)a3 error:(id *)a4;
- (BOOL)ignoreSegments;
- (BOOL)independentSegments;
- (BOOL)parserShouldCollectLine:(id)a3;
- (NSArray)groups;
- (NSArray)requestedBitrates;
- (NSArray)segments;
- (NSArray)streamInfs;
- (NSMutableSet)uniqueKeys;
- (NSSet)keys;
- (NSString)description;
- (NSUUID)racGUID;
- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6;
- (void)parser:(id)a3 lineIsURL:(id)a4;
- (void)setGroups:(id)a3;
- (void)setIgnoreSegments:(BOOL)a3;
- (void)setIndependentSegments:(BOOL)a3;
- (void)setRacGUID:(id)a3;
- (void)setRequestedBitrates:(id)a3;
- (void)setSegments:(id)a3;
- (void)setState:(id)a3;
- (void)setStreamInfs:(id)a3;
- (void)setUniqueKeys:(id)a3;
@end

@implementation BLHLSPlaylist

- (BLHLSPlaylist)initWithRequestedBitrates:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BLHLSPlaylist;
  v6 = [(BLHLSPlaylist *)&v17 init];
  v7 = v6;
  if (v6)
  {
    groups = v6->_groups;
    v9 = (NSArray *)MEMORY[0x263EFFA68];
    v6->_groups = (NSArray *)MEMORY[0x263EFFA68];

    segments = v7->_segments;
    v7->_segments = v9;

    objc_storeStrong((id *)&v7->_requestedBitrates, a3);
    uint64_t v14 = objc_msgSend_set(MEMORY[0x263EFF9C0], v11, v12, v13);
    uniqueKeys = v7->_uniqueKeys;
    v7->_uniqueKeys = (NSMutableSet *)v14;
  }
  return v7;
}

- (NSString)description
{
  id v5 = (void *)MEMORY[0x263F089D8];
  if (objc_msgSend_independentSegments(self, a2, v2, v3)) {
    objc_msgSend_stringWithFormat_(v5, v6, @"{ independentSegments: %@\n", v7, @"YES");
  }
  else {
  v8 = objc_msgSend_stringWithFormat_(v5, v6, @"{ independentSegments: %@\n", v7, @"NO");
  }
  uint64_t v12 = objc_msgSend_groups(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);

  if (v16)
  {
    v20 = objc_msgSend_groups(self, v17, v18, v19);
    v24 = objc_msgSend_debugDescription(v20, v21, v22, v23);
    objc_msgSend_appendFormat_(v8, v25, @"Groups: %@\n", v26, v24);
  }
  v27 = objc_msgSend_streamInfs(self, v17, v18, v19);
  uint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

  if (v31)
  {
    v35 = objc_msgSend_streamInfs(self, v32, v33, v34);
    v39 = objc_msgSend_debugDescription(v35, v36, v37, v38);
    objc_msgSend_appendFormat_(v8, v40, @"SegmentInfs: %@\n", v41, v39);
  }
  v42 = objc_msgSend_segments(self, v32, v33, v34);
  uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45);

  if (v46)
  {
    v50 = objc_msgSend_segments(self, v47, v48, v49);
    v54 = objc_msgSend_debugDescription(v50, v51, v52, v53);
    objc_msgSend_appendFormat_(v8, v55, @"Segments: %@\n", v56, v54);
  }
  objc_msgSend_appendFormat_(v8, v47, @"}", v49);
  v60 = objc_msgSend_copy(v8, v57, v58, v59);

  return (NSString *)v60;
}

- (NSSet)keys
{
  v4 = objc_msgSend_copy(self->_uniqueKeys, a2, v2, v3);

  return (NSSet *)v4;
}

+ (BOOL)rewritePlaylistData:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [BLM3U8Parser alloc];
  uint64_t v16 = objc_msgSend_initWithData_(v13, v14, (uint64_t)v12, v15);

  LOBYTE(a6) = objc_msgSend__rewritePlaylistWithParser_toURL_requestedBitrates_error_(a1, v17, (uint64_t)v16, (uint64_t)v11, v10, a6);
  return (char)a6;
}

+ (BOOL)rewritePlaylistURL:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [BLM3U8Parser alloc];
  uint64_t v16 = objc_msgSend_initWithURL_(v13, v14, (uint64_t)v12, v15);

  LOBYTE(a6) = objc_msgSend__rewritePlaylistWithParser_toURL_requestedBitrates_error_(a1, v17, (uint64_t)v16, (uint64_t)v11, v10, a6);
  return (char)a6;
}

+ (BOOL)_rewritePlaylistWithParser:(id)a3 toURL:(id)a4 requestedBitrates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_msgSend_setCollectForRewrite_(v10, v13, 1, v14);
  id v15 = objc_alloc((Class)a1);
  uint64_t v18 = objc_msgSend_initWithRequestedBitrates_(v15, v16, (uint64_t)v12, v17);

  if (objc_msgSend__parseUsingParser_error_(v18, v19, (uint64_t)v10, (uint64_t)a6)) {
    char v22 = objc_msgSend_rewriteWithURL_(v10, v20, (uint64_t)v11, v21);
  }
  else {
    char v22 = 0;
  }

  return v22;
}

- (BOOL)_parseUsingParser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend_setDelegate_(v6, v7, (uint64_t)self, v8);
  v9 = objc_alloc_init(BLHLSPlaylistState);
  objc_msgSend_setState_(self, v10, (uint64_t)v9, v11);

  id v66 = 0;
  char v14 = objc_msgSend_parseWithError_(v6, v12, (uint64_t)&v66, v13);

  id v15 = v66;
  uint64_t v19 = v15;
  if (v14)
  {
    v20 = objc_msgSend_state(self, v16, v17, v18);
    v24 = objc_msgSend_array(MEMORY[0x263EFF980], v21, v22, v23);
    v28 = objc_msgSend_mutableGroups(v20, v25, v26, v27);
    uint64_t v61 = MEMORY[0x263EF8330];
    uint64_t v62 = 3221225472;
    v63 = sub_21DFF34DC;
    v64 = &unk_26448B840;
    id v65 = v24;
    id v29 = v24;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v28, v30, (uint64_t)&v61, v31);

    v35 = objc_msgSend_copy(v29, v32, v33, v34, v61, v62, v63, v64);
    objc_msgSend_setGroups_(self, v36, (uint64_t)v35, v37);

    uint64_t v41 = objc_msgSend_mutableStreamInfs(v20, v38, v39, v40);
    uint64_t v45 = objc_msgSend_copy(v41, v42, v43, v44);
    objc_msgSend_setStreamInfs_(self, v46, (uint64_t)v45, v47);

    v51 = objc_msgSend_mutableSegments(v20, v48, v49, v50);
    v55 = objc_msgSend_copy(v51, v52, v53, v54);
    objc_msgSend_setSegments_(self, v56, (uint64_t)v55, v57);

    objc_msgSend_setState_(self, v58, 0, v59);
  }
  else if (a4)
  {
    *a4 = v15;
  }

  return v14;
}

+ (id)_playlistUsingParser:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  id v12 = objc_msgSend_initWithRequestedBitrates_(v9, v10, 0, v11);
  objc_msgSend_setIgnoreSegments_(v12, v13, v6, v14);
  LODWORD(a5) = objc_msgSend__parseUsingParser_error_(v12, v15, (uint64_t)v8, (uint64_t)a5);

  if (a5) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

+ (id)playlistParsingData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [BLM3U8Parser alloc];
  id v10 = objc_msgSend_initWithData_(v7, v8, (uint64_t)v6, v9);

  id v12 = objc_msgSend__playlistUsingParser_ignoreSegments_error_(a1, v11, (uint64_t)v10, 0, a4);

  return v12;
}

+ (id)playlistParsingURL:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_playlistParsingURL_ignoreSegments_error_, a3, 0);
}

+ (id)playlistParsingURL:(id)a3 ignoreSegments:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [BLM3U8Parser alloc];
  id v12 = objc_msgSend_initWithURL_(v9, v10, (uint64_t)v8, v11);

  uint64_t v14 = objc_msgSend__playlistUsingParser_ignoreSegments_error_(a1, v13, (uint64_t)v12, v6, a5);

  return v14;
}

- (void)parser:(id)a3 lineIsURL:(id)a4
{
  id v53 = a4;
  id v8 = objc_msgSend_state(self, v5, v6, v7);
  id v12 = objc_msgSend_currentStreamInf(v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_currentStreamInf(v8, v13, v14, v15);
    objc_msgSend_setCurrentStreamInf_(v8, v17, 0, v18);
    objc_msgSend_setUrl_(v16, v19, (uint64_t)v53, v20);
    v24 = objc_msgSend_mutableStreamInfs(v8, v21, v22, v23);
LABEL_3:
    uint64_t v27 = v24;
    objc_msgSend_addObject_(v24, v25, (uint64_t)v16, v26);

    goto LABEL_4;
  }
  if ((objc_msgSend_ignoreSegments(self, v13, v14, v15) & 1) == 0)
  {
    objc_msgSend_currentDuration(v8, v28, v29, v30);
    if (v31 != -1.0)
    {
      v32 = [BLHLSSegment alloc];
      objc_msgSend_currentDuration(v8, v33, v34, v35);
      double v37 = v36;
      uint64_t v41 = objc_msgSend_currentMap(v8, v38, v39, v40);
      uint64_t v45 = objc_msgSend_currentKey(v8, v42, v43, v44);
      uint64_t v16 = objc_msgSend_initWithURL_duration_map_key_(v32, v46, (uint64_t)v53, (uint64_t)v41, v45, v37);

      objc_msgSend_setCurrentDuration_(v8, v47, v48, v49, -1.0);
      v24 = objc_msgSend_mutableSegments(v8, v50, v51, v52);
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v15 = objc_msgSend_state(self, v12, v13, v14);
  if (objc_msgSend_isEqualToString_(v9, v16, @"#EXT-X-MEDIA", v17))
  {
    objc_msgSend_objectForKeyedSubscript_(v11, v18, @"GROUP-ID", v19);
    uint64_t v20 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_alloc_init(BLHLSMedia);
    objc_msgSend_setPropertiesFromAttributeList_(v21, v22, (uint64_t)v11, v23);
    uint64_t v27 = objc_msgSend_mutableGroups(v15, v24, v25, v26);
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v20, v29);

    if (!v30)
    {
      uint64_t v30 = objc_msgSend_array(MEMORY[0x263EFF980], v31, v32, v33);
      double v37 = objc_msgSend_mutableGroups(v15, v34, v35, v36);
      objc_msgSend_setObject_forKeyedSubscript_(v37, v38, (uint64_t)v30, (uint64_t)v20);
    }
    objc_msgSend_addObject_(v30, v31, (uint64_t)v21, v33);

    goto LABEL_9;
  }
  if (!objc_msgSend_isEqualToString_(v9, v18, @"#EXT-X-MAP", v19))
  {
    if (objc_msgSend_isEqualToString_(v9, v39, @"#EXTINF", v40))
    {
      objc_msgSend_componentsSeparatedByString_(v10, v45, @",", v46);
      uint64_t v20 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
      uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(v20, v47, 0, v48);
      objc_msgSend_doubleValue(v49, v50, v51, v52);
      double v54 = v53;

      objc_msgSend_setCurrentDuration_(v15, v55, v56, v57, v54);
      goto LABEL_9;
    }
    if (objc_msgSend_isEqualToString_(v9, v45, @"#EXT-X-INDEPENDENT-SEGMENTS", v46))
    {
      objc_msgSend_setIndependentSegments_(self, v58, 1, v59);
      goto LABEL_10;
    }
    if (objc_msgSend_isEqualToString_(v9, v58, @"#EXT-X-KEY", v59))
    {
      uint64_t v62 = objc_alloc_init(BLHLSKey);
      objc_msgSend_setPropertiesFromAttributeList_(v62, v63, (uint64_t)v11, v64);
      if (objc_msgSend_isFormatSupported(v62, v65, v66, v67))
      {
        objc_msgSend_setCurrentKey_(v15, v68, (uint64_t)v62, v69);
        objc_msgSend_addObject_(self->_uniqueKeys, v70, (uint64_t)v62, v71);
LABEL_27:

        goto LABEL_10;
      }
      v78 = BLDefaultLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        v82 = objc_msgSend_keyFormat(v62, v79, v80, v81);
        int v98 = 138543362;
        id v99 = v82;
        _os_log_impl(&dword_21DFE3000, v78, OS_LOG_TYPE_DEBUG, "Dropping unsupported key format %{public}@", (uint8_t *)&v98, 0xCu);
      }
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v9, v60, @"#EXT-X-STREAM-INF", v61))
      {
        uint64_t v20 = objc_alloc_init(BLHLSStreamInf);
        objc_msgSend_setPropertiesFromAttributeList_(v20, v74, (uint64_t)v11, v75);
        objc_msgSend_setCurrentStreamInf_(v15, v76, (uint64_t)v20, v77);
        goto LABEL_9;
      }
      if (!objc_msgSend_isEqualToString_(v9, v72, @"#EXT-X-SESSION-DATA", v73)
        || (objc_msgSend_objectForKeyedSubscript_(v11, v83, @"DATA-ID", v84),
            v85 = objc_claimAutoreleasedReturnValue(),
            int isEqualToString = objc_msgSend_isEqualToString_(v85, v86, @"com.apple.audiobook.rapguid", v87), v85, !isEqualToString))
      {
        if (objc_msgSend_isEqualToString_(v9, v83, @"#EXT-X-BITRATE", v84)) {
          goto LABEL_10;
        }
        BLDefaultLog();
        uint64_t v20 = (BLHLSStreamInf *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEBUG))
        {
          int v98 = 138412290;
          id v99 = v9;
          _os_log_impl(&dword_21DFE3000, &v20->super, OS_LOG_TYPE_DEBUG, "Ignoring tag %@", (uint8_t *)&v98, 0xCu);
        }
        goto LABEL_9;
      }
      objc_msgSend_objectForKeyedSubscript_(v11, v83, @"VALUE", v84);
      uint64_t v62 = (BLHLSKey *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v62, v89, v90, v91))
      {
        id v92 = objc_alloc(MEMORY[0x263F08C38]);
        v95 = objc_msgSend_initWithUUIDString_(v92, v93, (uint64_t)v62, v94);
        objc_msgSend_setRacGUID_(self, v96, (uint64_t)v95, v97);
      }
      v78 = BLDefaultLog();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        int v98 = 138412290;
        id v99 = v11;
        _os_log_impl(&dword_21DFE3000, v78, OS_LOG_TYPE_DEFAULT, "Found rapguid attribute: %@", (uint8_t *)&v98, 0xCu);
      }
    }

    goto LABEL_27;
  }
  uint64_t v20 = objc_alloc_init(BLHLSMap);
  objc_msgSend_setPropertiesFromAttributeList_(v20, v41, (uint64_t)v11, v42);
  objc_msgSend_setCurrentMap_(v15, v43, (uint64_t)v20, v44);
LABEL_9:

LABEL_10:
}

- (BOOL)parserShouldCollectLine:(id)a3
{
  id v5 = objc_msgSend_state(self, a2, (uint64_t)a3, v3);
  id v9 = objc_msgSend_currentStreamInf(v5, v6, v7, v8);

  if (!v9) {
    return 1;
  }
  uint64_t v13 = objc_msgSend_requestedBitrates(self, v10, v11, v12);
  uint64_t v14 = NSNumber;
  uint64_t v18 = objc_msgSend_state(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_currentStreamInf(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_averageBandwidthFallbackToPeak(v22, v23, v24, v25);
  uint64_t v29 = objc_msgSend_numberWithUnsignedLongLong_(v14, v27, v26, v28);
  char v32 = objc_msgSend_containsObject_(v13, v30, (uint64_t)v29, v31);

  return v32;
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)streamInfs
{
  return self->_streamInfs;
}

- (void)setStreamInfs:(id)a3
{
}

- (BOOL)independentSegments
{
  return self->_independentSegments;
}

- (void)setIndependentSegments:(BOOL)a3
{
  self->_independentSegments = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (BOOL)ignoreSegments
{
  return self->_ignoreSegments;
}

- (void)setIgnoreSegments:(BOOL)a3
{
  self->_ignoreSegments = a3;
}

- (NSUUID)racGUID
{
  return self->_racGUID;
}

- (void)setRacGUID:(id)a3
{
}

- (BLHLSPlaylistState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSMutableSet)uniqueKeys
{
  return self->_uniqueKeys;
}

- (void)setUniqueKeys:(id)a3
{
}

- (NSArray)requestedBitrates
{
  return self->_requestedBitrates;
}

- (void)setRequestedBitrates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBitrates, 0);
  objc_storeStrong((id *)&self->_uniqueKeys, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_racGUID, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_streamInfs, 0);

  objc_storeStrong((id *)&self->_groups, 0);
}

@end