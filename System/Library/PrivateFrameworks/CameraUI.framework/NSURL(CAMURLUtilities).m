@interface NSURL(CAMURLUtilities)
- (CAMURLConfigurationRequest)configurationRequest;
- (id)_caseSensitiveQueryKeysAndValues;
- (uint64_t)isConfigurationURL;
- (void)configurationRequest;
@end

@implementation NSURL(CAMURLUtilities)

- (uint64_t)isConfigurationURL
{
  v1 = [a1 host];
  uint64_t v2 = [v1 isEqualToString:CAMURLUtilitiesConfigurationURLHost];

  return v2;
}

- (CAMURLConfigurationRequest)configurationRequest
{
  uint64_t v2 = [a1 _caseSensitiveQueryKeysAndValues];
  v3 = [[CAMURLConfigurationRequest alloc] initWithQueryDictionary:v2];
  if (!v3)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(NSURL(CAMURLUtilities) *)a1 configurationRequest];
    }
  }
  return v3;
}

- (id)_caseSensitiveQueryKeysAndValues
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v1 = [MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v2 = [v1 queryItems];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v14);
        v11 = [v9 value];
        if ([v10 length] && objc_msgSend(v11, "length")) {
          [v3 setObject:v11 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return v12;
}

- (void)configurationRequest
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 absoluteString];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Invalid or incomplete camera configuration URL: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end