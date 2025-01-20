@interface NSSQLEntity
+ (void)initialize;
- (NSSQLEntity)initWithModel:(id)a3 entityDescription:(id)a4;
- (NSSQLEntity_DerivedAttributesExtension)derivedAttributesExtension;
- (NSSQLToOne)_addVirtualToOneForToMany:(NSSQLToOne *)a3 withInheritedProperty:;
- (id)_generateMulticolumnUniquenessConstraints;
- (id)attributeColumns;
- (id)attributes;
- (id)description;
- (id)entityDescription;
- (id)foreignEntityKeyColumns;
- (id)foreignKeyColumns;
- (id)foreignOrderKeyColumns;
- (id)manyToManyRelationships;
- (id)model;
- (id)name;
- (id)rootEntity;
- (id)tableName;
- (id)toManyRelationships;
- (uint64_t)_addForeignOrderKeyForToOne:(void *)a3 entity:;
- (uint64_t)_addSubentity:(uint64_t)result;
- (uint64_t)_collectFKSlots:(void *)a3 error:;
- (uint64_t)_entityIsBroken:(uint64_t)a1;
- (uint64_t)_generateAttributeDerivations:(uint64_t)result;
- (uint64_t)_generateIDWithSuperEntity:(int)a3 nextID:;
- (uint64_t)_sqlPropertyWithRenamingIdentifier:(uint64_t)result;
- (uint64_t)addDerivedAttribute:(uint64_t)result;
- (uint64_t)addPropertiesForReadOnlyFetch:(uint64_t)a3 keys:(void *)a4 context:;
- (uint64_t)properties;
- (uint64_t)rtreeIndexForIndexNamed:(uint64_t)a1;
- (uint64_t)sqlAttributesForCompositeAttributeName:(uint64_t)a1;
- (uint64_t)tempTableName;
- (unint64_t)virtualForeignKeyColumns;
- (void)_addColumnToFetch:(void *)result;
- (void)_generateInverseRelationshipsAndMore;
- (void)_generateProperties;
- (void)_organizeConstraints;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)entitySpecificPropertiesPassing:(uint64_t)a1;
- (void)indexForIndexDescription:(void *)result;
- (void)rtreeIndexes;
- (void)subhierarchyColumnMatching:(uint64_t)a1;
@end

@implementation NSSQLEntity

- (id)tableName
{
  return self->_tableName;
}

- (void)_addColumnToFetch:(void *)result
{
  if (result && a2)
  {
    v3 = result;
    uint64_t v4 = result[21];
    if (v4)
    {
      __int16 v5 = [*(id *)(v4 + 72) count];
      [*(id *)(v4 + 72) addObject:a2];
      a2[13] = v5;
    }
    switch([a2 propertyType])
    {
      case 1u:
        v6 = &OBJC_IVAR___NSSQLEntity__attrColumns;
        goto LABEL_10;
      case 3u:
        v6 = &OBJC_IVAR___NSSQLEntity__fkColumns;
        goto LABEL_10;
      case 4u:
        v6 = &OBJC_IVAR___NSSQLEntity__ekColumns;
        goto LABEL_10;
      case 0xAu:
        v6 = &OBJC_IVAR___NSSQLEntity__fokColumns;
LABEL_10:
        v7 = *(void **)((char *)v3 + *v6);
        if (v7 || (v7 = objc_opt_new(), (*(void *)((char *)v3 + *v6) = v7) != 0))
        {
          __int16 v8 = [v7 count];
          [v7 addObject:a2];
          if ((__int16)a2[14] == -1) {
            a2[14] = v8;
          }
        }
        break;
      default:
        break;
    }
    result = (void *)v3[10];
    if (result)
    {
      unint64_t v9 = (unsigned __int16)a2[13];
      if ([result count] < v9)
      {
        do
        {
          uint64_t v10 = [(id)v3[10] count];
          self;
          os_unfair_lock_lock_with_options();
          v11 = (NSSQLColumn *)objc_msgSend((id)qword_1EB270450, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
          if (!v11)
          {
            v12 = [[NSSQLColumn alloc] initWithColumnName:@"0" sqlType:1];
            v11 = v12;
            if (v12)
            {
              *(_WORD *)&v12->super._flags &= ~1u;
              v12->super._fetchIndex = v10;
            }
            objc_msgSend((id)qword_1EB270450, "setObject:forKey:", v12, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_95);
          [(id)v3[10] addObject:v11];
        }
        while ([(id)v3[10] count] < v9);
      }
      v13 = (void *)v3[10];
      return (void *)[v13 addObject:a2];
    }
  }
  return result;
}

- (id)entityDescription
{
  return self->_entityDescription;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_model = (NSSQLModel *)[a3 model];
  self->_entityDescription = (NSEntityDescription *)(id)[a3 entityDescription];
  self->_tableName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "tableName"), "copy");
  __int16 v5 = objc_alloc_init(NSSQLPrimaryKey);
  self->_primaryKey = v5;
  if (a3) {
    uint64_t v6 = *((void *)a3 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  [(NSSQLPrimaryKey *)v5 copyValuesForReadOnlyFetch:v6];
  v7 = objc_alloc_init(NSSQLEntityKey);
  self->_entityKey = v7;
  if (a3)
  {
    [(NSSQLColumn *)v7 copyValuesForReadOnlyFetch:*((void *)a3 + 17)];
    self->_entityID = *((_DWORD *)a3 + 46);
    unsigned int v8 = *((_DWORD *)a3 + 47);
  }
  else
  {
    [(NSSQLColumn *)v7 copyValuesForReadOnlyFetch:0];
    unsigned int v8 = 0;
    self->_entityID = 0;
  }
  self->_subentityMaxID = v8;
  self->_columnsToFetch = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_attrColumns = 0;
  self->_ekColumns = 0;
  self->_fokColumns = 0;
  self->_fkColumns = 0;
  self->_properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_rootEntity = self;
  self->_propertyMapping = (NSKnownKeysMappingStrategy *)[MEMORY[0x1E4F1CA98] null];
}

- (id)model
{
  return self->_model;
}

- (id)foreignKeyColumns
{
  if (self->_fkColumns) {
    return self->_fkColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (id)foreignOrderKeyColumns
{
  if (self->_fokColumns) {
    return self->_fokColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (id)foreignEntityKeyColumns
{
  if (self->_ekColumns) {
    return self->_ekColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (unint64_t)virtualForeignKeyColumns
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v1 = result;
    if (!atomic_load((unint64_t *)(result + 120)))
    {
      v3 = *(void **)(result + 96);
      if (v3)
      {
        if ([v3 count])
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          __int16 v5 = *(void **)(v1 + 96);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v14;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v14 != v8) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
                uint64_t v11 = [v10 toOneRelationship];
                if (v11 && *(unsigned char *)(v11 + 88)) {
                  [v4 addObject:v10];
                }
              }
              uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
            }
            while (v7);
          }
          uint64_t v12 = 0;
          atomic_compare_exchange_strong((atomic_ullong *volatile)(v1 + 120), (unint64_t *)&v12, (unint64_t)v4);
          if (v12) {
        }
          }
      }
    }
    return atomic_load((unint64_t *)(v1 + 120));
  }
  return result;
}

- (uint64_t)addPropertiesForReadOnlyFetch:(uint64_t)a3 keys:(void *)a4 context:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v11) {
            v11[2] = v6;
          }
          int v12 = [v11 propertyType];
          if (v12 == 7)
          {
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
            if (v11)
            {
              uint64_t v13 = v11[9];
              if (v13)
              {
                *(void *)(v13 + 16) = v6;
                -[NSSQLEntity _addColumnToFetch:]((void *)v6, (_WORD *)v13);
              }
            }
            uint64_t v14 = [v11 foreignKey];
            if (v14) {
              *(void *)(v14 + 16) = v6;
            }
            -[NSSQLEntity _addColumnToFetch:]((void *)v6, (_WORD *)v14);
          }
          else
          {
            if (v12 != 1)
            {
              [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Trying to add a non-attribute, non-to-one property to an entity: %@", objc_msgSend(v11, "name")), 0), @"NSUnderlyingException" forKey];
              return 0;
            }
            -[NSSQLEntity _addColumnToFetch:]((void *)v6, v11);
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
          }
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    *(void *)(v6 + 240) = [[NSKnownKeysMappingStrategy alloc] initForKeys:a3];
    return 1;
  }
  return result;
}

