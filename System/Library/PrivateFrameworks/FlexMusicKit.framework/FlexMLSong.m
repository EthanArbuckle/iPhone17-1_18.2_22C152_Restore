@interface FlexMLSong
+ (id)loadSongAtPath:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedNaturalDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- (BOOL)canPlay;
- (BOOL)isLoaded;
- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5;
- (FlexMLSong)initWithFileAtPath:(id)a3;
- (NSString)audioFileExtension;
- (NSString)metadataPath;
- (NSString)rootPath;
- (NSURL)audioFileURL;
- (id)_summaryManager;
- (id)idealDurations;
- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4;
- (void)setAudioFileExtension:(id)a3;
- (void)setCachedNaturalDuration:(id *)a3;
@end

@implementation FlexMLSong

+ (id)loadSongAtPath:(id)a3
{
  id v3 = a3;
  v4 = [FlexMLSong alloc];
  v8 = objc_msgSend_initWithFileAtPath_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (FlexMLSong)initWithFileAtPath:(id)a3
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8, v9);
  id v168 = 0;
  v13 = objc_msgSend_contentsOfDirectoryAtPath_error_(v10, v11, (uint64_t)v5, (uint64_t)&v168, v12);
  id v14 = v168;

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v15 = v13;
  v21 = (FlexMLSong *)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v164, (uint64_t)v170, 16);
  if (v21)
  {
    id v161 = v14;
    v162 = v5;
    uint64_t v22 = *(void *)v165;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v165 != v22) {
        objc_enumerationMutation(v15);
      }
      v24 = *(void **)(*((void *)&v164 + 1) + 8 * v23);
      v25 = objc_msgSend_pathExtension(v24, v17, v18, v19, v20);
      char isEqualToString = objc_msgSend_isEqualToString_(v25, v26, @"metadata", v27, v28);

      if (isEqualToString) {
        break;
      }
      if (v21 == (FlexMLSong *)++v23)
      {
        v21 = (FlexMLSong *)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v164, (uint64_t)v170, 16);
        if (v21) {
          goto LABEL_3;
        }
        v30 = v15;
        id v14 = v161;
        id v5 = v162;
        goto LABEL_32;
      }
    }
    id v5 = v162;
    v30 = objc_msgSend_stringByAppendingPathComponent_(v162, v17, (uint64_t)v24, v19, v20);

    if (!v30)
    {
      v21 = 0;
      id v14 = v161;
      goto LABEL_33;
    }
    objc_storeStrong((id *)&self->_rootPath, a3);
    objc_storeStrong((id *)&self->_metadataPath, v30);
    v34 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x263EFF9A0], v31, (uint64_t)v30, v32, v33);
    v38 = objc_msgSend_objectForKey_(v34, v35, @"plistRuntimeVersion", v36, v37);
    uint64_t v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);

    if ((unint64_t)(v43 - 1) > 1)
    {
      v21 = 0;
      id v14 = v161;
LABEL_31:

      goto LABEL_32;
    }
    v47 = objc_msgSend_objectForKey_(v34, v44, @"uuid", v45, v46);
    v160 = objc_msgSend_objectForKey_(v34, v48, @"songName", v49, v50);
    v159 = objc_msgSend_objectForKey_(v34, v51, @"artistName", v52, v53);
    v54 = (void *)MEMORY[0x263EFFA08];
    v58 = objc_msgSend_objectForKey_(v34, v55, @"tagIDs", v56, v57);
    v62 = objc_msgSend_setWithArray_(v54, v59, (uint64_t)v58, v60, v61);

    v66 = objc_msgSend_objectForKey_(v34, v63, @"customOptions", v64, v65);
    v158 = objc_msgSend_set(MEMORY[0x263EFFA08], v67, v68, v69, v70);
    v157 = objc_msgSend_dictionary(NSDictionary, v71, v72, v73, v74);
    v78 = objc_msgSend_objectForKey_(v34, v75, @"sampleRate", v76, v77);
    v156 = objc_msgSend_objectForKey_(v34, v79, @"audioEncoderPresetName", v80, v81);
    v155 = v78;
    if (v78) {
      uint64_t v86 = objc_msgSend_integerValue(v78, v82, v83, v84, v85);
    }
    else {
      uint64_t v86 = 44100;
    }
    v163.receiver = self;
    v163.super_class = (Class)FlexMLSong;
    v87 = -[FlexSongBackend initWithUID:songName:artistName:tagIDs:keywords:weightedKeywords:hidden:recalled:audioEncoderPresetName:metadataVersion:songFormat:sampleRate:customOptions:](&v163, sel_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_audioEncoderPresetName_metadataVersion_songFormat_sampleRate_customOptions_, v47, v160, v159, v62, v158, v157, 0, v156, 0, @"ML", v86, v66);
    v91 = (void **)v87;
    id v14 = v161;
    if (!v87)
    {
LABEL_30:
      self = v91;

      v21 = self;
      goto LABEL_31;
    }
    v152 = v66;
    v153 = v62;
    uint64_t v92 = MEMORY[0x263F01090];
    *(_OWORD *)(v87 + 136) = *MEMORY[0x263F01090];
    *((void *)v87 + 19) = *(void *)(v92 + 16);
    uint64_t v93 = objc_msgSend_objectForKey_(v34, v88, @"audioFileExtension", v89, v90);
    v94 = v91[16];
    v91[16] = (void *)v93;

    uint64_t v98 = objc_msgSend_objectForKey_(v34, v95, @"songFile", v96, v97);
    unint64_t v102 = 0x263EFF000uLL;
    v154 = v47;
    v151 = (void *)v98;
    if (v98)
    {
      v103 = NSURL;
      v104 = objc_msgSend_stringByAppendingPathComponent_(v91[14], v99, v98, v100, v101);
      v108 = objc_msgSend_fileURLWithPath_(v103, v105, (uint64_t)v104, v106, v107);

      v113 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v109, v110, v111, v112);
      v118 = objc_msgSend_path(v108, v114, v115, v116, v117);
      char v122 = objc_msgSend_fileExistsAtPath_(v113, v119, (uint64_t)v118, v120, v121);

      if ((v122 & 1) == 0)
      {

        v108 = 0;
      }
      unint64_t v102 = 0x263EFF000;
    }
    else
    {
      v108 = 0;
    }
    v123 = objc_msgSend_objectForKey_(v34, v99, @"contentVersion", v100, v101);
    v127 = objc_msgSend_objectForKey_(v34, v124, @"compatibilityVersion", v125, v126);
    v149 = [FMSongAsset alloc];
    v150 = v108;
    BOOL v128 = v108 == 0;
    v136 = objc_msgSend_fileURLWithPath_(*(void **)(v102 + 2608), v129, (uint64_t)v91[14], v130, v131);
    if (v123)
    {
      uint64_t v137 = objc_msgSend_integerValue(v123, v132, v133, v134, v135);
      if (v127)
      {
LABEL_26:
        uint64_t v138 = objc_msgSend_integerValue(v127, v132, v133, v134, v135);
        uint64_t v140 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v149, v139, @"FMSongBundleAssetID", v128, (uint64_t)v136, v137, v138);
LABEL_29:
        v141 = (void *)v140;

        v169 = v141;
        v144 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v142, (uint64_t)&v169, 1, v143);
        objc_msgSend__setupInitialAssets_(v91, v145, (uint64_t)v144, v146, v147);

        id v5 = v162;
        v62 = v153;
        v47 = v154;
        v66 = v152;
        goto LABEL_30;
      }
    }
    else
    {
      v123 = 0;
      uint64_t v137 = 1;
      if (v127) {
        goto LABEL_26;
      }
    }
    uint64_t v140 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v149, v132, @"FMSongBundleAssetID", v128, (uint64_t)v136, v137, 4);
    goto LABEL_29;
  }
  v30 = v15;
LABEL_32:

LABEL_33:
  return v21;
}

