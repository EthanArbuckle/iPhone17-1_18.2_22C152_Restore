@interface ILMessageFilterExtension
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation ILMessageFilterExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21DAC7000, v4, OS_LOG_TYPE_DEFAULT, "context: %@", (uint8_t *)&v5, 0xCu);
  }
}

@end