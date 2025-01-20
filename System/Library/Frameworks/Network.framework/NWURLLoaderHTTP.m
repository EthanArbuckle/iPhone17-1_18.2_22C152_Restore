@interface NWURLLoaderHTTP
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (NWConcrete_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)errorForErrorCode:(id *)a1;
- (id)errorForNWError:(id *)a1;
- (id)initWithRequest:(unint64_t)a3 bodyKnownSize:(void *)a4 configuration:(void *)a5 queue:(void *)a6 client:;
- (id)responseFromMetadata:(uint64_t)a1;
- (id)takeCachedResponse;
- (uint64_t)pendingErrorIsRetryable;
- (void)addProgressObserverForResponseStallTimer;
- (void)cancelConnection;
- (void)configureAndStartConnection:(uint64_t)a1;
- (void)continueLoading;
- (void)finishRequest:(uint64_t)a1;
- (void)handleAuthenticationChallenge:(void *)a3 url:(uint64_t)a4 cancel:(void *)a5 completionHandler:;
- (void)handleAuthenticationChallengeResponse:(void *)a3 credential:(void *)a4 challenge:(void *)a5 response:(void *)a6 completionHandler:;
- (void)needRequestBody;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse;
- (void)readResponse:(id)a3;
- (void)restartStallTimer:(id)a3;
- (void)setConnection:(uint64_t)a1;
- (void)setPendingError:(uint64_t)a1;
- (void)setRequestBodyProvider:(uint64_t)a1;
- (void)start:(id)a3;
- (void)startResponseStallTimer;
- (void)stop;
- (void)stopResponseStallTimer;
- (void)updateClient:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
- (void)writeRequestBody;
@end

@implementation NWURLLoaderHTTP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustInternal, 0);
  objc_storeStrong((id *)&self->_trailerFieldsInternal, 0);
  objc_storeStrong((id *)&self->_httpConnectionMetadata, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_responseCompletionHandler, 0);
  objc_storeStrong((id *)&self->_multipartBoundary, 0);
  objc_storeStrong((id *)&self->_cachedResponseToStore, 0);
  objc_storeStrong((id *)&self->_cachedResponseFound, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestBodyProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)restartStallTimer:(id)a3
{
  if (self)
  {
    responseStallTimer = (NSObject **)self->_responseStallTimer;
    if (responseStallTimer)
    {
      dispatch_time_t v4 = dispatch_time(0x8000000000000000, 3000000000);
      v5 = *responseStallTimer;
      if (*responseStallTimer)
      {
        dispatch_source_set_timer(v5, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        responseStallTimer[4] = v4;
        responseStallTimer[5] = -1;
        if (*((unsigned char *)responseStallTimer + 48) && *((unsigned char *)responseStallTimer + 49))
        {
          nw_queue_source_run_timer((uint64_t)responseStallTimer);
        }
      }
    }
  }
}

- (NWConcrete_nw_connection)underlyingConnection
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_connection;
  }
  return (NWConcrete_nw_connection *)self;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
}

- (BOOL)allowsWrite
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_trailerFieldsInternal;
  }
  return (OS_nw_http_fields *)self;
}

- (id)takeCachedResponse
{
  if (self)
  {
    v3 = self->_cachedResponseToStore;
    cachedResponseToStore = self->_cachedResponseToStore;
    self->_cachedResponseToStore = 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)notifyRequestCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    id newValue = v4;
    if (self->_requestCompleteInternal) {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else {
      objc_setProperty_nonatomic_copy(self, (SEL)v4, v4, 136);
    }
    v5 = newValue;
  }
}

- (BOOL)requestComplete
{
  if (self) {
    LOBYTE(self) = self->_requestCompleteInternal;
  }
  return (char)self;
}

- (OS_sec_trust)peerTrust
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_peerTrustInternal;
  }
  return (OS_sec_trust *)self;
}

- (NSString)multipartMixedReplaceBoundary
{
  if (self) {
    self = (NWURLLoaderHTTP *)self->_multipartBoundary;
  }
  return (NSString *)self;
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  v9 = (void (**)(void, void, void, void))v8;
  if (!self)
  {
    connection = 0;
    goto LABEL_6;
  }
  if (!self->_pendingCompletion)
  {
    connection = self->_connection;
LABEL_6:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
    v14[3] = &unk_1E5248DC0;
    v14[4] = self;
    id v15 = v8;
    nw_connection_receive_internal(connection, 0, v6, v5, v14);

    goto LABEL_8;
  }
  if (self->_loadingFromCache)
  {
    v10 = self->_cachedResponseFound;
    v11 = [(NSCachedURLResponse *)v10 data];
    v12 = (void *)[v11 _createDispatchData];
    ((void (**)(void, void *, uint64_t, void))v9)[2](v9, v12, 1, 0);
  }
  else
  {
    (*((void (**)(id, void, uint64_t, void))v8 + 2))(v8, 0, 1, 0);
  }
LABEL_8:
}

void __85__NWURLLoaderHTTP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v9 = a2;
  context = a3;
  id v10 = a5;
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v40 = (id)gurlLogObj;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = *(void *)(a1 + 32);
      if (v41 && (id v42 = *(id *)(v41 + 48)) != 0)
      {
        v43 = v42;
        [v42 logDescription];
      }
      else
      {
        v43 = 0;
        v108[0] = 0;
        v108[1] = 0;
        int v109 = 0;
      }
      uint64_t v47 = *(void *)(a1 + 32);
      if (v47 && (id v48 = *(id *)(v47 + 48)) != 0)
      {
        v49 = v48;
        [v48 logDescription];
        int v50 = v107;
      }
      else
      {
        int v50 = 0;
        v49 = 0;
        uint64_t v105 = 0;
        uint64_t v106 = 0;
        int v107 = 0;
      }
      if (v9) {
        size_t size = dispatch_data_get_size(v9);
      }
      else {
        size_t size = 0;
      }
      *(_DWORD *)buf = 136447746;
      *(void *)&buf[4] = "-[NWURLLoaderHTTP readDataOfMinimumIncompleteLength:maximumLength:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = v108;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v50;
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = size;
      __int16 v111 = 1024;
      int v112 = a4;
      __int16 v113 = 2112;
      id v114 = v10;
      _os_log_impl(&dword_1830D4000, v40, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received body: %zu, complete: %{BOOL}d, error: %@", buf, 0x3Cu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11 && *(void *)(v11 + 144))
  {
    if (HTTPNotificationCenter_onceToken[0] != -1) {
      dispatch_once(HTTPNotificationCenter_onceToken, &__block_literal_global_209);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      uint64_t v13 = *(void *)(v12 + 144);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = (id)HTTPNotificationCenter_center;
    [v14 postNotificationName:@"NWURLLoaderHTTPConnectionProgressNotification" object:v13];
  }
  if (v10)
  {
    -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 32), v10);
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    if (!v101) {
      goto LABEL_13;
    }
    uint64_t v44 = *(void *)(a1 + 32);
    if (v44)
    {
      if (*(void *)(v44 + 88)) {
        goto LABEL_14;
      }
      id v45 = v101;
      v46 = *(void **)(v44 + 88);
      id v101 = v45;
      *(void *)(v44 + 88) = v45;
      goto LABEL_43;
    }
    uint64_t v16 = 0;
  }
  else
  {
    if (!a4)
    {
LABEL_13:
      id v101 = 0;
LABEL_14:
      uint64_t v16 = *(void *)(a1 + 32);
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      if (!*(unsigned char *)(v15 + 8)) {
        goto LABEL_13;
      }
      id v101 = 0;
      v46 = *(void **)(v15 + 88);
      *(void *)(v15 + 88) = 0;
LABEL_43:

      goto LABEL_14;
    }
    uint64_t v16 = 0;
    id v101 = 0;
  }
LABEL_15:
  if (v9)
  {
    if (v16)
    {
      v17 = *(void **)(v16 + 96);
      v18 = v9;
      if (v17)
      {
        v19 = (void *)v17[3];
        if (v19)
        {
          v20 = v18;
          v21 = v19;
          dispatch_data_t concat = dispatch_data_create_concat(v21, v20);
          v23 = (void *)v17[3];
          v17[3] = concat;

          v24 = v17[3];
          if (dispatch_data_get_size(v24) > v17[4])
          {
            v17[3] = 0;

            v25 = (void *)v17[5];
            v17[4] = 0;
            v17[5] = 0;
          }
        }
      }
    }
    else
    {
      v52 = v9;
    }

    uint64_t v16 = *(void *)(a1 + 32);
  }
  if (v16)
  {
    if (*(void *)(v16 + 88))
    {
      v26 = *(void **)(v16 + 96);
      if (v26)
      {
        v27 = (void *)v26[3];
        v26[3] = 0;

        v28 = (void *)v26[5];
        v26[4] = 0;
        v26[5] = 0;
      }
    }
  }
  if (!a4) {
    goto LABEL_71;
  }
  uint64_t v29 = *(void *)(a1 + 32);
  if (!v29)
  {
    v31 = 0;
LABEL_57:
    v38 = 0;
    goto LABEL_58;
  }
  v30 = (id *)*(id *)(v29 + 96);
  v31 = v30;
  if (!v30) {
    goto LABEL_57;
  }
  id v32 = v30[5];
  if (!v32) {
    goto LABEL_57;
  }
  BOOL v33 = v31[3] == 0;

  if (v33) {
    goto LABEL_57;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F18D20]);
  id v35 = v31[3];
  id v36 = v31[2];
  id v37 = v31[5];
  v38 = (void *)[v34 initWithResponse:v37 data:v35 userInfo:0 storagePolicy:v36];

  id v39 = v31[3];
  v31[3] = 0;

LABEL_58:
  uint64_t v53 = *(void *)(a1 + 32);
  if (v53) {
    objc_storeStrong((id *)(v53 + 112), v38);
  }

  if (context)
  {
    if (nw_protocol_copy_http_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_definition_onceToken, &__block_literal_global_15_74223);
    }
    v54 = (id)nw_protocol_copy_http_definition_http_definition;
    nw_protocol_metadata_t v55 = nw_content_context_copy_protocol_metadata(context, v54);

    if (v55)
    {
      id v56 = nw_http_metadata_copy_trailer_fields(v55);
      uint64_t v57 = *(void *)(a1 + 32);
      if (v57) {
        objc_storeStrong((id *)(v57 + 160), v56);
      }
    }
  }
  uint64_t v58 = *(void *)(a1 + 32);
  if (!v58) {
    goto LABEL_137;
  }
  v59 = (NWURLError *)*(id *)(v58 + 88);
  if (v59)
  {
LABEL_70:

    goto LABEL_71;
  }
  uint64_t v62 = *(void *)(a1 + 32);
  if (v62) {
    v63 = *(void **)(v62 + 48);
  }
  else {
LABEL_137:
  }
    v63 = 0;
  v64 = [v63 clientMetadata];
  BOOL v65 = v64 == 0;

  if (v65) {
    goto LABEL_71;
  }
  uint64_t v66 = *(void *)(a1 + 32);
  if (v66) {
    v67 = *(void **)(v66 + 48);
  }
  else {
    v67 = 0;
  }
  v68 = [v67 clientMetadata];
  v59 = (NWURLError *)v68;
  if (!v68)
  {
    v87 = __nwlog_obj();
    *(_DWORD *)v115 = 136446210;
    *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
    v88 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v103 = 0;
    if (!__nwlog_fault(v88, &type, &v103)) {
      goto LABEL_133;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v89 = __nwlog_obj();
      os_log_type_t v90 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v90, "%{public}s called with null metadata", v115, 0xCu);
      }
    }
    else if (v103)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v89 = __nwlog_obj();
      os_log_type_t v94 = type;
      BOOL v95 = os_log_type_enabled(v89, type);
      if (backtrace_string)
      {
        if (v95)
        {
          *(_DWORD *)v115 = 136446466;
          *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
          *(_WORD *)&v115[12] = 2082;
          *(void *)&v115[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v89, v94, "%{public}s called with null metadata, dumping backtrace:%{public}s", v115, 0x16u);
        }

        free(backtrace_string);
LABEL_133:
        if (!v88)
        {
LABEL_135:

          goto LABEL_70;
        }
LABEL_134:
        free(v88);
        goto LABEL_135;
      }
      if (v95)
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v94, "%{public}s called with null metadata, no backtrace", v115, 0xCu);
      }
    }
    else
    {
      v89 = __nwlog_obj();
      os_log_type_t v99 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v99, "%{public}s called with null metadata, backtrace limit exceeded", v115, 0xCu);
      }
    }
LABEL_132:

    goto LABEL_133;
  }
  v69 = nw_protocol_metadata_copy_definition(v68);
  if (nw_protocol_copy_http_client_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
  }
  BOOL is_equal = nw_protocol_definition_is_equal(v69, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

  if (!is_equal)
  {
    v91 = __nwlog_obj();
    *(_DWORD *)v115 = 136446210;
    *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
    v88 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v103 = 0;
    if (!__nwlog_fault(v88, &type, &v103)) {
      goto LABEL_133;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v89 = __nwlog_obj();
      os_log_type_t v92 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v92, "%{public}s metadata must be http_client", v115, 0xCu);
      }
    }
    else if (v103)
    {
      v96 = (char *)__nw_create_backtrace_string();
      v89 = __nwlog_obj();
      os_log_type_t v97 = type;
      BOOL v98 = os_log_type_enabled(v89, type);
      if (v96)
      {
        if (v98)
        {
          *(_DWORD *)v115 = 136446466;
          *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
          *(_WORD *)&v115[12] = 2082;
          *(void *)&v115[14] = v96;
          _os_log_impl(&dword_1830D4000, v89, v97, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", v115, 0x16u);
        }

        free(v96);
        if (!v88) {
          goto LABEL_135;
        }
        goto LABEL_134;
      }
      if (v98)
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v97, "%{public}s metadata must be http_client, no backtrace", v115, 0xCu);
      }
    }
    else
    {
      v89 = __nwlog_obj();
      os_log_type_t v100 = type;
      if (os_log_type_enabled(v89, type))
      {
        *(_DWORD *)v115 = 136446210;
        *(void *)&v115[4] = "nw_http_client_metadata_get_client_error";
        _os_log_impl(&dword_1830D4000, v89, v100, "%{public}s metadata must be http_client, backtrace limit exceeded", v115, 0xCu);
      }
    }
    goto LABEL_132;
  }
  *(void *)v115 = 0;
  *(void *)&v115[8] = v115;
  int v116 = 0;
  *(void *)&v115[16] = 0x2020000000;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __nw_http_client_metadata_get_client_error_block_invoke;
  *(void *)&buf[24] = &unk_1E5248E90;
  *(void *)&buf[32] = v115;
  uint64_t userInfo = (uint64_t)v59->super._userInfo;
  if (userInfo)
  {
    __nw_http_client_metadata_get_client_error_block_invoke((uint64_t)buf, userInfo);
    v72 = (int *)(*(void *)&v115[8] + 24);
  }
  else
  {
    v72 = &v116;
  }
  int v73 = *v72;
  _Block_object_dispose(v115, 8);

  if ((v73 - 1) < 2)
  {
    v74 = *(id **)(a1 + 32);
    if (v74)
    {
      v59 = [NWURLError alloc];
      v75 = [v74[6] loaderTask];
      v76 = v74;
      id v77 = v75;
      if (v59)
      {
        uint64_t v78 = *MEMORY[0x1E4F289A0];
        *(void *)buf = v59;
        *(void *)&buf[8] = NWURLError;
        v79 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v78, -1013, 0);
        v59 = v79;
        if (v79) {
          [(NWURLError *)v79 fillErrorForLoader:v76 andTask:v77];
        }
      }

      uint64_t v80 = *(void *)(a1 + 32);
      if (!v80) {
        goto LABEL_70;
      }
      goto LABEL_92;
    }
    goto LABEL_140;
  }
  if (v73 == 3)
  {
    v81 = *(id **)(a1 + 32);
    if (v81)
    {
      v59 = [NWURLError alloc];
      v82 = [v81[6] loaderTask];
      v83 = v81;
      id v84 = v82;
      if (v59)
      {
        uint64_t v85 = *MEMORY[0x1E4F289A0];
        *(void *)buf = v59;
        *(void *)&buf[8] = NWURLError;
        v86 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v85, -1012, 0);
        v59 = v86;
        if (v86) {
          [(NWURLError *)v86 fillErrorForLoader:v83 andTask:v84];
        }
      }

      uint64_t v80 = *(void *)(a1 + 32);
      if (!v80) {
        goto LABEL_70;
      }
LABEL_92:
      objc_storeStrong((id *)(v80 + 88), v59);
      goto LABEL_70;
    }
LABEL_140:
    v59 = 0;
    goto LABEL_70;
  }
LABEL_71:
  uint64_t v60 = *(void *)(a1 + 32);
  if (v60) {
    uint64_t v61 = *(void *)(v60 + 88);
  }
  else {
    uint64_t v61 = 0;
  }
  (*(void (**)(void, NSObject *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, a4, v61);
}

- (void)setPendingError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)errorForNWError:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = [NWURLError alloc];
    unsigned int v5 = [v2[6] loaderTask];
    v2 = (id *)-[NWURLError initWithNWError:forLoader:andTask:](v4, v3, v2, v5);
  }

  return v2;
}

- (void)readResponse:(id)a3
{
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, a2, a3, 128);
    -[NWURLLoaderHTTP readResponse]((uint64_t)self);
  }
}

- (void)readResponse
{
  if (a1)
  {
    v2 = *(void **)(a1 + 128);
    if (v2)
    {
      if (*(unsigned char *)(a1 + 11))
      {
        id v12 = v2;
        objc_setProperty_nonatomic_copy((id)a1, v3, 0, 128);
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, *(void *)(a1 + 88));
      }
      else
      {
        if (!*(unsigned char *)(a1 + 14) || *(unsigned char *)(a1 + 15))
        {
          id v4 = *(id *)(a1 + 72);
          unsigned int v5 = *(void **)(a1 + 72);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __31__NWURLLoaderHTTP_readResponse__block_invoke;
          v13[3] = &unk_1E5248D98;
          id v14 = v4;
          uint64_t v15 = a1;
          id v6 = v4;
          nw_connection_receive_internal(v5, 0, 0, 0, v13);

          return;
        }
        id v12 = v2;
        objc_setProperty_nonatomic_copy((id)a1, v7, 0, 128);
        *(unsigned char *)(a1 + 11) = 1;
        *(unsigned char *)(a1 + 16) = 1;
        id v8 = (void (**)(void))*(id *)(a1 + 136);
        objc_setProperty_nonatomic_copy((id)a1, v9, 0, 136);
        if (v8) {
          v8[2](v8);
        }

        id v10 = *(id *)(a1 + 104);
        uint64_t v11 = [v10 response];
        (*((void (**)(id, void *, void))v12 + 2))(v12, v11, 0);
      }
    }
  }
}

