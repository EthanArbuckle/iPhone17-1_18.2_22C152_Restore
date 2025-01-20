@interface _SFSharablePasswordReceiver
+ (void)openPasswordManagerURL:(id)a3;
@end

@implementation _SFSharablePasswordReceiver

+ (void)openPasswordManagerURL:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F223E0];
  id v4 = a3;
  v5 = [v3 defaultWorkspace];
  id v9 = 0;
  char v6 = [v5 openSensitiveURL:v4 withOptions:0 error:&v9];

  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_SFSharablePasswordReceiver openPasswordManagerURL:](v8, v7);
    }
  }
}

+ (void)openPasswordManagerURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  char v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to open to password manager URL with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end