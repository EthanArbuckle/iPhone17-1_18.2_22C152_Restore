@interface FTMessageDelivery_HTTP
- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4;
- (BOOL)_tryRetryMessageWithTimeInterval:(double)a3;
- (BOOL)busy;
- (BOOL)sendMessage:(id)a3;
- (BOOL)sendMessageAtTopOfTheQueue:(id)a3;
- (BOOL)shouldFailFastForMessage:(id)a3;
- (FTMessageDelivery_HTTP)initWithAPSConnection:(id)a3;
- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3;
- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 apsConnection:(id)a4;
- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 apsConnection:(id)a7 retryBackoffProvider:(id)a8 timeoutBackoffProvider:(id)a9;
- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 retryBackoffProvider:(id)a7 timeoutBackoffProvider:(id)a8;
- (id)_processResultData:(id)a3 forMessage:(id)a4 error:(id *)a5;
- (void)_cleanupURLConnection;
- (void)_clearRetryTimer;
- (void)_dequeueIfNeeded;
- (void)_informDelegatesOfMessage:(id)a3 result:(id)a4 resultCode:(int64_t)a5 error:(id)a6;
- (void)_notifyDelegateAboutError:(id)a3;
- (void)_serverBagLoaded:(id)a3;
- (void)_updateWiFiAssertions;
- (void)_urlRequestWithURL:(id)a3 andData:(id)a4 message:(id)a5 completionBlock:(id)a6;
- (void)cancelMessage:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)networkStateChanged;
- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4;
@end

@implementation FTMessageDelivery_HTTP

- (FTMessageDelivery_HTTP)initWithAPSConnection:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F6B598];
  id v5 = a3;
  v7 = objc_msgSend_sharedInstanceForBagType_(v4, v6, 0);
  v9 = (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_apsConnection_(self, v8, (uint64_t)v7, v5);

  return v9;
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3
{
  return (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_apsConnection_(self, a2, (uint64_t)a3, 0);
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 apsConnection:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F6B598];
  id v7 = a4;
  id v8 = a3;
  v10 = objc_msgSend_sharedInstanceForBagType_(v6, v9, 1);
  v11 = objc_alloc_init(FTMessageDeliveryRemoteURLConnectionFactory);
  v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C378], v12, v13);
  v16 = (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_iMessageServerBag_remoteConnectionFactory_mobileNetworkManager_apsConnection_retryBackoffProvider_timeoutBackoffProvider_(self, v15, (uint64_t)v8, v10, v11, v14, v7, &unk_1EFE07660, &unk_1EFE075C0);

  return v16;
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 retryBackoffProvider:(id)a7 timeoutBackoffProvider:(id)a8
{
  return (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_iMessageServerBag_remoteConnectionFactory_mobileNetworkManager_apsConnection_retryBackoffProvider_timeoutBackoffProvider_(self, a2, (uint64_t)a3, a4, a5, a6, 0, a7, a8);
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 apsConnection:(id)a7 retryBackoffProvider:(id)a8 timeoutBackoffProvider:(id)a9
{
  id v34 = a3;
  id v33 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)FTMessageDelivery_HTTP;
  v20 = [(FTMessageDelivery *)&v35 initWithAPSConnection:a7];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_idsServerBag, a3);
    objc_storeStrong((id *)&v21->_iMessageServerBag, a4);
    objc_storeStrong((id *)&v21->_remoteConnectionFactory, a5);
    objc_storeStrong((id *)&v21->_mobileNetworkManager, a6);
    uint64_t v22 = MEMORY[0x1AD0D56D0](v18);
    id retryBackoffProvider = v21->_retryBackoffProvider;
    v21->_id retryBackoffProvider = (id)v22;

    uint64_t v24 = MEMORY[0x1AD0D56D0](v19);
    id timeoutBackoffProvider = v21->_timeoutBackoffProvider;
    v21->_id timeoutBackoffProvider = (id)v24;

    if (_os_feature_enabled_impl()
      && (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E4F6C408], v26, v27, v33, v34) & 1) == 0)
    {
      v28 = (IDSOffGridConnectionMonitor *)objc_alloc_init((Class)MEMORY[0x1AD0D4F50](@"IDSOffGridConnectionMonitor", @"IDS"));
      offGridConnectionMonitor = v21->_offGridConnectionMonitor;
      v21->_offGridConnectionMonitor = v28;
    }
    v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v33);
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v21, sel__serverBagLoaded_, *MEMORY[0x1E4F6B2E0], 0);
  }
  return v21;
}

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  objc_msgSend_cancel(self->_remoteConnection, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)FTMessageDelivery_HTTP;
  [(FTMessageDelivery *)&v8 dealloc];
}

