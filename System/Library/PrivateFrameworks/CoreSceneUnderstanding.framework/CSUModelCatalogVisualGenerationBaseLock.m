@interface CSUModelCatalogVisualGenerationBaseLock
- (CSUModelCatalogVisualGenerationBaseLock)init;
@end

@implementation CSUModelCatalogVisualGenerationBaseLock

- (CSUModelCatalogVisualGenerationBaseLock)init
{
  return (CSUModelCatalogVisualGenerationBaseLock *)sub_24C6DE810();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CSUModelCatalogVisualGenerationBaseLock_logger;
  uint64_t v4 = sub_24C72AAD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CSUModelCatalogVisualGenerationBaseLock_modelLock;
  sub_24C6DEC28((uint64_t)v5);
}

@end