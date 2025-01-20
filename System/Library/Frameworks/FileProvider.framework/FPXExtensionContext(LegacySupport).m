@interface FPXExtensionContext(LegacySupport)
@end

@implementation FPXExtensionContext(LegacySupport)

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] importing item -> import document %@ in %@", (uint8_t *)&v3, 0x16u);
}

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 path];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fixed up filename to %@", (uint8_t *)&v4, 0xCu);
}

- (void)importDocumentAtURL:()LegacySupport intoFolderWithIdentifier:originalName:extensionInstance:reply:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  __int16 v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't import filename %@; %@",
    (uint8_t *)&v6,
    0x16u);
}

@end