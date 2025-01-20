@interface NEFilterDataExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (NSDictionary)URLAppendStringMap;
- (NSDictionary)remediationMap;
- (id)extensionPoint;
- (id)findFlowWithFlow:(uint64_t)a1;
- (id)socketExceptions;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)closeBrowserFilterFlow:(uint64_t)a1;
- (void)closeChannelFlow:(id *)a1;
- (void)closeFlow:(id *)a1;
- (void)closeSocketFlow:(uint64_t)a3 socketID:;
- (void)fetchAppInfoForPID:(int)a3 UUID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)fetchProviderConnectionWithCompletionHandler:(id)a3;
- (void)handleChannelMessageFlowFinish:(void *)a3 filloutReply:(void *)a4 completionHandler:;
- (void)handleClientMessage:(id)a3 filloutReply:(id)a4 completionHandler:(id)a5;
- (void)handleData:(uint64_t)a3 offset:(void *)a4 forFlow:(uint64_t)a5 direction:(void *)a6 reply:(int)a7 controlSocket:(void *)a8 completionHandler:;
- (void)handleDataCompleteForFlow:(uint64_t)a3 direction:(void *)a4 reply:(int)a5 controlSocket:(void *)a6 completionHandler:;
- (void)handleNewFlow:(void *)a3 reply:(int)a4 controlSocket:(void *)a5 completionHandler:;
- (void)handleRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)providerControlSocketFileHandle:(id)a3;
- (void)report:(id)a3;
- (void)reportFlow:(void *)a3 forVerdict:(uint64_t)a4 event:;
- (void)reportFlow:(void *)a3 forVerdict:(void *)a4 absoluteVerdict:;
- (void)reportFlowClosed:(void *)a1;
- (void)reportFlowStats:(void *)a1;
- (void)resumeFlow:(id)a3 withVerdict:(id)a4;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendSocketContentFilterRequest;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
- (void)updateFlow:(id)a3 withVerdict:(id)a4 forDirection:(int64_t)a5;
@end

@implementation NEFilterDataExtensionProviderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConnections, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_socketExceptions, 0);
  objc_storeStrong((id *)&self->_channelFlows, 0);
  objc_storeStrong((id *)&self->_socketFlows, 0);
  objc_storeStrong((id *)&self->_browserFlows, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_URLAppendStringMap, 0);

  objc_storeStrong((id *)&self->_remediationMap, 0);
}

- (NSDictionary)URLAppendStringMap
{
  return self->_URLAppendStringMap;
}

- (NSDictionary)remediationMap
{
  return self->_remediationMap;
}

- (void)fetchAppInfoForPID:(int)a3 UUID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(NEFilterExtensionProviderContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke;
  block[3] = &unk_1E5990ED8;
  int v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

void __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = [(NEExtensionProviderContext *)*(void **)(a1 + 32) hostContext];

  if (v3)
  {
    self = objc_alloc_init(NEAppInfo);
    if (self)
    {
      self->_pid = *(_DWORD *)(a1 + 64);
      objc_setProperty_nonatomic_copy(self, v4, *(id *)(a1 + 40), 16);
      objc_setProperty_nonatomic_copy(self, v5, *(id *)(a1 + 48), 24);
    }
    v6 = [(NEExtensionProviderContext *)*(void **)(a1 + 32) hostContext];
    [v6 getSourceAppInfo:self completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
}

- (void)report:(id)a3
{
  id v6 = a3;
  if (self && self->_controlProviderExists)
  {
    SEL v5 = [(NEExtensionProviderContext *)self hostContext];
    [v5 report:v6];
  }
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [(NEExtensionProviderContext *)self hostContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke;
  v11[3] = &unk_1E598FAD0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 fetchCurrentRulesForFlow:v7 completionHandler:v11];
}

void __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2;
  v7[3] = &unk_1E59936F8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)handleClientMessage:(id)a3 filloutReply:(id)a4 completionHandler:(id)a5
{
  uint64_t v238 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch(xpc_dictionary_get_int64(v8, "command"))
  {
    case 2:
      if (v9)
      {
        id v11 = v8;
        id v30 = v9;
        v31 = (void (**)(void))v10;
        if (self)
        {
          xpc_object_t xdicta = v30;
          id v212 = v10;
          v225[0] = 0;
          memset(applier, 0, sizeof(applier));
          uuid = xpc_dictionary_get_uuid(v11, "flow-uuid");
          int64_t int64 = xpc_dictionary_get_int64(v11, "direction");
          string = xpc_dictionary_get_string(v11, "url");
          v35 = (void *)xpc_dictionary_get_string(v11, "parent-url");
          v36 = xpc_dictionary_get_string(v11, "source-app-bundle-id");
          uint64_t int64 = xpc_dictionary_get_uint64(v11, "source-app-pid");
          uint64_t v189 = xpc_dictionary_get_uint64(v11, "source-pid");
          id newValue = (id)xpc_dictionary_get_uint64(v11, "socket-identifier");
          int v37 = xpc_dictionary_get_uint64(v11, "connection-direction");
          if (uuid && (unint64_t)(int64 - 3) > 0xFFFFFFFFFFFFFFFDLL)
          {
            int v188 = v37;
            if (string)
            {
              v38 = [NSString stringWithUTF8String:string];
              if (v38)
              {
                v39 = [MEMORY[0x1E4F1CB10] URLWithString:v38];
              }
              else
              {
                v39 = 0;
              }
            }
            else
            {
              v39 = 0;
            }
            if (v35)
            {
              v149 = [NSString stringWithUTF8String:v35];
              if (v149)
              {
                v35 = [MEMORY[0x1E4F1CB10] URLWithString:v149];
              }
              else
              {
                v35 = 0;
              }
            }
            if (v36) {
              v204 = objc_msgSend([NSString alloc], "initWithFormat:", @".%s", v36);
            }
            else {
              v204 = 0;
            }
            v150 = [NEFilterBrowserFlow alloc];
            id v199 = v35;
            if (v150
              && (aBlock[0] = (size_t)v150,
                  aBlock[1] = (size_t)NEFilterBrowserFlow,
                  (v151 = [(size_t *)(objc_super *)aBlock initWithURL:v39 sourceAppIdentifier:v204]) != 0))
            {
              v152 = v151;
              objc_storeStrong(v151 + 21, v35);
              id v153 = v152[19];
              v152[19] = 0;

              id v154 = v152[20];
              v152[20] = 0;

              *((unsigned char *)v152 + 13) = v204 != 0;
              aBlock[0] = 0;
              data = xpc_dictionary_get_data(v11, "crypto-signature", aBlock);
              if (data && aBlock[0])
              {
                v156 = data;
                id v157 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v158 = (void *)[v157 initWithBytes:v156 length:aBlock[0]];
                objc_msgSend(v152, "setCrypto_signature:", v158);
              }
              v159 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
              objc_setProperty_atomic_copy(v152, v160, v159, 128);

              [v152 setEpid:uint64];
              [v152 setPid:v189];
              if (v188) {
                uint64_t v161 = 2;
              }
              else {
                uint64_t v161 = 1;
              }
              [v152 setDirection:v161];
              xpc_dictionary_get_audit_token();
              v162 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:applier length:32];
              [v152 setSourceAppAuditToken:v162];

              v163 = xpc_dictionary_get_remote_connection(v11);
              objc_setProperty_atomic(v152, v164, v163, 144);

              v165 = xpc_dictionary_get_data(v11, "url-request", v225);
              if (v165)
              {
                v166 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v165 length:v225[0]];
                if (v166)
                {
                  v167 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v166 error:0];
                  v168 = [v167 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Request"];
                  [v152 setRequest:v168];

                  [v167 finishDecoding];
                }
              }
              v169 = xpc_dictionary_get_data(v11, "url-response", v225);
              if (v169)
              {
                v170 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v169 length:v225[0]];
                if (v170)
                {
                  v171 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v170 error:0];
                  v172 = [v171 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Response"];
                  [v152 setResponse:v172];

                  [v171 finishDecoding];
                }
              }
              if (newValue)
              {
                v173 = -[NEFilterDataExtensionProviderContext socketExceptions]((uint64_t)self);
                v174 = [NSNumber numberWithUnsignedLongLong:newValue];
                [v173 addObject:v174];
              }
              browserFlows = self->_browserFlows;
              if (!browserFlows)
              {
                v176 = [MEMORY[0x1E4F1CA60] dictionary];
                v177 = self->_browserFlows;
                self->_browserFlows = v176;

                browserFlows = self->_browserFlows;
              }
              v178 = browserFlows;
              id v180 = objc_getProperty(v152, v179, 128, 1);
              [(NSMutableDictionary *)v178 setObject:v152 forKeyedSubscript:v180];

              id v30 = xdicta;
              -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:](self, v152, xdicta, -1, v31);
            }
            else
            {

              v181 = ne_log_obj();
              if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
              {
                LOWORD(aBlock[0]) = 0;
                _os_log_error_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_ERROR, "browserFlow: New flow rejected because flow object creation failed", (uint8_t *)aBlock, 2u);
              }

              id v30 = xdicta;
              xpc_dictionary_set_int64(xdicta, "error", 1);
              v31[2](v31);
              v152 = 0;
            }
          }
          else
          {
            v127 = ne_log_obj();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(aBlock[0]) = 0;
              _os_log_debug_impl(&dword_19DDAF000, v127, OS_LOG_TYPE_DEBUG, "browserFlow: New flow rejected due to invalid parameters", (uint8_t *)aBlock, 2u);
            }

            id v30 = xdicta;
            xpc_dictionary_set_int64(xdicta, "error", 4);
            v31[2](v31);
          }
          id v10 = v212;
        }

        goto LABEL_247;
      }
      v124 = ne_log_obj();
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v125 = "Reply dictionary is NULL when handling a source new flow message";
      goto LABEL_139;
    case 3:
      if (!v9)
      {
        v124 = ne_log_obj();
        if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
          goto LABEL_140;
        }
        LOWORD(applier[0]) = 0;
        v125 = "Reply dictionary is NULL when handling a source add data message";
        goto LABEL_139;
      }
      id v11 = v8;
      id v12 = v9;
      id v14 = (void (**)(void))v10;
      if (!self) {
        goto LABEL_179;
      }
      if (self->_browserFlows)
      {
        v40 = xpc_dictionary_get_uuid(v11, "flow-uuid");
        if (v40)
        {
          size_t v41 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v40];
          v42 = ne_log_obj();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 138412290;
            *(size_t *)((char *)applier + 4) = v41;
            _os_log_debug_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_DEBUG, "browserFlow: add-data message received, %@", (uint8_t *)applier, 0xCu);
          }

          xpc_object_t xdictb = (xpc_object_t)v41;
          v43 = [(NSMutableDictionary *)self->_browserFlows objectForKey:v41];
          if (v43)
          {
            int64_t v44 = xpc_dictionary_get_int64(v11, "direction");
            aBlock[0] = 0;
            v45 = xpc_dictionary_get_data(v11, "data", aBlock);
            if (v45 && aBlock[0])
            {
              v46 = v45;
              uint64_t v201 = v44;
              applier[0] = 0;
              v47 = xpc_dictionary_get_data(v11, "url-request", applier);
              if (v47)
              {
                v48 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 length:applier[0]];
                if (v48)
                {
                  v195 = v46;
                  v49 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v48 error:0];
                  [v49 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Request"];
                  v50 = id v213 = v10;
                  [v43 setRequest:v50];

                  id v10 = v213;
                  [v49 finishDecoding];

                  v46 = v195;
                }
              }
              v51 = xpc_dictionary_get_data(v11, "url-response", applier);
              if (v51)
              {
                v52 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v51 length:applier[0]];
                if (v52)
                {
                  v196 = v46;
                  v53 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v52 error:0];
                  [v53 decodeObjectOfClass:objc_opt_class() forKey:@"URL_Response"];
                  v54 = id v214 = v10;
                  [v43 setResponse:v54];

                  id v10 = v214;
                  [v53 finishDecoding];

                  v46 = v196;
                }
              }
              uint64_t v55 = xpc_dictionary_get_uint64(v11, "data-start-offset");
              v56 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v46 length:aBlock[0]];
              -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:](self, v56, v55, v43, v201, v12, -1, v14);

              goto LABEL_191;
            }
            v148 = ne_log_obj();
            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl(&dword_19DDAF000, v148, OS_LOG_TYPE_DEBUG, "browserFlow: Add data message rejected, invalid data parameter %@", (uint8_t *)applier, 0xCu);
            }

            v143 = v12;
            int64_t v144 = 4;
          }
          else
          {
            v142 = ne_log_obj();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl(&dword_19DDAF000, v142, OS_LOG_TYPE_DEBUG, "browserFlow: Add data message ignored, %@", (uint8_t *)applier, 0xCu);
            }

            v143 = v12;
            int64_t v144 = 6;
          }
          xpc_dictionary_set_int64(v143, "error", v144);
          v14[2](v14);
