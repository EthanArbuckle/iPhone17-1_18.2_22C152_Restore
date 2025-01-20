@interface ThreadDiagnosticsManagerInstance
- (BOOL)generateThreadDiagnosticsMonitorLogs;
- (BOOL)shouldRunDiagnostics;
- (BOOL)updateNCPProperties;
- (CtrInternalClient)CtrInternalClientPtr;
- (OS_dispatch_queue)fQueue;
- (OS_dispatch_queue)sendQueue;
- (OS_dispatch_source)tdm_timer;
- (basic_string<char,)getMLAddress;
- (basic_string<char,)getMLPrefix;
- (basic_string<char,)getNwName;
- (dict)threadDiagnosticsManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (id)init:(id)a3;
- (int)getNCPState;
- (unint64_t)getXPanId;
- (unsigned)getChannel;
- (unsigned)getLeaderRouterID;
- (unsigned)getPanId;
- (unsigned)getPartitionId;
- (void)createDriverInterface:(id)a3;
- (void)getChannel;
- (void)getLeaderRouterID;
- (void)getMLAddress;
- (void)getMLPrefix;
- (void)getNwName;
- (void)getPanId;
- (void)getPartitionId;
- (void)getXPanId;
- (void)handlePeriodicTimer;
- (void)send_nwdiagnostics_get_req;
- (void)setCtrInternalClientPtr:(id)a3;
- (void)setFQueue:(id)a3;
- (void)setSendQueue:(id)a3;
- (void)setTdm_timer:(id)a3;
- (void)setupCleanupTimer;
- (void)startThreadDiagnosticsTimer;
- (void)updateNCPProperties;
@end

@implementation ThreadDiagnosticsManagerInstance

- (BOOL)generateThreadDiagnosticsMonitorLogs
{
  unsigned int v3 = *(_DWORD *)(NetworkDiagnosticsManager::getInstance((NetworkDiagnosticsManager *)self) + 40);
  dispatch_suspend((dispatch_object_t)self->_tdm_timer);
  dispatch_time_t v4 = dispatch_time(0, 0);
  dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v4, 1000000000 * v3, 0);
  dispatch_resume((dispatch_object_t)self->_tdm_timer);
  v5 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TDM: generateThreadDiagnosticsMonitorLogs sysdiagnose triggered thread diagnostics monitor curPeriodicity=%d", (uint8_t *)v7, 8u);
  }

  return 1;
}

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ThreadDiagnosticsManagerInstance;
  v6 = [(ThreadDiagnosticsManagerInstance *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fQueue, a3);
    [(ThreadDiagnosticsManagerInstance *)v7 createDriverInterface:v5];
  }

  return v7;
}

- (BOOL)shouldRunDiagnostics
{
  uint64_t v19 = 0;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "isPrimaryResident");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v19];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v18 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    v8 = log_get_logging_obg("com.apple.wpantund.nm", "default");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ThreadDiagnosticsManagerInstance shouldRunDiagnostics]";
    objc_super v9 = "%s : TDM Failed to get the isPrimaryResident Property";
    v10 = v8;
    uint32_t v11 = 12;
    goto LABEL_22;
  }
  if (any_to_BOOL((const boost::any *)&v19))
  {
    v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    objc_super v9 = " TDM Current device isPrimaryResident, skip running periodic TDM";
LABEL_14:
    v10 = v8;
    uint32_t v11 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    goto LABEL_23;
  }
  v12 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v15, "tdm:periodicdiag:enable");
  if (v12)
  {
    [(CtrInternalClient *)v12 getProperty:v15 output:&v19];
    LODWORD(v12) = *(_DWORD *)buf;
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  memset(buf, 0, 32);
  if (v7 < 0) {
LABEL_17:
  }
    operator delete(v6);
LABEL_18:
  v6 = *(void **)&buf[8];
  LOBYTE(v7) = buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (v12) {
      goto LABEL_20;
    }
  }
  else if (v12)
  {
LABEL_20:
    v8 = log_get_logging_obg("com.apple.wpantund.nm", "default");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ThreadDiagnosticsManagerInstance shouldRunDiagnostics]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "tdm:periodicdiag:enable";
    objc_super v9 = "%s : TDM Failed to get the property %s";
    v10 = v8;
    uint32_t v11 = 22;
    goto LABEL_22;
  }
  if (!any_to_BOOL((const boost::any *)&v19))
  {
    v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      BOOL v13 = 0;
      if ((v7 & 0x80) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    objc_super v9 = " TDM Periodic diagnostics on this device disabled due to extended address logic";
    goto LABEL_14;
  }
  BOOL v13 = 1;
  if ((v7 & 0x80) != 0) {
LABEL_24:
  }
    operator delete(v6);
LABEL_25:
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  return v13;
}

