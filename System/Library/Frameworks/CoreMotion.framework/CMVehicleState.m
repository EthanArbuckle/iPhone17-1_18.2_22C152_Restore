@interface CMVehicleState
+ (BOOL)isAvailable;
+ (id)mostRecentInVehicle;
+ (id)mostRecentVehicleConnection;
+ (unint64_t)isVehicleBasedOnDeviceId:(id)a3 deviceType:(int)a4;
+ (unint64_t)vehicularHints;
+ (unint64_t)vehicularOperatorState;
+ (unint64_t)vehicularState;
@end

@implementation CMVehicleState

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v2, (uint64_t)"kCLConnectionMessageVehicleStateIsAvailable");
}

+ (id)mostRecentVehicleConnection
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageVehicleStateMostRecentVehicleConnection");
  MEMORY[0x192FCC410](&v2[1], __p);
  if (v29 < 0) {
    operator delete(*(void **)__p);
  }
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v9 = objc_msgSend_setWithObjects_(v3, v8, v4, v5, v6, v7, 0);
  v24 = v2 + 1;
  v25 = v2;
  atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  v12 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v10, (uint64_t)&v24, v9);
  if (v25) {
    sub_1902D8B58(v25);
  }
  if (v12 && !objc_msgSend_objectForKey_(v12, v11, @"CMErrorMessage"))
  {
    v19 = objc_msgSend_objectForKeyedSubscript_(v12, v11, @"CMVehicleConnectionDataKey");
  }
  else
  {
    v13 = objc_msgSend_objectForKey_(v12, v11, @"CMErrorMessage");
    if (objc_msgSend_intValue(v13, v14, v15) != 112)
    {
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
      }
      v16 = qword_1E929D7A8;
      if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v17, @"CMErrorMessage");
        *(_DWORD *)__p = 138412290;
        *(void *)&__p[4] = v18;
        _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "Error querying most recent vehicle connection, %@", __p, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1E929D7A0 != -1) {
          dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
        }
        uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v12, v21, @"CMErrorMessage");
        int v26 = 138412290;
        uint64_t v27 = v22;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMVehicleState mostRecentVehicleConnection]", "CoreLocation: %s\n", v23);
        if (v23 != __p) {
          free(v23);
        }
      }
    }
    v19 = 0;
  }
  sub_1902D8B58(v2);
  return v19;
}

+ (id)mostRecentInVehicle
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
  sub_1902C3F54(__p, "kCLConnectionMessageVehicleStateMostRecentInVehicle");
  MEMORY[0x192FCC410](&v2[1], __p);
  if (v41 < 0) {
    operator delete(*(void **)__p);
  }
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v3, v6, v4, v5, 0);
  v36 = v2 + 1;
  v37 = v2;
  atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  v10 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v8, (uint64_t)&v36, v7);
  if (v37) {
    sub_1902D8B58(v37);
  }
  if (v10 && !objc_msgSend_objectForKey_(v10, v9, @"CMErrorMessage"))
  {
    v19 = objc_msgSend_objectForKeyedSubscript_(v10, v9, @"CMVehicleConnectionStartTime");
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v10, v20, @"CMVehicleConnectionEndTime");
    id v17 = 0;
    if (v19)
    {
      uint64_t v22 = (void *)v21;
      if (v21)
      {
        v23 = [CMMotionTimeRange alloc];
        objc_msgSend_doubleValue(v19, v24, v25);
        double v27 = v26;
        objc_msgSend_doubleValue(v22, v28, v29);
        id v17 = (id)objc_msgSend_initWithStartDate_endDate_(v23, v30, v31, v27, v32);
      }
    }
  }
  else
  {
    v11 = objc_msgSend_objectForKey_(v10, v9, @"CMErrorMessage");
    if (objc_msgSend_intValue(v11, v12, v13) != 112)
    {
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
      }
      v14 = qword_1E929D7A8;
      if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v10, v15, @"CMErrorMessage");
        *(_DWORD *)__p = 138412290;
        *(void *)&__p[4] = v16;
        _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "Error querying most recent in vehicle data, %@", __p, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1E929D7A0 != -1) {
          dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
        }
        uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v10, v33, @"CMErrorMessage");
        int v38 = 138412290;
        uint64_t v39 = v34;
        v35 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMVehicleState mostRecentInVehicle]", "CoreLocation: %s\n", v35);
        if (v35 != __p) {
          free(v35);
        }
      }
    }
    id v17 = 0;
  }
  sub_1902D8B58(v2);
  return v17;
}

