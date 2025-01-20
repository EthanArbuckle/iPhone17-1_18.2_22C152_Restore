@interface HKIndexableObject
+ (id)indexableObjectWithObject:(id)a3;
+ (id)indexableObjectWithObject:(id)a3 compoundIndex:(unint64_t)a4;
+ (id)indexableObjectWithObject:(id)a3 index:(unsigned __int8)a4 error:(id *)a5;
+ (id)indexableObjectsByApplyingOutermostIndex:(id)a3 expectedCount:(int64_t)a4 error:(id *)a5;
- (HKIndexableObject)init;
- (HKIndexableObject)initWithObject:(id)a3 compoundIndex:(unint64_t)a4;
- (id)indexableObjectCollectingPushingIndex:(unsigned __int8)a3 error:(id *)a4;
- (id)indexableObjectPoppingIndexWithError:(id *)a3;
- (id)object;
- (unint64_t)compoundIndex;
- (unsigned)outermostIndex;
@end

@implementation HKIndexableObject

- (HKIndexableObject)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)indexableObjectWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4 compoundIndex:0];

  return v5;
}

+ (id)indexableObjectWithObject:(id)a3 index:(unsigned __int8)a4 error:(id *)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  if ((v6 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Attempt to create an indexable object with an index of %d (maximum allowed index is %ld)", v6, 127);
    v9 = 0;
  }
  else
  {
    v9 = (void *)[objc_alloc((Class)a1) initWithObject:v8 compoundIndex:v6 | 0x80];
  }

  return v9;
}

+ (id)indexableObjectWithObject:(id)a3 compoundIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithObject:v6 compoundIndex:a4];

  return v7;
}

- (HKIndexableObject)initWithObject:(id)a3 compoundIndex:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKIndexableObject.m", 74, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKIndexableObject;
  id v8 = [(HKIndexableObject *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    id object = v8->_object;
    v8->_id object = (id)v9;

    v8->_compoundIndex = a4;
  }

  return v8;
}

- (id)indexableObjectPoppingIndexWithError:(id *)a3
{
  if ((self->_compoundIndex & 0x80) != 0)
  {
    v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:self->_object compoundIndex:self->_compoundIndex >> 8];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Failed to create a new indexable object by popping index; no outermost index");
    v3 = 0;
  }

  return v3;
}

- (id)indexableObjectCollectingPushingIndex:(unsigned __int8)a3 error:(id *)a4
{
  if ((self->_compoundIndex & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Failed to create a new indexable object by pushing index; already full");
    id v4 = 0;
  }
  else
  {
    id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:self->_object compoundIndex:a3 | 0x80u | (self->_compoundIndex << 8)];
  }

  return v4;
}

- (unsigned)outermostIndex
{
  return self->_compoundIndex & 0x7F;
}

+ (id)indexableObjectsByApplyingOutermostIndex:(id)a3 expectedCount:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if ([v7 count]
    && ([v7 lastObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int64_t v9 = [v8 outermostIndex],
        v8,
        v9 >= a4))
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [v7 lastObject];
    objc_msgSend(v19, "hk_assignError:code:format:", a5, 3, @"Attempt to partition index with an expected count of %ld and a maximum index of %d", a4, objc_msgSend(v10, "outermostIndex"));
    v18 = 0;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = (void *)[v7 mutableCopy];
    if (a4 >= 1)
    {
      unint64_t v12 = 0;
      while (2)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        while ([v11 count])
        {
          v14 = [v11 firstObject];
          unsigned int v15 = [v14 outermostIndex];

          if (v12 < v15) {
            break;
          }
          v16 = [v11 firstObject];
          v17 = [v16 indexableObjectPoppingIndexWithError:a5];

          if (!v17)
          {

            v18 = 0;
            goto LABEL_13;
          }
          [v13 addObject:v17];
          [v11 removeObjectAtIndex:0];
        }
        [v10 addObject:v13];

        if (++v12 != a4) {
          continue;
        }
        break;
      }
    }
    v18 = (void *)[v10 copy];
LABEL_13:
  }

  return v18;
}

- (id)object
{
  return self->_object;
}

- (unint64_t)compoundIndex
{
  return self->_compoundIndex;
}

- (void).cxx_destruct
{
}

@end