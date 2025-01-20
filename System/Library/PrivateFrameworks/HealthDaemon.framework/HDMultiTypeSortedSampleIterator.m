@interface HDMultiTypeSortedSampleIterator
- (BOOL)advanceWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4;
- (HDMultiTypeSortedSampleIterator)init;
- (HDMultiTypeSortedSampleIterator)initWithQueryDescriptors:(id)a3 includeDeletedObjects:(BOOL)a4 anchor:(id)a5 sortDescriptors:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8;
- (HKDeletedObject)deletedObject;
- (HKSample)sample;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iteratorStateData;
- (id)object;
- (int64_t)objectID;
- (unint64_t)hash;
@end

@implementation HDMultiTypeSortedSampleIterator

- (HDMultiTypeSortedSampleIterator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

HDSortedSampleIterator *__138__HDMultiTypeSortedSampleIterator__upstreamIteratorsWithQueryDescriptors_includeDeletedObjects_sortDescriptors_anchor_bufferSize_profile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[HDSortedSampleIterator alloc] initWithQueryDescriptor:v3 includeDeletedObjects:*(unsigned __int8 *)(a1 + 64) sortDescriptors:*(void *)(a1 + 32) anchor:*(void *)(a1 + 40) bufferSize:*(void *)(a1 + 56) profile:*(void *)(a1 + 48)];

  return v4;
}

- (HDMultiTypeSortedSampleIterator)initWithQueryDescriptors:(id)a3 includeDeletedObjects:(BOOL)a4 anchor:(id)a5 sortDescriptors:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8
{
  BOOL v12 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (![v15 count])
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDMultiTypeSortedSampleIterator.m", 95, @"Invalid parameter not satisfying: %@", @"queryDescriptors.count > 0" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)HDMultiTypeSortedSampleIterator;
  v19 = [(HDMultiTypeSortedSampleIterator *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    queryDescriptors = v19->_queryDescriptors;
    v19->_queryDescriptors = (NSArray *)v20;

    if (v12 && [v17 count])
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, v19, @"HDMultiTypeSortedSampleIterator.m", 101, @"Invalid parameter not satisfying: %@", @"includeDeletedObjects == NO || (includeDeletedObjects && sortDescriptors.count == 0)" object file lineNumber description];
    }
    v19->_includeDeletedObjects = v12;
    uint64_t v22 = [v17 copy];
    sortDescriptors = v19->_sortDescriptors;
    v19->_sortDescriptors = (NSArray *)v22;

    v19->_bufferSize = a7;
    objc_storeWeak((id *)&v19->_profile, v18);
    uint64_t v24 = [v16 copy];
    anchor = v19->_anchor;
    v19->_anchor = (HKSortedQueryAnchor *)v24;

    nextIterator = v19->_nextIterator;
    v19->_nextIterator = 0;

    v19->_isInitialized = 0;
  }

  return v19;
}