- (dict)threadDiagnosticsManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v5 = v3;
  v8 = v4;
  objc_super v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    var0 = a3;
    if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v113 = var0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Message received from client %s", buf, 0xCu);
  }

  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v12 = v11;
  if (!v11) {
    xpc_object_t v12 = xpc_null_create();
  }

  id v13 = v12;
  v14 = v13;
  id *v8 = v13;
  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v15 = xpc_null_create();
    id v16 = *v8;
    id *v8 = v15;
  }
  v17 = xpc::object::operator*(v5);
  string = (char *)xpc_dictionary_get_string(v17, "method");
  std::string::basic_string[abi:ne180100]<0>(&v111, string);

  uint64_t v19 = xpc::object::operator*(v5);
  v20 = (char *)xpc_dictionary_get_string(v19, "property_name");
  std::string::basic_string[abi:ne180100]<0>(__p, v20);

  if (!std::string::compare(&v111, "ConfigureThreadDiagnosticsManager"))
  {
    v24 = xpc::object::operator*(v5);
    BOOL v25 = xpc_dictionary_get_BOOL(v24, "readcurrentConfig");

    if (v25)
    {
      v26 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Read current configuration from DB", buf, 2u);
      }

      uint64_t Instance = NetworkDiagnosticsManager::getInstance(v27);
      unsigned __int8 v29 = atomic_load((unsigned __int8 *)(Instance + 11736));
      if (v29)
      {
        v84 = xpc::object::operator*(v8);
        xpc_dictionary_set_BOOL(v84, "expandEdges", *(unsigned char *)(Instance + 11737));

        v85 = xpc::object::operator*(v8);
        xpc_dictionary_set_BOOL(v85, "processDns", *(unsigned char *)(Instance + 11738));

        v86 = xpc::object::operator*(v8);
        xpc_dictionary_set_BOOL(v86, "enhancedTlvReq", *(unsigned char *)(Instance + 11739));

        v87 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v87, "sendToChildren", *(unsigned int *)(Instance + 11740));

        v88 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v88, "routerRspTimeout", *(unsigned int *)(Instance + 11744));

        v89 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v89, "childRspTimeout", *(unsigned int *)(Instance + 11748));

        v90 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v90, "periodicity", *(unsigned int *)(Instance + 11760));

        v91 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v91, "browseTimeout", *(unsigned int *)(Instance + 11752));

        v46 = xpc::object::operator*(v8);
        xpc_dictionary_set_uint64(v46, "resolveTimeout", *(unsigned int *)(Instance + 11756));
      }
      else
      {
        xpc::object::operator*(v8);
        v30 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = NetworkDiagnosticsManager::getInstance(v30);
        xpc_dictionary_set_BOOL(v30, "expandEdges", *(unsigned char *)(v31 + 48));

        xpc::object::operator*(v8);
        v32 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = NetworkDiagnosticsManager::getInstance(v32);
        xpc_dictionary_set_BOOL(v32, "processDns", *(unsigned char *)(v33 + 49));

        xpc::object::operator*(v8);
        v34 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = NetworkDiagnosticsManager::getInstance(v34);
        xpc_dictionary_set_BOOL(v34, "enhancedTlvReq", *(unsigned char *)(v35 + 50));

        xpc::object::operator*(v8);
        v36 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = NetworkDiagnosticsManager::getInstance(v36);
        xpc_dictionary_set_uint64(v36, "sendToChildren", *(unsigned int *)(v37 + 44));

        xpc::object::operator*(v8);
        v38 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = NetworkDiagnosticsManager::getInstance(v38);
        xpc_dictionary_set_uint64(v38, "routerRspTimeout", *(unsigned int *)(v39 + 32));

        xpc::object::operator*(v8);
        v40 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = NetworkDiagnosticsManager::getInstance(v40);
        xpc_dictionary_set_uint64(v40, "childRspTimeout", *(unsigned int *)(v41 + 36));

        xpc::object::operator*(v8);
        v42 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v43 = NetworkDiagnosticsManager::getInstance(v42);
        xpc_dictionary_set_uint64(v42, "periodicity", *(unsigned int *)(v43 + 40));

        xpc::object::operator*(v8);
        v44 = (NetworkDiagnosticsManager *)objc_claimAutoreleasedReturnValue();
        uint64_t v45 = NetworkDiagnosticsManager::getInstance(v44);
        xpc_dictionary_set_uint64(v44, "browseTimeout", *(unsigned int *)(v45 + 24));

        v46 = xpc::object::operator*(v8);
        uint64_t v47 = NetworkDiagnosticsManager::getInstance((NetworkDiagnosticsManager *)v46);
        xpc_dictionary_set_uint64(v46, "resolveTimeout", *(unsigned int *)(v47 + 28));
      }

      goto LABEL_31;
    }
    v59 = xpc::object::operator*(v5);
    char v105 = xpc_dictionary_get_BOOL(v59, "expandEdges");

    v60 = xpc::object::operator*(v5);
    BOOL v107 = xpc_dictionary_get_BOOL(v60, "processDns");

    v61 = xpc::object::operator*(v5);
    BOOL v106 = xpc_dictionary_get_BOOL(v61, "enhancedTlvReq");

    v62 = xpc::object::operator*(v5);
    BOOL v63 = xpc_dictionary_get_BOOL(v62, "oneshotmode");

    v64 = xpc::object::operator*(v5);
    int uint64 = xpc_dictionary_get_uint64(v64, "sendToChildren");

    v66 = xpc::object::operator*(v5);
    int v67 = xpc_dictionary_get_uint64(v66, "routerRspTimeout");

    v68 = xpc::object::operator*(v5);
    int v69 = xpc_dictionary_get_uint64(v68, "childRspTimeout");

    v70 = xpc::object::operator*(v5);
    int v71 = xpc_dictionary_get_uint64(v70, "browseTimeout");

    v72 = xpc::object::operator*(v5);
    unsigned int v73 = xpc_dictionary_get_uint64(v72, "resolveTimeout");

    v74 = xpc::object::operator*(v5);
    unsigned int v75 = xpc_dictionary_get_uint64(v74, "periodicity");

    v77 = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v76);
    NetworkDiagnosticsManager::updatePendingConfig(v77, v105, v107, v106, uint64, v67, v69, v71, v73, v75);
    v78 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136317698;
      *(void *)v113 = "-[ThreadDiagnosticsManagerInstance threadDiagnosticsManagerInstance_MsgHandler:message:]";
      *(_WORD *)&v113[8] = 1024;
      BOOL v114 = v63;
      __int16 v115 = 1024;
      BOOL v116 = v107;
      __int16 v117 = 1024;
      BOOL v118 = v106;
      __int16 v119 = 1024;
      BOOL v120 = v63;
      __int16 v121 = 1024;
      int v122 = uint64;
      __int16 v123 = 1024;
      int v124 = v67;
      __int16 v125 = 1024;
      int v126 = v69;
      __int16 v127 = 1024;
      int v128 = v71;
      __int16 v129 = 1024;
      unsigned int v130 = v73;
      __int16 v131 = 1024;
      unsigned int v132 = v75;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s oneshotmodeflag=%d processDnsFlag=%d enhancedTlvReq=%d oneshotmodeFlag=%d sendToChildren=%d routerRspTimeoutInSecs=%d childRspTimeoutInSecs=%d browseTimeoutInSecs=%d resolveTimeoutInSecs=%d periodicityInSecs=%d : updated ThreadDiagnosticsManager pending configuration ", buf, 0x48u);
    }

    uint64_t v80 = NetworkDiagnosticsManager::getInstance(v79);
    if (v63)
    {
      dispatch_suspend((dispatch_object_t)self->_tdm_timer);
      *(_DWORD *)(NetworkDiagnosticsManager::getInstance(v81) + 40) = 0;
      v82 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "TDM: Oneshotmode stop the timer", buf, 2u);
      }

      fQueue = self->_fQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __88__ThreadDiagnosticsManagerInstance_threadDiagnosticsManagerInstance_MsgHandler_message___block_invoke;
      block[3] = &unk_10049C010;
      block[4] = self;
      dispatch_async(fQueue, block);
      goto LABEL_31;
    }
    int v100 = *(_DWORD *)(v80 + 40);
    if (v75)
    {
      if (!v100)
      {
        v103 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v113 = v75;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "TDM: Resume TDM timer. start diagnostics again periodicityInSecs=%d", buf, 8u);
        }

        dispatch_time_t v104 = dispatch_time(0, 0);
        dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v104, 1000000000 * v75, 0);
        dispatch_resume((dispatch_object_t)self->_tdm_timer);
        goto LABEL_31;
      }
      if (v100 != v75)
      {
        dispatch_suspend((dispatch_object_t)self->_tdm_timer);
        dispatch_time_t v101 = dispatch_time(0, 0);
        dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v101, 1000000000 * v75, 0);
        dispatch_resume((dispatch_object_t)self->_tdm_timer);
        v58 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v100;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v75;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "TDM: Periodicity changed. Suspend and Resume TDM timer with new periodicity curPeriodicity=%d periodicityInSecs=%d", buf, 0xEu);
        }
        goto LABEL_52;
      }
    }
    else if (v100)
    {
      dispatch_suspend((dispatch_object_t)self->_tdm_timer);
      *(_DWORD *)(NetworkDiagnosticsManager::getInstance(v102) + 40) = 0;
      v58 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "TDM: Stop the timer as requested by client. periodicityInSecs=%d", buf, 8u);
      }
      goto LABEL_52;
    }
