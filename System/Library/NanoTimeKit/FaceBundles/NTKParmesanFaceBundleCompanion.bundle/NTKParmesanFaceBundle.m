@interface NTKParmesanFaceBundle
+ (BOOL)_isBridgeOrClockFace;
+ (id)logCategoryName;
- (BOOL)_haveSuggestedShuffleData;
- (BOOL)companionShouldDisplayDebugMenuForFace:(id)a3;
- (BOOL)useDynamicCollectionForDevice:(id)a3;
- (Class)clockViewClass;
- (Class)faceClass;
- (Class)faceViewClass;
- (NTKParmesanFaceBundle)init;
- (id)_allPlaceholderFacesForDevice:(id)a3;
- (id)_emptyFaceForDevice:(id)a3;
- (id)_fetchCurrentSuggestedShuffleFacesForDevice:(id)a3;
- (id)_heroPlaceholderFaceForDevice:(id)a3;
- (id)_placeholderFaceForDevice:(id)a3 name:(id)a4;
- (id)_randomPlaceholderFaceForDevice:(id)a3;
- (id)_suggestedShuffleData;
- (id)galleryDescriptionForDevice:(id)a3;
- (id)galleryDescriptionText;
- (id)galleryFacesForDevice:(id)a3;
- (id)galleryFacesInDynamicCollectionForDevice:(id)a3;
- (id)galleryTitle;
- (id)heroFacesForDevice:(id)a3;
- (id)viewControllerForCompanionDebugMenuWithFace:(id)a3;
- (void)_waitForGalleryFaceDirectories;
- (void)dealloc;
- (void)shuffleDidUpdate;
@end

@implementation NTKParmesanFaceBundle

- (NTKParmesanFaceBundle)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKParmesanFaceBundle;
  v2 = [(NTKFaceBundle *)&v14 init];
  if (v2)
  {
    v3 = objc_opt_class();
    if (objc_msgSend__isBridgeOrClockFace(v3, v4, v5, v6))
    {
      v10 = objc_msgSend__suggestedShuffleData(v2, v7, v8, v9);
      objc_msgSend_addObserver_(v10, v11, (uint64_t)v2, v12);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = objc_opt_class();
  if (objc_msgSend__isBridgeOrClockFace(v3, v4, v5, v6))
  {
    v10 = objc_msgSend__suggestedShuffleData(self, v7, v8, v9);
    objc_msgSend_removeObserver_(v10, v11, (uint64_t)self, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)NTKParmesanFaceBundle;
  [(NTKParmesanFaceBundle *)&v13 dealloc];
}

- (Class)faceClass
{
  return (Class)objc_opt_class();
}

- (Class)faceViewClass
{
  return (Class)objc_opt_class();
}

- (Class)clockViewClass
{
  return (Class)objc_opt_class();
}

- (id)galleryTitle
{
  return (id)objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, a2, @"FACE_PARMESAN_IN_TITLE_CASE", @"Parmesan");
}

- (id)galleryDescriptionForDevice:(id)a3
{
  if (objc_msgSend_isTinker(a3, a2, (uint64_t)a3, v3)) {
    objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v5, @"FACE_PARMESAN_GALLERY_PLACEHOLDER_TINKER_DESCRIPTION", @"Parmesan Description");
  }
  else {
  uint64_t v8 = objc_msgSend_galleryDescriptionText(self, v5, v6, v7);
  }

  return v8;
}

- (id)galleryDescriptionText
{
  if (NTKPeerDeviceHandlesWideLoads()) {
    uint64_t v3 = @"FACE_PARMESAN_GALLERY_DESCRIPTION_24";
  }
  else {
    uint64_t v3 = @"FACE_PARMESAN_GALLERY_DESCRIPTION_06";
  }

  return (id)objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v2, (uint64_t)v3, @"Parmesan Description");
}

