@interface INExtension
+ (void)initialize;
- (INExtensionContext)_extensionContext;
- (id)handlerForIntent:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation INExtension

- (void).cxx_destruct
{
}

- (INExtensionContext)_extensionContext
{
  return self->_extensionContext;
}

- (id)handlerForIntent:(id)a3
{
  return __INExtensionGetDefaultIntentHandler(self, a3);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[INExtension beginRequestWithExtensionContext:]";
    _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s Extension bring-up", (uint8_t *)&v8, 0xCu);
  }
  _INExtensionContextWithContext(v4);
  v6 = (INExtensionContext *)objc_claimAutoreleasedReturnValue();
  extensionContext = self->_extensionContext;
  self->_extensionContext = v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (INLogInitIfNeeded_once != -1) {
      dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
    }
    v3 = objc_opt_class();
    __INExtensionInitialize(a1, v3);
  }
}

@end