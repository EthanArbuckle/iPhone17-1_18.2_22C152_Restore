@interface AFSiriActivationListener
- (AFSiriActivationListener)initWithServicePort:(int64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6;
- (void)_deliverButtonEventFromContext:(id)a3 completion:(id)a4;
- (void)_invalidate;
- (void)_myriadEventWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_startWithDelegate:(id)a3;
- (void)_stop;
- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleContext:(id)a3 completion:(id)a4;
- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5;
- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)startWithDelegate:(id)a3;
- (void)stop;
@end

@implementation AFSiriActivationListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_myriadEventWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]";
    __int16 v25 = 2048;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  v12 = [AFOneArgumentSafetyBlock alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke;
  v21[3] = &unk_1E5929680;
  v21[4] = self;
  id v13 = v10;
  id v22 = v13;
  v14 = +[AFError errorWithCode:2508];
  v15 = [(AFOneArgumentSafetyBlock *)v12 initWithBlock:v21 defaultValue:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    uint64_t v18 = 2506;
LABEL_8:
    v17 = +[AFError errorWithCode:v18];
    [(AFOneArgumentSafetyBlock *)v15 invokeWithValue:v17];
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v18 = 2507;
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke_51;
  v19[3] = &unk_1E592C248;
  v20 = v15;
  [WeakRetained siriActivationListener:self myriadEventWithRequestInfo:v8 context:v9 completion:v19];
  v17 = v20;
LABEL_9:
}

void __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[AFSiriActivationListener _myriadEventWithRequestInfo:context:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __75__AFSiriActivationListener__myriadEventWithRequestInfo_context_completion___block_invoke_51(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)_deliverButtonEventFromContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]";
    __int16 v22 = 2048;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  id v9 = [AFOneArgumentSafetyBlock alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke;
  v18[3] = &unk_1E5929680;
  v18[4] = self;
  id v10 = v7;
  id v19 = v10;
  uint64_t v11 = +[AFError errorWithCode:2508];
  __int16 v12 = [(AFOneArgumentSafetyBlock *)v9 initWithBlock:v18 defaultValue:v11];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    uint64_t v15 = 2506;
LABEL_8:
    uint64_t v14 = +[AFError errorWithCode:v15];
    [(AFOneArgumentSafetyBlock *)v12 invokeWithValue:v14];
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v15 = 2507;
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke_48;
  v16[3] = &unk_1E592C248;
  v17 = v12;
  [WeakRetained siriActivationListener:self handleButtonEventFromContext:v6 completion:v16];
  uint64_t v14 = v17;
LABEL_9:
}

void __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[AFSiriActivationListener _deliverButtonEventFromContext:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __70__AFSiriActivationListener__deliverButtonEventFromContext_completion___block_invoke_48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)_deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    if ((unint64_t)a3 > 0x14) {
      uint64_t v14 = @"(unknown)";
    }
    else {
      uint64_t v14 = off_1E59287D8[a3];
    }
    uint64_t v15 = v14;
    v16 = AFSiriDeactivationOptionsGetNames(a4);
    *(_DWORD *)buf = 136316162;
    __int16 v29 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]";
    __int16 v30 = 2048;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    v33 = v15;
    __int16 v34 = 2112;
    v35 = v16;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s %p reason = %@, options = %@, context = %@", buf, 0x34u);
  }
  v17 = [AFOneArgumentSafetyBlock alloc];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke;
  v26[3] = &unk_1E5929680;
  v26[4] = self;
  id v18 = v11;
  id v27 = v18;
  id v19 = +[AFError errorWithCode:2508];
  v20 = [(AFOneArgumentSafetyBlock *)v17 initWithBlock:v26 defaultValue:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    uint64_t v23 = 2506;
LABEL_11:
    __int16 v22 = +[AFError errorWithCode:v23];
    [(AFOneArgumentSafetyBlock *)v20 invokeWithValue:v22];
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v23 = 2507;
    goto LABEL_11;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke_45;
  v24[3] = &unk_1E592C248;
  id v25 = v20;
  [WeakRetained siriActivationListener:self deactivateForReason:a3 options:a4 context:v10 completion:v24];
  __int16 v22 = v25;
LABEL_12:
}