+ (unint64_t)isVehicleBasedOnDeviceId:(id)a3 deviceType:(int)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v34[0] = @"CMVehicleStateDeviceId";
  v34[1] = @"CMVehicleStateDeviceType";
  v35[0] = a3;
  v35[1] = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a4);
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v35, v34, 2);
  sub_19044F990("kCLConnectionMessageVehicleStateIsVehicle", &v29, &v27);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v7, 0);
  uint64_t v25 = v27;
  double v26 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v25, v10);
  if (v26) {
    sub_1902D8B58(v26);
  }
  if (v12 && !objc_msgSend_objectForKey_(v12, v11, @"CMErrorMessage"))
  {
    uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"CMVehicleStateIsVehicle");
    unint64_t v17 = objc_msgSend_unsignedIntegerValue(v18, v19, v20);
  }
  else
  {
    if (qword_1E929D7A0 != -1) {
      dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
    }
    v14 = qword_1E929D7A8;
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v15, @"CMErrorMessage");
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v16;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "Error querying vehicle device status, %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
      }
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v12, v22, @"CMErrorMessage");
      int v30 = 138412290;
      uint64_t v31 = v23;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMVehicleState isVehicleBasedOnDeviceId:deviceType:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    unint64_t v17 = 0;
  }
  if (v28) {
    sub_1902D8B58(v28);
  }
  return v17;
}

+ (unint64_t)vehicularState
{
  sub_19044FADC("kCLConnectionMessageVehicularState", &v18);
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  uint64_t v16 = v18;
  unint64_t v17 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v6, (uint64_t)&v16, v7);
  if (v17) {
    sub_1902D8B58(v17);
  }
  if (v9 && !objc_msgSend_objectForKey_(v9, v8, @"CMErrorMessage"))
  {
    v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CMVehicularStateKey");
    unint64_t v11 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
  }
  else
  {
    unint64_t v11 = 1;
  }
  if (v19) {
    sub_1902D8B58(v19);
  }
  return v11;
}

+ (unint64_t)vehicularHints
{
  sub_19044FADC("kCLConnectionMessageVehicularState", &v17);
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  uint64_t v15 = v17;
  uint64_t v16 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v6, (uint64_t)&v15, v7);
  if (v16) {
    sub_1902D8B58(v16);
  }
  if (v9)
  {
    if (objc_msgSend_objectForKey_(v9, v8, @"CMErrorMessage"))
    {
      uint64_t v9 = 0;
    }
    else
    {
      unint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CMVehicularHintsKey");
      uint64_t v9 = objc_msgSend_unsignedIntegerValue(v11, v12, v13);
    }
  }
  if (v18) {
    sub_1902D8B58(v18);
  }
  return (unint64_t)v9;
}

+ (unint64_t)vehicularOperatorState
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  sub_19044FC14("kCLConnectionMessageVehicularOperatorState", &v24);
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_setWithObjects_(v2, v5, v3, v4, 0);
  uint64_t v22 = v24;
  uint64_t v23 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v6, (uint64_t)&v22, v7);
  if (v23) {
    sub_1902D8B58(v23);
  }
  if (v9 && !objc_msgSend_objectForKey_(v9, v8, @"CMErrorMessage"))
  {
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"CMVehicularOperatorStateKey");
    unint64_t v14 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  }
  else
  {
    if (qword_1E929D7A0 != -1) {
      dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
    }
    unint64_t v11 = qword_1E929D7A8;
    if (os_log_type_enabled((os_log_t)qword_1E929D7A8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v12, @"CMErrorMessage");
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v13;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_FAULT, "Error querying vehicular operator state, %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D7A0 != -1) {
        dispatch_once(&qword_1E929D7A0, &unk_1EDFD1520);
      }
      uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v9, v19, @"CMErrorMessage");
      int v26 = 138412290;
      uint64_t v27 = v20;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMVehicleState vehicularOperatorState]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    unint64_t v14 = 0;
  }
  if (v25) {
    sub_1902D8B58(v25);
  }
  return v14;
}

@end