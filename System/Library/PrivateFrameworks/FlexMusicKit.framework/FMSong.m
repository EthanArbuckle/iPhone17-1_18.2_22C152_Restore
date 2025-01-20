@interface FMSong
+ (BOOL)hasValidTagIDs:(id)a3;
+ (NSArray)availableTagIDs;
+ (id)loadSongBundleAtPath:(id)a3;
+ (id)loadSongsAndArtworkInFolderAtPath:(id)a3;
+ (id)localizedNameForTagWithID:(id)a3;
+ (int64_t)versionFromArtworkFilename:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- (BOOL)_loadFlexSong;
- (BOOL)canPlay;
- (BOOL)hidden;
- (BOOL)isClientManaged;
- (BOOL)isLoaded;
- (BOOL)recalled;
- (FMSong)initWithBackend:(id)a3;
- (FMSong)initWithUID:(id)a3 assets:(id)a4 metadata:(id)a5;
- (FlexSongProtocol)backend;
- (NSDictionary)weightedKeywords;
- (NSString)audioEncoderPresetName;
- (NSString)songFormat;
- (NSString)uid;
- (id)_impl;
- (id)artistName;
- (id)assetWithID:(id)a3;
- (id)customOptions;
- (id)description;
- (id)existingAssetWithID:(id)a3;
- (id)idealDurations;
- (id)keywords;
- (id)renditionForDuration:(id *)a3 withOptions:(id)a4;
- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)songName;
- (id)tagIDs;
- (int64_t)metadataVersion;
- (int64_t)sampleRate;
- (void)_loadIfNeeded;
- (void)_notifySongAssetsChanged;
- (void)cancelDownloadOfAllAssetsWithIDs:(id)a3;
- (void)requestDownloadOfAllAssetsWithIDs:(id)a3;
- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4;
- (void)updateAsset:(id)a3 downloadProgress:(double)a4 error:(id)a5;
- (void)updateAssets:(id)a3;
- (void)updateBackend:(id)a3;
@end

@implementation FMSong

- (FMSong)initWithUID:(id)a3 assets:(id)a4 metadata:(id)a5
{
  uint64_t v305 = *MEMORY[0x263EF8340];
  id v285 = a3;
  id v7 = a4;
  id v286 = a5;
  v288 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  v287 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v12, (uint64_t)v7, v13, v14);
  long long v298 = 0u;
  long long v299 = 0u;
  long long v300 = 0u;
  long long v301 = 0u;
  obuint64_t j = v7;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v298, (uint64_t)v304, 16);
  if (!v16)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_23;
  }
  uint64_t v21 = v16;
  v22 = 0;
  v23 = 0;
  uint64_t v24 = *(void *)v299;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v299 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v298 + 1) + 8 * i);
      if (v22
        || (objc_msgSend_assetID(*(void **)(*((void *)&v298 + 1) + 8 * i), v17, v18, v19, v20),
            v27 = v23,
            v28 = objc_claimAutoreleasedReturnValue(),
            int v32 = objc_msgSend_isEqualToString_(v28, v29, @"FMSongArtworkAssetID", v30, v31),
            v28,
            v23 = v27,
            !v32))
      {
        if (v23) {
          continue;
        }
        v33 = objc_msgSend_assetID(v26, v17, v18, v19, v20);
        int isEqualToString = objc_msgSend_isEqualToString_(v33, v34, @"FMSongBundleAssetID", v35, v36);

        if (isEqualToString
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) <= 4
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) >= 1)
        {
          v27 = v26;
          goto LABEL_16;
        }
        v23 = 0;
      }
      else
      {
        if (objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) <= 4
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) > 0)
        {
          v22 = v26;
LABEL_16:
          id v38 = v26;
          objc_msgSend_removeObject_(v287, v39, (uint64_t)v38, v40, v41);
          objc_msgSend_addObject_(v288, v42, (uint64_t)v38, v43, v44);
          v23 = v27;
          continue;
        }
        v22 = 0;
      }
    }
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v298, (uint64_t)v304, 16);
  }
  while (v21);