- (BOOL)canPlay
{
  return 1;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)_summaryManager
{
  id v5 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x263EFF9A0], a2, (uint64_t)self->_metadataPath, v2, v3);
  uint64_t v9 = objc_msgSend_objectForKey_(v5, v6, @"sampleRate", v7, v8);
  v13 = objc_msgSend_objectForKey_(v5, v10, @"summaryMapping", v11, v12);
  id v14 = [FlexMLSummaryManager alloc];
  rootPath = self->_rootPath;
  metadataPath = self->_metadataPath;
  uint64_t v21 = objc_msgSend_integerValue(v9, v17, v18, v19, v20);
  uint64_t v23 = objc_msgSend_initWithSummaryMapping_bundlePath_metadataPath_targetTimeScale_(v14, v22, (uint64_t)v13, (uint64_t)rootPath, (uint64_t)metadataPath, v21);

  return v23;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = FlexLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a3;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v23);
    LODWORD(v23.var0) = 134217984;
    *(Float64 *)((char *)&v23.var0 + 4) = Seconds;
    _os_log_impl(&dword_217A2F000, v8, OS_LOG_TYPE_DEFAULT, "flex: Requesting ML format rendition for duration %.2f", (uint8_t *)&v23, 0xCu);
  }

  id v14 = objc_msgSend__summaryManager(self, v10, v11, v12, v13);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a3;
  uint64_t v18 = objc_msgSend_summaryForDuration_(v14, v15, (uint64_t)&v23, v16, v17);
  uint64_t v19 = [FlexMLSongRendition alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a3;
  uint64_t v21 = objc_msgSend_initWithSong_options_andSummary_forDuration_(v19, v20, (uint64_t)self, (uint64_t)v7, (uint64_t)v18, &v23);

  return v21;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  uint64_t v755 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  v643 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v69 = (id)MEMORY[0x263EFFA68];
    goto LABEL_135;
  }
  id v7 = v6;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_summary(v7, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_videoCues(v17, v18, v19, v20, v21);

  v642 = v22;
  if (objc_msgSend_count(v22, v23, v24, v25, v26))
  {
    int32_t preferredTimescale = objc_msgSend_sampleRate(self, v27, v28, v29, v30);
    uint64_t v35 = objc_msgSend_durationOfMusic(v7, v31, v32, v33, v34);
    uint64_t v40 = objc_msgSend_summary(v7, v36, v37, v38, v39);
    objc_msgSend_lkfsValue(v40, v41, v42, v43, v44);
    double v46 = v45;

    v51 = objc_msgSend_summary(v7, v47, v48, v49, v50);
    objc_msgSend_peakValue(v51, v52, v53, v54, v55);
    int v57 = v56;

    uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v22, v58, @"greatCues", v59, v60);
    uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v22, v62, @"goodCues", v63, v64);
    v638 = (void *)v68;
    v639 = v61;
    if (v61) {
      objc_msgSend_arrayByAddingObjectsFromArray_(v61, v65, v68, v66, v67);
    }
    else {
    uint64_t v70 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v65, v68, v66, v67);
    }
    v71 = sel_compare_;
    v75 = objc_msgSend_sortedArrayUsingSelector_(v70, v72, (uint64_t)sel_compare_, v73, v74);

    uint64_t v80 = objc_msgSend_orderedSet(MEMORY[0x263EFF9B0], v76, v77, v78, v79);
    long long v717 = 0u;
    long long v718 = 0u;
    long long v719 = 0u;
    long long v720 = 0u;
    id v81 = v75;
    v82 = (void *)v80;
    obuint64_t j = v81;
    uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v83, (uint64_t)&v717, (uint64_t)v754, 16);
    if (v84)
    {
      uint64_t v88 = v84;
      uint64_t v89 = *(void *)v718;
      do
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v718 != v89) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend_addObject_(v82, v85, *(void *)(*((void *)&v717 + 1) + 8 * i), v86, v87);
        }
        uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v717, (uint64_t)v754, 16);
      }
      while (v88);
    }

    v641 = v82;
    v95 = objc_msgSend_array(v82, v91, v92, v93, v94);
    uint64_t v100 = objc_msgSend_firstObject(v95, v96, v97, v98, v99);
    objc_msgSend_doubleValue(v100, v101, v102, v103, v104);
    if (v108 != 0.0)
    {

      uint64_t v100 = &unk_26C807000;
      v753 = &unk_26C807000;
      uint64_t v111 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v109, (uint64_t)&v753, 1, v110);
      uint64_t v115 = objc_msgSend_arrayByAddingObjectsFromArray_(v111, v112, (uint64_t)v95, v113, v114);
      uint64_t v116 = v95;
      v95 = (void *)v115;
    }
    v654 = v95;
    double v117 = (double)v35;
    double v118 = (double)preferredTimescale;
    v644 = v7;
    id v645 = v5;
    v640 = v100;
    v670 = v12;
    if (objc_msgSend_isEqualToString_(v5, v105, @"FMTimedMetadataIdentifierLoopPoints", v106, v107))
    {
      long long v716 = 0u;
      long long v715 = 0u;
      long long v714 = 0u;
      long long v713 = 0u;
      v123 = objc_msgSend_summary(v7, v119, v120, v121, v122);
      BOOL v128 = objc_msgSend_loopPoints(v123, v124, v125, v126, v127);

      id v668 = v128;
      uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v713, (uint64_t)v752, 16);
      if (v130)
      {
        uint64_t v135 = v130;
        uint64_t v136 = *(void *)v714;
        long long v664 = *MEMORY[0x263F010E0];
        CMTimeEpoch v137 = *(void *)(MEMORY[0x263F010E0] + 16);
        uint64_t v138 = MEMORY[0x263EFFA78];
        do
        {
          for (uint64_t j = 0; j != v135; ++j)
          {
            if (*(void *)v714 != v136) {
              objc_enumerationMutation(v668);
            }
            uint64_t v140 = *(void **)(*((void *)&v713 + 1) + 8 * j);
            memset(&v712, 0, sizeof(v712));
            objc_msgSend_doubleValue(v140, v131, v132, v133, v134);
            Float64 v142 = v141;
            int32_t v147 = objc_msgSend_sampleRate(self, v143, v144, v145, v146);
            CMTimeMakeWithSeconds(&start, v142, v147);
            *(_OWORD *)&duration.start.value = v664;
            duration.start.epoch = v137;
            CMTimeRangeMake(&v712, &start, &duration.start);
            v148 = [FMTimedMetadataItem alloc];
            v149 = NSString;
            objc_msgSend_doubleValue(v140, v150, v151, v152, v153);
            v158 = objc_msgSend_stringWithFormat_(v149, v154, @"loop point @%f", v155, v156, v157);
            duratiouint64_t n = v712;
            v160 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v148, v159, @"FMTimedMetadataIdentifierOnset", (uint64_t)v158, (uint64_t)&duration, v138);

            objc_msgSend_addObject_(v12, v161, (uint64_t)v160, v162, v163);
          }
          uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v668, v131, (uint64_t)&v713, (uint64_t)v752, 16);
        }
        while (v135);
        id v7 = v644;
        id v5 = v645;
        uint64_t v100 = v640;
        long long v164 = v641;
        v71 = sel_compare_;
      }
      else
      {
        long long v164 = v641;
      }
    }
    else
    {
      long long v164 = v641;
      if (!objc_msgSend_isEqualToString_(v5, v119, @"FMTimedMetadataIdentifierSection", v121, v122))goto LABEL_52; {
      objc_msgSend_objectForKeyedSubscript_(v642, v165, @"fadeToBlack", v166, v167);
      }
      id v668 = (id)objc_claimAutoreleasedReturnValue();
      v660 = objc_msgSend_firstObject(v639, v168, v169, v170, v171);
      objc_msgSend_doubleValue(v660, v172, v173, v174, v175);
      v177 = (long long *)MEMORY[0x263F010E0];
      if (v178 != 0.0)
      {
        v750 = @"SectionType";
        v751 = @"BODY";
        v179 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v176, (uint64_t)&v751, (uint64_t)&v750, 1);
        memset(&v712, 0, sizeof(v712));
        CMTimeMakeWithSeconds(&v709, 0.0, preferredTimescale);
        *(_OWORD *)&duration.start.value = *v177;
        duration.start.epoch = *((void *)v177 + 2);
        CMTimeRangeMake(&v712, &v709, &duration.start);
        v180 = [FMTimedMetadataItem alloc];
        duratiouint64_t n = v712;
        v182 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v180, v181, @"FMTimedMetadataIdentifierSection", @"section", (uint64_t)&duration, v179);
        objc_msgSend_addObject_(v670, v183, (uint64_t)v182, v184, v185);
      }
      long long v707 = 0u;
      long long v708 = 0u;
      long long v705 = 0u;
      long long v706 = 0u;
      id v186 = v639;
      uint64_t v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v187, (uint64_t)&v705, (uint64_t)v749, 16);
      if (v188)
      {
        uint64_t v193 = v188;
        uint64_t v194 = *(void *)v706;
        long long v665 = *v177;
        CMTimeEpoch v195 = *((void *)v177 + 2);
        do
        {
          for (uint64_t k = 0; k != v193; ++k)
          {
            if (*(void *)v706 != v194) {
              objc_enumerationMutation(v186);
            }
            v197 = *(void **)(*((void *)&v705 + 1) + 8 * k);
            memset(&v712, 0, sizeof(v712));
            objc_msgSend_doubleValue(v197, v189, v190, v191, v192);
            CMTimeMakeWithSeconds(&v704, v198, preferredTimescale);
            *(_OWORD *)&duration.start.value = v665;
            duration.start.epoch = v195;
            CMTimeRangeMake(&v712, &v704, &duration.start);
            v203 = objc_msgSend_lastObject(v654, v199, v200, v201, v202);
            int isEqualToNumber = objc_msgSend_isEqualToNumber_(v197, v204, (uint64_t)v203, v205, v206);

            if (isEqualToNumber)
            {
              if (v668)
              {
                v212 = NSNumber;
                objc_msgSend_doubleValue(v668, v208, v209, v210, v211);
                double v214 = v213;
                objc_msgSend_doubleValue(v197, v215, v216, v217, v218);
                uint64_t v224 = objc_msgSend_numberWithDouble_(v212, v220, v221, v222, v223, v214 - v219);

                v747[0] = @"SectionType";
                v747[1] = @"FadeToBlack";
                v748[0] = @"OUTRO";
                v748[1] = v224;
                v226 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v225, (uint64_t)v748, (uint64_t)v747, 2);
                id v668 = (id)v224;
              }
              else
              {
                v745 = @"SectionType";
                v746 = @"OUTRO";
                v226 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v208, (uint64_t)&v746, (uint64_t)&v745, 1);
                id v668 = 0;
              }
            }
            else
            {
              v743 = @"SectionType";
              v744 = @"BODY";
              v226 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v208, (uint64_t)&v744, (uint64_t)&v743, 1);
            }
            v227 = [FMTimedMetadataItem alloc];
            duratiouint64_t n = v712;
            v229 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v227, v228, @"FMTimedMetadataIdentifierSection", @"section", (uint64_t)&duration, v226);
            objc_msgSend_addObject_(v670, v230, (uint64_t)v229, v231, v232);
          }
          uint64_t v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v189, (uint64_t)&v705, (uint64_t)v749, 16);
        }
        while (v193);
      }

      v237 = objc_msgSend_lastObject(v670, v233, v234, v235, v236);
      v242 = objc_msgSend_values(v237, v238, v239, v240, v241);
      v246 = objc_msgSend_objectForKeyedSubscript_(v242, v243, @"SectionType", v244, v245);
      char isEqualToString = objc_msgSend_isEqualToString_(v246, v247, @"OUTRO", v248, v249);

      if (isEqualToString)
      {
        id v7 = v644;
        id v5 = v645;
        uint64_t v100 = v640;
        long long v164 = v641;
        uint64_t v255 = objc_msgSend_durationOfSilence(v644, v251, v252, v253, v254);
      }
      else
      {
        v260 = objc_msgSend_lastObject(v654, v251, v252, v253, v254);
        memset(&v712, 0, sizeof(v712));
        objc_msgSend_doubleValue(v260, v261, v262, v263, v264);
        CMTimeMakeWithSeconds(&v703, v265, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x263F010E0];
        duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
        CMTimeRangeMake(&v712, &v703, &duration.start);
        id v7 = v644;
        id v5 = v645;
        uint64_t v100 = v640;
        if (v668)
        {
          v270 = NSNumber;
          objc_msgSend_doubleValue(v668, v266, v267, v268, v269);
          double v272 = v271;
          objc_msgSend_doubleValue(v260, v273, v274, v275, v276);
          uint64_t v282 = objc_msgSend_numberWithDouble_(v270, v278, v279, v280, v281, v272 - v277);

          v741[0] = @"SectionType";
          v741[1] = @"FadeToBlack";
          v742[0] = @"OUTRO";
          v742[1] = v282;
          v284 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v283, (uint64_t)v742, (uint64_t)v741, 2);
          id v668 = (id)v282;
        }
        else
        {
          v739 = @"SectionType";
          v740 = @"OUTRO";
          v284 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v266, (uint64_t)&v740, (uint64_t)&v739, 1);
          id v668 = 0;
        }
        long long v164 = v641;
        v285 = [FMTimedMetadataItem alloc];
        duratiouint64_t n = v712;
        v287 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v285, v286, @"FMTimedMetadataIdentifierSection", @"section", (uint64_t)&duration, v284);
        objc_msgSend_addObject_(v670, v288, (uint64_t)v287, v289, v290);

        uint64_t v255 = objc_msgSend_durationOfSilence(v644, v291, v292, v293, v294);
      }
      v71 = sel_compare_;
      if (v255)
      {
        memset(&v712, 0, sizeof(v712));
        int64_t v295 = objc_msgSend_durationOfMusic(v7, v256, v257, v258, v259);
        CMTimeMake(&v702, v295, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x263F010E0];
        duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
        CMTimeRangeMake(&v712, &v702, &duration.start);
        v737 = @"SectionType";
        v738 = @"SILENCE";
        v297 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v296, (uint64_t)&v738, (uint64_t)&v737, 1);
        v298 = [FMTimedMetadataItem alloc];
        duratiouint64_t n = v712;
        v300 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v298, v299, @"FMTimedMetadataIdentifierSection", @"section", (uint64_t)&duration, v297);
        objc_msgSend_addObject_(v670, v301, (uint64_t)v300, v302, v303);
      }
      uint64_t v12 = v670;
    }

