@interface CLMiLoConnectionInternal
+ (BOOL)_isKnownNonActionableMessage:(void *)a3;
- (CLMiLoConnectionInternal)initWithInfo:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (void)_connectServiceWithIdentifier:(id)a3;
- (void)_createCustomLocationOfInterestAtCurrentLocationWithRequestIdentifier:(id)a3;
- (void)_createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4;
- (void)_deleteServiceWithIdentifier:(id)a3;
- (void)_disconnectServiceWithIdentifier:(id)a3;
- (void)_handleDaemonEvent:(id)a3;
- (void)_handleDebugResponseEvent:(id)a3;
- (void)_handleGenericEvent:(id)a3;
- (void)_handleMiLoConnectionStatusEvent:(id)a3;
- (void)_handlePredictionUpdateEvent:(id)a3;
- (void)_invalidateLocationClient;
- (void)_labelEventWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4 observationIdentifier:(id)a5;
- (void)_labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5 requestIdentifier:(id)a6;
- (void)_notifyClientConnectServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4;
- (void)_notifyClientCreateServiceDidFailWithError:(id)a3;
- (void)_notifyClientDeleteServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4;
- (void)_notifyClientDidCompleteClientRequest:(id)a3 withError:(id)a4;
- (void)_notifyClientDidCreateServiceWithServiceIdentifier:(id)a3;
- (void)_notifyClientDidDeleteServiceWithServiceIdentifier:(id)a3;
- (void)_notifyClientDidExportDatabaseWithResponse:(id)a3;
- (void)_notifyClientDidFindMyServicesWithServiceDescriptors:(id)a3;
- (void)_notifyClientDidUpdateMiLoConnectionStatus:(id)a3;
- (void)_notifyClientDidUpdatePrediction:(id)a3;
- (void)_notifyClientDidUpdateServiceStatus:(id)a3;
- (void)_notifyClientDisconnectServiceDidFailWithError:(id)a3 serviceIdentifier:(id)a4;
- (void)_notifyClientOfGenericEventResponse:(id)a3;
- (void)_notifyClientQueryMiLoConnectionStatusDidFailWithError:(id)a3;
- (void)_notifyClientQueryServiceDidFailWithError:(id)a3;
- (void)_notifyClientRecordingMetaInfo:(id)a3;
- (void)_purgeAllMiLoDataWithRequestIdentifier:(id)a3;
- (void)_queryMiLoConnectionStatus;
- (void)_queryMyServices;
- (void)_registerForMiLoConnectionStatusEvents;
- (void)_registerForMiLoDebugResponseEvents;
- (void)_registerForMiLoGenericEvents;
- (void)_registerForMiLoServiceEvents;
- (void)_removeCustomLocationOfInterestFromMonitoringWithIdentifier:(id)a3 withRequestIdentifier:(id)a4;
- (void)_removeLabels:(id)a3 withRequestIdentifier:(id)a4;
- (void)_requestExportDatabaseWithRequestIdentifier:(id)a3;
- (void)_requestMiLoPredictionWithRequestIdentifier:(id)a3;
- (void)_requestModelLearningWithRequestIdentifier:(id)a3;
- (void)_requestObservationWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4;
- (void)_setHandlerForMiLoPredictionEvents;
- (void)_startUpdatingMicroLocationWithConfiguration:(id)a3 withRequestIdentifier:(id)a4;
- (void)_stopUpdatingMicroLocationWithRequestIdentifier:(id)a3;
- (void)_teardown;
- (void)_unregisterForMiLoConnectionStatusEvents;
- (void)_unregisterForMiLoDebugResponseEvents;
- (void)_unregisterForMiLoGenericEvents;
- (void)_unregisterForMiloServiceEvents;
- (void)_unsetHandlerForMiLoPredictionEvents;
- (void)dealloc;
@end

@implementation CLMiLoConnectionInternal

- (void)_removeLabels:(id)a3 withRequestIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    __int16 v22 = 2082;
    v23 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, remove labels, kCLConnectionMessageRemoveLabels\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v17[0] = 0x1EE00AD20;
      v17[1] = 0x1EE00ADA0;
      v18[0] = connectedServiceIdentifier;
      v18[1] = a4;
      v17[2] = 0x1EE00AE40;
      v18[2] = a3;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
      v10 = (std::__shared_weak_count *)operator new(0x70uLL);
      v10->__shared_owners_ = 0;
      v10->__shared_weak_owners_ = 0;
      v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "kCLConnectionMessageRemoveLabels");
      MEMORY[0x192FCE840](&v10[1], buf, v9);
      if (v24 < 0) {
        operator delete(*(void **)buf);
      }
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnectionClient::sendMessage();
      if (v10) {
        sub_1906BFE48(v10);
      }
      sub_1906BFE48(v10);
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      v13 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        __int16 v22 = 2082;
        v23 = "";
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      v14 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        __int16 v22 = 2082;
        v23 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v11 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      __int16 v22 = 2082;
      v23 = "";
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    v12 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      __int16 v22 = 2082;
      v23 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
  }
}

- (void)_createCustomLocationOfInterestAtCurrentLocationWithRequestIdentifier:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v21[0]) = 2082;
    *(void *)((char *)v21 + 2) = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, enable MiLo at current location, kCLConnectionMessageMiLoEnableMiLoAtCurrentLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v16[0] = 0x1EE00AD20;
      v16[1] = 0x1EE00ADA0;
      v17[0] = connectedServiceIdentifier;
      v17[1] = a3;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      sub_190839164(buf, "kCLConnectionMessageMiLoEnableMiLoAtCurrentLocation", &v13);
      v7 = (std::__shared_weak_count *)v21[0];
      v12 = (std::__shared_weak_count *)v21[0];
      if (v21[0]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v21[0] + 8), 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v12) {
        sub_1906BFE48(v12);
      }
      if (v7) {
        sub_1906BFE48(v7);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      v10 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to enable MiLo at current location with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      v11 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to enable MiLo at current location with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to enable MiLo at current location with internal error\"}", buf, 0x12u);
      }
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v15 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v8 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request enablingMiLo at current location, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v9 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request enablingMiLo at current location, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request enablingMiLo at current location, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
  }
}

- (CLMiLoConnectionInternal)initWithInfo:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLMiLoConnectionInternal;
  v8 = [(CLMiLoConnectionInternal *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLMiLoConnectionDelegate *)a4;
    if (a5)
    {
      v8->_delegateQueue = (OS_dispatch_queue *)a5;
      dispatch_retain((dispatch_object_t)a5);
    }
    else
    {
      v8->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MiLoConnection.privateQueue", 0);
    }
    v9->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MiLoConnection.internalQueue", 0);
    v9->_sender = (CLMiLoConnection *)a3;
    v9->_connectedServiceIdentifier = 0;
    operator new();
  }
  return 0;
}

+ (BOOL)_isKnownNonActionableMessage:(void *)a3
{
  BOOL result = 0;
  if (a3)
  {
    v4 = (const std::string *)CLConnectionMessage::name((CLConnectionMessage *)a3);
    if (!std::string::compare(v4, "LocationManager/kCLConnectionMessageRegistration")) {
      return 1;
    }
    v5 = (const std::string *)CLConnectionMessage::name((CLConnectionMessage *)a3);
    if (!std::string::compare(v5, "kCLConnectionMessageAuthorizationStatus")) {
      return 1;
    }
  }
  return result;
}

