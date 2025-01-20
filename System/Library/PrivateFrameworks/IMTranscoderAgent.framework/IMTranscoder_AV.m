@interface IMTranscoder_AV
+ (id)supportedUTIs;
- (BOOL)_isHEVCVideo:(id)a3;
- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9;
- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 isAnimojiV2:(BOOL)a8 removeAlpha:(BOOL)a9 isHDR:(BOOL)a10 preserveHDR:(BOOL)a11 isAA:(BOOL)a12 preserveAA:(BOOL)a13 fileSizeLimit:(unint64_t)a14;
- (unint64_t)_fileSizeForTransfer:(id)a3;
- (void)_transcodeVideoAsync:(id)a3 target:(int64_t)a4 maxBytes:(unint64_t)a5 isAnimojiV2:(BOOL)a6 removeAlpha:(BOOL)a7 preserveHDR:(BOOL)a8 isAA:(BOOL)a9 preserveAA:(BOOL)a10 userInfo:(id)a11 completionHandler:(id)a12;
- (void)_transcodeVideoPassThrough:(id)a3 completionHandler:(id)a4;
- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13;
@end

@implementation IMTranscoder_AV

+ (id)supportedUTIs
{
  return (id)MEMORY[0x270F3D118](a1, a2);
}

- (BOOL)_isHEVCVideo:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = IMAVURLAssetOptionsDefault();
  id v5 = objc_alloc(MEMORY[0x263EFA8D0]);
  v52 = v3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v51 = objc_msgSend_initWithURL_options_(v5, v6, (uint64_t)v3, (uint64_t)v4, v7, v8, v9);
  objc_msgSend_tracks(v51, v10, v11, v12, v13, v14, v15);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v58, (uint64_t)v63, 16, v17, v18);
  if (v19)
  {
    uint64_t v26 = v19;
    char v27 = 0;
    uint64_t v28 = *(void *)v59;
    uint64_t v29 = *MEMORY[0x263EF9D48];
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v59 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v32 = objc_msgSend_mediaType(v31, v20, v21, v22, v23, v24, v25);
        int isEqual = objc_msgSend_isEqual_(v32, v33, v29, v34, v35, v36, v37);

        if (isEqual)
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          v39 = objc_msgSend_formatDescriptions(v31, v20, v21, v22, v23, v24, v25);
          uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v54, (uint64_t)v62, 16, v41, v42);
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v44; ++j)
              {
                if (*(void *)v55 != v45) {
                  objc_enumerationMutation(v39);
                }
                v27 |= CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v54 + 1) + 8 * j)) == 1752589105;
              }
              uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v47, (uint64_t)&v54, (uint64_t)v62, 16, v48, v49);
            }
            while (v44);
          }
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v58, (uint64_t)v63, 16, v24, v25);
    }
    while (v26);
  }
  else
  {
    char v27 = 0;
  }

  return v27 & 1;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  if (!a3) {
    return 0;
  }
  uint64_t v14 = *MEMORY[0x263F4ABB8];
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  unsigned int v45 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v20, (uint64_t)v18, v14, v21, v22, v23);
  unsigned __int8 v28 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v24, (uint64_t)v18, *MEMORY[0x263F4ABD8], v25, v26, v27);
  IMCheckVideoURLProperties();
  char shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v29, (uint64_t)v15, v30, v31, v32, v33);
  char v35 = IMIsAAVideoURL();
  LOBYTE(v14) = objc_msgSend_shouldPreserveAAEncoding_(IMTranscoder, v36, (uint64_t)v15, v37, v38, v39, v40);

  BYTE4(v44) = v14;
  BYTE3(v44) = v35;
  BYTE2(v44) = shouldPreserveHDREncoding;
  LOWORD(v44) = v28;
  int64_t v42 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v41, (uint64_t)v19, (uint64_t)v18, a5, (uint64_t)v17, (uint64_t)v16, v45, v44, a8);

  return v42;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 isAnimojiV2:(BOOL)a8 removeAlpha:(BOOL)a9 isHDR:(BOOL)a10 preserveHDR:(BOOL)a11 isAA:(BOOL)a12 preserveAA:(BOOL)a13 fileSizeLimit:(unint64_t)a14
{
  BOOL v14 = a8;
  uint64_t v209 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v28 = a7;
  if (!v20) {
    goto LABEL_22;
  }
  uint64_t v29 = objc_msgSend_objectForKey_(v21, v23, *MEMORY[0x263F4ABC0], v24, v25, v26, v27);
  int v36 = objc_msgSend_BOOLValue(v29, v30, v31, v32, v33, v34, v35);

  if (IMOSLoggingEnabled())
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int v203 = 138412290;
      double v204 = *(double *)&v22;
      _os_log_impl(&dword_22B280000, v37, OS_LOG_TYPE_INFO, "Checking if we support the AV uti: %@", (uint8_t *)&v203, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v203) = 0;
      _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "Trying to discriminate based on type alone:", (uint8_t *)&v203, 2u);
    }
  }
  uint64_t v39 = objc_opt_class();
  v46 = objc_msgSend_supportedUTIs(v39, v40, v41, v42, v43, v44, v45);
  int v52 = objc_msgSend_containsObject_(v46, v47, (uint64_t)v22, v48, v49, v50, v51);

  if (!v52)
  {
LABEL_22:
    int64_t v92 = 0;
    goto LABEL_87;
  }
  long long v59 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v53, v54, v55, v56, v57, v58);
  char isLazuliEnabled = objc_msgSend_isLazuliEnabled(v59, v60, v61, v62, v63, v64, v65);

  char v73 = isLazuliEnabled ^ 1;
  if (a5 != 2) {
    char v73 = 1;
  }
  if ((v73 & 1) == 0)
  {
    v74 = objc_msgSend_typeWithIdentifier_(MEMORY[0x263F1D920], v67, (uint64_t)v22, v69, v70, v71, v72);
    v85 = objc_msgSend_typeWithIdentifier_(MEMORY[0x263F1D920], v75, @"org.3gpp.adaptive-multi-rate-audio", v76, v77, v78, v79);
    if (v36 && (objc_msgSend_conformsToType_(v74, v80, (uint64_t)v85, v81, v82, v83, v84) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v161 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_preferredFilenameExtension(v85, v162, v163, v164, v165, v166, v167);
          id v168 = (id)objc_claimAutoreleasedReturnValue();
          v175 = objc_msgSend_preferredFilenameExtension(v74, v169, v170, v171, v172, v173, v174);
          int v203 = 138412802;
          double v204 = *(double *)&v168;
          __int16 v205 = 2112;
          id v206 = v22;
          __int16 v207 = 2112;
          v208 = v175;
          _os_log_impl(&dword_22B280000, v161, OS_LOG_TYPE_INFO, "RCS expects AMR type (ext %@) for audio message, not %@ (ext %@), we need to transcode", (uint8_t *)&v203, 0x20u);
        }
        goto LABEL_84;
      }
    }
    else
    {
      if (objc_msgSend_conformsToType_(v74, v80, *MEMORY[0x263F1DB80], v81, v82, v83, v84))
      {
        if (IMOSLoggingEnabled())
        {
          v91 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            int v203 = 138412290;
            double v204 = *(double *)&v22;
            _os_log_impl(&dword_22B280000, v91, OS_LOG_TYPE_INFO, "RCS Allows %@ as-is", (uint8_t *)&v203, 0xCu);
          }
        }
        int64_t v92 = 1;
        goto LABEL_86;
      }
      if ((objc_msgSend_conformsToType_(v74, v86, *MEMORY[0x263F1DBA8], v87, v88, v89, v90) & 1) != 0
        || (objc_msgSend_conformsToType_(v74, v93, *MEMORY[0x263F1DBA0], v94, v95, v96, v97) & 1) != 0)
      {

        goto LABEL_26;
      }
      if (IMOSLoggingEnabled())
      {
        v161 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
        {
          int v203 = 138412290;
          double v204 = *(double *)&v22;
          _os_log_impl(&dword_22B280000, v161, OS_LOG_TYPE_INFO, "RCS does not expect AV type %@, we need to transcode", (uint8_t *)&v203, 0xCu);
        }
LABEL_84:
      }
    }
    int64_t v92 = 2;
