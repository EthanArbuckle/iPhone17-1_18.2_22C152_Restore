@interface BCAssetAnnotations
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromAssetAnnotations:(id)a3 withMergers:(id)a4;
- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCAssetAnnotations

- (id)mutableCopy
{
  v3 = [BCMutableAssetAnnotations alloc];
  return (id)MEMORY[0x270F9A6D0](v3, sel_initWithCloudData_, self, v4, v5, v6, v7, v8);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v11 = BUProtocolCast();
  if (v11)
  {
    objc_msgSend__configureFromAssetAnnotations_withMergers_(self, v6, (uint64_t)v11, (uint64_t)v5, v7, v8, v9, v10);
  }
  else
  {
    v12 = BDSCloudKitLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2361F9660();
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = BUProtocolCast();
  v77.receiver = self;
  v77.super_class = (Class)BCAssetAnnotations;
  LOBYTE(v4) = [(BCCloudData *)&v77 isEqualExceptForDate:v6 ignoringEmptySalt:v4];

  v15 = objc_msgSend_assetID(self, v8, v9, v10, v11, v12, v13, v14);
  v23 = objc_msgSend_assetID(v7, v16, v17, v18, v19, v20, v21, v22);
  char isEqualToString = objc_msgSend_isEqualToString_(v15, v24, (uint64_t)v23, v25, v26, v27, v28, v29);

  v38 = objc_msgSend_assetVersion(self, v31, v32, v33, v34, v35, v36, v37);
  uint64_t v46 = objc_msgSend_assetVersion(v7, v39, v40, v41, v42, v43, v44, v45);
  char v53 = objc_msgSend_isEqualToString_(v38, v47, v46, v48, v49, v50, v51, v52);

  v61 = objc_msgSend_bookAnnotations(self, v54, v55, v56, v57, v58, v59, v60);
  v69 = objc_msgSend_bookAnnotations(v7, v62, v63, v64, v65, v66, v67, v68);
  LOBYTE(v46) = objc_msgSend_isEqual_(v61, v70, (uint64_t)v69, v71, v72, v73, v74, v75);

  return v4 & isEqualToString & v53 & v46;
}

- (void)_configureFromAssetAnnotations:(id)a3 withMergers:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v88.receiver = self;
  v88.super_class = (Class)BCAssetAnnotations;
  [(BCCloudData *)&v88 configureFromCloudData:v6 withMergers:a4];
  uint64_t v14 = objc_msgSend_assetID(v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setDifferentString_forKey_(self, v15, (uint64_t)v14, @"assetID", v16, v17, v18, v19);

  uint64_t v27 = objc_msgSend_assetID(v6, v20, v21, v22, v23, v24, v25, v26);
  uint64_t v35 = objc_msgSend_assetVersion(v6, v28, v29, v30, v31, v32, v33, v34);
  uint64_t v43 = objc_msgSend_bookAnnotations(v6, v36, v37, v38, v39, v40, v41, v42);
  objc_msgSend__mergeInAssetID_assetVersion_serializedData_(self, v44, (uint64_t)v27, (uint64_t)v35, (uint64_t)v43, v45, v46, v47);

  uint64_t v55 = objc_msgSend_shared(MEMORY[0x263F2BA58], v48, v49, v50, v51, v52, v53, v54);
  LODWORD(v35) = objc_msgSend_verboseLoggingEnabled(v55, v56, v57, v58, v59, v60, v61, v62);

  if (v35)
  {
    uint64_t v63 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = objc_msgSend_assetID(self, v64, v65, v66, v67, v68, v69, v70);
      v79 = objc_msgSend_debugDescription(self, v72, v73, v74, v75, v76, v77, v78);
      v87 = objc_msgSend_assetID(v6, v80, v81, v82, v83, v84, v85, v86);
      *(_DWORD *)buf = 138543874;
      v90 = v71;
      __int16 v91 = 2112;
      v92 = v79;
      __int16 v93 = 2114;
      v94 = v87;
      _os_log_impl(&dword_2360BC000, v63, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetAnnotations configured: %{public}@ %@ from assetDetail:%{public}@\\\"\"", buf, 0x20u);
    }
  }
}

- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5
{
  uint64_t v382 = *MEMORY[0x263EF8340];
  uint64_t v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(BCAnnotationsProtoBook);
  id v12 = objc_alloc(MEMORY[0x263F62228]);
  uint64_t v19 = objc_msgSend_initWithData_(v12, v13, (uint64_t)v10, v14, v15, v16, v17, v18);
  if (BCAnnotationsProtoBookReadFrom((char *)v11, (uint64_t)v19))
  {
    v360 = v19;
    id v362 = v10;
    uint64_t v27 = objc_msgSend_assetID(self, v20, v21, v22, v23, v24, v25, v26);
    char isEqualToString = objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v8, v29, v30, v31, v32, v33);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v35 = BDSCloudKitLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_2361F9718(self, v8, v35, v36, v37, v38, v39, v40);
      }

      objc_msgSend_setAssetID_(self, v41, (uint64_t)v8, v42, v43, v44, v45, v46);
    }
    uint64_t v47 = objc_alloc_init(BCAnnotationsProtoBook);
    objc_msgSend_setAssetID_(v47, v48, (uint64_t)v8, v49, v50, v51, v52, v53);
    uint64_t v61 = objc_msgSend_appVersion(BDSAppVersion, v54, v55, v56, v57, v58, v59, v60);
    objc_msgSend_setAppVersion_(v47, v62, (uint64_t)v61, v63, v64, v65, v66, v67);

    uint64_t v75 = objc_msgSend_bookAnnotations(self, v68, v69, v70, v71, v72, v73, v74);
    uint64_t v83 = objc_msgSend_length(v75, v76, v77, v78, v79, v80, v81, v82);

    if (v83)
    {
      id v84 = objc_alloc(MEMORY[0x263F62228]);
      v92 = objc_msgSend_bookAnnotations(self, v85, v86, v87, v88, v89, v90, v91);
      v99 = objc_msgSend_initWithData_(v84, v93, (uint64_t)v92, v94, v95, v96, v97, v98);

      BOOL v100 = BCAnnotationsProtoBookReadFrom((char *)v47, (uint64_t)v99);
      if (!v100)
      {
        BDSCloudKitLog();
        v101 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_ERROR)) {
          sub_2361F9694(self, v101, v102, v103, v104, v105, v106, v107);
        }
      }
      int v359 = !v100;
    }
    else
    {
      int v359 = 1;
    }
    uint64_t v363 = (uint64_t)v9;
    v364 = v8;
    v115 = v47;
    v361 = v11;
    v365 = v11;
    v123 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v116, v117, v118, v119, v120, v121, v122);
    objc_msgSend_array(MEMORY[0x263EFF980], v124, v125, v126, v127, v128, v129, v130);
    v368 = v367 = v115;
    long long v373 = 0u;
    long long v374 = 0u;
    long long v375 = 0u;
    long long v376 = 0u;
    v138 = objc_msgSend_annotations(v115, v131, v132, v133, v134, v135, v136, v137);
    uint64_t v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v139, (uint64_t)&v373, (uint64_t)v381, 16, v140, v141, v142);
    v358 = self;
    if (v143)
    {
      uint64_t v144 = v143;
      int v145 = 0;
      uint64_t v146 = *(void *)v374;
      do
      {
        for (uint64_t i = 0; i != v144; ++i)
        {
          if (*(void *)v374 != v146) {
            objc_enumerationMutation(v138);
          }
          v148 = *(void **)(*((void *)&v373 + 1) + 8 * i);
          if (sub_2360E8C40(v148))
          {
            v156 = objc_msgSend_uuid(v148, v149, v150, v151, v152, v153, v154, v155);
            objc_msgSend_setObject_forKeyedSubscript_(v123, v157, (uint64_t)v148, (uint64_t)v156, v158, v159, v160, v161);
          }
          else
          {
            v166 = BDSCloudKitLog();
            if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v380 = v148;
              _os_log_error_impl(&dword_2360BC000, v166, OS_LOG_TYPE_ERROR, "skipping annotation not valid for sync %@", buf, 0xCu);
            }

            objc_msgSend_addObject_(v368, v167, (uint64_t)v148, v168, v169, v170, v171, v172);
            int v145 = 1;
          }
        }
        uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v162, (uint64_t)&v373, (uint64_t)v381, 16, v163, v164, v165);
      }
      while (v144);
    }
    else
    {
      int v145 = 0;
    }

    v180 = objc_msgSend_annotations(v367, v173, v174, v175, v176, v177, v178, v179);
    objc_msgSend_removeObjectsInArray_(v180, v181, (uint64_t)v368, v182, v183, v184, v185, v186);

    long long v371 = 0u;
    long long v372 = 0u;
    long long v369 = 0u;
    long long v370 = 0u;
    v194 = objc_msgSend_annotations(v365, v187, v188, v189, v190, v191, v192, v193);
    uint64_t v199 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v369, (uint64_t)buf, 16, v196, v197, v198);
    if (v199)
    {
      uint64_t v207 = v199;
      uint64_t v208 = *(void *)v370;
      v366 = v123;
      do
      {
        for (uint64_t j = 0; j != v207; ++j)
        {
          if (*(void *)v370 != v208) {
            objc_enumerationMutation(v194);
          }
          v210 = *(void **)(*((void *)&v369 + 1) + 8 * j);
          v211 = objc_msgSend_uuid(v210, v200, v201, v202, v203, v204, v205, v206, v358);
          objc_msgSend_objectForKeyedSubscript_(v123, v212, (uint64_t)v211, v213, v214, v215, v216, v217);
          v218 = (BCProtoAnnotation *)objc_claimAutoreleasedReturnValue();
          if (sub_2360E8C40(v210))
          {
            if (v218)
            {
              objc_msgSend_modificationDate(v210, v219, v220, v221, v222, v223, v224, v225);
              double v227 = v226;
              objc_msgSend_modificationDate(v218, v228, v229, v230, v231, v232, v233, v234);
              if (v227 > v242)
              {
                v243 = v194;
                int v244 = objc_msgSend_deleted(v210, v235, v236, v237, v238, v239, v240, v241);
                v252 = objc_msgSend_shared(MEMORY[0x263F2BA58], v245, v246, v247, v248, v249, v250, v251);
                int v260 = objc_msgSend_verboseLoggingEnabled(v252, v253, v254, v255, v256, v257, v258, v259);

                if (v244)
                {
                  v194 = v243;
                  if (v260)
                  {
                    v268 = BDSCloudKitDevelopmentLog();
                    if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                    {
                      v276 = objc_msgSend_uuid(v210, v269, v270, v271, v272, v273, v274, v275);
                      *(_DWORD *)v377 = 138412290;
                      v378 = v276;
                      _os_log_impl(&dword_2360BC000, v268, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotation updated: annotation %@ is deleted, making a tombstone\\\"\"", v377, 0xCu);

                      v194 = v243;
                    }
                  }
                  objc_msgSend_modificationDate(v210, v261, v262, v263, v264, v265, v266, v267);
                  objc_msgSend_setModificationDate_(v218, v277, v278, v279, v280, v281, v282, v283);
                  bc_turnProtoAnnotationIntoTombstone(v218);
                }
                else
                {
                  v194 = v243;
                  if (v260)
                  {
                    v322 = BDSCloudKitDevelopmentLog();
                    if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
                    {
                      v330 = objc_msgSend_locationCFIString(v210, v323, v324, v325, v326, v327, v328, v329);
                      *(_DWORD *)v377 = 138412290;
                      v378 = v330;
                      _os_log_impl(&dword_2360BC000, v322, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotation updated: annotation at location %@\\\"\"", v377, 0xCu);

                      v194 = v243;
                    }
                  }
                  objc_msgSend_copyTo_(v210, v261, (uint64_t)v218, v263, v264, v265, v266, v267);
                }
                int v145 = 1;
                v123 = v366;
              }
            }
            else
            {
              v218 = objc_alloc_init(BCProtoAnnotation);
              objc_msgSend_copyTo_(v210, v285, (uint64_t)v218, v286, v287, v288, v289, v290);
              objc_msgSend_addAnnotation_(v367, v291, (uint64_t)v218, v292, v293, v294, v295, v296);
              v304 = objc_msgSend_shared(MEMORY[0x263F2BA58], v297, v298, v299, v300, v301, v302, v303);
              int v312 = objc_msgSend_verboseLoggingEnabled(v304, v305, v306, v307, v308, v309, v310, v311);

              if (v312)
              {
                v313 = BDSCloudKitDevelopmentLog();
                if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
                {
                  v321 = objc_msgSend_locationCFIString(v218, v314, v315, v316, v317, v318, v319, v320);
                  *(_DWORD *)v377 = 138412290;
                  v378 = v321;
                  _os_log_impl(&dword_2360BC000, v313, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotations updated: new annotation synced down at %@\\\"\"", v377, 0xCu);
                }
              }
              int v145 = 1;
            }
          }
          else
          {
            v284 = BDSCloudKitLog();
            if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v377 = 138412290;
              v378 = v210;
              _os_log_error_impl(&dword_2360BC000, v284, OS_LOG_TYPE_ERROR, "skipping annotation not valid for sync %@.", v377, 0xCu);
            }
          }
        }
        uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v200, (uint64_t)&v369, (uint64_t)buf, 16, v204, v205, v206);
      }
      while (v207);
    }

    v108 = (char *)v367;
    id v9 = (id)v363;
    if ((v359 | v145))
    {
      objc_msgSend_setAssetVersion_(v358, v331, v363, v332, v333, v334, v335, v336);
      id v337 = objc_alloc_init(MEMORY[0x263F62230]);
      objc_msgSend_writeTo_(v367, v338, (uint64_t)v337, v339, v340, v341, v342, v343);
      v351 = objc_msgSend_immutableData(v337, v344, v345, v346, v347, v348, v349, v350);
      objc_msgSend_setBookAnnotations_(v358, v352, (uint64_t)v351, v353, v354, v355, v356, v357);
    }
    uint64_t v8 = v364;
    uint64_t v11 = v361;
    id v10 = v362;
    uint64_t v19 = v360;
  }
  else
  {
    BDSCloudKitLog();
    v108 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_ERROR)) {
      sub_2361F97C4(self, v108, v109, v110, v111, v112, v113, v114);
    }
  }
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v204.receiver = self;
  v204.super_class = (Class)BCAssetAnnotations;
  [(BCCloudData *)&v204 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    uint64_t v13 = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9, v10, v11, v12);
    uint64_t v21 = objc_msgSend_modificationDate(self, v14, v15, v16, v17, v18, v19, v20);
    if (v21)
    {
      uint64_t v29 = (void *)v21;
      uint64_t v30 = objc_msgSend_modificationDate(self, v22, v23, v24, v25, v26, v27, v28);
      objc_msgSend_timeIntervalSinceReferenceDate(v30, v31, v32, v33, v34, v35, v36, v37);
      double v39 = v38;
      uint64_t v47 = objc_msgSend_modificationDate(v6, v40, v41, v42, v43, v44, v45, v46);
      objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49, v50, v51, v52, v53, v54);
      double v56 = v55;

      if (v39 > v56)
      {
        objc_msgSend_incrementEditGeneration(self, v57, v58, v59, v60, v61, v62, v63);
        goto LABEL_20;
      }
    }
    objc_opt_class();
    uint64_t v70 = objc_msgSend_objectForKey_(v6, v64, @"assetAnnotations", v65, v66, v67, v68, v69);
    uint64_t v71 = BUDynamicCast();
    uint64_t v79 = objc_msgSend_fileURL(v71, v72, v73, v74, v75, v76, v77, v78);

    if (v79)
    {
      uint64_t v87 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x263EFF8F8], v80, (uint64_t)v79, v82, v83, v84, v85, v86);
    }
    else
    {
      uint64_t v87 = 0;
    }
    if (!objc_msgSend_length(v13, v80, v81, v82, v83, v84, v85, v86)
      || !objc_msgSend_length(v87, v94, v95, v96, v97, v98, v99, v100))
    {
      BDSCloudKitLog();
      uint64_t v136 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v136, OS_LOG_TYPE_ERROR)) {
        sub_2361F98CC(self, v136, v170, v171, v172, v173, v174, v175);
      }
      goto LABEL_18;
    }
    uint64_t v107 = objc_msgSend_objectForKeyedSubscript_(v6, v101, @"assetVersion", v102, v103, v104, v105, v106);
    objc_msgSend__mergeInAssetID_assetVersion_serializedData_(self, v108, (uint64_t)v13, (uint64_t)v107, (uint64_t)v87, v109, v110, v111);

    int hasChanges = objc_msgSend_hasChanges(self, v112, v113, v114, v115, v116, v117, v118);
    uint64_t v127 = objc_msgSend_shared(MEMORY[0x263F2BA58], v120, v121, v122, v123, v124, v125, v126);
    int v135 = objc_msgSend_verboseLoggingEnabled(v127, v128, v129, v130, v131, v132, v133, v134);

    if (hasChanges)
    {
      if (!v135)
      {
LABEL_19:

        goto LABEL_20;
      }
      BDSCloudKitDevelopmentLog();
      uint64_t v136 = (char *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v136, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v144 = objc_msgSend_assetID(self, v137, v138, v139, v140, v141, v142, v143);
      uint64_t v152 = objc_msgSend_recordID(v6, v145, v146, v147, v148, v149, v150, v151);
      uint64_t v160 = objc_msgSend_recordName(v152, v153, v154, v155, v156, v157, v158, v159);
      uint64_t v168 = objc_msgSend_debugDescription(self, v161, v162, v163, v164, v165, v166, v167);
      *(_DWORD *)buf = 138412802;
      uint64_t v206 = v144;
      __int16 v207 = 2112;
      uint64_t v208 = v160;
      __int16 v209 = 2112;
      v210 = v168;
      uint64_t v169 = "\"\\\"BCAssetAnnotations %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
    }
    else
    {
      if (!v135) {
        goto LABEL_19;
      }
      BDSCloudKitDevelopmentLog();
      uint64_t v136 = (char *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v136, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v144 = objc_msgSend_assetID(self, v176, v177, v178, v179, v180, v181, v182);
      uint64_t v152 = objc_msgSend_recordID(v6, v183, v184, v185, v186, v187, v188, v189);
      uint64_t v160 = objc_msgSend_recordName(v152, v190, v191, v192, v193, v194, v195, v196);
      uint64_t v168 = objc_msgSend_debugDescription(self, v197, v198, v199, v200, v201, v202, v203);
      *(_DWORD *)buf = 138412802;
      uint64_t v206 = v144;
      __int16 v207 = 2112;
      uint64_t v208 = v160;
      __int16 v209 = 2112;
      v210 = v168;
      uint64_t v169 = "\"\\\"BCAssetAnnotations %@ Resolving: Identical properties from record: %@ %@\\\"\"";
    }
    _os_log_impl(&dword_2360BC000, (os_log_t)v136, OS_LOG_TYPE_DEFAULT, v169, buf, 0x20u);

    goto LABEL_18;
  }
  uint64_t v13 = BDSCloudKitLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_2361F9848(self, (const char *)v13, v88, v89, v90, v91, v92, v93);
  }
LABEL_20:
}

- (id)recordType
{
  return @"assetAnnotations";
}

+ (id)propertyIDKey
{
  return @"assetID";
}

- (id)zoneName
{
  return @"AssetZone";
}

- (NSString)debugDescription
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_assetID(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v18 = objc_msgSend_assetVersion(self, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v26 = objc_msgSend_bookAnnotations(self, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v33 = objc_msgSend_stringWithFormat_(v9, v27, @"assetID: %@, assetVersion: %@, statistics: %@", v28, v29, v30, v31, v32, v10, v18, v26);

  return (NSString *)v33;
}

@end