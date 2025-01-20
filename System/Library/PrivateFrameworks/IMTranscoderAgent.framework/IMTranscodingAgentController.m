@interface IMTranscodingAgentController
+ (id)sharedInstance;
- (BOOL)isMovieType:(id)a3;
- (BOOL)shouldProcessFileTransfer:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 target:(int64_t)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9;
- (IMTranscodingAgentController)init;
- (id)_findTranscoderForUTI:(id)a3;
- (void)_registerTranscoders;
- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6;
- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 balloonBundleID:(id)a6 constraints:(IMPreviewConstraints *)a7 completionBlock:(id)a8;
- (void)generatePreviewMetadata:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7;
- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5;
- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 fallback:(BOOL)a12 representations:(int64_t)a13 isLQMEnabled:(BOOL)a14 completionBlock:(id)a15;
- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 fallBack:(BOOL)a6 completionBlock:(id)a7;
- (void)transcodeThumbnailFor:(id)a3 target:(int64_t)a4 allSizes:(id)a5 commonCapabilities:(id)a6 maxDimension:(unint64_t)a7 transcoderUserInfo:(id)a8 isLQMEnabled:(BOOL)a9 outputURLs:(id)a10 outputContextInfo:(id)a11 attemptedTranscode:(BOOL)a12 additionalOutPutContext:(id)a13 completionBlock:(id)a14;
- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4;
@end

@implementation IMTranscodingAgentController

+ (id)sharedInstance
{
  if (qword_26ACA7210 != -1) {
    dispatch_once(&qword_26ACA7210, &unk_26DE87618);
  }
  v2 = (void *)qword_26ACA7218;
  return v2;
}

- (void)_registerTranscoders
{
  if (!self->_transcoders)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
    v4 = objc_alloc_init(IMTranscoder_Image);
    v5 = objc_alloc_init(IMTranscoder_AV);
    v11 = (NSArray *)objc_msgSend_initWithObjects_(v3, v6, (uint64_t)v4, v7, v8, v9, v10, v5, 0);
    transcoders = self->_transcoders;
    self->_transcoders = v11;

    id v13 = objc_alloc(MEMORY[0x263EFF8C0]);
    v21 = objc_alloc_init(IMFallbackTranscoder);
    v19 = (NSArray *)objc_msgSend_initWithObjects_(v13, v14, (uint64_t)v21, v15, v16, v17, v18, 0);
    fallbackTranscoders = self->_fallbackTranscoders;
    self->_fallbackTranscoders = v19;
  }
}

- (IMTranscodingAgentController)init
{
  v18.receiver = self;
  v18.super_class = (Class)IMTranscodingAgentController;
  v2 = [(IMTranscodingAgentController *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.IMTranscoderQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    v6 = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v5, v6);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.IMTranscoderPreviewGenerationQueue", 0);
    previewGenerationQueue = v2->_previewGenerationQueue;
    v2->_previewGenerationQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = v2->_previewGenerationQueue;
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v9, v10);

    objc_msgSend__registerTranscoders(v2, v11, v12, v13, v14, v15, v16);
  }
  return v2;
}

