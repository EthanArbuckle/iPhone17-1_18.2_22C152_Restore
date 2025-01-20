@interface _MSPContainerEditRemoval
- (NSArray)originalObjects;
- (NSArray)removedImmutableObjects;
- (NSIndexSet)indexesOfRemovedObjects;
- (NSString)description;
- (_MSPContainerEditRemoval)initWithRemovedObjects:(id)a3 indexes:(id)a4;
- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4;
@end

@implementation _MSPContainerEditRemoval

- (_MSPContainerEditRemoval)initWithRemovedObjects:(id)a3 indexes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MSPContainerEditRemoval;
  v8 = [(_MSPContainerEditRemoval *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    originalObjects = v8->_originalObjects;
    v8->_originalObjects = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    indexesOfRemovedObjects = v8->_indexesOfRemovedObjects;
    v8->_indexesOfRemovedObjects = (NSIndexSet *)v11;
  }
  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditRemoval;
  v4 = [(_MSPContainerEditRemoval *)&v9 description];
  v5 = [(_MSPContainerEditRemoval *)self removedImmutableObjects];
  id v6 = [(_MSPContainerEditRemoval *)self indexesOfRemovedObjects];
  id v7 = [v3 stringWithFormat:@"%@ { removes objects = %@ from indexes = %@ }", v4, v5, v6];

  return (NSString *)v7;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(_MSPContainerEditRemoval *)self originalObjects];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __94___MSPContainerEditRemoval_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
  v27 = &unk_1E617E8D0;
  id v23 = v6;
  id v28 = v23;
  id v22 = v7;
  id v29 = v22;
  id v9 = v8;
  v10 = &v24;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = ((void (*)(uint64_t *, void, uint64_t))v26)(v10, *(void *)(*((void *)&v30 + 1) + 8 * v17), v15 + v17);
        if (v18) {
          objc_msgSend(v11, "addObject:", v18, v22, v23, v24, v25);
        }

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      v15 += v17;
    }
    while (v14);
  }

  v19 = (void *)[v11 copy];
  v20 = (NSArray *)[v19 copy];
  removedImmutableObjects = self->_removedImmutableObjects;
  self->_removedImmutableObjects = v20;
}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (NSArray)removedImmutableObjects
{
  return self->_removedImmutableObjects;
}

- (NSIndexSet)indexesOfRemovedObjects
{
  return self->_indexesOfRemovedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfRemovedObjects, 0);
  objc_storeStrong((id *)&self->_removedImmutableObjects, 0);

  objc_storeStrong((id *)&self->_originalObjects, 0);
}

@end