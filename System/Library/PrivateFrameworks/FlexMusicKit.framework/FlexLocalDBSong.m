@interface FlexLocalDBSong
- (BOOL)canPlay;
- (CKRecordID)recordID;
- (NSSet)genreStrings;
- (NSSet)regionStrings;
- (NSSet)tagIDs;
- (void)setGenreStrings:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRegionStrings:(id)a3;
@end

@implementation FlexLocalDBSong

- (NSSet)tagIDs
{
  uint64_t v171 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_set(MEMORY[0x263EFF9C0], a2, v2, v3, v4);
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  v11 = objc_msgSend_genres(self, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v165, (uint64_t)v170, 16);
  if (v13)
  {
    uint64_t v18 = v13;
    uint64_t v19 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v166 != v19) {
          objc_enumerationMutation(v11);
        }
        v21 = objc_msgSend_genreTag(*(void **)(*((void *)&v165 + 1) + 8 * i), v14, v15, v16, v17);
        objc_msgSend_addObject_(v6, v22, (uint64_t)v21, v23, v24);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v165, (uint64_t)v170, 16);
    }
    while (v18);
  }

  v29 = objc_msgSend_mood(self, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_length(v29, v30, v31, v32, v33);

  if (v34)
  {
    v39 = NSString;
    v40 = objc_msgSend_mood(self, v35, v36, v37, v38);
    v44 = objc_msgSend_stringWithFormat_(v39, v41, @"%@%@", v42, v43, @"Mood_", v40);
    objc_msgSend_addObject_(v6, v45, (uint64_t)v44, v46, v47);
  }
  v48 = objc_msgSend_moodAlt(self, v35, v36, v37, v38);
  uint64_t v53 = objc_msgSend_length(v48, v49, v50, v51, v52);

  if (v53)
  {
    v58 = NSString;
    v59 = objc_msgSend_moodAlt(self, v54, v55, v56, v57);
    v63 = objc_msgSend_stringWithFormat_(v58, v60, @"%@%@", v61, v62, @"MoodAlt_", v59);
    objc_msgSend_addObject_(v6, v64, (uint64_t)v63, v65, v66);
  }
  v67 = objc_msgSend_pace(self, v54, v55, v56, v57);
  uint64_t v72 = objc_msgSend_length(v67, v68, v69, v70, v71);

  if (v72)
  {
    v77 = NSString;
    v78 = objc_msgSend_pace(self, v73, v74, v75, v76);
    v82 = objc_msgSend_stringWithFormat_(v77, v79, @"%@%@", v80, v81, @"SongPace_", v78);
    objc_msgSend_addObject_(v6, v83, (uint64_t)v82, v84, v85);
  }
  v86 = NSString;
  uint64_t v87 = objc_msgSend_style(self, v73, v74, v75, v76);
  v91 = objc_msgSend_stringWithFormat_(v86, v88, @"%@%lld", v89, v90, @"Style_", v87);
  objc_msgSend_addObject_(v6, v92, (uint64_t)v91, v93, v94);

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v99 = objc_msgSend_regions(self, v95, v96, v97, v98);
  uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v161, (uint64_t)v169, 16);
  if (v101)
  {
    uint64_t v106 = v101;
    uint64_t v107 = *(void *)v162;
    do
    {
      for (uint64_t j = 0; j != v106; ++j)
      {
        if (*(void *)v162 != v107) {
          objc_enumerationMutation(v99);
        }
        v109 = objc_msgSend_countryCode(*(void **)(*((void *)&v161 + 1) + 8 * j), v102, v103, v104, v105);
        objc_msgSend_addObject_(v6, v110, (uint64_t)v109, v111, v112);
      }
      uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v161, (uint64_t)v169, 16);
    }
    while (v106);
  }

  objc_msgSend_arousal(self, v113, v114, v115, v116);
  if (v121 > 0.0)
  {
    v122 = NSString;
    objc_msgSend_arousal(self, v117, v118, v119, v120);
    v127 = objc_msgSend_stringWithFormat_(v122, v123, @"%@%g", v124, v125, @"Arousal_", v126);
    objc_msgSend_addObject_(v6, v128, (uint64_t)v127, v129, v130);
  }
  objc_msgSend_valence(self, v117, v118, v119, v120);
  if (v135 > 0.0)
  {
    v136 = NSString;
    objc_msgSend_valence(self, v131, v132, v133, v134);
    v141 = objc_msgSend_stringWithFormat_(v136, v137, @"%@%g", v138, v139, @"Valence_", v140);
    objc_msgSend_addObject_(v6, v142, (uint64_t)v141, v143, v144);
  }
  objc_msgSend_visualTempo(self, v131, v132, v133, v134);
  if (v149 > 0.0)
  {
    v150 = NSString;
    objc_msgSend_visualTempo(self, v145, v146, v147, v148);
    v155 = objc_msgSend_stringWithFormat_(v150, v151, @"%@%g", v152, v153, @"VisualTempo_", v154);
    objc_msgSend_addObject_(v6, v156, (uint64_t)v155, v157, v158);
  }
  v159 = objc_msgSend_copy(v6, v145, v146, v147, v148);

  return (NSSet *)v159;
}

