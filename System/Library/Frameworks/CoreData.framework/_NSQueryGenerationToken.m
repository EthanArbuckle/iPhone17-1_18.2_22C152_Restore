@interface _NSQueryGenerationToken
+ (BOOL)supportsSecureCoding;
+ (uint64_t)identifierIsForNonGenerationalStore:(uint64_t)a1;
- (BOOL)_moor:(uint64_t)a3 error:;
- (BOOL)isEqual:(id)a3;
- (_NSQueryGenerationToken)autorelease;
- (_NSQueryGenerationToken)initWithCoder:(id)a3;
- (_NSQueryGenerationToken)retain;
- (_WORD)_generationalComponentForStore:(uint64_t)a1;
- (_WORD)_storesForRequestRoutingFrom:(uint64_t *)a3 error:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)persistentStoreCoordinator;
- (uint64_t)_expectedStores;
- (void)_initWithValue:(int)a3 singleton:;
- (void)_makeConcrete:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initForNonGenerationalStore:(void *)result;
- (void)initWithValue:(void *)a3 store:(int)a4 freeValueOnDealloc:;
- (void)release;
@end

@implementation _NSQueryGenerationToken

- (_NSQueryGenerationToken)autorelease
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    return [(_NSQueryGenerationToken *)&v2 autorelease];
  }
  return self;
}

- (_NSQueryGenerationToken)retain
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    return [(_NSQueryGenerationToken *)&v2 retain];
  }
  return self;
}

- (_WORD)_generationalComponentForStore:(uint64_t)a1
{
  objc_super v2 = (_WORD *)a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    __int16 v4 = *(_WORD *)(a1 + 32);
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v7 = *(void **)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = (_WORD *)-[_NSQueryGenerationToken _generationalComponentForStore:](*(void *)(*((void *)&v14 + 1) + 8 * i), a2);
            if (v12)
            {
              objc_super v2 = v12;
              if ((v12[16] & 2) == 0) {
                return v12;
              }
              return v2;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          objc_super v2 = 0;
          if (v9) {
            continue;
          }
          break;
        }
      }
      else
      {
        return 0;
      }
    }
    else if ((v4 & 2) == 0)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      if (v5) {
        id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
      }
      else {
        id WeakRetained = 0;
      }
      if (WeakRetained != a2) {
        objc_super v2 = 0;
      }
    }
  }
  return v2;
}

- (void)release
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    [(_NSQueryGenerationToken *)&v2 release];
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_flags & 0xF) == 4)
  {
    store = self->_store;
    if (store) {
      id WeakRetained = objc_loadWeakRetained(&store->_object);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained freeQueryGenerationWithIdentifier:self->_generationIdentifier];
  }
  self->_storeIdentifier = 0;

  self->_generationIdentifier = 0;
  self->_store = 0;
  v5.receiver = self;
  v5.super_class = (Class)_NSQueryGenerationToken;
  [(_NSQueryGenerationToken *)&v5 dealloc];
}

- (id)persistentStoreCoordinator
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xA) != 0) {
    return 0;
  }
  if (flags)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id generationIdentifier = self->_generationIdentifier;
    id result = (id)[generationIdentifier countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v8 = result;
      uint64_t v9 = *(void *)v12;
LABEL_10:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(generationIdentifier);
        }
        id result = (id)[*(id *)(*((void *)&v11 + 1) + 8 * v10) persistentStoreCoordinator];
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = (id)[generationIdentifier countByEnumeratingWithState:&v11 objects:v15 count:16];
          id result = 0;
          if (v8) {
            goto LABEL_10;
          }
          return result;
        }
      }
    }
  }
  else
  {
    store = self->_store;
    if (store) {
      id WeakRetained = objc_loadWeakRetained(&store->_object);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v6 = (void *)[WeakRetained _persistentStoreCoordinator];

    return v6;
  }
  return result;
}

- (void)initWithValue:(void *)a3 store:(int)a4 freeValueOnDealloc:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = -[_NSQueryGenerationToken _initWithValue:singleton:](a1, a2, 0);
  if (v6)
  {
    if (a3)
    {
      v6[1] = (id)[a3 identifier];
      v6[2] = [[_PFWeakReference alloc] initWithObject:a3];
    }
    *((_WORD *)v6 + 16) &= ~1u;
    if (a4) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *((_WORD *)v6 + 16) = v6[4] & 0xFFFB | v7;
  }
  return v6;
}

- (void)_initWithValue:(int)a3 singleton:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)_NSQueryGenerationToken;
  objc_super v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    if ([a2 isNSData]) {
      uint64_t v6 = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], a2);
    }
    else {
      uint64_t v6 = a2;
    }
    v5[3] = v6;
    if (a3) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *((_WORD *)v5 + 16) = v5[4] & 0xFFFD | v7;
    *((_WORD *)v5 + 16) &= ~4u;
    *((_WORD *)v5 + 16) &= ~8u;
  }
  return v5;
}

