@interface NEFilterSource
+ (BOOL)filterRequired;
+ (void)setDelegation:(id *)a3;
- (NEFilterSource)initWithDecisionQueue:(id)a3;
- (NEFilterSource)initWithURL:(id)a3 direction:(int64_t)a4 socketIdentifier:(unint64_t)a5;
- (NSString)sourceAppIdentifier;
- (NSURL)url;
- (id)filterOptions;
- (id)replacementData;
- (int)sourceAppPid;
- (int64_t)direction;
- (int64_t)status;
- (uint64_t)generateCryptoSignature:(_DWORD *)a3 length:;
- (uint64_t)sendDataToPluginWithConnection:(void *)a3 completionHandler:;
- (unint64_t)socketIdentifier;
- (void)addData:(id)a3 withCompletionQueue:(id)a4 completionHandler:(id)a5;
- (void)connectToFilterUnit:(void *)a3 withCompletionHandler:;
- (void)dataCompleteWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)finishedLoadingWithDecisionHandler:(id)a3;
- (void)initGlobals;
- (void)prepareAgentForResponse:(void *)a3 handler:;
- (void)prepareAgentForURL:(void *)a3 urlRequest:(void *)a4 urlResponse:(void *)a5 parentURL:(uint64_t)a6 direction:(void *)a7 flowUUID:(void *)a8 handler:;
- (void)prepareAgentWithHandler:(void *)a1;
- (void)receivedData:(id)a3 decisionHandler:(id)a4;
- (void)receivedResponse:(id)a3 decisionHandler:(id)a4;
- (void)remediateWithDecisionHandler:(id)a3;
- (void)setSourceAppIdentifier:(id)a3;
- (void)setSourceAppPid:(int)a3;
- (void)setUrl:(id)a3;
- (void)willSendRequest:(id)a3 decisionHandler:(id)a4;
@end

@implementation NEFilterSource

+ (void)setDelegation:(id *)a3
{
  g_delegation_audit_token = (uint64_t)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDataGroup, 0);
  objc_storeStrong((id *)&self->_parentURL, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_remediationButtonText, 0);
  objc_storeStrong((id *)&self->_remediationURL, 0);
  objc_storeStrong((id *)&self->_urlAppendString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong((id *)&self->_flowUUID, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setSourceAppPid:(int)a3
{
  self->_sourceAppPid = a3;
}

- (int)sourceAppPid
{
  return self->_sourceAppPid;
}

- (void)setSourceAppIdentifier:(id)a3
{
}

- (NSString)sourceAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)socketIdentifier
{
  return self->_socketIdentifier;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (void)remediateWithDecisionHandler:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self && (objc_setProperty_atomic(self, v4, 0, 160), self->_expectRemediation))
    {
      v8 = [(NEFilterSource *)self url];
      id v11 = objc_getProperty(self, v9, 184, 1);
      uint64_t controlUnit = self->_controlUnit;
      if (controlUnit)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3;
        v15[3] = &unk_1E598FCD0;
        v15[4] = self;
        id v18 = v5;
        id v16 = v8;
        id v17 = v11;
        -[NEFilterSource connectToFilterUnit:withCompletionHandler:]((uint64_t)self, controlUnit, v15);

        v13 = v18;
      }
      else
      {
        self->_status = 1;
        Property = objc_getProperty(self, v10, 144, 1);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2;
        v19[3] = &unk_1E59936F8;
        v19[4] = self;
        id v20 = v5;
        dispatch_async(Property, v19);
        v13 = v20;
      }
    }
    else
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "remediateWithDecisionHandler: dont expect remediation", buf, 2u);
      }

      if (self) {
        self = (NEFilterSource *)objc_getProperty(self, v7, 144, 1);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke;
      block[3] = &unk_1E5993770;
      id v22 = v5;
      dispatch_async(&self->super, block);
      v8 = v22;
    }
  }
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    *(void *)uuid = 0;
    uint64_t v19 = 0;
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 80, 1);
    }
    [Property getUUIDBytes:uuid];
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "command", 5);
    xpc_dictionary_set_uuid(v6, "flow-uuid", uuid);
    id v7 = [*(id *)(a1 + 40) absoluteString];
    xpc_dictionary_set_string(v6, "url", (const char *)[v7 UTF8String]);

    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      id v9 = [v8 absoluteString];
      xpc_dictionary_set_string(v6, "parent-url", (const char *)[v9 UTF8String]);
    }
    id v15 = *(id *)(a1 + 56);
    ne_filter_send_message();
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 24) = 2;
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uuid = 0;
      _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "remediateWithDecisionHandler: could not establish connection to data provider", uuid, 2u);
    }

    v12 = *(void **)(a1 + 32);
    if (v12) {
      v13 = objc_getProperty(v12, v11, 144, 1);
    }
    else {
      v13 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_85;
    block[3] = &unk_1E59936F8;
    id v14 = *(id *)(a1 + 56);
    void block[4] = *(void *)(a1 + 32);
    id v17 = v14;
    dispatch_async(v13, block);
  }
}

- (void)connectToFilterUnit:(void *)a3 withCompletionHandler:
{
  v3 = a3;
  if (v3)
  {
    id v4 = (void *)ne_filter_copy_connection();
    if (v4)
    {
      v3[2](v3, v4);
    }
    else
    {
      id v5 = v3;
      ne_filter_request_connection();
    }
  }
}

void __60__NEFilterSource_connectToFilterUnit_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = (id)ne_filter_copy_connection();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

