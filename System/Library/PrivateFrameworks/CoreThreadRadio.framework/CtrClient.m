@interface CtrClient
- (Result)addPrefix:(Result *__return_ptr)retstr;
- (Result)addService:(Result *__return_ptr)retstr;
- (Result)attachToNetwork:(Result *__return_ptr)retstr;
- (Result)attachToNetwork:(Result *__return_ptr)retstr output:;
- (Result)commissionOrFormNetwork:(Result *__return_ptr)retstr output:;
- (Result)form:(Result *__return_ptr)retstr;
- (Result)generatePSKc:(Result *__return_ptr)retstr output:;
- (Result)generateThreadDiagnosticsMonitorLogs;
- (Result)getProperty:(Result *__return_ptr)retstr output:;
- (Result)join:(Result *__return_ptr)retstr;
- (Result)joiner:(Result *__return_ptr)retstr;
- (Result)leave;
- (Result)removePrefix:(Result *__return_ptr)retstr;
- (Result)removeService:(Result *__return_ptr)retstr;
- (Result)reset:(Result *__return_ptr)retstr;
- (Result)resume;
- (Result)scan:(Result *__return_ptr)retstr;
- (Result)sendData:(Result *__return_ptr)retstr data:data_length:;
- (Result)sendNwDiagReqGet:(Result *__return_ptr)retstr;
- (Result)setChannel:(Result *__return_ptr)retstr;
- (Result)setProperty:(Result *__return_ptr)retstr prperty_val:;
- (Result)threadLeave;
- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:;
- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:waitForSync:;
- (Result)threadStart:(Result *__return_ptr)retstr outputUniqueId:;
- (Result)updateAccData:(Result *__return_ptr)retstr;
- (Result)updatePrimaryResident:(Result *__return_ptr)retstr isPrimaryResidentThreadCapable:primaryResidentInfo:;
- (id).cxx_construct;
- (id)init:(const char *)a3;
- (shared_ptr<CtrXPC::Client>)createClient:(const char *)a3;
- (void)captureTriggerData:(int)a3 triggerId:(int)a4 accessoryInfoList:(id)a5 completionHandler:(id)a6;
- (void)provideExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)setClientEventsOff;
- (void)setClientEventsOn;
- (void)setEventHandler:(const void *)a3 EventBlock:(id)a4 dqueue:(queue)a5;
- (void)startFWUpdate:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)startPairingForExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5;
- (void)stopFWUpdate:(id)a3;
- (void)stopPairing:(id)a3;
- (void)threadLeaveWithCompletion:(id)a3;
- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 routerMode:(BOOL)a6 eMAC:(id)a7 waitForSync:(BOOL)a8 completion:(id)a9;
- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)threadStart:(id)a3 geoAvailable:(BOOL)a4 isPrimaryUser:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7;
- (void)threadStopWithCompletion:(id)a3;
@end

@implementation CtrClient

- (id)init:(const char *)a3
{
  if (MGGetBoolAnswer())
  {
    v10.receiver = self;
    v10.super_class = (Class)CtrClient;
    v5 = [(CtrClient *)&v10 init];
    v6 = v5;
    if (v5)
    {
      [(CtrClient *)v5 createClient:a3];
      std::shared_ptr<CtrXPC::Command>::operator=[abi:ne180100]((uint64_t)&v6->CtrXPCClientPtr, &v9);
      if (*((void *)&v9 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
      }
    }
    self = v6;
    v7 = self;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CtrClient init:]();
    }
    v7 = 0;
  }

  return v7;
}

- (shared_ptr<CtrXPC::Client>)createClient:(const char *)a3
{
}

- (void)setEventHandler:(const void *)a3 EventBlock:(id)a4 dqueue:(queue)a5
{
  id v8 = a4;
  ptr = (uint64_t *)self->CtrXPCClientPtr.__ptr_;
  objc_super v10 = *(NSObject **)a5.var0.var0;
  dispatch_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  CtrXPC::Client::setEventHandler(ptr, (const std::string *)a3, v8, &object);
  if (object) {
    dispatch_release(object);
  }
}

- (void)setClientEventsOn
{
}

- (void)setClientEventsOff
{
}

- (Result)getProperty:(Result *__return_ptr)retstr output:
{
  CtrXPC::Client::getProperty(v1, v2, (uint64_t)retstr);
  return result;
}

- (Result)setProperty:(Result *__return_ptr)retstr prperty_val:
{
  CtrXPC::Client::set(v1, v2, (uint64_t)retstr);
  return result;
}

- (Result)sendData:(Result *__return_ptr)retstr data:data_length:
{
  CtrXPC::Client::sendData(v1, v2, v3, (uint64_t)retstr);
  return result;
}