- (void)_invalidateLocationClient
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_locationdConnection)
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v3 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      __int16 v6 = 2082;
      v7 = "";
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"invalidating location client...\"}", (uint8_t *)v5, 0x12u);
    }
    CLConnectionClient::setInterruptionHandler();
    if (self->_locationdConnection)
    {
      uint64_t v4 = MEMORY[0x192FCE820]();
      MEMORY[0x192FCEAD0](v4, 0xB0C40BC2CC919);
    }
    self->_locationdConnection = 0;
  }
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  dispatch_release((dispatch_object_t)self->_internalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoConnectionInternal;
  [(CLMiLoConnectionInternal *)&v3 dealloc];
}

- (void)_teardown
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    uint64_t v8 = "";
    __int16 v9 = 2082;
    v10 = [NSStringFromClass(v4) UTF8String];
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"tearing down:\", \"class\":%{public, location:escape_only}s}", (uint8_t *)v6, 0x1Cu);
  }
  if (self->_connectedServiceIdentifier)
  {
    -[CLMiLoConnectionInternal _disconnectServiceWithIdentifier:](self, "_disconnectServiceWithIdentifier:");

    self->_connectedServiceIdentifier = 0;
    [(CLMiLoConnectionInternal *)self _unsetHandlerForMiLoPredictionEvents];
  }
  [(CLMiLoConnectionInternal *)self _unregisterForMiloServiceEvents];
  [(CLMiLoConnectionInternal *)self _unregisterForMiLoDebugResponseEvents];
  [(CLMiLoConnectionInternal *)self _unregisterForMiLoConnectionStatusEvents];
  [(CLMiLoConnectionInternal *)self _unregisterForMiLoGenericEvents];
  if (self->_locationdConnection)
  {
    uint64_t v5 = MEMORY[0x192FCE820]();
    MEMORY[0x192FCEAD0](v5, 0xB0C40BC2CC919);
  }
  self->_locationdConnection = 0;
}

- (void)_registerForMiLoServiceEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289026;
    *(_WORD *)v10 = 2082;
    *(void *)&v10[2] = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"registering for kCLConnectionMessageMiLoServiceEvent\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoServiceEvent");
    v6[1] = MEMORY[0x1E4F143A8];
    _DWORD v6[2] = 3221225472;
    v6[3] = sub_19082AA08;
    v6[4] = &unk_1E56985E8;
    v6[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v11 < 0) {
      operator delete(*(void **)buf);
    }
    __int16 v7 = @"kCLConnectionMessageSubscribeKey";
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    v6[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    sub_1906DDDEC(buf, v6);
    uint64_t v4 = *(std::__shared_weak_count **)v10;
    uint64_t v5 = *(std::__shared_weak_count **)v10;
    if (*(void *)v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)v10 + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v5) {
      sub_1906BFE48(v5);
    }
    if (v4) {
      sub_1906BFE48(v4);
    }
  }
}

- (void)_unregisterForMiloServiceEvents
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_locationdConnection != 0;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)char v11 = 2082;
    *(void *)&v11[2] = "";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"unregistering for kCLConnectionMessageMiLoServiceEvent\", \"Locationd Connection valid\":%{public}hhd}", buf, 0x18u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoServiceEvent");
    CLConnectionClient::setHandlerForMessage();
    if (SHIBYTE(v13) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v8 = @"kCLConnectionMessageSubscribeKey";
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    sub_1906DDDEC(buf, &v7);
    uint64_t v5 = *(std::__shared_weak_count **)v11;
    __int16 v6 = *(std::__shared_weak_count **)v11;
    if (*(void *)v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)v11 + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v6) {
      sub_1906BFE48(v6);
    }
    if (v5) {
      sub_1906BFE48(v5);
    }
  }
}

- (void)_setHandlerForMiLoPredictionEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoPredictionEventUpdate\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoPredictionEventUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(*(void **)buf);
    }
  }
}

- (void)_unsetHandlerForMiLoPredictionEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageRegisterMiLoPredictionEvent\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(&__p, "kCLConnectionMessageMiLoPredictionEventUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(__p);
    }
  }
}

- (void)_registerForMiLoDebugResponseEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoServiceDebugResponse\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoServiceDebugResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(*(void **)buf);
    }
  }
}

- (void)_unregisterForMiLoDebugResponseEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoServiceDebugResponse\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(&__p, "kCLConnectionMessageMiLoServiceDebugResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(__p);
    }
  }
}

- (void)_registerForMiLoGenericEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoGenericEventResponse\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoGenericEventResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(*(void **)buf);
    }
  }
}

- (void)_unregisterForMiLoGenericEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoGenericEventResponse\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(&__p, "kCLConnectionMessageMiLoGenericEventResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(__p);
    }
  }
}

- (void)_registerForMiLoConnectionStatusEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "set handler for kCLConnectionMessageMiLoConnectionStatusEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _registerForMiLoConnectionStatusEvents]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoConnectionStatusEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v6 < 0) {
      operator delete(*(void **)buf);
    }
    [(CLMiLoConnectionInternal *)self _queryMiLoConnectionStatus];
  }
}

- (void)_unregisterForMiLoConnectionStatusEvents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    __int16 v5 = 2082;
    char v6 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoConnectionStatusEvent\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_1906D5C70(&__p, "kCLConnectionMessageMiLoConnectionStatusEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(__p);
    }
  }
}

