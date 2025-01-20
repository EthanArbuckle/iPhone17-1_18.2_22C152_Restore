@interface PFUbiquityKnowledgeVector
+ (BOOL)supportsSecureCoding;
+ (id)createKnowledgeVectorDictionaryFromString:(id)a3;
+ (id)createSetOfAllPeerIDsInKnowledgeVectors:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (PFUbiquityKnowledgeVector)init;
- (PFUbiquityKnowledgeVector)initWithCoder:(id)a3;
- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorDictionary:(id)a3;
- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorString:(id)a3;
- (PFUbiquityKnowledgeVector)initWithStoreKnowledgeVectorDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createKnowledgeVectorString;
- (id)createSetOfAllPeerIDsWithOtherVector:(id)a3;
- (id)description;
- (id)isAncestorOfKnowledgeVector:(id *)result;
- (id)isDescendantOfKnowledgeVector:(id *)result;
- (id)newKnowledgeVectorByAddingKnowledgeVector:(uint64_t)a1;
- (id)newKnowledgeVectorBySubtractingVector:(uint64_t)a1;
- (int64_t)compare:(id)a3;
- (uint64_t)conflictsWithKnowledgeVector:(uint64_t)a1;
- (uint64_t)createAncestorVectorForConflictingVector:(void *)a1;
- (uint64_t)decrementToMinimumWithKnowledgeVector:(uint64_t)result;
- (uint64_t)isZeroVector;
- (uint64_t)newKnowledgeVectorByDecrementingPeerWithID:(uint64_t)a1;
- (uint64_t)newKnowledgeVectorByIncrementingPeerWithID:(uint64_t)a1;
- (uint64_t)updateWithKnowledgeVector:(uint64_t)result;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_updateHash;
- (void)createStoreKnowledgeVectorDictionary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFUbiquityKnowledgeVector

- (PFUbiquityKnowledgeVector)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityKnowledgeVector;
  result = [(PFUbiquityKnowledgeVector *)&v3 init];
  if (result)
  {
    result->_storeKVDict = 0;
    result->_hash = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorString:(id)a3
{
  v4 = [(PFUbiquityKnowledgeVector *)self init];
  if (v4)
  {
    v5 = +[PFUbiquityKnowledgeVector createKnowledgeVectorDictionaryFromString:a3];
    v4->_kv = v5;
    if (v5)
    {
      if (![(NSDictionary *)v5 count]
        && [a3 length]
        && +[PFUbiquityLogging canLogMessageAtLevel:2])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got empty knowledge vector from string: %@", "-[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]", 93, a3);
      }
      [(PFUbiquityKnowledgeVector *)v4 _updateHash];
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to create knowledge vector from string: %@", "-[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]", 89, a3);
      }

      return 0;
    }
  }
  return v4;
}

- (PFUbiquityKnowledgeVector)initWithKnowledgeVectorDictionary:(id)a3
{
  v4 = [(PFUbiquityKnowledgeVector *)self init];
  if (v4)
  {
    v4->_kv = (NSDictionary *)a3;
    [(PFUbiquityKnowledgeVector *)v4 _updateHash];
  }
  return v4;
}