LABEL_86:

    goto LABEL_87;
  }
LABEL_26:
  if (objc_msgSend_count(v21, v67, v68, v69, v70, v71, v72))
  {
    v103 = objc_msgSend_objectForKey_(v21, v98, *MEMORY[0x263F4ABE0], v99, v100, v101, v102);
    objc_msgSend_doubleValue(v103, v104, v105, v106, v107, v108, v109);
    double v111 = v110;

    v117 = objc_msgSend_objectForKey_(v21, v112, *MEMORY[0x263F4ABB0], v113, v114, v115, v116);
    objc_msgSend_doubleValue(v117, v118, v119, v120, v121, v122, v123);
    double v125 = v124;

    v131 = objc_msgSend_objectForKey_(v21, v126, *MEMORY[0x263F4ABA8], v127, v128, v129, v130);
    objc_msgSend_doubleValue(v131, v132, v133, v134, v135, v136, v137);
    double v139 = v138;

    v145 = objc_msgSend_objectForKey_(v21, v140, *MEMORY[0x263F4AB98], v141, v142, v143, v144);
    if (IMOSLoggingEnabled())
    {
      v146 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
      {
        int v203 = 134217984;
        double v204 = v111;
        _os_log_impl(&dword_22B280000, v146, OS_LOG_TYPE_INFO, "   Start time: %f", (uint8_t *)&v203, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v147 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
      {
        int v203 = 134217984;
        double v204 = v125;
        _os_log_impl(&dword_22B280000, v147, OS_LOG_TYPE_INFO, "     End time: %f", (uint8_t *)&v203, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v148 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
      {
        int v203 = 134217984;
        double v204 = v139;
        _os_log_impl(&dword_22B280000, v148, OS_LOG_TYPE_INFO, "     Duration: %f", (uint8_t *)&v203, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v149 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
      {
        int v203 = 138412290;
        double v204 = *(double *)&v145;
        _os_log_impl(&dword_22B280000, v149, OS_LOG_TYPE_INFO, "  assetLibURI: %@", (uint8_t *)&v203, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v150 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
      {
        v151 = @"NO";
        if (a9) {
          v151 = @"YES";
        }
        int v203 = 138412290;
        double v204 = *(double *)&v151;
        _os_log_impl(&dword_22B280000, v150, OS_LOG_TYPE_INFO, " removeAlpha: %@", (uint8_t *)&v203, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v158 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
      {
        v159 = @"NO";
        if (a11) {
          v159 = @"YES";
        }
        int v203 = 138412290;
        double v204 = *(double *)&v159;
        _os_log_impl(&dword_22B280000, v158, OS_LOG_TYPE_INFO, " preserveHDR: %@", (uint8_t *)&v203, 0xCu);
      }
    }
    if (v111 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        v160 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          LOWORD(v203) = 0;
          _os_log_impl(&dword_22B280000, v160, OS_LOG_TYPE_INFO, " Start time > 0, we need to transcode", (uint8_t *)&v203, 2u);
        }
LABEL_78:

        goto LABEL_79;
      }
      goto LABEL_79;
    }
    if (v125 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        v160 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          LOWORD(v203) = 0;
          _os_log_impl(&dword_22B280000, v160, OS_LOG_TYPE_INFO, " End time > 0, we need to transcode", (uint8_t *)&v203, 2u);
        }
        goto LABEL_78;
      }
LABEL_79:

LABEL_80:
      int64_t v92 = 2;
      goto LABEL_87;
    }
    if (v139 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        v160 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          LOWORD(v203) = 0;
          _os_log_impl(&dword_22B280000, v160, OS_LOG_TYPE_INFO, " End time > 0, we need to transcode", (uint8_t *)&v203, 2u);
        }
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (objc_msgSend_length(v145, v152, v153, v154, v155, v156, v157))
    {
      if (IMOSLoggingEnabled())
      {
        v160 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          LOWORD(v203) = 0;
          _os_log_impl(&dword_22B280000, v160, OS_LOG_TYPE_INFO, " We have an assets library URI, we need to transcode (video might be slow-mo).", (uint8_t *)&v203, 2u);
        }
        goto LABEL_78;
      }
      goto LABEL_79;
    }
  }
  if (v14 && a9)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_80;
    }
    v177 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
    {
      LOWORD(v203) = 0;
      _os_log_impl(&dword_22B280000, v177, OS_LOG_TYPE_INFO, " This is an AnimojiV2 video, and we want to remove alpha", (uint8_t *)&v203, 2u);
    }
LABEL_120:

    goto LABEL_80;
  }
  if (a10 && !a11)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_80;
    }
    v177 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
    {
      LOWORD(v203) = 0;
      _os_log_impl(&dword_22B280000, v177, OS_LOG_TYPE_INFO, " This is an HDR video, and we don't want to preserve HDR", (uint8_t *)&v203, 2u);
    }
    goto LABEL_120;
  }
  int v178 = IMOSLoggingEnabled();
  if (a12 && !a13)
  {
    if (!v178) {
      goto LABEL_80;
    }
    v177 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
    {
      LOWORD(v203) = 0;
      _os_log_impl(&dword_22B280000, v177, OS_LOG_TYPE_INFO, " This is an AA video, and we don't want to preserve AA", (uint8_t *)&v203, 2u);
    }
    goto LABEL_120;
  }
  if (v178)
  {
    v184 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
    {
      LOWORD(v203) = 0;
      _os_log_impl(&dword_22B280000, v184, OS_LOG_TYPE_INFO, "That wasn't enough, let's look at filesize too:", (uint8_t *)&v203, 2u);
    }
  }
  unint64_t v185 = objc_msgSend__fileSizeForTransfer_(self, v179, (uint64_t)v20, v180, v181, v182, v183);
  id v186 = v28;
  if (IMOSLoggingEnabled())
  {
    v192 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
    {
      int v203 = 138412290;
      double v204 = *(double *)&v186;
      _os_log_impl(&dword_22B280000, v192, OS_LOG_TYPE_INFO, "SendableUTIs: %@", (uint8_t *)&v203, 0xCu);
    }
  }
  if (v186)
  {
    int v193 = objc_msgSend_containsObject_(v186, v187, (uint64_t)v22, v188, v189, v190, v191);
    int v199 = 0;
    if (v185) {
      int v200 = v193;
    }
    else {
      int v200 = 0;
    }
    if (v200 == 1 && v185 < a14) {
      int v199 = objc_msgSend__isHEVCVideo_(self, v194, (uint64_t)v20, v195, v196, v197, v198) & a9 ^ 1;
    }
  }
  else
  {
    int v199 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v201 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v201, OS_LOG_TYPE_INFO))
    {
      v202 = @"NO";
      if (v199) {
        v202 = @"YES";
      }
      int v203 = 138412290;
      double v204 = *(double *)&v202;
      _os_log_impl(&dword_22B280000, v201, OS_LOG_TYPE_INFO, "Is the original sendable without transcode? %@", (uint8_t *)&v203, 0xCu);
    }
  }
  if (v199) {
    int64_t v92 = 1;
  }
  else {
    int64_t v92 = 2;
  }

LABEL_87:
  return v92;
}

- (unint64_t)_fileSizeForTransfer:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7, v8, v9);
  id v17 = objc_msgSend_path(v3, v11, v12, v13, v14, v15, v16);
  id v33 = 0;
  id v22 = objc_msgSend_attributesOfItemAtPath_error_(v10, v18, (uint64_t)v17, (uint64_t)&v33, v19, v20, v21);
  id v23 = v33;
  unint64_t v30 = objc_msgSend_fileSize(v22, v24, v25, v26, v27, v28, v29);

  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v35 = v30;
      __int16 v36 = 2112;
      id v37 = v3;
      __int16 v38 = 2112;
      id v39 = v23;
      _os_log_impl(&dword_22B280000, v31, OS_LOG_TYPE_INFO, "Found size %llu of file %@ with error %@", buf, 0x20u);
    }
  }
  if (v23) {
    unint64_t v30 = 0;
  }

  return v30;
}

