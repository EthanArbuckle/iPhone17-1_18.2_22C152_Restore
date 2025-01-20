@interface _PFFreeMapEntry
- (_PFFreeMapEntry)init;
- (void)dealloc;
@end

@implementation _PFFreeMapEntry

- (_PFFreeMapEntry)init
{
  v4.receiver = self;
  v4.super_class = (Class)_PFFreeMapEntry;
  v2 = [(_PFFreeMapEntry *)&v4 init];
  if (v2) {
    v2->_owners = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  owners = self->_owners;
  uint64_t v4 = [(NSMutableSet *)owners countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(owners);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate];
      }
      uint64_t v5 = [(NSMutableSet *)owners countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_PFFreeMapEntry;
  [(_PFFreeMapEntry *)&v8 dealloc];
}

@end