- (id)_findTranscoderForUTI:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_transcoders;
  id v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, (uint64_t)v27, 16, v7, v8);
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        if (objc_msgSend_supportsUTI_(v13, v14, (uint64_t)v4, v15, v16, v17, v18, (void)v23))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v19, (uint64_t)&v23, (uint64_t)v27, 16, v20, v21);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)shouldProcessFileTransfer:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 target:(int64_t)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  long long v25 = objc_msgSend__findTranscoderForUTI_(self, v20, (uint64_t)v16, v21, v22, v23, v24);
  v27 = v25;
  if (v25)
  {
    uint64_t shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(v25, v26, (uint64_t)v15, (uint64_t)v17, a6, (uint64_t)v16, (uint64_t)v18, a8, v19);
    char v34 = objc_msgSend_transcodeProcessingRequired_(v27, v29, shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities, v30, v31, v32, v33);
  }
  else
  {
    char v34 = 0;
  }

  return v34;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 fallback:(BOOL)a12 representations:(int64_t)a13 isLQMEnabled:(BOOL)a14 completionBlock:(id)a15
{
  BOOL v197 = a5;
  uint64_t v236 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v202 = a4;
  id v200 = a6;
  id v20 = a8;
  id v201 = a9;
  id v21 = a11;
  id v22 = a15;
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v235 = (unint64_t)v19;
      _os_log_impl(&dword_22B280000, v23, OS_LOG_TYPE_INFO, "Transcoder received request to transcode %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v235 = (unint64_t)v202;
      _os_log_impl(&dword_22B280000, v24, OS_LOG_TYPE_INFO, "                       UTI: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v235 = (unint64_t)v200;
      _os_log_impl(&dword_22B280000, v25, OS_LOG_TYPE_INFO, "     Allow Unfiltered UTIs: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v235 = (unint64_t)v20;
      _os_log_impl(&dword_22B280000, v26, OS_LOG_TYPE_INFO, "                     Sizes: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v235 = a10;
      _os_log_impl(&dword_22B280000, v27, OS_LOG_TYPE_INFO, "             Max Dimension: %ld", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v235 = (unint64_t)v21;
      _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "           Transcoder Info: %@", buf, 0xCu);
    }
  }
  if (v21)
  {
    char v34 = objc_msgSend_objectForKey_(v21, v28, *MEMORY[0x263F4ABA0], v29, v30, v31, v32);
    int v41 = objc_msgSend_BOOLValue(v34, v35, v36, v37, v38, v39, v40);

    if (v41)
    {
      if (IMIsHEVCWithAlphaVideoURL())
      {
        v48 = objc_msgSend_mutableCopy(v21, v42, v43, v44, v45, v46, v47);
        v54 = objc_msgSend_numberWithBool_(NSNumber, v49, 1, v50, v51, v52, v53);
        objc_msgSend_setObject_forKey_(v48, v55, (uint64_t)v54, *MEMORY[0x263F4ABB8], v56, v57, v58);

        uint64_t v65 = objc_msgSend_copy(v48, v59, v60, v61, v62, v63, v64);
        id v21 = (id)v65;
      }
    }
  }
  v231[0] = MEMORY[0x263EF8330];
  v231[1] = 3221225472;
  v231[2] = sub_22B29A8C8;
  v231[3] = &unk_26488EBE0;
  id v66 = v22;
  id v232 = v66;
  v73 = (void (**)(void, void, void, void, void, void, void, void))MEMORY[0x230F44340](v231);
  if (a12)
  {
    v74 = objc_msgSend_lastObject(self->_fallbackTranscoders, v67, v68, v69, v70, v71, v72);

    if (v74)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_22B29AA64;
      block[3] = &unk_26488EC30;
      block[4] = self;
      id v227 = v19;
      id v228 = v202;
      id v21 = v21;
      id v229 = v21;
      v230 = v73;
      dispatch_async(queue, block);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v102 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v235 = (unint64_t)v19;
          _os_log_impl(&dword_22B280000, v102, OS_LOG_TYPE_INFO, "Transcoding Not transcoding file %@", buf, 0xCu);
        }
      }
      v73[2](v73, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    id v198 = v20;
    v82 = (void (**)(void, void, void, void, void, void, void, void))MEMORY[0x230F44340](v73);
    int64_t v83 = a13;
    if (a13 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        v90 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v90, OS_LOG_TYPE_INFO, "Thumbnail with single requested, creating overrideBlock", buf, 2u);
        }
      }
      v91 = objc_msgSend_firstObject(v198, v84, v85, v86, v87, v88, v89);
      v233 = v91;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v92, (uint64_t)&v233, 1, v93, v94, v95);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      v216[0] = MEMORY[0x263EF8330];
      v216[1] = 3221225472;
      v216[2] = sub_22B29AB6C;
      v216[3] = &unk_26488EC58;
      v216[4] = self;
      id v217 = v19;
      int64_t v223 = a7;
      id v218 = v198;
      id v219 = v201;
      unint64_t v224 = a10;
      id v220 = v21;
      BOOL v225 = a14;
      v221 = v73;
      id v222 = v82;
      v96 = (void *)MEMORY[0x230F44340](v216);
      v82 = (void (**)(void, void, void, void, void, void, void, void))MEMORY[0x230F44340]();

      int64_t v83 = 0;
    }
    else
    {
      id v20 = v198;
    }
    int64_t v196 = v83;
    if (v197)
    {
      if (v21) {
        id v97 = (id)objc_msgSend_mutableCopy(v21, v76, v77, v78, v79, v80, v81);
      }
      else {
        id v97 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v103 = v97;
      objc_msgSend_setObject_forKeyedSubscript_(v97, v98, MEMORY[0x263EFFA88], @"isSticker", v99, v100, v101);
      uint64_t v110 = objc_msgSend_copy(v103, v104, v105, v106, v107, v108, v109);

      id v21 = (id)v110;
    }
    int shouldPreserveHEIFEncoding_target_sourceUTI = objc_msgSend_shouldPreserveHEIFEncoding_target_sourceUTI_(IMTranscoder, v76, (uint64_t)v201, a7, (uint64_t)v202, v80, v81);
    int v112 = IMOSLoggingEnabled();
    if (shouldPreserveHEIFEncoding_target_sourceUTI)
    {
      if (v112)
      {
        v119 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v119, OS_LOG_TYPE_INFO, "Preserving HEIF encoding if possible.", buf, 2u);
        }
      }
      if (v21) {
        id v120 = (id)objc_msgSend_mutableCopy(v21, v113, v114, v115, v116, v117, v118);
      }
      else {
        id v120 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v127 = v120;
      v128 = objc_msgSend_numberWithBool_(NSNumber, v121, 1, v122, v123, v124, v125);
      objc_msgSend_setObject_forKey_(v127, v129, (uint64_t)v128, @"preserveHEIF", v130, v131, v132);

      uint64_t v139 = objc_msgSend_copy(v127, v133, v134, v135, v136, v137, v138);
      id v21 = (id)v139;
    }
    else if (v112)
    {
      v126 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v126, OS_LOG_TYPE_INFO, "Not preserving HEIF encoding", buf, 2u);
      }
    }
    int shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v113, (uint64_t)v201, v115, v116, v117, v118);
    int v141 = IMOSLoggingEnabled();
    if (shouldPreserveHDREncoding)
    {
      if (v141)
      {
        v148 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v148, OS_LOG_TYPE_INFO, "Preserve HDR output", buf, 2u);
        }
      }
      if (v21) {
        id v149 = (id)objc_msgSend_mutableCopy(v21, v142, v143, v144, v145, v146, v147);
      }
      else {
        id v149 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      v156 = v149;
      v157 = objc_msgSend_numberWithBool_(NSNumber, v150, 1, v151, v152, v153, v154);
      objc_msgSend_setObject_forKey_(v156, v158, (uint64_t)v157, @"preserveHDR", v159, v160, v161);

      uint64_t v168 = objc_msgSend_copy(v156, v162, v163, v164, v165, v166, v167);
      id v21 = (id)v168;
    }
    else if (v141)
    {
      v155 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v155, OS_LOG_TYPE_INFO, "Will NOT preserve HDR output", buf, 2u);
      }
    }
    v169 = objc_msgSend_lastObject(v20, v142, v143, v144, v145, v146, v147);
    uint64_t v176 = objc_msgSend_unsignedLongValue(v169, v170, v171, v172, v173, v174, v175);
    int shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(self, v177, (uint64_t)v19, (uint64_t)v202, (uint64_t)v21, a7, (uint64_t)v200, v176, v201);

    if (shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities
      && (objc_msgSend__findTranscoderForUTI_(self, v179, (uint64_t)v202, v180, v181, v182, v183),
          v184 = objc_claimAutoreleasedReturnValue(),
          (v185 = v184) != 0))
    {
      v186 = self->_queue;
      v203[0] = MEMORY[0x263EF8330];
      v203[1] = 3221225472;
      v203[2] = sub_22B29AD94;
      v203[3] = &unk_26488EC80;
      id v204 = v184;
      id v205 = v19;
      id v206 = v202;
      id v207 = v200;
      int64_t v212 = a7;
      id v208 = v20;
      id v209 = v201;
      unint64_t v213 = a10;
      id v210 = v21;
      int64_t v214 = v196;
      BOOL v215 = a14;
      v211 = v82;
      id v187 = v185;
      dispatch_async(v186, v203);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v194 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v194, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v235 = (unint64_t)v202;
          _os_log_impl(&dword_22B280000, v194, OS_LOG_TYPE_INFO, "Not transcoding attachment file format: %@", buf, 0xCu);
        }
      }
      v195 = _IMTranscoderLinkFile(v19, v188, v189, v190, v191, v192, v193);
      IMSingleObjectArray();
      id v187 = (id)objc_claimAutoreleasedReturnValue();

      ((void (**)(void, id, id, void, void, uint64_t, void, void))v82)[2](v82, v19, v187, 0, 0, 1, 0, 0);
    }
  }
}