- (void)_transcodeVideoAsync:(id)a3 target:(int64_t)a4 maxBytes:(unint64_t)a5 isAnimojiV2:(BOOL)a6 removeAlpha:(BOOL)a7 preserveHDR:(BOOL)a8 isAA:(BOOL)a9 preserveAA:(BOOL)a10 userInfo:(id)a11 completionHandler:(id)a12
{
  BOOL v12 = a8;
  BOOL v500 = a7;
  BOOL v497 = a6;
  uint64_t v521 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a11;
  id v16 = a12;
  if (v16)
  {
    id v23 = v16;
    uint64_t v24 = (void (**)(void, void, void, void))objc_msgSend_copy(v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v25 = objc_msgSend_tracksWithMediaType_(v14, v17, *MEMORY[0x263EF9D48], v19, v20, v21, v22);
  uint64_t v32 = objc_msgSend_count(v25, v26, v27, v28, v29, v30, v31);

  __int16 v38 = objc_msgSend_tracksWithMediaType_(v14, v33, *MEMORY[0x263EF9CE8], v34, v35, v36, v37);
  uint64_t v45 = objc_msgSend_count(v38, v39, v40, v41, v42, v43, v44);

  if (!(v32 | v45))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v54, OS_LOG_TYPE_INFO, "No audio/video tracks, failing transcode.", buf, 2u);
      }
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v51, @"__kIMTranscodeErrorDomain", -3, 0, v52, v53);
    id v503 = (id)objc_claimAutoreleasedReturnValue();
    if (v24) {
      ((void (**)(void, void, void, id))v24)[2](v24, 0, 0, v503);
    }
    goto LABEL_287;
  }
  uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v15, v46, *MEMORY[0x263F4ABC0], v47, v48, v49, v50);
  int v493 = objc_msgSend_BOOLValue(v55, v56, v57, v58, v59, v60, v61);

  if (v45) {
    BOOL v62 = v32 == 0;
  }
  else {
    BOOL v62 = 0;
  }
  BOOL inUTI = v62;
  id v68 = (id)*MEMORY[0x263EF95A8];
  if (!v32)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v81, OS_LOG_TYPE_INFO, "Actually, using the audio preset", buf, 2u);
      }
    }
    if (a4 == 2)
    {
      uint64_t v82 = (id *)MEMORY[0x263EF9570];
      if (!v493) {
        uint64_t v82 = (id *)MEMORY[0x263EF95B0];
      }
    }
    else if (a4 == 1)
    {
      uint64_t v82 = (id *)MEMORY[0x263EF9570];
    }
    else
    {
      uint64_t v82 = (id *)MEMORY[0x263EF95B0];
    }
    id v503 = *v82;
    uint64_t v69 = v68;
    goto LABEL_47;
  }
  if (a4 == 1)
  {
    uint64_t v69 = objc_msgSend_objectForKey_(v15, v63, *MEMORY[0x263F4AEA0], v64, v65, v66, v67);
    v75 = objc_msgSend_objectForKey_(v15, v70, *MEMORY[0x263F4AEA8], v71, v72, v73, v74);
    if (objc_msgSend_IMMMSSupportsH264VideoForPhoneNumber_simID_(MEMORY[0x263F4AF40], v76, (uint64_t)v69, (uint64_t)v75, v77, v78, v79))
    {
      id v503 = (id)*MEMORY[0x263EF9548];

      if (IMOSLoggingEnabled())
      {
        v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v503;
          _os_log_impl(&dword_22B280000, v80, OS_LOG_TYPE_INFO, "   Carrier supports H264, selecting: %@", buf, 0xCu);
        }
LABEL_40:
      }
    }
    else
    {
      id v503 = (id)*MEMORY[0x263EF9598];

      if (IMOSLoggingEnabled())
      {
        v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v503;
          _os_log_impl(&dword_22B280000, v80, OS_LOG_TYPE_INFO, "   Carrier does not support H264, selecting: %@", buf, 0xCu);
        }
        goto LABEL_40;
      }
    }

    BOOL v500 = 1;
LABEL_47:

    BOOL v85 = a4 == 2;
    goto LABEL_48;
  }
  if (v12)
  {
    id v83 = (id)*MEMORY[0x263EF95B8];

    id v68 = v83;
  }
  if (a9 && a10)
  {
    uint64_t v84 = (id *)MEMORY[0x263EF95C0];
LABEL_36:
    id v503 = *v84;

    goto LABEL_95;
  }
  if (v497)
  {
    uint64_t v84 = (id *)MEMORY[0x263EF9560];
    if (!v500) {
      uint64_t v84 = (id *)MEMORY[0x263EF9578];
    }
    goto LABEL_36;
  }
  id v503 = v68;
LABEL_95:
  if (a4 != 2)
  {
    BOOL v85 = 0;
LABEL_48:
    if (IMOSLoggingEnabled())
    {
      int64_t v92 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        v93 = @"NO";
        if (v12) {
          uint64_t v94 = @"YES";
        }
        else {
          uint64_t v94 = @"NO";
        }
        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v503;
        if (v497) {
          uint64_t v95 = @"YES";
        }
        else {
          uint64_t v95 = @"NO";
        }
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v94;
        if (v500) {
          uint64_t v96 = @"YES";
        }
        else {
          uint64_t v96 = @"NO";
        }
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v95;
        if (a9) {
          uint64_t v97 = @"YES";
        }
        else {
          uint64_t v97 = @"NO";
        }
        *(_WORD *)v518 = 2112;
        if (a10) {
          v93 = @"YES";
        }
        *(void *)&v518[2] = v96;
        *(_WORD *)&v518[10] = 2112;
        *(void *)&v518[12] = v97;
        __int16 v519 = 2112;
        v520 = v93;
        _os_log_impl(&dword_22B280000, v92, OS_LOG_TYPE_INFO, "Using preset %@ for audio/video transcoding (preserveHDR %@ isAnimojiV2 %@ removeAlpha %@ isAA %@ preserveAA %@)", buf, 0x3Eu);
      }
    }
    long long v515 = 0uLL;
    uint64_t v516 = 0;
    if (v14) {
      objc_msgSend_duration(v14, v86, v87, v88, v89, v90, v91);
    }
    v496 = objc_msgSend_objectForKey_(v15, v86, *MEMORY[0x263F4ABD0], v88, v89, v90, v91);
    v501 = objc_msgSend_objectForKey_(v15, v98, *MEMORY[0x263F4AB98], v99, v100, v101, v102);
    if (objc_msgSend_length(v501, v103, v104, v105, v106, v107, v108))
    {
      uint64_t v114 = objc_msgSend_URLWithString_(NSURL, v109, (uint64_t)v501, v110, v111, v112, v113);
      if (IMOSLoggingEnabled())
      {
        uint64_t v115 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v114;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v503;
          _os_log_impl(&dword_22B280000, v115, OS_LOG_TYPE_INFO, "Trying to use assetLibURL %@, asset %@, presetName %@", buf, 0x20u);
        }
      }
      uint64_t v116 = (void *)MEMORY[0x230F43EE0](@"ALAssetsLibrary", @"AssetsLibrary");
      uint64_t v123 = objc_msgSend_URL(v14, v117, v118, v119, v120, v121, v122);
      uint64_t v130 = objc_msgSend_absoluteString(v123, v124, v125, v126, v127, v128, v129);
      uint64_t v134 = objc_msgSend__exportSessionForVideoURL_fallbackFilePath_exportPreset_(v116, v131, (uint64_t)v114, (uint64_t)v130, (uint64_t)v503, v132, v133);

      if (IMOSLoggingEnabled())
      {
        uint64_t v141 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_asset(v134, v142, v143, v144, v145, v146, v147);
          id v148 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v148;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v134;
          _os_log_impl(&dword_22B280000, v141, OS_LOG_TYPE_INFO, "New asset: %@, exportSession %@", buf, 0x16u);
        }
      }
      if (v134)
      {
        v149 = objc_msgSend_asset(v134, v135, v136, v137, v138, v139, v140);
        uint64_t v156 = v149;
        if (v149) {
          objc_msgSend_duration(v149, v150, v151, v152, v153, v154, v155);
        }
        else {
          memset(buf, 0, 24);
        }
        long long v515 = *(_OWORD *)buf;
        uint64_t v516 = *(void *)&buf[16];

LABEL_102:
        goto LABEL_114;
      }
    }
    else if (v496)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v157 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v496;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v503;
          _os_log_impl(&dword_22B280000, v157, OS_LOG_TYPE_INFO, "Trying to use metadata %@, asset %@, presetName %@", buf, 0x20u);
        }
      }
      v158 = (void *)MEMORY[0x230F43EE0](@"ALAssetsLibrary", @"AssetsLibrary");
      uint64_t v165 = objc_msgSend_URL(v14, v159, v160, v161, v162, v163, v164);
      uint64_t v172 = objc_msgSend_relativePath(v165, v166, v167, v168, v169, v170, v171);
      uint64_t v134 = objc_msgSend__exportSessionForVideoFilePath_metadata_exportPreset_(v158, v173, (uint64_t)v172, (uint64_t)v496, (uint64_t)v503, v174, v175);

      if (IMOSLoggingEnabled())
      {
        uint64_t v182 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_asset(v134, v183, v184, v185, v186, v187, v188);
          id v189 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v189;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v134;
          _os_log_impl(&dword_22B280000, v182, OS_LOG_TYPE_INFO, "New asset: %@, exportSession %@", buf, 0x16u);
        }
      }
      if (v134)
      {
        uint64_t v190 = objc_msgSend_asset(v134, v176, v177, v178, v179, v180, v181);
        uint64_t v114 = v190;
        if (v190) {
          objc_msgSend_duration(v190, v191, v192, v193, v194, v195, v196);
        }
        else {
          memset(buf, 0, 24);
        }
        long long v515 = *(_OWORD *)buf;
        uint64_t v516 = *(void *)&buf[16];
        goto LABEL_102;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v229 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v229, OS_LOG_TYPE_INFO, "Using a standard AVAssetExportSession.", buf, 2u);
      }
    }
    id v230 = objc_alloc(MEMORY[0x263EFA4A8]);
    uint64_t v134 = objc_msgSend_initWithAsset_presetName_(v230, v231, (uint64_t)v14, (uint64_t)v503, v232, v233, v234);
    if (!v134)
    {
      if (IMOSLoggingEnabled())
      {
        v299 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v299, OS_LOG_TYPE_INFO, "Could not create export session with Message presets", buf, 2u);
        }
      }
      uint64_t v134 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v296, @"__kIMTranscodeErrorDomain", -4, 0, v297, v298);
      if (v24) {
        ((void (**)(void, void, void, void *))v24)[2](v24, 0, 0, v134);
      }
      goto LABEL_286;
    }