- (void)_urlRequestWithURL:(id)a3 andData:(id)a4 message:(id)a5 completionBlock:(id)a6
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v196 = a4;
  id v10 = a5;
  id v194 = a6;
  v201 = v10;
  if (v9)
  {
    if (objc_msgSend_wantsGZip(v10, v11, v12))
    {
      id v192 = (id)objc_msgSend__FTCopyGzippedData(v196, v13, v14);
    }
    else
    {
      id v192 = v196;
    }
    v195 = objc_msgSend_additionalQueryStringParameters(v10, v15, v16);
    id v191 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v195;
      _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, " Query parameters: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v185 = v195;
      _IDSLogV();
    }
    if (objc_msgSend_count(v195, v25, v26, v185))
    {
      v225[0] = MEMORY[0x1E4F143A8];
      v225[1] = 3221225472;
      v225[2] = sub_1A7BDA070;
      v225[3] = &unk_1E5D1AD50;
      id v29 = v191;
      id v226 = v29;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v195, v30, (uint64_t)v225);
      v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v29;
        _os_log_impl(&dword_1A7BC0000, v31, OS_LOG_TYPE_DEFAULT, " Query string: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v186 = v29;
        _IDSLogV();
      }
      if (objc_msgSend_length(v29, v32, v33, v186))
      {
        v36 = objc_msgSend_absoluteString(v9, v34, v35);
        v38 = objc_msgSend_stringByAppendingFormat_(v36, v37, @"?%@", v29);

        v193 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v39, (uint64_t)v38);

        v40 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v193;
          _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "Generated final URL: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v186 = v193;
          _IDSLogV();
        }
      }
      else
      {
        v193 = v9;
      }
    }
    else
    {
      v193 = v9;
    }
    BOOL v41 = self->_timeoutBackoffProvider == 0;
    objc_msgSend_timeout(v201, v27, v28, v186);
    double v44 = v43;
    if (!v41)
    {
      double v45 = (*((double (**)(void))self->_timeoutBackoffProvider + 2))();
      if (v44 >= v45) {
        double v44 = v45;
      }
    }
    objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x1E4F18D50], v42, (uint64_t)v193, 1, v44);
    id v202 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_wantsHTTPGet(v201, v46, v47) & 1) == 0)
    {
      objc_msgSend_setHTTPMethod_(v202, v48, @"POST");
      objc_msgSend_setHTTPBody_(v202, v50, (uint64_t)v192);
    }
    if ((objc_msgSend_isIDSMessage(v201, v48, v49) & 1) == 0) {
      objc_msgSend_setHTTPBody_(v202, v51, (uint64_t)v196);
    }
    if (objc_msgSend_httpDoNotDecodeData(v201, v51, v52))
    {
      id v54 = v202;
      objc_msgSend__CFURLRequest(v54, v55, v56);
      _CFURLRequestSetProtocolProperty();
    }
    objc_msgSend_setHTTPShouldHandleCookies_(v202, v53, 0);
    v59 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v57, v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v193;
      _os_log_impl(&dword_1A7BC0000, v59, OS_LOG_TYPE_DEFAULT, "Building URL request with URL: %@", buf, 0xCu);
    }

    v60 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v60, OS_LOG_TYPE_DEFAULT, "Headers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    v61 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v62, v63);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v64;
      _os_log_impl(&dword_1A7BC0000, v61, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v187 = objc_msgSend_userAgent(self, v65, v66);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v187 = objc_msgSend_userAgent(self, v67, v68);
        IMLogString();
      }
    }
    v69 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v69, OS_LOG_TYPE_DEFAULT, "Headers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v70 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v71, v72);
      id v73 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v73;
      _os_log_impl(&dword_1A7BC0000, v70, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v187 = objc_msgSend_userAgent(self, v74, v75);
      _IDSLogV();
    }
    objc_msgSend_userAgent(self, v74, v75, v187);
    v197 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_length(v197, v76, v77))
    {

      v197 = @"FTMessageDelivery";
    }
    v80 = NSString;
    v81 = objc_msgSend_sharedInstance(FTDeviceSupport, v78, v79);
    v84 = objc_msgSend_userAgentString(v81, v82, v83);
    v198 = objc_msgSend_stringWithFormat_(v80, v85, @"%@ %@", v197, v84);

    v86 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v198;
      _os_log_impl(&dword_1A7BC0000, v86, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v188 = v198;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v188 = v198;
        IMLogString();
      }
    }
    v87 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v198;
      _os_log_impl(&dword_1A7BC0000, v87, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v188 = v198;
      _IDSLogV();
    }
    int isIDSMessage = objc_msgSend_isIDSMessage(v201, v88, v89, v188);
    v91 = sub_1A7BDA120();
    uint64_t v94 = objc_msgSend_length(v91, v92, v93);

    if (isIDSMessage)
    {
      if (v94)
      {
        v97 = sub_1A7BDA120();
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v98, (uint64_t)v97, @"Accept-Language");
      }
      if (objc_msgSend_length(@"gzip", v95, v96)) {
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v99, @"gzip", @"accept-encoding");
      }
      if (objc_msgSend_length(v198, v99, v100)) {
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v101, (uint64_t)v198, @"user-agent");
      }
      if ((objc_msgSend_wantsHTTPGet(v201, v101, v102) & 1) == 0)
      {
        if (objc_msgSend_wantsGZip(v201, v103, v104) && objc_msgSend_length(@"gzip", v105, v106)) {
          objc_msgSend_setValue_forHTTPHeaderField_(v202, v105, @"gzip", @"content-encoding");
        }
        objc_msgSend_overrideContentType(v201, v105, v106);
        v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v110 = v107;
        if (!v107) {
          v107 = @"application/x-apple-plist";
        }
        BOOL v111 = objc_msgSend_length(v107, v108, v109) == 0;

        if (!v111)
        {
          uint64_t v114 = objc_msgSend_overrideContentType(v201, v112, v113);
          v116 = (void *)v114;
          if (v114) {
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v115, v114, @"content-type");
          }
          else {
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v115, @"application/x-apple-plist", @"content-type");
          }
        }
        v117 = NSNumber;
        uint64_t v118 = objc_msgSend_length(v192, v112, v113);
        v120 = objc_msgSend_numberWithInteger_(v117, v119, v118);

        if (v120)
        {
          v121 = NSNumber;
          uint64_t v122 = objc_msgSend_length(v192, v103, v104);
          v124 = objc_msgSend_numberWithInteger_(v121, v123, v122);
          v127 = objc_msgSend_stringValue(v124, v125, v126);
          objc_msgSend_setValue_forHTTPHeaderField_(v202, v128, (uint64_t)v127, @"content-length");
        }
      }
    }
    else
    {
      if (v94)
      {
        v129 = sub_1A7BDA120();
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v130, (uint64_t)v129, @"Accept-Language");
      }
      if (objc_msgSend_length(v198, v95, v96)) {
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v103, (uint64_t)v198, @"user-agent");
      }
    }
    v131 = objc_msgSend_additionalMessageHeaders(v201, v103, v104);
    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    v134 = objc_msgSend_allKeys(v131, v132, v133);
    uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v221, v231, 16);
    if (v137)
    {
      uint64_t v138 = *(void *)v222;
      do
      {
        for (uint64_t i = 0; i != v137; ++i)
        {
          if (*(void *)v222 != v138) {
            objc_enumerationMutation(v134);
          }
          uint64_t v140 = *(void *)(*((void *)&v221 + 1) + 8 * i);
          v141 = objc_msgSend_objectForKey_(v131, v136, v140, v189, v190);

          if (v141)
          {
            v143 = objc_msgSend_objectForKey_(v131, v142, v140);
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v144, (uint64_t)v143, v140);
          }
          v145 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v131, v146, v140);
            id v147 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v140;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v147;
            _os_log_impl(&dword_1A7BC0000, v145, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              objc_msgSend_objectForKey_(v131, v148, v140);
              v190 = uint64_t v189 = v140;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              objc_msgSend_objectForKey_(v131, v136, v140);
              v190 = uint64_t v189 = v140;
              IMLogString();
            }
          }
        }
        uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v136, (uint64_t)&v221, v231, 16);
      }
      while (v137);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v228 = sub_1A7BDA178;
    v229 = sub_1A7BDA188;
    id v230 = 0;
    v151 = objc_msgSend_uniqueID(v201, v149, v150);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v201);
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = sub_1A7BDA190;
    v215[3] = &unk_1E5D1B040;
    objc_copyWeak(v219, &location);
    v219[1] = v151;
    v215[4] = self;
    id v152 = v201;
    id v216 = v152;
    id v153 = v202;
    id v217 = v153;
    v218 = buf;
    id v203 = (id)MEMORY[0x1AD0D56D0](v215);
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = sub_1A7BDA680;
    v208[3] = &unk_1E5D1B0B8;
    v208[4] = self;
    v214 = v151;
    id v154 = v153;
    id v209 = v154;
    v213 = buf;
    id v155 = v194;
    id v212 = v155;
    id v156 = v192;
    id v210 = v156;
    id v157 = v191;
    id v211 = v157;
    v158 = (void *)MEMORY[0x1AD0D56D0](v208);
    v207[0] = MEMORY[0x1E4F143A8];
    v207[1] = 3221225472;
    v207[2] = sub_1A7BDB418;
    v207[3] = &unk_1E5D1B108;
    v207[4] = buf;
    v159 = (void *)MEMORY[0x1AD0D56D0](v207);
    if (!objc_msgSend_isIDSMessage(v152, v160, v161))
    {
      v183 = im_primary_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A7BDB4B8;
      block[3] = &unk_1E5D1ACE0;
      id v206 = v155;
      id v205 = v154;
      dispatch_async(v183, block);

LABEL_147:
      objc_destroyWeak(v219);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_148;
    }
    id v200 = v152;
    objc_msgSend_anisetteHeadersTimeout(v200, v162, v163);
    double v165 = v164;
    v167 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v166, 0);
    v169 = objc_msgSend_objectForKey_(v167, v168, @"anisette-headers-global-timeout");
    objc_opt_class();
    double v172 = -1.0;
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_doubleValue(v169, v170, v171);
      double v172 = v173;
    }
    v174 = objc_msgSend_objectForKey_(v167, v170, @"anisette-headers-lenient-timeout", v189);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_doubleValue(v174, v175, v176);
      if (v165 >= 0.0)
      {
        double v180 = v179;
        if (v179 > 0.0 && objc_msgSend_allowsServerProvidedLenientAnisetteTimeout(v200, v177, v178))
        {
          v181 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v232 = 134217984;
            double v233 = v180;
            _os_log_impl(&dword_1A7BC0000, v181, OS_LOG_TYPE_DEFAULT, "Using server bag anisetteHeaderLenientTimeout: %f second(s)", v232, 0xCu);
          }

          int64_t v182 = (uint64_t)(v180 * 1000000000.0);
          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
            goto LABEL_146;
          }