- (Result)addPrefix:(Result *__return_ptr)retstr
{
  long long v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  CtrXPC::Client::addPrefix((uint64_t)v4, (uint64_t)retstr);
  return result;
}

- (Result)removePrefix:(Result *__return_ptr)retstr
{
  long long v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  CtrXPC::Client::removePrefix((uint64_t)v4, (uint64_t)retstr);
  return result;
}

- (Result)updateAccData:(Result *__return_ptr)retstr
{
  long long v3 = *v1;
  uint64_t v4 = *((void *)v1 + 2);
  CtrXPC::Client::updateAccData((uint64_t)&v3, (uint64_t)retstr);
  return result;
}

- (Result)form:(Result *__return_ptr)retstr
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)(v1 + 80);
  v6[4] = *(_OWORD *)(v1 + 64);
  v6[5] = v2;
  uint64_t v7 = *(void *)(v1 + 96);
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  long long v4 = *(_OWORD *)(v1 + 48);
  v6[2] = *(_OWORD *)(v1 + 32);
  v6[3] = v4;
  CtrXPC::Client::form((uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)leave
{
  CtrXPC::Client::leave((uint64_t)retstr);
  return result;
}

- (Result)scan:(Result *__return_ptr)retstr
{
  long long v3 = *v1;
  uint64_t v4 = *((void *)v1 + 2);
  CtrXPC::Client::scan((uint64_t)&v3, (uint64_t)retstr);
  return result;
}

- (Result)addService:(Result *__return_ptr)retstr
{
  long long v3 = *v1;
  uint64_t v4 = *((void *)v1 + 2);
  CtrXPC::Client::addService((uint64_t)&v3, (uint64_t)retstr);
  return result;
}

- (Result)removeService:(Result *__return_ptr)retstr
{
  CtrXPC::Client::removeService(v1, v2, (uint64_t)retstr);
  return result;
}

- (Result)join:(Result *__return_ptr)retstr
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  _OWORD v4[2] = *(_OWORD *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  CtrXPC::Client::join((uint64_t)v4, (uint64_t)retstr);
  return result;
}

- (Result)joiner:(Result *__return_ptr)retstr
{
  long long v2 = *(_OWORD *)(v1 + 48);
  v5[2] = *(_OWORD *)(v1 + 32);
  v5[3] = v2;
  uint64_t v6 = *(void *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 16);
  v5[0] = *(_OWORD *)v1;
  v5[1] = v3;
  CtrXPC::Client::joiner((uint64_t)v5, (uint64_t)retstr);
  return result;
}

- (Result)resume
{
  CtrXPC::Client::resume((uint64_t)retstr);
  return result;
}

- (Result)reset:(Result *__return_ptr)retstr
{
  CtrXPC::Client::reset(v1, (uint64_t)retstr);
  return result;
}

- (Result)sendNwDiagReqGet:(Result *__return_ptr)retstr
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  int v5 = *(_DWORD *)(v1 + 32);
  CtrXPC::Client::send_network_diag_get((uint64_t)v4, (uint64_t)retstr);
  return result;
}

- (Result)setChannel:(Result *__return_ptr)retstr
{
  CtrXPC::Client::setChannel(v1, (uint64_t)retstr);
  return result;
}

- (Result)attachToNetwork:(Result *__return_ptr)retstr output:
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v3 = v1[1];
  v5[0] = *v1;
  v5[1] = v3;
  v5[2] = v1[2];
  CtrXPC::Client::attachToNetwork((uint64_t)v5, v2, (uint64_t)retstr);
  return result;
}

- (Result)attachToNetwork:(Result *__return_ptr)retstr
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v2 = v1[1];
  v4[0] = *v1;
  v4[1] = v2;
  _OWORD v4[2] = v1[2];
  CtrXPC::Client::attachToNetwork(v4, (uint64_t)retstr);
  return result;
}

- (Result)commissionOrFormNetwork:(Result *__return_ptr)retstr output:
{
  CtrXPC::Client::commissionOrFormNetwork(v2, v1, (uint64_t)retstr);
  return result;
}