LABEL_23:

  v53 = v285;
  v54 = v286;
  v284 = v23;
  if (objc_msgSend_count(v287, v45, v46, v47, v48))
  {
    v55 = FlexLogForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_217A3E928();
    }

    v23 = v284;
  }
  if (!v23)
  {
    v69 = [FlexSongProxy alloc];
    v74 = objc_msgSend_set(MEMORY[0x263EFFA08], v70, v71, v72, v73);
    v79 = objc_msgSend_set(MEMORY[0x263EFFA08], v75, v76, v77, v78);
    v84 = objc_msgSend_dictionary(NSDictionary, v80, v81, v82, v83);
    v60 = objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v69, v85, (uint64_t)v285, (uint64_t)&stru_26C7FED08, (uint64_t)&stru_26C7FED08, v74, v79, v84, 0, v288, &stru_26C7FED08, 1, &stru_26C7FED08);

    if (!v286) {
      goto LABEL_64;
    }
    goto LABEL_35;
  }
  v56 = objc_msgSend_localURL(v23, v49, v50, v51, v52);
  v60 = objc_msgSend_backendForSongBundleURL_(FlexUtilities, v57, (uint64_t)v56, v58, v59);

  if (!v60)
  {
    v64 = FlexLogForCategory(0);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_217A3E8F4();
    }
  }
  objc_msgSend_updateAssets_(v60, v61, (uint64_t)v288, v62, v63);
  if (v286)
  {
LABEL_35:
    v282 = v60;
    v86 = objc_msgSend_set(MEMORY[0x263EFF9C0], v65, v66, v67, v68);
    long long v294 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    long long v297 = 0u;
    v91 = objc_msgSend_genres(v286, v87, v88, v89, v90);
    uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v294, (uint64_t)v303, 16);
    if (v93)
    {
      uint64_t v97 = v93;
      uint64_t v98 = *(void *)v295;
      do
      {
        for (uint64_t j = 0; j != v97; ++j)
        {
          if (*(void *)v295 != v98) {
            objc_enumerationMutation(v91);
          }
          v100 = objc_msgSend_stringWithFormat_(NSString, v94, @"%@%@", v95, v96, @"Genre_", *(void *)(*((void *)&v294 + 1) + 8 * j));
          objc_msgSend_addObject_(v86, v101, (uint64_t)v100, v102, v103);
        }
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v94, (uint64_t)&v294, (uint64_t)v303, 16);
      }
      while (v97);
    }

    v108 = objc_msgSend_mood(v286, v104, v105, v106, v107);
    uint64_t v113 = objc_msgSend_length(v108, v109, v110, v111, v112);

    if (v113)
    {
      v118 = NSString;
      v119 = objc_msgSend_mood(v286, v114, v115, v116, v117);
      v123 = objc_msgSend_stringWithFormat_(v118, v120, @"%@%@", v121, v122, @"Mood_", v119);
      objc_msgSend_addObject_(v86, v124, (uint64_t)v123, v125, v126);
    }
    v127 = objc_msgSend_moodAlt(v286, v114, v115, v116, v117);
    uint64_t v132 = objc_msgSend_length(v127, v128, v129, v130, v131);

    if (v132)
    {
      v137 = NSString;
      v138 = objc_msgSend_moodAlt(v286, v133, v134, v135, v136);
      v142 = objc_msgSend_stringWithFormat_(v137, v139, @"%@%@", v140, v141, @"MoodAlt_", v138);
      objc_msgSend_addObject_(v86, v143, (uint64_t)v142, v144, v145);
    }
    v146 = objc_msgSend_pace(v286, v133, v134, v135, v136);
    uint64_t v151 = objc_msgSend_length(v146, v147, v148, v149, v150);

    if (v151)
    {
      v156 = NSString;
      v157 = objc_msgSend_pace(v286, v152, v153, v154, v155);
      v161 = objc_msgSend_stringWithFormat_(v156, v158, @"%@%@", v159, v160, @"SongPace_", v157);
      objc_msgSend_addObject_(v86, v162, (uint64_t)v161, v163, v164);
    }
    if (objc_msgSend_style(v286, v152, v153, v154, v155) >= 1)
    {
      v169 = NSString;
      uint64_t v170 = objc_msgSend_style(v286, v165, v166, v167, v168);
      v174 = objc_msgSend_stringWithFormat_(v169, v171, @"%@%lld", v172, v173, @"Style_", v170);
      objc_msgSend_addObject_(v86, v175, (uint64_t)v174, v176, v177);
    }
    long long v292 = 0u;
    long long v293 = 0u;
    long long v290 = 0u;
    long long v291 = 0u;
    v178 = objc_msgSend_regions(v286, v165, v166, v167, v168);
    uint64_t v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v179, (uint64_t)&v290, (uint64_t)v302, 16);
    if (v180)
    {
      uint64_t v184 = v180;
      uint64_t v185 = *(void *)v291;
      do
      {
        for (uint64_t k = 0; k != v184; ++k)
        {
          if (*(void *)v291 != v185) {
            objc_enumerationMutation(v178);
          }
          v187 = objc_msgSend_stringWithFormat_(NSString, v181, @"%@%@", v182, v183, @"Region_", *(void *)(*((void *)&v290 + 1) + 8 * k));
          objc_msgSend_addObject_(v86, v188, (uint64_t)v187, v189, v190);
        }
        uint64_t v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v181, (uint64_t)&v290, (uint64_t)v302, 16);
      }
      while (v184);
    }

    v54 = v286;
    objc_msgSend_arousal(v286, v191, v192, v193, v194);
    if (v199 > 0.0)
    {
      v200 = NSString;
      objc_msgSend_arousal(v286, v195, v196, v197, v198);
      v205 = objc_msgSend_stringWithFormat_(v200, v201, @"%@%g", v202, v203, @"Arousal_", v204);
      objc_msgSend_addObject_(v86, v206, (uint64_t)v205, v207, v208);
    }
    objc_msgSend_valence(v286, v195, v196, v197, v198);
    v53 = v285;
    v60 = v282;
    if (v213 > 0.0)
    {
      v214 = NSString;
      objc_msgSend_valence(v286, v209, v210, v211, v212);
      v219 = objc_msgSend_stringWithFormat_(v214, v215, @"%@%g", v216, v217, @"Valence_", v218);
      objc_msgSend_addObject_(v86, v220, (uint64_t)v219, v221, v222);
    }
    objc_msgSend_visualTempo(v286, v209, v210, v211, v212);
    if (v227 > 0.0)
    {
      v228 = NSString;
      objc_msgSend_visualTempo(v286, v223, v224, v225, v226);
      v233 = objc_msgSend_stringWithFormat_(v228, v229, @"%@%g", v230, v231, @"VisualTempo_", v232);
      objc_msgSend_addObject_(v86, v234, (uint64_t)v233, v235, v236);
    }
    v237 = objc_msgSend_artistName(v286, v223, v224, v225, v226);
    v242 = objc_msgSend_songName(v286, v238, v239, v240, v241);
    v247 = objc_msgSend_keywords(v286, v243, v244, v245, v246);
    v252 = objc_msgSend_weightedKeywords(v286, v248, v249, v250, v251);
    uint64_t v257 = objc_msgSend_hidden(v286, v253, v254, v255, v256);
    LOBYTE(v281) = objc_msgSend_recalled(v286, v258, v259, v260, v261);
    objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v282, v262, (uint64_t)v237, (uint64_t)v242, (uint64_t)v86, v247, v252, v257, v281, 1);
  }