- (void)_generateProperties
{
  v150[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    v2 = (void *)result[20];
    id v127 = (id)[result entityDescription];
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3 && *(unsigned char *)(v3 + 57))
    {
      v132 = 0;
      v133 = 0;
      int v130 = 1;
    }
    else
    {
      v133 = (unint64_t *)[v127 _leopardStyleAttributesByName];
      v132 = (unint64_t *)[v127 _leopardStyleRelationshipsByName];
      int v130 = 0;
    }
    uint64_t v4 = [(id)v1 model];
    if (v4) {
      int v129 = (*(unsigned __int8 *)(v4 + 48) >> 1) & 1;
    }
    else {
      int v129 = 0;
    }
    uint64_t v5 = *(void *)(v1 + 160);
    uint64_t v6 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
    if (v5)
    {
      *(void *)(v1 + 80) = [*(id *)(v5 + 80) mutableCopy];
      id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
      if (v2) {
        uint64_t v8 = v2[5];
      }
      else {
        uint64_t v8 = 0;
      }
      *(void *)(v1 + 40) = [v7 initWithDictionary:v8];
      id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
      if (v2)
      {
        uint64_t v10 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
        uint64_t v11 = v2[34];
      }
      else
      {
        uint64_t v11 = 0;
        uint64_t v10 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
      }
      *(void *)(v1 + v10[98]) = [v9 initWithDictionary:v11];
      if ((v130 & 1) == 0)
      {
        int v12 = _PF_Leopard_CFDictionaryCreate();
        v131 = &v123;
        *(void *)(v1 + 248) = v12;
        uint64_t v13 = (unint64_t *)v2[31];
        unint64_t v14 = *v13;
        if (*v13 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = *v13;
        }
        if (v14 >= 0x201) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v15;
        }
        size_t v17 = 8 * v16;
        MEMORY[0x1F4188790](v12);
        long long v19 = (char *)&v123 - v18;
        if (v17 >= 0x200) {
          size_t v20 = 512;
        }
        else {
          size_t v20 = v17;
        }
        bzero(v19, v20);
        if (v14 > 0x200) {
          long long v19 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero(v19, v17);
        }
        uint64_t v25 = v13[1];
        if (v25 >= 1)
        {
          uint64_t v26 = 0;
          v27 = (uint64_t *)v13[9];
          do
          {
            uint64_t v29 = *v27++;
            uint64_t v28 = v29;
            unint64_t v30 = v13[8];
            if (v30 != v29 && v28 != ~v30) {
              *(void *)&v19[8 * v26++] = v28;
            }
            --v25;
          }
          while (v25);
        }
        if ((uint64_t)v14 >= 1)
        {
          v32 = (__CFString **)v19;
          unint64_t v33 = v14;
          do
          {
            v34 = *v32++;
            Value = (const void *)_PF_Leopard_CFDictionaryGetValue(v13, v34);
            _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), v34, Value);
            --v33;
          }
          while (v33);
        }
        uint64_t v6 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
        if (v14 >= 0x201) {
          NSZoneFree(0, v19);
        }
      }
      if (objc_msgSend((id)objc_msgSend(v2, "foreignKeyColumns"), "count")) {
        *(void *)(v1 + 96) = objc_msgSend((id)objc_msgSend(v2, "foreignKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "foreignEntityKeyColumns"), "count")) {
        *(void *)(v1 + 88) = objc_msgSend((id)objc_msgSend(v2, "foreignEntityKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "foreignOrderKeyColumns"), "count")) {
        *(void *)(v1 + 104) = objc_msgSend((id)objc_msgSend(v2, "foreignOrderKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "attributeColumns"), "count")) {
        *(void *)(v1 + 112) = objc_msgSend((id)objc_msgSend(v2, "attributeColumns"), "mutableCopy");
      }
      if (v2)
      {
        *(void *)(v1 + 128) = v2[16];
        *(void *)(v1 + 136) = v2[17];
        *(void *)(v1 + 144) = v2[18];
        v36 = *(void **)((char *)v2 + v6[29]);
      }
      else
      {
        v36 = 0;
        *(void *)(v1 + 128) = 0;
        *(void *)(v1 + 136) = 0;
        *(void *)(v1 + 144) = 0;
      }
      v24 = v36;
    }
    else
    {
      *(void *)(v1 + 40) = objc_opt_new();
      *(void *)(v1 + 272) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ((v130 & 1) == 0) {
        *(void *)(v1 + 248) = _PF_Leopard_CFDictionaryCreate();
      }
      *(void *)(v1 + 72) = objc_opt_new();
      *(void *)(v1 + 80) = objc_opt_new();
      *(void *)(v1 + 96) = 0;
      *(void *)(v1 + 88) = 0;
      *(void *)(v1 + 104) = 0;
      *(void *)(v1 + 112) = 0;
      uint64_t v21 = [[NSSQLEntityKey alloc] initWithEntity:v1 propertyDescription:0];
      *(void *)(v1 + 136) = v21;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v21);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(void *)(v1 + 136), objc_msgSend(*(id *)(v1 + 136), "name"));
      if ((v130 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[*(id *)(v1 + 136) name], *(const void **)(v1 + 136));
      }

      v22 = [[NSSQLPrimaryKey alloc] initWithEntity:v1 propertyDescription:0];
      *(void *)(v1 + 128) = v22;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v22);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(void *)(v1 + 128), objc_msgSend(*(id *)(v1 + 128), "name"));
      if ((v130 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[*(id *)(v1 + 128) name], *(const void **)(v1 + 128));
      }

      v23 = [[NSSQLOptLockKey alloc] initWithEntity:v1 propertyDescription:0];
      *(void *)(v1 + 144) = v23;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v23);
      objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", *(void *)(v1 + 144), objc_msgSend(*(id *)(v1 + 144), "name"));
      if ((v130 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[*(id *)(v1 + 144) name], *(const void **)(v1 + 144));
      }

      v24 = objc_alloc_init(NSSQLStoreMappingGenerator);
    }
    *(void *)(v1 + v6[29]) = v24;
    if (v130) {
      v131 = 0;
    }
    else {
      v131 = (long long *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (v129)
    {
      v128 = (unsigned int *)[v127 _newSnowLeopardStyleDictionaryContainingPropertiesOfType:1];
      v124 = &v123;
      uint64_t v37 = v128[2];
      uint64_t v38 = MEMORY[0x1F4188790](v128);
      v40 = (id *)((char *)&v123 - v39);
      _PF_SnowLeopard_CFDictionaryGetValues(v38, (uint64_t)&v123 - v39);
    }
    else
    {
      v128 = (unsigned int *)[v127 _newMappingForPropertiesOfRange:1];
      uint64_t v37 = [v128 count];
      v124 = &v123;
      MEMORY[0x1F4188790](v37);
      v40 = (id *)((char *)&v123 - v42);
      [v128 getObjects:(char *)&v123 - v42];
    }
    if (v37)
    {
      v125 = v150;
      v126 = &v149;
      *(void *)&long long v41 = 138412546;
      long long v123 = v41;
      do
      {
        id v43 = *v40;
        if ((objc_msgSend(*v40, "isTransient", (void)v123, *((void *)&v123 + 1)) & 1) == 0)
        {
          if (v43 && [v43 attributeType] == 2100)
          {
            id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3052000000;
              v149 = __Block_byref_object_copy__25;
              v150[0] = __Block_byref_object_dispose__25;
              v138[0] = MEMORY[0x1E4F143A8];
              v138[1] = 3221225472;
              v139 = __34__NSSQLEntity__generateProperties__block_invoke;
              v140 = &unk_1E544DA68;
              id v144 = v43;
              v145 = buf;
              uint64_t v141 = v1;
              id v142 = v44;
              char v146 = v130;
              v143 = v131;
              v150[1] = v138;
              uint64_t v45 = [v43 elements];
              uint64_t v46 = [v43 name];
              v139((uint64_t)v138, (void *)v45, v46);
              uint64_t v47 = [v43 name];
              if (v47)
              {
                v48 = (void *)[*(id *)(v1 + 272) objectForKey:v47];
                if (v48)
                {
                  [v48 addObjectsFromArray:v44];
                }
                else
                {
                  v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v44];
                  [*(id *)(v1 + 272) setObject:v66 forKey:v47];
                }
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              uint64_t v51 = [NSString stringWithUTF8String:"Unexpected multi-column attribute description class (expected %@): %@"];
              v52 = (objc_class *)objc_opt_class();
              v53 = NSStringFromClass(v52);
              v54 = (objc_class *)objc_opt_class();
              v122 = NSStringFromClass(v54);
              _NSCoreDataLog(17, v51, v55, v56, v57, v58, v59, v60, (uint64_t)v53);
              v61 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                v62 = (objc_class *)objc_opt_class();
                v63 = NSStringFromClass(v62);
                v64 = (objc_class *)objc_opt_class();
                v65 = NSStringFromClass(v64);
                *(_DWORD *)buf = v123;
                *(void *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v65;
                _os_log_fault_impl(&dword_18AB82000, v61, OS_LOG_TYPE_FAULT, "CoreData: Unexpected multi-column attribute description class (expected %@): %@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v49 = [v43 name];
            if (![*(id *)(v1 + 40) objectForKey:v49])
            {
              v50 = [[NSSQLAttribute alloc] initWithEntity:v1 propertyDescription:v43];
              -[NSSQLEntity _addColumnToFetch:]((void *)v1, v50);
              [*(id *)(v1 + 40) setObject:v50 forKey:v49];
              if ((v130 & 1) == 0) {
                [v131 setObject:v50 forKey:v49];
              }
              if ([v43 _propertyType] == 6) {
                -[NSSQLEntity addDerivedAttribute:](v1, (uint64_t)v50);
              }
            }
          }
        }
        ++v40;
        --v37;
      }
      while (v37);
    }
    if (v129) {
      _PF_SnowLeopard_CFDictionaryDestroy((uint64_t)v128);
    }
    else {

    }
    if ((v130 & 1) == 0)
    {
      unint64_t v68 = *v133;
      if ((uint64_t)*v133 >= 1)
      {
        if (v68 >= 0x201) {
          uint64_t v69 = 1;
        }
        else {
          uint64_t v69 = *v133;
        }
        size_t v70 = 8 * v69;
        MEMORY[0x1F4188790](v67);
        v72 = (char *)&v123 - v71;
        if (v70 >= 0x200) {
          size_t v73 = 512;
        }
        else {
          size_t v73 = v70;
        }
        bzero(v72, v73);
        if (v68 > 0x200) {
          v72 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero(v72, v70);
        }
        uint64_t v74 = v133[1];
        if (v74 > 0)
        {
          uint64_t v75 = 0;
          v76 = (uint64_t *)v133[9];
          do
          {
            uint64_t v78 = *v76++;
            uint64_t v77 = v78;
            unint64_t v79 = v133[8];
            if (v79 != v78 && v77 != ~v79) {
              *(void *)&v72[8 * v75++] = v77;
            }
            --v74;
          }
          while (v74);
        }
        uint64_t v81 = 0;
        do
        {
          v82 = (void *)_PF_Leopard_CFDictionaryGetValue(v133, *(__CFString **)&v72[8 * v81]);
          if (([v82 isTransient] & 1) == 0)
          {
            v83 = (__CFString *)[v82 name];
            v84 = (const void *)[v131 objectForKey:v83];
            if (v84) {
              _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), v83, v84);
            }
          }
          ++v81;
        }
        while (v68 != v81);
        if (v68 >= 0x201) {
          NSZoneFree(0, v72);
        }
      }
      [v131 removeAllObjects];
    }
    if (v129)
    {
      v85 = (unsigned int *)[v127 _newSnowLeopardStyleDictionaryContainingPropertiesOfType:2];
      uint64_t v86 = v85[2];
      uint64_t v87 = MEMORY[0x1F4188790](v85);
      v89 = (id *)((char *)&v123 - v88);
      _PF_SnowLeopard_CFDictionaryGetValues(v87, (uint64_t)&v123 - v88);
    }
    else
    {
      v85 = (unsigned int *)[v127 _newMappingForPropertiesOfRange:2];
      uint64_t v86 = [v85 count];
      MEMORY[0x1F4188790](v86);
      v89 = (id *)((char *)&v123 - v90);
      [v85 getObjects:(char *)&v123 - v90];
    }
    for (; v86; --v86)
    {
      id v91 = *v89;
      if (([*v89 isTransient] & 1) == 0)
      {
        uint64_t v92 = [v91 name];
        if (![*(id *)(v1 + 40) objectForKey:v92])
        {
          if ([v91 maxCount] == 1)
          {
            v93 = [[NSSQLToOne alloc] initWithEntity:v1 propertyDescription:v91];
            v94 = [(NSSQLToOne *)v93 foreignKey];
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v94, objc_msgSend(v94, "name"));
            if ((v130 & 1) == 0)
            {
              uint64_t v95 = [v94 name];
              [v131 setObject:v94 forKey:v95];
            }
            -[NSSQLEntity _addColumnToFetch:]((void *)v1, v94);
            if (!v93) {
              goto LABEL_136;
            }
            foreignEntityKey = v93->_foreignEntityKey;
            if (foreignEntityKey)
            {
              objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", foreignEntityKey, -[NSSQLForeignEntityKey name](v93->_foreignEntityKey, "name"));
              if ((v130 & 1) == 0)
              {
                uint64_t v97 = [(NSSQLForeignEntityKey *)foreignEntityKey name];
                [v131 setObject:foreignEntityKey forKey:v97];
              }
              -[NSSQLEntity _addColumnToFetch:]((void *)v1, foreignEntityKey);
            }
          }
          else
          {
            v98 = (void *)[v91 inverseRelationship];
            if (!v98 || (uint64_t v99 = [v98 maxCount], v100 = off_1E544B090, v99 == 1)) {
              v100 = off_1E544B098;
            }
            v93 = (NSSQLToOne *)[objc_alloc(*v100) initWithEntity:v1 propertyDescription:v91];
            if (!v93) {
              goto LABEL_136;
            }
          }
          [*(id *)(v1 + 40) setObject:v93 forKey:v92];
          if ((v130 & 1) == 0) {
            [v131 setObject:v93 forKey:v92];
          }
        }
      }
LABEL_136:
      ++v89;
    }
    if (v129) {
      _PF_SnowLeopard_CFDictionaryDestroy((uint64_t)v85);
    }
    else {

    }
    if ((v130 & 1) == 0)
    {
      unint64_t v102 = *v132;
      if ((uint64_t)*v132 >= 1)
      {
        MEMORY[0x1F4188790](v101);
        v104 = (char *)&v123 - v103;
        if (v102 > 0x200) {
          v104 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v123 - v103, 8 * v102);
        }
        uint64_t v105 = v132[1];
        if (v105 > 0)
        {
          uint64_t v106 = 0;
          v107 = (uint64_t *)v132[9];
          do
          {
            uint64_t v109 = *v107++;
            uint64_t v108 = v109;
            unint64_t v110 = v132[8];
            if (v110 != v109 && v108 != ~v110) {
              *(void *)&v104[8 * v106++] = v108;
            }
            --v105;
          }
          while (v105);
        }
        uint64_t v112 = 0;
        do
        {
          v113 = (void *)_PF_Leopard_CFDictionaryGetValue(v132, *(__CFString **)&v104[8 * v112]);
          if (([v113 isTransient] & 1) == 0)
          {
            uint64_t v114 = [v113 name];
            v115 = (id *)[v131 objectForKey:v114];
            if (v115)
            {
              if ([v113 maxCount] == 1)
              {
                v116 = (void *)[v115 foreignKey];
                _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[v116 name], v116);
                id v117 = v115[9];
                if (v117) {
                  _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[v115[9] name], v117);
                }
              }
              _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), (__CFString *)[v115 name], v115);
            }
          }
          ++v112;
        }
        while (v102 != v112);
        if (v102 >= 0x201) {
          NSZoneFree(0, v104);
        }
      }

      _PF_Leopard_CFDictionaryDestroy(v132);
      _PF_Leopard_CFDictionaryDestroy(v133);
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v118 = *(void **)(v1 + 152);
    result = (void *)[v118 countByEnumeratingWithState:&v134 objects:v147 count:16];
    v119 = result;
    if (result)
    {
      uint64_t v120 = *(void *)v135;
      do
      {
        v121 = 0;
        do
        {
          if (*(void *)v135 != v120) {
            objc_enumerationMutation(v118);
          }
          -[NSSQLEntity _generateProperties](*(void *)(*((void *)&v134 + 1) + 8 * (void)v121));
          v121 = (void *)((char *)v121 + 1);
        }
        while (v119 != v121);
        result = (void *)[v118 countByEnumeratingWithState:&v134 objects:v147 count:16];
        v119 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)addDerivedAttribute:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 256);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(v3 + 256) = v4;
    }
    return [v4 addObject:a2];
  }
  return result;
}