- (Result)generatePSKc:(Result *__return_ptr)retstr output:
{
  long long v3 = v1[1];
  v5[0] = *v1;
  v5[1] = v3;
  CtrXPC::Client::generatePSKc((uint64_t)v5, v2, (uint64_t)retstr);
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outputUniqueId:
{
  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:
{
  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)generateThreadDiagnosticsMonitorLogs
{
  std::string::basic_string[abi:ne180100]<0>(&v5, "Command Error");
  uint64_t v2 = v5;
  int v3 = v6;
  CtrXPC::Client::generate_diagnostics((uint64_t)retstr);
  if (v3 < 0) {
    operator delete(v2);
  }
  return result;
}

- (Result)threadStart:(Result *__return_ptr)retstr outUniqueId:waitForSync:
{
  retstr->var0 = 3;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var1.var1 = 0uLL;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
  return result;
}

- (Result)threadLeave
{
  CtrXPC::Client::threadLeave((uint64_t)retstr);
  return result;
}

- (void)threadLeaveWithCompletion:(id)a3
{
  id v4 = a3;
  CtrXPC::Client::threadLeaveWithCompletion((uint64_t)self->CtrXPCClientPtr.__ptr_, (uint64_t)v4);
}

- (void)captureTriggerData:(int)a3 triggerId:(int)a4 accessoryInfoList:(id)a5 completionHandler:(id)a6
{
  uint64_t v6 = MEMORY[0x270FA5388](self, a2, *(void *)&a3, *(void *)&a4, a5, a6);
  uint64_t v8 = v7;
  char v87 = v9;
  char v89 = v10;
  uint64_t v85 = v6;
  v155[1] = *MEMORY[0x263EF8340];
  id v91 = v11;
  v79 = v8;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v95 = "-[CtrClient captureTriggerData:triggerId:accessoryInfoList:completionHandler:]";
    LOWORD(v96) = 1024;
    *(_DWORD *)((char *)&v96 + 2) = 276;
    _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  context = (void *)MEMORY[0x2532FA9F0]();
  v108 = 0;
  uint64_t v109 = 0;
  v12 = &v154;
  uint64_t v110 = 0;
  v112 = 0;
  uint64_t v113 = 0;
  v69 = &v108;
  v63 = &v112;
  uint64_t v114 = 0;
  v75 = &v119;
  uint64_t v121 = 0;
  uint64_t v13 = 200;
  v119 = 0;
  uint64_t v120 = 0;
  do
  {
    v14 = &buf[v13];
    *((void *)v14 + 2) = 0;
    *((void *)v14 + 3) = 0;
    *(void *)v14 = 0;
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 4) = 0;
    *((void *)v14 + 5) = 0;
    *((void *)v14 + 6) = 0;
    *((void *)v14 + 7) = 0;
    *((void *)v14 + 8) = 0;
    *((void *)v14 + 9) = 0;
    v13 += 184;
    *((void *)v14 + 10) = 0;
    *((void *)v14 + 11) = 0;
  }
  while (v14 + 184 != (uint8_t *)&v123);
  uint64_t v137 = 0;
  v66 = &v136;
  v136 = 0;
  uint64_t v138 = 0;
  v60 = &v140;
  v140 = 0;
  uint64_t v142 = 0;
  uint64_t v141 = 0;
  v72 = &v147;
  v147 = 0;
  uint64_t v149 = 0;
  uint64_t v15 = 18792;
  uint64_t v148 = 0;
  do
  {
    v16 = &buf[v15];
    *((void *)v16 + 2) = 0;
    *((void *)v16 + 3) = 0;
    *(void *)v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 4) = 0;
    *((void *)v16 + 5) = 0;
    *((void *)v16 + 6) = 0;
    *((void *)v16 + 7) = 0;
    *((void *)v16 + 8) = 0;
    *((void *)v16 + 9) = 0;
    v15 += 184;
    *((void *)v16 + 10) = 0;
    *((void *)v16 + 11) = 0;
  }
  while (v16 + 184 != v151);
  uint64_t v17 = 37208;
  do
  {
    v18 = &buf[v17];
    *((void *)v18 + 2) = 0;
    *((void *)v18 + 3) = 0;
    *(void *)v18 = 0;
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 4) = 0;
    *((void *)v18 + 5) = 0;
    v17 += 56;
  }
  while (v18 + 56 != (uint8_t *)v155);
  if (v91)
  {
    unint64_t v152 = [v91 count];
    if (v152)
    {
      uint64_t v19 = 0;
      do
      {
        v20 = [v91 objectAtIndex:v19];
        id v21 = [v20 ipaddr];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v21 UTF8String]);
        std::string::operator=[abi:ne180100]((uint64_t)&v153[7 * v19], (long long *)__p);
        if (v93 < 0) {
          operator delete(__p[0]);
        }

        id v22 = [v20 name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v22 UTF8String]);
        std::string::operator=[abi:ne180100]((uint64_t)&v153[7 * v19 + 3], (long long *)__p);
        if (v93 < 0) {
          operator delete(__p[0]);
        }

        char v23 = [v20 isBatteryPowered];
        if ((unint64_t)(56 * v19 - 5552) < 0xFFFFFFFFFFFF58C7
          || (BYTE1(v153[7 * v19 + 6]) = v23,
              char v24 = [v20 isMatter],
              (unint64_t)(56 * v19 - 5553) < 0xFFFFFFFFFFFF58C7))
        {
          __break(1u);
LABEL_81:
          __break(0x5500u);
        }
        LOBYTE(v153[7 * v19 + 6]) = v24;

        int v25 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_81;
        }
        uint64_t v19 = v25;
      }
      while (v152 > v25);
    }
  }
  else
  {
    unint64_t v152 = 0;
  }
  v151[1] = v87;
  v151[0] = v89;
  bzero((char *)&v95 + 4, 0x9140uLL);
  v80 = [MEMORY[0x263F087E8] errorWithDomain:@"com.threadradiod.ctr" code:0 userInfo:0];
  CtrXPC::Client::captureTriggerDataWithCompletion(*(CtrXPC::Client **)(v85 + 8), (Ctr_triggerBasedStats *)buf);
  if (v122)
  {
    if (SHIBYTE(v121) < 0)
    {
      if (!v120)
      {
LABEL_30:
        v82 = 0;
LABEL_31:
        if (SHIBYTE(v149) < 0)
        {
          if (!v148)
          {
LABEL_37:
            v83 = 0;
LABEL_38:
            if (SHIBYTE(v110) < 0)
            {
              if (!v109)
              {
LABEL_44:
                v84 = 0;
LABEL_45:
                if (SHIBYTE(v138) < 0)
                {
                  if (!v137)
                  {
LABEL_51:
                    v86 = 0;
LABEL_52:
                    if (SHIBYTE(v114) < 0)
                    {
                      if (!v113)
                      {
LABEL_58:
                        v88 = 0;
LABEL_59:
                        if (SHIBYTE(v142) < 0)
                        {
                          if (!v141)
                          {
LABEL_65:
                            v90 = 0;
                            goto LABEL_66;
                          }
                          v60 = v140;
                        }
                        else if (!HIBYTE(v142))
                        {
                          goto LABEL_65;
                        }
                        v90 = [NSString stringWithUTF8String:v60];
LABEL_66:
                        v76 = [CtrTriggerResult alloc];
                        uint64_t v73 = BYTE4(v95);
                        uint64_t v70 = BYTE5(v95);
                        uint64_t v67 = BYTE6(v95);
                        uint64_t v64 = HIBYTE(v95);
                        uint64_t v61 = v96;
                        uint64_t v58 = HIDWORD(v96);
                        uint64_t v56 = v97;
                        uint64_t v54 = v98;
                        uint64_t v52 = v99;
                        uint64_t v50 = v100;
                        uint64_t v48 = v101;
                        uint64_t v46 = v102;
                        uint64_t v27 = v103;
                        uint64_t v28 = v104;
                        uint64_t v29 = v105;
                        int v30 = v106;
                        int v31 = v107;
                        v32 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v111);
                        *(_DWORD *)((char *)&v44 + 1) = v116;
                        LOBYTE(v44) = v115;
                        LOBYTE(v43) = v31 != 0;
                        LOBYTE(v42) = v30 != 0;
                        uint64_t v26 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](v76, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v73, v70, v67, v64, v61, v58, v56, v54, v52, v50, v48,
                                v46,
                                v27,
                                v28,
                                v29,
                                v42,
                                v82,
                                v43,
                                v84,
                                v32,
                                v88,
                                v44,
                                v117,
                                v118);

                        goto LABEL_67;
                      }
                      v63 = v112;
                    }
                    else if (!HIBYTE(v114))
                    {
                      goto LABEL_58;
                    }
                    v88 = [NSString stringWithUTF8String:v63];
                    goto LABEL_59;
                  }
                  v66 = v136;
                }
                else if (!HIBYTE(v138))
                {
                  goto LABEL_51;
                }
                v86 = [NSString stringWithUTF8String:v66];
                goto LABEL_52;
              }
              v69 = v108;
            }
            else if (!HIBYTE(v110))
            {
              goto LABEL_44;
            }
            v84 = objc_msgSend(NSString, "stringWithCString:encoding:", v69, objc_msgSend(NSString, "defaultCStringEncoding"));
            goto LABEL_45;
          }
          v72 = v147;
        }
        else if (!HIBYTE(v149))
        {
          goto LABEL_37;
        }
        v83 = [NSString stringWithUTF8String:v72];
        goto LABEL_38;
      }
      v75 = v119;
    }
    else if (!HIBYTE(v121))
    {
      goto LABEL_30;
    }
    v82 = [NSString stringWithUTF8String:v75];
    goto LABEL_31;
  }
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v86 = 0;
  v88 = 0;
  v90 = 0;
  uint64_t v26 = 0;
