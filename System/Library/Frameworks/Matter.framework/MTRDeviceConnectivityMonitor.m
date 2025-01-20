@interface MTRDeviceConnectivityMonitor
+ (_DNSServiceRef_t)_sharedResolverConnection;
- (MTRDeviceConnectivityMonitor)initWithCompressedFabricID:(id)a3 nodeID:(id)a4;
- (MTRDeviceConnectivityMonitor)initWithInstanceName:(id)a3;
- (id).cxx_construct;
- (id)description;
- (void)_callHandler;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)handleResolvedHostname:(const char *)a3 port:(unsigned __int16)a4 error:(int)a5;
- (void)startMonitoringWithHandler:(id)a3 queue:(id)a4;
- (void)stopMonitoring;
@end

@implementation MTRDeviceConnectivityMonitor

- (MTRDeviceConnectivityMonitor)initWithInstanceName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTRDeviceConnectivityMonitor;
  v7 = [(MTRDeviceConnectivityMonitor *)&v15 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    instanceName = v7->_instanceName;
    v7->_instanceName = (NSString *)v8;

    uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11);
    connections = v7->_connections;
    v7->_connections = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (MTRDeviceConnectivityMonitor)initWithCompressedFabricID:(id)a3 nodeID:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  v20[0] = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  v20[1] = v10;
  memset(v19, 0, sizeof(v19));
  sub_244D7E88C(v23, 0x35uLL, v20, (uint64_t)v19);
  if (LODWORD(v19[0]))
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%@ could not make instance name", buf, 0xCu);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    objc_super v15 = 0;
  }
  else
  {
    v16 = objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)v23);
    self = (MTRDeviceConnectivityMonitor *)(id)objc_msgSend_initWithInstanceName_(self, v17, (uint64_t)v16);

    objc_super v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  begin = self->_resolvers.__begin_;
  end = self->_resolvers.__end_;
  while (begin != end)
    DNSServiceRefDeallocate(*begin++);
  v5.receiver = self;
  v5.super_class = (Class)MTRDeviceConnectivityMonitor;
  [(MTRDeviceConnectivityMonitor *)&v5 dealloc];
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<MTRDeviceConnectivityMonitor: %@>", self->_instanceName);
}

+ (_DNSServiceRef_t)_sharedResolverConnection
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_268EBE958);
  result = (_DNSServiceRef_t *)qword_268EBE960;
  if (!qword_268EBE960)
  {
    DNSServiceErrorType Connection = DNSServiceCreateConnection((DNSServiceRef *)&qword_268EBE960);
    if (Connection)
    {
      DNSServiceErrorType v5 = Connection;
      id v6 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceConnectivityMonitor: DNSServiceCreateConnection failed %d", buf, 8u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
    else
    {
      id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("MTRDeviceConnectivityMonitor", v7);
      uint64_t v9 = (void *)qword_268EBE968;
      qword_268EBE968 = (uint64_t)v8;

      if (!DNSServiceSetDispatchQueue((DNSServiceRef)qword_268EBE960, (dispatch_queue_t)qword_268EBE968)) {
        return (_DNSServiceRef_t *)qword_268EBE960;
      }
      uint64_t v10 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = a1;
        _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ cannot set dispatch queue on resolve", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      DNSServiceRefDeallocate((DNSServiceRef)qword_268EBE960);
      qword_268EBE960 = 0;
      uint64_t v11 = (void *)qword_268EBE968;
      qword_268EBE968 = 0;
    }
    return 0;
  }
  return result;
}

- (void)_callHandler
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_268EBE958);
  v3 = (void *)MEMORY[0x2456969D0](self->_monitorHandler);
  if (v3)
  {
    id v4 = v3;
    dispatch_async((dispatch_queue_t)self->_handlerQueue, v3);
    v3 = v4;
  }
}