LABEL_135:
          _IDSLogV();
LABEL_146:

          dispatch_time(0, v182);
          im_dispatch_async_with_timeout();
          goto LABEL_147;
        }
LABEL_139:
        if (v172 <= 0.0)
        {
          int64_t v182 = (uint64_t)(v165 * 1000000000.0);
          goto LABEL_146;
        }
        v184 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v232 = 134217984;
          double v233 = v172;
          _os_log_impl(&dword_1A7BC0000, v184, OS_LOG_TYPE_DEFAULT, "Using server bag anisetteHeaderGlobalTimeout: %f second(s)", v232, 0xCu);
        }

        int64_t v182 = (uint64_t)(v172 * 1000000000.0);
        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
          goto LABEL_146;
        }
        goto LABEL_135;
      }
    }
    else if (v165 >= 0.0)
    {
      goto LABEL_139;
    }
    int64_t v182 = 0;
    goto LABEL_146;
  }
  if (_IMWillLog())
  {
    id v185 = v10;
    _IMAlwaysLog();
  }
  if (MarcoShouldLogCheckpoints())
  {
    id v185 = v10;
    MarcoNoteCheckpoint();
  }
  if (objc_msgSend_logToRegistration(self, v17, v18, v185))
  {
    v21 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v19, v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "Cannot send message: Empty URL requested for message: %@, forcing a bag load", buf, 0xCu);
    }
  }
  objc_msgSend_forceBagLoad(self->_idsServerBag, v19, v20);
  objc_msgSend__cleanupURLConnection(self, v22, v23);