- (id)name
{
  return [(NSEntityDescription *)self->_entityDescription name];
}

- (id)attributeColumns
{
  if (self->_attrColumns) {
    return self->_attrColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (uint64_t)_generateAttributeDerivations:(uint64_t)result
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = (NSSQLEntity_DerivedAttributesExtension *)result;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v4 = *(void **)(result + 256);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v111 objects:v144 count:16];
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  v100 = a2;
  unint64_t v7 = 0x1E4F1C000uLL;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v9 = *(void *)v112;
  uint64_t v10 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v112 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v105 = v11;
      int v12 = *(void **)(*((void *)&v111 + 1) + 8 * v11);
      uint64_t v13 = (void *)[*(id *)(v7 + 2688) set];
      unint64_t v14 = (char *)[v12 propertyDescription];
      uint64_t v110 = 0;
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "derivationExpression"), "_keypathsForDerivedPropertyValidation:", &v110);
      if (!v15)
      {
        uint64_t v55 = *MEMORY[0x1E4F1C3C8];
        uint64_t v56 = *MEMORY[0x1E4F28A50];
        v142[0] = @"derived attribute";
        v142[1] = v56;
        v143[0] = v14;
        v143[1] = v110;
        uint64_t v57 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v55, @"Invalid keypaths found in derived attribute (derivationExpression)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v143, v142, 2));
        uint64_t v58 = *MEMORY[0x1E4F281F8];
        v140 = @"NSUnderlyingException";
        uint64_t v141 = v57;
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v58, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
        if (!v36)
        {
          uint64_t v59 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v59, v60, v61, v62, v63, v64, v65, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
          id v44 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
            __int16 v138 = 1024;
            int v139 = 1504;
LABEL_65:
            _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          return 0;
        }
LABEL_47:
        if (v100) {
          uint64_t *v100 = v36;
        }
        return 0;
      }
      objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
      if (v14)
      {
        uint64_t v16 = *(void **)&v14[v10[435]];
        if (v16)
        {
          size_t v17 = (void *)[v16 _keypathsForDerivedPropertyValidation:&v110];
          if (v17)
          {
            objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v17, "allObjects"));
            goto LABEL_12;
          }
          uint64_t v76 = *MEMORY[0x1E4F1C3C8];
          uint64_t v77 = *MEMORY[0x1E4F28A50];
          v134[0] = @"derived attribute";
          v134[1] = v77;
          v135[0] = v14;
          v135[1] = v110;
          uint64_t v78 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v76, @"Invalid keypaths found in derived attribute (filteringPredicate)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v135, v134, 2));
          uint64_t v79 = *MEMORY[0x1E4F281F8];
          v132 = @"NSUnderlyingException";
          uint64_t v133 = v78;
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v79, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
          if (!v36)
          {
            uint64_t v80 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v80, v81, v82, v83, v84, v85, v86, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
            id v44 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
              __int16 v138 = 1024;
              int v139 = 1513;
              goto LABEL_65;
            }
            return 0;
          }
          goto LABEL_47;
        }
      }