LABEL_114:
    if (IMOSLoggingEnabled())
    {
      v241 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_supportedFileTypes(v134, v242, v243, v244, v245, v246, v247);
        id v248 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v248;
        _os_log_impl(&dword_22B280000, v241, OS_LOG_TYPE_INFO, "Supported file types: %@", buf, 0xCu);
      }
    }
    v249 = objc_msgSend_supportedFileTypes(v134, v235, v236, v237, v238, v239, v240);
    objc_msgSend_objectAtIndex_(v249, v250, 0, v251, v252, v253, v254);
    v255 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a4 == 1 && inUTI)
    {
      v263 = objc_msgSend_supportedFileTypes(v134, v256, v257, v258, v259, v260, v261);
      int v269 = objc_msgSend_containsObject_(v263, v264, @"org.3gpp.adaptive-multi-rate-audio", v265, v266, v267, v268);

      if (v269)
      {

        v255 = @"org.3gpp.adaptive-multi-rate-audio";
      }
    }
    v270 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v256, v257, v258, v259, v260, v261);
    int isLazuliEnabled = objc_msgSend_isLazuliEnabled(v270, v271, v272, v273, v274, v275, v276);

    if ((v85 & isLazuliEnabled) != 1) {
      goto LABEL_151;
    }
    v284 = objc_msgSend_supportedFileTypes(v134, v278, v279, v280, v281, v282, v283);
    v290 = v284;
    if (inUTI)
    {
      if (v493)
      {
        int v291 = objc_msgSend_containsObject_(v284, v285, @"org.3gpp.adaptive-multi-rate-audio", v286, v287, v288, v289);

        if (v291)
        {
          if (IMOSLoggingEnabled())
          {
            v292 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22B280000, v292, OS_LOG_TYPE_INFO, "AMR supported as output type, using for RCS audio message", buf, 2u);
            }
          }
          inUTIa = @"org.3gpp.adaptive-multi-rate-audio";
          goto LABEL_150;
        }
LABEL_151:
        inUTIa = v255;
        goto LABEL_152;
      }
      v293 = (void *)*MEMORY[0x263EF9850];
      int v300 = objc_msgSend_containsObject_(v284, v285, *MEMORY[0x263EF9850], v286, v287, v288, v289);

      if (!v300) {
        goto LABEL_151;
      }
      if (IMOSLoggingEnabled())
      {
        v295 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v295, OS_LOG_TYPE_INFO, "M4A supported as output type, using for RCS audio attachment", buf, 2u);
        }
LABEL_148:
      }
    }
    else
    {
      v293 = (void *)*MEMORY[0x263EF9888];
      int v294 = objc_msgSend_containsObject_(v284, v285, *MEMORY[0x263EF9888], v286, v287, v288, v289);

      if (!v294) {
        goto LABEL_151;
      }
      if (IMOSLoggingEnabled())
      {
        v295 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v295, OS_LOG_TYPE_INFO, "MPEG4 supported as output type, using for RCS video", buf, 2u);
        }
        goto LABEL_148;
      }
    }
    inUTIa = v293;
LABEL_150:

LABEL_152:
    if (IMOSLoggingEnabled())
    {
      v306 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v306, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = inUTIa;
        _os_log_impl(&dword_22B280000, v306, OS_LOG_TYPE_INFO, "   outputFileType: %@", buf, 0xCu);
      }
    }
    if (inUTIa)
    {
      objc_msgSend_setOutputFileType_(v134, v301, (uint64_t)inUTIa, v302, v303, v304, v305);
      v494 = (void *)UTTypeCopyPreferredTagWithClass(inUTIa, (CFStringRef)*MEMORY[0x263F01910]);
      v313 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v307, v308, v309, v310, v311, v312);
      v320 = objc_msgSend_URL(v14, v314, v315, v316, v317, v318, v319);
      v327 = objc_msgSend_lastPathComponent(v320, v321, v322, v323, v324, v325, v326);
      v334 = objc_msgSend_stringByDeletingPathExtension(v327, v328, v329, v330, v331, v332, v333);
      v492 = objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v313, v335, (uint64_t)v494, (uint64_t)v334, v336, v337, v338);

      v344 = objc_msgSend_objectForKey_(v15, v339, *MEMORY[0x263F4ABE0], v340, v341, v342, v343);
      objc_msgSend_doubleValue(v344, v345, v346, v347, v348, v349, v350);
      double v352 = v351;

      v358 = objc_msgSend_objectForKey_(v15, v353, *MEMORY[0x263F4ABB0], v354, v355, v356, v357);
      objc_msgSend_doubleValue(v358, v359, v360, v361, v362, v363, v364);
      double v366 = v365;

      v372 = objc_msgSend_objectForKey_(v15, v367, *MEMORY[0x263F4ABA8], v368, v369, v370, v371);
      objc_msgSend_doubleValue(v372, v373, v374, v375, v376, v377, v378);
      double v380 = v379;

      *(_OWORD *)buf = v515;
      *(void *)&buf[16] = v516;
      double Seconds = CMTimeGetSeconds((CMTime *)buf);
      if (v380 < 2.22044605e-16)
      {
        double v380 = Seconds;
        if (v366 >= 2.22044605e-16)
        {
          if (Seconds >= v366 - v352) {
            double v380 = v366 - v352;
          }
          else {
            double v380 = Seconds;
          }
        }
      }
      double v382 = v352 + v380;
      if (Seconds < v352 + v380) {
        double v382 = Seconds;
      }
      if (v366 >= 2.22044605e-16) {
        double v382 = v366;
      }
      double v383 = fmax(v382 - v380, 0.0);
      if (v352 < 2.22044605e-16) {
        double v352 = v383;
      }
      if (v380 >= Seconds) {
        double v380 = Seconds;
      }
      if (v382 >= Seconds) {
        double v384 = Seconds;
      }
      else {
        double v384 = v382;
      }
      if (IMOSLoggingEnabled())
      {
        v385 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v385, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v492;
          _os_log_impl(&dword_22B280000, v385, OS_LOG_TYPE_INFO, "Exporting video to file %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v386 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v386, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = Seconds;
          _os_log_impl(&dword_22B280000, v386, OS_LOG_TYPE_INFO, "    Asset length: %f", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v387 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v352;
          _os_log_impl(&dword_22B280000, v387, OS_LOG_TYPE_INFO, "      Start time: %f", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v388 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v388, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v384;
          _os_log_impl(&dword_22B280000, v388, OS_LOG_TYPE_INFO, "        End time: %f", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v389 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v389, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v380;
          _os_log_impl(&dword_22B280000, v389, OS_LOG_TYPE_INFO, "        Duration: %f", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v395 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v395, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a5;
          _os_log_impl(&dword_22B280000, v395, OS_LOG_TYPE_INFO, "       Max bytes: %zd", buf, 0xCu);
        }
      }
      if (a4 == 1)
      {
        BOOL v396 = v32 == 0;
        v397 = objc_msgSend_objectForKey_(v15, v390, *MEMORY[0x263F4AEA0], v391, v392, v393, v394);
        v407 = objc_msgSend_objectForKey_(v15, v398, *MEMORY[0x263F4AEA8], v399, v400, v401, v402);
        if (v396) {
          objc_msgSend_IMMMSMaximumAudioDurationForPhoneNumber_simID_(MEMORY[0x263F4AF40], v403, (uint64_t)v397, (uint64_t)v407, v404, v405, v406);
        }
        else {
          objc_msgSend_IMMMSMaximumVideoDurationForPhoneNumber_simID_(MEMORY[0x263F4AF40], v403, (uint64_t)v397, (uint64_t)v407, v404, v405, v406);
        }
        double v413 = v408;
        if (IMOSLoggingEnabled())
        {
          v414 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v414, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v413;
            _os_log_impl(&dword_22B280000, v414, OS_LOG_TYPE_INFO, "     Checking maximum MMS slide duration of: %f", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v415 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v415, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_IMMMSMaximumVideoDurationForPhoneNumber_simID_(MEMORY[0x263F4AF40], v416, (uint64_t)v397, (uint64_t)v407, v417, v418, v419);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v420;
            _os_log_impl(&dword_22B280000, v415, OS_LOG_TYPE_INFO, "  Max MMS Video Duration: %f", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v421 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v421, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_IMMMSMaximumAudioDurationForPhoneNumber_simID_(MEMORY[0x263F4AF40], v422, (uint64_t)v397, (uint64_t)v407, v423, v424, v425);
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v426;
            _os_log_impl(&dword_22B280000, v421, OS_LOG_TYPE_INFO, "  Max MMS Audio Duration: %f", buf, 0xCu);
          }
        }
        if (v380 > v413)
        {
          double v384 = v352 + v413;
          double v380 = v413;
        }
        if (IMOSLoggingEnabled())
        {
          v427 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v427, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v352;
            _os_log_impl(&dword_22B280000, v427, OS_LOG_TYPE_INFO, "       => Final start time is: %f", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v428 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v428, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v384;
            _os_log_impl(&dword_22B280000, v428, OS_LOG_TYPE_INFO, "       => Final end time is: %f", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v429 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v429, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v380;
            _os_log_impl(&dword_22B280000, v429, OS_LOG_TYPE_INFO, "       => Final duration is: %f", buf, 0xCu);
          }
        }
      }
      memset(&v514, 0, sizeof(v514));
      CMTimeMakeWithSeconds(&v514, v352, 90000);
      memset(&v513, 0, sizeof(v513));
      CMTimeMakeWithSeconds(&v513, v384, 90000);
      BOOL v430 = v384 > 2.22044605e-16 || v352 > 2.22044605e-16;
      int v431 = IMOSLoggingEnabled();
      if (v430)
      {
        if (v431)
        {
          v437 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v437, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v437, OS_LOG_TYPE_INFO, "     Setting time range", buf, 2u);
          }
        }
        *(_OWORD *)v518 = 0u;
        memset(buf, 0, sizeof(buf));
        *(CMTime *)start = v514;
        CMTime end = v513;
        CMTimeRangeFromTimeToTime((CMTimeRange *)buf, (CMTime *)start, &end);
        *(_OWORD *)start = *(_OWORD *)buf;
        *(_OWORD *)&start[16] = *(_OWORD *)&buf[16];
        long long v511 = *(_OWORD *)v518;
        objc_msgSend_setTimeRange_(v134, v438, (uint64_t)start, v439, v440, v441, v442);
        if (v380 < 1.0) {
          double v380 = v384 - v352;
        }
        unint64_t v443 = 0x263EFF000;
      }
      else
      {
        unint64_t v443 = 0x263EFF000uLL;
        if (v431)
        {
          v444 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v444, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v444, OS_LOG_TYPE_INFO, "     Ignoring time range, transcoding full", buf, 2u);
          }
        }
      }
      if (!a9 || !a10) {
        objc_msgSend_setFileLengthLimit_(v134, v432, a5, v433, v434, v435, v436);
      }
      v445 = objc_msgSend_fileURLWithPath_(*(void **)(v443 + 2608), v432, (uint64_t)v492, v433, v434, v435, v436);
      objc_msgSend_setOutputURL_(v134, v446, (uint64_t)v445, v447, v448, v449, v450);

      if (v500 && v497)
      {
        if (IMOSLoggingEnabled())
        {
          v451 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v451, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v451, OS_LOG_TYPE_INFO, "Removing the alpha because this was an HEVC video with alpha", buf, 2u);
          }
        }
        id v452 = objc_alloc_init(MEMORY[0x263EFA7A8]);
        CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
        objc_msgSend_setBackgroundColor_(v452, v454, (uint64_t)SRGB, v455, v456, v457, v458);
        v463 = objc_msgSend_videoCompositionWithPropertiesOfAsset_prototypeInstruction_(MEMORY[0x263EFA7A0], v459, (uint64_t)v14, (uint64_t)v452, v460, v461, v462);
        objc_msgSend_setVideoComposition_(v134, v464, (uint64_t)v463, v465, v466, v467, v468);
        CFRelease(SRGB);
      }
      if (a4 != 1)
      {
        if (IMOSLoggingEnabled())
        {
          v474 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v474, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v474, OS_LOG_TYPE_INFO, "Preserving alternate audio tracks, if present", buf, 2u);
          }
        }
        objc_msgSend_setAudioTrackGroupHandling_(v134, v469, 1, v470, v471, v472, v473);
      }
      if (IMOSLoggingEnabled())
      {
        v475 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v475, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v503;
          _os_log_impl(&dword_22B280000, v475, OS_LOG_TYPE_INFO, "     Preset name: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v476 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v476, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v134;
          _os_log_impl(&dword_22B280000, v476, OS_LOG_TYPE_INFO, "  Export session: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v477 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v477, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_22B280000, v477, OS_LOG_TYPE_INFO, "           Asset: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v478 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v478, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_outputURL(v134, v479, v480, v481, v482, v483, v484);
          id v485 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v485;
          _os_log_impl(&dword_22B280000, v478, OS_LOG_TYPE_INFO, "       outputURL: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v486 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v486, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v486, OS_LOG_TYPE_INFO, "Dispatching video export", buf, 2u);
        }
      }
      v504[0] = MEMORY[0x263EF8330];
      v504[1] = 3221225472;
      v504[2] = sub_22B2848B0;
      v504[3] = &unk_26488E950;
      id v505 = v134;
      v506 = v24;
      double v507 = v380;
      long long v508 = v515;
      uint64_t v509 = v516;
      objc_msgSend_exportAsynchronouslyWithCompletionHandler_(v505, v487, (uint64_t)v504, v488, v489, v490, v491);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v412 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v412, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v412, OS_LOG_TYPE_INFO, "Could not find a valid outputType for Message presets", buf, 2u);
        }
      }
      v494 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v409, @"__kIMTranscodeErrorDomain", -4, 0, v410, v411);
      if (v24) {
        ((void (**)(void, void, void, void *))v24)[2](v24, 0, 0, v494);
      }
    }

