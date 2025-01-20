@interface NTKParmesanGallerySuggestedShuffleDataSource
+ (id)shared;
- (BOOL)_copyFile:(id)a3 to:(id)a4;
- (BOOL)_createResourceDirectoryForShuffle:(id)a3 asset:(id)a4 at:(id)a5;
- (BOOL)isPrepared;
- (NSArray)suggestedShuffleUUIDStrings;
- (id)_cacheDirectoryPath;
- (id)_init;
- (id)_pickAssetFromShuffle:(id)a3;
- (id)resourceDirectoryForUUIDString:(id)a3;
- (void)_queue_createResourceDirectoryForShuffle:(id)a3 completion:(id)a4;
- (void)_queue_notifyObserversShuffleUpdated;
- (void)addObserver:(id)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NTKParmesanGallerySuggestedShuffleDataSource

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246B6CA78;
  block[3] = &unk_2651FC078;
  block[4] = a1;
  if (qword_2691D8E58 != -1) {
    dispatch_once(&qword_2691D8E58, block);
  }
  v2 = (void *)qword_2691D8E50;

  return v2;
}

- (id)_init
{
  v29.receiver = self;
  v29.super_class = (Class)NTKParmesanGallerySuggestedShuffleDataSource;
  v2 = [(NTKParmesanGallerySuggestedShuffleDataSource *)&v29 init];
  v6 = v2;
  if (v2)
  {
    v2->_isPrepared = 0;
    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4, v5);
    suggestedShuffleIDs = v6->_suggestedShuffleIDs;
    v6->_suggestedShuffleIDs = (NSArray *)v7;

    uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v9, v10, v11);
    resourceDirectoriesForUUID = v6->_resourceDirectoriesForUUID;
    v6->_resourceDirectoriesForUUID = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.NanoTimeKit.PhotosFaceSuggestedShufflesQ", v14);
    workQ = v6->_workQ;
    v6->_workQ = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.NanoTimeKit.PhotosFaceSuggestedShuffleNotificationQ", v14);
    observerQ = v6->_observerQ;
    v6->_observerQ = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (NSMutableSet *)v19;

    int out_token = 0;
    objc_initWeak(&location, v6);
    v21 = (const char *)*MEMORY[0x263F5DEA8];
    v22 = v6->_workQ;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_246B6CC7C;
    v24[3] = &unk_2651FC0A0;
    objc_copyWeak(&v26, &location);
    v25 = v6;
    notify_register_dispatch(v21, &out_token, v22, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)prepareWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8 = v4;
  if (self->_isPrepared)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    v9 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_246B51000, v9, OS_LOG_TYPE_DEFAULT, "prepareWithCompletion: Preparing shuffles for data source: %@", buf, 0xCu);
    }

    objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11, v12);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    resourceDirectoriesForUUID = self->_resourceDirectoriesForUUID;
    self->_resourceDirectoriesForUUID = v13;

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_246B6CEE4;
    v17[3] = &unk_2651FC140;
    v17[4] = self;
    id v18 = v8;
    objc_msgSend_fetchGalleryShufflesWithCompletion_(NTKParmesanPhotoProcessor, v15, (uint64_t)v17, v16);
  }
}