LABEL_52:
    double v304 = v117 / v118;
    if (objc_msgSend_isEqualToString_(v5, v165, @"FMTimedMetadataIdentifierSegment", v166, v167))
    {
      objc_msgSend_objectForKeyedSubscript_(v642, v305, @"fadeToBlack", v306, v307);
      id v663 = (id)objc_claimAutoreleasedReturnValue();
      v312 = objc_msgSend_summary(v7, v308, v309, v310, v311);
      v317 = objc_msgSend_allBars(v312, v313, v314, v315, v316);

      long long v700 = 0u;
      long long v701 = 0u;
      long long v698 = 0u;
      long long v699 = 0u;
      id v318 = v654;
      id v669 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v318, v319, (uint64_t)&v698, (uint64_t)v736, 16);
      if (v669)
      {
        unint64_t v324 = 0;
        uint64_t v666 = *(void *)v699;
        long long v651 = *MEMORY[0x263F010E0];
        id v648 = v318;
        CMTimeEpoch v649 = *(void *)(MEMORY[0x263F010E0] + 16);
        v661 = v317;
        do
        {
          for (m = 0; m != v669; m = (char *)m + 1)
          {
            if (*(void *)v699 != v666) {
              objc_enumerationMutation(v318);
            }
            v326 = *(void **)(*((void *)&v698 + 1) + 8 * (void)m);
            v327 = objc_msgSend_lastObject(v318, v320, v321, v322, v323);
            char v331 = objc_msgSend_isEqualToNumber_(v326, v328, (uint64_t)v327, v329, v330);

            if (v331)
            {
              objc_msgSend_numberWithDouble_(NSNumber, v332, v333, v334, v335, v304);
            }
            else
            {
              uint64_t v336 = objc_msgSend_indexOfObject_(v318, v332, (uint64_t)v326, v334, v335);
              objc_msgSend_objectAtIndexedSubscript_(v318, v337, v336 + 1, v338, v339);
            v340 = };
            if (v324 >= objc_msgSend_count(v317, v341, v342, v343, v344))
            {
              uint64_t v349 = 0;
            }
            else
            {
              uint64_t v349 = 0;
              while (1)
              {
                v350 = objc_msgSend_objectAtIndexedSubscript_(v317, v345, v324 + v349, v347, v348);
                objc_msgSend_doubleValue(v350, v351, v352, v353, v354);
                double v356 = v355;
                objc_msgSend_doubleValue(v340, v357, v358, v359, v360);
                double v362 = v361;

                if (v356 >= v362) {
                  break;
                }
                ++v349;
                if (v324 + v349 >= objc_msgSend_count(v317, v345, v346, v347, v348)) {
                  goto LABEL_68;
                }
              }
              v324 += v349;
LABEL_68:
              id v318 = v648;
            }
            memset(&v712, 0, sizeof(v712));
            objc_msgSend_doubleValue(v326, v345, v346, v347, v348);
            CMTimeMakeWithSeconds(&v697, v363, preferredTimescale);
            *(_OWORD *)&duration.start.value = v651;
            duration.start.epoch = v649;
            CMTimeRangeMake(&v712, &v697, &duration.start);
            v368 = objc_msgSend_lastObject(v318, v364, v365, v366, v367);
            int v372 = objc_msgSend_isEqualToNumber_(v326, v369, (uint64_t)v368, v370, v371);

            if (v372)
            {
              if (v663)
              {
                v378 = NSNumber;
                objc_msgSend_doubleValue(v663, v373, v374, v375, v376);
                double v380 = v379;
                objc_msgSend_doubleValue(v326, v381, v382, v383, v384);
                uint64_t v390 = objc_msgSend_numberWithDouble_(v378, v386, v387, v388, v389, v380 - v385);

                v735[0] = @"OUTRO";
                v734[0] = @"SegmentType";
                v734[1] = @"PeakValue";
                LODWORD(v391) = v57;
                v396 = objc_msgSend_numberWithFloat_(NSNumber, v392, v393, v394, v395, v391);
                v735[1] = v396;
                v734[2] = @"Loudness";
                v401 = objc_msgSend_numberWithDouble_(NSNumber, v397, v398, v399, v400, v46);
                v735[2] = v401;
                v734[3] = @"BarsUsed";
                v405 = objc_msgSend_numberWithInteger_(NSNumber, v402, v349, v403, v404);
                v734[4] = @"FadeToBlack";
                v735[3] = v405;
                v735[4] = v390;
                v407 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v406, (uint64_t)v735, (uint64_t)v734, 5);
                id v663 = (id)v390;
                uint64_t v12 = v670;
              }
              else
              {
                v733[0] = @"OUTRO";
                v732[0] = @"SegmentType";
                v732[1] = @"PeakValue";
                LODWORD(v377) = v57;
                v396 = objc_msgSend_numberWithFloat_(NSNumber, v373, v374, v375, v376, v377);
                v733[1] = v396;
                v732[2] = @"Loudness";
                v401 = objc_msgSend_numberWithDouble_(NSNumber, v416, v417, v418, v419, v46);
                v733[2] = v401;
                v732[3] = @"BarsUsed";
                v405 = objc_msgSend_numberWithInteger_(NSNumber, v420, v349, v421, v422);
                v733[3] = v405;
                v407 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v423, (uint64_t)v733, (uint64_t)v732, 4);
                id v663 = 0;
              }
            }
            else
            {
              v731[0] = @"BODY";
              v730[0] = @"SegmentType";
              v730[1] = @"PeakValue";
              LODWORD(v377) = v57;
              v396 = objc_msgSend_numberWithFloat_(NSNumber, v373, v374, v375, v376, v377);
              v731[1] = v396;
              v730[2] = @"Loudness";
              v401 = objc_msgSend_numberWithDouble_(NSNumber, v408, v409, v410, v411, v46);
              v731[2] = v401;
              v730[3] = @"BarsUsed";
              v405 = objc_msgSend_numberWithInteger_(NSNumber, v412, v349, v413, v414);
              v731[3] = v405;
              v407 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v415, (uint64_t)v731, (uint64_t)v730, 4);
            }

            v424 = [FMTimedMetadataItem alloc];
            duratiouint64_t n = v712;
            v426 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v424, v425, @"FMTimedMetadataIdentifierSegment", @"segment", (uint64_t)&duration, v407);
            objc_msgSend_addObject_(v12, v427, (uint64_t)v426, v428, v429);

            v317 = v661;
          }
          id v669 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v318, v320, (uint64_t)&v698, (uint64_t)v736, 16);
        }
        while (v669);
      }

      id v7 = v644;
      if (objc_msgSend_durationOfSilence(v644, v430, v431, v432, v433))
      {
        memset(&v712, 0, sizeof(v712));
        int64_t v438 = objc_msgSend_durationOfMusic(v644, v434, v435, v436, v437);
        CMTimeMake(&v696, v438, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x263F010E0];
        duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
        CMTimeRangeMake(&v712, &v696, &duration.start);
        v728 = @"SegmentType";
        v729 = @"SILENCE";
        v440 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v439, (uint64_t)&v729, (uint64_t)&v728, 1);
        v441 = [FMTimedMetadataItem alloc];
        duratiouint64_t n = v712;
        v443 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v441, v442, @"FMTimedMetadataIdentifierSegment", @"segment", (uint64_t)&duration, v440);
        objc_msgSend_addObject_(v12, v444, (uint64_t)v443, v445, v446);
      }
      id v5 = v645;
      goto LABEL_118;
    }
    if ((objc_msgSend_isEqualToString_(v5, v305, @"FMTimedMetadataIdentifierBar", v306, v307) & 1) == 0
      && !objc_msgSend_isEqualToString_(v5, v447, @"FMTimedMetadataIdentifierBeat", v449, v450))
    {
      goto LABEL_119;
    }
    unint64_t v451 = objc_msgSend_count(v654, v447, v448, v449, v450);
    uint64_t v456 = 0x7FFFFFFFFFFFFFFFLL;
    if (v451 > 1) {
      uint64_t v456 = 1;
    }
    uint64_t v656 = v456;
    v457 = objc_msgSend_summary(v7, v452, v453, v454, v455);
    v462 = objc_msgSend_allBars(v457, v458, v459, v460, v461);

    v317 = objc_msgSend_firstObject(v462, v463, v464, v465, v466);
    objc_msgSend_doubleValue(v317, v467, v468, v469, v470);
    if (v473 != 0.0)
    {
      v727 = &unk_26C807000;
      v474 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v471, (uint64_t)&v727, 1, v472);
      uint64_t v478 = objc_msgSend_arrayByAddingObjectsFromArray_(v474, v475, (uint64_t)v462, v476, v477);

      v462 = (void *)v478;
    }
    long long v694 = 0u;
    long long v695 = 0u;
    long long v692 = 0u;
    long long v693 = 0u;
    id v663 = v462;
    uint64_t v650 = objc_msgSend_countByEnumeratingWithState_objects_count_(v663, v479, (uint64_t)&v692, (uint64_t)v726, 16);
    if (!v650)
    {
LABEL_117:

      uint64_t v12 = v670;
LABEL_118:

      uint64_t v100 = v640;
      long long v164 = v641;
LABEL_119:
      if (objc_msgSend_count(v12, v447, v448, v449, v450))
      {
        if (objc_msgSend_count(v12, v598, v599, v600, v601) != 1)
        {
          unint64_t v606 = 0;
          do
          {
            v607 = objc_msgSend_objectAtIndex_(v12, v602, v606, v604, v605);
            v611 = objc_msgSend_objectAtIndex_(v12, v608, ++v606, v609, v610);
            v616 = v611;
            memset(&v712, 0, 24);
            if (v611)
            {
              objc_msgSend_timeRange(v611, v612, v613, v614, v615);
            }
            else
            {
              long long v680 = 0u;
              long long v681 = 0u;
              long long v679 = 0u;
            }
            *(_OWORD *)&lhs.value = v679;
            lhs.epoch = v680;
            if (v607)
            {
              objc_msgSend_timeRange(v607, v612, v613, v614, v615);
            }
            else
            {
              long long v676 = 0u;
              long long v677 = 0u;
              long long v675 = 0u;
            }
            *(_OWORD *)&rhs.value = v675;
            rhs.epoch = v676;
            CMTimeSubtract(&v712.start, &lhs, &rhs);
            *(_OWORD *)&duration.start.value = *(_OWORD *)&v712.start.value;
            duration.start.epoch = v712.start.epoch;
            objc_msgSend_adjustDurationTo_(v607, v617, (uint64_t)&duration, v618, v619);
          }
          while (v606 < objc_msgSend_count(v12, v620, v621, v622, v623) - 1);
        }
        v624 = objc_msgSend_lastObject(v12, v602, v603, v604, v605);
        memset(&v712, 0, 24);
        int64_t v629 = objc_msgSend_duration(v7, v625, v626, v627, v628);
        CMTimeMake(&v674, v629, preferredTimescale);
        if (v624) {
          objc_msgSend_timeRange(v624, v630, v631, v632, v633);
        }
        else {
          memset(&v672, 0, sizeof(v672));
        }
        CMTime v673 = v672;
        CMTimeSubtract(&v712.start, &v674, &v673);
        *(_OWORD *)&duration.start.value = *(_OWORD *)&v712.start.value;
        duration.start.epoch = v712.start.epoch;
        objc_msgSend_adjustDurationTo_(v624, v634, (uint64_t)&duration, v635, v636);
      }
      id v69 = v12;

      goto LABEL_134;
    }
    uint64_t v647 = *(void *)v693;
    uint64_t v484 = -1;
    v662 = v317;