LABEL_67:
  if (v150)
  {
    v77 = [CtrTriggerResult alloc];
    uint64_t v74 = v123;
    uint64_t v71 = BYTE1(v123);
    uint64_t v68 = BYTE2(v123);
    uint64_t v65 = BYTE3(v123);
    uint64_t v62 = HIDWORD(v123);
    uint64_t v59 = v124;
    uint64_t v57 = v125;
    uint64_t v55 = v126;
    uint64_t v53 = v127;
    uint64_t v51 = v128;
    uint64_t v49 = v129;
    uint64_t v47 = v130;
    uint64_t v33 = v132;
    uint64_t v45 = v131;
    uint64_t v34 = v133;
    int v35 = v134;
    int v36 = v135;
    v37 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v139);
    *(_DWORD *)((char *)&v44 + 1) = v144;
    LOBYTE(v44) = v143;
    LOBYTE(v43) = v36 != 0;
    LOBYTE(v42) = v35 != 0;
    uint64_t v38 = -[CtrTriggerResult initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:](v77, "initWithData:num_thirdparty_BRs:num_thread_networks:max_simultaneous_prefixes:tx_total:tx_total_success:tx_success_perc:rx_total:rx_total_success:rx_success_perc:tx_delayavg:tx_delaymin:tx_delaymax:coex_tx_denied_reqs_perc:coex_rx_denied_reqs_perc:thirdparty_leader:last_known_device_role:is_partition_id_change_detected:leader_name:num_routers:thread_mesh_size:is_parent_change_detected:is_threaddaemon_crash_detected:is_threadfw_crash_detected:is_role_detach_disable_detected:is_border_router_advertised:num_border_routers_advertised:duration:", v74, v71, v68, v65, v62, v59, v57, v55, v53, v51, v49, v47, v45,
            v33,
            v34,
            v42,
            v83,
            v43,
            v86,
            v37,
            v90,
            v44,
            v145,
            v146);
  }
  else
  {
    uint64_t v38 = 0;
  }
  if (v38 | v26)
  {
    v40 = v80;
  }
  else
  {
    uint64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:@"Results are invalid" code:1 userInfo:0];

    v40 = (void *)v39;
  }
  v81 = v40;
  v79[2](v79, v26, v38);

  uint64_t v41 = -5600;
  do
  {
    if (*v12 < 0) {
      operator delete(*(void **)(v12 - 23));
    }
    if (*(v12 - 24) < 0) {
      operator delete(*(void **)(v12 - 47));
    }
    v12 -= 56;
    v41 += 56;
  }
  while (v41);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(&v123);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult((void **)((char *)&v95 + 4));
}

