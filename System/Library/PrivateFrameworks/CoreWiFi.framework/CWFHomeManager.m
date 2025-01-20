@interface CWFHomeManager
+ (id)cwfHomeManagerWithDelegate:(id)a3;
- (BOOL)_isHomeInformationAvailable;
- (BOOL)initHomeManagerInstance;
- (CWFHomeManager)initWithDelegate:(id)a3;
- (CWFHomeManagerDelegate)_delegate;
- (CWFSensingAutoDataCollector)_autoDataColletor;
- (HMFLocationAuthorization)_homeLocationAuthorization;
- (HMHomeManager)_homeManager;
- (NSMutableDictionary)_serviceObjects;
- (NSObject)_activeAssertion;
- (OS_dispatch_queue)_serviceQueue;
- (id)getServiceEvents;
- (id)getServiceTypeStringFor:(int64_t)a3;
- (int)createServiceObjectFor:(int64_t)a3 withParams:(id)a4 andAccessory:(id)a5;
- (int)registerForAccessoryStateChange:(id)a3 withParams:(id)a4 forCWFHMServiceType:(int64_t)a5;
- (void)dealloc;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)removeObjectForServieType:(int64_t)a3 withUUID:(id)a4;
- (void)set_activeAssertion:(id)a3;
- (void)set_autoDataColletor:(id)a3;
- (void)set_delegate:(id)a3;
- (void)set_homeLocationAuthorization:(id)a3;
- (void)set_homeManager:(id)a3;
- (void)set_isHomeInformationAvailable:(BOOL)a3;
- (void)set_serviceObjects:(id)a3;
- (void)set_serviceQueue:(id)a3;
@end

@implementation CWFHomeManager

+ (id)cwfHomeManagerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [CWFHomeManager alloc];
  v8 = objc_msgSend_initWithDelegate_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (BOOL)initHomeManagerInstance
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  sub_1B500E57C();
  if (!objc_opt_class())
  {
    v71 = CWFGetOSLog();
    if (v71)
    {
      v31 = CWFGetOSLog();
    }
    else
    {
      v31 = MEMORY[0x1E4F14500];
      id v72 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v79 = 136446722;
      *(void *)&v79[4] = "-[CWFHomeManager initHomeManagerInstance]";
      *(_WORD *)&v79[12] = 2082;
      *(void *)&v79[14] = "CWFHomeManager.m";
      *(_WORD *)&v79[22] = 1024;
      LODWORD(v80) = 90;
      _os_log_send_and_compose_impl();
    }
    BOOL v8 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend__homeManager(self, v3, v4, v5, v6);

  if (!v7)
  {
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2050000000;
    v9 = (void *)qword_1EB4B2688;
    uint64_t v78 = qword_1EB4B2688;
    if (!qword_1EB4B2688)
    {
      *(void *)v79 = MEMORY[0x1E4F143A8];
      *(void *)&v79[8] = 3221225472;
      *(void *)&v79[16] = sub_1B5010314;
      v80 = &unk_1E60BAFD8;
      v81 = &v75;
      sub_1B50101D0();
      Class Class = objc_getClass("HMFLocationAuthorization");
      *(void *)(v81[1] + 24) = Class;
      qword_1EB4B2688 = *(void *)(v81[1] + 24);
      v9 = (void *)v76[3];
    }
    v11 = v9;
    _Block_object_dispose(&v75, 8);
    id v12 = [v11 alloc];
    v16 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], v13, @"/System/Library/PrivateFrameworks/MobileWiFi.framework", v14, v15);
    v20 = objc_msgSend_initWithBundle_(v12, v17, (uint64_t)v16, v18, v19);
    objc_msgSend_set_homeLocationAuthorization_(self, v21, (uint64_t)v20, v22, v23);

    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2050000000;
    v24 = (void *)qword_1EB4B2690;
    uint64_t v78 = qword_1EB4B2690;
    if (!qword_1EB4B2690)
    {
      *(void *)v79 = MEMORY[0x1E4F143A8];
      *(void *)&v79[8] = 3221225472;
      *(void *)&v79[16] = sub_1B5010364;
      v80 = &unk_1E60BAFD8;
      v81 = &v75;
      sub_1B50101D0();
      Class v25 = objc_getClass("HMMutableHomeManagerConfiguration");
      *(void *)(v81[1] + 24) = v25;
      qword_1EB4B2690 = *(void *)(v81[1] + 24);
      v24 = (void *)v76[3];
    }
    id v26 = v24;
    _Block_object_dispose(&v75, 8);
    v31 = objc_msgSend_defaultPrivateConfiguration(v26, v27, v28, v29, v30);
    objc_msgSend_setOptions_(v31, v32, 576, v33, v34);
    objc_msgSend_setAdaptive_(v31, v35, 1, v36, v37);
    v42 = objc_msgSend__homeLocationAuthorization(self, v38, v39, v40, v41);
    objc_msgSend_setLocationAuthorization_(v31, v43, (uint64_t)v42, v44, v45);

    objc_msgSend_setCachePolicy_(v31, v46, 0, v47, v48);
    id v49 = objc_alloc((Class)sub_1B500E57C());
    v53 = objc_msgSend_initWithHomeMangerConfiguration_(v49, v50, (uint64_t)v31, v51, v52);
    objc_msgSend_set_homeManager_(self, v54, (uint64_t)v53, v55, v56);

    v61 = objc_msgSend__homeManager(self, v57, v58, v59, v60);
    BOOL v8 = v61 != 0;

    if (v8)
    {
      v66 = objc_msgSend__homeManager(self, v62, v63, v64, v65);
      objc_msgSend_setDelegate_(v66, v67, (uint64_t)self, v68, v69);
    }
    else
    {
      v73 = CWFGetOSLog();
      if (v73)
      {
        v66 = CWFGetOSLog();
      }
      else
      {
        v66 = MEMORY[0x1E4F14500];
        id v74 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v79 = 136446722;
        *(void *)&v79[4] = "-[CWFHomeManager initHomeManagerInstance]";
        *(_WORD *)&v79[12] = 2082;
        *(void *)&v79[14] = "CWFHomeManager.m";
        *(_WORD *)&v79[22] = 1024;
        LODWORD(v80) = 103;
        _os_log_send_and_compose_impl();
      }
    }