void __31__NWURLLoaderHTTP_readResponse__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v125 = a2;
  context = a3;
  id v9 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v10)
  {
    if (v11) {
      goto LABEL_73;
    }
    goto LABEL_164;
  }
  if (v11 == *(void *)(v10 + 72))
  {
    id v12 = *(void **)(v10 + 128);
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = *(void **)(a1 + 40);
      if (v15)
      {
        objc_setProperty_nonatomic_copy(v15, v13, 0, 128);
        uint64_t v16 = *(void *)(a1 + 40);
        if (v16)
        {
          *(unsigned char *)(v16 + 10) = 1;
          uint64_t v15 = *(void **)(a1 + 40);
        }
        else
        {
          uint64_t v15 = 0;
        }
      }
      -[NWURLLoaderHTTP stopResponseStallTimer]((uint64_t)v15);
      uint64_t v17 = *(void *)(a1 + 40);
      if (v17 && *(void *)(v17 + 144))
      {
        if (HTTPNotificationCenter_onceToken[0] != -1) {
          dispatch_once(HTTPNotificationCenter_onceToken, &__block_literal_global_209);
        }
        uint64_t v18 = *(void *)(a1 + 40);
        if (v18) {
          uint64_t v19 = *(void *)(v18 + 144);
        }
        else {
          uint64_t v19 = 0;
        }
        id v20 = (id)HTTPNotificationCenter_center;
        [v20 postNotificationName:@"NWURLLoaderHTTPConnectionProgressNotification" object:v19];
      }
      v126 = v9;
      if (!v9)
      {
        if (a4)
        {
          uint64_t v21 = *(void *)(a1 + 40);
          if (v21)
          {
            if (*(unsigned char *)(v21 + 8))
            {
              objc_storeStrong((id *)(v21 + 88), 0);
              id v9 = 0;
            }
          }
        }
      }
      if (context)
      {
        if (nw_protocol_copy_http_definition_onceToken != -1) {
          dispatch_once(&nw_protocol_copy_http_definition_onceToken, &__block_literal_global_15_74223);
        }
        v22 = (id)nw_protocol_copy_http_definition_http_definition;
        nw_protocol_metadata_t v23 = nw_content_context_copy_protocol_metadata(context, v22);

        nw_protocol_metadata_t v124 = v23;
        v24 = -[NWURLLoaderHTTP responseFromMetadata:](*(void *)(a1 + 40), v23);
        if (gLogDatapath)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
          }
          uint64_t v85 = (id)gurlLogObj;
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v86 = *(void *)(a1 + 40);
            if (v86 && (id v87 = *(id *)(v86 + 48)) != 0)
            {
              v88 = v87;
              [v87 logDescription];
            }
            else
            {
              v88 = 0;
              v133[0] = 0;
              v133[1] = 0;
              int v134 = 0;
            }
            uint64_t v105 = *(void *)(a1 + 40);
            if (v105 && (id v106 = *(id *)(v105 + 48)) != 0)
            {
              int v107 = v106;
              [v106 logDescription];
              int v108 = v132;
            }
            else
            {
              int v108 = 0;
              int v107 = 0;
              uint64_t v130 = 0;
              uint64_t v131 = 0;
              int v132 = 0;
            }
            *(_DWORD *)v135 = 136447746;
            *(void *)&v135[4] = "-[NWURLLoaderHTTP readResponse]_block_invoke";
            *(_WORD *)&v135[12] = 1042;
            *(_DWORD *)&v135[14] = 16;
            *(_WORD *)&v135[18] = 2098;
            *(void *)&v135[20] = v133;
            *(_WORD *)&v135[28] = 1024;
            *(_DWORD *)&v135[30] = v108;
            *(_WORD *)&v135[34] = 2112;
            *(void *)&v135[36] = v24;
            __int16 v136 = 1024;
            int v137 = a4;
            __int16 v138 = 2112;
            v139 = v126;
            _os_log_impl(&dword_1830D4000, v85, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received response: %@, complete: %{BOOL}d, error: %@", v135, 0x3Cu);
          }
        }
        if ((unint64_t)([v24 statusCode] - 100) <= 0x63 && objc_msgSend(v24, "statusCode") != 101)
        {
          uint64_t v38 = *(void *)(a1 + 40);
          if (v38) {
            id v39 = *(void **)(v38 + 48);
          }
          else {
            id v39 = 0;
          }
          [v39 loaderDidReceiveInformationalResponse:v24];
          uint64_t v41 = *(void **)(a1 + 40);
          if (v41)
          {
            objc_setProperty_nonatomic_copy(v41, v40, v14, 128);
            uint64_t v41 = *(void **)(a1 + 40);
          }
          -[NWURLLoaderHTTP readResponse](v41);
          goto LABEL_71;
        }
        uint64_t v25 = *(void *)(a1 + 40);
        if (v25) {
          v26 = *(void **)(v25 + 48);
        }
        else {
          v26 = 0;
        }
        v27 = [v26 clientMetadata];
        p_isa = &v27->isa;
        if (v27)
        {
          uint64_t v29 = nw_protocol_metadata_copy_definition(v27);
          if (nw_protocol_copy_http_client_definition_onceToken != -1) {
            dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
          }
          BOOL is_equal = nw_protocol_definition_is_equal(v29, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

          if (is_equal)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            uint64_t v146 = 0;
            *(void *)v135 = MEMORY[0x1E4F143A8];
            *(void *)&v135[8] = 3221225472;
            *(void *)&v135[16] = __nw_http_client_metadata_get_sniffed_media_type_block_invoke;
            *(void *)&v135[24] = &unk_1E5248E90;
            *(void *)&v135[32] = buf;
            uint64_t v31 = p_isa[4];
            if (v31)
            {
              __nw_http_client_metadata_get_sniffed_media_type_block_invoke((uint64_t)v135, v31);
              uint64_t v32 = *(void *)(*(void *)&buf[8] + 24);
            }
            else
            {
              uint64_t v32 = 0;
            }
            _Block_object_dispose(buf, 8);

            if (!v32)
            {
LABEL_37:
              if (v126)
              {
                uint64_t v93 = -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v126);
              }
              else
              {
                if (v24)
                {
                  BOOL v33 = 0;
                  goto LABEL_40;
                }
                uint64_t v93 = -[NWURLLoaderHTTP errorForErrorCode:](*(id **)(a1 + 40), -1005);
              }
              BOOL v33 = (void *)v93;
              if (v93)
              {
                uint64_t v96 = *(void *)(a1 + 40);
                if (v96)
                {
                  uint64_t v98 = *(void *)(v96 + 88);
                  os_log_type_t v97 = (id *)(v96 + 88);
                  if (!v98) {
                    objc_storeStrong(v97, v33);
                  }
                }
              }
LABEL_40:
              BOOL v34 = (a4 & 1) != 0 || [v24 statusCode] == 101;
              uint64_t v35 = *(void *)(a1 + 40);
              if (!v35) {
                goto LABEL_165;
              }
              *(unsigned char *)(v35 + 11) = v34;
              uint64_t v36 = *(void *)(a1 + 40);
              if (!v36) {
                goto LABEL_165;
              }
              if (!*(unsigned char *)(v36 + 13))
              {
LABEL_55:
                v43 = *(unsigned char **)(a1 + 40);
                if (!v43 || !v43[15])
                {
LABEL_63:
                  id v48 = objc_msgSend(v43, "multipartMixedReplaceBoundary", v120, v121);
                  BOOL v49 = v48 == 0;

                  uint64_t v50 = *(void *)(a1 + 40);
                  if (!v49)
                  {
                    if (!v50) {
                      goto LABEL_168;
                    }
                    v51 = *(void **)(v50 + 96);
                    if (!v51)
                    {
LABEL_68:
                      uint64_t v54 = *(void *)(v50 + 88);
LABEL_69:
                      (*((void (**)(id, void *, uint64_t))v14 + 2))(v14, v24, v54);
LABEL_70:

LABEL_71:
LABEL_72:

                      id v9 = v126;
                      goto LABEL_73;
                    }
                    v52 = (void *)v51[3];
                    v51[3] = 0;

                    uint64_t v53 = (void *)v51[5];
                    v51[4] = 0;
                    v51[5] = 0;

                    uint64_t v50 = *(void *)(a1 + 40);
                  }
                  if (v50) {
                    goto LABEL_68;
                  }
LABEL_168:
                  uint64_t v54 = 0;
                  goto LABEL_69;
                }
                if ([v24 statusCode] == 304)
                {
                  uint64_t v44 = *(void **)(a1 + 40);
                  if (v44) {
                    uint64_t v44 = (void *)v44[13];
                  }
                  id v45 = v44;
                  v46 = [v45 response];
                  (*((void (**)(id, void *, void))v14 + 2))(v14, v46, 0);

                  goto LABEL_70;
                }
                uint64_t v47 = *(void *)(a1 + 40);
                if (v47)
                {
                  *(unsigned char *)(v47 + 14) = 0;
                  v43 = *(unsigned char **)(a1 + 40);
                  goto LABEL_63;
                }
LABEL_165:
                v43 = 0;
                goto LABEL_63;
              }
              id v37 = *(id *)(v36 + 88);
              if (v37)
              {
LABEL_47:

                goto LABEL_55;
              }
              uint64_t v42 = *(void *)(a1 + 40);
              if (v42)
              {
                if (*(unsigned char *)(v42 + 15)) {
                  goto LABEL_55;
                }
                nw_protocol_metadata_t v55 = *(void **)(v42 + 48);
              }
              else
              {
                nw_protocol_metadata_t v55 = 0;
              }
              id v56 = objc_msgSend(v55, "loaderDataTask", v120, v121);
              uint64_t v57 = *(void *)(a1 + 40);
              if (v57)
              {
                uint64_t v58 = *(void **)(v57 + 96);
                v59 = *(void **)(v57 + 24);
              }
              else
              {
                uint64_t v58 = 0;
                v59 = 0;
              }
              id v60 = v58;
              id v122 = v59;
              id v123 = v24;
              id v37 = v56;
              if (!v60)
              {
LABEL_101:

                goto LABEL_47;
              }
              *((void *)v60 + 2) = 0;
              objc_storeStrong((id *)v60 + 7, v59);
              objc_storeStrong((id *)v60 + 5, v24);
              objc_storeStrong((id *)v60 + 6, v56);
              objc_storeStrong((id *)v60 + 3, MEMORY[0x1E4F14410]);
              unint64_t v61 = *((void *)v60 + 2);
              if (v61)
              {
                if (v61 != 1)
                {
                  unint64_t v61 = 0;
                  goto LABEL_85;
                }
                id v62 = *((id *)v60 + 1);
                unint64_t v63 = [v62 memoryCapacity];
                [*((id *)v60 + 1) _maxCacheableEntrySizeRatio];
                double v65 = v64;

                unint64_t v61 = (unint64_t)(v65 * (double)v63);
              }
              id v66 = *((id *)v60 + 1);
              unint64_t v67 = [v66 diskCapacity];
              [*((id *)v60 + 1) _maxCacheableEntrySizeRatio];
              double v69 = v68;

              double v70 = v69 * (double)v67;
              if (v61 <= (unint64_t)v70) {
                unint64_t v61 = (unint64_t)v70;
              }
LABEL_85:
              *((void *)v60 + 4) = v61;
              uint64_t v71 = [*((id *)v60 + 5) statusCode];
              if (v71 <= 300)
              {
                if (v71 != 200 && v71 != 203) {
                  goto LABEL_100;
                }
              }
              else if (((unint64_t)(v71 - 301) > 7 || ((1 << (v71 - 45)) & 0x89) == 0) {
                     && v71 != 410
              }
                     && v71 != 404)
              {
                goto LABEL_100;
              }
              v72 = [*((id *)v60 + 5) valueForHTTPHeaderField:@"Cache-Control"];
              int v73 = v72;
              if (!v72 || ([v72 rangeOfString:@"no-store" options:1], !v74))
              {
                v75 = [*((id *)v60 + 7) valueForHTTPHeaderField:@"Cache-Control"];
                v76 = v75;
                if (!v75
                  || ([v75 rangeOfString:@"no-store" options:1], !v77)
                  && ([v76 rangeOfString:@"no-cache" options:1], !v78))
                {

                  if ([v123 expectedContentLength] <= (uint64_t)v61) {
                    goto LABEL_101;
                  }
                  goto LABEL_100;
                }
              }
LABEL_100:
              v79 = (void *)*((void *)v60 + 3);
              *((void *)v60 + 3) = 0;

              uint64_t v80 = (void *)*((void *)v60 + 5);
              *((void *)v60 + 4) = 0;
              *((void *)v60 + 5) = 0;

              goto LABEL_101;
            }
            p_isa = [NSString stringWithUTF8String:v32];
            [v24 _setMIMEType:p_isa];
LABEL_36:

            goto LABEL_37;
          }
          os_log_type_t v94 = __nwlog_obj();
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
          LODWORD(v121) = 12;
          v120 = buf;
          os_log_type_t v90 = (char *)_os_log_send_and_compose_impl();

          os_log_type_t type = OS_LOG_TYPE_ERROR;
          char v128 = 0;
          if (__nwlog_fault(v90, &type, &v128))
          {
            if (type == OS_LOG_TYPE_FAULT)
            {
              v91 = __nwlog_obj();
              os_log_type_t v95 = type;
              if (os_log_type_enabled(v91, type))
              {
                *(_DWORD *)buf = 136446210;
                *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                _os_log_impl(&dword_1830D4000, v91, v95, "%{public}s metadata must be http_client", buf, 0xCu);
              }
            }
            else if (v128)
            {
              backtrace_string = (char *)__nw_create_backtrace_string();
              v91 = __nwlog_obj();
              os_log_type_t v103 = type;
              BOOL v104 = os_log_type_enabled(v91, type);
              if (backtrace_string)
              {
                if (v104)
                {
                  *(_DWORD *)buf = 136446466;
                  *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                  *(_WORD *)&buf[12] = 2082;
                  *(void *)&buf[14] = backtrace_string;
                  _os_log_impl(&dword_1830D4000, v91, v103, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", buf, 0x16u);
                }

                free(backtrace_string);
                if (!v90) {
                  goto LABEL_162;
                }
                goto LABEL_161;
              }
              if (v104)
              {
                *(_DWORD *)buf = 136446210;
                *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                _os_log_impl(&dword_1830D4000, v91, v103, "%{public}s metadata must be http_client, no backtrace", buf, 0xCu);
              }
            }
            else
            {
              v91 = __nwlog_obj();
              os_log_type_t v110 = type;
              if (os_log_type_enabled(v91, type))
              {
                *(_DWORD *)buf = 136446210;
                *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
                _os_log_impl(&dword_1830D4000, v91, v110, "%{public}s metadata must be http_client, backtrace limit exceeded", buf, 0xCu);
              }
            }
            goto LABEL_159;
          }
LABEL_160:
          if (!v90)
          {
LABEL_162:

            goto LABEL_36;
          }
LABEL_161:
          free(v90);
          goto LABEL_162;
        }
        v89 = __nwlog_obj();
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
        LODWORD(v121) = 12;
        v120 = buf;
        os_log_type_t v90 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v128 = 0;
        if (!__nwlog_fault(v90, &type, &v128)) {
          goto LABEL_160;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          v91 = __nwlog_obj();
          os_log_type_t v92 = type;
          if (os_log_type_enabled(v91, type))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
            _os_log_impl(&dword_1830D4000, v91, v92, "%{public}s called with null metadata", buf, 0xCu);
          }
        }
        else if (v128)
        {
          os_log_type_t v99 = (char *)__nw_create_backtrace_string();
          v91 = __nwlog_obj();
          os_log_type_t v100 = type;
          BOOL v101 = os_log_type_enabled(v91, type);
          if (v99)
          {
            if (v101)
            {
              *(_DWORD *)buf = 136446466;
              *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v99;
              _os_log_impl(&dword_1830D4000, v91, v100, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v99);
            goto LABEL_160;
          }
          if (v101)
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
            _os_log_impl(&dword_1830D4000, v91, v100, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          v91 = __nwlog_obj();
          os_log_type_t v109 = type;
          if (os_log_type_enabled(v91, type))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = "nw_http_client_metadata_get_sniffed_media_type";
            _os_log_impl(&dword_1830D4000, v91, v109, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
          }
        }
LABEL_159:

        goto LABEL_160;
      }
      uint64_t v81 = *(void *)(a1 + 40);
      if (v81)
      {
        v82 = *(id *)(v81 + 88);
        if (v82)
        {
LABEL_175:
          if (gLogDatapath)
          {
            __int16 v111 = v82;
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
            }
            int v112 = (id)gurlLogObj;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v113 = *(void *)(a1 + 40);
              if (v113 && (id v114 = *(id *)(v113 + 48)) != 0)
              {
                v115 = v114;
                [v114 logDescription];
              }
              else
              {
                v115 = 0;
                v143[0] = 0;
                v143[1] = 0;
                int v144 = 0;
              }
              uint64_t v116 = *(void *)(a1 + 40);
              if (v116 && (id v117 = *(id *)(v116 + 48)) != 0)
              {
                v118 = v117;
                [v117 logDescription];
                int v119 = v142;
              }
              else
              {
                int v119 = 0;
                v118 = 0;
                uint64_t v140 = 0;
                uint64_t v141 = 0;
                int v142 = 0;
              }
              *(_DWORD *)v135 = 136447234;
              *(void *)&v135[4] = "-[NWURLLoaderHTTP readResponse]_block_invoke";
              *(_WORD *)&v135[12] = 1042;
              *(_DWORD *)&v135[14] = 16;
              *(_WORD *)&v135[18] = 2098;
              *(void *)&v135[20] = v143;
              *(_WORD *)&v135[28] = 1024;
              *(_DWORD *)&v135[30] = v119;
              *(_WORD *)&v135[34] = 2112;
              *(void *)&v135[36] = v126;
              _os_log_impl(&dword_1830D4000, v112, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received no response with error: %@", v135, 0x2Cu);
            }
            v82 = v111;
          }
          nw_protocol_metadata_t v124 = v82;
          (*((void (**)(id, void, NSObject *))v14 + 2))(v14, 0, v82);
          goto LABEL_72;
        }
        v83 = *(id **)(a1 + 40);
        if (v9) {
          goto LABEL_107;
        }
      }
      else
      {
        v83 = 0;
        if (v9)
        {
LABEL_107:
          uint64_t v84 = -[NWURLLoaderHTTP errorForNWError:](v83, v9);
LABEL_174:
          v82 = v84;
          goto LABEL_175;
        }
      }
      uint64_t v84 = -[NWURLLoaderHTTP errorForErrorCode:](v83, -1011);
      goto LABEL_174;
    }
LABEL_164:
    _os_crash();
    __break(1u);
  }
LABEL_73:
}

- (void)stopResponseStallTimer
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 152);
    if (v2)
    {
      nw_queue_cancel_source(v2);
      *(void *)(a1 + 152) = 0;
      if (*(void *)(a1 + 144))
      {
        if (HTTPNotificationCenter_onceToken[0] != -1) {
          dispatch_once(HTTPNotificationCenter_onceToken, &__block_literal_global_209);
        }
        uint64_t v3 = *(void *)(a1 + 144);
        id v4 = (id)HTTPNotificationCenter_center;
        [v4 removeObserver:a1 name:@"NWURLLoaderHTTPConnectionProgressNotification" object:v3];
      }
    }
  }
}

- (id)errorForErrorCode:(id *)a1
{
  if (a1)
  {
    id v4 = [NWURLError alloc];
    unsigned int v5 = [a1[6] loaderTask];
    id v6 = a1;
    id v7 = v5;
    if (v4)
    {
      uint64_t v8 = *MEMORY[0x1E4F289A0];
      v12.receiver = v4;
      v12.super_class = (Class)NWURLError;
      id v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v8, a2, 0);
      uint64_t v10 = v9;
      if (v9) {
        [v9 fillErrorForLoader:v6 andTask:v7];
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)responseFromMetadata:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    id v6 = nw_http_metadata_copy_response(v3);
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
      self;
      BOOL v34 = v8;
      if ((nw_http_response_get_status_code(v8) - 200) > 0x63)
      {
        v26 = 0;
      }
      else
      {
        uint64_t v36 = 0;
        id v37 = &v36;
        uint64_t v38 = 0x3032000000;
        id v39 = __Block_byref_object_copy__73379;
        v40 = __Block_byref_object_dispose__73380;
        id v41 = 0;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke;
        v35[3] = &unk_1E5248FD0;
        v35[4] = &v36;
        nw_http_fields_access_value_by_name(v8, (unint64_t)"Content-Type", v35);
        id v9 = (void *)v37[5];
        if (v9)
        {
          uint64_t v10 = [v9 componentsSeparatedByString:@";"];
          uint64_t v11 = [v10 objectAtIndexedSubscript:0];
          objc_super v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];
          int v14 = [v13 isEqualToString:@"multipart/x-mixed-replace"];
          BOOL v33 = v11;

          if (v14)
          {
            for (unint64_t i = 1; i < [v10 count]; ++i)
            {
              uint64_t v16 = [v10 objectAtIndexedSubscript:i];
              uint64_t v17 = [v16 rangeOfString:@"="];
              if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v18 = [v16 substringToIndex:v17];
                uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                id v20 = [v18 stringByTrimmingCharactersInSet:v19];

                uint64_t v21 = [v16 substringFromIndex:v17 + 1];
                v22 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                nw_protocol_metadata_t v23 = [v21 stringByTrimmingCharactersInSet:v22];

                if ([v20 isEqualToString:@"boundary"])
                {
                  v24 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                  uint64_t v25 = [v23 stringByTrimmingCharactersInSet:v24];
                  v26 = (void *)[v25 mutableCopy];

                  if ((unint64_t)[v26 length] >= 2
                    && [v26 hasPrefix:@"\""]
                    && [v26 hasSuffix:@"\""])
                  {
                    objc_msgSend(v26, "deleteCharactersInRange:", 0, 1);
                    objc_msgSend(v26, "deleteCharactersInRange:", objc_msgSend(v26, "length") - 1, 1);
                  }

                  goto LABEL_21;
                }
              }
            }
          }
          v26 = 0;
LABEL_21:
        }
        else
        {
          v26 = 0;
        }
        _Block_object_dispose(&v36, 8);
      }
      v27 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v26;

      int version = nw_http_metadata_get_version(v4);
      id v29 = *(id *)(a1 + 24);
      BOOL v5 = nw_http_response_copy_url_response(v34, 0, v29, **((void ***)&unk_1E524BDF0 + version));

      v30 = [*(id *)(a1 + 48) clientMetadata];
      id v31 = nw_http_client_metadata_copy_current_transaction_metadata(v30);

      nw_http_transaction_metadata_set_converted_url_response(v31, v5);
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return (id)v5;
}

void __61__NWURLLoaderHTTP_multipartMixedReplaceBoundaryFromResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [NSString stringWithUTF8String:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (void)updateClient:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_client, a3);
  }
}

- (void)stop
{
  -[NWURLLoaderHTTP stopResponseStallTimer]((uint64_t)self);
  -[NWURLLoaderHTTP cancelConnection]((uint64_t)self);
  if (self)
  {
    connection = self->_connection;
    self->_connection = 0;

    [(NWURLSessionRequestBodyProvider *)self->_requestBodyProvider close];
    requestBodyProvider = self->_requestBodyProvider;
    self->_requestBodyProvider = 0;

    client = self->_client;
    self->_client = 0;

    configuration = self->_configuration;
    self->_configuration = 0;

    pendingError = self->_pendingError;
    self->_pendingError = 0;

    uint64_t v17 = (void (**)(id, void, NWURLError *))self->_responseCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v8, 0, 128);
    if (v17)
    {
      id v9 = [NWURLError alloc];
      uint64_t v10 = [(NWURLLoaderClient *)self->_client loaderTask];
      uint64_t v11 = self;
      id v12 = v10;
      if (v9)
      {
        uint64_t v13 = *MEMORY[0x1E4F289A0];
        v18.receiver = v9;
        v18.super_class = (Class)NWURLError;
        int v14 = [(NWURLLoaderHTTP *)&v18 initWithDomain:v13 code:-999 userInfo:0];
        id v9 = (NWURLError *)v14;
        if (v14) {
          [(NWURLLoaderHTTP *)v14 fillErrorForLoader:v11 andTask:v12];
        }
      }

      v17[2](v17, 0, v9);
    }
    uint64_t v15 = (void (**)(void))self->_requestCompletionHandler;
    objc_setProperty_nonatomic_copy(self, v16, 0, 136);
    if (v15)
    {
      v15[2](v15);
    }
  }
  else
  {
    [0 close];
    uint64_t v17 = 0;
  }
}

- (void)cancelConnection
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 12))
    {
      uint64_t v2 = *(void **)(a1 + 72);
      if (v2)
      {
        *(unsigned char *)(a1 + 12) = 1;
        id v3 = *(id *)(a1 + 40);
        id v4 = v2;
        id v5 = -[NWURLSessionTaskConfiguration activity]((uint64_t)v3);
        nw_connection_end_activity(v4, v5);

        id v6 = *(NSObject **)(a1 + 72);
        nw_connection_cancel(v6);
      }
    }
  }
}

- (void)start:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (bumpProcessFDLimit_onceToken == -1)
  {
    if (self)
    {
LABEL_3:
      client = self->_client;
      goto LABEL_4;
    }
  }
  else
  {
    dispatch_once(&bumpProcessFDLimit_onceToken, &__block_literal_global_207_73398);
    if (self) {
      goto LABEL_3;
    }
  }
  client = 0;