- (void)handleResolvedHostname:(const char *)a3 port:(unsigned __int16)a4 error:(int)a5
{
  unsigned int v6 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268EBE958);
  if (a5 == -65563)
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ disconnected from dns-sd subsystem", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      uint64_t v24 = self;
      sub_244CC4DE0(0, 1);
    }
    objc_msgSend__stopMonitoring(self, v11, v12, v24);
  }
  else
  {
    id v13 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)a3);
    objc_super v15 = objc_msgSend_objectForKeyedSubscript_(self->_connections, v14, (uint64_t)v13);

    if (!v15)
    {
      snprintf(__str, 6uLL, "%d", __rev16(v6));
      host = nw_endpoint_create_host(a3, __str);
      if (host)
      {
        secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
        if (secure_udp)
        {
          v18 = nw_connection_create(host, secure_udp);
          v19 = v18;
          if (v18)
          {
            nw_connection_set_queue(v18, (dispatch_queue_t)qword_268EBE968);
            objc_initWeak((id *)buf, self);
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 3221225472;
            handler[2] = sub_244B97994;
            handler[3] = &unk_265199DC8;
            objc_copyWeak(&v28, (id *)buf);
            nw_connection_set_path_changed_handler(v19, handler);
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = sub_244B97AF4;
            v25[3] = &unk_265199DF0;
            objc_copyWeak(&v26, (id *)buf);
            nw_connection_set_viability_changed_handler(v19, v25);
            nw_connection_start(v19);
            objc_msgSend_setObject_forKeyedSubscript_(self->_connections, v20, (uint64_t)v19, v13);
            objc_destroyWeak(&v26);
            objc_destroyWeak(&v28);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v23 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v31 = self;
              __int16 v32 = 2080;
              v33 = a3;
              __int16 v34 = 2080;
              v35 = __str;
              _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "%@ failed to create connection for %s:%s", buf, 0x20u);
            }

            if (sub_244CC4E58(1u)) {
              sub_244CC4DE0(0, 1);
            }
          }
        }
        else
        {
          v22 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = self;
            _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "%@ failed to create udp parameters", buf, 0xCu);
          }

          if (sub_244CC4E58(1u)) {
            sub_244CC4DE0(0, 1);
          }
        }
      }
      else
      {
        v21 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v31 = self;
          __int16 v32 = 2080;
          v33 = a3;
          __int16 v34 = 2080;
          v35 = __str;
          _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "%@ failed to create endpoint for %s:%s", buf, 0x20u);
        }

        if (sub_244CC4E58(1u)) {
          sub_244CC4DE0(0, 1);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268EBE958);
}

