@interface CMVehicleConnection
+ (id)mostRecentVehicleConnection;
@end

@implementation CMVehicleConnection

+ (id)mostRecentVehicleConnection
{
  sub_1904C0EF0("kCLConnectionMessageVehicleConnectionMostRecent", &v29);
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_setWithObjects_(v2, v6, v3, v4, v5, 0);
  uint64_t v27 = v29;
  v28 = v30;
  if (v30) {
    atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v7, (uint64_t)&v27, v8);
  if (v28) {
    sub_1902D8B58(v28);
  }
  if (v10)
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(v10, v9, @"CMVehicleConnectionStartTime");
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v10, v12, @"CMVehicleConnectionEndTime");
    id v14 = 0;
    if (v11)
    {
      v15 = (void *)v13;
      if (v13)
      {
        v16 = [CMVehicleConnectionData alloc];
        objc_msgSend_doubleValue(v11, v17, v18);
        double v20 = v19;
        objc_msgSend_doubleValue(v15, v21, v22);
        id v14 = (id)objc_msgSend_initWithStartDate_endDate_(v16, v23, v24, v20, v25);
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  if (v30) {
    sub_1902D8B58(v30);
  }
  return v14;
}

@end