LABEL_148:
}

- (id)_processResultData:(id)a3 forMessage:(id)a4 error:(id *)a5
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1AD0D54C0]();
  if (!objc_msgSend_length(v7, v10, v11))
  {
    id v17 = 0;
    goto LABEL_5;
  }
  uint64_t v14 = objc_msgSend_parsedIDSMessageResult(v8, v12, v13);
  if (v14)
  {
    id v17 = v14;
LABEL_5:
    id v18 = 0;
LABEL_6:
    id v19 = v17;
    goto LABEL_7;
  }
  v27[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = objc_msgSend__FTDecompressData(v7, v15, v16);
  if (v22) {
    uint64_t v23 = (uint64_t)v22;
  }
  else {
    uint64_t v23 = (uint64_t)v7;
  }
  id v26 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v21, v23, 0, v27, &v26);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v26;

  if (!a5 || !v18)
  {
    v25 = (void *)MEMORY[0x1AD0D54C0]();
    if (v8 && v17) {
      objc_msgSend_handleResponseDictionary_(v8, v24, (uint64_t)v17);
    }
    id v17 = v17;
    goto LABEL_6;
  }
  id v18 = v18;
  id v19 = 0;
  *a5 = v18;
LABEL_7:

  return v19;
}

- (void)_updateWiFiAssertions
{
  int v4 = objc_msgSend_busy(self, a2, v2);
  mobileNetworkManager = self->_mobileNetworkManager;
  if (v4)
  {
    MEMORY[0x1F4181798](mobileNetworkManager, sel_addWiFiAutoAssociationClientToken_, @"FTMessageDelivery");
  }
  else
  {
    MEMORY[0x1F4181798](mobileNetworkManager, sel_removeWiFiAutoAssociationClientToken_, @"FTMessageDelivery");
  }
}

- (void)_notifyDelegateAboutError:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__queue(self, v5, v6);
  objc_msgSend_dequeueTopMessage(v7, v8, v9);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__cleanupURLConnection(self, v10, v11);
  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v12, (uint64_t)v15, v4, 0, 20000, 0);

  objc_msgSend__dequeueIfNeeded(self, v13, v14);
}

- (void)_informDelegatesOfMessage:(id)a3 result:(id)a4 resultCode:(int64_t)a5 error:(id)a6
{
  self->super._retries = 0;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v15 = objc_msgSend__queue(self, v13, v14);
  objc_msgSend_removeMessage_(v15, v16, (uint64_t)v12);

  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v17, (uint64_t)v12, v10, v11, a5, 0);
  objc_msgSend__cleanupURLConnection(self, v18, v19);

  objc_msgSend__dequeueIfNeeded(self, v20, v21);
}

- (void)_clearRetryTimer
{
  v3.receiver = self;
  v3.super_class = (Class)FTMessageDelivery_HTTP;
  [(FTMessageDelivery *)&v3 _clearRetryTimer];
  self->_pendingRetryAfterAirplaneMode = 0;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  obj->_pendingRetryAfterAirplaneMode = 0;
  objc_msgSend__clearRetryTimer(obj, v2, v3);
  uint64_t v6 = objc_msgSend__queue(obj, v4, v5);
  objc_msgSend_removeAllMessages(v6, v7, v8);

  objc_msgSend__cleanupURLConnection(obj, v9, v10);
  objc_sync_exit(obj);
}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    if (objc_msgSend_logToRegistration(v8, v9, v10))
    {
      uint64_t v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v7;
        _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Requesting async send: %@", buf, 0xCu);
      }
    }
    uint64_t v14 = objc_msgSend_bagKey(v7, v11, v12);
    id v17 = objc_msgSend_messageBodyDataOverride(v7, v15, v16);

    if (v17)
    {
      uint64_t v21 = objc_msgSend_messageBodyDataOverride(v7, v18, v19);
      id v22 = 0;
    }
    else if (objc_msgSend_isIDSMessage(v7, v18, v19))
    {
      objc_msgSend_messageBodyUsingCache(v7, v20, v26);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      id v70 = 0;
      uint64_t v21 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v27, (uint64_t)v22, 100, 0, &v70);
      id v28 = v70;
      if (v28)
      {
        id v29 = v28;
        v30 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = objc_msgSend_localizedDescription(v29, v31, v32);
          *(_DWORD *)buf = 138412290;
          id v72 = v33;
          _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_ERROR, "error = %@", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled())
        {
          BOOL v25 = 0;
          goto LABEL_24;
        }
        id v64 = objc_msgSend_localizedDescription(v29, v34, v35);
        _IDSWarnV();

        v65 = objc_msgSend_localizedDescription(v29, v36, v37, v64);
        _IDSLogV();

        objc_msgSend_localizedDescription(v29, v38, v39, v65);
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport();
        BOOL v25 = 0;
