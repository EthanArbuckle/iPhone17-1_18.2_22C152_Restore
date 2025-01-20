@interface _EXLoadOperator
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
- (_EXLoadOperator)initWithCoder:(id)a3;
- (_EXLoadOperator)initWithItemProvider:(id)a3;
- (id)_init;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6;
- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5;
@end

@implementation _EXLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33___EXLoadOperator_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken_0 != -1) {
      dispatch_once(&allocWithZone__onceToken_0, block);
    }
    v6 = (void *)allocWithZone__factory_0;
    return v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____EXLoadOperator;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXLoadOperator;
  return [(_EXLoadOperator *)&v3 init];
}

- (_EXLoadOperator)initWithItemProvider:(id)a3
{
  id v4 = a3;
  v5 = [[_EXSourceLoadOperator alloc] initWithItemProvider:v4];

  return &v5->super;
}

- (_EXLoadOperator)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315650;
    objc_super v7 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    __int16 v8 = 1024;
    int v9 = 78;
    __int16 v10 = 2080;
    v11 = "-[_EXLoadOperator initWithCoder:]";
  }

  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315650;
    int v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    __int16 v7 = 1024;
    int v8 = 83;
    __int16 v9 = 2080;
    __int16 v10 = "-[_EXLoadOperator encodeWithCoder:]";
  }

  __break(1u);
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = _EXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = NSStringFromClass(a5);
    int v15 = 136315906;
    v16 = "-[_EXLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
    __int16 v17 = 2112;
    *(void *)v18 = v9;
    *(_WORD *)&v18[8] = 2112;
    *(void *)&v18[10] = v13;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_debug_impl(&dword_191F29000, v12, OS_LOG_TYPE_DEBUG, "%s typeIdentifier: %@ expectedValueClass: %@ options: %@", (uint8_t *)&v15, 0x2Au);
  }
  v14 = _EXDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    int v15 = 136315650;
    v16 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSu"
          "pport/ItemProvider/EXLoadOperator.m";
    __int16 v17 = 1024;
    *(_DWORD *)v18 = 89;
    *(_WORD *)&v18[4] = 2080;
    *(void *)&v18[6] = "-[_EXLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
  }

  __break(1u);
}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _EXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = NSStringFromClass(a4);
    int v12 = 136315650;
    v13 = "-[_EXLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
    __int16 v14 = 2112;
    *(void *)int v15 = v10;
    *(_WORD *)&v15[8] = 2112;
    *(void *)&v15[10] = v8;
    _os_log_debug_impl(&dword_191F29000, v9, OS_LOG_TYPE_DEBUG, "%s expectedValueClass: %@ options: %@", (uint8_t *)&v12, 0x20u);
  }
  id v11 = _EXDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v12 = 136315650;
    v13 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSu"
          "pport/ItemProvider/EXLoadOperator.m";
    __int16 v14 = 1024;
    *(_DWORD *)int v15 = 94;
    *(_WORD *)&v15[4] = 2080;
    *(void *)&v15[6] = "-[_EXLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
  }

  __break(1u);
}

@end