LABEL_64:
  objc_msgSend_updateUID_(v60, v65, (uint64_t)v53, v67, v68);
  v267 = objc_msgSend_uid(v60, v263, v264, v265, v266);
  char v271 = objc_msgSend_isEqualToString_(v267, v268, (uint64_t)v53, v269, v270);

  if ((v271 & 1) == 0)
  {
    v275 = FlexLogForCategory(0);
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR)) {
      sub_217A3E840((uint64_t)v53, v60, v275, v276, v277);
    }
  }
  v278 = (unsigned char *)objc_msgSend_initWithBackend_(self, v272, (uint64_t)v60, v273, v274);
  if (v278) {
    v278[8] = 1;
  }
  v279 = v278;

  return v279;
}

- (FMSong)initWithBackend:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMSong;
  v6 = [(FMSong *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_backend, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)updateBackend:(id)a3
{
  v4 = (FlexSongProtocol *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  backend = v5->_backend;
  v5->_backend = v4;

  objc_sync_exit(v5);
  objc_msgSend__notifySongAssetsChanged(v5, v7, v8, v9, v10);
}

- (void)_notifySongAssetsChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_217A3C4CC;
  block[3] = &unk_2642B6D78;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)updateAsset:(id)a3 downloadProgress:(double)a4 error:(id)a5
{
  v46[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_updateDownloadProgress_(v8, v10, v11, v12, v13, a4))
  {
    if (v9)
    {
      v45[0] = @"songUID";
      uint64_t v18 = objc_msgSend_uid(self, v14, v15, v16, v17);
      v46[0] = v18;
      v45[1] = @"assetID";
      v23 = objc_msgSend_assetID(v8, v19, v20, v21, v22);
      v46[1] = v23;
      v45[2] = @"progress";
      v28 = objc_msgSend_numberWithDouble_(NSNumber, v24, v25, v26, v27, a4);
      v45[3] = @"error";
      v46[2] = v28;
      v46[3] = v9;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v46, (uint64_t)v45, 4);
    }
    else
    {
      v43[0] = @"songUID";
      uint64_t v18 = objc_msgSend_uid(self, v14, v15, v16, v17);
      v44[0] = v18;
      v43[1] = @"assetID";
      v23 = objc_msgSend_assetID(v8, v30, v31, v32, v33);
      v44[1] = v23;
      v43[2] = @"progress";
      v28 = objc_msgSend_numberWithDouble_(NSNumber, v34, v35, v36, v37, a4);
      v44[2] = v28;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v44, (uint64_t)v43, 3);
    v39 = };

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_217A3C75C;
    block[3] = &unk_2642B71C8;
    block[4] = self;
    id v42 = v39;
    id v40 = v39;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (id)_impl
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_backend;
  objc_sync_exit(v2);

  return v3;
}