LABEL_191:

          goto LABEL_179;
        }
        v137 = ne_log_obj();
        if (!os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
          goto LABEL_160;
        }
        LOWORD(applier[0]) = 0;
        v138 = "browserFlow: Add data flow rejected due to invalid parameters";
LABEL_250:
        _os_log_error_impl(&dword_19DDAF000, v137, OS_LOG_TYPE_ERROR, v138, (uint8_t *)applier, 2u);
LABEL_160:

        v131 = v12;
        int64_t v132 = 4;
      }
      else
      {
        v129 = ne_log_obj();
        if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
          goto LABEL_150;
        }
        LOWORD(applier[0]) = 0;
        v130 = "browserFlow: Add data message rejected, no browser flow exist";
LABEL_238:
        _os_log_error_impl(&dword_19DDAF000, v129, OS_LOG_TYPE_ERROR, v130, (uint8_t *)applier, 2u);
LABEL_150:

        v131 = v12;
        int64_t v132 = 1;
      }
      xpc_dictionary_set_int64(v131, "error", v132);
      v14[2](v14);
LABEL_179:

LABEL_246:
LABEL_247:

      goto LABEL_248;
    case 4:
      if (!v9)
      {
        v124 = ne_log_obj();
        if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
          goto LABEL_140;
        }
        LOWORD(applier[0]) = 0;
        v125 = "Reply dictionary is NULL when handling a source data complete message";
        goto LABEL_139;
      }
      id v11 = v8;
      id v12 = v9;
      id v14 = (void (**)(void))v10;
      if (!self) {
        goto LABEL_179;
      }
      if (!self->_browserFlows)
      {
        v129 = ne_log_obj();
        if (!os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
          goto LABEL_150;
        }
        LOWORD(applier[0]) = 0;
        v130 = "browserFlow data complete message rejected, no browser flows exist.";
        goto LABEL_238;
      }
      v57 = xpc_dictionary_get_uuid(v11, "flow-uuid");
      if (!v57)
      {
        v137 = ne_log_obj();
        if (!os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
          goto LABEL_160;
        }
        LOWORD(applier[0]) = 0;
        v138 = "browserFlow data complete message rejected, invalid Flow UUID parameter";
        goto LABEL_250;
      }
      v17 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v57];
      id v19 = [(NSMutableDictionary *)self->_browserFlows objectForKey:v17];
      if (v19)
      {
        id v211 = v10;
        int64_t v58 = xpc_dictionary_get_int64(v11, "direction");
        objc_msgSend(v19, "setInBytes:", xpc_dictionary_get_uint64(v11, "byte-count-inbound"));
        objc_msgSend(v19, "setOutBytes:", xpc_dictionary_get_uint64(v11, "byte-count-outbound"));
        aBlock[0] = 0;
        v59 = xpc_dictionary_get_data(v11, "crypto-signature", aBlock);
        if (v59 && aBlock[0])
        {
          v60 = v59;
          id v61 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v62 = (void *)[v61 initWithBytes:v60 length:aBlock[0]];
          objc_msgSend(v19, "setCrypto_signature:", v62);
        }
        v63 = ne_log_obj();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v17;
          _os_log_debug_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_DEBUG, "browserFlow data complete message received, %@", (uint8_t *)applier, 0xCu);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:](self, v19, v58, v12, -1, v14);
        goto LABEL_60;
      }
      v145 = ne_log_obj();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(applier[0]) = 138412290;
        *(size_t *)((char *)applier + 4) = (size_t)v17;
        _os_log_debug_impl(&dword_19DDAF000, v145, OS_LOG_TYPE_DEBUG, "browserFlow data complete message ignored, no open flow for %@", (uint8_t *)applier, 0xCu);
      }

      xpc_dictionary_set_int64(v12, "error", 6);
      goto LABEL_176;
    case 5:
      if (v9)
      {
        id v64 = v8;
        id v65 = v9;
        v66 = (void (**)(void))v10;
        if (self)
        {
          if (self->_browserFlows)
          {
            v67 = xpc_dictionary_get_uuid(v64, "flow-uuid");
            if (v67)
            {
              uint64_t v68 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v67];
              v69 = self->_browserFlows;
              xpc_object_t xdictc = (xpc_object_t)v68;
              v70 = [(NSMutableDictionary *)v69 objectForKey:v68];

              v71 = ne_log_obj();
              BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG);
              if (v70)
              {
                id v202 = v64;
                id v215 = v10;
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_DEBUG, "browserFlow: Remediation message received, %@", (uint8_t *)applier, 0xCu);
                }

                v70[10] = 1;
                v73 = [(NEExtensionProviderContext *)self _principalObject];
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                *(void *)v232 = __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke;
                *(void *)&v232[8] = &unk_1E598F9E0;
                *(void *)&v232[16] = v73;
                v74 = v70;
                id v233 = v74;
                id v197 = v73;
                v75 = _Block_copy(aBlock);
                applier[0] = MEMORY[0x1E4F143A8];
                applier[1] = 3221225472;
                applier[2] = (size_t)__96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2;
                applier[3] = (size_t)&unk_1E598FAF8;
                v76 = v74;
                *(void *)&long long v228 = v76;
                *((void *)&v228 + 1) = self;
                id v229 = v65;
                v230 = v66;
                v77 = _Block_copy(applier);
                v78 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v75, v77);
                -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v78, v76, self);

                id v10 = v215;
                id v64 = v202;
              }
              else
              {
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_DEBUG, "Remediation message ignored, no open flow for %@", (uint8_t *)applier, 0xCu);
                }

                xpc_dictionary_set_int64(v65, "error", 6);
                v66[2](v66);
              }

              goto LABEL_184;
            }
            v139 = ne_log_obj();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl(&dword_19DDAF000, v139, OS_LOG_TYPE_ERROR, "Remediation message rejected, invalid flow UUID parameter", (uint8_t *)applier, 2u);
            }

            v134 = v65;
            int64_t v135 = 4;
          }
          else
          {
            v133 = ne_log_obj();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl(&dword_19DDAF000, v133, OS_LOG_TYPE_ERROR, "Remediation message rejected, no browser flow exists", (uint8_t *)applier, 2u);
            }

            v134 = v65;
            int64_t v135 = 1;
          }
          xpc_dictionary_set_int64(v134, "error", v135);
          v66[2](v66);
        }
