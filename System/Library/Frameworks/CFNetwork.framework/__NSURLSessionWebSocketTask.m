@interface __NSURLSessionWebSocketTask
- (BOOL)isKindOfClass:(Class)a3;
- (NSData)closeReason;
- (__NSURLSessionWebSocketTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (int64_t)closeCode;
- (int64_t)maximumMessageSize;
- (void)_onqueue_cancel;
- (void)_onqueue_cancelWebSocketTaskWithError:(void *)a1;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
- (void)_onqueue_enableWebSocketFraming:(uint64_t)a1;
- (void)_onqueue_ioTick;
- (void)_onqueue_receiveMessageWithCompletionHandler:(uint64_t)a1;
- (void)_onqueue_resume;
- (void)_onqueue_sendCloseCode:(void *)a3 reason:(int)a4 cancel:;
- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4;
- (void)cancel;
- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4;
- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)dealloc;
- (void)receiveMessageWithCompletionHandler:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendPingWithPongReceiveHandler:(id)a3;
- (void)setMaximumMessageSize:(int64_t)a3;
@end

@implementation __NSURLSessionWebSocketTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_wsOptions, 0);
  objc_storeStrong((id *)&self->_protocolPicked, 0);
  objc_storeStrong((id *)&self->_webSocketError, 0);
  objc_storeStrong((id *)&self->_delegateWork, 0);
  objc_storeStrong((id *)&self->_highPriorityPendingWork, 0);
  objc_storeStrong((id *)&self->_pendingReceiveWork, 0);

  objc_storeStrong((id *)&self->_pendingSendWork, 0);
}

- (NSData)closeReason
{
  return (NSData *)objc_getProperty(self, a2, 968, 1);
}

- (int64_t)closeCode
{
  return (int64_t)self->_closeReason;
}

- (void)setMaximumMessageSize:(int64_t)a3
{
  self->_closeCode = a3;
}

- (int64_t)maximumMessageSize
{
  return self->_closeCode;
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v5 = a4;
  -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, [v5 code]);
}

- (void)_onqueue_cancelWebSocketTaskWithError:(void *)a1
{
  if (a1)
  {
    id v3 = (id)[a1 error:*MEMORY[0x1E4F289A0] code:a2];
    v4 = (void *)a1[126];
    a1[126] = v3;

    -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)a1);
  }
}

- (void)_onqueue_ioTick
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v2 = [(id)a1 workQueue];
  dispatch_assert_queue_V2(v2);

  if ([(id)a1 state] == 3)
  {
    int v3 = dyld_program_sdk_at_least();
    v4 = *(void **)(a1 + 992);
    if (v3)
    {
      v60 = (void *)[v4 copy];
      [*(id *)(a1 + 992) removeAllObjects];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v5 = v60;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v87 != v7) {
              objc_enumerationMutation(v5);
            }
            v9 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v86 + 1) + 8 * i));
            v9[2]();
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v86 objects:v96 count:16];
        }
        while (v6);
      }

      v10 = (void *)[*(id *)(a1 + 976) copy];
      [*(id *)(a1 + 976) removeAllObjects];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v83 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v82 + 1) + 8 * j));
            v15[2]();
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v12);
      }

      v16 = (void *)[*(id *)(a1 + 984) copy];
      [*(id *)(a1 + 984) removeAllObjects];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v78 objects:v94 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v79;
        do
        {
          for (uint64_t k = 0; k != v18; ++k)
          {
            if (*(void *)v79 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v78 + 1) + 8 * k));
            v21[2]();
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v78 objects:v94 count:16];
        }
        while (v18);
      }
    }
    else
    {
      [v4 removeAllObjects];
      [*(id *)(a1 + 976) removeAllObjects];
      [*(id *)(a1 + 984) removeAllObjects];
    }
    int v49 = dyld_program_sdk_at_least();
    v50 = *(void **)(a1 + 1000);
    if (v49)
    {
      v51 = (void *)[v50 copy];
      [*(id *)(a1 + 1000) removeAllObjects];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v52 = v51;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v93 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v75;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v75 != v54) {
              objc_enumerationMutation(v52);
            }
            v56 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v74 + 1) + 8 * m));
            v56[2]();
          }
          uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v93 count:16];
        }
        while (v53);
      }
    }
    else
    {
      [v50 removeAllObjects];
    }
    return;
  }
  if ([(id)a1 state] && objc_msgSend((id)a1, "state") != 2)
  {
    v57 = webSocketLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v58 = [(id)a1 _loggableDescription];
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = v58;
      _os_log_debug_impl(&dword_184085000, v57, OS_LOG_TYPE_DEBUG, "%@ is not yet connected or suspended. Deferring work", (uint8_t *)&block, 0xCu);
    }
    goto LABEL_92;
  }
  if (!*(unsigned char *)(a1 + 939) && !*(void *)(a1 + 1008))
  {
    v57 = webSocketLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v59 = [(id)a1 _loggableDescription];
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = v59;
      _os_log_debug_impl(&dword_184085000, v57, OS_LOG_TYPE_DEBUG, "%@ handshake not yet complete. Deferring work", (uint8_t *)&block, 0xCu);
    }