LABEL_23:

LABEL_24:
        objc_sync_exit(v8);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      id v22 = 0;
      uint64_t v21 = 0;
    }
    BOOL v41 = objc_msgSend_urlWithKey_(v8->_idsServerBag, v20, (uint64_t)v14);
    double v44 = objc_msgSend_URLOverride(v7, v42, v43);

    if (v44)
    {
      uint64_t v47 = objc_msgSend_URLOverride(v7, v45, v46);

      BOOL v41 = (void *)v47;
    }
    uint64_t v48 = objc_msgSend_length(v21, v45, v46);
    objc_msgSend_setSentByteCount_(v7, v49, v48);
    uint64_t v52 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v50, v51);
    objc_msgSend_setRequestStart_(v7, v53, (uint64_t)v52);

    uint64_t v56 = objc_msgSend_uniqueID(v7, v54, v55);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = sub_1A7BDBF08;
    v66[3] = &unk_1E5D1B1A8;
    v66[4] = v8;
    uint64_t v69 = v56;
    id v40 = v41;
    id v67 = v40;
    id v22 = v22;
    id v68 = v22;
    v57 = (void *)MEMORY[0x1AD0D56D0](v66);
    uint64_t v60 = objc_msgSend_remoteURLConnection(v8->_remoteConnectionFactory, v58, v59);
    remoteConnection = v8->_remoteConnection;
    v8->_remoteConnection = (FTMessageDeliveryRemoteURLConnection *)v60;

    objc_msgSend__urlRequestWithURL_andData_message_completionBlock_(v8, v62, (uint64_t)v40, v21, v7, v57);
    id v29 = 0;
    BOOL v25 = 1;
    goto LABEL_23;
  }
  if (objc_msgSend_logToRegistration(self, v5, v6))
  {
    objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24);
    uint64_t v8 = (FTMessageDelivery_HTTP *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, &v8->super.super, OS_LOG_TYPE_DEFAULT, "Cannot send nil message", buf, 2u);
    }
    BOOL v25 = 0;
    goto LABEL_25;
  }
  BOOL v25 = 0;
LABEL_26:

  return v25;
}

- (void)_dequeueIfNeeded
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  objc_msgSend__updateWiFiAssertions(v2, v3, v4);
  id v7 = objc_msgSend__queue(v2, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend__queue(v2, v11, v12);
    uint64_t v16 = objc_msgSend_topMessage(v13, v14, v15);

    id v17 = v2->_idsServerBag;
    if (objc_msgSend_isIDSMessage(v16, v18, v19) && (objc_msgSend_isLoaded(v17, v20, v21) & 1) == 0)
    {
      if (objc_msgSend_logToRegistration(v2, v20, v21))
      {
        v62 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v60, v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v62, OS_LOG_TYPE_DEFAULT, "Server bag is not loaded, waiting for it", buf, 2u);
        }
      }
      if (objc_msgSend_isServerAvailable(v17, v60, v61))
      {
        if (objc_msgSend_logToRegistration(v2, v63, v64))
        {
          id v67 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v65, v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v67, OS_LOG_TYPE_DEFAULT, " => Server is available", buf, 2u);
          }
        }
        if (objc_msgSend_isLoading(v17, v65, v66))
        {
          if (!objc_msgSend_logToRegistration(v2, v68, v69))
          {
LABEL_63:

LABEL_64:
            goto LABEL_65;
          }
          id v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v70, v71);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
