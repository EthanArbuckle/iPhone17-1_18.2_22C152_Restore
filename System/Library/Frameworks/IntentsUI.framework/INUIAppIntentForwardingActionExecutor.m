@interface INUIAppIntentForwardingActionExecutor
- (INUIAppIntentForwardingActionExecutor)initWithApplication:(id)a3;
- (UIApplication)application;
- (void)executeAction:(id)a3 completionHandler:(id)a4;
- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5;
- (void)setApplication:(id)a3;
@end

@implementation INUIAppIntentForwardingActionExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong(&self->_handlerForIntent, 0);
}

- (void)setApplication:(id)a3
{
}

- (UIApplication)application
{
  return self->_application;
}

- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5
{
  id v13 = a4;
  v7 = (void (**)(id, id))a5;
  v8 = [(UIApplication *)self->_application delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(UIApplication *)self->_application delegate];
    v11 = [v10 application:self->_application handlerForIntent:v13];
    id handlerForIntent = self->_handlerForIntent;
    self->_id handlerForIntent = v11;
  }
  v7[2](v7, self->_handlerForIntent);
}

- (void)executeAction:(id)a3 completionHandler:(id)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(INUIAppIntentForwardingActionExecutor *)self application];
  char v9 = [v8 delegate];
  id v10 = [v6 intentForwardingAction];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v11 = (void *)getWFOnScreenContentExtractorClass_softClass;
    uint64_t v45 = getWFOnScreenContentExtractorClass_softClass;
    if (!getWFOnScreenContentExtractorClass_softClass)
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      uint64_t v39 = (uint64_t)__getWFOnScreenContentExtractorClass_block_invoke;
      v40 = &unk_263FD6D30;
      v41 = &v42;
      __getWFOnScreenContentExtractorClass_block_invoke((uint64_t)&v37);
      v11 = (void *)v43[3];
    }
    v12 = v11;
    _Block_object_dispose(&v42, 8);
    id v13 = objc_alloc_init(v12);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke;
    v35[3] = &unk_263FD6838;
    id v36 = v7;
    [v13 handleAction:v10 completionHandler:v35];
  }
  else
  {

    if (objc_opt_respondsToSelector())
    {
      v14 = [v6 intentForwardingAction];
      v15 = (void *)[objc_alloc(MEMORY[0x263F0F9A8]) initWithDelegate:self];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_2;
      v33[3] = &unk_263FD6860;
      v33[4] = self;
      id v34 = v7;
      [v15 dispatchIntentForwardingAction:v14 completionHandler:v33];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v37 = 0;
      uint64_t v38 = (uint64_t)&v37;
      uint64_t v39 = 0x2020000000;
      LOBYTE(v40) = 0;
      v16 = [v6 intentForwardingAction];
      v17 = [v16 intent];
      v18 = INTypedIntentWithIntent();

      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_3;
      v30[3] = &unk_263FD6888;
      v32 = &v37;
      id v31 = v7;
      [v9 application:v8 handleIntent:v18 completionHandler:v30];

      _Block_object_dispose(&v37, 8);
    }
    else
    {
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F07F80];
      v20 = NSString;
      v21 = [v6 intentForwardingAction];
      v22 = [v21 intent];
      v23 = [v20 stringWithFormat:@"Missing intent handler for %@", objc_opt_class()];
      v47[0] = v23;
      v24 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      v25 = [v19 errorWithDomain:*MEMORY[0x263F0F768] code:2003 userInfo:v24];

      v26 = [v6 intentForwardingAction];
      v27 = objc_opt_class();

      v28 = objc_msgSend(objc_alloc((Class)objc_msgSend(v27, "responseClass")), "initWithError:", v25);
      v29 = [MEMORY[0x263F1C6E8] responseWithIntentForwardingActionResponse:v28];
      (*((void (**)(id, void *))v7 + 2))(v7, v29);
    }
  }
}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F1C6E8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithIntentForwardingActionResponse:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F1C6E8] responseWithIntentForwardingActionResponse:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  INIntentResponseWithTypedIntentResponse();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F1C6E8];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0FB50]) initWithIntentResponse:v6 launchContextActivityData:0 cacheItems:0 error:0];
  id v5 = [v3 responseWithIntentForwardingActionResponse:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

- (INUIAppIntentForwardingActionExecutor)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIAppIntentForwardingActionExecutor;
  id v6 = [(INUIAppIntentForwardingActionExecutor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

@end