LABEL_31:
    int64_t v23 = 0;
    goto LABEL_32;
  }
  v21 = (NetworkDiagnosticsManager *)std::string::compare(&v111, "GenerateDiagnostics");
  if (!v21)
  {
    unsigned int v48 = *(_DWORD *)(NetworkDiagnosticsManager::getInstance(v21) + 40);
    dispatch_suspend((dispatch_object_t)self->_tdm_timer);
    uint64_t v50 = NetworkDiagnosticsManager::getInstance(v49);
    v51 = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance((NetworkDiagnosticsManager *)v50);
    int v52 = *((_DWORD *)v51 + 11);
    v53 = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v51);
    char v54 = *((unsigned char *)v53 + 49);
    *(unsigned char *)(v50 + 6736) = 1;
    *(unsigned char *)(v50 + 6744) = v54;
    *(_DWORD *)(v50 + 6740) = v52;
    v55 = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v53);
    v56 = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v55);
    *((_DWORD *)v56 + 11) = 0;
    *(unsigned char *)(NetworkDiagnosticsManager::getInstance(v56) + 49) = 0;
    dispatch_time_t v57 = dispatch_time(0, 0);
    dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v57, 1000000000 * v48, 0);
    dispatch_resume((dispatch_object_t)self->_tdm_timer);
    v58 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v113 = v48;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "TDM: sysdiagnose triggered thread diagnostics monitor curPeriodicity=%d", buf, 8u);
    }