- (PFUbiquityKnowledgeVector)initWithStoreKnowledgeVectorDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9)), "objectForKey:", @"YTRANSACTIONNUMBER"), *(void *)(*((void *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  v10 = [(PFUbiquityKnowledgeVector *)self initWithKnowledgeVectorDictionary:v5];

  v10->_storeKVDict = (NSDictionary *)a3;
  return v10;
}

- (void)dealloc
{
  self->_kv = 0;
  self->_storeKVDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityKnowledgeVector;
  [(PFUbiquityKnowledgeVector *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PFUbiquityKnowledgeVector allocWithZone:a3];
  if (!v4) {
    return 0;
  }
  kv = self->_kv;
  storeKVDict = self->_storeKVDict;
  unint64_t hash = self->_hash;
  uint64_t v8 = [(PFUbiquityKnowledgeVector *)v4 init];
  if (v8)
  {
    v8->_kv = kv;
    v8->_storeKVDict = storeKVDict;
    v8->_unint64_t hash = hash;
  }
  return v8;
}

- (id)description
{
  id v3 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityKnowledgeVector;
  v4 = (void *)[NSString stringWithFormat:@"%@ (%@)", -[PFUbiquityKnowledgeVector description](&v6, sel_description), v3];

  return v4;
}

- (id)createKnowledgeVectorString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  context = (void *)MEMORY[0x18C127630]();
  id v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = (void *)[*(id *)(a1 + 8) objectForKey:v9];
        if (([v4 isEqualToNumber:v10] & 1) == 0)
        {
          if ([v2 length]) {
            [v2 appendString:@":"];
          }
          [v2 appendString:v9];
          [v2 appendString:@":"];
          objc_msgSend(v2, "appendString:", objc_msgSend(v10, "description"));
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v2;
}

- (PFUbiquityKnowledgeVector)initWithCoder:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [a3 decodeDictionaryWithKeysOfClass:v5 objectsOfClass:objc_opt_class() forKey:@"kvDict"];

  return [(PFUbiquityKnowledgeVector *)self initWithKnowledgeVectorDictionary:v6];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    if (a3) {
      v24 = (__CFString *)a3;
    }
    else {
      v24 = @"nil";
    }
    v30 = @"offendingObject";
    v31[0] = v24;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v23, @"Cannot invoke compare with an object that is not a knowledge vector", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1)));
  }
  id v6 = [(PFUbiquityKnowledgeVector *)self createSetOfAllPeerIDsWithOtherVector:a3];
  uint64_t v7 = (void *)[v6 allObjects];

  uint64_t v8 = (void *)[v7 sortedArrayUsingSelector:sel_compare_];
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * v13);
        if (self) {
          id v15 = [(NSDictionary *)self->_kv objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * v13)];
        }
        else {
          id v15 = 0;
        }
        if (v15) {
          long long v16 = v15;
        }
        else {
          long long v16 = v9;
        }
        if (a3) {
          uint64_t v17 = [*((id *)a3 + 1) objectForKey:v14];
        }
        else {
          uint64_t v17 = 0;
        }
        if (v17) {
          uint64_t v18 = (void *)v17;
        }
        else {
          uint64_t v18 = v9;
        }
        uint64_t v19 = [v16 compare:v18];
        if (v19)
        {
          int64_t v21 = v19;
          goto LABEL_25;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v20 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v11 = v20;
    }
    while (v20);
  }
  int64_t v21 = 0;
LABEL_25:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t hash = self->_hash;
  if (hash != [a3 hash]) {
    return 0;
  }
  id v6 = [(PFUbiquityKnowledgeVector *)self createSetOfAllPeerIDsWithOtherVector:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_7:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
      id v12 = [(NSDictionary *)self->_kv objectForKey:v11];
      uint64_t v13 = (void *)[*((id *)a3 + 1) objectForKey:v11];
      uint64_t v14 = v13;
      if (v12)
      {
        if (v13) {
          goto LABEL_16;
        }
        if ([v12 integerValue])
        {
          char v15 = 1;
          goto LABEL_17;
        }
      }
      else if (v13 && [v13 integerValue])
      {
LABEL_16:
        char v15 = 0;
LABEL_17:
        BOOL v16 = 0;
        if (!v12) {
          char v15 = 0;
        }
        if (v14) {
          BOOL v17 = v12 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17 || (v15 & 1) != 0) {
          goto LABEL_31;
        }
        if (![v12 isEqualToNumber:v14])
        {
          BOOL v16 = 0;
          goto LABEL_31;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  BOOL v16 = 1;
LABEL_31:

  return v16;
}

- (unint64_t)length
{
  return [(NSDictionary *)self->_kv count];
}

- (void)_updateHash
{
  id v3 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)self);
  self->_unint64_t hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v3);
}