- (void)_notifyClientDidUpdateMiLoConnectionStatus:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C1A0;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidUpdateServiceStatus:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C240;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidCreateServiceWithServiceIdentifier:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C2E0;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientCreateServiceDidFailWithError:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C380;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDeleteServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19082C430;
    block[3] = &unk_1E5696FA8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidDeleteServiceWithServiceIdentifier:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C4D8;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidFindMyServicesWithServiceDescriptors:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C578;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientConnectServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19082C628;
    block[3] = &unk_1E5696FA8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidUpdatePrediction:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C6D0;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientQueryServiceDidFailWithError:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C770;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDisconnectServiceDidFailWithError:(id)a3 serviceIdentifier:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19082C820;
    block[3] = &unk_1E5696FA8;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidCompleteClientRequest:(id)a3 withError:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19082C8D8;
    block[3] = &unk_1E5696FA8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidExportDatabaseWithResponse:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082C980;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientOfGenericEventResponse:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082CA98;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientQueryMiLoConnectionStatusDidFailWithError:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082CBA4;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientRecordingMetaInfo:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_19082CC44;
    v6[3] = &unk_1E5696EE8;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_handleDaemonEvent:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, _handleDaemonEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v126 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v126);
    if (v126 != (char *)buf) {
      free(v126);
    }
  }
  if (self->_delegate)
  {
    if (a3)
    {
      if ([a3 objectForKeyedSubscript:0x1EE00ACE0])
      {
        uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x1EE00ACE0), "integerValue");
        char v7 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD00];
        uint64_t v8 = v7;
        switch(v6)
        {
          case 1:
            uint64_t v9 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD20];
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v10 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "UUIDString"), "UTF8String");
              *(_DWORD *)buf = 68289282;
              int v151 = 0;
              __int16 v152 = 2082;
              v153 = "";
              __int16 v154 = 2082;
              uint64_t v155 = v11;
              _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"create service success\", \"service identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            }
            [(CLMiLoConnectionInternal *)self _notifyClientDidCreateServiceWithServiceIdentifier:v9];
            return;
          case 2:
            if (v7)
            {
              uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v26 = [v7 integerValue];
              uint64_t v146 = *MEMORY[0x1E4F28568];
              v147 = sub_19082A4A0([v8 integerValue]);
              v27 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v26, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v28 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = [v8 integerValue];
                uint64_t v30 = objc_msgSend((id)objc_msgSend(v27, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v29;
                __int16 v156 = 2082;
                uint64_t v157 = v30;
                _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"create service fail\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v31 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v32 = [v8 integerValue];
                uint64_t v33 = objc_msgSend((id)objc_msgSend(v27, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v32;
                __int16 v156 = 2082;
                uint64_t v157 = v33;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "create service fail", "{\"msg%{public}.0s\":\"create service fail\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              [(CLMiLoConnectionInternal *)self _notifyClientCreateServiceDidFailWithError:v27];
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v115 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v115, OS_LOG_TYPE_FAULT, "create service failed but no error code returned", buf, 2u);
              }
              if (sub_1906CB57C(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F620 != -1) {
                  goto LABEL_235;
                }
                goto LABEL_202;
              }
            }
            return;
          case 3:
            v34 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD20];
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v35 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = objc_msgSend((id)objc_msgSend(v34, "UUIDString"), "UTF8String");
              *(_DWORD *)buf = 68289282;
              int v151 = 0;
              __int16 v152 = 2082;
              v153 = "";
              __int16 v154 = 2082;
              uint64_t v155 = v36;
              _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"delete service success\", \"service identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            }
            [(CLMiLoConnectionInternal *)self _notifyClientDidDeleteServiceWithServiceIdentifier:v34];
            return;
          case 4:
            if (v7)
            {
              v37 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v38 = [v7 integerValue];
              uint64_t v144 = *MEMORY[0x1E4F28568];
              v145 = sub_19082A4A0([v8 integerValue]);
              v39 = objc_msgSend(v37, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v38, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
              v40 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD20];
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v41 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v42 = [v8 integerValue];
                uint64_t v43 = objc_msgSend((id)objc_msgSend(v39, "localizedDescription"), "UTF8String");
                uint64_t v44 = objc_msgSend((id)objc_msgSend(v40, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v42;
                __int16 v156 = 2082;
                uint64_t v157 = v43;
                __int16 v158 = 2082;
                uint64_t v159 = v44;
                _os_log_impl(&dword_1906B8000, v41, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"delete service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v45 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v46 = [v8 integerValue];
                uint64_t v47 = objc_msgSend((id)objc_msgSend(v39, "localizedDescription"), "UTF8String");
                uint64_t v48 = objc_msgSend((id)objc_msgSend(v40, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v46;
                __int16 v156 = 2082;
                uint64_t v157 = v47;
                __int16 v158 = 2082;
                uint64_t v159 = v48;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delete service failed", "{\"msg%{public}.0s\":\"delete service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              [(CLMiLoConnectionInternal *)self _notifyClientDeleteServiceDidFailWithServiceIdentifier:v40 withError:v39];
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v116 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v116, OS_LOG_TYPE_FAULT, "delete service failed but no error code returned", buf, 2u);
              }
              if (sub_1906CB57C(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F620 != -1) {
                  goto LABEL_235;
                }
                goto LABEL_202;
              }
            }
            return;
          case 5:
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v49 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v49, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleQueryMyServices", buf, 2u);
            }
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v128 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v128);
              if (v128 != (char *)buf) {
                free(v128);
              }
            }
            v50 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD40];
            v51 = (void *)[(id)objc_msgSend(v50 valueForKey:@"serviceIdentifier", "componentsJoinedByString:", @", "];
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v52 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v53 = [v50 count];
              uint64_t v54 = [v51 UTF8String];
              *(_DWORD *)buf = 68289538;
              int v151 = 0;
              __int16 v152 = 2082;
              v153 = "";
              __int16 v154 = 2050;
              uint64_t v155 = v53;
              __int16 v156 = 2082;
              uint64_t v157 = v54;
              _os_log_impl(&dword_1906B8000, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"query services success\", \"size\":%{public}ld, \"service descriptors\":%{public, location:escape_only}s}", buf, 0x26u);
            }
            [(CLMiLoConnectionInternal *)self _notifyClientDidFindMyServicesWithServiceDescriptors:v50];
            return;
          case 6:
            if (v7)
            {
              v55 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = [v7 integerValue];
              uint64_t v142 = *MEMORY[0x1E4F28568];
              v143 = sub_19082A4A0([v8 integerValue]);
              v57 = objc_msgSend(v55, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v56, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v58 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v59 = [v8 integerValue];
                uint64_t v60 = objc_msgSend((id)objc_msgSend(v57, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v59;
                __int16 v156 = 2082;
                uint64_t v157 = v60;
                _os_log_impl(&dword_1906B8000, v58, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"query services failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v61 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v62 = [v8 integerValue];
                uint64_t v63 = objc_msgSend((id)objc_msgSend(v57, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v62;
                __int16 v156 = 2082;
                uint64_t v157 = v63;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v61, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "query services failed", "{\"msg%{public}.0s\":\"query services failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              [(CLMiLoConnectionInternal *)self _notifyClientQueryServiceDidFailWithError:v57];
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v117 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v117, OS_LOG_TYPE_FAULT, "query services failed but no error code returned", buf, 2u);
              }
              if (sub_1906CB57C(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F620 != -1) {
                  goto LABEL_235;
                }
                goto LABEL_202;
              }
            }
            return;
          case 7:
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v64 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v64, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleServiceStatusChanged", buf, 2u);
            }
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v129 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v129);
              if (v129 != (char *)buf) {
                free(v129);
              }
            }
            v65 = (CLMiLoServiceStatus *)[a3 objectForKeyedSubscript:0x1EE00AD60];
            if ([(CLMiLoServiceStatus *)v65 serviceState])
            {
              if ([(CLMiLoServiceStatus *)v65 serviceState] == 2)
              {
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v66 = qword_1E929F628;
                if (!os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_210;
                }
                *(_DWORD *)buf = 68289026;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                v67 = "{\"msg%{public}.0s\":\"service state: invalidated\"}";
              }
              else
              {
                if ([(CLMiLoServiceStatus *)v65 serviceState] != 1) {
                  goto LABEL_210;
                }
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v66 = qword_1E929F628;
                if (!os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_210;
                }
                *(_DWORD *)buf = 68289026;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                v67 = "{\"msg%{public}.0s\":\"service state: suspended\"}";
              }
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v66 = qword_1E929F628;
              if (!os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_210;
              }
              *(_DWORD *)buf = 68289026;
              int v151 = 0;
              __int16 v152 = 2082;
              v153 = "";
              v67 = "{\"msg%{public}.0s\":\"service state: running\"}";
            }
            _os_log_impl(&dword_1906B8000, v66, OS_LOG_TYPE_DEFAULT, v67, buf, 0x12u);
LABEL_210:
            char v24 = self;
            v23 = v65;
            goto LABEL_30;
          case 8:
            if (v7)
            {
              v68 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v69 = [v7 integerValue];
              uint64_t v140 = *MEMORY[0x1E4F28568];
              v141 = sub_19082A4A0([v8 integerValue]);
              v70 = objc_msgSend(v68, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v69, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
              v71 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD20];
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v72 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v73 = [v8 integerValue];
                uint64_t v74 = objc_msgSend((id)objc_msgSend(v70, "localizedDescription"), "UTF8String");
                uint64_t v75 = objc_msgSend((id)objc_msgSend(v71, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v73;
                __int16 v156 = 2082;
                uint64_t v157 = v74;
                __int16 v158 = 2082;
                uint64_t v159 = v75;
                _os_log_impl(&dword_1906B8000, v72, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"connect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v76 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v77 = [v8 integerValue];
                uint64_t v78 = objc_msgSend((id)objc_msgSend(v70, "localizedDescription"), "UTF8String");
                uint64_t v79 = objc_msgSend((id)objc_msgSend(v71, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v77;
                __int16 v156 = 2082;
                uint64_t v157 = v78;
                __int16 v158 = 2082;
                uint64_t v159 = v79;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v76, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "connect to service failed", "{\"msg%{public}.0s\":\"connect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              if ([v71 isEqual:self->_connectedServiceIdentifier])
              {
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v80 = qword_1E929F628;
                if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  int v151 = 0;
                  __int16 v152 = 2082;
                  v153 = "";
                  _os_log_impl(&dword_1906B8000, v80, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service failed, clear connectedServiceIdentifier\"}", buf, 0x12u);
                }

                self->_connectedServiceIdentifier = 0;
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v81 = qword_1E929F628;
                if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  int v151 = 0;
                  __int16 v152 = 2082;
                  v153 = "";
                  _os_log_impl(&dword_1906B8000, v81, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service failed, unset handler for prediction events\"}", buf, 0x12u);
                }
                [(CLMiLoConnectionInternal *)self _unsetHandlerForMiLoPredictionEvents];
              }
              [(CLMiLoConnectionInternal *)self _notifyClientConnectServiceDidFailWithServiceIdentifier:v71 withError:v70];
              return;
            }
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v118 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v118, OS_LOG_TYPE_FAULT, "connect service failed but no error code returned", buf, 2u);
            }
            if (!sub_1906CB57C(115, 0)) {
              return;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1E929F620 != -1) {
              goto LABEL_235;
            }
            goto LABEL_202;
          case 9:
            if (v7)
            {
              v82 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v83 = [v7 integerValue];
              uint64_t v138 = *MEMORY[0x1E4F28568];
              v139 = sub_19082A4A0([v8 integerValue]);
              v84 = objc_msgSend(v82, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v83, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
              v85 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD20];
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v86 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v87 = [v8 integerValue];
                uint64_t v88 = objc_msgSend((id)objc_msgSend(v84, "localizedDescription"), "UTF8String");
                uint64_t v89 = objc_msgSend((id)objc_msgSend(v85, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v87;
                __int16 v156 = 2082;
                uint64_t v157 = v88;
                __int16 v158 = 2082;
                uint64_t v159 = v89;
                _os_log_impl(&dword_1906B8000, v86, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"disconnect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v90 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v91 = [v8 integerValue];
                uint64_t v92 = objc_msgSend((id)objc_msgSend(v84, "localizedDescription"), "UTF8String");
                uint64_t v93 = objc_msgSend((id)objc_msgSend(v85, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v91;
                __int16 v156 = 2082;
                uint64_t v157 = v92;
                __int16 v158 = 2082;
                uint64_t v159 = v93;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v90, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "disconnect to service failed", "{\"msg%{public}.0s\":\"disconnect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              if (!self->_connectedServiceIdentifier)
              {
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v94 = qword_1E929F628;
                if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  int v151 = 0;
                  __int16 v152 = 2082;
                  v153 = "";
                  _os_log_impl(&dword_1906B8000, v94, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service failed, reset connectedServiceIdentifier\"}", buf, 0x12u);
                }
                self->_connectedServiceIdentifier = (NSUUID *)[v85 copy];
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
                v95 = qword_1E929F628;
                if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  int v151 = 0;
                  __int16 v152 = 2082;
                  v153 = "";
                  _os_log_impl(&dword_1906B8000, v95, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service failed, set handler for prediction events\"}", buf, 0x12u);
                }
                [(CLMiLoConnectionInternal *)self _setHandlerForMiLoPredictionEvents];
              }
              [(CLMiLoConnectionInternal *)self _notifyClientDisconnectServiceDidFailWithError:v84 serviceIdentifier:v85];
              return;
            }
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v119 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v119, OS_LOG_TYPE_FAULT, "connect to service failed but no error code returned", buf, 2u);
            }
            if (!sub_1906CB57C(115, 0)) {
              return;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1E929F620 != -1) {
              goto LABEL_235;
            }
            goto LABEL_202;
          case 10:
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v96 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v96, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleDidCompleteClientRequest", buf, 2u);
            }
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v130 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v130);
              if (v130 != (char *)buf) {
                free(v130);
              }
            }
            v97 = (void *)[a3 objectForKeyedSubscript:0x1EE00ADA0];
            if (v8)
            {
              v98 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v99 = [v8 integerValue];
              uint64_t v136 = *MEMORY[0x1E4F28568];
              v137 = sub_19082A4A0([v8 integerValue]);
              v100 = objc_msgSend(v98, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v99, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1));
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v101 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v102 = objc_msgSend((id)objc_msgSend(v97, "UUIDString"), "UTF8String");
                uint64_t v103 = [v8 integerValue];
                uint64_t v104 = objc_msgSend((id)objc_msgSend(v100, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289794;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2082;
                uint64_t v155 = v102;
                __int16 v156 = 2050;
                uint64_t v157 = v103;
                __int16 v158 = 2082;
                uint64_t v159 = v104;
                _os_log_impl(&dword_1906B8000, v101, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"client request complete with status code\", \"request id\":%{public, location:escape_only}s, \"status code\":%{public}ld, \"status message\":%{public, location:escape_only}s}", buf, 0x30u);
              }
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v120 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v121 = objc_msgSend((id)objc_msgSend(v97, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289282;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2082;
                uint64_t v155 = v121;
                _os_log_impl(&dword_1906B8000, v120, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"client request complete without status code\", \"request id\":%{public, location:escape_only}s}", buf, 0x1Cu);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v122 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v123 = objc_msgSend((id)objc_msgSend(v97, "UUIDString"), "UTF8String");
                *(_DWORD *)buf = 68289282;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2082;
                uint64_t v155 = v123;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v122, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "client request complete without status code", "{\"msg%{public}.0s\":\"client request complete without status code\", \"request id\":%{public, location:escape_only}s}", buf, 0x1Cu);
              }
              v100 = 0;
            }
            [(CLMiLoConnectionInternal *)self _notifyClientDidCompleteClientRequest:v97 withError:v100];
            return;
          case 12:
            if (v7)
            {
              v105 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v106 = [v7 integerValue];
              uint64_t v134 = *MEMORY[0x1E4F28568];
              v135 = sub_19082A4A0([v8 integerValue]);
              v107 = objc_msgSend(v105, "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", v106, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v108 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
              {
                uint64_t v109 = [v8 integerValue];
                uint64_t v110 = objc_msgSend((id)objc_msgSend(v107, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v109;
                __int16 v156 = 2082;
                uint64_t v157 = v110;
                _os_log_impl(&dword_1906B8000, v108, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"query MiLo connection status failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1E929F620 != -1) {
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
                }
              }
              v111 = qword_1E929F628;
              if (os_signpost_enabled((os_log_t)qword_1E929F628))
              {
                uint64_t v112 = [v8 integerValue];
                uint64_t v113 = objc_msgSend((id)objc_msgSend(v107, "localizedDescription"), "UTF8String");
                *(_DWORD *)buf = 68289538;
                int v151 = 0;
                __int16 v152 = 2082;
                v153 = "";
                __int16 v154 = 2050;
                uint64_t v155 = v112;
                __int16 v156 = 2082;
                uint64_t v157 = v113;
                _os_signpost_emit_with_name_impl(&dword_1906B8000, v111, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "query MiLo connection status failed", "{\"msg%{public}.0s\":\"query MiLo connection status failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              [(CLMiLoConnectionInternal *)self _notifyClientQueryMiLoConnectionStatusDidFailWithError:v107];
            }
            else
            {
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v124 = qword_1E929F628;
              if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v124, OS_LOG_TYPE_FAULT, "query MiLo connection status failed but no error code returned", buf, 2u);
              }
              if (sub_1906CB57C(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F620 != -1) {
LABEL_235:
                }
                  dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
LABEL_202:
                v125 = (char *)_os_log_send_and_compose_impl();
                sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v125);
                if (v125 != (char *)buf) {
                  free(v125);
                }
              }
            }
            return;
          case 13:
            if (qword_1E929F620 != -1) {
              dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
            }
            v114 = qword_1E929F628;
            if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v114, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleRecordingMetaInfo", buf, 2u);
            }
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F620 != -1) {
                dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
              }
              v131 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v131);
              if (v131 != (char *)buf) {
                free(v131);
              }
            }
            -[CLMiLoConnectionInternal _notifyClientRecordingMetaInfo:](self, "_notifyClientRecordingMetaInfo:", [a3 objectForKeyedSubscript:0x1EE00AEC0]);
            return;
          default:
            return;
        }
      }
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v18 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "componentsJoinedByString:", @","), "UTF8String");
        *(_DWORD *)buf = 68289282;
        int v151 = 0;
        __int16 v152 = 2082;
        v153 = "";
        __int16 v154 = 2082;
        uint64_t v155 = v19;
        _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"unrecognized service event dictionary received\", \"DictionaryKeys\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      v20 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "componentsJoinedByString:", @","), "UTF8String");
        *(_DWORD *)buf = 68289282;
        int v151 = 0;
        __int16 v152 = 2082;
        v153 = "";
        __int16 v154 = 2082;
        uint64_t v155 = v21;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "unrecognized service event dictionary received", "{\"msg%{public}.0s\":\"unrecognized service event dictionary received\", \"DictionaryKeys\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      __int16 v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v132 = *MEMORY[0x1E4F28568];
      v133 = @"Internal error";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
      uint64_t v15 = v22;
      v16 = @"kCLErrorDomainPrivate";
      uint64_t v17 = 0;
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      __int16 v12 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_FAULT, "nil service event dictionary received", buf, 2u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
        v127 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v127);
        if (v127 != (char *)buf) {
          free(v127);
        }
      }
      BOOL v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v148 = *MEMORY[0x1E4F28568];
      v149 = @"Empty daemon response dictionary";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
      uint64_t v15 = v13;
      v16 = @"kCLErrorDomainPrivate";
      uint64_t v17 = 4;
    }
    v23 = -[CLMiLoServiceStatus initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:]([CLMiLoServiceStatus alloc], "initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:", 2, 0, 0, 0, 0, [v15 errorWithDomain:v16 code:v17 userInfo:v14], 0, 0, 0);
    char v24 = self;
