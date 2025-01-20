@interface IDSNWPathUtils
+ (id)sharedInstance;
- (BOOL)filterVirtualInterfaces:(char *)a3;
- (BOOL)isSlicedCellularInterface:(id)a3 forSession:(id)a4;
- (BOOL)isVoWiFiInterface:(char *)a3;
- (IDSNWPathUtils)init;
- (id)_updateSlicedInterfaceName:(id)a3;
- (id)getDefaultPath;
- (void)bringUpSlicedInterface:(id)a3 forServiceIdentifier:(id)a4 forSession:(id)a5;
- (void)dealloc;
- (void)setSliceInterfaceBitMask:(unint64_t)a3 forSession:(id)a4;
- (void)takeDownSlicedInterfaceForSession:(id)a3;
@end

@implementation IDSNWPathUtils

+ (id)sharedInstance
{
  if (qword_1EB2BB858 != -1) {
    dispatch_once(&qword_1EB2BB858, &unk_1EEFCD5F8);
  }
  v2 = (void *)qword_1E944F310;
  return v2;
}

- (IDSNWPathUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSNWPathUtils;
  return [(IDSNWPathUtils *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IDSNWPathUtils;
  [(IDSNWPathUtils *)&v2 dealloc];
}

- (id)getDefaultPath
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F38C10]);
  objc_msgSend_prohibitInterfaceSubtype_(v2, v3, 5001, v4);
  id v5 = objc_alloc(MEMORY[0x1E4F38C20]);
  v8 = objc_msgSend_initWithEndpoint_parameters_(v5, v6, 0, v7, v2);
  v12 = objc_msgSend_path(v8, v9, v10, v11);

  return v12;
}

- (BOOL)filterVirtualInterfaces:(char *)a3
{
  objc_super v3 = nw_parameters_create();
  double v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(v3, v4);

  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v6 = nw_path_evaluator_copy_path();
  if (nw_path_uses_interface_type(v6, nw_interface_type_wifi)
    || nw_path_uses_interface_type(v6, nw_interface_type_cellular))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v7 = !nw_path_uses_interface_type(v6, nw_interface_type_wired);
  }

  return v7;
}

- (BOOL)isVoWiFiInterface:(char *)a3
{
  objc_super v3 = nw_parameters_create();
  double v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(v3, v4);

  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_array_create(0, 0);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "TelephonyIPSec");
  xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "TelephonyIPSec");
  nw_parameters_set_prohibited_netagent_classes();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v8 = nw_path_evaluator_copy_path();
  BOOL v9 = nw_path_get_status(v8) == nw_path_status_unsatisfied && nw_path_get_reason() == 10;

  return v9;
}

- (void)bringUpSlicedInterface:(id)a3 forServiceIdentifier:(id)a4 forSession:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_isEqualToString_(a4, v10, @"com.apple.private.alloy.facetime.multi", v11))
  {
    v12 = nw_parameters_create();
    nw_parameters_set_account_id();
    objc_msgSend_UTF8String(@"com.apple.facetime", v13, v14, v15);
    nw_parameters_set_source_application_by_bundle_id();
    nw_parameters_set_service_class(v12, nw_service_class_interactive_voice);
    nw_parameters_set_required_interface_type(v12, nw_interface_type_cellular);
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    if (evaluator_for_endpoint)
    {
      v20 = objc_msgSend_NWPathUtils(IDSFoundationLog, v16, v17, v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v9;
        __int16 v34 = 2048;
        v35 = evaluator_for_endpoint;
        _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "Bringing Up Sliced Cellular Interface for Session: %@ with evaluator: %p!", buf, 0x16u);
      }

      id v21 = v9;
      v22 = (void (**)(id, void *))v8;
      nw_path_evaluator_set_update_handler();
      nw_path_evaluator_start();
      if (!self->_sessionIDToSlicingPathEvaluator)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        sessionIDToSlicingPathEvaluator = self->_sessionIDToSlicingPathEvaluator;
        self->_sessionIDToSlicingPathEvaluator = Mutable;
      }
      CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToSlicingPathEvaluator, v21, evaluator_for_endpoint);
      v25 = (void *)nw_path_evaluator_copy_path();
      v28 = objc_msgSend__updateSlicedInterfaceName_(self, v26, (uint64_t)v25, v27);
      int isSlicedCellularInterface_forSession = objc_msgSend_isSlicedCellularInterface_forSession_(self, v29, (uint64_t)v28, v30, v21);
      if (v22 && isSlicedCellularInterface_forSession) {
        v22[2](v22, v28);
      }
    }
  }
}

- (void)takeDownSlicedInterfaceForSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  sessionIDToSlicingPathEvaluator = self->_sessionIDToSlicingPathEvaluator;
  if (!sessionIDToSlicingPathEvaluator)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v9 = self->_sessionIDToSlicingPathEvaluator;
    self->_sessionIDToSlicingPathEvaluator = Mutable;

    sessionIDToSlicingPathEvaluator = self->_sessionIDToSlicingPathEvaluator;
  }
  v12 = objc_msgSend_objectForKeyedSubscript_(sessionIDToSlicingPathEvaluator, v4, (uint64_t)v5, v6);
  if (v12)
  {
    uint64_t v14 = objc_msgSend_NWPathUtils(IDSFoundationLog, v10, v11, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v5;
      __int16 v22 = 2048;
      v23 = v12;
      _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "Taking Down Sliced Cellular Interface for Session: %@ with evaluator: %p!", (uint8_t *)&v20, 0x16u);
    }

    nw_path_evaluator_cancel();
    objc_msgSend_setObject_forKeyedSubscript_(self->_sessionIDToSlicingPathEvaluator, v15, 0, v16, v5);
  }
  sessionIDToSlicingBitMask = self->_sessionIDToSlicingBitMask;
  if (!sessionIDToSlicingBitMask)
  {
    v18 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    double v19 = self->_sessionIDToSlicingBitMask;
    self->_sessionIDToSlicingBitMask = v18;

    sessionIDToSlicingBitMask = self->_sessionIDToSlicingBitMask;
  }
  objc_msgSend_setObject_forKeyedSubscript_(sessionIDToSlicingBitMask, v10, 0, v13, v5);
}

- (id)_updateSlicedInterfaceName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_19DAA1BEC;
  double v27 = sub_19DAA1BFC;
  id v28 = 0;
  if (nw_path_get_status(v3) == nw_path_status_satisfied)
  {
    BOOL v7 = objc_msgSend_NWPathUtils(IDSFoundationLog, v4, v5, v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface Path Satisfied!", buf, 2u);
    }

    enumerate_block[0] = MEMORY[0x1E4F143A8];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = sub_19DAA1C04;
    enumerate_block[3] = &unk_1E59748F8;
    enumerate_block[4] = &v23;
    nw_path_enumerate_interfaces(v3, enumerate_block);
  }
  else if (nw_path_get_status(v3) == nw_path_status_satisfiable)
  {
    id v8 = (void *)nw_path_copy_inactive_agent_uuids();
    size_t count = xpc_array_get_count(v8);
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        uuid = xpc_array_get_uuid(v8, i);
        id v12 = objc_alloc(MEMORY[0x1E4F29128]);
        double v15 = objc_msgSend_initWithUUIDBytes_(v12, v13, (uint64_t)uuid, v14);
        double v19 = objc_msgSend_NWPathUtils(IDSFoundationLog, v16, v17, v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v30 = v15;
          _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Asserting Net Agent :%@ for Sliced Cellular Interface!", buf, 0xCu);
        }

        nw_path_assert_agent();
      }
    }
  }
  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (void)setSliceInterfaceBitMask:(unint64_t)a3 forSession:(id)a4
{
  id v7 = a4;
  if (!self->_sessionIDToSlicingBitMask)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    sessionIDToSlicingBitMask = self->_sessionIDToSlicingBitMask;
    self->_sessionIDToSlicingBitMask = Mutable;
  }
  uint64_t v11 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, a3, v8);
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionIDToSlicingBitMask, v7, v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB7D8A4((uint64_t)v7);
  }
}

- (BOOL)isSlicedCellularInterface:(id)a3 forSession:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    double v8 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v34 = v7;
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_sessionIDToSlicingBitMask, v9, (uint64_t)v7, v10);
    unint64_t v15 = objc_msgSend_unsignedLongLongValue(v11, v12, v13, v14);

    uint64_t v17 = 0;
    uint64_t v18 = 138412290;
    do
    {
      if ((v15 >> v17))
      {
        double v19 = objc_msgSend_stringWithFormat_(NSString, v16, @"%@%llu", *(double *)&v18, @"pdp_ip", v17);
        uint64_t v23 = v19;
        if (v8 && v19) {
          CFArrayAppendValue(v8, v19);
        }
        uint64_t v24 = objc_msgSend_NWPathUtils(IDSFoundationLog, v20, v21, v22);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface - active slice interface name: %@", buf, 0xCu);
        }
      }
      ++v17;
    }
    while (v17 != 64);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v25 = v8;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v35, v27, v39, 16);
    if (v29)
    {
      uint64_t v31 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v25);
          }
          if (objc_msgSend_isEqualToString_(v6, v28, *(void *)(*((void *)&v35 + 1) + 8 * i), v30))
          {
            LOBYTE(v29) = 1;
            goto LABEL_21;
          }
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v35, v30, v39, 16);
        if (v29) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    id v7 = v34;
  }
  else
  {
    LOBYTE(v29) = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDToSlicingBitMask, 0);
  objc_storeStrong((id *)&self->_sessionIDToSlicingPathEvaluator, 0);
}

@end