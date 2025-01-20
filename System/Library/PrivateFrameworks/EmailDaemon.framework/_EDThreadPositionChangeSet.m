@interface _EDThreadPositionChangeSet
- (BOOL)_isMovingObjectID:(id)a3;
- (BOOL)addObjectIDToAdd:(id)a3 before:(id)a4;
- (BOOL)addObjectIDToMove:(id)a3 before:(id)a4;
- (BOOL)isAddingObjectID:(id)a3;
- (BOOL)isDeletingObjectID:(id)a3;
- (NSMutableDictionary)objectIDsToAddByBeforeObjectID;
- (NSMutableDictionary)objectIDsToMoveByBeforeObjectID;
- (NSMutableSet)objectIDsToDelete;
- (_EDThreadPositionChangeSet)init;
- (id)description;
- (void)addObjectIDToDelete:(id)a3;
- (void)setObjectIDsToAddByBeforeObjectID:(id)a3;
- (void)setObjectIDsToDelete:(id)a3;
- (void)setObjectIDsToMoveByBeforeObjectID:(id)a3;
@end

@implementation _EDThreadPositionChangeSet

- (_EDThreadPositionChangeSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)_EDThreadPositionChangeSet;
  v2 = [(_EDThreadPositionChangeSet *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectIDsToAddByBeforeObjectID = v2->_objectIDsToAddByBeforeObjectID;
    v2->_objectIDsToAddByBeforeObjectID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectIDsToMoveByBeforeObjectID = v2->_objectIDsToMoveByBeforeObjectID;
    v2->_objectIDsToMoveByBeforeObjectID = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objectIDsToDelete = v2->_objectIDsToDelete;
    v2->_objectIDsToDelete = v7;
  }
  return v2;
}

- (id)description
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41___EDThreadPositionChangeSet_description__block_invoke_2;
  aBlock[3] = &unk_1E6C04AC0;
  id v47 = &__block_literal_global_352_0;
  v21 = _Block_copy(aBlock);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__29;
  v44 = __Block_byref_object_dispose__29;
  id v45 = 0;
  v3 = [(_EDThreadPositionChangeSet *)self objectIDsToAddByBeforeObjectID];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __41___EDThreadPositionChangeSet_description__block_invoke_3;
  v36[3] = &unk_1E6C04AE8;
  id v4 = v21;
  id v37 = v4;
  id v38 = &__block_literal_global_352_0;
  v39 = &v40;
  [v3 enumerateKeysAndObjectsUsingBlock:v36];

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__29;
  v34 = __Block_byref_object_dispose__29;
  id v35 = 0;
  v5 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41___EDThreadPositionChangeSet_description__block_invoke_4;
  v26[3] = &unk_1E6C04AE8;
  id v6 = v4;
  id v27 = v6;
  id v28 = &__block_literal_global_352_0;
  v29 = &v30;
  [v5 enumerateKeysAndObjectsUsingBlock:v26];

  v7 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v10 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v48 count:16];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = *(void *)v23;
      char v14 = 1;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
          if ((v14 & 1) == 0) {
            uint64_t v11 = [v9 appendString:@", "];
          }
          v17 = __41___EDThreadPositionChangeSet_description__block_invoke(v11, v16);
          [v9 appendString:v17];

          char v14 = 0;
          ++v15;
        }
        while (v12 != v15);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v48 count:16];
        uint64_t v12 = v11;
        char v14 = 0;
      }
      while (v11);
    }

    [v9 appendString:@"]"];
  }
  else
  {
    v9 = 0;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v19 = v18;
  if (v41[5]) {
    [v18 appendFormat:@"Add:\n%@", v41[5]];
  }
  if (v31[5])
  {
    if ([v19 length]) {
      [v19 appendString:@"\n"];
    }
    [v19 appendFormat:@"Move:\n%@", v31[5]];
  }
  if (v9)
  {
    if ([v19 length]) {
      [v19 appendString:@"\n"];
    }
    [v19 appendFormat:@"Delete:\n%@", v9];
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v40, 8);

  return v19;
}

