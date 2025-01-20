@interface CSStateCapture
- (CSStateCapture)initWithName:(id)a3;
- (id)stateCaptureBlock;
- (os_state_data_s)_stateCapture;
- (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4;
- (unint64_t)handle;
- (void)dealloc;
- (void)registerHandlerforStateCapture;
- (void)setHandle:(unint64_t)a3;
- (void)setStateCaptureBlock:(id)a3;
- (void)unregisterHandlerforStateCapture;
@end

@implementation CSStateCapture

- (void).cxx_destruct
{
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setStateCaptureBlock:(id)a3
{
}

- (id)stateCaptureBlock
{
  return self->_stateCaptureBlock;
}

- (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSStateCapture stateDataForDictionary:title:]";
    __int16 v24 = 2112;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_debug_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEBUG, "%s Persisting the state for %@ data: \n %@", buf, 0x20u);
    if (v5) {
      goto LABEL_3;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  if (!v5) {
    goto LABEL_16;
  }
LABEL_3:
  id v21 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v21];
  id v9 = v21;
  if (v9)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSStateCapture stateDataForDictionary:title:]";
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Error serializing dictionary for State Capture: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    size_t v12 = [v8 length];
    v13 = (os_state_data_s *)malloc_type_calloc(1uLL, v12 + 200, 0x2E596361uLL);
    v11 = v13;
    if (v13)
    {
      v13->var0 = 1;
      v13->var1.var1 = v12;
      v14 = [v6 dataUsingEncoding:4];
      v15 = v14;
      if (v14)
      {
        id v16 = v14;
        v17 = (const void *)[v16 bytes];
        unint64_t v18 = [v16 length];
        if (v18 >= 0x3F) {
          size_t v19 = 63;
        }
        else {
          size_t v19 = v18;
        }
        memcpy(v11->var3, v17, v19);
      }
      memcpy(v11->var4, (const void *)[v8 bytes], v12);
    }
  }

LABEL_17:
  return v11;
}

- (os_state_data_s)_stateCapture
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[CSStateCapture _stateCapture]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting state capture", (uint8_t *)&v12, 0xCu);
  }
  v4 = [(CSStateCapture *)self stateCaptureBlock];

  if (v4)
  {
    id v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      v13 = "-[CSStateCapture _stateCapture]";
      _os_log_debug_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEBUG, "%s Running capture block", (uint8_t *)&v12, 0xCu);
    }
    id v6 = [(CSStateCapture *)self stateCaptureBlock];
    v4 = v6[2]();
  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[CSStateCapture _stateCapture]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished capturing state", (uint8_t *)&v12, 0xCu);
  }
  v8 = [v4 stateData];
  id v9 = [v4 stateDataTitle];
  v10 = [(CSStateCapture *)self stateDataForDictionary:v8 title:v9];

  return v10;
}

- (void)unregisterHandlerforStateCapture
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSStateCapture unregisterHandlerforStateCapture]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Removing state capture handler", (uint8_t *)&v4, 0xCu);
  }
  if ([(CSStateCapture *)self handle])
  {
    [(CSStateCapture *)self handle];
    os_state_remove_handler();
  }
}

- (void)registerHandlerforStateCapture
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSStateCapture registerHandlerforStateCapture]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Registering state capture handler", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v5, (id *)buf);
  [(CSStateCapture *)self setHandle:os_state_add_handler()];

  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

uint64_t __48__CSStateCapture_registerHandlerforStateCapture__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _stateCapture];

  return v3;
}

- (void)dealloc
{
  [(CSStateCapture *)self unregisterHandlerforStateCapture];
  v3.receiver = self;
  v3.super_class = (Class)CSStateCapture;
  [(CSStateCapture *)&v3 dealloc];
}

- (CSStateCapture)initWithName:(id)a3
{
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    v6.receiver = self;
    v6.super_class = (Class)CSStateCapture;
    self = [(CSStateCapture *)&v6 init];
    id v4 = self;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end