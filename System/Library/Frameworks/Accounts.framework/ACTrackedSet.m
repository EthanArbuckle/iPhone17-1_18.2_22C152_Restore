@interface ACTrackedSet
+ (ACTrackedSet)setWithArray:(id)a3;
+ (ACTrackedSet)setWithSet:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)set;
- (ACTrackedSet)init;
- (ACTrackedSet)initWithArray:(id)a3;
- (ACTrackedSet)initWithCoder:(id)a3;
- (ACTrackedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (ACTrackedSet)initWithSet:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTrackedSet:(id)a3;
- (id)_initWithEnumerable:(id)a3 count:(unint64_t)a4;
- (id)_initWithUnderlyingSet:(id)a3 changesDictionary:(id)a4;
- (id)allModifications;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateModificationsUsingBlock:(id)a3;
- (void)enumerateModificationsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation ACTrackedSet

- (ACTrackedSet)initWithSet:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 95, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  v6 = -[ACTrackedSet _initWithEnumerable:count:](self, "_initWithEnumerable:count:", v5, [v5 count]);

  return v6;
}

- (id)_initWithEnumerable:(id)a3 count:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 107, @"Invalid parameter not satisfying: %@", @"enumerable" object file lineNumber description];
  }
  if (a4 >> 61 || (v8 = malloc_type_malloc(8 * a4, 0x3BDAE5C7uLL)) == 0)
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Failed to allocate backing set buffer" userInfo:0];
    objc_exception_throw(v18);
  }
  v9 = v8;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        v9[v13 + i] = *(void *)(*((void *)&v20 + 1) + 8 * i);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v13 += i;
    }
    while (v12);
  }

  v16 = [(ACTrackedSet *)self initWithObjects:v9 count:a4];
  free(v9);

  return v16;
}

- (ACTrackedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)ACTrackedSet;
  v6 = [(ACTrackedSet *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:a3 count:a4];
    underlyingSet = v6->_underlyingSet;
    v6->_underlyingSet = (NSMutableSet *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    changesDictionary = v6->_changesDictionary;
    v6->_changesDictionary = v9;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesDictionary, 0);

  objc_storeStrong((id *)&self->_underlyingSet, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (ACTrackedSet)setWithSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithSet:v4];

  return (ACTrackedSet *)v5;
}

+ (ACTrackedSet)setWithArray:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithArray:v4];

  return (ACTrackedSet *)v5;
}

- (ACTrackedSet)init
{
  return [(ACTrackedSet *)self initWithObjects:0 count:0];
}

- (ACTrackedSet)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 73, @"Invalid parameter not satisfying: %@", @"coder" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)ACTrackedSet;
  v6 = [(ACTrackedSet *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 allowedClasses];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v9 = [v7 setByAddingObjectsFromArray:v8];

    id v10 = [v5 decodeObjectOfClasses:v9 forKey:@"_underlyingSet"];
    uint64_t v11 = [v10 mutableCopy];
    underlyingSet = v6->_underlyingSet;
    v6->_underlyingSet = (NSMutableSet *)v11;

    uint64_t v13 = [v5 decodeObjectOfClasses:v9 forKey:@"_changesDictionary"];
    uint64_t v14 = [v13 mutableCopy];
    changesDictionary = v6->_changesDictionary;
    v6->_changesDictionary = (NSMutableDictionary *)v14;
  }
  return v6;
}

- (id)_initWithUnderlyingSet:(id)a3 changesDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 84, @"Invalid parameter not satisfying: %@", @"underlyingSet" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 85, @"Invalid parameter not satisfying: %@", @"changesDictionary" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ACTrackedSet;
  id v10 = [(ACTrackedSet *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 mutableCopy];
    underlyingSet = v10->_underlyingSet;
    v10->_underlyingSet = (NSMutableSet *)v11;

    uint64_t v13 = [v9 mutableCopy];
    changesDictionary = v10->_changesDictionary;
    v10->_changesDictionary = (NSMutableDictionary *)v13;
  }
  return v10;
}

- (ACTrackedSet)initWithArray:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ACTrackedSet.m", 101, @"Invalid parameter not satisfying: %@", @"array" object file lineNumber description];
  }
  v6 = -[ACTrackedSet _initWithEnumerable:count:](self, "_initWithEnumerable:count:", v5, [v5 count]);

  return v6;
}

- (unint64_t)count
{
  return [(NSMutableSet *)self->_underlyingSet count];
}

- (id)member:(id)a3
{
  return (id)[(NSMutableSet *)self->_underlyingSet member:a3];
}

- (id)objectEnumerator
{
  return (id)[(NSMutableSet *)self->_underlyingSet objectEnumerator];
}

- (id)allObjects
{
  return (id)[(NSMutableSet *)self->_underlyingSet allObjects];
}

- (id)allModifications
{
  id v2 = (void *)[(NSMutableDictionary *)self->_changesDictionary copy];

  return v2;
}

- (id)anyObject
{
  return (id)[(NSMutableSet *)self->_underlyingSet anyObject];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableSet *)self->_underlyingSet containsObject:a3];
}

- (BOOL)isEqualToTrackedSet:(id)a3
{
  id v4 = (ACTrackedSet *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if ([(NSMutableSet *)self->_underlyingSet isEqualToSet:v4->_underlyingSet])
  {
    char v5 = [(NSMutableDictionary *)self->_changesDictionary isEqualToDictionary:v4->_changesDictionary];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateModificationsUsingBlock:(id)a3
{
}

- (void)enumerateModificationsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)encodeWithCoder:(id)a3
{
  underlyingSet = self->_underlyingSet;
  id v5 = a3;
  [v5 encodeObject:underlyingSet forKey:@"_underlyingSet"];
  [v5 encodeObject:self->_changesDictionary forKey:@"_changesDictionary"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ACTrackedSet allocWithZone:a3];
  underlyingSet = self->_underlyingSet;
  changesDictionary = self->_changesDictionary;

  return [(ACTrackedSet *)v4 _initWithUnderlyingSet:underlyingSet changesDictionary:changesDictionary];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[ACMutableTrackedSet allocWithZone:a3];
  underlyingSet = self->_underlyingSet;
  changesDictionary = self->_changesDictionary;

  return [(ACTrackedSet *)v4 _initWithUnderlyingSet:underlyingSet changesDictionary:changesDictionary];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ (changes: %@)", self->_underlyingSet, self->_changesDictionary];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACTrackedSet *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ACTrackedSet *)self isEqualToTrackedSet:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableSet *)self->_underlyingSet hash];
  return [(NSMutableDictionary *)self->_changesDictionary hash] ^ v3;
}

@end