@interface HMFOrderedDictionary
+ (BOOL)supportsSecureCoding;
+ (id)orderedDictionary;
+ (id)orderedDictionaryWithObject:(id)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMFOrderedDictionary)init;
- (HMFOrderedDictionary)initWithCoder:(id)a3;
- (HMFOrderedDictionary)initWithObject:(id)a3 forKey:(id)a4;
- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4;
- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6;
- (HMFOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4;
- (NSArray)allKeys;
- (NSArray)allValues;
- (id)_valueForKey:(id *)a1;
- (id)initBySortingDictionary:(id)a3;
- (id)initBySortingDictionary:(id)a3 copyItems:(BOOL)a4 keyComparator:(id)a5;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)mutableUnorderedCopy;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (id)unorderedCopy;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation HMFOrderedDictionary

+ (id)orderedDictionary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)orderedDictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithObject:v7 forKey:v6];

  return v8;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v8 count];
  if (v9 != v10)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"Count of objects (%lu) differs from count of keys (%lu)", v9, v10);
    id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];

    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMFOrderedDictionary;
  v11 = [(HMFOrderedDictionary *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objects, a3);
    objc_storeStrong((id *)&v12->_keys, a4);
  }

  return v12;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (v10 && v7)
  {
    v11 = (objc_class *)MEMORY[0x1E4F1C978];
    id v12 = a4;
    uint64_t v13 = [[v11 alloc] initWithArray:v10 copyItems:1];
  }
  else
  {
    id v14 = a4;
    uint64_t v13 = [v10 copy];
  }
  uint64_t v15 = (void *)v13;

  v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v18 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  if (a4) {
    id v19 = a4;
  }
  else {
    id v19 = v16;
  }
  v20 = (void *)[v18 initWithArray:v19 copyItems:v6];

  v21 = [(HMFOrderedDictionary *)self initWithObjects:v17 orderedKeySet:v20];
  return v21;
}

- (HMFOrderedDictionary)init
{
  return [(HMFOrderedDictionary *)self initWithObjects:0 forKeys:0 copyObjects:0 copyKeys:0];
}

- (HMFOrderedDictionary)initWithObject:(id)a3 forKey:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:v14 count:1];
  id v13 = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  v11 = [(HMFOrderedDictionary *)self initWithObjects:v9 forKeys:v10 copyObjects:0 copyKeys:1];
  return v11;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4
{
  return [(HMFOrderedDictionary *)self initWithObjects:a3 forKeys:a4 copyObjects:0 copyKeys:1];
}

- (id)initBySortingDictionary:(id)a3
{
  return [(HMFOrderedDictionary *)self initBySortingDictionary:a3 copyItems:0 keyComparator:&__block_literal_global_46];
}

- (id)initBySortingDictionary:(id)a3 copyItems:(BOOL)a4 keyComparator:(id)a5
{
  BOOL v5 = a4;
  v11 = 0;
  id v12 = 0;
  sortKeysAndValuesOfDictionary(a3, a5, &v12, &v11);
  id v7 = v11;
  id v8 = v12;
  uint64_t v9 = [(HMFOrderedDictionary *)self initWithObjects:v11 forKeys:v12 copyObjects:v5 copyKeys:0];

  return v9;
}

- (unint64_t)count
{
  return [(NSArray *)self->_objects count];
}

- (NSArray)allKeys
{
  return [(NSOrderedSet *)self->_keys array];
}

- (NSArray)allValues
{
  return self->_objects;
}

- (id)objectForKey:(id)a3
{
  return -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, a3);
}

- (id)_valueForKey:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1[2] indexOfObject:v3];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      a1 = [a1[1] objectAtIndex:v4];
    }
  }

  return a1;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, a3);
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    _HMFPreconditionFailure(@"notFoundMarker");
  }
  id v8 = v7;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, *(void **)(*((void *)&v20 + 1) + 8 * i));
        v16 = (void *)v15;
        if (v15) {
          id v17 = (void *)v15;
        }
        else {
          id v17 = v8;
        }
        objc_msgSend(v9, "addObject:", v17, (void)v20);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v18 = (void *)[v9 copy];
  return v18;
}

- (id)keyEnumerator
{
  return [(NSOrderedSet *)self->_keys objectEnumerator];
}

- (id)objectEnumerator
{
  return [(NSArray *)self->_objects objectEnumerator];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  keys = self->_keys;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HMFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E59586D8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSOrderedSet *)keys enumerateObjectsWithOptions:a3 usingBlock:v9];
}

void __70__HMFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = a2;
  id v9 = [v7 objectAtIndex:a3];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v8, v9, a4);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMFOrderedDictionary *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      if ([(NSOrderedSet *)self->_keys isEqualToOrderedSet:v5->_keys]) {
        BOOL v6 = [(NSArray *)self->_objects isEqualToArray:v5->_objects];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFOrderedDictionary)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.keys"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.objects"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [NSString stringWithFormat:@"%@ and %@ must be present", @"HMF.keys", @"HMF.objects"];
    uint64_t v12 = LABEL_10:;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v16 = [v13 errorWithDomain:v14 code:4864 userInfo:v15];
    [v4 failWithError:v16];

    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = [v5 count];
  uint64_t v10 = [v7 count];
  if (v10 != v9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"count of objects (%lu) differs from count of keys (%lu)", v10, v9);
    goto LABEL_10;
  }
  self = [(HMFOrderedDictionary *)self initWithObjects:v7 forKeys:v5 copyObjects:0 copyKeys:0];
  uint64_t v11 = self;
LABEL_11:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  keys = self->_keys;
  id v5 = a3;
  uint64_t v6 = [(NSOrderedSet *)keys array];
  [v5 encodeObject:v6 forKey:@"HMF.keys"];

  id v7 = (id)[(NSArray *)self->_objects copy];
  [v5 encodeObject:v7 forKey:@"HMF.objects"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMFMutableOrderedDictionary alloc];
  id v5 = (void *)[(NSArray *)self->_objects mutableCopy];
  uint64_t v6 = (void *)[(NSOrderedSet *)self->_keys mutableCopy];
  id v7 = [(HMFMutableOrderedDictionary *)v4 initWithObjects:v5 orderedKeySet:v6];

  return v7;
}

- (id)unorderedCopy
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  objects = self->_objects;
  id v5 = [(NSOrderedSet *)self->_keys array];
  uint64_t v6 = (void *)[v3 initWithObjects:objects forKeys:v5];

  return v6;
}

- (id)mutableUnorderedCopy
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  objects = self->_objects;
  id v5 = [(NSOrderedSet *)self->_keys array];
  uint64_t v6 = (void *)[v3 initWithObjects:objects forKeys:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end