- (void)_loadIfNeeded
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((objc_msgSend_isLoaded(self, a2, v2, v3, v4) & 1) == 0
    && objc_msgSend_canPlay(self, v6, v7, v8, v9)
    && (objc_msgSend__loadFlexSong(self, v10, v11, v12, v13) & 1) == 0)
  {
    uint64_t v14 = FlexLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = self;
      _os_log_impl(&dword_217A2F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to load FlexSong _impl for song: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)_loadFlexSong
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isLoaded(self, a2, v2, v3, v4))
  {
    uint64_t v9 = FlexLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      v29 = self;
      _os_log_impl(&dword_217A2F000, v9, OS_LOG_TYPE_DEFAULT, "ERROR: _loadFlexSong: Attempting to load already loaded FlexSong for song: %@", (uint8_t *)&v28, 0xCu);
    }

    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_existingAssetWithID_(self, v6, @"FMSongBundleAssetID", v7, v8);
    LODWORD(v9) = objc_msgSend_isCloudBacked(v10, v11, v12, v13, v14);
    if (v9)
    {
      uint64_t v19 = objc_msgSend_cloudManager(v10, v15, v16, v17, v18);
      uint64_t v24 = objc_msgSend_uid(self, v20, v21, v22, v23);
      objc_msgSend_loadAssetWithID_forSongID_(v19, v25, @"FMSongBundleAssetID", (uint64_t)v24, v26);
    }
  }
  return (char)v9;
}

- (int64_t)metadataVersion
{
  id v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int64_t v10 = objc_msgSend_metadataVersion(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)canPlay
{
  id v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  char canPlay = objc_msgSend_canPlay(v5, v6, v7, v8, v9);

  return canPlay;
}

- (BOOL)isLoaded
{
  id v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  char isLoaded = objc_msgSend_isLoaded(v5, v6, v7, v8, v9);

  return isLoaded;
}

- (BOOL)hidden
{
  id v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  char v10 = objc_msgSend_hidden(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)recalled
{
  id v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  char v10 = objc_msgSend_recalled(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)uid
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_uid(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    objc_msgSend_uid(v16, v17, v18, v19, v20);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = &stru_26C7FED08;
  }

  return (NSString *)v21;
}

- (id)songName
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_songName(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    objc_msgSend_songName(v16, v17, v18, v19, v20);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = &stru_26C7FED08;
  }

  return v21;
}

- (id)artistName
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_artistName(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    objc_msgSend_artistName(v16, v17, v18, v19, v20);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = &stru_26C7FED08;
  }

  return v21;
}