- (void)startMonitoringWithHandler:(id)a3 queue:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v43 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268EBE958);
  id v7 = (void *)MEMORY[0x2456969D0](v6);
  id monitorHandler = self->_monitorHandler;
  self->_id monitorHandler = v7;

  objc_storeStrong((id *)&self->_handlerQueue, a4);
  p_resolvers = &self->_resolvers;
  if (self->_resolvers.__end_ == self->_resolvers.__begin_)
  {
    uint64_t v11 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      instanceName = self->_instanceName;
      *(_DWORD *)buf = 138412802;
      v46 = self;
      __int16 v47 = 2112;
      v48 = instanceName;
      __int16 v49 = 2048;
      uint64_t v50 = qword_268EBE970;
      _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_DEFAULT, "%@ start connectivity monitoring for %@ (%lu monitoring objects)", buf, 0x20u);
    }

    if (sub_244CC4E58(2u))
    {
      v39 = self->_instanceName;
      uint64_t v41 = qword_268EBE970;
      v37 = self;
      sub_244CC4DE0(0, 2);
    }
    v17 = (_DNSServiceRef_t *)objc_msgSend__sharedResolverConnection(MTRDeviceConnectivityMonitor, v13, v14, v37, v39, v41);
    if (v17)
    {
      v18 = off_265199E10;
      do
      {
        v19 = *v18;
        DNSServiceRef sdRef = v17;
        v20 = (const char *)objc_msgSend_UTF8String(self->_instanceName, (const char *)v15, v16, v38, v40, v42);
        uint64_t v21 = DNSServiceResolve(&sdRef, 0x4000u, 0, v20, "_matter._tcp", v19, (DNSServiceResolveReply)sub_244B9813C, self);
        if (v21)
        {
          v22 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v23 = "(null)";
            if (v19) {
              v23 = v19;
            }
            v46 = self;
            __int16 v47 = 2080;
            v48 = (void *)v23;
            __int16 v49 = 1024;
            LODWORD(v50) = v21;
            _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "%@ failed to create resolver for \"%s\" domain: %d", buf, 0x1Cu);
          }

          if (sub_244CC4E58(1u))
          {
            uint64_t v24 = "(null)";
            if (v19) {
              uint64_t v24 = v19;
            }
            v40 = v24;
            uint64_t v42 = v21;
            v38 = self;
            sub_244CC4DE0(0, 1);
          }
        }
        else
        {
          end = self->_resolvers.__end_;
          value = self->_resolvers.__end_cap_.__value_;
          if (end >= value)
          {
            uint64_t v28 = end - p_resolvers->__begin_;
            if ((unint64_t)(v28 + 1) >> 61) {
              sub_2446D033C();
            }
            uint64_t v29 = (char *)value - (char *)p_resolvers->__begin_;
            uint64_t v30 = v29 >> 2;
            if (v29 >> 2 <= (unint64_t)(v28 + 1)) {
              uint64_t v30 = v28 + 1;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v15 = v30;
            }
            if (v15) {
              v31 = (char *)sub_2447EAF80((uint64_t)&self->_resolvers.__end_cap_, v15);
            }
            else {
              v31 = 0;
            }
            __int16 v32 = (_DNSServiceRef_t **)&v31[8 * v28];
            *__int16 v32 = sdRef;
            v27 = v32 + 1;
            begin = self->_resolvers.__begin_;
            v33 = self->_resolvers.__end_;
            if (v33 != begin)
            {
              do
              {
                v35 = *--v33;
                *--__int16 v32 = v35;
              }
              while (v33 != begin);
              v33 = p_resolvers->__begin_;
            }
            self->_resolvers.__begin_ = v32;
            self->_resolvers.__end_ = v27;
            self->_resolvers.__end_cap_.__value_ = (_DNSServiceRef_t **)&v31[8 * v15];
            if (v33) {
              operator delete(v33);
            }
          }
          else
          {
            *end = sdRef;
            v27 = end + 1;
          }
          self->_resolvers.__end_ = v27;
        }
        ++v18;
      }
      while (v18 != (char **)&unk_265199E20);
      if (self->_resolvers.__end_ != self->_resolvers.__begin_) {
        ++qword_268EBE970;
      }
    }
    else
    {
      uint64_t v36 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = self;
        _os_log_impl(&dword_2446BD000, v36, OS_LOG_TYPE_ERROR, "%@ failed to get shared resolver connection", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
  }
  else
  {
    uint64_t v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = self;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_DEFAULT, "%@ connectivity monitor already running", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268EBE958);
}

- (void)_stopMonitoring
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_268EBE958);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_connections;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_connections, v5, *(void *)(*((void *)&v17 + 1) + 8 * v8), (void)v17);
        nw_connection_cancel(v9);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend_removeAllObjects(self->_connections, v10, v11);
  id monitorHandler = self->_monitorHandler;
  self->_id monitorHandler = 0;

  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = 0;

  begin = self->_resolvers.__begin_;
  end = self->_resolvers.__end_;
  if (end != begin)
  {
    do
      DNSServiceRefDeallocate(*begin++);
    while (begin != end);
    self->_resolvers.__end_ = self->_resolvers.__begin_;
    if (!--qword_268EBE970)
    {
      dispatch_time_t v16 = dispatch_time(0, 10000000000);
      dispatch_after(v16, (dispatch_queue_t)qword_268EBE968, &unk_26F952478);
    }
  }
}

- (void)stopMonitoring
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    instanceName = self->_instanceName;
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = instanceName;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "%@ stop connectivity monitoring for %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268EBE958);
  if (!qword_268EBE960 || !qword_268EBE968)
  {
    DNSServiceErrorType v5 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "%@ shared resolver connection already stopped - nothing to do", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B98630;
  block[3] = &unk_265193E58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_268EBE968, block);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268EBE958);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_monitorHandler, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  begin = self->_resolvers.__begin_;
  if (begin)
  {
    self->_resolvers.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end