LABEL_52:

    goto LABEL_31;
  }
  v22 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[ThreadDiagnosticsManagerInstance threadDiagnosticsManagerInstance_MsgHandler:message:]((uint64_t *)&a3->var0.var0.var0.var1, (uint64_t *)&v111, v22);
  }

  int64_t v23 = 1;
LABEL_32:
  v92 = xpc::object::operator*(v8);
  v93 = v92;
  if ((v111.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v94 = &v111;
  }
  else {
    v94 = (std::string *)v111.__r_.__value_.__r.__words[0];
  }
  xpc_dictionary_set_string(v92, "method", (const char *)v94);

  v95 = xpc::object::operator*(v8);
  v96 = v95;
  if (v110 >= 0) {
    v97 = __p;
  }
  else {
    v97 = (void **)__p[0];
  }
  xpc_dictionary_set_string(v95, "property_name", (const char *)v97);

  v98 = xpc::object::operator*(v8);
  xpc_dictionary_set_int64(v98, "ret", v23);

  if (v110 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v111.__r_.__value_.__l.__data_);
  }
  return v99;
}

id __88__ThreadDiagnosticsManagerInstance_threadDiagnosticsManagerInstance_MsgHandler_message___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePeriodicTimer];
}

- (void)createDriverInterface:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TDM.SendQueue", v5);
  sendQueue = self->_sendQueue;
  self->_sendQueue = v6;

  if (!self->_sendQueue)
  {
    xpc_object_t v12 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ThreadDiagnosticsManagerInstance createDriverInterface:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    __assert_rtn("-[ThreadDiagnosticsManagerInstance createDriverInterface:]", "ThreadDiagnosticsManagerInstance.mm", 314, "false");
  }
  v8 = [[CtrInternalClient alloc] init:"TDM-Internal"];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  self->_CtrInternalClientPtr = v8;

  v10 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:networkdiagnosticsrsp");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __58__ThreadDiagnosticsManagerInstance_createDriverInterface___block_invoke;
  v21[3] = &unk_10049C5F0;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v20 = self->_fQueue;
  [(CtrInternalClient *)v10 setEventHandler:__p InternalClientEventBlock:v21 dqueue:&v20];
  xpc_object_t v11 = v20;
  v20 = 0;

  if (v24 < 0) {
    operator delete(__p[0]);
  }
  [(ThreadDiagnosticsManagerInstance *)self startThreadDiagnosticsTimer];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __58__ThreadDiagnosticsManagerInstance_createDriverInterface___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "vendor:networkdiagnosticsrsp";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s TDM-Internal got TDM_NwDiagnostics_RspEvent\n", buf, 0xCu);
  }

  v6 = (NetworkDiagnosticsManager *)boost::any_cast<nl::Data>(a2);
  uint64_t Instance = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v6);
  uint64_t v8 = *((void *)v6 + 1);
  if (*(void *)v6 == v8) {
    objc_super v9 = 0;
  }
  else {
    objc_super v9 = *(unsigned __int8 **)v6;
  }
  NetworkDiagnosticsManager::handle_networkdiagnostics_response(Instance, v9, (unsigned __int16)(v8 - *(void *)v6));
  v10 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__ThreadDiagnosticsManagerInstance_createDriverInterface___block_invoke_29;
  block[3] = &unk_10049C010;
  id v13 = WeakRetained;
  id v11 = WeakRetained;
  dispatch_async(v10, block);
}