- (id)heroFacesForDevice:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v68 = (char *)objc_opt_class();
    uint64_t v9 = v68;
    _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_INFO, "%@: Generating hero faces for device", buf, 0xCu);
  }
  id v10 = objc_alloc(MEMORY[0x263F08C38]);
  objc_super v13 = objc_msgSend_initWithUUIDString_(v10, v11, @"DAB81146-4105-445B-94AD-14033A199AC4", v12);
  char v16 = objc_msgSend_supportsCapability_(v4, v14, (uint64_t)v13, v15);

  v20 = objc_msgSend_logObject(NTKParmesanFaceBundle, v17, v18, v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (v21)
    {
      v22 = (char *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v68 = v22;
      v23 = v22;
      _os_log_impl(&dword_246B51000, v20, OS_LOG_TYPE_INFO, "%@: Getting gallery shuffles for hero face", buf, 0xCu);
    }
    objc_msgSend__waitForGalleryFaceDirectories(self, v24, v25, v26);
    int haveSuggestedShuffleData = objc_msgSend__haveSuggestedShuffleData(self, v27, v28, v29);
    v34 = objc_msgSend_logObject(NTKParmesanFaceBundle, v31, v32, v33);
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (haveSuggestedShuffleData)
    {
      if (v35)
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[NTKParmesanFaceBundle heroFacesForDevice:]";
        _os_log_impl(&dword_246B51000, v34, OS_LOG_TYPE_DEFAULT, "%s — have shuffle data; show first as hero face",
          buf,
          0xCu);
      }

      v20 = objc_msgSend__emptyFaceForDevice_(self, v36, (uint64_t)v4, v37);
      v41 = objc_msgSend__suggestedShuffleData(self, v38, v39, v40);
      v45 = objc_msgSend_suggestedShuffleUUIDStrings(v41, v42, v43, v44);
      v49 = objc_msgSend_firstObject(v45, v46, v47, v48);

      v52 = objc_msgSend_resourceDirectoryForUUIDString_(v41, v50, (uint64_t)v49, v51);
      objc_msgSend_setResourceDirectoryByTransferringOwnership_(v20, v53, (uint64_t)v52, v54);
    }
    else
    {
      if (v35)
      {
        *(_DWORD *)buf = 136315138;
        v68 = "-[NTKParmesanFaceBundle heroFacesForDevice:]";
        _os_log_impl(&dword_246B51000, v34, OS_LOG_TYPE_DEFAULT, "%s — no shuffle data; show placeholder as hero face",
          buf,
          0xCu);
      }

      v20 = objc_msgSend__heroPlaceholderFaceForDevice_(self, v58, (uint64_t)v4, v59);
    }
    id v60 = objc_alloc(MEMORY[0x263F579E8]);
    uint64_t v62 = objc_msgSend_initWithFace_priority_(v60, v61, (uint64_t)v20, 1700);
    v64 = (void *)v62;
    if (v62)
    {
      uint64_t v66 = v62;
      v57 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v63, (uint64_t)&v66, 1);
    }
    else
    {
      v57 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    if (v21)
    {
      v55 = (char *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v68 = v55;
      v56 = v55;
      _os_log_impl(&dword_246B51000, v20, OS_LOG_TYPE_INFO, "%@: Device doesn't support necessary capabilities, returning no hero gallery faces", buf, 0xCu);
    }
    v57 = (void *)MEMORY[0x263EFFA68];
  }

  return v57;
}

- (BOOL)useDynamicCollectionForDevice:(id)a3
{
  if (objc_msgSend_isTinker(a3, a2, (uint64_t)a3, v3)) {
    return 0;
  }

  return objc_msgSend__haveSuggestedShuffleData(self, v5, v6, v7);
}

- (id)galleryFacesInDynamicCollectionForDevice:(id)a3
{
  return (id)((uint64_t (*)(NTKParmesanFaceBundle *, char *, id))MEMORY[0x270F9A6D0])(self, sel_galleryFacesForDevice_, a3);
}