LABEL_286:
    goto LABEL_287;
  }
  if (IMMaxBitDepthForVideo() != 8) {
    goto LABEL_98;
  }
  int v203 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v197, v198, v199, v200, v201, v202);
  v210 = objc_msgSend_URL(v14, v204, v205, v206, v207, v208, v209);
  v217 = objc_msgSend_path(v210, v211, v212, v213, v214, v215, v216);
  unint64_t v223 = objc_msgSend__im_fileSizeFor_(v203, v218, (uint64_t)v217, v219, v220, v221, v222);

  if (v223 > a5)
  {
LABEL_98:
    BOOL v85 = 1;
    goto LABEL_48;
  }
  if (IMOSLoggingEnabled())
  {
    v228 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B280000, v228, OS_LOG_TYPE_INFO, "Performing a pass-through transcode for format conversion for 8-bit RCS video", buf, 2u);
    }
  }
  objc_msgSend__transcodeVideoPassThrough_completionHandler_(self, v224, (uint64_t)v14, (uint64_t)v24, v225, v226, v227);
LABEL_287:
}

- (void)_transcodeVideoPassThrough:(id)a3 completionHandler:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = IMOSLoggingEnabled();
  uint64_t v8 = (uint64_t *)MEMORY[0x263EF9888];
  if (v7)
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *v8;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_22B280000, v9, OS_LOG_TYPE_INFO, "Converting export to %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v85 = 0x3032000000;
  v86 = sub_22B284F50;
  uint64_t v87 = sub_22B284F60;
  id v88 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = sub_22B284F50;
  v82[4] = sub_22B284F60;
  id v83 = 0;
  id v11 = objc_alloc(MEMORY[0x263EFA4A8]);
  id v16 = objc_msgSend_initWithAsset_presetName_(v11, v12, (uint64_t)v5, *MEMORY[0x263EF95C0], v13, v14, v15);
  CFStringRef v17 = (const __CFString *)*v8;
  objc_msgSend_setOutputFileType_(v16, v18, *v8, v19, v20, v21, v22);
  id v23 = (__CFString *)UTTypeCopyPreferredTagWithClass(v17, (CFStringRef)*MEMORY[0x263F01910]);
  uint64_t v30 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v24, v25, v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_URL(v5, v31, v32, v33, v34, v35, v36);
  uint64_t v44 = objc_msgSend_lastPathComponent(v37, v38, v39, v40, v41, v42, v43);
  uint64_t v51 = objc_msgSend_stringByDeletingPathExtension(v44, v45, v46, v47, v48, v49, v50);
  uint64_t v56 = objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v30, v52, (uint64_t)v23, (uint64_t)v51, v53, v54, v55);

  BOOL v62 = objc_msgSend_fileURLWithPath_(NSURL, v57, (uint64_t)v56, v58, v59, v60, v61);
  objc_msgSend_setOutputURL_(v16, v63, (uint64_t)v62, v64, v65, v66, v67);

  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = sub_22B284F68;
  v76[3] = &unk_26488E978;
  id v68 = v16;
  id v77 = v68;
  v80 = v82;
  p_long long buf = &buf;
  id v69 = v6;
  id v79 = v69;
  id v70 = v5;
  id v78 = v70;
  objc_msgSend_exportAsynchronouslyWithCompletionHandler_(v68, v71, (uint64_t)v76, v72, v73, v74, v75);

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  v339[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v268 = a4;
  id v269 = a5;
  id v18 = a7;
  id v272 = a8;
  id v19 = a10;
  id v270 = a13;
  uint64_t v265 = v18;
  uint64_t v26 = objc_msgSend_firstObject(v18, v20, v21, v22, v23, v24, v25);
  uint64_t v267 = objc_msgSend_unsignedLongValue(v26, v27, v28, v29, v30, v31, v32);

  uint64_t v39 = objc_msgSend_lastObject(v18, v33, v34, v35, v36, v37, v38);
  unint64_t v46 = objc_msgSend_unsignedLongValue(v39, v40, v41, v42, v43, v44, v45);

  char v328 = 0;
  unsigned int shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v47, (uint64_t)v272, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_objectForKey_(v19, v52, *MEMORY[0x263F4ABB8], v53, v54, v55, v56);
  unsigned int v264 = objc_msgSend_BOOLValue(v57, v58, v59, v60, v61, v62, v63);

  id v69 = objc_msgSend_objectForKey_(v19, v64, *MEMORY[0x263F4ABD8], v65, v66, v67, v68);
  uint64_t v76 = objc_msgSend_BOOLValue(v69, v70, v71, v72, v73, v74, v75);

  IMCheckVideoURLProperties();
  char v260 = IMIsAAVideoURL();
  char shouldPreserveAAEncoding = objc_msgSend_shouldPreserveAAEncoding_(IMTranscoder, v77, (uint64_t)v272, v78, v79, v80, v81);
  if (IMOSLoggingEnabled())
  {
    id v83 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v330 = v267;
      __int16 v331 = 2048;
      *(void *)uint64_t v332 = v46;
      _os_log_impl(&dword_22B280000, v83, OS_LOG_TYPE_INFO, "BigSize: %zu SmallSize: %zu", buf, 0x16u);
    }
  }
  if ((a11 && v267 == v46 || a11 != 1 && v267 != v46) && IMOSLoggingEnabled())
  {
    uint64_t v84 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218496;
      uint64_t v330 = v267;
      __int16 v331 = 2048;
      *(void *)uint64_t v332 = v46;
      *(_WORD *)&v332[8] = 1024;
      LODWORD(v333) = a11;
      _os_log_impl(&dword_22B280000, v84, OS_LOG_TYPE_INFO, "Warning - bigSize (%lu), smallSize (%lu) combination does not match the number of reps requested (%d)", buf, 0x1Cu);
    }
  }
  BYTE4(v251) = shouldPreserveAAEncoding;
  BYTE3(v251) = v260;
  BYTE2(v251) = shouldPreserveHDREncoding;
  BYTE1(v251) = v328;
  LOBYTE(v251) = v76;
  uint64_t v85 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v82, (uint64_t)v17, (uint64_t)v19, a6, (uint64_t)v268, (uint64_t)v269, v264, v251, v46);
  if (IMOSLoggingEnabled())
  {
    v86 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      if (v85 <= 1) {
        uint64_t v87 = @"NO";
      }
      else {
        uint64_t v87 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v330 = (uint64_t)v87;
      __int16 v331 = 2112;
      *(void *)uint64_t v332 = @"NO";
      _os_log_impl(&dword_22B280000, v86, OS_LOG_TYPE_INFO, "NeedsTranscode? %@ isHDR %@", buf, 0x16u);
    }
  }
  BOOL v88 = v85 > 1;
  uint64_t v89 = _iMessageTelemetryLogHandle();
  os_signpost_id_t v90 = os_signpost_id_generate(v89);
  log = v89;
  os_signpost_id_t spid = v90;
  unint64_t v91 = v90 - 1;
  if (v88)
  {
    unint64_t v254 = v90 - 1;
    if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22B280000, log, OS_SIGNPOST_INTERVAL_BEGIN, v90, "IMTranscoderAV.transcode.type.av", " enableTelemetry=YES ", buf, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v95 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v330 = (uint64_t)v17;
        _os_log_impl(&dword_22B280000, v95, OS_LOG_TYPE_INFO, "Transfer %@ is a supported format, will transcode", buf, 0xCu);
      }
    }
    uint64_t v338 = *MEMORY[0x263EFA288];
    v339[0] = MEMORY[0x263EFFA88];
    uint64_t v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)v339, (uint64_t)&v338, 1, v93, v94);
    uint64_t v266 = IMAVURLAssetOptionsWithExtraOptionsForWrite();

    id v97 = objc_alloc(MEMORY[0x263EFA8D0]);
    uint64_t v102 = objc_msgSend_initWithURL_options_(v97, v98, (uint64_t)v17, v266, v99, v100, v101);
    uint64_t v108 = objc_msgSend_tracksWithMediaType_(v102, v103, *MEMORY[0x263EF9D48], v104, v105, v106, v107);
    uint64_t v115 = objc_msgSend_count(v108, v109, v110, v111, v112, v113, v114);

    uint64_t v121 = objc_msgSend_tracksWithMediaType_(v102, v116, *MEMORY[0x263EF9CE8], v117, v118, v119, v120);
    uint64_t v128 = objc_msgSend_count(v121, v122, v123, v124, v125, v126, v127);

    uint64_t v257 = objc_msgSend_tracks(v102, v129, v130, v131, v132, v133, v134);
    if (IMOSLoggingEnabled())
    {
      uint64_t v135 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412802;
        uint64_t v330 = (uint64_t)v102;
        __int16 v331 = 1024;
        *(_DWORD *)uint64_t v332 = v115;
        *(_WORD *)&v332[4] = 1024;
        *(_DWORD *)&v332[6] = v128;
        _os_log_impl(&dword_22B280000, v135, OS_LOG_TYPE_INFO, "Created asset %@ with %d video tracks, %d audio tracks", buf, 0x18u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v136 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v330 = (uint64_t)v257;
        _os_log_impl(&dword_22B280000, v136, OS_LOG_TYPE_INFO, "   => Tracks: %@", buf, 0xCu);
      }
    }
    if (!(v115 | v128))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v140 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_22B280000, v140, OS_LOG_TYPE_INFO, "No video or audio tracks found", buf, 2u);
        }
      }
      uint64_t v141 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v137, @"__kIMTranscodeErrorDomain", -3, 0, v138, v139);
      if (v270) {
        (*((void (**)(id, id, void, void, void *, void, uint64_t, void))v270 + 2))(v270, v17, 0, 0, v141, 0, 1, 0);
      }