- (id)isDescendantOfKnowledgeVector:(id *)result
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = result;
    v4 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    uint64_t v5 = (void *)[v3 createSetOfAllPeerIDsWithOtherVector:a2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          uint64_t v12 = [v3[1] objectForKey:v11];
          if (v12) {
            uint64_t v13 = (void *)v12;
          }
          else {
            uint64_t v13 = v4;
          }
          if (a2) {
            uint64_t v14 = [*(id *)(a2 + 8) objectForKey:v11];
          }
          else {
            uint64_t v14 = 0;
          }
          if (v14) {
            char v15 = (void *)v14;
          }
          else {
            char v15 = v4;
          }
          uint64_t v16 = [v13 compare:v15];
          if (v16 == 1)
          {
            int v8 = 1;
          }
          else if (v16 == -1)
          {
            int v18 = 0;
            goto LABEL_26;
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v17 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v7 = v17;
      }
      while (v17);
    }
    else
    {
      int v8 = 0;
    }
    int v18 = 1;
LABEL_26:

    return (id *)(v8 & v18);
  }
  return result;
}

- (id)isAncestorOfKnowledgeVector:(id *)result
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v3 = result;
    v4 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    uint64_t v5 = (void *)[v3 createSetOfAllPeerIDsWithOtherVector:a2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          uint64_t v12 = [v3[1] objectForKey:v11];
          if (v12) {
            uint64_t v13 = (void *)v12;
          }
          else {
            uint64_t v13 = v4;
          }
          if (a2) {
            uint64_t v14 = [*(id *)(a2 + 8) objectForKey:v11];
          }
          else {
            uint64_t v14 = 0;
          }
          if (v14) {
            char v15 = (void *)v14;
          }
          else {
            char v15 = v4;
          }
          uint64_t v16 = [v13 compare:v15];
          if (v16 == -1)
          {
            int v8 = 1;
          }
          else if (v16 == 1)
          {
            int v18 = 0;
            goto LABEL_26;
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v17 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v7 = v17;
      }
      while (v17);
    }
    else
    {
      int v8 = 0;
    }
    int v18 = 1;
LABEL_26:

    return (id *)(v8 & v18);
  }
  return result;
}

- (uint64_t)isZeroVector
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = objc_msgSend(*(id *)(result + 8), "allValues", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          if ([*(id *)(*((void *)&v6 + 1) + 8 * v5) integerValue]) {
            return 0;
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
    return 1;
  }
  return result;
}

- (uint64_t)updateWithKnowledgeVector:(uint64_t)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (id *)result;
    uint64_t v4 = (void *)[*(id *)(result + 8) mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    if (a2) {
      uint64_t v5 = objc_msgSend(*(id *)(a2 + 8), "allKeys", (void)v15);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(v3[1], "objectForKey:", v10, (void)v15);
          uint64_t v12 = (void *)v11;
          if (a2)
          {
            uint64_t v13 = [*(id *)(a2 + 8) objectForKey:v10];
            if (v12) {
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v13 = 0;
            if (v11)
            {
LABEL_11:
              if ([v12 compare:v13] != -1) {
                goto LABEL_13;
              }
            }
          }
          [v4 setObject:v13 forKey:v10];
LABEL_13:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v14 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v7 = v14;
      }
      while (v14);
    }

    v3[1] = v4;
    return [v3 _updateHash];
  }
  return result;
}

- (uint64_t)decrementToMinimumWithKnowledgeVector:(uint64_t)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (id *)result;
    uint64_t v4 = (void *)[*(id *)(result + 8) mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    if (a2) {
      uint64_t v5 = objc_msgSend(*(id *)(a2 + 8), "allKeys", (void)v15);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          uint64_t v11 = objc_msgSend(v3[1], "objectForKey:", v10, (void)v15);
          uint64_t v12 = (void *)v11;
          if (a2)
          {
            uint64_t v13 = [*(id *)(a2 + 8) objectForKey:v10];
            if (v12) {
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v13 = 0;
            if (v11)
            {
LABEL_11:
              if ([v12 compare:v13] != 1) {
                goto LABEL_13;
              }
            }
          }
          [v4 setObject:v13 forKey:v10];
LABEL_13:
          ++v9;
        }
        while (v7 != v9);
        uint64_t v14 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v7 = v14;
      }
      while (v14);
    }

    v3[1] = v4;
    return [v3 _updateHash];
  }
  return result;
}

