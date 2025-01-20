@interface CompleteRestoreCoordinatorsTask
- (void)main;
@end

@implementation CompleteRestoreCoordinatorsTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v4 = self->_logKey;
      v5 = self->_clientID;
      reason = self->_reason;
    }
    else
    {
      v5 = 0;
      v4 = 0;
      reason = 0;
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v127 = reason;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@] Checking for incomplete coordinators for client: %{public}@ reason: %{public}@", buf, 0x20u);
  }
  v7 = objc_opt_new();
  v8 = sub_1002CBAAC((uint64_t)v7);
  v96 = +[NSOrderedSet orderedSetWithArray:v8];

  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      logKey = self->_logKey;
    }
    else {
      logKey = 0;
    }
    v11 = logKey;
    id v12 = [v96 count];
    v13 = [v96 array];
    v14 = [v13 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = logKey;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    v127 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] Commonly used count: %ld apps: [%{public}@]", buf, 0x20u);
  }
  if (self) {
    v15 = self->_logKey;
  }
  else {
    v15 = 0;
  }
  v16 = v15;
  self;
  vm_address_t address = 0;
  LODWORD(size) = 0;
  SBSSpringBoardBlockableServerPort();
  SBGetFlattenedIconState();
  vm_deallocate(mach_task_self_, 0, 0);
  v17 = objc_opt_new();

  v97 = +[NSOrderedSet orderedSetWithArray:v17];

  id v18 = [v97 count];
  v19 = ASDLogHandleForCategory();
  uint64_t v20 = (uint64_t)fmin((double)(unint64_t)v18 * 0.15, 25.0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    if (self) {
      v21 = self->_logKey;
    }
    else {
      v21 = 0;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%@] Ordered: Max app count: %ld", buf, 0x16u);
  }

  v98 = +[NSMutableOrderedSet orderedSetWithOrderedSet:range:copyItems:](NSMutableOrderedSet, "orderedSetWithOrderedSet:range:copyItems:", v97, 0, v20, 0);
  [v98 unionOrderedSet:v96];
  v22 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      v23 = self->_logKey;
    }
    else {
      v23 = 0;
    }
    v24 = v23;
    id v25 = [v98 count];
    v26 = [v98 array];
    v27 = [v26 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2114;
    v127 = v27;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Ordered: App count: %ld apps: [%{public}@]", buf, 0x20u);
  }
  v28 = +[NSMutableOrderedSet orderedSetWithOrderedSet:v98];
  [v28 unionOrderedSet:v97];
  v29 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    if (self) {
      v30 = self->_logKey;
    }
    else {
      v30 = 0;
    }
    v31 = [v28 count];
    v32 = [v98 count];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v31 - v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%@] Ordered: Added an additional %ld springboard apps to the end of the prioritized list", buf, 0x16u);
  }

  id v93 = [v98 count];
  id v95 = v28;
  if (self)
  {
    v33 = sub_1002B3410();
    v92 = sub_1002B3FA8((uint64_t)v33);

    vm_size_t size = 0;
    p_vm_size_t size = &size;
    uint64_t v112 = 0x3032000000;
    v113 = sub_100018458;
    v114 = sub_100017DE8;
    id v115 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v106 = 0;
    v107 = &v106;
    uint64_t v108 = 0x2020000000;
    uint64_t v109 = 0;
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x2020000000;
    char v105 = 0;
    v90 = +[NSMutableDictionary dictionary];
    v34 = self->_logKey;
    self;
    v35 = +[NSMutableDictionary dictionary];
    v36 = +[NSMutableArray array];
    v37 = sub_1003E0BA4();
    vm_address_t address = (vm_address_t)_NSConcreteStackBlock;
    p_vm_address_t address = 3221225472;
    uint64_t v118 = (uint64_t)sub_1003F8640;
    v119 = (uint64_t (*)(uint64_t, uint64_t))&unk_100528D40;
    v120 = v36;
    id v121 = v35;
    v122 = v34;
    v38 = v34;
    id v39 = v35;
    v40 = v36;
    [v37 readUsingSession:&address];

    v41 = [CompleteRestoreRestoringInfo alloc];
    id v42 = [v39 copy];
    id v43 = [v40 copy];
    id v44 = v42;
    id v45 = v43;
    if (v41)
    {
      *(void *)v123 = v41;
      *(void *)&v123[8] = CompleteRestoreRestoringInfo;
      v46 = (CompleteRestoreRestoringInfo *)objc_msgSendSuper2((objc_super *)v123, "init");
      if (v46 == v41)
      {
        objc_storeStrong((id *)&v41->_coordinators, v42);
        objc_storeStrong((id *)&v41->_needBootstrap, v43);
        v46 = v41;
      }
    }
    else
    {
      v46 = 0;
    }

    if (v46) {
      id Property = objc_getProperty(v46, v47, 8, 1);
    }
    else {
      id Property = 0;
    }
    id v49 = Property;
    vm_address_t address = 0;
    p_vm_address_t address = (uint64_t)&address;
    uint64_t v118 = 0x3032000000;
    v119 = sub_100018458;
    v120 = sub_100017DE8;
    id v121 = +[NSMutableArray array];
    id v101 = 0;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1003F7C30;
    v127 = (NSString *)&unk_10052CB60;
    v128 = self;
    v133 = &v102;
    v134 = &address;
    id v50 = v49;
    id v129 = v50;
    id v51 = v92;
    id v130 = v51;
    id v52 = v90;
    id v131 = v52;
    id v53 = v95;
    id v132 = v53;
    v135 = &size;
    v136 = &v106;
    id v137 = v93;
    unsigned int v54 = +[IXRestoringAppInstallCoordinator enumerateCoordinatorsWithError:&v101 usingBlock:buf];
    id v94 = v101;
    if ([*(id *)(p_address + 40) count])
    {
      v55 = +[MadBridge shared];
      unsigned int v56 = v54;
      id v57 = v53;
      uint64_t v58 = *(void *)(p_address + 40);
      v59 = self->_logKey;
      uint64_t v60 = v58;
      id v53 = v57;
      unsigned int v54 = v56;
      [v55 transferAppAssetPromisesForCoordinators:v60 logKey:v59];
    }
    if (*((unsigned char *)v103 + 24))
    {
      v61 = +[MadBridge shared];
      [v61 sendDiscoverEvent];
    }
    if (v54)
    {
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_1003F8394;
      v100[3] = &unk_10052CB88;
      v100[4] = self;
      [v52 enumerateKeysAndObjectsUsingBlock:v100];
      if ([(id)p_size[5] count])
      {
        v63 = sub_1003E0BA4();
        v99[0] = _NSConcreteStackBlock;
        v99[1] = 3221225472;
        v99[2] = sub_1003F8608;
        v99[3] = &unk_100523CF8;
        v99[4] = &size;
        [v63 modifyUsingTransaction:v99];

        id v64 = [(id)p_size[5] count];
        v107[3] += (uint64_t)v64;
        v65 = sub_1002B3410();
        v66 = sub_1002B3FA8((uint64_t)v65);

        if (([v51 isEqual:v66] & 1) == 0)
        {
          v67 = sub_1002B3410();
          sub_1002B68B0((uint64_t)v67);
        }
      }
      if (v46) {
        id v68 = objc_getProperty(v46, v62, 16, 1);
      }
      else {
        id v68 = 0;
      }
      id v69 = v68;
      uint64_t v70 = (uint64_t)[v69 count];

      if (v107[3] | v70)
      {
        v76 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = self->_logKey;
          uint64_t v78 = v107[3];
          *(_DWORD *)v123 = 138412802;
          *(void *)&v123[4] = v77;
          *(_WORD *)&v123[12] = 2048;
          *(void *)&v123[14] = v78;
          __int16 v124 = 2048;
          uint64_t v125 = v70;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "[%@] Discovered %ld coordinators to complete and %ld restores that need to be bootstrapped", v123, 0x20u);
        }

        if (v107[3] >= 1)
        {
          v79 = sub_1002B1AD4();
          sub_1002B1F20((uint64_t)v79);
        }
        if (v70 >= 1)
        {
          v80 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            id v91 = v53;
            v82 = self->_logKey;
            if (v46) {
              id v83 = objc_getProperty(v46, v81, 16, 1);
            }
            else {
              id v83 = 0;
            }
            id v84 = v83;
            uint64_t v85 = [v84 componentsJoinedByString:@", "];
            *(_DWORD *)v123 = 138412546;
            *(void *)&v123[4] = v82;
            *(_WORD *)&v123[12] = 2114;
            v89 = (void *)v85;
            *(void *)&v123[14] = v85;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "[%@] Will re-bootstrap restores: [%{public}@]", v123, 0x16u);

            id v53 = v91;
          }
        }
        v73 = sub_1002B3410();
        sub_1002B4918((uint64_t)v73, @"Complete coordinators called", 0, 0);
      }
      else
      {
        v71 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v72 = self->_logKey;
          *(_DWORD *)v123 = 138412290;
          *(void *)&v123[4] = v72;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "[%@] No incomplete coordinators were found.", v123, 0xCu);
        }

        v73 = sub_1002B1AD4();
        sub_1002B1E14((uint64_t)v73);
      }

      id v75 = 0;
    }
    else
    {
      v74 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v88 = self->_logKey;
        *(_DWORD *)v123 = 138412546;
        *(void *)&v123[4] = v88;
        *(_WORD *)&v123[12] = 2114;
        *(void *)&v123[14] = v94;
        _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "[%@] Failed to enumerate restoring coordinators error: %{public}@", v123, 0x16u);
      }

      id v75 = v94;
    }

    _Block_object_dispose(&address, 8);
    _Block_object_dispose(&v102, 8);
    _Block_object_dispose(&v106, 8);
    _Block_object_dispose(&size, 8);

    id v86 = v75;
    self->super._success = v54;
    objc_setProperty_atomic_copy(self, v87, v86, 32);
  }
  else
  {

    id v86 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end