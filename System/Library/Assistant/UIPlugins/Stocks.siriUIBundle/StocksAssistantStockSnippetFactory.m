@interface StocksAssistantStockSnippetFactory
- (id)viewControllerForSnippet:(id)a3;
@end

@implementation StocksAssistantStockSnippetFactory

- (id)viewControllerForSnippet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[StocksAssistantStockSnippetController alloc] initWithAceObject:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Expected SAStockSnippet, got %@", (uint8_t *)&v6, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

@end