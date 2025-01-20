@interface _MSPContainerEditAddition
- (NSArray)addedImmutableObjects;
- (NSArray)objects;
- (NSIndexSet)indexesOfAddedObjects;
- (NSString)description;
- (_MSPContainerEditAddition)initWithObjects:(id)a3 indexes:(id)a4 identifiersAtop:(id)a5;
- (id)identifierForObjectAtopAddedImmutableObject:(id)a3;
- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4;
@end

@implementation _MSPContainerEditAddition

- (_MSPContainerEditAddition)initWithObjects:(id)a3 indexes:(id)a4 identifiersAtop:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_MSPContainerEditAddition;
  v31 = [(_MSPContainerEditAddition *)&v36 init];
  if (v31)
  {
    uint64_t v11 = [v8 copy];
    objects = v31->_objects;
    v31->_objects = (NSArray *)v11;

    id v28 = v9;
    uint64_t v13 = [v9 copy];
    indexesOfAddedObjects = v31->_indexesOfAddedObjects;
    v31->_indexesOfAddedObjects = (NSIndexSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    identifiersAtopByIdentifier = v31->_identifiersAtopByIdentifier;
    v31->_identifiersAtopByIdentifier = (NSMapTable *)v15;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v8;
    id obj = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v23 = [v10 objectAtIndexedSubscript:v19 + i];
          v24 = [MEMORY[0x1E4F1CA98] null];

          if (v23 != v24)
          {
            v25 = v31->_identifiersAtopByIdentifier;
            v26 = [v22 storageIdentifier];
            [(NSMapTable *)v25 setObject:v23 forKey:v26];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        v19 += i;
      }
      while (v18);
    }

    id v9 = v28;
    id v8 = v29;
  }

  return v31;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditAddition;
  v4 = [(_MSPContainerEditAddition *)&v9 description];
  v5 = [(_MSPContainerEditAddition *)self addedImmutableObjects];
  v6 = [(_MSPContainerEditAddition *)self indexesOfAddedObjects];
  v7 = [v3 stringWithFormat:@"%@ { adds objects = %@ at indexes = %@ }", v4, v5, v6];

  return (NSString *)v7;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MSPContainerEditAddition *)self objects];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __95___MSPContainerEditAddition_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
  v27 = &unk_1E617E8D0;
  id v23 = v6;
  id v28 = v23;
  id v22 = v7;
  id v29 = v22;
  id v9 = v8;
  id v10 = &v24;
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
        uint64_t v18 = ((void (*)(uint64_t *, void, uint64_t))v26)(v10, *(void *)(*((void *)&v30 + 1) + 8 * v17), v15 + v17);
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

  uint64_t v19 = (void *)[v11 copy];
  uint64_t v20 = (NSArray *)[v19 copy];
  addedImmutableObjects = self->_addedImmutableObjects;
  self->_addedImmutableObjects = v20;
}

- (id)identifierForObjectAtopAddedImmutableObject:(id)a3
{
  identifiersAtopByIdentifier = self->_identifiersAtopByIdentifier;
  v4 = [a3 storageIdentifier];
  v5 = [(NSMapTable *)identifiersAtopByIdentifier objectForKey:v4];

  return v5;
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)addedImmutableObjects
{
  return self->_addedImmutableObjects;
}

- (NSIndexSet)indexesOfAddedObjects
{
  return self->_indexesOfAddedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfAddedObjects, 0);
  objc_storeStrong((id *)&self->_addedImmutableObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);

  objc_storeStrong((id *)&self->_identifiersAtopByIdentifier, 0);
}

@end