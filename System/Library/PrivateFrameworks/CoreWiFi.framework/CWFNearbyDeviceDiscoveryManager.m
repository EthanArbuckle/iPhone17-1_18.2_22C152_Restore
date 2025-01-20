@interface CWFNearbyDeviceDiscoveryManager
- (BOOL)_didDriverCrash;
- (CWFNearbyDeviceDiscoveryManager)init;
- (CWFNearbyDeviceDiscoveryParameter)_currentNDDRequest;
- (NSString)_interface;
- (OS_dispatch_queue)_serviceQueue;
- (id)getEDSResultFromReport:(id)a3;
- (id)getRequestDataFromParams:(id)a3;
- (id)isNDDAllowed;
- (id)sendNDDRequest;
- (id)sendNDDXPCEvent;
- (int)handleEvent:(int64_t)a3 withData:(id)a4 interface:(id)a5;
- (int)handleNDDDoneEvent:(id)a3 interface:(id)a4;
- (int)handleNDDRequestWithParams:(id)a3 clientName:(id)a4 interface:(id)a5;
- (int)handleNDDResultEvent:(id)a3 interface:(id)a4;
- (int)handleRequest:(int64_t)a3 withData:(id)a4 interface:(id)a5;
- (int)isNDDRequestValid:(id)a3;
- (void)handleDextCrashEvent;
- (void)handleDriverAvailableEvent;
- (void)setIsNDDAllowed:(id)a3;
- (void)setSendNDDRequest:(id)a3;
- (void)setSendNDDXPCEvent:(id)a3;
- (void)set_currentNDDRequest:(id)a3;
- (void)set_didDriverCrash:(BOOL)a3;
- (void)set_interface:(id)a3;
- (void)set_serviceQueue:(id)a3;
@end

@implementation CWFNearbyDeviceDiscoveryManager

- (CWFNearbyDeviceDiscoveryManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)CWFNearbyDeviceDiscoveryManager;
  v2 = [(CWFNearbyDeviceDiscoveryManager *)&v18 init];
  v6 = v2;
  if (v2)
  {
    objc_msgSend_set_didDriverCrash_(v2, v3, 0, v4, v5);
    objc_msgSend_set_currentNDDRequest_(v6, v7, 0, v8, v9);
    objc_msgSend_set_interface_(v6, v10, 0, v11, v12);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.wifi.CWFNDDManager", 0);
    objc_msgSend_set_serviceQueue_(v6, v14, (uint64_t)v13, v15, v16);
  }
  return v6;
}

