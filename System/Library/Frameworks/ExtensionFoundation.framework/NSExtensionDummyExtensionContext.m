@interface NSExtensionDummyExtensionContext
@end

@implementation NSExtensionDummyExtensionContext

uint64_t ___NSExtensionDummyExtensionContext_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F28C78]);
  _NSExtensionDummyExtensionContext_context = [v0 initWithInputItems:MEMORY[0x1E4F1CBF0] contextUUID:0];

  return MEMORY[0x1F41817F8]();
}

@end