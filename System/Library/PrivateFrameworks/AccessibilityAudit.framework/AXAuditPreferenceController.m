@interface AXAuditPreferenceController
+ (AXAuditPreferenceController)sharedController;
- (AXAuditPreferenceController)init;
- (BOOL)spinRunloop;
- (NSMutableDictionary)preferenceDictionary;
- (void)dealloc;
- (void)setPreferenceDictionary:(id)a3;
- (void)setSpinRunloop:(BOOL)a3;
@end

@implementation AXAuditPreferenceController

+ (AXAuditPreferenceController)sharedController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXAuditPreferenceController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_once != -1) {
    dispatch_once(&sharedController_once, block);
  }
  v2 = (void *)sharedController_sharedInstance;

  return (AXAuditPreferenceController *)v2;
}

uint64_t __47__AXAuditPreferenceController_sharedController__block_invoke(uint64_t a1)
{
  sharedController_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (AXAuditPreferenceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAuditPreferenceController;
  v2 = [(AXAuditPreferenceController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    preferenceDictionary = v2->_preferenceDictionary;
    v2->_preferenceDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  preferenceDictionary = self->_preferenceDictionary;
  self->_preferenceDictionary = 0;

  v4.receiver = self;
  v4.super_class = (Class)AXAuditPreferenceController;
  [(AXAuditPreferenceController *)&v4 dealloc];
}

- (void)setSpinRunloop:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  objc_super v4 = [(AXAuditPreferenceController *)self preferenceDictionary];
  [v4 setValue:v5 forKey:@"spinRunloop"];
}

- (BOOL)spinRunloop
{
  uint64_t v3 = [(AXAuditPreferenceController *)self preferenceDictionary];
  objc_super v4 = [v3 objectForKey:@"spinRunloop"];
  if (v4)
  {
    id v5 = [(AXAuditPreferenceController *)self preferenceDictionary];
    objc_super v6 = [v5 objectForKeyedSubscript:@"spinRunloop"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)preferenceDictionary
{
  return self->_preferenceDictionary;
}

- (void)setPreferenceDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end