- (void)setSendNDDRequest:(id)a3
{
  v6 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  id sendNDDRequest = self->_sendNDDRequest;
  self->_id sendNDDRequest = v6;

  uint64_t v8 = objc_alloc_init(CWFNearbyDeviceDiscoveryParameter);
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend_setOperation_(v8, v9, 2, v10, v11);
    if (objc_msgSend_handleNDDRequestWithParams_clientName_interface_(self, v13, (uint64_t)v12, 0, 0))
    {
      v14 = CWFGetOSLog();
      if (v14)
      {
        uint64_t v15 = CWFGetOSLog();
      }
      else
      {
        uint64_t v15 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (int)handleEvent:(int64_t)a3 withData:(id)a4 interface:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v27 = CWFGetOSLog();
    if (v27)
    {
      v28 = CWFGetOSLog();
    }
    else
    {
      v28 = MEMORY[0x1E4F14500];
      id v29 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v46 = 136446722;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    __int16 v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v50 = 1024;
    int v51 = 105;
    goto LABEL_17;
  }
  if (a3 == 55)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = objc_msgSend__serviceQueue(self, v16, v17, v18, v19);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1B4FF9A14;
      v37[3] = &unk_1E60BB9F0;
      id v38 = v8;
      v39 = self;
      dispatch_sync(v20, v37);

      uint64_t v15 = v38;
      goto LABEL_11;
    }
    v32 = CWFGetOSLog();
    if (v32)
    {
      v28 = CWFGetOSLog();
    }
    else
    {
      v28 = MEMORY[0x1E4F14500];
      id v35 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    __int16 v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v50 = 1024;
    int v51 = 134;
    __int16 v52 = 2114;
    id v53 = v8;
    goto LABEL_17;
  }
  if (a3 == 239)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = objc_msgSend__serviceQueue(self, v21, v22, v23, v24);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = sub_1B4FF98E4;
      v40[3] = &unk_1E60BB950;
      v40[4] = self;
      id v41 = v8;
      id v42 = v9;
      dispatch_sync(v25, v40);

      uint64_t v15 = v41;
      goto LABEL_11;
    }
    v33 = CWFGetOSLog();
    if (v33)
    {
      v28 = CWFGetOSLog();
    }
    else
    {
      v28 = MEMORY[0x1E4F14500];
      id v36 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    __int16 v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v50 = 1024;
    int v51 = 123;
    __int16 v52 = 2114;
    id v53 = v8;
    goto LABEL_17;
  }
  if (a3 != 238)
  {
LABEL_19:
    int v26 = -3900;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = CWFGetOSLog();
    if (v31)
    {
      v28 = CWFGetOSLog();
    }
    else
    {
      v28 = MEMORY[0x1E4F14500];
      id v34 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    __int16 v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v50 = 1024;
    int v51 = 112;
    __int16 v52 = 2114;
    id v53 = v8;
LABEL_17:
    _os_log_send_and_compose_impl();
LABEL_18:

    goto LABEL_19;
  }
  v14 = objc_msgSend__serviceQueue(self, v10, v11, v12, v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FF97B4;
  block[3] = &unk_1E60BB950;
  block[4] = self;
  id v44 = v8;
  id v45 = v9;
  dispatch_sync(v14, block);

  uint64_t v15 = v44;
LABEL_11:

  int v26 = 0;
LABEL_20:

  return v26;
}

- (int)handleRequest:(int64_t)a3 withData:(id)a4 interface:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  if (!v8)
  {
    uint64_t v17 = CWFGetOSLog();
    if (v17)
    {
      uint64_t v18 = CWFGetOSLog();
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136446722;
      v31 = "-[CWFNearbyDeviceDiscoveryManager handleRequest:withData:interface:]";
      __int16 v32 = 2082;
      v33 = "CWFNearbyDeviceDiscoveryManager.m";
      __int16 v34 = 1024;
      int v35 = 163;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_18;
  }
  if (a3 != 238)
  {
    int v15 = -3900;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = CWFGetOSLog();
    if (v19)
    {
      uint64_t v18 = CWFGetOSLog();
    }
    else
    {
      uint64_t v18 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136446978;
      v31 = "-[CWFNearbyDeviceDiscoveryManager handleRequest:withData:interface:]";
      __int16 v32 = 2082;
      v33 = "CWFNearbyDeviceDiscoveryManager.m";
      __int16 v34 = 1024;
      int v35 = 170;
      __int16 v36 = 2114;
      id v37 = v8;
      _os_log_send_and_compose_impl();
    }
LABEL_18:

    int v15 = -3900;
    *((_DWORD *)v27 + 6) = -3900;
    goto LABEL_6;
  }
  v14 = objc_msgSend__serviceQueue(self, v10, v11, v12, v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FF9E30;
  block[3] = &unk_1E60BD190;
  v25 = &v26;
  block[4] = self;
  id v23 = v8;
  id v24 = v9;
  dispatch_sync(v14, block);

  int v15 = *((_DWORD *)v27 + 6);
LABEL_6:
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (int)isNDDRequestValid:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (!v3)
  {
    v64 = CWFGetOSLog();
    if (v64)
    {
      v49 = CWFGetOSLog();
    }
    else
    {
      v49 = MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
LABEL_23:
    _os_log_send_and_compose_impl();
LABEL_24:

    int v58 = -3900;
    goto LABEL_25;
  }
  if (objc_msgSend_operation(v3, v4, v5, v6, v7) < 1 || objc_msgSend_operation(v8, v9, v10, v11, v12) >= 3)
  {
    v63 = CWFGetOSLog();
    if (v63)
    {
      v49 = CWFGetOSLog();
    }
    else
    {
      v49 = MEMORY[0x1E4F14500];
      id v65 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (objc_msgSend_operation(v8, v13, v14, v15, v16) != 2
    && (objc_msgSend_type(v8, v17, v18, v19, v20) < 1 || objc_msgSend_type(v8, v21, v22, v23, v24) >= 4))
  {
    v59 = CWFGetOSLog();
    if (v59)
    {
      v49 = CWFGetOSLog();
    }
    else
    {
      v49 = MEMORY[0x1E4F14500];
      id v61 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (objc_msgSend_operation(v8, v17, v18, v19, v20) == 1)
  {
    int v29 = objc_msgSend_macIds(v8, v25, v26, v27, v28);
    if (!objc_msgSend_count(v29, v30, v31, v32, v33))
    {

LABEL_10:
      __int16 v48 = CWFGetOSLog();
      if (v48)
      {
        v49 = CWFGetOSLog();
      }
      else
      {
        v49 = MEMORY[0x1E4F14500];
        id v60 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    uint64_t v38 = objc_msgSend_macIds(v8, v34, v35, v36, v37);
    unint64_t v43 = objc_msgSend_count(v38, v39, v40, v41, v42);

    if (v43 >= 9) {
      goto LABEL_10;
    }
    if (objc_msgSend_type(v8, v44, v45, v46, v47) == 2
      && (objc_msgSend_channel(v8, v50, v51, v52, v53) < 1 || objc_msgSend_band(v8, v54, v55, v56, v57) <= 0))
    {
      v67 = CWFGetOSLog();
      if (v67)
      {
        v49 = CWFGetOSLog();
      }
      else
      {
        v49 = MEMORY[0x1E4F14500];
        id v68 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  int v58 = 0;
LABEL_25:

  return v58;
}

- (id)getRequestDataFromParams:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v67 = 0;
  memset(v66, 0, sizeof(v66));
  id v8 = objc_msgSend_macIds(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_count(v8, v9, v10, v11, v12);

  if (!v13)
  {
    LODWORD(v18) = 0;
LABEL_7:
    HIDWORD(v66[0]) = v18;
    LOWORD(v66[1]) = v66[1] & 0xC700 | objc_msgSend_channel(v3, v14, v15, v16, v17) | 0x2000;
    if (objc_msgSend_band(v3, v42, v43, v44, v45) == 1)
    {
      __int16 v50 = v66[1] & 0x3FFF;
    }
    else if (objc_msgSend_band(v3, v46, v47, v48, v49) == 2)
    {
      __int16 v50 = LOWORD(v66[1]) | 0xC000;
    }
    else
    {
      if (objc_msgSend_band(v3, v46, v47, v48, v49) != 4)
      {
LABEL_16:
        if (objc_msgSend_operation(v3, v46, v47, v48, v49) == 1) {
          int v57 = 1;
        }
        else {
          int v57 = 2;
        }
        LODWORD(v66[0]) = v57;
        if (objc_msgSend_type(v3, v53, v54, v55, v56) == 1) {
          int8x8_t v62 = (int8x8_t)0x12C00000001;
        }
        else {
          int8x8_t v62 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(objc_msgSend_type(v3, v58, v59, v60, v61) == 2), 0x1FuLL)), (int8x8_t)0x12C00000001, (int8x8_t)0x753000000002);
        }
        *(int8x8_t *)((char *)v66 + 4) = v62;
        v63 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v58, (uint64_t)v66, 244, v61);
        goto LABEL_27;
      }
      __int16 v50 = v66[1] & 0x3FFF | 0x4000;
    }
    LOWORD(v66[1]) = v50;
    goto LABEL_16;
  }
  unint64_t v18 = 0;
  uint64_t v19 = (char *)&v66[1] + 8;
  while (1)
  {
    uint64_t v20 = objc_msgSend_macIds(v3, v14, v15, v16, v17);
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, v18, v22, v23);
    id v24 = objc_claimAutoreleasedReturnValue();
    int v29 = (const char *)objc_msgSend_UTF8String(v24, v25, v26, v27, v28);
    int v30 = ether_aton(v29);

    if (!v30) {
      break;
    }
    int v35 = *(_DWORD *)v30->octet;
    *((_WORD *)v19 + 7) = *(_WORD *)&v30->octet[4];
    *(_DWORD *)(v19 + 10) = v35;
    *(_DWORD *)uint64_t v19 = 50;
    v19 += 28;
    ++v18;
    uint64_t v36 = objc_msgSend_macIds(v3, v31, v32, v33, v34);
    unint64_t v41 = objc_msgSend_count(v36, v37, v38, v39, v40);

    if (v18 >= v41) {
      goto LABEL_7;
    }
  }
  uint64_t v51 = CWFGetOSLog();
  if (v51)
  {
    uint64_t v52 = CWFGetOSLog();
  }
  else
  {
    uint64_t v52 = MEMORY[0x1E4F14500];
    id v64 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    int v68 = 136446978;
    v69 = "-[CWFNearbyDeviceDiscoveryManager getRequestDataFromParams:]";
    __int16 v70 = 2082;
    v71 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v72 = 1024;
    int v73 = 235;
    __int16 v74 = 2114;
    id v75 = v3;
    _os_log_send_and_compose_impl();
  }

  v63 = 0;
LABEL_27:

  return v63;
}

- (int)handleNDDRequestWithParams:(id)a3 clientName:(id)a4 interface:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int isNDDRequestValid = objc_msgSend_isNDDRequestValid_(self, v11, (uint64_t)v8, v12, v13);
  if (isNDDRequestValid)
  {
    int v41 = isNDDRequestValid;
    v63 = CWFGetOSLog();
    if (v63)
    {
      id v64 = CWFGetOSLog();
    }
    else
    {
      id v64 = MEMORY[0x1E4F14500];
      id v71 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v19 = objc_msgSend_sendNDDRequest(self, v15, v16, v17, v18);

    if (v19)
    {
      uint64_t v23 = objc_msgSend_getRequestDataFromParams_(self, v20, (uint64_t)v8, v21, v22);
      if (v23)
      {
        uint64_t v28 = (void *)v23;
        if (objc_msgSend_operation(v8, v24, v25, v26, v27) == 2
          || objc_msgSend_type(v8, v29, v30, v31, v32) == 3
          || (objc_msgSend_isNDDAllowed(self, v29, v30, v31, v32),
              uint64_t v33 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
              BOOL v38 = objc_msgSend_band(v8, v34, v35, v36, v37) == 2,
              char v39 = ((uint64_t (**)(void, id, BOOL))v33)[2](v33, v9, v38),
              v33,
              (v39 & 1) != 0))
        {
          objc_msgSend_sendNDDRequest(self, v29, v30, v31, v32);
          uint64_t v40 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
          int v41 = ((uint64_t (**)(void, void *))v40)[2](v40, v28);

          if (v41)
          {
            v69 = CWFGetOSLog();
            if (v69)
            {
              __int16 v70 = CWFGetOSLog();
            }
            else
            {
              __int16 v70 = MEMORY[0x1E4F14500];
              id v74 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              _os_log_send_and_compose_impl();
            }
          }
          else
          {
            if (objc_msgSend_operation(v8, v42, v43, v44, v45) == 1)
            {
              objc_msgSend_set_currentNDDRequest_(self, v46, (uint64_t)v8, v48, v49);
              objc_msgSend_set_interface_(self, v50, (uint64_t)v10, v51, v52);
            }
            else if (objc_msgSend_operation(v8, v46, v47, v48, v49) == 2)
            {
              objc_msgSend_set_currentNDDRequest_(self, v53, 0, v54, v55);
              objc_msgSend_set_interface_(self, v56, 0, v57, v58);
            }
            int v41 = 0;
          }
        }
        else
        {
          uint64_t v60 = CWFGetOSLog();
          if (v60)
          {
            uint64_t v61 = CWFGetOSLog();
          }
          else
          {
            uint64_t v61 = MEMORY[0x1E4F14500];
            id v62 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            _os_log_send_and_compose_impl();
          }

          int v41 = -3930;
        }
      }
      else
      {
        int v67 = CWFGetOSLog();
        if (v67)
        {
          int v68 = CWFGetOSLog();
        }
        else
        {
          int v68 = MEMORY[0x1E4F14500];
          id v73 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          _os_log_send_and_compose_impl();
        }

        uint64_t v28 = 0;
        int v41 = -3900;
      }
    }
    else
    {
      id v65 = CWFGetOSLog();
      if (v65)
      {
        id v66 = CWFGetOSLog();
      }
      else
      {
        id v66 = MEMORY[0x1E4F14500];
        id v72 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        _os_log_send_and_compose_impl();
      }

      uint64_t v28 = 0;
      int v41 = -3931;
    }
  }

  return v41;
}

- (id)getEDSResultFromReport:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CWFNearbyDeviceDiscoveryReport);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3
    || (id v6 = v3, !objc_msgSend_bytes(v6, v7, v8, v9, v10))
    || objc_msgSend_length(v6, v11, v12, v13, v14) != 48)
  {
    id v62 = CWFGetOSLog();
    if (v62)
    {
      v63 = CWFGetOSLog();
    }
    else
    {
      v63 = MEMORY[0x1E4F14500];
      id v64 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
LABEL_29:
    _os_log_send_and_compose_impl();
LABEL_30:

    goto LABEL_17;
  }
  if (!v4 || !v5)
  {
    id v65 = CWFGetOSLog();
    if (v65)
    {
      v63 = CWFGetOSLog();
    }
    else
    {
      v63 = MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  id v15 = v6;
  uint64_t v20 = objc_msgSend_bytes(v15, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v21, v22, v23, v24);
  objc_msgSend_setTimeStamp_(v4, v26, (uint64_t)v25, v27, v28);

  int v29 = NSString;
  uint64_t v30 = ether_ntoa((const ether_addr *)(v20 + 22));
  uint64_t v34 = objc_msgSend_stringWithUTF8String_(v29, v31, (uint64_t)v30, v32, v33);
  objc_msgSend_setMacId_(v4, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_setFrameType_(v4, v38, *(unsigned int *)(v20 + 8), v39, v40);
  objc_msgSend_setBandwidth_(v4, v41, ((unint64_t)*(unsigned __int16 *)(v20 + 34) >> 11) & 7, v42, v43);
  objc_msgSend_setChannel_(v4, v44, *(unsigned __int8 *)(v20 + 34), v45, v46);
  unsigned int v50 = *(unsigned __int16 *)(v20 + 34);
  if (v50 >= 0x4000)
  {
    unsigned int v51 = v50 >> 14;
    if (v51 == 3)
    {
      objc_msgSend_setBand_(v4, v47, 2, v48, v49);
    }
    else if (v51 == 1)
    {
      objc_msgSend_setBand_(v4, v47, 4, v48, v49);
    }
  }
  else
  {
    objc_msgSend_setBand_(v4, v47, 1, v48, v49);
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    int v53 = *(unsigned __int8 *)(v20 + 2 + i);
    if ((v53 | 0x80) != 0x80)
    {
      uint64_t v54 = objc_msgSend_numberWithInteger_(NSNumber, v47, (char)v53, v48, v49);
      objc_msgSend_addObject_(v5, v55, (uint64_t)v54, v56, v57);
    }
  }
  objc_msgSend_setRssi_(v4, v47, (uint64_t)v5, v48, v49);
  objc_msgSend_setRateMbps_(v4, v58, *(unsigned int *)(v20 + 12), v59, v60);
LABEL_17:

  return v4;
}

- (int)handleNDDResultEvent:(id)a3 interface:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(CWFXPCEvent);
  uint64_t v13 = objc_msgSend_sendNDDXPCEvent(self, v9, v10, v11, v12);

  if (!v13)
  {
    uint64_t v45 = CWFGetOSLog();
    if (v45)
    {
      uint64_t v21 = CWFGetOSLog();
    }
    else
    {
      uint64_t v21 = MEMORY[0x1E4F14500];
      id v48 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v53 = 136446722;
    uint64_t v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    __int16 v55 = 2082;
    uint64_t v56 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v57 = 1024;
    int v58 = 361;
    goto LABEL_21;
  }
  if (!v6)
  {
    uint64_t v46 = CWFGetOSLog();
    if (v46)
    {
      uint64_t v21 = CWFGetOSLog();
    }
    else
    {
      uint64_t v21 = MEMORY[0x1E4F14500];
      id v49 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v53 = 136446978;
    uint64_t v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    __int16 v55 = 2082;
    uint64_t v56 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v57 = 1024;
    int v58 = 366;
    __int16 v59 = 2048;
    id v60 = 0;
    goto LABEL_21;
  }
  uint64_t v17 = objc_msgSend_getEDSResultFromReport_(self, v14, (uint64_t)v6, v15, v16);
  if (!v17)
  {
    uint64_t v47 = CWFGetOSLog();
    if (v47)
    {
      uint64_t v21 = CWFGetOSLog();
    }
    else
    {
      uint64_t v21 = MEMORY[0x1E4F14500];
      id v50 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v53 = 136446978;
    uint64_t v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    __int16 v55 = 2082;
    uint64_t v56 = "CWFNearbyDeviceDiscoveryManager.m";
    __int16 v57 = 1024;
    int v58 = 372;
    __int16 v59 = 2048;
    id v60 = v6;
LABEL_21:
    _os_log_send_and_compose_impl();
LABEL_22:
    int v43 = -3931;
    goto LABEL_5;
  }
  uint64_t v21 = v17;
  objc_msgSend_setType_(v8, v18, 35, v19, v20);
  uint64_t v26 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24, v25);
  objc_msgSend_setTimestamp_(v8, v27, (uint64_t)v26, v28, v29);

  objc_msgSend_setInterfaceName_(v8, v30, (uint64_t)v7, v31, v32);
  unsigned int v51 = @"NDDResult";
  uint64_t v52 = v21;
  uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)&v52, (uint64_t)&v51, 1);
  objc_msgSend_setInfo_(v8, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_sendNDDXPCEvent(self, v38, v39, v40, v41);
  uint64_t v42 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, CWFXPCEvent *))v42)[2](v42, v8);

  int v43 = 0;
LABEL_5:

  return v43;
}

- (int)handleNDDDoneEvent:(id)a3 interface:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(CWFXPCEvent);
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28798];
  uint64_t v15 = objc_msgSend_integerValue(v7, v11, v12, v13, v14);

  uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v16, v10, v15, 0);
  uint64_t v22 = objc_msgSend_sendNDDXPCEvent(self, v18, v19, v20, v21);

  if (v22)
  {
    objc_msgSend_setType_(v8, v23, 36, v24, v25);
    uint64_t v30 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v26, v27, v28, v29);
    objc_msgSend_setTimestamp_(v8, v31, (uint64_t)v30, v32, v33);

    objc_msgSend_setInterfaceName_(v8, v34, (uint64_t)v6, v35, v36);
    int v58 = @"NDDDone";
    __int16 v59 = v17;
    BOOL v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)&v59, (uint64_t)&v58, 1);
    objc_msgSend_setInfo_(v8, v39, (uint64_t)v38, v40, v41);

    objc_msgSend_sendNDDXPCEvent(self, v42, v43, v44, v45);
    uint64_t v46 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, CWFXPCEvent *))v46)[2](v46, v8);

    objc_msgSend_set_currentNDDRequest_(self, v47, 0, v48, v49);
    objc_msgSend_set_interface_(self, v50, 0, v51, v52);
    int v53 = 0;
  }
  else
  {
    __int16 v55 = CWFGetOSLog();
    if (v55)
    {
      uint64_t v56 = CWFGetOSLog();
    }
    else
    {
      uint64_t v56 = MEMORY[0x1E4F14500];
      id v57 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      int v60 = 136446722;
      uint64_t v61 = "-[CWFNearbyDeviceDiscoveryManager handleNDDDoneEvent:interface:]";
      __int16 v62 = 2082;
      v63 = "CWFNearbyDeviceDiscoveryManager.m";
      __int16 v64 = 1024;
      int v65 = 392;
      _os_log_send_and_compose_impl();
    }

    int v53 = -3931;
  }

  return v53;
}