- (id)galleryFacesForDevice:(id)a3
{
  v259[9] = *MEMORY[0x263EF8340];
  id v186 = a3;
  uint64_t v256 = *MEMORY[0x263F57850];
  uint64_t v3 = v256;
  v180 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v4, v5, v6);
  v258[0] = v180;
  uint64_t v257 = *MEMORY[0x263F57820];
  uint64_t v7 = v257;
  v179 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v8, v9, v10);
  v258[1] = v179;
  v178 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v258, (uint64_t)&v256, 2);
  v259[0] = v178;
  v254[0] = v3;
  v177 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v12, v13, v14);
  v254[1] = v7;
  v255[0] = v177;
  uint64_t v17 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v15, 1, v16);
  v181 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v18, v19, v20);
  }
  v162 = (void *)v17;
  v255[1] = v17;
  v176 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v255, (uint64_t)v254, 2);
  v259[1] = v176;
  v252[0] = v3;
  v175 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v21, v22, v23);
  v253[0] = v175;
  v252[1] = v7;
  v174 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v24, v25, v26);
  v253[1] = v174;
  v173 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v253, (uint64_t)v252, 2);
  v259[2] = v173;
  v250[0] = v3;
  uint64_t v30 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v28, 1, v29);
  v182 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v31, v32, v33);
  }
  v161 = (void *)v30;
  v251[0] = v30;
  v250[1] = v7;
  v172 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v31, v32, v33);
  v251[1] = v172;
  v171 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v251, (uint64_t)v250, 2);
  v259[3] = v171;
  v248[0] = v3;
  v170 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v35, v36, v37);
  v249[0] = v170;
  v248[1] = v7;
  v169 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v38, v39, v40);
  v249[1] = v169;
  v168 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v249, (uint64_t)v248, 2);
  v259[4] = v168;
  v246[0] = v3;
  v167 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v42, v43, v44);
  v247[0] = v167;
  v246[1] = v7;
  v166 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v45, v46, v47);
  v247[1] = v166;
  v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v48, (uint64_t)v247, (uint64_t)v246, 2);
  v259[5] = v165;
  v244[0] = v3;
  uint64_t v51 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v49, 1, v50);
  v55 = (void *)v51;
  if (!v51)
  {
    uint64_t v51 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v52, v53, v54);
  }
  v160 = (void *)v51;
  v245[0] = v51;
  v244[1] = v7;
  uint64_t v56 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v52, 8, v54);
  id v60 = (void *)v56;
  if (!v56)
  {
    uint64_t v56 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v57, v58, v59);
  }
  v159 = (void *)v56;
  v245[1] = v56;
  v164 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v245, (uint64_t)v244, 2);
  v259[6] = v164;
  v242[0] = v3;
  v163 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v61, v62, v63);
  v243[0] = v163;
  v242[1] = v7;
  v67 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v64, v65, v66);
  v243[1] = v67;
  uint64_t v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, (uint64_t)v243, (uint64_t)v242, 2);
  v259[7] = v69;
  v240[0] = v3;
  v75 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v70, 1, v71);
  v76 = v75;
  if (!v75)
  {
    v76 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v72, v73, v74);
  }
  v241[0] = v76;
  v240[1] = v7;
  v80 = objc_msgSend_anyComplicationOfType_(MEMORY[0x263F57988], v72, 8, v74);
  v81 = v80;
  if (!v80)
  {
    v81 = objc_msgSend_nullComplication(MEMORY[0x263F57988], v77, v78, v79);
  }
  v241[1] = v81;
  v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, (uint64_t)v241, (uint64_t)v240, 2);
  v259[8] = v82;
  v183 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v83, (uint64_t)v259, 9);

  if (!v80) {
  if (!v75)
  }

  if (!v60) {
  if (!v55)
  }

  if (!v182) {
  if (!v181)
  }

  memset(v192, 0, sizeof(v192));
  uint64_t v193 = 0;
  v194 = @"time.vibrant";
  uint64_t v195 = objc_msgSend_objectAtIndexedSubscript_(v183, v84, 0, v85);
  long long v196 = xmmword_246C32C70;
  long long v197 = xmmword_246C32C80;
  v198 = @"tritone.tritone-01";
  v199 = @"seasons.spring2015.white";
  uint64_t v200 = objc_msgSend_objectAtIndexedSubscript_(v183, v86, 1, v87);
  uint64_t v201 = 1;
  long long v202 = 0u;
  long long v203 = 0u;
  v204 = @"seasons.spring2023.sproutGreen";
  objc_msgSend_objectAtIndexedSubscript_(v183, v88, 2, v89);
  int64x2_t v206 = vdupq_n_s64(2uLL);
  uint64_t v205 = v207 = xmmword_246C32C90;
  uint64_t v208 = 0;
  v209 = @"standard.purple";
  uint64_t v210 = objc_msgSend_objectAtIndexedSubscript_(v183, v90, 3, v91);
  long long v211 = xmmword_246C32C90;
  uint64_t v212 = 0;
  uint64_t v213 = 0;
  uint64_t v214 = 0;
  v215 = @"time.vibrant";
  uint64_t v216 = objc_msgSend_objectAtIndexedSubscript_(v183, v92, 4, v93);
  uint64_t v217 = 3;
  int64x2_t v218 = v206;
  uint64_t v219 = 2;
  uint64_t v220 = 0;
  v221 = @"seasons.spring2023.sproutGreen";
  uint64_t v222 = objc_msgSend_objectAtIndexedSubscript_(v183, v94, 5, v95);
  uint64_t v223 = 1;
  long long v224 = 0u;
  long long v225 = 0u;
  uint64_t v226 = 0;
  uint64_t v227 = objc_msgSend_objectAtIndexedSubscript_(v183, v96, 6, v97);
  uint64_t v228 = 2;
  int64x2_t v229 = vdupq_n_s64(1uLL);
  uint64_t v230 = 6;
  v231 = @"seasons.fall2024.chartreuse";
  v232 = @"seasons.fall2024.magenta";
  uint64_t v233 = objc_msgSend_objectAtIndexedSubscript_(v183, v98, 7, v99);
  long long v234 = xmmword_246C32CA0;
  uint64_t v235 = 0;
  uint64_t v236 = 0;
  uint64_t v237 = 0;
  v238 = @"time.vibrant";
  uint64_t v239 = objc_msgSend_objectAtIndexedSubscript_(v183, v100, 8, v101);
  if (objc_msgSend__haveSuggestedShuffleData(self, v102, v103, v104))
  {
    v108 = objc_msgSend_logObject(NTKParmesanFaceBundle, v105, v106, v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v191 = "-[NTKParmesanFaceBundle galleryFacesForDevice:]";
      _os_log_impl(&dword_246B51000, v108, OS_LOG_TYPE_DEFAULT, "%s — have shuffle data; populate gallery with suggested shuffle faces",
        buf,
        0xCu);
    }

    objc_msgSend__fetchCurrentSuggestedShuffleFacesForDevice_(self, v109, (uint64_t)v186, v110);
    id v185 = (id)objc_claimAutoreleasedReturnValue();
    v114 = v183;
  }
  else
  {
    v115 = objc_msgSend_logObject(NTKParmesanFaceBundle, v105, v106, v107);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v191 = "-[NTKParmesanFaceBundle galleryFacesForDevice:]";
      _os_log_impl(&dword_246B51000, v115, OS_LOG_TYPE_DEFAULT, "%s — no shuffle data; show random placeholder face in gallery",
        buf,
        0xCu);
    }

    if (!_os_feature_enabled_impl())
    {
      uint64_t v154 = objc_msgSend__randomPlaceholderFaceForDevice_(self, v116, (uint64_t)v186, v117);
      v156 = (void *)v154;
      if (v154)
      {
        uint64_t v189 = v154;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v155, (uint64_t)&v189, 1);
        id v185 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v185 = (id)MEMORY[0x263EFFA68];
      }

      v114 = v183;
      goto LABEL_44;
    }
    v120 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v116, 9, v117);
    int v121 = 9;
    do
    {
      v124 = objc_msgSend__randomPlaceholderFaceForDevice_(self, v118, (uint64_t)v186, v119);
      if (v124) {
        objc_msgSend_addObject_(v120, v122, (uint64_t)v124, v123);
      }

      --v121;
    }
    while (v121);
    id v185 = (id)objc_msgSend_copy(v120, v118, v125, v119);

    v114 = v183;
  }
  for (unint64_t i = 0; objc_msgSend_count(v185, v111, v112, v113) > i; ++i)
  {
    v129 = objc_msgSend_objectAtIndexedSubscript_(v185, v127, i, v128);
    v131 = objc_msgSend_optionWithTime_device_(NTKParmesanTimeEditOption, v130, *((void *)v192 + 7 * (i % 9)), (uint64_t)v186);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v132, (uint64_t)v131, 14, 0);
    v134 = objc_msgSend_optionWithTypeface_device_(NTKParmesanTypefaceEditOption, v133, *((void *)v192 + 7 * (i % 9) + 1), (uint64_t)v186);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v135, (uint64_t)v134, 13, 0);
    v137 = objc_msgSend_optionWithNumeral_forDevice_(MEMORY[0x263F57A30], v136, *((void *)&v192[1] + 7 * (i % 9)), (uint64_t)v186);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v138, (uint64_t)v137, 19, 0);
    v140 = objc_msgSend_optionWithStyle_device_(NTKParmesanStyleEditOption, v139, *((void *)&v192[1] + 7 * (i % 9) + 1), (uint64_t)v186);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v141, (uint64_t)v140, 15, 0);
    v144 = objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v142, *((void *)&v192[2] + 7 * (i % 9)), v143);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v145, (uint64_t)v144, 10, @"style-color");
    v148 = objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v146, (uint64_t)*(&v194 + 7 * (i % 9)), v147);
    objc_msgSend_selectOption_forCustomEditMode_slot_(v129, v149, (uint64_t)v148, 10, @"time-color");
    id v150 = (id)*(&v195 + 7 * (i % 9));
    v187[0] = MEMORY[0x263EF8330];
    v187[1] = 3221225472;
    v187[2] = sub_246B63F94;
    v187[3] = &unk_2651FBCB0;
    id v151 = v129;
    id v188 = v151;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v150, v152, (uint64_t)v187, v153);

    v114 = v183;
  }
