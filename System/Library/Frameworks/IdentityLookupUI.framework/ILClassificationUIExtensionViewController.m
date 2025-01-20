@interface ILClassificationUIExtensionViewController
- (ILClassificationResponse)classificationResponseForRequest:(ILClassificationRequest *)request;
- (void)prepareForClassificationRequest:(ILClassificationRequest *)request;
@end

@implementation ILClassificationUIExtensionViewController

- (void)prepareForClassificationRequest:(ILClassificationRequest *)request
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = ILDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[ILClassificationUIExtensionViewController prepareForClassificationRequest:]";
    _os_log_impl(&dword_2375F8000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Client did not override %s", (uint8_t *)&v4, 0xCu);
  }
}

- (ILClassificationResponse)classificationResponseForRequest:(ILClassificationRequest *)request
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F0EF70]) initWithClassificationAction:0];
  int v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[ILClassificationUIExtensionViewController classificationResponseForRequest:]";
    __int16 v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_2375F8000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Client did not override %s, returning empty response: %@", (uint8_t *)&v6, 0x16u);
  }

  return (ILClassificationResponse *)v3;
}

@end