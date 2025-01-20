@interface CLIndoorMaintenance
- (BOOL)withinQueueCanReinitializeRemoteState;
- (id)endpointName;
- (id)remoteObjectProtocol;
- (id)withinQueuePermanentShutdownReason;
- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5;
- (void)eraseEverything;
- (void)numFloors:(id)a3;
- (void)onQueueEraseEverything:(id)a3;
- (void)onQueueNumFloors:(id)a3;
- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5;
- (void)onQueueShutdown;
- (void)prefetch:(id)a3;
- (void)prefetchSynchronous:(id)a3;
- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3;
- (void)shutdown;
- (void)withinQueueReinitializeRemoteState;
@end

@implementation CLIndoorMaintenance

- (id)remoteObjectProtocol
{
  return &unk_26D474790;
}

- (id)endpointName
{
  return @"com.apple.pipelined.maintenance";
}

- (id)withinQueuePermanentShutdownReason
{
  return 0;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return 0;
}

- (void)withinQueueReinitializeRemoteState
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF4A0], @"Cannot re-initialize remote state", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  frameworkQueue = self->super._frameworkQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3321888768;
  v8[2] = sub_221E1DCF8;
  v8[3] = &unk_26D46B2E8;
  v5 = self;
  v6 = (void *)MEMORY[0x223C92B60](a3);
  v9 = v5;
  v7 = v5;
  id v10 = (id)MEMORY[0x223C92B60](v6);
  dispatch_async(frameworkQueue, v8);
}

- (void)prefetch:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
  }
  v5 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v19 = objc_msgSend_count(v4, v6, v7, v8, v9);
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %{public}zu venues", buf, 0xCu);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3321888768;
  v15[2] = sub_221E1E048;
  v15[3] = &unk_26D46B318;
  id v10 = self;
  id v11 = v4;
  v12 = v10;
  v16 = v12;
  id v17 = v11;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v12, v13, (uint64_t)v15, (uint64_t)"prefetch:", 0);

  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v14 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v14, OS_LOG_TYPE_DEBUG, "Prefetch request finished", buf, 2u);
  }
LABEL_8:
}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v19 = a3;
  id v10 = a4;
  if (v5 == 1) {
    id v11 = @"prefetchSynchronous:";
  }
  else {
    id v11 = @"prefetch:";
  }
  connection = self->super._connection;
  v13 = objc_msgSend__defaultErrHandler_forCaller_(self, v8, (uint64_t)v10, (uint64_t)v11, v9);
  id v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v14, (uint64_t)v13, v15, v16);
  objc_msgSend_prefetch_callback_when_(v17, v18, (uint64_t)v19, (uint64_t)v10, v5);
}

- (void)prefetchSynchronous:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
  }
  uint64_t v5 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = objc_msgSend_count(v4, v6, v7, v8, v9);
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %zu venues synchronously", buf, 0xCu);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3321888768;
  v15[2] = sub_221E1E404;
  v15[3] = &unk_26D46B348;
  id v10 = self;
  id v11 = v4;
  v12 = v10;
  uint64_t v16 = v12;
  id v17 = v11;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v12, v13, (uint64_t)v15, (uint64_t)"prefetch:", 1);

  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v14 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v14, OS_LOG_TYPE_DEBUG, "Synchronous prefetch request finished", buf, 2u);
  }
LABEL_8:
}

- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  frameworkQueue = self->super._frameworkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_221E1E668;
  v15[3] = &unk_2645F59F8;
  id v11 = v8;
  id v17 = v11;
  v12 = v9;
  uint64_t v16 = v12;
  dispatch_async(frameworkQueue, v15);
  if (a5)
  {
    if (!dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_time_t v13 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v12, v13)) {
      goto LABEL_8;
    }
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v14 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = a4;
    _os_log_impl(&dword_221DDF000, v14, OS_LOG_TYPE_ERROR, "Timeout trying to do XPC %{publci}s", buf, 0xCu);
  }
LABEL_8:
}

- (void)eraseEverything
{
  if (qword_26ABF4AF8 == -1)
  {
    v3 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
  v3 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v3, OS_LOG_TYPE_INFO, "Erasing all indoor tiles", buf, 2u);
  }
LABEL_4:
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3321888768;
  v7[2] = sub_221E1E908;
  v7[3] = &unk_26D46B3A8;
  id v4 = self;
  id v8 = v4;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v4, v5, (uint64_t)v7, (uint64_t)"eraseEverything", 0);

  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v6 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v6 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v6, OS_LOG_TYPE_INFO, "Erase all indoor tile request finished", buf, 2u);
  }
LABEL_7:
}

- (void)onQueueEraseEverything:(id)a3
{
  id v4 = a3;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    uint64_t v5 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_DEBUG, "Sending request to erase all indoor tiles", v18, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  id v10 = objc_msgSend__defaultErrHandlerForCaller_(self, v6, @"eraseAllData", v7, v8);
  v14 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v11, (uint64_t)v10, v12, v13);
  objc_msgSend_eraseAllData_(v14, v15, (uint64_t)v4, v16, v17);
}

- (void)shutdown
{
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v3 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v3, OS_LOG_TYPE_INFO, "Requesting shutdown of daemon", buf, 2u);
  }
LABEL_4:
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = sub_221E1EBA8;
  block[3] = &unk_26D46B3D8;
  uint64_t v7 = self;
  uint64_t v5 = v7;
  dispatch_sync(frameworkQueue, block);
}

- (void)onQueueShutdown
{
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    v3 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_221DDF000, v3, OS_LOG_TYPE_DEBUG, "Sending shutdown request to daemon", v17, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  uint64_t v8 = objc_msgSend__defaultErrHandlerForCaller_(self, v4, @"shutdown", v5, v6);
  uint64_t v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v9, (uint64_t)v8, v10, v11);
  objc_msgSend_shutdown(v12, v13, v14, v15, v16);
}

- (void)numFloors:(id)a3
{
  id v4 = a3;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    uint64_t v5 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_INFO, "Requesting number of floors from daemon", buf, 2u);
  }
LABEL_4:
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3321888768;
  v10[2] = sub_221E1EE84;
  v10[3] = &unk_26D46B408;
  uint64_t v6 = self;
  uint64_t v7 = (void *)MEMORY[0x223C92B60](v4);
  uint64_t v8 = v6;
  uint64_t v11 = v8;
  id v12 = (id)MEMORY[0x223C92B60](v7);
  objc_msgSend_doSynchronousXPC_description_waitForever_(v8, v9, (uint64_t)v10, (uint64_t)"numFloors", 0);
}

- (void)onQueueNumFloors:(id)a3
{
  id v4 = a3;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B438);
    uint64_t v5 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_DEBUG, "Sending request to find the number of floors in the Db", v18, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  uint64_t v10 = objc_msgSend__defaultErrHandlerForCaller_(self, v6, @"numFloors", v7, v8);
  uint64_t v14 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v11, (uint64_t)v10, v12, v13);
  objc_msgSend_numFloors_(v14, v15, (uint64_t)v4, v16, v17);
}

@end