LABEL_44:
  for (uint64_t j = 448; j != -56; j -= 56)
    sub_246B63F50((uint64_t)v192 + j);

  return v185;
}

- (id)_fetchCurrentSuggestedShuffleFacesForDevice:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend__waitForGalleryFaceDirectories(self, v5, v6, v7);
  v11 = objc_msgSend__suggestedShuffleData(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_array(MEMORY[0x263EFF980], v12, v13, v14);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v19 = objc_msgSend_suggestedShuffleUUIDStrings(v11, v16, v17, v18, 0);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v49, (uint64_t)v57, 16);
  if (v21)
  {
    uint64_t v24 = v21;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v19);
        }
        uint64_t v27 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v28 = objc_msgSend__emptyFaceForDevice_(self, v22, (uint64_t)v4, v23);
        v31 = objc_msgSend_resourceDirectoryForUUIDString_(v11, v29, v27, v30);
        objc_msgSend_setResourceDirectoryByTransferringOwnership_(v28, v32, (uint64_t)v31, v33);
        objc_msgSend_addObject_(v15, v34, (uint64_t)v28, v35);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v49, (uint64_t)v57, 16);
    }
    while (v24);
  }

  uint64_t v39 = objc_msgSend_logObject(NTKParmesanFaceBundle, v36, v37, v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = objc_msgSend_count(v15, v40, v41, v42);
    *(_DWORD *)buf = 136315394;
    uint64_t v54 = "-[NTKParmesanFaceBundle _fetchCurrentSuggestedShuffleFacesForDevice:]";
    __int16 v55 = 2048;
    uint64_t v56 = v43;
    _os_log_impl(&dword_246B51000, v39, OS_LOG_TYPE_DEFAULT, "%s — received [%lu] suggested shuffle faces", buf, 0x16u);
  }

  uint64_t v47 = objc_msgSend_copy(v15, v44, v45, v46);

  return v47;
}

