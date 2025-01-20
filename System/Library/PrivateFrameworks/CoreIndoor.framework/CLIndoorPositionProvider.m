@interface CLIndoorPositionProvider
- (BOOL)withinQueueCanReinitializeRemoteState;
- (CLIndoorPositionProvider)initWithApiKey:(id)a3;
- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4;
- (CLIndoorPositionProvider)initWithConnection:(id)a3;
- (ServiceState)state;
- (id)endpointName;
- (id)remoteObjectProtocol;
- (id)withinQueuePermanentShutdownReason;
- (void)clVisionNotificationAvailable:(id)a3;
- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3;
- (void)gpsEstimateAvailable:(id)a3;
- (void)gpsSignalQualityAvailable:(id)a3;
- (void)outdoorLocationAvailable:(id)a3;
- (void)playbackDatarun:(id)a3;
- (void)setApiKey:(id)a3;
- (void)setApiKey:(id)a3 onServer:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setState:(id)a3;
- (void)startUpdatingLocationAtLocation:(id)a3;
- (void)stopUpdatingLocation;
- (void)withinQueueInvalidateState;
- (void)withinQueueReinitializeRemoteState;
- (void)withinQueueSetDelegate:(id)a3;
@end

@implementation CLIndoorPositionProvider

- (CLIndoorPositionProvider)initWithApiKey:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLIndoorPositionProvider;
  v3 = [(CLIndoorXPCProvider *)&v7 init];
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B758);
    v4 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      return v3;
    }
    goto LABEL_3;
  }
  v4 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_221DDF000, v4, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v6, 2u);
  }
  return v3;
}

- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLIndoorPositionProvider;
  v4 = [(CLIndoorXPCProvider *)&v8 init];
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B758);
    v5 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO)) {
      return v4;
    }
    goto LABEL_3;
  }
  v5 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_221DDF000, v5, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v7, 2u);
  }
  return v4;
}

- (CLIndoorPositionProvider)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorPositionProvider;
  v5 = [(CLIndoorXPCProvider *)&v9 initWithConnection:v4];
  if (v5)
  {
    v6 = objc_alloc_init(ServiceState);
    state = v5->_state;
    v5->_state = v6;
  }
  return v5;
}

- (id)remoteObjectProtocol
{
  return &unk_26D4747F0;
}

- (id)endpointName
{
  return @"com.apple.pipelined";
}

- (id)withinQueuePermanentShutdownReason
{
  v5 = objc_msgSend_delegateProxy(self->_state, a2, v2, v3, v4);
  v10 = objc_msgSend_shutdownReason(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return self->_state != 0;
}

- (void)withinQueueInvalidateState
{
}

- (void)withinQueueReinitializeRemoteState
{
  objc_msgSend_state(self, a2, v2, v3, v4);
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_delegateProxy(v46, v6, v7, v8, v9);
  v15 = objc_msgSend_delegate(v10, v11, v12, v13, v14);
  objc_msgSend_withinQueueSetDelegate_(self, v16, (uint64_t)v15, v17, v18);

  objc_msgSend_state(self, v19, v20, v21, v22);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend_updateLocation(v47, v23, v24, v25, v26);

  if (v10)
  {
    objc_msgSend_state(self, v27, v28, v29, v30);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUpdateLocation_(v48, v31, 0, v32, v33);

    objc_msgSend_state(self, v34, v35, v36, v37);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_lastLocation(v49, v38, v39, v40, v41);
    objc_msgSend_startUpdatingLocationAtLocation_(self, v43, (uint64_t)v42, v44, v45);
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221E22B48;
  v7[3] = &unk_2645F5A68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(frameworkQueue, v7);
}

- (void)withinQueueSetDelegate:(id)a3
{
  id v37 = a3;
  id v4 = [IndoorProtocolProxy alloc];
  id v8 = objc_msgSend_initWithDelegate_(v4, v5, (uint64_t)v37, v6, v7);
  uint64_t v13 = objc_msgSend_state(self, v9, v10, v11, v12);
  objc_msgSend_setDelegateProxy_(v13, v14, (uint64_t)v8, v15, v16);

  uint64_t v20 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v17, (uint64_t)&unk_26D471778, v18, v19);
  objc_msgSend_setExportedInterface_(self->super._connection, v21, (uint64_t)v20, v22, v23);

  uint64_t v28 = objc_msgSend_state(self, v24, v25, v26, v27);
  uint64_t v33 = objc_msgSend_delegateProxy(v28, v29, v30, v31, v32);
  objc_msgSend_setExportedObject_(self->super._connection, v34, (uint64_t)v33, v35, v36);
}

- (void)setApiKey:(id)a3
{
  id v3 = a3;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B758);
    id v4 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v4 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_221DDF000, v4, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v5, 2u);
  }
LABEL_4:
}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B758);
    uint64_t v7 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221DDF000, v7, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v8, 2u);
  }
LABEL_4:
}

- (void)playbackDatarun:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E22F00;
  v9[3] = &unk_26D46B5D8;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E231A0;
  v9[3] = &unk_26D46B608;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)stopUpdatingLocation
{
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = sub_221E23660;
  block[3] = &unk_26D46B638;
  id v5 = self;
  id v3 = v5;
  dispatch_async(frameworkQueue, block);
}

- (void)outdoorLocationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E2399C;
  v9[3] = &unk_26D46B668;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(frameworkQueue, v9);
}

- (void)gpsEstimateAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E23E5C;
  v9[3] = &unk_26D46B698;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E240C0;
  v9[3] = &unk_26D46B6C8;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E24324;
  v9[3] = &unk_26D46B6F8;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3321888768;
  v9[2] = sub_221E24588;
  v9[3] = &unk_26D46B728;
  id v6 = self;
  id v7 = v4;
  uint64_t v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_sync(frameworkQueue, v9);
}

- (ServiceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end