LABEL_62:

            goto LABEL_63;
          }
          *(_WORD *)buf = 0;
          id v72 = " => Already loading";
        }
        else
        {
          objc_msgSend_startBagLoad(v17, v68, v69);
          if (!objc_msgSend_logToRegistration(v2, v106, v107)) {
            goto LABEL_63;
          }
          id v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v108, v109);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_62;
          }
          *(_WORD *)buf = 0;
          id v72 = " => Starting load";
        }
      }
      else
      {
        if (!objc_msgSend_logToRegistration(v2, v63, v64)) {
          goto LABEL_63;
        }
        id v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v89, v90);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_62;
        }
        *(_WORD *)buf = 0;
        id v72 = " => Server not available";
      }
      _os_log_impl(&dword_1A7BC0000, v29, OS_LOG_TYPE_DEFAULT, v72, buf, 2u);
      goto LABEL_62;
    }
    objc_msgSend__cleanupURLConnection(v2, v20, v21);
    if ((objc_msgSend_isValidMessage(v16, v22, v23) & 1) == 0)
    {
      v36 = objc_msgSend_stringGUID(NSString, v24, v25);
      uint64_t v56 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v54, v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A7BC0000, v56, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, invalid message", buf, 0xCu);
      }

      v57 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A7BC0000, v57, OS_LOG_TYPE_DEFAULT, "%@ Cancelling message delivery! invalid message!", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v122 = v36;
          IMLogString();
        }
      }
      v50 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v58, 5003, 0, v122);
      objc_msgSend__notifyDelegateAboutError_(v2, v59, (uint64_t)v50);
      id v29 = 0;
      goto LABEL_60;
    }
    id v132 = 0;
    char hasRequiredKeys = objc_msgSend_hasRequiredKeys_(v16, v24, (uint64_t)&v132);
    id v29 = v132;
    if ((hasRequiredKeys & 1) == 0)
    {
      v36 = objc_msgSend_stringGUID(NSString, v27, v28);
      uint64_t v75 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v73, v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFEC18();
      }

      v76 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v134 = v36;
        __int16 v135 = 2112;
        v136 = v29;
        _os_log_impl(&dword_1A7BC0000, v76, OS_LOG_TYPE_DEFAULT, "%@ Cancelling message delivery! Missing keys: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v122 = v36;
          v123 = v29;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v122 = v36;
          v123 = v29;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v77, v78, v122, v123))
      {
        v81 = objc_msgSend_messageBodyUsingCache(v16, v79, v80);
        v84 = objc_msgSend_description(v81, v82, v83);
        v85 = IDSLoggableDescriptionForObjectOnService();

        id v130 = v36;
        id v131 = v85;
        cut_dispatch_log_queue();
      }
      v50 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v79, 5008, 0);
      objc_msgSend__notifyDelegateAboutError_(v2, v86, (uint64_t)v50);
      goto LABEL_60;
    }
    if ((objc_msgSend_retryInAirplaneMode(v2, v27, v28) & 1) != 0
      || !objc_msgSend_isAirplaneModeEnabled(v2->_mobileNetworkManager, v30, v31)
      || (objc_msgSend_isWiFiUsable(v2->_mobileNetworkManager, v30, v32) & 1) != 0)
    {
      if (!objc_msgSend_shouldFailFastForMessage_(v2, v30, (uint64_t)v16))
      {
        if (!objc_msgSend_isTrafficDisabledOnVMForMessage_(v2, v34, (uint64_t)v16))
        {
          objc_msgSend__sendMessageAsynchronously_error_(v2, v91, (uint64_t)v16, 0);
          goto LABEL_61;
        }
        v36 = objc_msgSend_stringGUID(NSString, v91, v92);
        v95 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v93, v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
          sub_1A7BFEB48();
        }

        if (objc_msgSend_payloadCanBeLogged(v16, v96, v97))
        {
          uint64_t v100 = objc_msgSend_messageBodyUsingCache(v16, v98, v99);
          v103 = objc_msgSend_description(v100, v101, v102);
          uint64_t v104 = IDSLoggableDescriptionForObjectOnService();

          id v124 = v36;
          id v125 = v104;
          cut_dispatch_log_queue();
        }
        v50 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v98, 20000, 0);
        objc_msgSend__notifyDelegateAboutError_(v2, v105, (uint64_t)v50);
LABEL_60:

LABEL_61:
        objc_msgSend__updateWiFiAssertions(v2, v87, v88);
        goto LABEL_62;
      }
      v36 = objc_msgSend_stringGUID(NSString, v34, v35);
      uint64_t v39 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v37, v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFEAE0();
      }

      id v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, network is unavailable, can attempt stewie", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v122 = v36;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v41, v42, v122))
      {
        double v45 = objc_msgSend_messageBodyUsingCache(v16, v43, v44);
        uint64_t v48 = objc_msgSend_description(v45, v46, v47);
        uint64_t v49 = IDSLoggableDescriptionForObjectOnService();

        id v126 = v36;
        id v127 = v49;
        cut_dispatch_log_queue();
      }
    }
    else
    {
      v36 = objc_msgSend_stringGUID(NSString, v30, v33);
      v112 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v110, v111);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFEBB0();
      }

      uint64_t v113 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A7BC0000, v113, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, airplane mode is enabled", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          uint64_t v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          uint64_t v122 = v36;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v114, v115, v122))
      {
        v117 = objc_msgSend_messageBodyUsingCache(v16, v43, v116);
        v120 = objc_msgSend_description(v117, v118, v119);
        v121 = IDSLoggableDescriptionForObjectOnService();

        id v128 = v36;
        id v129 = v121;
        cut_dispatch_log_queue();
      }
    }
    v50 = objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v43, 10000, 0);
    objc_msgSend__notifyDelegateAboutError_(v2, v51, (uint64_t)v50);
    goto LABEL_60;
  }
  if (objc_msgSend_logToRegistration(v2, v11, v12))
  {
    uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v52, v53);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Nothing left in queue, done", buf, 2u);
    }
    goto LABEL_64;
  }
LABEL_65:
  objc_sync_exit(v2);
}

- (void)_cleanupURLConnection
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_remoteConnection && objc_msgSend_logToRegistration(v2, v3, v4))
  {
    uint64_t v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning out url connection", v7, 2u);
    }
  }
  objc_msgSend_cancel(v2->_remoteConnection, v3, v4);
  remoteConnection = v2->_remoteConnection;
  v2->_remoteConnection = 0;

  objc_sync_exit(v2);
}

- (BOOL)busy
{
  return self->_remoteConnection != 0;
}