LABEL_184:

        goto LABEL_248;
      }
      v124 = ne_log_obj();
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v125 = "Reply dictionary is NULL when handling a source remediate message";
      goto LABEL_139;
    case 6:
      if (v9)
      {
        id v11 = v8;
        id v12 = v9;
        v79 = (void (**)(void))v10;
        if (!self)
        {
LABEL_245:

          goto LABEL_246;
        }
        id v216 = v10;
        *(_OWORD *)v225 = 0u;
        long long v226 = 0u;
        v80 = xpc_dictionary_get_uuid(v11, "flow-uuid");
        if (!v80)
        {
          v136 = ne_log_obj();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(applier[0]) = 0;
            _os_log_debug_impl(&dword_19DDAF000, v136, OS_LOG_TYPE_DEBUG, "channelFlow new channelFlow message rejected, invalid Flow UUID parameter", (uint8_t *)applier, 2u);
          }

          xpc_dictionary_set_int64(v12, "error", 4);
          v79[2](v79);
          goto LABEL_245;
        }
        v81 = v80;
        v198 = v79;
        unsigned __int16 v82 = xpc_dictionary_get_uint64(v11, "ip-protocol");
        uint64_t v83 = xpc_dictionary_get_uint64(v11, "client-pid");
        uint64_t v84 = xpc_dictionary_get_uint64(v11, "client-e-pid");
        int xdictd = xpc_dictionary_get_uint64(v11, "connection-direction");
        *(_OWORD *)aBlock = 0u;
        memset(v232, 0, 21);
        uuid_unparse(v81, (char *)aBlock);
        v235[0] = 0;
        v235[1] = 0;
        v85 = xpc_dictionary_get_uuid(v11, "client-proc-uuid");
        if (v85) {
          uuid_copy((unsigned __int8 *)v235, v85);
        }
        memset(dst, 0, sizeof(dst));
        v86 = xpc_dictionary_get_uuid(v11, "client-e-proc-uuid");
        if (v86) {
          uuid_copy(dst, v86);
        }
        size_t v224 = 0;
        *(void *)&length.sa_len = 0;
        *(void *)&length.sa_data[6] = 0;
        int v223 = 0;
        uint64_t v222 = 0;
        if (xpc_dictionary_get_data(v11, "local-addr", &v224) && v224 <= 0x1C) {
          __memcpy_chk();
        }
        *(void *)&v218.sa_len = 0;
        *(void *)&v218.sa_data[6] = 0;
        int v220 = 0;
        uint64_t v219 = 0;
        int v87 = 0;
        v203 = v12;
        if (xpc_dictionary_get_data(v11, "remote-addr", &v224) && v224 <= 0x1C)
        {
          __memcpy_chk();
          if (v218.sa_family == 30) {
            int v88 = 30;
          }
          else {
            int v88 = 0;
          }
          int v87 = v88;
        }
        if (v82 == 17) {
          int v89 = 2;
        }
        else {
          int v89 = 1;
        }
        id newValuea = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v81];
        v90 = -[NEFilterSocketFlow initWithSocketFamily:socketType:socketProtocol:pid:epid:uuid:euuid:socketID:]([NEFilterSocketFlow alloc], v87, v89, v82, v83, v84, (uint64_t)v235, (uint64_t)dst, -1);
        if (!v90)
        {
          v140 = ne_log_obj();
          v79 = v198;
          id v12 = v203;
          v96 = newValuea;
          if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
          {
            LODWORD(applier[0]) = 138412290;
            *(size_t *)((char *)applier + 4) = (size_t)newValuea;
            _os_log_error_impl(&dword_19DDAF000, v140, OS_LOG_TYPE_ERROR, "New flow %@ rejected because flow creation failed", (uint8_t *)applier, 0xCu);
          }

          xpc_dictionary_set_int64(v203, "error", 1);
          xpc_dictionary_set_uuid(v203, "flow-uuid", v81);
          v198[2](v198);
          id v10 = v216;
          v141 = 0;
          goto LABEL_244;
        }
        size_t v217 = 0;
        v91 = xpc_dictionary_get_data(v11, "crypto-signature", &v217);
        v79 = v198;
        if (v91 && v217)
        {
          v93 = v91;
          id v94 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v95 = (void *)[v94 initWithBytes:v93 length:v217];
          objc_msgSend(v90, "setCrypto_signature:", v95);
        }
        v96 = newValuea;
        objc_setProperty_atomic_copy(v90, v92, newValuea, 128);
        if (xdictd) {
          uint64_t v97 = 2;
        }
        else {
          uint64_t v97 = 1;
        }
        [v90 setDirection:v97];
        xpc_dictionary_get_audit_token();
        v98 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v225 length:32];
        [v90 setSourceAppAuditToken:v98];

        v99 = [v90 sourceAppAuditToken];
        [v90 setSourceProcessAuditToken:v99];

        v100 = xpc_dictionary_get_remote_connection(v11);
        objc_setProperty_atomic(v90, v101, v100, 144);

        v102 = xpc_dictionary_get_string(v11, "source-app-bundle-id");
        id v10 = v216;
        if (v102)
        {
          v103 = objc_msgSend([NSString alloc], "initWithFormat:", @".%s", v102);
          [v90 setSourceAppIdentifier:v103];

          v90[13] = 1;
        }
        xpc_object_t xdicte = v90;
        v104 = xpc_dictionary_get_string(v11, "url");
        if (v104)
        {
          v105 = v104;
          id v106 = objc_alloc(MEMORY[0x1E4F1CB10]);
          v107 = [NSString stringWithUTF8String:v105];
          v108 = (void *)[v106 initWithString:v107];
          [xdicte setURL:v108];
        }
        v109 = xpc_dictionary_get_string(v11, "remote-hostname");
        if (v109)
        {
          v110 = (void *)[[NSString alloc] initWithCString:v109 encoding:4];
          [xdicte setRemoteHostname:v110];
        }
        -[NEFilterSocketFlow setLocalAddress:](xdicte, &length);
        -[NEFilterSocketFlow setRemoteAddress:](xdicte, &v218);
        channelFlows = self->_channelFlows;
        id v12 = v203;
        if (!channelFlows)
        {
          v112 = [MEMORY[0x1E4F1CA60] dictionary];
          v113 = self->_channelFlows;
          self->_channelFlows = v112;

          channelFlows = self->_channelFlows;
        }
        [(NSMutableDictionary *)channelFlows setObject:xdicte forKey:newValuea];
        id v191 = newValuea;
        if (!v191)
        {
          v187 = ne_log_obj();
          if (os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext blessClient:]";
            _os_log_fault_impl(&dword_19DDAF000, v187, OS_LOG_TYPE_FAULT, "%s called with null clientUUID", (uint8_t *)applier, 0xCu);
          }

LABEL_242:
          id v10 = v216;
          v79 = v198;
          id v12 = v203;
          v96 = newValuea;
          goto LABEL_243;
        }
        source = self->_source;
        if (source)
        {
          int handle = dispatch_source_get_handle(source);
          if ((handle & 0x80000000) == 0)
          {
            *(void *)&long long v228 = 0;
            *(_OWORD *)applier = xmmword_19DF9BEE0;
            *(_OWORD *)&applier[2] = 0uLL;
            [v191 getUUIDBytes:&applier[3]];
            unint64_t v116 = 0;
            while (1)
            {
              ssize_t v117 = write(handle, (char *)applier + v116, 40 - v116);
              v118 = __error();
              if (v117 < 1)
              {
                if (v117)
                {
                  int v119 = *v118;
                  if (*v118 != 35)
                  {
                    v183 = ne_log_obj();
                    v184 = v183;
                    if (v119 == 2)
                    {
                      if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_debug_impl(&dword_19DDAF000, v184, OS_LOG_TYPE_DEBUG, "No socket flow to bless, ignore", buf, 2u);
                      }
                    }
                    else if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
                    {
                      v185 = strerror(v119);
                      *(_DWORD *)buf = 136315138;
                      v237 = v185;
                      _os_log_error_impl(&dword_19DDAF000, v184, OS_LOG_TYPE_ERROR, "Write operation on the control socket failed while blessing the socket (%s)", buf, 0xCu);
                    }

                    goto LABEL_242;
                  }
                }
              }
              else
              {
                v116 += v117;
              }
              if (v116 >= 0x28) {
                goto LABEL_242;
              }
            }
          }
          v146 = ne_log_obj();
          if (!os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
            goto LABEL_230;
          }
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v191;
          v147 = "Failed to find control socket to bless client %@";
        }
        else
        {
          v146 = ne_log_obj();
          if (!os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
          {
LABEL_230:

LABEL_243:
            v141 = xdicte;
            -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:](self, xdicte, v12, -1, v79);
LABEL_244:

            goto LABEL_245;
          }
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v191;
          v147 = "Failed to find control socket source to bless client %@";
        }
        _os_log_error_impl(&dword_19DDAF000, v146, OS_LOG_TYPE_ERROR, v147, (uint8_t *)applier, 0xCu);
        goto LABEL_230;
      }
      v124 = ne_log_obj();
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v125 = "Reply dictionary is NULL when handling a protocol new flow message";
      goto LABEL_139;
    case 7:
    case 8:
      if (v9)
      {
        id v11 = v8;
        id v12 = v9;
        v13 = (void (**)(void))v10;
        id v14 = v13;
        if (!self) {
          goto LABEL_179;
        }
        if (v11)
        {
          if (v13)
          {
            int64_t v15 = xpc_dictionary_get_int64(v11, "command");
            uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", xpc_dictionary_get_uuid(v11, "flow-uuid"));
            if (v16)
            {
              v17 = v16;
              int64_t v194 = v15;
              if (v15 == 8) {
                uint64_t v18 = 2;
              }
              else {
                uint64_t v18 = 1;
              }
              id v19 = [(NSMutableDictionary *)self->_channelFlows objectForKey:v16];
              if (v19)
              {
                *(void *)&length.sa_len = 0;
                aBlock[0] = 0;
                aBlock[1] = 0;
                *(_DWORD *)&v232[8] = 0;
                *(void *)v232 = 0;
                if (xpc_dictionary_get_data(v11, "local-addr", (size_t *)&length.sa_len)
                  && *(void *)&length.sa_len <= 0x1CuLL)
                {
                  __memcpy_chk();
                  -[NEFilterSocketFlow setLocalAddress:](v19, (sockaddr *)aBlock);
                }
                uint64_t v200 = v18;
                id v211 = v10;
                v225[0] = 0;
                v225[1] = 0;
                DWORD2(v226) = 0;
                *(void *)&long long v226 = 0;
                if (xpc_dictionary_get_data(v11, "remote-addr", (size_t *)&length.sa_len)
                  && *(void *)&length.sa_len <= 0x1CuLL)
                {
                  __memcpy_chk();
                  -[NEFilterSocketFlow setRemoteAddress:](v19, (sockaddr *)v225);
                }
                xpc_object_t xdict = v12;
                *(void *)&v218.sa_len = 0;
                id v20 = xpc_dictionary_get_data(v11, "crypto-signature", (size_t *)&v218.sa_len);
                if (v20 && *(void *)&v218.sa_len)
                {
                  int v21 = v20;
                  id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                  v23 = (void *)[v22 initWithBytes:v21 length:*(void *)&v218.sa_len];
                  objc_msgSend(v19, "setCrypto_signature:", v23);
                }
                uint64_t v24 = xpc_dictionary_get_uint64(v11, "pending-data-start-offset");
                v235[0] = 0;
                v25 = xpc_dictionary_get_data(v11, "data", v235);
                id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v27 = (void *)[v26 initWithBytes:v25 length:v235[0]];
                v28 = ne_log_obj();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  v182 = "out";
                  LODWORD(applier[0]) = 136315906;
                  if (v194 == 8) {
                    v182 = "in";
                  }
                  *(size_t *)((char *)applier + 4) = (size_t)v182;
                  WORD2(applier[1]) = 2112;
                  *(size_t *)((char *)&applier[1] + 6) = (size_t)v17;
                  HIWORD(applier[2]) = 2048;
                  applier[3] = v24;
                  LOWORD(v228) = 2048;
                  *(void *)((char *)&v228 + 2) = v235[0];
                  _os_log_debug_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_DEBUG, "Received %sbound data for %@ (offset %lld, dataLen %zu)", (uint8_t *)applier, 0x2Au);
                }

                uint64_t v29 = v24;
                id v12 = xdict;
                -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:](self, v27, v29, v19, v200, xdict, -1, v14);

LABEL_60:
                id v10 = v211;
              }
              else
              {
                xpc_dictionary_set_int64(v12, "error", 6);
                v128 = ne_log_obj();
                if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)v17;
                  _os_log_debug_impl(&dword_19DDAF000, v128, OS_LOG_TYPE_DEBUG, "Add data message rejected, no flow for %@", (uint8_t *)applier, 0xCu);
                }

LABEL_176:
                v14[2](v14);
              }
            }
            else
            {
              v126 = ne_log_obj();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(applier[0]) = 0;
                _os_log_debug_impl(&dword_19DDAF000, v126, OS_LOG_TYPE_DEBUG, "New data message rejected, invalid flow UUID", (uint8_t *)applier, 2u);
              }

              xpc_dictionary_set_int64(v12, "error", 4);
              v14[2](v14);
              v17 = 0;
            }
            goto LABEL_178;
          }
          v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext handleChannelMessageMoreDa"
                                                       "ta:filloutReply:completionHandler:]";
            v186 = "%s called with null completionHandler";
            goto LABEL_257;
          }
        }
        else
        {
          v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext handleChannelMessageMoreDa"
                                                       "ta:filloutReply:completionHandler:]";
            v186 = "%s called with null message";
LABEL_257:
            _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, v186, (uint8_t *)applier, 0xCu);
          }
        }