+ (id)logCategoryName
{
  return @"Parmesan";
}

+ (BOOL)_isBridgeOrClockFace
{
  if (CLKIsBridge()) {
    return 1;
  }

  return MEMORY[0x270EE31D8]();
}

- (id)_emptyFaceForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_identifier(v4, v5, v6, v7);
  uint64_t v9 = objc_opt_class();
  uint64_t v13 = objc_msgSend_analyticsIdentifier(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(NTKParmesanFace, v14, (uint64_t)v8, (uint64_t)v13, v3, &unk_26FB1C1A0);

  return v15;
}

- (id)_heroPlaceholderFaceForDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_heroPlaceholderName(NTKParmesanGalleryPlaceholderDataSource, v5, v6, v7);
  uint64_t v12 = objc_msgSend_logObject(NTKParmesanFaceBundle, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[NTKParmesanFaceBundle _heroPlaceholderFaceForDevice:]";
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_246B51000, v12, OS_LOG_TYPE_DEFAULT, "%s — creating placeholder hero face with name: [%@]", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v14 = objc_msgSend__placeholderFaceForDevice_name_(self, v13, (uint64_t)v4, (uint64_t)v8);

  return v14;
}

- (id)_randomPlaceholderFaceForDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_randomPlaceholderName(NTKParmesanGalleryPlaceholderDataSource, v5, v6, v7);
  uint64_t v12 = objc_msgSend_logObject(NTKParmesanFaceBundle, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[NTKParmesanFaceBundle _randomPlaceholderFaceForDevice:]";
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_246B51000, v12, OS_LOG_TYPE_DEFAULT, "%s — random placeholder face with name: [%@]", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v14 = objc_msgSend__placeholderFaceForDevice_name_(self, v13, (uint64_t)v4, (uint64_t)v8);

  return v14;
}

