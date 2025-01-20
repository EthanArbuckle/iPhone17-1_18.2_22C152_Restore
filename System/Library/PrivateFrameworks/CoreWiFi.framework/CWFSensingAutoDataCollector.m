@interface CWFSensingAutoDataCollector
+ (id)sharedCWFSensingAutoDataCollectorInstanceWith:(id)a3;
- (BOOL)currentAccessoryInfo:(id)a3;
- (CWFSensingAutoDataCollector)initWithHomes:(id)a3;
- (HMAccessory)_currentAccessory;
- (NSMutableDictionary)_serviceObjects;
- (OS_dispatch_queue)_serviceQueue;
- (void)cleanUpOutOfScopeAccessory;
- (void)registerForAccessoriesInRoomWithDelegate:(id)a3;
- (void)set_currentAccessory:(id)a3;
- (void)set_serviceObjects:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)updateRegisteredServiceWithDelegate:(id)a3;
@end

@implementation CWFSensingAutoDataCollector

+ (id)sharedCWFSensingAutoDataCollectorInstanceWith:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F67488;
  block[3] = &unk_1E60BB768;
  id v9 = v3;
  uint64_t v4 = qword_1EB4B2640;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB4B2640, block);
  }
  id v6 = (id)qword_1EB4B2638;

  return v6;
}

- (CWFSensingAutoDataCollector)initWithHomes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CWFSensingAutoDataCollector;
  id v5 = [(CWFSensingAutoDataCollector *)&v25 init];
  id v9 = v5;
  if (v5)
  {
    if (objc_msgSend_currentAccessoryInfo_(v5, v6, (uint64_t)v4, v7, v8))
    {
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.wifi.CWFSensingAutoDataCollector", 0);
      objc_msgSend_set_serviceQueue_(v9, v11, (uint64_t)v10, v12, v13);

      v18 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16, v17);
      objc_msgSend_set_serviceObjects_(v9, v19, (uint64_t)v18, v20, v21);
    }
    else
    {

      v23 = CWFGetOSLog();
      if (v23)
      {
        v18 = CWFGetOSLog();
      }
      else
      {
        v18 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136446722;
        v27 = "-[CWFSensingAutoDataCollector initWithHomes:]";
        __int16 v28 = 2082;
        v29 = "CWFSensingAutoDataCollector.m";
        __int16 v30 = 1024;
        int v31 = 90;
        _os_log_send_and_compose_impl();
      }
      id v9 = 0;
    }
  }
  return v9;
}

- (BOOL)currentAccessoryInfo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    char v11 = 0;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v15 = objc_msgSend_accessories(v14, v6, v7, v8, v9);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v17)
        {
          uint64_t v22 = v17;
          uint64_t v23 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v29 != v23) {
                objc_enumerationMutation(v15);
              }
              objc_super v25 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              if (objc_msgSend_isCurrentAccessory(v25, v18, v19, v20, v21))
              {
                objc_msgSend_set_currentAccessory_(self, v18, (uint64_t)v25, v20, v21);
                char v11 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v28, (uint64_t)v36, 16);
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

- (void)cleanUpOutOfScopeAccessory
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = objc_msgSend__serviceObjects(self, a2, v2, v3, v4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend__serviceQueue(self, v9, v10, v11, v12);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = sub_1B4F679A0;
        v18[3] = &unk_1E60BB9F0;
        v18[4] = self;
        v18[5] = v16;
        dispatch_async(v17, v18);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v13);
  }
}

- (void)registerForAccessoriesInRoomWithDelegate:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  uint64_t v8 = objc_msgSend__currentAccessory(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_room(v8, v9, v10, v11, v12);

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v86 = v13;
  v18 = objc_msgSend_accessories(v13, v14, v15, v16, v17);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v92, (uint64_t)v106, 16);
  if (!v20) {
    goto LABEL_19;
  }
  uint64_t v25 = v20;
  uint64_t v26 = *(void *)v93;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v93 != v26) {
        objc_enumerationMutation(v18);
      }
      long long v28 = *(void **)(*((void *)&v92 + 1) + 8 * i);
      objc_msgSend__serviceObjects(self, v21, v22, v23, v24, v84, v85);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      long long v34 = objc_msgSend_uniqueIdentifier(v28, v30, v31, v32, v33);
      uint64_t v38 = objc_msgSend_objectForKey_(v29, v35, (uint64_t)v34, v36, v37);
      if (v38)
      {
      }
      else
      {
        char isCurrentAccessory = objc_msgSend_isCurrentAccessory(v28, v39, v40, v41, v42);

        if (isCurrentAccessory) {
          continue;
        }
        uint64_t v44 = objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_(CWFSensingHMADataCollector, v21, (uint64_t)v28, 0, (uint64_t)v87);
        if (!v44)
        {
          v76 = CWFGetOSLog();
          if (v76)
          {
            v77 = CWFGetOSLog();
          }
          else
          {
            v77 = MEMORY[0x1E4F14500];
            id v78 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v83 = objc_msgSend_uniqueIdentifier(v28, v79, v80, v81, v82);
            int v96 = 136446978;
            v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
            __int16 v98 = 2082;
            v99 = "CWFSensingAutoDataCollector.m";
            __int16 v100 = 1024;
            int v101 = 137;
            __int16 v102 = 2114;
            v103 = v83;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_19;
        }
        v49 = (void *)v44;
        v50 = objc_msgSend__serviceQueue(self, v45, v46, v47, v48);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1B4F67FF8;
        block[3] = &unk_1E60BB950;
        id v29 = v49;
        id v89 = v29;
        v90 = v28;
        v91 = self;
        dispatch_async(v50, block);

        v55 = objc_msgSend__serviceObjects(self, v51, v52, v53, v54);
        v60 = objc_msgSend_uniqueIdentifier(v28, v56, v57, v58, v59);
        objc_msgSend_setObject_forKey_(v55, v61, (uint64_t)v29, (uint64_t)v60, v62);

        v63 = CWFGetOSLog();
        if (v63)
        {
          v64 = CWFGetOSLog();
        }
        else
        {
          v64 = MEMORY[0x1E4F14500];
          id v65 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v70 = objc_msgSend_uniqueIdentifier(v28, v66, v67, v68, v69);
          v75 = objc_msgSend__serviceObjects(self, v71, v72, v73, v74);
          int v96 = 136447234;
          v97 = "-[CWFSensingAutoDataCollector registerForAccessoriesInRoomWithDelegate:]";
          __int16 v98 = 2082;
          v99 = "CWFSensingAutoDataCollector.m";
          __int16 v100 = 1024;
          int v101 = 150;
          __int16 v102 = 2114;
          v103 = v70;
          __int16 v104 = 2114;
          v105 = v75;
          LODWORD(v85) = 48;
          v84 = &v96;
          _os_log_send_and_compose_impl();
        }
        long long v34 = v89;
      }
    }
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v92, (uint64_t)v106, 16);
    if (v25) {
      continue;
    }
    break;
  }
LABEL_19:
}

- (void)updateRegisteredServiceWithDelegate:(id)a3
{
  objc_msgSend_registerForAccessoriesInRoomWithDelegate_(self, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1F4181798](self, sel_cleanUpOutOfScopeAccessory, v6, v7, v8);
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

- (HMAccessory)_currentAccessory
{
  return self->__currentAccessory;
}

- (void)set_currentAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentAccessory, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceObjects, 0);
}

@end