LABEL_4:
  id v6 = [(NWURLLoaderClient *)client loaderDataTask];

  if (v6)
  {
    if (self)
    {
      id v7 = self->_cache;
      SEL v8 = self->_request;
      id v9 = self->_configuration;
      uint64_t v10 = v9;
      if (v9) {
        BOOL v11 = [(NWURLSessionTask *)v9->_task _preconnect];
      }
      else {
        BOOL v11 = 0;
      }
      id v12 = self->_configuration;
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        if ([(NSURLRequest *)v12->_request _explicitlySetCachePolicy]) {
          uint64_t v14 = [p_isa[4] cachePolicy];
        }
        else {
          uint64_t v14 = [p_isa[2] requestCachePolicy];
        }
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v15 = 0;
      }
      SEL v16 = v8;
      uint64_t v17 = v16;
      if (v7 && v7->_cache)
      {
        objc_super v18 = [(NSURLRequest *)v16 HTTPMethod];
        uint64_t v19 = [v18 caseInsensitiveCompare:@"GET"];

        BOOL v20 = 0;
        if (!v19)
        {
          uint64_t v21 = v11 ? 1 : v15;
          if (v21 != 1 && v21 != 4)
          {
            v22 = [(NSURLRequest *)v17 valueForHTTPHeaderField:@"Range"];
            BOOL v20 = v22 == 0;
          }
        }
      }
      else
      {
        BOOL v20 = 0;
      }

      self->_allowCaching = v20;
    }
    else
    {
      p_isa = 0;
      uint64_t v10 = 0;
      id v7 = 0;
      uint64_t v17 = 0;
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__NWURLLoaderHTTP_start___block_invoke;
    aBlock[3] = &unk_1E52489D0;
    aBlock[4] = self;
    nw_protocol_metadata_t v23 = _Block_copy(aBlock);
    v24 = v23;
    if (self && self->_allowCaching)
    {
      uint64_t v25 = self->_client;
      v26 = [(NWURLLoaderClient *)v25 loaderDataTask];

      v27 = self->_client;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __25__NWURLLoaderHTTP_start___block_invoke_2;
      v29[3] = &unk_1E5248A20;
      v29[4] = self;
      id v30 = v26;
      id v31 = v4;
      id v32 = v24;
      id v28 = v26;
      [(NWURLLoaderClient *)v27 loaderRunDelegateBlock:v29];
    }
    else
    {
      (*((void (**)(void *, void))v23 + 2))(v23, 0);
      v4[2](v4);
    }
  }
  else
  {
    -[NWURLLoaderHTTP continueLoading]((uint64_t)self);
    v4[2](v4);
  }
}