- (BOOL)_tryRetryMessageWithTimeInterval:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_logToRegistration(self, a2, v3))
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int retries = self->super._retries;
      int v25 = 67109120;
      LODWORD(v26) = retries;
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Should retry, already tried: %d times", (uint8_t *)&v25, 8u);
    }
  }
  unsigned int v10 = self->super._retries + 1;
  self->super._unsigned int retries = v10;
  if (v10 > 0x59)
  {
    if (objc_msgSend_logToRegistration(self, v6, v7))
    {
      id v17 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v15, v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_1A7BFEC94(v17);
      }
    }
  }
  else if (objc_msgSend_isAirplaneModeEnabled(self->_mobileNetworkManager, v6, v7) {
         && (objc_msgSend_isWiFiUsable(self->_mobileNetworkManager, v11, v12) & 1) == 0)
  }
  {
    if (objc_msgSend_logToRegistration(self, v11, v12))
    {
      uint64_t v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v21, v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "Not retrying right now, we're in airplane mode with no wifi", (uint8_t *)&v25, 2u);
      }
    }
    self->_pendingRetryAfterAirplaneMode = 1;
    self->_retryTimeAfterAirplaneMode = a3;
  }
  else
  {
    self->_pendingRetryAfterAirplaneMode = 0;
    id retryBackoffProvider = (double (**)(id, void, double))self->_retryBackoffProvider;
    if (retryBackoffProvider) {
      double v14 = retryBackoffProvider[2](retryBackoffProvider, self->super._retries, a3);
    }
    else {
      double v14 = 300.0;
    }
    if (objc_msgSend_logToRegistration(self, v11, v12))
    {
      uint64_t v20 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v18, v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 134217984;
        double v26 = v14;
        _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", (uint8_t *)&v25, 0xCu);
      }
    }
    objc_msgSend__setRetryTimer_(self, v18, v19, v14);
  }
  return v10 < 0x5A;
}

- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_wantsCFNetworkTimeout(v7, v8, v9))
  {
    if (objc_msgSend_logToRegistration(self, v10, v11))
    {
      double v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v48 = v7;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Message timed out, but we're going to wait for CFNetwork: %@", buf, 0xCu);
      }
    }
    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v48 = v7;
      _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, "Message timed out, but we're going to wait for CFNetwork: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
  }
  else if (objc_msgSend_wantsExtraTimeoutRetry(v7, v10, v11) {
         && (int v18 = objc_msgSend_timeoutRetries(v7, v16, v17), v18 < (int)objc_msgSend_maxTimeoutRetries(v7, v19, v20)))
  }
  {
    int v23 = objc_msgSend_timeoutRetries(v7, v21, v22);
    objc_msgSend_setTimeoutRetries_(v7, v24, (v23 + 1));
    if (objc_msgSend_logToRegistration(self, v25, v26))
    {
      id v29 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v27, v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v48 = objc_msgSend_timeoutRetries(v7, v30, v31);
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = objc_msgSend_maxTimeoutRetries(v7, v32, v33);
        __int16 v49 = 2112;
        id v50 = v7;
        _os_log_impl(&dword_1A7BC0000, v29, OS_LOG_TYPE_DEFAULT, "Message timed out, but we want extra timeout retries (%d/%d): %@", buf, 0x18u);
      }

      v36 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v34, v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)uint64_t v48 = 0x4000000000000000;
        _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", buf, 0xCu);
      }
    }
    objc_msgSend__setRetryTimer_(self, v27, v28, 2.0);
  }
  else
  {
    uint64_t v37 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v48 = v7;
      _os_log_impl(&dword_1A7BC0000, v37, OS_LOG_TYPE_DEFAULT, "Queue timed out delivery for message: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v46 = v7;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v46 = v7;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(self, v38, v39, v46))
    {
      uint64_t v42 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v40, v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v48 = v7;
        _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, "Queue timed out delivery for message: %@", buf, 0xCu);
      }
    }
    objc_msgSend__clearRetryTimer(self, v40, v41);
    uint64_t v44 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v43, *MEMORY[0x1E4F289A0], -1001, 0);
    self->super._unsigned int retries = 0;
    objc_msgSend__notifyDelegateAboutError_(self, v45, (uint64_t)v44);
  }
}

- (void)cancelMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FTMessageDelivery_HTTP;
  [(FTMessageDelivery *)&v31 cancelMessage:v4];
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v30 = v4;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v30 = v4;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(self, v6, v7, v30))
    {
      unsigned int v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v4;
        _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
      }
    }
    uint64_t v11 = self;
    objc_sync_enter(v11);
    double v14 = objc_msgSend__queue(v11, v12, v13);
    uint64_t v17 = objc_msgSend_messages(v14, v15, v16);
    int v19 = objc_msgSend_containsObject_(v17, v18, (uint64_t)v4);

    if (v19)
    {
      objc_msgSend_currentMessage(v11, v20, v21);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v23 = v22 == v4;

      if (v23)
      {
        v11->_pendingRetryAfterAirplaneMode = 0;
        objc_msgSend__cleanupURLConnection(v11, v24, v25);
      }
      uint64_t v26 = objc_msgSend__queue(v11, v24, v25);
      objc_msgSend_removeMessage_(v26, v27, (uint64_t)v4);

      objc_msgSend__dequeueIfNeeded(v11, v28, v29);
    }
    objc_sync_exit(v11);
  }
}

- (BOOL)sendMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend__setUsingOutgoingPush_(v4, v6, 0);
  objc_msgSend_setDeliveryMechanism_(v4, v7, 2);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v8, v9);
  objc_msgSend_setTimeSent_(v4, v10, v11);
  if (objc_msgSend_logToRegistration(v5, v12, v13))
  {
    uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      id v35 = v4;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", (uint8_t *)&v34, 0xCu);
    }
  }
  uint64_t v17 = objc_msgSend__queue(v5, v14, v15);
  objc_msgSend_addMessage_(v17, v18, (uint64_t)v4);

  if (objc_msgSend_busy(v5, v19, v20))
  {
    if (objc_msgSend_logToRegistration(v5, v21, v22))
    {
      uint64_t v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_msgSend__queue(v5, v26, v27);
        objc_super v31 = objc_msgSend_topMessage(v28, v29, v30);
        remoteConnection = v5->_remoteConnection;
        int v34 = 138412546;
        id v35 = v31;
        __int16 v36 = 2112;
        uint64_t v37 = remoteConnection;
        _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v34, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v21, v22);
  }
  objc_sync_exit(v5);

  return 1;
}

