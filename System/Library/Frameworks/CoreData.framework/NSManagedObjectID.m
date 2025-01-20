@interface NSManagedObjectID
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)_generateTemporaryIDForEntity:(id)a3;
+ (id)_newArchiveForScalarObjectIDs:(uint64_t)a1;
+ (int64_t)version;
+ (uint64_t)unarchivedScalarObjectIDsFromData:(void *)a3 withCoordinator:;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)_preferReferenceData64;
- (BOOL)_tryRetain;
- (BOOL)isTemporaryID;
- (NSEntityDescription)entity;
- (NSManagedObjectID)initWithObject:(id)a3;
- (NSManagedObjectID)initWithPK64:(int64_t)a3;
- (NSPersistentStore)persistentStore;
- (NSString)description;
- (NSURL)URIRepresentation;
- (id)_referenceData;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)entityName;
- (int)_temporaryIDCounter;
- (int64_t)_referenceData64;
- (int64_t)compare:(id)a3;
- (uint64_t)_compareArbitraryValue:(void *)a3 toValue:;
@end

@implementation NSManagedObjectID

- (NSString)description
{
  v3 = (void *)MEMORY[0x18C127630](self, a2);
  v4 = (void *)[[NSString alloc] initWithFormat:@"%p <%@>", self, -[NSManagedObjectID URIRepresentation](self, "URIRepresentation")];

  return (NSString *)v4;
}

