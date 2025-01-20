@interface IMRemoteURLConnection
- (BOOL)cancelled;
- (BOOL)disableKeepAlive;
- (BOOL)forceCellularIfPossible;
- (BOOL)loading;
- (BOOL)requireIDSHost;
- (BOOL)shouldReturnTimingData;
- (BOOL)shouldUsePipelining;
- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4;
- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4;
- (IMURLRequestSession)URLSession;
- (NSString)bundleIdentifierForDataUsage;
- (NSURLRequest)request;
- (id)block;
- (int)concurrentConnections;
- (int)keepAliveCell;
- (int)keepAliveWifi;
- (void)_direct_cancel;
- (void)_direct_load;
- (void)cancel;
- (void)dealloc;
- (void)load;
- (void)setBlock:(id)a3;
- (void)setBundleIdentifierForDataUsage:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setConcurrentConnections:(int)a3;
- (void)setDisableKeepAlive:(BOOL)a3;
- (void)setForceCellularIfPossible:(BOOL)a3;
- (void)setKeepAliveCell:(int)a3;
- (void)setKeepAliveWifi:(int)a3;
- (void)setLoading:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setRequireIDSHost:(BOOL)a3;
- (void)setShouldReturnTimingData:(BOOL)a3;
- (void)setShouldUsePipelining:(BOOL)a3;
- (void)setURLSession:(id)a3;
@end

@implementation IMRemoteURLConnection

- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1918D54B0;
  v11[3] = &unk_1E57242A0;
  id v12 = v6;
  id v7 = v6;
  v9 = (IMRemoteURLConnection *)objc_msgSend_initWithURLRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, (uint64_t)v11);

  return v9;
}

- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IMRemoteURLConnection;
  v9 = [(IMRemoteURLConnection *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v14 = objc_msgSend_URLLoading(IMIDSLog, v11, v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v7;
      __int16 v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_191892000, v14, OS_LOG_TYPE_DEFAULT, "Init with URL request: %@  (%p)", buf, 0x16u);
    }

    uint64_t v18 = objc_msgSend_copy(v8, v15, v16, v17);
    id block = v10->_block;
    v10->_id block = (id)v18;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_URLLoading(IMIDSLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v9 = request;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Released URL request: %@  (%p)", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)IMRemoteURLConnection;
  [(IMRemoteURLConnection *)&v7 dealloc];
}

- (void)load
{
  if (!self->_loading)
  {
    self->_cancelled = 0;
    ((void (*)(IMRemoteURLConnection *, char *))MEMORY[0x1F4181798])(self, sel__direct_load);
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_URLLoading(IMIDSLog, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    int v11 = 138412546;
    uint64_t v12 = request;
    __int16 v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", (uint8_t *)&v11, 0x16u);
  }

  self->_cancelled = 1;
  id block = self->_block;
  if (block)
  {
    self->_id block = 0;
  }
  objc_msgSend__direct_cancel(self, v7, v8, v9);
}

- (BOOL)requireIDSHost
{
  return self->_requireIDSHost;
}

- (void)setRequireIDSHost:(BOOL)a3
{
  self->_requireIDSHost = a3;
}

- (BOOL)forceCellularIfPossible
{
  return self->_forceCellularIfPossible;
}

- (void)setForceCellularIfPossible:(BOOL)a3
{
  self->_forceCellularIfPossible = a3;
}

- (NSString)bundleIdentifierForDataUsage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleIdentifierForDataUsage:(id)a3
{
}

- (BOOL)shouldUsePipelining
{
  return self->_shouldUsePipelining;
}

- (void)setShouldUsePipelining:(BOOL)a3
{
  self->_shouldUsePipelining = a3;
}

- (int)concurrentConnections
{
  return self->_concurrentConnections;
}

- (void)setConcurrentConnections:(int)a3
{
  self->_concurrentConnections = a3;
}

- (BOOL)disableKeepAlive
{
  return self->_disableKeepAlive;
}

- (void)setDisableKeepAlive:(BOOL)a3
{
  self->_disableKeepAlive = a3;
}

- (int)keepAliveWifi
{
  return self->_keepAliveWifi;
}

- (void)setKeepAliveWifi:(int)a3
{
  self->_keepAliveWifi = a3;
}

- (int)keepAliveCell
{
  return self->_keepAliveCell;
}

- (void)setKeepAliveCell:(int)a3
{
  self->_keepAliveCell = a3;
}

- (BOOL)shouldReturnTimingData
{
  return self->_shouldReturnTimingData;
}

- (void)setShouldReturnTimingData:(BOOL)a3
{
  self->_shouldReturnTimingData = a3;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequest:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setBlock:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (IMURLRequestSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDataUsage, 0);
}

- (void)_direct_cancel
{
  self->_URLSession = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_direct_load
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_mutableCopy(self->_request, a2, v2, v3);
  if (objc_msgSend_forceCellularIfPossible(self, v6, v7, v8)
    && (objc_msgSend_sharedInstance(IMMobileNetworkManager, v9, v10, v11),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int isDataConnectionActive = objc_msgSend_isDataConnectionActive(v12, v13, v14, v15),
        v12,
        isDataConnectionActive))
  {
    uint64_t v17 = IMPCInterfaceName();
    uint64_t v21 = objc_msgSend_length(v17, v18, v19, v20);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v21 = objc_msgSend_length(0, v9, v10, v11);
  }
  if (v21) {
    objc_msgSend_setBoundInterfaceIdentifier_(v5, v22, (uint64_t)v17, v24);
  }
  if (objc_msgSend_disableKeepAlive(self, v22, v23, v24)) {
    objc_msgSend_addValue_forHTTPHeaderField_(v5, v25, @"close", @"Connection");
  }
  uint64_t shouldUsePipelining = objc_msgSend_shouldUsePipelining(self, v25, v26, v27);
  objc_msgSend_setHTTPShouldUsePipelining_(v5, v29, shouldUsePipelining, v30);
  v34 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E4F290F0], v31, v32, v33);
  v38 = objc_msgSend_bundleIdentifierForDataUsage(self, v35, v36, v37);

  if (v38)
  {
    v42 = objc_msgSend_bundleIdentifierForDataUsage(self, v39, v40, v41);
    objc_msgSend_set_sourceApplicationBundleIdentifier_(v34, v43, (uint64_t)v42, v44);
  }
  if ((int)objc_msgSend_concurrentConnections(self, v39, v40, v41) >= 1
    && (int)objc_msgSend_concurrentConnections(self, v45, v46, v47) <= 49)
  {
    int v48 = objc_msgSend_concurrentConnections(self, v45, v46, v47);
    objc_msgSend_setHTTPMaximumConnectionsPerHost_(v34, v49, v48, v50);
  }
  if ((int)objc_msgSend_keepAliveWifi(self, v45, v46, v47) >= 1
    && (int)objc_msgSend_keepAliveWifi(self, v51, v52, v53) < 600000)
  {
    int v54 = objc_msgSend_keepAliveWifi(self, v51, v52, v53);
    objc_msgSend_set_connectionCachePurgeTimeout_(v34, v55, v56, v57, (double)v54);
  }
  if ((int)objc_msgSend_keepAliveCell(self, v51, v52, v53) >= 1
    && (int)objc_msgSend_keepAliveCell(self, v58, v59, v60) < 600000)
  {
    int v61 = objc_msgSend_keepAliveCell(self, v58, v59, v60);
    objc_msgSend_set_connectionCacheCellPurgeTimeout_(v34, v62, v63, v64, (double)v61);
  }
  if (objc_msgSend_shouldReturnTimingData(self, v58, v59, v60)) {
    objc_msgSend_set_timingDataOptions_(v34, v65, 132, v67);
  }
  v68 = objc_msgSend_URLLoading(IMIDSLog, v65, v66, v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412290;
    v167 = request;
    _os_log_impl(&dword_191892000, v68, OS_LOG_TYPE_DEFAULT, "Beginning direct load of URL request: %@", buf, 0xCu);
  }

  v73 = objc_msgSend_URLLoading(IMIDSLog, v70, v71, v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_forceCellularIfPossible(self, v74, v75, v76)) {
      v77 = @"YES";
    }
    else {
      v77 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v167 = v77;
    _os_log_impl(&dword_191892000, v73, OS_LOG_TYPE_DEFAULT, " Try force cell: %@", buf, 0xCu);
  }

  v81 = objc_msgSend_URLLoading(IMIDSLog, v78, v79, v80);
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    v85 = objc_msgSend_bundleIdentifierForDataUsage(self, v82, v83, v84);
    *(_DWORD *)buf = 138412290;
    v167 = v85;
    _os_log_impl(&dword_191892000, v81, OS_LOG_TYPE_DEFAULT, " data usage identifier: %@", buf, 0xCu);
  }
  v89 = objc_msgSend_URLLoading(IMIDSLog, v86, v87, v88);
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_requireIDSHost(self, v90, v91, v92)) {
      v93 = @"YES";
    }
    else {
      v93 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v167 = v93;
    _os_log_impl(&dword_191892000, v89, OS_LOG_TYPE_DEFAULT, " requireIDSHost: %@", buf, 0xCu);
  }

  v97 = objc_msgSend_URLLoading(IMIDSLog, v94, v95, v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_shouldUsePipelining(self, v98, v99, v100)) {
      v101 = @"YES";
    }
    else {
      v101 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v167 = v101;
    _os_log_impl(&dword_191892000, v97, OS_LOG_TYPE_DEFAULT, " shouldUsePipelining: %@", buf, 0xCu);
  }

  v105 = objc_msgSend_URLLoading(IMIDSLog, v102, v103, v104);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    int v109 = objc_msgSend_concurrentConnections(self, v106, v107, v108);
    *(_DWORD *)buf = 67109120;
    LODWORD(v167) = v109;
    _os_log_impl(&dword_191892000, v105, OS_LOG_TYPE_DEFAULT, " concurreentConnection: %d", buf, 8u);
  }

  v113 = objc_msgSend_URLLoading(IMIDSLog, v110, v111, v112);
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_disableKeepAlive(self, v114, v115, v116)) {
      v117 = @"YES";
    }
    else {
      v117 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v167 = v117;
    _os_log_impl(&dword_191892000, v113, OS_LOG_TYPE_DEFAULT, " disableKeepAlive: %@", buf, 0xCu);
  }

  v121 = objc_msgSend_URLLoading(IMIDSLog, v118, v119, v120);
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    v125 = NSNumber;
    uint64_t v126 = objc_msgSend_keepAliveWifi(self, v122, v123, v124);
    v129 = objc_msgSend_numberWithInt_(v125, v127, v126, v128);
    *(_DWORD *)buf = 138412290;
    v167 = v129;
    _os_log_impl(&dword_191892000, v121, OS_LOG_TYPE_DEFAULT, " keepAliveWifi: %@", buf, 0xCu);
  }
  v133 = objc_msgSend_URLLoading(IMIDSLog, v130, v131, v132);
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    v137 = NSNumber;
    uint64_t v138 = objc_msgSend_keepAliveCell(self, v134, v135, v136);
    v141 = objc_msgSend_numberWithInt_(v137, v139, v138, v140);
    *(_DWORD *)buf = 138412290;
    v167 = v141;
    _os_log_impl(&dword_191892000, v133, OS_LOG_TYPE_DEFAULT, " keepAliveCell: %@", buf, 0xCu);
  }
  v145 = objc_msgSend_URLLoading(IMIDSLog, v142, v143, v144);
  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
  {
    int shouldReturnTimingData = objc_msgSend_shouldReturnTimingData(self, v146, v147, v148);
    v150 = @"YES";
    if (!shouldReturnTimingData) {
      v150 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v167 = v150;
    _os_log_impl(&dword_191892000, v145, OS_LOG_TYPE_DEFAULT, " shouldReturnTimingData: %@", buf, 0xCu);
  }

  v151 = im_primary_queue();
  uint64_t v155 = objc_msgSend_requireIDSHost(self, v152, v153, v154);
  objc_msgSend_sessionWithConfiguration_queue_requiresIDSHost_(IMURLRequestSession, v156, (uint64_t)v34, (uint64_t)v151, v155);
  v157 = (IMURLRequestSession *)objc_claimAutoreleasedReturnValue();
  URLSession = self->_URLSession;
  self->_URLSession = v157;

  v159 = self->_URLSession;
  v160 = self->_request;
  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = sub_1918D5FEC;
  v165[3] = &unk_1E5724678;
  v165[4] = self;
  objc_msgSend_performRequest_completionBlockWithTimingData_(v159, v161, (uint64_t)v160, (uint64_t)v165);
  objc_msgSend_finishTasksAndInvalidate(self->_URLSession, v162, v163, v164);
}

@end