- (BOOL)sendMessageAtTopOfTheQueue:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v6, v7);
  objc_msgSend_setTimeSent_(v4, v8, v9);
  if (objc_msgSend_logToRegistration(v5, v10, v11))
  {
    double v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", (uint8_t *)&v32, 0xCu);
    }
  }
  uint64_t v15 = objc_msgSend__queue(v5, v12, v13);
  objc_msgSend_addMessageAtHeadOfQueue_(v15, v16, (uint64_t)v4);

  if (objc_msgSend_busy(v5, v17, v18))
  {
    if (objc_msgSend_logToRegistration(v5, v19, v20))
    {
      BOOL v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v21, v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_msgSend__queue(v5, v24, v25);
        uint64_t v29 = objc_msgSend_topMessage(v26, v27, v28);
        remoteConnection = v5->_remoteConnection;
        int v32 = 138412546;
        id v33 = v29;
        __int16 v34 = 2112;
        id v35 = remoteConnection;
        _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v32, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v19, v20);
  }
  objc_sync_exit(v5);

  return 1;
}

- (void)_serverBagLoaded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend_logToRegistration(v5, v6, v7))
  {
    unsigned int v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "Server bag loaded", (uint8_t *)&v23, 2u);
    }
  }
  if (objc_msgSend_busy(v5, v8, v9))
  {
    if (objc_msgSend_logToRegistration(v5, v11, v12))
    {
      uint64_t v15 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_msgSend__queue(v5, v16, v17);
        uint64_t v21 = objc_msgSend_topMessage(v18, v19, v20);
        remoteConnection = v5->_remoteConnection;
        int v23 = 138412546;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        uint64_t v26 = remoteConnection;
        _os_log_impl(&dword_1A7BC0000, v15, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v11, v12);
  }
  objc_sync_exit(v5);
}

- (BOOL)shouldFailFastForMessage:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E4F6C408], v5, v6) & 1) != 0)
  {
    goto LABEL_20;
  }
  if (!qword_1EB47C798)
  {
    uint64_t v9 = (void **)MEMORY[0x1AD0D4F60]("IDSServiceNameiMessage", @"IDS");
    if (v9) {
      unsigned int v10 = *v9;
    }
    else {
      unsigned int v10 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C798, v10);
  }
  if (!qword_1EB47C7A8)
  {
    uint64_t v11 = (void **)MEMORY[0x1AD0D4F60]("IDSServiceNameiMessageLite", @"IDS");
    if (v11) {
      uint64_t v12 = *v11;
    }
    else {
      uint64_t v12 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C7A8, v12);
  }
  uint64_t v13 = objc_msgSend_topic(v4, v7, v8);
  if (objc_msgSend_isEqualToIgnoringCase_(v13, v14, qword_1EB47C798))
  {
    char isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v15, v16);
  }
  else
  {
    uint64_t v18 = objc_msgSend_topic(v4, v15, v16);
    if ((objc_msgSend_isEqualToIgnoringCase_(v18, v19, qword_1EB47C7A8) & 1) == 0)
    {

      goto LABEL_20;
    }
    char isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v20, v21);
  }
  if ((isConnectionSuitableForIMLOverStewie & 1) == 0)
  {
LABEL_20:
    BOOL v22 = 0;
    goto LABEL_21;
  }
  BOOL v22 = 1;
LABEL_21:

  return v22;
}

- (void)networkStateChanged
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)FTMessageDelivery_HTTP;
  [(FTMessageDelivery *)&v18 networkStateChanged];
  if (self->_pendingRetryAfterAirplaneMode)
  {
    self->_pendingRetryAfterAirplaneMode = 0;
    uint64_t v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "We're out of airplane mode, and we have a pending retry", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(self, v4, v5))
    {
      uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "We're out of airplane mode, and we have a pending retry", buf, 2u);
      }
    }
    double retryTimeAfterAirplaneMode = self->_retryTimeAfterAirplaneMode;
    if (retryTimeAfterAirplaneMode < 10.0)
    {
      LODWORD(retryTimeAfterAirplaneMode) = self->super._retries;
      double v10 = (double)*(unint64_t *)&retryTimeAfterAirplaneMode / 10.0;
      double v11 = v10 + 1.0;
      BOOL v12 = v10 <= 3.0;
      double v13 = 4.0;
      if (v12) {
        double v13 = v11;
      }
      double retryTimeAfterAirplaneMode = __exp10(v13);
    }
    if (retryTimeAfterAirplaneMode <= 43200.0) {
      double v14 = retryTimeAfterAirplaneMode;
    }
    else {
      double v14 = 43200.0;
    }
    if (objc_msgSend_logToRegistration(self, v6, v7))
    {
      uint64_t v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v20 = v14;
        _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", buf, 0xCu);
      }
    }
    objc_msgSend__setRetryTimer_(self, v15, v16, v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iMessageServerBag, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong(&self->_timeoutBackoffProvider, 0);
  objc_storeStrong(&self->_retryBackoffProvider, 0);
  objc_storeStrong((id *)&self->_offGridConnectionMonitor, 0);
  objc_storeStrong((id *)&self->_mobileNetworkManager, 0);
  objc_storeStrong((id *)&self->_remoteConnection, 0);

  objc_storeStrong((id *)&self->_remoteConnectionFactory, 0);
}

@end