LABEL_30:
    [(CLMiLoConnectionInternal *)v24 _notifyClientDidUpdateServiceStatus:v23];
  }
}

- (void)_handlePredictionUpdateEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoPredictionEvent, _handlePredictionEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (a3)
  {
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:0x1EE00AD80];
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    char v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "requestIdentifier"), "UUIDString"), "UTF8String");
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "_handlePredictionEvent, requestIdentifier %s", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "requestIdentifier"), "UUIDString"), "UTF8String");
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    [(CLMiLoConnectionInternal *)self _notifyClientDidUpdatePrediction:v6];
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "nil prediction event dictionary received", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v14 = @"Empty daemon response dictionary";
    -[CLMiLoConnectionInternal _notifyClientDidUpdateServiceStatus:](self, "_notifyClientDidUpdateServiceStatus:", objc_autorelease(-[CLMiLoServiceStatus initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:]([CLMiLoServiceStatus alloc], "initWithServiceState:suspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:places:metaInfo:", 2, 0, 0, 0, 0, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)), 0,
          0,
          0)));
  }
}

- (void)_handleDebugResponseEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceDebugResponse, _handleDebugResponseEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDebugResponseEvent:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (a3)
  {
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:0x1EE00AE80];
    if ([v6 exportDatabaseTablesResult]) {
      [(CLMiLoConnectionInternal *)self _notifyClientDidExportDatabaseWithResponse:v6];
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    char v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_FAULT, "nil debug respoinse event dictionary received", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDebugResponseEvent:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)_handleMiLoConnectionStatusEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoConnectionStatusEvent, _handleMiLoConnectionStatusEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (a3)
  {
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:0x1EE00AEA0];
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    char v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 connectionState];
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "_handleMiLoConnectionStatusEvent, connectionState %lu", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      [v6 connectionState];
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    [(CLMiLoConnectionInternal *)self _notifyClientDidUpdateMiLoConnectionStatus:v6];
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "nil connection status event dictionary received", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void)_handleGenericEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoGenericEventResponse, _handleGenericEvent", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if (a3)
  {
    uint64_t v6 = (void *)[a3 objectForKeyedSubscript:0x1EE00AEE0];
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    char v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v6 eventType];
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "genericEventDescription"), "UTF8String");
      *(_DWORD *)buf = 67109378;
      int v15 = v8;
      __int16 v16 = 2080;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "_handleGenericEvent, eventType %u, description %s", buf, 0x12u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      [v6 eventType];
      objc_msgSend((id)objc_msgSend(v6, "genericEventDescription"), "UTF8String");
      __int16 v12 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    [(CLMiLoConnectionInternal *)self _notifyClientOfGenericEventResponse:v6];
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    v10 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_FAULT, "nil generic event response event dictionary received", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)_createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  char v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v22[0]) = 2082;
    *(void *)((char *)v22 + 2) = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, creating a service\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    int v8 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:0];
    uint64_t v9 = v8;
    if (!v8 || ![v8 length])
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20 = @"Invalid parameter";
      -[CLMiLoConnectionInternal _notifyClientCreateServiceDidFailWithError:](self, "_notifyClientCreateServiceDidFailWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
    }
    v17[0] = 0x1EE00ACA0;
    v17[1] = 0x1EE00ACC0;
    v18[0] = [NSNumber numberWithUnsignedInteger:a3];
    v18[1] = v9;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    sub_1906DDD24(buf, "kCLConnectionMessageMiLoCreateService", &v14);
    v10 = (std::__shared_weak_count *)v22[0];
    uint64_t v13 = (std::__shared_weak_count *)v22[0];
    if (v22[0]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v22[0] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v13) {
      sub_1906BFE48(v13);
    }
    if (v10) {
      sub_1906BFE48(v10);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v11 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(void *)((char *)v22 + 2) = "";
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to create a service with internal error\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    __int16 v12 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(void *)((char *)v22 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to create a service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to create a service with internal error\"}", buf, 0x12u);
    }
    uint64_t v15 = *MEMORY[0x1E4F28568];
    __int16 v16 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientCreateServiceDidFailWithError:](self, "_notifyClientCreateServiceDidFailWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

- (void)_deleteServiceWithIdentifier:(id)a3
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v16[0]) = 2082;
    *(void *)((char *)v16 + 2) = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, deleting a service\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    uint64_t v13 = 0x1EE00AD20;
    id v14 = a3;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    sub_1906DDD24(buf, "kCLConnectionMessageMiLoDeleteService", &v10);
    uint64_t v6 = (std::__shared_weak_count *)v16[0];
    uint64_t v9 = (std::__shared_weak_count *)v16[0];
    if (v16[0]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16[0] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v9) {
      sub_1906BFE48(v9);
    }
    if (v6) {
      sub_1906BFE48(v6);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    char v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v16[0]) = 2082;
      *(void *)((char *)v16 + 2) = "";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to delete a service with internal error\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    int v8 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v16[0]) = 2082;
      *(void *)((char *)v16 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to delete a service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to delete a service with internal error\"}", buf, 0x12u);
    }
    uint64_t v11 = *MEMORY[0x1E4F28568];
    __int16 v12 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientDeleteServiceDidFailWithServiceIdentifier:withError:](self, "_notifyClientDeleteServiceDidFailWithServiceIdentifier:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1)));
  }
}