LABEL_11:
    return v8;
  }
  return 0;
}

- (CWFHomeManager)initWithDelegate:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CWFHomeManager;
  uint64_t v5 = [(CWFHomeManager *)&v76 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.CWFHomeManager", 0);
    objc_msgSend_set_serviceQueue_(v5, v7, (uint64_t)v6, v8, v9);

    objc_msgSend_set_isHomeInformationAvailable_(v5, v10, 0, v11, v12);
    v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15, v16);
    objc_msgSend_set_serviceObjects_(v5, v18, (uint64_t)v17, v19, v20);

    objc_msgSend_set_autoDataColletor_(v5, v21, 0, v22, v23);
    objc_msgSend_set_delegate_(v5, v24, (uint64_t)v4, v25, v26);
    v31 = objc_msgSend__delegate(v5, v27, v28, v29, v30);

    if (v31)
    {
      uint64_t v36 = objc_msgSend__delegate(v5, v32, v33, v34, v35);
      uint64_t v41 = objc_msgSend_getServiceEvents(v5, v37, v38, v39, v40);
      uint64_t v45 = objc_msgSend_startMonitoringSupportedEvents_(v36, v42, (uint64_t)v41, v43, v44);

      if (objc_msgSend_code(v45, v46, v47, v48, v49))
      {
        v54 = CWFGetOSLog();
        if (v54)
        {
          uint64_t v55 = CWFGetOSLog();
        }
        else
        {
          uint64_t v55 = MEMORY[0x1E4F14500];
          id v56 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136446722;
          uint64_t v78 = "-[CWFHomeManager initWithDelegate:]";
          __int16 v79 = 2082;
          v80 = "CWFHomeManager.m";
          __int16 v81 = 1024;
          int v82 = 131;
          int v75 = 28;
          id v74 = &v77;
          _os_log_send_and_compose_impl();
        }
      }
      if (objc_msgSend_initHomeManagerInstance(v5, v50, v51, v52, v53, v74, v75))
      {
        v61 = objc_msgSend__homeManager(v5, v57, v58, v59, v60);
        uint64_t v65 = objc_msgSend__beginActiveAssertionWithReason_(v61, v62, @"com.apple.wifi.HMNotificationAssertion", v63, v64);
        objc_msgSend_set_activeAssertion_(v5, v66, (uint64_t)v65, v67, v68);
      }
      else
      {

        v71 = CWFGetOSLog();
        if (v71)
        {
          v61 = CWFGetOSLog();
        }
        else
        {
          v61 = MEMORY[0x1E4F14500];
          id v73 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          int v77 = 136446722;
          uint64_t v78 = "-[CWFHomeManager initWithDelegate:]";
          __int16 v79 = 2082;
          v80 = "CWFHomeManager.m";
          __int16 v81 = 1024;
          int v82 = 136;
          _os_log_send_and_compose_impl();
        }
        uint64_t v5 = 0;
      }
    }
    else
    {
      v70 = CWFGetOSLog();
      if (v70)
      {
        uint64_t v45 = CWFGetOSLog();
      }
      else
      {
        uint64_t v45 = MEMORY[0x1E4F14500];
        id v72 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v77) = 0;
        _os_log_send_and_compose_impl();
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  dispatch_queue_t v6 = objc_msgSend__delegate(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v11 = objc_msgSend__delegate(self, v7, v8, v9, v10);
    uint64_t v16 = objc_msgSend_getServiceEvents(self, v12, v13, v14, v15);
    id v20 = (id)objc_msgSend_stopMonitoringSupportedEvents_(v11, v17, (uint64_t)v16, v18, v19);
  }
  v21.receiver = self;
  v21.super_class = (Class)CWFHomeManager;
  [(CWFHomeManager *)&v21 dealloc];
}