- (id)tagIDs
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_tagIDs(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_tagIDs(v16, v17, v18, v19, v20);
  }
  else
  {
    uint64_t v21 = objc_msgSend_set(MEMORY[0x263EFFA08], v11, v12, v13, v14);
  }

  return v21;
}

- (NSDictionary)weightedKeywords
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_weightedKeywords(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_weightedKeywords(v16, v17, v18, v19, v20);
  }
  else
  {
    uint64_t v21 = objc_msgSend_dictionary(NSDictionary, v11, v12, v13, v14);
  }

  return (NSDictionary *)v21;
}

- (id)keywords
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_keywords(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    uint64_t v21 = objc_msgSend_keywords(v16, v17, v18, v19, v20);
  }
  else
  {
    uint64_t v21 = objc_msgSend_set(MEMORY[0x263EFFA08], v11, v12, v13, v14);
  }

  return v21;
}

- (NSString)audioEncoderPresetName
{
  v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  int v15 = objc_msgSend_audioEncoderPresetName(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    objc_msgSend_audioEncoderPresetName(v16, v17, v18, v19, v20);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = &stru_26C7FED08;
  }

  return (NSString *)v21;
}

- (int64_t)sampleRate
{
  objc_msgSend__loadIfNeeded(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend__impl(self, v6, v7, v8, v9);
  int64_t v15 = objc_msgSend_sampleRate(v10, v11, v12, v13, v14);

  return v15;
}

- (void)updateAssets:(id)a3
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v125 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6, v7);
  uint64_t v126 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v8, (uint64_t)v3, v9, v10);
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  obuint64_t j = v3;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v132, (uint64_t)v137, 16);
  if (!v12)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_23;
  }
  uint64_t v17 = v12;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v133;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v133 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v132 + 1) + 8 * i);
      if (v18
        || (objc_msgSend_assetID(*(void **)(*((void *)&v132 + 1) + 8 * i), v13, v14, v15, v16),
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            int v27 = objc_msgSend_isEqualToString_(v23, v24, @"FMSongArtworkAssetID", v25, v26),
            v23,
            !v27))
      {
        if (v19) {
          continue;
        }
        int v28 = objc_msgSend_assetID(v22, v13, v14, v15, v16);
        int isEqualToString = objc_msgSend_isEqualToString_(v28, v29, @"FMSongBundleAssetID", v30, v31);

        if (isEqualToString
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) <= 4
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) >= 1)
        {
          uint64_t v19 = v22;
          goto LABEL_16;
        }
        uint64_t v19 = 0;
      }
      else
      {
        if (objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) <= 4
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) > 0)
        {
          uint64_t v18 = v22;
LABEL_16:
          id v33 = v22;
          objc_msgSend_removeObject_(v126, v34, (uint64_t)v33, v35, v36);
          objc_msgSend_addObject_(v125, v37, (uint64_t)v33, v38, v39);
          continue;
        }
        uint64_t v18 = 0;
      }
    }
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v132, (uint64_t)v137, 16);
  }
  while (v17);
