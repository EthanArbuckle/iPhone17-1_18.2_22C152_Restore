@interface FigCaptureOSStateHandle
+ (void)initialize;
- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5;
- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProviderBlock:(id)a5;
- (id)_initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5 dataProviderBlock:(id)a6;
- (id)debugDescription;
- (id)description;
- (os_state_data_s)_osStateData:(os_state_hints_s *)a3;
- (void)dealloc;
@end

@implementation FigCaptureOSStateHandle

- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5
{
  return (FigCaptureOSStateHandle *)[(FigCaptureOSStateHandle *)self _initWithTitle:a3 queue:a4 dataProvider:a5 dataProviderBlock:0];
}

- (id)_initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5 dataProviderBlock:(id)a6
{
  if (!((unint64_t)a5 | (unint64_t)a6))
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"A data provider or data provider block is required to create a FigCaptureOSStateHandle." userInfo:0]);
  }
  v17.receiver = self;
  v17.super_class = (Class)FigCaptureOSStateHandle;
  v10 = [(FigCaptureOSStateHandle *)&v17 init];
  if (v10)
  {
    v10->_title = (NSString *)a3;
    if (a4) {
      v11 = a4;
    }
    else {
      v11 = dispatch_get_global_queue(0, 0);
    }
    v10->_queue = (OS_dispatch_queue *)v11;
    if (a5)
    {
      v12 = [[FigWeakReference alloc] initWithReferencedObject:a5];
      uint64_t v13 = 24;
    }
    else
    {
      v12 = (FigWeakReference *)[a6 copy];
      uint64_t v13 = 32;
    }
    *(Class *)((char *)&v10->super.isa + v13) = (Class)v12;
    objc_initWeak(&location, v10);
    objc_copyWeak(&v15, &location);
    v10->_osStateHandle = os_state_add_handler();
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v10;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

uint64_t __79__FigCaptureOSStateHandle__initWithTitle_queue_dataProvider_dataProviderBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _osStateData:a2];
}

- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProviderBlock:(id)a5
{
  return (FigCaptureOSStateHandle *)[(FigCaptureOSStateHandle *)self _initWithTitle:a3 queue:a4 dataProvider:0 dataProviderBlock:a5];
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureOSStateHandle;
  [(FigCaptureOSStateHandle *)&v3 dealloc];
}

- (id)debugDescription
{
  return self->_title;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureOSStateHandle debugDescription](self, "debugDescription")];
}

- (os_state_data_s)_osStateData:(os_state_hints_s *)a3
{
  v22[24] = *MEMORY[0x1E4F143B8];
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v20 = v3;
    LODWORD(v19) = 0;
    FigDebugAssert3();
  }
  if (a3->var2 != 3) {
    return 0;
  }
  dataProviderWeakReference = self->_dataProviderWeakReference;
  if (dataProviderWeakReference) {
    uint64_t v8 = objc_msgSend(-[FigWeakReference referencedObject](dataProviderWeakReference, "referencedObject"), "osStatePropertyList");
  }
  else {
    uint64_t v8 = (*((uint64_t (**)(id, uint64_t))self->_dataProviderBlock + 2))(self->_dataProviderBlock, v6);
  }
  uint64_t v9 = v8;
  if (dword_1EB4C5770)
  {
    LODWORD(v22[0]) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v22[0] = 0;
  v11 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", v9, 100, 0, v22, v19, v20);
  if (v22[0])
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  uint64_t v13 = v11;
  if ((unint64_t)[v11 length] > 0x8000)
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_super v17 = (void *)[NSString stringWithFormat:@"CameraCapture - %@", self->_title, v21];
  uint64_t v18 = [v13 length];
  id v15 = (os_state_data_s *)malloc_type_calloc(1uLL, v18 + 200, 0x68C6FEF8uLL);
  [v17 UTF8String];
  __strlcpy_chk();
  v15->var0 = 1;
  v15->var1.var1 = v18;
  [v13 getBytes:v15->var4 length:v18];
  return v15;
}

@end