LABEL_178:

        goto LABEL_179;
      }
      v124 = ne_log_obj();
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v125 = "Reply dictionary is NULL when handling a protocol data message";
LABEL_139:
      _os_log_error_impl(&dword_19DDAF000, v124, OS_LOG_TYPE_ERROR, v125, (uint8_t *)applier, 2u);
LABEL_140:

LABEL_248:
      return;
    case 9:
    case 10:
      if (v9) {
        goto LABEL_23;
      }
      v124 = ne_log_obj();
      if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        goto LABEL_140;
      }
      LOWORD(applier[0]) = 0;
      v125 = "Reply dictionary is NULL when handling a protocol data finished message";
      goto LABEL_139;
    case 11:
LABEL_23:
      -[NEFilterDataExtensionProviderContext handleChannelMessageFlowFinish:filloutReply:completionHandler:]((id *)&self->super.super.super.super.isa, v8, v9, v10);
      goto LABEL_248;
    case 12:
      id v11 = v10;
      if (!self) {
        goto LABEL_247;
      }
      v120 = xpc_dictionary_get_array(v8, "stats-report-statistics");
      id v12 = v120;
      if (v120 && xpc_array_get_count(v120))
      {
        v121 = ne_log_obj();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(applier[0]) = 134217984;
          *(size_t *)((char *)applier + 4) = xpc_array_get_count(v12);
          _os_log_debug_impl(&dword_19DDAF000, v121, OS_LOG_TYPE_DEBUG, "Channel Stats Report - stats count %zu", (uint8_t *)applier, 0xCu);
        }

        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = (size_t)__103__NEFilterDataExtensionProviderContext_handleChannelMessageStatsReport_filloutReply_completionHandler___block_invoke;
        applier[3] = (size_t)&unk_1E598FB40;
        id v122 = v11;
        *(void *)&long long v228 = self;
        *((void *)&v228 + 1) = v122;
        xpc_array_apply(v12, applier);
        v123 = *((void *)&v228 + 1);
      }
      else
      {
        v123 = ne_log_obj();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          LOWORD(applier[0]) = 0;
          _os_log_error_impl(&dword_19DDAF000, v123, OS_LOG_TYPE_ERROR, "Channel Stats Report - empty stats", (uint8_t *)applier, 2u);
        }
      }

      goto LABEL_246;
    default:
      goto LABEL_248;
  }
}

- (void)handleChannelMessageFlowFinish:(void *)a3 filloutReply:(void *)a4 completionHandler:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    int64_t int64 = xpc_dictionary_get_int64(v7, "command");
    uuid = xpc_dictionary_get_uuid(v7, "flow-uuid");
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
    if (!v12)
    {
      id v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "Finished data message rejected, invalid flow UUID", buf, 2u);
      }

      if (v8) {
        xpc_dictionary_set_int64(v8, "error", 4);
      }
      v9[2](v9);
      goto LABEL_29;
    }
    v13 = [a1[20] objectForKey:v12];
    if (v13)
    {
      if (int64 == 11)
      {
        objc_msgSend(v13, "setInBytes:", xpc_dictionary_get_uint64(v7, "byte-count-inbound"));
        objc_msgSend(v13, "setOutBytes:", xpc_dictionary_get_uint64(v7, "byte-count-outbound"));
      }
      size_t length = 0;
      data = xpc_dictionary_get_data(v7, "crypto-signature", &length);
      if (data && length)
      {
        int64_t v15 = data;
        id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v17 = (void *)[v16 initWithBytes:v15 length:length];
        objc_msgSend(v13, "setCrypto_signature:", v17);
      }
      if (int64 != 11)
      {
        if (int64 == 9) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 2;
        }
        id v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = "in";
          if (int64 == 9) {
            v23 = "out";
          }
          *(_DWORD *)buf = 136315394;
          id v26 = v23;
          __int16 v27 = 2112;
          v28 = v12;
          _os_log_debug_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEBUG, "Received finished %sbound data for %@", buf, 0x16u);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:](a1, v13, v21, v8, -1, v9);
        goto LABEL_28;
      }
      uint64_t v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = (const char *)v12;
        _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "Finished flow for %@", buf, 0xCu);
      }

      -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v13);
    }
    else
    {
      id v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = (const char *)v12;
        _os_log_debug_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEBUG, "Finished data message rejected, no flow found for %@", buf, 0xCu);
      }

      if (v8)
      {
        xpc_dictionary_set_uuid(v8, "flow-uuid", uuid);
        xpc_dictionary_set_int64(v8, "error", 6);
      }
    }
    v9[2](v9);
LABEL_28:

LABEL_29:
  }
}

uint64_t __103__NEFilterDataExtensionProviderContext_handleChannelMessageStatsReport_filloutReply_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x19F3B92C0](v4) == MEMORY[0x1E4F14590])
  {
    uuid = xpc_dictionary_get_uuid(v5, "flow-uuid");
    if (uuid)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        id v9 = *(void **)(v8 + 160);
      }
      else {
        id v9 = 0;
      }
      id v10 = [v9 objectForKey:v7];
      if (v10)
      {
        objc_msgSend(v10, "setInBytes:", xpc_dictionary_get_uint64(v5, "byte-count-inbound"));
        objc_msgSend(v10, "setOutBytes:", xpc_dictionary_get_uint64(v5, "byte-count-outbound"));
        size_t length = 0;
        *(void *)&buf.sa_len = 0;
        *(void *)&buf.sa_data[6] = 0;
        uint64_t v16 = 0;
        int v17 = 0;
        if (xpc_dictionary_get_data(v5, "local-addr", &length) && length <= 0x1C)
        {
          __memcpy_chk();
          -[NEFilterSocketFlow setLocalAddress:](v10, &buf);
        }
        -[NEFilterDataExtensionProviderContext reportFlowStats:](*(void **)(a1 + 32), v10);
      }
      else
      {
        id v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)&buf.sa_len = 138412290;
          *(void *)&buf.sa_data[2] = v7;
          _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, "Channel Stats Report - no flow found for %@", &buf.sa_len, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      id v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)&buf.sa_len = 0;
        _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Channel Stats Report - flow stats with no flow UUID", &buf.sa_len, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }

  return 1;
}

- (void)reportFlowStats:(void *)a1
{
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3) {
      id Property = objc_getProperty(v3, v4, 112, 1);
    }
    else {
      id Property = 0;
    }
    id v7 = Property;
    uint64_t v8 = (void *)[v7 copy];

    if (v8)
    {
      [v8 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v8, 4);
    }
    else
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "No current verdict available, cannot report flow stats", v10, 2u);
      }
    }
  }
}

- (void)reportFlow:(void *)a3 forVerdict:(uint64_t)a4 event:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a1 && v8 && [v8 shouldReport])
  {
    if (v7) {
      v7[12] = 1;
    }
    objc_opt_class();
    BOOL v10 = (objc_opt_isKindOfClass() & 1) == 0
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || [v9 statisticsReportFrequency] == 0;
    uint64_t v11 = [v9 filterAction];
    if (!v10 || v11)
    {
      v13 = -[NEFilterReport initWithFlow:action:event:]([NEFilterReport alloc], v7, v11, a4);
      [a1 report:v13];
      if ((unint64_t)(a4 - 3) <= 1 && ([v9 drop] & 1) == 0)
      {
        id v14 = [a1 _principalObject];
        [v14 handleReport:v13];
      }
    }
    else
    {
      id v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412546;
        uint64_t v16 = v9;
        __int16 v17 = 2048;
        uint64_t v18 = a4;
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Failed to get an action for verdict (%@), cannot generate flow report with type %ld", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)closeChannelFlow:(id *)a1
{
  id v3 = a2;
  -[NEFilterDataExtensionProviderContext reportFlowClosed:](a1, v3);
  if (v3)
  {
    objc_setProperty_atomic(v3, v4, 0, 144);
    id v5 = a1[20];
    id Property = objc_getProperty(v3, v6, 128, 1);
  }
  else
  {
    id v5 = a1[20];
    id Property = 0;
  }
  id v8 = Property;

  [v5 removeObjectForKey:v8];
}

- (void)handleDataCompleteForFlow:(uint64_t)a3 direction:(void *)a4 reply:(int)a5 controlSocket:(void *)a6 completionHandler:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  id v14 = [a1 _principalObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  size_t aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  aBlock[3] = &unk_1E598FAA8;
  uint64_t v34 = a3;
  id v15 = v11;
  id v31 = v15;
  v32 = a1;
  id v33 = v14;
  id v16 = v14;
  __int16 v17 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_135;
  v23[3] = &unk_1E598FA58;
  uint64_t v28 = a3;
  id v18 = v15;
  id v24 = v18;
  id v19 = v12;
  int v29 = a5;
  id v25 = v19;
  id v26 = a1;
  id v20 = v13;
  id v27 = v20;
  uint64_t v21 = _Block_copy(v23);
  id v22 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v17, v21);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v22, v18, a1);
}

id __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 112, 1);
  }
  id v5 = Property;
  SEL v6 = v5;
  if (v3 == 2) {
    uint64_t v7 = [v5 inboundPassOffset];
  }
  else {
    uint64_t v7 = [v5 outboundPassOffset];
  }
  uint64_t v8 = v7;

  id v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (*(void *)(a1 + 56) == 2) {
      v23 = @"Inbound";
    }
    else {
      v23 = @"Outbound";
    }
    id v24 = [*(id *)(a1 + 32) identifier];
    id v26 = [v24 UUIDString];
    id v27 = *(id *)(a1 + 32);
    if (v27) {
      id v27 = objc_getProperty(v27, v25, 112, 1);
    }
    id v28 = v27;
    int v29 = 138413058;
    id v30 = v23;
    __int16 v31 = 2112;
    v32 = v26;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 1024;
    int v36 = [v28 shouldReport];
    _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "%@ handleDataCompleteForFlow - for flow %@ passOffset %llu shouldReport %d", (uint8_t *)&v29, 0x26u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11 == 1)
  {
    [*(id *)(a1 + 32) setOutputComplete:1];
  }
  else if (v11 == 2)
  {
    [*(id *)(a1 + 32) setInputComplete:1];
  }
  id v12 = *(id *)(a1 + 32);
  if (v12) {
    id v12 = objc_getProperty(v12, v10, 112, 1);
  }
  id v13 = v12;
  if ([v13 shouldReport] && objc_msgSend(*(id *)(a1 + 32), "inputComplete"))
  {
    int v14 = [*(id *)(a1 + 32) outputComplete];

    if (!v14) {
      goto LABEL_20;
    }
    __int16 v17 = *(void **)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    if (v17) {
      id v18 = objc_getProperty(*(id *)(a1 + 32), v15, 112, 1);
    }
    else {
      id v18 = 0;
    }
    id v13 = v18;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](v16, v17, v13, 3);
  }

