@interface UIImage(DocumentManager)
+ (id)doc_AppIconForHostBundleIdentifier:()DocumentManager;
@end

@implementation UIImage(DocumentManager)

+ (id)doc_AppIconForHostBundleIdentifier:()DocumentManager
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v3];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 128.0, 128.0, 2.0);
  v6 = (NSObject **)MEMORY[0x263F3AC28];
  v7 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315906;
    v17 = "+[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]";
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    v21 = v4;
    __int16 v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_21361D000, v7, OS_LOG_TYPE_DEBUG, "%s bundleIdentifier: %@ isIcon: %@ descriptor: %@", (uint8_t *)&v16, 0x2Au);
  }
  v8 = [v4 imageForDescriptor:v5];
  v9 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v9 = *v6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:].cold.4(v9);
  }
  if ([v8 placeholder])
  {
    v10 = [v4 prepareImageForDescriptor:v5];

    v11 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v11 = *v6;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]();
    }
  }
  else
  {
    v10 = v8;
  }
  if (v10)
  {
    v12 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:", objc_msgSend(v10, "CGImage"));
    v13 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v13 = *v6;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]();
    }
  }
  else
  {
    v12 = 0;
  }
  v14 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v14 = *v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]();
  }

  return v12;
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_21361D000, v2, OS_LOG_TYPE_DEBUG, "%s returning image: %@ for app with bundleIdentifier: %@", (uint8_t *)v3, 0x20u);
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21361D000, v0, OS_LOG_TYPE_DEBUG, "%s created result image: %@", (uint8_t *)v1, 0x16u);
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21361D000, v0, OS_LOG_TYPE_DEBUG, "%s was a placeholder. prepared new image: %@", (uint8_t *)v1, 0x16u);
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]";
  _os_log_debug_impl(&dword_21361D000, log, OS_LOG_TYPE_DEBUG, "%s imageForDescriptor returned image: (imageFromDescriptor) isPlaceholder: (imageFromDescriptor.placeholder)", (uint8_t *)&v1, 0xCu);
}

@end