LABEL_135:
LABEL_136:

      uint64_t v155 = (void *)v266;
      goto LABEL_137;
    }
    uint64_t v322 = 0;
    uint64_t v323 = &v322;
    uint64_t v324 = 0x3032000000;
    uint64_t v325 = sub_22B284F50;
    uint64_t v326 = sub_22B284F60;
    id v327 = 0;
    uint64_t v316 = 0;
    uint64_t v317 = &v316;
    uint64_t v318 = 0x3032000000;
    uint64_t v319 = sub_22B284F50;
    v320 = sub_22B284F60;
    id v321 = 0;
    uint64_t v310 = 0;
    uint64_t v311 = &v310;
    uint64_t v312 = 0x3032000000;
    v313 = sub_22B284F50;
    v314 = sub_22B284F60;
    id v315 = 0;
    v309[0] = 0;
    v309[1] = v309;
    v309[2] = 0x2020000000;
    v309[3] = 0;
    uint64_t v303 = 0;
    uint64_t v304 = &v303;
    uint64_t v305 = 0x3032000000;
    v306 = sub_22B284F50;
    v307 = sub_22B284F60;
    id v308 = 0;
    uint64_t v297 = 0;
    uint64_t v298 = &v297;
    uint64_t v299 = 0x3032000000;
    int v300 = sub_22B284F50;
    v301 = sub_22B284F60;
    id v302 = 0;
    uint64_t v291 = 0;
    v292 = &v291;
    uint64_t v293 = 0x3032000000;
    int v294 = sub_22B284F50;
    v295 = sub_22B284F60;
    id v296 = 0;
    uint64_t v287 = 0;
    uint64_t v288 = &v287;
    uint64_t v289 = 0x2020000000;
    uint64_t v290 = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v156 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22B280000, v156, OS_LOG_TYPE_INFO, "Using a dispatch group when generating multiple video transcodings", buf, 2u);
      }
    }
    group = dispatch_group_create();
    if (IMOSLoggingEnabled())
    {
      v158 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v330 = (uint64_t)v102;
        _os_log_impl(&dword_22B280000, v158, OS_LOG_TYPE_INFO, "Asset to use for bigSize: %@", buf, 0xCu);
      }
    }
    BYTE4(v252) = shouldPreserveAAEncoding;
    BYTE3(v252) = v260;
    BYTE2(v252) = shouldPreserveHDREncoding;
    BYTE1(v252) = v328;
    LOBYTE(v252) = v76;
    uint64_t v256 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v157, (uint64_t)v17, (uint64_t)v19, a6, (uint64_t)v268, (uint64_t)v269, v264, v252, v267);
    if (IMOSLoggingEnabled())
    {
      uint64_t v165 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
      {
        uint64_t v166 = @"NO";
        if (v256 <= 1) {
          uint64_t v167 = @"NO";
        }
        else {
          uint64_t v167 = @"YES";
        }
        *(_DWORD *)long long buf = 134219010;
        uint64_t v330 = v267;
        if ((v264 & v76) != 0) {
          uint64_t v168 = @"YES";
        }
        else {
          uint64_t v168 = @"NO";
        }
        __int16 v331 = 2112;
        *(void *)uint64_t v332 = v167;
        if (v328) {
          uint64_t v169 = @"YES";
        }
        else {
          uint64_t v169 = @"NO";
        }
        *(_WORD *)&v332[8] = 2112;
        if (shouldPreserveHDREncoding) {
          uint64_t v166 = @"YES";
        }
        uint64_t v333 = v168;
        __int16 v334 = 2112;
        v335 = v169;
        __int16 v336 = 2112;
        uint64_t v337 = v166;
        _os_log_impl(&dword_22B280000, v165, OS_LOG_TYPE_INFO, "Do we need to transcode to get the big(%lu) representation? %@ (removeAlphaFromAnimojiV2 %@ isHDR %@ preserveHDR %@)", buf, 0x34u);
      }
    }
    if (v256 < 2)
    {
      uint64_t v178 = _IMTranscoderLinkFile(v17, v159, v160, v161, v162, v163, v164);
      uint64_t v179 = (void *)v298[5];
      v298[5] = v178;

      uint64_t v185 = objc_msgSend__fileSizeForTransfer_(self, v180, v298[5], v181, v182, v183, v184);
      v288[3] = v185;
    }
    else
    {
      dispatch_group_enter(group);
      v280[0] = MEMORY[0x263EF8330];
      v280[1] = 3221225472;
      v280[2] = sub_22B286A94;
      v280[3] = &unk_26488E9A0;
      uint64_t v282 = &v287;
      v280[4] = self;
      char v286 = v76;
      uint64_t v283 = &v297;
      v284 = &v303;
      v285 = &v291;
      uint64_t v170 = group;
      uint64_t v281 = v170;
      BYTE1(v253) = shouldPreserveAAEncoding;
      LOBYTE(v253) = v260;
      objc_msgSend__transcodeVideoAsync_target_maxBytes_isAnimojiV2_removeAlpha_preserveHDR_isAA_preserveAA_userInfo_completionHandler_(self, v171, (uint64_t)v102, a6, v267, v264, v76, shouldPreserveHDREncoding, v253, v19, v280);
      dispatch_group_wait(v170, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v186 = objc_msgSend_array(MEMORY[0x263EFF980], v172, v173, v174, v175, v176, v177);
    uint64_t v193 = objc_msgSend_array(MEMORY[0x263EFF980], v187, v188, v189, v190, v191, v192);
    if (v298[5])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v199 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
        {
          uint64_t v200 = v298[5];
          uint64_t v201 = v292[5];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v330 = v200;
          __int16 v331 = 2112;
          *(void *)uint64_t v332 = v201;
          _os_log_impl(&dword_22B280000, v199, OS_LOG_TYPE_INFO, "Adding bigURL %@ to outputPaths with context: %@", buf, 0x16u);
        }
      }
      objc_msgSend_addObject_(v186, v194, v298[5], v195, v196, v197, v198);
      uint64_t v207 = v292[5];
      if (v207)
      {
        objc_msgSend_addObject_(v193, v202, v207, v203, v204, v205, v206);
      }
      else
      {
        uint64_t v208 = objc_msgSend_dictionary(NSDictionary, v202, 0, v203, v204, v205, v206);
        objc_msgSend_addObject_(v193, v209, (uint64_t)v208, v210, v211, v212, v213);
      }
    }
    if (v256 < 2)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_103;
      }
      uint64_t v214 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22B280000, v214, OS_LOG_TYPE_INFO, "We didn't have to transcode to get the big representation so we know we have to for the small one.", buf, 2u);
      }
    }
    else if (v304[5] || !v298[5])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_103;
      }
      uint64_t v214 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22B280000, v214, OS_LOG_TYPE_INFO, "Generating the big representation was not successful. Let's potentially try for small.", buf, 2u);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v241 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
        {
          uint64_t v242 = v288[3];
          *(_DWORD *)long long buf = 134218240;
          uint64_t v330 = v242;
          __int16 v331 = 2048;
          *(void *)uint64_t v332 = v46;
          _os_log_impl(&dword_22B280000, v241, OS_LOG_TYPE_INFO, "actualBigSize: %llu   smallSize %zu", buf, 0x16u);
        }
      }
      if (v288[3] < v46)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v243 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
          {
            uint64_t v244 = v288[3];
            *(_DWORD *)long long buf = 134218240;
            uint64_t v330 = v244;
            __int16 v331 = 2048;
            *(void *)uint64_t v332 = v46;
            _os_log_impl(&dword_22B280000, v243, OS_LOG_TYPE_INFO, "Only using the big representation because the big output (%llu) fits in the small requirements (%zu)", buf, 0x16u);
          }
        }
        goto LABEL_104;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_103:
        if (v267 != v46)
        {
LABEL_108:
          if (IMOSLoggingEnabled())
          {
            uint64_t v216 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
            {
              v217 = @"NO";
              if ((v264 & v76) != 0) {
                v218 = @"YES";
              }
              else {
                v218 = @"NO";
              }
              if (v328) {
                v217 = @"YES";
              }
              *(_DWORD *)long long buf = 138412546;
              uint64_t v330 = (uint64_t)v218;
              __int16 v331 = 2112;
              *(void *)uint64_t v332 = v217;
              _os_log_impl(&dword_22B280000, v216, OS_LOG_TYPE_INFO, "There were two sizes requested && big doesn't satisfy the requirements for both, generating small. removeAlphaForAnimojiV2 %@ isHDR %@", buf, 0x16u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v219 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v330 = (uint64_t)v102;
              _os_log_impl(&dword_22B280000, v219, OS_LOG_TYPE_INFO, "Asset to use for smallSize: %@", buf, 0xCu);
            }
          }
          dispatch_group_enter(group);
          v273[0] = MEMORY[0x263EF8330];
          v273[1] = 3221225472;
          v273[2] = sub_22B286C54;
          v273[3] = &unk_26488E9A0;
          uint64_t v275 = v309;
          v273[4] = self;
          char v279 = v76;
          uint64_t v276 = &v316;
          v277 = &v310;
          v278 = &v322;
          uint64_t v220 = group;
          uint64_t v274 = v220;
          BYTE1(v253) = shouldPreserveAAEncoding;
          LOBYTE(v253) = v260;
          objc_msgSend__transcodeVideoAsync_target_maxBytes_isAnimojiV2_removeAlpha_preserveHDR_isAA_preserveAA_userInfo_completionHandler_(self, v221, (uint64_t)v102, a6, v46, v264, v76, 0, v253, v19, v273);
          dispatch_group_wait(v220, 0xFFFFFFFFFFFFFFFFLL);

LABEL_122:
          if (!v323[5] && v317[5])
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v232 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
              {
                uint64_t v233 = v317[5];
                uint64_t v234 = v311[5];
                *(_DWORD *)long long buf = 138412546;
                uint64_t v330 = v233;
                __int16 v331 = 2112;
                *(void *)uint64_t v332 = v234;
                _os_log_impl(&dword_22B280000, v232, OS_LOG_TYPE_INFO, "Adding smallURL %@ to outputPaths with context: %@", buf, 0x16u);
              }
            }
            objc_msgSend_addObject_(v186, v227, v317[5], v228, v229, v230, v231);
            uint64_t v240 = v311[5];
            if (v240)
            {
              objc_msgSend_addObject_(v193, v235, v240, v236, v237, v238, v239);
            }
            else
            {
              uint64_t v245 = objc_msgSend_dictionary(NSDictionary, v235, 0, v236, v237, v238, v239);
              objc_msgSend_addObject_(v193, v246, (uint64_t)v245, v247, v248, v249, v250);
            }
          }
          uint64_t v222 = log;
          unint64_t v223 = v222;
          if (v254 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v222))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22B280000, v223, OS_SIGNPOST_INTERVAL_END, spid, "IMTranscoderAV.transcode.type.av", " enableTelemetry=YES ", buf, 2u);
          }

          v224 = (void *)v323[5];
          if (!v224) {
            v224 = (void *)v304[5];
          }
          uint64_t v225 = v224;
          if (IMOSLoggingEnabled())
          {
            uint64_t v226 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412802;
              uint64_t v330 = (uint64_t)v17;
              __int16 v331 = 2112;
              *(void *)uint64_t v332 = v186;
              *(_WORD *)&v332[8] = 2112;
              uint64_t v333 = v225;
              _os_log_impl(&dword_22B280000, v226, OS_LOG_TYPE_INFO, "Calling completionBlock with: transfer %@ outputPaths %@ error %@", buf, 0x20u);
            }
          }
          if (v270) {
            (*((void (**)(id, id, void *, void *, __CFString *, BOOL, uint64_t, void))v270 + 2))(v270, v17, v186, v193, v225, v225 == 0, 1, 0);
          }

          _Block_object_dispose(&v287, 8);
          _Block_object_dispose(&v291, 8);

          _Block_object_dispose(&v297, 8);
          _Block_object_dispose(&v303, 8);

          _Block_object_dispose(v309, 8);
          _Block_object_dispose(&v310, 8);

          _Block_object_dispose(&v316, 8);
          _Block_object_dispose(&v322, 8);

          goto LABEL_135;
        }