uint64_t __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_2_86(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80, 1);
    }
    *(_DWORD *)buf = 138412546;
    id v17 = Property;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got remediation reply %@: %@", buf, 0x16u);
  }

  if (!v3 || MEMORY[0x19F3B92C0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v7 = *(void *)(a1 + 32);
LABEL_5:
    uint64_t v8 = 2;
    goto LABEL_6;
  }
  BOOL v12 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v7 = *(void *)(a1 + 32);
  if (v12) {
    goto LABEL_5;
  }
  uint64_t v8 = 1;
LABEL_6:
  *(void *)(v7 + 24) = v8;
  id v9 = *(void **)(a1 + 32);
  if (v9) {
    v10 = objc_getProperty(v9, v6, 144, 1);
  }
  else {
    v10 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_87;
  v14[3] = &unk_1E59936F8;
  id v11 = *(id *)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v11;
  dispatch_async(v10, v14);
}

void __47__NEFilterSource_remediateWithDecisionHandler___block_invoke_87(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  uint64_t v4 = v1[3];
  -[NEFilterSource filterOptions](v1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (id)filterOptions
{
  if (!a1) {
    goto LABEL_17;
  }
  if ([a1 status] == 2)
  {
    uint64_t v3 = objc_alloc_init(NEFilterBlockPage);
    uint64_t v4 = [a1 url];
    xpc_object_t v6 = [v4 absoluteString];
    if (v3) {
      objc_setProperty_atomic_copy(v3, v5, v6, 24);
    }

    if (objc_getProperty(a1, v7, 160, 1))
    {
      id Property = objc_getProperty(a1, v8, 160, 1);
      if (v3)
      {
        objc_setProperty_atomic_copy(v3, v10, Property, 32);
        objc_setProperty_atomic_copy(v3, v11, &stru_1EF054CB8, 40);
      }
      if (objc_msgSend(objc_getProperty(a1, v10, 168, 1), "length"))
      {
        BOOL v12 = (__CFString *)objc_getProperty(a1, v8, 168, 1);
        if (v3)
        {
          v13 = v12;
LABEL_20:
          v25 = v3;
          ptrdiff_t v26 = 48;
          goto LABEL_21;
        }
      }
      else if (v3)
      {
        v13 = @"Request Access";
        goto LABEL_20;
      }
    }
    else if (v3)
    {
      v13 = @"display:none";
      v25 = v3;
      ptrdiff_t v26 = 40;
LABEL_21:
      objc_setProperty_atomic_copy(v25, v8, v13, v26);
    }
    if (objc_getProperty(a1, v8, 176, 1))
    {
      id v28 = objc_getProperty(a1, v27, 176, 1);
      v29 = v28;
      if (v3)
      {
        if (v28 && [v28 length])
        {
          uint64_t v30 = [NSString stringWithFormat:@" by &ldquo;%@&rdquo;", v29];
          organization = v3->_organization;
          v3->_organization = (NSString *)v30;
        }
        else
        {
          organization = v3->_organization;
          v3->_organization = (NSString *)&stru_1EF054CB8;
        }
      }
    }
    v32 = -[NEFilterBlockPage page](v3);
    if (v32)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v33 = [v32 dataUsingEncoding:4];
      v34 = (void *)[v33 copy];
      [v14 setObject:v34 forKeyedSubscript:@"PageData"];

      if (objc_getProperty(a1, v35, 160, 1)) {
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_getProperty(a1, v36, 160, 1), @"RemediationURL");
      }
    }
    else
    {
      id v14 = 0;
    }

    goto LABEL_45;
  }
  if (!objc_getProperty(a1, v2, 152, 1))
  {
LABEL_17:
    id v14 = 0;
    goto LABEL_45;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = [a1 url];

  if (v15)
  {
    id v17 = [a1 url];
    __int16 v18 = [v17 absoluteString];
    id v20 = objc_getProperty(a1, v19, 152, 1);
    id v21 = v18;
    id v22 = v20;
    v23 = &stru_1EF054CB8;
    if ([v21 containsString:@"?"])
    {
      v24 = @"&";
    }
    else
    {
      if (objc_msgSend(v21, "characterAtIndex:", objc_msgSend(v21, "length") - 1) != 47) {
        v23 = @"/";
      }
      v24 = @"?";
    }
    v37 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v38 = [v22 stringByAddingPercentEncodingWithAllowedCharacters:v37];

    v39 = [NSString stringWithFormat:@"%@%@%@%@", v21, v23, v24, v38];
    v40 = [MEMORY[0x1E4F1CB10] URLWithString:v39];
    if (v40) {
      id v41 = v39;
    }
    else {
      id v41 = 0;
    }

    if (v41) {
      [v14 setObject:v41 forKeyedSubscript:@"RedirectURL"];
    }
  }
  v42 = objc_msgSend(objc_getProperty(a1, v16, 152, 1), "copy");
  [v14 setObject:v42 forKeyedSubscript:@"URLAppendString"];

  objc_setProperty_atomic(a1, v43, 0, 152);
LABEL_45:

  return v14;
}

- (void)finishedLoadingWithDecisionHandler:(id)a3
{
  id v5 = a3;
  if (self)
  {
    xpc_object_t v6 = objc_getProperty(self, v4, 216, 1);
    id Property = objc_getProperty(self, v7, 144, 1);
  }
  else
  {
    xpc_object_t v6 = 0;
    id Property = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke;
  v10[3] = &unk_1E59936F8;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_group_notify(v6, Property, v10);
}

void __53__NEFilterSource_finishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v4 = v2;
  if (v1) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if ((*(unsigned char *)(v1 + 8) & 1) != 0 && !*(_DWORD *)(v1 + 16))
    {
      *(void *)(v1 + 24) = 1;
      id Property = objc_getProperty((id)v1, v3, 144, 1);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke;
      __int16 v18 = &unk_1E59936F8;
      uint64_t v19 = v1;
      id v20 = v4;
      dispatch_async(Property, &v15);
      id v13 = v20;
    }
    else
    {
      if (!objc_getProperty((id)v1, v3, 128, 1))
      {
        SEL v7 = objc_getProperty((id)v1, v6, 144, 1);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2;
        block[3] = &unk_1E5993770;
        id v25 = v4;
        dispatch_async(v7, block);
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3;
      aBlock[3] = &unk_1E59936F8;
      aBlock[4] = v1;
      id v8 = v4;
      id v23 = v8;
      id v9 = _Block_copy(aBlock);
      id v11 = objc_getProperty((id)v1, v10, 128, 1);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5;
      __int16 v18 = &unk_1E598FC58;
      uint64_t v19 = v1;
      id v20 = v8;
      id v21 = v9;
      id v12 = v9;
      -[NEFilterSource prepareAgentForResponse:handler:](v1, v11, &v15);

      id v13 = v23;
    }
  }
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = objc_getProperty(v3, a2, 144, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
    id Property = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4;
  v6[3] = &unk_1E59936F8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_16;
  }
  int v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v14 = 2;
LABEL_17:
      *(void *)(v5 + 24) = v14;
      uint64_t v15 = *(void **)(a1 + 32);
      if (v15) {
        id Property = objc_getProperty(v15, v3, 144, 1);
      }
      else {
        id Property = 0;
      }
      length_4[0] = MEMORY[0x1E4F143A8];
      length_4[1] = 3221225472;
      length_4[2] = __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6;
      length_4[3] = &unk_1E59936F8;
      id v17 = *(id *)(a1 + 40);
      length_4[4] = *(void *)(a1 + 32);
      id v24 = v17;
      dispatch_async(Property, length_4);

      goto LABEL_23;
    }
LABEL_16:
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  if ([(id)v5 status] == 3)
  {
    *(void *)uuid = 0;
    uint64_t v29 = 0;
    id v8 = *(id *)(a1 + 32);
    if (v8) {
      id v8 = objc_getProperty(v8, v7, 80, 1);
    }
    [v8 getUUIDBytes:uuid];
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "command", 4);
    xpc_dictionary_set_uuid(v9, "flow-uuid", uuid);
    xpc_dictionary_set_int64(v9, "direction", 2);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      int64_t v11 = *(void *)(v10 + 200);
    }
    else {
      int64_t v11 = 0;
    }
    xpc_dictionary_set_int64(v9, "byte-count-inbound", v11);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      int64_t v13 = *(void *)(v12 + 208);
    }
    else {
      int64_t v13 = 0;
    }
    xpc_dictionary_set_int64(v9, "byte-count-outbound", v13);
    memset(bytes, 0, sizeof(bytes));
    unsigned int length = 0;
    if (-[NEFilterSource generateCryptoSignature:length:](*(void **)(a1 + 32), (const char *)bytes, &length))
    {
      xpc_dictionary_set_data(v9, "crypto-signature", bytes, length);
    }
    else
    {
      __int16 v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v20 = *(id *)(a1 + 32);
        if (v20) {
          id v20 = objc_getProperty(v20, v19, 80, 1);
        }
        *(_DWORD *)buf = 138412290;
        id v26 = v20;
        _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
      }
    }
    id v21 = *(id *)(a1 + 48);
    ne_filter_send_message();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_23:
}

