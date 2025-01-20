@interface NSExtension
+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (BOOL)_shouldLogExtensionDiscovery;
+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4;
+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4;
+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5;
+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4;
+ (id)globalStateQueueForExtension:(id)a3;
+ (id)predicateForActivationRule:(id)a3;
+ (void)endMatchingExtensions:(id)a3;
+ (void)extensionWithURL:(id)a3 completion:(id)a4;
+ (void)extensionWithUUID:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4;
- (BOOL)_isPhotoServiceAccessGranted;
- (BOOL)attemptOptIn:(id *)a3;
- (BOOL)attemptOptOut:(id *)a3;
- (NSExtension)init;
- (id)_extensionContextForUUID:(id)a3;
- (id)_init;
- (id)_initWithPKPlugin:(id)a3;
- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4;
- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5;
- (id)objectForInfoDictionaryKey:(id)a3;
- (int)pidForRequestIdentifier:(id)a3;
- (void)_dropAssertion;
- (void)_hostDidBecomeActiveNote:(id)a3;
- (void)_hostDidEnterBackgroundNote:(id)a3;
- (void)_hostWillEnterForegroundNote:(id)a3;
- (void)_hostWillResignActiveNote:(id)a3;
- (void)_kill:(int)a3;
- (void)_safelyBeginUsing:(id)a3;
- (void)_safelyEndUsing:(id)a3;
- (void)_setAllowedErrorClasses:(id)a3;
- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4;
- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6;
- (void)cancelExtensionRequestWithIdentifier:(id)a3;
@end

@implementation NSExtension

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSExtension;
  return [(NSExtension *)&v3 init];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__NSExtension_allocWithZone___block_invoke;
    block[3] = &unk_1E51F8B80;
    block[4] = a1;
    block[5] = a3;
    if (qword_1EB1ED7C8 != -1) {
      dispatch_once(&qword_1EB1ED7C8, block);
    }
    return (id)qword_1EB1ED7C0;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSExtension;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  objc_super v6 = (void *)_MergedGlobals_119;

  return (id)[v6 beginMatchingExtensionsWithAttributes:a3 completion:a4];
}

+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  objc_super v6 = (void *)_MergedGlobals_119;

  [v6 extensionsWithMatchingAttributes:a3 completion:a4];
}

+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  id result = (id)[(id)_MergedGlobals_119 extensionsWithMatchingAttributes:a3 error:a4];
  if (!result) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

+ (void)endMatchingExtensions:(id)a3
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  uint64_t v4 = (void *)_MergedGlobals_119;

  [v4 endMatchingExtensions:a3];
}

+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  objc_super v6 = (void *)_MergedGlobals_119;

  return (id)[v6 extensionWithIdentifier:a3 error:a4];
}

+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  v8 = (void *)_MergedGlobals_119;

  return (id)[v8 extensionWithIdentifier:a3 excludingDisabledExtensions:v6 error:a5];
}

+ (void)extensionWithUUID:(id)a3 completion:(id)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  if (_MergedGlobals_119)
  {
    BOOL v6 = (void *)_MergedGlobals_119;
    [v6 extensionWithUUID:a3 completion:a4];
  }
  else
  {
    v7 = +[NSError errorWithDomain:@"NSOSStatusErrorDomain" code:-4 userInfo:0];
    v8 = (void (*)(id, void, NSError *))*((void *)a4 + 2);
    v8(a4, 0, v7);
  }
}

+ (void)extensionWithURL:(id)a3 completion:(id)a4
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  if (_MergedGlobals_119)
  {
    BOOL v6 = (void *)_MergedGlobals_119;
    [v6 extensionWithURL:a3 completion:a4];
  }
  else
  {
    v7 = +[NSError errorWithDomain:@"NSOSStatusErrorDomain" code:-4 userInfo:0];
    v8 = (void (*)(id, void, NSError *))*((void *)a4 + 2);
    v8(a4, 0, v7);
  }
}

+ (BOOL)_shouldLogExtensionDiscovery
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  v2 = (void *)_MergedGlobals_119;

  return [v2 _shouldLogExtensionDiscovery];
}

+ (id)globalStateQueueForExtension:(id)a3
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  id result = (id)[(id)_MergedGlobals_119 globalStateQueueForExtension:a3];
  if (!result)
  {
    if (qword_1EB1ED7B8 != -1) {
      dispatch_once(&qword_1EB1ED7B8, &__block_literal_global_2_1);
    }
    return (id)qword_1EB1ED7B0;
  }
  return result;
}

dispatch_queue_t __44__NSExtension_globalStateQueueForExtension___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("NSExtension global state queue", 0);
  qword_1EB1ED7B0 = (uint64_t)result;
  return result;
}

id __29__NSExtension_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___NSExtension;
  id result = objc_msgSendSuper2(&v3, sel_allocWithZone_, v1);
  qword_1EB1ED7C0 = (uint64_t)result;
  return result;
}

- (NSExtension)init
{
}

- (id)_initWithPKPlugin:(id)a3
{
  if (qword_1EB1ED7A8 != -1) {
    dispatch_once(&qword_1EB1ED7A8, &__block_literal_global_46);
  }
  id v4 = objc_alloc((Class)_MergedGlobals_119);

  return (id)[v4 _initWithPKPlugin:a3];
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6
{
  v8 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4
{
  BOOL v6 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4
{
  BOOL v6 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)cancelExtensionRequestWithIdentifier:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptIn:(id *)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptOut:(id *)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setAllowedErrorClasses:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)pidForRequestIdentifier:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyBeginUsing:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyEndUsing:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_isPhotoServiceAccessGranted
{
  id v4 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)_kill:(int)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillEnterForegroundNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidEnterBackgroundNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillResignActiveNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidBecomeActiveNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_dropAssertion
{
  id v4 = NSClassFromString((NSString *)@"NSExtension");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  BOOL v6 = (void *)_NSExtensionClass();

  return [v6 evaluateActivationRule:a3 withExtensionItemsRepresentation:a4];
}

+ (id)predicateForActivationRule:(id)a3
{
  id v4 = (void *)_NSExtensionClass();

  return (id)[v4 predicateForActivationRule:a3];
}

+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  BOOL v6 = (void *)_NSExtensionClass();

  return [v6 _evaluateActivationRuleWithoutWorkarounds:a3 withExtensionItemsRepresentation:a4];
}

@end