@interface CCUIContentModulePresentationContext
+ (id)defaultAlertPresentationContext;
+ (id)defaultControlCenterPresentationContext;
+ (id)defaultControlCenterPresentationContextProtectingSensitiveUI;
- (CCUIContentModulePresentationContext)initWithEnvironment:(int64_t)a3;
- (int64_t)environment;
- (unint64_t)hash;
@end

@implementation CCUIContentModulePresentationContext

+ (id)defaultControlCenterPresentationContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CCUIContentModulePresentationContext_defaultControlCenterPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultControlCenterPresentationContext_onceToken != -1) {
    dispatch_once(&defaultControlCenterPresentationContext_onceToken, block);
  }
  v2 = (void *)defaultControlCenterPresentationContext_defaultControlCenterPresentationContext;
  return v2;
}

uint64_t __79__CCUIContentModulePresentationContext_defaultControlCenterPresentationContext__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithEnvironment:0];
  uint64_t v2 = defaultControlCenterPresentationContext_defaultControlCenterPresentationContext;
  defaultControlCenterPresentationContext_defaultControlCenterPresentationContext = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)defaultControlCenterPresentationContextProtectingSensitiveUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__CCUIContentModulePresentationContext_defaultControlCenterPresentationContextProtectingSensitiveUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultControlCenterPresentationContextProtectingSensitiveUI_onceToken != -1) {
    dispatch_once(&defaultControlCenterPresentationContextProtectingSensitiveUI_onceToken, block);
  }
  uint64_t v2 = (void *)defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI;
  return v2;
}

uint64_t __100__CCUIContentModulePresentationContext_defaultControlCenterPresentationContextProtectingSensitiveUI__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithEnvironment:1];
  uint64_t v2 = defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI;
  defaultControlCenterPresentationContextProtectingSensitiveUI_defaultControlCenterPresentationContextProtectingSensitiveUI = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)defaultAlertPresentationContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CCUIContentModulePresentationContext_defaultAlertPresentationContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultAlertPresentationContext_onceToken[0] != -1) {
    dispatch_once(defaultAlertPresentationContext_onceToken, block);
  }
  uint64_t v2 = (void *)defaultAlertPresentationContext_defaultTransientOverlayPresentationContext;
  return v2;
}

uint64_t __71__CCUIContentModulePresentationContext_defaultAlertPresentationContext__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithEnvironment:2];
  uint64_t v2 = defaultAlertPresentationContext_defaultTransientOverlayPresentationContext;
  defaultAlertPresentationContext_defaultTransientOverlayPresentationContext = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (CCUIContentModulePresentationContext)initWithEnvironment:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModulePresentationContext;
  result = [(CCUIContentModulePresentationContext *)&v5 init];
  if (result) {
    result->_environment = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_environment;
}

- (int64_t)environment
{
  return self->_environment;
}

@end