LABEL_23:

  uint64_t v48 = self;
  if (objc_msgSend_count(v126, v40, v41, v42, v43))
  {
    v49 = FlexLogForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_217A3E928();
    }
  }
  if (objc_msgSend_isClientManaged(self, v44, v45, v46, v47))
  {
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v54 = v125;
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v128, (uint64_t)v136, 16);
    if (v56)
    {
      uint64_t v61 = v56;
      uint64_t v62 = *(void *)v129;
LABEL_30:
      uint64_t v63 = 0;
      while (1)
      {
        if (*(void *)v129 != v62) {
          objc_enumerationMutation(v54);
        }
        v64 = *(void **)(*((void *)&v128 + 1) + 8 * v63);
        v65 = objc_msgSend_assetID(v64, v57, v58, v59, v60);
        char v69 = objc_msgSend_isEqualToString_(v65, v66, @"FMSongBundleAssetID", v67, v68);

        if (v69) {
          break;
        }
        if (v61 == ++v63)
        {
          uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v128, (uint64_t)v136, 16);
          if (v61) {
            goto LABEL_30;
          }
          id v70 = v54;
          uint64_t v48 = self;
          goto LABEL_45;
        }
      }
      id v70 = v64;

      uint64_t v48 = self;
      if (!v70) {
        goto LABEL_46;
      }
      uint64_t v71 = objc_msgSend_localURL(v70, v50, v51, v52, v53);
      v75 = objc_msgSend_backendForSongBundleURL_(FlexUtilities, v72, (uint64_t)v71, v73, v74);

      if (v75)
      {
        v80 = objc_msgSend_artistName(self, v76, v77, v78, v79);
        v85 = objc_msgSend_songName(self, v81, v82, v83, v84);
        uint64_t v90 = objc_msgSend_tagIDs(self, v86, v87, v88, v89);
        uint64_t v95 = objc_msgSend_keywords(self, v91, v92, v93, v94);
        v100 = objc_msgSend_weightedKeywords(self, v96, v97, v98, v99);
        unsigned int v123 = objc_msgSend_hidden(self, v101, v102, v103, v104);
        char v122 = objc_msgSend_recalled(self, v105, v106, v107, v108);
        objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v75, v109, (uint64_t)v80, (uint64_t)v85, (uint64_t)v90, v95, v100, v123, v122, 1);

        objc_msgSend_updateBackend_(self, v110, (uint64_t)v75, v111, v112);
      }
      else
      {
        uint64_t v113 = FlexLogForCategory(0);
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
          sub_217A3E8F4();
        }
      }
    }
    else
    {
      id v70 = v54;
    }
LABEL_45:
  }
LABEL_46:
  v114 = objc_msgSend__impl(v48, v50, v51, v52, v53);
  objc_msgSend_updateAssets_(v114, v115, (uint64_t)v125, v116, v117);

  objc_msgSend__notifySongAssetsChanged(v48, v118, v119, v120, v121);
}

- (id)assetWithID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend__impl(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_assetWithID_(v9, v10, (uint64_t)v4, v11, v12);

  if ((!v13 || (objc_msgSend_isCloudBacked(v13, v14, v15, v16, v17) & 1) == 0)
    && objc_msgSend_isEqualToString_(v4, v14, @"FMSongArtworkAssetID", v16, v17))
  {
    uint64_t v19 = objc_msgSend_existingAssetWithID_(self, v14, @"FMSongBundleAssetID", v16, v17);
    if (objc_msgSend_isCloudBacked(v19, v20, v21, v22, v23))
    {
      int v28 = objc_msgSend_cloudManager(v19, v24, v25, v26, v27);
      id v33 = objc_msgSend_uid(self, v29, v30, v31, v32);
      objc_msgSend_loadAssetWithID_forSongID_(v28, v34, (uint64_t)v4, (uint64_t)v33, v35);
    }
  }
  uint64_t v36 = objc_msgSend__impl(self, v14, v18, v16, v17);
  id v40 = objc_msgSend_assetWithID_(v36, v37, (uint64_t)v4, v38, v39);

  return v40;
}

- (id)existingAssetWithID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend__impl(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_existingAssetWithID_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_isEqualToString_(v4, v14, @"FMSongBundleAssetID", v15, v16);
  return v13;
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = objc_msgSend_assetWithID_(self, v10, *(void *)(*((void *)&v20 + 1) + 8 * v15), v11, v12);
        objc_msgSend_requestDownloadWithOptions_(v16, v17, (uint64_t)v7, v18, v19);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v13);
  }
}

- (void)cancelDownloadOfAllAssetsWithIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = objc_msgSend_existingAssetWithID_(self, v7, *(void *)(*((void *)&v18 + 1) + 8 * v12), v8, v9);
        objc_msgSend_cancelDownload(v13, v14, v15, v16, v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v10);
  }
}

+ (NSArray)availableTagIDs
{
  if (qword_267BA93D8 != -1) {
    dispatch_once(&qword_267BA93D8, &unk_26C7FE7C8);
  }
  uint64_t v2 = (void *)qword_267BA93D0;
  return (NSArray *)v2;
}

+ (id)localizedNameForTagWithID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"?";
  }

  return v5;
}