- (void)prepareAgentForResponse:(void *)a3 handler:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [v6 URL];
    objc_setProperty_atomic((id)a1, v8, v6, 128);

    [(id)a1 setUrl:v7];
    if ((*(unsigned char *)(a1 + 8) & 1) == 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F38C10]);
      [v9 setUrl:v7];
      objc_msgSend(v9, "setPid:", objc_msgSend((id)a1, "sourceAppPid"));
      uint64_t v10 = [(id)a1 sourceAppIdentifier];
      if ([v10 isEqualToString:@"com.apple.SafariViewService"])
      {
        int v11 = [v9 pid];

        if (v11 >= 1) {
          [(id)a1 setSourceAppIdentifier:0];
        }
      }
      else
      {
      }
      uint64_t v12 = [(id)a1 sourceAppIdentifier];
      [v9 setSourceApplicationWithBundleID:v12];

      if (![v9 pid])
      {
        int64_t v13 = [v9 effectiveBundleID];

        if (!v13)
        {
          uint64_t v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(buffer[0]) = 0;
            _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "WebKit did not give us any information", (uint8_t *)buffer, 2u);
          }
        }
      }
      if ((int)[(id)a1 sourceAppPid] >= 1)
      {
        int v15 = [(id)a1 sourceAppPid];
        if (v15 != getpid())
        {
          uint64_t v47 = 0;
          memset(buffer, 0, sizeof(buffer));
          if (proc_pidinfo([(id)a1 sourceAppPid], 17, 1uLL, buffer, 56) == 56)
          {
            uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buffer];
            [v9 setProcessUUID:v16];

            id v17 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buffer];
            [v9 setEffectiveProcessUUID:v17];
          }
          else
          {
            id v17 = ne_log_obj();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v45 = [(id)a1 sourceAppPid];
              _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to UUID", buf, 8u);
            }
          }
        }
      }
      __int16 v18 = [v7 host];
      if (v18)
      {
        uint64_t v19 = [v7 port];
        id v20 = [v19 stringValue];
        if (v20)
        {
          id v21 = (void *)MEMORY[0x1E4F38BF0];
          [v7 host];
          id v22 = v43 = v5;
          id v23 = [v7 port];
          id v24 = [v23 stringValue];
          id v25 = [v21 endpointWithHostname:v22 port:v24];

          id v5 = v43;
        }
        else
        {
          id v25 = 0;
        }
      }
      else
      {
        id v25 = 0;
      }

      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:v25 parameters:v9];
      objc_setProperty_atomic((id)a1, v27, v26, 72);

      uint64_t v29 = objc_msgSend(objc_getProperty((id)a1, v28, 72, 1), "path");
      uint64_t v30 = [v29 clientID];
      objc_setProperty_atomic((id)a1, v31, v30, 80);

      v33 = objc_msgSend(objc_getProperty((id)a1, v32, 72, 1), "path");
      *(_DWORD *)(a1 + 16) = [v33 filterControlUnit];
    }
    v34 = [(id)a1 url];
    id v36 = objc_getProperty((id)a1, v35, 136, 1);
    id v38 = objc_getProperty((id)a1, v37, 128, 1);
    id v40 = objc_getProperty((id)a1, v39, 184, 1);
    id Property = objc_getProperty((id)a1, v41, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:](a1, v34, v36, v38, v40, 2, Property, v5);
  }
}

- (void)prepareAgentForURL:(void *)a3 urlRequest:(void *)a4 urlResponse:(void *)a5 parentURL:(uint64_t)a6 direction:(void *)a7 flowUUID:(void *)a8 handler:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void (**)(void, void))v20;
  if (v20)
  {
    uint64_t v22 = *(unsigned int *)(a1 + 16);
    if (v22)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke;
      v24[3] = &unk_1E598FC08;
      v24[4] = a1;
      id v30 = v20;
      id v25 = v19;
      id v26 = v15;
      id v27 = v18;
      id v28 = v16;
      id v29 = v17;
      uint64_t v31 = a6;
      -[NEFilterSource connectToFilterUnit:withCompletionHandler:](a1, v22, v24);
    }
    else
    {
      *(void *)(a1 + 24) = 1;
      id v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "prepareAgentForURL: uint64_t controlUnit = 0, skipping content filtering", buf, 2u);
      }

      v21[2](v21, 0);
    }
  }
}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    *(void *)(v4 + 24) = 2;
    id v16 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_18:
    v16();
    goto LABEL_25;
  }
  if (v4 && (*(unsigned char *)(v4 + 8) & 1) != 0)
  {
    id v16 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    goto LABEL_18;
  }
  *(void *)uuid = 0;
  uint64_t v29 = 0;
  [*(id *)(a1 + 40) getUUIDBytes:uuid];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "command", 2);
  xpc_dictionary_set_uuid(v5, "flow-uuid", uuid);
  id v6 = [*(id *)(a1 + 48) absoluteString];
  xpc_dictionary_set_string(v5, "url", (const char *)[v6 UTF8String]);

  id v7 = [*(id *)(a1 + 32) sourceAppIdentifier];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) sourceAppIdentifier];
    xpc_dictionary_set_string(v5, "source-app-bundle-id", (const char *)[v8 UTF8String]);
  }
  if ([*(id *)(a1 + 32) sourceAppPid]) {
    xpc_dictionary_set_uint64(v5, "source-app-pid", (int)[*(id *)(a1 + 32) sourceAppPid]);
  }
  pid_t v9 = getpid();
  xpc_dictionary_set_uint64(v5, "source-pid", v9);
  uint64_t v10 = *(void **)(a1 + 56);
  if (v10)
  {
    id v11 = [v10 absoluteString];
    xpc_dictionary_set_string(v5, "parent-url", (const char *)[v11 UTF8String]);
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v12 encodeObject:*(void *)(a1 + 64) forKey:@"URL_Request"];
    [v12 finishEncoding];
    int64_t v13 = [v12 encodedData];
    xpc_dictionary_set_data(v5, "url-request", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  }
  if (*(void *)(a1 + 72))
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v14 encodeObject:*(void *)(a1 + 72) forKey:@"URL_Response"];
    [v14 finishEncoding];
    id v15 = [v14 encodedData];
    xpc_dictionary_set_data(v5, "url-response", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  }
  xpc_dictionary_set_int64(v5, "direction", *(void *)(a1 + 88));
  xpc_dictionary_set_uint64(v5, "connection-direction", 1uLL);
  xpc_dictionary_set_uint64(v5, "socket-identifier", [*(id *)(a1 + 32) socketIdentifier]);
  memset(bytes, 0, sizeof(bytes));
  unsigned int length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](*(void **)(a1 + 32), (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v5, "crypto-signature", bytes, length);
  }
  else
  {
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      int length_4 = 138412290;
      uint64_t v26 = v20;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign new flow message for %@", (uint8_t *)&length_4, 0xCu);
    }
  }
  id v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    int length_4 = 138412290;
    uint64_t v26 = v19;
    _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "NEFilterSource send new flow %@", (uint8_t *)&length_4, 0xCu);
  }

  id v21 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 80);
  id v22 = v3;
  ne_filter_send_message();

