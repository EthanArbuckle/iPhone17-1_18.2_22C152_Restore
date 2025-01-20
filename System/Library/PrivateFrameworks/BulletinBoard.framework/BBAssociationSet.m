@interface BBAssociationSet
+ (id)setWithStrongAssociation;
+ (id)setWithWeakAssociation;
- (id)_initWithMemoryPointerFunction:(unint64_t)a3;
- (id)associatedObjectsForObject:(id)a3;
- (void)associateObject:(id)a3 withObject:(id)a4;
- (void)copyAssociationsForObject:(id)a3 toObject:(id)a4;
@end

@implementation BBAssociationSet

+ (id)setWithStrongAssociation
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithMemoryPointerFunction:0];
  return v2;
}

+ (id)setWithWeakAssociation
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithMemoryPointerFunction:5];
  return v2;
}

- (id)_initWithMemoryPointerFunction:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BBAssociationSet;
  v4 = [(BBAssociationSet *)&v11 init];
  if (v4)
  {
    v5 = NSString;
    v6 = [MEMORY[0x263F08C38] UUID];
    v7 = [v6 UUIDString];
    uint64_t v8 = [v5 stringWithFormat:@"%@%@", @"_associationSet", v7];
    associationSetKey = v4->_associationSetKey;
    v4->_associationSetKey = (NSString *)v8;

    v4->_associatedObjectMemoryPointerFunction = a3;
  }
  return v4;
}

- (void)associateObject:(id)a3 withObject:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_sync_enter(v6);
  v7 = [(NSString *)self->_associationSetKey cStringUsingEncoding:1];
  uint64_t v8 = objc_getAssociatedObject(v6, v7);
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263F088B0] hashTableWithOptions:self->_associatedObjectMemoryPointerFunction | 0x200];
    objc_setAssociatedObject(v6, v7, v8, (void *)0x301);
  }
  objc_sync_exit(v6);

  id v9 = v8;
  objc_sync_enter(v9);
  [v9 addObject:v10];
  objc_sync_exit(v9);
}

- (id)associatedObjectsForObject:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  v5 = [(NSString *)self->_associationSetKey cStringUsingEncoding:1];
  id v6 = objc_getAssociatedObject(v4, v5);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    objc_sync_enter(v8);
    id v9 = [v8 setRepresentation];
    if (![v9 count])
    {
      objc_setAssociatedObject(v4, v5, 0, (void *)0x301);

      id v9 = 0;
    }
    objc_sync_exit(v8);
  }
  else
  {
    id v9 = 0;
  }
  objc_sync_exit(v4);

  return v9;
}

- (void)copyAssociationsForObject:(id)a3 toObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(BBAssociationSet *)self associatedObjectsForObject:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(BBAssociationSet *)self associateObject:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withObject:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end