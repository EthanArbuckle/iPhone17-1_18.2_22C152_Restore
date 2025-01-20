@interface DKIdentifier
@end

@implementation DKIdentifier

uint64_t __95___DKIdentifier_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _identifierFromManagedObject:*(void *)(a1 + 32) readMetadata:*(unsigned __int8 *)(a1 + 56) cache:*(void *)(a1 + 40)];
}

_DKObjectType *__79___DKIdentifier_MOConversion___identifierFromManagedObject_readMetadata_cache___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifierType];
  return +[_DKObjectType objectTypeWithTypeCode:v1];
}

@end