- (_WORD)_storesForRequestRoutingFrom:(uint64_t *)a3 error:
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    if ((result[16] & 8) == 0) {
      goto LABEL_9;
    }
    uint64_t v21 = 0;
    BOOL v6 = -[_NSQueryGenerationToken _moor:error:]((uint64_t)result, a2, (uint64_t)&v21);
    BOOL v7 = v6;
    if (a3 && !v6)
    {
      uint64_t v8 = v21;
      if (!v21)
      {
        objc_super v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = *MEMORY[0x1E4F281F8];
        v23[0] = @"reason";
        v23[1] = @"expected stores";
        v24[0] = @"Can't reattach all stores specified by token";
        v24[1] = -[_NSQueryGenerationToken _expectedStores](v4);
        uint64_t v8 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
      }
      *a3 = v8;
    }
    if (!v7)
    {
      return 0;
    }
    else
    {
LABEL_9:
      long long v11 = (void *)[a2 mutableCopy];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v12 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(a2);
            }
            uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (!-[_NSQueryGenerationToken _generationalComponentForStore:](v4, v16)) {
              [v11 removeObject:v16];
            }
          }
          uint64_t v13 = [a2 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v13);
      }
      return v11;
    }
  }
  return result;
}

+ (uint64_t)identifierIsForNonGenerationalStore:(uint64_t)a1
{
  self;

  return [@"unsupported" isEqual:a2];
}

- (void)initForNonGenerationalStore:(void *)result
{
  if (result) {
    return -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](result, @"unsupported", a2, 0);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSQueryGenerationToken)initWithCoder:(id)a3
{
  if ([a3 decodeBoolForKey:@"NSQueryTokenIsSingleton"])
  {
    int v5 = [a3 decodeIntForKey:@"NSQueryTokenWhichSingleton"];
    if (v5 == 2)
    {
      BOOL v6 = +[NSQueryGenerationToken currentQueryGenerationToken];
    }
    else if (v5 == 1)
    {
      BOOL v6 = +[NSQueryGenerationToken nostoresQueryGenerationToken];
    }
    else
    {
      BOOL v6 = +[NSQueryGenerationToken unpinnedQueryGenerationToken];
    }
    uint64_t v8 = (_NSQueryGenerationToken *)v6;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_NSQueryGenerationToken;
    BOOL v7 = [(_NSQueryGenerationToken *)&v20 init];
    uint64_t v8 = v7;
    if (v7)
    {
      *(_WORD *)&v7->_flags &= ~2u;
      __int16 v9 = [a3 decodeBoolForKey:@"NSQueryTokenIsCompound"];
      *(_WORD *)&v8->___int16 flags = *(_WORD *)&v8->_flags & 0xFFFE | v9;
      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0, v19);
      }
      else
      {
        v8->_storeIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSQueryTokenStoreIdentifier"];
        uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        uint64_t v12 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      }
      uint64_t v16 = (void *)[a3 decodeObjectOfClasses:v12 forKey:@"NSQueryTokenGenerationIdentifier"];
      if ([v16 isNSData]) {
        long long v17 = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], v16);
      }
      else {
        long long v17 = v16;
      }
      v8->_id generationIdentifier = v17;
      *(_WORD *)&v8->_flags |= 8u;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:(*(_WORD *)&self->_flags >> 1) & 1 forKey:@"NSQueryTokenIsSingleton"];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    if (+[NSQueryGenerationToken nostoresQueryGenerationToken] == self)uint64_t v7 = 1; {
    else
    }
      uint64_t v7 = 2
         * (+[NSQueryGenerationToken currentQueryGenerationToken] == (NSQueryGenerationToken *)self);
    [a3 encodeInt:v7 forKey:@"NSQueryTokenWhichSingleton"];
  }
  else
  {
    [a3 encodeBool:flags & 1 forKey:@"NSQueryTokenIsCompound"];
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      [a3 encodeObject:self->_storeIdentifier forKey:@"NSQueryTokenStoreIdentifier"];
    }
    uint64_t generationIdentifier = (uint64_t)self->_generationIdentifier;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t generationIdentifier = -[_PFSQLiteSnapshotWrapper data](generationIdentifier);
    }
    [a3 encodeObject:generationIdentifier forKey:@"NSQueryTokenGenerationIdentifier"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    return self;
  }
  else
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    __int16 v4 = *((_WORD *)v3 + 16);
    *((_WORD *)v3 + 16) = v4 & 0xFFFD;
    *((_WORD *)v3 + 16) = v4 & 0xFFFC | *(_WORD *)&self->_flags & 1;
    if (*(unsigned char *)&self->_flags)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id generationIdentifier = self->_generationIdentifier;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = [generationIdentifier countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(generationIdentifier);
            }
            uint64_t v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v12) copy];
            [v7 addObject:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [generationIdentifier countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }

      *((void *)v3 + 3) = v7;
      __int16 v5 = *((_WORD *)v3 + 16);
    }
    else
    {

      *((void *)v3 + 1) = self->_storeIdentifier;
      *((void *)v3 + 3) = self->_generationIdentifier;
      __int16 v5 = *((_WORD *)v3 + 16) & 0xFFFB;
    }
    *((_WORD *)v3 + 16) = v5 | 8;
    return v3;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      if ((*(_WORD *)&self->_flags & 1) == (*((_WORD *)a3 + 16) & 1))
      {
        if ((*(_WORD *)&self->_flags & 1) != 0
          || (int v5 = [(NSString *)self->_storeIdentifier isEqual:*((void *)a3 + 1)]) != 0)
        {
          id generationIdentifier = self->_generationIdentifier;
          uint64_t v7 = *((void *)a3 + 3);
          LOBYTE(v5) = [generationIdentifier isEqual:v7];
        }
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_flags & 1) == 0) {
    return (id)[NSString stringWithFormat:@"<NSQueryGenerationToken : %@/%@>", self->_storeIdentifier, self->_generationIdentifier];
  }
  __int16 v4 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"<NSQueryGenerationToken : {"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id generationIdentifier = self->_generationIdentifier;
  uint64_t v6 = [generationIdentifier countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(generationIdentifier);
        }
        if (v9) {
          uint64_t v11 = @"%p";
        }
        else {
          uint64_t v11 = @", %p";
        }
        objc_msgSend(v4, "appendFormat:", v11, *(void *)(*((void *)&v12 + 1) + 8 * i));
        char v9 = 0;
      }
      uint64_t v7 = [generationIdentifier countByEnumeratingWithState:&v12 objects:v16 count:16];
      char v9 = 0;
    }
    while (v7);
  }
  [v4 appendString:@"}>"];
  return v4;
}