- (void)continueLoading
{
  uint64_t v434 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v4 = *(id *)(a1 + 24);
  id v5 = [v4 URL];
  uint64_t v6 = fixInvalidHTTPURL(v5);

  BOOL v7 = nw_endpoint_create_with_cfurl((const __CFURL *)v6);
  if (v7 && (id v8 = (id)v7, v9 = [v8 hostname], v8, v9))
  {
    v422[0] = MEMORY[0x1E4F143A8];
    uint64_t v2 = 3221225472;
    v422[1] = 3221225472;
    v422[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke;
    v422[3] = &unk_1E5248AC0;
    nw_endpoint_t endpoint = (nw_endpoint_t)v8;
    nw_endpoint_t v423 = endpoint;
    uint64_t v424 = a1;
    v421[0] = MEMORY[0x1E4F143A8];
    v421[1] = 3221225472;
    v421[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_6;
    v421[3] = &unk_1E5248AE8;
    v421[4] = a1;
    v420[0] = MEMORY[0x1E4F143A8];
    v420[1] = 3221225472;
    v420[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_7;
    v420[3] = &unk_1E5248AE8;
    v420[4] = a1;
    nw_parameters_t parameters = nw_parameters_create_secure_http_messaging(v422, &__block_literal_global_98, &__block_literal_global_73408, v421, v420);
    stack = nw_parameters_copy_default_protocol_stack(parameters);
    v1 = &qword_1E8F6A000;
    if (nw_protocol_copy_http_alt_svc_definition_onceToken == -1) {
      goto LABEL_5;
    }
  }
  else
  {
    _os_crash();
    __break(1u);
  }
  dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_20_74269);
LABEL_5:
  options = nw_protocol_create_options((void *)nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    uint64_t v12 = *(void *)(v11 + 24);
    if (v12)
    {
      id v13 = *(id *)(v12 + 400);
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)*((void *)v13 + 9);
        if (!v15)
        {
          SEL v16 = [*((id *)v13 + 12) _alternativeServicesStorage];
          uint64_t v17 = v16;
          if (v16)
          {
            objc_super v18 = v16;
            uint64_t v19 = objc_alloc_init(NWConcrete_nw_http_alt_svc_storage);
            storage = v19->storage;
            v19->storage = v18;

            uint64_t v21 = (void *)v14[9];
            v14[9] = v19;
          }
          uint64_t v15 = (void *)v14[9];
        }
        id v22 = v15;
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }
  nw_http_alt_svc_options_set_alt_svc_storage(options, v22);

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    char v24 = [*(id *)(v23 + 32) assumesHTTP3Capable];
  }
  else {
    char v24 = 0;
  }
  uint64_t v25 = options;
  protocol = &v25->super;
  if (!v25)
  {
    char v128 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v388) = 12;
    v387 = buf;
    v129 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v129, &v426, &v425)) {
      goto LABEL_306;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      uint64_t v130 = __nwlog_obj();
      os_log_type_t v131 = v426;
      if (os_log_type_enabled(v130, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v131, "%{public}s called with null options", buf, 0xCu);
      }
      goto LABEL_305;
    }
    if (!v425)
    {
      uint64_t v130 = __nwlog_obj();
      os_log_type_t v199 = v426;
      if (os_log_type_enabled(v130, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v199, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_305;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v130 = __nwlog_obj();
    os_log_type_t v135 = v426;
    BOOL v136 = os_log_type_enabled(v130, v426);
    if (!backtrace_string)
    {
      if (v136)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v135, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
      goto LABEL_305;
    }
    if (v136)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = backtrace_string;
      _os_log_impl(&dword_1830D4000, v130, v135, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_157;
  }
  v26 = v25;
  id v27 = v26[1];

  if (v1[42] != -1) {
    dispatch_once(&nw_protocol_copy_http_alt_svc_definition_onceToken, &__block_literal_global_20_74269);
  }
  BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v27, nw_protocol_copy_http_alt_svc_definition_http_alt_svc_definition);

  if (!is_equal_unsafe)
  {
    int v132 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
    LODWORD(v388) = 12;
    v387 = buf;
    v129 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v129, &v426, &v425)) {
      goto LABEL_306;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      uint64_t v130 = __nwlog_obj();
      os_log_type_t v133 = v426;
      if (os_log_type_enabled(v130, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v133, "%{public}s protocol options are not http_alt_svc", buf, 0xCu);
      }
LABEL_305:

LABEL_306:
      id v29 = protocol;
      if (v129) {
        free(v129);
      }
      goto LABEL_21;
    }
    if (!v425)
    {
      uint64_t v130 = __nwlog_obj();
      os_log_type_t v200 = v426;
      if (os_log_type_enabled(v130, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v200, "%{public}s protocol options are not http_alt_svc, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_305;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    uint64_t v130 = __nwlog_obj();
    os_log_type_t v137 = v426;
    BOOL v138 = os_log_type_enabled(v130, v426);
    if (!backtrace_string)
    {
      if (v138)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
        _os_log_impl(&dword_1830D4000, v130, v137, "%{public}s protocol options are not http_alt_svc, no backtrace", buf, 0xCu);
      }
      goto LABEL_305;
    }
    if (v138)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_alt_svc_options_set_assumes_http3_capable";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = backtrace_string;
      _os_log_impl(&dword_1830D4000, v130, v137, "%{public}s protocol options are not http_alt_svc, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_157:

    free(backtrace_string);
    goto LABEL_306;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = v2;
  *(void *)&buf[16] = __nw_http_alt_svc_options_set_assumes_http3_capable_block_invoke;
  *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
  BYTE8(v433) = v24;
  nw_protocol_options_access_handle(v26, buf);
  id v29 = protocol;
LABEL_21:

  nw_protocol_stack_prepend_application_protocol(stack, protocol);
  if (nw_protocol_copy_http_client_bottom_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_client_bottom_definition_onceToken, &__block_literal_global_79);
  }
  id v30 = nw_protocol_create_options((void *)nw_protocol_copy_http_client_bottom_definition_definition);
  nw_protocol_stack_prepend_application_protocol(stack, &v30->super);

  uint64_t v31 = *(void *)(a1 + 40);
  if (!v31) {
    goto LABEL_109;
  }
  uint64_t v32 = *(void *)(v31 + 24);
  if (!v32 || !*(unsigned char *)(v32 + 20))
  {
    if (*(void *)(v31 + 32)) {
      uint64_t v78 = (const void *)CFURLRequestCopyHTTPCookieStorage();
    }
    else {
      uint64_t v78 = 0;
    }
    v91 = objc_msgSend(MEMORY[0x1E4F18D30], "sharedHTTPCookieStorage", v387, v388);
    os_log_type_t v92 = v91;
    if (v78)
    {
      if (v78 != (const void *)[v91 _cookieStorage])
      {
        uint64_t v93 = (void *)[objc_alloc(MEMORY[0x1E4F18D30]) _initWithCFHTTPCookieStorage:v78];
        CFRelease(v78);
        os_log_type_t v94 = v93;
        os_log_type_t v95 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
        cookieStorage = v95->cookieStorage;
        v95->cookieStorage = v94;

        goto LABEL_108;
      }
      CFRelease(v78);
    }
    uint64_t v97 = *(void *)(v31 + 24);
    if (!v97) {
      goto LABEL_726;
    }
    uint64_t v98 = (NSHTTPCookieStorage *)*(id *)(v97 + 400);
    os_log_type_t v94 = v98;
    if (v98)
    {
      Class isa = v98[3].super.isa;
      if (!isa)
      {
        os_log_type_t v100 = [(objc_class *)v98[6].super.isa HTTPCookieStorage];
        BOOL v101 = v100;
        if (v100)
        {
          v102 = v100;
          os_log_type_t v103 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
          BOOL v104 = v103->cookieStorage;
          v103->cookieStorage = v102;

          Class v105 = v94[3].super.isa;
          v94[3].super.Class isa = (Class)v103;
        }
        Class isa = v94[3].super.isa;
      }
      os_log_type_t v95 = isa;
    }
    else
    {
      os_log_type_t v95 = 0;
    }
    goto LABEL_108;
  }
  BOOL v33 = (NWConcrete_nw_http_cookie_storage *)*(id *)(v32 + 432);
  if (!v33) {
    goto LABEL_109;
  }
LABEL_27:
  v403 = v33;
  if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
  }
  BOOL v34 = nw_protocol_create_options((void *)nw_protocol_copy_http_cookie_definition_http_cookie_definition);
  nw_http_cookie_options_set_cookie_storage(v34, v403);
  uint64_t v35 = *(void *)(a1 + 40);
  if (!v35)
  {
    v46 = 0;
    uint64_t v36 = 0;
    goto LABEL_47;
  }
  uint64_t v36 = [*(id *)(v35 + 24) _cookieTransformCallback];
  if (v36)
  {
    id v37 = v34;
    id v38 = v36;
    if (v37)
    {
      id v39 = v37;
      id v40 = v39[1];

      if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
      }
      BOOL v41 = nw_protocol_definition_is_equal_unsafe((uint64_t)v40, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

      if (v41)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = v2;
        *(void *)&buf[16] = __nw_http_cookie_options_set_transform_callback_block_invoke;
        *(void *)&long long v433 = &unk_1E5248ED8;
        *((void *)&v433 + 1) = v38;
        nw_protocol_options_access_handle(v39, buf);

LABEL_36:
        goto LABEL_37;
      }
      v155 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
      LODWORD(v388) = 12;
      v387 = buf;
      uint64_t v140 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v140, &v426, &v425)) {
        goto LABEL_370;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v156 = v426;
        if (os_log_type_enabled(v141, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v156, "%{public}s protocol options are not http_cookie", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v187 = (char *)__nw_create_backtrace_string();
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v188 = v426;
        BOOL v189 = os_log_type_enabled(v141, v426);
        if (v187)
        {
          if (v189)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v187;
            _os_log_impl(&dword_1830D4000, v141, v188, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v187);
          if (!v140) {
            goto LABEL_36;
          }
          goto LABEL_371;
        }
        if (v189)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v188, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v229 = v426;
        if (os_log_type_enabled(v141, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v229, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    else
    {
      v139 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
      LODWORD(v388) = 12;
      v387 = buf;
      uint64_t v140 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v140, &v426, &v425)) {
        goto LABEL_370;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v142 = v426;
        if (os_log_type_enabled(v141, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v142, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v175 = (char *)__nw_create_backtrace_string();
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v176 = v426;
        BOOL v177 = os_log_type_enabled(v141, v426);
        if (v175)
        {
          if (v177)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v175;
            _os_log_impl(&dword_1830D4000, v141, v176, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v175);
LABEL_370:
          if (!v140) {
            goto LABEL_36;
          }
LABEL_371:
          free(v140);
          goto LABEL_36;
        }
        if (v177)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v176, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v141 = __nwlog_obj();
        os_log_type_t v225 = v426;
        if (os_log_type_enabled(v141, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_transform_callback";
          _os_log_impl(&dword_1830D4000, v141, v225, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }

    goto LABEL_370;
  }
LABEL_37:
  uint64_t v42 = *(void *)(a1 + 40);
  if (!v42)
  {
    v46 = 0;
    goto LABEL_47;
  }
  v43 = [*(id *)(v42 + 24) _storagePartitionIdentifier];
  BOOL v44 = v43 == 0;

  if (v44) {
    goto LABEL_48;
  }
  uint64_t v45 = *(void *)(a1 + 40);
  if (v45)
  {
    v46 = [*(id *)(v45 + 24) _storagePartitionIdentifier];
  }
  else
  {
    v46 = 0;
  }
  uint64_t v47 = objc_msgSend(v46, "cStringUsingEncoding:", 4, v387, v388);
  id v48 = v34;
  BOOL v49 = v48;
  if (!v48)
  {
    v143 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
    LODWORD(v388) = 12;
    v387 = buf;
    int v144 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v144, &v426, &v425)) {
      goto LABEL_375;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v145 = __nwlog_obj();
      os_log_type_t v146 = v426;
      if (os_log_type_enabled(v145, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v146, "%{public}s called with null options", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v178 = (char *)__nw_create_backtrace_string();
      v145 = __nwlog_obj();
      os_log_type_t v179 = v426;
      BOOL v180 = os_log_type_enabled(v145, v426);
      if (v178)
      {
        if (v180)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v178;
          _os_log_impl(&dword_1830D4000, v145, v179, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v178);
LABEL_375:
        if (!v144) {
          goto LABEL_46;
        }
LABEL_376:
        free(v144);
        goto LABEL_46;
      }
      if (v180)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v179, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v145 = __nwlog_obj();
      os_log_type_t v226 = v426;
      if (os_log_type_enabled(v145, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v226, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_374:

    goto LABEL_375;
  }
  uint64_t v50 = v48;
  id v51 = v50[1];

  if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
  }
  BOOL v52 = nw_protocol_definition_is_equal_unsafe((uint64_t)v51, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

  if (!v52)
  {
    v157 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
    LODWORD(v388) = 12;
    v387 = buf;
    int v144 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v144, &v426, &v425)) {
      goto LABEL_375;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v145 = __nwlog_obj();
      os_log_type_t v158 = v426;
      if (os_log_type_enabled(v145, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v158, "%{public}s protocol options are not http_cookie", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v190 = (char *)__nw_create_backtrace_string();
      v145 = __nwlog_obj();
      os_log_type_t v191 = v426;
      BOOL v192 = os_log_type_enabled(v145, v426);
      if (v190)
      {
        if (v192)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v190;
          _os_log_impl(&dword_1830D4000, v145, v191, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v190);
        if (!v144) {
          goto LABEL_46;
        }
        goto LABEL_376;
      }
      if (v192)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v191, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v145 = __nwlog_obj();
      os_log_type_t v230 = v426;
      if (os_log_type_enabled(v145, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_cookie_partition_identifier";
        _os_log_impl(&dword_1830D4000, v145, v230, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
      }
    }
    goto LABEL_374;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = v2;
  *(void *)&buf[16] = __nw_http_cookie_options_set_cookie_partition_identifier_block_invoke;
  *(void *)&long long v433 = &__block_descriptor_40_e9_B16__0_v8l;
  *((void *)&v433 + 1) = v47;
  nw_protocol_options_access_handle(v50, buf);
LABEL_46:

LABEL_47:
LABEL_48:
  uint64_t v53 = *(void *)(a1 + 40);
  if (!v53) {
    goto LABEL_73;
  }
  if ([*(id *)(v53 + 32) _allowOnlyPartitionedCookies])
  {
    uint64_t v54 = v34;
    nw_protocol_metadata_t v55 = v54;
    if (v54)
    {
      id v56 = v54;
      id v57 = v56[1];

      if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
      }
      BOOL v58 = nw_protocol_definition_is_equal_unsafe((uint64_t)v57, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

      if (v58)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = v2;
        *(void *)&buf[16] = __nw_http_cookie_options_set_allow_only_partitioned_cookies_block_invoke;
        *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
        BYTE8(v433) = 1;
        nw_protocol_options_access_handle(v56, buf);
LABEL_55:

        goto LABEL_56;
      }
      v171 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
      LODWORD(v388) = 12;
      v387 = buf;
      v164 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v164, &v426, &v425)) {
        goto LABEL_396;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v165 = __nwlog_obj();
        os_log_type_t v172 = v426;
        if (os_log_type_enabled(v165, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v172, "%{public}s protocol options are not http_cookie", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v213 = (char *)__nw_create_backtrace_string();
        v165 = __nwlog_obj();
        os_log_type_t v214 = v426;
        BOOL v215 = os_log_type_enabled(v165, v426);
        if (v213)
        {
          if (v215)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v213;
            _os_log_impl(&dword_1830D4000, v165, v214, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v213);
          if (!v164) {
            goto LABEL_55;
          }
          goto LABEL_397;
        }
        if (v215)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v214, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v165 = __nwlog_obj();
        os_log_type_t v235 = v426;
        if (os_log_type_enabled(v165, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v235, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    else
    {
      v163 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
      LODWORD(v388) = 12;
      v387 = buf;
      v164 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v164, &v426, &v425)) {
        goto LABEL_396;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v165 = __nwlog_obj();
        os_log_type_t v166 = v426;
        if (os_log_type_enabled(v165, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v166, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v205 = (char *)__nw_create_backtrace_string();
        v165 = __nwlog_obj();
        os_log_type_t v206 = v426;
        BOOL v207 = os_log_type_enabled(v165, v426);
        if (v205)
        {
          if (v207)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v205;
            _os_log_impl(&dword_1830D4000, v165, v206, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v205);
LABEL_396:
          if (!v164) {
            goto LABEL_55;
          }
LABEL_397:
          free(v164);
          goto LABEL_55;
        }
        if (v207)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v206, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v165 = __nwlog_obj();
        os_log_type_t v233 = v426;
        if (os_log_type_enabled(v165, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_allow_only_partitioned_cookies";
          _os_log_impl(&dword_1830D4000, v165, v233, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }

    goto LABEL_396;
  }
LABEL_56:
  uint64_t v59 = *(void *)(a1 + 40);
  if (!v59) {
    goto LABEL_73;
  }
  id v60 = [*(id *)(v59 + 24) _siteForCookies];
  BOOL v61 = v60 == 0;

  if (v61) {
    goto LABEL_73;
  }
  uint64_t v62 = *(void *)(a1 + 40);
  if (v62)
  {
    unint64_t v63 = [*(id *)(v62 + 24) _siteForCookies];
  }
  else
  {
    unint64_t v63 = 0;
  }
  double v64 = v34;
  double v65 = v64;
  if (!v64)
  {
    uint64_t v147 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
    LODWORD(v388) = 12;
    v387 = buf;
    v148 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v148, &v426, &v425)) {
      goto LABEL_380;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v149 = __nwlog_obj();
      os_log_type_t v150 = v426;
      if (os_log_type_enabled(v149, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
        _os_log_impl(&dword_1830D4000, v149, v150, "%{public}s called with null options", buf, 0xCu);
      }
      goto LABEL_379;
    }
    if (!v425)
    {
      v149 = __nwlog_obj();
      os_log_type_t v227 = v426;
      if (os_log_type_enabled(v149, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
        _os_log_impl(&dword_1830D4000, v149, v227, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_379;
    }
    v181 = (char *)__nw_create_backtrace_string();
    v149 = __nwlog_obj();
    os_log_type_t v182 = v426;
    BOOL v183 = os_log_type_enabled(v149, v426);
    if (!v181)
    {
      if (v183)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
        _os_log_impl(&dword_1830D4000, v149, v182, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
      goto LABEL_379;
    }
    if (v183)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v181;
      _os_log_impl(&dword_1830D4000, v149, v182, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v181);
LABEL_380:
    if (!v148) {
      goto LABEL_65;
    }
    goto LABEL_381;
  }
  id v66 = v64;
  id v67 = v66[1];

  if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
  }
  BOOL v68 = nw_protocol_definition_is_equal_unsafe((uint64_t)v67, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

  if (v68)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = v2;
    *(void *)&buf[16] = __nw_http_cookie_options_set_site_for_cookies_block_invoke;
    *(void *)&long long v433 = &__block_descriptor_40_e9_B16__0_v8l;
    *((void *)&v433 + 1) = v63;
    nw_protocol_options_access_handle(v66, buf);
    goto LABEL_65;
  }
  v159 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
  LODWORD(v388) = 12;
  v387 = buf;
  v148 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v426 = OS_LOG_TYPE_ERROR;
  char v425 = 0;
  if (!__nwlog_fault(v148, &v426, &v425)) {
    goto LABEL_380;
  }
  if (v426 == OS_LOG_TYPE_FAULT)
  {
    v149 = __nwlog_obj();
    os_log_type_t v160 = v426;
    if (os_log_type_enabled(v149, v426))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
      _os_log_impl(&dword_1830D4000, v149, v160, "%{public}s protocol options are not http_cookie", buf, 0xCu);
    }
LABEL_379:

    goto LABEL_380;
  }
  if (!v425)
  {
    v149 = __nwlog_obj();
    os_log_type_t v231 = v426;
    if (os_log_type_enabled(v149, v426))
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
      _os_log_impl(&dword_1830D4000, v149, v231, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_379;
  }
  v193 = (char *)__nw_create_backtrace_string();
  v149 = __nwlog_obj();
  os_log_type_t v194 = v426;
  BOOL v195 = os_log_type_enabled(v149, v426);
  if (!v193)
  {
    if (v195)
    {
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
      _os_log_impl(&dword_1830D4000, v149, v194, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
    }
    goto LABEL_379;
  }
  if (v195)
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "nw_http_cookie_options_set_site_for_cookies";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v193;
    _os_log_impl(&dword_1830D4000, v149, v194, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v193);
  if (v148) {
LABEL_381:
  }
    free(v148);
LABEL_65:

  uint64_t v69 = *(void *)(a1 + 40);
  if (v69) {
    char v70 = [*(id *)(v69 + 24) _isTopLevelNavigation];
  }
  else {
    char v70 = 0;
  }
  uint64_t v71 = v65;
  v72 = v71;
  if (!v65)
  {
    v151 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
    LODWORD(v388) = 12;
    v387 = buf;
    v152 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v152, &v426, &v425)) {
      goto LABEL_385;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v153 = __nwlog_obj();
      os_log_type_t v154 = v426;
      if (os_log_type_enabled(v153, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v154, "%{public}s called with null options", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v184 = (char *)__nw_create_backtrace_string();
      v153 = __nwlog_obj();
      os_log_type_t v185 = v426;
      BOOL v186 = os_log_type_enabled(v153, v426);
      if (v184)
      {
        if (v186)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v184;
          _os_log_impl(&dword_1830D4000, v153, v185, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v184);
LABEL_385:
        if (!v152) {
          goto LABEL_72;
        }
LABEL_386:
        free(v152);
        goto LABEL_72;
      }
      if (v186)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v185, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v153 = __nwlog_obj();
      os_log_type_t v228 = v426;
      if (os_log_type_enabled(v153, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v228, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_384:

    goto LABEL_385;
  }
  int v73 = v71;
  id v74 = v73[1];

  if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
  }
  BOOL v75 = nw_protocol_definition_is_equal_unsafe((uint64_t)v74, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

  if (!v75)
  {
    v161 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
    LODWORD(v388) = 12;
    v387 = buf;
    v152 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v152, &v426, &v425)) {
      goto LABEL_385;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v153 = __nwlog_obj();
      os_log_type_t v162 = v426;
      if (os_log_type_enabled(v153, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v162, "%{public}s protocol options are not http_cookie", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v196 = (char *)__nw_create_backtrace_string();
      v153 = __nwlog_obj();
      os_log_type_t v197 = v426;
      BOOL v198 = os_log_type_enabled(v153, v426);
      if (v196)
      {
        if (v198)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v196;
          _os_log_impl(&dword_1830D4000, v153, v197, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v196);
        if (!v152) {
          goto LABEL_72;
        }
        goto LABEL_386;
      }
      if (v198)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v197, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v153 = __nwlog_obj();
      os_log_type_t v232 = v426;
      if (os_log_type_enabled(v153, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_is_top_level_navigation";
        _os_log_impl(&dword_1830D4000, v153, v232, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
      }
    }
    goto LABEL_384;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = v2;
  *(void *)&buf[16] = __nw_http_cookie_options_set_is_top_level_navigation_block_invoke;
  *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
  BYTE8(v433) = v70;
  nw_protocol_options_access_handle(v73, buf);
LABEL_72:

LABEL_73:
  uint64_t v76 = *(void *)(a1 + 40);
  if (!v76
    || (([*(id *)(v76 + 32) _explicitlySetShouldHandleCookies] & 1) == 0
      ? (char v77 = [*(id *)(v76 + 16) HTTPShouldSetCookies])
      : (char v77 = [*(id *)(v76 + 32) HTTPShouldHandleCookies]),
        (v77 & 1) == 0))
  {
    v79 = v34;
    uint64_t v80 = v79;
    if (v79)
    {
      uint64_t v81 = v79;
      id v82 = v81[1];

      if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
      }
      BOOL v83 = nw_protocol_definition_is_equal_unsafe((uint64_t)v82, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

      if (v83)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = v2;
        *(void *)&buf[16] = __nw_http_cookie_options_set_should_not_send_cookies_block_invoke;
        *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
        BYTE8(v433) = 1;
        nw_protocol_options_access_handle(v81, buf);
LABEL_85:

        goto LABEL_86;
      }
      v173 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
      LODWORD(v388) = 12;
      v387 = buf;
      v168 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v168, &v426, &v425)) {
        goto LABEL_401;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v169 = __nwlog_obj();
        os_log_type_t v174 = v426;
        if (os_log_type_enabled(v169, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v174, "%{public}s protocol options are not http_cookie", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v216 = (char *)__nw_create_backtrace_string();
        v169 = __nwlog_obj();
        os_log_type_t v217 = v426;
        BOOL v218 = os_log_type_enabled(v169, v426);
        if (v216)
        {
          if (v218)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v216;
            _os_log_impl(&dword_1830D4000, v169, v217, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v216);
          if (!v168) {
            goto LABEL_85;
          }
          goto LABEL_402;
        }
        if (v218)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v217, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v169 = __nwlog_obj();
        os_log_type_t v236 = v426;
        if (os_log_type_enabled(v169, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v236, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
    else
    {
      v167 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
      LODWORD(v388) = 12;
      v387 = buf;
      v168 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v168, &v426, &v425)) {
        goto LABEL_401;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v169 = __nwlog_obj();
        os_log_type_t v170 = v426;
        if (os_log_type_enabled(v169, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v170, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v208 = (char *)__nw_create_backtrace_string();
        v169 = __nwlog_obj();
        os_log_type_t v209 = v426;
        BOOL v210 = os_log_type_enabled(v169, v426);
        if (v208)
        {
          if (v210)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v208;
            _os_log_impl(&dword_1830D4000, v169, v209, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v208);
LABEL_401:
          if (!v168) {
            goto LABEL_85;
          }
LABEL_402:
          free(v168);
          goto LABEL_85;
        }
        if (v210)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v209, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v169 = __nwlog_obj();
        os_log_type_t v234 = v426;
        if (os_log_type_enabled(v169, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_send_cookies";
          _os_log_impl(&dword_1830D4000, v169, v234, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }

    goto LABEL_401;
  }
LABEL_86:
  uint64_t v84 = *(void *)(a1 + 40);
  if (v84
    && (![*(id *)(v84 + 32) _explicitlySetShouldHandleCookies]
     || ([*(id *)(v84 + 32) HTTPShouldHandleCookies] & 1) != 0))
  {
    goto LABEL_95;
  }
  uint64_t v85 = v34;
  uint64_t v86 = v85;
  if (!v85)
  {
    v201 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
    LODWORD(v388) = 12;
    v387 = buf;
    v202 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v202, &v426, &v425)) {
      goto LABEL_415;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v203 = __nwlog_obj();
      os_log_type_t v204 = v426;
      if (os_log_type_enabled(v203, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v204, "%{public}s called with null options", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v219 = (char *)__nw_create_backtrace_string();
      v203 = __nwlog_obj();
      os_log_type_t v220 = v426;
      BOOL v221 = os_log_type_enabled(v203, v426);
      if (v219)
      {
        if (v221)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v219;
          _os_log_impl(&dword_1830D4000, v203, v220, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v219);
LABEL_415:
        if (!v202) {
          goto LABEL_94;
        }
LABEL_416:
        free(v202);
        goto LABEL_94;
      }
      if (v221)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v220, "%{public}s called with null options, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v203 = __nwlog_obj();
      os_log_type_t v237 = v426;
      if (os_log_type_enabled(v203, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v237, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_414:

    goto LABEL_415;
  }
  id v87 = v85;
  id v88 = v87[1];

  if (nw_protocol_copy_http_cookie_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_cookie_definition_onceToken, &__block_literal_global_18_74238);
  }
  BOOL v89 = nw_protocol_definition_is_equal_unsafe((uint64_t)v88, nw_protocol_copy_http_cookie_definition_http_cookie_definition);

  if (!v89)
  {
    v211 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
    LODWORD(v388) = 12;
    v387 = buf;
    v202 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v202, &v426, &v425)) {
      goto LABEL_415;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v203 = __nwlog_obj();
      os_log_type_t v212 = v426;
      if (os_log_type_enabled(v203, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v212, "%{public}s protocol options are not http_cookie", buf, 0xCu);
      }
    }
    else if (v425)
    {
      v222 = (char *)__nw_create_backtrace_string();
      v203 = __nwlog_obj();
      os_log_type_t v223 = v426;
      BOOL v224 = os_log_type_enabled(v203, v426);
      if (v222)
      {
        if (v224)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v222;
          _os_log_impl(&dword_1830D4000, v203, v223, "%{public}s protocol options are not http_cookie, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v222);
        if (!v202) {
          goto LABEL_94;
        }
        goto LABEL_416;
      }
      if (v224)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v223, "%{public}s protocol options are not http_cookie, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v203 = __nwlog_obj();
      os_log_type_t v238 = v426;
      if (os_log_type_enabled(v203, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_cookie_options_set_should_not_save_cookies";
        _os_log_impl(&dword_1830D4000, v203, v238, "%{public}s protocol options are not http_cookie, backtrace limit exceeded", buf, 0xCu);
      }
    }
    goto LABEL_414;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = v2;
  *(void *)&buf[16] = __nw_http_cookie_options_set_should_not_save_cookies_block_invoke;
  *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
  BYTE8(v433) = 1;
  nw_protocol_options_access_handle(v87, buf);
LABEL_94:

LABEL_95:
  nw_protocol_stack_prepend_application_protocol(stack, &v34->super);

  for (unint64_t i = v403; ; unint64_t i = 0)
  {
    v404 = i;
    if (nw_protocol_copy_http_retry_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_retry_definition_onceToken, &__block_literal_global_42_74646);
    }
    id v106 = nw_protocol_create_options((void *)nw_protocol_copy_http_retry_definition_http_retry_definition);
    nw_http_retry_options_set_limit(v106, 3);
    nw_protocol_stack_prepend_application_protocol(stack, &v106->super);

    if (nw_protocol_copy_http_authentication_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_authentication_definition_onceToken, &__block_literal_global_36_74310);
    }
    v410 = nw_protocol_create_options((void *)nw_protocol_copy_http_authentication_definition_http_authentication_definition);
    v418[0] = MEMORY[0x1E4F143A8];
    v418[1] = v2;
    v418[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_8;
    v418[3] = &unk_1E5248B10;
    v418[4] = a1;
    id v107 = (id)v6;
    id v419 = v107;
    nw_http_authentication_options_set_challenge_handler(v410, v418, *(void **)(a1 + 56));
    v400 = -[NWURLSessionTaskConfiguration URLCredentialStorage](*(void *)(a1 + 40));
    nw_http_authentication_options_set_credential_storage(v410, v400);
    if (*(void *)(a1 + 40))
    {
      uint64_t v108 = *(void *)(*(void *)(a1 + 40) + 24);
      if (v108)
      {
        os_log_type_t v109 = *(id *)(v108 + 400);
        os_log_type_t v110 = v109;
        if (v109)
        {
          __int16 v111 = (void *)v109[8];
          if (!v111)
          {
            BOOL v112 = nw_array_create();
            uint64_t v113 = (void *)v110[8];
            v110[8] = v112;

            __int16 v111 = (void *)v110[8];
          }
          id v402 = v111;
        }
        else
        {
          id v402 = 0;
        }
      }
      else
      {
        os_log_type_t v110 = 0;
        id v402 = 0;
      }

      if (v402) {
        nw_http_authentication_options_set_credential_cache(v410, v402);
      }
      uint64_t v114 = *(void *)(a1 + 40);
      if (v114)
      {
        uint64_t v115 = *(void *)(v114 + 24);
        if (v115)
        {
          uint64_t v116 = *(void **)(v115 + 32);
          if (v116)
          {
            id v117 = v116;
            if (v117)
            {
LABEL_126:
              v397 = v117;
              nw_http_authentication_options_set_h1_fallback_cache(v410, v117);
              goto LABEL_129;
            }
          }
          else
          {
            BOOL v118 = nw_array_create();
            v120 = *(void **)(v115 + 32);
            int v119 = (id *)(v115 + 32);
            *int v119 = (id)v118;

            id v117 = *v119;
            if (v117) {
              goto LABEL_126;
            }
          }
        }
      }
      v397 = 0;
LABEL_129:
      uint64_t v121 = *(void *)(a1 + 40);
      if (!v121) {
        goto LABEL_421;
      }
      goto LABEL_130;
    }
    v397 = 0;
    id v402 = 0;
    uint64_t v121 = *(void *)(a1 + 40);
    if (!v121) {
      goto LABEL_421;
    }
LABEL_130:
    uint64_t v122 = *(void *)(v121 + 24);
    if (v122)
    {
      id v123 = *(void **)(v122 + 40);
      if (v123)
      {
        id v124 = v123;
        if (v124) {
          goto LABEL_135;
        }
      }
      else
      {
        id v125 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v127 = *(void **)(v122 + 40);
        v126 = (id *)(v122 + 40);
        id *v126 = v125;

        id v124 = *v126;
        if (v124)
        {
LABEL_135:
          v396 = v124;
          nw_http_authentication_options_set_appsso_h1_fallback_headers(v410, (uint64_t)v124);
          goto LABEL_422;
        }
      }
    }
LABEL_421:
    v396 = 0;
LABEL_422:
    nw_protocol_stack_prepend_application_protocol(stack, &v410->super);
    if (nw_protocol_copy_http_security_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_44_74704);
    }
    v239 = nw_protocol_create_options((void *)nw_protocol_copy_http_security_definition_http_security_definition);
    uint64_t v240 = *(void *)(a1 + 40);
    if (v240
      && ([*(id *)(v240 + 16) _hstsStorage], (v241 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v399 = v241;
      v242 = objc_alloc_init(NWConcrete_nw_hsts_storage);
      HSTSStorage = v242->HSTSStorage;
      v242->HSTSStorage = v399;

      nw_http_security_options_set_hsts_storage(v239, v242);
    }
    else
    {
      v399 = 0;
    }
    v417[0] = MEMORY[0x1E4F143A8];
    v417[1] = v2;
    v417[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_9;
    v417[3] = &unk_1E5248B38;
    v417[4] = a1;
    nw_http_security_options_set_handler(v239, v417, *(void **)(a1 + 56));
    uint64_t v244 = *(void *)(a1 + 40);
    if (v244) {
      char v245 = [*(id *)(v244 + 32) _ignoreHSTS];
    }
    else {
      char v245 = 0;
    }
    v246 = v239;
    v247 = v246;
    if (!v246)
    {
      v299 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
      LODWORD(v388) = 12;
      v387 = buf;
      v300 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v300, &v426, &v425)) {
        goto LABEL_700;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v301 = __nwlog_obj();
        os_log_type_t v302 = v426;
        if (os_log_type_enabled(v301, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
          _os_log_impl(&dword_1830D4000, v301, v302, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v324 = (char *)__nw_create_backtrace_string();
        v301 = __nwlog_obj();
        os_log_type_t v325 = v426;
        BOOL v326 = os_log_type_enabled(v301, v426);
        if (v324)
        {
          if (v326)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v324;
            _os_log_impl(&dword_1830D4000, v301, v325, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v324);
LABEL_700:
          if (!v300) {
            goto LABEL_435;
          }
LABEL_701:
          free(v300);
          goto LABEL_435;
        }
        if (v326)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
          _os_log_impl(&dword_1830D4000, v301, v325, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v301 = __nwlog_obj();
        os_log_type_t v379 = v426;
        if (os_log_type_enabled(v301, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
          _os_log_impl(&dword_1830D4000, v301, v379, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
LABEL_699:

      goto LABEL_700;
    }
    v248 = v246;
    id v249 = v248[1];

    if (nw_protocol_copy_http_security_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_44_74704);
    }
    BOOL v250 = nw_protocol_definition_is_equal_unsafe((uint64_t)v249, nw_protocol_copy_http_security_definition_http_security_definition);

    if (v250)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = v2;
      *(void *)&buf[16] = __nw_http_security_options_set_skip_hsts_lookup_block_invoke;
      *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
      BYTE8(v433) = v245;
      nw_protocol_options_access_handle(v248, buf);
      goto LABEL_435;
    }
    v317 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
    LODWORD(v388) = 12;
    v387 = buf;
    v300 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v300, &v426, &v425)) {
      goto LABEL_700;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v301 = __nwlog_obj();
      os_log_type_t v318 = v426;
      if (os_log_type_enabled(v301, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_1830D4000, v301, v318, "%{public}s protocol options are not http security", buf, 0xCu);
      }
      goto LABEL_699;
    }
    if (!v425)
    {
      v301 = __nwlog_obj();
      os_log_type_t v383 = v426;
      if (os_log_type_enabled(v301, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_1830D4000, v301, v383, "%{public}s protocol options are not http security, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_699;
    }
    v338 = (char *)__nw_create_backtrace_string();
    v301 = __nwlog_obj();
    os_log_type_t v339 = v426;
    BOOL v340 = os_log_type_enabled(v301, v426);
    if (!v338)
    {
      if (v340)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
        _os_log_impl(&dword_1830D4000, v301, v339, "%{public}s protocol options are not http security, no backtrace", buf, 0xCu);
      }
      goto LABEL_699;
    }
    if (v340)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_security_options_set_skip_hsts_lookup";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v338;
      _os_log_impl(&dword_1830D4000, v301, v339, "%{public}s protocol options are not http security, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v338);
    if (v300) {
      goto LABEL_701;
    }
LABEL_435:

    uint64_t v251 = *(void *)(a1 + 40);
    if (v251) {
      char v252 = [*(id *)(v251 + 16) _allowsHSTSWithUntrustedRootCertificate];
    }
    else {
      char v252 = 0;
    }
    v253 = v247;
    v405 = v253;
    if (!v247)
    {
      v303 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
      LODWORD(v388) = 12;
      v387 = buf;
      v304 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v304, &v426, &v425)) {
        goto LABEL_705;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v305 = __nwlog_obj();
        os_log_type_t v306 = v426;
        if (os_log_type_enabled(v305, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v306, "%{public}s called with null options", buf, 0xCu);
        }
        goto LABEL_704;
      }
      if (!v425)
      {
        v305 = __nwlog_obj();
        os_log_type_t v380 = v426;
        if (os_log_type_enabled(v305, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v380, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_704;
      }
      v327 = (char *)__nw_create_backtrace_string();
      v305 = __nwlog_obj();
      os_log_type_t v328 = v426;
      BOOL v329 = os_log_type_enabled(v305, v426);
      if (!v327)
      {
        if (v329)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v328, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
        goto LABEL_704;
      }
      if (v329)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v327;
        _os_log_impl(&dword_1830D4000, v305, v328, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
      }
      goto LABEL_578;
    }
    v254 = v253;
    id v255 = v254[1];

    if (nw_protocol_copy_http_security_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_security_definition_onceToken, &__block_literal_global_44_74704);
    }
    BOOL v256 = nw_protocol_definition_is_equal_unsafe((uint64_t)v255, nw_protocol_copy_http_security_definition_http_security_definition);

    if (v256)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = v2;
      *(void *)&buf[16] = __nw_http_security_options_set_save_hsts_with_untrusted_root_cert_block_invoke;
      *(void *)&long long v433 = &__block_descriptor_33_e9_B16__0_v8l;
      BYTE8(v433) = v252;
      nw_protocol_options_access_handle(v254, buf);
      v257 = v405;
      goto LABEL_442;
    }
    v319 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
    LODWORD(v388) = 12;
    v387 = buf;
    v304 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (__nwlog_fault(v304, &v426, &v425))
    {
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v305 = __nwlog_obj();
        os_log_type_t v320 = v426;
        if (os_log_type_enabled(v305, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v320, "%{public}s protocol options are not http security", buf, 0xCu);
        }
LABEL_704:

        goto LABEL_705;
      }
      if (!v425)
      {
        v305 = __nwlog_obj();
        os_log_type_t v384 = v426;
        if (os_log_type_enabled(v305, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v384, "%{public}s protocol options are not http security, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_704;
      }
      v327 = (char *)__nw_create_backtrace_string();
      v305 = __nwlog_obj();
      os_log_type_t v341 = v426;
      BOOL v342 = os_log_type_enabled(v305, v426);
      if (!v327)
      {
        if (v342)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
          _os_log_impl(&dword_1830D4000, v305, v341, "%{public}s protocol options are not http security, no backtrace", buf, 0xCu);
        }
        goto LABEL_704;
      }
      if (v342)
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&buf[4] = "nw_http_security_options_set_save_hsts_with_untrusted_root_cert";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v327;
        _os_log_impl(&dword_1830D4000, v305, v341, "%{public}s protocol options are not http security, dumping backtrace:%{public}s", buf, 0x16u);
      }
LABEL_578:

      free(v327);
    }
LABEL_705:
    v257 = v405;
    if (v304) {
      free(v304);
    }
LABEL_442:

    nw_protocol_stack_prepend_application_protocol(stack, v405);
    if (nw_protocol_copy_http_encoding_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_encoding_definition_onceToken, &__block_literal_global_38);
    }
    v258 = nw_protocol_create_options((void *)nw_protocol_copy_http_encoding_definition_http_encoding_definition);
    nw_protocol_stack_prepend_application_protocol(stack, &v258->super);

    if (nw_protocol_copy_http_redirect_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_redirect_definition_onceToken, &__block_literal_global_40_74552);
    }
    v407 = nw_protocol_create_options((void *)nw_protocol_copy_http_redirect_definition_http_redirect_definition);
    nw_http_redirect_options_set_limit(v407, 20);
    v416[0] = MEMORY[0x1E4F143A8];
    v416[1] = v2;
    v416[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_10;
    v416[3] = &unk_1E5248BD8;
    v416[4] = a1;
    nw_http_redirect_options_set_handler(v407, v416, *(void **)(a1 + 56));
    nw_protocol_stack_prepend_application_protocol(stack, &v407->super);
    v401 = [*(id *)(a1 + 24) _propertyForKey:*MEMORY[0x1E4F18F38]];
    if (!v401 || [MEMORY[0x1E4F1CC38] isEqual:v401])
    {
      if (nw_protocol_copy_http_sniffing_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_sniffing_definition_onceToken, &__block_literal_global_48_75140);
      }
      v259 = nw_protocol_create_options((void *)nw_protocol_copy_http_sniffing_definition_http_sniffing_definition);
      nw_protocol_stack_prepend_application_protocol(stack, &v259->super);
    }
    if (nw_protocol_copy_http_client_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
    }
    v260 = nw_protocol_create_options((void *)nw_protocol_copy_http_client_definition_definition);
    v415[0] = MEMORY[0x1E4F143A8];
    v415[1] = v2;
    v415[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_14;
    v415[3] = &unk_1E5248C00;
    v415[4] = a1;
    v261 = v260;
    v262 = v415;
    if (!v261)
    {
      v307 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
      LODWORD(v388) = 12;
      v387 = buf;
      uint64_t v6 = 16;
      v308 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v308, &v426, &v425)) {
        goto LABEL_710;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v309 = __nwlog_obj();
        uint64_t v6 = v426;
        if (os_log_type_enabled(v309, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_1830D4000, v309, (os_log_type_t)v6, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        uint64_t v6 = (uint64_t)__nw_create_backtrace_string();
        v309 = __nwlog_obj();
        os_log_type_t v330 = v426;
        BOOL v331 = os_log_type_enabled(v309, v426);
        if (v6)
        {
          if (v331)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v6;
            _os_log_impl(&dword_1830D4000, v309, v330, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free((void *)v6);
LABEL_710:
          if (!v308) {
            goto LABEL_458;
          }
LABEL_711:
          free(v308);
          goto LABEL_458;
        }
        if (v331)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_1830D4000, v309, v330, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v309 = __nwlog_obj();
        uint64_t v6 = v426;
        if (os_log_type_enabled(v309, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
          _os_log_impl(&dword_1830D4000, v309, (os_log_type_t)v6, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
LABEL_709:

      goto LABEL_710;
    }
    v263 = v261;
    id v264 = v263[1];

    if (nw_protocol_copy_http_client_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
    }
    uint64_t v6 = nw_protocol_definition_is_equal_unsafe((uint64_t)v264, nw_protocol_copy_http_client_definition_definition);

    if (v6)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = v2;
      *(void *)&buf[16] = __nw_http_client_options_set_resend_handler_block_invoke;
      *(void *)&long long v433 = &unk_1E5248ED8;
      *((void *)&v433 + 1) = v262;
      nw_protocol_options_access_handle(v263, buf);

      goto LABEL_458;
    }
    v321 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
    LODWORD(v388) = 12;
    v387 = buf;
    uint64_t v6 = 16;
    v308 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v308, &v426, &v425)) {
      goto LABEL_710;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v309 = __nwlog_obj();
      uint64_t v6 = v426;
      if (os_log_type_enabled(v309, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
        _os_log_impl(&dword_1830D4000, v309, (os_log_type_t)v6, "%{public}s protocol options are not http_client", buf, 0xCu);
      }
      goto LABEL_709;
    }
    if (!v425)
    {
      v309 = __nwlog_obj();
      uint64_t v6 = v426;
      if (os_log_type_enabled(v309, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
        _os_log_impl(&dword_1830D4000, v309, (os_log_type_t)v6, "%{public}s protocol options are not http_client, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_709;
    }
    uint64_t v6 = (uint64_t)__nw_create_backtrace_string();
    v309 = __nwlog_obj();
    os_log_type_t v343 = v426;
    BOOL v344 = os_log_type_enabled(v309, v426);
    if (!v6)
    {
      if (v344)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
        _os_log_impl(&dword_1830D4000, v309, v343, "%{public}s protocol options are not http_client, no backtrace", buf, 0xCu);
      }
      goto LABEL_709;
    }
    if (v344)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_client_options_set_resend_handler";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1830D4000, v309, v343, "%{public}s protocol options are not http_client, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free((void *)v6);
    if (v308) {
      goto LABEL_711;
    }
LABEL_458:
    BOOL v265 = v261 == 0;

    v414[0] = MEMORY[0x1E4F143A8];
    v414[1] = v2;
    v414[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_44;
    v414[3] = &unk_1E5248C28;
    v414[4] = a1;
    v266 = v261;
    v267 = v414;
    if (v265)
    {
      v310 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
      LODWORD(v388) = 12;
      v387 = buf;
      v311 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v426 = OS_LOG_TYPE_ERROR;
      char v425 = 0;
      if (!__nwlog_fault(v311, &v426, &v425)) {
        goto LABEL_715;
      }
      if (v426 == OS_LOG_TYPE_FAULT)
      {
        v312 = __nwlog_obj();
        os_log_type_t v313 = v426;
        if (os_log_type_enabled(v312, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_1830D4000, v312, v313, "%{public}s called with null options", buf, 0xCu);
        }
      }
      else if (v425)
      {
        v332 = (char *)__nw_create_backtrace_string();
        v312 = __nwlog_obj();
        uint64_t v6 = v426;
        BOOL v333 = os_log_type_enabled(v312, v426);
        if (v332)
        {
          if (v333)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v332;
            _os_log_impl(&dword_1830D4000, v312, (os_log_type_t)v6, "%{public}s called with null options, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v332);
LABEL_715:
          if (!v311) {
            goto LABEL_463;
          }
LABEL_716:
          free(v311);
          goto LABEL_463;
        }
        if (v333)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_1830D4000, v312, (os_log_type_t)v6, "%{public}s called with null options, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v312 = __nwlog_obj();
        os_log_type_t v381 = v426;
        if (os_log_type_enabled(v312, v426))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
          _os_log_impl(&dword_1830D4000, v312, v381, "%{public}s called with null options, backtrace limit exceeded", buf, 0xCu);
        }
      }
LABEL_714:

      goto LABEL_715;
    }
    v268 = v266;
    id v269 = v268[1];

    if (nw_protocol_copy_http_client_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
    }
    BOOL v270 = nw_protocol_definition_is_equal_unsafe((uint64_t)v269, nw_protocol_copy_http_client_definition_definition);

    if (v270)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = v2;
      *(void *)&buf[16] = __nw_http_client_options_set_retry_with_h1_handler_block_invoke;
      *(void *)&long long v433 = &unk_1E5248ED8;
      *((void *)&v433 + 1) = v267;
      nw_protocol_options_access_handle(v268, buf);

      goto LABEL_463;
    }
    v322 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
    LODWORD(v388) = 12;
    v387 = buf;
    v311 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v426 = OS_LOG_TYPE_ERROR;
    char v425 = 0;
    if (!__nwlog_fault(v311, &v426, &v425)) {
      goto LABEL_715;
    }
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      v312 = __nwlog_obj();
      os_log_type_t v323 = v426;
      if (os_log_type_enabled(v312, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
        _os_log_impl(&dword_1830D4000, v312, v323, "%{public}s protocol options are not http_client", buf, 0xCu);
      }
      goto LABEL_714;
    }
    if (!v425)
    {
      v312 = __nwlog_obj();
      os_log_type_t v385 = v426;
      if (os_log_type_enabled(v312, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
        _os_log_impl(&dword_1830D4000, v312, v385, "%{public}s protocol options are not http_client, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_714;
    }
    v345 = (char *)__nw_create_backtrace_string();
    v312 = __nwlog_obj();
    uint64_t v6 = v426;
    BOOL v346 = os_log_type_enabled(v312, v426);
    if (!v345)
    {
      if (v346)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
        _os_log_impl(&dword_1830D4000, v312, (os_log_type_t)v6, "%{public}s protocol options are not http_client, no backtrace", buf, 0xCu);
      }
      goto LABEL_714;
    }
    if (v346)
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "nw_http_client_options_set_retry_with_h1_handler";
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v345;
      _os_log_impl(&dword_1830D4000, v312, (os_log_type_t)v6, "%{public}s protocol options are not http_client, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v345);
    if (v311) {
      goto LABEL_716;
    }
LABEL_463:

    nw_protocol_stack_prepend_application_protocol(stack, v266);
    if (nw_proxy_copy_http_connect_definition::onceToken != -1) {
      dispatch_once(&nw_proxy_copy_http_connect_definition::onceToken, &__block_literal_global_102_35650);
    }
    id v271 = (id)nw_proxy_copy_http_connect_definition::proxy_definition;
    v272 = nw_proxy_create_options(v271);

    v412[0] = MEMORY[0x1E4F143A8];
    v412[1] = v2;
    v412[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_2_46;
    v412[3] = &unk_1E5248B10;
    v412[4] = a1;
    id v395 = v107;
    id v413 = v395;
    nw_proxy_options_set_authentication_challenge_handler(v272, v412);
    v273 = [*(id *)(a1 + 24) valueForHTTPHeaderField:@"Proxy-Authorization"];
    v274 = v273;
    if (v273) {
      nw_proxy_options_set_http_proxy_authorization_header(v272, [v273 cStringUsingEncoding:5]);
    }
    nw_parameters_add_proxy_options(parameters, v272);
    -[NWURLSessionTaskConfiguration configureParameters:](*(id **)(a1 + 40), parameters);
    *(unsigned char *)(a1 + 18) = nw_parameters_has_custom_proxy_configs(parameters);
    uint64_t v275 = *(void *)(a1 + 40);
    if (v275
      && ([*(id *)(v275 + 24) _hostOverride], (v276 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      nw_parameters_set_url_endpoint(parameters, endpoint);
      v398 = v276;

      v277 = v398;
    }
    else
    {
      v398 = 0;
      v277 = endpoint;
    }
    nw_endpoint_t endpoint = v277;
    nw_connection_t v278 = nw_connection_create(v277, parameters);
    v279 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v278;

    uint64_t v280 = *(void *)(a1 + 72);
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v281 = (id)gurlLogObj;
    v282 = v281;
    if (!v280) {
      break;
    }
    if (os_log_type_enabled(v281, OS_LOG_TYPE_DEFAULT))
    {
      id v283 = *(id *)(a1 + 48);
      v284 = v283;
      if (v283)
      {
        [v283 logDescription];
      }
      else
      {
        v430[0] = 0;
        v430[1] = 0;
        int v431 = 0;
      }
      id v285 = *(id *)(a1 + 48);
      v286 = v285;
      if (v285)
      {
        [v285 logDescription];
        int v287 = v429;
      }
      else
      {
        int v287 = 0;
        uint64_t v427 = 0;
        uint64_t v428 = 0;
        int v429 = 0;
      }
      uint64_t id = nw_connection_get_id(*(void **)(a1 + 72));
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(void *)&buf[10] = v430;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v287;
      LOWORD(v433) = 2048;
      *(void *)((char *)&v433 + 2) = id;
      _os_log_impl(&dword_1830D4000, v282, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> created [C%llu]", buf, 0x22u);
    }
    uint64_t v289 = *(void *)(a1 + 40);
    if (v289 && ([*(id *)(v289 + 24) _preconnect] & 1) != 0) {
      goto LABEL_646;
    }
    v393 = endpoint;
    if (!*(void *)(a1 + 32)) {
      goto LABEL_592;
    }
    os_log_type_t v92 = *(void **)(a1 + 24);
    if (!v92) {
      goto LABEL_592;
    }
    v290 = [*(id *)(a1 + 24) HTTPMethod];
    BOOL v291 = [v290 caseInsensitiveCompare:@"GET"] == 0;

    if (!v291)
    {
      os_log_type_t v92 = [v92 HTTPMethod];
      BOOL v347 = [v92 caseInsensitiveCompare:@"HEAD"] == 0;

      if (!v347)
      {
LABEL_592:
        context = nw_content_context_create("http request");
        v348 = (void *)nw_http_request_create_from_url_request(*(void **)(a1 + 24));
        BOOL v391 = nw_http_request_has_method(v348, (uint64_t)"GET") || nw_http_request_has_method(v348, (uint64_t)"HEAD");
        if (*(uint64_t *)(a1 + 32) >= 1
          && !nw_http_fields_have_field_with_name(v348, (unint64_t)"Content-Length"))
        {
          snprintf(buf, 0x15uLL, "%lld", *(void *)(a1 + 32));
          nw_http_fields_append(v348, (uint64_t)"Content-Length", (uint64_t)buf);
        }
        if (!nw_http_fields_have_field_with_name(v348, (unint64_t)"User-Agent"))
        {
          if (nw_utilities_get_user_agent::onceToken != -1) {
            dispatch_once(&nw_utilities_get_user_agent::onceToken, &__block_literal_global_13);
          }
          nw_http_fields_append(v348, (uint64_t)"User-Agent", nw_utilities_get_user_agent::user_agent_string);
        }
        if (!nw_http_fields_have_field_with_name(v348, (unint64_t)"Accept")) {
          nw_http_fields_append(v348, (uint64_t)"Accept", (uint64_t)"*/*");
        }
        if (!nw_http_fields_have_field_with_name(v348, (unint64_t)"Accept-Language"))
        {
          v349 = (void *)_CFNetworkCopyPreferredLanguageCode();
          nw_http_fields_append(v348, (uint64_t)"Accept-Language", [v349 UTF8String]);
        }
        if (!nw_http_fields_have_field_with_name(v348, (unint64_t)"Priority"))
        {
          uint64_t v350 = *(void *)(a1 + 40);
          if (v350)
          {
            [*(id *)(v350 + 24) priority];
            if (v351 < 0.5) {
              goto LABEL_609;
            }
            float v352 = 6.6667 - (float)(v351 * 6.6667);
          }
          else
          {
            float v351 = 0.0;
LABEL_609:
            float v352 = ceilf((float)(v351 * -10.0) + 7.0);
          }
          int v353 = (int)v352;
          uint64_t v354 = *(void *)(a1 + 40);
          if (v354)
          {
            int v355 = [*(id *)(v354 + 24) prefersIncrementalDelivery];
            *(_WORD *)buf = 15733;
            buf[2] = v353 + 48;
            if (v355)
            {
              char v356 = 0;
              *(_WORD *)&buf[4] = 26912;
              LOBYTE(v354) = 44;
              uint64_t v357 = 6;
              goto LABEL_614;
            }
            LOBYTE(v354) = 0;
          }
          else
          {
            *(_WORD *)buf = 15733;
            char v356 = v353 + 48;
            uint64_t v357 = 2;
LABEL_614:
            buf[v357] = v356;
          }
          buf[3] = v354;
          nw_http_fields_append(v348, (uint64_t)"Priority", (uint64_t)buf);
        }
        if (*(unsigned char *)(a1 + 15))
        {
          v359 = *(void **)(a1 + 96);
          v358 = *(void **)(a1 + 104);
          id v360 = *(id *)(a1 + 24);
          id v361 = v359;
          id v392 = v348;
          id v362 = v360;
          v389 = v361;
          if (v361)
          {
            id v363 = v358;
            uint64_t v364 = [v363 storagePolicy];
            v390 = [v363 response];

            v365 = [v362 valueForHTTPHeaderField:@"If-Modified-Since"];
            if (!v365 && v364 != 2)
            {
              v366 = [v390 _lastModifiedDate];
              if (v366)
              {
                id v367 = objc_alloc_init(MEMORY[0x1E4F28C10]);
                [v367 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
                v368 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
                [v367 setTimeZone:v368];

                v365 = [v367 stringFromDate:v366];
              }
              else
              {
                v365 = 0;
              }
            }
            if (v365) {
              nw_http_fields_append(v392, (uint64_t)"If-Modified-Since", [v365 UTF8String]);
            }
            BOOL v369 = v364 != 2;
            v370 = objc_msgSend(v362, "valueForHTTPHeaderField:", @"If-None-Match", v387, v388);
            if (v370) {
              BOOL v371 = 0;
            }
            else {
              BOOL v371 = v369;
            }
            if (v371)
            {
              v370 = [v390 valueForHTTPHeaderField:@"ETag"];
            }
            if (v370) {
              nw_http_fields_append(v392, (uint64_t)"If-None-Match", [v370 UTF8String]);
            }
          }
        }
        metadata_for_request = nw_http_create_metadata_for_request(v348);
        nw_content_context_set_metadata_for_protocol(context, metadata_for_request);
        uint64_t v373 = *(void *)(a1 + 32);
        BOOL v374 = v391;
        if (v373) {
          BOOL v374 = 0;
        }
        v375 = *(NSObject **)(a1 + 72);
        if (v374)
        {
          nw_connection_send(v375, 0, context, 1, &__block_literal_global_24376);
          *(unsigned char *)(a1 + 16) = 1;
          v376 = (void (**)(void))*(id *)(a1 + 136);
          objc_setProperty_nonatomic_copy((id)a1, v377, 0, 136);
          if (v376) {
            v376[2](v376);
          }
          if (*(unsigned char *)(a1 + 9)) {
            -[NWURLLoaderHTTP startResponseStallTimer](a1);
          }
        }
        else
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = v2;
          *(void *)&buf[16] = __32__NWURLLoaderHTTP_writeRequest___block_invoke;
          *(void *)&long long v433 = &unk_1E5248CD0;
          *((void *)&v433 + 1) = a1;
          nw_connection_send(v375, 0, context, v373 == 0, buf);
        }

LABEL_645:
        v378 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = context;

LABEL_646:
        -[NWURLLoaderHTTP configureAndStartConnection:](a1, *(void **)(a1 + 72));
        goto LABEL_647;
      }
    }
    if (isWebKitNetworking_onceToken[0] != -1) {
      dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_202);
    }
    if (isWebKitNetworking_result == 1)
    {
      v292 = [NWURLError alloc];
      v293 = [*(id *)(a1 + 48) loaderTask];
      id v294 = (id)a1;
      id v295 = v293;
      if (v292)
      {
        uint64_t v296 = *MEMORY[0x1E4F289A0];
        *(void *)buf = v292;
        *(void *)&buf[8] = NWURLError;
        v297 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v296, -1103, 0);
        v292 = v297;
        if (v297) {
          [(NWURLError *)v297 fillErrorForLoader:v294 andTask:v295];
        }
      }

      v298 = (void *)*((void *)v294 + 11);
      *((void *)v294 + 11) = v292;

      context = 0;
      *((unsigned char *)v294 + 11) = 1;
      goto LABEL_645;
    }
    _os_crash();
    __break(1u);
LABEL_726:
    os_log_type_t v94 = 0;
    os_log_type_t v95 = 0;
LABEL_108:

    BOOL v33 = v95;
    if (v95) {
      goto LABEL_27;
    }
LABEL_109:
    ;
  }
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "-[NWURLLoaderHTTP continueLoading]";
  v314 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v426 = OS_LOG_TYPE_ERROR;
  char v425 = 0;
  if (__nwlog_fault(v314, &v426, &v425))
  {
    if (v426 == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v315 = (id)gurlLogObj;
      os_log_type_t v316 = v426;
      if (os_log_type_enabled(v315, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "-[NWURLLoaderHTTP continueLoading]";
        _os_log_impl(&dword_1830D4000, v315, v316, "%{public}s failed to create connection", buf, 0xCu);
      }
      goto LABEL_520;
    }
    if (v425)
    {
      v334 = (char *)__nw_create_backtrace_string();
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v335 = (id)gurlLogObj;
      os_log_type_t v336 = v426;
      BOOL v337 = os_log_type_enabled(v335, v426);
      if (v334)
      {
        if (v337)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "-[NWURLLoaderHTTP continueLoading]";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v334;
          _os_log_impl(&dword_1830D4000, v335, v336, "%{public}s failed to create connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v334);
      }
      else
      {
        if (v337)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "-[NWURLLoaderHTTP continueLoading]";
          _os_log_impl(&dword_1830D4000, v335, v336, "%{public}s failed to create connection, no backtrace", buf, 0xCu);
        }
      }
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v315 = (id)gurlLogObj;
      os_log_type_t v382 = v426;
      if (os_log_type_enabled(v315, v426))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "-[NWURLLoaderHTTP continueLoading]";
        _os_log_impl(&dword_1830D4000, v315, v382, "%{public}s failed to create connection, backtrace limit exceeded", buf, 0xCu);
      }
LABEL_520:
    }
  }
  if (v314) {
    free(v314);
  }
  v386 = -[NWURLLoaderHTTP errorForErrorCode:]((id *)a1, -1);
  objc_storeStrong((id *)(a1 + 88), v386);

  *(unsigned char *)(a1 + 11) = 1;
LABEL_647:
}

void __25__NWURLLoaderHTTP_start___block_invoke(uint64_t a1, void *a2)
{
  id v54 = a2;
  if (!v54) {
    goto LABEL_16;
  }
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)v4[12];
    uint64_t v6 = (void *)v4[3];
    id v4 = (void *)v4[5];
  }
  else
  {
    uint64_t v6 = 0;
    id v5 = 0;
  }
  BOOL v7 = v4;
  id v8 = v6;
  id v9 = v5;
  if (v7)
  {
    if ([v7[4] _explicitlySetCachePolicy]) {
      uint64_t v10 = [v7[4] cachePolicy];
    }
    else {
      uint64_t v10 = [v7[2] requestCachePolicy];
    }
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v54;
  id v13 = v8;
  if (!v9) {
    goto LABEL_15;
  }
  if ([v12 storagePolicy] == 2) {
    goto LABEL_15;
  }
  uint64_t v14 = [v12 response];

  if (!v14) {
    goto LABEL_15;
  }
  uint64_t v15 = [v13 HTTPBody];
  if (v15)
  {

LABEL_15:
    goto LABEL_16;
  }
  SEL v16 = [v13 HTTPBodyStream];

  if (v16) {
    goto LABEL_15;
  }
  id v20 = [v12 response];
  uint64_t v21 = [v20 valueForHTTPHeaderField:@"Vary"];

  if (v21)
  {
    id v22 = [v20 valueForHTTPHeaderField:@"Vary"];
    if (([v22 isEqualToString:@"*"] & 1) == 0)
    {
      uint64_t v23 = [v12 _wrappedRequest];
      if (v23)
      {
        BOOL v52 = (void *)_CFURLRequestCopyProtocolPropertyForKey();
        if (v52)
        {
          char v24 = -[NWURLLoaderCache copyVaryStateFromRequest:varyValueToCopy:](v13, v22);
          if (v24)
          {
            BOOL v49 = v24;
            int v50 = [v52 isEqualToDictionary:v24];

            if (!v50) {
              goto LABEL_47;
            }
            goto LABEL_30;
          }
        }
      }
    }
    goto LABEL_47;
  }
LABEL_30:
  if (!v20 || [v20 statusCode] != 301 && objc_msgSend(v20, "statusCode") != 308)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      int v25 = 1;
    }
    else if (_CFURLResponseMustRevalidate() == 1)
    {
      int v25 = 3;
    }
    else
    {
      CFURLResponseGetExpirationTime();
      int v25 = 3;
      if (v26 - CFAbsoluteTimeGetCurrent() >= 1.0)
      {
        uint64_t v53 = [v13 valueForHTTPHeaderField:@"Must-Revalidate"];

        uint64_t v51 = [v13 valueForHTTPHeaderField:@"Proxy-Revalidate"];

        uint64_t v27 = [v13 valueForHTTPHeaderField:@"If-Modified-Since"];

        uint64_t v28 = [v13 valueForHTTPHeaderField:@"Cache-Control"];
        uint64_t v29 = v28 | v27;

        if (v29 | v51 | v53) {
          int v30 = 3;
        }
        else {
          int v30 = 1;
        }
        if (v11 == 5) {
          int v25 = 3;
        }
        else {
          int v25 = v30;
        }
      }
    }
    goto LABEL_48;
  }
LABEL_47:
  int v25 = 2;
LABEL_48:

  if ((v25 | 2) == 3)
  {
    uint64_t v31 = *(void *)(a1 + 32);
    if (v31)
    {
      objc_storeStrong((id *)(v31 + 104), a2);
      uint64_t v32 = *(void *)(a1 + 32);
      if (v32) {
        *(unsigned char *)(v32 + 14) = 1;
      }
    }
    if (v25 == 3)
    {
      uint64_t v33 = *(void *)(a1 + 32);
      if (v33)
      {
        *(unsigned char *)(v33 + 15) = 1;
        uint64_t v34 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v34 = 0;
      }
      -[NWURLLoaderHTTP continueLoading](v34);
    }
  }
LABEL_16:
  uint64_t v17 = *(void *)(a1 + 32);
  if (!v17)
  {
    uint64_t v19 = 0;
    goto LABEL_57;
  }
  if (*(unsigned char *)(v17 + 14)) {
    goto LABEL_68;
  }
  objc_super v18 = (id *)*(id *)(v17 + 40);
  uint64_t v19 = v18;
  if (v18)
  {
    if ([v18[4] _explicitlySetCachePolicy])
    {
      if ([v19[4] cachePolicy] != 3) {
        goto LABEL_57;
      }
    }
    else if ([v19[2] requestCachePolicy] != 3)
    {
      goto LABEL_57;
    }

    goto LABEL_60;
  }
LABEL_57:
  uint64_t v35 = *(void *)(a1 + 32);
  if (v35) {
    uint64_t v36 = *(void **)(v35 + 24);
  }
  else {
    uint64_t v36 = 0;
  }
  id v37 = [v36 valueForHTTPHeaderField:@"Cache-Control"];
  [v37 rangeOfString:@"only-if-cached" options:1];
  uint64_t v39 = v38;

  if (!v39)
  {
    -[NWURLLoaderHTTP continueLoading](*(void *)(a1 + 32));
    goto LABEL_68;
  }
LABEL_60:
  id v40 = *(id **)(a1 + 32);
  if (v40)
  {
    BOOL v41 = [NWURLError alloc];
    uint64_t v42 = [v40[6] loaderTask];
    v43 = v40;
    id v44 = v42;
    if (v41)
    {
      uint64_t v45 = *MEMORY[0x1E4F289A0];
      v55.receiver = v41;
      v55.super_class = (Class)NWURLError;
      v46 = (NWURLError *)objc_msgSendSuper2(&v55, sel_initWithDomain_code_userInfo_, v45, -1008, 0);
      BOOL v41 = v46;
      if (v46) {
        [(NWURLError *)v46 fillErrorForLoader:v43 andTask:v44];
      }
    }

    uint64_t v47 = *(void *)(a1 + 32);
    if (v47) {
      objc_storeStrong((id *)(v47 + 88), v41);
    }
  }
  else
  {
    BOOL v41 = 0;
  }

  uint64_t v48 = *(void *)(a1 + 32);
  if (v48) {
    *(unsigned char *)(v48 + 11) = 1;
  }
LABEL_68:
}

void __25__NWURLLoaderHTTP_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 96);
  }
  else {
    uint64_t v3 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __25__NWURLLoaderHTTP_start___block_invoke_3;
  uint64_t v10 = &unk_1E52489F8;
  uint64_t v11 = v2;
  id v4 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v5 = v4;
  uint64_t v6 = v8;
  if (v3)
  {
    BOOL v7 = *(void **)(v3 + 8);
    if (v7) {
      [v7 getCachedResponseForDataTask:v5 completionHandler:v6];
    }
    else {
      v9((uint64_t)v6, 0);
    }
  }
}

void __25__NWURLLoaderHTTP_start___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 56);
  }
  else {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__NWURLLoaderHTTP_start___block_invoke_4;
  v7[3] = &unk_1E5248A20;
  v7[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __25__NWURLLoaderHTTP_start___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  if (!v2 || !*(unsigned char *)(v2 + 12)) {
    (*(void (**)(void))(a1[7] + 16))();
  }
  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  hostname = nw_endpoint_get_hostname(*(nw_endpoint_t *)(a1 + 32));
  sec_protocol_options_set_tls_server_name(v3, hostname);
  uint64_t verify_block = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_2;
  uint64_t v21 = &unk_1E5248A48;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v22 = v5;
  if (v5) {
    id v6 = *(NSObject **)(v5 + 56);
  }
  else {
    id v6 = 0;
  }
  sec_protocol_options_set_verify_block(v3, &verify_block, v6);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __34__NWURLLoaderHTTP_continueLoading__block_invoke_3;
  SEL v16 = &unk_1E5248A98;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v17 = v7;
  if (v7) {
    id v8 = *(NSObject **)(v7 + 56);
  }
  else {
    id v8 = 0;
  }
  sec_protocol_options_set_challenge_block(v3, &v13, v8);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 40);
  }
  else {
    uint64_t v10 = 0;
  }
  -[NWURLSessionTaskConfiguration configureSecProtocolOptions:](v10, v3);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    id v12 = *(void **)(v11 + 48);
  }
  else {
    id v12 = 0;
  }
  objc_msgSend(v12, "joiningContext", v13, v14, v15, v16, v17, verify_block, v19, v20, v21, v22);
  sec_protocol_options_set_nw_protocol_joining_context();
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_6(uint64_t a1, void *a2)
{
  options = a2;
  nw_tcp_options_set_no_delay(options, 1);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 40);
    if (v4)
    {
      if ([*(id *)(v4 + 16) _allowsTCPFastOpen]) {
        nw_tcp_options_set_enable_fast_open(options, 1);
      }
    }
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_7(uint64_t a1, void *a2)
{
  id v24 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 48);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v4 clientMetadata];
  nw_http_messaging_options_set_client_metadata(v24, v5);

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 40)) != 0)
  {
    [*(id *)(v7 + 16) _connectionCachePurgeTimeout];
    uint64_t v9 = v8 - 1;
  }
  else
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  nw_http1_set_idle_timeout(v24, v9);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10 && (uint64_t v11 = *(void *)(v10 + 40)) != 0)
  {
    [*(id *)(v11 + 16) _longLivedConnectionCachePurgeTimeout];
    uint64_t v13 = 2 * v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  nw_http2_set_idle_timeout(v24, v13);
  nw_http3_set_idle_timeout(v24, v13);
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14 && (uint64_t v15 = *(void *)(v14 + 40)) != 0) {
    uint64_t v16 = [*(id *)(v15 + 16) HTTPMaximumConnectionsPerHost];
  }
  else {
    uint64_t v16 = 0;
  }
  nw_http1_set_connection_pool_width(v24, v16);
  uint64_t v17 = *(void *)(a1 + 32);
  if (!v17) {
    goto LABEL_35;
  }
  if (!*(unsigned char *)(v17 + 17))
  {
    uint64_t v18 = *(void *)(v17 + 40);
    if (v18)
    {
      id v19 = *(id *)(v18 + 24);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unint64_t v21 = 1;
        goto LABEL_17;
      }
      unint64_t v22 = [*(id *)(v18 + 32) _allowedProtocolTypes];
      if (!v22) {
        goto LABEL_27;
      }
      unint64_t v21 = (v22 >> 4) & 4 | (v22 >> 3) & 2 | v22 & 1;
      if (v22)
      {
        if (((v22 >> 3) & 2) != 0) {
          goto LABEL_22;
        }
        goto LABEL_17;
      }
LABEL_36:
      nw_http_messaging_options_set_http1_options(v24, 0);
      if ((v21 & 2) != 0)
      {
LABEL_22:
        if (v21 > 3) {
          goto LABEL_27;
        }
LABEL_23:
        if (nw_get_http3_override_onceToken != -1) {
          dispatch_once(&nw_get_http3_override_onceToken, &__block_literal_global_10_74195);
        }
        if (nw_get_http3_override_value != 1) {
          nw_http_messaging_options_set_http3_options(v24, 0);
        }
        goto LABEL_27;
      }
LABEL_17:
      nw_http_messaging_options_set_http2_options(v24, 0);
      if (v21 > 3) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
LABEL_35:
    unint64_t v21 = 0;
    goto LABEL_36;
  }
  nw_http_messaging_options_set_http2_options(v24, 0);
  nw_http_messaging_options_set_http3_options(v24, 0);
  uint64_t v23 = *(void *)(a1 + 32);
  if (v23) {
    *(unsigned char *)(v23 + 17) = 0;
  }
LABEL_27:
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 48);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a4;
  [v6 loaderWillPerformHSTSUpgrade:a3];
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13) {
    goto LABEL_5;
  }
  if (!*(unsigned char *)(v13 + 12))
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](v13);
    uint64_t v13 = *(void *)(a1 + 32);
LABEL_5:
    uint64_t v14 = -[NWURLLoaderHTTP responseFromMetadata:](v13, v9);
    uint64_t v15 = (void *)nw_endpoint_copy_cfurl(v10);
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v17 = *(void **)(v16 + 24);
    }
    else {
      uint64_t v17 = 0;
    }
    id v44 = (void *)[v17 mutableCopy];
    [v44 setURL:v15];
    if (v15)
    {
      uint64_t v18 = [v15 scheme];
      unint64_t v19 = [v18 length] - 2;
      if (v19 >= 4)
      {
      }
      else
      {
        uint64_t v20 = [v18 caseInsensitiveCompare:off_1E523C670[v19]];

        if (!v20)
        {
          BOOL v41 = v14;
          id v42 = v10;
          id v43 = v9;
          id v21 = nw_http_metadata_copy_request(v11);
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_11;
          v53[3] = &unk_1E5248B60;
          id v22 = v44;
          id v54 = v22;
          nw_http_request_access_method(v21, v53);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v23 = [v22 _allHTTPHeaderFieldsAsArrays];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v55 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v50;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v50 != v26) {
                  objc_enumerationMutation(v23);
                }
                [v22 setValue:0 forHTTPHeaderField:*(void *)(*((void *)&v49 + 1) + 8 * v27++)];
              }
              while (v25 != v27);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v55 count:16];
            }
            while (v25);
          }

          BOOL v28 = nw_http_request_copy_url_request(v21, (void *)*MEMORY[0x1E4F18F90], v15);
          uint64_t v29 = [(id)v28 _allHTTPHeaderFieldsAsArrays];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_12;
          v47[3] = &unk_1E5248B88;
          id v30 = v22;
          id v48 = v30;
          [v29 enumerateKeysAndObjectsUsingBlock:v47];

          if (v30)
          {
            uint64_t v31 = [v30 HTTPMethod];
            uint64_t v32 = [v31 caseInsensitiveCompare:@"GET"];

            if (!v32
              || ([v30 HTTPMethod],
                  id v37 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v38 = [v37 caseInsensitiveCompare:@"HEAD"],
                  v37,
                  !v38))
            {
              [v30 setHTTPBody:0];
              [v30 setHTTPBodyStream:0];
            }
          }

          id v10 = v42;
          id v9 = v43;
          uint64_t v14 = v41;
          goto LABEL_21;
        }
      }
    }
    if ([v15 isFileURL])
    {
      uint64_t v39 = *(void *)(a1 + 32);
      if (!v39 || !*(void *)(v39 + 88))
      {
        id v40 = -[NWURLLoaderHTTP errorForErrorCode:]((id *)v39, -1102);
        -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v40);
      }
      (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
      uint64_t v34 = v44;
      goto LABEL_24;
    }
LABEL_21:
    uint64_t v33 = *(void **)(a1 + 32);
    if (v33) {
      uint64_t v33 = (void *)v33[6];
    }
    uint64_t v34 = v44;
    uint64_t v35 = v33;
    uint64_t v36 = (void *)[v44 copy];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_13;
    v45[3] = &unk_1E5248BB0;
    v45[4] = *(void *)(a1 + 32);
    id v46 = v12;
    [v35 loaderWillPerformHTTPRedirection:v14 newRequest:v36 completionHandler:v45];

LABEL_24:
    goto LABEL_25;
  }
  (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
LABEL_25:
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {
LABEL_4:
    double v8 = (id)v7;
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v9 = (void *)v9[9];
    }
    id v10 = v9;
    id v11 = nw_connection_create_with_connection(v10, v5);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      objc_storeStrong((id *)(v12 + 72), v11);
    }

    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v13 = (id)gurlLogObj;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      uint64_t v24 = *(void *)(a1 + 32);
      if (v24 && *(void *)(v24 + 72))
      {
        -[NWURLLoaderHTTP stopResponseStallTimer](v24);
        uint64_t v25 = *(void *)(a1 + 32);
        if (v25) {
          uint64_t v26 = *(void **)(v25 + 64);
        }
        else {
          uint64_t v26 = 0;
        }
        objc_msgSend(v26, "close", v38, v39, v40, v41, v42, v43);
        uint64_t v27 = *(void *)(a1 + 32);
        if (v27)
        {
          BOOL v28 = *(void **)(v27 + 64);
          *(void *)(v27 + 64) = 0;
        }
        nw_content_context_t v29 = nw_content_context_create("http resend context");
        uint64_t v30 = *(void *)(a1 + 32);
        if (v30) {
          objc_storeStrong((id *)(v30 + 80), v29);
        }

        uint64_t v31 = *(void *)(a1 + 32);
        if (v31) {
          uint64_t v32 = *(void *)(v31 + 80);
        }
        else {
          uint64_t v32 = 0;
        }
        v6[2](v6, v32);
        uint64_t v33 = *(void *)(a1 + 32);
        if (v33) {
          uint64_t v34 = *(void **)(v33 + 72);
        }
        else {
          uint64_t v34 = 0;
        }
        -[NWURLLoaderHTTP configureAndStartConnection:](v33, v34);
        -[NWURLLoaderHTTP needRequestBody](*(void *)(a1 + 32));
        -[NWURLLoaderHTTP readResponse](*(void *)(a1 + 32));
        uint64_t v35 = *(void **)(a1 + 32);
        if (!v35) {
          goto LABEL_34;
        }
      }
      else
      {
        -[NWURLLoaderHTTP setConnection:](v24, v8);
        uint64_t v35 = *(void **)(a1 + 32);
        if (!v35) {
          goto LABEL_34;
        }
      }
      uint64_t v35 = (void *)v35[5];
LABEL_34:
      uint64_t v36 = v35;
      id v37 = -[NWURLSessionTaskConfiguration activity]((uint64_t)v36);
      nw_connection_end_activity(v8, v37);

      nw_connection_cancel(v8);
      goto LABEL_35;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14 && (id v15 = *(id *)(v14 + 48)) != 0)
    {
      uint64_t v16 = v15;
      [v15 logDescription];
      uint64_t v17 = *(void *)(a1 + 32);
      if (!v17) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      LODWORD(v43) = 0;
      uint64_t v17 = *(void *)(a1 + 32);
      if (!v17) {
        goto LABEL_36;
      }
    }
    id v18 = *(id *)(v17 + 48);
    if (v18)
    {
      unint64_t v19 = v18;
      [v18 logDescription];
      int v20 = v40;
      uint64_t v21 = *(void *)(a1 + 32);
      if (!v21)
      {
LABEL_37:
        id v22 = 0;
        goto LABEL_19;
      }
LABEL_18:
      id v22 = *(void **)(v21 + 72);
LABEL_19:
      uint64_t id = nw_connection_get_id(v22);
      *(_DWORD *)buf = 68289538;
      int v45 = 16;
      __int16 v46 = 2098;
      uint64_t v47 = &v41;
      __int16 v48 = 1024;
      int v49 = v20;
      __int16 v50 = 2048;
      uint64_t v51 = id;
      _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> created [C%llu]", buf, 0x22u);

      goto LABEL_20;
    }
LABEL_36:
    int v20 = 0;
    unint64_t v19 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    LODWORD(v40) = 0;
    uint64_t v21 = *(void *)(a1 + 32);
    if (!v21) {
      goto LABEL_37;
    }
    goto LABEL_18;
  }
  if (!*(unsigned char *)(v7 + 12))
  {
    uint64_t v7 = *(void *)(v7 + 72);
    goto LABEL_4;
  }
LABEL_35:
}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (*(unsigned char *)(v4 + 12)) {
      return 0;
    }
    uint64_t v4 = *(void *)(v4 + 72);
  }
  uint64_t v6 = (id)v4;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    double v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = 0;

    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v9 = 0;
  }
  -[NWURLLoaderHTTP stopResponseStallTimer](v9);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 64);
  }
  else {
    id v11 = 0;
  }
  [v11 close];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12
    && (uint64_t v13 = *(void **)(v12 + 64), *(void *)(v12 + 64) = 0, v13, (v14 = *(void *)(a1 + 32)) != 0))
  {
    *(unsigned char *)(v14 + 17) = 1;
    uint64_t v15 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[NWURLLoaderHTTP continueLoading](v15);
  -[NWURLLoaderHTTP readResponse](*(void *)(a1 + 32));
  uint64_t v16 = *(void **)(a1 + 32);
  if (v16) {
    uint64_t v16 = (void *)v16[5];
  }
  uint64_t v17 = v16;
  id v18 = -[NWURLSessionTaskConfiguration activity]((uint64_t)v17);
  nw_connection_end_activity(v6, v18);

  nw_connection_cancel(v6);
  return 1;
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v37 = a3;
  uint64_t v6 = (__CFHTTPMessage *)nw_authentication_challenge_copy_http_message(v5);
  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  double v8 = (void *)nw_authentication_challenge_copy_protection_space(v5);
  uint64_t v9 = nw_authentication_protection_space_copy_endpoint(v8);
  uint64_t v10 = (void *)nw_endpoint_copy_cfurl(v9);
  if (v10) {
    _CFHTTPMessageSetResponseProxyURL();
  }
  id v11 = CFHTTPAuthenticationCreateFromResponse((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
  if (!v11)
  {
    BOOL v25 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = v11;
  BOOL v13 = nw_http_authentication_parse_schemes(v11, v9, 1, 1, 0);
  uint64_t v14 = (void *)v13;
  if (v13 && *(void *)(v13 + 24) != *(void *)(v13 + 16))
  {
    nw_authentication_challenge_set_protection_space_array(v5, (void *)v13);
    int type = nw_authentication_challenge_get_type(v5);
    if (type == 4) {
      goto LABEL_22;
    }
    int v16 = type;
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      uint64_t v18 = *(void *)(v17 + 40);
    }
    else {
      uint64_t v18 = 0;
    }
    unint64_t v19 = -[NWURLSessionTaskConfiguration URLCredentialStorage](v18);

    if (v19)
    {
      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        uint64_t v21 = *(void *)(v20 + 40);
      }
      else {
        uint64_t v21 = 0;
      }
      id v22 = -[NWURLSessionTaskConfiguration URLCredentialStorage](v21);
      uint64_t v36 = a1;
      uint64_t v23 = nw_authentication_credential_storage_copy_default_credential(v22, v5);

      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v35 = v24[3];

        if (v35) {
          nw_authentication_challenge_set_proposed_credential(v5, v24);
        }
      }

      a1 = v36;
    }
    if (v16 != 5) {
LABEL_22:
    }
      BOOL v25 = 0;
    else {
      BOOL v25 = _CFHTTPAuthenticationIsSecondNTLMTransaction() != 0;
    }

    CFRelease(v12);
LABEL_24:
    CFRelease(v7);

    if (v25)
    {
LABEL_25:
      (*((void (**)(id, void, void))v37 + 2))(v37, 0, 0);
      goto LABEL_35;
    }
LABEL_26:
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27)
    {
      BOOL v28 = (id *)*(id *)(v27 + 40);
      nw_content_context_t v29 = v28;
      if (v28 && ([v28[2] _requiresSecureHTTPSProxyConnection] & 1) != 0) {
        goto LABEL_33;
      }
      uint64_t v30 = *(void *)(a1 + 32);
      if (!v30)
      {
LABEL_39:
        if (nw_proxy_options_authbroker_is_available::onceToken != -1) {
          dispatch_once(&nw_proxy_options_authbroker_is_available::onceToken, &__block_literal_global_35645);
        }
        char v34 = nw_proxy_options_authbroker_is_available::available;

        if (v34) {
          goto LABEL_25;
        }
LABEL_34:
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void **)(a1 + 40);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_47;
        v38[3] = &unk_1E5248C50;
        v38[4] = v32;
        id v39 = v37;
        -[NWURLLoaderHTTP handleAuthenticationChallenge:url:cancel:completionHandler:](v32, v5, v33, 0, v38);

        goto LABEL_35;
      }
    }
    else
    {
      nw_content_context_t v29 = 0;
      uint64_t v30 = *(void *)(a1 + 32);
      if (!v30) {
        goto LABEL_39;
      }
    }
    if (*(unsigned char *)(v30 + 18)
      || (uint64_t v31 = *(void *)(v30 + 40)) != 0
      && ([*(id *)(v31 + 16) _preventsSystemHTTPProxyAuthentication] & 1) != 0)
    {
LABEL_33:

      goto LABEL_34;
    }
    goto LABEL_39;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  uint64_t v26 = (id)gLogObj;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v41 = "-[NWURLLoaderHTTP continueLoading]_block_invoke_2";
    _os_log_impl(&dword_1830D4000, v26, OS_LOG_TYPE_ERROR, "%{public}s Unable to determine authentication type", buf, 0xCu);
  }

  CFRelease(v12);
  CFRelease(v7);
  (*((void (**)(id, void, uint64_t))v37 + 2))(v37, 0, 1);

LABEL_35:
}

- (void)configureAndStartConnection:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke;
    handler[3] = &unk_1E524BB98;
    id v5 = v3;
    int v16 = v5;
    uint64_t v17 = a1;
    nw_connection_set_state_changed_handler(v5, handler);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_53;
    v12[3] = &unk_1E5248C78;
    uint64_t v6 = v5;
    BOOL v13 = v6;
    uint64_t v14 = a1;
    nw_connection_set_better_path_available_handler(v6, v12);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_55;
    v9[3] = &unk_1E5248C78;
    uint64_t v7 = v6;
    uint64_t v10 = v7;
    uint64_t v11 = a1;
    nw_connection_set_viability_changed_handler(v7, v9);
    *(unsigned char *)(a1 + 9) = 0;
    double v8 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0;

    nw_connection_set_queue(v7, *(dispatch_queue_t *)(a1 + 56));
    -[NWURLSessionTaskConfiguration configureConnection:](*(void *)(a1 + 40), v7);
    nw_connection_start(v7);
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    uint64_t v7 = *(void *)(v7 + 72);
  }
  if (*(void *)(a1 + 32) != v7) {
    goto LABEL_107;
  }
  if (gLogDatapath)
  {
    id v95 = v5;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v96 = (id)gurlLogObj;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v97 = *(void *)(a1 + 40);
      if (v97 && (id v98 = *(id *)(v97 + 48)) != 0)
      {
        os_log_type_t v99 = v98;
        [v98 logDescription];
      }
      else
      {
        os_log_type_t v99 = 0;
        v173[0] = 0;
        v173[1] = 0;
        int v174 = 0;
      }
      uint64_t v100 = *(void *)(a1 + 40);
      if (v100 && (id v101 = *(id *)(v100 + 48)) != 0)
      {
        v102 = v101;
        [v101 logDescription];
        int v103 = v172;
      }
      else
      {
        int v103 = 0;
        v102 = 0;
        uint64_t v170 = 0;
        uint64_t v171 = 0;
        int v172 = 0;
      }
      if (a2 > 5) {
        BOOL v104 = "unknown";
      }
      else {
        BOOL v104 = off_1E523DF08[a2];
      }
      *(_DWORD *)buf = 136447490;
      *(void *)&uint8_t buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = v173;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v103;
      *(_WORD *)&buf[34] = 2080;
      *(void *)&buf[36] = v104;
      *(_WORD *)&unsigned char buf[44] = 2112;
      *(void *)&buf[46] = v95;
      _os_log_impl(&dword_1830D4000, v96, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection state: %s, error: %@", buf, 0x36u);
    }
    uint64_t v6 = v95;
  }
  switch(a2)
  {
    case 1u:
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = v6;
      if (v8) {
        uint64_t v10 = *(void **)(v8 + 48);
      }
      else {
        uint64_t v10 = 0;
      }
      [v10 loaderWaitingForConnectivity];
      goto LABEL_89;
    case 2u:
      uint64_t v72 = *(void *)(a1 + 40);
      uint64_t v9 = v6;
      if (v72) {
        int v73 = *(void **)(v72 + 48);
      }
      else {
        int v73 = 0;
      }
      [v73 loaderPreparingConnection];
LABEL_89:
      uint64_t v6 = v9;
      goto LABEL_107;
    case 3u:
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        *(unsigned char *)(v11 + 9) = 1;
      }
      uint64_t v12 = *(NSObject **)(a1 + 32);
      v159 = v6;
      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL v13 = (id)nw_protocol_copy_http_connection_definition_definition;
      nw_protocol_metadata_t obj = nw_connection_copy_protocol_metadata(v12, v13);

      if (!obj) {
        goto LABEL_53;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14)
      {
        objc_storeStrong((id *)(v14 + 144), obj);
        uint64_t v15 = *(void *)(a1 + 40);
      }
      else
      {
        uint64_t v15 = 0;
      }
      -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](v15);
      id establishment_report = nw_http_connection_metadata_get_establishment_report(obj);
      BOOL v17 = establishment_report == 0;

      if (!v17) {
        goto LABEL_53;
      }
      id v18 = nw_connection_copy_establishment_report_on_queue(*(void **)(a1 + 32));
      unint64_t v19 = obj;
      id v20 = v18;
      uint64_t v21 = v19;
      id v22 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v22, nw_protocol_copy_http_connection_definition_definition);

      if (is_equal_unsafe)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __nw_http_connection_metadata_set_establishment_report_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E5248F68;
        id v24 = v20;
        *(void *)&buf[32] = v24;
        if (v21[4])
        {
          (*(void (**)(unsigned char *))&buf[16])(buf);
          id v24 = *(id *)&buf[32];
        }

        goto LABEL_23;
      }
      Class v105 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
      LODWORD(v158) = 12;
      v157 = buf;
      id v106 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v162 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v106, type, &v162)) {
        goto LABEL_197;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        id v107 = __nwlog_obj();
        os_log_type_t v108 = type[0];
        if (os_log_type_enabled(v107, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_1830D4000, v107, v108, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_139:

        goto LABEL_197;
      }
      if (v162 == OS_LOG_TYPE_DEFAULT)
      {
        id v107 = __nwlog_obj();
        os_log_type_t v142 = type[0];
        if (os_log_type_enabled(v107, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_1830D4000, v107, v142, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_139;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v126 = __nwlog_obj();
      os_log_type_t v127 = type[0];
      BOOL v128 = os_log_type_enabled(v126, type[0]);
      if (backtrace_string)
      {
        if (v128)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v126, v127, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      else
      {
        if (v128)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_establishment_report";
          _os_log_impl(&dword_1830D4000, v126, v127, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
LABEL_197:
      if (v106) {
        free(v106);
      }
LABEL_23:

      int privacy_stance = nw_connection_get_privacy_stance(*(void **)(a1 + 32));
      nw_http_connection_metadata_set_privacy_stance(v21, privacy_stance);
      if (!nw_connection_uses_multipath(*(void **)(a1 + 32))) {
        goto LABEL_30;
      }
      uint64_t v26 = v21;
      id v27 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL v28 = nw_protocol_definition_is_equal_unsafe((uint64_t)v27, nw_protocol_copy_http_connection_definition_definition);

      if (v28)
      {
        uint64_t v29 = (uint64_t)v26[4];
        if (v29) {
          __nw_http_connection_metadata_set_multipath_block_invoke((uint64_t)&__block_literal_global_103_77009, v29);
        }
        goto LABEL_29;
      }
      uint64_t v113 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_multipath";
      LODWORD(v158) = 12;
      v157 = buf;
      uint64_t v114 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      os_log_type_t v162 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v114, type, &v162)) {
        goto LABEL_219;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        uint64_t v115 = __nwlog_obj();
        os_log_type_t v116 = type[0];
        if (os_log_type_enabled(v115, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_1830D4000, v115, v116, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_149:

        goto LABEL_219;
      }
      if (v162 == OS_LOG_TYPE_DEFAULT)
      {
        uint64_t v115 = __nwlog_obj();
        os_log_type_t v148 = type[0];
        if (os_log_type_enabled(v115, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_1830D4000, v115, v148, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_149;
      }
      os_log_type_t v133 = (char *)__nw_create_backtrace_string();
      int v134 = __nwlog_obj();
      HIDWORD(v158) = type[0];
      BOOL v135 = os_log_type_enabled(v134, type[0]);
      if (v133)
      {
        if (v135)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_multipath";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v133;
          _os_log_impl(&dword_1830D4000, v134, BYTE4(v158), "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v133);
      }
      else
      {
        if (v135)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_multipath";
          _os_log_impl(&dword_1830D4000, v134, BYTE4(v158), "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
LABEL_219:
      if (v114) {
        free(v114);
      }
LABEL_29:

LABEL_30:
      *(void *)int type = 0;
      uint64_t v169 = 0;
      nw_connection_get_uuid(*(void **)(a1 + 32), (unsigned __int8 *)type);
      nw_http_connection_metadata_set_uuid(v21, (uint64_t)type);
      if (!nw_connection_is_unlisted_tracker(*(void **)(a1 + 32))) {
        goto LABEL_37;
      }
      uint64_t v30 = v21;
      id v31 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL v32 = nw_protocol_definition_is_equal_unsafe((uint64_t)v31, nw_protocol_copy_http_connection_definition_definition);

      if (v32)
      {
        uint64_t v33 = (uint64_t)v30[4];
        if (v33) {
          __nw_http_connection_metadata_set_unlisted_tracker_block_invoke((uint64_t)&__block_literal_global_105_77035, v33);
        }
        goto LABEL_36;
      }
      id v117 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
      LODWORD(v158) = 12;
      v157 = buf;
      BOOL v118 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v162 = OS_LOG_TYPE_ERROR;
      char v161 = 0;
      if (!__nwlog_fault(v118, &v162, &v161)) {
        goto LABEL_224;
      }
      if (v162 == OS_LOG_TYPE_FAULT)
      {
        int v119 = __nwlog_obj();
        os_log_type_t v120 = v162;
        if (os_log_type_enabled(v119, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v119, v120, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_154:

        goto LABEL_224;
      }
      if (!v161)
      {
        int v119 = __nwlog_obj();
        os_log_type_t v149 = v162;
        if (os_log_type_enabled(v119, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v119, v149, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_154;
      }
      BOOL v136 = (char *)__nw_create_backtrace_string();
      os_log_type_t v137 = __nwlog_obj();
      HIDWORD(v158) = v162;
      BOOL v138 = os_log_type_enabled(v137, v162);
      if (v136)
      {
        if (v138)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v136;
          _os_log_impl(&dword_1830D4000, v137, BYTE4(v158), "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v136);
      }
      else
      {
        if (v138)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_unlisted_tracker";
          _os_log_impl(&dword_1830D4000, v137, BYTE4(v158), "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
LABEL_224:
      if (v118) {
        free(v118);
      }
LABEL_36:

LABEL_37:
      if (!nw_connection_used_tfo(*(void **)(a1 + 32))) {
        goto LABEL_44;
      }
      char v34 = v21;
      id v35 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL v36 = nw_protocol_definition_is_equal_unsafe((uint64_t)v35, nw_protocol_copy_http_connection_definition_definition);

      if (v36)
      {
        uint64_t v37 = (uint64_t)v34[4];
        if (v37) {
          __nw_http_connection_metadata_set_used_tfo_block_invoke((uint64_t)&__block_literal_global_107, v37);
        }
        goto LABEL_43;
      }
      uint64_t v121 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_used_tfo";
      LODWORD(v158) = 12;
      v157 = buf;
      uint64_t v122 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v162 = OS_LOG_TYPE_ERROR;
      char v161 = 0;
      if (!__nwlog_fault(v122, &v162, &v161)) {
        goto LABEL_229;
      }
      if (v162 == OS_LOG_TYPE_FAULT)
      {
        id v123 = __nwlog_obj();
        os_log_type_t v124 = v162;
        if (os_log_type_enabled(v123, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_used_tfo";
          _os_log_impl(&dword_1830D4000, v123, v124, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_159:

        goto LABEL_229;
      }
      if (!v161)
      {
        id v123 = __nwlog_obj();
        os_log_type_t v150 = v162;
        if (os_log_type_enabled(v123, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_used_tfo";
          _os_log_impl(&dword_1830D4000, v123, v150, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_159;
      }
      v139 = (char *)__nw_create_backtrace_string();
      uint64_t v140 = __nwlog_obj();
      HIDWORD(v158) = v162;
      BOOL v141 = os_log_type_enabled(v140, v162);
      if (v139)
      {
        if (v141)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_used_tfo";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v139;
          _os_log_impl(&dword_1830D4000, v140, BYTE4(v158), "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v139);
      }
      else
      {
        if (v141)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_used_tfo";
          _os_log_impl(&dword_1830D4000, v140, BYTE4(v158), "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
LABEL_229:
      if (v122) {
        free(v122);
      }
LABEL_43:

LABEL_44:
      id v38 = nw_connection_copy_connected_path(*(void **)(a1 + 32));
      if (!v38) {
        goto LABEL_52;
      }
      id v39 = v21;
      id v40 = v38;
      uint64_t v41 = v39;
      id v42 = v21[1];

      if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_89);
      }
      BOOL v43 = nw_protocol_definition_is_equal_unsafe((uint64_t)v42, nw_protocol_copy_http_connection_definition_definition);

      if (v43)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __nw_http_connection_metadata_set_path_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E5248F68;
        id v44 = v40;
        *(void *)&buf[32] = v44;
        if (v41[4])
        {
          (*(void (**)(unsigned char *))&buf[16])(buf);
          id v44 = *(id *)&buf[32];
        }

        goto LABEL_51;
      }
      os_log_type_t v109 = __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_path";
      LODWORD(v158) = 12;
      v157 = buf;
      os_log_type_t v110 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v162 = OS_LOG_TYPE_ERROR;
      char v161 = 0;
      if (!__nwlog_fault(v110, &v162, &v161)) {
        goto LABEL_214;
      }
      if (v162 == OS_LOG_TYPE_FAULT)
      {
        __int16 v111 = __nwlog_obj();
        os_log_type_t v112 = v162;
        if (os_log_type_enabled(v111, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_1830D4000, v111, v112, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
LABEL_144:

        goto LABEL_214;
      }
      if (!v161)
      {
        __int16 v111 = __nwlog_obj();
        os_log_type_t v147 = v162;
        if (os_log_type_enabled(v111, v162))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_1830D4000, v111, v147, "%{public}s metadata must be http_connection, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_144;
      }
      v129 = (char *)__nw_create_backtrace_string();
      uint64_t v130 = __nwlog_obj();
      os_log_type_t v131 = v162;
      BOOL v132 = os_log_type_enabled(v130, v162);
      if (v129)
      {
        if (v132)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_path";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v129;
          _os_log_impl(&dword_1830D4000, v130, v131, "%{public}s metadata must be http_connection, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v129);
      }
      else
      {
        if (v132)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "nw_http_connection_metadata_set_path";
          _os_log_impl(&dword_1830D4000, v130, v131, "%{public}s metadata must be http_connection, no backtrace", buf, 0xCu);
        }
      }
LABEL_214:
      if (v110) {
        free(v110);
      }
LABEL_51:

LABEL_52:
LABEL_53:
      int v45 = *(void **)(a1 + 40);
      if (v45) {
        int v45 = (void *)v45[9];
      }
      __int16 v46 = v45;
      uint64_t v47 = nw_protocol_boringssl_copy_definition();
      nw_protocol_metadata_t v48 = nw_connection_copy_protocol_metadata(v46, v47);

      if (v48)
      {
        sec_protocol_metadata_t v49 = v48;
        goto LABEL_57;
      }
      id v74 = *(void **)(a1 + 40);
      if (v74) {
        id v74 = (void *)v74[9];
      }
      BOOL v75 = v74;
      if (nw_protocol_copy_quic_stream_definition::onceToken != -1) {
        dispatch_once(&nw_protocol_copy_quic_stream_definition::onceToken, &__block_literal_global_15_56153);
      }
      uint64_t v76 = (id)nw_protocol_copy_quic_stream_definition::quic_definition;
      char v77 = nw_connection_copy_protocol_metadata(v75, v76);

      if (!v77)
      {
        __int16 v50 = 0;
        sec_protocol_metadata_t v49 = 0;
LABEL_59:

        goto LABEL_60;
      }
      sec_protocol_metadata_t v49 = nw_quic_copy_sec_protocol_metadata(v77);

      if (v49)
      {
LABEL_57:
        __int16 v50 = (void *)sec_protocol_metadata_copy_sec_trust();
        uint64_t v51 = *(void *)(a1 + 40);
        if (v51) {
          objc_storeStrong((id *)(v51 + 168), v50);
        }
        goto LABEL_59;
      }
LABEL_60:
      uint64_t v52 = *(void *)(a1 + 40);
      id v53 = *(id *)(a1 + 32);
      id v54 = v53;
      if (v52)
      {
        objc_super v55 = nw_connection_copy_connected_remote_endpoint(v53);
        BOOL v56 = nw_endpoint_copy_proxy_original_endpoint(v55);
        if (nw_connection_is_unlisted_tracker(v54))
        {
          if (v55 && v55[11])
          {
            id v57 = objc_msgSend(NSString, "stringWithUTF8String:");
          }
          else
          {
            uint64_t v78 = objc_msgSend(*(id *)(v52 + 24), "URL", v157, v158);
            id v57 = [v78 host];
          }
        }
        else
        {
          id v57 = 0;
        }
        if (v56 || nw_connection_get_privacy_stance(v54) == 2)
        {
          v79 = 0;
        }
        else
        {
          id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __35__NWURLLoaderHTTP_reportConnected___block_invoke;
          *(void *)&unsigned char buf[24] = &unk_1E5248CA0;
          id v84 = v83;
          *(void *)&buf[32] = v84;
          nw_endpoint_enumerate_cnames(v55, buf);
          if ([v84 count]) {
            v79 = (void *)[v84 copy];
          }
          else {
            v79 = 0;
          }
        }
        uint64_t v80 = *(void *)(v52 + 144);
        id v81 = *(id *)(v52 + 48);
        [v81 loaderConnectedWithHTTPConnectionMetadata:v80 CNAMEChain:v79 unlistedTracker:v57];
      }
      uint64_t v82 = *(void *)(a1 + 40);
      if (v82 && *(unsigned char *)(v82 + 16)) {
        -[NWURLLoaderHTTP startResponseStallTimer](v82);
      }

      uint64_t v6 = v159;
      goto LABEL_107;
    case 4u:
      uint64_t v58 = *(void *)(a1 + 40);
      if (!v6) {
        goto LABEL_72;
      }
      if (v58 && *(void *)(v58 + 88)) {
        goto LABEL_73;
      }
      uint64_t v59 = v6;
      id v60 = -[NWURLLoaderHTTP errorForNWError:]((id *)v58, v6);
      uint64_t v61 = *(void *)(a1 + 40);
      if (v61) {
        objc_storeStrong((id *)(v61 + 88), v60);
      }

      uint64_t v62 = *(void *)(a1 + 40);
      if (!v62)
      {
        uint64_t v58 = 0;
LABEL_76:
        if (-[NWURLLoaderHTTP pendingErrorIsRetryable](v58))
        {
          if (gLogDatapath)
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
            }
            v143 = (id)gurlLogObj;
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v144 = *(void *)(a1 + 40);
              if (v144 && (id v145 = *(id *)(v144 + 48)) != 0)
              {
                os_log_type_t v146 = v145;
                [v145 logDescription];
              }
              else
              {
                os_log_type_t v146 = 0;
                v166[0] = 0;
                v166[1] = 0;
                int v167 = 0;
              }
              uint64_t v151 = *(void *)(a1 + 40);
              if (v151 && (id v152 = *(id *)(v151 + 48)) != 0)
              {
                v153 = v152;
                [v152 logDescription];
                int v154 = v165;
              }
              else
              {
                int v154 = 0;
                v153 = 0;
                uint64_t v163 = 0;
                uint64_t v164 = 0;
                int v165 = 0;
              }
              uint64_t v155 = *(void *)(a1 + 40);
              if (v155)
              {
                int v156 = *(char *)(v155 + 19);
                uint64_t v155 = *(void *)(v155 + 88);
              }
              else
              {
                int v156 = 0;
              }
              *(_DWORD *)buf = 136447490;
              *(void *)&uint8_t buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
              *(_WORD *)&buf[12] = 1042;
              *(_DWORD *)&buf[14] = 16;
              *(_WORD *)&buf[18] = 2098;
              *(void *)&buf[20] = v166;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v154;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v156;
              *(_WORD *)&buf[40] = 2112;
              *(void *)&buf[42] = v155;
              _os_log_impl(&dword_1830D4000, v143, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> retrying pre-connected connection on attempt %u with error: %@", buf, 0x32u);
            }
          }
          -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 40), 0);
          uint64_t v63 = *(void *)(a1 + 40);
          if (v63)
          {
            ++*(unsigned char *)(v63 + 19);
            uint64_t v63 = *(void *)(a1 + 40);
            if (v63) {
              uint64_t v63 = *(void *)(v63 + 72);
            }
          }
          double v64 = (id)v63;
          -[NWURLLoaderHTTP setConnection:](*(void *)(a1 + 40), 0);
          -[NWURLLoaderHTTP stopResponseStallTimer](*(void *)(a1 + 40));
          uint64_t v65 = *(void *)(a1 + 40);
          if (v65) {
            id v66 = *(void **)(v65 + 64);
          }
          else {
            id v66 = 0;
          }
          [v66 close];
          uint64_t v68 = *(void *)(a1 + 40);
          id v67 = (uint64_t *)(a1 + 40);
          -[NWURLLoaderHTTP setRequestBodyProvider:](v68);
          -[NWURLLoaderHTTP continueLoading](*v67);
          -[NWURLLoaderHTTP needRequestBody](*v67);
          -[NWURLLoaderHTTP readResponse](*v67);
          uint64_t v69 = (void *)*v67;
          if (*v67) {
            uint64_t v69 = (void *)v69[5];
          }
          char v70 = v69;
          uint64_t v71 = -[NWURLSessionTaskConfiguration activity]((uint64_t)v70);
          nw_connection_end_activity(v64, v71);

          nw_connection_cancel(v64);
          goto LABEL_116;
        }
LABEL_111:
        metadata = nw_http_connection_create_metadata(0, 0, 0);
        int v86 = nw_connection_get_privacy_stance(*(void **)(a1 + 32));
        nw_http_connection_metadata_set_privacy_stance(metadata, v86);
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        nw_connection_get_uuid(*(void **)(a1 + 32), buf);
        nw_http_connection_metadata_set_uuid(metadata, (uint64_t)buf);
        uint64_t v87 = *(void *)(a1 + 40);
        if (v87) {
          id v88 = *(void **)(v87 + 48);
        }
        else {
          id v88 = 0;
        }
        BOOL v89 = [v88 clientMetadata];
        id v90 = nw_http_client_metadata_copy_current_transaction_metadata(v89);

        nw_http_transaction_metadata_set_connection_metadata(v90, metadata);
        nw_http_transaction_metadata_set_first_on_connection(v90);
        -[NWURLLoaderHTTP cancelConnection](*(void *)(a1 + 40));
        uint64_t v91 = *(void *)(a1 + 40);
        if (v91)
        {
          os_log_type_t v92 = *(void **)(v91 + 48);
          uint64_t v93 = *(void *)(v91 + 88);
        }
        else
        {
          os_log_type_t v92 = 0;
          uint64_t v93 = 0;
        }
        id v94 = v92;
        [v94 loaderFailedToConnect:v93];

LABEL_116:
        uint64_t v6 = v59;
        goto LABEL_107;
      }
      *(unsigned char *)(v62 + 8) = 1;
      uint64_t v58 = *(void *)(a1 + 40);
      uint64_t v6 = v59;
LABEL_72:
      if (!v58)
      {
        uint64_t v59 = v6;
        goto LABEL_76;
      }
LABEL_73:
      if (!*(unsigned char *)(v58 + 9) && !*(unsigned char *)(v58 + 12))
      {
        uint64_t v59 = v6;
        if (*(char *)(v58 + 19) > 2) {
          goto LABEL_111;
        }
        goto LABEL_76;
      }
LABEL_107:

      return;
    default:
      goto LABEL_107;
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_53(uint64_t a1, int a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 72);
  }
  if (*(void *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if (!a2) {
        return;
      }
      goto LABEL_6;
    }
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v7 = (id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8 && (id v9 = *(id *)(v8 + 48)) != 0)
      {
        uint64_t v10 = v9;
        [v9 logDescription];
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        LODWORD(v20) = 0;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11 && (id v12 = *(id *)(v11 + 48)) != 0)
      {
        BOOL v13 = v12;
        [v12 logDescription];
        int v14 = v17;
      }
      else
      {
        int v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        LODWORD(v17) = 0;
      }
      *(_DWORD *)buf = 136447234;
      id v22 = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      __int16 v23 = 1042;
      int v24 = 16;
      __int16 v25 = 2098;
      uint64_t v26 = &v18;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 1024;
      int v30 = a2;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection better path: %{BOOL}d", buf, 0x28u);
    }
    if (a2)
    {
LABEL_6:
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        uint64_t v6 = *(void **)(v5 + 48);
      }
      else {
        uint64_t v6 = 0;
      }
      objc_msgSend(v6, "loaderBetterPathAvailable", v15, v16, v17, v18, v19, v20);
    }
  }
}

void __47__NWURLLoaderHTTP_configureAndStartConnection___block_invoke_55(uint64_t a1, int a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 72);
  }
  if (*(void *)(a1 + 32) == v4)
  {
    if (!gLogDatapath)
    {
      if (a2) {
        return;
      }
LABEL_6:
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v5 = (id)gurlLogObj;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        uint64_t v13 = *(void *)(a1 + 40);
        if (v13)
        {
          if (*(void *)(v13 + 88))
          {
LABEL_26:
            -[NWURLLoaderHTTP cancelConnection](v13);
            return;
          }
          int v14 = [NWURLError alloc];
          uint64_t v15 = [*(id *)(v13 + 48) loaderTask];
          id v16 = (id)v13;
          id v17 = v15;
          if (v14)
          {
            uint64_t v18 = *MEMORY[0x1E4F289A0];
            *(void *)buf = v14;
            *(void *)&buf[8] = NWURLError;
            uint64_t v19 = (NWURLError *)objc_msgSendSuper2((objc_super *)buf, sel_initWithDomain_code_userInfo_, v18, -1005, 0);
            int v14 = v19;
            if (v19) {
              [(NWURLError *)v19 fillErrorForLoader:v16 andTask:v17];
            }
          }

          uint64_t v20 = *(void *)(a1 + 40);
          if (v20) {
            objc_storeStrong((id *)(v20 + 88), v14);
          }
        }
        else
        {
          int v14 = 0;
        }

        uint64_t v13 = *(void *)(a1 + 40);
        goto LABEL_26;
      }
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6 && (id v7 = *(id *)(v6 + 48)) != 0)
      {
        uint64_t v8 = v7;
        [v7 logDescription];
        uint64_t v9 = *(void *)(a1 + 40);
        if (!v9) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v8 = 0;
        v30[0] = 0;
        v30[1] = 0;
        int v31 = 0;
        uint64_t v9 = *(void *)(a1 + 40);
        if (!v9) {
          goto LABEL_16;
        }
      }
      id v10 = *(id *)(v9 + 48);
      if (v10)
      {
        uint64_t v11 = v10;
        [v10 logDescription];
        int v12 = v29;

LABEL_17:
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(void *)&buf[10] = v30;
        __int16 v38 = 1024;
        LODWORD(v39) = v12;
        _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> connection not viable", buf, 0x18u);

        goto LABEL_18;
      }
LABEL_16:
      int v12 = 0;
      goto LABEL_17;
    }
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v21 = (id)gurlLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      if (v22 && (id v23 = *(id *)(v22 + 48)) != 0)
      {
        int v24 = v23;
        [v23 logDescription];
      }
      else
      {
        int v24 = 0;
        v35[0] = 0;
        v35[1] = 0;
        int v36 = 0;
      }
      uint64_t v25 = *(void *)(a1 + 40);
      if (v25 && (id v26 = *(id *)(v25 + 48)) != 0)
      {
        __int16 v27 = v26;
        [v26 logDescription];
        int v28 = v34;
      }
      else
      {
        int v28 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        int v34 = 0;
      }
      *(_DWORD *)buf = 136447234;
      *(void *)&uint8_t buf[4] = "-[NWURLLoaderHTTP configureAndStartConnection:]_block_invoke";
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v38 = 2098;
      id v39 = v35;
      __int16 v40 = 1024;
      int v41 = v28;
      __int16 v42 = 1024;
      int v43 = a2;
      _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> connection viable: %{BOOL}d", buf, 0x28u);
    }
    if ((a2 & 1) == 0) {
      goto LABEL_6;
    }
  }
}

- (void)addProgressObserverForResponseStallTimer
{
  if (a1 && *(void *)(a1 + 152) && *(void *)(a1 + 144))
  {
    if (HTTPNotificationCenter_onceToken[0] != -1) {
      dispatch_once(HTTPNotificationCenter_onceToken, &__block_literal_global_209);
    }
    uint64_t v2 = *(void *)(a1 + 144);
    id v3 = (id)HTTPNotificationCenter_center;
    [v3 addObserver:a1 selector:sel_restartStallTimer_ name:@"NWURLLoaderHTTPConnectionProgressNotification" object:v2];
  }
}

- (void)startResponseStallTimer
{
  if (!*(unsigned char *)(a1 + 10))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      if ([*(id *)(v2 + 16) _reportsDataStalls])
      {
        id v3 = *(id *)(a1 + 48);
        uint64_t v4 = [v3 networkContext];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke;
        v7[3] = &unk_1E524BAA8;
        v7[4] = a1;
        *(void *)(a1 + 152) = nw_queue_context_create_source(v4, 2, 3, 0, v7, 0);

        uint64_t v5 = *(void *)(a1 + 152);
        dispatch_time_t v6 = dispatch_time(0x8000000000000000, 3000000000);
        nw_queue_set_timer_values(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        nw_queue_activate_source(*(void *)(a1 + 152));
        -[NWURLLoaderHTTP addProgressObserverForResponseStallTimer](a1);
      }
    }
  }
}

- (uint64_t)pendingErrorIsRetryable
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 88);
    if (v2)
    {
      id v3 = *(id *)(v1 + 88);
      if ([v3 code] == -1005)
      {
        uint64_t v1 = 1;
      }
      else
      {
        id v4 = *(id *)(v1 + 88);
        uint64_t v1 = [v4 code] == -1017 || objc_msgSend(*(id *)(v1 + 88), "code") == -1200;
      }
    }
    else
    {
      uint64_t v1 = 1;
    }
  }
  return v1;
}

- (void)setConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setRequestBodyProvider:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), 0);
  }
}

- (void)needRequestBody
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      id v2 = *(void **)(a1 + 48);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __34__NWURLLoaderHTTP_needRequestBody__block_invoke;
      v6[3] = &unk_1E5248CF8;
      v6[4] = a1;
      [v2 loaderNeedsBodyProviderFromOffset:0 completionHandler:v6];
    }
    else
    {
      *(unsigned char *)(a1 + 16) = 1;
      id v5 = *(id *)(a1 + 136);
      objc_setProperty_nonatomic_copy((id)a1, v3, 0, 136);
      id v4 = v5;
      if (v5)
      {
        (*((void (**)(id))v5 + 2))(v5);
        id v4 = v5;
      }
      if (*(unsigned char *)(a1 + 9))
      {
        -[NWURLLoaderHTTP startResponseStallTimer](a1);
        id v4 = v5;
      }
    }
  }
}

void __34__NWURLLoaderHTTP_needRequestBody__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  if (v4)
  {
    if (v5)
    {
      *(unsigned char *)(v5 + 16) = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        objc_storeStrong((id *)(v6 + 64), a2);
        uint64_t v5 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    -[NWURLLoaderHTTP writeRequestBody](v5);
  }
  else
  {
    if (!v5 || !*(void *)(v5 + 88))
    {
      id v7 = -[NWURLLoaderHTTP errorForErrorCode:]((id *)v5, -1021);
      -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v7);

      uint64_t v5 = *(void *)(a1 + 32);
    }
    -[NWURLLoaderHTTP cancelConnection](v5);
  }
}

- (void)writeRequestBody
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 64);
    SEL v3 = *(void **)(a1 + 64);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke;
    v5[3] = &unk_1E5248D70;
    id v6 = v2;
    uint64_t v7 = a1;
    id v4 = v2;
    [v3 readMinimumIncompleteLength:1 maximumLength:0x20000 completionHandler:v5];
  }
}

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    if (v11 != v10[8]) {
      goto LABEL_10;
    }
  }
  else if (v11)
  {
    goto LABEL_10;
  }
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v19 = (id)gurlLogObj;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (v20 && (id v21 = *(id *)(v20 + 48)) != 0)
      {
        uint64_t v22 = v21;
        [v21 logDescription];
      }
      else
      {
        uint64_t v22 = 0;
        v39[0] = 0;
        v39[1] = 0;
        int v40 = 0;
      }
      uint64_t v23 = *(void *)(a1 + 40);
      if (v23 && (id v24 = *(id *)(v23 + 48)) != 0)
      {
        uint64_t v25 = v24;
        [v24 logDescription];
        int v26 = v38;
      }
      else
      {
        int v26 = 0;
        uint64_t v25 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        int v38 = 0;
      }
      if (v7) {
        size_t size = dispatch_data_get_size(v7);
      }
      else {
        size_t size = 0;
      }
      *(_DWORD *)buf = 136447746;
      __int16 v42 = "-[NWURLLoaderHTTP writeRequestBody]_block_invoke";
      __int16 v43 = 1042;
      int v44 = 16;
      __int16 v45 = 2098;
      __int16 v46 = v39;
      __int16 v47 = 1024;
      int v48 = v26;
      __int16 v49 = 2048;
      size_t v50 = size;
      __int16 v51 = 1024;
      BOOL v52 = a3;
      __int16 v53 = 2112;
      id v54 = v9;
      _os_log_impl(&dword_1830D4000, v19, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> sending body: %zu, complete: %{BOOL}d, error: %@", buf, 0x3Cu);
    }
    id v10 = *(void **)(a1 + 40);
    if (!v9) {
      goto LABEL_5;
    }
  }
  else if (!v8)
  {
LABEL_5:
    if (v10) {
      id v10 = (void *)v10[9];
    }
    int v12 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      id v16 = *(void **)(v14 + 72);
      uint64_t v15 = *(NSObject **)(v14 + 80);
    }
    else
    {
      id v16 = 0;
      uint64_t v15 = 0;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_63;
    v31[3] = &unk_1E5248D48;
    id v32 = v12;
    uint64_t v33 = v14;
    BOOL v35 = a3;
    int v34 = v7;
    id v17 = v13;
    uint64_t v18 = v16;
    nw_connection_send(v18, v34, v15, a3, v31);

    goto LABEL_10;
  }
  if (v10) {
    id v10 = (void *)v10[3];
  }
  int v28 = v10;
  int v29 = [v28 URL];
  [v9 setFailingURL:v29];

  uint64_t v30 = *(void *)(a1 + 40);
  if (!v30 || !*(void *)(v30 + 88))
  {
    -[NWURLLoaderHTTP setPendingError:](v30, v9);
    uint64_t v30 = *(void *)(a1 + 40);
  }
  -[NWURLLoaderHTTP cancelConnection](v30);
  -[NWURLLoaderHTTP finishRequest:](*(void *)(a1 + 40));
LABEL_10:
}

- (void)finishRequest:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 16) = 1;
    id v4 = *(id *)(a1 + 136);
    objc_setProperty_nonatomic_copy((id)a1, v2, 0, 136);
    SEL v3 = v4;
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
      SEL v3 = v4;
    }
  }
}

void __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v5 != *(void *)(v6 + 72)) {
      goto LABEL_21;
    }
  }
  else if (v5)
  {
    goto LABEL_21;
  }
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 56) && v6)
    {
      *(unsigned char *)(v6 + 16) = 1;
      uint64_t v7 = (void (**)(void))*(id *)(v6 + 136);
      objc_setProperty_nonatomic_copy((id)v6, v8, 0, 136);
      if (v7) {
        v7[2](v7);
      }
      if (*(unsigned char *)(v6 + 9)) {
        -[NWURLLoaderHTTP startResponseStallTimer](v6);
      }
    }
    uint64_t v9 = *(NSObject **)(a1 + 48);
    if (v9)
    {
      size_t size = dispatch_data_get_size(v9);
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11)
      {
LABEL_13:
        int v12 = *(void **)(v11 + 64);
LABEL_14:
        uint64_t v13 = [v12 countOfBytesSent];
        uint64_t v14 = *(void *)(a1 + 40);
        if (v14)
        {
          uint64_t v15 = *(void **)(v14 + 48);
          char v16 = *(unsigned char *)(a1 + 56);
          if (v16) {
            uint64_t v17 = v13;
          }
          else {
            uint64_t v17 = *(void *)(v14 + 32);
          }
        }
        else
        {
          uint64_t v15 = 0;
          char v16 = *(unsigned char *)(a1 + 56);
          if (v16) {
            uint64_t v17 = v13;
          }
          else {
            uint64_t v17 = 0;
          }
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2;
        v19[3] = &unk_1E5248D20;
        char v20 = v16;
        v19[4] = v14;
        [v15 loaderDidSendBodyData:size totalBytesSent:v13 totalBytesExpectedToSend:v17 completionHandler:v19];
        goto LABEL_21;
      }
    }
    else
    {
      size_t size = 0;
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        goto LABEL_13;
      }
    }
    int v12 = 0;
    goto LABEL_14;
  }
  if (!v6 || !*(void *)(v6 + 88))
  {
    uint64_t v18 = -[NWURLLoaderHTTP errorForNWError:](*(id **)(a1 + 40), v3);
    -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 40), v18);

    uint64_t v6 = *(void *)(a1 + 40);
  }
  -[NWURLLoaderHTTP cancelConnection](v6);
  -[NWURLLoaderHTTP finishRequest:](*(void *)(a1 + 40));