- (Result)updatePrimaryResident:(Result *__return_ptr)retstr isPrimaryResidentThreadCapable:primaryResidentInfo:
{
  int v4 = v2;
  int v5 = v1;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = v3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CtrClient updatePrimaryResident:isPrimaryResidentThreadCapable:primaryResidentInfo:]";
    __int16 v15 = 1024;
    int v16 = 491;
    _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  uint64_t v8 = *(void **)buf;
  int v9 = SHIBYTE(v18);
  if (v7) {
    uint64_t v10 = [v7 UTF8String];
  }
  else {
    uint64_t v10 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v15 = 1024;
    int v16 = v5;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "primaryInfo=%@,  isPrimaryResident=%d, isPrimaryResidentThreadCapable=%d\n", buf, 0x18u);
  }
  v12[0] = v5 != 0;
  v12[1] = v4 != 0;
  uint64_t v13 = v10;
  CtrXPC::Client::updatePrimaryResident((uint64_t)v12, (uint64_t)retstr);
  if (v9 < 0) {
    operator delete(v8);
  }

  return result;
}

- (void)threadStart:(id)a3 geoAvailable:(BOOL)a4 isPrimaryUser:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v49[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x6812000000;
  uint64_t v34 = __Block_byref_object_copy__0;
  int v35 = __Block_byref_object_dispose__0;
  int v36 = "";
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  char v39 = 0;
  uint64_t v40 = 0;
  int v41 = 0;
  char v42 = 1;
  uint64_t v43 = 0;
  if (v12)
  {
    v14 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = [v15 UTF8String];
      v32[10] = v16;
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      int v18 = v32;
      v32[7] = (uint64_t)v17;
      *((unsigned char *)v18 + 72) = v8;
      *((unsigned char *)v18 + 88) = v10;
      *((unsigned char *)v18 + 92) = v9;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v15;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "activeOperationalDataset : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v8;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "waitForSync flag : %d \n", buf, 8u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v10;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "geoAvailable flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v9;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "isPrimaryUser flag : %d\n", buf, 8u);
      }
      ptr = self->CtrXPCClientPtr.__ptr_;
      long long v20 = *((_OWORD *)v32 + 3);
      long long v21 = *((_OWORD *)v32 + 4);
      uint64_t v30 = v32[12];
      v29[0] = v20;
      v29[1] = v21;
      v29[2] = *((_OWORD *)v32 + 5);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke;
      v26[3] = &unk_2652EB228;
      uint64_t v28 = &v31;
      id v27 = v13;
      CtrXPC::Client::threadStartWithCompletion((uint64_t)ptr, (uint64_t)v29, (uint64_t)v26);
    }
    else
    {
      char v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      uint64_t v47 = @"activeOperationalDataset parameter is encoded incorrectly";
      int v25 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v15 = [v24 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v25];

      (*((void (**)(id, id))v13 + 2))(v13, v15);
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49[0] = @"activeOperationalDataset parameter is required";
    char v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    id v15 = [v22 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v23];

    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }

  _Block_object_dispose(&v31, 8);
}