LABEL_87:
    uint64_t v485 = 0;
    while (1)
    {
      if (*(void *)v693 != v647) {
        objc_enumerationMutation(v663);
      }
      uint64_t v658 = v485;
      v486 = *(void **)(*((void *)&v692 + 1) + 8 * v485);
      v487 = objc_msgSend_lastObject(v663, v480, v481, v482, v483);
      if (objc_msgSend_isEqualToNumber_(v486, v488, (uint64_t)v487, v489, v490))
      {
        objc_msgSend_numberWithDouble_(NSNumber, v491, v492, v493, v494, v117 / v118);
      }
      else
      {
        uint64_t v495 = objc_msgSend_indexOfObject_(v663, v491, (uint64_t)v486, v493, v494);
        objc_msgSend_objectAtIndexedSubscript_(v663, v496, v495 + 1, v497, v498);
      v499 = };

      if (v656 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_objectAtIndexedSubscript_(v654, v500, v656, v502, v503),
            (uint64_t v504 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        ++v484;
      }
      else
      {
        v505 = (void *)v504;
        objc_msgSend_doubleValue(v486, v500, v501, v502, v503);
        double v507 = v506;
        objc_msgSend_doubleValue(v505, v508, v509, v510, v511);
        if (v507 >= v516)
        {
          uint64_t v596 = v656 + 1 < (unint64_t)objc_msgSend_count(v654, v512, v513, v514, v515)
               ? v656 + 1
               : 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v656 = v596;

          uint64_t v484 = 0;
        }
        else
        {
          ++v484;
        }
      }
      v517 = objc_msgSend_summary(v7, v500, v501, v502, v503);
      v522 = objc_msgSend_allBeats(v517, v518, v519, v520, v521);

      v689[0] = MEMORY[0x263EF8330];
      v689[1] = 3221225472;
      v689[2] = sub_217A38764;
      v689[3] = &unk_2642B7020;
      id v523 = v499;
      id v690 = v523;
      v691 = v486;
      v657 = objc_msgSend_indexesOfObjectsPassingTest_(v522, v524, (uint64_t)v689, v525, v526);
      v530 = objc_msgSend_objectsAtIndexes_(v522, v527, (uint64_t)v657, v528, v529);
      v534 = objc_msgSend_sortedArrayUsingSelector_(v530, v531, (uint64_t)v71, v532, v533);

      v659 = v534;
      if (objc_msgSend_isEqualToString_(v5, v535, @"FMTimedMetadataIdentifierBar", v536, v537))break; {
      v317 = v662;
      }
      if (objc_msgSend_isEqualToString_(v5, v538, @"FMTimedMetadataIdentifierBeat", v540, v541))
      {
        long long v686 = 0u;
        long long v687 = 0u;
        long long v684 = 0u;
        long long v685 = 0u;
        id v556 = v659;
        uint64_t v569 = objc_msgSend_countByEnumeratingWithState_objects_count_(v556, v568, (uint64_t)&v684, (uint64_t)v723, 16);
        if (v569)
        {
          uint64_t v573 = v569;
          id v653 = v523;
          v646 = v522;
          uint64_t v574 = 0;
          uint64_t v575 = *(void *)v685;
          do
          {
            for (uint64_t n = 0; n != v573; ++n)
            {
              if (*(void *)v685 != v575) {
                objc_enumerationMutation(v556);
              }
              v577 = *(void **)(*((void *)&v684 + 1) + 8 * n);
              v721[0] = @"BarIndex";
              v578 = objc_msgSend_numberWithInteger_(NSNumber, v570, v484, v571, v572);
              v722[0] = v578;
              v721[1] = @"BeatIndex";
              v582 = objc_msgSend_numberWithInteger_(NSNumber, v579, v574 + n, v580, v581);
              v722[1] = v582;
              v584 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v583, (uint64_t)v722, (uint64_t)v721, 2);

              memset(&v712, 0, sizeof(v712));
              objc_msgSend_doubleValue(v577, v585, v586, v587, v588);
              CMTimeMakeWithSeconds(&v683, v589, preferredTimescale);
              *(_OWORD *)&duration.start.value = *MEMORY[0x263F010E0];
              duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
              CMTimeRangeMake(&v712, &v683, &duration.start);
              v590 = [FMTimedMetadataItem alloc];
              duratiouint64_t n = v712;
              v592 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v590, v591, @"FMTimedMetadataIdentifierBeat", @"beat", (uint64_t)&duration, v584);
              objc_msgSend_addObject_(v670, v593, (uint64_t)v592, v594, v595);
            }
            uint64_t v573 = objc_msgSend_countByEnumeratingWithState_objects_count_(v556, v570, (uint64_t)&v684, (uint64_t)v723, 16);
            v574 += n;
          }
          while (v573);
          id v7 = v644;
          id v5 = v645;
          v71 = sel_compare_;
          v317 = v662;
          v522 = v646;
          id v523 = v653;
        }
        goto LABEL_109;
      }
