@interface NWURLSessionWebSocketTask
+ (void)addWebSocketHeadersToRequest:(uint64_t)a1;
- (BOOL)isKindOfClass:(Class)a3;
- (NSData)closeReason;
- (id)response;
- (int64_t)closeCode;
- (int64_t)maximumMessageSize;
- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4;
- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4;
- (void)checkForCompletion;
- (void)completeTaskWithError:(id)a3;
- (void)processWork;
- (void)receiveMessage;
- (void)receiveMessageWithCompletionHandler:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendPingWithPongReceiveHandler:(id)a3;
- (void)setMaximumMessageSize:(int64_t)a3;
- (void)setPendingReceiveCompletionHandlers:(uint64_t)a1;
- (void)startNextLoad:(BOOL)a3;
@end

@implementation NWURLSessionWebSocketTask

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v60 = a2;
  id v5 = a3;
  v6 = (void *)a1[4];
  if (!v6) {
    goto LABEL_53;
  }
  for (uint64_t i = v6[33]; i == a1[5]; uint64_t i = 0)
  {
    id newValue = v5;
    if (v5)
    {
      v8 = [v6 error];

      v6 = (void *)a1[4];
      if (!v8)
      {
        if (v6)
        {
          objc_setProperty_atomic_copy(v6, v9, newValue, 136);
          v6 = (void *)a1[4];
        }
      }
    }
    v10 = [v6 error];

    uint64_t v11 = a1[4];
    if (v10)
    {
      v55 = [(id)a1[4] error];
      [(id)v11 completeTaskWithError:v55];

      -[NWURLSessionWebSocketTask processWork](a1[4]);
      goto LABEL_47;
    }
    a1 = v60;
    if (!v11) {
      goto LABEL_46;
    }
    nw_context_assert_queue(*(void **)(v11 + 312));
    uint64_t v12 = *(void *)(v11 + 336);
    if (v12)
    {
      *(void *)(v11 + 336) = 0;
      nw_queue_cancel_source(v12);
    }
    uint64_t v13 = *(void *)(v11 + 320);
    if (v13)
    {
      *(void *)(v11 + 320) = 0;
      nw_queue_cancel_source(v13);
    }
    uint64_t v14 = *(void *)(v11 + 352);
    if (v14)
    {
      *(void *)(v11 + 352) = 0;
      nw_queue_cancel_source(v14);
    }
    -[NWURLSessionTask updateResponse:](v11, a1);
    objc_setProperty_nonatomic_copy((id)v11, v15, a1, 496);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = [NWURLError alloc];
      id v43 = *(id *)(v11 + 264);
      id v44 = (id)v11;
      if (v42)
      {
        uint64_t v45 = *MEMORY[0x1E4F289A0];
        v75.receiver = v42;
        v75.super_class = (Class)NWURLError;
        v46 = (NWURLError *)objc_msgSendSuper2(&v75, sel_initWithDomain_code_userInfo_, v45, -1011, 0);
        v42 = v46;
        if (v46) {
          [(NWURLError *)v46 fillErrorForLoader:v43 andTask:v44];
        }
      }

      [v44 completeTaskWithError:v42];
      -[NWURLSessionWebSocketTask processWork]((uint64_t)v44);
LABEL_46:

LABEL_47:
      id v5 = newValue;
      break;
    }
    v57 = a1;
    v16 = [(id)v11 currentRequest];
    v58 = [v16 valueForHTTPHeaderField:@"Sec-WebSocket-Key"];

    if (v58)
    {
      nw_protocol_options_t options = nw_ws_create_options(nw_ws_version_13);
      nw_ws_options_set_permessage_deflate(options, 1);
      nw_ws_options_set_auto_reply_ping(options, 1);
      nw_ws_options_set_skip_handshake(options, 1);
      nw_ws_options_set_maximum_message_size(options, [(id)v11 maximumMessageSize]);
      v56 = [v57 valueForHTTPHeaderField:@"Sec-WebSocket-Protocol"];
      if (v56)
      {
        v18 = objc_msgSend((id)v11, "currentRequest", v56);
        v19 = [v18 valueForHTTPHeaderField:@"Sec-WebSocket-Protocol"];
        v20 = [v19 componentsSeparatedByString:@","];

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:&v75 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v65 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = *(void **)(*((void *)&v64 + 1) + 8 * j);
              v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              v27 = [v25 stringByTrimmingCharactersInSet:v26];

              nw_ws_options_add_subprotocol(options, (const char *)[v27 cStringUsingEncoding:5]);
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:&v75 count:16];
          }
          while (v22);
        }
      }
      uint64_t HTTPResponse = CFURLResponseGetHTTPResponse();
      unsigned int v63 = 0;
      if (nw_ws_validate_server_response_with_protocol_options(HTTPResponse, (uint64_t)v58, options, &v63))
      {
        uint64_t v29 = 248;
        if (!*(void *)(v11 + 248)) {
          uint64_t v29 = 240;
        }
        uint64_t v30 = *(void *)(v11 + v29);
        v31 = (id *)(id)v11;
        id v33 = v56;
        if (v30)
        {
          v34 = [(NWURLSessionDelegateWrapper *)(unsigned char *)v30 delegateFor_didOpenWithProtocol];
          if (v34)
          {
            v35 = *(id *)(v30 + 32);
            v68.receiver = (id)MEMORY[0x1E4F143A8];
            v68.super_class = (Class)3221225472;
            v69 = __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke;
            v70 = &unk_1E524A1D0;
            nw_protocol_options_t v71 = v34;
            v72 = v35;
            v73 = v31;
            id v74 = v33;
            v36 = *(void **)(v30 + 48);
            v37 = v35;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v36, &v68);
          }
        }

        id v38 = v31[33];
        uint64_t v39 = [v38 underlyingConnection];
        id v40 = v31[63];
        v31[63] = (id)v39;

        v61[0] = 0;
        v61[1] = v61;
        v61[2] = 0x2020000000;
        char v62 = 0;
        id v41 = v31[63];
        v68.receiver = (id)MEMORY[0x1E4F143A8];
        v68.super_class = (Class)3221225472;
        v69 = __44__NWURLSessionWebSocketTask_handleResponse___block_invoke;
        v70 = &unk_1E5242770;
        v72 = v61;
        nw_protocol_options_t v71 = options;
        nw_connection_modify_connected_protocol_stack_internal(v41, &v68, 1);

        -[NWURLSessionWebSocketTask processWork]((uint64_t)v31);
        _Block_object_dispose(v61, 8);
      }
      else
      {
        v47 = [NWURLError alloc];
        id v48 = *(id *)(v11 + 264);
        id v49 = (id)v11;
        if (v47)
        {
          uint64_t v50 = *MEMORY[0x1E4F289A0];
          v68.receiver = v47;
          v68.super_class = (Class)NWURLError;
          v51 = (NWURLError *)objc_msgSendSuper2(&v68, sel_initWithDomain_code_userInfo_, v50, -1011, 0);
          v47 = v51;
          if (v51) {
            [(NWURLError *)v51 fillErrorForLoader:v48 andTask:v49];
          }
        }

        v52 = [(NWURLError *)v47 webSocketHandshakeFailureReason];
        BOOL v53 = v52 == 0;

        if (v53)
        {
          v54 = [NSNumber numberWithInt:v63];
          [(NWURLError *)v47 setWebSocketHandshakeFailureReason:v54];
        }
        objc_msgSend(v49, "completeTaskWithError:", v47, v56);
        -[NWURLSessionWebSocketTask processWork]((uint64_t)v49);
      }
      goto LABEL_46;
    }
    _os_assert_log();
    v6 = (void *)_os_crash();
    __break(1u);