+ (id)_newArchiveForScalarObjectIDs:(uint64_t)a1
{
  v116[256] = *MEMORY[0x1E4F143B8];
  self;
  if ([a2 count])
  {
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    v3 = (void *)MEMORY[0x18C127630]();
    uint64_t v89 = objc_opt_class();
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v107 objects:v115 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v108;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v108 != v6) {
            objc_enumerationMutation(a2);
          }
          uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v107 + 1) + 8 * i), "entity"), "managedObjectModel");
          if (v8)
          {
            v9 = (void *)v8;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [a2 countByEnumeratingWithState:&v107 objects:v115 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    v9 = 0;
LABEL_12:
    unint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "entitiesByName"), "count");
    unint64_t v11 = v10;
    if (v10 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    if (v10 >= 0x201) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    size_t v14 = 8 * v12;
    if (v10 > 0x200)
    {
      v87 = (char *)NSAllocateScannedUncollectable();
      v90 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      v87 = (char *)v78 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v87, 8 * v12);
      v90 = (char *)v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v90, v14);
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    uint64_t v17 = [v9 countByEnumeratingWithState:&v103 objects:v114 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v104;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v104 != v19) {
            objc_enumerationMutation(v9);
          }
          v21 = *(void **)(*((void *)&v103 + 1) + 8 * v20);
          uint64_t v22 = [v21 name];
          if (v21) {
            uint64_t v23 = v21[20];
          }
          else {
            uint64_t v23 = 0;
          }
          *(void *)&v90[8 * v23] = v22;
          ++v20;
        }
        while (v18 != v20);
        uint64_t v24 = [v9 countByEnumeratingWithState:&v103 objects:v114 count:16];
        uint64_t v18 = v24;
      }
      while (v24);
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v25 = [a2 countByEnumeratingWithState:&v99 objects:v113 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v100;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v100 != v27) {
            objc_enumerationMutation(a2);
          }
          v29 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * j), "persistentStore"), "_persistentStoreCoordinator");
          if (v29)
          {
            id v84 = v29;
            id v86 = (id)[v29 persistentStores];
            unint64_t v31 = [v86 count];
            if (v31 <= 1) {
              uint64_t v32 = 1;
            }
            else {
              uint64_t v32 = v31;
            }
            if (v31 >= 0x201) {
              uint64_t v33 = 1;
            }
            else {
              uint64_t v33 = v32;
            }
            v34 = (char *)v78 - ((8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0);
            uint64_t v80 = v31;
            unint64_t v81 = v11;
            v79 = v3;
            id v85 = v9;
            if (v31 > 0x200)
            {
              v83 = NSAllocateScannedUncollectable();
            }
            else
            {
              v83 = v34;
              bzero(v34, 8 * v32);
            }
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            uint64_t v35 = [a2 countByEnumeratingWithState:&v95 objects:v112 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              v78[1] = v78;
              int v37 = 0;
              uint64_t v88 = 0;
              uint64_t v38 = *(void *)v96;
              v39 = a2;
              do
              {
                uint64_t v40 = 0;
                do
                {
                  if (*(void *)v96 != v38) {
                    objc_enumerationMutation(a2);
                  }
                  v41 = *(void **)(*((void *)&v95 + 1) + 8 * v40);
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v42 = [v41 entity];
                    if (v42
                      || (uint64_t v42 = objc_msgSend((id)objc_msgSend(v85, "entitiesByName"), "objectForKey:", objc_msgSend(v41, "entityName"))) != 0)
                    {
                      uint64_t v43 = *(void *)(v42 + 160);
                    }
                    else
                    {
                      uint64_t v43 = 0;
                    }
                    uint64_t v44 = [v41 persistentStore];
                    if (!v44)
                    {
                      uint64_t v45 = [v41 _storeIdentifier];
                      uint64_t v44 = [v84 persistentStoreForIdentifier:v45];
                    }
                    if (v42)
                    {
                      if (v44)
                      {
                        ++v37;
                        *(void *)&v87[8 * v43] = 1;
                        if (v44 != v88)
                        {
                          uint64_t v46 = [v86 indexOfObjectIdenticalTo:v44];
                          v83[v46] = 1;
                          uint64_t v88 = v44;
                        }
                      }
                    }
                    a2 = v39;
                  }
                  ++v40;
                }
                while (v36 != v40);
                uint64_t v47 = [a2 countByEnumeratingWithState:&v95 objects:v112 count:16];
                uint64_t v36 = v47;
              }
              while (v47);
              if (v37 >= 1)
              {
                unsigned int v48 = v37;
                uint64_t v49 = v80;
                if (v80 < 1)
                {
                  unsigned __int16 v50 = 0;
                  uint64_t v53 = v81;
                }
                else
                {
                  unsigned __int16 v50 = 0;
                  v51 = v83;
                  uint64_t v52 = v80;
                  uint64_t v53 = v81;
                  do
                  {
                    if (*v51) {
                      void *v51 = (__int16)v50++ + 1;
                    }
                    ++v51;
                    --v52;
                  }
                  while (v52);
                }
                if (v53 < 1)
                {
                  unsigned __int16 v54 = 0;
                }
                else
                {
                  unsigned __int16 v54 = 0;
                  v55 = v87;
                  uint64_t v56 = v53;
                  do
                  {
                    if (*v55) {
                      void *v55 = (__int16)v54++ + 1;
                    }
                    ++v55;
                    --v56;
                  }
                  while (v56);
                }
                v57 = v82;
                _writeInt32IntoData(v82, v48);
                _writeInt16IntoData(v57, v50);
                _writeInt16IntoData(v57, v54);
                v58 = v83;
                if (v49 >= 1)
                {
                  for (uint64_t k = 0; k != v49; ++k)
                  {
                    if (v58[k])
                    {
                      v60 = objc_msgSend((id)objc_msgSend(v86, "objectAtIndex:", k), "identifier");
                      _writeStringIntoData(v60, v82, v116);
                    }
                  }
                }
                if (v53 >= 1)
                {
                  v61 = v87;
                  v62 = (void **)v90;
                  uint64_t v63 = v53;
                  do
                  {
                    if (*v61) {
                      _writeStringIntoData(*v62, v82, v116);
                    }
                    ++v62;
                    ++v61;
                    --v63;
                  }
                  while (v63);
                }
                long long v93 = 0u;
                long long v94 = 0u;
                long long v91 = 0u;
                long long v92 = 0u;
                uint64_t v64 = [a2 countByEnumeratingWithState:&v91 objects:v111 count:16];
                if (v64)
                {
                  uint64_t v65 = v64;
                  uint64_t v66 = *(void *)v92;
                  do
                  {
                    for (uint64_t m = 0; m != v65; ++m)
                    {
                      if (*(void *)v92 != v66) {
                        objc_enumerationMutation(a2);
                      }
                      v68 = *(void **)(*((void *)&v91 + 1) + 8 * m);
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v69 = [v68 entity];
                        if (!v69) {
                          uint64_t v69 = objc_msgSend((id)objc_msgSend(v85, "entitiesByName"), "objectForKey:", objc_msgSend(v68, "entityName"));
                        }
                        uint64_t v70 = [v68 persistentStore];
                        if (!v70)
                        {
                          uint64_t v71 = [v68 _storeIdentifier];
                          uint64_t v70 = [v84 persistentStoreForIdentifier:v71];
                        }
                        if (v69) {
                          BOOL v72 = v70 == 0;
                        }
                        else {
                          BOOL v72 = 1;
                        }
                        if (!v72)
                        {
                          uint64_t v73 = *(void *)&v87[8 * *(void *)(v69 + 160)];
                          unint64_t v74 = [v68 _referenceData64];
                          uint64_t v75 = [v86 indexOfObjectIdenticalTo:v70];
                          v76 = v82;
                          _writeInt16IntoData(v82, (unsigned __int16)v83[v75]);
                          _writeInt16IntoData(v76, (unsigned __int16)v73);
                          _writeInt64IntoData(v76, v74);
                        }
                      }
                    }
                    uint64_t v65 = [a2 countByEnumeratingWithState:&v91 objects:v111 count:16];
                  }
                  while (v65);
                }
              }
            }
            if ((unint64_t)v80 >= 0x201) {
              NSZoneFree(0, v83);
            }
            BOOL v30 = v81 >= 0x201;
            v3 = v79;
            goto LABEL_118;
          }
        }
        uint64_t v26 = [a2 countByEnumeratingWithState:&v99 objects:v113 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    BOOL v30 = v11 >= 0x201;
LABEL_118:
    v77 = v87;
    if (v30)
    {
      NSZoneFree(0, v90);
      NSZoneFree(0, v77);
    }
    return v82;
  }
  else
  {
    v15 = (objc_class *)MEMORY[0x1E4F1C9B8];
    return objc_alloc_init(v15);
  }
}

