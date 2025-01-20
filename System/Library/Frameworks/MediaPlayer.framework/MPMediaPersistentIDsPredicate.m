@interface MPMediaPersistentIDsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldContain;
- (MPMediaPersistentIDsPredicate)initWithCoder:(id)a3;
- (MPMediaPersistentIDsPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (NSString)description;
- (const)persistentIDs;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForEntityClass:(Class)a3;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMediaPersistentIDsPredicate

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

- (const)persistentIDs
{
  return self->_persistentIDs;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  v4 = objc_alloc_init(MPPPersistentIDsPredicate);
  [(MPPPersistentIDsPredicate *)v4 setShouldContain:self->_shouldContain];
  if (self->_count)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      [(MPPPersistentIDsPredicate *)v4 addPersistentIDs:self->_persistentIDs[v5]];
      uint64_t v5 = v6;
    }
    while (self->_count > v6++);
  }
  v8 = objc_alloc_init(MPPMediaPredicate);
  [(MPPMediaPredicate *)v8 setType:4];
  [(MPPMediaPredicate *)v8 setPersistentIDsPredicate:v4];

  return v8;
}

- (MPMediaPersistentIDsPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 1838, @"Cannot decode object of type %@", objc_opt_class() object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)MPMediaPersistentIDsPredicate;
  v7 = [(MPMediaPersistentIDsPredicate *)&v13 init];
  if (v7)
  {
    v8 = [v6 persistentIDsPredicate];
    v7->_shouldContain = [v8 shouldContain];
    uint64_t v9 = [v8 persistentIDsCount];
    v7->_count = v9;
    v10 = (int64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
    v7->_persistentIDs = v10;
    memcpy(v10, (const void *)[v8 persistentIDs], 8 * v7->_count);
  }
  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)MPMediaPersistentIDsPredicate;
  return self->_count ^ [(MPMediaPersistentIDsPredicate *)&v3 hash] ^ self->_shouldContain;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MPMediaPersistentIDsPredicate;
  BOOL v6 = [(MPMediaPersistentIDsPredicate *)&v8 isEqual:v4]
    && (unint64_t count = self->_count, count == *((void *)v4 + 3))
    && self->_shouldContain == v4[16]
    && memcmp(self->_persistentIDs, *((const void **)v4 + 1), 8 * count) == 0;

  return v6;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_shouldContain) {
    uint64_t v5 = &stru_1EE680640;
  }
  else {
    uint64_t v5 = @"NOT";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@ %p> should%@ contain %lu persistent IDs", v4, self, v5, self->_count];
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeBool:self->_shouldContain forKey:@"shouldContain"];
  if (self->_count)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_count)
    {
      unint64_t v5 = 0;
      do
      {
        BOOL v6 = [NSNumber numberWithLongLong:self->_persistentIDs[v5]];
        [v4 addObject:v6];

        ++v5;
      }
      while (v5 < self->_count);
    }
    [v7 encodeObject:v4 forKey:@"persistentIDs"];
  }
}

- (MPMediaPersistentIDsPredicate)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMediaPersistentIDsPredicate;
  unint64_t v5 = [(MPMediaPersistentIDsPredicate *)&v19 init];
  if (v5)
  {
    v5->_shouldContain = [v4 decodeBoolForKey:@"shouldContain"];
    BOOL v6 = [v4 decodePropertyListForKey:@"persistentIDs"];
    if (_NSIsNSArray() && [v6 count])
    {
      v5->_persistentIDs = (int64_t *)malloc_type_malloc(8 * [v6 count], 0x100004000313F17uLL);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v7);
            }
            objc_super v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
            if (_NSIsNSNumber()) {
              v5->_persistentIDs[v10++] = objc_msgSend(v13, "longLongValue", (void)v15);
            }
            ++v12;
          }
          while (v9 != v12);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v9);
      }
    }
    v5->_unint64_t count = objc_msgSend(v6, "count", (void)v15);
  }
  return v5;
}

- (void)dealloc
{
  persistentIDs = self->_persistentIDs;
  if (persistentIDs) {
    free(persistentIDs);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPMediaPersistentIDsPredicate;
  [(MPMediaPersistentIDsPredicate *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5
{
  uint64_t v8 = objc_alloc_init(MPMediaPersistentIDsPredicate);
  v8->_shouldContain = a5;
  if (a4)
  {
    uint64_t v9 = (int64_t *)malloc_type_malloc(8 * a4, 0x29F418DBuLL);
    v8->_persistentIDs = v9;
    memcpy(v9, a3, 8 * a4);
    v8->_unint64_t count = a4;
  }

  return v8;
}

- (id)ML3PredicateForContainer
{
  uint64_t v3 = objc_opt_class();

  return [(MPMediaPersistentIDsPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)ML3PredicateForTrack
{
  uint64_t v3 = objc_opt_class();

  return [(MPMediaPersistentIDsPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F79B18];
  unint64_t v5 = [(MPMediaPersistentIDsPredicate *)self persistentIDs];
  unint64_t v6 = [(MPMediaPersistentIDsPredicate *)self count];
  BOOL v7 = [(MPMediaPersistentIDsPredicate *)self shouldContain];

  return (id)[v4 predicateWithPersistentIDs:v5 count:v6 shouldContain:v7];
}

@end