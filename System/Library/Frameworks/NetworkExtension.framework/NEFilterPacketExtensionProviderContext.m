@interface NEFilterPacketExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)dealloc;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEFilterPacketExtensionProviderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interposes, 0);

  objc_storeStrong((id *)&self->_nw_interpose, 0);
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    if (objc_getProperty(self, v6, 112, 1))
    {
      objc_getProperty(self, v7, 112, 1);
      nw_interpose_cancel();
      objc_setProperty_atomic(self, v8, 0, 112);
    }
    if (objc_getProperty(self, v7, 120, 1))
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v10 = objc_msgSend(objc_getProperty(self, v9, 120, 1), "allValues");
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            -[NEFilterPacketInterpose close](*(os_unfair_lock_s **)(*((void *)&v19 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v12);
      }

      objc_setProperty_atomic(self, v15, 0, 120);
    }
  }
  os_unfair_lock_unlock(p_lock);
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = ne_session_stop_reason_to_string();
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2080;
    uint64_t v26 = v17;
    _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  v18.receiver = self;
  v18.super_class = (Class)NEFilterPacketExtensionProviderContext;
  [(NEFilterExtensionProviderContext *)&v18 stopWithReason:v3];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEFilterPacketExtensionProviderContext;
  [(NEExtensionProviderContext *)&v4 dealloc];
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  SEL v8 = [(NEExtensionProviderContext *)self _principalObject];
  v10.receiver = self;
  v10.super_class = (Class)NEFilterPacketExtensionProviderContext;
  [(NEFilterExtensionProviderContext *)&v10 startFilterWithOptions:v7 completionHandler:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v9[3] = &unk_1E5993618;
  v9[4] = self;
  [v8 startFilterWithCompletionHandler:v9];
}

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 startedWithError:a2];
  }
  else
  {
    objc_super v4 = [(NEExtensionProviderContext *)v3 hostContext];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2;
    v5[3] = &unk_1E5992288;
    v5[4] = *(void *)(a1 + 32);
    [v4 createPacketChannelWithCompletionHandler:v5];
  }
}

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  id v4 = a2;
  if (v3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      long long v20 = v3;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, " %@: necpClientClaimWithUUID <%@>", buf, 0x16u);
    }

    if (v4)
    {
      v18[0] = 0;
      v18[1] = 0;
      [v4 getUUIDBytes:v18];
      id v6 = (void *)nw_interpose_client_claim();
      objc_setProperty_atomic(v3, v7, v6, 112);

      if (objc_getProperty(v3, v8, 112, 1))
      {
        if (!objc_getProperty(v3, v9, 120, 1))
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_setProperty_atomic(v3, v12, v11, 120);
        }
        v3[26] = 0;
        objc_getProperty(v3, v10, 112, 1);
        nw_interpose_set_flow_event_handler();
        objc_getProperty(v3, v13, 112, 1);
        nw_interpose_start();

        uint64_t v14 = *(void **)(a1 + 32);
        [v14 startedWithError:0];
        return;
      }
      SEL v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        long long v20 = v3;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "%@: necpClientClaimWithUUID <%@>: failed claim", buf, 0x16u);
      }
    }
  }

  v16 = *(void **)(a1 + 32);
  id v17 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
  objc_msgSend(v16, "startedWithError:");
}

