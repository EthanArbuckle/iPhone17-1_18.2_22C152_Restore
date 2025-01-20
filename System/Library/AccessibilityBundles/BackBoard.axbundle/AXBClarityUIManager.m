@interface AXBClarityUIManager
+ (id)sharedManager;
- (AXBClarityUIManager)init;
- (AXPasscodeAccessor)passcodeHandle;
- (BOOL)validateAdminPasscode:(id)a3;
- (void)setAdminPasscode:(id)a3;
@end

@implementation AXBClarityUIManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_25);
  }
  v2 = (void *)sharedManager_manager_0;

  return v2;
}

uint64_t __36__AXBClarityUIManager_sharedManager__block_invoke()
{
  sharedManager_manager_0 = objc_alloc_init(AXBClarityUIManager);

  return MEMORY[0x270F9A758]();
}

- (AXBClarityUIManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXBClarityUIManager;
  v2 = [(AXBClarityUIManager *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F22910]);
    v4 = CLFLogCommon();
    uint64_t v5 = [v3 initWithServiceName:@"ClarityUI" accountName:@"user" groupName:@"com.apple.Accessibility" logFacility:v4];
    passcodeHandle = v2->_passcodeHandle;
    v2->_passcodeHandle = (AXPasscodeAccessor *)v5;
  }
  return v2;
}

- (void)setAdminPasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5 == *MEMORY[0x263F22580])
  {
    v6 = [(AXBClarityUIManager *)self passcodeHandle];
    [v6 attemptToSetPasscode:v4];
  }
  else
  {
    v7 = CLFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[AXBClarityUIManager setAdminPasscode:](v4);
    }
  }
}

- (BOOL)validateAdminPasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5 == *MEMORY[0x263F22580])
  {
    v6 = [(AXBClarityUIManager *)self passcodeHandle];
    v7 = [v6 passcode];
    char v8 = [v7 isEqualToString:v4];
  }
  else
  {
    v9 = CLFLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AXBClarityUIManager validateAdminPasscode:](v4);
    }

    char v8 = 0;
  }

  return v8;
}

- (AXPasscodeAccessor)passcodeHandle
{
  return self->_passcodeHandle;
}

- (void).cxx_destruct
{
}

- (void)setAdminPasscode:(void *)a1 .cold.1(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_241F5C000, v1, v2, "Attempted to set admin passcode to a string of %lu characters (expected: %lu).", v3, v4, v5, v6, v7);
}

- (void)validateAdminPasscode:(void *)a1 .cold.1(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_241F5C000, v1, v2, "Attempted to validate admin passcode as a string of %lu characters (expected: %lu).", v3, v4, v5, v6, v7);
}

@end