LABEL_92:

    return;
  }
  v61 = (void *)[*(id *)(a1 + 992) copy];
  [*(id *)(a1 + 992) removeAllObjects];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v22 = v61;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v92 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v71;
    do
    {
      for (uint64_t n = 0; n != v23; ++n)
      {
        if (*(void *)v71 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v70 + 1) + 8 * n));
        v26[2]();
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v92 count:16];
    }
    while (v23);
  }

  v27 = (void *)[*(id *)(a1 + 1000) copy];
  [*(id *)(a1 + 1000) removeAllObjects];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v91 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v67;
    do
    {
      for (iuint64_t i = 0; ii != v29; ++ii)
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v66 + 1) + 8 * ii));
        v32[2]();
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v91 count:16];
    }
    while (v29);
  }

  if (!*(unsigned char *)(a1 + 940))
  {
    v33 = [*(id *)(a1 + 984) firstObject];
    if (v33)
    {
      [*(id *)(a1 + 984) removeObjectAtIndex:0];
      v33[2](v33);
    }
  }
  v34 = (void *)[*(id *)(a1 + 976) copy];
  [*(id *)(a1 + 976) removeAllObjects];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v35 = v34;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v90 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v63;
    do
    {
      for (juint64_t j = 0; jj != v36; ++jj)
      {
        if (*(void *)v63 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = (void (**)(void))_Block_copy(*(const void **)(*((void *)&v62 + 1) + 8 * jj));
        v39[2]();
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v90 count:16];
    }
    while (v36);
  }

  v40 = [(id)a1 workQueue];
  dispatch_assert_queue_V2(v40);

  if (*(void *)(a1 + 1008) || [(id)a1 closeCode])
  {
    uint64_t v41 = *(void *)(a1 + 888);
    v42 = *(std::__shared_weak_count **)(a1 + 896);
    if (v42) {
      atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v41)
    {
      v43 = *(NSObject **)(v41 + 120);
      if (v43) {
        dispatch_retain(*(dispatch_object_t *)(v41 + 120));
      }
      *(void *)&blocuint64_t k = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3321888768;
      v98 = __58____NSURLSessionWebSocketTask__onqueue_checkForCompletion__block_invoke;
      v99 = &__block_descriptor_48_ea8_32c47_ZTSNSt3__110shared_ptrI19TransportConnectionEE_e5_v8__0l;
      uint64_t v100 = v41;
      v101 = v42;
      if (v42) {
        atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      dispatch_async(v43, &block);

      if (v101) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v101);
      }
    }
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v42);
    }
    if (*(void *)(a1 + 960))
    {
      v44 = *(void **)(a1 + 704);
      if (!v44) {
        v44 = *(void **)(a1 + 696);
      }
      id v45 = v44;
      uint64_t v46 = [(id)a1 closeCode];
      v47 = [(id)a1 closeReason];
      -[__NSCFURLSessionDelegateWrapper webSocketTask:didCloseWithCode:reason:]((uint64_t)v45, (void *)a1, v46, v47);

      uint64_t v48 = 0;
    }
    else
    {
      uint64_t v48 = *(void *)(a1 + 1008);
    }
    objc_msgSend((id)a1, "_onqueue_cancel_with_error:", v48);
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  v58 = (void (**)(id, long long *))a4;
  uint64_t v6 = [(NSURLSessionTask *)self workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v61 = 0;
  long long v60 = xmmword_18430C250;
  v58[2](v58, &v60);
  [(NSURLSessionTask *)self setResponse:v57];
  if (self)
  {
    uint64_t v7 = [(NSURLSessionTask *)self response];
    if (v7
      && ([(NSURLSessionTask *)self response],
          v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          v7,
          (isKindOfClass & 1) != 0))
    {
      v55 = [(NSURLSessionTask *)self response];
      v10 = [(NSURLSessionTask *)self currentRequest];
      v56 = [v10 valueForHTTPHeaderField:0x1EC0A27E0];

      if (!v56) {
        __assert_rtn("-[__NSURLSessionWebSocketTask _onqueue_validateWebSocketHandshake]", "LocalWebSocketTask.mm", 654, "clientKey");
      }
      nw_protocol_options_t options = nw_ws_create_options(nw_ws_version_13);
      objc_setProperty_atomic(self, v12, options, 1024);

      Property = objc_getProperty(self, v13, 1024, 1);
      nw_ws_options_set_auto_reply_ping(Property, 1);
      v16 = objc_getProperty(self, v15, 1024, 1);
      nw_ws_options_set_skip_handshake(v16, 1);
      objc_getProperty(self, v17, 1024, 1);
      nw_ws_options_set_prepend_data();
      uint64_t v19 = objc_getProperty(self, v18, 1024, 1);
      nw_ws_options_set_maximum_message_size(v19, self->_closeCode);
      v20 = [v55 valueForHTTPHeaderField:0x1EC0A2818];
      objc_setProperty_atomic(self, v21, v20, 1016);

      if (objc_getProperty(self, v22, 1016, 1))
      {
        uint64_t v23 = [(NSURLSessionTask *)self currentRequest];
        uint64_t v24 = [v23 valueForHTTPHeaderField:0x1EC0A2818];
        v25 = [v24 componentsSeparatedByString:@","];

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v26 = v25;
        uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v67 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v64 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              v32 = objc_getProperty(self, v27, 1024, 1);
              v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              id v34 = [v31 stringByTrimmingCharactersInSet:v33];
              nw_ws_options_add_subprotocol(v32, (const char *)[v34 UTF8String]);
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v67 count:16];
          }
          while (v28);
        }
      }
      id v35 = [(NSURLSessionTask *)self currentRequest];
      [v35 valueForHTTPHeaderField:0x1EC0A27A8];

      objc_getProperty(self, v36, 1024, 1);
      nw_ws_options_set_permessage_deflate();
      v38 = [(NSURLSessionTask *)self response];
      [v38 _inner];

      *(void *)buf = 0;
      objc_getProperty(self, v39, 1024, 1);
      if (nw_ws_validate_server_response_with_protocol_options())
      {

        if (self->super._connectionForUpgrade.__ptr_)
        {
          if ([(__NSCFLocalSessionTask *)self _needSendingMetrics])
          {
            [(__NSCFLocalSessionTask *)self _didSendMetrics];
            uint64_t v41 = [NSURLSessionTaskMetrics alloc];
            v42 = [(NSURLSessionTask *)self _metrics];
            v43 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)&v41->super.isa, v42);

            internalDelegateWrapper = self->super.super._internalDelegateWrapper;
            if (!internalDelegateWrapper) {
              internalDelegateWrapper = self->super.super._publicDelegateWrapper;
            }
            id v45 = internalDelegateWrapper;
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __70____NSURLSessionWebSocketTask__onqueue_didReceiveResponse_completion___block_invoke;
            v59[3] = &unk_1E5258228;
            v59[4] = self;
            -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:]((uint64_t)v45, self, v43, v59);
          }
          else
          {
            id v54 = objc_getProperty(self, v40, 1016, 1);
            -[__NSURLSessionWebSocketTask _onqueue_enableWebSocketFraming:]((uint64_t)self, v54);
          }
        }
        else
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          uint64_t v53 = (id)CFNLog::logger;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v67 = 0;
            _os_log_error_impl(&dword_184085000, v53, OS_LOG_TYPE_ERROR, "Connection not set before response is received, failing task", v67, 2u);
          }

          -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, -1005);
        }
      }
      else
      {
        uint64_t v46 = *(void *)buf;
        uint64_t v47 = *MEMORY[0x1E4F289A0];
        objc_storeStrong((id *)&self->_protocolPicked, [(__NSCFLocalSessionTask *)self error:*MEMORY[0x1E4F289A0] code:-1011]);
        uint64_t v48 = [(NSString *)self->_protocolPicked userInfo];
        int v49 = (void *)[v48 mutableCopy];

        v50 = [NSNumber numberWithUnsignedInteger:v46];
        [v49 setObject:v50 forKeyedSubscript:@"_NSURLErrorWebSocketHandshakeFailureReasonKey"];

        v51 = [MEMORY[0x1E4F290A8] errorWithDomain:v47 code:-1011 userInfo:v49];
        protocolPicked = self->_protocolPicked;
        self->_protocolPicked = v51;

        -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)self);
      }
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v37 = (id)CFNLog::logger;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_184085000, v37, OS_LOG_TYPE_ERROR, "No response for Web-Socket Handshake, failing task", buf, 2u);
      }

      -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, -1011);
    }
  }
}