LABEL_53:
    ;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_upgradedConnection, 0);
  objc_storeStrong((id *)&self->_storedResponse, 0);
  objc_storeStrong((id *)&self->_closeReason, 0);

  objc_storeStrong((id *)&self->_closeCode, 0);
}

- (NSData)closeReason
{
  return (NSData *)self->_closeCode;
}

- (int64_t)closeCode
{
  return self->_maximumMessageSize;
}

- (void)setMaximumMessageSize:(int64_t)a3
{
  *(void *)&self->_receiving = a3;
}

- (int64_t)maximumMessageSize
{
  return *(void *)&self->_receiving;
}

- (void)completeTaskWithError:(id)a3
{
  id newValue = a3;
  if (self)
  {
    nw_context_assert_queue(self->super._sessionContext);
    if (self->super._internalState == 2) {
      goto LABEL_12;
    }
    if (newValue)
    {
      objc_setProperty_atomic_copy(self, v4, newValue, 136);
    }
    else
    {
      id v5 = [NWURLError alloc];
      v6 = self->super._loader;
      v7 = self;
      if (v5)
      {
        uint64_t v8 = *MEMORY[0x1E4F289A0];
        v14.receiver = v5;
        v14.super_class = (Class)NWURLError;
        v9 = [(NWURLSessionWebSocketTask *)&v14 initWithDomain:v8 code:-1005 userInfo:0];
        id v5 = (NWURLError *)v9;
        if (v9) {
          [(NWURLSessionWebSocketTask *)v9 fillErrorForLoader:v6 andTask:v7];
        }
      }

      objc_setProperty_atomic_copy(v7, v10, v5, 136);
    }
    -[NWURLSessionWebSocketTask processWork]((uint64_t)self);
    uint64_t v11 = 248;
    if (!self->super._internalDelegateWrapper) {
      uint64_t v11 = 240;
    }
    id v12 = *(id *)((char *)&self->super.super.isa + v11);
  }
  else
  {
    nw_context_assert_queue(0);
    id v12 = 0;
  }
  -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v12, self, newValue, 0);

  -[NWURLSessionTask complete]((uint64_t)self);
