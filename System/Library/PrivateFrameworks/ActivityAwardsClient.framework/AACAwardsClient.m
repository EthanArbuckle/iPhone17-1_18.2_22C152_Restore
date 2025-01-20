@interface AACAwardsClient
- (AACAwardsClient)init;
- (AACXPCClient)client;
- (id)allAchievementsWithError:(id *)a3;
- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3 error:(id *)a4;
- (void)addEarnedInstances:(id)a3 completion:(id)a4;
- (void)addTemplates:(id)a3 completion:(id)a4;
- (void)allAchievementsWithCompletion:(id)a3;
- (void)dealloc;
- (void)provideAchievementProgressUpdates:(id)a3 completion:(id)a4;
- (void)removeEarnedInstances:(id)a3 completion:(id)a4;
- (void)removeTemplates:(id)a3 completion:(id)a4;
- (void)removeTemplatesForSource:(id)a3 completion:(id)a4;
- (void)removeTemplatesWithUniqueNames:(id)a3 completion:(id)a4;
- (void)requestAwardingWithTriggers:(unint64_t)a3 completion:(id)a4;
- (void)requestProgressUpdateForProgressProviderIdentifier:(id)a3 completion:(id)a4;
- (void)scheduleAwardingWithCompletion:(id)a3;
- (void)setClient:(id)a3;
- (void)templatesForSource:(id)a3 completion:(id)a4;
@end

@implementation AACAwardsClient

- (void)provideAchievementProgressUpdates:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = ACHCodableFromAchievementProgressUpdate();
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F23670]);
  [v15 setAchievementProgressUpdates:v8];
  v16 = [v15 data];
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__AACAwardsClient_provideAchievementProgressUpdates_completion___block_invoke;
  v19[3] = &unk_26451CD68;
  id v20 = v7;
  id v18 = v7;
  [(AACXPCClient *)client sendRequest:16 payloadData:v16 completion:v19];
}

void __64__AACAwardsClient_provideAchievementProgressUpdates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (AACAwardsClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)AACAwardsClient;
  v2 = [(AACAwardsClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AACXPCClient);
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(AACXPCClient *)self->_client invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AACAwardsClient;
  [(AACAwardsClient *)&v3 dealloc];
}

- (void)scheduleAwardingWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__AACAwardsClient_scheduleAwardingWithCompletion___block_invoke;
  v7[3] = &unk_26451CD68;
  id v8 = v4;
  id v6 = v4;
  [(AACXPCClient *)client sendRequest:0 completion:v7];
}

uint64_t __50__AACAwardsClient_scheduleAwardingWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAwardingWithTriggers:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__AACAwardsClient_requestAwardingWithTriggers_completion___block_invoke;
  v10[3] = &unk_26451CD68;
  id v11 = v6;
  id v9 = v6;
  [(AACXPCClient *)client sendRequest:1 payload:v8 completion:v10];
}

void __58__AACAwardsClient_requestAwardingWithTriggers_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)allAchievementsWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__AACAwardsClient_allAchievementsWithCompletion___block_invoke;
  v7[3] = &unk_26451CD68;
  id v8 = v4;
  id v6 = v4;
  [(AACXPCClient *)client sendRequest:2 completion:v7];
}

void __49__AACAwardsClient_allAchievementsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = v7;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = (void *)[v7 copy];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = (void *)[objc_alloc(MEMORY[0x263F23668]) initWithData:v5];
    id v11 = [v19 achievements];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithCodable:*(void *)(*((void *)&v20 + 1) + 8 * v15)];
          [v8 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = (void *)[v8 copy];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
  }
}

- (id)allAchievementsWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy_;
  long long v24 = __Block_byref_object_dispose_;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v5 = ACHLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AACAwardsClient allAchievementsWithError:]();
  }

  client = self->_client;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__AACAwardsClient_allAchievementsWithError___block_invoke;
  v13[3] = &unk_26451CD90;
  v13[4] = &v14;
  v13[5] = &v20;
  [(AACXPCClient *)client sendSynchronousRequest:2 resultHandler:v13];
  id v7 = (id)v15[5];
  id v8 = v7;
  if (v7)
  {
    if (a3) {
      *a3 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v9 = ACHLogXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(id)v21[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = v10;
    _os_log_impl(&dword_21F697000, v9, OS_LOG_TYPE_DEFAULT, "Returning %lu achievements from synchronous allAchievementsWithError", buf, 0xCu);
  }

  id v11 = (void *)[(id)v21[5] copy];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __44__AACAwardsClient_allAchievementsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ACHLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__AACAwardsClient_allAchievementsWithError___block_invoke_cold_1();
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F23668]) initWithData:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = objc_msgSend(v8, "achievements", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithCodable:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v7 = ACHLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AACAwardsClient ephemeralAchievementWithTemplateUniqueName:error:]();
  }

  client = self->_client;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke;
  v15[3] = &unk_26451CD90;
  v15[4] = &v16;
  v15[5] = &v22;
  [(AACXPCClient *)client sendSynchronousRequest:15 payload:v6 resultHandler:v15];
  id v9 = (id)v17[5];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  uint64_t v11 = ACHLogXPC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v23[5];
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    _os_log_impl(&dword_21F697000, v11, OS_LOG_TYPE_DEFAULT, "Returning ephermeral achievement for template name %@: %@", buf, 0x16u);
  }

  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ACHLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke_cold_1();
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F23660]) initWithData:v5];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F23630]) initWithCodable:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)templatesForSource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__AACAwardsClient_templatesForSource_completion___block_invoke;
  v9[3] = &unk_26451CD68;
  id v10 = v6;
  id v8 = v6;
  [(AACXPCClient *)client sendRequest:8 payload:a3 completion:v9];
}