void __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[AFSiriActivationListener _deactivateForReason:options:context:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __76__AFSiriActivationListener__deactivateForReason_options_context_completion___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)_activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]";
    __int16 v25 = 2048;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  __int16 v12 = [AFOneArgumentSafetyBlock alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke;
  v21[3] = &unk_1E5929680;
  v21[4] = self;
  id v13 = v10;
  id v22 = v13;
  uint64_t v14 = +[AFError errorWithCode:2508];
  uint64_t v15 = [(AFOneArgumentSafetyBlock *)v12 initWithBlock:v21 defaultValue:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    uint64_t v18 = 2506;
LABEL_8:
    v17 = +[AFError errorWithCode:v18];
    [(AFOneArgumentSafetyBlock *)v15 invokeWithValue:v17];
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v18 = 2507;
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke_42;
  v19[3] = &unk_1E592C248;
  v20 = v15;
  [WeakRetained siriActivationListener:self activateWithRequestInfo:v8 context:v9 completion:v19];
  v17 = v20;
LABEL_9:
}

void __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[AFSiriActivationListener _activateWithRequestInfo:context:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __72__AFSiriActivationListener__activateWithRequestInfo_context_completion___block_invoke_42(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)_prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]";
    __int16 v25 = 2048;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  __int16 v12 = [AFOneArgumentSafetyBlock alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke;
  v21[3] = &unk_1E5929680;
  v21[4] = self;
  id v13 = v10;
  id v22 = v13;
  uint64_t v14 = +[AFError errorWithCode:2508];
  uint64_t v15 = [(AFOneArgumentSafetyBlock *)v12 initWithBlock:v21 defaultValue:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    uint64_t v18 = 2506;
LABEL_8:
    v17 = +[AFError errorWithCode:v18];
    [(AFOneArgumentSafetyBlock *)v15 invokeWithValue:v17];
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v18 = 2507;
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke_39;
  v19[3] = &unk_1E592C248;
  v20 = v15;
  [WeakRetained siriActivationListener:self prewarmWithRequestInfo:v8 context:v9 completion:v19];
  v17 = v20;
LABEL_9:
}

void __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[AFSiriActivationListener _prewarmWithRequestInfo:context:completion:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p done", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

uint64_t __71__AFSiriActivationListener__prewarmWithRequestInfo_context_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)_invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[AFSiriActivationListener _invalidate]";
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "-[AFSiriActivationListener _stop]";
    __int16 v6 = 2048;
    __int16 v7 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(NSXPCListener *)self->_xpcListener suspend];
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_startWithDelegate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    __int16 v7 = "-[AFSiriActivationListener _startWithDelegate:]";
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p delegate = %@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeWeak((id *)&self->_delegate, v4);
  [(NSXPCListener *)self->_xpcListener resume];
}

- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s intentForwardingAction = %@, bundleIdentifier = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E592A8F8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

void __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_1E5929658;
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [WeakRetained siriActivationListener:v3 handleIntentForwardingAction:v4 inBackgroundApplicationWithBundleIdentifier:v5 completionHandler:v8];
  }
  else
  {
    int v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completi"
            "onHandler:]_block_invoke";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Intent handling is not supported on this platform", buf, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void __119__AFSiriActivationListener_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[AFSiriActivationListener handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionH"
         "andler:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s intentForwardingActionResponse = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]";
    __int16 v22 = 2048;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p intent = %@, bundleIdentifier = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E592A8F8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

void __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2;
    v11[3] = &unk_1E5929630;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v6;
    [WeakRetained siriActivationListener:v3 handleIntent:v4 inBackgroundAppWithBundleId:v5 reply:v11];
    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v7 = +[AFError errorWithCode:1316];
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v7);
    }
  }
}