LABEL_104:
        if ((v264 & v76 & 1) == 0)
        {
          char v215 = shouldPreserveHDREncoding;
          if (!v328) {
            char v215 = 1;
          }
          if (v215) {
            goto LABEL_122;
          }
        }
        goto LABEL_108;
      }
      uint64_t v214 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22B280000, v214, OS_LOG_TYPE_INFO, "bigURL was too big for smallSize or there was a FS error", buf, 2u);
      }
    }

    goto LABEL_103;
  }
  if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B280000, log, OS_SIGNPOST_EVENT, v90, "IMTranscoderImage.transcode.none", " enableTelemetry=YES ", buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    id v148 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v330 = (uint64_t)v17;
      _os_log_impl(&dword_22B280000, v148, OS_LOG_TYPE_INFO, "Transfer %@ doesn't need any processing", buf, 0xCu);
    }
  }
  uint64_t v266 = _IMTranscoderLinkFile(v17, v142, v143, v144, v145, v146, v147);
  if (IMOSLoggingEnabled())
  {
    uint64_t v154 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v330 = v266;
      _os_log_impl(&dword_22B280000, v154, OS_LOG_TYPE_INFO, "We need a hard link to this file for our clients who assume it's a file we created: %@", buf, 0xCu);
    }
  }
  uint64_t v155 = (void *)v266;
  if (v270)
  {
    if (v266)
    {
      uint64_t v102 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v149, v266, v150, v151, v152, v153, 0);
      (*((void (**)(id, id, void *, void, void, uint64_t, void, void))v270 + 2))(v270, v17, v102, 0, 0, 1, 0, 0);
    }
    else
    {
      uint64_t v102 = objc_msgSend_array(MEMORY[0x263EFF8C0], v149, 0, v150, v151, v152, v153);
      (*((void (**)(id, id, void *, void, void, void, void, void))v270 + 2))(v270, v17, v102, 0, 0, 0, 0, 0);
    }
    goto LABEL_136;
  }
LABEL_137:
}

@end