LABEL_25:
}

- (uint64_t)generateCryptoSignature:(_DWORD *)a3 length:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  if (a2 && a3)
  {
    objc_msgSend(objc_getProperty(a1, a2, 80, 1), "getUUIDBytes:", &v16);
    DWORD2(v17) = 1;
    HIDWORD(v21) = [a1 sourceAppPid];
    DWORD2(v21) = getpid();
    uint64_t v6 = a1[26];
    *((void *)&v25 + 1) = a1[25];
    uint64_t v26 = v6;
    id v7 = [a1 sourceAppIdentifier];
    id v8 = (const char *)[v7 UTF8String];

    pid_t v9 = [a1 url];
    id v10 = [v9 absoluteString];
    id v11 = (const char *)[v10 UTF8String];

    *a3 = 32;
    if (v8)
    {
      strlen(v8);
      if (!v11)
      {
LABEL_8:
        uint64_t v3 = ne_filter_sign_data();
        uint64_t v12 = ne_log_obj();
        int64_t v13 = v12;
        if (v3)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "generateCryptoSignature: signed flow message", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "generateCryptoSignature: Failed to sign flow message", buf, 2u);
        }

        return v3;
      }
    }
    else if (!v11)
    {
      goto LABEL_8;
    }
    strlen(v11);
    goto LABEL_8;
  }
  return v3;
}

void __97__NEFilterSource_prepareAgentForURL_urlRequest_urlResponse_parentURL_direction_flowUUID_handler___block_invoke_20(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3 || MEMORY[0x19F3B92C0](v3) != MEMORY[0x1E4F14590])
  {
    *(void *)(a1[4] + 24) = 2;
    xpc_object_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v32) = 0;
      _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "NEFilterSource could not add new flow", (uint8_t *)&v32, 2u);
    }
LABEL_5:

    goto LABEL_6;
  }
  BOOL v6 = xpc_dictionary_get_BOOL(v4, "verdict-drop");
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = a1[5];
    int v32 = 138412546;
    uint64_t v33 = v31;
    __int16 v34 = 2112;
    SEL v35 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "NEFilterSource got new-flow reply %@: %@", (uint8_t *)&v32, 0x16u);
  }

  if (v6)
  {
    *(void *)(a1[4] + 24) = 2;
    string = xpc_dictionary_get_string(v4, "remediation-url");
    if (string)
    {
      id v10 = [NSString stringWithUTF8String:string];
      id v11 = (void *)a1[4];
      if (v11) {
        objc_setProperty_atomic(v11, v9, v10, 160);
      }

      id Property = (id)a1[4];
      if (Property) {
        id Property = objc_getProperty(Property, v12, 160, 1);
      }
      if ([Property isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
      {
        uint64_t v14 = a1[4];
        if (v14) {
          *(unsigned char *)(v14 + 9) = 1;
        }
      }
    }
    id v15 = xpc_dictionary_get_string(v4, "remediation-button-text");
    if (v15)
    {
      long long v17 = [NSString stringWithUTF8String:v15];
      long long v18 = (void *)a1[4];
      if (v18) {
        objc_setProperty_atomic(v18, v16, v17, 168);
      }
    }
    long long v19 = xpc_dictionary_get_string(v4, "organization");
    if (v19)
    {
      long long v21 = [NSString stringWithUTF8String:v19];
      long long v22 = (void *)a1[4];
      if (v22) {
        objc_setProperty_atomic(v22, v20, v21, 176);
      }
    }
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "verdict-peek");
    uint64_t v24 = a1[4];
    if (v24) {
      *(void *)(v24 + 112) = uint64;
    }
    *(void *)(a1[4] + 120) = xpc_dictionary_get_uint64(v4, "verdict-pass");
    uint64_t v25 = a1[4];
    if (*(void *)(v25 + 120) == -1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 3;
    }
    *(void *)(v25 + 24) = v26;
  }
  uint64_t v27 = a1[4];
  if (v27) {
    *(unsigned char *)(v27 + 8) = 1;
  }
  id v28 = xpc_dictionary_get_string(v4, "url-append-string");
  if (v28)
  {
    xpc_object_t v5 = [NSString stringWithUTF8String:v28];
    uint64_t v30 = (void *)a1[4];
    if (v30) {
      objc_setProperty_atomic(v30, v29, v5, 152);
    }
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80, 1);
    }
    int v25 = 138412546;
    id v26 = Property;
    __int16 v27 = 2112;
    id v28 = v3;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource finishedLoadingWithDecisionHandler got inbound-data-completion reply %@: %@", (uint8_t *)&v25, 0x16u);
  }

  if (!v3 || MEMORY[0x19F3B92C0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  BOOL v8 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v8)
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  *(void *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    id v11 = [NSString stringWithUTF8String:string];
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v10, v11, 160);
    }

    id v14 = *(id *)(a1 + 32);
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 160, 1);
    }
    if ([v14 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v15 = *(void *)(a1 + 32);
      if (v15) {
        *(unsigned char *)(v15 + 9) = 1;
      }
    }
  }
  long long v16 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v16)
  {
    long long v18 = [NSString stringWithUTF8String:v16];
    long long v19 = *(void **)(a1 + 32);
    if (v19) {
      objc_setProperty_atomic(v19, v17, v18, 168);
    }
  }
  long long v20 = xpc_dictionary_get_string(v3, "organization");
  if (v20)
  {
    long long v22 = [NSString stringWithUTF8String:v20];
    long long v23 = *(void **)(a1 + 32);
    if (v23) {
      objc_setProperty_atomic(v23, v21, v22, 176);
    }
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__NEFilterSource_handleFinishedLoadingWithDecisionHandler___block_invoke_4(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, 0, 128);
    id v3 = *(void **)(a1 + 32);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [v3 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);
}

