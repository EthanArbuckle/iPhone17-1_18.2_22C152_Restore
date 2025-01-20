@interface BiometricKitUIEnrollViewController
- (BiometricKit)biometricKit;
- (BiometricKitUIEnrollResultDelegate)delegate;
- (id)propertyForKey:(id)a3;
- (void)cancelEnroll;
- (void)restartEnroll;
- (void)setBiometricKit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)startEnroll;
- (void)startEnrollOperation;
@end

@implementation BiometricKitUIEnrollViewController

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_properties)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    properties = self->_properties;
    self->_properties = v8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[BiometricKitUIEnrollViewController setProperty:forKey:]();
  }
  [(NSMutableDictionary *)self->_properties setValue:v6 forKey:v7];
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  if (properties)
  {
    id v6 = [(NSMutableDictionary *)properties valueForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[BiometricKitUIEnrollViewController propertyForKey:]();
  }

  return v6;
}

- (void)startEnroll
{
}

- (void)startEnrollOperation
{
}

- (void)cancelEnroll
{
}

- (void)restartEnroll
{
}

- (BiometricKit)biometricKit
{
  return self->_biometricKit;
}

- (void)setBiometricKit:(id)a3
{
}

- (BiometricKitUIEnrollResultDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BiometricKitUIEnrollResultDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_biometricKit, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)setProperty:forKey:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Set new property key: \"%@\" value: \"%@\"", v0, 0x16u);
}

- (void)propertyForKey:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1E4B6C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Property value: \"%@\" of key: \"%@\"", v0, 0x16u);
}

@end