- (void)_onqueue_enableWebSocketFraming:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v4);

    id v5 = *(void **)(a1 + 704);
    if (!v5) {
      id v5 = *(void **)(a1 + 696);
    }
    id v6 = v5;
    -[__NSCFURLSessionDelegateWrapper webSocketTask:didOpenWithProtocol:]((uint64_t)v6, (void *)a1, v3);

    uint64_t v7 = webSocketLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(id)a1 _loggableDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_debug_impl(&dword_184085000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ handshake successful", (uint8_t *)&buf, 0xCu);
    }
    v8 = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 888) + 424))(*(void *)(a1 + 888));
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke;
    location[4] = &unk_1E52570B0;
    location[5] = (id)a1;
    location[6] = &buf;
    nw_connection_modify_connected_protocol_stack();
    objc_initWeak(location, (id)a1);
    uint64_t v9 = *(void *)(a1 + 888);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_2;
    v11[3] = &unk_1E52570D8;
    objc_copyWeak(&v12, location);
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v9 + 200))(v9, 0x1EC09F4B0, v11);
    *(unsigned char *)(a1 + 939) = 1;
    -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1);
    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_onqueue_cancel
{
}

- (void)_onqueue_sendCloseCode:(void *)a3 reason:(int)a4 cancel:
{
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v9);

    if (!*(void *)(a1 + 1008))
    {
      if (a4)
      {
        *(void *)(a1 + 960) = a2;
        objc_storeStrong((id *)(a1 + 968), a3);
        objc_storeStrong((id *)(a1 + 1008), (id)[(id)a1 error:*MEMORY[0x1E4F289A0] code:-999]);
      }
      v10 = nw_content_context_create("websocketCloseWithCodeAndReason");
      nw_content_context_set_is_final(v10, 1);
      metadata = nw_ws_create_metadata(nw_ws_opcode_close);
      id v12 = metadata;
      if (a2) {
        nw_ws_metadata_set_close_code(metadata, (nw_ws_close_code_t)a2);
      }
      nw_content_context_set_metadata_for_protocol(v10, v12);
      SEL v13 = (*(uint64_t (**)(void))(**(void **)(a1 + 888) + 424))(*(void *)(a1 + 888));
      if (v8)
      {
        v14 = [v8 _createDispatchData];
      }
      else
      {
        v14 = MEMORY[0x1E4F14410];
        id v15 = MEMORY[0x1E4F14410];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68____NSURLSessionWebSocketTask__onqueue_sendCloseCode_reason_cancel___block_invoke;
      v16[3] = &unk_1E52571A0;
      v16[4] = a1;
      v16[5] = a2;
      nw_connection_send(v13, v14, v10, 1, v16);
    }
  }
}

