@interface UIViewController(DOCDeprecated)
- (uint64_t)doc_deprecated_interfaceOrientation;
- (void)doc_deprecated_interfaceOrientation;
@end

@implementation UIViewController(DOCDeprecated)

- (uint64_t)doc_deprecated_interfaceOrientation
{
  v2 = [a1 viewIfLoaded];
  v3 = [v2 window];
  v4 = [v3 windowScene];
  v5 = [v4 screen];

  if (v5 && ([v5 _isEmbeddedScreen] & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"on external monitors, decisions should not be made using interfaceOrientation (which is always Portrait)"];
    v9 = DOCLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(UIViewController(DOCDeprecated) *)v8 doc_deprecated_interfaceOrientation];
    }
  }
  uint64_t v6 = [a1 interfaceOrientation];

  return v6;
}

- (void)doc_deprecated_interfaceOrientation
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 UTF8String];
  _os_log_fault_impl(&dword_222E2D000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v3, 0xCu);
}

@end