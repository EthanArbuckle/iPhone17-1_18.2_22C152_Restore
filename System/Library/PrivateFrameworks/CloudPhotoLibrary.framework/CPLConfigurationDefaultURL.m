@interface CPLConfigurationDefaultURL
@end

@implementation CPLConfigurationDefaultURL

void ___CPLConfigurationDefaultURL_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/cloudphotos/cloudphotos-1.0.plist"];
  v1 = (void *)_CPLConfigurationDefaultURL_url;
  _CPLConfigurationDefaultURL_url = v0;

  if (!_CPLConfigurationDefaultURL_url)
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_ERROR, "Invalid built-in configuration URL", v6, 2u);
      }
    }
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"NSURL * _Nonnull _CPLConfigurationDefaultURL(void)_block_invoke"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfiguration.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:35 description:@"Invalid built-in configuration URL"];

    abort();
  }
}

@end