+ (void)initialize
{
  self;
  self;

  objc_opt_class();
}

+ (uint64_t)unarchivedScalarObjectIDsFromData:(void *)a3 withCoordinator:
{
  v59[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = [a2 length];
  if (v5)
  {
    unint64_t v6 = v5;
    v59[0] = 0;
    uint64_t v55 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v57 = MEMORY[0x18C127630]();
    v7 = (unsigned int *)[a2 bytes];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    v9 = objc_msgSend((id)objc_msgSend(a3, "managedObjectModel"), "entitiesByName");
    unint64_t v10 = [v9 count];
    MEMORY[0x1F4188790](v10);
    if (v10 > 0x200)
    {
      uint64_t v56 = (unsigned char *)NSAllocateScannedUncollectable();
    }
    else
    {
      uint64_t v56 = &v50[-v12];
      bzero(&v50[-v12], 8 * v11);
    }
    if (v6 >= 4)
    {
      int v58 = bswap32(*v7);
      uint64_t v15 = 4;
      v59[0] = 4;
    }
    else
    {
      uint64_t v15 = 0;
      int v58 = 0;
    }
    if ((v15 | 2uLL) <= v6)
    {
      unsigned int v16 = bswap32(*(unsigned __int16 *)((char *)v7 + v15)) >> 16;
      v59[0] = v15 | 2;
      unint64_t v17 = v15 + 4;
      v15 |= 2uLL;
    }
    else
    {
      LOWORD(v16) = 0;
      unint64_t v17 = v15 | 2;
    }
    unsigned __int16 v54 = v50;
    if (v17 <= v6)
    {
      LODWORD(v18) = bswap32(*(unsigned __int16 *)((char *)v7 + v15)) >> 16;
      v59[0] = v17;
    }
    else
    {
      LODWORD(v18) = 0;
    }
    LODWORD(v53) = (__int16)v16;
    if ((__int16)v16 >= 1)
    {
      LOWORD(v19) = 0;
      do
      {
        id StringFromBytes = _newReadStringFromBytes((uint64_t)v7, v59, v6);
        if ([StringFromBytes length]) {
          [v8 addObject:StringFromBytes];
        }

        int v19 = (__int16)(v19 + 1);
      }
      while (v19 < (__int16)v16);
    }
    unint64_t v52 = v10;
    int v51 = v18;
    unsigned __int16 v21 = 0;
    if ((__int16)v18 >= 1)
    {
      uint64_t v18 = v18;
      uint64_t v22 = v56;
      do
      {
        id v23 = _newReadStringFromBytes((uint64_t)v7, v59, v6);
        if ([v23 length])
        {
          uint64_t v24 = (void *)[v9 objectForKey:v23];
          if (v24
            || (!a3 ? (uint64_t v25 = 0) : (uint64_t v25 = (void *)a3[12]),
                (uint64_t v24 = -[_PFModelMap ancillaryEntityWithName:](v25, (uint64_t)v23)) != 0))
          {
            *uint64_t v22 = v24;
            ++v21;
          }
        }

        ++v22;
        --v18;
      }
      while (v18);
    }
    __int16 v26 = [v8 count];
    uint64_t v27 = 0;
    if (v53 == v26)
    {
      __int16 v28 = v51;
      v29 = (void *)v57;
      if (v51 == v21)
      {
        unint64_t v30 = v52;
        if (v55)
        {
          unint64_t v31 = [v8 count];
          unint64_t v32 = MEMORY[0x1F4188790](v31);
          uint64_t v35 = &v50[-v34];
          uint64_t v53 = v36;
          if (v32 > 0x200) {
            uint64_t v35 = (unsigned char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero(&v50[-v34], 8 * v33);
          }
          if ([v8 count])
          {
            unint64_t v37 = 0;
            do
            {
              *(void *)&v35[8 * v37] = objc_msgSend(a3, "persistentStoreForIdentifier:", objc_msgSend(v8, "objectAtIndex:", v37));
              ++v37;
            }
            while (v37 < [v8 count]);
          }
          if (v58 < 1)
          {
            uint64_t v27 = (void *)v55;
          }
          else
          {
            v39 = (void *)v55;
            uint64_t v38 = v56;
            while (v59[0] < v6)
            {
              unint64_t v40 = (v59[0] + 1) & 0xFFFFFFFFFFFFFFFELL;
              unint64_t v41 = v40 + 2;
              if (v40 + 2 <= v6)
              {
                unsigned int v42 = bswap32(*(unsigned __int16 *)((char *)v7 + v40)) >> 16;
                v59[0] = v40 + 2;
                unint64_t v40 = (v40 + 3) & 0xFFFFFFFFFFFFFFFELL;
                unint64_t v43 = v40 + 2;
              }
              else
              {
                unsigned int v42 = 0;
                unint64_t v43 = v40 + 2;
                unint64_t v41 = v59[0];
              }
              if (v43 <= v6)
              {
                unsigned int v44 = bswap32(*(unsigned __int16 *)((char *)v7 + v40)) >> 16;
                v59[0] = v43;
                unint64_t v41 = v43;
              }
              else
              {
                unsigned int v44 = 0;
              }
              unint64_t v45 = (v41 + 7) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v46 = v45 + 8;
              if (v45 + 8 > v6) {
                break;
              }
              uint64_t v27 = 0;
              unint64_t v47 = *(void *)((char *)v7 + v45);
              v59[0] = v46;
              if (!v42 || !v44 || !v47) {
                goto LABEL_66;
              }
              int v48 = (__int16)(v42 - 1);
              uint64_t v49 = v48 >= (__int16)v16 ? 0 : *(void **)&v35[8 * v48];
              if ((__int16)(v44 - 1) >= v28) {
                break;
              }
              uint64_t v27 = 0;
              if (!v49) {
                goto LABEL_66;
              }
              if (!*(void *)&v38[8 * (__int16)(v44 - 1)]) {
                goto LABEL_66;
              }
              uint64_t v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "objectIDFactoryForEntity:"), "alloc"), "initWithPK64:", bswap64(v47));
              if (!v27) {
                goto LABEL_66;
              }
              [v39 addObject:v27];

              if (!--v58)
              {
                uint64_t v27 = v39;
                goto LABEL_66;
              }
            }
            uint64_t v27 = 0;
          }
LABEL_66:
          if (v31 >= 0x201) {
            NSZoneFree(0, v35);
          }
          v29 = (void *)v57;
        }
        goto LABEL_71;
      }
    }
    else
    {
      v29 = (void *)v57;
    }
    unint64_t v30 = v52;
LABEL_71:
    if (v30 >= 0x201) {
      NSZoneFree(0, v56);
    }
    return (uint64_t)v27;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];

  return [v13 array];
}