- (void)setRecordID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v10 = 0;
  uint64_t v4 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], a2, (uint64_t)a3, 1, (uint64_t)&v10);
  id v8 = v10;
  if (v8)
  {
    uint64_t v9 = FlexLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_217A2F000, v9, OS_LOG_TYPE_DEFAULT, "Error %@ archiving record ID", buf, 0xCu);
    }
  }
  objc_msgSend_setRecordData_(self, v5, (uint64_t)v4, v6, v7);
}

- (CKRecordID)recordID
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08928];
  uint64_t v4 = objc_opt_class();
  uint64_t v9 = objc_msgSend_recordData(self, v5, v6, v7, v8);
  id v15 = 0;
  v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v3, v10, v4, (uint64_t)v9, (uint64_t)&v15);
  id v12 = v15;

  if (v12)
  {
    uint64_t v13 = FlexLogForCategory(3uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_217A2F000, v13, OS_LOG_TYPE_DEFAULT, "Error %@ archiving record ID", buf, 0xCu);
    }
  }
  return (CKRecordID *)v11;
}

- (NSSet)genreStrings
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_set(MEMORY[0x263EFF9C0], a2, v2, v3, v4);
  v11 = objc_msgSend_managedObjectContext(self, v7, v8, v9, v10);
  id v15 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v12, @"Genres", v13, v14);
  uint64_t v19 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v16, @"song == %@", v17, v18, self);
  objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

  id v48 = 0;
  v25 = objc_msgSend_executeFetchRequest_error_(v11, v23, (uint64_t)v15, (uint64_t)&v48, v24);
  id v26 = v48;
  uint64_t v27 = v26;
  if (v25) {
    BOOL v28 = v26 == 0;
  }
  else {
    BOOL v28 = 0;
  }
  if (v28)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v29 = v25;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v49, 16);
    if (v31)
    {
      uint64_t v36 = v31;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v29);
          }
          v39 = objc_msgSend_genreTag(*(void **)(*((void *)&v44 + 1) + 8 * i), v32, v33, v34, v35);
          objc_msgSend_addObject_(v6, v40, (uint64_t)v39, v41, v42);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v44, (uint64_t)v49, 16);
      }
      while (v36);
    }
  }
  else
  {
    v29 = FlexLogForCategory(3uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_217A5B9AC((uint64_t)v27, v29);
    }
  }

  return (NSSet *)v6;
}

- (void)setGenreStrings:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v76 = self;
  uint64_t v9 = objc_msgSend_managedObjectContext(self, v5, v6, v7, v8);
  uint64_t v10 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v15 = objc_msgSend_count(v4, v11, v12, v13, v14);
  uint64_t v74 = objc_msgSend_setWithCapacity_(v10, v16, v15, v17, v18);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v4;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v78, (uint64_t)v84, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v79 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        BOOL v28 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v21, @"Genres", v22, v23);
        uint64_t v32 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v29, @"(song == %@) AND (genreTag == %@)", v30, v31, v76, v27);
        objc_msgSend_setPredicate_(v28, v33, (uint64_t)v32, v34, v35);

        id v77 = 0;
        uint64_t v38 = objc_msgSend_executeFetchRequest_error_(v9, v36, (uint64_t)v28, (uint64_t)&v77, v37);
        id v39 = v77;
        long long v44 = v39;
        if (v38) {
          BOOL v45 = v39 == 0;
        }
        else {
          BOOL v45 = 0;
        }
        if (!v45)
        {
          long long v46 = FlexLogForCategory(3uLL);
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 138412290;
          v83 = v44;
          long long v47 = v46;
          id v48 = "Failed to fetch genre:\n%@";
          goto LABEL_19;
        }
        if (objc_msgSend_count(v38, v40, v41, v42, v43))
        {
          if (objc_msgSend_count(v38, v49, v50, v51, v52) == 1)
          {
            long long v46 = objc_msgSend_firstObject(v38, v53, v54, v55, v56);
            objc_msgSend_addObject_(v74, v57, (uint64_t)v46, v58, v59);
            goto LABEL_20;
          }
          long long v46 = FlexLogForCategory(3uLL);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v38;
            long long v47 = v46;
            id v48 = "Duplicate genres:\n%@";
LABEL_19:
            _os_log_error_impl(&dword_217A2F000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
          }
        }
        else
        {
          long long v46 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x263EFF240], v49, @"Genres", (uint64_t)v9, v52);
          objc_msgSend_setGenreTag_(v46, v60, v27, v61, v62);
          objc_msgSend_addObject_(v74, v63, (uint64_t)v46, v64, v65);
        }