void __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  if (*a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke_cold_1();
    }
    int v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    BOOL v8 = @"Error: threadstart failed !";
    int v5 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    uint64_t v6 = [v4 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v10 = "-[CtrClient threadStart:geoAvailable:isPrimaryUser:waitForSync:completion:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 544;
      _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s:%d: threadstart is successful !", buf, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
}

- (void)threadStart:(id)a3 activeOperationalDataSet:(id)a4 geoAvailable:(BOOL)a5 routerMode:(BOOL)a6 eMAC:(id)a7 waitForSync:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  BOOL v12 = a5;
  v61[1] = *MEMORY[0x263EF8340];
  unint64_t v14 = (unint64_t)a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x6812000000;
  uint64_t v46 = __Block_byref_object_copy__0;
  uint64_t v47 = __Block_byref_object_dispose__0;
  uint64_t v48 = "";
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  char v51 = 0;
  uint64_t v52 = 0;
  int v53 = 0;
  char v54 = 1;
  uint64_t v55 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__25;
  v41[4] = __Block_byref_object_dispose__26;
  unint64_t v18 = (unint64_t)v15;
  id v42 = (id)v18;
  if (v14 | v18)
  {
    if (v16 || !v11)
    {
      if (v14)
      {
        char v24 = [(id)v14 UUIDString];
        if (v24)
        {
          id v33 = v24;
          char v24 = (void *)[v33 UTF8String];
        }
        else
        {
          id v33 = 0;
        }
      }
      else
      {
        id v33 = 0;
        char v24 = 0;
      }
      v44[6] = (uint64_t)v24;
      xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
      uint64_t v26 = 0;
      id v27 = v44;
      v44[7] = (uint64_t)v25;
      *((unsigned char *)v27 + 72) = v9;
      *((unsigned char *)v27 + 88) = v12;
      *((unsigned char *)v27 + 90) = v11;
      id v28 = 0;
      if (v16 && v11)
      {
        id v28 = (id) [[NSString alloc] initWithData:v16 encoding:4];
        uint64_t v26 = [v28 UTF8String];
        id v27 = v44;
      }
      v27[12] = v26;
      if (v18)
      {
        id v21 = (id) [[NSString alloc] initWithData:v18 encoding:4];
        uint64_t v29 = [v21 UTF8String];
        id v27 = v44;
      }
      else
      {
        uint64_t v29 = 0;
        id v21 = 0;
      }
      v27[10] = v29;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v33;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "inUniqueId string : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v21;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "activeOperationalDataset : %@ \n", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v9;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "waitForSync flag : %d \n", buf, 8u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v12;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "geoAvailable flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v11;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "routerMode flag : %d\n", buf, 8u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v28;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "eMAC str : %@\n", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v16;
        _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "eMAC : %@\n", buf, 0xCu);
      }
      ptr = self->CtrXPCClientPtr.__ptr_;
      long long v31 = *((_OWORD *)v44 + 3);
      long long v32 = *((_OWORD *)v44 + 4);
      uint64_t v40 = v44[12];
      v39[0] = v31;
      v39[1] = v32;
      v39[2] = *((_OWORD *)v44 + 5);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke;
      v35[3] = &unk_2652EB250;
      uint64_t v37 = &v43;
      id v36 = v17;
      uint64_t v38 = v41;
      CtrXPC::Client::threadStartWithCompletion((uint64_t)ptr, (uint64_t)v39, (uint64_t)v35);
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v58 = *MEMORY[0x263F08320];
      uint64_t v59 = @"eMAC is required if router mode is on";
      long long v20 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v21 = [v19 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v20];

      (*((void (**)(id, void, id))v17 + 2))(v17, 0, v21);
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    v61[0] = @"inUniqueId or activeOperationalDataset parameter is required";
    char v23 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v21 = [v22 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v23];

    (*((void (**)(id, void, id))v17 + 2))(v17, 0, v21);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
}

