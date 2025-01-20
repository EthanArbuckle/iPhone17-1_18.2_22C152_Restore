@interface HKSampleIteratorQueryCursor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQueryAnchor)followingAnchor;
- (HKQueryAnchor)upToAndIncludingAnchor;
- (HKSampleIteratorQueryCursor)init;
- (HKSampleIteratorQueryCursor)initWithCoder:(id)a3;
- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7;
- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 state:(id)a8;
- (NSArray)distinctByKeyPaths;
- (NSArray)queryDescriptors;
- (NSArray)sortDescriptors;
- (NSData)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSampleIteratorQueryCursor

- (HKSampleIteratorQueryCursor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7
{
  return [(HKSampleIteratorQueryCursor *)self initWithQueryDescriptors:a3 sortDescriptors:a4 followingAnchor:a5 upToAndIncludingAnchor:a6 distinctByKeyPaths:a7 state:0];
}

- (HKSampleIteratorQueryCursor)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 state:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v15)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKSampleIteratorQueryCursor.m", 53, @"Invalid parameter not satisfying: %@", @"queryDescriptors" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)HKSampleIteratorQueryCursor;
  v21 = [(HKSampleIteratorQueryCursor *)&v36 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    queryDescriptors = v21->_queryDescriptors;
    v21->_queryDescriptors = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    sortDescriptors = v21->_sortDescriptors;
    v21->_sortDescriptors = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    followingAnchor = v21->_followingAnchor;
    v21->_followingAnchor = (HKQueryAnchor *)v26;

    uint64_t v28 = [v18 copy];
    upToAndIncludingAnchor = v21->_upToAndIncludingAnchor;
    v21->_upToAndIncludingAnchor = (HKQueryAnchor *)v28;

    uint64_t v30 = [v19 copy];
    distinctByKeyPaths = v21->_distinctByKeyPaths;
    v21->_distinctByKeyPaths = (NSArray *)v30;

    uint64_t v32 = [v20 copy];
    state = v21->_state;
    v21->_state = (NSData *)v32;
  }
  return v21;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (HKQueryAnchor)followingAnchor
{
  return self->_followingAnchor;
}

- (HKQueryAnchor)upToAndIncludingAnchor
{
  return self->_upToAndIncludingAnchor;
}

- (NSArray)distinctByKeyPaths
{
  return self->_distinctByKeyPaths;
}

- (NSData)state
{
  return self->_state;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_queryDescriptors hash];
  uint64_t v4 = [(NSArray *)self->_sortDescriptors hash] ^ v3;
  unint64_t v5 = [(HKQueryAnchor *)self->_followingAnchor hash];
  unint64_t v6 = v4 ^ v5 ^ [(HKQueryAnchor *)self->_upToAndIncludingAnchor hash];
  uint64_t v7 = [(NSArray *)self->_distinctByKeyPaths hash];
  return v6 ^ v7 ^ [(NSData *)self->_state hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSampleIteratorQueryCursor *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      queryDescriptors = self->_queryDescriptors;
      uint64_t v7 = v5->_queryDescriptors;
      if (queryDescriptors != v7 && (!v7 || !-[NSArray isEqual:](queryDescriptors, "isEqual:"))) {
        goto LABEL_24;
      }
      sortDescriptors = self->_sortDescriptors;
      v9 = v5->_sortDescriptors;
      if (sortDescriptors != v9 && (!v9 || !-[NSArray isEqual:](sortDescriptors, "isEqual:"))) {
        goto LABEL_24;
      }
      followingAnchor = self->_followingAnchor;
      v11 = v5->_followingAnchor;
      if (followingAnchor != v11 && (!v11 || !-[HKQueryAnchor isEqual:](followingAnchor, "isEqual:"))) {
        goto LABEL_24;
      }
      if (((upToAndIncludingAnchor = self->_upToAndIncludingAnchor,
             v13 = v5->_upToAndIncludingAnchor,
             upToAndIncludingAnchor == v13)
         || v13 && -[HKQueryAnchor isEqual:](upToAndIncludingAnchor, "isEqual:"))
        && ((distinctByKeyPaths = self->_distinctByKeyPaths, id v15 = v5->_distinctByKeyPaths, distinctByKeyPaths == v15)
         || v15 && -[NSArray isEqual:](distinctByKeyPaths, "isEqual:"))
        && ((state = self->_state, id v17 = v5->_state, state == v17)
         || v17 && -[NSData isEqual:](state, "isEqual:")))
      {
        BOOL v18 = 1;
      }
      else
      {
LABEL_24:
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  queryDescriptors = self->_queryDescriptors;
  id v5 = a3;
  [v5 encodeObject:queryDescriptors forKey:@"queryDescriptors"];
  [v5 encodeObject:self->_sortDescriptors forKey:@"SortDescriptors"];
  [v5 encodeObject:self->_followingAnchor forKey:@"FollowingAnchor"];
  [v5 encodeObject:self->_upToAndIncludingAnchor forKey:@"UpToAndIncludingAnchor"];
  [v5 encodeObject:self->_distinctByKeyPaths forKey:@"DistinctByKeyPaths"];
  [v5 encodeObject:self->_state forKey:@"State"];
}

- (HKSampleIteratorQueryCursor)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  id v5 = [v3 decodeObjectOfClasses:v4 forKey:@"queryDescriptors"];

  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"SortDescriptors"];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FollowingAnchor"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"UpToAndIncludingAnchor"];
  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
  v11 = [v3 decodeObjectOfClasses:v10 forKey:@"DistinctByKeyPaths"];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"State"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v17++) allowEvaluation];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  BOOL v18 = [(HKSampleIteratorQueryCursor *)self initWithQueryDescriptors:v5 sortDescriptors:v13 followingAnchor:v8 upToAndIncludingAnchor:v9 distinctByKeyPaths:v11 state:v12];
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_distinctByKeyPaths, 0);
  objc_storeStrong((id *)&self->_upToAndIncludingAnchor, 0);
  objc_storeStrong((id *)&self->_followingAnchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end