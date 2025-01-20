@interface _EXSourceLoadOperator
+ (BOOL)supportsSecureCoding;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)classForCoder;
- (NSItemProvider)itemProvider;
- (NSXPCListener)listener;
- (_EXSourceLoadOperator)initWithCoder:(id)a3;
- (_EXSourceLoadOperator)initWithItemProvider:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)previewImageWithClassName:(id)a3 options:(id)a4 reply:(id)a5;
- (void)resolveWithIdentifier:(id)a3 className:(id)a4 options:(id)a5 reply:(id)a6;
- (void)setListener:(id)a3;
@end

@implementation _EXSourceLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSourceLoadOperator)initWithItemProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSourceLoadOperator;
  v5 = [(_EXLoadOperator *)&v10 _init];
  v6 = (_EXSourceLoadOperator *)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 1, v4);
    uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v7;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
  }

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_EXSourceLoadOperator)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v8 = 136315650;
    v9 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    __int16 v10 = 1024;
    int v11 = 122;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_fault_impl(&dword_191F29000, v4, OS_LOG_TYPE_FAULT, "%s - %d: %@ cannot be decoded", (uint8_t *)&v8, 0x1Cu);
  }
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  listener = self->_listener;
  id v4 = a3;
  id v5 = [(NSXPCListener *)listener endpoint];
  [v4 encodeObject:v5 forKey:@"endpoint"];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  uint64_t v7 = [v5 interfaceWithProtocol:&unk_1EE2E9840];
  int v8 = +[_EXDefaults sharedInstance];
  v9 = [v8 plistAndValueTypes];
  [v7 setClasses:v9 forSelector:sel_resolveWithIdentifier_className_options_reply_ argumentIndex:2 ofReply:0];

  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)resolveWithIdentifier:(id)a3 className:(id)a4 options:(id)a5 reply:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = (NSString *)a4;
  id v12 = a5;
  id v13 = a6;
  long long v34 = 0u;
  long long v35 = 0u;
  v14 = [MEMORY[0x1E4F29268] currentConnection];
  v15 = v14;
  if (v14)
  {
    [v14 auditToken];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }

  Class v16 = NSClassFromString(v11);
  Class v17 = v16;
  if (v11 && !v16)
  {
    v18 = _EXDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v11;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke;
  v25[3] = &unk_1E573D8D8;
  id v26 = WeakRetained;
  id v27 = v10;
  long long v32 = v34;
  long long v33 = v35;
  id v28 = v12;
  v29 = v11;
  id v30 = v13;
  Class v31 = v17;
  id v20 = v13;
  v21 = v11;
  id v22 = v12;
  id v23 = v10;
  id v24 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v25);
}

- (void)previewImageWithClassName:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (NSString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);
  Class v12 = NSClassFromString(v10);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke;
  v16[3] = &unk_1E573D900;
  id v17 = WeakRetained;
  id v18 = v8;
  id v19 = v9;
  Class v20 = v12;
  id v13 = v9;
  id v14 = v8;
  id v15 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

- (NSItemProvider)itemProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemProvider);

  return (NSItemProvider *)WeakRetained;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_itemProvider);
}

@end