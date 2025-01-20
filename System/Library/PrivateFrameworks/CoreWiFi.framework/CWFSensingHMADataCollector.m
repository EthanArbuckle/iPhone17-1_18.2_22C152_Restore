@interface CWFSensingHMADataCollector
+ (id)createCWFSensingHMADataCollectorFor:(id)a3 withOptions:(id)a4 andDelegate:(id)a5;
- (CWFSensingHMADataCollector)initWithAccessory:(id)a3 andOptions:(id)a4 andDelegate:(id)a5;
- (CWFSensingHMADataCollectorDelegate)_delegate;
- (HMAccessory)_accessory;
- (NSDictionary)_sensingParams;
- (NSError)_serviceRegistrationError;
- (OS_dispatch_queue)_serviceQueue;
- (id)currentRoomIdentifier;
- (id)getSensingParams;
- (int64_t)_attempt;
- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5;
- (void)deregisterForPrimaryServiceNotificationWith:(id)a3;
- (void)handleSensingResult:(id)a3;
- (void)registerForPrimaryServiceNotificationWith:(id)a3;
- (void)set_accessory:(id)a3;
- (void)set_attempt:(int64_t)a3;
- (void)set_delegate:(id)a3;
- (void)set_sensingParams:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)set_serviceRegistrationError:(id)a3;
@end

@implementation CWFSensingHMADataCollector

+ (id)createCWFSensingHMADataCollectorFor:(id)a3 withOptions:(id)a4 andDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v14 = CWFGetOSLog();
    if (v14)
    {
      v15 = CWFGetOSLog();
    }
    else
    {
      v15 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v10 = [CWFSensingHMADataCollector alloc];
  v12 = objc_msgSend_initWithAccessory_andOptions_andDelegate_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
  if (v12) {
    goto LABEL_3;
  }
  v16 = CWFGetOSLog();
  if (v16)
  {
    v15 = CWFGetOSLog();
  }
  else
  {
    v15 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_15:
  }
    _os_log_send_and_compose_impl();
LABEL_16:

  v12 = 0;
LABEL_3:

  return v12;
}