- (NSArray)suggestedShuffleUUIDStrings
{
  if (self->_isPrepared)
  {
    id v4 = objc_msgSend_allKeys(self->_resourceDirectoriesForUUID, a2, v2, v3);
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v4;
}

- (id)resourceDirectoryForUUIDString:(id)a3
{
  if (self->_isPrepared)
  {
    id v4 = objc_msgSend_objectForKeyedSubscript_(self->_resourceDirectoriesForUUID, a2, (uint64_t)a3, v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQ = self->_observerQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_246B6D554;
  v7[3] = &unk_2651FC168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQ, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQ = self->_observerQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_246B6D5F8;
  v7[3] = &unk_2651FC168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQ, v7);
}

- (void)_queue_notifyObserversShuffleUpdated
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_logObject(NTKParmesanFaceBundle, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = self;
    _os_log_impl(&dword_246B51000, v5, OS_LOG_TYPE_DEFAULT, "_queue_notifyObserversShuffleUpdated: data source updated: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  observerQ = self->_observerQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_246B6D730;
  block[3] = &unk_2651FC1B0;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(observerQ, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_queue_createResourceDirectoryForShuffle:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v11 = objc_msgSend__cacheDirectoryPath(self, v8, v9, v10);
  dispatch_queue_t v15 = objc_msgSend_uuidString(v6, v12, v13, v14);
  id v18 = objc_msgSend_stringByAppendingPathComponent_(v11, v16, (uint64_t)v15, v17);

  char v38 = 0;
  v22 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v19, v20, v21);
  int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v22, v23, (uint64_t)v18, (uint64_t)&v38);
  char v28 = isDirectory;
  if (isDirectory)
  {
    if (!v38)
    {
      v31 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v25, @"com.apple.parmesan.galleryShuffle", 4, 0);
      v7[2](v7, 0, v31);

      goto LABEL_7;
    }
    objc_super v29 = objc_msgSend_logObject(NTKParmesanFaceBundle, v25, v26, v27);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v18;
      _os_log_impl(&dword_246B51000, v29, OS_LOG_TYPE_DEFAULT, "_queue_createResourceDirectoryForShuffle: directory %@ already exists", buf, 0xCu);
    }
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_246B6D9CC;
  v32[3] = &unk_2651FC200;
  v32[4] = self;
  id v33 = v18;
  v36 = v7;
  id v34 = v6;
  char v37 = v28;
  id v35 = v22;
  objc_msgSend_fetchAssetsInGalleryShuffle_completion_(NTKParmesanPhotoProcessor, v30, (uint64_t)v34, (uint64_t)v32);

LABEL_7:
}

- (id)_cacheDirectoryPath
{
  if (qword_2691D8E68 != -1) {
    dispatch_once(&qword_2691D8E68, &unk_26FB1C220);
  }
  uint64_t v2 = (void *)qword_2691D8E60;

  return v2;
}

- (id)_pickAssetFromShuffle:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(v3, v5, v6, v7);
  uint64_t v11 = objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = v3;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v46, (uint64_t)v51, 16);
  if (v14)
  {
    uint64_t v18 = v14;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v12);
        }
        uint64_t v21 = objc_msgSend_localIdentifier(*(void **)(*((void *)&v46 + 1) + 8 * i), v15, v16, v17);
        objc_msgSend_addObject_(v11, v22, (uint64_t)v21, v23);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v46, (uint64_t)v51, 16);
    }
    while (v18);
  }

  objc_msgSend_sortUsingComparator_(v11, v24, (uint64_t)&unk_26FB1C240, v25);
  objc_super v29 = objc_msgSend_firstObject(v11, v26, v27, v28);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v30 = v12;
  id v35 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v42, (uint64_t)v50, 16);
  if (v35)
  {
    uint64_t v36 = *(void *)v43;
    while (2)
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v30);
        }
        char v38 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
        v39 = objc_msgSend_localIdentifier(v38, v32, v33, v34, (void)v42);
        int v40 = NTKEqualStrings();

        if (v40)
        {
          id v35 = v38;
          goto LABEL_18;
        }
      }
      id v35 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v42, (uint64_t)v50, 16);
      if (v35) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v35;
}