LABEL_21:
}

uint64_t __35__NWURLLoaderHTTP_writeRequestBody__block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return -[NWURLLoaderHTTP writeRequestBody](*(void *)(result + 32));
  }
  return result;
}

void __42__NWURLLoaderHTTP_startResponseStallTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(v2 + 72);
    if (v3)
    {
      id v4 = v3;
      xpc_object_t v5 = xpc_uint64_create(3uLL);
      nw_connection_add_client_event_internal(v4, 2, v5, 0);

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  -[NWURLLoaderHTTP stopResponseStallTimer](v2);
}

uint64_t __35__NWURLLoaderHTTP_reportConnected___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:a2];
  [v2 addObject:v3];

  return 1;
}

void __32__NWURLLoaderHTTP_writeRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    if (!v4 || !*(void *)(v4 + 88))
    {
      xpc_object_t v5 = -[NWURLLoaderHTTP errorForNWError:]((id *)v4, v3);
      -[NWURLLoaderHTTP setPendingError:](*(void *)(a1 + 32), v5);

      uint64_t v4 = *(void *)(a1 + 32);
    }
    -[NWURLLoaderHTTP cancelConnection](v4);
  }
  else
  {
    -[NWURLLoaderHTTP needRequestBody](v4);
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_47(uint64_t a1, void *a2, char a3)
{
  id v12 = a2;
  if (!v12 && (a3 & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 40);
      if (v6)
      {
        if ([*(id *)(v6 + 16) _requiresSecureHTTPSProxyConnection])
        {
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = *(void *)(a1 + 40);
          if (v7)
          {
            uint64_t v9 = (id *)*(id *)(v7 + 40);
            id v10 = v9;
            if (v9)
            {
              uint64_t v11 = [v9[2] _preventsSystemHTTPProxyAuthentication];
LABEL_9:
              (*(void (**)(uint64_t, void, uint64_t))(v8 + 16))(v8, 0, v11);

              goto LABEL_11;
            }
          }
          else
          {
            id v10 = 0;
          }
          uint64_t v11 = 0;
          goto LABEL_9;
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

- (void)handleAuthenticationChallenge:(void *)a3 url:(uint64_t)a4 cancel:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    -[NWURLLoaderHTTP stopResponseStallTimer](a1);
    ns_protection_space = (void *)nw_authentication_challenge_get_ns_protection_space(v9);
    if (ns_protection_space)
    {
      CFTypeRef v13 = nw_authentication_challenge_copy_http_message(v9);
      if (v13)
      {
        uint64_t v14 = v13;
        id proposed_credential = nw_authentication_challenge_get_proposed_credential(v9);
        char v16 = proposed_credential;
        if (proposed_credential) {
          ns = (void *)nw_authentication_credential_create_ns(proposed_credential);
        }
        else {
          ns = 0;
        }
        uint64_t v18 = (void *)CFURLResponseCreateWithHTTPResponse();
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F18D70]) initWithProtectionSpace:ns_protection_space proposedCredential:ns previousFailureCount:nw_authentication_challenge_get_attempt_count(v9) failureResponse:v18 error:0 sender:0];
        CFRelease(v14);
        char v20 = *(void **)(a1 + 48);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke;
        v24[3] = &unk_1E5248DE8;
        v24[4] = a1;
        id v25 = v9;
        id v26 = v18;
        id v27 = v11;
        id v21 = v18;
        [v20 loaderDidReceiveChallenge:v19 completionHandler:v24];

        goto LABEL_8;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v22 = (id)gurlLogObj;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        (*((void (**)(id, void, uint64_t))v11 + 2))(v11, 0, a4);
LABEL_8:

        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      uint64_t v23 = "HTTP message is NULL";
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v22 = (id)gurlLogObj;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      uint64_t v23 = "Protection space is NULL";
    }
    _os_log_impl(&dword_1830D4000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_19;
  }
LABEL_9:
}

void __78__NWURLLoaderHTTP_handleAuthenticationChallenge_url_cancel_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

- (void)handleAuthenticationChallengeResponse:(void *)a3 credential:(void *)a4 challenge:(void *)a5 response:(void *)a6 completionHandler:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(void, void, void))v14;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        if (!v11) {
          goto LABEL_13;
        }
        id proposed_credential = -[NWConcrete_nw_authentication_credential initWithType:]([NWConcrete_nw_authentication_credential alloc], 1);
        nw_authentication_credential_apply_ns(proposed_credential, v11);
        goto LABEL_6;
      case 1:
        id proposed_credential = nw_authentication_challenge_get_proposed_credential(v12);
LABEL_6:
        ((void (**)(void, void *, void))v15)[2](v15, proposed_credential, 0);
        goto LABEL_7;
      case 2:
        (*((void (**)(id, void, uint64_t))v14 + 2))(v14, 0, 1);
        break;
      case 3:
        if (nw_authentication_challenge_try_next_protection_space(v12))
        {
          id proposed_credential = (void *)nw_authentication_challenge_get_ns_protection_space(v12);
          if (proposed_credential)
          {
            id v17 = nw_authentication_challenge_get_proposed_credential(v12);
            uint64_t v18 = v17;
            if (v17) {
              ns = (void *)nw_authentication_credential_create_ns(v17);
            }
            else {
              ns = 0;
            }
            char v20 = (void *)[objc_alloc(MEMORY[0x1E4F18D70]) initWithProtectionSpace:proposed_credential proposedCredential:ns previousFailureCount:nw_authentication_challenge_get_attempt_count(v12) failureResponse:v13 error:0 sender:0];
            id v21 = *(void **)(a1 + 48);
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke;
            v22[3] = &unk_1E5248DE8;
            v22[4] = a1;
            id v23 = v12;
            id v24 = v13;
            id v25 = v15;
            [v21 loaderDidReceiveChallenge:v20 completionHandler:v22];
          }
          else
          {
            v15[2](v15, 0, 0);
LABEL_7:
          }
        }
        else
        {
LABEL_13:
          v15[2](v15, 0, 0);
        }
        break;
      default:
        break;
    }
  }
}