- (void)handleDextCrashEvent
{
  objc_msgSend_set_didDriverCrash_(self, a2, 1, v2, v3);
  uint64_t v9 = objc_msgSend__currentNDDRequest(self, v5, v6, v7, v8);
  if (v9)
  {
    uint64_t v14 = (void *)v9;
    uint64_t v15 = objc_msgSend__currentNDDRequest(self, v10, v11, v12, v13);
    uint64_t v20 = objc_msgSend_type(v15, v16, v17, v18, v19);

    if (v20 != 3)
    {
      objc_msgSend_numberWithInteger_(NSNumber, v21, -3931, v22, v23);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = objc_msgSend__interface(self, v24, v25, v26, v27);
      objc_msgSend_handleNDDDoneEvent_interface_(self, v29, (uint64_t)v31, (uint64_t)v28, v30);
    }
  }
}

- (void)handleDriverAvailableEvent
{
  if (!objc_msgSend__didDriverCrash(self, a2, v2, v3, v4)) {
    goto LABEL_5;
  }
  uint64_t v10 = objc_msgSend__currentNDDRequest(self, v6, v7, v8, v9);
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v12 = (void *)v10;
  uint64_t v13 = objc_msgSend__currentNDDRequest(self, v6, v11, v8, v9);
  uint64_t v18 = objc_msgSend_type(v13, v14, v15, v16, v17);

  if (v18 != 3) {
    goto LABEL_5;
  }
  objc_msgSend_sendNDDRequest(self, v6, v19, v8, v9);
  uint64_t v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend__currentNDDRequest(self, v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_getRequestDataFromParams_(self, v26, (uint64_t)v25, v27, v28);
  int v30 = ((uint64_t (**)(void, void *))v20)[2](v20, v29);

  if (v30 != -3931)
  {
    id v31 = CWFGetOSLog();
    if (v31)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      BOOL v38 = objc_msgSend__currentNDDRequest(self, v34, v35, v36, v37);
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
LABEL_5:
    objc_msgSend_set_didDriverCrash_(self, v6, 0, v8, v9);
  }
}

- (id)sendNDDRequest
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)isNDDAllowed
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setIsNDDAllowed:(id)a3
{
}

- (id)sendNDDXPCEvent
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setSendNDDXPCEvent:(id)a3
{
}

- (CWFNearbyDeviceDiscoveryParameter)_currentNDDRequest
{
  return self->__currentNDDRequest;
}

- (void)set_currentNDDRequest:(id)a3
{
}

- (NSString)_interface
{
  return self->__interface;
}

- (void)set_interface:(id)a3
{
}

- (BOOL)_didDriverCrash
{
  return self->__didDriverCrash;
}

- (void)set_didDriverCrash:(BOOL)a3
{
  self->__didDriverCrash = a3;
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__interface, 0);
  objc_storeStrong((id *)&self->__currentNDDRequest, 0);
  objc_storeStrong(&self->_sendNDDXPCEvent, 0);
  objc_storeStrong(&self->_isNDDAllowed, 0);
  objc_storeStrong(&self->_sendNDDRequest, 0);
}

@end