@interface IASignalAnalytics
+ (BOOL)checkAndHandleSpecialCasesWithChannel:(id)a3 signal:(id)a4 withUniqueStringID:(id)a5 payload:(id)a6;
+ (id)uiQueue;
+ (id)xpcClient;
+ (void)invalidateConnection;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withNullableSessionID:(id)a5 withPayload:(id)a6;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withNullableUniqueStringID:(id)a5 withPayload:(id)a6;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withSessionID:(id)a5 withPayload:(id)a6;
+ (void)sendSignal:(id)a3 toChannel:(id)a4 withUniqueStringID:(id)a5 withPayload:(id)a6;
@end

@implementation IASignalAnalytics

+ (id)xpcClient
{
  v2 = (void *)qword_26B230140;
  if (!qword_26B230140)
  {
    v3 = objc_alloc_init(IAXPCClient);
    v4 = (void *)qword_26B230140;
    qword_26B230140 = (uint64_t)v3;

    v2 = (void *)qword_26B230140;
  }
  return v2;
}

+ (id)uiQueue
{
  if (qword_269C40278 != -1) {
    dispatch_once(&qword_269C40278, &unk_2702E3868);
  }
  v2 = (void *)qword_269C40260;
  return v2;
}

+ (void)invalidateConnection
{
  objc_msgSend_invalidateConnection((void *)qword_26B230140, a2, v2, v3);
  v4 = (void *)qword_26B230140;
  qword_26B230140 = 0;
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_252A059BC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend_description(v10, v12, v13, v14);
    int v32 = 138478339;
    id v33 = v9;
    __int16 v34 = 2113;
    id v35 = v8;
    __int16 v36 = 2117;
    v37 = v15;
    _os_log_impl(&dword_2529F1000, v11, OS_LOG_TYPE_DEFAULT, "channel:%{private}@ signal:%{private}@ payload:%{sensitive}@", (uint8_t *)&v32, 0x20u);
  }
  if ((objc_msgSend_checkAndHandleSpecialCasesWithChannel_signal_withUniqueStringID_payload_(a1, v16, (uint64_t)v9, (uint64_t)v8, 0, v10) & 1) == 0)
  {
    v17 = [IASignalAnalyticsObject alloc];
    v19 = objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v17, v18, (uint64_t)v9, (uint64_t)v8, 0, v10);
    v23 = objc_msgSend_xpcClient(a1, v20, v21, v22);
    v27 = objc_msgSend_server(v23, v24, v25, v26);
    objc_msgSend_didAction_(v27, v28, (uint64_t)v19, v29);

    objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v30, 1, v31);
  }
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withSessionID:(id)a5 withPayload:(id)a6
{
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withNullableSessionID:(id)a5 withPayload:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_252A059BC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend_description(v12, v15, v16, v17);
    uint64_t v22 = objc_msgSend_description(v13, v19, v20, v21);
    int v42 = 138478595;
    id v43 = v11;
    __int16 v44 = 2113;
    id v45 = v10;
    __int16 v46 = 2113;
    v47 = v18;
    __int16 v48 = 2117;
    v49 = v22;
    _os_log_impl(&dword_2529F1000, v14, OS_LOG_TYPE_DEFAULT, "channel:%{private}@ signal:%{private}@ sessionID:%{private}@ payload:%{sensitive}@", (uint8_t *)&v42, 0x2Au);
  }
  v23 = [IASignalAnalyticsObject alloc];
  v27 = objc_msgSend_UUIDString(v12, v24, v25, v26);
  uint64_t v29 = objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v23, v28, (uint64_t)v11, (uint64_t)v10, v27, v13);

  id v33 = objc_msgSend_xpcClient(a1, v30, v31, v32);
  v37 = objc_msgSend_server(v33, v34, v35, v36);
  objc_msgSend_didAction_(v37, v38, (uint64_t)v29, v39);

  objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v40, 1, v41);
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withUniqueStringID:(id)a5 withPayload:(id)a6
{
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withNullableUniqueStringID:(id)a5 withPayload:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_252A059BC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend_description(v13, v15, v16, v17);
    int v35 = 138478595;
    id v36 = v11;
    __int16 v37 = 2113;
    id v38 = v10;
    __int16 v39 = 2113;
    id v40 = v12;
    __int16 v41 = 2117;
    int v42 = v18;
    _os_log_impl(&dword_2529F1000, v14, OS_LOG_TYPE_DEFAULT, "channel:%{private}@ signal:%{private}@ uniqueStringId:%{private}@ payload:%{sensitive}@", (uint8_t *)&v35, 0x2Au);
  }
  if ((objc_msgSend_checkAndHandleSpecialCasesWithChannel_signal_withUniqueStringID_payload_(a1, v19, (uint64_t)v11, (uint64_t)v10, v12, v13) & 1) == 0)
  {
    uint64_t v20 = [IASignalAnalyticsObject alloc];
    uint64_t v22 = objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v20, v21, (uint64_t)v11, (uint64_t)v10, v12, v13);
    uint64_t v26 = objc_msgSend_xpcClient(a1, v23, v24, v25);
    v30 = objc_msgSend_server(v26, v27, v28, v29);
    objc_msgSend_didAction_(v30, v31, (uint64_t)v22, v32);

    objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v33, 1, v34);
  }
}

+ (BOOL)checkAndHandleSpecialCasesWithChannel:(id)a3 signal:(id)a4 withUniqueStringID:(id)a5 payload:(id)a6
{
  return 0;
}

@end