- (void)receivedData:(id)a3 decisionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    if (self && self->_controlUnit)
    {
      if (objc_getProperty(self, v7, 128, 1))
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3;
        aBlock[3] = &unk_1E59936F8;
        aBlock[4] = self;
        id v10 = v8;
        id v25 = v10;
        id v11 = _Block_copy(aBlock);
        id Property = objc_getProperty(self, v12, 216, 1);
        dispatch_group_enter(Property);
        id v15 = objc_getProperty(self, v14, 128, 1);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5;
        v20[3] = &unk_1E598FCA8;
        v20[4] = self;
        id v22 = v10;
        id v23 = v11;
        id v21 = v6;
        id v16 = v11;
        -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, v15, v20);

        long long v17 = v25;
      }
      else
      {
        long long v19 = objc_getProperty(self, v9, 144, 1);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2;
        v26[3] = &unk_1E5993770;
        id v27 = v8;
        dispatch_async(v19, v26);
        long long v17 = v27;
      }
    }
    else
    {
      self->_status = 1;
      long long v18 = objc_getProperty(self, v7, 144, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke;
      block[3] = &unk_1E59936F8;
      void block[4] = self;
      id v29 = v8;
      dispatch_async(v18, block);
      long long v17 = v29;
    }
  }
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = objc_getProperty(v3, a2, 144, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
    id Property = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4;
  v6[3] = &unk_1E59936F8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_15;
  }
  int v6 = *(_DWORD *)(v5 + 16);
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v13 = 2;
LABEL_16:
      *(void *)(v5 + 24) = v13;
      SEL v14 = *(void **)(a1 + 32);
      if (v14) {
        id Property = objc_getProperty(v14, v3, 144, 1);
      }
      else {
        id Property = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6;
      block[3] = &unk_1E59936F8;
      id v16 = *(id *)(a1 + 48);
      void block[4] = *(void *)(a1 + 32);
      id v22 = v16;
      dispatch_async(Property, block);
      long long v18 = *(NSObject **)(a1 + 32);
      if (v18) {
        long long v18 = objc_getProperty(v18, v17, 216, 1);
      }
      dispatch_group_leave(v18);
      SEL v12 = v22;
      goto LABEL_21;
    }
LABEL_15:
    uint64_t v13 = 1;
    goto LABEL_16;
  }
  if ([(id)v5 status] == 3)
  {
    id v8 = *(id *)(a1 + 32);
    if (v8) {
      id v8 = objc_getProperty(v8, v7, 64, 1);
    }
    [v8 appendData:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) length];
    if (v9) {
      *(void *)(v9 + 200) += v10;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__NEFilterSource_receivedData_decisionHandler___block_invoke_7;
    v19[3] = &unk_1E5993770;
    id v20 = *(id *)(a1 + 56);
    if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](v11, v4, v19) & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    SEL v12 = v20;
LABEL_21:

    goto LABEL_22;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_22:
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

uint64_t __47__NEFilterSource_receivedData_decisionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)sendDataToPluginWithConnection:(void *)a3 completionHandler:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_22;
  }
  if (*(void *)(a1 + 120) == -1
    || !objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length")
    || (unint64_t v8 = *(void *)(a1 + 120),
        uint64_t v9 = *(void *)(a1 + 104),
        v8 >= objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length") + v9))
  {
    id v12 = objc_getProperty((id)a1, v6, 64, 1);
    objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(objc_getProperty((id)a1, v13, 64, 1), "length"), 0, 0);

    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + 120);
  unint64_t v11 = *(void *)(a1 + 104);
  if (v10 > v11)
  {
    objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "replaceBytesInRange:withBytes:length:", 0, v10 - v11, 0, 0);
LABEL_8:
    *(void *)(a1 + 104) = *(void *)(a1 + 120);
  }
  unint64_t v14 = objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "length");
  uint64_t v16 = *(void *)(a1 + 104);
  if (v14 >= *(void *)(a1 + 112) - v16) {
    size_t v17 = *(void *)(a1 + 112) - v16;
  }
  else {
    size_t v17 = v14;
  }
  if (*(void *)(a1 + 88) == v16 && *(void *)(a1 + 96) == v17)
  {
    long long v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "Duplicate request made.", buf, 2u);
    }

    goto LABEL_21;
  }
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v17;
  if (!v17)
  {
LABEL_21:
    a1 = 0;
    goto LABEL_22;
  }
  *(void *)buf = 0;
  uint64_t v30 = 0;
  objc_msgSend(objc_getProperty((id)a1, v15, 80, 1), "getUUIDBytes:", buf);
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v19, "command", 3);
  xpc_dictionary_set_uuid(v19, "flow-uuid", buf);
  id v21 = (const void *)objc_msgSend(objc_getProperty( (id) a1, v20, 64, 1), "bytes");
  xpc_dictionary_set_data(v19, "data", v21, v17);
  xpc_dictionary_set_uint64(v19, "data-start-offset", *(void *)(a1 + 104));
  xpc_dictionary_set_int64(v19, "direction", 2);
  if (objc_getProperty((id)a1, v22, 128, 1))
  {
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    objc_msgSend(v23, "encodeObject:forKey:", objc_getProperty((id)a1, v24, 128, 1), @"URL_Response");
    [v23 finishEncoding];
    id v25 = [v23 encodedData];
    xpc_dictionary_set_data(v19, "url-response", (const void *)[v25 bytes], objc_msgSend(v25, "length"));
  }
  id v27 = v5;
  id v28 = v7;
  ne_filter_send_message();

  a1 = 1;
LABEL_22:

  return a1;
}

void __67__NEFilterSource_sendDataToPluginWithConnection_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80, 1);
    }
    int v28 = 138412546;
    id v29 = Property;
    __int16 v30 = 2112;
    id v31 = v3;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got send-inbound-data reply %@: %@", (uint8_t *)&v28, 0x16u);
  }

  if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(v3, "verdict-drop"))
    {
      *(void *)(a1[4] + 24) = 2;
      string = xpc_dictionary_get_string(v3, "remediation-url");
      if (string)
      {
        unint64_t v10 = [NSString stringWithUTF8String:string];
        unint64_t v11 = (void *)a1[4];
        if (v11) {
          objc_setProperty_atomic(v11, v9, v10, 160);
        }

        id v13 = (id)a1[4];
        if (v13) {
          id v13 = objc_getProperty(v13, v12, 160, 1);
        }
        if ([v13 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
        {
          uint64_t v14 = a1[4];
          if (v14) {
            *(unsigned char *)(v14 + 9) = 1;
          }
        }
      }
      id v15 = xpc_dictionary_get_string(v3, "remediation-button-text");
      if (v15)
      {
        size_t v17 = [NSString stringWithUTF8String:v15];
        long long v18 = (void *)a1[4];
        if (v18) {
          objc_setProperty_atomic(v18, v16, v17, 168);
        }
      }
      xpc_object_t v19 = xpc_dictionary_get_string(v3, "organization");
      if (v19)
      {
        id v21 = [NSString stringWithUTF8String:v19];
        SEL v22 = (void *)a1[4];
        if (v22) {
          objc_setProperty_atomic(v22, v20, v21, 176);
        }
      }
      goto LABEL_6;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "verdict-peek");
    uint64_t v24 = a1[4];
    if (v24) {
      *(void *)(v24 + 112) = uint64;
    }
    uint64_t v25 = xpc_dictionary_get_uint64(v3, "verdict-pass");
    uint64_t v6 = a1[4];
    uint64_t v26 = *(void *)(v6 + 120);
    if (v25 > v26)
    {
      *(void *)(v6 + 120) = v25;
      uint64_t v6 = a1[4];
      uint64_t v26 = *(void *)(v6 + 120);
    }
    if (v26 != -1)
    {
      *(void *)(v6 + 24) = 3;
      if (-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](a1[4], a1[5], a1[6])) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = 2;
  }
  *(void *)(v6 + 24) = v7;
LABEL_6:
  (*(void (**)(void))(a1[6] + 16))();
LABEL_7:
}