LABEL_110:

      uint64_t v485 = v658 + 1;
      if (v658 + 1 == v650)
      {
        uint64_t v597 = objc_msgSend_countByEnumeratingWithState_objects_count_(v663, v480, (uint64_t)&v692, (uint64_t)v726, 16);
        uint64_t v650 = v597;
        if (!v597) {
          goto LABEL_117;
        }
        goto LABEL_87;
      }
    }
    uint64_t v542 = objc_msgSend_count(v534, v538, v539, v540, v541);
    v724[0] = @"BarIndex";
    id v652 = v523;
    v543 = v71;
    id v544 = v5;
    id v545 = v7;
    v546 = v522;
    v550 = objc_msgSend_numberWithInteger_(NSNumber, v547, v484, v548, v549);
    v725[0] = v550;
    v724[1] = @"BeatsPerBar";
    v554 = objc_msgSend_numberWithInteger_(NSNumber, v551, v542, v552, v553);
    v725[1] = v554;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v555, (uint64_t)v725, (uint64_t)v724, 2);
    id v556 = (id)objc_claimAutoreleasedReturnValue();

    memset(&v712, 0, sizeof(v712));
    objc_msgSend_doubleValue(v486, v557, v558, v559, v560);
    CMTimeMakeWithSeconds(&v688, v561, preferredTimescale);
    *(_OWORD *)&duration.start.value = *MEMORY[0x263F010E0];
    duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
    CMTimeRangeMake(&v712, &v688, &duration.start);
    v562 = [FMTimedMetadataItem alloc];
    duratiouint64_t n = v712;
    v564 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v562, v563, @"FMTimedMetadataIdentifierBar", @"bar", (uint64_t)&duration, v556);
    objc_msgSend_addObject_(v670, v565, (uint64_t)v564, v566, v567);

    v522 = v546;
    id v7 = v545;
    id v5 = v544;
    v71 = v543;
    id v523 = v652;
    v317 = v662;