LABEL_12:
      unint64_t v102 = v14;
      if ([v13 count])
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        uint64_t v103 = [v13 countByEnumeratingWithState:&v106 objects:v131 count:16];
        if (v103)
        {
          uint64_t v104 = *(void *)v107;
          uint64_t v101 = v3;
          uint64_t v98 = v6;
          uint64_t v99 = v4;
          uint64_t v97 = v9;
          while (2)
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v107 != v104) {
                objc_enumerationMutation(v13);
              }
              long long v19 = (void *)[*(id *)(*((void *)&v106 + 1) + 8 * v18) componentsSeparatedByString:@"."];
              uint64_t v20 = [v19 count];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = 0;
                uint64_t v23 = v20 - 1;
                v24 = v101;
                while (1)
                {
                  uint64_t v25 = (void *)[v19 objectAtIndexedSubscript:v22];
                  if ([v25 hasPrefix:@"@"]) {
                    break;
                  }
                  if (!v24
                    || (uint64_t v26 = (void *)[(objc_class *)v24[1].super.isa objectForKey:v25]) == 0)
                  {
                    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
                    v125[0] = @"derived attribute";
                    v125[1] = @"component";
                    v126[0] = v102;
                    v126[1] = v25;
                    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v33, @"Invalid keypaths found in derived attribute (can't find keypath component)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v126, v125, 2));
                    uint64_t v35 = *MEMORY[0x1E4F281F8];
                    long long v123 = @"NSUnderlyingException";
                    uint64_t v124 = v34;
                    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v35, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
                    if (v36) {
                      goto LABEL_47;
                    }
                    uint64_t v37 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                    _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                    id v44 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                      __int16 v138 = 1024;
                      int v139 = 1546;
                      goto LABEL_65;
                    }
                    return 0;
                  }
                  v27 = v26;
                  uint64_t v28 = objc_msgSend((id)objc_msgSend(v26, "propertyDescription"), "_propertyType");
                  if (v28 == 6)
                  {
                    uint64_t v45 = *MEMORY[0x1E4F1C3C8];
                    v121 = @"derived attribute";
                    v122 = v102;
                    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v45, @"Invalid keypaths found in derived attribute (derived attribute found in dependency chain)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
                    uint64_t v47 = *MEMORY[0x1E4F281F8];
                    v119 = @"NSUnderlyingException";
                    uint64_t v120 = v46;
                    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v47, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
                    if (v36) {
                      goto LABEL_47;
                    }
                    uint64_t v48 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                    _NSCoreDataLog(17, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                    id v44 = __pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                      __int16 v138 = 1024;
                      int v139 = 1553;
                      goto LABEL_65;
                    }
                    return 0;
                  }
                  if (v23 == v22)
                  {
                    uint64_t v29 = -[NSSQLEntity derivedAttributesExtension](v24);
                    -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v29, v19, v12);
                  }
                  else if (v28 == 2)
                  {
                    if ((objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1), "hasPrefix:", @"@") & 1) == 0)
                    {
                      uint64_t v66 = *MEMORY[0x1E4F1C3C8];
                      id v117 = @"derived attribute";
                      v118 = v102;
                      uint64_t v67 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v66, @"Invalid keypaths found in derived attribute (non-terminal attribute not followed by a function)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1));
                      uint64_t v68 = *MEMORY[0x1E4F281F8];
                      v115 = @"NSUnderlyingException";
                      uint64_t v116 = v67;
                      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v68, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
                      if (v36) {
                        goto LABEL_47;
                      }
                      uint64_t v69 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                      _NSCoreDataLog(17, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                      id v44 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                        __int16 v138 = 1024;
                        int v139 = 1566;
                        goto LABEL_65;
                      }
                      return 0;
                    }
                  }
                  else if (v28 == 4)
                  {
                    v24 = (NSSQLEntity_DerivedAttributesExtension *)[v27 destinationEntity];
                  }
                  if (v21 == ++v22) {
                    goto LABEL_35;
                  }
                }
                if ([@"@count" caseInsensitiveCompare:v25])
                {
                  if (v24)
                  {
                    unint64_t v30 = -[NSSQLEntity derivedAttributesExtension](v24);
                    -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v30, v19, v12);
                  }
                  goto LABEL_35;
                }
                uint64_t v87 = *MEMORY[0x1E4F1C3C8];
                int v129 = @"derived attribute";
                int v130 = v102;
                uint64_t v88 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v87, @"Invalid keypaths found in derived attribute (unsupported function)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1));
                uint64_t v89 = *MEMORY[0x1E4F281F8];
                id v127 = @"NSUnderlyingException";
                uint64_t v128 = v88;
                uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v89, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
                if (v36) {
                  goto LABEL_47;
                }
                uint64_t v90 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
                id v44 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  long long v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
                  __int16 v138 = 1024;
                  int v139 = 1535;
                  goto LABEL_65;
                }
                return 0;
              }
LABEL_35:
              ++v18;
            }
            while (v18 != v103);
            uint64_t v31 = [v13 countByEnumeratingWithState:&v106 objects:v131 count:16];
            uint64_t v3 = v101;
            uint64_t v6 = v98;
            id v4 = v99;
            unint64_t v7 = 0x1E4F1C000;
            uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
            uint64_t v9 = v97;
            uint64_t v10 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
            uint64_t v103 = v31;
            if (v31) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v32 = -[NSSQLEntity derivedAttributesExtension](v3);
        -[NSSQLEntity_DerivedAttributesExtension addDerivationKeypath:forAttribute:]((uint64_t)v32, v8, v12);
      }
      uint64_t v11 = v105 + 1;
    }
    while (v105 + 1 != v6);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v111 objects:v144 count:16];
    result = 1;
    if (v6) {
      continue;
    }
    return result;
  }
}

