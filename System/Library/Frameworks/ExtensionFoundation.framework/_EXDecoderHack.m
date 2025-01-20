@interface _EXDecoderHack
- (_EXDecoderHack)initWithContextFactory:(id)a3;
- (id)contextFactory;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (void)setContextFactory:(id)a3;
@end

@implementation _EXDecoderHack

- (_EXDecoderHack)initWithContextFactory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXDecoderHack;
  v5 = [(_EXDecoderHack *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id contextFactory = v5->_contextFactory;
    v5->_id contextFactory = v6;
  }
  return v5;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  if (EXGetExtensionContextInternalClass() != a3)
  {
    objc_super v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXDecoderHack decodeObjectOfClass:forKey:]();
    }
    goto LABEL_10;
  }
  if (([v6 isEqualToString:@"self.internalExtensionContext"] & 1) == 0)
  {
    objc_super v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EXDecoderHack decodeObjectOfClass:forKey:]();
    }
LABEL_10:

    __break(1u);
    return result;
  }
  v7 = (*((void (**)(void))self->_contextFactory + 2))();

  return v7;
}

- (id)contextFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setContextFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)decodeObjectOfClass:forKey:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "[key isEqualToString:@\"self.internalExtensionContext\"]";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_0_0();
  int v4 = 39;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected key for decoding", v1, 0x1Cu);
}

- (void)decodeObjectOfClass:forKey:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "aClass == EXGetExtensionContextInternalClass()";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_0_0();
  int v4 = 38;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected class for decoding", v1, 0x1Cu);
}

@end