void __47__NEFilterSource_receivedData_decisionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    id v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  uint64_t v7 = -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  id Property = *(NSObject **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v8, 216, 1);
  }

  dispatch_group_leave(Property);
}

- (void)receivedResponse:(id)a3 decisionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke;
    v8[3] = &unk_1E598FF18;
    v8[4] = self;
    id v9 = v6;
    -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, a3, v8);
  }
}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = objc_getProperty(v3, a2, 144, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
    id Property = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2;
  v6[3] = &unk_1E59936F8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __51__NEFilterSource_receivedResponse_decisionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    id v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

- (void)willSendRequest:(id)a3 decisionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke;
    aBlock[3] = &unk_1E5992CA0;
    aBlock[4] = self;
    id v22 = v6;
    id v8 = v7;
    id v23 = v8;
    id v9 = (void (**)(void))_Block_copy(aBlock);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4;
    v19[3] = &unk_1E59936F8;
    void v19[4] = self;
    id v10 = v8;
    id v20 = v10;
    id v12 = _Block_copy(v19);
    if (self && objc_getProperty(self, v11, 128, 1))
    {
      id Property = objc_getProperty(self, v13, 128, 1);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6;
      v15[3] = &unk_1E598FC80;
      v15[4] = self;
      id v16 = v10;
      id v17 = v12;
      long long v18 = v9;
      -[NEFilterSource prepareAgentForResponse:handler:]((uint64_t)self, Property, v15);
    }
    else
    {
      v9[2](v9);
    }
  }
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2;
  v48[3] = &unk_1E598FF18;
  v48[4] = v1;
  id v3 = *(id *)(a1 + 48);
  id v49 = v3;
  if (v1)
  {
    id v4 = v48;
    id v5 = v2;
    id v6 = [v5 URL];
    objc_setProperty_atomic((id)v1, v7, 0, 128);
    id v8 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    [v8 setUrl:v6];
    objc_msgSend(v8, "setPid:", objc_msgSend((id)v1, "sourceAppPid"));
    id v9 = [(id)v1 sourceAppIdentifier];
    if ([v9 isEqualToString:@"com.apple.SafariViewService"])
    {
      int v10 = [v8 pid];

      if (v10 >= 1) {
        [(id)v1 setSourceAppIdentifier:0];
      }
    }
    else
    {
    }
    unint64_t v11 = [(id)v1 sourceAppIdentifier];
    [v8 setSourceApplicationWithBundleID:v11];

    if (![v8 pid])
    {
      id v12 = [v8 effectiveBundleID];

      if (!v12)
      {
        id v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buffer[0]) = 0;
          _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "WebKit did not give us any information", (uint8_t *)buffer, 2u);
        }
      }
    }
    if ((int)[(id)v1 sourceAppPid] >= 1)
    {
      int v14 = [(id)v1 sourceAppPid];
      if (v14 != getpid())
      {
        uint64_t v53 = 0;
        memset(buffer, 0, sizeof(buffer));
        if (proc_pidinfo([(id)v1 sourceAppPid], 17, 1uLL, buffer, 56) == 56)
        {
          id v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buffer];
          [v8 setProcessUUID:v15];

          id v16 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buffer];
          [v8 setEffectiveProcessUUID:v16];
        }
        else
        {
          id v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v45 = [(id)v1 sourceAppPid];
            *(_DWORD *)buf = 67109120;
            int v51 = v45;
            _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to UUID", buf, 8u);
          }
        }
      }
    }
    id v17 = [v6 host];
    if (v17)
    {
      id v47 = v5;
      long long v18 = [v6 port];
      xpc_object_t v19 = [v18 stringValue];
      if (v19)
      {
        id v20 = (void *)MEMORY[0x1E4F38BF0];
        [v6 host];
        id v46 = v8;
        id v22 = v21 = v4;
        id v23 = [v6 port];
        uint64_t v24 = [v23 stringValue];
        uint64_t v25 = [v20 endpointWithHostname:v22 port:v24];

        id v4 = v21;
        id v8 = v46;
      }
      else
      {
        uint64_t v25 = 0;
      }

      id v5 = v47;
    }
    else
    {
      uint64_t v25 = 0;
    }

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:v25 parameters:v8];
    objc_setProperty_atomic((id)v1, v27, v26, 72);

    id v29 = objc_msgSend(objc_getProperty((id)v1, v28, 72, 1), "path");
    __int16 v30 = [v29 clientID];
    objc_setProperty_atomic((id)v1, v31, v30, 80);

    objc_setProperty_atomic((id)v1, v32, v5, 136);
    uint64_t v33 = [v5 HTTPBody];

    *(void *)(v1 + 208) += [v33 length];
    [(id)v1 setUrl:v6];
    SEL v35 = objc_msgSend(objc_getProperty((id)v1, v34, 72, 1), "path");
    *(_DWORD *)(v1 + 16) = [v35 filterControlUnit];

    uint64_t v36 = [(id)v1 url];
    id v38 = objc_getProperty((id)v1, v37, 136, 1);
    id v40 = objc_getProperty((id)v1, v39, 128, 1);
    id v42 = objc_getProperty((id)v1, v41, 184, 1);
    id Property = objc_getProperty((id)v1, v43, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:](v1, v36, v38, v40, v42, 1, Property, v4);

    id v3 = v49;
  }
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_4(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id Property = objc_getProperty(v3, a2, 144, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
    id Property = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5;
  v6[3] = &unk_1E59936F8;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(Property, v6);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_6(id *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = a1[4];
  if (!v5) {
    goto LABEL_17;
  }
  int v6 = v5[4];
  if (!v4 || !v6)
  {
    if (v6)
    {
      uint64_t v8 = 2;
LABEL_18:
      *((void *)v5 + 3) = v8;
      id v16 = a1[4];
      if (v16) {
        id Property = objc_getProperty(v16, v3, 144, 1);
      }
      else {
        id Property = 0;
      }
      length_4[0] = MEMORY[0x1E4F143A8];
      length_4[1] = 3221225472;
      length_4[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7;
      length_4[3] = &unk_1E59936F8;
      id v18 = a1[5];
      length_4[4] = a1[4];
      id v26 = v18;
      dispatch_async(Property, length_4);

      goto LABEL_26;
    }
LABEL_17:
    uint64_t v8 = 1;
    goto LABEL_18;
  }
  if ([v5 status] == 2)
  {
    id v7 = (void (**)(void))a1[6];
LABEL_22:
    v7[2]();
    goto LABEL_26;
  }
  if ([a1[4] status] != 3)
  {
    id v7 = (void (**)(void))a1[7];
    goto LABEL_22;
  }
  *(void *)uuid = 0;
  uint64_t v31 = 0;
  id v10 = a1[4];
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 80, 1);
  }
  [v10 getUUIDBytes:uuid];
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "command", 4);
  xpc_dictionary_set_uuid(v11, "flow-uuid", uuid);
  xpc_dictionary_set_int64(v11, "direction", 2);
  id v12 = a1[4];
  if (v12) {
    int64_t v13 = v12[25];
  }
  else {
    int64_t v13 = 0;
  }
  xpc_dictionary_set_int64(v11, "byte-count-inbound", v13);
  int v14 = a1[4];
  if (v14) {
    int64_t v15 = v14[26];
  }
  else {
    int64_t v15 = 0;
  }
  xpc_dictionary_set_int64(v11, "byte-count-outbound", v15);
  memset(bytes, 0, sizeof(bytes));
  unsigned int length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](a1[4], (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v11, "crypto-signature", bytes, length);
  }
  else
  {
    xpc_object_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v21 = a1[4];
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 80, 1);
      }
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
    }
  }
  id v22 = a1[7];
  id v23 = a1[6];
  ne_filter_send_message();