- (void)_queryMyServices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, query my services, kCLConnectionMessageMiLoQueryMyServices\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    BOOL v4 = (std::__shared_weak_count *)operator new(0x70uLL);
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
    sub_1906D5C70(buf, "kCLConnectionMessageMiLoQueryMyServices");
    MEMORY[0x192FCE840](&v4[1], buf, MEMORY[0x1E4F1CC08]);
    if (v12 < 0) {
      operator delete(*(void **)buf);
    }
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    CLConnectionClient::sendMessage();
    if (v4) {
      sub_1906BFE48(v4);
    }
    sub_1906BFE48(v4);
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    __int16 v5 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to query my services with internal error\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v6 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to query my services with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to query my services with internal error\"}", buf, 0x12u);
    }
    uint64_t v7 = *MEMORY[0x1E4F28568];
    int v8 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientQueryServiceDidFailWithError:](self, "_notifyClientQueryServiceDidFailWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1)));
  }
}

- (void)_queryMiLoConnectionStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  objc_super v3 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "SPI request, query MiLo connection status, kCLConnectionMessageMiLoQueryConnectionStatus", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    LOWORD(v9) = 0;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _queryMiLoConnectionStatus]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  if (self->_locationdConnection)
  {
    uint64_t v9 = MEMORY[0x1E4F1CC08];
    sub_19083909C(buf, "kCLConnectionMessageMiLoQueryConnectionStatus", &v9);
    BOOL v4 = v13;
    int v8 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v8) {
      sub_1906BFE48(v8);
    }
    if (v4) {
      sub_1906BFE48(v4);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    __int16 v5 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "SPI request, failed to query MiLo connection status with internal error", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      LOWORD(v9) = 0;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _queryMiLoConnectionStatus]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v11 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientQueryMiLoConnectionStatusDidFailWithError:](self, "_notifyClientQueryMiLoConnectionStatusDidFailWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
  }
}