- (CWFSensingHMADataCollector)initWithAccessory:(id)a3 andOptions:(id)a4 andDelegate:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)CWFSensingHMADataCollector;
  v11 = [(CWFSensingHMADataCollector *)&v66 init];
  v15 = v11;
  if (!v11) {
    goto LABEL_9;
  }
  objc_msgSend_set_accessory_(v11, v12, (uint64_t)v8, v13, v14);
  v20 = objc_msgSend__accessory(v15, v16, v17, v18, v19);

  if (!v20)
  {

    v59 = CWFGetOSLog();
    if (v59)
    {
      v60 = CWFGetOSLog();
    }
    else
    {
      v60 = MEMORY[0x1E4F14500];
      id v63 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 88;
    goto LABEL_25;
  }
  dispatch_queue_t v21 = dispatch_queue_create("com.apple.wifi.CWFSensingHMADataCollector", 0);
  objc_msgSend_set_serviceQueue_(v15, v22, (uint64_t)v21, v23, v24);

  v29 = objc_msgSend__serviceQueue(v15, v25, v26, v27, v28);

  if (!v29)
  {

    v61 = CWFGetOSLog();
    if (v61)
    {
      v60 = CWFGetOSLog();
    }
    else
    {
      v60 = MEMORY[0x1E4F14500];
      id v64 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 94;
    goto LABEL_25;
  }
  v34 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v30, v31, v32, v33);
  objc_msgSend_addObserver_selector_name_object_(v34, v35, (uint64_t)v15, (uint64_t)sel_handleSensingResult_, @"SensingResult", 0);

  objc_msgSend_set_delegate_(v15, v36, (uint64_t)v10, v37, v38);
  v43 = objc_msgSend__delegate(v15, v39, v40, v41, v42);

  if (!v43)
  {

    v62 = CWFGetOSLog();
    if (v62)
    {
      v60 = CWFGetOSLog();
    }
    else
    {
      v60 = MEMORY[0x1E4F14500];
      id v65 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    int v67 = 136446722;
    v68 = "-[CWFSensingHMADataCollector initWithAccessory:andOptions:andDelegate:]";
    __int16 v69 = 2082;
    v70 = "CWFSensingHMADataCollector.m";
    __int16 v71 = 1024;
    int v72 = 103;
LABEL_25:
    _os_log_send_and_compose_impl();
LABEL_26:

    v15 = 0;
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend_set_sensingParams_(v15, v44, (uint64_t)v9, v46, v47);
  }
  else
  {
    v51 = objc_msgSend_getSensingParams(v15, v44, v45, v46, v47);
    objc_msgSend_set_sensingParams_(v15, v52, (uint64_t)v51, v53, v54);
  }
  objc_msgSend_set_serviceRegistrationError_(v15, v48, 0, v49, v50);
  objc_msgSend_set_attempt_(v15, v55, 0, v56, v57);
LABEL_9:

  return v15;
}

- (id)currentRoomIdentifier
{
  v5 = objc_msgSend__accessory(self, a2, v2, v3, v4);
  id v10 = objc_msgSend_room(v5, v6, v7, v8, v9);
  v15 = objc_msgSend_uniqueIdentifier(v10, v11, v12, v13, v14);

  return v15;
}

- (id)getSensingParams
{
  uint64_t v2 = objc_alloc_init(CWFSensingParameters);
  objc_msgSend_setSubmitMetric_(v2, v3, 1, v4, v5);
  objc_msgSend_setScheduleDailyAt_(v2, v6, -2, v7, v8);
  objc_msgSend_setScheduleOnceAfter_(v2, v9, 0, v10, v11);
  v16 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14, v15);
  uint64_t v17 = NSNumber;
  uint64_t v22 = objc_msgSend_numberOfReports(v2, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_numberWithInteger_(v17, v23, v22, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v27, (uint64_t)v26, @"SENSING_PARAMS_NUMBER_OF_REPORTS", v28);

  v29 = NSNumber;
  uint64_t matched = objc_msgSend_matchFrameType(v2, v30, v31, v32, v33);
  uint64_t v38 = objc_msgSend_numberWithInt_(v29, v35, matched, v36, v37);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v39, (uint64_t)v38, @"SENSING_PARAMS_MATCH_FRAME_TYPE", v40);

  uint64_t v45 = objc_msgSend_matchMACAddresses(v2, v41, v42, v43, v44);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v46, (uint64_t)v45, @"SENSING_PARAMS_MATCH_MAC_ADDRESS", v47);

  v48 = NSNumber;
  uint64_t v53 = objc_msgSend_timeout(v2, v49, v50, v51, v52);
  uint64_t v57 = objc_msgSend_numberWithInteger_(v48, v54, v53, v55, v56);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v58, (uint64_t)v57, @"SENSING_PARAMS_TIMEOUT", v59);

  v60 = NSNumber;
  uint64_t v65 = objc_msgSend_submitMetric(v2, v61, v62, v63, v64);
  __int16 v69 = objc_msgSend_numberWithBool_(v60, v66, v65, v67, v68);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v70, (uint64_t)v69, @"SENSING_PARAMS_SUBMIT_METRIC", v71);

  int v72 = NSNumber;
  uint64_t v77 = objc_msgSend_scheduleDailyAt(v2, v73, v74, v75, v76);
  v81 = objc_msgSend_numberWithInteger_(v72, v78, v77, v79, v80);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v82, (uint64_t)v81, @"SENSING_PARAMS_SCHEDULE_DAILY_AT", v83);

  v88 = objc_msgSend_placeLabels(v2, v84, v85, v86, v87);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v89, (uint64_t)v88, @"SENSING_PARAMS_PLACE_LABELS", v90);

  v91 = NSNumber;
  uint64_t v96 = objc_msgSend_scheduleOnceAfter(v2, v92, v93, v94, v95);
  v100 = objc_msgSend_numberWithInteger_(v91, v97, v96, v98, v99);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v101, (uint64_t)v100, @"SENSING_PARAMS_SCHEDULE_ONCE_AFTER", v102);

  return v16;
}

