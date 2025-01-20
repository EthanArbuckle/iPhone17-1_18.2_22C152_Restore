@interface BLSHInternalTapToRadarDialog
- (BLSHInternalTapToRadarDialog)initWithDescriptor:(id)a3 log:(id)a4;
- (BLSHTapToRadarDescriptor)descriptor;
- (BOOL)_shouldIgnore;
- (void)_alertDidDismiss:(int64_t)a3;
- (void)_cancel;
- (void)_file;
- (void)_gotError;
- (void)_ignore;
- (void)callCompletion:(BOOL)a3 shouldTryAgain:(BOOL)a4;
- (void)presentWithCompletion:(id)a3;
@end

@implementation BLSHInternalTapToRadarDialog

- (BLSHInternalTapToRadarDialog)initWithDescriptor:(id)a3 log:(id)a4
{
  id v7 = a3;
  v8 = a4;
  v9 = v8;
  if (__dialog)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BLSHInternalTapToRadarDialog initWithDescriptor:log:](v9);
    }
    v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BLSHInternalTapToRadarDialog;
    v11 = [(BLSHInternalTapToRadarDialog *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_descriptor, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong((id *)&__dialog, p_isa);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (void)presentWithCompletion:(id)a3
{
  v20[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ((os_variant_has_internal_ui() & 1) == 0)
  {
LABEL_5:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_10;
  }
  if ([(BLSHInternalTapToRadarDialog *)self _shouldIgnore])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[BLSHInternalTapToRadarDialog presentWithCompletion:]((uint64_t)self, log);
    }
    goto LABEL_5;
  }
  v6 = [(BLSHTapToRadarDescriptor *)self->_descriptor ttrPromptMessage];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(BLSHTapToRadarDescriptor *)self->_descriptor radarDescription];
  }
  v9 = v8;

  v19[0] = *MEMORY[0x263EFFFC8];
  v10 = [(BLSHTapToRadarDescriptor *)self->_descriptor ttrPromptHeader];
  uint64_t v11 = *MEMORY[0x263EFFFD8];
  v20[0] = v10;
  v20[1] = v9;
  uint64_t v12 = *MEMORY[0x263F00000];
  v19[1] = v11;
  v19[2] = v12;
  uint64_t v13 = *MEMORY[0x263EFFFE8];
  v20[2] = @"File Radar";
  v20[3] = @"Ignore";
  uint64_t v14 = *MEMORY[0x263F00020];
  v19[3] = v13;
  v19[4] = v14;
  v20[4] = @"Don't Ask Again";
  CFDictionaryRef v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];

  presentWithCompletion____blsAlertUserNotification = (uint64_t)CFUserNotificationCreate(0, 0.0, 3uLL, 0, v15);
  presentWithCompletion____blsWatchdogAlertRunLoopSource = (uint64_t)CFUserNotificationCreateRunLoopSource(0, (CFUserNotificationRef)presentWithCompletion____blsAlertUserNotification, (CFUserNotificationCallBack)_blsAlertCallback, 99);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, (CFRunLoopSourceRef)presentWithCompletion____blsWatchdogAlertRunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  v17 = (void *)[v4 copy];
  id completion = self->_completion;
  self->_id completion = v17;

LABEL_10:
}

- (void)_alertDidDismiss:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = (void *)__dialog;
  __dialog = 0;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEFAULT, "_alertDidDismiss: ttrDialogResult=%ld", (uint8_t *)&v8, 0xCu);
  }
  switch(a3)
  {
    case 0:
      [(BLSHInternalTapToRadarDialog *)self _cancel];
      break;
    case 1:
      [(BLSHInternalTapToRadarDialog *)self _file];
      break;
    case 2:
      [(BLSHInternalTapToRadarDialog *)self _ignore];
      break;
    case 3:
      [(BLSHInternalTapToRadarDialog *)self _gotError];
      break;
    default:
      id v7 = self->_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BLSHInternalTapToRadarDialog _alertDidDismiss:](a3, v7);
      }
      break;
  }
}

- (void)_file
{
  objc_initWeak(&location, self);
  descriptor = self->_descriptor;
  log = self->_log;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__BLSHInternalTapToRadarDialog__file__block_invoke;
  v5[3] = &unk_264533640;
  objc_copyWeak(&v6, &location);
  +[BLSHTapToRadarFiler fileRadar:descriptor log:log completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __37__BLSHInternalTapToRadarDialog__file__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a3) {
    uint64_t v6 = a2 ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  [WeakRetained callCompletion:a2 shouldTryAgain:v6];
}

- (BOOL)_shouldIgnore
{
  unint64_t v2 = [(BLSHTapToRadarDescriptor *)self->_descriptor designation];

  return +[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:v2];
}

- (void)_ignore
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    int v5 = 138412290;
    uint64_t v6 = descriptor;
    _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEFAULT, "adding %@ to Tap-To-Radar ignore list", (uint8_t *)&v5, 0xCu);
  }
  +[BLSHInternalTapToRadarIgnorer ignoreRadarDesignation:[(BLSHTapToRadarDescriptor *)self->_descriptor designation]];
  [(BLSHInternalTapToRadarDialog *)self callCompletion:0 shouldTryAgain:0];
}

- (void)_cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    int v5 = 138412290;
    uint64_t v6 = descriptor;
    _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEFAULT, "cancelling %@", (uint8_t *)&v5, 0xCu);
  }
  [(BLSHInternalTapToRadarDialog *)self callCompletion:0 shouldTryAgain:0];
}

- (void)_gotError
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    int v5 = 138412290;
    uint64_t v6 = descriptor;
    _os_log_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEFAULT, "got error trying to prompt for tap-to-radar. will try again later %@", (uint8_t *)&v5, 0xCu);
  }
  [(BLSHInternalTapToRadarDialog *)self callCompletion:0 shouldTryAgain:1];
}

- (void)callCompletion:(BOOL)a3 shouldTryAgain:(BOOL)a4
{
}

void __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (*(void *)(v2 + 24))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      int v5 = *(unsigned __int8 *)(a1 + 41);
      v8[0] = 67109376;
      v8[1] = v4;
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_DEFAULT, "Tap-To-Radar dialog calling completion radarWasFiled:%{BOOL}u shouldTryAgain:%{BOOL}u", (uint8_t *)v8, 0xEu);
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke_cold_1(a1, v3);
  }
}

- (BLSHTapToRadarDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(os_log_t)log log:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21FCFC000, log, OS_LOG_TYPE_FAULT, "only one BLSHInternalTapToRadarDialog at a time", v1, 2u);
}

- (void)presentWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "ignoring Tap-To-Radar %@ per previous user request", (uint8_t *)&v3, 0xCu);
}

- (void)_alertDidDismiss:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "Got unpexpected response in _alertDidDismiss(): %ld", (uint8_t *)&v2, 0xCu);
}

void __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(unsigned __int8 *)(a1 + 41);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "Tap-To-Radar dialog asked to call nil completion radarWasFiled:%{BOOL}u shouldTryAgain:%{BOOL}u", (uint8_t *)v4, 0xEu);
}

@end