+ (int64_t)version
{
  return 134481920;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSEntityDescription)entity
{
  return 0;
}

- (NSPersistentStore)persistentStore
{
  return 0;
}

- (BOOL)isTemporaryID
{
  return 0;
}

- (NSURL)URIRepresentation
{
  return 0;
}

- (int)_temporaryIDCounter
{
  return 0;
}

- (uint64_t)_compareArbitraryValue:(void *)a3 toValue:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  if (([a2 isNSNumber] & 1) != 0
    || ([a2 isNSString] & 1) != 0
    || [a2 isNSDate])
  {
    goto LABEL_5;
  }
  if ([a2 isNSData])
  {
    size_t v5 = [a2 length];
    unint64_t v6 = [a3 length];
    if (v5 >= v6) {
      size_t v5 = v6;
    }
    unint64_t v7 = 8 * v5 + 8;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 8 * v5 + 8;
    }
    if (v7 >= 0x201) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    unint64_t v10 = (char *)&v21 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    size_t v11 = 8 * v8;
    if (v7 > 0x200)
    {
      unint64_t v10 = (char *)NSAllocateScannedUncollectable();
      uint64_t v12 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v21 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
      uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v12, v11);
    }
    [a2 getBytes:v10 length:v5];
    [a3 getBytes:v12 length:v5];
    int v16 = memcmp(v10, v12, v5);
    if (v7 >= 0x201)
    {
      NSZoneFree(0, v10);
      NSZoneFree(0, v12);
    }
    uint64_t v17 = 1;
    if (v16 >= 0) {
      uint64_t v17 = -1;
    }
    if (v16) {
      return v17;
    }
    else {
      return 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_5:
      return [a2 compare:a3];
    }
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    [a2 getUUIDBytes:&v24];
    [a3 getUUIDBytes:&v22];
    unint64_t v13 = bswap64(v24);
    unint64_t v14 = bswap64(v22);
    if (v13 == v14 && (unint64_t v13 = bswap64(v25), v14 = bswap64(v23), v13 == v14))
    {
      int v15 = 0;
    }
    else if (v13 < v14)
    {
      int v15 = -1;
    }
    else
    {
      int v15 = 1;
    }
    BOOL v18 = v15 == 0;
    BOOL v19 = v15 < 0;
    uint64_t v20 = 1;
    if (!v19) {
      uint64_t v20 = -1;
    }
    if (v18) {
      return 0;
    }
    else {
      return v20;
    }
  }
}