- (void)removeObjectForServieType:(int64_t)a3 withUUID:(id)a4
{
  id v6 = a4;
  objc_msgSend__serviceObjects(self, v7, v8, v9, v10);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_objectForKey_(v22, v11, (uint64_t)v6, v12, v13);

  uint64_t v18 = objc_msgSend_getServiceTypeStringFor_(self, v15, a3, v16, v17);
  objc_msgSend_removeObjectForKey_(v14, v19, (uint64_t)v18, v20, v21);
}

- (int)createServiceObjectFor:(int64_t)a3 withParams:(id)a4 andAccessory:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3 == 1)
  {
    id v9 = a4;
    uint64_t v14 = objc_msgSend__delegate(self, v10, v11, v12, v13);
    uint64_t v16 = objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_(CWFSensingHMADataCollector, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v14);

    if (v16)
    {
      uint64_t v21 = objc_msgSend__serviceQueue(self, v17, v18, v19, v20);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B500EF2C;
      block[3] = &unk_1E60BC330;
      id v22 = v16;
      uint64_t v67 = v22;
      id v23 = v8;
      id v68 = v23;
      uint64_t v69 = self;
      uint64_t v70 = 1;
      dispatch_async(v21, block);

      uint64_t v28 = objc_msgSend__serviceObjects(self, v24, v25, v26, v27);
      uint64_t v33 = objc_msgSend_uniqueIdentifier(v23, v29, v30, v31, v32);
      uint64_t v37 = objc_msgSend_objectForKey_(v28, v34, (uint64_t)v33, v35, v36);
      uint64_t v41 = objc_msgSend_getServiceTypeStringFor_(self, v38, 1, v39, v40);
      objc_msgSend_setObject_forKey_(v37, v42, (uint64_t)v22, (uint64_t)v41, v43);

      uint64_t v44 = CWFGetOSLog();
      if (v44)
      {
        uint64_t v45 = CWFGetOSLog();
      }
      else
      {
        uint64_t v45 = MEMORY[0x1E4F14500];
        id v47 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = objc_msgSend_uniqueIdentifier(v23, v48, v49, v50, v51);
        v57 = objc_msgSend__serviceObjects(self, v53, v54, v55, v56);
        int v71 = 136447234;
        id v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        __int16 v73 = 2082;
        id v74 = "CWFHomeManager.m";
        __int16 v75 = 1024;
        int v76 = 178;
        __int16 v77 = 2114;
        id v78 = v52;
        __int16 v79 = 2114;
        v80 = v57;
        _os_log_send_and_compose_impl();
      }
      int v46 = 0;
      uint64_t v58 = v67;
    }
    else
    {
      uint64_t v60 = CWFGetOSLog();
      if (v60)
      {
        uint64_t v58 = CWFGetOSLog();
      }
      else
      {
        uint64_t v58 = MEMORY[0x1E4F14500];
        id v61 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uniqueIdentifier(v8, v62, v63, v64, v65);
        int v71 = 136446978;
        id v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        __int16 v73 = 2082;
        id v74 = "CWFHomeManager.m";
        __int16 v75 = 1024;
        int v76 = 165;
        __int16 v77 = 2114;
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      int v46 = -3931;
    }
  }
  else
  {
    int v46 = -3900;
  }

  return v46;
}