- (void)registerForPrimaryServiceNotificationWith:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  uint64_t v71 = self;
  uint64_t v8 = objc_msgSend__accessory(self, v4, v5, v6, v7);
  objc_msgSend_setDelegate_(v8, v9, (uint64_t)self, v10, v11);

  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  uint64_t v86 = sub_1B4F51C7C;
  uint64_t v87 = sub_1B4F51BEC;
  dispatch_group_t v88 = dispatch_group_create();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v16 = objc_msgSend__accessory(self, v12, v13, v14, v15);
  objc_msgSend_services(v16, v17, v18, v19, v20);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v79, (uint64_t)v92, 16);
  if (v69)
  {
    uint64_t v68 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v80 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v26, v22, v23, v24, v25, v64, v65))
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          uint64_t v27 = objc_msgSend_characteristics(v26, v22, v23, v24, v25);
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v75, (uint64_t)v91, 16);
          if (v33)
          {
            uint64_t v34 = *(void *)v76;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v76 != v34) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v36 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                uint64_t v37 = objc_msgSend_properties(v36, v29, v30, v31, v32, v64, v65);
                uint64_t v38 = off_1EB4B2598();
                if (objc_msgSend_containsObject_(v37, v39, (uint64_t)v38, v40, v41))
                {
                  uint64_t v46 = objc_msgSend_properties(v36, v42, v43, v44, v45);
                  uint64_t v47 = off_1EB4B25A0();
                  int v51 = objc_msgSend_containsObject_(v46, v48, (uint64_t)v47, v49, v50);

                  if (v51)
                  {
                    uint64_t v52 = CWFGetOSLog();
                    if (v52)
                    {
                      uint64_t v53 = CWFGetOSLog();
                    }
                    else
                    {
                      uint64_t v53 = MEMORY[0x1E4F14500];
                      id v54 = MEMORY[0x1E4F14500];
                    }

                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      int v89 = 138543362;
                      uint64_t v90 = v36;
                      LODWORD(v65) = 12;
                      uint64_t v64 = &v89;
                      _os_log_send_and_compose_impl();
                    }

                    dispatch_group_enter((dispatch_group_t)v84[5]);
                    v74[0] = MEMORY[0x1E4F143A8];
                    v74[1] = 3221225472;
                    v74[2] = sub_1B4FD8494;
                    v74[3] = &unk_1E60BCB88;
                    v74[4] = v71;
                    v74[5] = v36;
                    v74[6] = &v83;
                    objc_msgSend_enableNotification_completionHandler_(v36, v55, 1, (uint64_t)v74, v56);
                  }
                }
                else
                {
                }
              }
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v75, (uint64_t)v91, 16);
            }
            while (v33);
          }
        }
      }
      uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v79, (uint64_t)v92, 16);
    }
    while (v69);
  }

  uint64_t v57 = v84[5];
  uint64_t v62 = objc_msgSend__serviceQueue(v71, v58, v59, v60, v61);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FD85D4;
  block[3] = &unk_1E60BBF00;
  block[4] = v71;
  id v73 = v66;
  id v63 = v66;
  dispatch_group_notify(v57, v62, block);

  _Block_object_dispose(&v83, 8);
}