LABEL_12:
}

- (void)processWork
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    id v2 = *(id *)(a1 + 504);
    if (v2)
    {
    }
    else
    {
      v3 = [(id)a1 error];

      if (!v3) {
        return;
      }
    }
    id v4 = *(id *)(a1 + 512);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = *(void **)(a1 + 512);
    *(void *)(a1 + 512) = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    if (!*(unsigned char *)(a1 + 468))
    {
      if (objc_msgSend(*(id *)(a1 + 528), "count", (void)v12)) {
        -[NWURLSessionWebSocketTask receiveMessage](a1);
      }
    }
  }
}

- (void)receiveMessage
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    id v2 = [(id)a1 error];

    if (v2)
    {
      id v4 = *(id *)(a1 + 528);
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      -[NWURLSessionWebSocketTask setPendingReceiveCompletionHandlers:](a1, v5);

      v6 = -[NWURLSessionTask delegateWrapper]((void *)a1);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke;
      v9[3] = &unk_1E524B9A0;
      id v10 = v4;
      uint64_t v11 = a1;
      id v7 = v4;
      -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v6, v9);
    }
    else
    {
      *(unsigned char *)(a1 + 468) = 1;
      v3 = *(void **)(a1 + 504);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2;
      v8[3] = &unk_1E52427C0;
      v8[4] = a1;
      nw_connection_receive_internal(v3, 0, 0xFFFFFFFF, 0xFFFFFFFF, v8);
    }
  }
}