- (id)getServiceTypeStringFor:(int64_t)a3
{
  if (a3 == 1)
  {
    id v6 = objc_msgSend_stringWithFormat_(NSString, a2, @"CWFSensingDataCollect", v3, v4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)getServiceEvents
{
  id v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B500F258;
  v11[3] = &unk_1E60BD490;
  v11[4] = self;
  uint64_t v7 = (void *)MEMORY[0x1BA995F60](v11);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v8, (uint64_t)v7, @"CWFPerformSensingDataCollect", v9);

  return v6;
}

- (int)registerForAccessoryStateChange:(id)a3 withParams:(id)a4 forCWFHMServiceType:(int64_t)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v119 = a4;
  uint64_t v13 = objc_msgSend__homeManager(self, v9, v10, v11, v12);

  if (!v13)
  {
    v99 = CWFGetOSLog();
    if (v99)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v105 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 225;
LABEL_66:
    _os_log_send_and_compose_impl();
    goto LABEL_67;
  }
  uint64_t v18 = objc_msgSend__delegate(self, v14, v15, v16, v17);

  if (!v18)
  {
    v100 = CWFGetOSLog();
    if (v100)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v106 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 230;
    goto LABEL_66;
  }
  if ((objc_msgSend__isHomeInformationAvailable(self, v19, v20, v21, v22) & 1) == 0)
  {
    v101 = CWFGetOSLog();
    if (v101)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v107 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 235;
    goto LABEL_66;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v98 = CWFGetOSLog();
    if (v98)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v104 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 240;
    goto LABEL_81;
  }
  if (!v119)
  {
    v102 = CWFGetOSLog();
    if (v102)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v113 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 245;
    goto LABEL_81;
  }
  if (a5 >= 2)
  {
    v103 = CWFGetOSLog();
    if (v103)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v114 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 250;
LABEL_81:
    _os_log_send_and_compose_impl();
LABEL_82:
    int v108 = -3900;
    goto LABEL_68;
  }
  int64_t v117 = a5;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v27 = objc_msgSend__homeManager(self, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_homes(v27, v28, v29, v30, v31);

  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v126, (uint64_t)v139, 16);
  if (!v121)
  {
LABEL_67:
    int v108 = -3931;
LABEL_68:
    int v118 = v108;
    goto LABEL_69;
  }
  uint64_t v120 = *(void *)v127;
  int v118 = -3931;
  obuint64_t j = v32;
  id v116 = v8;
  do
  {
    for (uint64_t i = 0; i != v121; ++i)
    {
      if (*(void *)v127 != v120) {
        objc_enumerationMutation(obj);
      }
      uint64_t v39 = *(void **)(*((void *)&v126 + 1) + 8 * i);
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      uint64_t v40 = objc_msgSend_accessories(v39, v34, v35, v36, v37);
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v122, (uint64_t)v138, 16);
      if (!v42) {
        goto LABEL_27;
      }
      uint64_t v47 = v42;
      uint64_t v48 = *(void *)v123;
      while (2)
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v123 != v48) {
            objc_enumerationMutation(v40);
          }
          uint64_t v50 = *(void **)(*((void *)&v122 + 1) + 8 * j);
          uint64_t v51 = objc_msgSend_uniqueIdentifier(v50, v43, v44, v45, v46);
          int isEqual = objc_msgSend_isEqual_(v8, v52, (uint64_t)v51, v53, v54);

          if (isEqual)
          {
            uint64_t v56 = objc_msgSend__serviceObjects(self, v43, v44, v45, v46);
            uint64_t v60 = objc_msgSend_objectForKey_(v56, v57, (uint64_t)v8, v58, v59);

            if (!v60)
            {
              uint64_t v65 = objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
              uint64_t v70 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v66, v67, v68, v69);
              objc_msgSend_setObject_forKey_(v65, v71, (uint64_t)v70, (uint64_t)v8, v72);
            }
            __int16 v73 = objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
            id v78 = objc_msgSend_uniqueIdentifier(v50, v74, v75, v76, v77);
            int v82 = objc_msgSend_objectForKey_(v73, v79, (uint64_t)v78, v80, v81);
            v86 = objc_msgSend_getServiceTypeStringFor_(self, v83, v117, v84, v85);
            v90 = objc_msgSend_objectForKey_(v82, v87, (uint64_t)v86, v88, v89);

            if (v90)
            {
              v93 = CWFGetOSLog();
              if (v93)
              {
                v94 = CWFGetOSLog();
              }
              else
              {
                v94 = MEMORY[0x1E4F14500];
                id v96 = MEMORY[0x1E4F14500];
              }
              uint64_t v32 = obj;
              id v8 = v116;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                int v130 = 136446722;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                __int16 v132 = 2082;
                v133 = "CWFHomeManager.m";
                __int16 v134 = 1024;
                int v135 = 261;
                goto LABEL_40;
              }
            }
            else
            {
              int ServiceObjectFor_withParams_andAccessory = objc_msgSend_createServiceObjectFor_withParams_andAccessory_(self, v91, v117, (uint64_t)v119, (uint64_t)v50);
              if (!ServiceObjectFor_withParams_andAccessory)
              {
                int v118 = 0;
                id v8 = v116;
                goto LABEL_27;
              }
              int v118 = ServiceObjectFor_withParams_andAccessory;
              v95 = CWFGetOSLog();
              id v8 = v116;
              if (v95)
              {
                v94 = CWFGetOSLog();
              }
              else
              {
                v94 = MEMORY[0x1E4F14500];
                id v97 = MEMORY[0x1E4F14500];
              }
              uint64_t v32 = obj;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                int v130 = 136446978;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                __int16 v132 = 2082;
                v133 = "CWFHomeManager.m";
                __int16 v134 = 1024;
                int v135 = 266;
                __int16 v136 = 1024;
                int v137 = v118;
LABEL_40:
                _os_log_send_and_compose_impl();
              }
            }

            goto LABEL_69;
          }
        }
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v122, (uint64_t)v138, 16);
        if (v47) {
          continue;
        }
        break;
      }