BOOL __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 sample];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        id v17 = 0;
        char v11 = [v10 advanceWithError:&v17];
        id v12 = v17;
        v13 = v12;
        if ((v11 & 1) == 0)
        {
          if ((objc_msgSend(v12, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
          {
            id v15 = v13;
            if (v15)
            {
              if (a3) {
                *a3 = v15;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v14 = 0;
            goto LABEL_17;
          }
          [*(id *)(a1 + 40) addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)advanceWithError:(id *)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!self->_isInitialized)
  {
    queryDescriptors = self->_queryDescriptors;
    BOOL includeDeletedObjects = self->_includeDeletedObjects;
    anchor = self->_anchor;
    p_profile = &self->_profile;
    sortDescriptors = self->_sortDescriptors;
    int64_t bufferSize = self->_bufferSize;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v12 = sortDescriptors;
    v13 = anchor;
    id v14 = WeakRetained;
    id v15 = queryDescriptors;
    self;
    uint64_t v72 = MEMORY[0x1E4F143A8];
    uint64_t v73 = 3221225472;
    v74 = __138__HDMultiTypeSortedSampleIterator__upstreamIteratorsWithQueryDescriptors_includeDeletedObjects_sortDescriptors_anchor_bufferSize_profile___block_invoke;
    v75 = &unk_1E6304990;
    BOOL v80 = includeDeletedObjects;
    v76 = v12;
    v77 = v13;
    id v78 = v14;
    int64_t v79 = bufferSize;
    id v16 = v14;
    id v17 = v13;
    long long v18 = v12;
    long long v19 = [(NSArray *)v15 hk_map:&v72];

    uint64_t v4 = self;
    long long v20 = (NSMutableArray *)[v19 mutableCopy];
    iterators = self->_iterators;
    self->_iterators = v20;

    uint64_t v22 = [(NSMutableArray *)self->_iterators hk_filter:&__block_literal_global_155];
    if ([v22 count])
    {
      uint64_t v23 = (HKSortedQueryAnchor *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v24 = objc_loadWeakRetained((id *)p_profile);
      v25 = [v24 database];
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke_2;
      v75 = &unk_1E62F2AE0;
      v26 = v22;
      v76 = v26;
      v77 = v23;
      v27 = v23;
      BOOL v3 = a3;
      BOOL v28 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v25 error:a3 block:&v72];

      [(NSMutableArray *)self->_iterators removeObjectsInArray:v27];
      if (!v28) {
        return 0;
      }
    }
    else
    {

      BOOL v3 = a3;
    }
    self->_isInitialized = 1;
  }
  nextIterator = v4->_nextIterator;
  if (nextIterator)
  {
    id v66 = 0;
    BOOL v30 = [(HDSortedSampleIterator *)nextIterator advanceWithError:&v66];
    id v31 = v66;
    v32 = v31;
    if (!v30)
    {
      if ((objc_msgSend(v31, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
      {
        id v56 = v32;
        if (v56)
        {
          if (v3) {
            id *v3 = v56;
          }
          else {
            _HKLogDroppedError();
          }
        }

        return 0;
      }
      [(NSMutableArray *)v4->_iterators removeObject:v4->_nextIterator];
    }
  }
  if (![(NSMutableArray *)v4->_iterators count])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v3, 900, @"All child iterators of the multi-type iterator are exhausted");
    return 0;
  }
  uint64_t v33 = [(NSMutableArray *)v4->_iterators firstObject];
  v34 = v4->_nextIterator;
  v4->_nextIterator = (HDSortedSampleIterator *)v33;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v4->_iterators;
  uint64_t v61 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v61)
  {
    uint64_t v58 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v63 != v58) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v37 = v4->_sortDescriptors;
        v38 = v4->_nextIterator;
        v39 = v36;
        v40 = v37;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v41 = v40;
        uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v67 objects:&v72 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v68;
          while (2)
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v68 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              v47 = [(HDSortedSampleIterator *)v38 sample];
              v48 = [(HDSortedSampleIterator *)v39 sample];
              uint64_t v49 = [v46 compareObject:v47 toObject:v48];

              if (v49)
              {
                if (v49 == -1) {
                  v52 = v38;
                }
                else {
                  v52 = v39;
                }
                v53 = v52;

                goto LABEL_34;
              }
            }
            uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v67 objects:&v72 count:16];
            if (v43) {
              continue;
            }
            break;
          }
        }

        uint64_t v50 = [(HDSortedSampleIterator *)v38 objectID];
        if (v50 >= [(HDSortedSampleIterator *)v39 objectID]) {
          v51 = v39;
        }
        else {
          v51 = v38;
        }
        v53 = v51;
LABEL_34:
        uint64_t v4 = self;

        v54 = self->_nextIterator;
        self->_nextIterator = v53;
      }
      uint64_t v61 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v61);
  }

  return 1;
}

- (id)object
{
  return [(HDSortedSampleIterator *)self->_nextIterator object];
}

- (HKSample)sample
{
  return [(HDSortedSampleIterator *)self->_nextIterator sample];
}

- (HKDeletedObject)deletedObject
{
  return [(HDSortedSampleIterator *)self->_nextIterator deletedObject];
}

