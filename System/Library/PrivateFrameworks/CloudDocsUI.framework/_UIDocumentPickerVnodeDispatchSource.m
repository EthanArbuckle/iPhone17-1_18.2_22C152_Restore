@interface _UIDocumentPickerVnodeDispatchSource
- (NSURL)url;
- (_UIDocumentPickerVnodeDispatchSource)initWithTarget:(id)a3 url:(id)a4 queue:(id)a5;
- (id)description;
- (void)dealloc;
- (void)event;
- (void)invalidate;
@end

@implementation _UIDocumentPickerVnodeDispatchSource

- (_UIDocumentPickerVnodeDispatchSource)initWithTarget:(id)a3 url:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_UIDocumentPickerVnodeDispatchSource;
  v11 = [(_UIDocumentPickerVnodeDispatchSource *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_target, v8);
    objc_storeStrong((id *)&v12->_url, a4);
    int v13 = open((const char *)[v9 fileSystemRepresentation], 0x8000);
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8410], v13, 2uLL, v10);
    source = v12->_source;
    v12->_source = (OS_dispatch_source *)v14;

    objc_initWeak(&location, v12);
    v16 = v12->_source;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __65___UIDocumentPickerVnodeDispatchSource_initWithTarget_url_queue___block_invoke;
    handler[3] = &unk_26492D420;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v16, handler);
    v17 = v12->_source;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65___UIDocumentPickerVnodeDispatchSource_initWithTarget_url_queue___block_invoke_2;
    v19[3] = &__block_descriptor_36_e5_v8__0l;
    int v20 = v13;
    dispatch_source_set_cancel_handler(v17, v19);
    dispatch_resume((dispatch_object_t)v12->_source);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (void)event
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained dispatchSourceDidReceiveEvent:self];
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  source = self->_source;
  self->_source = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerVnodeDispatchSource;
  [(_UIDocumentPickerVnodeDispatchSource *)&v2 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>, %@", objc_opt_class(), self, self->_url];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_target);

  objc_storeStrong((id *)&self->_source, 0);
}

@end