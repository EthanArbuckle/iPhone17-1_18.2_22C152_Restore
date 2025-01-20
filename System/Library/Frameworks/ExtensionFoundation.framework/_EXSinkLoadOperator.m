@interface _EXSinkLoadOperator
+ (BOOL)supportsSecureCoding;
- (NSXPCListenerEndpoint)endpoint;
- (_EXSinkLoadOperator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6;
- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5;
- (void)setEndpoint:(id)a3;
@end

@implementation _EXSinkLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSinkLoadOperator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSinkLoadOperator;
  v5 = [(_EXLoadOperator *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315650;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    __int16 v7 = 1024;
    int v8 = 229;
    __int16 v9 = 2080;
    v10 = "-[_EXSinkLoadOperator encodeWithCoder:]";
    _os_log_fault_impl(&dword_191F29000, v4, OS_LOG_TYPE_FAULT, "%s - %d: %s unexpected call in destination process", (uint8_t *)&v5, 0x1Cu);
  }

  __break(1u);
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = _EXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v31 = NSStringFromClass(a5);
    *(_DWORD *)buf = 136446978;
    v42 = "-[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
    __int16 v43 = 2114;
    id v44 = v10;
    __int16 v45 = 2114;
    v46 = v31;
    __int16 v47 = 2114;
    id v48 = v12;
    _os_log_debug_impl(&dword_191F29000, v13, OS_LOG_TYPE_DEBUG, "%{public}s typeIdentifier: %{public}@ expectedValueClass: %{public}@ options: %{public}@", buf, 0x2Au);
  }
  if (!a5)
  {
    v16 = +[_EXDefaults sharedInstance];
    v17 = [v16 itemProviderTypes];

    v14 = _EXDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]();
    }
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v18 = +[_EXDefaults sharedInstance];
    v17 = [v18 itemProviderTypes];

    v14 = _EXDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]();
    }
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = a5;
    v40[1] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v15 = [v19 setWithArray:v14];
    goto LABEL_14;
  }
  if (([(objc_class *)a5 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || [(objc_class *)a5 isSubclassOfClass:objc_opt_class()])
  {
    v14 = +[_EXDefaults sharedInstance];
    uint64_t v15 = [v14 plistAndValueTypes];
LABEL_14:
    v17 = (void *)v15;
LABEL_15:

    goto LABEL_16;
  }
  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:a5];
LABEL_16:
  v20 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E9840];
  [v20 setClasses:v17 forSelector:sel_resolveWithIdentifier_className_options_reply_ argumentIndex:0 ofReply:1];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_endpoint];
  [v21 setRemoteObjectInterface:v20];
  [v21 resume];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke;
  v36[3] = &unk_1E573CE00;
  id v22 = v11;
  id v37 = v22;
  v23 = [v21 remoteObjectProxyWithErrorHandler:v36];
  v24 = NSStringFromClass(a5);
  if (v24)
  {
    v25 = [v12 objectForKeyedSubscript:@"com.apple.Foundation.NSItemProviderExpectedClass"];
    v26 = v25;
    if (!v25 || ![v25 length])
    {
      v38 = @"com.apple.Foundation.NSItemProviderExpectedClass";
      v39 = v24;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

      id v12 = (id)v27;
    }
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_126;
  v32[3] = &unk_1E573D928;
  id v33 = v24;
  id v34 = v10;
  id v35 = v22;
  id v28 = v22;
  id v29 = v10;
  id v30 = v24;
  [v23 resolveWithIdentifier:v29 className:v30 options:v12 reply:v32];
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _EXDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_EXSinkLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:](a4, (uint64_t)v9, v10);
  }

  id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2E9840];
  id v12 = +[_EXDefaults sharedInstance];
  v13 = [v12 plistTypes];
  [v11 setClasses:v13 forSelector:sel_previewImageWithClassName_options_reply_ argumentIndex:2 ofReply:0];

  v14 = +[_EXDefaults sharedInstance];
  uint64_t v15 = [v14 imageTypes];
  [v11 setClasses:v15 forSelector:sel_previewImageWithClassName_options_reply_ argumentIndex:0 ofReply:1];

  v16 = +[_EXDefaults sharedInstance];
  v17 = [v16 errorTypes];
  [v11 setClasses:v17 forSelector:sel_previewImageWithClassName_options_reply_ argumentIndex:1 ofReply:1];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_endpoint];
  [v18 setRemoteObjectInterface:v11];
  [v18 resume];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke;
  v25[3] = &unk_1E573CE00;
  id v19 = v8;
  id v26 = v19;
  v20 = [v18 remoteObjectProxyWithErrorHandler:v25];
  v21 = NSStringFromClass(a4);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke_129;
  v23[3] = &unk_1E573D950;
  id v24 = v19;
  id v22 = v19;
  [v20 previewImageWithClassName:v21 options:v9 reply:v23];
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1_4();
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%{public}s nil expectedValueClass allowing %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1_4();
}

- (void)loadPreviewImageWithCompletionHandler:(objc_class *)a1 expectedValueClass:(uint64_t)a2 options:(NSObject *)a3 .cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromClass(a1);
  int v6 = 136315650;
  __int16 v7 = "-[_EXSinkLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_191F29000, a3, OS_LOG_TYPE_DEBUG, "%s expectedValueClass: %@ options: %@", (uint8_t *)&v6, 0x20u);
}

@end