uint64_t __105__NWURLLoaderHTTP_handleAuthenticationChallengeResponse_credential_challenge_response_completionHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return -[NWURLLoaderHTTP handleAuthenticationChallengeResponse:credential:challenge:response:completionHandler:](a1[4], a2, a3, a1[5], a1[6], a1[7]);
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithUTF8String:a2];
  [*(id *)(a1 + 32) setHTTPMethod:v3];
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) addValue:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forHTTPHeaderField:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_13(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12 && ([v12 URL], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      objc_storeStrong((id *)(v5 + 24), a2);
    }
    id v6 = [v12 URL];
    CFURLRef fixed = fixInvalidHTTPURL(v6);
    BOOL v8 = nw_endpoint_create_with_cfurl(fixed);

    uint64_t v9 = (void *)_nw_http_request_create_from_url_request(v12);
    metadata_for_request = nw_http_create_metadata_for_request(v9);
    if (nw_http_request_has_method(v9, (uint64_t)"GET"))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        *(void *)(v11 + 32) = 0;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  nw_quic_connection_set_idle_timeout(v2, 0);
  nw_quic_connection_set_keepalive_count(v2, 5);
}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 48);
  }
  else {
    uint64_t v5 = 0;
  }
  return [v5 loaderDidReceiveServerTrustChallenge:a3 secProtocolMetadata:a2 completionHandler:a4];
}