void __75__AFSiriActivationListener_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  if (v5)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 136315650;
      id v13 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke_2";
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p intentResponse = %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if (v6)
  {
    uint64_t v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315650;
      id v13 = "-[AFSiriActivationListener handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s %p error = %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)handleContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[AFSiriActivationListener handleContext:completion:]";
    __int16 v17 = 2048;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2;
  v38[3] = &unk_1E5929560;
  v2 = *(void **)(a1 + 40);
  v38[4] = *(void *)(a1 + 32);
  id v39 = v2;
  id v40 = *(id *)(a1 + 48);
  uint64_t v3 = (void (**)(void, void))MEMORY[0x19F3A50D0](v38);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_14;
  v35[3] = &unk_1E5929560;
  uint64_t v4 = *(void **)(a1 + 40);
  v35[4] = *(void *)(a1 + 32);
  id v36 = v4;
  id v37 = *(id *)(a1 + 48);
  id v5 = (void (**)(void, void))MEMORY[0x19F3A50D0](v35);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_17;
  v32[3] = &unk_1E5929588;
  id v6 = *(void **)(a1 + 40);
  v32[4] = *(void *)(a1 + 32);
  id v33 = v6;
  id v34 = *(id *)(a1 + 48);
  id v7 = (void (**)(void, void, void))MEMORY[0x19F3A50D0](v32);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_21;
  v29[3] = &unk_1E59295B0;
  v29[4] = *(void *)(a1 + 32);
  id v31 = *(id *)(a1 + 48);
  id v30 = *(id *)(a1 + 40);
  id v8 = (void (**)(void, void))MEMORY[0x19F3A50D0](v29);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  __int16 v24 = __53__AFSiriActivationListener_handleContext_completion___block_invoke_25;
  id v25 = &unk_1E5929560;
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v26 = *(void *)(a1 + 32);
  id v27 = v9;
  id v28 = *(id *)(a1 + 48);
  id v10 = (void (**)(void, void))MEMORY[0x19F3A50D0](&v22);
  id v11 = AFSiriActivationCreateRequestInfoFromContext(*(void **)(a1 + 40));
  int v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v42 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v43 = 2048;
    uint64_t v44 = v13;
    __int16 v45 = 2112;
    v46 = v11;
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@", buf, 0x20u);
  }
  uint64_t v14 = [*(id *)(a1 + 40) source];
  uint64_t v15 = [*(id *)(a1 + 40) event];
  if (v14 == 4)
  {
    if (v15 <= 8)
    {
      if (v15 == 1 || v15 == 8)
      {
        __int16 v16 = objc_msgSend(*(id *)(a1 + 40), "userInfo", v3, v22, v23, v24, v25, v26, v27);
        __int16 v17 = [v16 objectForKey:@"isCancellationDoubleTapEvent"];

        uint64_t v18 = [*(id *)(a1 + 40) userInfo];
        __int16 v19 = [v18 objectForKey:@"hasPlayedStartAlert"];
        char v20 = [v19 BOOLValue];

        if (!v17 && (v20 & 1) != 0 || v17 && ([v17 BOOLValue] & 1) == 0)
        {
          ((void (**)(void, void *))v5)[2](v5, v11);
        }
        else
        {
          if ([*(id *)(a1 + 40) options])
          {
            uint64_t v3 = (void (**)(void, void))v21;
            (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v11);
            goto LABEL_22;
          }
          v7[2](v7, 1, 0);
        }
        uint64_t v3 = (void (**)(void, void))v21;
LABEL_22:

        goto LABEL_19;
      }
      goto LABEL_16;
    }
    if (v15 == 9)
    {
      v8[2](v8, *(void *)(a1 + 40));
      goto LABEL_19;
    }
  }
  if (v15 == 16)
  {
    ((void (**)(void, void *))v10)[2](v10, v11);
    goto LABEL_19;
  }
LABEL_16:
  if ([*(id *)(a1 + 40) options]) {
    ((void (**)(void, void *))v3)[2](v3, v11);
  }
  else {
    ((void (**)(void, void *))v5)[2](v5, v11);
  }