void __65__NEFilterPacketExtensionProviderContext_interposeClaimWithUUID___block_invoke(uint64_t a1, int a2, void *a3, const unsigned __int8 *a4, const char *a5, int a6, uint64_t a7, int a8)
{
  v96[2] = *MEMORY[0x1E4F143B8];
  SEL v15 = *(os_unfair_lock_s **)(a1 + 32);
  v16 = a3;
  if (v15)
  {
    os_unfair_lock_lock(v15 + 26);
    self = v15;
    id v17 = NSString;
    name = nw_interface_get_name(v16);
    long long v19 = v17;
    long long v20 = self;
    uint64_t v89 = [v19 stringWithUTF8String:name];
    objc_msgSend(objc_getProperty(self, v21, 120, 1), "objectForKeyedSubscript:", v89);
    id v22 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v22;
    v88 = v16;
    if (a2 == 1)
    {
      if (!v22)
      {
        id v27 = 0;
        goto LABEL_19;
      }
      if (-[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4))
      {
        uint64_t v28 = ne_log_obj();
        v29 = (void *)v89;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v91 = 138412290;
          *(void *)&v91[4] = v23;
          _os_log_debug_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: removing channel", v91, 0xCu);
        }

        -[NEFilterPacketInterpose close](v23);
        objc_msgSend(objc_getProperty(self, v30, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        id v27 = v23;
        goto LABEL_39;
      }
    }
    else
    {
      if (!a2)
      {
        if (v22)
        {
          BOOL v24 = -[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4);
          __int16 v25 = ne_log_obj();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
          if (v24)
          {
            if (v26)
            {
              *(_DWORD *)v91 = 138412290;
              *(void *)&v91[4] = v23;
              _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: flow already exists", v91, 0xCu);
            }

            id v27 = v23;
            long long v20 = self;
            goto LABEL_19;
          }
          if (v26)
          {
            *(_DWORD *)v91 = 138412290;
            *(void *)&v91[4] = v23;
            _os_log_debug_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: removing channel", v91, 0xCu);
          }

          -[NEFilterPacketInterpose close](v23);
          long long v20 = self;
          objc_msgSend(objc_getProperty(self, v33, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        }
        v34 = [(os_unfair_lock_s *)v20 _principalObject];
        v35 = [NEFilterPacketInterpose alloc];
        v36 = v16;
        id v27 = v35;
        v37 = v36;
        id v87 = v34;
        if (v27)
        {
          *(void *)v91 = v27;
          *(void *)&v91[8] = NEFilterPacketInterpose;
          v38 = (id *)objc_msgSendSuper2((objc_super *)v91, sel_init);
          id v27 = v38;
          if (v38)
          {
            *((_DWORD *)v38 + 2) = 0;
            objc_storeStrong(v38 + 17, a3);
            uint64_t v39 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a5];
            v40 = (void *)*((void *)v27 + 22);
            *((void *)v27 + 22) = v39;

            *((void *)v27 + 23) = a7;
            *((_DWORD *)v27 + 39) = a6;
            *((_DWORD *)v27 + 40) = a8;
            uint64_t v41 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a4];
            v42 = (void *)*((void *)v27 + 21);
            *((void *)v27 + 21) = v41;

            objc_storeStrong((id *)v27 + 16, v34);
            v43 = objc_alloc_init(NEFilterPacketContext);
            v44 = (void *)*((void *)v27 + 18);
            *((void *)v27 + 18) = v43;
          }
        }
        v45 = v87;

        v29 = (void *)v89;
        long long v20 = self;
        if (!v27) {
          goto LABEL_36;
        }
        v46 = (void *)*((void *)v27 + 16);
        if (v46
          && ([v46 packetHandler],
              v47 = objc_claimAutoreleasedReturnValue(),
              v47,
              v47))
        {
          uint64_t v48 = *((void *)v27 + 2);
          v49 = ne_log_obj();
          BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
          if (v48)
          {
            if (v50)
            {
              *(_DWORD *)buf = 138412290;
              id v93 = v27;
              _os_log_debug_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_DEBUG, "%@: createChannel: channel already exists", buf, 0xCu);
            }

            objc_msgSend(objc_getProperty(self, v51, 120, 1), "setObject:forKeyedSubscript:", v27, v89);
            v52 = ne_log_obj();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v91 = 138412290;
              *(void *)&v91[4] = v27;
              _os_log_debug_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: added channel", v91, 0xCu);
            }
LABEL_38:

LABEL_39:
            v32 = &OBJC_IVAR___NEIKEv2IKESA__error;
            goto LABEL_40;
          }
          if (v50)
          {
            *(_DWORD *)buf = 138412290;
            id v93 = v27;
            _os_log_debug_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_DEBUG, "%@: Establishing channel", buf, 0xCu);
          }

          if (*((void *)v27 + 23) && *((_DWORD *)v27 + 40))
          {
            uint64_t v54 = os_channel_attr_create();
            *((void *)v27 + 3) = v54;
            if (v54)
            {
              int v55 = os_channel_attr_set_key();
              if (v55)
              {
                int v56 = v55;
                v53 = ne_log_obj();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v93 = v27;
                  __int16 v94 = 1024;
                  *(_DWORD *)v95 = v56;
                  v57 = "%@: createChannel failed to set key <err %d> ";
LABEL_63:
                  v58 = v53;
                  uint32_t v59 = 18;
                  goto LABEL_54;
                }
LABEL_35:

                goto LABEL_36;
              }
              int v60 = os_channel_attr_set();
              if (v60)
              {
                int v61 = v60;
                v53 = ne_log_obj();
                if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                *(_DWORD *)buf = 138412546;
                id v93 = v27;
                __int16 v94 = 1024;
                *(_DWORD *)v95 = v61;
                v57 = "%@: createChannel failed to set user-packet-pool attribute <err %d> ";
                goto LABEL_63;
              }
              int v62 = os_channel_attr_set();
              v63 = ne_log_obj();
              v53 = v63;
              if (v62)
              {
                if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_35;
                }
                *(_DWORD *)buf = 138412546;
                id v93 = v27;
                __int16 v94 = 1024;
                *(_DWORD *)v95 = v62;
                v57 = "%@: createChannel failed to set filter attribute <err %d>";
                goto LABEL_63;
              }
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                id Property = objc_getProperty(v27, v64, 176, 1);
                *(_DWORD *)buf = 138412546;
                id v93 = v27;
                __int16 v94 = 2112;
                *(void *)v95 = Property;
                _os_log_debug_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_DEBUG, "%@ createChannel: nexusInstance %@", buf, 0x16u);
              }

              v65 = ne_log_obj();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                int v86 = *((_DWORD *)v27 + 39);
                *(_DWORD *)buf = 138412546;
                id v93 = v27;
                __int16 v94 = 1024;
                *(_DWORD *)v95 = v86;
                _os_log_debug_impl(&dword_19DDAF000, v65, OS_LOG_TYPE_DEBUG, "%@ createChannel: nexusPort %d", buf, 0x12u);
              }

              v96[0] = 0;
              v96[1] = 0;
              objc_msgSend(objc_getProperty(v27, v66, 176, 1), "getUUIDBytes:", v96);
              uint64_t extended = os_channel_create_extended();
              *((void *)v27 + 2) = extended;
              if (!extended)
              {
                v74 = ne_log_obj();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v93 = v27;
                  _os_log_error_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_ERROR, "%@: createChannel failed to create channel", buf, 0xCu);
                }

                goto LABEL_36;
              }
              int fd = os_channel_get_fd();
              *((_DWORD *)v27 + 8) = fd;
              v69 = ne_log_obj();
              v70 = v69;
              if (fd < 0)
              {
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v93 = v27;
                  v77 = "%@: createChannel failed to get channel fd";
                  v78 = v70;
                  uint32_t v79 = 12;
                  goto LABEL_91;
                }
              }
              else
              {
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  id v93 = v27;
                  _os_log_debug_impl(&dword_19DDAF000, v70, OS_LOG_TYPE_DEBUG, "%@: createChannel: created channel", buf, 0xCu);
                }

                *((void *)v27 + 12) = os_channel_rx_ring();
                *((void *)v27 + 13) = os_channel_tx_ring();
                *((void *)v27 + 14) = os_channel_rx_ring();
                uint64_t v71 = os_channel_tx_ring();
                *((void *)v27 + 15) = v71;
                if (*((void *)v27 + 12) && *((void *)v27 + 13))
                {
                  if (*((void *)v27 + 14) && v71)
                  {
                    os_channel_read_attr();
                    os_channel_attr_get();
                    *((_WORD *)v27 + 18) = 0;
                    v72 = ne_log_obj();
                    v73 = v72;
                    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_89;
                    }
                    *(_DWORD *)buf = 138412290;
                    id v93 = v27;
                    v82 = "%@: createChannel: channel slot size 0, clean up channel";
                    v83 = v73;
                    uint32_t v84 = 12;
                  }
                  else
                  {
                    v73 = ne_log_obj();
                    if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                    {
LABEL_89:

                      os_unfair_lock_lock((os_unfair_lock_t)v27 + 2);
                      -[NEFilterPacketInterpose close_nolock:]((uint64_t)v27, 0);
                      os_unfair_lock_unlock((os_unfair_lock_t)v27 + 2);
                      v29 = (void *)v89;
                      long long v20 = self;
                      v45 = v87;
LABEL_36:
                      v52 = ne_log_obj();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v91 = 138412290;
                        *(void *)&v91[4] = v27;
                        _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, "%@: interposeHandleFlowEvent: failed to create channel", v91, 0xCu);
                      }
                      goto LABEL_38;
                    }
                    uint64_t v80 = *((void *)v27 + 14);
                    uint64_t v81 = *((void *)v27 + 15);
                    *(_DWORD *)buf = 138412802;
                    id v93 = v27;
                    __int16 v94 = 1024;
                    *(_DWORD *)v95 = v80;
                    *(_WORD *)&v95[4] = 1024;
                    *(_DWORD *)&v95[6] = v81;
                    v82 = "%@: createChannel failed to get Egress input / output rings (%X %X)";
                    v83 = v73;
                    uint32_t v84 = 24;
                  }
                  _os_log_error_impl(&dword_19DDAF000, v83, OS_LOG_TYPE_ERROR, v82, buf, v84);
                  goto LABEL_89;
                }
                v70 = ne_log_obj();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v75 = *((void *)v27 + 12);
                  uint64_t v76 = *((void *)v27 + 13);
                  *(_DWORD *)buf = 138412802;
                  id v93 = v27;
                  __int16 v94 = 1024;
                  *(_DWORD *)v95 = v75;
                  *(_WORD *)&v95[4] = 1024;
                  *(_DWORD *)&v95[6] = v76;
                  v77 = "%@: createChannel failed to get Ingress input / output rings (%X %X)";
                  v78 = v70;
                  uint32_t v79 = 24;
