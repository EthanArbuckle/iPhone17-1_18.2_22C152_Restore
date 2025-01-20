@interface AXSimpleRuntimeManager
+ (id)sharedManager;
- (BOOL)started;
- (BOOL)systemWideServer;
- (id)applicationElementCallback;
- (id)attributeCallback;
- (id)clientObserverCallback;
- (id)hitTestCallback;
- (id)outgoingValuePreprocessor;
- (id)parameterizedAttributeCallback;
- (id)performActionCallback;
- (id)setAttributeCallback;
- (void)setApplicationElementCallback:(id)a3;
- (void)setAttributeCallback:(id)a3;
- (void)setClientObserverCallback:(id)a3;
- (void)setHitTestCallback:(id)a3;
- (void)setOutgoingValuePreprocessor:(id)a3;
- (void)setParameterizedAttributeCallback:(id)a3;
- (void)setPerformActionCallback:(id)a3;
- (void)setSetAttributeCallback:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSystemWideServer:(BOOL)a3;
- (void)start;
@end

@implementation AXSimpleRuntimeManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_SharedManager;
  return v2;
}

uint64_t __39__AXSimpleRuntimeManager_sharedManager__block_invoke()
{
  sharedManager_SharedManager = objc_alloc_init(AXSimpleRuntimeManager);
  return MEMORY[0x1F41817F8]();
}

- (void)start
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Could not register system wide server: %ld", (uint8_t *)&v2, 0xCu);
}

- (BOOL)systemWideServer
{
  return self->_systemWideServer;
}

- (void)setSystemWideServer:(BOOL)a3
{
  self->_systemWideServer = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (id)parameterizedAttributeCallback
{
  return self->_parameterizedAttributeCallback;
}

- (void)setParameterizedAttributeCallback:(id)a3
{
}

- (id)attributeCallback
{
  return self->_attributeCallback;
}

- (void)setAttributeCallback:(id)a3
{
}

- (id)setAttributeCallback
{
  return self->_setAttributeCallback;
}

- (void)setSetAttributeCallback:(id)a3
{
}

- (id)performActionCallback
{
  return self->_performActionCallback;
}

- (void)setPerformActionCallback:(id)a3
{
}

- (id)clientObserverCallback
{
  return self->_clientObserverCallback;
}

- (void)setClientObserverCallback:(id)a3
{
}

- (id)hitTestCallback
{
  return self->_hitTestCallback;
}

- (void)setHitTestCallback:(id)a3
{
}

- (id)applicationElementCallback
{
  return self->_applicationElementCallback;
}

- (void)setApplicationElementCallback:(id)a3
{
}

- (id)outgoingValuePreprocessor
{
  return self->_outgoingValuePreprocessor;
}

- (void)setOutgoingValuePreprocessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outgoingValuePreprocessor, 0);
  objc_storeStrong(&self->_applicationElementCallback, 0);
  objc_storeStrong(&self->_hitTestCallback, 0);
  objc_storeStrong(&self->_clientObserverCallback, 0);
  objc_storeStrong(&self->_performActionCallback, 0);
  objc_storeStrong(&self->_setAttributeCallback, 0);
  objc_storeStrong(&self->_attributeCallback, 0);
  objc_storeStrong(&self->_parameterizedAttributeCallback, 0);
}

@end