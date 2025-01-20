@interface ACCFeaturePluginHID
- (ACCFeaturePluginHIDProvider)hidProvider;
- (BOOL)isRunning;
- (NSString)description;
- (NSString)pluginName;
- (void)initPlugin;
- (void)setHidProvider:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCFeaturePluginHID

- (void)initPlugin
{
  init_logging();
  [(ACCFeaturePluginHID *)self setHidProvider:0];
  [(ACCFeaturePluginHID *)self setIsRunning:0];
}

- (void)startPlugin
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_226BAF000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v0, 0x12u);
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCFeaturePluginHID startPlugin]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_226BAF000, v5, OS_LOG_TYPE_DEFAULT, "Stopping HID feature plugin...", v7, 2u);
  }

  v6 = [(ACCFeaturePluginHID *)self hidProvider];
  [v6 stopHIDProvider];

  [(ACCFeaturePluginHID *)self setHidProvider:0];
  [(ACCFeaturePluginHID *)self setIsRunning:0];
}

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = [(ACCFeaturePluginHID *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCFeaturePluginHID *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCFeaturePluginHIDProvider)hidProvider
{
  return self->_hidProvider;
}

- (void)setHidProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end