LABEL_20:
  if (v8 == -1)
  {
    uint64_t v21 = +[NEFilterDataVerdict allowVerdict];
  }
  else
  {
    id v19 = *(void **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 56) == 2) {
      [v19 handleInboundDataCompleteForFlow:v20];
    }
    else {
    uint64_t v21 = [v19 handleOutboundDataCompleteForFlow:v20];
    }
  }

  return v21;
}

void __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 64) == 2) {
        uint64_t v11 = @"Inbound";
      }
      else {
        uint64_t v11 = @"Outbound";
      }
      id v12 = [*(id *)(a1 + 32) identifierString];
      int v13 = 138412802;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ data complete verdict for flow %@: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if ([*(id *)(a1 + 32) createDataCompleteReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 72) direction:*(void *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)])-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32)); {
  if (v3)
  }
  {
    SEL v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 112, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)closeFlow:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)a1, v6);
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v6;
      id v4 = v3;
      if (v3)
      {
        uint64_t v5 = v3[25];
        if (v5 == -1)
        {
          -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v3);
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v5 = 0;
      }
      -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:](a1, v3, v5);
LABEL_9:
    }
  }
LABEL_10:
}

- (void)reportFlow:(void *)a3 forVerdict:(void *)a4 absoluteVerdict:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && v10 && v8 && [v7 shouldReport])
  {
    id v9 = (void *)[v8 copy];
    if (([v9 drop] & 1) != 0
      || [v9 inboundPassOffset] == -1 && objc_msgSend(v9, "outboundPassOffset") == -1)
    {
      [v9 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v10, v9, 2);
    }
  }
}

- (void)closeBrowserFilterFlow:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v5 = v3;
    if (v3)
    {
      objc_setProperty_atomic(v3, v4, 0, 144);
      id v6 = *(id *)(a1 + 144);
      id Property = objc_getProperty(v5, v7, 128, 1);
    }
    else
    {
      id v6 = *(id *)(a1 + 144);
      id Property = 0;
    }
    id v9 = Property;

    [v6 removeObjectForKey:v9];
  }
}

- (void)closeSocketFlow:(uint64_t)a3 socketID:
{
  -[NEFilterDataExtensionProviderContext reportFlowClosed:](a1, a2);
  uint64_t v5 = (void *)a1[19];
  id v6 = NSNumber;
  id v7 = v5;
  id v8 = [v6 numberWithUnsignedLongLong:a3];
  [v7 removeObjectForKey:v8];
}

- (void)reportFlowClosed:(void *)a1
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (v3 && (v3[12] & 1) != 0)
  {
    id v6 = objc_getProperty(v3, v4, 112, 1);
    id v7 = (void *)[v6 copy];

    if (v7)
    {
      [v7 setShouldReport:1];
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v7, 3);
    }
    else
    {
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "No current verdict available, cannot report flow closed", v9, 2u);
      }
    }
  }
}

- (void)handleData:(uint64_t)a3 offset:(void *)a4 forFlow:(uint64_t)a5 direction:(void *)a6 reply:(int)a7 controlSocket:(void *)a8 completionHandler:
{
  id v14 = a2;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = [a1 queue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  v24[3] = &unk_1E598FA80;
  v24[4] = a1;
  uint64_t v29 = a3;
  id v19 = v14;
  id v25 = v19;
  id v20 = v15;
  id v26 = v20;
  uint64_t v30 = a5;
  id v21 = v16;
  id v27 = v21;
  int v31 = a7;
  id v22 = v17;
  id v28 = v22;
  -[NEFilterFlow updateSourceAppInfoWithQueue:completionHandler:](v20, v18, v24);
}

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _principalObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  size_t aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E598FA30;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v23 = *(void *)(a1 + 72);
  void aBlock[4] = v3;
  id v20 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 80);
  id v21 = v5;
  id v22 = v2;
  id v6 = v2;
  id v7 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3;
  v12[3] = &unk_1E598FA58;
  uint64_t v17 = *(void *)(a1 + 80);
  id v13 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  int v18 = *(_DWORD *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 64);
  id v10 = _Block_copy(v12);
  uint64_t v11 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v7, v10);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v11, *(void **)(a1 + 48), *(void **)(a1 + 32));
}

id __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  unint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 40);
  id v7 = v3;
  uint64_t v9 = v7;
  if (!v2) {
    goto LABEL_14;
  }
  if (v7) {
    id Property = objc_getProperty(v7, v8, 112, 1);
  }
  else {
    id Property = 0;
  }
  id v11 = Property;
  id v12 = v11;
  if (v4 == 2) {
    uint64_t v13 = [v11 inboundPassOffset];
  }
  else {
    uint64_t v13 = [v11 outboundPassOffset];
  }
  unint64_t v14 = v13;

  unint64_t v15 = v14 - v5;
  if (v14 <= v5)
  {
    id v17 = v6;
LABEL_15:
    unint64_t v14 = v5;
    goto LABEL_20;
  }
  if (v14 == -1)
  {
LABEL_14:
    id v17 = 0;
    goto LABEL_15;
  }
  id v16 = v9;
  if ([v16 socketProtocol] != 17 && objc_msgSend(v16, "socketProtocol") != 6)
  {
    unint64_t v18 = v15 + 4;
    if (v15 + 4 < [v6 length])
    {
      id v19 = objc_alloc(MEMORY[0x1E4F1CA58]);
      id v20 = objc_msgSend(v6, "subdataWithRange:", 0, 4);
      id v17 = (id)[v19 initWithData:v20];

      id v21 = objc_msgSend(v6, "subdataWithRange:", v18, objc_msgSend(v6, "length") - v18);
      [v17 appendData:v21];

      goto LABEL_19;
    }
LABEL_18:
    id v17 = 0;
    goto LABEL_19;
  }
  if (v15 >= [v6 length]) {
    goto LABEL_18;
  }
  objc_msgSend(v6, "subdataWithRange:", v14 - v5, objc_msgSend(v6, "length") - v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  if (v17)
  {
    uint64_t v23 = *(void *)(a1 + 48);
    id v22 = *(void **)(a1 + 56);
    if (*(void *)(a1 + 72) == 2) {
      [v22 handleInboundDataFromFlow:v23 readBytesStartOffset:v14 readBytes:v17];
    }
    else {
    uint64_t v24 = [v22 handleOutboundDataFromFlow:v23 readBytesStartOffset:v14 readBytes:v17];
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    uint64_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(a1 + 64) == 2) {
        id v11 = @"Inbound";
      }
      else {
        id v11 = @"Outbound";
      }
      id v12 = [*(id *)(a1 + 32) identifierString];
      int v13 = 138412802;
      unint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ data verdict for flow %@: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if ([*(id *)(a1 + 32) createDataReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 72) direction:*(void *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)])-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32)); {
  if (v3)
  }
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 112, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)handleNewFlow:(void *)a3 reply:(int)a4 controlSocket:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = [a1 queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke;
  v16[3] = &unk_1E5990ED8;
  v16[4] = a1;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  int v20 = a4;
  id v15 = v11;
  id v19 = v15;
  -[NEFilterFlow updateSourceAppInfoWithQueue:completionHandler:](v13, v12, v16);
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2;
  block[3] = &unk_1E5990ED8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (nelog_is_debug_logging_enabled())
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)sockaddr buf = 138412290;
      uint64_t v21 = v10;
      _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "Handling new flow: %@", buf, 0xCu);
    }
  }
  id v3 = [*(id *)(a1 + 40) _principalObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  size_t aBlock[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_127;
  aBlock[3] = &unk_1E598F9E0;
  id v18 = v3;
  id v19 = *(id *)(a1 + 32);
  id v4 = v3;
  unint64_t v5 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_128;
  v11[3] = &unk_1E598FA08;
  id v12 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  int v16 = *(_DWORD *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v8 = _Block_copy(v11);
  id v9 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v5, v8);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v9, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_127(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewFlow:*(void *)(a1 + 40)];
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_128(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
      uint64_t v7 = [v6 UUIDString];
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "New flow verdict for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  if ([*(id *)(a1 + 32) createNewFlowReply:*(void *)(a1 + 40) controlSocket:*(unsigned int *)(a1 + 64) verdict:v3 context:*(void *)(a1 + 48)])-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32)); {
  if (v3)
  }
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](*(void **)(a1 + 48), *(void **)(a1 + 32), v3, 1);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemediationForFlow:*(void *)(a1 + 40)];
}

void __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 32) identifierString];
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "Remediation verdict for %@: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](*(void **)(a1 + 40), *(void **)(a1 + 32), v3, 1);
  if (v3 && ![v3 drop]) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), "verdict-pass", 0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "verdict-drop", 1);
  }
  -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)socketExceptions
{
  uint64_t v2 = *(void **)(a1 + 168);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v3;

    uint64_t v2 = *(void **)(a1 + 168);
  }

  return v2;
}