- (void)_connectServiceWithIdentifier:(id)a3
{
  v20[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
  {
    *(void *)buf = 68289026;
    LOWORD(v20[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"SPI request, connect to a service, kCLConnectionMessageMiLoConnectToService\"}", buf, 0x12u);
  }
  if (self->_connectedServiceIdentifier)
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v6 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to connect to service because this connection object is already connected to a service\"}", buf, 0x12u);
    }
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = @"Already connected to another service";
    -[CLMiLoConnectionInternal _notifyClientConnectServiceDidFailWithServiceIdentifier:withError:](self, "_notifyClientConnectServiceDidFailWithServiceIdentifier:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 9, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
  }
  else if (self->_locationdConnection)
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service, set connectedServiceIdentifier\"}", buf, 0x12u);
    }
    self->_connectedServiceIdentifier = (NSUUID *)[a3 copy];
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    int v8 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service, set handler for prediction updates\"}", buf, 0x12u);
    }
    [(CLMiLoConnectionInternal *)self _setHandlerForMiLoPredictionEvents];
    uint64_t v15 = 0x1EE00AD20;
    id v16 = a3;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    sub_1907AEFD4("kCLConnectionMessageMiLoConnectToService", &v12, buf);
    uint64_t v11 = v20[0];
    if (v20[0]) {
      atomic_fetch_add_explicit(&v20[0]->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v11) {
      sub_1906BFE48(v11);
    }
    if (v20[0]) {
      sub_1906BFE48(v20[0]);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to connect to services with internal error\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v10 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to connect to services with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to connect to services with internal error\"}", buf, 0x12u);
    }
    uint64_t v13 = *MEMORY[0x1E4F28568];
    uint64_t v14 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientConnectServiceDidFailWithServiceIdentifier:withError:](self, "_notifyClientConnectServiceDidFailWithServiceIdentifier:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)));
  }
}

- (void)_disconnectServiceWithIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289026;
    __int16 v23 = 2082;
    char v24 = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, disconnect to a service, kCLConnectionMessageMiLoDisconnectToService\"}", buf, 0x12u);
  }
  if (self->_connectedServiceIdentifier)
  {
    if (objc_msgSend(a3, "isEqual:"))
    {
      if (self->_locationdConnection)
      {
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
        uint64_t v6 = qword_1E929F628;
        if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_INFO))
        {
          *(void *)buf = 68289026;
          __int16 v23 = 2082;
          char v24 = "";
          _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"disconnect to service, clear connectedServiceIdentifier\"}", buf, 0x12u);
          if (qword_1E929F620 != -1) {
            dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
          }
        }
        uint64_t v7 = qword_1E929F628;
        if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
        {
          *(void *)buf = 68289026;
          __int16 v23 = 2082;
          char v24 = "";
          _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service, unset handler for prediction updates\"}", buf, 0x12u);
        }
        [(CLMiLoConnectionInternal *)self _unsetHandlerForMiLoPredictionEvents];
        uint64_t v16 = 0x1EE00AD20;
        id v17 = a3;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        uint64_t v9 = (std::__shared_weak_count *)operator new(0x70uLL);
        v9->__shared_owners_ = 0;
        v9->__shared_weak_owners_ = 0;
        v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
        sub_1906D5C70(buf, "kCLConnectionMessageMiLoDisconnectToService");
        MEMORY[0x192FCE840](&v9[1], buf, v8);
        if (v25 < 0) {
          operator delete(*(void **)buf);
        }
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        CLConnectionClient::sendMessage();
        if (v9) {
          sub_1906BFE48(v9);
        }

        self->_connectedServiceIdentifier = 0;
        sub_1906BFE48(v9);
      }
      else
      {
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
        uint64_t v12 = qword_1E929F628;
        if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
        {
          *(void *)buf = 68289026;
          __int16 v23 = 2082;
          char v24 = "";
          _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect service with internal error\"}", buf, 0x12u);
          if (qword_1E929F620 != -1) {
            dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
          }
        }
        uint64_t v13 = qword_1E929F628;
        if (os_signpost_enabled((os_log_t)qword_1E929F628))
        {
          *(void *)buf = 68289026;
          __int16 v23 = 2082;
          char v24 = "";
          _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to disconnect service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to disconnect service with internal error\"}", buf, 0x12u);
        }
        uint64_t v14 = *MEMORY[0x1E4F28568];
        uint64_t v15 = @"Internal error";
        -[CLMiLoConnectionInternal _notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:](self, "_notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)), a3);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v11 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)buf = 68289026;
        __int16 v23 = 2082;
        char v24 = "";
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect to a service because connected to a different service\"}", buf, 0x12u);
      }
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v19 = @"Invalid parameter";
      -[CLMiLoConnectionInternal _notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:](self, "_notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)), a3);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v10 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)buf = 68289026;
      __int16 v23 = 2082;
      char v24 = "";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect to a service because this connection object hasn't connected to a service\"}", buf, 0x12u);
    }
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:](self, "_notifyClientDisconnectServiceDidFailWithError:serviceIdentifier:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1)), a3);
  }
}

- (void)_requestMiLoPredictionWithRequestIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    __int16 v20 = 2082;
    uint64_t v21 = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, single shot MiLo prediction, kCLConnectionMessageMiLoSingleShotPrediction\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v15[0] = 0x1EE00AD20;
      v15[1] = 0x1EE00ADA0;
      v16[0] = connectedServiceIdentifier;
      v16[1] = a3;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      uint64_t v8 = (std::__shared_weak_count *)operator new(0x70uLL);
      v8->__shared_owners_ = 0;
      v8->__shared_weak_owners_ = 0;
      v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "kCLConnectionMessageMiLoSingleShotPrediction");
      MEMORY[0x192FCE840](&v8[1], buf, v7);
      if (v22 < 0) {
        operator delete(*(void **)buf);
      }
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnectionClient::sendMessage();
      if (v8) {
        sub_1906BFE48(v8);
      }
      sub_1906BFE48(v8);
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v11 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        __int16 v20 = 2082;
        uint64_t v21 = "";
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v12 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        __int16 v20 = 2082;
        uint64_t v21 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request a single shot prediction with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction with internal error\"}", buf, 0x12u);
      }
      uint64_t v13 = *MEMORY[0x1E4F28568];
      uint64_t v14 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      __int16 v20 = 2082;
      uint64_t v21 = "";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v10 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      __int16 v20 = 2082;
      uint64_t v21 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request a single shot prediction, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
  }
}

- (void)_requestObservationWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  uint64_t v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    __int16 v23 = 2082;
    char v24 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, request observation, kCLConnectionMessageRequestObservation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v18[0] = 0x1EE00AD20;
      v18[1] = 0x1EE00ADA0;
      v19[0] = connectedServiceIdentifier;
      v19[1] = a3;
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
      uint64_t v10 = v9;
      if (a4) {
        [v9 setObject:a4 forKey:0x1EE00ADC0];
      }
      uint64_t v11 = (std::__shared_weak_count *)operator new(0x70uLL);
      v11->__shared_owners_ = 0;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "kCLConnectionMessageRequestObservation");
      MEMORY[0x192FCE840](&v11[1], buf, v10);
      if (v25 < 0) {
        operator delete(*(void **)buf);
      }
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnectionClient::sendMessage();
      if (v11) {
        sub_1906BFE48(v11);
      }
      sub_1906BFE48(v11);
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v14 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        __int16 v23 = 2082;
        char v24 = "";
        _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v15 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        __int16 v23 = 2082;
        char v24 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request observation with internal error\"}", buf, 0x12u);
      }
      uint64_t v16 = *MEMORY[0x1E4F28568];
      uint64_t v17 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v12 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      __int16 v23 = 2082;
      char v24 = "";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v13 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      __int16 v23 = 2082;
      char v24 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1)));
  }
}

- (void)_labelEventWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4 observationIdentifier:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  uint64_t v9 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    __int16 v24 = 2082;
    char v25 = "";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, label an observation, kCLConnectionMessageLabelSignleObservation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v19[0] = 0x1EE00AD20;
      v19[1] = 0x1EE00ADA0;
      v20[0] = connectedServiceIdentifier;
      v20[1] = a3;
      void v19[2] = 0x1EE00ADC0;
      v19[3] = 0x1EE00ADE0;
      v20[2] = a4;
      v20[3] = a5;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
      uint64_t v12 = (std::__shared_weak_count *)operator new(0x70uLL);
      v12->__shared_owners_ = 0;
      v12->__shared_weak_owners_ = 0;
      v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "kCLConnectionMessageLabelSignleObservation");
      MEMORY[0x192FCE840](&v12[1], buf, v11);
      if (v26 < 0) {
        operator delete(*(void **)buf);
      }
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnectionClient::sendMessage();
      if (v12) {
        sub_1906BFE48(v12);
      }
      sub_1906BFE48(v12);
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v15 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        __int16 v24 = 2082;
        char v25 = "";
        _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label an observation with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v16 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        __int16 v24 = 2082;
        char v25 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label an observation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to label an observation with internal error\"}", buf, 0x12u);
      }
      uint64_t v17 = *MEMORY[0x1E4F28568];
      uint64_t v18 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v13 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      __int16 v24 = 2082;
      char v25 = "";
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v14 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      __int16 v24 = 2082;
      char v25 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v21 = *MEMORY[0x1E4F28568];
    char v22 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1)));
  }
}

- (void)_labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5 requestIdentifier:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  uint64_t v11 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    __int16 v26 = 2082;
    uint64_t v27 = "";
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, label observations between dates, kCLConnectionMessageLabelObservationsBetweenDates\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v21[0] = 0x1EE00AD20;
      v21[1] = 0x1EE00ADA0;
      v22[0] = connectedServiceIdentifier;
      v22[1] = a6;
      v21[2] = 0x1EE00ADC0;
      void v21[3] = 0x1EE00AE00;
      v22[2] = a5;
      void v22[3] = a3;
      v21[4] = 0x1EE00AE20;
      v22[4] = a4;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
      uint64_t v14 = (std::__shared_weak_count *)operator new(0x70uLL);
      v14->__shared_owners_ = 0;
      v14->__shared_weak_owners_ = 0;
      v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE005260;
      sub_1906D5C70(buf, "kCLConnectionMessageLabelObservationsBetweenDates");
      MEMORY[0x192FCE840](&v14[1], buf, v13);
      if (v28 < 0) {
        operator delete(*(void **)buf);
      }
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      CLConnectionClient::sendMessage();
      if (v14) {
        sub_1906BFE48(v14);
      }
      sub_1906BFE48(v14);
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v17 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        __int16 v26 = 2082;
        uint64_t v27 = "";
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v18 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        __int16 v26 = 2082;
        uint64_t v27 = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label observations between dates with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates with internal error\"}", buf, 0x12u);
      }
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v20 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a6, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v15 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      __int16 v26 = 2082;
      uint64_t v27 = "";
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v16 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      __int16 v26 = 2082;
      uint64_t v27 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label observations between dates, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    __int16 v24 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a6, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1)));
  }
}