- (id)createSetOfAllPeerIDsWithOtherVector:(id)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", self, a3, 0);
  id v4 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, v3);

  return v4;
}

+ (id)createSetOfAllPeerIDsInKnowledgeVectors:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = [*(id *)(v8 + 8) allKeys];
        }
        else {
          uint64_t v9 = 0;
        }
        [v3 addObjectsFromArray:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }
  return v3;
}

- (id)newKnowledgeVectorByAddingKnowledgeVector:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    return (id)a1;
  }
  id v3 = (void *)[(id)a1 createSetOfAllPeerIDsWithOtherVector:a2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v11 = [*(id *)(a1 + 8) objectForKey:v10];
      if (v11) {
        long long v12 = (void *)v11;
      }
      else {
        long long v12 = v5;
      }
      uint64_t v13 = [*(id *)(a2 + 8) objectForKey:v10];
      if (v13) {
        long long v14 = (void *)v13;
      }
      else {
        long long v14 = v5;
      }
      unint64_t v15 = [v12 compare:v14];
      if (v15 >= 2)
      {
        if (v15 != -1) {
          continue;
        }
        long long v12 = v14;
      }
      [v4 setObject:v12 forKey:v10];
    }
    uint64_t v7 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v7);
LABEL_20:

  long long v16 = [PFUbiquityKnowledgeVector alloc];
  if (v16)
  {
    uint64_t v17 = *(void **)(a1 + 16);
    uint64_t v18 = [(PFUbiquityKnowledgeVector *)v16 initWithKnowledgeVectorDictionary:v4];
    if (v18) {
      *(void *)(v18 + 16) = v17;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return (id)v18;
}

- (id)newKnowledgeVectorBySubtractingVector:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    id v3 = (void *)[(id)a1 createSetOfAllPeerIDsWithOtherVector:a2];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = v3;
    uint64_t v7 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = [*(id *)(a1 + 8) objectForKey:v11];
          if (v12) {
            uint64_t v13 = (void *)v12;
          }
          else {
            uint64_t v13 = v5;
          }
          uint64_t v14 = [*(id *)(a2 + 8) objectForKey:v11];
          if (v14) {
            unint64_t v15 = (void *)v14;
          }
          else {
            unint64_t v15 = v5;
          }
          uint64_t v16 = [v13 integerValue];
          uint64_t v17 = v16 - [v15 integerValue];
          uint64_t v18 = (void *)[objc_alloc(NSNumber) initWithInteger:v17];
          [v4 setObject:v18 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    long long v19 = [PFUbiquityKnowledgeVector alloc];
    if (v19)
    {
      uint64_t v20 = *(void **)(a1 + 16);
      uint64_t v21 = [(PFUbiquityKnowledgeVector *)v19 initWithKnowledgeVectorDictionary:v4];
      if (v21) {
        *(void *)(v21 + 16) = v20;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }

    return (id)v21;
  }

  return (id)a1;
}

- (uint64_t)createAncestorVectorForConflictingVector:(void *)a1
{
  uint64_t v2 = (uint64_t)a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  id v4 = (void *)[a1 createSetOfAllPeerIDsWithOtherVector:a2];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = v4;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v23;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
      uint64_t v12 = [*(id *)(v2 + 8) objectForKey:v11];
      if (v12) {
        uint64_t v13 = (void *)v12;
      }
      else {
        uint64_t v13 = v5;
      }
      if (a2) {
        uint64_t v14 = [*(id *)(a2 + 8) objectForKey:v11];
      }
      else {
        uint64_t v14 = 0;
      }
      if (v14) {
        unint64_t v15 = (void *)v14;
      }
      else {
        unint64_t v15 = v5;
      }
      unint64_t v16 = [v13 compare:v15];
      if (v16 >= 2)
      {
        if (v16 != -1) {
          goto LABEL_19;
        }
        unint64_t v15 = v13;
      }
      [v21 setObject:v15 forKey:v11];
LABEL_19:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v17 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v8 = v17;
  }
  while (v17);
LABEL_23:

  uint64_t v18 = [PFUbiquityKnowledgeVector alloc];
  if (v18)
  {
    long long v19 = *(void **)(v2 + 16);
    uint64_t v2 = [(PFUbiquityKnowledgeVector *)v18 initWithKnowledgeVectorDictionary:v21];
    if (v2) {
      *(void *)(v2 + 16) = v19;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)newKnowledgeVectorByDecrementingPeerWithID:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = (void *)[*(id *)(a1 + 8) objectForKey:a2];
    uint64_t v5 = [v4 integerValue];
    if (v5) {
      id v6 = (id)[objc_alloc(NSNumber) initWithInteger:v5 - 1];
    }
    else {
      id v6 = v4;
    }
    uint64_t v7 = v6;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(v2 + 8)];
    [v8 setObject:v7 forKey:a2];

    uint64_t v9 = [PFUbiquityKnowledgeVector alloc];
    if (v9)
    {
      uint64_t v10 = *(void **)(v2 + 16);
      uint64_t v2 = [(PFUbiquityKnowledgeVector *)v9 initWithKnowledgeVectorDictionary:v8];
      if (v2) {
        *(void *)(v2 + 16) = v10;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (uint64_t)newKnowledgeVectorByIncrementingPeerWithID:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2), "integerValue");
    uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithInteger:v4 + 1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(v2 + 8)];
    [v6 setObject:v5 forKey:a2];

    uint64_t v7 = [PFUbiquityKnowledgeVector alloc];
    if (v7)
    {
      uint64_t v8 = *(void **)(v2 + 16);
      uint64_t v2 = [(PFUbiquityKnowledgeVector *)v7 initWithKnowledgeVectorDictionary:v6];
      if (v2) {
        *(void *)(v2 + 16) = v8;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (uint64_t)conflictsWithKnowledgeVector:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1 || (-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](a2, a1) & 1) != 0) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
  if (a2) {
    uint64_t v6 = [a2[1] allKeys];
  }
  else {
    uint64_t v6 = 0;
  }
  [v5 addObjectsFromArray:v6];
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithInt:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = [*(id *)(a1 + 8) objectForKey:v13];
        if (v14) {
          unint64_t v15 = (void *)v14;
        }
        else {
          unint64_t v15 = v7;
        }
        if (a2) {
          uint64_t v16 = [a2[1] objectForKey:v13];
        }
        else {
          uint64_t v16 = 0;
        }
        if (v16) {
          uint64_t v17 = (void *)v16;
        }
        else {
          uint64_t v17 = v7;
        }
        if ([v15 compare:v17]) {
          ++v10;
        }
        if (v10 > 1)
        {
          uint64_t v4 = 1;
          goto LABEL_28;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v18 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }
  uint64_t v4 = 0;