- (void)updateFlow:(id)a3 withVerdict:(id)a4 forDirection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    id v15 = @"Verdict argument must be a NEFilterDataVerdict";
    goto LABEL_10;
  }
  if (!v9)
  {
    if (([0 needRules] & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  if (v9[11] & 1) != 0 || ([v9 needRules] & 1) != 0 || (v9[13])
  {
LABEL_9:
    id v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    id v15 = @"Verdict argument must be a \"allow\", \"drop\", or \"data\" verdict";
LABEL_10:
    id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
LABEL_6:
  uint64_t v10 = [(NEFilterExtensionProviderContext *)self queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke;
  v17[3] = &unk_1E598F9B8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  int64_t v20 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v17);
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  if (!v2)
  {
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v10 = [*(id *)(a1 + 40) identifierString];
    *(_DWORD *)sockaddr buf = 138412290;
    int64_t v20 = v10;
    id v11 = "Cannot update the verdict for flow %@ which does not exist";
LABEL_8:
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v10 = [v2 identifierString];
    *(_DWORD *)sockaddr buf = 138412290;
    int64_t v20 = v10;
    id v11 = "Cannot update the verdict for flow %@ which is not a socket flow";
    goto LABEL_8;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  size_t aBlock[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_119;
  aBlock[3] = &unk_1E598F968;
  id v18 = *(id *)(a1 + 48);
  uint64_t v3 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2;
  v12[3] = &unk_1E598F990;
  id v4 = v2;
  id v13 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v14 = v5;
  uint64_t v15 = v6;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v7 = _Block_copy(v12);
  id v8 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v3, v7);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v8, v4, *(void **)(a1 + 32));

  id v9 = v18;
LABEL_9:
}

- (id)findFlowWithFlow:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = v4;
    if (v4 && v4[25] == -1)
    {
      id v8 = *(id *)(a1 + 160);
      id v10 = objc_getProperty(v5, v15, 128, 1);
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 152);
      uint64_t v7 = NSNumber;
      id v8 = v6;
      if (v5) {
        uint64_t v9 = v5[25];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = [v7 numberWithUnsignedLongLong:v9];
    }
    id v12 = v10;
    id v14 = [v8 objectForKeyedSubscript:v10];

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    id v14 = 0;
    goto LABEL_16;
  }
  id v12 = *(id *)(a1 + 144);
  if (v3) {
    id Property = objc_getProperty(v3, v11, 128, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v14 = [v12 objectForKeyedSubscript:v5];
LABEL_15:

LABEL_16:

  return v14;
}

id __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_119(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [*(id *)(a1 + 32) identifierString];
      uint64_t v29 = *(void *)(a1 + 40);
      int v30 = 138412546;
      int v31 = v28;
      __int16 v32 = 2112;
      uint64_t v33 = v29;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "Provider set data verdict for flow %@: %@", (uint8_t *)&v30, 0x16u);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (!v5 || v5[25] != -1)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6 && (uint64_t v7 = *(NSObject **)(v6 + 176)) != 0)
    {
      uintptr_t handle = dispatch_source_get_handle(v7);
      if ((handle & 0x80000000) == 0)
      {
        xpc_object_t v10 = 0;
        goto LABEL_12;
      }
      uint64_t v23 = ne_log_obj();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        xpc_object_t v10 = 0;
        goto LABEL_34;
      }
      uint64_t v24 = [*(id *)(a1 + 32) identifierString];
      int v30 = 138412290;
      int v31 = v24;
      id v25 = "Failed to find control socket to update verdict for flow %@";
    }
    else
    {
      uint64_t v23 = ne_log_obj();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      uint64_t v24 = [*(id *)(a1 + 32) identifierString];
      int v30 = 138412290;
      int v31 = v24;
      id v25 = "Failed to find control socket source to update verdict for flow %@";
    }
    _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v30, 0xCu);

    goto LABEL_33;
  }
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  id v5 = *(void **)(a1 + 32);
  uintptr_t handle = 0xFFFFFFFFLL;
LABEL_12:
  if (v5) {
    id Property = objc_getProperty(v5, v8, 112, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;

  if (!v12)
  {
    uint64_t v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v26 = [*(id *)(a1 + 32) identifierString];
      int v30 = 138412290;
      int v31 = v26;
      id v27 = "Cannot update the verdict for flow %@ because a NEFilterNewFlowVerdict has not yet been provided for this flow";
LABEL_38:
      _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v30, 0xCu);
    }
LABEL_34:

    goto LABEL_35;
  }
  int v14 = [*(id *)(a1 + 32) createDataReply:v10 controlSocket:handle direction:*(void *)(a1 + 56) verdict:v3 context:*(void *)(a1 + 48)];
  if (!v10) {
    goto LABEL_22;
  }
  id v15 = *(id *)(a1 + 32);
  if (v15) {
    id v15 = objc_getProperty(v15, v13, 144, 1);
  }
  id v16 = v15;

  if (!v16)
  {
    uint64_t v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v26 = [*(id *)(a1 + 32) identifierString];
      int v30 = 138412290;
      int v31 = v26;
      id v27 = "Flow %@ does not have a connection to update its verdict";
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  id v18 = *(id *)(a1 + 32);
  if (v18) {
    id v18 = objc_getProperty(v18, v17, 144, 1);
  }
  id v19 = (_xpc_connection_s *)v18;
  xpc_connection_send_message(v19, v10);

LABEL_22:
  if (v14) {
    -[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  }
  if (v3)
  {
    int64_t v20 = *(void **)(a1 + 48);
    uint64_t v21 = *(void **)(a1 + 32);
    if (v21) {
      id v22 = objc_getProperty(v21, v13, 112, 1);
    }
    else {
      id v22 = 0;
    }
    uint64_t v23 = v22;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v20, v21, v3, v23);
    goto LABEL_34;
  }
LABEL_35:
}

- (void)resumeFlow:(id)a3 withVerdict:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      id v13 = @"Verdict argument must be a NEFilterDataVerdict or a NEFilterNewFlowVerdict";
LABEL_8:
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];
      objc_exception_throw(v14);
    }
  }
  if (v7 && (v7[13] & 1) != 0)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    id v13 = @"Verdict argument cannot be a pause verdict";
    goto LABEL_8;
  }
  id v8 = [(NEFilterExtensionProviderContext *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke;
  block[3] = &unk_1E59929B0;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  uint64_t v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  id v4 = v2;
  if (!v2)
  {
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [*(id *)(a1 + 40) identifierString];
      int v25 = 138412290;
      id v26 = v21;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring resume command for flow %@ which does not exist", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_15;
  }
  if (v2[11])
  {
    id v5 = objc_getProperty(v2, v3, 136, 1);
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v4[11] = 0;
      id v8 = objc_getProperty(v4, v7, 136, 1);
      uint64_t v9 = [v8 firstObject];

      id v11 = objc_getProperty(v4, v10, 136, 1);
      [v11 removeObjectAtIndex:0];

      -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:]((uint64_t)v9, v4, *(void **)(a1 + 48), *(void **)(a1 + 32));
      while ((v4[11] & 1) == 0)
      {
        id v13 = objc_getProperty(v4, v12, 136, 1);
        uint64_t v14 = [v13 count];

        if (!v14) {
          break;
        }
        id v15 = objc_getProperty(v4, v12, 136, 1);
        uint64_t v16 = [v15 firstObject];

        id v18 = objc_getProperty(v4, v17, 136, 1);
        [v18 removeObjectAtIndex:0];

        -[NEFilterDataSavedMessageHandler executeWithFlow:context:](v16, v4, *(void **)(a1 + 32));
        uint64_t v9 = v16;
      }
      id v22 = objc_getProperty(v4, v12, 136, 1);
      uint64_t v23 = [v22 count];

      if (!v23) {
        objc_setProperty_atomic(v4, v24, 0, 136);
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  id v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v20 = [v4 identifierString];
    int v25 = 138412290;
    id v26 = v20;
    _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring resume command for flow %@ which is not paused", (uint8_t *)&v25, 0xCu);
  }
LABEL_16:
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NEExtensionProviderContext *)self hostContext];
  [v9 applySettings:v7 completionHandler:v6];
}

- (void)sendSocketContentFilterRequest
{
  id v2 = [(NEExtensionProviderContext *)self hostContext];
  [v2 sendSocketContentFilterRequest];
}

- (void)sendBrowserContentFilterServerRequest
{
  id v2 = [(NEExtensionProviderContext *)self hostContext];
  [v2 sendBrowserContentFilterServerRequest];
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  id v5 = [(NEFilterExtensionProviderContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke;
  v7[3] = &unk_1E5992328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke(uint64_t a1)
{
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  id v5 = [(NEFilterExtensionProviderContext *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke;
  v7[3] = &unk_1E5992328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke(uint64_t a1)
{
}

- (void)handleRulesChanged
{
  id v2 = [(NEExtensionProviderContext *)self _principalObject];
  [v2 handleRulesChanged];
}

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSXPCListenerEndpoint *))a3;
  if (!self || !self->_clientListener)
  {
    id v5 = [(NEFilterExtensionProviderContext *)self queue];
    xpc_connection_t v6 = xpc_connection_create(0, v5);
    xpc_connection_t v7 = v6;
    if (self)
    {
      objc_storeStrong((id *)&self->_clientListener, v6);

      clientListener = self->_clientListener;
    }
    else
    {

      clientListener = 0;
    }
    xpc_endpoint_t v9 = xpc_endpoint_create(clientListener);
    id v10 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    id v11 = v10;
    if (self)
    {
      objc_storeStrong((id *)&self->_listenerEndpoint, v10);

      [(NSXPCListenerEndpoint *)self->_listenerEndpoint _setEndpoint:v9];
      uint64_t v12 = self->_clientListener;
    }
    else
    {

      [0 _setEndpoint:v9];
      uint64_t v12 = 0;
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5993170;
    handler[4] = self;
    xpc_connection_set_event_handler(v12, handler);
    if (!self)
    {
      xpc_connection_resume(0);

      listenerEndpoint = 0;
      goto LABEL_10;
    }
    xpc_connection_resume(self->_clientListener);
  }
  listenerEndpoint = self->_listenerEndpoint;
LABEL_10:
  v4[2](v4, listenerEndpoint);
}

void __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = MEMORY[0x19F3B92C0]() == MEMORY[0x1E4F14578];
    id v3 = v9;
    if (v4)
    {
      id v5 = *(id **)(a1 + 32);
      xpc_connection_t v6 = (_xpc_connection_s *)v9;
      if (v5)
      {
        if (([v5[23] containsObject:v6] & 1) == 0) {
          [v5[23] addObject:v6];
        }
        xpc_connection_t v7 = [v5 queue];
        xpc_connection_set_target_queue(v6, v7);

        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke;
        handler[3] = &unk_1E5991128;
        handler[4] = v5;
        id v8 = v6;
        id v11 = v8;
        xpc_connection_set_event_handler(v8, handler);
        xpc_connection_resume(v8);
      }
      id v3 = v9;
    }
  }
}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2;
    v29[3] = &unk_1E5992328;
    id v30 = reply;
    id v28 = *(void **)(a1 + 32);
    id v31 = *(id *)(a1 + 40);
    xpc_connection_t v6 = reply;
    [v28 handleClientMessage:v4 filloutReply:v6 completionHandler:v29];
  }
  else
  {
    id v5 = *(id **)(a1 + 32);
    xpc_connection_t v6 = (_xpc_connection_s *)*(id *)(a1 + 40);
    if (v5)
    {
      [v5[18] allValues];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v37;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v7);
            }
            id v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
            if (v13) {
              id Property = objc_getProperty(*(id *)(*((void *)&v36 + 1) + 8 * v12), v9, 144, 1);
            }
            else {
              id Property = 0;
            }
            id v15 = (_xpc_connection_s *)Property;

            if (v15 == v6) {
              -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)v5, v13);
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v16 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
          uint64_t v10 = v16;
        }
        while (v16);
      }

      [v5[20] allValues];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v18)
      {
        uint64_t v20 = v18;
        uint64_t v21 = *(void *)v33;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
            if (v23) {
              id v24 = objc_getProperty(*(id *)(*((void *)&v32 + 1) + 8 * v22), v19, 144, 1);
            }
            else {
              id v24 = 0;
            }
            int v25 = (_xpc_connection_s *)v24;

            if (v25 == v6) {
              -[NEFilterDataExtensionProviderContext closeChannelFlow:](v5, v23);
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v26 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
          uint64_t v20 = v26;
        }
        while (v26);
      }

      if ([v5[23] containsObject:v6]) {
        [v5[23] removeObject:v6];
      }
      xpc_connection_cancel(v6);
    }
  }
}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v1);
  }
}

