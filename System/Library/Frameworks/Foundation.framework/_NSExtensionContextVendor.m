@interface _NSExtensionContextVendor
+ (Class)_extensionContextClass;
+ (Class)_extensionPrincipalClass;
+ (id)_extensionDictionary;
+ (id)_extensionMainStoryboard;
+ (id)_sharedExtensionContextVendor;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)_startListening;
+ (void)_startListening:(BOOL)a3;
- (_NSExtensionContextVendor)init;
- (id)_extensionContextForUUID:(id)a3;
- (id)_init;
- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4;
- (void)_tearDownContextWithUUID:(id)a3;
@end

@implementation _NSExtensionContextVendor

+ (void)_startListening
{
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_105;

  [v2 _startListening];
}

+ (void)_startListening:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v4 = (void *)_MergedGlobals_105;

  [v4 _startListening:v3];
}

+ (id)_sharedExtensionContextVendor
{
  if (qword_1EB1ED3A0 != -1) {
    dispatch_once(&qword_1EB1ED3A0, &__block_literal_global_4_0);
  }
  return (id)qword_1EB1ED398;
}

+ (id)_extensionDictionary
{
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_105;

  return (id)[v2 _extensionDictionary];
}

+ (Class)_extensionPrincipalClass
{
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_105;

  return (Class)[v2 _extensionPrincipalClass];
}

+ (id)_extensionMainStoryboard
{
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_105;

  return (id)[v2 _extensionMainStoryboard];
}

+ (Class)_extensionContextClass
{
  if (qword_1EB1ED380 != -1) {
    dispatch_once(&qword_1EB1ED380, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_105;

  return (Class)[v2 _extensionContextClass];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (_NSExtensionContextVendor == a1)
  {
    v6 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
    NSRequestConcreteImplementation((uint64_t)a1, a2, v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____NSExtensionContextVendor;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSExtensionContextVendor;
  return [(_NSExtensionContextVendor *)&v3 init];
}

- (_NSExtensionContextVendor)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSExtensionContextVendor;
  return [(_NSExtensionContextVendor *)&v3 init];
}

- (void)_tearDownContextWithUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  v6 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

@end