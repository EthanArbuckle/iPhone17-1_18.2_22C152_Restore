@interface _DKMetadataPersistenceLookupTable
+ (id)attributeToKey;
+ (id)indexToKey;
+ (id)keyToAttribute;
+ (id)keyToIndex;
@end

@implementation _DKMetadataPersistenceLookupTable

+ (id)keyToIndex
{
  self;
  if (keyToIndex_onceToken != -1) {
    dispatch_once(&keyToIndex_onceToken, &__block_literal_global_761);
  }
  v0 = (void *)keyToIndex_dict;
  return v0;
}

+ (id)attributeToKey
{
  self;
  if (attributeToKey_onceToken != -1) {
    dispatch_once(&attributeToKey_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)attributeToKey_dict;
  return v0;
}

+ (id)keyToAttribute
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___DKMetadataPersistenceLookupTable_keyToAttribute__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (keyToAttribute_onceToken != -1) {
    dispatch_once(&keyToAttribute_onceToken, block);
  }
  v1 = (void *)keyToAttribute_dict;
  return v1;
}

+ (id)indexToKey
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___DKMetadataPersistenceLookupTable_indexToKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (indexToKey_onceToken != -1) {
    dispatch_once(&indexToKey_onceToken, block);
  }
  v1 = (void *)indexToKey_dict;
  return v1;
}

@end