id __58__ThreadDiagnosticsManagerInstance_createDriverInterface___block_invoke_29(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Async call to send_nwdiagnostics_get_req", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "send_nwdiagnostics_get_req");
}

- (int)getNCPState
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = SBYTE7(v22);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v16 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:State");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v16];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  *(_OWORD *)buf = 0u;
  long long v22 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v22);
  HIBYTE(v22) = 0;
  buf[8] = 0;
  if (v15 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getNCPState]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM Failed to get the NCP State Property", buf, 0xCu);
    }

    int v9 = 0;
    goto LABEL_23;
  }
  any_to_string((const boost::any *)&v16, (uint64_t)buf);
  if ((SBYTE7(v22) & 0x80u) == 0) {
    v10 = (char *)buf;
  }
  else {
    v10 = *(char **)buf;
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)&v17[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s : TDM NCP State Property", v17, 0xCu);
  }

  std::string::basic_string[abi:ne180100]<0>(v17, v10);
  int v9 = nl::wpantund::string_to_ncp_state(v17);
  if (v20 < 0) {
    operator delete(*(void **)v17);
  }
  xpc_object_t v12 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)&v17[4] = v10;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "TDM read NCP state as: %s, %d \n", v17, 0x12u);
  }

  if (SBYTE7(v22) < 0) {
    operator delete(*(void **)buf);
  }
LABEL_23:
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v9;
}

- (basic_string<char,)getMLPrefix
{
  uint64_t v2 = v1;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = (char)buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  v21 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "IPv6:MeshLocalPrefix");
  if (v6)
  {
    [v6 getProperty:__p output:&v21];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v20 < 0)
  {
    operator delete(__p[0]);
    if (v6)
    {
LABEL_6:
      int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ThreadDiagnosticsManagerInstance *)v9 getMLPrefix];
      }
      goto LABEL_16;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  any_to_string((const boost::any *)&v21, (uint64_t)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (*((char *)&retstr->var0.var0.var0.var1 + 23) >= 0) {
      var0 = retstr;
    }
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getMLPrefix]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP MLPrefix=%s", buf, 0x16u);
  }
LABEL_16:

  result = v21;
  if (v21) {
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)(*((uint64_t (**)(basic_string<char, std::char_traits<char>, std::allocator<char>> *))v21->var0.var0.var0.var1.var0
  }
                                                                                  + 1))(v21);
  if (v8 < 0) {
    operator delete(v7);
  }
  return result;
}