- (int64_t)objectID
{
  return [(HDSortedSampleIterator *)self->_nextIterator objectID];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_queryDescriptors hash];
  uint64_t v4 = [(NSArray *)self->_sortDescriptors hash] ^ v3;
  uint64_t v5 = v4 ^ [(HKSortedQueryAnchor *)self->_anchor hash] ^ self->_bufferSize;
  return v5 ^ [(HDSortedSampleIterator *)self->_nextIterator hash] ^ self->_includeDeletedObjects ^ self->_isInitialized;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDMultiTypeSortedSampleIterator *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      queryDescriptors = self->_queryDescriptors;
      uint64_t v7 = v5->_queryDescriptors;
      BOOL v14 = (queryDescriptors == v7 || v7 && -[NSArray isEqualToArray:](queryDescriptors, "isEqualToArray:"))
         && ((sortDescriptors = self->_sortDescriptors, uint64_t v9 = v5->_sortDescriptors, sortDescriptors == v9)
          || v9 && -[NSArray isEqual:](sortDescriptors, "isEqual:"))
         && ((anchor = self->_anchor, char v11 = v5->_anchor, anchor == v11)
          || v11 && -[HKSortedQueryAnchor isEqual:](anchor, "isEqual:"))
         && self->_bufferSize == v5->_bufferSize
         && ((nextIterator = self->_nextIterator, v13 = v5->_nextIterator, nextIterator == v13)
          || v13 && -[HDSortedSampleIterator isEqual:](nextIterator, "isEqual:"))
         && self->_isInitialized == v5->_isInitialized
         && self->_includeDeletedObjects == v5->_includeDeletedObjects;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [HDMultiTypeSortedSampleIterator alloc];
  if (v5)
  {
    v21.receiver = v5;
    v21.super_class = (Class)HDMultiTypeSortedSampleIterator;
    uint64_t v6 = [(HDMultiTypeSortedSampleIterator *)&v21 init];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSArray *)self->_queryDescriptors copyWithZone:a3];
  queryDescriptors = v6->_queryDescriptors;
  v6->_queryDescriptors = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_sortDescriptors copyWithZone:a3];
  sortDescriptors = v6->_sortDescriptors;
  v6->_sortDescriptors = (NSArray *)v9;

  uint64_t v11 = [(HKSortedQueryAnchor *)self->_anchor copyWithZone:a3];
  anchor = v6->_anchor;
  v6->_anchor = (HKSortedQueryAnchor *)v11;

  v6->_int64_t bufferSize = self->_bufferSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_storeWeak((id *)&v6->_profile, WeakRetained);

  v6->_BOOL includeDeletedObjects = self->_includeDeletedObjects;
  BOOL v14 = [(NSMutableArray *)self->_iterators hk_map:&__block_literal_global_306_0];
  uint64_t v15 = [v14 mutableCopy];
  iterators = v6->_iterators;
  v6->_iterators = (NSMutableArray *)v15;

  uint64_t v17 = [(NSMutableArray *)self->_iterators indexOfObject:self->_nextIterator];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v18 = [(HDSortedSampleIterator *)self->_nextIterator copyWithZone:a3];
  }
  else
  {
    long long v18 = [(NSMutableArray *)v6->_iterators objectAtIndexedSubscript:v17];
  }
  nextIterator = v6->_nextIterator;
  v6->_nextIterator = v18;

  v6->_isInitialized = self->_isInitialized;
  return v6;
}

id __48__HDMultiTypeSortedSampleIterator_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_isInitialized)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDMultiTypeSortedSampleIterator.m", 320, @"Invalid parameter not satisfying: %@", @"!_isInitialized" object file lineNumber description];
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:a4];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v11 = [v9 setWithArray:v10];
    id v12 = [v8 decodeObjectOfClasses:v11 forKey:@"CurrentAnchor"];

    BOOL v13 = v12 != 0;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v14 = v12;
        anchor = self->_anchor;
        self->_anchor = v14;
      }
      else
      {
        anchor = self->_anchor;
        self->_anchor = 0;
      }
    }
    else
    {
      anchor = [v8 error];
      if (anchor)
      {
        if (a4) {
          *a4 = anchor;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)iteratorStateData
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  uint64_t v4 = [(HDSortedSampleIterator *)self->_nextIterator nextAnchor];
  if (v4)
  {
    [v3 encodeObject:v4 forKey:@"CurrentAnchor"];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    [v3 encodeObject:v5 forKey:@"CurrentAnchor"];
  }
  uint64_t v6 = [v3 encodedData];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextIterator, 0);
  objc_storeStrong((id *)&self->_iterators, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end