LABEL_109:

    goto LABEL_110;
  }
  id v69 = (id)MEMORY[0x263EFFA68];
LABEL_134:

LABEL_135:
  return v69;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
  uint64_t v427 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v421.receiver = self;
  v421.super_class = (Class)FlexMLSong;
  CMTime v420 = *(CMTime *)a4;
  if ([(FlexSongBackend *)&v421 verifyRendition:v8 forDuration:&v420 failureReason:a5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = objc_msgSend_trackA(v8, v9, v10, v11, v12);
      uint64_t v18 = objc_msgSend_mixParameters(v13, v14, v15, v16, v17);
      $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = objc_msgSend_volumeKeyFrames(v18, v19, v20, v21, v22);
      uint64_t v28 = objc_msgSend_lastObject(v23, v24, v25, v26, v27);
      uint64_t v33 = objc_msgSend_sampleTime(v28, v29, v30, v31, v32);

      uint64_t v38 = objc_msgSend_trackB(v8, v34, v35, v36, v37);
      uint64_t v43 = objc_msgSend_mixParameters(v38, v39, v40, v41, v42);
      uint64_t v48 = objc_msgSend_volumeKeyFrames(v43, v44, v45, v46, v47);
      uint64_t v53 = objc_msgSend_lastObject(v48, v49, v50, v51, v52);
      uint64_t v58 = objc_msgSend_sampleTime(v53, v54, v55, v56, v57);

      if (v33 <= v58) {
        uint64_t v33 = v58;
      }
      if (v33 <= objc_msgSend_duration(v8, v59, v60, v61, v62))
      {
        v396 = a5;
        uint64_t v88 = objc_msgSend_trackA(v8, v63, v64, v65, v66);
        uint64_t v93 = objc_msgSend_clips(v88, v89, v90, v91, v92);
        uint64_t v98 = objc_msgSend_lastObject(v93, v94, v95, v96, v97);
        uint64_t v103 = objc_msgSend_position(v98, v99, v100, v101, v102);
        double v108 = objc_msgSend_trackA(v8, v104, v105, v106, v107);
        uint64_t v113 = objc_msgSend_clips(v108, v109, v110, v111, v112);
        double v118 = objc_msgSend_lastObject(v113, v114, v115, v116, v117);
        uint64_t v123 = objc_msgSend_duration(v118, v119, v120, v121, v122) + v103;

        BOOL v128 = objc_msgSend_trackB(v8, v124, v125, v126, v127);
        uint64_t v133 = objc_msgSend_clips(v128, v129, v130, v131, v132);
        uint64_t v138 = objc_msgSend_lastObject(v133, v134, v135, v136, v137);
        uint64_t v143 = objc_msgSend_position(v138, v139, v140, v141, v142);
        v148 = objc_msgSend_trackB(v8, v144, v145, v146, v147);
        uint64_t v153 = objc_msgSend_clips(v148, v149, v150, v151, v152);
        v158 = objc_msgSend_lastObject(v153, v154, v155, v156, v157);
        uint64_t v163 = objc_msgSend_duration(v158, v159, v160, v161, v162) + v143;

        if (v123 <= v163) {
          uint64_t v168 = v163;
        }
        else {
          uint64_t v168 = v123;
        }
        if (v168 == objc_msgSend_duration(v8, v164, v165, v166, v167))
        {
          v172 = objc_msgSend_timedMetadataItemsWithIdentifier_(v8, v169, @"FMTimedMetadataIdentifierLoopPoints", v170, v171);
          v177 = v172;
          double v178 = v396;
          if (v172 && objc_msgSend_count(v172, v173, v174, v175, v176))
          {
            memset(&v420, 0, sizeof(v420));
            v179 = objc_msgSend_idealDurations(self, v173, v174, v175, v176);
            uint64_t v184 = objc_msgSend_lastObject(v179, v180, v181, v182, v183);
            v189 = v184;
            if (v184) {
              objc_msgSend_CMTimeValue(v184, v185, v186, v187, v188);
            }
            else {
              memset(&v420, 0, sizeof(v420));
            }

            FlexLogForCategory(1uLL);
            v203 = (char *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v203, OS_LOG_TYPE_DEBUG)) {
              sub_217A39AE4(v177, v203, v204, v205, v206);
            }

            uint64_t v211 = objc_msgSend_count(v177, v207, v208, v209, v210);
            CMTime time = v420;
            CMTimeMultiply(&v419, &time, v211);
            CMTimeValue value = v419.value;
            if (value > objc_msgSend_duration(v8, v213, v214, v215, v216))
            {
              uint64_t v217 = NSString;
              uint64_t v218 = objc_msgSend_numberWithInt_(NSNumber, v173, v211, v175, v176);
              uint64_t v222 = objc_msgSend_numberWithLongLong_(NSNumber, v219, v420.value, v220, v221);
              uint64_t v223 = NSNumber;
              uint64_t v228 = objc_msgSend_duration(v8, v224, v225, v226, v227);
              uint64_t v232 = objc_msgSend_numberWithLongLong_(v223, v229, v228, v230, v231);
              objc_msgSend_stringWithFormat_(v217, v233, @"Expected that the number of loops detected (%@) * the max duration detected from the idealDurations.lastObject (%@) is <= the rendition.duration (%@)", v234, v235, v218, v222, v232);
              id *v396 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          uint64_t v236 = objc_msgSend_summary(v8, v173, v174, v175, v176);
          long long v414 = 0u;
          long long v415 = 0u;
          long long v416 = 0u;
          long long v417 = 0u;
          uint64_t v241 = objc_msgSend_segments(v236, v237, v238, v239, v240);
          uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v242, (uint64_t)&v414, (uint64_t)v426, 16);
          uint64_t v395 = v177;
          if (v243)
          {
            uint64_t v248 = *(void *)v415;
            uint64_t v393 = v241;
            uint64_t v386 = *(void *)v415;
            do
            {
              uint64_t v249 = 0;
              uint64_t v388 = v243;
              do
              {
                if (*(void *)v415 != v248) {
                  objc_enumerationMutation(v241);
                }
                uint64_t v390 = v249;
                v250 = *(void **)(*((void *)&v414 + 1) + 8 * v249);
                long long v410 = 0u;
                long long v411 = 0u;
                long long v412 = 0u;
                long long v413 = 0u;
                v251 = objc_msgSend_gainFunction(v250, v244, v245, v246, v247);
                uint64_t v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v251, v252, (uint64_t)&v410, (uint64_t)v425, 16);
                if (!v253) {
                  goto LABEL_41;
                }
                uint64_t v258 = v253;
                uint64_t v259 = *(void *)v411;
                v392 = v236;
                while (2)
                {
                  uint64_t v260 = 0;
                  uint64_t v397 = v258;
                  do
                  {
                    if (*(void *)v411 != v259) {
                      objc_enumerationMutation(v251);
                    }
                    v261 = *(void **)(*((void *)&v410 + 1) + 8 * v260);
                    objc_msgSend_gain(v261, v254, v255, v256, v257);
                    float v263 = v262;
                    double v264 = v262;
                    if (v262 < 1.0 && v264 > 1.0e-13)
                    {
                      Float64 v265 = objc_msgSend_gainFunction(v250, v254, v255, v256, v257);
                      v270 = objc_msgSend_firstObject(v265, v266, v267, v268, v269);
                      if (objc_msgSend_isEqual_(v261, v271, (uint64_t)v270, v272, v273))
                      {

LABEL_53:
                        objc_msgSend_stringWithFormat_(NSString, v254, @"Expected a gain value of 0.00000000000001 or 1 for the first and last object in the gainFunction but found %f", v256, v257, *(void *)&v264);
LABEL_54:
                        BOOL v82 = 0;
                        uint64_t v68 = v395;
                        id *v396 = (id)objc_claimAutoreleasedReturnValue();
                        uint64_t v236 = v392;
                        v308 = v393;
                        goto LABEL_84;
                      }
                      objc_msgSend_gainFunction(v250, v274, v275, v276, v277);
                      v278 = v251;
                      id v279 = v8;
                      v281 = uint64_t v280 = v250;
                      v286 = objc_msgSend_lastObject(v281, v282, v283, v284, v285);
                      char isEqual = objc_msgSend_isEqual_(v261, v287, (uint64_t)v286, v288, v289);

                      v250 = v280;
                      id v8 = v279;
                      v251 = v278;
                      uint64_t v258 = v397;

                      if (isEqual) {
                        goto LABEL_53;
                      }
                    }
                    if (v263 < 0.0)
                    {
                      objc_msgSend_stringWithFormat_(NSString, v254, @"Expected a gain value of >= 0 but found: %f", v256, v257, *(void *)&v264);
                      goto LABEL_54;
                    }
                    ++v260;
                  }
                  while (v258 != v260);
                  uint64_t v258 = objc_msgSend_countByEnumeratingWithState_objects_count_(v251, v254, (uint64_t)&v410, (uint64_t)v425, 16);
                  uint64_t v236 = v392;
                  if (v258) {
                    continue;
                  }
                  break;
                }
LABEL_41:

                int64_t v295 = objc_msgSend_gainFunction(v250, v291, v292, v293, v294);
                v251 = objc_msgSend_lastObject(v295, v296, v297, v298, v299);

                memset(&v420, 0, sizeof(v420));
                if (v251) {
                  objc_msgSend_segmentTime(v251, v300, v301, v302, v303);
                }
                double v178 = v396;
                if (v250) {
                  objc_msgSend_duration(v250, v300, v301, v302, v303);
                }
                else {
                  memset(&time2, 0, sizeof(time2));
                }
                uint64_t v68 = v395;
                CMTime time = v420;
                if (CMTimeCompare(&time, &time2))
                {
                  uint64_t v374 = NSString;
                  CMTime time = v420;
                  Float64 Seconds = CMTimeGetSeconds(&time);
                  if (v250) {
                    objc_msgSend_duration(v250, v375, v376, v377, v378);
                  }
                  else {
                    memset(&v408, 0, sizeof(v408));
                  }
                  v308 = v393;
                  Float64 v380 = CMTimeGetSeconds(&v408);
                  objc_msgSend_stringWithFormat_(v374, v381, @"The last segmentTime value (%f) in the gain function must match that of the segment duration (%f).", v382, v383, *(void *)&Seconds, *(void *)&v380);
                  BOOL v82 = 0;
                  id *v396 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_84;
                }

                uint64_t v249 = v390 + 1;
                uint64_t v241 = v393;
                uint64_t v248 = v386;
              }
              while (v390 + 1 != v388);
              uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v393, v244, (uint64_t)&v414, (uint64_t)v426, 16);
            }
            while (v243);
          }

          v308 = objc_msgSend_videoCues(v236, v304, v305, v306, v307);
          v313 = objc_msgSend_allBars(v236, v309, v310, v311, v312);

          if (v313)
          {
            uint64_t v318 = objc_msgSend_allBars(v236, v314, v315, v316, v317);
          }
          else
          {
            uint64_t v318 = MEMORY[0x263EFFA68];
          }
          v319 = objc_msgSend_allBeats(v236, v314, v315, v316, v317);

          if (v319)
          {
            uint64_t v324 = objc_msgSend_allBeats(v236, v320, v321, v322, v323);
          }
          else
          {
            uint64_t v324 = MEMORY[0x263EFFA68];
          }
          uint64_t v325 = objc_msgSend_objectForKeyedSubscript_(v308, v320, @"fadeToBlack", v322, v323);
          uint64_t v329 = objc_msgSend_objectForKeyedSubscript_(v308, v326, @"goodCues", v327, v328);
          v337 = objc_msgSend_objectForKeyedSubscript_(v308, v330, @"greatCues", v331, v332);
          uint64_t v387 = (void *)v325;
          if (v236) {
            objc_msgSend_duration(v236, v333, v334, v335, v336);
          }
          else {
            memset(&v407, 0, sizeof(v407));
          }
          double v338 = CMTimeGetSeconds(&v407);
          long long v403 = 0u;
          long long v404 = 0u;
          long long v405 = 0u;
          long long v406 = 0u;
          uint64_t v389 = (void *)v324;
          double v391 = (void *)v318;
          v423[0] = v318;
          v423[1] = v324;
          uint64_t v398 = (void *)v329;
          v423[2] = v329;
          v423[3] = v337;
          v341 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v339, (uint64_t)v423, 4, v340);
          uint64_t v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v342, (uint64_t)&v403, (uint64_t)v424, 16);
          if (v343)
          {
            uint64_t v344 = v343;
            uint64_t v345 = *(void *)v404;
            uint64_t v394 = v308;
            uint64_t v384 = *(void *)v404;
            double v385 = v337;
            do
            {
              uint64_t v346 = 0;
              do
              {
                uint64_t v347 = v236;
                if (*(void *)v404 != v345) {
                  objc_enumerationMutation(v341);
                }
                uint64_t v348 = *(void **)(*((void *)&v403 + 1) + 8 * v346);
                long long v399 = 0u;
                long long v400 = 0u;
                long long v401 = 0u;
                long long v402 = 0u;
                id v349 = v348;
                uint64_t v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v349, v350, (uint64_t)&v399, (uint64_t)v422, 16);
                if (v351)
                {
                  uint64_t v356 = v351;
                  uint64_t v357 = *(void *)v400;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v356; ++i)
                    {
                      if (*(void *)v400 != v357) {
                        objc_enumerationMutation(v349);
                      }
                      uint64_t v359 = *(void **)(*((void *)&v399 + 1) + 8 * i);
                      objc_msgSend_floatValue(v359, v352, v353, v354, v355);
                      if (v338 < v360)
                      {
                        objc_msgSend_floatValue(v359, v352, v353, v354, v355);
                        if (vabdd_f64(v361, v338) > 0.001)
                        {
                          objc_msgSend_stringWithFormat_(NSString, v352, @"All video cue values should be < the summary.duration (%f).", v354, v355, *(void *)&v338);
                          id *v396 = (id)objc_claimAutoreleasedReturnValue();

                          BOOL v82 = 0;
                          uint64_t v236 = v347;
                          v308 = v394;
                          uint64_t v68 = v395;
                          int v372 = v389;
                          v251 = v391;
                          v337 = v385;
                          Float64 v363 = v387;
                          goto LABEL_83;
                        }
                      }
                    }
                    uint64_t v356 = objc_msgSend_countByEnumeratingWithState_objects_count_(v349, v352, (uint64_t)&v399, (uint64_t)v422, 16);
                    if (v356) {
                      continue;
                    }
                    break;
                  }
                }

                ++v346;
                double v178 = v396;
                uint64_t v236 = v347;
                v308 = v394;
                uint64_t v345 = v384;
                v337 = v385;
              }
              while (v346 != v344);
              uint64_t v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v362, (uint64_t)&v403, (uint64_t)v424, 16);
            }
            while (v344);
          }

          Float64 v363 = v387;
          objc_msgSend_floatValue(v387, v364, v365, v366, v367);
          if (v338 >= v371)
          {
            BOOL v82 = 1;
          }
          else
          {
            objc_msgSend_stringWithFormat_(NSString, v368, @"Fade to black value should be < the summary.duration (%f).", v369, v370, *(void *)&v338);
            BOOL v82 = 0;
            *double v178 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v68 = v395;
          int v372 = v389;
          v251 = v391;
LABEL_83:

LABEL_84:
          goto LABEL_85;
        }
        uint64_t v190 = NSString;
        uint64_t v68 = objc_msgSend_numberWithLongLong_(NSNumber, v169, v168, v170, v171);
        uint64_t v191 = NSNumber;
        uint64_t v196 = objc_msgSend_duration(v8, v192, v193, v194, v195);
        uint64_t v78 = objc_msgSend_numberWithLongLong_(v191, v197, v196, v198, v199);
        objc_msgSend_stringWithFormat_(v190, v200, @"The last clip's end time of %@ should equal the rendition's duration in seconds: %@. Here we are assuming that clips are using a timescale of 'sampleRate'.", v201, v202, v68, v78);
        id *v396 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v67 = NSString;
        uint64_t v68 = objc_msgSend_numberWithLongLong_(NSNumber, v63, v33, v65, v66);
        id v69 = NSNumber;
        uint64_t v74 = objc_msgSend_duration(v8, v70, v71, v72, v73);
        uint64_t v78 = objc_msgSend_numberWithLongLong_(v69, v75, v74, v76, v77);
        objc_msgSend_stringWithFormat_(v67, v79, @"Final keyframe sampleTime: %@ must be less or equal to the rendition's duration: %@", v80, v81, v68, v78);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      BOOL v82 = 0;
    }
    else
    {
      uint64_t v83 = NSString;
      uint64_t v84 = (objc_class *)objc_opt_class();
      uint64_t v68 = NSStringFromClass(v84);
      objc_msgSend_stringWithFormat_(v83, v85, @"Expected a FlexMLSongRendition but got a %@.", v86, v87, v68);
      BOOL v82 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_85:

    goto LABEL_86;
  }
  BOOL v82 = 0;