- (basic_string<char,)getMLAddress
{
  uint64_t v2 = v1;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = (char)buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  v21 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "IPv6:MeshLocalAddress");
  if (v6)
  {
    [v6 getProperty:__p output:&v21];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v20 < 0)
  {
    operator delete(__p[0]);
    if (v6)
    {
LABEL_6:
      int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ThreadDiagnosticsManagerInstance *)v9 getMLAddress];
      }
      goto LABEL_16;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  any_to_string((const boost::any *)&v21, (uint64_t)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (*((char *)&retstr->var0.var0.var0.var1 + 23) >= 0) {
      var0 = retstr;
    }
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getMLAddress]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP MLAddress=%s", buf, 0x16u);
  }
LABEL_16:

  result = v21;
  if (v21) {
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)(*((uint64_t (**)(basic_string<char, std::char_traits<char>, std::allocator<char>> *))v21->var0.var0.var0.var1.var0
  }
                                                                                  + 1))(v21);
  if (v8 < 0) {
    operator delete(v7);
  }
  return result;
}

- (basic_string<char,)getNwName
{
  uint64_t v2 = v1;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = (char)buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0;
  retstr->var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  v21 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:Name");
  if (v6)
  {
    [v6 getProperty:__p output:&v21];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v20 < 0)
  {
    operator delete(__p[0]);
    if (v6)
    {
LABEL_6:
      int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ThreadDiagnosticsManagerInstance *)v9 getNwName];
      }
      goto LABEL_16;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  any_to_string((const boost::any *)&v21, (uint64_t)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  int v9 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (*((char *)&retstr->var0.var0.var0.var1 + 23) >= 0) {
      var0 = retstr;
    }
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getNwName]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP NwName=%s", buf, 0x16u);
  }
LABEL_16:

  result = v21;
  if (v21) {
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)(*((uint64_t (**)(basic_string<char, std::char_traits<char>, std::allocator<char>> *))v21->var0.var0.var0.var1.var0
  }
                                                                                  + 1))(v21);
  if (v8 < 0) {
    operator delete(v7);
  }
  return result;
}

- (unsigned)getLeaderRouterID
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:Leader:RouterID");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v20];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 getLeaderRouterID];
    }
    unsigned __int16 v16 = 255;
    goto LABEL_14;
  }
  unsigned __int16 v16 = any_to_int((const boost::any *)&v20);
  int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getLeaderRouterID]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM NCP Leader Router ID=%d", buf, 0x12u);
  }
LABEL_14:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v16;
}

- (unsigned)getChannel
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:Channel");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v20];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 getChannel];
    }
    unsigned __int16 v16 = 255;
    goto LABEL_14;
  }
  unsigned __int16 v16 = any_to_int((const boost::any *)&v20);
  int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getChannel]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM NCP Channel=%d", buf, 0x12u);
  }
LABEL_14:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v16;
}

- (unsigned)getPartitionId
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:PartitionId");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v20];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 getPartitionId];
    }
    unsigned int v16 = 255;
    goto LABEL_14;
  }
  unsigned int v16 = any_to_int((const boost::any *)&v20);
  int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getPartitionId]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM NCP PartitionId=%d", buf, 0x12u);
  }
LABEL_14:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v16;
}

- (unsigned)getPanId
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:PANID");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v20];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 getPanId];
    }
    unsigned __int16 v16 = 255;
    goto LABEL_14;
  }
  unsigned __int16 v16 = any_to_int((const boost::any *)&v20);
  int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getPanId]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM NCP Channel=%d", buf, 0x12u);
  }
LABEL_14:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v16;
}

- (unint64_t)getXPanId
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:XPANID");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v20];
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if (CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }
  else if (CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 getXPanId];
    }
    unint64_t v16 = 255;
    goto LABEL_14;
  }
  unint64_t v16 = any_to_uint64((const boost::any *)&v20, 0);
  int v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getXPanId]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : TDM NCP XPanId=%llu", buf, 0x16u);
  }
LABEL_14:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v16;
}