void __49__AACAwardsClient_templatesForSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F236A0]) initWithData:v5];
    id v8 = [v14 templates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)[objc_alloc(MEMORY[0x263F236D8]) initWithCodable:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addTemplates:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = ACHCodableFromTemplate();
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F236A0]);
  [v15 setTemplates:v8];
  long long v16 = [v15 data];
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __43__AACAwardsClient_addTemplates_completion___block_invoke;
  v19[3] = &unk_26451CD68;
  id v20 = v7;
  id v18 = v7;
  [(AACXPCClient *)client sendRequest:9 payloadData:v16 completion:v19];
}

void __43__AACAwardsClient_addTemplates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeTemplates:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = ACHCodableFromTemplate();
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F236A0]);
  [v15 setTemplates:v8];
  long long v16 = [v15 data];
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__AACAwardsClient_removeTemplates_completion___block_invoke;
  v19[3] = &unk_26451CD68;
  id v20 = v7;
  id v18 = v7;
  [(AACXPCClient *)client sendRequest:10 payloadData:v16 completion:v19];
}

void __46__AACAwardsClient_removeTemplates_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeTemplatesForSource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AACAwardsClient_removeTemplatesForSource_completion___block_invoke;
  v9[3] = &unk_26451CD68;
  id v10 = v6;
  id v8 = v6;
  [(AACXPCClient *)client sendRequest:11 payload:a3 completion:v9];
}

void __55__AACAwardsClient_removeTemplatesForSource_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeTemplatesWithUniqueNames:(id)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__AACAwardsClient_removeTemplatesWithUniqueNames_completion___block_invoke;
  v9[3] = &unk_26451CD68;
  id v10 = v6;
  id v8 = v6;
  [(AACXPCClient *)client sendRequest:12 payload:a3 completion:v9];
}

void __61__AACAwardsClient_removeTemplatesWithUniqueNames_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addEarnedInstances:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = ACHCodableFromEarnedInstance();
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F23680]);
  [v15 setEarnedInstances:v8];
  long long v16 = [v15 data];
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__AACAwardsClient_addEarnedInstances_completion___block_invoke;
  v19[3] = &unk_26451CD68;
  id v20 = v7;
  id v18 = v7;
  [(AACXPCClient *)client sendRequest:13 payloadData:v16 completion:v19];
}

void __49__AACAwardsClient_addEarnedInstances_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)removeEarnedInstances:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = ACHCodableFromEarnedInstance();
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x263F23680]);
  [v15 setEarnedInstances:v8];
  long long v16 = [v15 data];
  client = self->_client;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__AACAwardsClient_removeEarnedInstances_completion___block_invoke;
  v19[3] = &unk_26451CD68;
  id v20 = v7;
  id v18 = v7;
  [(AACXPCClient *)client sendRequest:14 payloadData:v16 completion:v19];
}

void __52__AACAwardsClient_removeEarnedInstances_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)requestProgressUpdateForProgressProviderIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__AACAwardsClient_requestProgressUpdateForProgressProviderIdentifier_completion___block_invoke;
  v9[3] = &unk_26451CD68;
  id v10 = v6;
  id v8 = v6;
  [(AACXPCClient *)client sendRequest:17 payload:a3 completion:v9];
}

void __81__AACAwardsClient_requestProgressUpdateForProgressProviderIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v7 = 0;
    id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:4 error:&v7];
    id v6 = v7;
    [v5 BOOLValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (AACXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)allAchievementsWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Calling sendSynchronousRequest from client for allAchievementsWithError", v2, v3, v4, v5, v6);
}

void __44__AACAwardsClient_allAchievementsWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Got result back from sending sendSynchronousRequest from client for allAchievementsWithError", v2, v3, v4, v5, v6);
}

- (void)ephemeralAchievementWithTemplateUniqueName:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Calling sendSynchronousRequest from client for ephemeralAchievementWithTemplateUniqueName", v2, v3, v4, v5, v6);
}

void __68__AACAwardsClient_ephemeralAchievementWithTemplateUniqueName_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Got result back from sending sendSynchronousRequest from client for ephemeralAchievementWithTemplateUniqueName", v2, v3, v4, v5, v6);
}

@end