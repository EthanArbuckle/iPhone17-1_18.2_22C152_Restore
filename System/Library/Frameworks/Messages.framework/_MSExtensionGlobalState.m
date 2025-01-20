@interface _MSExtensionGlobalState
+ (id)sharedInstance;
- (_MSMessageComposeExtensionImplProtocol)activeExtensionContext;
- (void)setActiveExtensionContext:(id)a3;
@end

@implementation _MSExtensionGlobalState

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (void)setActiveExtensionContext:(id)a3
{
}

- (_MSMessageComposeExtensionImplProtocol)activeExtensionContext
{
  return self->_activeExtensionContext;
}

- (void).cxx_destruct
{
}

@end