- (void)send_nwdiagnostics_get_req
{
  uint64_t Instance = NetworkDiagnosticsManager::getInstance((NetworkDiagnosticsManager *)self);
  int v4 = *(unsigned __int8 *)(Instance + 11728);
  uint64_t v5 = *(void *)(Instance + 11712);
  uint64_t v6 = *(void *)(Instance + 11704);
  inited = (NetworkDiagnosticsManager *)objc_initWeak(&location, self);
  if (v4)
  {
    id v8 = objc_loadWeakRetained(&location);
    if (v8)
    {
      unint64_t v9 = 0x8E38E38E38E38E39 * ((v5 - v6) >> 2);
      uint64_t v10 = 954437177 * ((v5 - v6) >> 2);
      if (954437177 * ((v5 - v6) >> 2))
      {
        uint64_t v11 = 0;
        uint64_t v12 = 36 * (v9 - 1);
        uint64_t v13 = 36 * v10;
        do
        {
          uint64_t v14 = (long long *)(*(void *)(Instance + 11704) + v11);
          long long v15 = v14[1];
          long long v22 = *v14;
          long long v23 = v15;
          int v24 = *((_DWORD *)v14 + 8);
          unint64_t v16 = [v8 CtrInternalClientPtr];
          v20[0] = v22;
          v20[1] = v23;
          int v21 = v24;
          objc_msgSend(v16, "send_diagnostics_req:", v20);
          if (v18 < 0) {
            operator delete(__p);
          }

          if (v12 != v11) {
            usleep(0x186A0u);
          }
          v11 += 36;
        }
        while (v13 != v11);
      }
    }
  }
  *(unsigned char *)(NetworkDiagnosticsManager::getInstance(inited) + 11728) = 0;
  objc_destroyWeak(&location);
}

- (BOOL)updateNCPProperties
{
  [(ThreadDiagnosticsManagerInstance *)self getMLPrefix];
  std::string::size_type size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v40.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    [(ThreadDiagnosticsManagerInstance *)self getMLAddress];
    std::string::size_type v4 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v4 = v39.__r_.__value_.__l.__size_;
    }
    BOOL v5 = v4 != 0;
    if (v4)
    {
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      {
        int v7 = (std::string *)v40.__r_.__value_.__r.__words[0];
        uint64_t v6 = --v40.__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t v6 = HIBYTE(v40.__r_.__value_.__r.__words[2]) - 1;
        *((unsigned char *)&v40.__r_.__value_.__s + 23) = v6 & 0x7F;
        int v7 = &v40;
      }
      v7->__r_.__value_.__s.__data_[v6] = 0;
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      {
        BOOL v25 = (std::string *)v40.__r_.__value_.__r.__words[0];
        uint64_t v24 = --v40.__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t v24 = HIBYTE(v40.__r_.__value_.__r.__words[2]) - 1;
        *((unsigned char *)&v40.__r_.__value_.__s + 23) = v24 & 0x7F;
        BOOL v25 = &v40;
      }
      v25->__r_.__value_.__s.__data_[v24] = 0;
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
      {
        v27 = (std::string *)v40.__r_.__value_.__r.__words[0];
        uint64_t v26 = --v40.__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t v26 = HIBYTE(v40.__r_.__value_.__r.__words[2]) - 1;
        *((unsigned char *)&v40.__r_.__value_.__s + 23) = v26 & 0x7F;
        v27 = &v40;
      }
      v27->__r_.__value_.__s.__data_[v26] = 0;
      __int16 v28 = [(ThreadDiagnosticsManagerInstance *)self getPanId];
      [(ThreadDiagnosticsManagerInstance *)self getNwName];
      int v29 = [(ThreadDiagnosticsManagerInstance *)self getPartitionId];
      __int16 v30 = [(ThreadDiagnosticsManagerInstance *)self getChannel];
      __int16 v31 = [(ThreadDiagnosticsManagerInstance *)self getLeaderRouterID];
      v32 = [(ThreadDiagnosticsManagerInstance *)self getXPanId];
      uint64_t Instance = NetworkDiagnosticsManager::getInstance(v32);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v37, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
      }
      else {
        std::string v37 = v40;
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v36, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
      }
      else {
        std::string v36 = v39;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v35, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v35 = __p;
      }
      NetworkDiagnosticsManager::updateNCPProperties(Instance, (uint64_t)&v37, (uint64_t)&v36, (uint64_t)&v35, v28, (uint64_t)v32, v30, v31, v29);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v35.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v37.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      unint64_t v16 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(ThreadDiagnosticsManagerInstance *)v16 updateNCPProperties];
      }
    }
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadDiagnosticsManagerInstance *)v8 updateNCPProperties];
    }

    BOOL v5 = 0;
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  return v5;
}

