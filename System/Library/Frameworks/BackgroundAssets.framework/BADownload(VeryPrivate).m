@interface BADownload(VeryPrivate)
@end

@implementation BADownload(VeryPrivate)

- (void)cloneDownloadToFinalDestinationURL:()VeryPrivate error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 applicationGroupIdentifier];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_226E14000, a2, OS_LOG_TYPE_ERROR, "Failed to load container for app group identifier: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end