void __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke(void *a1, _DWORD *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*a2)
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:0];
    xpc_release(*(xpc_object_t *)(*(void *)(a1[5] + 8) + 56));
    (*(void (**)(void))(a1[4] + 16))();

    return;
  }
  if (xpc_dictionary_get_string(*(xpc_object_t *)(*(void *)(a1[5] + 8) + 56), "PropVal"))
  {
    int v3 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(*(void *)(a1[5] + 8) + 56), "PropVal"));
    if (v3)
    {
      int v4 = (char *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
      if (v4)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          BOOL v8 = v4;
          __int16 v9 = 2112;
          BOOL v10 = v3;
          _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "Output UUID : %@, UUID-NSSTRING : %@ \n", buf, 0x16u);
        }
        xpc_release(*(xpc_object_t *)(*(void *)(a1[5] + 8) + 56));
        (*(void (**)(void))(a1[4] + 16))();

        return;
      }
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v8 = "-[CtrClient threadStart:activeOperationalDataSet:geoAvailable:routerMode:eMAC:waitForSync:completion:]_block_invoke";
      __int16 v9 = 1024;
      LODWORD(v10) = 640;
      _os_log_impl(&dword_24C792000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s:%d: Even after the success, output value is nil", buf, 0x12u);
    }
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    int v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.threadradiod.ctr" code:0 userInfo:0];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke_cold_1();
    }
  }
}

- (void)threadStopWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v17 = 0;
  *(void *)&v16[7] = 0;
  ptr = self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  char v10 = 0;
  long long v11 = *(unint64_t *)v16;
  char v12 = 1;
  __int16 v13 = 0;
  char v14 = 1;
  uint64_t v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CtrClient_threadStopWithCompletion___block_invoke;
  v7[3] = &unk_2652EB278;
  id v8 = v4;
  id v6 = v4;
  CtrXPC::Client::threadStopWithCompletion((uint64_t)ptr, (uint64_t)v9, (uint64_t)v7);
}

void __38__CtrClient_threadStopWithCompletion___block_invoke(uint64_t a1, _DWORD *a2)
{
  if (*a2)
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (void)provideExtendedMACAddress:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  *(_DWORD *)&v27[15] = 0;
  *(void *)&v27[7] = 0;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    id v9 = (id) [[NSString alloc] initWithData:v6 encoding:4];
    uint64_t v10 = [v9 UTF8String];
  }
  else
  {
    uint64_t v10 = 0;
    id v9 = 0;
  }
  ptr = self->CtrXPCClientPtr.__ptr_;
  v22[0] = 0;
  v22[1] = v8;
  v22[2] = 0;
  char v23 = 0;
  *(_OWORD *)char v24 = *(_OWORD *)v27;
  *(_DWORD *)&v24[15] = *(_DWORD *)&v27[15];
  char v25 = 1;
  uint64_t v26 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__CtrClient_provideExtendedMACAddress_completion___block_invoke;
  v13[3] = &unk_2652EB2A0;
  uint64_t v15 = 0;
  xpc_object_t v16 = v8;
  uint64_t v17 = 0;
  char v18 = 0;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v27;
  *(_DWORD *)&v19[15] = *(_DWORD *)&v27[15];
  char v20 = 1;
  uint64_t v21 = v10;
  id v12 = v7;
  id v14 = v12;
  CtrXPC::Client::provideExtendedMACAddress((uint64_t)ptr, (uint64_t)v22, (uint64_t)v13);
}

void __50__CtrClient_provideExtendedMACAddress_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  int v3 = *(void **)(a1 + 48);
  if (*a2)
  {
    string = xpc_dictionary_get_string(v3, "PropVal");
    if (string
      && ([NSString stringWithUTF8String:string],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          (id v6 = (void *)v5) != 0))
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08348];
      v13[0] = v5;
      xpc_object_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v9 = [v7 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v8];

      uint64_t v10 = v6;
    }
    else
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:0];
      id v9 = v10 = 0;
    }
    xpc_release(*(xpc_object_t *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    xpc_release(v3);
    long long v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v11();
  }
}

- (void)startPairingForExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  *(_DWORD *)&v31[14] = 0;
  *(void *)&v31[7] = 0;
  if (v8 || !v6)
  {
    if (v8)
    {
      __int16 v13 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      if (!v13)
      {
        xpc_object_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        uint64_t v28 = @"failed to interpret eMACAddress";
        uint64_t v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v12 = [v16 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v17];

        v9[2](v9, v12);
        goto LABEL_10;
      }
      id v12 = v13;
      uint64_t v14 = [v12 UTF8String];
    }
    else
    {
      uint64_t v14 = 0;
      id v12 = 0;
    }
    ptr = self->CtrXPCClientPtr.__ptr_;
    v20[0] = 0;
    v20[2] = 0;
    char v21 = 0;
    long long v22 = *(_OWORD *)v31;
    __int16 v23 = *(_WORD *)&v31[16];
    BOOL v24 = v6;
    char v25 = 1;
    uint64_t v26 = v14;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__CtrClient_startPairingForExtendedMACAddress_isWedDevice_completion___block_invoke;
    v18[3] = &unk_2652EB278;
    uint64_t v19 = v9;
    CtrXPC::Client::startPairing((uint64_t)ptr, (uint64_t)v20, (uint64_t)v18);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    uint64_t v30 = @"eMACAddress is required if it is wed device";
    long long v11 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v12 = [v10 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v11];

    v9[2](v9, v12);
  }