- (void)setupCleanupTimer
{
  int v3 = *(unsigned __int8 *)(NetworkDiagnosticsManager::getInstance((NetworkDiagnosticsManager *)self) + 6736);
  std::string::size_type v4 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    int64_t v6 = 12000000000;
    if (v5)
    {
      int v9 = 67109120;
      int v10 = 12;
      int v7 = "Setup cleanup timer after %d s for sysdiag trigger";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    int64_t v6 = 120000000000;
    if (v5)
    {
      int v9 = 67109120;
      int v10 = 120;
      int v7 = "Setup cleanup timer after %d s";
      goto LABEL_6;
    }
  }

  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_after(v8, (dispatch_queue_t)self->_fQueue, &__block_literal_global_14);
}

void __53__ThreadDiagnosticsManagerInstance_setupCleanupTimer__block_invoke(id a1)
{
  uint64_t v1 = log_get_logging_obg("com.apple.wpantund.tdm", "default");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    BOOL v5 = "-[ThreadDiagnosticsManagerInstance setupCleanupTimer]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 914;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s:%d Cleanup Timer Fired !!! ", (uint8_t *)&v4, 0x12u);
  }

  uint64_t Instance = (NetworkDiagnosticsManager *)NetworkDiagnosticsManager::getInstance(v2);
  NetworkDiagnosticsManager::cleanupForNextIteration(Instance);
}

- (void)handlePeriodicTimer
{
}

- (void)startThreadDiagnosticsTimer
{
  int v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_fQueue);
  tdm_timer = self->_tdm_timer;
  self->_tdm_timer = v3;

  int v5 = rand() % 300;
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * (v5 + 300));
  int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v12 = 300;
    __int16 v13 = 1024;
    int v14 = (unsigned __int16)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TDM: startThreadDiagnosticsTimer period:%d, rand_offset(%d)", buf, 0xEu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v6, 0x34884C48400uLL, 0);
  dispatch_time_t v8 = self->_tdm_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __63__ThreadDiagnosticsManagerInstance_startThreadDiagnosticsTimer__block_invoke;
  handler[3] = &unk_10049C010;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_activate((dispatch_object_t)self->_tdm_timer);
  int v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = 3610;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TDM: startThreadDiagnosticsTimer : Timer periodicity(s)=%d", buf, 8u);
  }
}

void __63__ThreadDiagnosticsManagerInstance_startThreadDiagnosticsTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "TDM: startThreadDiagnosticsTimer : Timer Triggered", (uint8_t *)__p, 2u);
  }

  [*(id *)(a1 + 32) handlePeriodicTimer];
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

- (CtrInternalClient)CtrInternalClientPtr
{
  return (CtrInternalClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCtrInternalClientPtr:(id)a3
{
}

- (OS_dispatch_source)tdm_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTdm_timer:(id)a3
{
}

- (OS_dispatch_queue)fQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFQueue:(id)a3
{
}

- (OS_dispatch_queue)sendQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSendQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendQueue, 0);
  objc_storeStrong((id *)&self->_fQueue, 0);
  objc_storeStrong((id *)&self->_tdm_timer, 0);

  objc_storeStrong((id *)&self->_CtrInternalClientPtr, 0);
}

- (void)threadDiagnosticsManagerInstance_MsgHandler:(os_log_t)log message:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  if (*((char *)a1 + 23) < 0) {
    a1 = (uint64_t *)*a1;
  }
  if (*((char *)a2 + 23) >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (uint64_t *)*a2;
  }
  int v4 = 136315394;
  int v5 = a1;
  __int16 v6 = 2080;
  int v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Wrong message received from client \"%s\" for method \"%s\" ", (uint8_t *)&v4, 0x16u);
}

- (void)createDriverInterface:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getMLPrefix
{
}

- (void)getMLAddress
{
}

- (void)getNwName
{
}

- (void)getLeaderRouterID
{
}

- (void)getChannel
{
}

- (void)getPartitionId
{
}

- (void)getPanId
{
}

- (void)getXPanId
{
}

- (void)updateNCPProperties
{
}

@end