LABEL_20:
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v78, (uint64_t)v84, 16);
    }
    while (v24);
  }

  uint64_t v70 = objc_msgSend_copy(v74, v66, v67, v68, v69);
  objc_msgSend_setGenres_(v76, v71, (uint64_t)v70, v72, v73);
}

- (NSSet)regionStrings
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_set(MEMORY[0x263EFF9C0], a2, v2, v3, v4);
  v11 = objc_msgSend_managedObjectContext(self, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v12, @"Regions", v13, v14);
  uint64_t v19 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v16, @"song == %@", v17, v18, self);
  objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

  id v48 = 0;
  uint64_t v25 = objc_msgSend_executeFetchRequest_error_(v11, v23, (uint64_t)v15, (uint64_t)&v48, v24);
  id v26 = v48;
  uint64_t v27 = v26;
  if (v25) {
    BOOL v28 = v26 == 0;
  }
  else {
    BOOL v28 = 0;
  }
  if (v28)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v29 = v25;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v44, (uint64_t)v49, 16);
    if (v31)
    {
      uint64_t v36 = v31;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v29);
          }
          id v39 = objc_msgSend_countryCode(*(void **)(*((void *)&v44 + 1) + 8 * i), v32, v33, v34, v35);
          objc_msgSend_addObject_(v6, v40, (uint64_t)v39, v41, v42);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v44, (uint64_t)v49, 16);
      }
      while (v36);
    }
  }
  else
  {
    v29 = FlexLogForCategory(3uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_217A5BA24((uint64_t)v27, v29);
    }
  }

  return (NSSet *)v6;
}

- (void)setRegionStrings:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v76 = self;
  uint64_t v9 = objc_msgSend_managedObjectContext(self, v5, v6, v7, v8);
  uint64_t v10 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v15 = objc_msgSend_count(v4, v11, v12, v13, v14);
  uint64_t v74 = objc_msgSend_setWithCapacity_(v10, v16, v15, v17, v18);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v4;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v78, (uint64_t)v84, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v79 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        BOOL v28 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], v21, @"Regions", v22, v23);
        uint64_t v32 = objc_msgSend_predicateWithFormat_(MEMORY[0x263F08A98], v29, @"(song == %@) AND (countryCode == %@)", v30, v31, v76, v27);
        objc_msgSend_setPredicate_(v28, v33, (uint64_t)v32, v34, v35);

        id v77 = 0;
        uint64_t v38 = objc_msgSend_executeFetchRequest_error_(v9, v36, (uint64_t)v28, (uint64_t)&v77, v37);
        id v39 = v77;
        long long v44 = v39;
        if (v38) {
          BOOL v45 = v39 == 0;
        }
        else {
          BOOL v45 = 0;
        }
        if (!v45)
        {
          long long v46 = FlexLogForCategory(3uLL);
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 138412290;
          v83 = v44;
          long long v47 = v46;
          id v48 = "Failed to fetch region:\n%@";
          goto LABEL_19;
        }
        if (objc_msgSend_count(v38, v40, v41, v42, v43))
        {
          if (objc_msgSend_count(v38, v49, v50, v51, v52) == 1)
          {
            long long v46 = objc_msgSend_firstObject(v38, v53, v54, v55, v56);
            objc_msgSend_addObject_(v74, v57, (uint64_t)v46, v58, v59);
            goto LABEL_20;
          }
          long long v46 = FlexLogForCategory(3uLL);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v38;
            long long v47 = v46;
            id v48 = "Duplicate regions:\n%@";
LABEL_19:
            _os_log_error_impl(&dword_217A2F000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
          }
        }
        else
        {
          long long v46 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x263EFF240], v49, @"Regions", (uint64_t)v9, v52);
          objc_msgSend_setCountryCode_(v46, v60, v27, v61, v62);
          objc_msgSend_addObject_(v74, v63, (uint64_t)v46, v64, v65);
        }
LABEL_20:
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v78, (uint64_t)v84, 16);
    }
    while (v24);
  }

  uint64_t v70 = objc_msgSend_copy(v74, v66, v67, v68, v69);
  objc_msgSend_setRegions_(v76, v71, (uint64_t)v70, v72, v73);
}

- (BOOL)canPlay
{
  v5 = objc_msgSend_songBundleURL(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

@end