LABEL_86:

  return v82;
}

- (id)idealDurations
{
  id v5 = objc_msgSend__summaryManager(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_allSummaryDurations(v5, v6, v7, v8, v9);

  return v10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  p_var3 = &self[5].var3;
  if ((self[6].var0 & 0x100000000) == 0)
  {
    uint64_t v7 = self;
    uint64_t v8 = objc_msgSend_existingAssetWithID_(self, a3, @"FMSongBundleAssetID", v3, v4);
    uint64_t v13 = objc_msgSend_localURL(v8, v9, v10, v11, v12);

    if (v13)
    {
      uint64_t v74 = v8;
      uint64_t v18 = objc_msgSend_localURL(v8, v14, v15, v16, v17);
      $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = objc_msgSend_path(v18, v19, v20, v21, v22);

      uint64_t v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v24, v25, v26, v27);
      id v79 = 0;
      uint64_t v31 = objc_msgSend_contentsOfDirectoryAtPath_error_(v28, v29, (uint64_t)v23, (uint64_t)&v79, v30);
      id v32 = v79;

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v33 = v31;
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v75, (uint64_t)v86, 16);
      uint64_t v40 = v33;
      if (v35)
      {
        uint64_t v41 = v35;
        uint64_t v72 = retstr;
        id v73 = v32;
        uint64_t v71 = v23;
        uint64_t v42 = *(void *)v76;
LABEL_5:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v76 != v42) {
            objc_enumerationMutation(v33);
          }
          uint64_t v44 = *(void **)(*((void *)&v75 + 1) + 8 * v43);
          uint64_t v45 = objc_msgSend_pathExtension(v44, v36, v37, v38, v39, v71);
          uint64_t v50 = objc_msgSend_audioFileExtension(v7, v46, v47, v48, v49);
          char isEqualToString = objc_msgSend_isEqualToString_(v45, v51, (uint64_t)v50, v52, v53);

          if (isEqualToString) {
            break;
          }
          if (v41 == ++v43)
          {
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v75, (uint64_t)v86, 16);
            if (v41) {
              goto LABEL_5;
            }
            uint64_t v40 = v33;
            $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = v71;
            retstr = v72;
            id v32 = v73;
            goto LABEL_21;
          }
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = v71;
        uint64_t v40 = objc_msgSend_stringByAppendingPathComponent_(v71, v36, (uint64_t)v44, v38, v39);

        retstr = v72;
        id v32 = v73;
        if (!v40) {
          goto LABEL_22;
        }
        objc_msgSend_fileURLWithPath_(NSURL, v55, (uint64_t)v40, v56, v57);
        CFURLRef v58 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        ExtAudioFileRef outExtAudioFile = 0;
        if (ExtAudioFileOpenURL(v58, &outExtAudioFile)) {
          BOOL v59 = 1;
        }
        else {
          BOOL v59 = outExtAudioFile == 0;
        }
        if (!v59)
        {
          uint64_t v83 = 0;
          long long outPropertyData = 0u;
          long long v82 = 0u;
          UInt32 ioPropertyDataSize = 40;
          if (ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, &outPropertyData)
            || (double v60 = *(double *)&outPropertyData,
                int64_t v80 = 0,
                UInt32 ioPropertyDataSize = 8,
                ExtAudioFileGetProperty(outExtAudioFile, 0x2366726Du, &ioPropertyDataSize, &v80)))
          {
            ExtAudioFileDispose(outExtAudioFile);
          }
          else
          {
            int64_t v61 = v80;
            ExtAudioFileDispose(outExtAudioFile);
            objc_msgSend_updateSampleRate_(v7, v62, (uint64_t)v60, v63, v64);
            int32_t v69 = objc_msgSend_sampleRate(v7, v65, v66, v67, v68);
            int64_t v70 = v61;
            id v32 = v73;
            CMTimeMake((CMTime *)&outPropertyData, v70, v69);
            *(_OWORD *)p_var3 = outPropertyData;
            p_var3[2] = v82;
          }
        }
      }