- (id)_allPlaceholderFacesForDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_placeholderNames(NTKParmesanGalleryPlaceholderDataSource, v5, v6, v7);
  uint64_t v9 = (void *)MEMORY[0x263EFF980];
  uint64_t v13 = objc_msgSend_count(v8, v10, v11, v12);
  int v16 = objc_msgSend_arrayWithCapacity_(v9, v14, v13, v15);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = v8;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend__placeholderFaceForDevice_name_(self, v20, (uint64_t)v4, *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
        objc_msgSend_addObject_(v16, v25, (uint64_t)v24, v26);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v21);
  }

  uint64_t v30 = objc_msgSend_copy(v16, v27, v28, v29);

  return v30;
}

- (id)_placeholderFaceForDevice:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_configurationForName_(NTKParmesanGalleryPlaceholderDataSource, v8, (uint64_t)v7, v9);
  uint64_t v14 = objc_msgSend_faceClass(self, v11, v12, v13);
  uint64_t v15 = objc_opt_class();
  uint64_t v19 = objc_msgSend_identifier(v15, v16, v17, v18);
  uint64_t v20 = objc_opt_class();
  uint64_t v24 = objc_msgSend_analyticsIdentifier(v20, v21, v22, v23);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_246B64830;
  v31[3] = &unk_2651FBCD8;
  id v32 = v7;
  id v33 = v6;
  id v34 = v10;
  id v25 = v10;
  id v26 = v6;
  id v27 = v7;
  uint64_t v29 = objc_msgSend_bundledFaceWithIdentifier_analyticsIdentifier_forDevice_initCustomization_(v14, v28, (uint64_t)v19, (uint64_t)v24, v26, v31);

  return v29;
}

- (BOOL)_haveSuggestedShuffleData
{
  objc_msgSend__waitForGalleryFaceDirectories(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__suggestedShuffleData(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_suggestedShuffleUUIDStrings(v8, v9, v10, v11);
  BOOL v16 = objc_msgSend_count(v12, v13, v14, v15) != 0;

  return v16;
}

- (void)_waitForGalleryFaceDirectories
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend__suggestedShuffleData(v2, v3, v4, v5);
  if ((objc_msgSend_isPrepared(v6, v7, v8, v9) & 1) == 0)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_246B64A7C;
    v15[3] = &unk_2651FBD00;
    uint64_t v11 = v10;
    BOOL v16 = v11;
    objc_msgSend_prepareWithCompletion_(v6, v12, (uint64_t)v15, v13);
    dispatch_time_t v14 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v11, v14);
  }
  objc_sync_exit(v2);
}

- (id)_suggestedShuffleData
{
  return (id)objc_msgSend_shared(NTKParmesanGallerySuggestedShuffleDataSource, a2, v2, v3);
}

- (void)shuffleDidUpdate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_logObject(NTKParmesanFaceBundle, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_246B51000, v5, OS_LOG_TYPE_DEFAULT, "shuffleDidUpdate: Waiting for gallery directories for bundle: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend__waitForGalleryFaceDirectories(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_logObject(NTKParmesanFaceBundle, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_246B51000, v12, OS_LOG_TYPE_DEFAULT, "shuffleDidUpdate: Notifying observers gallery faces updated for bundle: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_notifyObserversGalleryFacesDidUpdate(self, v13, v14, v15);
}

- (BOOL)companionShouldDisplayDebugMenuForFace:(id)a3
{
  return 1;
}

- (id)viewControllerForCompanionDebugMenuWithFace:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x270F9A6D0])(NTKCParmesanDebugFlowController, sel_debugViewControllerForFace_, a3);
}

@end