LABEL_19:
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke_2";
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p Handling as prewarming...", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_11;
  v11[3] = &unk_1E5929538;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = v8;
  v11[4] = v9;
  id v12 = v10;
  [v6 _prewarmWithRequestInfo:v3 context:v7 completion:v11];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p Handling as activation...", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_15;
  v11[3] = &unk_1E5929538;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = v8;
  v11[4] = v9;
  id v12 = v10;
  [v6 _activateWithRequestInfo:v3 context:v7 completion:v11];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p Handling as deactivation...", buf, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_18;
  v13[3] = &unk_1E5929538;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v15 = v10;
  v13[4] = v11;
  id v14 = v12;
  [v8 _deactivateForReason:a2 options:a3 context:v9 completion:v13];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p Delivering button event ...", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_22;
  v10[3] = &unk_1E5929538;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v12 = v7;
  v10[4] = v8;
  id v11 = v9;
  [v6 _deliverButtonEventFromContext:v3 completion:v10];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p Handling myriad event...", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_26;
  v11[3] = &unk_1E5929538;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = v8;
  v11[4] = v9;
  id v12 = v10;
  [v6 _myriadEventWithRequestInfo:v3 context:v7 completion:v11];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_26(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_27;
    v12[3] = &unk_1E59294E8;
    id v13 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v12];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      id v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as myriad event due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:6];
  [v3 setError:*(void *)(a1 + 32)];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_22(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_23;
    v12[3] = &unk_1E59294E8;
    id v13 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v12];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      id v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to deliver button event from context %@ due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:3];
  [v3 setError:*(void *)(a1 + 32)];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_18(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_19;
    v12[3] = &unk_1E59294E8;
    id v13 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v12];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      id v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as deactivation due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:2];
  [v3 setError:*(void *)(a1 + 32)];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_15(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_16;
    v12[3] = &unk_1E59294E8;
    id v13 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v12];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      id v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as activation due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:1];
  [v3 setError:*(void *)(a1 + 32)];
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_11(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[6])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_12;
    v12[3] = &unk_1E59294E8;
    id v13 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v12];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      id v10 = (void *)a1[5];
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p Unable to handle context %@ as prewarming due to error %@.", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[AFSiriActivationListener handleContext:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __53__AFSiriActivationListener_handleContext_completion___block_invoke_2_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:5];
  [v3 setError:*(void *)(a1 + 32)];
}

- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    if ((unint64_t)a3 > 0x14) {
      id v14 = @"(unknown)";
    }
    else {
      id v14 = off_1E59287D8[a3];
    }
    __int16 v15 = v14;
    __int16 v16 = AFSiriDeactivationOptionsGetNames(a4);
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]";
    __int16 v27 = 2048;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v16;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s %p reason = %@, options = %@, context = %@", buf, 0x34u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E5929510;
  int64_t v23 = a3;
  unint64_t v24 = a4;
  block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(queue, block);
}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_2;
  v7[3] = &unk_1E5929680;
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 _deactivateForReason:v2 options:v3 context:v5 completion:v7];
}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 40))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_3;
    v11[3] = &unk_1E59294E8;
    id v12 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v11];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke_2";
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[AFSiriActivationListener deactivateForReason:options:context:completion:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __75__AFSiriActivationListener_deactivateForReason_options_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:2];
  [v3 setError:*(void *)(a1 + 32)];
}

- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v21 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]";
    __int16 v22 = 2048;
    int64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E592A8F8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_1E5929680;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _activateWithRequestInfo:v3 context:v4 completion:v6];
}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 40))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3;
    v11[3] = &unk_1E59294E8;
    id v12 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v11];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke_2";
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p result = %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v8 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s %p error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[AFSiriActivationListener activateWithRequestInfo:context:completion:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s %p done", buf, 0x16u);
  }
}

void __71__AFSiriActivationListener_activateWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:1];
  [v3 setError:*(void *)(a1 + 32)];
}

- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v21 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]";
    __int16 v22 = 2048;
    int64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s %p requestInfo = %@, context = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E592A8F8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v4[3] = &unk_1E592B9A0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _prewarmWithRequestInfo:v2 context:v3 completion:v4];
}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_3;
    v8[3] = &unk_1E59294E8;
    id v9 = v3;
    id v5 = +[AFSiriActivationResult newWithBuilder:v8];
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s result = %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[AFSiriActivationListener prewarmWithRequestInfo:context:completion:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
  }
}

