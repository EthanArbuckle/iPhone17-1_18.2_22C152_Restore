@interface NEFilterDataSavedMessageHandler
- (void)enqueueWithFlow:(void *)a3 context:;
- (void)executeVerdictHandlerWithFlow:(void *)a3 verdict:(void *)a4 context:;
- (void)executeWithFlow:(void *)a3 context:;
- (void)initWithGetVerdictBlock:(void *)a3 handleVerdictBlock:;
@end

@implementation NEFilterDataSavedMessageHandler

- (void)initWithGetVerdictBlock:(void *)a3 handleVerdictBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)NEFilterDataSavedMessageHandler;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = _Block_copy(v5);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = _Block_copy(v6);
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (void)enqueueWithFlow:(void *)a3 context:
{
  self = a2;
  id v6 = a3;
  if (a1)
  {
    id Property = self;
    if (self) {
      id Property = objc_getProperty(self, v5, 136, 1);
    }
    id v8 = Property;
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v11 = self;
      if (self) {
        id v11 = objc_getProperty(self, v10, 136, 1);
      }
      id v12 = v11;
      [v12 addObject:a1];
    }
    else
    {
      -[NEFilterDataSavedMessageHandler executeWithFlow:context:](a1, self, v6);
    }
  }
}

- (void)executeWithFlow:(void *)a3 context:
{
  self = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    id v8 = (void *)v6;
    if (v6)
    {
      if (*(unsigned char *)(v6 + 13))
      {
        id Property = self;
        if (self)
        {
          if (self[11])
          {
            id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Flow is already paused" userInfo:0];
            objc_exception_throw(v19);
          }
          self[11] = 1;
          id Property = objc_getProperty(self, v7, 136, 1);
        }
        id v13 = Property;

        if (v13)
        {
          id v15 = self;
          if (self) {
            id v15 = objc_getProperty(self, v14, 136, 1);
          }
          id v16 = v15;
          [v16 insertObject:a1 atIndex:0];
        }
        else
        {
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
          if (self) {
            objc_setProperty_atomic(self, v17, v18, 136);
          }
        }
        goto LABEL_17;
      }
      uint64_t v9 = a1;
      v10 = self;
      id v11 = v8;
    }
    else
    {
      uint64_t v9 = a1;
      v10 = self;
      id v11 = 0;
    }
    -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:](v9, v10, v11, v5);
LABEL_17:
  }
}

- (void)executeVerdictHandlerWithFlow:(void *)a3 verdict:(void *)a4 context:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9 && v8 && *((unsigned char *)v9 + 104) && [v8 needRules])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke;
      v11[3] = &unk_1E598FB68;
      id v12 = v7;
      id v13 = v10;
      uint64_t v14 = a1;
      id v15 = v8;
      [v13 fetchCurrentRulesForFlow:v12 completionHandler:v11];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
    }
  }
}

void __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v17 = [*(id *)(a1 + 32) identifierString];
      int v18 = 138412546;
      id v19 = v17;
      __int16 v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "Control verdict for flow %@: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  if (!v3)
  {
    id v9 = [*(id *)(a1 + 40) _principalObject];
    [v9 handleRulesChanged];

LABEL_13:
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      uint64_t v11 = *(void *)(v10 + 8);
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = (*(void (**)(void))(v11 + 16))();
    goto LABEL_16;
  }
  if (v3[72])
  {
    id v5 = [*(id *)(a1 + 40) _principalObject];
    [v5 handleRulesChanged];
  }
  if (v3[73]) {
    goto LABEL_13;
  }
  int v6 = [v3 drop];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v6)
  {
    if (isKindOfClass)
    {
      id v16 = NEFilterNewFlowVerdict;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = NEFilterDataVerdict;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_32;
        }
        id v16 = NEFilterRemediationVerdict;
      }
    }
    uint64_t v12 = [(__objc2_class *)v16 allowVerdict];
    goto LABEL_16;
  }
  if (isKindOfClass)
  {
    id v8 = NEFilterNewFlowVerdict;
LABEL_28:
    uint64_t v12 = [(__objc2_class *)v8 dropVerdict];
LABEL_16:
    id v13 = (void *)v12;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = NEFilterDataVerdict;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = NEFilterRemediationVerdict;
    goto LABEL_28;
  }
LABEL_32:
  id v13 = 0;
LABEL_17:
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    uint64_t v15 = *(void *)(v14 + 16);
  }
  else {
    uint64_t v15 = 0;
  }
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleVerdict, 0);

  objc_storeStrong(&self->_getVerdict, 0);
}

@end