- (int64_t)compare:(id)a3
{
  int v5 = [(NSManagedObjectID *)self isTemporaryID];
  int v6 = [a3 isTemporaryID];
  if (v5 != v6)
  {
    if (v5) {
      return -1;
    }
    else {
      return 1;
    }
  }
  if ((v5 & v6) == 1)
  {
    id v8 = [(NSManagedObjectID *)self _referenceData];
    uint64_t v9 = [a3 _referenceData];
    if (v8 != (id)v9)
    {
      int64_t result = [v8 compare:v9];
      if (result) {
        return result;
      }
    }
    int v10 = [(NSManagedObjectID *)self _temporaryIDCounter];
    BOOL v11 = v10 <= (int)[a3 _temporaryIDCounter];
    goto LABEL_34;
  }
  id v12 = [(NSManagedObjectID *)self _storeIdentifier];
  uint64_t v13 = [a3 _storeIdentifier];
  if (v12 != (id)v13)
  {
    int64_t result = [v12 compare:v13];
    if (result) {
      return result;
    }
  }
  unint64_t v14 = [(NSManagedObjectID *)self entity];
  if (v14)
  {
    if ((*(unsigned char *)&v14->_entityDescriptionFlags & 4) != 0)
    {
      rootentity = v14->_rootentity;
    }
    else
    {
      do
      {
        rootentity = v14;
        unint64_t v14 = [(NSEntityDescription *)v14 superentity];
      }
      while (v14);
    }
  }
  else
  {
    rootentity = 0;
  }
  uint64_t v16 = [a3 entity];
  if (!v16)
  {
    BOOL v18 = 0;
    if (rootentity) {
      goto LABEL_22;
    }
LABEL_23:
    if (rootentity) {
      BOOL v19 = [(NSEntityDescription *)rootentity name];
    }
    else {
      BOOL v19 = [(NSManagedObjectID *)self entityName];
    }
    uint64_t v20 = v19;
    if (v18) {
      uint64_t v21 = [(NSEntityDescription *)v18 name];
    }
    else {
      uint64_t v21 = [a3 entityName];
    }
    uint64_t v17 = v21;
    if (v20 != (NSString *)v21)
    {
      int64_t result = [(NSString *)v20 compare:v21];
      if (result) {
        return result;
      }
    }
    goto LABEL_31;
  }
  if ((*(unsigned char *)(v16 + 120) & 4) != 0)
  {
    BOOL v18 = *(NSEntityDescription **)(v16 + 72);
  }
  else
  {
    do
    {
      BOOL v18 = (NSEntityDescription *)v16;
      uint64_t v16 = [(id)v16 superentity];
    }
    while (v16);
  }
  if (!rootentity) {
    goto LABEL_23;
  }
LABEL_22:
  if (rootentity != v18) {
    goto LABEL_23;
  }
LABEL_31:
  BOOL v22 = [(NSManagedObjectID *)self _preferReferenceData64];
  int v23 = [a3 _preferReferenceData64];
  if (v22 && v23)
  {
    uint64_t v24 = [(NSManagedObjectID *)self _referenceData64];
    BOOL v11 = v24 <= [a3 _referenceData64];
LABEL_34:
    uint64_t v25 = !v11;
    uint64_t v26 = v11;
    return v25 - v26;
  }
  id v27 = [(NSManagedObjectID *)self _referenceData];
  __int16 v28 = (void *)[a3 _referenceData];

  return -[NSManagedObjectID _compareArbitraryValue:toValue:]((uint64_t)self, v27, v28);
}

- (BOOL)_preferReferenceData64
{
  return 0;
}

- (NSManagedObjectID)initWithObject:(id)a3
{
  return 0;
}

- (NSManagedObjectID)initWithPK64:(int64_t)a3
{
  return 0;
}

- (id)_referenceData
{
  return 0;
}

- (int64_t)_referenceData64
{
  return 0;
}

- (id)_storeIdentifier
{
  v2 = [(NSManagedObjectID *)self persistentStore];

  return [(NSPersistentStore *)v2 identifier];
}

- (id)entityName
{
  v2 = [(NSManagedObjectID *)self entity];

  return [(NSEntityDescription *)v2 name];
}

- (BOOL)_isPersistentStoreAlive
{
  v2 = [(NSManagedObjectID *)self persistentStore];

  return [(NSPersistentStore *)v2 _isPersistentStoreAlive];
}

- (id)_retainedURIString
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

+ (id)_generateTemporaryIDForEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

@end