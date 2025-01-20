@interface NSClassicHashTable
- (BOOL)isEqual:(id)a3;
- (id)allObjects;
- (id)copy;
- (id)description;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)getItem:(const void *)a3;
- (void)getKeys:(const void *)a3 count:(unint64_t *)a4;
- (void)insertItem:(const void *)a3;
- (void)insertKnownAbsentItem:(const void *)a3;
- (void)removeAllItems;
- (void)removeItem:(const void *)a3;
@end

@implementation NSClassicHashTable

- (void)getItem:(const void *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)&v4);
  if (*((void *)&v6 + 1)) {
    return (void *)*((void *)&v5 + 1);
  }
  else {
    return 0;
  }
}

- (void)insertItem:(const void *)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"*** NSHashInsert(): attempt to insert NULL pointer" userInfo:0]);
  }
  ht = self->_ht;

  CFBasicHashSetValue((uint64_t)ht, (unint64_t)a3);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CFRelease(self->_ht);
  v3.receiver = self;
  v3.super_class = (Class)NSClassicHashTable;
  [(NSClassicHashTable *)&v3 dealloc];
}

- (void)removeAllItems
{
  ht = self->_ht;
  if ((*((unsigned char *)ht + 18) & 0x3F) != 0) {
    __CFBasicHashDrain((uint64_t)ht, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      return CFBasicHashesAreEqual(self->_ht, *((void **)a3 + 6)) != 0;
    }
  }
  return 0;
}

- (id)copy
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_callBacks.retain;
  *(_OWORD *)&callBacks.hash = *(_OWORD *)&self->_callBacks.hash;
  *(_OWORD *)&callBacks.retain = v4;
  callBacks.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))self->_callBacks.describe;
  uint64_t v5 = NSCreateHashTableWithZone(&callBacks, (NSUInteger)a2, v2);
  ht = self->_ht;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__NSClassicHashTable_copy__block_invoke;
  v8[3] = &unk_1E51F83D0;
  v8[4] = v5;
  CFBasicHashApply(ht, (uint64_t)v8);
  return v5;
}

uint64_t __26__NSClassicHashTable_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)addObject:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer" userInfo:0]);
  }
  ht = self->_ht;

  CFBasicHashAddValue((unint64_t)ht, (unint64_t)a3);
}

- (void)insertKnownAbsentItem:(const void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = (NSString *)@"*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer";
    goto LABEL_8;
  }
  uint64_t v11 = 0;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v9);
  if (*((void *)&v10 + 1))
  {
    uint64_t v8 = +[NSString stringWithFormat:@"*** NSHashInsertKnownAbsent(): item %p already in table", a3];
    long long v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
LABEL_8:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
  ht = self->_ht;

  CFBasicHashAddValue((unint64_t)ht, (unint64_t)a3);
}

- (void)removeItem:(const void *)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"*** NSHashRemove(): attempt to remove NULL pointer" userInfo:0]);
  }
  ht = self->_ht;

  CFBasicHashRemoveValue((uint64_t)ht, (unint64_t)a3);
}

- (unint64_t)count
{
  return CFBasicHashGetCount(self->_ht);
}

- (id)description
{
  v8[4] = *MEMORY[0x1E4F143B8];
  if (!CFBasicHashGetCount(self->_ht)) {
    return +[NSString stringWithFormat:@"<NSHashTable: %p> {}", self];
  }
  v8[3] = 1;
  id v3 = (id)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:CFBasicHashGetCount(self->_ht) << 6];
  objc_msgSend(v3, "appendFormat:", @"<NSHashTable: %p> ("), self;
  describe = self->_callBacks.describe;
  v8[0] = self;
  v8[1] = describe;
  v8[2] = v3;
  ht = self->_ht;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__NSClassicHashTable_description__block_invoke;
  v7[3] = &__block_descriptor_40_e18_C64__0___qQQQQQQ_8l;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  [v3 appendString:@""]);
  return v3;
}

uint64_t __33__NSClassicHashTable_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 24)) {
    [*(id *)(v3 + 16) appendString:@", "];
  }
  long long v4 = *(uint64_t (**)(void, uint64_t))(v3 + 8);
  uint64_t v5 = *(void **)(v3 + 16);
  if (v4) {
    objc_msgSend(v5, "appendString:", v4(*(void *)v3, v2));
  }
  else {
    objc_msgSend(v5, "appendFormat:", @"%p", v2);
  }
  *(unsigned char *)(v3 + 24) = 0;
  return 1;
}

- (id)allObjects
{
  v16[5] = *MEMORY[0x1E4F143B8];
  unint64_t Count = CFBasicHashGetCount(self->_ht);
  unint64_t v4 = Count;
  if (Count >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  v16[4] = 0;
  uint64_t v5 = _CFCreateArrayStorage();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = v5;
  ht = self->_ht;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__NSClassicHashTable_allObjects__block_invoke;
  v15[3] = &unk_1E51F8418;
  v15[4] = v16;
  CFBasicHashApply(ht, (uint64_t)v15);
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = (id *)v5;
      unint64_t v8 = v4;
      do
      {
        id v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v5 count:v4 size:v4];
  }
  else
  {
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:0 count:v4];
  }
  id v11 = v10;
  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __32__NSClassicHashTable_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1;
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  ht = self->_ht;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSClassicHashTable_getKeys_count___block_invoke;
  v7[3] = &unk_1E51F8418;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  if (a4) {
    *a4 = CFBasicHashGetCount(self->_ht);
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __36__NSClassicHashTable_getKeys_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1;
}

@end