- (id)attributes
{
  while (self)
  {
    v2 = (id *)self;
    self = (id)*((void *)self + 21);
    if (self == v2) {
      return v2[9];
    }
  }
  return self;
}

- (id)_generateMulticolumnUniquenessConstraints
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result rootEntity];
    if (v2) {
      uint64_t v15 = *(void **)(v2 + 216);
    }
    else {
      uint64_t v15 = 0;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v3 = [v1 entityDescription];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 128);
      if (!v4 || (uint64_t v5 = *(void **)(v4 + 24)) == 0) {
        uint64_t v5 = NSArray_EmptyArray;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    result = (id *)[v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (result)
    {
      uint64_t v6 = result;
      id obj = v5;
      uint64_t v17 = *(void *)v23;
      do
      {
        unint64_t v7 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v7);
          if ((unint64_t)[v8 count] >= 2)
          {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v15 addObject:v9];

            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v19;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v19 != v12) {
                    objc_enumerationMutation(v8);
                  }
                  unint64_t v14 = (void *)[v1[5] objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * i)];
                  [v14 setConstrained:1];
                  [v9 addObject:v14];
                }
                uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }
              while (v11);
            }
          }
          unint64_t v7 = (id *)((char *)v7 + 1);
        }
        while (v7 != v6);
        result = (id *)[obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)rootEntity
{
  return self->_rootEntity;
}

- (uint64_t)_generateIDWithSuperEntity:(int)a3 nextID:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (void *)[(id)a1 entityDescription];
  if (a2)
  {
    *(void *)(a1 + 168) = [a2 rootEntity];
    *(void *)(a1 + 160) = a2;
    -[NSSQLEntity _addSubentity:]((uint64_t)a2, a1);
  }
  else
  {
    *(void *)(a1 + 168) = a1;
  }
  *(_DWORD *)(a1 + 184) = a3;
  uint64_t v7 = [(id)a1 model];
  if (v7)
  {
    [*(id *)(v7 + 32) addObject:a1];
    CFRetain((CFTypeRef)a1);
  }
  uint64_t v8 = (a3 + 1);
  id v9 = -[NSEntityDescription _sortedSubentities](v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v8 = -[NSSQLEntity _generateIDWithSuperEntity:nextID:](objc_msgSend(*(id *)(a1 + 16), "entityNamed:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "name")), a1, v8);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  *(_DWORD *)(a1 + 188) = v8 - 1;
  return v8;
}

- (void)_organizeConstraints
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 216) count];
    if (!*(void *)(a1 + 160) && v2 != 0)
    {
      CFIndex v4 = v2;
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
      keyCallBacks.version = *MEMORY[0x1E4F1D530];
      *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D530] + 8);
      uint64_t v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D530] + 24);
      keyCallBacks.equal = 0;
      keyCallBacks.hash = 0;
      keyCallBacks.copyDescription = v6;
      CFIndex v19 = v4;
      uint64_t v7 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, &keyCallBacks, MEMORY[0x1E4F1D540]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v20 = a1;
      id obj = *(id *)(a1 + 216);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"name", 1)));
            uint64_t v13 = (const void *)objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"columnName"), "componentsJoinedByString:", @"_");
            [v5 addObject:v13];
            CFDictionaryAddValue(v7, v13, v12);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v9);
      }
      [v5 sortUsingComparator:&__block_literal_global_45];
      unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v19];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v15 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v14, "addObject:", CFDictionaryGetValue(v7, *(const void **)(*((void *)&v22 + 1) + 8 * j)));
          }
          uint64_t v16 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v16);
      }

      *(void *)(v20 + 216) = v14;
      CFRelease(v7);
    }
  }
}

- (NSSQLEntity)initWithModel:(id)a3 entityDescription:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)NSSQLEntity;
  id v6 = [(NSSQLEntity *)&v26 init];
  if (v6)
  {
    uint64_t v7 = +[NSSQLStoreMappingGenerator defaultMappingGenerator]();
    if (a3) {
      BOOL v8 = *((_DWORD *)a3 + 15) >> 7 > 0x7Cu;
    }
    else {
      BOOL v8 = 0;
    }
    *((void *)v6 + 4) = -[NSSQLStoreMappingGenerator generateTableName:isAncillary:]((uint64_t)v7, a4, v8);
    *((void *)v6 + 3) = a4;
    *((void *)v6 + 2) = a3;
    atomic_store(0, (unint64_t *)v6 + 28);
    if (a4) {
      uint64_t v9 = *((void *)a4 + 14);
    }
    else {
      uint64_t v9 = 0;
    }
    *((_OWORD *)v6 + 12) = *(_OWORD *)(v9 + 96);
    *((_DWORD *)v6 + 70) = *((_DWORD *)v6 + 70) & 0xFFFFFFFE | -[NSEntityDescription _hasAttributesWithExternalDataReferences]((uint64_t)a4);
    if (-[NSEntityDescription _hasAttributesWithFileBackedFutures]((uint64_t)a4)) {
      int v10 = 2;
    }
    else {
      int v10 = 0;
    }
    *((_DWORD *)v6 + 70) = *((_DWORD *)v6 + 70) & 0xFFFFFFFD | v10;
    if (![a4 superentity])
    {
      *((void *)v6 + 27) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *((void *)v6 + 26) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if ([a4 indexes] && objc_msgSend((id)objc_msgSend(a4, "indexes"), "count"))
    {
      id v25 = (id)*((void *)v6 + 29);
      if (!v25)
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *((void *)v6 + 29) = v25;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v11 = (NSSQLEntity *)v6;
      uint64_t v12 = (void *)[*((id *)v6 + 3) indexes];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v17, "elements"), "count")
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "elements"), "firstObject"), "collationType") == 1)
            {
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v18 = (void *)[v17 elements];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v28;
LABEL_25:
                uint64_t v22 = 0;
                while (1)
                {
                  if (*(void *)v28 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "property"), "isOptional"))break; {
                  if (v20 == ++v22)
                  }
                  {
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
                    if (v20) {
                      goto LABEL_25;
                    }
                    goto LABEL_31;
                  }
                }
              }
              else
              {
LABEL_31:
                id v23 = [[NSSQLRTreeIndex alloc] initForIndexDescription:v17 sqlEntity:v11];
                objc_msgSend(v25, "setObject:forKey:", v23, objc_msgSend(v17, "name"));
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v14);
      }
      return v11;
    }
  }
  return (NSSQLEntity *)v6;
}

- (uint64_t)_addSubentity:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 152);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(v3 + 152) = v4;
    }
    return [v4 addObject:a2];
  }
  return result;
}

- (NSSQLEntity_DerivedAttributesExtension)derivedAttributesExtension
{
  if (result)
  {
    uint64_t v1 = result;
    result = (NSSQLEntity_DerivedAttributesExtension *)result[6]._triggerSQL;
    if (!result)
    {
      result = [[NSSQLEntity_DerivedAttributesExtension alloc] initWithEntity:v1];
      v1[6]._triggerSQL = (NSMutableArray *)result;
    }
  }
  return result;
}