- (void)deregisterForPrimaryServiceNotificationWith:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3032000000;
  id v73 = sub_1B4F51C7C;
  uint64_t v74 = sub_1B4F51BEC;
  dispatch_group_t v75 = dispatch_group_create();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v58 = self;
  uint64_t v8 = objc_msgSend__accessory(self, v4, v5, v6, v7);
  objc_msgSend_services(v8, v9, v10, v11, v12);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v66, (uint64_t)v77, 16);
  if (v56)
  {
    uint64_t v55 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if (objc_msgSend_isPrimaryService(v18, v14, v15, v16, v17, v53))
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v19 = objc_msgSend_characteristics(v18, v14, v15, v16, v17);
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v62, (uint64_t)v76, 16);
          if (v25)
          {
            uint64_t v26 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v63 != v26) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v28 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                v29 = objc_msgSend_properties(v28, v21, v22, v23, v24);
                uint64_t v30 = off_1EB4B2598();
                if (objc_msgSend_containsObject_(v29, v31, (uint64_t)v30, v32, v33))
                {
                  uint64_t v38 = objc_msgSend_properties(v28, v34, v35, v36, v37);
                  v39 = off_1EB4B25A0();
                  int v43 = objc_msgSend_containsObject_(v38, v40, (uint64_t)v39, v41, v42);

                  if (v43)
                  {
                    dispatch_group_enter((dispatch_group_t)v71[5]);
                    v61[0] = MEMORY[0x1E4F143A8];
                    v61[1] = 3221225472;
                    v61[2] = sub_1B4FD8B7C;
                    v61[3] = &unk_1E60BCB88;
                    v61[4] = v58;
                    v61[5] = v28;
                    v61[6] = &v70;
                    objc_msgSend_enableNotification_completionHandler_(v28, v44, 0, (uint64_t)v61, v45);
                  }
                }
                else
                {
                }
              }
              uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v62, (uint64_t)v76, 16);
            }
            while (v25);
          }
        }
      }
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v66, (uint64_t)v77, 16);
    }
    while (v56);
  }

  uint64_t v46 = v71[5];
  int v51 = objc_msgSend__serviceQueue(v58, v47, v48, v49, v50);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FD8CBC;
  block[3] = &unk_1E60BBF00;
  block[4] = v58;
  id v60 = v53;
  id v52 = v53;
  dispatch_group_notify(v46, v51, block);

  _Block_object_dispose(&v70, 8);
}

- (void)handleSensingResult:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_userInfo(v4, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CWF_ACCESSORY_UUID", v11, v12);
  uint64_t v18 = objc_msgSend__accessory(self, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_uniqueIdentifier(v18, v19, v20, v21, v22);
  int isEqual = objc_msgSend_isEqual_(v13, v24, (uint64_t)v23, v25, v26);

  if (isEqual)
  {
    uint64_t v28 = CWFGetOSLog();
    if (v28)
    {
      v29 = CWFGetOSLog();
    }
    else
    {
      v29 = MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = objc_msgSend_userInfo(v4, v31, v32, v33, v34);
      v39 = objc_msgSend_objectForKeyedSubscript_(v35, v36, @"WiFiInterfaceReturn", v37, v38);
      uint64_t v44 = objc_msgSend_userInfo(v4, v40, v41, v42, v43);
      uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v44, v45, @"SensingResult", v46, v47);
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = v10;
  if (v8 && v9 && v10)
  {
    uint64_t v16 = objc_msgSend__serviceQueue(self, v11, v12, v13, v14);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1B4FD9000;
    v17[3] = &unk_1E60BC7A0;
    id v18 = v9;
    id v19 = v15;
    uint64_t v20 = self;
    id v21 = v8;
    dispatch_async(v16, v17);
  }
}

- (NSDictionary)_sensingParams
{
  return self->__sensingParams;
}

- (void)set_sensingParams:(id)a3
{
}

- (HMAccessory)_accessory
{
  return self->__accessory;
}

- (void)set_accessory:(id)a3
{
}

- (NSError)_serviceRegistrationError
{
  return self->__serviceRegistrationError;
}

- (void)set_serviceRegistrationError:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (CWFSensingHMADataCollectorDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
}

- (int64_t)_attempt
{
  return self->__attempt;
}

- (void)set_attempt:(int64_t)a3
{
  self->__attempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delegate, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceRegistrationError, 0);
  objc_storeStrong((id *)&self->__accessory, 0);
  objc_storeStrong((id *)&self->__sensingParams, 0);
}

@end