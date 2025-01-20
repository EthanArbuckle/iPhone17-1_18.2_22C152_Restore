@interface NSSQLModel
- (BOOL)_generateModelWithError:(id *)a3;
- (NSSQLModel)initWithManagedObjectModel:(id)a3;
- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4;
- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 brokenHashVersion:(unint64_t)a5;
- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 retainHashHack:(BOOL)a5;
- (id)entityForID:(unint64_t)a3;
- (id)entityNamed:(id)a3;
- (id)initWithManagedObjectModel:(uint64_t)a3 configurationName:(uint64_t)a4 retainHashHack:(uint64_t)a5 brokenHashVersion:(uint64_t)a6;
- (id)managedObjectModel;
- (uint64_t)_precomputedKeyOrderForEntity:(uint64_t)result;
- (void)_sqlEntityWithRenamingIdentifier:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSSQLModel

- (id)entityForID:(unint64_t)a3
{
  return (id)CFArrayGetValueAtIndex((CFArrayRef)self->_entities, ~(unint64_t)self->_entityIDOffset + a3);
}

- (BOOL)_generateModelWithError:(id *)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v76 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v75 = [(NSSQLModel *)self managedObjectModel];
  v5 = -[NSManagedObjectModel _sortedEntitiesForConfiguration:](v75, 0);
  uint64_t v6 = [v5 count];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v111 objects:v123 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v112 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v111 + 1) + 8 * i), "name"));
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v111 objects:v123 count:16];
    }
    while (v9);
  }
  v77 = (uint64_t *)a3;
  self->_entitiesByName = (NSKnownKeysDictionary *)[[NSKnownKeysDictionary alloc] initForKeys:v7];

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v107 objects:v122 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v108;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v108 != v14) {
          objc_enumerationMutation(v5);
        }
        v16 = [[NSSQLEntity alloc] initWithModel:self entityDescription:*(void *)(*((void *)&v107 + 1) + 8 * j)];
        [(NSKnownKeysDictionary *)self->_entitiesByName setObject:v16 forKey:[(NSSQLEntity *)v16 name]];
      }
      uint64_t v13 = [v5 countByEnumeratingWithState:&v107 objects:v122 count:16];
    }
    while (v13);
  }
  v17 = (void *)[(NSKnownKeysDictionary *)self->_entitiesByName allValues];
  unsigned int entityIDOffset = self->_entityIDOffset;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v19 = [v17 countByEnumeratingWithState:&v103 objects:v121 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    int v21 = entityIDOffset + 1;
    uint64_t v22 = *(void *)v104;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v104 != v22) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v103 + 1) + 8 * k);
        if (!objc_msgSend((id)objc_msgSend(v24, "entityDescription"), "superentity")) {
          int v21 = -[NSSQLEntity _generateIDWithSuperEntity:nextID:]((uint64_t)v24, 0, v21);
        }
      }
      uint64_t v20 = [v17 countByEnumeratingWithState:&v103 objects:v121 count:16];
    }
    while (v20);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v25 = [v17 countByEnumeratingWithState:&v99 objects:v120 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v100;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v100 != v27) {
          objc_enumerationMutation(v17);
        }
        uint64_t v29 = *(void *)(*((void *)&v99 + 1) + 8 * m);
        v30 = (void *)MEMORY[0x18C127630]();
        if (v29)
        {
          if (!*(void *)(v29 + 160)) {
            -[NSSQLEntity _generateProperties]((void *)v29);
          }
          unsigned int v31 = *(_DWORD *)(v29 + 184);
          if (v31 > self->_lastEntityID) {
            self->_lastEntityID = v31;
          }
        }
      }
      uint64_t v26 = [v17 countByEnumeratingWithState:&v99 objects:v120 count:16];
    }
    while (v26);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v32 = [v17 countByEnumeratingWithState:&v95 objects:v119 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v96;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v96 != v34) {
          objc_enumerationMutation(v17);
        }
        v36 = *(void **)(*((void *)&v95 + 1) + 8 * n);
        v37 = (void *)MEMORY[0x18C127630]();
        -[NSSQLEntity _generateInverseRelationshipsAndMore](v36);
      }
      uint64_t v33 = [v17 countByEnumeratingWithState:&v95 objects:v119 count:16];
    }
    while (v33);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v38 = [v17 countByEnumeratingWithState:&v91 objects:v118 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v92;
    do
    {
      for (iuint64_t i = 0; ii != v39; ++ii)
      {
        if (*(void *)v92 != v40) {
          objc_enumerationMutation(v17);
        }
        v42 = *(id **)(*((void *)&v91 + 1) + 8 * ii);
        -[NSSQLEntity _generateMulticolumnUniquenessConstraints](v42);
        int v43 = -[NSSQLEntity _generateAttributeDerivations:]((uint64_t)v42, v77);
        if (!v43) {
          return v43;
        }
      }
      uint64_t v39 = [v17 countByEnumeratingWithState:&v91 objects:v118 count:16];
    }
    while (v39);
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v44 = [v17 countByEnumeratingWithState:&v87 objects:v117 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v88;
    do
    {
      for (juint64_t j = 0; jj != v45; ++jj)
      {
        if (*(void *)v88 != v46) {
          objc_enumerationMutation(v17);
        }
        v48 = *(void **)(*((void *)&v87 + 1) + 8 * jj);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v49 = (void *)[v48 attributes];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v83 objects:v116 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v84;
          do
          {
            for (kuint64_t k = 0; kk != v51; ++kk)
            {
              if (*(void *)v84 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = *(unsigned char **)(*((void *)&v83 + 1) + 8 * kk);
              if (v54 && v54[24] == 1) {
            }
              }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v83 objects:v116 count:16];
          }
          while (v51);
        }
      }
      uint64_t v45 = [v17 countByEnumeratingWithState:&v87 objects:v117 count:16];
    }
    while (v45);
  }
  v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v74];
  if (v74)
  {
    for (muint64_t m = 0; mm != v74; ++mm)
      objc_msgSend(v55, "addObject:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_entities, "objectAtIndex:", mm), "name"));

    self->_entitiesByName = (NSKnownKeysDictionary *)[[NSKnownKeysDictionary alloc] initForKeys:v55];
    uint64_t v57 = 0;
    char v58 = 0;
    id v82 = 0;
    while (1)
    {
      v59 = (void *)[(NSMutableArray *)self->_entities objectAtIndex:v57];
      -[NSKnownKeysDictionary setObject:forKey:](self->_entitiesByName, "setObject:forKey:", v59, [v59 name]);
      if (self->_retainLeopardStyleDictionaries) {
        goto LABEL_73;
      }
      if (v59) {
        break;
      }
LABEL_86:
      if (v74 == ++v57) {
        goto LABEL_91;
      }
    }
    v61 = (void *)v59[31];
    if (v61)
    {
      _PF_Leopard_CFDictionaryDestroy(v61);
      v59[31] = 0;
      if (self->_retainLeopardStyleDictionaries)
      {
LABEL_73:
        if (!(!self->_hasVirtualToOnes | v58 & 1))
        {
          if (-[NSSQLEntity _entityIsBroken:]((uint64_t)v59, &v82))
          {
            if (v82) {
              id v60 = v82;
            }
            char v58 = 1;
          }
          else
          {
            char v58 = 0;
          }
        }
        if (!v59) {
          goto LABEL_86;
        }
      }
    }
    if (!v59[20]) {
      -[NSSQLEntity _organizeConstraints]((uint64_t)v59);
    }
    goto LABEL_86;
  }

  self->_entitiesByName = (NSKnownKeysDictionary *)[[NSKnownKeysDictionary alloc] initForKeys:v55];
  char v58 = 0;
  id v82 = 0;
LABEL_91:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v62 = [v75 countByEnumeratingWithState:&v78 objects:v115 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v79;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v79 != v64) {
          objc_enumerationMutation(v75);
        }
        v66 = *(void **)(*((void *)&v78 + 1) + 8 * v65);
        if (v66) {
          uint64_t v67 = v66[20];
        }
        else {
          uint64_t v67 = 0;
        }
        self->_entityDescriptionToSQLMap[v67] = (id)-[NSKnownKeysDictionary objectForKey:](self->_entitiesByName, "objectForKey:", [v66 name]);
        ++v65;
      }
      while (v63 != v65);
      uint64_t v68 = [v75 countByEnumeratingWithState:&v78 objects:v115 count:16];
      uint64_t v63 = v68;
    }
    while (v68);
  }
  [v76 drain];
  int v69 = self->_retainLeopardStyleDictionaries & v58;
  if (v69 == 1)
  {
    if (v77)
    {
      v70 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F281F8];
      if (v82) {
        uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v82 forKey:*MEMORY[0x1E4F28A50]];
      }
      else {
        uint64_t v72 = 0;
      }
      uint64_t *v77 = [v70 errorWithDomain:v71 code:134060 userInfo:v72];
    }
  }
  LOBYTE(v43) = v69 ^ 1;
  return v43;
}