LABEL_26:
}

uint64_t __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80, 1);
    }
    int v26 = 138412546;
    id v27 = Property;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource willSendRequest got inbound-data-completion reply %@: %@", (uint8_t *)&v26, 0x16u);
  }

  if (!v3 || MEMORY[0x19F3B92C0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  BOOL v9 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v9)
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  *(void *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    id v12 = [NSString stringWithUTF8String:string];
    int64_t v13 = *(void **)(a1 + 32);
    if (v13) {
      objc_setProperty_atomic(v13, v11, v12, 160);
    }

    id v15 = *(id *)(a1 + 32);
    if (v15) {
      id v15 = objc_getProperty(v15, v14, 160, 1);
    }
    if ([v15 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        *(unsigned char *)(v16 + 9) = 1;
      }
    }
  }
  id v17 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v17)
  {
    xpc_object_t v19 = [NSString stringWithUTF8String:v17];
    id v20 = *(void **)(a1 + 32);
    if (v20) {
      objc_setProperty_atomic(v20, v18, v19, 168);
    }
  }
  id v21 = xpc_dictionary_get_string(v3, "organization");
  if (v21)
  {
    id v23 = [NSString stringWithUTF8String:v21];
    uint64_t v24 = *(void **)(a1 + 32);
    if (v24) {
      objc_setProperty_atomic(v24, v22, v23, 176);
    }
  }
LABEL_6:
  uint64_t v8 = 48;
  if (*(void *)(*(void *)(a1 + 32) + 24) == 1) {
    uint64_t v8 = 40;
  }
  (*(void (**)(void))(*(void *)(a1 + v8) + 16))();
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) status];
  id v4 = *(void **)(a1 + 32);
  if (v3 != 3 && v4)
  {
    objc_setProperty_atomic(v4, v2, 0, 128);
    id v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v4 status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    id Property = objc_getProperty(v3, a2, 144, 1);
  }
  else {
    id Property = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3;
  v6[3] = &unk_1E59936F8;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(Property, v6);
}

void __50__NEFilterSource_willSendRequest_decisionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource filterOptions](*(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (NEFilterSource)initWithDecisionQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterSource;
  uint64_t v6 = [(NEFilterSource *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_registered = 0;
    v6->_status = 3;
    *(_OWORD *)&v6->_peekIndex = xmmword_19DF9BEF0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0];
    pendingData = v7->_pendingData;
    v7->_pendingData = (NSMutableData *)v8;

    v7->_pendingDataStartIndex = 0;
    objc_storeStrong((id *)&v7->_queue, a3);
    dispatch_group_t v10 = dispatch_group_create();
    sendDataGroup = v7->_sendDataGroup;
    v7->_sendDataGroup = (OS_dispatch_group *)v10;

    -[NEFilterSource initGlobals]((uint64_t)v7);
  }

  return v7;
}

- (void)initGlobals
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = (id)nw_context_copy_implicit_context();
  id v4 = v2;
  nw_queue_context_async();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  *(void *)(a1 + 192) = v6[3];

  _Block_object_dispose(&v5, 8);
}

intptr_t __29__NEFilterSource_initGlobals__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = ne_filter_get_definition();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = nw_context_get_globals_for_protocol();

  id v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (void)dataCompleteWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke;
  v10[3] = &unk_1E598FC30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[NEFilterSource prepareAgentWithHandler:](self, v10);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_16;
  }
  int v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      uint64_t v13 = 2;
LABEL_17:
      *(void *)(v4 + 24) = v13;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E59936F8;
      id v17 = *(NSObject **)(a1 + 40);
      id v18 = *(id *)(a1 + 48);
      void block[4] = *(void *)(a1 + 32);
      id v28 = v18;
      dispatch_async(v17, block);
      uint64_t v16 = v28;
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v13 = 1;
    goto LABEL_17;
  }
  if ([(id)v4 status] != 3)
  {
    length_4[0] = MEMORY[0x1E4F143A8];
    length_4[1] = 3221225472;
    length_4[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_3;
    length_4[3] = &unk_1E59936F8;
    int v14 = *(NSObject **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    length_4[4] = *(void *)(a1 + 32);
    id v26 = v15;
    dispatch_async(v14, length_4);
    uint64_t v16 = v26;
LABEL_18:

    goto LABEL_22;
  }
  *(void *)uuid = 0;
  uint64_t v33 = 0;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 80, 1);
  }
  [Property getUUIDBytes:uuid];
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "command", 4);
  xpc_dictionary_set_uuid(v8, "flow-uuid", uuid);
  xpc_dictionary_set_int64(v8, "direction", 2);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    int64_t v10 = *(void *)(v9 + 200);
  }
  else {
    int64_t v10 = 0;
  }
  xpc_dictionary_set_int64(v8, "byte-count-inbound", v10);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    int64_t v12 = *(void *)(v11 + 208);
  }
  else {
    int64_t v12 = 0;
  }
  xpc_dictionary_set_int64(v8, "byte-count-outbound", v12);
  memset(bytes, 0, sizeof(bytes));
  unsigned int length = 0;
  if (-[NEFilterSource generateCryptoSignature:length:](*(void **)(a1 + 32), (const char *)bytes, &length))
  {
    xpc_dictionary_set_data(v8, "crypto-signature", bytes, length);
  }
  else
  {
    xpc_object_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 80, 1);
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v21;
      _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "NEFilterSource failed to sign data complete message for %@", buf, 0xCu);
    }
  }
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 48);
  ne_filter_send_message();

LABEL_22:
}

- (void)prepareAgentWithHandler:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v13 = [a1 url];
    id v5 = objc_getProperty(a1, v4, 136, 1);
    id v7 = objc_getProperty(a1, v6, 128, 1);
    id v9 = objc_getProperty(a1, v8, 184, 1);
    uint64_t v10 = [a1 direction];
    id Property = objc_getProperty(a1, v11, 80, 1);
    -[NEFilterSource prepareAgentForURL:urlRequest:urlResponse:parentURL:direction:flowUUID:handler:]((uint64_t)a1, v13, v5, v7, v9, v10, Property, v3);
  }
}