void __34__NWURLLoaderHTTP_continueLoading__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  uint64_t v7 = a2;
  id v8 = objc_alloc_init(v5);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__NWURLLoaderHTTP_continueLoading__block_invoke_4;
  handler[3] = &unk_1E5248A70;
  id v9 = v8;
  id v14 = v9;
  sec_protocol_metadata_access_distinguished_names(v7, handler);

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10) {
    uint64_t v10 = (void *)v10[6];
  }
  uint64_t v11 = v10;
  id v12 = (void *)[v9 copy];
  [v11 loaderDidReceiveClientCertificateChallenge:v12 completionHandler:v6];
}

uint64_t __34__NWURLLoaderHTTP_continueLoading__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)initWithRequest:(unint64_t)a3 bodyKnownSize:(void *)a4 configuration:(void *)a5 queue:(void *)a6 client:
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v28.receiver = a1;
    v28.super_class = (Class)NWURLLoaderHTTP;
    uint64_t v16 = (id *)objc_msgSendSuper2(&v28, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      if ((a3 & 0x8000000000000000) != 0)
      {
        id v17 = [v12 valueForHTTPHeaderField:@"Content-Length"];
        uint64_t v18 = v17;
        if (!v17 || [v17 longLongValue] < 0) {
          uint64_t v19 = -1;
        }
        else {
          uint64_t v19 = [v18 longLongValue];
        }
        a1[4] = (id)v19;
      }
      else
      {
        a1[4] = (id)a3;
      }
      objc_storeStrong(a1 + 5, a4);
      objc_storeStrong(a1 + 6, a6);
      objc_storeStrong(a1 + 7, a5);
      char v20 = (id *)a1[5];
      if (v20)
      {
        id v21 = [v20[2] URLCache];
      }
      else
      {
        id v21 = 0;
      }
      uint64_t v22 = [NWURLLoaderCache alloc];
      id v23 = v21;
      if (v22)
      {
        v29.receiver = v22;
        v29.super_class = (Class)NWURLLoaderCache;
        id v24 = (NWURLLoaderCache *)objc_msgSendSuper2(&v29, sel_init);
        uint64_t v22 = v24;
        if (v24)
        {
          objc_storeStrong((id *)&v24->_cache, v21);
          dataToCache = v22->_dataToCache;
          v22->_cacheStoragePolicy = 0;
          v22->_dataToCache = 0;
        }
      }

      id v26 = a1[12];
      a1[12] = v22;
    }
  }

  return a1;
}

@end