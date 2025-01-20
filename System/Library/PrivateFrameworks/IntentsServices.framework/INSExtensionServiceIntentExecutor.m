@interface INSExtensionServiceIntentExecutor
- (INCExtensionProxy)extensionProxy;
- (INIntent)intent;
- (INSExtensionServiceIntentExecutor)initWithIntent:(id)a3 extensionProxy:(id)a4 queue:(id)a5;
- (INSExtensionServiceIntentExecutor)initWithVoiceShortcutClient:(id)a3 intent:(id)a4;
- (INVCVoiceShortcutClient)voiceShortcutClient;
- (OS_dispatch_queue)queue;
- (void)sendAceCommand:(id)a3 completionHandler:(id)a4;
- (void)setExtensionProxy:(id)a3;
- (void)setIntent:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVoiceShortcutClient:(id)a3;
@end

@implementation INSExtensionServiceIntentExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_intent, 0);

  objc_storeStrong((id *)&self->_voiceShortcutClient, 0);
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setExtensionProxy:(id)a3
{
}

- (INCExtensionProxy)extensionProxy
{
  return self->_extensionProxy;
}

- (void)setIntent:(id)a3
{
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setVoiceShortcutClient:(id)a3
{
}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  return self->_voiceShortcutClient;
}

- (void)sendAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(INSExtensionServiceIntentExecutor *)self voiceShortcutClient];

  if (v8)
  {
    v9 = [MEMORY[0x263F0F9B0] sharedResolver];
    v10 = [(INSExtensionServiceIntentExecutor *)self intent];
    v11 = [v10 launchId];

    v12 = [v9 counterpartIdentifiersForLocalIdentifier:v11];
    uint64_t v13 = [v12 anyObject];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v11;
    }
    id v16 = v15;

    v17 = [(INSExtensionServiceIntentExecutor *)self intent];
    [v17 _setLaunchId:v16];

    v18 = objc_msgSend(v6, "ins_jsonEncodedIntent");

    if (v18)
    {
      id v19 = [(INSExtensionServiceIntentExecutor *)self intent];
      v20 = INSJSONEncodedIntent(v19);
      objc_msgSend(v6, "ins_setJSONEncodedIntent:", v20);
    }
    else
    {
      v23 = objc_msgSend(v6, "ins_protobufEncodedIntent");

      if (!v23)
      {
LABEL_12:
        [v6 setRefId:0];
        v29 = [(INSExtensionServiceIntentExecutor *)self voiceShortcutClient];
        v30 = [v6 dictionary];
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __70__INSExtensionServiceIntentExecutor_sendAceCommand_completionHandler___block_invoke;
        v31[3] = &unk_26427DFF8;
        id v32 = v7;
        [v29 sendAceCommandDictionary:v30 completion:v31];

        goto LABEL_13;
      }
      id v19 = objc_alloc_init(MEMORY[0x263F649F8]);
      v24 = [(INSExtensionServiceIntentExecutor *)self intent];
      v25 = [v24 backingStore];
      v26 = [v25 data];
      [v19 setData:v26];

      v27 = [(INSExtensionServiceIntentExecutor *)self intent];
      v28 = [v27 typeName];
      [v19 setTypeName:v28];

      objc_msgSend(v6, "ins_setProtobufEncodedIntent:", v19);
    }

    goto LABEL_12;
  }
  v21 = [(INSExtensionServiceIntentExecutor *)self extensionProxy];

  if (v21)
  {
    v9 = [(INSExtensionServiceIntentExecutor *)self intent];
    v11 = [(INSExtensionServiceIntentExecutor *)self extensionProxy];
    v22 = [(INSExtensionServiceIntentExecutor *)self queue];
    objc_msgSend(v6, "ins_sendIntent:toExtensionProxy:onQueue:completionHandler:", v9, v11, v22, v7);

LABEL_13:
  }
}

void __70__INSExtensionServiceIntentExecutor_sendAceCommand_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    v5 = (void *)MEMORY[0x263F64700];
    id v6 = a3;
    id v8 = [v5 aceObjectWithDictionary:a2];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v7 = *(void (**)(uint64_t, void))(v3 + 16);
    id v8 = a3;
    v7(v3, 0);
  }
}

- (INSExtensionServiceIntentExecutor)initWithIntent:(id)a3 extensionProxy:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (OS_dispatch_queue *)a5;
  v15.receiver = self;
  v15.super_class = (Class)INSExtensionServiceIntentExecutor;
  v12 = [(INSExtensionServiceIntentExecutor *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intent, a3);
    objc_storeStrong((id *)&v13->_extensionProxy, a4);
    v13->_queue = v11;
  }

  return v13;
}

- (INSExtensionServiceIntentExecutor)initWithVoiceShortcutClient:(id)a3 intent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSExtensionServiceIntentExecutor;
  id v9 = [(INSExtensionServiceIntentExecutor *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceShortcutClient, a3);
    objc_storeStrong((id *)&v10->_intent, a4);
  }

  return v10;
}

@end