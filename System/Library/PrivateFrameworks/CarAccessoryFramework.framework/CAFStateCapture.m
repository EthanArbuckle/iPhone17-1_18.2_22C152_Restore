@interface CAFStateCapture
- (CAFStateCapture)initWithIdentifier:(id)a3 capture:(id)a4;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)capture;
- (id)description;
- (os_state_data_s)stateCapture;
- (unint64_t)handler;
- (void)dealloc;
- (void)setCapture:(id)a3;
- (void)setHandler:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)stateCapture;
@end

@implementation CAFStateCapture

- (CAFStateCapture)initWithIdentifier:(id)a3 capture:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = CAFGeneralLogging();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (!v9)
  {
    v10 = CAFStateCaptureLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2080;
      v28 = "-[CAFStateCapture initWithIdentifier:capture:]";
      _os_log_impl(&dword_249710000, v10, OS_LOG_TYPE_INFO, "%@ %s disabled", buf, 0x16u);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)CAFStateCapture;
  v11 = [(CAFStateCapture *)&v24 init];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = MEMORY[0x24C5AA7C0](v7);
    id capture = v11->_capture;
    v11->_id capture = (id)v14;

    v16 = CAFStateCaptureLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v11;
      __int16 v27 = 2080;
      v28 = "-[CAFStateCapture initWithIdentifier:capture:]";
      _os_log_impl(&dword_249710000, v16, OS_LOG_TYPE_INFO, "%@ %s", buf, 0x16u);
    }

    id v17 = [NSString stringWithFormat:@"com.apple.caraccessoryframework.StateCapture-%@-%p", v11->_identifier, v11];
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v20;

    objc_initWeak((id *)buf, v11);
    objc_copyWeak(&v23, (id *)buf);
    v11->_handler = os_state_add_handler();
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

uint64_t __46__CAFStateCapture_initWithIdentifier_capture___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = CAFStateCaptureLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = WeakRetained;
    _os_log_impl(&dword_249710000, v4, OS_LOG_TYPE_INFO, "%@ got called os_state_add_handler", (uint8_t *)&v7, 0xCu);
  }

  if (WeakRetained && *(_DWORD *)(a2 + 16) == 3) {
    uint64_t v5 = [WeakRetained stateCapture];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  if ([(CAFStateCapture *)self handler])
  {
    [(CAFStateCapture *)self handler];
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)CAFStateCapture;
  [(CAFStateCapture *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CAFStateCapture *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p identifier=%@>", v4, self, v5];

  return v6;
}

- (os_state_data_s)stateCapture
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CAFStateCapture *)self capture];
  uint64_t v4 = v3[2]();

  int v17 = 0;
  uint64_t v5 = (void *)MEMORY[0x24C5AA420](v4, 0, &v17);
  id v6 = v5;
  if (v17)
  {
    int v7 = CAFStateCaptureLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CAFStateCapture *)(uint64_t)self stateCapture];
    }
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)[v5 length] >= 0x7D01)
  {
    int v7 = CAFStateCaptureLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CAFStateCapture *)(uint64_t)self stateCapture];
    }
    goto LABEL_12;
  }
  unsigned int v8 = [v6 length];
  size_t v9 = v8;
  v10 = (os_state_data_s *)malloc_type_calloc(1uLL, v8 + 200, 0x753F5A3DuLL);
  if (!v10)
  {
    int v7 = CAFStateCaptureLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CAFStateCapture *)(uint64_t)self stateCapture];
    }
    goto LABEL_12;
  }
  v11 = v10;
  v10->var0 = 3;
  __strlcpy_chk();
  uint64_t v12 = (objc_class *)objc_opt_class();
  class_getName(v12);
  __strlcpy_chk();
  v11->var1.var1 = v8;
  id v13 = [(CAFStateCapture *)self identifier];
  [v13 UTF8String];
  __strlcpy_chk();

  id v14 = v6;
  memcpy(v11->var4, (const void *)[v14 bytes], v9);
  int v7 = CAFStateCaptureLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v14 length];
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    _os_log_impl(&dword_249710000, v7, OS_LOG_TYPE_INFO, "%@ captured state data.length=%lu", buf, 0x16u);
  }
LABEL_13:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)capture
{
  return self->_capture;
}

- (void)setCapture:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)handler
{
  return self->_handler;
}

- (void)setHandler:(unint64_t)a3
{
  self->_handler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_capture, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)stateCapture
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%@ Error serializing dictionary for State Capture: %d", (uint8_t *)&v4, 0x12u);
}

@end