- (BOOL)isMovieType:(id)a3
{
  uint64_t v7 = objc_msgSend_path(a3, a2, (uint64_t)a3, v3, v4, v5, v6);
  uint64_t v14 = objc_msgSend_pathExtension(v7, v8, v9, v10, v11, v12, v13);

  if (v14)
  {
    id v20 = objc_msgSend_typeWithFilenameExtension_(MEMORY[0x263F1D920], v15, (uint64_t)v14, v16, v17, v18, v19);
    char v26 = objc_msgSend_conformsToType_(v20, v21, *MEMORY[0x263F1DBC8], v22, v23, v24, v25);
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

- (void)transcodeThumbnailFor:(id)a3 target:(int64_t)a4 allSizes:(id)a5 commonCapabilities:(id)a6 maxDimension:(unint64_t)a7 transcoderUserInfo:(id)a8 isLQMEnabled:(BOOL)a9 outputURLs:(id)a10 outputContextInfo:(id)a11 attemptedTranscode:(BOOL)a12 additionalOutPutContext:(id)a13 completionBlock:(id)a14
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v126 = a5;
  id v125 = a6;
  id v127 = a8;
  id v19 = a10;
  id v20 = a11;
  id v21 = a13;
  id v22 = a14;
  CFURLRef v23 = (const __CFURL *)v18;
  id v120 = v19;
  uint64_t v122 = v21;
  uint64_t v117 = v20;
  v119 = v22;
  if (objc_msgSend_isMovieType_(self, v24, (uint64_t)v23, v25, v26, v27, v28))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "Generating thumbnail of video %@", buf, 0xCu);
      }
    }
    uint64_t v144 = 0;
    *(_OWORD *)buf = 0u;
    long long v143 = 0u;
    uint64_t v39 = *MEMORY[0x263F4ADF0];
    v140[0] = *MEMORY[0x263F4ADE0];
    v140[1] = v39;
    v141[0] = &unk_26DE897E8;
    v141[1] = &unk_26DE897F8;
    uint64_t v40 = *MEMORY[0x263F4ADF8];
    v140[2] = *MEMORY[0x263F4ADE8];
    v140[3] = v40;
    v141[2] = &unk_26DE897F8;
    v141[3] = &unk_26DE89808;
    uint64_t v41 = *MEMORY[0x263F4ADD0];
    v140[4] = *MEMORY[0x263F4ADD8];
    v140[5] = v41;
    v141[4] = MEMORY[0x263EFFA80];
    v141[5] = MEMORY[0x263EFFA80];
    v140[6] = *MEMORY[0x263F4ADC8];
    v141[6] = MEMORY[0x263EFFA80];
    v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v141, (uint64_t)v140, 7, v36, v37);
    IMPreviewConstraintsFromDictionary();

    uint64_t v43 = (void *)MEMORY[0x263F4AFD8];
    uint64_t v50 = objc_msgSend_fromMeContext(MEMORY[0x263F4B018], v44, v45, v46, v47, v48, v49);
    id v136 = 0;
    *(_OWORD *)uint64_t v138 = *(_OWORD *)buf;
    *(_OWORD *)&v138[16] = v143;
    uint64_t v139 = v144;
    uint64_t v52 = (CGImage *)objc_msgSend_newPreviewFromSourceURL_senderContext_withPreviewConstraints_skipPlayButton_error_(v43, v51, (uint64_t)v23, (uint64_t)v50, (uint64_t)v138, 1, (uint64_t)&v136);
    id v53 = v136;

    uint64_t v60 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v54, v55, v56, v57, v58, v59);
    objc_msgSend_im_randomTemporaryFileURLWithFileName_(v60, v61, @"preview.jpg", v62, v63, v64, v65);
    CFURLRef v66 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    v67 = (void *)*MEMORY[0x263F1DB40];
    objc_msgSend_identifier((void *)*MEMORY[0x263F1DB40], v68, v69, v70, v71, v72, v73);
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v75 = CGImageDestinationCreateWithURL(v66, v74, 1uLL, 0);

    CFURLRef v128 = v23;
    if (v75)
    {
      CGImageDestinationAddImage(v75, v52, 0);
      BOOL v76 = CGImageDestinationFinalize(v75);
      int v77 = IMOSLoggingEnabled();
      if (v76)
      {
        if (v77)
        {
          uint64_t v78 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v138 = 138412290;
            *(void *)&v138[4] = v66;
            _os_log_impl(&dword_22B280000, v78, OS_LOG_TYPE_INFO, "Generated frame of movie as jpeg to %@", v138, 0xCu);
          }
        }
        CFURLRef v128 = v66;
      }
      else
      {
        CFURLRef v128 = v23;
        if (v77)
        {
          uint64_t v79 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v138 = 138412546;
            *(void *)&v138[4] = v23;
            *(_WORD *)&v138[12] = 2112;
            *(void *)&v138[14] = v66;
            _os_log_impl(&dword_22B280000, v79, OS_LOG_TYPE_INFO, "Failed to save JPEG frame of movie %@ to %@", v138, 0x16u);
          }

          CFURLRef v128 = v23;
        }
      }
      CFRelease(v75);
    }
    if (v52) {
      CFRelease(v52);
    }

    objc_msgSend_identifier(v67, v80, v81, v82, v83, v84, v85);
  }
  else
  {
    v67 = (void *)*MEMORY[0x263F1DB40];
    CFURLRef v128 = v23;
    objc_msgSend_identifier((void *)*MEMORY[0x263F1DB40], v29, v30, v31, v32, v33, v34);
  uint64_t v86 = };
  v92 = objc_msgSend__findTranscoderForUTI_(self, v87, (uint64_t)v86, v88, v89, v90, v91);

  if (IMOSLoggingEnabled())
  {
    uint64_t v99 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v128;
      _os_log_impl(&dword_22B280000, v99, OS_LOG_TYPE_INFO, "Transcoding thumbnail from %@", buf, 0xCu);
    }
  }
  uint64_t v100 = objc_msgSend_identifier(v67, v93, v94, v95, v96, v97, v98);
  uint64_t v107 = objc_msgSend_lastObject(v126, v101, v102, v103, v104, v105, v106);
  uint64_t v137 = v107;
  int v112 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v108, (uint64_t)&v137, 1, v109, v110, v111);
  v129[0] = MEMORY[0x263EF8330];
  v129[1] = 3221225472;
  v129[2] = sub_22B29B4F0;
  v129[3] = &unk_26488ECA8;
  id v130 = v122;
  CFURLRef v131 = v23;
  id v132 = v120;
  id v133 = v117;
  id v134 = v119;
  BOOL v135 = a12;
  id v118 = v117;
  id v113 = v120;
  CFURLRef v121 = v23;
  id v114 = v119;
  id v115 = v122;
  objc_msgSend_transcodeFileTransfer_utiType_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(v92, v116, (uint64_t)v128, (uint64_t)v100, MEMORY[0x263EFFA68], a4, (uint64_t)v112, v125, a7, v127, 0, a9, v129);
}

- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 fallBack:(BOOL)a6 completionBlock:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v22 = objc_msgSend_lastObject(self->_fallbackTranscoders, v16, v17, v18, v19, v20, v21);

  if (v22)
  {
    queue = self->_queue;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_22B29B8E4;
    v25[3] = &unk_26488ECD0;
    BOOL v31 = a6;
    id v26 = v13;
    uint64_t v27 = self;
    id v28 = v12;
    id v29 = v14;
    id v30 = v15;
    dispatch_async(queue, v25);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v13;
        _os_log_impl(&dword_22B280000, v24, OS_LOG_TYPE_INFO, "Transcoding Not transcoding attachment file format: %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void, void, void, void))v15 + 2))(v15, 0, 0, 0, 0, 0);
  }
}

- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5
{
  uint64_t v321 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, uint64_t, void))a5;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_22B280000, v15, OS_LOG_TYPE_INFO, "Transcoder received request to generate safe render: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v16 = (void *)MEMORY[0x263F1D920];
  uint64_t v17 = objc_msgSend_lastPathComponent(v7, v9, v10, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_pathExtension((void *)v17, v18, v19, v20, v21, v22, v23);
  id v30 = objc_msgSend_typeWithFilenameExtension_(v16, v25, (uint64_t)v24, v26, v27, v28, v29);

  LODWORD(v17) = objc_msgSend_conformsToType_(v30, v31, *MEMORY[0x263F1DB18], v32, v33, v34, v35);
  int v41 = objc_msgSend_conformsToType_(v30, v36, *MEMORY[0x263F1DBC8], v37, v38, v39, v40);
  int v47 = objc_msgSend_conformsToType_(v30, v42, *MEMORY[0x263F1D9B8], v43, v44, v45, v46);
  v54 = objc_msgSend_im_lastPathComponent(v7, v48, v49, v50, v51, v52, v53);
  int v60 = objc_msgSend_containsString_(v54, v55, *MEMORY[0x263F4AC18], v56, v57, v58, v59);

  int v61 = v60 | v17;
  if ((v60 | v17 | v41 | v47))
  {
    uint64_t v310 = 0;
    v311 = &v310;
    uint64_t v312 = 0x2020000000;
    char v313 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v317 = 0x3032000000;
    v318 = sub_22B29C788;
    v319 = sub_22B29C798;
    id v320 = 0;
    uint64_t v304 = 0;
    v305 = &v304;
    uint64_t v306 = 0x3032000000;
    v307 = sub_22B29C788;
    v308 = sub_22B29C798;
    id v309 = 0;
    uint64_t v62 = dispatch_group_create();
    v290 = objc_msgSend_untrustedContext(MEMORY[0x263F4B018], v63, v64, v65, v66, v67, v68);
    if (!v61)
    {
      if (v41)
      {
        dispatch_group_enter(v62);
        uint64_t v173 = (void *)MEMORY[0x263F4AF20];
        if (a4->var0 >= 1200.0) {
          double var0 = a4->var0;
        }
        else {
          double var0 = 1200.0;
        }
        double var2 = a4->var2;
        v297[0] = MEMORY[0x263EF8330];
        v297[1] = 3221225472;
        v297[2] = sub_22B29C7A0;
        v297[3] = &unk_26488ECF8;
        v300 = &v304;
        id v298 = v7;
        v301 = &v310;
        p_long long buf = &buf;
        v299 = v62;
        objc_msgSend_generateMoviePreview_senderContext_maxPxWidth_minThumbnailPxSize_scale_withCompletionBlock_(v173, v176, (uint64_t)v298, (uint64_t)v290, (uint64_t)v297, v177, v178, var0, a4->var1.width, a4->var1.height, var2);

        id v75 = v298;
      }
      else
      {
        if (!v47)
        {
LABEL_56:
          dispatch_group_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
          if (v8)
          {
            uint64_t v280 = *((void *)&buf + 1);
            if (*((unsigned char *)v311 + 24))
            {
              BOOL v281 = 1;
            }
            else if (*(void *)(*((void *)&buf + 1) + 40))
            {
              BOOL v281 = 0;
            }
            else
            {
              id v282 = objc_alloc(MEMORY[0x263F087E8]);
              uint64_t v286 = objc_msgSend_initWithDomain_code_userInfo_(v282, v283, *MEMORY[0x263F4AE00], 1, 0, v284, v285);
              v287 = *(void **)(*((void *)&buf + 1) + 40);
              *(void *)(*((void *)&buf + 1) + 40) = v286;

              uint64_t v280 = *((void *)&buf + 1);
              BOOL v281 = *((unsigned char *)v311 + 24) != 0;
            }
            v8[2](v8, v281, v305[5], *(void *)(v280 + 40));
          }

          _Block_object_dispose(&v304, 8);
          _Block_object_dispose(&buf, 8);

          _Block_object_dispose(&v310, 8);
          goto LABEL_64;
        }
        dispatch_group_enter(v62);
        v216 = (void *)MEMORY[0x263F4AF20];
        v291[0] = MEMORY[0x263EF8330];
        v291[1] = 3221225472;
        v291[2] = sub_22B29CA50;
        v291[3] = &unk_26488ED20;
        v294 = &buf;
        v295 = &v304;
        id v292 = v7;
        v296 = &v310;
        v293 = v62;
        objc_msgSend_generateAudioPreview_senderContext_withCompletionBlock_(v216, v217, (uint64_t)v292, (uint64_t)v290, (uint64_t)v291, v218, v219);

        id v75 = v292;
      }
LABEL_55:

      goto LABEL_56;
    }
    double v72 = a4->var0;
    if (a4->var0 < 1200.0) {
      double v72 = 1200.0;
    }
    *(float *)&double v72 = v72;
    double v73 = a4->var2;
    *(float *)&double v73 = v73;
    uint64_t v74 = *((void *)&buf + 1);
    id obj = *(id *)(*((void *)&buf + 1) + 40);
    objc_msgSend_generateImagePreviewForFileURL_senderContext_maxPixelDimension_scale_error_(MEMORY[0x263F4AF20], v69, (uint64_t)v7, (uint64_t)v290, (uint64_t)&obj, v70, v71, v72, v73);
    id v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v74 + 40), obj);
    if (v75
      && (objc_msgSend_utTypeString(v75, v76, v77, v78, v79, v80, v81),
          (uint64_t v82 = objc_claimAutoreleasedReturnValue()) != 0)
      && (objc_msgSend_utTypeString(v75, v76, v77, v78, v79, v80, v81),
          uint64_t v83 = objc_claimAutoreleasedReturnValue(),
          BOOL v90 = objc_msgSend_length(v83, v84, v85, v86, v87, v88, v89) == 0,
          v83,
          v82,
          !v90))
    {
      id v91 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v98 = objc_msgSend_utTypeString(v75, v92, v93, v94, v95, v96, v97);
      objc_msgSend_setValue_forKey_(v91, v99, (uint64_t)v98, *MEMORY[0x263F4AD60], v100, v101, v102);

      uint64_t v103 = NSNumber;
      uint64_t v110 = objc_msgSend_isFromMe(v290, v104, v105, v106, v107, v108, v109);
      uint64_t v116 = objc_msgSend_numberWithBool_(v103, v111, v110, v112, v113, v114, v115);
      objc_msgSend_setValue_forKey_(v91, v117, (uint64_t)v116, *MEMORY[0x263F4AD40], v118, v119, v120);

      CFURLRef v121 = NSNumber;
      uint64_t isTrustedSender = objc_msgSend_isTrustedSender(v290, v122, v123, v124, v125, v126, v127);
      id v134 = objc_msgSend_numberWithBool_(v121, v129, isTrustedSender, v130, v131, v132, v133);
      objc_msgSend_setValue_forKey_(v91, v135, (uint64_t)v134, *MEMORY[0x263F4AD48], v136, v137, v138);

      uint64_t v145 = objc_msgSend_serviceName(v290, v139, v140, v141, v142, v143, v144);
      objc_msgSend_setValue_forKey_(v91, v146, (uint64_t)v145, *MEMORY[0x263F4AD50], v147, v148, v149);

      v156 = objc_msgSend_sharedInstance(MEMORY[0x263F4AFD0], v150, v151, v152, v153, v154, v155);
      objc_msgSend_trackEvent_withDictionary_(v156, v157, *MEMORY[0x263F4ACD8], (uint64_t)v91, v158, v159, v160);
    }
    else
    {
      v179 = objc_msgSend_sharedInstance(MEMORY[0x263F4AFD0], v76, v77, v78, v79, v80, v81);
      objc_msgSend_trackEvent_(v179, v180, *MEMORY[0x263F4ACD0], v181, v182, v183, v184);

      if (!v75) {
        goto LABEL_29;
      }
    }
    v185 = objc_msgSend_image(v75, v161, v162, v163, v164, v165, v166);
    uint64_t v192 = (CGImage *)objc_msgSend_cgImage(v185, v186, v187, v188, v189, v190, v191);

    uint64_t v199 = objc_msgSend_frameCount(v75, v193, v194, v195, v196, v197, v198);
    if (v192)
    {
      uint64_t v200 = v199;
      id v201 = (void *)*MEMORY[0x263F1DC08];
      id v289 = (id)*MEMORY[0x263F1DC08];
      if (!v60) {
        id v201 = v30;
      }
      id v202 = v201;
      if (v60)
      {
        v288 = @"png";
      }
      else
      {
        objc_msgSend_pathExtension(v7, v203, v204, v205, v206, v207, v208);
        v288 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v200 >= 2)
        {
          if (IMOSLoggingEnabled())
          {
            id v220 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v314 = 0;
              _os_log_impl(&dword_22B280000, v220, OS_LOG_TYPE_INFO, "File is actually animated lets save it as a JPEG...", v314, 2u);
            }
          }
          id v289 = (id)*MEMORY[0x263F1DB40];

          uint64_t v227 = objc_msgSend_preferredFilenameExtension(v289, v221, v222, v223, v224, v225, v226);

          v288 = (__CFString *)v227;
        }
        else
        {
          id v289 = v30;
        }
      }
      id v228 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v203, v204, v205, v206, v207, v208);
      id v229 = NSString;
      uint64_t v236 = objc_msgSend_UUID(MEMORY[0x263F08C38], v230, v231, v232, v233, v234, v235);
      v243 = objc_msgSend_UUIDString(v236, v237, v238, v239, v240, v241, v242);
      v249 = objc_msgSend_stringWithFormat_(v229, v244, @"%@.%@", v245, v246, v247, v248, v243, v288);
      uint64_t v255 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v228, v250, (uint64_t)v249, v251, v252, v253, v254);
      v256 = (void *)v305[5];
      v305[5] = v255;

      CFURLRef v257 = (const __CFURL *)v305[5];
      objc_msgSend_identifier(v289, v258, v259, v260, v261, v262, v263);
      v264 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v265 = CGImageDestinationCreateWithURL(v257, v264, 1uLL, 0);

      if (v265)
      {
        CGImageDestinationAddImage(v265, v192, 0);
        if (CGImageDestinationFinalize(v265))
        {
          *((unsigned char *)v311 + 24) = 1;
        }
        else
        {
          id v273 = objc_alloc(MEMORY[0x263F087E8]);
          uint64_t v277 = objc_msgSend_initWithDomain_code_userInfo_(v273, v274, *MEMORY[0x263F4AE00], 9, 0, v275, v276);
          v278 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = v277;

          if (IMOSLoggingEnabled())
          {
            v279 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v279, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v314 = 138412290;
              CFURLRef v315 = v257;
              _os_log_impl(&dword_22B280000, v279, OS_LOG_TYPE_INFO, "Failed to write image to %@", v314, 0xCu);
            }
          }
        }
        CFRelease(v265);
      }
      else
      {
        id v266 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v270 = objc_msgSend_initWithDomain_code_userInfo_(v266, v267, *MEMORY[0x263F4AE00], 9, 0, v268, v269);
        v271 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v270;

        if (IMOSLoggingEnabled())
        {
          v272 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v314 = 138412290;
            CFURLRef v315 = v257;
            _os_log_impl(&dword_22B280000, v272, OS_LOG_TYPE_INFO, "Failed to create CGImageDestination for %@", v314, 0xCu);
          }
        }
      }

      goto LABEL_55;
    }