- (void)_removeCustomLocationOfInterestFromMonitoringWithIdentifier:(id)a3 withRequestIdentifier:(id)a4
{
  v22[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  uint64_t v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v22[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, remove a custom LOI, kCLConnectionMessageRemoveCustomLOI\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v17[0] = 0x1EE00AD20;
      v17[1] = 0x1EE00ADA0;
      v18[0] = connectedServiceIdentifier;
      v18[1] = a4;
      void v17[2] = 0x1EE00AF00;
      void v18[2] = a3;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
      sub_19079CC1C("kCLConnectionMessageRemoveCustomLOI", &v14, buf);
      uint64_t v13 = v22[0];
      if (v22[0]) {
        atomic_fetch_add_explicit(&v22[0]->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v13) {
        sub_1906BFE48(v13);
      }
      if (v22[0]) {
        sub_1906BFE48(v22[0]);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v11 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v22[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v12 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v22[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v16 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove a custom LOI, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v10 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove a custom LOI, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to remove a custom LOI, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
  }
}

- (void)_startUpdatingMicroLocationWithConfiguration:(id)a3 withRequestIdentifier:(id)a4
{
  v22[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  uint64_t v7 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v22[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, start updating MicroLocation, kCLConnectionMessageStartUpdatingMicroLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v17[0] = 0x1EE00AD20;
      v17[1] = 0x1EE00ADA0;
      v18[0] = connectedServiceIdentifier;
      v18[1] = a4;
      void v17[2] = 0x1EE00AE60;
      void v18[2] = a3;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
      sub_1907AA2C0("kCLConnectionMessageStartUpdatingMicroLocation", &v14, buf);
      uint64_t v13 = v22[0];
      if (v22[0]) {
        atomic_fetch_add_explicit(&v22[0]->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v13) {
        sub_1906BFE48(v13);
      }
      if (v22[0]) {
        sub_1906BFE48(v22[0]);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v11 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v22[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to tart updating MicroLocation with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v12 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v22[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to tart updating MicroLocation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to tart updating MicroLocation with internal error\"}", buf, 0x12u);
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v16 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v9 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to start updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v10 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v22[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v22 + 2) = (std::__shared_weak_count *)"";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to start updating MicroLocation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to start updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
  }
}

- (void)_stopUpdatingMicroLocationWithRequestIdentifier:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEBUG))
  {
    *(void *)buf = 68289026;
    LOWORD(v21[0]) = 2082;
    *(void *)((char *)v21 + 2) = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, stop updating MicroLocation, kCLConnectionMessageStopUpdatingMicroLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v16[0] = 0x1EE00AD20;
      v16[1] = 0x1EE00ADA0;
      v17[0] = connectedServiceIdentifier;
      v17[1] = a3;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      sub_19083909C(buf, "kCLConnectionMessageStopUpdatingMicroLocation", &v13);
      uint64_t v7 = (std::__shared_weak_count *)v21[0];
      uint64_t v12 = (std::__shared_weak_count *)v21[0];
      if (v21[0]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v21[0] + 8), 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v12) {
        sub_1906BFE48(v12);
      }
      if (v7) {
        sub_1906BFE48(v7);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v10 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v11 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to stop updating MicroLocation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation with internal error\"}", buf, 0x12u);
      }
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v15 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v8 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v9 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to stop updating MicroLocation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
  }
}

- (void)_requestModelLearningWithRequestIdentifier:(id)a3
{
  v20[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289026;
    LOWORD(v20[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request MiLo Learning\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v15[0] = 0x1EE00AD20;
      v15[1] = 0x1EE00ADA0;
      v16[0] = connectedServiceIdentifier;
      v16[1] = a3;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      sub_1907AEFD4("kCLConnectionMessageRequestModelLearning", &v12, buf);
      uint64_t v11 = v20[0];
      if (v20[0]) {
        atomic_fetch_add_explicit(&v20[0]->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v11) {
        sub_1906BFE48(v11);
      }
      if (v20[0]) {
        sub_1906BFE48(v20[0]);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v9 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v20[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request MicroLocation learning with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v10 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v20[0]) = 2082;
        *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request MicroLocation learning with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request MicroLocation learning with internal error\"}", buf, 0x12u);
      }
      uint64_t v13 = *MEMORY[0x1E4F28568];
      uint64_t v14 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v7 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request MiLo learning, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v8 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v20[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v20 + 2) = (std::__shared_weak_count *)"";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request MiLo learning, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request MiLo learning, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
  }
}

- (void)_purgeAllMiLoDataWithRequestIdentifier:(id)a3
{
  void v15[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289026;
    LOWORD(v15[0]) = 2082;
    *(std::__shared_weak_count **)((char *)v15 + 2) = (std::__shared_weak_count *)"";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request Purge MiLo Data\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    uint64_t v12 = 0x1EE00ADA0;
    id v13 = a3;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    sub_1907AEFD4("kCLConnectionMessageRequestPurgeMiLoData", &v9, buf);
    uint64_t v8 = v15[0];
    if (v15[0]) {
      atomic_fetch_add_explicit(&v15[0]->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v8) {
      sub_1906BFE48(v8);
    }
    if (v15[0]) {
      sub_1906BFE48(v15[0]);
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v6 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v15[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v15 + 2) = (std::__shared_weak_count *)"";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request Purge MiLo Data with internal error\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v7 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v15[0]) = 2082;
      *(std::__shared_weak_count **)((char *)v15 + 2) = (std::__shared_weak_count *)"";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request Purge MiLo Data with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request Purge MiLo Data with internal error\"}", buf, 0x12u);
    }
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v11 = @"Internal error";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
  }
}

- (void)_requestExportDatabaseWithRequestIdentifier:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E929F620 != -1) {
    dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
  }
  __int16 v5 = qword_1E929F628;
  if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)buf = 68289026;
    LOWORD(v21[0]) = 2082;
    *(void *)((char *)v21 + 2) = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request Export MiLo Database\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v16[0] = 0x1EE00AD20;
      v16[1] = 0x1EE00ADA0;
      v17[0] = connectedServiceIdentifier;
      v17[1] = a3;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      sub_190839164(buf, "kCLConnectionMessageRequestMiLoExportDatabaseTables", &v13);
      uint64_t v7 = (std::__shared_weak_count *)v21[0];
      uint64_t v12 = (std::__shared_weak_count *)v21[0];
      if (v21[0]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v21[0] + 8), 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v12) {
        sub_1906BFE48(v12);
      }
      if (v7) {
        sub_1906BFE48(v7);
      }
    }
    else
    {
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
      uint64_t v10 = qword_1E929F628;
      if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request Export MiLo Database with internal error\"}", buf, 0x12u);
        if (qword_1E929F620 != -1) {
          dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
        }
      }
      uint64_t v11 = qword_1E929F628;
      if (os_signpost_enabled((os_log_t)qword_1E929F628))
      {
        *(void *)buf = 68289026;
        LOWORD(v21[0]) = 2082;
        *(void *)((char *)v21 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request Export MiLo Database with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request Export MiLo Database with internal error\"}", buf, 0x12u);
      }
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v15 = @"Internal error";
      -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
    }
  }
  else
  {
    if (qword_1E929F620 != -1) {
      dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
    }
    uint64_t v8 = qword_1E929F628;
    if (os_log_type_enabled((os_log_t)qword_1E929F628, OS_LOG_TYPE_ERROR))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to Export MiLo Database, not connected to service yet\"}", buf, 0x12u);
      if (qword_1E929F620 != -1) {
        dispatch_once(&qword_1E929F620, &unk_1EE005FE0);
      }
    }
    uint64_t v9 = qword_1E929F628;
    if (os_signpost_enabled((os_log_t)qword_1E929F628))
    {
      *(void *)buf = 68289026;
      LOWORD(v21[0]) = 2082;
      *(void *)((char *)v21 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to Export MiLo Database, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to Export MiLo Database, not connected to service yet\"}", buf, 0x12u);
    }
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v19 = @"Not connected to any service";
    -[CLMiLoConnectionInternal _notifyClientDidCompleteClientRequest:withError:](self, "_notifyClientDidCompleteClientRequest:withError:", a3, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1)));
  }
}

@end