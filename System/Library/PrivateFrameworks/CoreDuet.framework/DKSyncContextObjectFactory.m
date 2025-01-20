@interface DKSyncContextObjectFactory
@end

@implementation DKSyncContextObjectFactory

uint64_t __61___DKSyncContextObjectFactory_objectFactoryForClass_context___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:24];
  uint64_t v1 = objectFactoryForClass_context__instances;
  objectFactoryForClass_context__instances = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end