- (void)setPendingReceiveCompletionHandlers:(uint64_t)a1
{
}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "error", (void)v9);
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id newValue = a2;
  long long v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    *(unsigned char *)(v11 + 468) = 0;
    long long v12 = *(void **)(a1 + 32);
  }
  else
  {
    long long v12 = 0;
  }
  long long v13 = [v12 error];

  if (v13)
  {
    -[NWURLSessionWebSocketTask processWork](*(void *)(a1 + 32));
    goto LABEL_76;
  }
  nw_ws_opcode_t opcode = nw_ws_opcode_invalid;
  if (v9 && a4)
  {
    if (nw_protocol_copy_ws_definition::onceToken != -1) {
      dispatch_once(&nw_protocol_copy_ws_definition::onceToken, &__block_literal_global_3583);
    }
    long long v15 = (id)nw_protocol_copy_ws_definition::definition;
    long long v13 = nw_content_context_copy_protocol_metadata(v9, v15);

    if (v13) {
      nw_ws_opcode_t opcode = nw_ws_metadata_get_opcode(v13);
    }
    else {
      nw_ws_opcode_t opcode = nw_ws_opcode_invalid;
    }
  }
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    BOOL v53 = (id)gurlLogObj;
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_94;
    }
    v54 = *(void **)(a1 + 32);
    if (v54)
    {
      [v54 logDescription];
      v55 = *(void **)(a1 + 32);
      if (v55)
      {
        [v55 logDescription];
        int v56 = v66;
        size = newValue;
LABEL_91:
        if (size) {
          size = dispatch_data_get_size(size);
        }
        *(_DWORD *)buf = 136448002;
        *(void *)&buf[4] = "-[NWURLSessionWebSocketTask receiveMessage]_block_invoke_2";
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2098;
        *(void *)&buf[20] = v67;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v56;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = opcode;
        LOWORD(v70) = 2048;
        *(void *)((char *)&v70 + 2) = size;
        WORD5(v70) = 1024;
        HIDWORD(v70) = a4;
        LOWORD(v71) = 2112;
        *(void *)((char *)&v71 + 2) = v10;
        _os_log_impl(&dword_1830D4000, v53, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received message: %d, size: %zu, complete: %{BOOL}d, error: %@", buf, 0x42u);
LABEL_94:

        goto LABEL_12;
      }
    }
    else
    {
      v67[0] = 0;
      v67[1] = 0;
      int v68 = 0;
    }
    size = newValue;
    int v56 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    int v66 = 0;
    goto LABEL_91;
  }
LABEL_12:
  if (v9)
  {
    v16 = v9;
    int v17 = 0;
    if (v16 != &__block_literal_global_42249 && v16 != &__block_literal_global_10_42276)
    {
      int v17 = 1;
      if (v16 != &__block_literal_global_6_42258 && v16 != &__block_literal_global_8_42267) {
        int v17 = BYTE6(v16[14].isa) & 1;
      }
    }
  }
  else
  {
    int v17 = 1;
  }
  v18 = 0;
  switch(opcode)
  {
    case nw_ws_opcode_cont:
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v21 = (id)gurlLogObj;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1830D4000, v21, OS_LOG_TYPE_ERROR, "WebSocket cont frame should not be received", buf, 2u);
      }

      v18 = 0;
      if (v10) {
        goto LABEL_38;
      }
      goto LABEL_53;
    case nw_ws_opcode_text:
      id v22 = [NSString alloc];
      if (newValue) {
        uint64_t v23 = newValue;
      }
      else {
        uint64_t v23 = MEMORY[0x1E4F14410];
      }
      v24 = (void *)[v22 initWithData:v23 encoding:4];
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F18E18]) initWithString:v24];

      goto LABEL_37;
    case nw_ws_opcode_binary:
      id v19 = objc_alloc(MEMORY[0x1E4F18E18]);
      if (newValue) {
        v20 = newValue;
      }
      else {
        v20 = MEMORY[0x1E4F14410];
      }
      v18 = (void *)[v19 initWithData:v20];
      if (!v10) {
        goto LABEL_53;
      }
      goto LABEL_38;
    case nw_ws_opcode_close:
      nw_ws_close_code_t close_code = nw_ws_metadata_get_close_code(v13);
      uint64_t v29 = *(void *)(a1 + 32);
      if (v29
        && (*(void *)(v29 + 480) = close_code, (uint64_t v30 = *(void **)(a1 + 32)) != 0)
        && (objc_setProperty_nonatomic_copy(v30, v28, newValue, 488), (uint64_t v31 = *(void *)(a1 + 32)) != 0))
      {
        uint64_t v32 = 248;
        if (!*(void *)(v31 + 248)) {
          uint64_t v32 = 240;
        }
        id v33 = (id *)*(id *)(v31 + v32);
        v34 = *(void **)(a1 + 32);
      }
      else
      {
        v34 = 0;
        id v33 = 0;
      }
      uint64_t v35 = [v34 closeCode];
      v36 = [*(id *)(a1 + 32) closeReason];
      id v59 = v34;
      id v38 = v36;
      if (v33)
      {
        uint64_t v39 = [(NWURLSessionDelegateWrapper *)v33 delegateFor_didCloseWithCode];
        if (v39)
        {
          id v40 = v33[4];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __69__NWURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke;
          *(void *)&buf[24] = &unk_1E5249AE8;
          *(void *)&buf[32] = v39;
          *(void *)&long long v70 = v40;
          *((void *)&v70 + 1) = v59;
          *((void *)&v71 + 1) = v35;
          *(void *)&long long v71 = v38;
          id v41 = v33[6];
          id v42 = v40;
          -[NWURLSessionDelegateQueue runDelegateBlock:](v41, buf);
        }
      }

      v18 = 0;
      int v17 = 1;
      if (!v10) {
        goto LABEL_53;
      }
      goto LABEL_38;
    case nw_ws_opcode_ping:
    case nw_ws_opcode_pong:
      -[NWURLSessionWebSocketTask receiveMessage](*(void *)(a1 + 32));
      goto LABEL_75;
    default:
LABEL_37:
      if (v10)
      {
LABEL_38:
        v25 = *(void ***)(a1 + 32);
        if (v25)
        {
          id v26 = v10;
          v25 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v26, v25[33], v25);
        }
        if (v18) {
          goto LABEL_56;
        }
      }
      else
      {
LABEL_53:
        v25 = 0;
        if (v18) {
          goto LABEL_56;
        }
      }
      if (v17 != 1 && !v25)
      {
        -[NWURLSessionTask errorForErrorCode:](*(id **)(a1 + 32), -1005);
        v25 = (void **)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = 1;
        v52 = *(id **)(a1 + 32);
        if (!v25) {
          goto LABEL_72;
        }
        goto LABEL_69;
      }
LABEL_56:
      if (v18)
      {
        id v43 = *(void **)(a1 + 32);
        if (v43) {
          id v43 = (void *)v43[66];
        }
        id v44 = v43;
        uint64_t v45 = [v44 firstObject];

        uint64_t v46 = *(void *)(a1 + 32);
        if (v46) {
          v47 = *(void **)(v46 + 528);
        }
        else {
          v47 = 0;
        }
        objc_msgSend(v47, "removeObjectAtIndex:", 0, v59);
        uint64_t v48 = *(void *)(a1 + 32);
        if (v48)
        {
          uint64_t v49 = 248;
          if (!*(void *)(v48 + 248)) {
            uint64_t v49 = 240;
          }
          uint64_t v50 = (void **)*(id *)(v48 + v49);
        }
        else
        {
          uint64_t v50 = 0;
        }
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_555;
        void v61[3] = &unk_1E524B950;
        id v63 = v45;
        id v62 = v18;
        id v51 = v45;
        if (v50) {
          -[NWURLSessionDelegateQueue runDelegateBlock:](v50[6], v61);
        }
      }
      v52 = *(id **)(a1 + 32);
      if (!v25) {
        goto LABEL_72;
      }
LABEL_69:
      if (!v52)
      {
        id v58 = 0;
        if ((v17 & 1) == 0) {
          goto LABEL_73;
        }
        goto LABEL_86;
      }
      if (!v52[65])
      {
        objc_storeStrong(v52 + 65, v25);
        v52 = *(id **)(a1 + 32);
      }
