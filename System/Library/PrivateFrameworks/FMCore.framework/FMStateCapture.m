@interface FMStateCapture
- (FMStateCapture)init;
- (id)stateCaptureBlock;
- (os_state_data_s)_stateCapture;
- (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4;
- (unint64_t)handle;
- (void)_stateCapture;
- (void)dealloc;
- (void)registerHandlerforStateCapture;
- (void)setHandle:(unint64_t)a3;
- (void)setStateCaptureBlock:(id)a3;
- (void)unregisterHandlerforStateCapture;
@end

@implementation FMStateCapture

- (FMStateCapture)init
{
  v3 = +[FMSystemInfo sharedInstance];
  if ([v3 isInternalBuild])
  {
    v7.receiver = self;
    v7.super_class = (Class)FMStateCapture;
    self = [(FMStateCapture *)&v7 init];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5) {
    [(FMStateCapture *)v5 registerHandlerforStateCapture];
  }
  return v5;
}

- (void)dealloc
{
  [(FMStateCapture *)self unregisterHandlerforStateCapture];
  v3.receiver = self;
  v3.super_class = (Class)FMStateCapture;
  [(FMStateCapture *)&v3 dealloc];
}

- (void)registerHandlerforStateCapture
{
  objc_super v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Registering State Capture Handler.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v5, buf);
  [(FMStateCapture *)self setHandle:os_state_add_handler()];

  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

uint64_t __48__FMStateCapture_registerHandlerforStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _stateCapture];

  return v2;
}

- (void)unregisterHandlerforStateCapture
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = [(FMStateCapture *)self handle];
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Removing State Capture Handler %llu.", (uint8_t *)&v4, 0xCu);
  }

  if ([(FMStateCapture *)self handle])
  {
    [(FMStateCapture *)self handle];
    os_state_remove_handler();
  }
}

- (os_state_data_s)_stateCapture
{
  objc_super v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0EC4000, v3, OS_LOG_TYPE_DEFAULT, "FMStateCapture: Starting State Capture...", buf, 2u);
  }

  int v4 = (void *)[&unk_1F270A7F8 mutableCopy];
  unint64_t v5 = [(FMStateCapture *)self stateCaptureBlock];

  if (v5)
  {
    uint64_t v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FMStateCapture _stateCapture](v6);
    }

    objc_super v7 = [(FMStateCapture *)self stateCaptureBlock];
    v8 = v7[2]();
    [v4 setValuesForKeysWithDictionary:v8];
  }
  v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1D0EC4000, v9, OS_LOG_TYPE_DEFAULT, "FMStateCapture: finished capturing state.", v16, 2u);
  }

  v10 = NSString;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 bundleIdentifier];
  v13 = [v10 stringWithFormat:@"[%@] state", v12];
  v14 = [(FMStateCapture *)self stateDataForDictionary:v4 title:v13];

  return v14;
}

- (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FMStateCapture stateDataForDictionary:title:]((uint64_t)v6, (uint64_t)v5, v7);
  }

  if (v5)
  {
    id v20 = 0;
    v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v20];
    id v9 = v20;
    if (v9)
    {
      v10 = LogCategory_Unspecified();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_1D0EC4000, v10, OS_LOG_TYPE_DEFAULT, "Error serializing dictionary for State Capture: %@", buf, 0xCu);
      }
      v11 = 0;
    }
    else
    {
      size_t v12 = [v8 length];
      v13 = (os_state_data_s *)malloc_type_calloc(1uLL, v12 + 200, 0x60E97206uLL);
      v11 = v13;
      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      v13->var0 = 1;
      v13->var1.var1 = v12;
      v14 = [v6 dataUsingEncoding:4];
      v10 = v14;
      if (v14)
      {
        v15 = v14;
        v16 = (const void *)[v15 bytes];
        unint64_t v17 = [v15 length];
        if (v17 >= 0x3F) {
          size_t v18 = 63;
        }
        else {
          size_t v18 = v17;
        }
        memcpy(v11->var3, v16, v18);
      }
      memcpy(v11->var4, (const void *)[v8 bytes], v12);
    }

    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)stateCaptureBlock
{
  return self->_stateCaptureBlock;
}

- (void)setStateCaptureBlock:(id)a3
{
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (void).cxx_destruct
{
}

- (void)_stateCapture
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "FMStateCapture: running capture block", v1, 2u);
}

- (void)stateDataForDictionary:(os_log_t)log title:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_DEBUG, "FMStateCapture: Persisting the state for %@ data: \n %@", (uint8_t *)&v3, 0x16u);
}

@end