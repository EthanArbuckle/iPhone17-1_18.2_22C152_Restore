@interface _CDPExtensionHostContext
+ (id)_allowedItemPayloadClasses;
@end

@implementation _CDPExtensionHostContext

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken != -1) {
    dispatch_once(&_allowedItemPayloadClasses_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_allowedItemPayloadClasses_classes;

  return v2;
}

@end