LABEL_72:
      if ((v17 & 1) == 0)
      {
LABEL_73:
        -[NWURLSessionWebSocketTask processWork](v52);
        goto LABEL_74;
      }
      if (v52) {
        id v58 = v52[65];
      }
      else {
        id v58 = 0;
      }
LABEL_86:
      objc_msgSend(v52, "completeTaskWithError:", v58, v59);
LABEL_74:

LABEL_75:
      break;
  }
LABEL_76:
}

uint64_t __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_555(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4
{
  [(NWURLSessionWebSocketTask *)self _sendCloseCode:a3 reason:a4];

  [(NWURLSessionTask *)self cancel];
}

- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke;
  aBlock[3] = &unk_1E5249FB0;
  aBlock[4] = self;
  int64_t v21 = a3;
  id v7 = v6;
  id v20 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3;
  block[3] = &unk_1E524B950;
  block[4] = self;
  id v10 = v8;
  id v18 = v10;
  dispatch_async(queue, block);
  objc_initWeak(&location, self);
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (self) {
    long long v12 = self->super._queue;
  }
  else {
    long long v12 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_4;
  v14[3] = &unk_1E5243FB0;
  long long v13 = v12;
  objc_copyWeak(&v15, &location);
  dispatch_after(v11, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      *(void *)(v4 + 480) = *(void *)(a1 + 48);
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_nonatomic_copy(v5, v3, *(id *)(a1 + 40), 488);
      }
    }
    id v6 = nw_content_context_create("close");
    nw_content_context_set_is_final(v6, 1);
    metadata = nw_ws_create_metadata(nw_ws_opcode_close);
    uint64_t v8 = metadata;
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      nw_ws_metadata_set_close_code(metadata, (nw_ws_close_code_t)v9);
    }
    nw_content_context_set_metadata_for_protocol(v6, v8);
    id v10 = *(void **)(a1 + 32);
    if (v10) {
      id v10 = (void *)v10[63];
    }
    dispatch_time_t v11 = *(void **)(a1 + 40);
    long long v12 = v10;
    long long v13 = [v11 _createDispatchData];
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2;
    completion[3] = &unk_1E5248CD0;
    completion[4] = *(void *)(a1 + 32);
    nw_connection_send(v12, v13, v6, 1, completion);
  }
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  uint64_t v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  uint64_t v6 = *(void *)(a1 + 32);

  -[NWURLSessionWebSocketTask processWork](v6);
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 36) != 2)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v3 = (id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [v2 logDescription];
      [v2 logDescription];
      *(_DWORD *)buf = 68289282;
      int v7 = 16;
      __int16 v8 = 2098;
      uint64_t v9 = &v5;
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> cancelling automatically since the server did not reply to our close frame", buf, 0x18u);
    }

    [v2 cancel];
  }
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    uint64_t v3 = *(void ***)(a1 + 32);
    if (v3) {
      uint64_t v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v8, v3[33], v3);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  int v4 = [*(id *)(a1 + 32) error];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136);
    uint64_t v6 = *(void **)(a1 + 32);
  }
  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);
}

- (void)checkForCompletion
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    if (*(void *)(a1 + 288) == 1)
    {
      id v2 = [(id)a1 error];

      if (v2)
      {
        id v3 = [(id)a1 error];
        [(id)a1 completeTaskWithError:v3];
      }
    }
  }
}

- (void)sendPingWithPongReceiveHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke;
  aBlock[3] = &unk_1E524B950;
  aBlock[4] = self;
  id v12 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(aBlock);
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6;
  v9[3] = &unk_1E524B950;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    id v12 = -[NWURLSessionTask delegateWrapper](*(void **)(a1 + 32));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2;
    v18[3] = &unk_1E524B950;
    long long v13 = *(id *)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v13;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v12, v18);

    id v3 = v19;
  }
  else
  {
    id v3 = nw_content_context_create("ping");
    metadata = nw_ws_create_metadata(nw_ws_opcode_ping);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(NSObject **)(v5 + 232);
    }
    else {
      uint64_t v6 = 0;
    }
    pong_handler[0] = MEMORY[0x1E4F143A8];
    pong_handler[1] = 3221225472;
    pong_handler[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3;
    pong_handler[3] = &unk_1E5242798;
    pong_handler[4] = v5;
    id v17 = *(id *)(a1 + 40);
    nw_ws_metadata_set_pong_handler(metadata, v6, pong_handler);
    nw_content_context_set_metadata_for_protocol(v3, metadata);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      unsigned int v8 = *(unsigned __int16 *)(v7 + 470);
      *(_WORD *)(v7 + 470) = v8 + 1;
    }
    else
    {
      unsigned int v8 = 0;
    }
    __int16 buffer = __rev16(v8);
    uint64_t v9 = dispatch_data_create(&buffer, 2uLL, 0, 0);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      int v11 = *(NSObject **)(v10 + 504);
    }
    else {
      int v11 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5;
    v14[3] = &unk_1E5248CD0;
    void v14[4] = v10;
    nw_connection_send(v11, v9, v3, 1, v14);
  }
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  id v3 = *(const void **)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  uint64_t v6 = *(void *)(a1 + 32);

  -[NWURLSessionWebSocketTask processWork](v6);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void ***)(a1 + 32);
    if (v4) {
      id v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v3, v4[33], v4);
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) error];

  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      uint64_t v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    if (!v12) {
      goto LABEL_19;
    }
    objc_setProperty_atomic_copy(v12, v6, v4, 136);
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_19;
    }
  }
  uint64_t v9 = 248;
  if (!*(void *)(v8 + 248)) {
    uint64_t v9 = 240;
  }
  uint64_t v10 = (void **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4;
  v13[3] = &unk_1E524B950;
  id v11 = *(id *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  if (v10) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);
  }

  -[NWURLSessionWebSocketTask checkForCompletion](*(void *)(a1 + 32));
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = *(void ***)(a1 + 32);
    if (v3) {
      id v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v8, v3[33], v3);
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [*(id *)(a1 + 32) error];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136);
    uint64_t v6 = *(void **)(a1 + 32);
  }
  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)receiveMessageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E524B950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[66];
  }
  id v3 = *(const void **)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  uint64_t v6 = *(void *)(a1 + 32);

  -[NWURLSessionWebSocketTask processWork](v6);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5248030;
  id v16 = v6;
  id v17 = v7;
  aBlock[4] = self;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = _Block_copy(aBlock);
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5;
  block[3] = &unk_1E524B950;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] error];

  if (v2)
  {
    uint64_t v10 = -[NWURLSessionTask delegateWrapper](a1[4]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2;
    v14[3] = &unk_1E524B950;
    id v11 = a1[6];
    void v14[4] = a1[4];
    id v15 = v11;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v10, v14);

    id v3 = v15;
  }
  else
  {
    id v3 = nw_content_context_create("send");
    if ([a1[5] type])
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_text);
      uint64_t v5 = [a1[5] string];
      id v6 = [v5 dataUsingEncoding:4];
    }
    else
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
      id v6 = [a1[5] data];
    }
    nw_content_context_set_metadata_for_protocol(v3, metadata);
    id v7 = a1[4];
    if (v7) {
      id v7 = (void *)v7[63];
    }
    id v8 = v7;
    id v9 = [v6 _createDispatchData];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3;
    v12[3] = &unk_1E5242798;
    v12[4] = a1[4];
    id v13 = a1[6];
    nw_connection_send(v8, v9, v3, 1, v12);
  }
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[64];
  }
  id v3 = *(const void **)(a1 + 40);
  id v4 = v2;
  uint64_t v5 = _Block_copy(v3);
  [v4 addObject:v5];

  uint64_t v6 = *(void *)(a1 + 32);

  -[NWURLSessionWebSocketTask processWork](v6);
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void ***)(a1 + 32);
    if (v4) {
      id v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v3, v4[33], v4);
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) error];

  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      uint64_t v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    if (!v12) {
      goto LABEL_19;
    }
    objc_setProperty_atomic_copy(v12, v6, v4, 136);
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8) {
      goto LABEL_19;
    }
  }
  uint64_t v9 = 248;
  if (!*(void *)(v8 + 248)) {
    uint64_t v9 = 240;
  }
  uint64_t v10 = (void **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4;
  v13[3] = &unk_1E524B950;
  id v11 = *(id *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  if (v10) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);
  }

  -[NWURLSessionWebSocketTask checkForCompletion](*(void *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)startNextLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    nw_context_assert_queue(self->super._sessionContext);
    configuration = self->super._configuration;
  }
  else
  {
    nw_context_assert_queue(0);
    configuration = 0;
  }
  uint64_t v6 = configuration;
  BOOL v7 = [(NWURLSessionTask *)self currentRequest];
  id v8 = v7;
  if (v6) {
    objc_storeStrong(v6 + 4, v7);
  }

  if (self)
  {
    uint64_t v9 = self->super._configuration;
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      if ([(NSURLRequest *)v9->_request _explicitlySetTimeoutInterval]) {
        [p_isa[4] timeoutInterval];
      }
      else {
        [p_isa[2] timeoutIntervalForRequest];
      }
    }
    else
    {
      double v11 = 0.0;
    }
    self->super._timeoutIntervalForRequest = v11;

    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v3)
    {
LABEL_11:
      -[NWURLSessionTask startStartTimer]((uint64_t)self);
      -[NWURLSessionTask startResourceTimer](self);
    }
  }
  id v12 = [NWURLLoaderHTTP alloc];
  id v13 = [(NWURLSessionTask *)self currentRequest];
  if (self)
  {
    id v14 = self->super._configuration;
    id v15 = self->super._queue;
    id v16 = (NWURLLoader *)-[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]((id *)&v12->super.isa, v13, 0, v14, v15, self);
    loader = self->super._loader;
    self->super._loader = v16;

    id v18 = self->super._loader;
  }
  else
  {

    id v18 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke;
  v19[3] = &unk_1E524BAA8;
  v19[4] = self;
  [(NWURLLoader *)v18 start:v19];
}

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[33];
  }
  BOOL v3 = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2;
  v5[3] = &unk_1E5242520;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  [v4 readResponse:v5];
}