void __70__AFSiriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:5];
  [v3 setError:*(void *)(a1 + 32)];
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    id v10 = "-[AFSiriActivationListener notifyObserver:didChangeStateFrom:to:]";
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s notifyObserver = %@, fromState = %llu, toState = %llu", (uint8_t *)&v9, 0x2Au);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (self->_xpcListener != a3) {
    goto LABEL_2;
  }
  int v9 = [v6 valueForEntitlement:@"com.apple.siri.activation"];

  if (v9) {
    goto LABEL_7;
  }
  id v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    unint64_t v14 = v10;
    int v15 = 136315906;
    unint64_t v16 = "-[AFSiriActivationListener listener:shouldAcceptNewConnection:]";
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 1026;
    int v20 = [v7 processIdentifier];
    __int16 v21 = 2112;
    __int16 v22 = @"com.apple.siri.activation";
    _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s %p Client with pid %{public}d does not have entitlement %@.", (uint8_t *)&v15, 0x26u);
  }
  __int16 v11 = [v7 valueForEntitlement:@"com.apple.siri.external_request"];

  if (v11)
  {
LABEL_7:
    [v7 setRemoteObjectInterface:0];
    id v12 = AFSiriActivationServiceGetXPCInterface();
    [v7 setExportedInterface:v12];

    [v7 setExportedObject:self];
    [v7 resume];
    BOOL v8 = 1;
  }
  else
  {
LABEL_2:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AFSiriActivationListener_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__AFSiriActivationListener_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AFSiriActivationListener_stop__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__AFSiriActivationListener_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)startWithDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AFSiriActivationListener_startWithDelegate___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __46__AFSiriActivationListener_startWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startWithDelegate:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFSiriActivationListener dealloc]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  [(AFSiriActivationListener *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AFSiriActivationListener;
  [(AFSiriActivationListener *)&v4 dealloc];
}

- (AFSiriActivationListener)initWithServicePort:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)AFSiriActivationListener;
  objc_super v4 = [(AFSiriActivationListener *)&v25 init];
  if (v4)
  {
    if (AFLogInitIfNeeded_once != -1) {
      dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
    }
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[AFSiriActivationListener initWithServicePort:]";
      __int16 v28 = 2048;
      __int16 v29 = (__CFString *)v4;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    if ((unint64_t)(a3 - 1) > 2)
    {
      if (AFIsHorseman_onceToken != -1) {
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
      }
      if (AFIsHorseman_isHorseman) {
        int64_t v9 = 2;
      }
      else {
        int64_t v9 = 1;
      }
      id v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = v10;
        if ((unint64_t)a3 > 3) {
          id v12 = @"(unknown)";
        }
        else {
          id v12 = off_1E5925428[a3];
        }
        __int16 v13 = v12;
        *(_DWORD *)buf = 136315394;
        id v27 = "-[AFSiriActivationListener initWithServicePort:]";
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming)", buf, 0x16u);

        id v10 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unint64_t v14 = v10;
        int v15 = off_1E5925428[v9];
        *(_DWORD *)buf = 136315394;
        id v27 = "-[AFSiriActivationListener initWithServicePort:]";
        __int16 v28 = 2112;
        __int16 v29 = v15;
        _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s servicePort = %@ (effective)", buf, 0x16u);
      }
      a3 = v9;
    }
    else
    {
      id v6 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        __int16 v7 = v6;
        id v8 = off_1E5925428[a3];
        *(_DWORD *)buf = 136315394;
        id v27 = "-[AFSiriActivationListener initWithServicePort:]";
        __int16 v28 = 2112;
        __int16 v29 = v8;
        _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s servicePort = %@ (incoming, effective)", buf, 0x16u);
      }
    }
    AFSiriActivationServiceGetMachServiceName(a3);
    unint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    __int16 v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "-[AFSiriActivationListener initWithServicePort:]";
      __int16 v28 = 2112;
      __int16 v29 = v16;
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s machServiceName = %@", buf, 0x16u);
    }
    id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.siri.activation.listener", v19);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v16];
    xpcListener = v4->_xpcListener;
    v4->_xpcListener = (NSXPCListener *)v22;

    [(NSXPCListener *)v4->_xpcListener _setQueue:v4->_queue];
    [(NSXPCListener *)v4->_xpcListener setDelegate:v4];
  }
  return v4;
}

@end