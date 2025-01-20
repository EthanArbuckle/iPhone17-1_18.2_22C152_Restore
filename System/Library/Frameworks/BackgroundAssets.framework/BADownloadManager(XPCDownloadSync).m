@interface BADownloadManager(XPCDownloadSync)
@end

@implementation BADownloadManager(XPCDownloadSync)

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.4()
{
  OUTLINED_FUNCTION_3();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to remove cloned file failing to be marked as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.5()
{
  OUTLINED_FUNCTION_3();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to mark cloned file as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.6()
{
  OUTLINED_FUNCTION_3();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226E14000, v3, v4, "Download %{public}@ failed to be cloned after download. Error:%{public}@", v5, v6, v7, v8, v9);
}

@end