id __44__NWURLSessionWebSocketTask_handleResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, _DWORD *a4)
{
  if (a2 || (uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8), *(unsigned char *)(v4 + 24)))
  {
    id v5 = 0;
    *a4 = 0;
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    *a4 = 2;
    id v5 = *(id *)(a1 + 32);
  }

  return v5;
}

- (id)response
{
  if (self) {
    self = (NWURLSessionWebSocketTask *)self->_closeReason;
  }
  return self;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionWebSocketTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

+ (void)addWebSocketHeadersToRequest:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  BOOL v3 = [v2 valueForHTTPHeaderField:@"Connection"];

  if (!v3) {
    [v2 setValue:@"Upgrade" forHTTPHeaderField:@"Connection"];
  }
  uint64_t v4 = [v2 valueForHTTPHeaderField:@"Upgrade"];

  if (!v4) {
    [v2 setValue:@"websocket" forHTTPHeaderField:@"Upgrade"];
  }
  objc_super v5 = [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Version"];

  if (!v5) {
    [v2 setValue:@"13" forHTTPHeaderField:@"Sec-WebSocket-Version"];
  }
  id v6 = [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Key"];

  if (!v6)
  {
    arc4random_buf(__buf, 0x10uLL);
    BOOL v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__buf length:16];
    id v8 = [v7 base64EncodedStringWithOptions:0];
    [v2 setValue:v8 forHTTPHeaderField:@"Sec-WebSocket-Key"];
  }
  uint64_t v9 = [v2 valueForHTTPHeaderField:@"Sec-WebSocket-Extensions"];

  if (!v9) {
    [v2 setValue:@"permessage-deflate" forHTTPHeaderField:@"Sec-WebSocket-Extensions"];
  }
}

@end