- (BOOL)addObjectIDToAdd:(id)a3 before:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  int v10 = [v9 containsObject:v8];

  if (v10)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"EDPrecomputedThreadQueryHandler.m" lineNumber:888 description:@"Adding a thread based on position of a thread that was deleted"];
  }
  uint64_t v11 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
  uint64_t v12 = [v11 objectForKeyedSubscript:v8];

  if (v12
    || [(_EDThreadPositionChangeSet *)self _isMovingObjectID:v8]
    || [(_EDThreadPositionChangeSet *)self isDeletingObjectID:v7])
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v15 = [(_EDThreadPositionChangeSet *)self objectIDsToAddByBeforeObjectID];
    v16 = [v15 objectForKeyedSubscript:v8];

    if (v16)
    {
      [v16 addObject:v7];
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x2020000000;
      char v34 = 1;
      v17 = [(_EDThreadPositionChangeSet *)self objectIDsToAddByBeforeObjectID];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __54___EDThreadPositionChangeSet_addObjectIDToAdd_before___block_invoke;
      id v27 = &unk_1E6C04B10;
      id v18 = v8;
      id v28 = v18;
      id v19 = v7;
      id v29 = v19;
      uint64_t v30 = &v31;
      [v17 enumerateKeysAndObjectsUsingBlock:&v24];

      if (*((unsigned char *)v32 + 24))
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1CA70]);
        v21 = objc_msgSend(v20, "initWithObjects:", v19, 0, v24, v25, v26, v27, v28);
        long long v22 = [(_EDThreadPositionChangeSet *)self objectIDsToAddByBeforeObjectID];
        [v22 setObject:v21 forKeyedSubscript:v18];
      }
      _Block_object_dispose(&v31, 8);
    }

    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)addObjectIDToMove:(id)a3 before:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  int v10 = [v9 containsObject:v7];

  if (v10)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"EDPrecomputedThreadQueryHandler.m" lineNumber:926 description:@"Moving a thread that was deleted"];
  }
  uint64_t v11 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  int v12 = [v11 containsObject:v8];

  if (v12)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"EDPrecomputedThreadQueryHandler.m" lineNumber:927 description:@"Moving a thread based on position of a thread that was deleted"];
  }
  BOOL v13 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
  char v14 = [v13 objectForKeyedSubscript:v7];

  if (!v14)
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__29;
    id v47 = __Block_byref_object_dispose__29;
    id v48 = 0;
    uint64_t v15 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke;
    v40[3] = &unk_1E6C04B38;
    id v16 = v7;
    id v41 = v16;
    uint64_t v42 = &v43;
    [v15 enumerateKeysAndObjectsUsingBlock:v40];

    if (v44[5])
    {
      v17 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
      [v17 setObject:0 forKeyedSubscript:v44[5]];
    }
    id v18 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
    id v19 = [v18 objectForKeyedSubscript:v8];

    if (v19)
    {
      [v19 addObject:v16];
    }
    else
    {
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x2020000000;
      char v39 = 1;
      id v20 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __55___EDThreadPositionChangeSet_addObjectIDToMove_before___block_invoke_2;
      uint64_t v32 = &unk_1E6C04B10;
      id v21 = v8;
      id v33 = v21;
      id v22 = v16;
      id v34 = v22;
      id v35 = &v36;
      [v20 enumerateKeysAndObjectsUsingBlock:&v29];

      if (*((unsigned char *)v37 + 24))
      {
        id v23 = objc_alloc(MEMORY[0x1E4F1CA70]);
        uint64_t v24 = objc_msgSend(v23, "initWithObjects:", v22, 0, v29, v30, v31, v32, v33);
        uint64_t v25 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
        [v25 setObject:v24 forKeyedSubscript:v21];
      }
      _Block_object_dispose(&v36, 8);
    }

    _Block_object_dispose(&v43, 8);
  }

  return v14 == 0;
}

- (void)addObjectIDToDelete:(id)a3
{
  id v5 = a3;
  id v4 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  [v4 addObject:v5];
}

- (BOOL)isAddingObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(_EDThreadPositionChangeSet *)self objectIDsToAddByBeforeObjectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___EDThreadPositionChangeSet_isAddingObjectID___block_invoke;
  v8[3] = &unk_1E6C04B38;
  id v6 = v4;
  id v9 = v6;
  int v10 = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

- (BOOL)_isMovingObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(_EDThreadPositionChangeSet *)self objectIDsToMoveByBeforeObjectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___EDThreadPositionChangeSet__isMovingObjectID___block_invoke;
  v8[3] = &unk_1E6C04B38;
  id v6 = v4;
  id v9 = v6;
  int v10 = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

- (BOOL)isDeletingObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(_EDThreadPositionChangeSet *)self objectIDsToDelete];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableDictionary)objectIDsToAddByBeforeObjectID
{
  return self->_objectIDsToAddByBeforeObjectID;
}

- (void)setObjectIDsToAddByBeforeObjectID:(id)a3
{
}

- (NSMutableDictionary)objectIDsToMoveByBeforeObjectID
{
  return self->_objectIDsToMoveByBeforeObjectID;
}

- (void)setObjectIDsToMoveByBeforeObjectID:(id)a3
{
}

- (NSMutableSet)objectIDsToDelete
{
  return self->_objectIDsToDelete;
}

- (void)setObjectIDsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDsToDelete, 0);
  objc_storeStrong((id *)&self->_objectIDsToMoveByBeforeObjectID, 0);

  objc_storeStrong((id *)&self->_objectIDsToAddByBeforeObjectID, 0);
}

@end