LABEL_29:
    id v209 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v213 = objc_msgSend_initWithDomain_code_userInfo_(v209, v210, *MEMORY[0x263F4AE00], 9, 0, v211, v212);
    int64_t v214 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v213;

    if (IMOSLoggingEnabled())
    {
      BOOL v215 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v314 = 0;
        _os_log_impl(&dword_22B280000, v215, OS_LOG_TYPE_INFO, "Lockdown - Unable to get CGImageRef from BlastDoor.", v314, 2u);
      }
    }
    goto LABEL_55;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v167 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_impl(&dword_22B280000, v167, OS_LOG_TYPE_INFO, "File is not a supported type: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v168 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v172 = objc_msgSend_initWithDomain_code_userInfo_(v168, v169, *MEMORY[0x263F4AE00], 1, 0, v170, v171);
  ((void (**)(id, BOOL, uint64_t, void *))v8)[2](v8, 0, 0, v172);

LABEL_64:
}

- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_22B29CEB0;
  v31[3] = &unk_26488ED70;
  id v32 = v16;
  id v17 = v16;
  uint64_t v18 = (void *)MEMORY[0x230F44340](v31);
  queue = self->_queue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_22B29CFA0;
  v25[3] = &unk_26488EC30;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v30 = v18;
  id v20 = v18;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_async(queue, v25);
}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 balloonBundleID:(id)a6 constraints:(IMPreviewConstraints *)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_22B29D180;
  v37[3] = &unk_26488EDC0;
  id v38 = v18;
  id v19 = v18;
  id v20 = (void *)MEMORY[0x230F44340](v37);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  long long v21 = *(_OWORD *)&a7->var1.height;
  long long v34 = *(_OWORD *)&a7->var0;
  long long v35 = v21;
  v28[2] = sub_22B29D288;
  v28[3] = &unk_26488EDE8;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  uint64_t v36 = *(void *)&a7->var3;
  id v33 = v20;
  id v22 = v20;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = (void *)MEMORY[0x230F44340](v28);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v27);
}