- (id)description
{
  uint64_t v6 = NSString;
  id v7 = objc_msgSend_songName(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_artistName(self, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v6, v13, @"%@ by %@", v14, v15, v7, v12);

  return v16;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  objc_msgSend__loadIfNeeded(self, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend__impl(self, v8, v9, v10, v11);
  if (v12)
  {
    long long v18 = v12;
    objc_msgSend_minimumDuration(v12, v13, v14, v15, v16);
    uint64_t v12 = v18;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  objc_msgSend__loadIfNeeded(self, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend__impl(self, v8, v9, v10, v11);
  if (v12)
  {
    long long v18 = v12;
    objc_msgSend_naturalDuration(v12, v13, v14, v15, v16);
    uint64_t v12 = v18;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)idealDurations
{
  objc_msgSend__loadIfNeeded(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend__impl(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_idealDurations(v10, v11, v12, v13, v14);

  return v15;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a4;
  if (a3->var2)
  {
    objc_msgSend__loadIfNeeded(self, v6, v7, v8, v9);
    long long v15 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v12 = objc_msgSend_renditionForDuration_withOptions_testingContext_(self, v13, (uint64_t)&v15, (uint64_t)v10, 0);
  }
  else
  {
    uint64_t v11 = FlexLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = self;
      _os_log_impl(&dword_217A2F000, v11, OS_LOG_TYPE_DEFAULT, "invalid duration requested in renditionForDuration for song: %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v14 = objc_msgSend__impl(self, v10, v11, v12, v13);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a3;
  uint64_t v16 = objc_msgSend_renditionForDuration_withOptions_testingContext_(v14, v15, (uint64_t)&v18, (uint64_t)v9, (uint64_t)v8);

  return v16;
}

+ (int64_t)versionFromArtworkFilename:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, @"_v", v5, v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_componentsSeparatedByString_(v3, v7, @"_", v8, v9);
    uint64_t v16 = objc_msgSend_lastObject(v11, v12, v13, v14, v15);

    long long v21 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_invertedSet(v21, v22, v23, v24, v25);
    uint64_t v30 = objc_msgSend_componentsSeparatedByCharactersInSet_(v16, v27, (uint64_t)v26, v28, v29);
    v34 = objc_msgSend_componentsJoinedByString_(v30, v31, (uint64_t)&stru_26C7FED08, v32, v33);

    int64_t v10 = objc_msgSend_integerValue(v34, v35, v36, v37, v38);
  }

  return v10;
}

+ (id)loadSongBundleAtPath:(id)a3
{
  v117[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_stringByAppendingPathComponent_(v3, v4, @"metadata.smm", v5, v6);
  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10, v11);
  int v16 = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v7, v14, v15);

  if (v16) {
    objc_msgSend_loadSongInFolderWithPath_(FlexSong, v17, (uint64_t)v3, v18, v19);
  }
  else {
  uint64_t v20 = objc_msgSend_loadSongAtPath_(FlexMLSong, v17, (uint64_t)v3, v18, v19);
  }
  if (v20)
  {
    long long v21 = [FMSong alloc];
    uint64_t v29 = objc_msgSend_initWithBackend_(v21, v22, (uint64_t)v20, v23, v24);
    if (v29)
    {
      uint64_t v30 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v25, v26, v27, v28);
      uint64_t v35 = objc_msgSend_stringByDeletingLastPathComponent(v3, v31, v32, v33, v34);
      uint64_t v38 = objc_msgSend_contentsOfDirectoryAtPath_error_(v30, v36, (uint64_t)v35, 0, v37);

      uint64_t v42 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v39, @"self ENDSWITH '.jpg'", v40, v41);
      uint64_t v43 = (void *)MEMORY[0x263F08A98];
      uint64_t v48 = objc_msgSend_uid(v20, v44, v45, v46, v47);
      uint64_t v52 = objc_msgSend_predicateWithFormat_(v43, v49, @"self CONTAINS %@", v50, v51, v48);

      uint64_t v53 = (void *)MEMORY[0x263F08730];
      v117[0] = v42;
      v117[1] = v52;
      uint64_t v115 = (void *)v52;
      uint64_t v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v117, 2, v55);
      uint64_t v60 = objc_msgSend_andPredicateWithSubpredicates_(v53, v57, (uint64_t)v56, v58, v59);

      v64 = objc_msgSend_filteredArrayUsingPredicate_(v38, v61, (uint64_t)v60, v62, v63);
      if (objc_msgSend_count(v64, v65, v66, v67, v68))
      {
        uint64_t v112 = v60;
        uint64_t v113 = v42;
        uint64_t v73 = objc_msgSend_stringByDeletingLastPathComponent(v3, v69, v70, v71, v72);
        uint64_t v78 = objc_msgSend_firstObject(v64, v74, v75, v76, v77);
        uint64_t v82 = objc_msgSend_stringByAppendingPathComponent_(v73, v79, (uint64_t)v78, v80, v81);

        uint64_t v90 = objc_msgSend_lastPathComponent(v82, v83, v84, v85, v86);
        v114 = v38;
        if (v82)
        {
          v91 = objc_msgSend_fileURLWithPath_(NSURL, v87, (uint64_t)v82, v88, v89);
        }
        else
        {
          v91 = 0;
        }
        uint64_t v111 = (void *)v90;
        uint64_t v92 = objc_msgSend_versionFromArtworkFilename_(FMSong, v87, v90, v88, v89);
        uint64_t v96 = objc_msgSend_existingAssetWithID_(v29, v93, @"FMSongBundleAssetID", v94, v95);
        uint64_t v100 = objc_msgSend_compatibilityVersionForAssetLocation_(v96, v97, 0, v98, v99);
        v101 = [FMSongAsset alloc];
        uint64_t v103 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v101, v102, @"FMSongArtworkAssetID", 0, (uint64_t)v91, v92, v100);
        uint64_t v116 = v103;
        uint64_t v106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v104, (uint64_t)&v116, 1, v105);
        objc_msgSend_updateAssets_(v29, v107, (uint64_t)v106, v108, v109);

        uint64_t v42 = v113;
        uint64_t v38 = v114;
        uint64_t v60 = v112;
      }
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

+ (id)loadSongsAndArtworkInFolderAtPath:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v40 = objc_opt_new();
  if (v3)
  {
    uint64_t v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7);
    uint64_t v11 = objc_msgSend_contentsOfDirectoryAtPath_error_(v8, v9, (uint64_t)v3, 0, v10);

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v12 = v11;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v14)
    {
      uint64_t v19 = v14;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v12);
          }
          long long v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend_pathExtension(v22, v15, v16, v17, v18);
          if (objc_msgSend_isEqualToString_(v23, v24, @"smsbundle", v25, v26))
          {
            uint64_t v30 = objc_msgSend_stringByAppendingPathComponent_(v3, v27, (uint64_t)v22, v28, v29);
            uint64_t v37 = objc_msgSend_loadSongBundleAtPath_(FMSong, v31, (uint64_t)v30, v32, v33);
            if (v37) {
              objc_msgSend_addObject_(v40, v34, (uint64_t)v37, v35, v36);
            }
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v19);
    }
  }
  uint64_t v38 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v4, (uint64_t)v40, v6, v7);

  return v38;
}

+ (BOOL)hasValidTagIDs:(id)a3
{
  id v3 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_217A3E67C;
  uint64_t v36 = sub_217A3E68C;
  objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6, v7);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_217A3E67C;
  uint64_t v30 = sub_217A3E68C;
  objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_217A3E694;
  v25[3] = &unk_2642B71F0;
  v25[4] = &v32;
  v25[5] = &v26;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v12, (uint64_t)v25, v13, v14);
  BOOL v23 = objc_msgSend_count((void *)v33[5], v15, v16, v17, v18) == 1
     && objc_msgSend_count((void *)v27[5], v19, v20, v21, v22) == 1;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (id)customOptions
{
  uint64_t v5 = objc_msgSend__impl(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_customOptions(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)songFormat
{
  uint64_t v6 = objc_msgSend__impl(self, a2, v2, v3, v4);
  uint64_t v15 = objc_msgSend_songFormat(v6, v7, v8, v9, v10);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__impl(self, v11, v12, v13, v14);
    objc_msgSend_songFormat(v16, v17, v18, v19, v20);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = @"?";
  }

  return (NSString *)v21;
}

- (BOOL)isClientManaged
{
  return self->_isClientManaged;
}

- (FlexSongProtocol)backend
{
  return (FlexSongProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end