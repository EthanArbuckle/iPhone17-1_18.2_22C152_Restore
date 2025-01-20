@interface NSSQLEntity_DerivedAttributesExtension
- (NSSQLEntity_DerivedAttributesExtension)initWithEntity:(id)a3;
- (id)entity;
- (uint64_t)addDerivationKeypath:(void *)key forAttribute:;
- (void)_generateTriggerSQL;
- (void)dealloc;
@end

@implementation NSSQLEntity_DerivedAttributesExtension

- (uint64_t)addDerivationKeypath:(void *)key forAttribute:
{
  if (result)
  {
    uint64_t v5 = result;
    id Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), key);
    if (!Value)
    {
      id Value = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 16), key, Value);
    }
    result = [a2 count];
    if (result)
    {
      return [Value addObject:a2];
    }
  }
  return result;
}

- (NSSQLEntity_DerivedAttributesExtension)initWithEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLEntity_DerivedAttributesExtension;
  v4 = [(NSSQLEntity_DerivedAttributesExtension *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_entity = (NSSQLEntity *)a3;
    memset(&v7, 0, 24);
    *(_OWORD *)&v7.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
    v7.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
    v4->_derivedAttributes = CFDictionaryCreateMutable(0, 0, &v7, MEMORY[0x1E4F1D540]);
  }
  return v5;
}

- (void)dealloc
{
  derivedAttributes = self->_derivedAttributes;
  if (derivedAttributes) {
    CFRelease(derivedAttributes);
  }

  self->_triggerSQL = 0;
  self->_migrationSQL = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLEntity_DerivedAttributesExtension;
  [(NSSQLEntity_DerivedAttributesExtension *)&v4 dealloc];
}

- (id)entity
{
  return self->_entity;
}

- (void)_generateTriggerSQL
{
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(a1 + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 32) setValue:v3 forKey:@"dropStatements"];

      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 32) setValue:v4 forKey:@"dataStatements"];

      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 32) setValue:v5 forKey:@"triggerCreationStatements"];

      v6 = *(void **)(a1 + 16);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke;
      v7[3] = &unk_1E544E9F0;
      v7[4] = a1;
      [v6 enumerateKeysAndObjectsUsingBlock:v7];
      [v2 drain];
    }
  }
}

@end