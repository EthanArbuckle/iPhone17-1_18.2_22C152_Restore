@interface _MSPContainerEditReplacement
- (NSArray)originalImmutableObjects;
- (NSArray)originalObjects;
- (NSArray)replacementImmutableObjects;
- (NSArray)replacementObjects;
- (NSIndexSet)indexesOfReplacedObjects;
- (NSString)description;
- (_MSPContainerEditReplacement)initWithOriginalObjects:(id)a3 replacementObjects:(id)a4 indexes:(id)a5;
- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4;
@end

@implementation _MSPContainerEditReplacement

- (_MSPContainerEditReplacement)initWithOriginalObjects:(id)a3 replacementObjects:(id)a4 indexes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MSPContainerEditReplacement;
  v11 = [(_MSPContainerEditReplacement *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    originalObjects = v11->_originalObjects;
    v11->_originalObjects = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    replacementObjects = v11->_replacementObjects;
    v11->_replacementObjects = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    indexesOfReplacedObjects = v11->_indexesOfReplacedObjects;
    v11->_indexesOfReplacedObjects = (NSIndexSet *)v16;
  }
  return v11;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_MSPContainerEditReplacement;
  v4 = [(_MSPContainerEditReplacement *)&v10 description];
  v5 = [(_MSPContainerEditReplacement *)self originalImmutableObjects];
  v6 = [(_MSPContainerEditReplacement *)self replacementImmutableObjects];
  v7 = [(_MSPContainerEditReplacement *)self indexesOfReplacedObjects];
  id v8 = [v3 stringWithFormat:@"%@ { replaces original objects = %@ with objects = %@ at indexes = %@ }", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MSPContainerEditReplacement *)self originalObjects];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v47 = __98___MSPContainerEditReplacement_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
  v48 = &unk_1E617E8D0;
  id v38 = v6;
  id v49 = v38;
  id v36 = v7;
  id v50 = v36;
  id v9 = v8;
  objc_super v10 = v46;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v52;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = ((void (*)(void *, void, uint64_t))v47)(v10, *(void *)(*((void *)&v51 + 1) + 8 * v17), v15 + v17);
        if (v18) {
          objc_msgSend(v11, "addObject:", v18, v36, v38);
        }

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
      v15 += v17;
    }
    while (v14);
  }

  objc_super v19 = (void *)[v11 copy];
  v20 = (NSArray *)[v19 copy];
  originalImmutableObjects = self->_originalImmutableObjects;
  self->_originalImmutableObjects = v20;

  v22 = [(_MSPContainerEditReplacement *)self replacementObjects];
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __98___MSPContainerEditReplacement_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke_2;
  v43 = &unk_1E617E8D0;
  id v39 = v38;
  id v44 = v39;
  id v37 = v36;
  id v45 = v37;
  id v23 = v22;
  v24 = &v40;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v26 = v23;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = 0;
    uint64_t v30 = *(void *)v52;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = ((void (*)(uint64_t *, void, uint64_t))v42)(v24, *(void *)(*((void *)&v51 + 1) + 8 * v31), v29 + v31);
        if (v32) {
          objc_msgSend(v25, "addObject:", v32, v37, v39, v40, v41);
        }

        ++v31;
      }
      while (v28 != v31);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v55 count:16];
      v29 += v31;
    }
    while (v28);
  }

  v33 = (void *)[v25 copy];
  v34 = (NSArray *)[v33 copy];
  replacementImmutableObjects = self->_replacementImmutableObjects;
  self->_replacementImmutableObjects = v34;
}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (NSArray)originalImmutableObjects
{
  return self->_originalImmutableObjects;
}

- (NSArray)replacementObjects
{
  return self->_replacementObjects;
}

- (NSArray)replacementImmutableObjects
{
  return self->_replacementImmutableObjects;
}

- (NSIndexSet)indexesOfReplacedObjects
{
  return self->_indexesOfReplacedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfReplacedObjects, 0);
  objc_storeStrong((id *)&self->_replacementImmutableObjects, 0);
  objc_storeStrong((id *)&self->_replacementObjects, 0);
  objc_storeStrong((id *)&self->_originalImmutableObjects, 0);

  objc_storeStrong((id *)&self->_originalObjects, 0);
}

@end