uint64_t __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 80, 1);
    }
    *(_DWORD *)buf = 138412546;
    id v30 = Property;
    __int16 v31 = 2112;
    id v32 = v3;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "NEFilterSource got inbound-data-completion reply %@: %@", buf, 0x16u);
  }

  if (!v3 || MEMORY[0x19F3B92C0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = 2;
LABEL_5:
    *(void *)(v6 + 24) = v7;
    goto LABEL_6;
  }
  BOOL v10 = xpc_dictionary_get_BOOL(v3, "verdict-drop");
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v10)
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  *(void *)(v6 + 24) = 2;
  string = xpc_dictionary_get_string(v3, "remediation-url");
  if (string)
  {
    id v13 = [NSString stringWithUTF8String:string];
    int v14 = *(void **)(a1 + 32);
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 160);
    }

    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v15, 160, 1);
    }
    if ([v16 isEqualToString:@"x-apple-content-filter://nefilter-unblock"])
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        *(unsigned char *)(v17 + 9) = 1;
      }
    }
  }
  id v18 = xpc_dictionary_get_string(v3, "remediation-button-text");
  if (v18)
  {
    id v20 = [NSString stringWithUTF8String:v18];
    id v21 = *(void **)(a1 + 32);
    if (v21) {
      objc_setProperty_atomic(v21, v19, v20, 168);
    }
  }
  id v22 = xpc_dictionary_get_string(v3, "organization");
  if (v22)
  {
    uint64_t v24 = [NSString stringWithUTF8String:v22];
    uint64_t v25 = *(void **)(a1 + 32);
    if (v25) {
      objc_setProperty_atomic(v25, v23, v24, 176);
    }
  }
LABEL_6:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_82;
  v27[3] = &unk_1E59936F8;
  SEL v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v27[4] = *(void *)(a1 + 32);
  id v28 = v9;
  dispatch_async(v8, v27);
}

void __68__NEFilterSource_dataCompleteWithCompletionQueue_completionHandler___block_invoke_82(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (id)replacementData
{
  id v1 = a1;
  if (a1)
  {
    if ([a1 status] == 2)
    {
      uint64_t v2 = objc_alloc_init(NEFilterBlockPage);
      uint64_t v3 = [v1 url];
      id v5 = [v3 absoluteString];
      if (v2) {
        objc_setProperty_atomic_copy(v2, v4, v5, 24);
      }

      uint64_t v6 = -[NEFilterBlockPage page](v2);
      if (v6)
      {
        uint64_t v7 = v6;
        id v1 = [v6 dataUsingEncoding:4];
      }
      else
      {
        id v1 = 0;
      }
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

- (void)addData:(id)a3 withCompletionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke;
  v14[3] = &unk_1E598FCD0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  -[NEFilterSource prepareAgentWithHandler:](self, v14);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    goto LABEL_13;
  }
  int v5 = *(_DWORD *)(v4 + 16);
  if (!v3 || !v5)
  {
    if (v5)
    {
      uint64_t v13 = 2;
LABEL_14:
      *(void *)(v4 + 24) = v13;
      int v14 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E59936F8;
      id v10 = &v26;
      id v17 = *(id *)(a1 + 56);
      void block[4] = *(void *)(a1 + 32);
      id v26 = v17;
      id v16 = block;
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v13 = 1;
    goto LABEL_14;
  }
  if ([(id)v4 status] != 3)
  {
    int v14 = *(NSObject **)(a1 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_3;
    v23[3] = &unk_1E59936F8;
    id v10 = &v24;
    id v15 = *(id *)(a1 + 56);
    v23[4] = *(void *)(a1 + 32);
    id v24 = v15;
    id v16 = v23;
LABEL_15:
    dispatch_async(v14, v16);
    goto LABEL_16;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E5992CA0;
  v21[0] = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  v21[1] = *(void *)(a1 + 32);
  id v22 = v6;
  id v8 = _Block_copy(aBlock);
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 64, 1);
  }
  id v10 = (id *)v21;
  [Property appendData:*(void *)(a1 + 48)];
  uint64_t v11 = *(void *)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_6;
  v18[3] = &unk_1E5993770;
  id v12 = v8;
  id v19 = v12;
  if ((-[NEFilterSource sendDataToPluginWithConnection:completionHandler:](v11, v3, v18) & 1) == 0) {
    v12[2](v12);
  }

LABEL_16:
}

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);

  return v3(v1, v2, 0);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5;
  v4[3] = &unk_1E59936F8;
  id v3 = *(id *)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__NEFilterSource_addData_withCompletionQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) status];
  -[NEFilterSource replacementData](*(id *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (NEFilterSource)initWithURL:(id)a3 direction:(int64_t)a4 socketIdentifier:(unint64_t)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NEFilterSource;
  id v10 = [(NEFilterSource *)&v18 init];
  uint64_t v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_registered = 0;
    objc_storeStrong((id *)&v10->_url, a3);
    *(void *)(v11 + 40) = a4;
    *(void *)(v11 + 48) = a5;
    id v12 = *(void **)(v11 + 56);
    *(void *)(v11 + 56) = 0;

    *(_DWORD *)(v11 + 12) = 0;
    *(void *)(v11 + 24) = 3;
    *(_OWORD *)(v11 + 112) = xmmword_19DF9BEF0;
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    int v14 = *(void **)(v11 + 80);
    *(void *)(v11 + 80) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0];
    id v16 = *(void **)(v11 + 64);
    *(void *)(v11 + 64) = v15;

    *(void *)(v11 + 104) = 0;
    -[NEFilterSource initGlobals](v11);
  }

  return (NEFilterSource *)v11;
}

+ (BOOL)filterRequired
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (g_delegation_audit_token)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    long long v3 = *(_OWORD *)(g_delegation_audit_token + 16);
    *(_OWORD *)int v14 = *(_OWORD *)g_delegation_audit_token;
    *(_OWORD *)&v14[16] = v3;
    [v2 setSourceApplicationWithToken:v14];
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int v14 = 136315394;
      *(void *)&v14[4] = "+[NEFilterSource filterRequired]";
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v2;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%s: parameters %@", v14, 0x16u);
    }

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:0 parameters:v2];
    id v6 = (void *)g_pathEvaluator;
    g_pathEvaluator = v5;

    uint64_t v7 = (void *)g_pathEvaluator;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
    id v2 = v7;
  }
  id v8 = [v7 path];
  int v9 = [v8 filterControlUnit];

  BOOL v11 = (v9 & 0x40000000) == 0 && v9 != 0;
  id v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v14 = 136315394;
    *(void *)&v14[4] = "+[NEFilterSource filterRequired]";
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = v11;
    _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, "%s: result %d", v14, 0x12u);
  }

  return v11;
}

@end