- (void)providerControlSocketFileHandle:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = dup([a3 fileDescriptor]);
  if (self)
  {
    unsigned int v5 = v4;
    if (v4 < 0)
    {
      id v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v5;
        _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Invalid controlSocket value: %d", (uint8_t *)handler, 8u);
      }
    }
    else
    {
      xpc_connection_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      socketFlows = self->_socketFlows;
      self->_socketFlows = v6;

      uint64_t v8 = [(NEFilterExtensionProviderContext *)self queue];
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14478], v5, 0, v8);

      if (!v9) {
        return;
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke;
      handler[3] = &unk_1E5992328;
      uint64_t v10 = v9;
      uint64_t v18 = v10;
      id v19 = self;
      dispatch_source_set_cancel_handler(v10, handler);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_124;
      v14[3] = &unk_1E5992328;
      uint64_t v11 = v10;
      id v15 = v11;
      uint64_t v16 = self;
      dispatch_source_set_event_handler(v11, v14);
      dispatch_resume(v11);
      source = self->_source;
      self->_source = (OS_dispatch_source *)v11;
      id v13 = v11;
    }
  }
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "socket source cancel handler called", v5, 2u);
  }

  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  close(handle);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    objc_storeStrong((id *)(v4 + 176), 0);
  }
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_124(uint64_t a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3) {
    return;
  }
  int v4 = handle;
  socklen_t v99 = 4;
  int v100 = 0;
  if (getsockopt(handle, 0xFFFF, 4128, &v100, &v99))
  {
    unsigned int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      long long v32 = __error();
      long long v33 = strerror(*v32);
      *(_DWORD *)v108 = 136315138;
      v109 = v33;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Could not get packet size. Received error: %s", v108, 0xCu);
    }
LABEL_5:

    return;
  }
  int v6 = v100;
  if (v100 >= 2049)
  {
    if (v100 >= 102400) {
      size_t v8 = 102400;
    }
    else {
      size_t v8 = v100;
    }
    dispatch_source_t v9 = (uint8_t *)malloc_type_malloc(v8, 0xB4709E02uLL);
    if (!v9)
    {
      id v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)sockaddr buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v8;
        _os_log_error_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_ERROR, "Failed to alloc large receive buffer of size %d", buf, 8u);
      }

      return;
    }
    id v7 = v9;
    int v10 = v100;
    if (v100 > 102400)
    {
      while (1)
      {
        if (v10 >= 102400) {
          size_t v11 = 102400;
        }
        else {
          size_t v11 = v10;
        }
        ssize_t v12 = recv(v4, v7, v11, 0);
        if (!v12)
        {
          long long v34 = ne_log_obj();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          *(_WORD *)sockaddr buf = 0;
          long long v35 = "data purge: no data to read";
          long long v36 = v34;
          uint32_t v37 = 2;
          goto LABEL_101;
        }
        if (v12 == -1) {
          break;
        }
        BOOL v13 = v12 < v10;
        v10 -= v12;
        BOOL v13 = !v13 || v10 <= 0;
        if (v13) {
          goto LABEL_49;
        }
      }
      long long v34 = ne_log_obj();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      v69 = __error();
      v70 = strerror(*v69);
      *(_DWORD *)sockaddr buf = 136315138;
      *(void *)&uint8_t buf[4] = v70;
      long long v35 = "data purge: recv() failed: %s";
      long long v36 = v34;
      uint32_t v37 = 12;
LABEL_101:
      _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
LABEL_48:

LABEL_49:
      long long v38 = ne_log_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)sockaddr buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v100;
        _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, "Received data too large, %d bytes from kernel content filter", buf, 8u);
      }

      goto LABEL_52;
    }
  }
  else
  {
    id v7 = v108;
    LODWORD(v8) = 2048;
  }
  ssize_t v14 = recv(v4, v7, v8, 0);
  if (v14 == -1)
  {
    id v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    uint64_t v18 = __error();
    id v19 = strerror(*v18);
    *(_DWORD *)sockaddr buf = 136315138;
    *(void *)&uint8_t buf[4] = v19;
    id v17 = "recv() failed: %s";
    uint64_t v20 = v15;
    uint32_t v21 = 12;
    goto LABEL_42;
  }
  if (*(_DWORD *)v7 <= 0x17u)
  {
    id v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    int v16 = *(_DWORD *)v7;
    *(_DWORD *)sockaddr buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v16;
    id v17 = "Received message of invalid length %d from kernel content filter";
    goto LABEL_41;
  }
  if (*((_DWORD *)v7 + 2) == 1)
  {
    uint64_t v22 = v14;
    uint64_t v23 = *((void *)v7 + 2);
    id v24 = NSNumber;
    id v25 = *(id *)(v3 + 152);
    uint64_t v26 = [v24 numberWithUnsignedLongLong:v23];
    unsigned int v5 = [v25 objectForKey:v26];

    uint64_t v27 = -[NEFilterDataExtensionProviderContext socketExceptions](v3);
    id v28 = [NSNumber numberWithUnsignedLongLong:v23];
    int v29 = [v27 containsObject:v28];

    if (v29)
    {
      +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, v4, 0, v23, -1, 0, -1, 0, 0);
      -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((void *)v3, v5, v23);
LABEL_34:
      if (v6 >= 2049) {
        free(v7);
      }
    }
    else
    {
      int v39 = *((_DWORD *)v7 + 3);
      switch(v39)
      {
        case 1:
          -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((void *)v3, v5, v23);
          v43 = -[NEFilterSocketFlow initWithSocketFamily:socketType:socketProtocol:pid:epid:uuid:euuid:socketID:]([NEFilterSocketFlow alloc], *((_DWORD *)v7 + 6), *((_DWORD *)v7 + 7), *((_DWORD *)v7 + 8), *((unsigned int *)v7 + 10), *((unsigned int *)v7 + 11), (uint64_t)(v7 + 52), (uint64_t)(v7 + 68), v23);
          [v43 setRpid:*((unsigned int *)v7 + 12)];
          int64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v7 + 84];
          [v43 setRuuid:v44];

          if (v43)
          {
            if (*((_DWORD *)v7 + 39) == 1)
            {
              [v43 setDirection:2];
              -[NEFilterSocketFlow setLocalAddress:](v43, (sockaddr *)(v7 + 100));
              v45 = (sockaddr *)(v7 + 128);
            }
            else
            {
              [v43 setDirection:1];
              -[NEFilterSocketFlow setLocalAddress:](v43, (sockaddr *)v7 + 8);
              v45 = (sockaddr *)(v7 + 100);
            }
            -[NEFilterSocketFlow setRemoteAddress:](v43, v45);
            v71 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 160 length:32];
            [v43 setSourceAppAuditToken:v71];

            BOOL v72 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 192 length:32];
            [v43 setSourceProcessAuditToken:v72];

            if (v7[260])
            {
              v73 = (void *)[[NSString alloc] initWithCString:v7 + 260 encoding:4];
              [v43 setRemoteHostname:v73];
            }
            if (*((_DWORD *)v7 + 64))
            {
              v74 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 224 length:*((unsigned int *)v7 + 64)];
              objc_msgSend(v43, "setCrypto_signature:", v74);
            }
            v75 = NSNumber;
            id v76 = *(id *)(v3 + 152);
            v77 = [v75 numberWithUnsignedLongLong:v23];
            [v76 setObject:v43 forKey:v77];

            -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:]((void *)v3, v43, 0, v4, 0);
          }

          break;
        case 2:
          if (!v5)
          {
            v48 = ne_log_obj();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_106;
            }
            *(_DWORD *)sockaddr buf = 134217984;
            *(void *)&uint8_t buf[4] = v23;
            v49 = "Closed message rejected, no flow found for sockid %llu";
            goto LABEL_104;
          }
          [v5 setInBytes:*((void *)v7 + 10)];
          [v5 setOutBytes:*((void *)v7 + 11)];
          -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)v7 + 6);
          if (*((_DWORD *)v7 + 39))
          {
            v46 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 124 length:*((unsigned int *)v7 + 39)];
            [v5 setCrypto_signature:v46];
          }
          -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((void *)v3, v5, v23);
          break;
        case 3:
        case 4:
          if (!v5)
          {
            v48 = ne_log_obj();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_106;
            }
            *(_DWORD *)sockaddr buf = 134217984;
            *(void *)&uint8_t buf[4] = v23;
            v49 = "Data message rejected, no flow found for sockid %llu";
