void sub_235C65B18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 code];
    v6 = objc_alloc(MEMORY[0x263F64820]);
    if (v5 == 2) {
      v7 = (void *)[v6 initWithErrorCode:*MEMORY[0x263F659B8]];
    }
    else {
      v7 = (void *)[v6 initWithReason:@"Failed creating vehicle events from CoreRoutine"];
    }
    v8 = v7;
    v11 = *(void *)(a1 + 32);
    v12 = [v7 dictionary];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    v13 = sub_235C66CF4(qword_268836238);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_235C64000, v13, OS_LOG_TYPE_INFO, "Failed creating vehicle event, error, %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x263F64830]);
    v9 = *(void *)(a1 + 32);
    v10 = [v8 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

id sub_235C65CB0(double a1, double a2, double a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  v18 = objc_opt_new();
  [v18 setDate:v17];

  id v19 = objc_alloc_init(MEMORY[0x263F64AD0]);
  v20 = [NSNumber numberWithDouble:a1];
  [v19 setLatitude:v20];

  v21 = [NSNumber numberWithDouble:a2];
  [v19 setLongitude:v21];

  v22 = [NSNumber numberWithDouble:a3];
  [v19 setAccuracy:v22];

  [v18 setLocation:v19];
  [v18 setNotes:v16];

  v23 = [NSNumber numberWithBool:a8];
  [v18 setUserSetLocation:v23];

  [v18 setVehicleIdentifier:v15];

  return v18;
}

void sub_235C66044(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_235C66130;
  v11[3] = &unk_264C72D58;
  id v12 = v5;
  id v13 = v6;
  id v8 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void sub_235C66130(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    _os_log_impl(&dword_235C64000, v2, OS_LOG_TYPE_INFO, "Received %lu vehicle events from CoreRoutine, error, %@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = [v5 code];
    id v7 = objc_alloc(MEMORY[0x263F64820]);
    if (v6 == 2) {
      id v8 = [v7 initWithErrorCode:*MEMORY[0x263F659B8]];
    }
    else {
      id v8 = [v7 initWithReason:@"Failed fetching vehicle events from CoreRoutine"];
    }
    uint64_t v14 = v8;
    uint64_t v17 = *(void *)(a1 + 56);
    id v16 = [v8 dictionary];
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v16);
  }
  else
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    dispatch_group_t v10 = dispatch_group_create();
    v11 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_235C663BC;
    v21[3] = &unk_264C72D08;
    dispatch_group_t v22 = v10;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 48);
    id v23 = v12;
    uint64_t v24 = v13;
    uint64_t v14 = v10;
    [v11 enumerateObjectsUsingBlock:v21];
    id v15 = [*(id *)(a1 + 48) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_235C669AC;
    block[3] = &unk_264C72D30;
    id v19 = v12;
    id v20 = *(id *)(a1 + 56);
    id v16 = v12;
    dispatch_group_notify(v14, v15, block);
  }
}