LABEL_10:
}

void __70__CtrClient_startPairingForExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (*a2)
  {
    int v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"Failed to start pairing";
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    BOOL v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (void)stopPairing:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v15 = 0;
  *(void *)&v14[7] = 0;
  ptr = self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  char v10 = 0;
  *(_DWORD *)&v11[15] = 0;
  *(_OWORD *)long long v11 = *(unint64_t *)v14;
  char v12 = 1;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__CtrClient_stopPairing___block_invoke;
  v7[3] = &unk_2652EB278;
  id v8 = v4;
  id v6 = v4;
  CtrXPC::Client::stopPairing((uint64_t)ptr, (uint64_t)v9, (uint64_t)v7);
}

void __25__CtrClient_stopPairing___block_invoke(uint64_t a1, _DWORD *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (*a2)
  {
    int v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"Failed to stop pairing";
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (void)startFWUpdate:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  *(_DWORD *)&v31[14] = 0;
  *(void *)&v31[7] = 0;
  if (v8 || !v6)
  {
    if (v8)
    {
      uint64_t v13 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      if (!v13)
      {
        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        uint64_t v28 = @"failed to interpret eMACAddress";
        uint64_t v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v12 = [v16 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v17];

        v9[2](v9, v12);
        goto LABEL_10;
      }
      id v12 = v13;
      uint64_t v14 = [v12 UTF8String];
    }
    else
    {
      uint64_t v14 = 0;
      id v12 = 0;
    }
    ptr = self->CtrXPCClientPtr.__ptr_;
    v20[0] = 0;
    v20[2] = 0;
    char v21 = 0;
    long long v22 = *(_OWORD *)v31;
    __int16 v23 = *(_WORD *)&v31[16];
    BOOL v24 = v6;
    char v25 = 1;
    uint64_t v26 = v14;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__CtrClient_startFWUpdate_isWedDevice_completion___block_invoke;
    v18[3] = &unk_2652EB278;
    uint64_t v19 = v9;
    CtrXPC::Client::startFWUpdate((uint64_t)ptr, (uint64_t)v20, (uint64_t)v18);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    uint64_t v30 = @"eMACAddress is required if it is wed device";
    long long v11 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v12 = [v10 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v11];

    v9[2](v9, v12);
  }
LABEL_10:
}

void __50__CtrClient_startFWUpdate_isWedDevice_completion___block_invoke(uint64_t a1, _DWORD *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (*a2)
  {
    int v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"Failed to start FW Update";
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    BOOL v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (void)stopFWUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v15 = 0;
  *(void *)&v14[7] = 0;
  ptr = self->CtrXPCClientPtr.__ptr_;
  v9[0] = 0;
  v9[2] = 0;
  char v10 = 0;
  *(_DWORD *)&v11[15] = 0;
  *(_OWORD *)long long v11 = *(unint64_t *)v14;
  char v12 = 1;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__CtrClient_stopFWUpdate___block_invoke;
  v7[3] = &unk_2652EB278;
  id v8 = v4;
  id v6 = v4;
  CtrXPC::Client::stopFWUpdate((uint64_t)ptr, (uint64_t)v9, (uint64_t)v7);
}

void __26__CtrClient_stopFWUpdate___block_invoke(uint64_t a1, _DWORD *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (*a2)
  {
    int v3 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F08320];
    v8[0] = @"Failed to stop FW Update";
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v5 = [v3 errorWithDomain:@"com.threadradiod.ctr" code:1 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)init:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24C792000, &_os_log_internal, v0, "%s:%d: Thread radio is not supported on this device.", v1, v2, v3, v4, v5);
}

void __75__CtrClient_threadStart_geoAvailable_isPrimaryUser_waitForSync_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24C792000, &_os_log_internal, v0, "%s:%d: threadstart failed !", v1, v2, v3, v4, v5);
}

void __102__CtrClient_threadStart_activeOperationalDataSet_geoAvailable_routerMode_eMAC_waitForSync_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24C792000, &_os_log_internal, v0, "%s:%d: Even after the success, output value is nil, returning error", v1, v2, v3, v4, v5);
}

@end