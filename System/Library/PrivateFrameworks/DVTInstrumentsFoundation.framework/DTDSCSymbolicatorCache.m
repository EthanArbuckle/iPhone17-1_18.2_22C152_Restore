@interface DTDSCSymbolicatorCache
- (DTDSCSymbolicatorCache)init;
- (_CSTypeRef)symbolicatorForSharedCacheUUID:(id)a3;
- (void)dealloc;
@end

@implementation DTDSCSymbolicatorCache

- (DTDSCSymbolicatorCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)DTDSCSymbolicatorCache;
  v2 = [(DTDSCSymbolicatorCache *)&v4 init];
  if (v2) {
    v2->_sharedCacheUUIDSymbolicators = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263F382E8]);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->_sharedCacheUUIDSymbolicators);
  v3.receiver = self;
  v3.super_class = (Class)DTDSCSymbolicatorCache;
  [(DTDSCSymbolicatorCache *)&v3 dealloc];
}

- (_CSTypeRef)symbolicatorForSharedCacheUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  Value = (unint64_t *)CFDictionaryGetValue(self->_sharedCacheUUIDSymbolicators, v4);
  if (Value)
  {
    unint64_t v6 = *Value;
    unint64_t v7 = Value[1];
  }
  else
  {
    [v4 getUUIDBytes:v18];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3010000000;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    v15 = &unk_23096BAAB;
    CSSymbolicatorForeachSharedCache();
    int v8 = CSIsNull();
    sharedCacheUUIDSymbolicators = self->_sharedCacheUUIDSymbolicators;
    if (v8)
    {
      CFDictionarySetValue(sharedCacheUUIDSymbolicators, v4, &unk_23094A578);
      unint64_t v6 = 0;
      unint64_t v7 = 0;
    }
    else
    {
      CFDictionarySetValue(sharedCacheUUIDSymbolicators, v4, v13 + 4);
      CSRelease();
      unint64_t v6 = v13[4];
      unint64_t v7 = v13[5];
    }
    _Block_object_dispose(&v12, 8);
  }

  unint64_t v10 = v6;
  unint64_t v11 = v7;
  result._opaque_2 = v11;
  result._opaque_1 = v10;
  return result;
}

@end