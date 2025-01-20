@interface AFUIDelayedActionCommandCache
- (AFUIDelayedActionCommandCache)init;
- (id)_commandHandler;
- (void)_invalidateDelayedActionTimer:(id)a3 withKey:(id)a4;
- (void)_performCommandsWithDelayedActionCommand:(id)a3;
- (void)_performDelayedActionCommandTimerAction:(id)a3;
- (void)cancelDelayedActionWithDelayedActionCancelCommand:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enqueueDelayedActionCommand:(id)a3 completion:(id)a4;
- (void)invalidatePendingCommands;
- (void)performDismissalCommands;
@end

@implementation AFUIDelayedActionCommandCache

- (AFUIDelayedActionCommandCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)AFUIDelayedActionCommandCache;
  v2 = [(AFUIDelayedActionCommandCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    delayedActionTimersByIdentifier = v2->_delayedActionTimersByIdentifier;
    v2->_delayedActionTimersByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dismissalDelayedActionCommandsByIdentifier = v2->_dismissalDelayedActionCommandsByIdentifier;
    v2->_dismissalDelayedActionCommandsByIdentifier = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(AFUIDelayedActionCommandCache *)self invalidatePendingCommands];
  v3.receiver = self;
  v3.super_class = (Class)AFUIDelayedActionCommandCache;
  [(AFUIDelayedActionCommandCache *)&v3 dealloc];
}

- (void)enqueueDelayedActionCommand:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_super v8 = (os_log_t *)MEMORY[0x263F28348];
  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v10 = [v6 aceId];
  v11 = [v6 timerValue];

  if (v11)
  {
    v12 = [v6 timerValue];
    [v12 doubleValue];
    double v14 = v13 / 1000.0;

    os_log_t v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = [v6 commands];
      *(_DWORD *)buf = 136315906;
      v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2048;
      double v38 = v14;
      __int16 v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s Enqueue delayed action command: %@, delay: %f, commands: %@", buf, 0x2Au);
    }
    id v18 = objc_alloc(MEMORY[0x263F28180]);
    v19 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v20 = [v19 processIdentifier];
    v21 = NSString;
    v22 = [v6 aceId];
    v23 = [v21 stringWithFormat:@"SiriDelayedActionCommandAssertion-%@", v22];
    v24 = (void *)[v18 initWithPID:v20 flags:1 reason:4 name:v23 withHandler:0];

    v25 = (void *)MEMORY[0x263EFFA20];
    v26 = [[_AFUIAssertingDelayedActionCommand alloc] initWithCommand:v6 assertion:v24];
    v27 = [v25 scheduledTimerWithTimeInterval:self target:sel__performDelayedActionCommandTimerAction_ selector:v26 userInfo:0 repeats:v14];

    [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier setObject:v27 forKey:v10];
  }
  else
  {
    os_log_t v28 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = [v6 commands];
      *(_DWORD *)buf = 136315650;
      v34 = "-[AFUIDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      double v38 = *(double *)&v30;
      _os_log_impl(&dword_223099000, v29, OS_LOG_TYPE_DEFAULT, "%s Enqueue dismissal action command: %@, commands: %@", buf, 0x20u);
    }
    [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier setObject:v6 forKey:v10];
  }
  id v31 = objc_alloc_init(MEMORY[0x263F64830]);
  v32 = [v6 aceId];
  [v31 setRefId:v32];

  if (v7) {
    v7[2](v7, v31);
  }
}

- (void)cancelDelayedActionWithDelayedActionCancelCommand:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_super v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[AFUIDelayedActionCommandCache cancelDelayedActionWithDelayedActionCancelCommand:completion:]";
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  v9 = [v6 delayedActionAceId];
  v10 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier objectForKey:v9];
  if (v10)
  {
    [(AFUIDelayedActionCommandCache *)self _invalidateDelayedActionTimer:v10 withKey:v9];
    id v11 = objc_alloc_init(MEMORY[0x263F64830]);
  }
  else
  {
    v12 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier objectForKey:v9];
    if (v12)
    {
      [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier removeObjectForKey:v9];
      double v13 = (Class *)0x263F64830;
    }
    else
    {
      double v13 = (Class *)0x263F64820;
    }
    id v11 = objc_alloc_init(*v13);
  }
  double v14 = [v6 aceId];
  [v11 setRefId:v14];

  if (v7) {
    v7[2](v7, v11);
  }
}

- (void)_performDelayedActionCommandTimerAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[AFUIDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  v7 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v8 command];
    [(AFUIDelayedActionCommandCache *)self _performCommandsWithDelayedActionCommand:v9];
    delayedActionTimersByIdentifier = self->_delayedActionTimersByIdentifier;
    id v11 = [v9 aceId];
    [(NSMutableDictionary *)delayedActionTimersByIdentifier removeObjectForKey:v11];

    v12 = [v8 assertion];
    double v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      int v15 = "-[AFUIDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v14, 0x20u);
    }
    [v12 invalidate];
  }
  [v4 invalidate];
}

- (void)invalidatePendingCommands
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[AFUIDelayedActionCommandCache invalidatePendingCommands]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v4 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier objectForKey:v9];
        if (v10) {
          [(AFUIDelayedActionCommandCache *)self _invalidateDelayedActionTimer:v10 withKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateDelayedActionTimer:(id)a3 withKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    long long v11 = [v6 userInfo];
    int v18 = 136315394;
    v19 = "-[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s Invalidating delayed action timer with userInfo: %@", (uint8_t *)&v18, 0x16u);
  }
  long long v12 = [v6 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    long long v14 = [v13 assertion];
    int v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v15;
      uint64_t v17 = [v13 command];
      int v18 = 136315650;
      v19 = "-[AFUIDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v18, 0x20u);
    }
    [v14 invalidate];
  }
  [v6 invalidate];

  [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier removeObjectForKey:v7];
}

- (void)performDismissalCommands
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[AFUIDelayedActionCommandCache performDismissalCommands]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v4 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier objectForKey:v9];
        if (v10)
        {
          [(AFUIDelayedActionCommandCache *)self _performCommandsWithDelayedActionCommand:v10];
          [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_commandHandler
{
  id v2 = objc_alloc_init(MEMORY[0x263F28460]);

  return v2;
}

- (void)_performCommandsWithDelayedActionCommand:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 commands];
    *(_DWORD *)buf = 136315650;
    long long v14 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]";
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s Performing delayed action command: %@ with commands: %@", buf, 0x20u);
  }
  id v8 = [(AFUIDelayedActionCommandCache *)self _commandHandler];
  uint64_t v9 = [v4 commands];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke;
  v11[3] = &unk_264692878;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2;
    v8[3] = &unk_264692828;
    id v9 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_31;
    v6[3] = &unk_264692850;
    id v7 = v9;
    [v5 handleCommand:v9 commandHandler:v8 completion:v6];
  }
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_INFO, "%s Received response for delayed command: %@, response: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_31(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = *MEMORY[0x263F28348];
  id v7 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 136315394;
      __int16 v10 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_INFO, "%s Delayed command succeeded: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_31_cold_1(a1, (uint64_t)v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalDelayedActionCommandsByIdentifier, 0);

  objc_storeStrong((id *)&self->_delayedActionTimersByIdentifier, 0);
}

void __74__AFUIDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_31_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  id v5 = "-[AFUIDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s Delayed command failed: %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

@end