- (void)_generateInverseRelationshipsAndMore
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = [result model];
    if (v2 && (*(unsigned char *)(v2 + 48) & 1) != 0)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v15 = (void *)v14;
      uint64_t v16 = *(unint64_t **)(v1 + 248);
      unint64_t v17 = *v16;
      if ((uint64_t)*v16 >= 1)
      {
        if (v17 >= 0x201) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = *v16;
        }
        size_t v19 = 8 * v18;
        MEMORY[0x1F4188790](v14);
        uint64_t v21 = (char *)&v92 - v20;
        if (v19 >= 0x200) {
          size_t v22 = 512;
        }
        else {
          size_t v22 = v19;
        }
        bzero(v21, v22);
        if (v17 > 0x200) {
          uint64_t v21 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero(v21, v19);
        }
        long long v30 = *(void **)(v1 + 248);
        uint64_t v31 = v30[1];
        if (v31 > 0)
        {
          uint64_t v32 = 0;
          long long v33 = (uint64_t *)v30[9];
          do
          {
            uint64_t v35 = *v33++;
            uint64_t v34 = v35;
            uint64_t v36 = v30[8];
            if (v36 != v35 && v34 != ~v36) {
              *(void *)&v21[8 * v32++] = v34;
            }
            --v31;
          }
          while (v31);
        }
        uint64_t v38 = 0;
        do
          objc_msgSend(v15, "addObject:", _PF_Leopard_CFDictionaryGetValue(*(void **)(v1 + 248), *(__CFString **)&v21[8 * v38++]));
        while (v17 != v38);
        if (v17 >= 0x201) {
          NSZoneFree(0, v21);
        }
      }
      goto LABEL_81;
    }
    uint64_t v3 = [(id)v1 model];
    if (v3 && (*(unsigned char *)(v3 + 48) & 2) != 0)
    {
      unsigned int v23 = [*(id *)(v1 + 40) count];
      if ((int)v23 >= 1)
      {
        long long v24 = PF_Tiger_CFDictionaryCreate(0, v23, 1);
        BOOL v8 = v24;
        uint64_t v95 = &v92;
        unint64_t v25 = v23;
        if (v23 >= 0x201uLL) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = v23;
        }
        size_t v27 = 8 * v26;
        MEMORY[0x1F4188790](v24);
        uint64_t v12 = (char *)&v92 - v28;
        if (v27 >= 0x200) {
          size_t v29 = 512;
        }
        else {
          size_t v29 = v27;
        }
        bzero(v12, v29);
        unint64_t v94 = v25;
        if (v25 > 0x200) {
          uint64_t v12 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero(v12, v27);
        }
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        uint64_t v45 = *(void **)(v1 + 40);
        uint64_t v46 = [v45 countByEnumeratingWithState:&v104 objects:v110 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v105;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v105 != v48) {
                objc_enumerationMutation(v45);
              }
              PF_Tiger_CFDictionarySetValue((uint64_t)v8, *(const __CFString **)(*((void *)&v104 + 1) + 8 * i), [*(id *)(v1 + 40) objectForKey:*(void *)(*((void *)&v104 + 1) + 8 * i)]);
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v104 objects:v110 count:16];
          }
          while (v47);
        }
LABEL_78:
        PF_Tiger_CFDictionaryGetKeysAndValues((uint64_t)v8, 0, v12);
        unint64_t v56 = v94;
        uint64_t v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:v94];
        PF_Tiger_CFDictionaryDestroy(v8);
        if (v56 >= 0x201)
        {
          uint64_t v57 = v12;
LABEL_80:
          NSZoneFree(0, v57);
        }
LABEL_81:
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        result = (void *)[v15 countByEnumeratingWithState:&v96 objects:v108 count:16];
        if (!result) {
          return result;
        }
        uint64_t v58 = result;
        uint64_t v59 = *(void *)v97;
        while (1)
        {
          uint64_t v60 = 0;
          do
          {
            if (*(void *)v97 != v59) {
              objc_enumerationMutation(v15);
            }
            uint64_t v61 = *(void *)(*((void *)&v96 + 1) + 8 * (void)v60);
            if (v61)
            {
              int v62 = *(unsigned __int8 *)(v61 + 24);
              if ((v62 - 7) <= 2)
              {
                if (*(void *)(v61 + 56))
                {
                  if (v62 == 7 && *(void *)(v61 + 80)) {
                    goto LABEL_97;
                  }
                }
                else
                {
                  uint64_t v63 = objc_msgSend((id)objc_msgSend((id)v61, "propertyDescription"), "inverseRelationship");
                  if (v63)
                  {
                    if (*(unsigned char *)(v61 + 24) == 9) {
                      goto LABEL_101;
                    }
                    uint64_t v64 = [(id)v61 destinationEntity];
                    uint64_t v65 = [v63 name];
                    if (v64) {
                      uint64_t v66 = (void *)[*(id *)(v64 + 40) objectForKey:v65];
                    }
                    else {
                      uint64_t v66 = 0;
                    }
                    -[NSSQLRelationship _setInverseRelationship:]((void *)v61, v66);
                    if (*(unsigned char *)(v61 + 24) == 7)
                    {
LABEL_97:
                      -[NSSQLEntity _addForeignOrderKeyForToOne:entity:](v1, (id *)v61, (void *)v1);
                      goto LABEL_104;
                    }
                    if ([v66 entity] == v1) {
                      [v66 isToMany];
                    }
                  }
                  else
                  {
                    if ([(id)v61 isToMany])
                    {
                      uint64_t v67 = -[NSSQLEntity _addVirtualToOneForToMany:withInheritedProperty:]([(id)v61 destinationEntity], (void *)v61, 0);
                      -[NSSQLRelationship _setInverseRelationship:]((void *)v61, v67);
                      goto LABEL_104;
                    }
                    if (*(unsigned char *)(v61 + 24) == 9)
                    {
LABEL_101:
                      uint64_t v68 = [(id)v61 destinationEntity];
                      uint64_t v69 = [v63 name];
                      if (v68) {
                        uint64_t v70 = [*(id *)(v68 + 40) objectForKey:v69];
                      }
                      else {
                        uint64_t v70 = 0;
                      }
                      -[NSSQLManyToMany _setInverseManyToMany:]((void *)v61, v70);
                    }
                  }
                }
              }
            }
LABEL_104:
            uint64_t v60 = (char *)v60 + 1;
          }
          while (v58 != v60);
          result = (void *)[v15 countByEnumeratingWithState:&v96 objects:v108 count:16];
          uint64_t v58 = result;
          if (!result) {
            return result;
          }
        }
      }
    }
    else
    {
      uint64_t v4 = *(void *)(v1 + 16);
      if (v4 && *(unsigned char *)(v4 + 57))
      {
        uint64_t v5 = (void *)-[NSSQLModel _precomputedKeyOrderForEntity:](v4, (void *)v1);
        unsigned int v6 = [*(id *)(v1 + 40) count];
        if ((int)v6 >= 1)
        {
          uint64_t v7 = PF_Tiger_CFDictionaryCreate(0, v6, 1);
          BOOL v8 = v7;
          if (v6 >= 0x201uLL) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = v6;
          }
          size_t v10 = 8 * v9;
          MEMORY[0x1F4188790](v7);
          uint64_t v12 = (char *)&v92 - v11;
          if (v10 >= 0x200) {
            size_t v13 = 512;
          }
          else {
            size_t v13 = v10;
          }
          bzero(v12, v13);
          unint64_t v94 = v6;
          uint64_t v95 = &v92;
          if (v6 > 0x200uLL) {
            uint64_t v12 = (char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero(v12, v10);
          }
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          uint64_t v50 = [v5 countByEnumeratingWithState:&v100 objects:v109 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v101;
            do
            {
              for (uint64_t j = 0; j != v51; ++j)
              {
                if (*(void *)v101 != v52) {
                  objc_enumerationMutation(v5);
                }
                CFStringRef v54 = *(const __CFString **)(*((void *)&v100 + 1) + 8 * j);
                uint64_t v55 = [*(id *)(v1 + 40) objectForKey:v54];
                if (v55) {
                  PF_Tiger_CFDictionarySetValue((uint64_t)v8, v54, v55);
                }
              }
              uint64_t v51 = [v5 countByEnumeratingWithState:&v100 objects:v109 count:16];
            }
            while (v51);
          }
          goto LABEL_78;
        }
      }
      else
      {
        unint64_t v39 = **(void **)(v1 + 248);
        if ((uint64_t)v39 >= 1)
        {
          uint64_t v95 = &v92;
          if (v39 >= 0x201) {
            uint64_t v40 = 1;
          }
          else {
            uint64_t v40 = v39;
          }
          size_t v41 = 8 * v40;
          MEMORY[0x1F4188790](v4);
          uint64_t v43 = (char *)&v92 - v42;
          if (v41 >= 0x200) {
            size_t v44 = 512;
          }
          else {
            size_t v44 = v41;
          }
          bzero(v43, v44);
          if (v39 > 0x200) {
            uint64_t v43 = (char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero(v43, v41);
          }
          uint64_t v71 = *(void **)(v1 + 248);
          uint64_t v72 = v71[1];
          if (v72 >= 1)
          {
            uint64_t v73 = 0;
            uint64_t v74 = (uint64_t *)v71[9];
            do
            {
              uint64_t v76 = *v74++;
              uint64_t v75 = v76;
              uint64_t v77 = v71[8];
              if (v77 != v76 && v75 != ~v77) {
                *(void *)&v43[8 * v73++] = v75;
              }
              --v72;
            }
            while (v72);
          }
          uint64_t v79 = [*(id *)(v1 + 40) count];
          uint64_t v80 = PF_Tiger_CFDictionaryCreate(0, v79, 1);
          uint64_t v81 = v80;
          uint64_t v93 = (int)v79;
          unint64_t v94 = v79 << 32;
          if (v79 << 32) {
            uint64_t v82 = (int)v79;
          }
          else {
            uint64_t v82 = 1;
          }
          unint64_t v83 = v79;
          if (v79 >= 0x201uLL) {
            uint64_t v84 = 1;
          }
          else {
            uint64_t v84 = v82;
          }
          size_t v85 = 8 * v84;
          MEMORY[0x1F4188790](v80);
          uint64_t v87 = (char *)&v92 - v86;
          if (v85 >= 0x200) {
            size_t v88 = 512;
          }
          else {
            size_t v88 = v85;
          }
          bzero(v87, v88);
          if (v83 > 0x200) {
            uint64_t v87 = (char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero(v87, v85);
          }
          for (uint64_t k = 0; k != v39; ++k)
          {
            uint64_t v90 = *(__CFString **)&v43[8 * k];
            uint64_t Value = _PF_Leopard_CFDictionaryGetValue(*(void **)(v1 + 248), v90);
            PF_Tiger_CFDictionarySetValue((uint64_t)v81, v90, Value);
          }
          PF_Tiger_CFDictionaryGetKeysAndValues((uint64_t)v81, 0, v87);
          uint64_t v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:v93];
          PF_Tiger_CFDictionaryDestroy(v81);
          if (HIDWORD(v94) >= 0x201) {
            NSZoneFree(0, v87);
          }
          if (v39 < 0x201) {
            goto LABEL_81;
          }
          uint64_t v57 = v43;
          goto LABEL_80;
        }
      }
    }
    uint64_t v15 = NSArray_EmptyArray;
    goto LABEL_81;
  }
  return result;
}