- (id)managedObjectModel
{
  return self->_mom;
}

- (uint64_t)_precomputedKeyOrderForEntity:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned char *)(result + 57)
      && (uint64_t v2 = *(void *)(result + 16), v3 = [a2 entityDescription], v2)
      && (uint64_t v4 = *(void *)(v2 + 16)) != 0)
    {
      if (v3) {
        uint64_t v5 = *(void *)(v3 + 160);
      }
      else {
        uint64_t v5 = 0;
      }
      return *(void *)(v4 + 8 * v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)entityNamed:(id)a3
{
  return (id)[(NSKnownKeysDictionary *)self->_entitiesByName objectForKey:a3];
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:]((id *)&self->super.super.isa, a3, 0, 0, 0, v3, v4, v5);
}

- (id)initWithManagedObjectModel:(uint64_t)a3 configurationName:(uint64_t)a4 retainHashHack:(uint64_t)a5 brokenHashVersion:(uint64_t)a6
{
  uint64_t v8 = a1;
  if (a1)
  {
    char v10 = a4;
    if (a3) {
      _NSCoreDataLog(2, @"NSSQLModel initalized with a configuration name (%@) - the configuration will be ignored.", a3, a4, a5, a6, a7, a8, a3);
    }
    v23.receiver = v8;
    v23.super_class = (Class)NSSQLModel;
    uint64_t v8 = (id *)objc_msgSendSuper2(&v23, sel_init);
    if (v8)
    {
      v8[2] = a2;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v8[4] = v12;
      if (v12)
      {
        CFRetain(v12);
      }
      v8[5] = PF_CALLOC_OBJECT_ARRAY(objc_msgSend((id)objc_msgSend(a2, "entitiesByName"), "count"));
      v8[6] = (id)a5;
      *((unsigned char *)v8 + 56) = v10;
      if (a2) {
        BOOL v13 = a2[2] != 0;
      }
      else {
        BOOL v13 = 0;
      }
      *((unsigned char *)v8 + 57) = v13;
      *((_DWORD *)v8 + 15) = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(a2, "_modelsReferenceIDOffset")), "unsignedIntValue");
      *((_DWORD *)v8 + 16) = 0;
      uint64_t v22 = 0;
      if (![v8 _generateModelWithError:&v22])
      {
        if (PFUseToolchainBehaviors()) {
          uint64_t v20 = 4;
        }
        else {
          uint64_t v20 = 2;
        }
        _NSCoreDataLog(v20, @"Unable to generate optimized model (sql model generation failed %@)", v14, v15, v16, v17, v18, v19, v22);

        return 0;
      }
    }
  }
  return v8;
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 brokenHashVersion:(unint64_t)a5
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:]((id *)&self->super.super.isa, a3, (uint64_t)a4, 0, a5, v5, v6, v7);
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  entityDescriptionToSQLMap = self->_entityDescriptionToSQLMap;
  if (entityDescriptionToSQLMap)
  {
    PF_FREE_OBJECT_ARRAY(entityDescriptionToSQLMap);
    self->_entityDescriptionToSQLMap = 0;
  }
  entities = self->_entities;
  if (entities)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(NSMutableArray *)entities countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(entities);
          }
          CFRelease(*(CFTypeRef *)(*((void *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)entities countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    CFRelease(self->_entities);
    self->_entities = 0;
  }

  self->_entitiesByName = 0;
  self->_mouint64_t m = 0;
  v9.receiver = self;
  v9.super_class = (Class)NSSQLModel;
  [(NSStoreMapping *)&v9 dealloc];
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:]((id *)&self->super.super.isa, a3, (uint64_t)a4, 0, 0, v4, v5, v6);
}

- (NSSQLModel)initWithManagedObjectModel:(id)a3 configurationName:(id)a4 retainHashHack:(BOOL)a5
{
  return (NSSQLModel *)-[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:brokenHashVersion:]((id *)&self->super.super.isa, a3, (uint64_t)a4, a5, 0, v5, v6, v7);
}

- (void)_sqlEntityWithRenamingIdentifier:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[*(id *)(a1 + 24) objectForKey:a2];
  if (v4)
  {
    uint64_t v5 = v4;
    if (objc_msgSend(a2, "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "entityDescription"), "renamingIdentifier")))return v5; {
  }
    }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 24), "allValues", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v13;
LABEL_6:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v13 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v5 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "entityDescription"), "renamingIdentifier"), "isEqualToString:", a2))return v5; {
    if (v8 == ++v10)
    }
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = 0;
      if (v8) {
        goto LABEL_6;
      }
      return v5;
    }
  }
}

@end