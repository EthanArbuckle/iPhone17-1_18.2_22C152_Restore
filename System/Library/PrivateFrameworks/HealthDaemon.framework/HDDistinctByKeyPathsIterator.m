@interface HDDistinctByKeyPathsIterator
- (BOOL)advanceWithError:(id *)a3;
- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4;
- (HDDistinctByKeyPathsIterator)init;
- (HDDistinctByKeyPathsIterator)initWithSourceIterator:(id)a3 keyPaths:(id)a4;
- (HKDeletedObject)deletedObject;
- (HKSample)sample;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iteratorStateData;
- (id)object;
- (int64_t)objectID;
@end

@implementation HDDistinctByKeyPathsIterator

- (HDDistinctByKeyPathsIterator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDistinctByKeyPathsIterator)initWithSourceIterator:(id)a3 keyPaths:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDDistinctByKeyPathsIterator.m", 30, @"Invalid parameter not satisfying: %@", @"sourceIterator" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HDDistinctByKeyPathsIterator.m", 31, @"Invalid parameter not satisfying: %@", @"keyPaths" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)HDDistinctByKeyPathsIterator;
  v11 = [(HDDistinctByKeyPathsIterator *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceIterator, a3);
    uint64_t v13 = [v10 copy];
    keyPaths = v12->_keyPaths;
    v12->_keyPaths = (NSArray *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    seenValues = v12->_seenValues;
    v12->_seenValues = v15;
  }
  return v12;
}

- (BOOL)advanceWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSArray *)self->_keyPaths count];
  int v6 = [(HDSampleIterator *)self->_sourceIterator advanceWithError:a3];
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    while (1)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = self->_keyPaths;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v16 = [(HDSampleIterator *)self->_sourceIterator sample];
            v17 = [v16 uniqueIdentifierForDistinctByKeyPath:v15 error:a3];

            if (!v17)
            {
              BOOL v7 = 0;
              goto LABEL_20;
            }
            [v9 addObject:v17];
          }
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v10 = (NSArray *)[v9 copy];
      if (([(NSMutableSet *)self->_seenValues containsObject:v10] & 1) == 0) {
        break;
      }

      BOOL v7 = 0;
      if (([(HDSampleIterator *)self->_sourceIterator advanceWithError:a3] & 1) == 0) {
        return v7;
      }
    }
    [(NSMutableSet *)self->_seenValues addObject:v10];
    BOOL v7 = 1;
LABEL_20:
  }
  return v7;
}

- (id)object
{
  return (id)[(HDSampleIterator *)self->_sourceIterator object];
}

- (HKSample)sample
{
  return (HKSample *)[(HDSampleIterator *)self->_sourceIterator sample];
}

- (int64_t)objectID
{
  return [(HDSampleIterator *)self->_sourceIterator objectID];
}

- (HKDeletedObject)deletedObject
{
  return (HKDeletedObject *)[(HDSampleIterator *)self->_sourceIterator deletedObject];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = +[HDDistinctByKeyPathsIterator allocWithZone:](HDDistinctByKeyPathsIterator, "allocWithZone:");
  int v6 = (void *)[(HDSampleIterator *)self->_sourceIterator copyWithZone:a3];
  BOOL v7 = [(HDDistinctByKeyPathsIterator *)v5 initWithSourceIterator:v6 keyPaths:self->_keyPaths];

  uint64_t v8 = [(NSMutableSet *)self->_seenValues mutableCopy];
  seenValues = v7->_seenValues;
  v7->_seenValues = (NSMutableSet *)v8;

  return v7;
}

- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4
{
  v19[4] = *MEMORY[0x1E4F143B8];
  int v6 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initForReadingFromData:v7 error:a4];

  if (v8)
  {
    id v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"SourceIteratorState"];
    if (v9)
    {
      if ([(HDSampleIterator *)self->_sourceIterator restoreIteratorStateFromData:v9 error:a4])
      {
        v10 = (void *)MEMORY[0x1E4F1CAD0];
        v19[0] = objc_opt_class();
        v19[1] = objc_opt_class();
        v19[2] = objc_opt_class();
        v19[3] = objc_opt_class();
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
        uint64_t v12 = [v10 setWithArray:v11];
        uint64_t v13 = [v8 decodeObjectOfClasses:v12 forKey:@"SeenValues"];

        BOOL v14 = v13 != 0;
        if (v13)
        {
          uint64_t v15 = (NSMutableSet *)[v13 mutableCopy];
          seenValues = self->_seenValues;
          self->_seenValues = v15;
        }
        else
        {
          seenValues = [v8 error];
          if (seenValues)
          {
            if (a4) {
              *a4 = seenValues;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        goto LABEL_19;
      }
    }
    else
    {
      id v17 = [v8 error];
      if (v17)
      {
        if (a4) {
          *a4 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    BOOL v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (id)iteratorStateData
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  uint64_t v4 = [(HDSampleIterator *)self->_sourceIterator iteratorStateData];
  [v3 encodeObject:v4 forKey:@"SourceIteratorState"];

  [v3 encodeObject:self->_seenValues forKey:@"SeenValues"];
  NSUInteger v5 = [v3 encodedData];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenValues, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_storeStrong((id *)&self->_sourceIterator, 0);
}

@end