- (void)generatePreviewMetadata:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_22B29D4DC;
  v32[3] = &unk_26488EDC0;
  id v33 = v15;
  id v16 = v15;
  id v17 = (void *)MEMORY[0x230F44340](v32);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_22B29D5E4;
  v24[3] = &unk_26488EE10;
  id v25 = v12;
  id v26 = v13;
  long long v18 = *(_OWORD *)&a6->var1.height;
  long long v29 = *(_OWORD *)&a6->var0;
  long long v30 = v18;
  uint64_t v31 = *(void *)&a6->var3;
  id v27 = v14;
  id v28 = v17;
  id v19 = v17;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  id v23 = (void *)MEMORY[0x230F44340](v24);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v23);
}

- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_22B29D8D4;
  v26[3] = &unk_26488EE60;
  id v27 = v13;
  id v14 = v13;
  id v15 = (void *)MEMORY[0x230F44340](v26);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_22B29DA10;
  v21[3] = &unk_26488EE88;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v15;
  id v16 = v15;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = (void *)MEMORY[0x230F44340](v21);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v20);
}

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_22B29DB58;
  v11[3] = &unk_26488EEB0;
  id v12 = v5;
  id v6 = v5;
  objc_msgSend_transcribeAudioForAudioTransferURL_withCompletion_(IMTranscriptionUtilities, v7, (uint64_t)a3, (uint64_t)v11, v8, v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewGenerationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fallbackTranscoders, 0);
  objc_storeStrong((id *)&self->_transcoders, 0);
}

@end