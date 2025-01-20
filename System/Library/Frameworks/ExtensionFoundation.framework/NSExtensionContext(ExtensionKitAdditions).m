@interface NSExtensionContext(ExtensionKitAdditions)
+ (uint64_t)_allowedItemPayloadClasses;
- (id)_derivedExtensionAuxiliaryHostProtocol;
- (void)_derivedExtensionAuxiliaryHostProtocol;
@end

@implementation NSExtensionContext(ExtensionKitAdditions)

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  v0 = +[EXExtensionContextImplementation _derivedExtensionAuxiliaryHostProtocolWithContextClass:objc_opt_class()];
  v1 = _EXLegacyLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    -[NSExtensionContext(ExtensionKitAdditions) _derivedExtensionAuxiliaryHostProtocol]();
  }

  return v0;
}

+ (uint64_t)_allowedItemPayloadClasses
{
  return 0;
}

- (void)_derivedExtensionAuxiliaryHostProtocol
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Derived context: %{public}@", v2, v3, v4, v5, v6);
}

@end