LABEL_21:

LABEL_22:
      uint64_t v8 = v74;
    }
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var3;
  retstr->var3 = p_var3[2];
  return self;
}

- (NSURL)audioFileURL
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_existingAssetWithID_(self, a2, @"FMSongBundleAssetID", v2, v3);
  uint64_t v10 = objc_msgSend_localURL(v5, v6, v7, v8, v9);

  if (v10)
  {
    uint64_t v15 = objc_msgSend_localURL(v5, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_path(v15, v16, v17, v18, v19);

    uint64_t v25 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v21, v22, v23, v24);
    id v63 = 0;
    uint64_t v28 = objc_msgSend_contentsOfDirectoryAtPath_error_(v25, v26, (uint64_t)v20, (uint64_t)&v63, v27);
    id v29 = v63;

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v30 = v28;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v59, (uint64_t)v64, 16);
    if (v32)
    {
      uint64_t v37 = v32;
      id v57 = v29;
      CFURLRef v58 = v20;
      uint64_t v38 = *(void *)v60;
LABEL_4:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v60 != v38) {
          objc_enumerationMutation(v30);
        }
        uint64_t v40 = *(void **)(*((void *)&v59 + 1) + 8 * v39);
        uint64_t v41 = objc_msgSend_pathExtension(v40, v33, v34, v35, v36, v57);
        uint64_t v46 = objc_msgSend_audioFileExtension(self, v42, v43, v44, v45);
        char isEqualToString = objc_msgSend_isEqualToString_(v41, v47, (uint64_t)v46, v48, v49);

        if (isEqualToString) {
          break;
        }
        if (v37 == ++v39)
        {
          uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v59, (uint64_t)v64, 16);
          if (v37) {
            goto LABEL_4;
          }
          uint64_t v51 = 0;
          uint64_t v52 = v30;
          uint64_t v20 = v58;
          goto LABEL_13;
        }
      }
      uint64_t v20 = v58;
      uint64_t v52 = objc_msgSend_stringByAppendingPathComponent_(v58, v33, (uint64_t)v40, v35, v36);

      if (v52)
      {
        uint64_t v51 = objc_msgSend_fileURLWithPath_(NSURL, v53, (uint64_t)v52, v54, v55);
LABEL_13:
        id v29 = v57;
        goto LABEL_16;
      }
      uint64_t v51 = 0;
      id v29 = v57;
    }
    else
    {
      uint64_t v51 = 0;
      uint64_t v52 = v30;
LABEL_16:
    }
  }
  else
  {
    uint64_t v51 = 0;
  }

  return (NSURL *)v51;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  objc_msgSend__summaryManager(self, a3, v3, v4, v5);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_allSummaryDurations(v22, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_firstObject(v11, v12, v13, v14, v15);

  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (v16) {
    objc_msgSend_CMTimeValue(v16, v17, v18, v19, v20);
  }

  return result;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)metadataPath
{
  return self->_metadataPath;
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (void)setAudioFileExtension:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedNaturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setCachedNaturalDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_cachedNaturalDuration.CMTimeValue value = *(_OWORD *)&a3->var0;
  self->_cachedNaturalDuration.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_metadataPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end