void sub_235C663BC(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 location];
  [v4 latitude];
  double v6 = v5;
  id v7 = [v3 location];
  [v7 longitude];
  double v9 = v8;

  dispatch_group_t v10 = [v3 location];
  if ([v10 referenceFrame])
  {
    v11 = [v3 location];
    int v12 = [v11 referenceFrame];

    if (v12 != 1)
    {
      int v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v13 = objc_msgSend(MEMORY[0x263F417D8], "isLocationShiftRequiredForCoordinate:", v6, v9);
LABEL_6:
  uint64_t v14 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v13) {
      id v15 = (const char *)&unk_235C67EE2;
    }
    else {
      id v15 = "not ";
    }
    id v16 = [v3 location];
    *(_DWORD *)buf = 136315394;
    v50 = v15;
    __int16 v51 = 2112;
    v52 = v16;
    _os_log_impl(&dword_235C64000, v14, OS_LOG_TYPE_INFO, "Shift %sneeded for locations, %@", buf, 0x16u);
  }
  if (v13)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = sub_235C667B8;
    v45[3] = &unk_264C72CB8;
    id v17 = v3;
    id v46 = v17;
    id v47 = *(id *)(a1 + 40);
    id v48 = *(id *)(a1 + 32);
    v18 = (void *)MEMORY[0x237DF17A0](v45);
    uint64_t v40 = MEMORY[0x263EF8330];
    uint64_t v41 = 3221225472;
    v42 = sub_235C66930;
    v43 = &unk_264C72CE0;
    id v44 = *(id *)(a1 + 32);
    id v19 = (void *)MEMORY[0x237DF17A0](&v40);
    id v20 = objc_msgSend(*(id *)(a1 + 48), "locationShifter", v40, v41, v42, v43);
    v21 = [v17 location];
    [v21 horizontalUncertainty];
    double v23 = v22;
    uint64_t v24 = [*(id *)(a1 + 48) queue];
    objc_msgSend(v20, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v18, 0, v19, v24, v6, v9, v23);

    v25 = v46;
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x263F64AC0];
    __int16 v27 = [v3 date];
    uint64_t v28 = [v3 location];
    [v28 latitude];
    double v30 = v29;
    v31 = [v3 location];
    [v31 longitude];
    double v33 = v32;
    v34 = [v3 location];
    [v34 horizontalUncertainty];
    double v36 = v35;
    v37 = [v3 notes];
    uint64_t v38 = [v3 userSetLocation];
    v39 = [v3 vehicleIdentifier];
    v25 = [v26 vehicleEventWithDate:v27 latitude:v37 longitude:v38 accuracy:v39 notes:v30 userSetLocation:v33 vehicleIdentifier:v36];

    [*(id *)(a1 + 40) addObject:v25];
  }
}

void sub_235C667B8(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v8 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 134283777;
    double v16 = a2;
    __int16 v17 = 2049;
    double v18 = a3;
    _os_log_impl(&dword_235C64000, v8, OS_LOG_TYPE_INFO, "Shifted coordinate: %{private}f, %{private}f", (uint8_t *)&v15, 0x16u);
  }

  double v9 = (void *)MEMORY[0x263F64AC0];
  dispatch_group_t v10 = [*(id *)(a1 + 32) date];
  v11 = [*(id *)(a1 + 32) notes];
  uint64_t v12 = [*(id *)(a1 + 32) userSetLocation];
  int v13 = [*(id *)(a1 + 32) vehicleIdentifier];
  uint64_t v14 = [v9 vehicleEventWithDate:v10 latitude:v11 longitude:v12 accuracy:v13 notes:a2 userSetLocation:a3 vehicleIdentifier:a4];

  [*(id *)(a1 + 40) addObject:v14];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_235C66930(uint64_t a1)
{
  v2 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_235C64000, v2, OS_LOG_TYPE_INFO, "Shift error.", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_235C669AC(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = sub_235C66CF4(qword_268836238);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_235C64000, v2, OS_LOG_TYPE_INFO, "Reply to search with %lu vehicle events.", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F64AC8]);
  [v4 setEvents:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [v4 dictionary];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void sub_235C66C58(uint64_t a1)
{
  id v4 = objc_alloc_init(MEMORY[0x263F64830]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [v4 dictionary];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

id sub_235C66CF4(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_235C66D54);
  }
  uint64_t v2 = (void *)predicate[2];

  return v2;
}

os_log_t sub_235C66D54(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_235C66FCC(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v12 = a2;
  if (v12)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x263F37EE8]);
    v11 = [*(id *)(a1 + 32) date];
    uint64_t v9 = (void *)[v10 initWithLatitude:v11 longitude:2 horizontalUncertainty:a3 date:a4 referenceFrame:a5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_235C675E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_235C67628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_235C67638(uint64_t a1)
{
}

void sub_235C67640(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v8 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_235C67900(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(a2, a3);
  v7.n128_f64[0] = v8.longitude;
  v6.n128_f64[0] = v8.latitude;
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, __n128, __n128, __n128))(v5 + 16);
  v10.n128_f64[0] = a4;

  return v9(v5, 0, v6, v7, v10);
}

uint64_t sub_235C67954(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}