LABEL_104:
            v51 = v48;
            uint32_t v52 = 12;
            goto LABEL_105;
          }
          if (v39 == 3)
          {
            -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)(v7 + 24));
            v40 = (sockaddr *)(v7 + 52);
          }
          else
          {
            -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)(v7 + 52));
            v40 = (sockaddr *)(v7 + 24);
          }
          -[NEFilterSocketFlow setRemoteAddress:](v5, v40);
          if (*((_DWORD *)v7 + 32))
          {
            v53 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 96 length:*((unsigned int *)v7 + 32)];
            [v5 setCrypto_signature:v53];
          }
          unint64_t v55 = *((void *)v7 + 10);
          unint64_t v54 = *((void *)v7 + 11);
          uint64_t v56 = v54 - v55;
          if (v54 <= v55)
          {
            v60 = ne_log_obj();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              if (*((_DWORD *)v7 + 3) == 3) {
                v96 = "OUT";
              }
              else {
                v96 = "IN";
              }
              *(_DWORD *)sockaddr buf = 136315138;
              *(void *)&uint8_t buf[4] = v96;
              _os_log_error_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_ERROR, "Received invalid DATA %s message", buf, 0xCu);
            }

            goto LABEL_34;
          }
          v57 = v7 + 176;
          if ([v5 socketProtocol] != 17
            && [v5 socketProtocol] != 6)
          {
            *((_DWORD *)v7 + 43) = *((_DWORD *)v7 + 33) & 1;
            v57 = v7 + 172;
            v56 += 4;
          }
          id v58 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          if (v6 >= 2049)
          {
            *(void *)sockaddr buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __74__NEFilterDataExtensionProviderContext_handleSocketSourceEventWithSocket___block_invoke;
            id v106 = &__block_descriptor_40_e12_v24__0_v8Q16l;
            v107 = v7;
            uint64_t v59 = [v58 initWithBytesNoCopy:v57 length:v56 deallocator:buf];
          }
          else
          {
            uint64_t v59 = [v58 initWithBytes:v57 length:v56];
          }
          v78 = (void *)v59;
          if (*((_DWORD *)v7 + 3) == 3) {
            uint64_t v79 = 1;
          }
          else {
            uint64_t v79 = 2;
          }
          uint64_t v80 = *((void *)v7 + 10);
          if ([v5 epid] != *((_DWORD *)v7 + 34))
          {
            -[NSObject setEpid:](v5, "setEpid:");
            [v5 setPid:*((unsigned int *)v7 + 34)];
            id v81 = +[NEProcessInfo copyUUIDsForPID:[v5 epid]];
            unsigned __int16 v82 = v81;
            if (v81 && [v81 count])
            {
              uint64_t v83 = [v82 firstObject];
              [v5 setUuid:v83];
              [v5 setEuuid:v83];
            }
            [v5 pid];
            uint64_t v84 = (void *)NECopySigningIdentifierForPIDwithAuditToken();
            if (v84)
            {
              [v5 setSourceAppIdentifier:v84];
              v85 = ne_log_obj();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
                v98 = [v5 sourceAppIdentifier];
                int v97 = [v5 pid];
                *(_DWORD *)SEL v101 = 138412546;
                v102 = v98;
                __int16 v103 = 1024;
                int v104 = v97;
                _os_log_debug_impl(&dword_19DDAF000, v85, OS_LOG_TYPE_DEBUG, "Updating bundleID %@ for pid %d", v101, 0x12u);
              }
            }
            v86 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 + 140 length:32];
            [v5 setSourceAppAuditToken:v86];
          }
          -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:]((void *)v3, v78, v80, v5, v79, 0, v4, 0);

          break;
        case 5:
        case 6:
          if (!v5)
          {
            v48 = ne_log_obj();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              v50 = "Inbound";
              if (v39 == 5) {
                v50 = "Outbound";
              }
              *(_DWORD *)sockaddr buf = 136315394;
              *(void *)&uint8_t buf[4] = v50;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v23;
              v49 = "%s disconnect message rejected, no flow found for sockid %llu";
              v51 = v48;
              uint32_t v52 = 22;
LABEL_105:
              _os_log_debug_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_DEBUG, v49, buf, v52);
            }
            goto LABEL_106;
          }
          if (v39 == 5) {
            uint64_t v41 = 1;
          }
          else {
            uint64_t v41 = 2;
          }
          -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:]((void *)v3, v5, v41, 0, v4, 0);
          break;
        case 7:
          v47 = ne_log_obj();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)sockaddr buf = 134217984;
            *(void *)&uint8_t buf[4] = v22;
            _os_log_debug_impl(&dword_19DDAF000, v47, OS_LOG_TYPE_DEBUG, "Socket Stats Report - Received stats report size %zd", buf, 0xCu);
          }

          if (v22 > 31)
          {
            uint64_t v61 = *((unsigned int *)v7 + 6);
            v62 = ne_log_obj();
            v63 = v62;
            if (v61)
            {
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)sockaddr buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v61;
                _os_log_debug_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_DEBUG, "Socket Stats Report - Received stats report for %d flows", buf, 8u);
              }

              unsigned int v64 = 56 * v61 + 32;
              if (v64 > v22 || *(_DWORD *)v7 < v64)
              {
                uint64_t v42 = ne_log_obj();
                if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_63;
                }
                int v65 = *(_DWORD *)v7;
                *(_DWORD *)sockaddr buf = 134218496;
                *(void *)&uint8_t buf[4] = v22;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v65;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = 56 * v61 + 32;
                v66 = "Socket Stats Report - Received wrong msg size in stats report: bytesRead %zd msg_len %d - expected size %d";
                v67 = v42;
                uint32_t v68 = 24;
                goto LABEL_147;
              }
              if ((int)v61 >= 1)
              {
                int v87 = (sockaddr *)(v7 + 56);
                do
                {
                  uint64_t v88 = *(void *)&v87[-2].sa_data[6];
                  if (v88)
                  {
                    int v89 = NSNumber;
                    id v90 = *(id *)(v3 + 152);
                    v91 = [v89 numberWithUnsignedLongLong:v88];
                    v92 = [v90 objectForKey:v91];

                    if (v92)
                    {
                      [v92 setInBytes:*(void *)&v87[-1].sa_len];
                      [v92 setOutBytes:*(void *)&v87[-1].sa_data[6]];
                      -[NEFilterSocketFlow setLocalAddress:](v92, v87);
                      if (nelog_is_debug_logging_enabled())
                      {
                        v93 = ne_log_obj();
                        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)sockaddr buf = 138412290;
                          *(void *)&uint8_t buf[4] = v92;
                          _os_log_debug_impl(&dword_19DDAF000, v93, OS_LOG_TYPE_DEBUG, "Socket Stats Report - flow stats updated for %@", buf, 0xCu);
                        }
                      }
                      -[NEFilterDataExtensionProviderContext reportFlowStats:]((void *)v3, v92);
                    }
                    else
                    {
                      id v94 = ne_log_obj();
                      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)sockaddr buf = 134217984;
                        *(void *)&uint8_t buf[4] = v88;
                        _os_log_debug_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_DEBUG, "Socket Stats Report - No flow found for sockID %llu", buf, 0xCu);
                      }
                    }
                  }
                  int v87 = (sockaddr *)((char *)v87 + 56);
                  --v61;
                }
                while (v61);
              }
            }
            else
            {
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)sockaddr buf = 0;
                _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "Socket Stats Report - Received 0 flow stats in stats report", buf, 2u);
              }
            }
          }
          else
          {
            v48 = ne_log_obj();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)sockaddr buf = 134217984;
              *(void *)&uint8_t buf[4] = v22;
              _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "Socket Stats Report - Received msg size is too small (%zd) for stats report", buf, 0xCu);
            }
LABEL_106:
          }
          break;
        default:
          uint64_t v42 = ne_log_obj();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            int v95 = *((_DWORD *)v7 + 3);
            *(_DWORD *)sockaddr buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v95;
            v66 = "Received unexpected message operation %d from kernel content filter";
            v67 = v42;
            uint32_t v68 = 8;
LABEL_147:
            _os_log_error_impl(&dword_19DDAF000, v67, OS_LOG_TYPE_ERROR, v66, buf, v68);
          }
LABEL_63:

          break;
      }
    }
    goto LABEL_5;
  }
  id v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v31 = *((_DWORD *)v7 + 2);
    *(_DWORD *)sockaddr buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v31;
    id v17 = "Received unexpected message of type %d from kernel content filter";
LABEL_41:
    uint64_t v20 = v15;
    uint32_t v21 = 8;
LABEL_42:
    _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, v17, buf, v21);
  }
LABEL_43:

  if (v6 >= 2049) {
LABEL_52:
  }
    free(v7);
}

void __74__NEFilterDataExtensionProviderContext_handleSocketSourceEventWithSocket___block_invoke(uint64_t a1)
{
}

- (void)stopWithReason:(int)a3
{
  unsigned int v5 = [(NEFilterExtensionProviderContext *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke;
  v6[3] = &unk_1E5990A58;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 144);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 allValues];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v45;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        if (v10) {
          objc_setProperty_atomic(v10, v6, 0, 144);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    ssize_t v12 = *(void **)(v11 + 144);
  }
  else {
    ssize_t v12 = 0;
  }
  [v12 removeAllObjects];
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    ssize_t v14 = *(void **)(v13 + 160);
  }
  else {
    ssize_t v14 = 0;
  }
  [v14 allValues];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v41;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v15);
        }
        uint32_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
        if (v21) {
          objc_setProperty_atomic(v21, v17, 0, 144);
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v18);
  }

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    uint64_t v23 = *(void **)(v22 + 160);
  }
  else {
    uint64_t v23 = 0;
  }
  [v23 removeAllObjects];
  uint64_t v24 = *(void *)(a1 + 32);
  if (v24) {
    id v25 = *(void **)(v24 + 152);
  }
  else {
    id v25 = 0;
  }
  [v25 removeAllObjects];
  uint64_t v26 = *(void *)(a1 + 32);
  if (v26)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v27 = *(id *)(v26 + 184);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v49;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(v27);
          }
          xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v48 + 1) + 8 * v31++));
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v29);
    }

    [*(id *)(v26 + 184) removeAllObjects];
    long long v32 = *(_xpc_connection_s **)(v26 + 128);
    if (v32)
    {
      xpc_connection_cancel(v32);
      long long v33 = *(void **)(v26 + 128);
      *(void *)(v26 + 128) = 0;
    }
    uint64_t v34 = *(void *)(a1 + 32);
    if (v34)
    {
      long long v35 = *(NSObject **)(v34 + 176);
      if (v35) {
        dispatch_source_cancel(v35);
      }
    }
  }
  uint64_t v36 = +[NEAppInfoCache sharedAppInfoCache]();
  uint32_t v37 = (void *)v36;
  if (v36) {
    objc_storeWeak((id *)(v36 + 8), 0);
  }

  uint64_t v38 = *(unsigned int *)(a1 + 40);
  v39.receiver = *(id *)(a1 + 32);
  v39.super_class = (Class)NEFilterDataExtensionProviderContext;
  objc_msgSendSuper2(&v39, sel_stopWithReason_, v38);
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  id v7 = a4;
  if (self)
  {
    if (v6) {
      BOOL v8 = v6[11] & 1;
    }
    else {
      BOOL v8 = 0;
    }
    self->_controlProviderExists = v8;
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    objc_storeStrong((id *)&self->_pendingConnections, v9);
  }

  int v10 = [MEMORY[0x1E4F1C9E8] dictionary];
  if (self) {
    objc_storeStrong((id *)&self->_remediationMap, v10);
  }

  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionary];
  if (self) {
    objc_storeStrong((id *)&self->_URLAppendStringMap, v11);
  }

  uint64_t v12 = +[NEAppInfoCache sharedAppInfoCache]();
  uint64_t v13 = (void *)v12;
  if (v12) {
    objc_storeWeak((id *)(v12 + 8), self);
  }

  ssize_t v14 = [(NEExtensionProviderContext *)self _principalObject];
  v19.receiver = self;
  v19.super_class = (Class)NEFilterDataExtensionProviderContext;
  [(NEFilterExtensionProviderContext *)&v19 startFilterWithOptions:v6 completionHandler:v7];
  objc_initWeak(&location, self);
  id v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)sockaddr buf = 138412290;
    uint32_t v21 = self;
    _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E59924B8;
  objc_copyWeak(&v17, &location);
  [v14 startFilterWithCompletionHandler:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[41])
    {
      int v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "The completion handler for startFilterWithOptions was executed twice", v7, 2u);
      }
    }
    else
    {
      WeakRetained[41] = 1;
      if (!v3)
      {
        [WeakRetained sendBrowserContentFilterServerRequest];
        [v5 sendSocketContentFilterRequest];
      }
      [v5 startedWithError:v3];
    }
  }
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-data";
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4140 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4140, &__block_literal_global_75_4141);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_4142;

  return v2;
}

uint64_t __71__NEFilterDataExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_4142 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0946E0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4145 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4145, &__block_literal_global_4146);
  }
  uint64_t v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4147;

  return v2;
}

uint64_t __73__NEFilterDataExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_4147 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0945B8];

  return MEMORY[0x1F41817F8]();
}

@end