@interface BLFamilyCircleController
+ (id)sharedInstance;
- (BLFamilyCircleController)init;
- (NSMutableSet)cachedDSIDs;
- (NSMutableSet)ignoredDSIDs;
- (OS_dispatch_queue)dispatchQueue;
- (void)dq_processFamilyCircle:(id)a3 completion:(id)a4;
- (void)refreshWithCompletion:(id)a3;
- (void)setCachedDSIDs:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIgnoredDSIDs:(id)a3;
@end

@implementation BLFamilyCircleController

+ (id)sharedInstance
{
  if (qword_267D25410 != -1) {
    dispatch_once(&qword_267D25410, &unk_26CED3F50);
  }
  v2 = (void *)qword_26AB40058;

  return v2;
}

- (BLFamilyCircleController)init
{
  v29.receiver = self;
  v29.super_class = (Class)BLFamilyCircleController;
  v2 = [(BLFamilyCircleController *)&v29 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iBooks.BLFamilyCircleController", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v9 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v6, v7, v8);
    v13 = objc_msgSend_activeStoreAccount(v9, v10, v11, v12);
    v17 = objc_msgSend_ams_DSID(v13, v14, v15, v16);

    uint64_t v21 = objc_msgSend_set(MEMORY[0x263EFF9C0], v18, v19, v20);
    cachedDSIDs = v2->_cachedDSIDs;
    v2->_cachedDSIDs = (NSMutableSet *)v21;

    if (v17) {
      objc_msgSend_addObject_(v2->_cachedDSIDs, v23, (uint64_t)v17, v25);
    }
    uint64_t v26 = objc_msgSend_set(MEMORY[0x263EFF9C0], v23, v24, v25);
    ignoredDSIDs = v2->_ignoredDSIDs;
    v2->_ignoredDSIDs = (NSMutableSet *)v26;
  }
  return v2;
}

- (void)refreshWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v5, v6, v7);
  uint64_t v12 = objc_msgSend_activeStoreAccount(v8, v9, v10, v11);

  if (v12)
  {
    objc_msgSend_defaultBag(MEMORY[0x263F2BA48], v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc(MEMORY[0x263F27C78]);
    uint64_t v19 = objc_msgSend_initWithAccount_bag_(v17, v18, (uint64_t)v12, (uint64_t)v16);
    v23 = objc_msgSend_performFamilyInfoLookup(v19, v20, v21, v22);
    objc_initWeak(location, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_21E036D1C;
    v35[3] = &unk_26448CDA0;
    v35[4] = self;
    objc_copyWeak(&v37, location);
    id v36 = v4;
    objc_msgSend_addFinishBlock_(v23, v24, (uint64_t)v35, v25);

    objc_destroyWeak(&v37);
    objc_destroyWeak(location);
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v26 = BLFamilyLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_21DFE3000, v26, OS_LOG_TYPE_DEFAULT, "Attempted to look up family circle without a logged in account", (uint8_t *)location, 2u);
  }

  v30 = objc_msgSend_ignoredDSIDs(self, v27, v28, v29);
  objc_msgSend_removeAllObjects(v30, v31, v32, v33);

  uint64_t v16 = (void (**)(void, void, void, void))MEMORY[0x223C1EDC0](v4);
  if (v16)
  {
    uint64_t v19 = objc_opt_new();
    v23 = objc_opt_new();
    v34 = objc_opt_new();
    ((void (**)(void, void *, void *, void *))v16)[2](v16, v19, v23, v34);

    goto LABEL_7;
  }
LABEL_8:
}