LABEL_27:
    }
    uint64_t v32 = obj;
    uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v126, (uint64_t)v139, 16);
  }
  while (v121);
LABEL_69:

  v109 = CWFGetOSLog();
  if (v109)
  {
    v110 = CWFGetOSLog();
  }
  else
  {
    v110 = MEMORY[0x1E4F14500];
    id v111 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    int v130 = 136446978;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 275;
    __int16 v136 = 1024;
    int v137 = v118;
    _os_log_send_and_compose_impl();
  }

  return v118;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v6 = objc_msgSend__serviceQueue(self, a2, (uint64_t)a3, v3, v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500FF10;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (HMHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
}

- (BOOL)_isHomeInformationAvailable
{
  return self->__isHomeInformationAvailable;
}

- (void)set_isHomeInformationAvailable:(BOOL)a3
{
  self->__isHomeInformationAvailable = a3;
}

- (NSMutableDictionary)_serviceObjects
{
  return self->__serviceObjects;
}

- (void)set_serviceObjects:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (NSObject)_activeAssertion
{
  return self->__activeAssertion;
}

- (void)set_activeAssertion:(id)a3
{
}

- (HMFLocationAuthorization)_homeLocationAuthorization
{
  return self->__homeLocationAuthorization;
}

- (void)set_homeLocationAuthorization:(id)a3
{
}

- (CWFSensingAutoDataCollector)_autoDataColletor
{
  return self->__autoDataColletor;
}

- (void)set_autoDataColletor:(id)a3
{
}

- (CWFHomeManagerDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delegate, 0);
  objc_storeStrong((id *)&self->__autoDataColletor, 0);
  objc_storeStrong((id *)&self->__homeLocationAuthorization, 0);
  objc_storeStrong((id *)&self->__activeAssertion, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceObjects, 0);
  objc_storeStrong((id *)&self->__homeManager, 0);
}

@end