- (BOOL)_createResourceDirectoryForShuffle:(id)a3 asset:(id)a4 at:(id)a5
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13);
  id v185 = 0;
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v10, 1, 0, &v185);
  id v19 = v185;
  if (v19)
  {
    uint64_t v20 = objc_msgSend_logObject(NTKParmesanFaceBundle, v16, v17, v18);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_246C2B0DC((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);
    }
    BOOL v27 = 0;
  }
  else
  {
    uint64_t v28 = NSString;
    objc_msgSend_resourceDirectory(v9, v16, v17, v18);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v33 = objc_msgSend_fileSystemRepresentation(v29, v30, v31, v32);
    uint64_t v20 = objc_msgSend_stringWithCString_encoding_(v28, v34, v33, 4);

    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    char v38 = objc_msgSend_layouts(v9, v35, v36, v37);
    long long v42 = objc_msgSend_allKeys(v38, v39, v40, v41);

    id obj = v42;
    id v176 = v9;
    uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v181, (uint64_t)v188, 16);
    if (v179)
    {
      long long v47 = self;
      uint64_t v178 = *(void *)v182;
      v174 = v14;
      id v175 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v179; ++i)
        {
          if (*(void *)v182 != v178) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = *(void *)(*((void *)&v181 + 1) + 8 * i);
          v50 = objc_msgSend_layouts(v9, v44, v45, v46, v174, v175);
          v53 = objc_msgSend_objectForKeyedSubscript_(v50, v51, v49, v52);

          v57 = objc_msgSend_baseImageName(v53, v54, v55, v56);
          v60 = objc_msgSend_stringByAppendingPathComponent_(v20, v58, (uint64_t)v57, v59);

          v64 = objc_msgSend_baseImageName(v53, v61, v62, v63);
          v67 = objc_msgSend_stringByAppendingPathComponent_(v10, v65, (uint64_t)v64, v66);

          if (!objc_msgSend__copyFile_to_(v47, v68, (uint64_t)v60, (uint64_t)v67)) {
            goto LABEL_33;
          }
          v72 = objc_msgSend_mask(v53, v69, v70, v71);
          v76 = objc_msgSend_imageName(v72, v73, v74, v75);

          if (v76)
          {
            v80 = objc_msgSend_mask(v53, v77, v78, v79);
            v84 = objc_msgSend_imageName(v80, v81, v82, v83);
            v180 = objc_msgSend_stringByAppendingPathComponent_(v20, v85, (uint64_t)v84, v86);

            v90 = objc_msgSend_mask(v53, v87, v88, v89);
            v94 = objc_msgSend_imageName(v90, v91, v92, v93);
            objc_msgSend_stringByAppendingPathComponent_(v10, v95, (uint64_t)v94, v96);
            v97 = v20;
            v99 = id v98 = v10;

            LODWORD(v90) = objc_msgSend__copyFile_to_(v47, v100, (uint64_t)v180, (uint64_t)v99);
            id v10 = v98;
            uint64_t v20 = v97;

            id v9 = v176;
            if (!v90)
            {
LABEL_33:
              uint64_t v14 = v174;
              id v8 = v175;
              goto LABEL_37;
            }
          }
        }
        uint64_t v14 = v174;
        id v8 = v175;
        uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v181, (uint64_t)v188, 16);
        if (v179) {
          continue;
        }
        break;
      }
    }
    v101 = v10;

    v102 = objc_opt_new();
    v106 = objc_msgSend_asDictionary(v9, v103, v104, v105);
    objc_msgSend_addObject_(v102, v107, (uint64_t)v106, v108);

    v53 = objc_opt_new();
    v111 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v109, 2, v110);
    objc_msgSend_setObject_forKeyedSubscript_(v53, v112, (uint64_t)v111, (uint64_t)kParmesanReaderVersionKey);

    id obj = v102;
    objc_msgSend_setObject_forKeyedSubscript_(v53, v113, (uint64_t)v102, (uint64_t)kParmesanReaderImageListKey);
    v117 = objc_msgSend_people(v8, v114, v115, v116);
    uint64_t v121 = objc_msgSend_count(v117, v118, v119, v120);

    if (v121)
    {
      v125 = objc_msgSend_people(v8, v122, v123, v124);
      v129 = objc_msgSend_allObjects(v125, v126, v127, v128);
      objc_msgSend_setObject_forKeyedSubscript_(v53, v130, (uint64_t)v129, (uint64_t)kParmesanReaderPeopleIdentifiersKey);
    }
    v131 = objc_msgSend_people(v8, v122, v123, v124);
    uint64_t v135 = objc_msgSend_count(v131, v132, v133, v134);
    uint64_t v137 = MEMORY[0x263EFFA88];
    uint64_t v138 = MEMORY[0x263EFFA80];
    if (v135) {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v136, MEMORY[0x263EFFA88], (uint64_t)kParmesanReaderHasPeopleKey);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v136, MEMORY[0x263EFFA80], (uint64_t)kParmesanReaderHasPeopleKey);
    }

    if (objc_msgSend_pets(v8, v139, v140, v141)) {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v142, v137, (uint64_t)kParmesanReaderHasPetsKey);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v142, v138, (uint64_t)kParmesanReaderHasPetsKey);
    }
    if (objc_msgSend_nature(v8, v143, v144, v145)) {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v146, v137, (uint64_t)kParmesanReaderHasNatureKey);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v146, v138, (uint64_t)kParmesanReaderHasNatureKey);
    }
    if (objc_msgSend_cityscape(v8, v147, v148, v149)) {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v150, v137, (uint64_t)kParmesanReaderHasCityscapesKey);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v53, v150, v138, (uint64_t)kParmesanReaderHasCityscapesKey);
    }
    v154 = objc_msgSend_uuidString(v8, v151, v152, v153);
    objc_msgSend_setObject_forKeyedSubscript_(v53, v155, (uint64_t)v154, (uint64_t)kParmesanReaderUUIDStringKey);

    id v10 = v101;
    v60 = objc_msgSend_stringByAppendingPathComponent_(v101, v156, (uint64_t)kParmesanReaderImagelistFileName, v157);
    v161 = objc_msgSend_logObject(NTKParmesanFaceBundle, v158, v159, v160);
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v187 = v60;
      _os_log_impl(&dword_246B51000, v161, OS_LOG_TYPE_DEFAULT, "writing image list to path %@", buf, 0xCu);
    }

    if (objc_msgSend_writeToFile_atomically_(v53, v162, (uint64_t)v60, 0))
    {

      BOOL v27 = 1;
      id v9 = v176;
    }
    else
    {
      v67 = objc_msgSend_logObject(NTKParmesanFaceBundle, v163, v164, v165);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_246C2B070((uint64_t)v60, v67, v166, v167, v168, v169, v170, v171);
      }
      id v9 = v176;
LABEL_37:

      objc_msgSend_removeItemAtPath_error_(v14, v172, (uint64_t)v10, 0);
      BOOL v27 = 0;
    }
    id v19 = 0;
  }

  return v27;
}

- (BOOL)_copyFile:(id)a3 to:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9);
  id v18 = 0;
  objc_msgSend_copyItemAtPath_toPath_error_(v10, v11, (uint64_t)v5, (uint64_t)v6, &v18);
  id v12 = v18;

  if (v12)
  {
    uint64_t v16 = objc_msgSend_logObject(NTKParmesanFaceBundle, v13, v14, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_error_impl(&dword_246B51000, v16, OS_LOG_TYPE_ERROR, "_createResourceDirectoryForShuffle: cannot copy %@ to %@, error == %@", buf, 0x20u);
    }
  }
  return v12 == 0;
}

- (BOOL)isPrepared
{
  return self->_isPrepared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQ, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQ, 0);
  objc_storeStrong((id *)&self->_resourceDirectoriesForUUID, 0);

  objc_storeStrong((id *)&self->_suggestedShuffleIDs, 0);
}

@end