LABEL_91:
                  _os_log_error_impl(&dword_19DDAF000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
                }
              }

              os_unfair_lock_lock((os_unfair_lock_t)v27 + 2);
              -[NEFilterPacketInterpose close_nolock:]((uint64_t)v27, 0);
              os_unfair_lock_unlock((os_unfair_lock_t)v27 + 2);
              goto LABEL_36;
            }
            v53 = ne_log_obj();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138412290;
            id v93 = v27;
            v57 = "%@: createChannel failed to create channel attributes";
          }
          else
          {
            v53 = ne_log_obj();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138412290;
            id v93 = v27;
            v57 = "%@: createChannel no key or 0 key length";
          }
        }
        else
        {
          v53 = ne_log_obj();
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 138412290;
          id v93 = v27;
          v57 = "%@: createChannel: no provider / packetHandler";
        }
        v58 = v53;
        uint32_t v59 = 12;
LABEL_54:
        _os_log_error_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_ERROR, v57, buf, v59);
        goto LABEL_35;
      }
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v91 = 138412546;
        *(void *)&v91[4] = v23;
        *(_WORD *)&v91[12] = 1024;
        *(_DWORD *)&v91[14] = a2;
        _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "%@: interposeHandleFlowEvent: unsupported event %d", v91, 0x12u);
      }
    }
    id v27 = v23;
LABEL_19:
    v32 = &OBJC_IVAR___NEIKEv2IKESA__error;
    v29 = (void *)v89;
LABEL_40:
    os_unfair_lock_unlock((os_unfair_lock_s *)((char *)v20 + v32[622]));

    v16 = v88;
  }
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-packet";
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_19512 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_19512, &__block_literal_global_63_19513);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_19514;

  return v2;
}

uint64_t __73__NEFilterPacketExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0A05F8];
  uint64_t v1 = _extensionAuxiliaryHostProtocol_protocol_19514;
  _extensionAuxiliaryHostProtocol_protocol_19514 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_19517 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_19517, &__block_literal_global_19518);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_19519;

  return v2;
}

uint64_t __75__NEFilterPacketExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094120];
  uint64_t v1 = _extensionAuxiliaryVendorProtocol_protocol_19519;
  _extensionAuxiliaryVendorProtocol_protocol_19519 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end