- (void)dq_processFamilyCircle:(id)a3 completion:(id)a4
{
  uint64_t v183 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v11 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v8, v9, v10);
  uint64_t v15 = objc_msgSend_activeStoreAccount(v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_ams_DSID(v15, v16, v17, v18);

  v23 = objc_msgSend_set(MEMORY[0x263EFF9C0], v20, v21, v22);
  v27 = objc_msgSend_cachedDSIDs(self, v24, v25, v26);
  v165 = objc_msgSend_mutableCopy(v27, v28, v29, v30);

  if (objc_msgSend_count(v6, v31, v32, v33))
  {
    v162 = v19;
    id v163 = v7;
    id v37 = objc_msgSend_valueForKey_(v6, v34, @"iTunesDSID", v36);
    objc_msgSend_addObjectsFromArray_(v23, v38, (uint64_t)v37, v39);

    v42 = objc_msgSend_valueForKey_(v6, v40, @"iCloudDSID", v41);
    objc_msgSend_addObjectsFromArray_(v23, v43, (uint64_t)v42, v44);

    v48 = objc_msgSend_set(MEMORY[0x263EFF9C0], v45, v46, v47);
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    id v164 = v6;
    id v49 = v6;
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v166, (uint64_t)v182, 16);
    if (!v51) {
      goto LABEL_20;
    }
    uint64_t v55 = v51;
    uint64_t v56 = *(void *)v167;
    while (1)
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v167 != v56) {
          objc_enumerationMutation(v49);
        }
        v58 = *(void **)(*((void *)&v166 + 1) + 8 * i);
        if ((objc_msgSend_isCurrentSignedInUser(v58, v52, v53, v54) & 1) == 0)
        {
          char isSharingPurchases = objc_msgSend_isSharingPurchases(v58, v52, v53, v54);
          v63 = objc_msgSend_iCloudDSID(v58, v60, v61, v62);

          if (isSharingPurchases)
          {
            if (v63)
            {
              v67 = objc_msgSend_ignoredDSIDs(self, v64, v65, v66);
              v71 = objc_msgSend_iCloudDSID(v58, v68, v69, v70);
              objc_msgSend_removeObject_(v67, v72, (uint64_t)v71, v73);
            }
            v74 = objc_msgSend_iTunesDSID(v58, v64, v65, v66);

            if (v74)
            {
              v75 = objc_msgSend_ignoredDSIDs(self, v52, v53, v54);
              v79 = objc_msgSend_iTunesDSID(v58, v76, v77, v78);
              objc_msgSend_removeObject_(v75, v80, (uint64_t)v79, v81);

LABEL_17:
              continue;
            }
          }
          else
          {
            if (v63)
            {
              v82 = objc_msgSend_iCloudDSID(v58, v64, v65, v66);
              objc_msgSend_addObject_(v48, v83, (uint64_t)v82, v84);
            }
            v85 = objc_msgSend_iTunesDSID(v58, v64, v65, v66);

            if (v85)
            {
              v75 = objc_msgSend_iTunesDSID(v58, v52, v53, v54);
              objc_msgSend_addObject_(v48, v86, (uint64_t)v75, v87);
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v166, (uint64_t)v182, 16);
      if (!v55)
      {
LABEL_20:

        v91 = objc_msgSend_ignoredDSIDs(self, v88, v89, v90);
        objc_msgSend_minusSet_(v48, v92, (uint64_t)v91, v93);

        v97 = objc_msgSend_ignoredDSIDs(self, v94, v95, v96);
        objc_msgSend_intersectSet_(v97, v98, (uint64_t)v23, v99);

        v103 = objc_msgSend_ignoredDSIDs(self, v100, v101, v102);
        objc_msgSend_unionSet_(v103, v104, (uint64_t)v48, v105);

        v106 = v165;
        objc_msgSend_unionSet_(v165, v107, (uint64_t)v48, v108);
        v112 = objc_msgSend_ignoredDSIDs(self, v109, v110, v111);
        objc_msgSend_minusSet_(v23, v113, (uint64_t)v112, v114);

        id v7 = v163;
        id v6 = v164;
        uint64_t v19 = v162;
        goto LABEL_24;
      }
    }
  }
  if (v19) {
    objc_msgSend_addObject_(v23, v34, (uint64_t)v19, v36);
  }
  v118 = objc_msgSend_ignoredDSIDs(self, v34, v35, v36);
  objc_msgSend_removeAllObjects(v118, v119, v120, v121);

  v106 = v165;
LABEL_24:
  v122 = objc_msgSend_mutableCopy(v23, v115, v116, v117);
  v126 = objc_msgSend_cachedDSIDs(self, v123, v124, v125);
  objc_msgSend_minusSet_(v122, v127, (uint64_t)v126, v128);

  objc_msgSend_minusSet_(v106, v129, (uint64_t)v23, v130);
  v134 = objc_msgSend_cachedDSIDs(self, v131, v132, v133);
  v138 = objc_msgSend_mutableCopy(v134, v135, v136, v137);

  objc_msgSend_intersectSet_(v138, v139, (uint64_t)v23, v140);
  v144 = objc_msgSend_mutableCopy(v23, v141, v142, v143);
  objc_msgSend_setCachedDSIDs_(self, v145, (uint64_t)v144, v146);

  v147 = BLFamilyLog();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v151 = objc_msgSend_count(v122, v148, v149, v150);
    uint64_t v155 = objc_msgSend_count(v106, v152, v153, v154);
    uint64_t v159 = objc_msgSend_count(v138, v156, v157, v158);
    *(_DWORD *)buf = 138413570;
    v171 = v122;
    __int16 v172 = 2048;
    uint64_t v173 = v151;
    __int16 v174 = 2112;
    v175 = v106;
    __int16 v176 = 2048;
    uint64_t v177 = v155;
    __int16 v178 = 2112;
    v179 = v138;
    __int16 v180 = 2048;
    uint64_t v181 = v159;
    _os_log_impl(&dword_21DFE3000, v147, OS_LOG_TYPE_DEFAULT, "Processed Family:  Added: %@ (%lu) | Removed: %@ (%lu) | Unchanged: %@ (%lu)", buf, 0x3Eu);
  }

  uint64_t v160 = MEMORY[0x223C1EDC0](v7);
  v161 = (void *)v160;
  if (v160) {
    (*(void (**)(uint64_t, void *, void *, void *))(v160 + 16))(v160, v122, v106, v138);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableSet)cachedDSIDs
{
  return self->_cachedDSIDs;
}

- (void)setCachedDSIDs:(id)a3
{
}

- (NSMutableSet)ignoredDSIDs
{
  return self->_ignoredDSIDs;
}

- (void)setIgnoredDSIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDSIDs, 0);
  objc_storeStrong((id *)&self->_cachedDSIDs, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end