- (uint64_t)_addForeignOrderKeyForToOne:(void *)a3 entity:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  result = [a2 sourceEntity];
  if (!a2) {
    return result;
  }
  unsigned int v6 = a2[10];
  if (!v6) {
    return result;
  }
  uint64_t v7 = (void *)result;
  result = objc_msgSend(*(id *)(v5 + 40), "objectForKey:", objc_msgSend(a2[10], "name"));
  if (result) {
    return result;
  }
  objc_msgSend(*(id *)(v5 + 40), "setObject:forKey:", v6, objc_msgSend(v6, "name"));
  BOOL v8 = *(void **)(v5 + 248);
  if (v8) {
    _PF_Leopard_CFDictionarySetValue(v8, (__CFString *)[v6 name], v6);
  }
  if (v7 != a3)
  {
    uint64_t v9 = *(void **)(v5 + 104);
    if (!v9)
    {
      uint64_t v9 = objc_opt_new();
      *(void *)(v5 + 104) = v9;
    }
    [v9 addObject:v6];
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  -[NSSQLEntity _addColumnToFetch:]((void *)v5, v6);
  if (a3) {
LABEL_11:
  }
    a3 = (void *)a3[19];
LABEL_12:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  result = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(a3);
        }
        -[NSSQLEntity _addForeignOrderKeyForToOne:entity:](*(void *)(*((void *)&v13 + 1) + 8 * v12), a2, *(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      result = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

- (void)dealloc
{
  if (self)
  {
    if (atomic_load((unint64_t *)&self->_fetch_entity_plan))
    {
      uint64_t v4 = (CFTypeRef *)atomic_load((unint64_t *)&self->_fetch_entity_plan);
      _deallocateFetchEntityPlan(v4);
      atomic_store(0, (unint64_t *)&self->_fetch_entity_plan);
    }
  }
  odiousHashHackStorage = self->_odiousHashHackStorage;
  if (odiousHashHackStorage)
  {
    _PF_Leopard_CFDictionaryDestroy(odiousHashHackStorage);
    self->_odiousHashHackStorage = 0;
  }

  self->_superentity = 0;
  unsigned int v6 = (void *)atomic_load((unint64_t *)&self->_virtualFKs);

  if (self->_propertyMapping)
  {

    self->_primaryKey = 0;
    self->_propertyMapping = 0;

    self->_entityKey = 0;
  }
  self->_subentities = 0;
  self->_tableName = 0;
  self->_columnsToFetch = 0;
  self->_columnsToFetchNoSubentities = 0;
  self->_fkColumns = 0;
  self->_ekColumns = 0;
  self->_fokColumns = 0;
  self->_attrColumns = 0;
  self->_entityDescription = 0;
  self->_properties = 0;
  self->_mappingGenerator = 0;
  atomic_store(0, (unint64_t *)&self->_fetch_entity_plan);
  self->_propertyAllCache = 0;
  self->_propertiesAllToManysCache = 0;
  self->_propertyManyToManyCache = 0;
  self->_multicolumnUniquenessConstraints = 0;
  self->_uniqueProperties = 0;
  self->_rtreeIndices = 0;
  self->_derivedAttributes = 0;
  self->_derivedAttributeExtension = 0;
  self->_compositeAttributeNameToSQLProperties = 0;
  self->_model = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSSQLEntity;
  [(NSStoreMapping *)&v7 dealloc];
}

- (id)toManyRelationships
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  propertiesAllToManysCache = (__CFArray *)self->_propertiesAllToManysCache;
  if (!propertiesAllToManysCache)
  {
    propertiesAllToManysCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "isToMany", (void)v11)) {
            CFArrayAppendValue(propertiesAllToManysCache, v9);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    self->_propertiesAllToManysCache = (NSArray *)propertiesAllToManysCache;
  }
  return propertiesAllToManysCache;
}

- (id)manyToManyRelationships
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  propertyManyToManyCache = (__CFArray *)self->_propertyManyToManyCache;
  if (!propertyManyToManyCache)
  {
    propertyManyToManyCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(unsigned char **)(*((void *)&v11 + 1) + 8 * v8);
          if (v9 && v9[24] == 9) {
            CFArrayAppendValue(propertyManyToManyCache, v9);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    self->_propertyManyToManyCache = (NSArray *)propertyManyToManyCache;
  }
  return propertyManyToManyCache;
}

- (uint64_t)properties
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 48);
    if (!result)
    {
      uint64_t v2 = (void *)[*(id *)(v1 + 40) allValues];
      unint64_t v3 = [v2 count];
      unint64_t v4 = MEMORY[0x1F4188790](v3);
      uint64_t v7 = (const void **)((char *)v9 - v6);
      if (v4 > 0x200) {
        uint64_t v7 = (const void **)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v9 - v6, 8 * v5);
      }
      objc_msgSend(v2, "getObjects:range:", v7, 0, v3);
      CFArrayRef v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, v3, 0);
      if (v3 >= 0x201) {
        NSZoneFree(0, v7);
      }
      *(void *)(v1 + 48) = v8;
      return *(void *)(v1 + 48);
    }
  }
  return result;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    qword_1EB270450 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

- (uint64_t)tempTableName
{
  if (result) {
    return [NSString stringWithFormat:@"TEMP_CD%@", *(void *)(result + 32)];
  }
  return result;
}

- (NSSQLToOne)_addVirtualToOneForToMany:(NSSQLToOne *)a3 withInheritedProperty:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v3 = a3;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    BOOL v7 = *(unsigned char *)(v6 + 57) != 0;
    if (a3)
    {
      int v8 = 0;
      goto LABEL_7;
    }
    *(unsigned char *)(v6 + 58) = 1;
    goto LABEL_6;
  }
  BOOL v7 = 0;
  int v8 = 0;
  if (!a3)
  {
LABEL_6:
    unint64_t v3 = [[NSSQLToOne alloc] initWithEntity:a1 inverseToMany:a2];
    int v8 = 1;
  }