- (uint64_t)_expectedStores
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  __int16 v2 = *(_WORD *)(a1 + 32);
  if ((v2 & 2) == 0)
  {
    id v3 = (void *)MEMORY[0x1E4F1CA48];
    if ((v2 & 1) == 0)
    {
      uint64_t v4 = *(void *)(a1 + 8);
      return [v3 arrayWithObject:v4];
    }
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = *(void **)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 addObjectsFromArray:-[_NSQueryGenerationToken _expectedStores](*(void *)(*((void *)&v13 + 1) + 8 * i))];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
    return (uint64_t)v7;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];

  return [v6 array];
}

- (void)_makeConcrete:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    __int16 v3 = *(_WORD *)(a1 + 32);
    if ((v3 & 2) == 0)
    {
      if ((v3 & 1) == 0)
      {
        if (!a2)
        {

          *(void *)(a1 + 16) = 0;
          return;
        }
        goto LABEL_15;
      }
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      int v5 = *(void **)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[_NSQueryGenerationToken _makeConcrete:](*(void *)(*((void *)&v10 + 1) + 8 * i), a2);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
      if (a2)
      {
        __int16 v3 = *(_WORD *)(a1 + 32);
LABEL_15:
        *(_WORD *)(a1 + 32) = v3 & 0xFFF7;
      }
    }
  }
}

- (BOOL)_moor:(uint64_t)a3 error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  __int16 v4 = *(_WORD *)(a1 + 32);
  if ((v4 & 2) == 0)
  {
    if (v4)
    {
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      long long v13 = *(void **)(a1 + 24);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v13);
            }
            v16 += -[_NSQueryGenerationToken _moor:error:](*(void *)(*((void *)&v26 + 1) + 8 * i), a2, a3);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v15);
      }
      else
      {
        uint64_t v16 = 0;
      }
      BOOL v12 = [*(id *)(a1 + 24) count] == v16;
      goto LABEL_30;
    }
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v7)
    {
LABEL_27:
      BOOL v12 = 0;
      goto LABEL_30;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(a2);
      }
      long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      if (objc_msgSend(*(id *)(a1 + 8), "isEqual:", objc_msgSend(v11, "identifier"))) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [a2 countByEnumeratingWithState:&v22 objects:v30 count:16];
        BOOL v12 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_30;
      }
    }
    uint64_t v19 = [v11 reopenQueryGenerationWithIdentifier:*(void *)(a1 + 24) error:a3];
    if (!v19) {
      goto LABEL_27;
    }
    uint64_t v20 = v19;
    *(void *)(a1 + 16) = [[_PFWeakReference alloc] initWithObject:v11];
    if (([*(id *)(v20 + 24) isEqual:*(void *)(a1 + 24)] & 1) == 0)
    {

      *(void *)(a1 + 24) = *(id *)(v20 + 24);
    }
    if ((*(_WORD *)(v20 + 32) & 4) != 0)
    {
      *(_WORD *)(a1 + 32) |= 4u;
      *(_WORD *)(v20 + 32) &= ~4u;
    }
  }
  BOOL v12 = 1;
LABEL_30:
  -[_NSQueryGenerationToken _makeConcrete:](a1, v12);
  return v12;
}

@end