LABEL_28:

  return v4;
}

- (void)createStoreKnowledgeVectorDictionary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {
    uint64_t v3 = [v2 mutableCopy];
  }
  else {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  }
  uint64_t v4 = (void *)v3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [*(id *)(a1 + 16) allKeys];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = NSArray_EmptyArray;
  }
  uint64_t v8 = (void *)[v5 initWithArray:v7];
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 8), "allKeys"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = (void *)[*(id *)(a1 + 16) objectForKey:v13];
        if (v14)
        {
          id v15 = (id)[v14 mutableCopy];
          objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v15, "objectForKey:", @"YTRANSACTIONNUMBER"), @"OLDYTRANSACTIONNUMBER");
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        uint64_t v16 = [*(id *)(a1 + 8) objectForKey:v13];
        if (v16) {
          [v15 setObject:v16 forKey:@"YTRANSACTIONNUMBER"];
        }
        [v4 setObject:v15 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v4;
}

+ (id)createKnowledgeVectorDictionaryFromString:(id)a3
{
  uint64_t v3 = (void *)[a3 componentsSeparatedByString:@":"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = (void *)[v3 objectAtIndex:v5];
      if (v5)
      {
        uint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(v7, "integerValue"));
        [v4 setObject:v8 forKey:v6];
      }
      else
      {
        uint64_t v6 = v7;
      }
      ++v5;
    }
    while (v5 < [v3 count]);
  }
  return v4;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end