LABEL_7:
  uint64_t v9 = [(NSSQLToOne *)v3 foreignKey];
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, objc_msgSend(v9, "name"));
  if (!v7) {
    _PF_Leopard_CFDictionarySetValue(*(void **)(a1 + 248), (__CFString *)[v9 name], v9);
  }
  if (v8)
  {
    -[NSSQLEntity _addColumnToFetch:]((void *)a1, v9);
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 96);
    if (!v10)
    {
      uint64_t v10 = objc_opt_new();
      *(void *)(a1 + 96) = v10;
    }
    [v10 addObject:v9];
  }
  if (v3)
  {
    foreignEntityKey = v3->_foreignEntityKey;
    if (foreignEntityKey)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", foreignEntityKey, -[NSSQLForeignEntityKey name](v3->_foreignEntityKey, "name"));
      if (!v7) {
        _PF_Leopard_CFDictionarySetValue(*(void **)(a1 + 248), (__CFString *)[(NSSQLForeignEntityKey *)foreignEntityKey name], foreignEntityKey);
      }
      if (v8)
      {
        -[NSSQLEntity _addColumnToFetch:]((void *)a1, foreignEntityKey);
      }
      else
      {
        long long v12 = *(void **)(a1 + 88);
        if (!v12)
        {
          long long v12 = objc_opt_new();
          *(void *)(a1 + 88) = v12;
        }
        [v12 addObject:foreignEntityKey];
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, -[NSSQLRelationship name](v3, "name"));
  if (v7)
  {
    if (!v8) {
      goto LABEL_25;
    }
LABEL_28:
    -[NSSQLRelationship _setInverseRelationship:](v3, a2);

    if (!v3) {
      goto LABEL_37;
    }
LABEL_29:
    foreignOrderKey = v3->_foreignOrderKey;
    if (foreignOrderKey)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", foreignOrderKey, -[NSSQLForeignOrderKey name](v3->_foreignOrderKey, "name"));
      long long v14 = *(void **)(a1 + 248);
      if (v14) {
        _PF_Leopard_CFDictionarySetValue(v14, (__CFString *)[(NSSQLForeignOrderKey *)foreignOrderKey name], foreignOrderKey);
      }
      if (v8)
      {
        -[NSSQLEntity _addColumnToFetch:]((void *)a1, foreignOrderKey);
      }
      else
      {
        long long v15 = *(void **)(a1 + 104);
        if (!v15)
        {
          long long v15 = objc_opt_new();
          *(void *)(a1 + 104) = v15;
        }
        [v15 addObject:foreignOrderKey];
      }
    }
    goto LABEL_37;
  }
  _PF_Leopard_CFDictionarySetValue(*(void **)(a1 + 248), (__CFString *)[(NSSQLRelationship *)v3 name], v3);
  if (v8) {
    goto LABEL_28;
  }
LABEL_25:
  if (v3) {
    goto LABEL_29;
  }
LABEL_37:
  uint64_t v16 = *(void **)(a1 + 152);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NSSQLEntity _addVirtualToOneForToMany:withInheritedProperty:](*(void *)(*((void *)&v22 + 1) + 8 * i), a2, v3);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
  return v3;
}

- (void)entitySpecificPropertiesPassing:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = (void *)[*(id *)(a1 + 40) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a2 + 16))(a2, [v9 propertyType]))
        {
          uint64_t v10 = *(void *)(a1 + 160);
          uint64_t v11 = [v9 name];
          if (!v10 || ![*(id *)(v10 + 40) objectForKey:v11]) {
            [v13 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v13;
}

uint64_t __39__NSSQLEntity_entitySpecificProperties__block_invoke(uint64_t a1, unsigned int a2)
{
  return (a2 < 0xA) & (0x382u >> a2);
}

BOOL __42__NSSQLEntity_entitySpecificRelationships__block_invoke(uint64_t a1, int a2)
{
  return (a2 - 7) < 3;
}

BOOL __39__NSSQLEntity_entitySpecificAttributes__block_invoke(uint64_t a1, int a2)
{
  return a2 == 1;
}

- (void)subhierarchyColumnMatching:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(a2, "name"));
  if (!v4
    || (uint64_t v5 = v4, [v4 propertyType] != 1)
    || !objc_msgSend((id)objc_msgSend(a2, "propertyDescription"), "_isSchemaEqual:", objc_msgSend(v5, "propertyDescription"))|| (objc_msgSend((id)objc_msgSend(a2, "columnName"), "isEqual:", objc_msgSend(v5, "columnName")) & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = *(void **)(a1 + 152);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = -[NSSQLEntity subhierarchyColumnMatching:](*(void *)(*((void *)&v13 + 1) + 8 * v10), a2);
          if (v11) {
            return (void *)v11;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    return 0;
  }
  return v5;
}

- (uint64_t)_sqlPropertyWithRenamingIdentifier:(uint64_t)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = (void *)[*(id *)(result + 24) propertiesByName];
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", a2), "renamingIdentifier"), "isEqualToString:", a2))
    {
      uint64_t v5 = *(void **)(v3 + 40);
      return [v5 objectForKey:a2];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v6 = objc_msgSend(v4, "allValues", 0);
      result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (result)
      {
        uint64_t v7 = result;
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
            if (objc_msgSend((id)objc_msgSend(v10, "renamingIdentifier"), "isEqualToString:", a2)) {
              return objc_msgSend(*(id *)(v3 + 40), "objectForKey:", objc_msgSend(v10, "name"));
            }
            ++v9;
          }
          while (v7 != v9);
          result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          uint64_t v7 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

uint64_t __34__NSSQLEntity__generateProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        if ([v9 isNSArray])
        {
          uint64_t v10 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 16);
LABEL_10:
          v10();
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          [v9 elements];
          [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v9, "name")];
          uint64_t v10 = *(void (**)(void))(v11 + 16);
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v9 name];
          long long v13 = (__CFString *)[NSString stringWithFormat:@"%@.%@", a3, v12];
          if (![*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v13])
          {
            long long v14 = [[NSSQLAttribute alloc] initWithEntity:*(void *)(a1 + 32) propertyDescription:v9];
            -[NSSQLEntity _addColumnToFetch:](*(void **)(a1 + 32), v14);
            [*(id *)(a1 + 40) addObject:v14];
            [*(id *)(*(void *)(a1 + 32) + 40) setObject:v14 forKey:v13];
            if (!*(unsigned char *)(a1 + 72)) {
              [*(id *)(a1 + 48) setObject:v14 forKey:v13];
            }
            if ([*(id *)(a1 + 56) _propertyType] == 6) {
              -[NSSQLEntity addDerivedAttribute:](*(void *)(a1 + 32), (uint64_t)v14);
            }
            _PF_Leopard_CFDictionarySetValue(*(void **)(*(void *)(a1 + 32) + 248), v13, v14);
          }
        }
LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __35__NSSQLEntity__organizeConstraints__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (uint64_t)_collectFKSlots:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v7 = (void *)[*(id *)(a1 + 160) foreignKeyColumns];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v22 = a1;
  uint64_t v8 = *(void **)(a1 + 96);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = [v13 slot];
        if ([a2 containsIndex:v14]
          && ([v7 containsObject:v13] & 1) == 0)
        {
          if (a3) {
            *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend((id)objc_msgSend(v13, "toOneRelationship"), "propertyDescription"), @"relationship"));
          }
          goto LABEL_22;
        }
        [v6 addIndex:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  [v6 addIndexes:a2];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v15 = *(void **)(v22 + 152);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_13:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v15);
      }
      if (-[NSSQLEntity _collectFKSlots:error:](*(void *)(*((void *)&v23 + 1) + 8 * v19), v6, a3)) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        uint64_t v20 = 0;
        if (v17) {
          goto LABEL_13;
        }
        goto LABEL_23;
      }
    }
LABEL_22:
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_23:

  return v20;
}

- (uint64_t)_entityIsBroken:(uint64_t)a1
{
  if (!a1 || *(void *)(a1 + 168) != a1) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v6 = -[NSSQLEntity _collectFKSlots:error:](a1, v5, a2);

  return v6;
}

- (uint64_t)sqlAttributesForCompositeAttributeName:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 272) objectForKey:a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];

  return [v4 arrayWithArray:v3];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(NSSQLEntity *)self name];
  if (self) {
    uint64_t entityID = self->_entityID;
  }
  else {
    uint64_t entityID = 0;
  }
  return (id)[v3 stringWithFormat:@"<NSSQLEntity %@ id=%d>", v4, entityID];
}

- (void)rtreeIndexes
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[29];
    if (!result)
    {
      uint64_t result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v1[29] = result;
    }
  }
  return result;
}

- (void)indexForIndexDescription:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 && [a2[2] count] && !objc_msgSend((id)objc_msgSend(a2[2], "firstObject"), "collationType"))
    {
      id v6 = [(NSSQLIndex *)[NSSQLBinaryIndex alloc] initForIndexDescription:a2 sqlEntity:v3];
      return v6;
    }
    else
    {
      id v4 = (void *)v3[29];
      uint64_t v5 = [a2 name];
      return (void *)[v4 objectForKey:v5];
    }
  }
  return result;
}

- (uint64_t)rtreeIndexForIndexNamed:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *(void **)(a1 + 232);
  if (a2)
  {
    return [v3 objectForKey:a2];
  }
  if ([v3 count] != 1) {
    return 0;
  }
  uint64_t v5 = (void *)[*(id *)(a1 + 232) allValues];

  return [v5 firstObject];
}

uint64_t __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)+[NSSQLDerivedAttributeSQLGenerator generateSQLForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", 0, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"dropStatements"), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", @"dropStatements"));
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"dataStatements"), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", @"dataStatements"));
  return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"triggerCreationStatements"), "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "valueForKey:", @"triggerCreationStatements"));
}

@end