- (void)_onqueue_resume
{
  id v3 = [(NSURLSessionTask *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (self && *(&self->_readInProgress + 2))
  {
    if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted
      || [(NSURLSessionTask *)self state] == NSURLSessionTaskStateCanceling)
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
      }
      v4 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_184085000, v4, OS_LOG_TYPE_FAULT, "[API MISUSE]: Resuming WebSocket task after task has completed", buf, 2u);
      }
    }
    else
    {
      [(NSURLSessionTask *)self setState:0];
      -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)self);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)__NSURLSessionWebSocketTask;
    [(__NSCFLocalSessionTask *)&v5 _onqueue_resume];
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = webSocketLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(NSURLSessionTask *)self _loggableDescription];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v7 = v4;
    _os_log_debug_impl(&dword_184085000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Deallocating", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSURLSessionWebSocketTask;
  [(__NSCFLocalSessionTask *)&v5 dealloc];
}

- (void)cancel
{
  id v3 = [(NSURLSessionTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37____NSURLSessionWebSocketTask_cancel__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSURLSessionTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke;
  block[3] = &unk_1E5257B78;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSURLSessionTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke;
  block[3] = &unk_1E5257B78;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sendPingWithPongReceiveHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSURLSessionTask *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke;
  v7[3] = &unk_1E5258028;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)receiveMessageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSURLSessionTask *)self session];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 120);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5258028;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)_onqueue_receiveMessageWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v4);

    id v6 = objc_getProperty((id)a1, v5, 1008, 1);
    if (v6)
    {
      uint64_t v7 = [(id)a1 session];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke;
      v11[3] = &unk_1E5258028;
      SEL v13 = v3;
      id v12 = v6;
      -[NSURLSession runDelegateBlock:]((uint64_t)v7, v11);

      id v8 = v13;
    }
    else
    {
      *(unsigned char *)(a1 + 940) = 1;
      id v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 888) + 424))(*(void *)(a1 + 888));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E5257178;
      v9[4] = a1;
      id v10 = v3;
      nw_connection_receive_message(v8, v9);
    }
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSURLSessionTask *)self session];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = *(void **)(v8 + 120);
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E52581A0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);
}

- (__NSURLSessionWebSocketTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self)
  {
    v20.receiver = self;
    v20.super_class = (Class)__NSURLSessionWebSocketTask;
    id v10 = [(__NSCFLocalSessionTask *)&v20 initWithOriginalRequest:v8 ident:a4 taskGroup:v9];
    id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingReceiveWoruint64_t k = v10->_pendingReceiveWork;
    v10->_pendingReceiveWoruint64_t k = v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    delegateWoruint64_t k = v10->_delegateWork;
    v10->_delegateWoruint64_t k = v13;

    id v15 = (NSError *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    webSocketError = v10->_webSocketError;
    v10->_webSocketError = v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    highPriorityPendingWoruint64_t k = v10->_highPriorityPendingWork;
    v10->_highPriorityPendingWoruint64_t k = v17;

    *(&v10->_readInProgress + 2) = 0;
    v10->_closeReasouint64_t n = 0;
    v10->_closeCode = 0x100000;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSURLSessionWebSocketTask;
  if (-[__NSURLSessionWebSocketTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end