@interface NSMergePolicy
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (NSMergePolicy)errorMergePolicy;
+ (NSMergePolicy)mergeByPropertyObjectTrumpMergePolicy;
+ (NSMergePolicy)mergeByPropertyStoreTrumpMergePolicy;
+ (NSMergePolicy)overwriteMergePolicy;
+ (NSMergePolicy)rollbackMergePolicy;
+ (void)initialize;
- (BOOL)resolveConflicts:(NSArray *)list error:(NSError *)error;
- (BOOL)resolveConstraintConflicts:(NSArray *)list error:(NSError *)error;
- (BOOL)resolveOptimisticLockingVersionConflicts:(NSArray *)list error:(NSError *)error;
- (NSMergePolicy)init;
- (NSMergePolicy)initWithCoder:(id)a3;
- (NSMergePolicyType)mergeType;
- (id)initWithMergeType:(NSMergePolicyType)ty;
- (uint64_t)_byPropertyObjectTrumpResolveConstraintConflict:(void *)a1;
- (uint64_t)_byPropertyStoreTrumpResolveConstraintConflict:(void *)a1;
- (uint64_t)_mergeToManyUnionRelationshipsForObject:(void *)a1 andObject:(void *)a2;
- (uint64_t)_overwriteResolveConstraintConflict:(void *)a1;
- (uint64_t)_rollbackResolveConstraintConflict:(void *)a1;
- (uint64_t)_valuesOnObject:(uint64_t)a1 matchAgainstValues:(void *)a2;
- (void)_cannotResolveConflictOnEntity:(void *)a1 relationshipWithNoInverse:(void *)a2;
- (void)_mergeChangesObjectUpdatesTrumpForObject:(id)a3 withRecord:(id)a4;
- (void)_mergeChangesStoreUpdatesTrumpForObject:(id)a3 withRecord:(id)a4;
- (void)_mergeToManyRelationshipsForObject:(void *)a1 ontoObject:(void *)a2;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMergePolicy

+ (NSMergePolicy)mergeByPropertyObjectTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyObjectTrumpMergePolicy;
}

- (void)dealloc
{
  if (NSMergeByPropertyStoreTrumpMergePolicy == self
    || NSMergeByPropertyObjectTrumpMergePolicy == self
    || NSOverwriteMergePolicy == self
    || NSRollbackMergePolicy == self
    || NSErrorMergePolicy == self)
  {
    v6 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSMergePolicy;
    [(NSMergePolicy *)&v7 dealloc];
  }
}

+ (void)initialize
{
  if ((_MergedGlobals_77 & 1) == 0)
  {
    _MergedGlobals_77 = 1;
    self;
    dword_1EB2706EC = _CFExecutableLinkedOnOrAfter() == 0;
    NSErrorMergePolicy = [[NSMergePolicy alloc] initWithMergeType:0];
    NSMergeByPropertyStoreTrumpMergePolicy = [[NSMergePolicy alloc] initWithMergeType:1];
    NSMergeByPropertyObjectTrumpMergePolicy = [[NSMergePolicy alloc] initWithMergeType:2];
    NSOverwriteMergePolicy = [[NSMergePolicy alloc] initWithMergeType:3];
    NSRollbackMergePolicy = [[NSMergePolicy alloc] initWithMergeType:4];
  }
}

- (id)initWithMergeType:(NSMergePolicyType)ty
{
  v5.receiver = self;
  v5.super_class = (Class)NSMergePolicy;
  id result = [(NSMergePolicy *)&v5 init];
  if (result) {
    *((void *)result + 1) = ty;
  }
  return result;
}

- (BOOL)resolveConstraintConflicts:(NSArray *)list error:(NSError *)error
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v181 = 0;
  if (![(NSArray *)list count]) {
    return 1;
  }
  v153 = self;
  if (!self->_type) {
    goto LABEL_251;
  }
  v148 = error;
  id v149 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (objc_msgSend(-[NSArray firstObject](list, "firstObject"), "_isDBConflict"))
  {
    v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    uint64_t v7 = [(NSArray *)list countByEnumeratingWithState:&v177 objects:v198 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v178;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v178 != v9) {
            objc_enumerationMutation(list);
          }
          v11 = *(void **)(*((void *)&v177 + 1) + 8 * i);
          long long v173 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          v12 = (void *)[v11 conflictingObjects];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v173 objects:v197 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v174;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v174 != v14) {
                  objc_enumerationMutation(v12);
                }
                v16 = *(void **)(*((void *)&v173 + 1) + 8 * j);
                objc_msgSend(v6, "addObject:", objc_msgSend(v16, "objectID"));
                if (!v8) {
                  uint64_t v8 = [v16 managedObjectContext];
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v173 objects:v197 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [(NSArray *)list countByEnumeratingWithState:&v177 objects:v198 count:16];
      }
      while (v7);
      if (v8)
      {
        v17 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]((uint64_t)_PFRoutines, (uint64_t)v6);
        v206[0] = 0;
        v206[1] = v206;
        v206[2] = 0x3052000000;
        v206[3] = __Block_byref_object_copy__15;
        v206[4] = __Block_byref_object_dispose__15;
        uint64_t v207 = 0;
        uint64_t v207 = [MEMORY[0x1E4F1CA48] array];
        v172[0] = MEMORY[0x1E4F143A8];
        v172[1] = 3221225472;
        v172[2] = __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke;
        v172[3] = &unk_1E544BCD8;
        v172[4] = v8;
        v172[5] = v206;
        [(__CFDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v172];

        _Block_object_dispose(v206, 8);
      }
    }
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  uint64_t v18 = [(NSArray *)list countByEnumeratingWithState:&v168 objects:v196 count:16];
  if (!v18) {
    goto LABEL_245;
  }
  uint64_t v150 = *MEMORY[0x1E4F281F8];
  uint64_t v151 = *(void *)v169;
LABEL_24:
  uint64_t v161 = 0;
  uint64_t v152 = v18;
  while (1)
  {
    if (*(void *)v169 != v151) {
      objc_enumerationMutation(list);
    }
    if (!v153) {
      break;
    }
    v19 = *(void **)(*((void *)&v168 + 1) + 8 * v161);
    if ([v19 _isDBConflict])
    {
      v20 = (void *)[v19 databaseObject];
      v21 = objc_msgSend((id)objc_msgSend(v19, "conflictingObjects"), "lastObject");
      if ([v21 isDeleted] & 1) != 0 || (objc_msgSend(v20, "isDeleted")) {
        goto LABEL_76;
      }
      id v166 = (id)[v19 constraint];
      v22 = (void *)[v19 databaseSnapshot];
      if (v20 && (uint64_t v23 = v20[6]) != 0) {
        v164 = *(void **)(v23 + 8);
      }
      else {
        v164 = 0;
      }
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      uint64_t v50 = [v166 countByEnumeratingWithState:&v190 objects:v206 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v191;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v191 != v51) {
              objc_enumerationMutation(v166);
            }
            uint64_t v53 = *(void *)(*((void *)&v190 + 1) + 8 * k);
            v54 = (void *)[v21 valueForKey:v53];
            v55 = (void *)[v22 valueForKey:v53];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ((objc_msgSend((id)objc_msgSend(v54, "objectID"), "isEqual:", v55) & 1) == 0) {
                  goto LABEL_76;
                }
              }
              else
              {
                uint64_t v56 = [NSString stringWithUTF8String:"Got non-object value back for property '%@' which returned an objectID from the snapshot."];
                _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, v53);
                v63 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v201 = v53;
                  _os_log_fault_impl(&dword_18AB82000, v63, OS_LOG_TYPE_FAULT, "CoreData: Got non-object value back for property '%@' which returned an objectID from the snapshot.", buf, 0xCu);
                }
              }
            }
            else if (([v54 isEqual:v55] & 1) == 0 {
                   && (![v54 isNSString]
            }
                    || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v54, v55)))
            {
              goto LABEL_76;
            }
            if ([v20 hasChanges])
            {
              v64 = (void *)[v20 valueForKey:v53];
              if ((objc_msgSend(v64, "isEqual:", objc_msgSend(v164, "valueForKey:", v53)) & 1) == 0
                && ([v64 isEqual:v54] & 1) == 0
                && (![v64 isNSString]
                 || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v54, v64)))
              {
                goto LABEL_76;
              }
            }
          }
          uint64_t v50 = [v166 countByEnumeratingWithState:&v190 objects:v206 count:16];
        }
        while (v50);
      }
      v155 = v19;
    }
    else
    {
      v24 = (void *)[MEMORY[0x1E4F1CA48] array];
      v25 = (void *)[v19 constraintValues];
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      v26 = (void *)[v19 conflictingObjects];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v190 objects:v206 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v191;
        do
        {
          for (uint64_t m = 0; m != v27; ++m)
          {
            if (*(void *)v191 != v28) {
              objc_enumerationMutation(v26);
            }
            v30 = *(void **)(*((void *)&v190 + 1) + 8 * m);
            if (([v30 isDeleted] & 1) == 0
              && -[NSMergePolicy _valuesOnObject:matchAgainstValues:]((uint64_t)v30, v25))
            {
              [v24 addObject:v30];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v190 objects:v206 count:16];
        }
        while (v27);
      }
      if ((unint64_t)[v24 count] < 2) {
        goto LABEL_76;
      }
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      uint64_t v32 = [v24 countByEnumeratingWithState:&v186 objects:&v202 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v187;
        do
        {
          for (uint64_t n = 0; n != v32; ++n)
          {
            if (*(void *)v187 != v33) {
              objc_enumerationMutation(v24);
            }
            uint64_t v35 = *(void *)(*((void *)&v186 + 1) + 8 * n);
            if (!v35 || (uint64_t v36 = *(void *)(v35 + 48)) == 0 || (v37 = *(void *)(v36 + 8)) == 0) {
              uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
            }
            [v31 addObject:v37];
          }
          uint64_t v32 = [v24 countByEnumeratingWithState:&v186 objects:&v202 count:16];
        }
        while (v32);
      }
      v155 = -[NSConstraintConflict initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:]([NSConstraintConflict alloc], "initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:", [v19 constraint], 0, 0, v24, v31);
    }
    if (!v155) {
      goto LABEL_76;
    }
    v38 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    v39 = [(NSConstraintConflict *)v155 conflictingObjects];
    uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v182 objects:v199 count:16];
    if (!v40) {
      goto LABEL_73;
    }
    uint64_t v41 = 0;
    uint64_t v42 = *(void *)v183;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v183 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v182 + 1) + 8 * ii);
        if (!v41) {
          uint64_t v41 = [*(id *)(*((void *)&v182 + 1) + 8 * ii) managedObjectContext];
        }
        objc_msgSend(v38, "addObject:", objc_msgSend(v44, "entity"));
      }
      uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v182 objects:v199 count:16];
    }
    while (v40);
    if (!v41)
    {
LABEL_73:
      v48 = &unk_1ED7E1FB0;
      goto LABEL_74;
    }
    v45 = [(NSConstraintConflict *)v155 databaseObject];
    p_isa = &v45->super.isa;
    if (v45) {
      objc_msgSend(v38, "addObject:", -[NSManagedObject entity](v45, "entity"));
    }
    unint64_t v47 = [v38 count];
    v48 = &unk_1ED7E1FD8;
    if (v47 > 1) {
      goto LABEL_74;
    }
    if ((-[NSEntityDescription _isPathologicalForConstraintMerging:]([v38 anyObject], &v181) & 1) == 0)
    {
      if ([(NSConstraintConflict *)v155 _isDBConflict])
      {
        switch(v153->_type)
        {
          case 1uLL:
            -[NSMergePolicy _byPropertyStoreTrumpResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 2uLL:
            -[NSMergePolicy _byPropertyObjectTrumpResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 3uLL:
            -[NSMergePolicy _overwriteResolveConstraintConflict:](v155);
            goto LABEL_145;
          case 4uLL:
            -[NSMergePolicy _rollbackResolveConstraintConflict:](v155);
LABEL_145:
            char v87 = 1;
            break;
          default:
            char v87 = 0;
            break;
        }
        goto LABEL_239;
      }
      v65 = [(NSConstraintConflict *)v155 conflictingObjects];
      v66 = [(NSConstraintConflict *)v155 conflictingSnapshots];
      v67 = [(NSConstraintConflict *)v155 constraintValues];
      uint64_t v68 = [(NSArray *)[(NSConstraintConflict *)v155 conflictingSnapshots] count];
      if (!v68) {
        goto LABEL_115;
      }
      uint64_t v69 = 0;
      p_isa = 0;
      while (2)
      {
        uint64_t v70 = [(NSArray *)v66 objectAtIndex:v69];
        if ([MEMORY[0x1E4F1CA98] null] == v70
          && (objc_msgSend(-[NSArray objectAtIndex:](v65, "objectAtIndex:", v69), "hasChanges") & 1) == 0)
        {
          p_isa = [(NSArray *)v65 objectAtIndex:v69];
LABEL_110:
          if (v68 == ++v69) {
            goto LABEL_114;
          }
          continue;
        }
        break;
      }
      if (!-[NSMergePolicy _valuesOnObject:matchAgainstValues:](v70, v67)) {
        goto LABEL_110;
      }
      p_isa = [(NSArray *)v65 objectAtIndex:v69];
LABEL_114:
      if (p_isa) {
        goto LABEL_165;
      }
LABEL_115:
      id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      uint64_t v73 = [(NSArray *)v65 countByEnumeratingWithState:&v186 objects:&v202 count:16];
      if (v73)
      {
        uint64_t v74 = *(void *)v187;
        do
        {
          for (juint64_t j = 0; jj != v73; ++jj)
          {
            if (*(void *)v187 != v74) {
              objc_enumerationMutation(v65);
            }
            v76 = *(void **)(*((void *)&v186 + 1) + 8 * jj);
            if ([v76 isInserted]) {
              v77 = v72;
            }
            else {
              v77 = v71;
            }
            [v77 addObject:v76];
          }
          uint64_t v73 = [(NSArray *)v65 countByEnumeratingWithState:&v186 objects:&v202 count:16];
        }
        while (v73);
      }
      uint64_t v78 = [v71 count];
      if (!v78)
      {
        uint64_t v79 = [v72 firstObject];
LABEL_163:
        p_isa = (void *)v79;
        goto LABEL_164;
      }
      if (v78 == 1)
      {
        uint64_t v79 = [v71 lastObject];
        goto LABEL_163;
      }
      v80 = objc_msgSend((id)objc_msgSend(v71, "firstObject"), "objectID");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v192 = 0u;
        long long v193 = 0u;
        long long v190 = 0u;
        long long v191 = 0u;
        uint64_t v81 = [v71 countByEnumeratingWithState:&v190 objects:v206 count:16];
        if (v81)
        {
          p_isa = 0;
          uint64_t v82 = *(void *)v191;
          uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (kuint64_t k = 0; kk != v81; ++kk)
            {
              if (*(void *)v191 != v82) {
                objc_enumerationMutation(v71);
              }
              v85 = *(void **)(*((void *)&v190 + 1) + 8 * kk);
              uint64_t v86 = objc_msgSend((id)objc_msgSend(v85, "objectID"), "_referenceData64");
              if (v83 > v86) {
                p_isa = v85;
              }
              if (v83 >= v86) {
                uint64_t v83 = v86;
              }
            }
            uint64_t v81 = [v71 countByEnumeratingWithState:&v190 objects:v206 count:16];
          }
          while (v81);
          goto LABEL_164;
        }
LABEL_241:
        p_isa = 0;
        goto LABEL_164;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v80 _referenceData], (objc_opt_respondsToSelector() & 1) == 0))
      {
        uint64_t v79 = [v71 firstObject];
        goto LABEL_163;
      }
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      uint64_t v88 = [v71 countByEnumeratingWithState:&v190 objects:v206 count:16];
      if (!v88) {
        goto LABEL_241;
      }
      p_isa = 0;
      v89 = 0;
      uint64_t v90 = *(void *)v191;
      do
      {
        for (muint64_t m = 0; mm != v88; ++mm)
        {
          if (*(void *)v191 != v90) {
            objc_enumerationMutation(v71);
          }
          v92 = *(void **)(*((void *)&v190 + 1) + 8 * mm);
          uint64_t v93 = objc_msgSend((id)objc_msgSend(v92, "objectID"), "_referenceData");
          if (v89)
          {
            v94 = (void *)v93;
            if ([v89 compare:v93] != -1)
            {
              p_isa = v92;
              v89 = v94;
            }
          }
          else
          {
            v89 = objc_msgSend((id)objc_msgSend(v92, "objectID"), "_referenceData");
          }
        }
        uint64_t v88 = [v71 countByEnumeratingWithState:&v190 objects:v206 count:16];
      }
      while (v88);
LABEL_164:

LABEL_165:
      unint64_t type = v153->_type;
      if (type - 3 < 2)
      {
        long long v202 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        v135 = [(NSConstraintConflict *)v155 conflictingObjects];
        uint64_t v136 = [(NSArray *)v135 countByEnumeratingWithState:&v202 objects:v206 count:16];
        if (v136)
        {
          uint64_t v137 = *(void *)v203;
          do
          {
            for (nuint64_t n = 0; nn != v136; ++nn)
            {
              if (*(void *)v203 != v137) {
                objc_enumerationMutation(v135);
              }
              v139 = *(void **)(*((void *)&v202 + 1) + 8 * nn);
              if (v139 != p_isa) {
                objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v202 + 1) + 8 * nn), "managedObjectContext"), "deleteObject:", v139);
              }
            }
            uint64_t v136 = [(NSArray *)v135 countByEnumeratingWithState:&v202 objects:v206 count:16];
          }
          while (v136);
        }
LABEL_237:
        char v87 = 1;
        goto LABEL_239;
      }
      if (type - 1 <= 1)
      {
        v96 = [(NSConstraintConflict *)v155 conflictingObjects];
        long long v205 = 0u;
        long long v204 = 0u;
        long long v203 = 0u;
        long long v202 = 0u;
        uint64_t v97 = [(NSArray *)v96 countByEnumeratingWithState:&v202 objects:v206 count:16];
        if (!v97) {
          goto LABEL_237;
        }
        uint64_t v159 = *(void *)v203;
        v156 = v96;
        while (1)
        {
          uint64_t v98 = 0;
          uint64_t v157 = v97;
          do
          {
            if (*(void *)v203 != v159) {
              objc_enumerationMutation(v156);
            }
            v99 = *(void **)(*((void *)&v202 + 1) + 8 * v98);
            if (v99 != p_isa)
            {
              if (p_isa && (uint64_t v100 = p_isa[6]) != 0)
              {
                v101 = *(void **)(v100 + 8);
                if (!v99)
                {
LABEL_180:
                  v163 = 0;
                  goto LABEL_181;
                }
              }
              else
              {
                v101 = 0;
                if (!v99) {
                  goto LABEL_180;
                }
              }
              uint64_t v102 = v99[6];
              if (!v102) {
                goto LABEL_180;
              }
              v163 = *(void **)(v102 + 8);
LABEL_181:
              uint64_t v103 = [p_isa entity];
              v104 = (void *)v103;
              if (v103)
              {
                uint64_t v105 = [*(id *)(v103 + 104) keys];
                v106 = (void *)v104[14];
              }
              else
              {
                uint64_t v105 = [0 keys];
                v106 = 0;
              }
              id v167 = (id)[MEMORY[0x1E4F1CA98] null];
              v162 = v104;
              v165 = v99;
              unint64_t v107 = v106[6];
              uint64_t v108 = v106[7];
              if (v107 < v108 + v107)
              {
                v109 = (void *)(v105 + 8 * v107);
                do
                {
                  if (!v101
                    || ((uint64_t v110 = [v101 valueForKey:*v109], v167 != (id)v110)
                      ? (uint64_t v111 = v110)
                      : (uint64_t v111 = 0),
                        (uint64_t v112 = [p_isa valueForKey:*v109], v111 | v112)
                     && [(id)v111 isEqual:v112]))
                  {
                    uint64_t v113 = [v163 valueForKey:*v109];
                    uint64_t v114 = v167 == (id)v113 ? 0 : v113;
                    uint64_t v115 = [v165 valueForKey:*v109];
                    uint64_t v116 = v115;
                    if (v115 | v114)
                    {
                      if (([(id)v115 isEqual:v114] & 1) == 0) {
                        [p_isa setValue:v116 forKey:*v109];
                      }
                    }
                  }
                  ++v109;
                  --v108;
                }
                while (v108);
              }
              uint64_t v160 = v98;
              unint64_t v117 = v106[12];
              uint64_t v118 = v106[13];
              if (v117 < v118 + v117)
              {
                uint64_t v119 = 8 * v117;
                do
                {
                  v120 = p_isa;
                  uint64_t v121 = [p_isa valueForKey:*(void *)(v105 + v119)];
                  if (!v101
                    || ((uint64_t v122 = [v101 valueForKey:*(void *)(v105 + v119)], v167 != (id)v122)
                      ? (uint64_t v123 = v122)
                      : (uint64_t v123 = 0),
                        v123 | v121
                     && objc_msgSend((id)v123, "isEqual:", objc_msgSend((id)v121, "objectID"))))
                  {
                    uint64_t v124 = [v163 valueForKey:*(void *)(v105 + v119)];
                    uint64_t v125 = v167 == (id)v124 ? 0 : v124;
                    uint64_t v126 = [v165 valueForKey:*(void *)(v105 + v119)];
                    v127 = (void *)v126;
                    if (v126 | v125)
                    {
                      if (([(id)v126 isEqual:v125] & 1) == 0)
                      {
                        v128 = *(void **)(v162[12] + 24 + v119);
                        v129 = (void *)[v128 inverseRelationship];
                        uint64_t v130 = [v129 name];
                        int v131 = [v129 isToMany];
                        if (v121)
                        {
                          if (!v129) {
                            -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v162, v128);
                          }
                          if (v131)
                          {
                            int v132 = [v129 isOrdered];
                            uint64_t v133 = [v129 name];
                            if (v132)
                            {
                              objc_msgSend((id)objc_msgSend((id)v121, "mutableOrderedSetValueForKey:", v133), "removeObject:", v120);
                              v134 = objc_msgSend(v127, "mutableOrderedSetValueForKey:", objc_msgSend(v129, "name"));
                            }
                            else
                            {
                              objc_msgSend((id)objc_msgSend((id)v121, "mutableSetValueForKey:", v133), "removeObject:", v120);
                              v134 = objc_msgSend(v127, "mutableSetValueForKey:", objc_msgSend(v129, "name"));
                            }
                            [v134 addObject:v120];
                            [v134 removeObject:v165];
                          }
                          else
                          {
                            [v127 setValue:v120 forKey:v130];
                            [(id)v121 setValue:0 forKey:v130];
                          }
                          if ([v128 deleteRule] == 2) {
                            objc_msgSend((id)objc_msgSend(v120, "managedObjectContext"), "deleteObject:", v121);
                          }
                        }
                        [v165 setValue:0 forKey:*(void *)(v105 + v119)];
                        [v120 setValue:v127 forKey:*(void *)(v105 + v119)];
                      }
                    }
                  }
                  v119 += 8;
                  --v118;
                  p_isa = v120;
                }
                while (v118);
              }
              -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:](p_isa, v165);
              uint64_t v97 = v157;
              uint64_t v98 = v160;
              objc_msgSend((id)objc_msgSend(v165, "managedObjectContext"), "deleteObject:", v165);
            }
            ++v98;
          }
          while (v98 != v97);
          uint64_t v97 = [(NSArray *)v156 countByEnumeratingWithState:&v202 objects:v206 count:16];
          if (!v97) {
            goto LABEL_237;
          }
        }
      }
      char v87 = 0;
LABEL_239:
      objc_msgSend((id)objc_msgSend(p_isa, "managedObjectContext"), "processPendingChanges");
      v48 = &unk_1ED7E2000;
      if (v87)
      {
        char v49 = 1;
        goto LABEL_75;
      }
LABEL_74:
      char v49 = 0;
      id v181 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v150 code:133020 userInfo:v48];
      goto LABEL_75;
    }
    char v49 = 0;
LABEL_75:

    if ((v49 & 1) == 0) {
      break;
    }
LABEL_76:
    if (++v161 == v152)
    {
      uint64_t v18 = [(NSArray *)list countByEnumeratingWithState:&v168 objects:v196 count:16];
      char v154 = 1;
      if (!v18) {
        goto LABEL_247;
      }
      goto LABEL_24;
    }
  }
  id v140 = v181;
LABEL_245:
  char v154 = 0;
LABEL_247:
  [v149 drain];
  id v141 = 0;
  if (v154) {
    return 1;
  }
  id v143 = v181;
  error = v148;
  if (v181)
  {
    *v148 = (NSError *)v181;
    id v144 = v143;
    return 0;
  }
LABEL_251:
  v145 = (void *)MEMORY[0x1E4F28C58];
  v194 = @"conflictList";
  v195 = list;
  uint64_t v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
  v147 = (NSError *)[v145 errorWithDomain:*MEMORY[0x1E4F281F8] code:133021 userInfo:v146];
  BOOL result = 0;
  *error = v147;
  return result;
}

- (uint64_t)_mergeToManyUnionRelationshipsForObject:(void *)a1 andObject:(void *)a2
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 entity];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t result = [*(id *)(v3 + 104) keys];
    uint64_t v6 = v4[14];
    unint64_t v7 = *(void *)(v6 + 144);
    unint64_t v39 = *(void *)(v6 + 152) + v7;
    if (v7 < v39)
    {
      uint64_t v8 = result;
      uint64_t v36 = result;
      uint64_t v37 = v4;
      while (1)
      {
        uint64_t v9 = *(void **)(v4[12] + 24 + 8 * v7);
        v10 = objc_msgSend(v9, "inverseRelationship", v36);
        uint64_t v11 = [v10 name];
        int v12 = [v10 isToMany];
        int v42 = [v10 isOrdered];
        v38 = v9;
        int v13 = [v9 isOrdered];
        uint64_t v14 = *(void *)(v8 + 8 * v7);
        unint64_t v41 = v7;
        if (v13) {
          break;
        }
        uint64_t v18 = (void *)[a1 mutableSetValueForKey:v14];
        v19 = (void *)[a2 mutableSetValueForKey:*(void *)(v8 + 8 * v7)];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v40 = v19;
        v20 = (void *)[v19 allObjects];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v45 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              [v18 addObject:v25];
              if (!v10) {
LABEL_40:
              }
                -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v37, v38);
              if (v12)
              {
                if (v42) {
                  v26 = (void *)[v25 mutableOrderedSetValueForKey:v11];
                }
                else {
                  v26 = (void *)[v25 mutableSetValueForKey:v11];
                }
                uint64_t v27 = v26;
                [v26 removeObject:a2];
                [v27 addObject:a1];
              }
              else
              {
                [v25 setValue:a1 forKey:v11];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v22);
LABEL_37:
          uint64_t v8 = v36;
          v4 = v37;
        }
LABEL_38:
        uint64_t result = [v40 removeAllObjects];
        unint64_t v7 = v41 + 1;
        if (v41 + 1 == v39) {
          return result;
        }
      }
      v15 = (void *)[a1 mutableOrderedSetValueForKey:v14];
      v16 = (void *)[a2 mutableOrderedSetValueForKey:*(void *)(v8 + 8 * v7)];
      uint64_t v40 = v16;
      if ([v16 count]) {
        v17 = objc_msgSend(v16, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "count")));
      }
      else {
        v17 = (void *)[MEMORY[0x1E4F1C978] array];
      }
      uint64_t v28 = v17;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v29 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v29) {
        goto LABEL_38;
      }
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          [v15 addObject:v33];
          if (!v10) {
            goto LABEL_40;
          }
          if (v12)
          {
            if (v42) {
              v34 = (void *)[v33 mutableOrderedSetValueForKey:v11];
            }
            else {
              v34 = (void *)[v33 mutableSetValueForKey:v11];
            }
            uint64_t v35 = v34;
            [v34 removeObject:a2];
            [v35 addObject:a1];
          }
          else
          {
            [v33 setValue:a1 forKey:v11];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v30);
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t result = [0 keys];
    __break(1u);
  }
  return result;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSMergePolicyType)mergeType
{
  return self->_type;
}

- (NSMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSMergePolicy;
  return [(NSMergePolicy *)&v3 init];
}

- (NSMergePolicy)initWithCoder:(id)a3
{
  unsigned int v4 = [a3 decodeIntForKey:@"NSTypeCode"] - 1;
  if (v4 > 3) {
    objc_super v5 = &NSErrorMergePolicy;
  }
  else {
    objc_super v5 = (id *)off_1E544C8F8[v4];
  }
  id v7 = *v5;

  return (NSMergePolicy *)v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (uint64_t)_valuesOnObject:(uint64_t)a1 matchAgainstValues:(void *)a2
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke;
  v4[3] = &unk_1E544BCD8;
  v4[4] = a1;
  v4[5] = &v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  unint64_t v5 = (unint64_t)a3;
  if ((void *)[MEMORY[0x1E4F1CA98] null] == a3) {
    unint64_t v5 = 0;
  }
  uint64_t result = [*(id *)(a1 + 32) valueForKey:a2];
  if (v5 | result)
  {
    uint64_t v9 = (void *)result;
    uint64_t result = [(id)v5 isEqual:result];
    if ((result & 1) == 0)
    {
      uint64_t result = [v9 isNSString];
      if (!result
        || (uint64_t result = +[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)_PFRoutines, v9, (void *)v5),
            (result & 1) == 0))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (uint64_t)_rollbackResolveConstraintConflict:(void *)a1
{
  v1 = objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  int v2 = [v1 isInserted];
  objc_super v3 = (void *)[v1 managedObjectContext];
  if (v2)
  {
    return [v3 deleteObject:v1];
  }
  else
  {
    return [v3 refreshObject:v1 mergeChanges:0];
  }
}

- (void)_cannotResolveConflictOnEntity:(void *)a1 relationshipWithNoInverse:(void *)a2
{
}

- (uint64_t)_overwriteResolveConstraintConflict:(void *)a1
{
  int v2 = (void *)[a1 databaseObject];
  -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:](objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject"), objc_msgSend(a1, "databaseObject"));
  objc_super v3 = (void *)[v2 managedObjectContext];

  return [v3 deleteObject:v2];
}

- (void)_mergeToManyRelationshipsForObject:(void *)a1 ontoObject:(void *)a2
{
  int v2 = a1;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 entity];
  unsigned int v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [*(id *)(v3 + 104) keys];
    uint64_t v6 = v4[14];
    if (!v2) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = [0 keys];
    uint64_t v6 = 0;
    if (!v2)
    {
LABEL_7:
      uint64_t v68 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v7 = v2[6];
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v68 = *(void **)(v7 + 8);
LABEL_8:
  unint64_t v8 = *(void *)(v6 + 144);
  unint64_t v67 = *(void *)(v6 + 152) + v8;
  if (v8 >= v67) {
    return;
  }
  uint64_t v73 = v2;
  uint64_t v69 = v5;
  v66 = v4;
  do
  {
    uint64_t v9 = *(void **)(v4[12] + 24 + 8 * v8);
    v10 = (void *)[v9 inverseRelationship];
    uint64_t v11 = [v10 name];
    int v12 = [v10 isToMany];
    int v74 = [v10 isOrdered];
    v65 = v9;
    int v13 = [v9 isOrdered];
    uint64_t v14 = *(void *)(v5 + 8 * v8);
    unint64_t v70 = v8;
    if (!v13)
    {
      v25 = (void *)[v2 mutableSetValueForKey:v14];
      v26 = (void *)[v68 objectForKey:*(void *)(v5 + 8 * v8)];
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      uint64_t v28 = [v26 countByEnumeratingWithState:&v84 objects:v102 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v85 != v30) {
              objc_enumerationMutation(v26);
            }
            uint64_t v32 = *(void *)(*((void *)&v84 + 1) + 8 * i);
            if (([v25 containsObject:v32] & 1) == 0) {
              [v27 addObject:v32];
            }
          }
          uint64_t v29 = [v26 countByEnumeratingWithState:&v84 objects:v102 count:16];
        }
        while (v29);
      }
      v64 = v27;
      uint64_t v33 = (void *)[a2 mutableSetValueForKey:*(void *)(v69 + 8 * v70)];
      v34 = (void *)[v25 allObjects];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id obja = v34;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v80 objects:v101 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v81 != v37) {
              objc_enumerationMutation(obja);
            }
            unint64_t v39 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            [v33 addObject:v39];
            if (!v10)
            {
              v63 = v64;
              goto LABEL_94;
            }
            if (v12)
            {
              if (v74) {
                uint64_t v40 = (void *)[v39 mutableOrderedSetValueForKey:v11];
              }
              else {
                uint64_t v40 = (void *)[v39 mutableSetValueForKey:v11];
              }
              unint64_t v41 = v40;
              [v40 removeObject:v73];
              [v41 addObject:a2];
            }
            else
            {
              [v39 setValue:a2 forKey:v11];
            }
            [v25 removeObject:v39];
          }
          uint64_t v36 = [obja countByEnumeratingWithState:&v80 objects:v101 count:16];
        }
        while (v36);
      }
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v42 = [v64 countByEnumeratingWithState:&v76 objects:v100 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v77;
        do
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v77 != v44) {
              objc_enumerationMutation(v64);
            }
            long long v46 = *(void **)(*((void *)&v76 + 1) + 8 * k);
            if ([v33 containsObject:v46])
            {
              [v33 removeObject:v46];
              if (!v10)
              {

                goto LABEL_95;
              }
              if (v12)
              {
                if (v74) {
                  long long v47 = (void *)[v46 mutableOrderedSetValueForKey:v11];
                }
                else {
                  long long v47 = (void *)[v46 mutableSetValueForKey:v11];
                }
                [v47 removeObject:a2];
              }
              else
              {
                [v46 setValue:0 forKey:v11];
              }
            }
          }
          uint64_t v43 = [v64 countByEnumeratingWithState:&v76 objects:v100 count:16];
        }
        while (v43);
      }

      goto LABEL_90;
    }
    v15 = (void *)[v2 mutableOrderedSetValueForKey:v14];
    v16 = (void *)[v68 objectForKey:*(void *)(v5 + 8 * v8)];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v97;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v97 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void *)(*((void *)&v96 + 1) + 8 * m);
          if (([v15 containsObject:v22] & 1) == 0) {
            [v17 addObject:v22];
          }
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v19);
    }
    uint64_t v23 = (void *)[a2 mutableOrderedSetValueForKey:*(void *)(v69 + 8 * v70)];
    obuint64_t j = v17;
    if ([v15 count]) {
      v24 = objc_msgSend(v15, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v15, "count")));
    }
    else {
      v24 = (void *)[MEMORY[0x1E4F1C978] array];
    }
    long long v48 = v24;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v49 = [v24 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v93;
      do
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          uint64_t v53 = v15;
          if (*(void *)v93 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v54 = *(void **)(*((void *)&v92 + 1) + 8 * n);
          [v23 addObject:v54];
          if (!v10)
          {
            v63 = obj;
LABEL_94:

LABEL_95:
            -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v66, v65);
          }
          if (v12)
          {
            if (v74) {
              v55 = (void *)[v54 mutableOrderedSetValueForKey:v11];
            }
            else {
              v55 = (void *)[v54 mutableSetValueForKey:v11];
            }
            uint64_t v56 = v55;
            [v55 removeObject:v73];
            [v56 addObject:a2];
          }
          else
          {
            [v54 setValue:a2 forKey:v11];
          }
          v15 = v53;
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v50);
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v57 = [obj countByEnumeratingWithState:&v88 objects:v103 count:16];
    if (!v57) {
      goto LABEL_89;
    }
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v89;
    do
    {
      for (iuint64_t i = 0; ii != v58; ++ii)
      {
        if (*(void *)v89 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = *(void **)(*((void *)&v88 + 1) + 8 * ii);
        if ([v23 containsObject:v61])
        {
          [v23 removeObject:v61];
          if (!v10)
          {

            goto LABEL_95;
          }
          if (v74) {
            uint64_t v62 = (void *)[v61 mutableOrderedSetValueForKey:v11];
          }
          else {
            uint64_t v62 = (void *)[v61 mutableSetValueForKey:v11];
          }
          [v62 removeObject:a2];
        }
      }
      uint64_t v58 = [obj countByEnumeratingWithState:&v88 objects:v103 count:16];
    }
    while (v58);
LABEL_89:

    [v15 removeAllObjects];
LABEL_90:
    uint64_t v5 = v69;
    unint64_t v8 = v70 + 1;
    unsigned int v4 = v66;
    int v2 = v73;
  }
  while (v70 + 1 != v67);
}

- (uint64_t)_byPropertyStoreTrumpResolveConstraintConflict:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  uint64_t v3 = (void *)[a1 conflictingObjects];
  if ([a1 _isDBConflict]) {
    unsigned int v4 = (void *)[a1 databaseObject];
  }
  else {
    unsigned int v4 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v4 != v9) {
          -[NSMergePolicy _mergeToManyRelationshipsForObject:ontoObject:](v9, v4);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  v10 = (void *)[v2 managedObjectContext];

  return [v10 deleteObject:v2];
}

- (uint64_t)_byPropertyObjectTrumpResolveConstraintConflict:(void *)a1
{
  int v2 = objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  uint64_t v3 = (void *)[a1 databaseObject];
  char v48 = [v2 isInserted];
  uint64_t v44 = (void *)[v2 managedObjectContext];
  uint64_t v4 = [v2 entity];
  uint64_t v5 = (void *)v4;
  uint64_t v45 = v4;
  if (v4)
  {
    uint64_t v6 = [*(id *)(v4 + 104) keys];
    uint64_t v5 = (void *)v5[14];
  }
  else
  {
    uint64_t v6 = [0 keys];
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  if (v2 && (uint64_t v8 = v2[6]) != 0) {
    uint64_t v9 = *(void **)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v5[6];
  uint64_t v11 = v5[7];
  if (v10 < v11 + v10)
  {
    long long v12 = (void *)(v6 + 8 * v10);
    do
    {
      uint64_t v13 = [v9 valueForKey:*v12];
      uint64_t v14 = [v2 valueForKey:*v12];
      if (v7 == v14) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
      if ((v48 & 1) != 0
        || (v7 != v13 ? (v16 = (void *)v13) : (v16 = 0), ([v16 isEqual:v15] & 1) == 0))
      {
        [v3 setValue:v15 forKey:*v12];
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  unint64_t v17 = v5[12];
  uint64_t v18 = v5[13];
  if (v17 < v18 + v17)
  {
    uint64_t v19 = 8 * v17;
    long long v46 = v2;
    long long v47 = v9;
    uint64_t v42 = v3;
    while (1)
    {
      uint64_t v20 = [v9 valueForKey:*(void *)(v6 + v19)];
      if (v7 == v20) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = (void *)v20;
      }
      uint64_t v22 = (void *)[v2 valueForKey:*(void *)(v6 + v19)];
      uint64_t v23 = v22;
      if ((void *)v7 == v22) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = [v22 objectID];
      }
      if (v48 & 1) == 0 && ([v21 isEqual:v24]) {
        goto LABEL_52;
      }
      v25 = v3;
      v26 = (void *)[v3 valueForKey:*(void *)(v6 + v19)];
      id v27 = *(void **)(*(void *)(v45 + 96) + 24 + v19);
      uint64_t v28 = (void *)[v27 inverseRelationship];
      uint64_t v29 = [v28 name];
      int v30 = [v28 isToMany];
      if (!v26)
      {
        if (v28)
        {
          if (v30)
          {
            int v37 = [v28 isOrdered];
            uint64_t v38 = [v28 name];
            if (v37) {
              unint64_t v39 = (void *)[v23 mutableOrderedSetValueForKey:v38];
            }
            else {
              unint64_t v39 = (void *)[v23 mutableSetValueForKey:v38];
            }
            uint64_t v40 = v39;
            [v39 addObject:v25];
            [v40 removeObject:v46];
          }
          else
          {
            [v23 setValue:v25 forKey:v29];
          }
        }
        goto LABEL_51;
      }
      if (v28) {
        break;
      }
LABEL_47:
      if ([v27 deleteRule] == 2) {
        [v44 deleteObject:v26];
      }
LABEL_51:
      [v46 setValue:0 forKey:*(void *)(v6 + v19)];
      uint64_t v3 = v25;
      int v2 = v46;
      [v3 setValue:v23 forKey:*(void *)(v6 + v19)];
LABEL_52:
      v19 += 8;
      --v18;
      uint64_t v9 = v47;
      if (!v18) {
        goto LABEL_53;
      }
    }
    if (!v30)
    {
      [v23 setValue:v25 forKey:v29];
      [v26 setValue:0 forKey:v29];
      goto LABEL_47;
    }
    int v31 = [v28 isOrdered];
    uint64_t v32 = [v28 name];
    if (v31)
    {
      uint64_t v43 = [v26 mutableOrderedSetValueForKey:v32];
      uint64_t v33 = objc_msgSend(v23, "mutableOrderedSetValueForKey:", objc_msgSend(v28, "name"));
      if (([v33 containsObject:v25] & 1) == 0)
      {
        unint64_t v34 = [v33 indexOfObject:v46];
        if (v34 < [v33 count]) {
          [v33 replaceObjectAtIndex:v34 withObject:v25];
        }
        uint64_t v35 = (void *)v43;
        uint64_t v36 = v25;
        goto LABEL_46;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v26, "mutableSetValueForKey:", v32), "removeObject:", v25);
      uint64_t v33 = objc_msgSend(v23, "mutableSetValueForKey:", objc_msgSend(v28, "name"));
      [v33 addObject:v42];
    }
    uint64_t v35 = v33;
    uint64_t v36 = v46;
LABEL_46:
    [v35 removeObject:v36];
    goto LABEL_47;
  }
LABEL_53:
  -[NSMergePolicy _mergeToManyRelationshipsForObject:ontoObject:](v2, v3);

  return [v44 deleteObject:v2];
}

void __33__NSMergePolicy_resolveConflict___block_invoke(uint64_t a1)
{
  int v2 = -[_NSQueryGenerationToken _generationalComponentForStore:]([*(id *)(a1 + 32) _queryGenerationToken], *(id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(const void **)(a1 + 48);

  -[NSXPCStore _clearCachedRowForObjectWithID:generation:](v3, v4, v2);
}

- (void)_mergeChangesStoreUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  uint64_t v40 = (void **)[a3 managedObjectContext];
  uint64_t v44 = a3;
  if ([a3 isInserted]) {
    -[NSManagedObjectContext _forceMoveInsertToUpdatedList:]((uint64_t)v40, a3);
  }
  uint64_t v42 = (void *)[a4 ancestorSnapshot];
  uint64_t v7 = [a4 objectForKey:@"snapshot"];
  uint64_t v8 = [a4 objectForKey:@"cachedRow"];
  uint64_t v9 = (void *)v8;
  if (v7)
  {
    unint64_t v10 = (void *)v8;
    uint64_t v9 = (void *)v7;
  }
  else
  {
    unint64_t v10 = (void *)[a4 objectForKey:@"databaseRow"];
  }
  if (v7) {
    BOOL v11 = dword_1EB2706EC == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  unsigned int v41 = v12;
  uint64_t v13 = [v44 entity];
  uint64_t v14 = v13;
  uint64_t v38 = self;
  if (v13)
  {
    uint64_t v15 = [*(id *)(v13 + 104) keys];
    uint64_t v16 = *(void *)(v14 + 112);
  }
  else
  {
    uint64_t v15 = [0 keys];
    uint64_t v16 = 0;
  }
  uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v43 = objc_msgSend((id)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)v40, v44), "copy");
  unint64_t v18 = *(void *)(v16 + 48);
  uint64_t v19 = *(void *)(v16 + 56);
  uint64_t v39 = v16;
  if (v18 < v19 + v18)
  {
    do
    {
      uint64_t v20 = [v9 objectForKey:*(void *)(v15 + 8 * v18)];
      if (v20 == v17) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = (void *)v20;
      }
      uint64_t v22 = [v10 objectForKey:*(void *)(v15 + 8 * v18)];
      if (v22 == v17) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = (void *)v22;
      }
      if (v21 != v23
        && ([*(id *)(*(void *)(v14 + 96) + 24 + 8 * v18) _epsilonEquals:v23 rhs:v21 withFlags:1] & 1) == 0)
      {
        if (!v42
          || (uint64_t v24 = (void *)[v42 objectForKey:*(void *)(v15 + 8 * v18)], v25 = v24, v24 == v21)
          || ([v24 isEqual:v21] & 1) != 0)
        {
          uint64_t v21 = v23;
        }
        else if (v25 != v23 && ![v25 isEqual:v23])
        {
          uint64_t v21 = v23;
        }
        [v44 setValue:v21 forKey:*(void *)(v15 + 8 * v18)];
        [v43 setValue:v21 atIndex:v18];
      }
      ++v18;
      --v19;
    }
    while (v19);
  }
  unint64_t v26 = *(void *)(v39 + 96);
  uint64_t v27 = *(void *)(v39 + 104);
  uint64_t v28 = v41;
  if (v26 < v27 + v26)
  {
    while (1)
    {
      uint64_t v29 = [v9 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v29 == v17) {
        int v30 = 0;
      }
      else {
        int v30 = (void *)v29;
      }
      if (v28) {
        int v30 = (void *)[v30 objectID];
      }
      uint64_t v31 = [v10 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v31 == v17) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = (void *)v31;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        uint64_t v32 = (void *)[v32 objectID];
      }
      if (v30 == v32 || ([v32 isEqual:v30] & 1) != 0) {
        goto LABEL_59;
      }
      if (!v42) {
        goto LABEL_54;
      }
      uint64_t v33 = (void *)[v42 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v33 == v30) {
        goto LABEL_54;
      }
      unint64_t v34 = v33;
      if ([v33 isEqual:v30]) {
        goto LABEL_54;
      }
      if (v34 != v32) {
        break;
      }
      uint64_t v32 = v30;
      if (!v30)
      {
LABEL_57:
        id v35 = 0;
        goto LABEL_58;
      }
LABEL_55:
      id v35 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v40, v32, 0);
LABEL_58:
      [v44 setValue:v35 forKey:*(void *)(v15 + 8 * v26)];
      [v43 setValue:v35 atIndex:v26];

      uint64_t v28 = v41;
LABEL_59:
      ++v26;
      if (!--v27) {
        goto LABEL_60;
      }
    }
    if ([v34 isEqual:v32]) {
      uint64_t v32 = v30;
    }
LABEL_54:
    if (!v32) {
      goto LABEL_57;
    }
    goto LABEL_55;
  }
LABEL_60:

  if (v42) {
    [(NSMergePolicy *)v38 mergeToManyRelationshipForSourceObject:v44 withOldSnapshot:v9 newSnapshot:v10 andAncestor:v42 andLegacyPath:v28];
  }
  if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88 && [v44 isDeleted])
  {
    uint64_t v36 = (void *)[v44 managedObjectContext];
    int v37 = (void *)[v44 objectID];
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](v36, (uint64_t)v44, v37);
  }
}

void __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke(uint64_t a1)
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) entity];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v76 = [*(id *)(v2 + 104) keys];
    uint64_t v4 = v3[14];
  }
  else
  {
    uint64_t v76 = [0 keys];
    uint64_t v4 = 0;
  }
  unint64_t v70 = v3;
  uint64_t v66 = _kvcPropertysPrimitiveGetters(v3);
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v73 = (void *)[*(id *)(a1 + 32) objectID];
  unint64_t v6 = *(void *)(v4 + 96);
  uint64_t v7 = *(void *)(v4 + 104);
  uint64_t v68 = v4;
  if (v6 < v7 + v6)
  {
    uint64_t v8 = 8 * v6;
    while (1)
    {
      uint64_t v9 = *(void *)(v76 + v8);
      uint64_t v10 = [*(id *)(a1 + 40) objectForKey:v9];
      if (v10 == v5) {
        id v11 = 0;
      }
      else {
        id v11 = (id)v10;
      }
      if (*(unsigned char *)(a1 + 72)) {
        id v11 = (id)[v11 objectID];
      }
      uint64_t v12 = [*(id *)(a1 + 48) objectForKey:v9];
      if (v12 == v5) {
        id v13 = 0;
      }
      else {
        id v13 = (id)v12;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        id v13 = (id)[v13 objectID];
      }
      if (v11 == v13) {
        goto LABEL_57;
      }
      if ([*(id *)(v70[12] + 24 + v8) _epsilonEquals:v13 rhs:v11 withFlags:1]) {
        goto LABEL_57;
      }
      uint64_t v14 = *(void **)(v70[12] + 24 + v8);
      uint64_t v15 = [v14 deleteRule];
      if ((unint64_t)(v15 - 1) > 1) {
        goto LABEL_57;
      }
      uint64_t v16 = (void *)[v14 inverseRelationship];
      if (!v16) {
        goto LABEL_57;
      }
      if (v13) {
        id v13 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](*(void ***)(a1 + 56), v13, 0);
      }
      uint64_t v74 = [v16 name];
      id v71 = objc_msgSend(v13, "primitiveValueForKey:");
      if (![v16 isToMany])
      {
        if (v11
          && (id v11 = (id)[*(id *)(a1 + 64) newValuesForObjectWithID:v11 withContext:*(void *)(a1 + 56) error:0]) != 0&& (v17 = objc_opt_class(), v17 != objc_opt_class()))
        {
          id v18 = (id)[v11 valueForPropertyDescription:v16];
          *(void *)&long long v93 = 0;
          if (!v18)
          {
            id v18 = (id)[*(id *)(a1 + 64) newValueForRelationship:v16 forObjectWithID:v73 withContext:*(void *)(a1 + 56) error:&v93];
            if (!v18)
            {
              NSLog((NSString *)@"That was unexpected. Error trying to get %@ from %@ (%@)", v14, v73, (void)v93);
              id v18 = 0;
            }
          }
          if ((id)[MEMORY[0x1E4F1CA98] null] == v18) {
            id v19 = 0;
          }
          else {
            id v19 = v18;
          }
        }
        else
        {
          id v19 = (id)[v11 valueForKey:v74];
        }
        if ((([v73 isEqual:v19] & 1) != 0 || v71 == *(void **)(a1 + 32)) && v13)
        {
          [*(id *)(a1 + 56) refreshObject:v13 mergeChanges:1];
          if (v15 == 2) {
            [*(id *)(a1 + 56) deleteObject:v13];
          }
          else {
            [v13 setValue:0 forKey:v74];
          }
        }

        goto LABEL_56;
      }
      if (v11) {
        id v11 = (id)[*(id *)(a1 + 64) newValueForRelationship:v16 forObjectWithID:v11 withContext:*(void *)(a1 + 56) error:0];
      }
      if (([v11 containsObject:v73] & 1) == 0) {
        break;
      }
      if (v13) {
        goto LABEL_47;
      }
LABEL_55:

LABEL_56:
LABEL_57:
      v8 += 8;
      if (!--v7) {
        goto LABEL_58;
      }
    }
    char v20 = [v71 containsObject:*(void *)(a1 + 32)];
    if (v13) {
      char v21 = v20;
    }
    else {
      char v21 = 0;
    }
    if ((v21 & 1) == 0) {
      goto LABEL_55;
    }
LABEL_47:
    [*(id *)(a1 + 56) refreshObject:v13 mergeChanges:1];
    if (v15 == 2)
    {
      [*(id *)(a1 + 56) deleteObject:v13];
    }
    else
    {
      if ([v16 isOrdered]) {
        uint64_t v22 = (void *)[v13 mutableOrderedSetValueForKey:v74];
      }
      else {
        uint64_t v22 = (void *)[v13 mutableSetValueForKey:v74];
      }
      [v22 removeObject:*(void *)(a1 + 32)];
    }
    goto LABEL_55;
  }
LABEL_58:
  uint64_t v23 = *(unsigned char **)(a1 + 32);
  if ((v23[17] & 0x80) != 0) {
    [v23 willAccessValueForKey:0];
  }
  uint64_t v24 = *MEMORY[0x1E4F1D548];
  v90[1] = 0;
  v90[2] = 0;
  v90[4] = _PFObjectIDFastEquals64;
  v90[5] = _PFObjectIDFastHash64;
  v87[0] = v24;
  v87[1] = 0;
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
  v90[3] = *(void *)(MEMORY[0x1E4F1D548] + 24);
  long long v88 = v25;
  uint64_t v26 = *(void *)(MEMORY[0x1E4F1D548] + 40);
  v87[2] = 0;
  uint64_t v89 = v26;
  v90[0] = v24;
  objc_opt_class();
  uint64_t v27 = v70;
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v29 = (CFSetCallBacks *)v87;
  long long v123 = 0u;
  long long v124 = 0u;
  if (isKindOfClass) {
    uint64_t v29 = (CFSetCallBacks *)v90;
  }
  callBacks = v29;
  long long v121 = 0uLL;
  long long v122 = 0uLL;
  long long v119 = 0uLL;
  long long v120 = 0uLL;
  long long v117 = 0uLL;
  long long v118 = 0uLL;
  long long v115 = 0uLL;
  long long v116 = 0uLL;
  long long v113 = 0uLL;
  long long v114 = 0uLL;
  long long v111 = 0uLL;
  long long v112 = 0uLL;
  long long v109 = 0uLL;
  long long v110 = 0uLL;
  long long v107 = 0uLL;
  long long v108 = 0uLL;
  long long v105 = 0uLL;
  long long v106 = 0uLL;
  long long v103 = 0uLL;
  long long v104 = 0uLL;
  long long v101 = 0uLL;
  long long v102 = 0uLL;
  long long v99 = 0uLL;
  long long v100 = 0uLL;
  long long v97 = 0uLL;
  long long v98 = 0uLL;
  long long v95 = 0uLL;
  long long v96 = 0uLL;
  unint64_t v31 = *(void *)(v68 + 144);
  uint64_t v30 = *(void *)(v68 + 152);
  uint64_t v32 = v30 + v31;
  long long v93 = 0uLL;
  long long v94 = 0uLL;
  if (v31 < v30 + v31)
  {
    unint64_t v33 = 0x1E911F000uLL;
    uint64_t v64 = v30 + v31;
    do
    {
      unint64_t v34 = *(void **)(v27[12] + *(int *)(v33 + 2536) + 8 * v31);
      uint64_t v35 = [v34 deleteRule];
      if ((unint64_t)(v35 - 1) <= 1)
      {
        long long v77 = (void *)[v34 inverseRelationship];
        if (v77)
        {
          uint64_t v75 = [v77 name];
          uint64_t v36 = (void *)[*(id *)(a1 + 64) newValueForRelationship:v34 forObjectWithID:v73 withContext:*(void *)(a1 + 56) error:0];
          int v37 = v36;
          if (v36 && [v36 count])
          {
            _PF_Handler_Primitive_GetProperty(*(id ***)(a1 + 32), v31, 0, *(void *)(v66 + 8 * v31), v38, v39, v40, v41);
            uint64_t v43 = v42;
            CFAllocatorRef v44 = _PFStackAllocatorCreate((unint64_t *)&v93, 1024);
            Mutable = CFSetCreateMutable(v44, 0, callBacks);
            uint64_t v72 = v35;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v46 = [v43 countByEnumeratingWithState:&v83 objects:v92 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v84;
              do
              {
                for (uint64_t i = 0; i != v46; ++i)
                {
                  if (*(void *)v84 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  CFSetAddValue(Mutable, *(const void **)(*(void *)(*((void *)&v83 + 1) + 8 * i) + 40));
                }
                uint64_t v46 = [v43 countByEnumeratingWithState:&v83 objects:v92 count:16];
              }
              while (v46);
            }
            unint64_t v67 = v31;
            uint64_t v69 = v34;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            uint64_t v49 = [v37 countByEnumeratingWithState:&v79 objects:v91 count:16];
            if (v49)
            {
              uint64_t v50 = *(void *)v80;
              do
              {
                for (uint64_t j = 0; j != v49; ++j)
                {
                  if (*(void *)v80 != v50) {
                    objc_enumerationMutation(v37);
                  }
                  v52 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                  if (!CFSetContainsValue(Mutable, v52))
                  {
                    id v53 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](*(void ***)(a1 + 56), v52, 0);
                    uint64_t v54 = v53;
                    if (v53)
                    {
                      v55 = (void *)[v53 primitiveValueForKey:v75];
                      int v56 = [v77 isToMany];
                      uint64_t v57 = *(void **)(a1 + 64);
                      if (v56)
                      {
                        uint64_t v58 = (void *)[v57 newValueForRelationship:v77 forObjectWithID:v52 withContext:*(void *)(a1 + 56) error:0];
                        if (([v58 containsObject:v73] & 1) != 0
                          || [v55 containsObject:*(void *)(a1 + 32)])
                        {
                          [*(id *)(a1 + 56) refreshObject:v54 mergeChanges:1];
                          if (v72 == 2)
                          {
                            [*(id *)(a1 + 56) deleteObject:v54];
                          }
                          else
                          {
                            if ([v77 isOrdered]) {
                              v63 = (void *)[v54 mutableOrderedSetValueForKey:v75];
                            }
                            else {
                              v63 = (void *)[v54 mutableSetValueForKey:v75];
                            }
                            [v63 removeObject:*(void *)(a1 + 32)];
                          }
                        }
                      }
                      else
                      {
                        uint64_t v59 = (void *)[v57 newValuesForObjectWithID:v52 withContext:*(void *)(a1 + 56) error:0];
                        if (!v59 || (uint64_t v60 = objc_opt_class(), v60 == objc_opt_class()))
                        {
                          id v61 = (id)[v59 valueForKey:v75];
                        }
                        else
                        {
                          id v61 = (id)[v59 valueForPropertyDescription:v77];
                          uint64_t v78 = 0;
                          uint64_t v62 = v77;
                          if (!v61)
                          {
                            id v61 = (id)[*(id *)(a1 + 64) newValueForRelationship:v77 forObjectWithID:v73 withContext:*(void *)(a1 + 56) error:&v78];
                            if (!v61)
                            {
                              NSLog((NSString *)@"That was unexpected. Error trying to get %@ from %@ (%@)", v69, v73, v78);
                              id v61 = 0;
                            }
                          }
                          if ((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", v62) == v61) {
                            id v61 = 0;
                          }
                        }
                        if ([v73 isEqual:v61])
                        {
                          [*(id *)(a1 + 56) refreshObject:v54 mergeChanges:1];
                          if ([v54 primitiveValueForKey:v75] == *(void *)(a1 + 32))
                          {
                            if (v72 == 2) {
                              [*(id *)(a1 + 56) deleteObject:v54];
                            }
                            else {
                              [v54 setValue:0 forKey:v75];
                            }
                          }
                        }
                      }
                    }
                  }
                }
                uint64_t v49 = [v37 countByEnumeratingWithState:&v79 objects:v91 count:16];
              }
              while (v49);
            }
            if (*((void *)&v94 + 1))
            {
              uint64_t v27 = v70;
              unint64_t v31 = v67;
              uint64_t v32 = v64;
              unint64_t v33 = 0x1E911F000;
              if (Mutable) {
                CFRelease(Mutable);
              }
            }
            else
            {
              *((void *)&v93 + 1) = v93;
              uint64_t v27 = v70;
              unint64_t v31 = v67;
              uint64_t v32 = v64;
              unint64_t v33 = 0x1E911F000;
            }
          }
        }
      }
      ++v31;
    }
    while (v31 != v32);
  }
}

- (void)_mergeChangesObjectUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C127630](self, a2);
  uint64_t v7 = [a3 managedObjectContext];
  uint64_t v8 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:](v7, a3);
  v52 = (void **)v7;
  if ([a3 isDeleted])
  {
    if (self)
    {
      uint64_t v9 = [a4 objectForKey:@"snapshot"];
      uint64_t v10 = [a4 objectForKey:@"cachedRow"];
      uint64_t v11 = v10;
      if (v9)
      {
        uint64_t v12 = v10;
        uint64_t v11 = v9;
      }
      else
      {
        uint64_t v12 = [a4 objectForKey:@"databaseRow"];
      }
      if (v9) {
        BOOL v13 = dword_1EB2706EC == 0;
      }
      else {
        BOOL v13 = 1;
      }
      char v14 = !v13;
      uint64_t v15 = [a3 managedObjectContext];
      uint64_t v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = *(void **)(v15 + 32);
      }
      else {
        uint64_t v17 = 0;
      }
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      unint64_t v67 = __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke;
      uint64_t v68 = &unk_1E544C888;
      id v69 = a3;
      uint64_t v70 = v11;
      char v74 = v14;
      uint64_t v71 = v12;
      uint64_t v72 = v15;
      uint64_t v73 = v17;
      -[NSManagedObjectContext lockObjectStore](v15);
      if (v17 == (void *)[v16 persistentStoreCoordinator]) {
        [v17 performBlockAndWait:v66];
      }
      else {
        v67((uint64_t)v66);
      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)v16);
    }
  }
  else if ([a3 isInserted])
  {
    -[NSManagedObjectContext _forceMoveInsertToUpdatedList:](v7, a3);
  }
  uint64_t v18 = [a4 objectForKey:@"snapshot"];
  uint64_t v19 = [a4 objectForKey:@"cachedRow"];
  char v20 = (void *)v19;
  if (v18)
  {
    int v56 = (void *)v19;
    char v20 = (void *)v18;
  }
  else
  {
    int v56 = (void *)[a4 objectForKey:@"databaseRow"];
  }
  if (v18) {
    BOOL v21 = dword_1EB2706EC == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;
  int v55 = v22;
  uint64_t v23 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)a3);
  id v54 = (id)[v8 copy];
  uint64_t v24 = [a3 entity];
  uint64_t v53 = v24;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = [*(id *)(v24 + 104) keys];
    uint64_t v27 = *(void *)(v25 + 112);
  }
  else
  {
    uint64_t v26 = [0 keys];
    uint64_t v27 = 0;
  }
  uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  unint64_t v29 = *(void *)(v27 + 48);
  uint64_t v30 = *(void *)(v27 + 56);
  uint64_t v51 = v27;
  uint64_t v57 = v20;
  if (v29 < v30 + v29)
  {
    do
    {
      unint64_t v31 = (void *)MEMORY[0x18C127630]();
      uint64_t v32 = [v20 objectForKey:*(void *)(v26 + 8 * v29)];
      if (v32 == v28) {
        id v33 = 0;
      }
      else {
        id v33 = (id)v32;
      }
      uint64_t v34 = [v56 objectForKey:*(void *)(v26 + 8 * v29)];
      if (v34 == v28) {
        id v35 = 0;
      }
      else {
        id v35 = (id)v34;
      }
      if (v33 != v35)
      {
        uint64_t v36 = *(void **)(*(void *)(v53 + 96) + 24 + 8 * v29);
        if (([v36 _epsilonEquals:v35 rhs:v33 withFlags:1] & 1) == 0)
        {
          if ([v36 usesMergeableStorage])
          {
            [v35 merge:v33];
            id v35 = (id)[v35 copy];
          }
          [a3 setValue:v35 forKey:*(void *)(v26 + 8 * v29)];
          [v54 setValue:v35 atIndex:v29];
        }
      }
      ++v29;
      --v30;
      char v20 = v57;
    }
    while (v30);
  }
  unint64_t v37 = *(void *)(v51 + 96);
  uint64_t v38 = *(void *)(v51 + 104);
  if (v37 < v38 + v37)
  {
    do
    {
      uint64_t v39 = [v20 objectForKey:*(void *)(v26 + 8 * v37)];
      if (v39 == v28) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = (void *)v39;
      }
      if (v55) {
        uint64_t v40 = (void *)[v40 objectID];
      }
      uint64_t v41 = [v56 objectForKey:*(void *)(v26 + 8 * v37)];
      if (v41 == v28) {
        uint64_t v42 = 0;
      }
      else {
        uint64_t v42 = (void *)v41;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        uint64_t v42 = (void *)[v42 objectID];
      }
      if (v40 != v42 && ([v42 isEqual:v40] & 1) == 0)
      {
        if (v42) {
          id v43 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v52, v42, 0);
        }
        else {
          id v43 = 0;
        }
        [a3 setValue:v43 forKey:*(void *)(v26 + 8 * v37)];
        [v54 setValue:v43 atIndex:v37];
      }
      ++v37;
      --v38;
      char v20 = v57;
    }
    while (v38);
  }
  -[NSManagedObject _setOriginalSnapshot__:](a3, v54);
  if ([(NSKnownKeysDictionary *)v23 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v44 = [(NSKnownKeysDictionary *)v23 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v63 != v45) {
            objc_enumerationMutation(v23);
          }
          [a3 willChangeValueForKey:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        }
        uint64_t v44 = [(NSKnownKeysDictionary *)v23 countByEnumeratingWithState:&v62 objects:v76 count:16];
      }
      while (v44);
    }
    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v23, 0);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v47 = [(NSKnownKeysDictionary *)v23 countByEnumeratingWithState:&v58 objects:v75 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v59 != v48) {
            objc_enumerationMutation(v23);
          }
          [a3 didChangeValueForKey:*(void *)(*((void *)&v58 + 1) + 8 * j)];
        }
        uint64_t v47 = [(NSKnownKeysDictionary *)v23 countByEnumeratingWithState:&v58 objects:v75 count:16];
      }
      while (v47);
    }
  }
}

- (BOOL)resolveConflicts:(NSArray *)list error:(NSError *)error
{
  uint64_t v7 = -[NSArray filteredArrayUsingPredicate:](list, "filteredArrayUsingPredicate:", [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_10]);
  uint64_t v8 = -[NSArray filteredArrayUsingPredicate:](list, "filteredArrayUsingPredicate:", [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_246]);
  if ((![(NSArray *)v7 count]
     || (BOOL v9 = [(NSMergePolicy *)self resolveOptimisticLockingVersionConflicts:v7 error:error]))&& (![(NSArray *)v8 count]|| (BOOL v9 = [(NSMergePolicy *)self resolveConstraintConflicts:v8 error:error])))
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  unint64_t v6 = __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2;
  uint64_t v7 = &unk_1E544C8D0;
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  long long v10 = *(_OWORD *)(a1 + 32);
  if (objc_msgSend((id)v10, "concurrencyType", MEMORY[0x1E4F143A8], 3221225472)) {
    return [*(id *)(a1 + 32) performBlockAndWait:v5];
  }
  else {
    return v6((uint64_t)v5);
  }
}

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v4 setEntity:v3];
  [(NSFetchRequest *)v4 setIncludesSubentities:1];
  [(NSFetchRequest *)v4 setIncludesPendingChanges:0];
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v4, "setRelationshipKeyPathsForPrefetching:", -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 40)]);
  uint64_t v7 = 0;
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v4 error:&v7];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
  }

  return [v2 drain];
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(NSArray *)list error:(NSError *)error
{
  uint64_t v4 = list;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)list count]) {
    return 1;
  }
  if (!self->_type)
  {
    BOOL v23 = 0;
    goto LABEL_50;
  }
  id v34 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  obuint64_t j = v4;
  if (objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "objectForKey:", @"snapshot")) {
    goto LABEL_4;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = [(NSArray *)v4 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (!v25) {
    goto LABEL_4;
  }
  uint64_t v26 = 0;
  uint64_t v27 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v43 != v27) {
        objc_enumerationMutation(obj);
      }
      unint64_t v29 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      int v30 = objc_msgSend((id)objc_msgSend(v29, "objectForKey:", @"newVersion"), "unsignedIntValue");
      unint64_t v31 = (void *)[v29 objectForKey:@"object"];
      uint64_t v32 = v31;
      if (v26)
      {
        if (!v31) {
          continue;
        }
      }
      else
      {
        uint64_t v26 = [v31 managedObjectContext];
        if (!v32) {
          continue;
        }
      }
      if (!v30 || [v32 isDeleted]) {
        objc_msgSend(v6, "addObject:", objc_msgSend(v32, "objectID"));
      }
    }
    uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v54 count:16];
  }
  while (v25);
  uint64_t v4 = obj;
  if (v26)
  {
    id v33 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]((uint64_t)_PFRoutines, (uint64_t)v6);
    uint64_t v46 = 0;
    uint64_t v47 = (uint64_t)&v46;
    uint64_t v48 = 0x3052000000;
    uint64_t v49 = __Block_byref_object_copy__15;
    uint64_t v50 = __Block_byref_object_dispose__15;
    uint64_t v51 = 0;
    uint64_t v51 = [MEMORY[0x1E4F1CA48] array];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke;
    v41[3] = &unk_1E544BCD8;
    v41[4] = v26;
    v41[5] = &v46;
    [(__CFDictionary *)v33 enumerateKeysAndObjectsUsingBlock:v41];

    _Block_object_dispose(&v46, 8);
    uint64_t v4 = obj;
  }
LABEL_4:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v38;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(obj);
      }
      if (!self)
      {
        BOOL v23 = 0;
        goto LABEL_46;
      }
      long long v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"newVersion"), "unsignedIntValue");
      uint64_t v12 = [v10 objectForKey:@"object"];
      uint64_t v13 = [(id)v12 managedObjectContext];
      char v14 = (void *)v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        char v14 = *(void **)(v12 + 32);
        if (v14)
        {
          uint64_t v16 = (void *)[(id)v12 objectID];
          uint64_t v17 = [v14 objectRegisteredForID:v16];
          if (v17 == v12)
          {
            *(_DWORD *)(v12 + 16) &= ~0x80u;
          }
          else if (!v17)
          {
            -[NSManagedObjectContext _registerObject:withID:]((uint64_t)v14, v12, v16);
          }
        }
      }
      unint64_t type = self->_type;
      if (v11)
      {
        switch(type)
        {
          case 1uLL:
            [(NSMergePolicy *)self _mergeChangesStoreUpdatesTrumpForObject:v12 withRecord:v10];
            objc_msgSend((id)v12, "_setVersionReference__:", v11);
            break;
          case 2uLL:
            if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
            {
              [(NSMergePolicy *)self _mergeChangesObjectUpdatesTrumpForObject:v12 withRecord:v10];
              objc_msgSend((id)v12, "_setVersionReference__:", v11);
            }
            else
            {
              [v14 refreshObject:v12 mergeChanges:1];
            }
            break;
          case 3uLL:
            if (([(id)v12 hasChanges] & 1) == 0) {
              _PFFastMOCObjectWillChange((uint64_t)v14, (_DWORD *)v12);
            }
            objc_msgSend((id)v12, "_setVersionReference__:", v11);
            break;
          case 4uLL:
            [v14 refreshObject:v12 mergeChanges:0];
            char v20 = (void *)[(id)v12 objectID];
            BOOL v21 = (void *)[v20 persistentStore];
            if (@"NSXPCStore" == (__CFString *)[v21 type])
            {
              int v22 = (void *)[v21 _persistentStoreCoordinator];
              uint64_t v46 = MEMORY[0x1E4F143A8];
              uint64_t v47 = 3221225472;
              uint64_t v48 = (uint64_t)__33__NSMergePolicy_resolveConflict___block_invoke;
              uint64_t v49 = (void (*)(uint64_t, uint64_t))&unk_1E544BB28;
              uint64_t v50 = (void (*)(uint64_t))v14;
              uint64_t v51 = (uint64_t)v21;
              v52 = v20;
              [v22 performBlockAndWait:&v46];
            }
            break;
          default:
            break;
        }
      }
      else
      {
        if (type == 2 && z9dsptsiQ80etb9782fsrs98bfdle88 == 0) {
          unint64_t type = 3;
        }
        if (type - 1 < 2) {
          goto LABEL_31;
        }
        if (type == 3)
        {
          if (([(id)v12 isDeleted] & 1) == 0 && (objc_msgSend((id)v12, "isInserted") & 1) == 0) {
            [v14 _forceInsertionForObject:v12];
          }
          goto LABEL_43;
        }
        if (type == 4) {
LABEL_31:
        }
          [v14 deleteObject:v12];
      }
LABEL_43:
      [(id)v12 awakeFromSnapshotEvents:64];
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  BOOL v23 = 1;
LABEL_46:
  if (v34) {
    [v34 drain];
  }
LABEL_50:
  if (error && !v23)
  {
    BOOL v23 = 0;
    *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:133020 userInfo:0];
  }
  return v23;
}

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  unint64_t v6 = __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2;
  uint64_t v7 = &unk_1E544C8D0;
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  long long v10 = *(_OWORD *)(a1 + 32);
  if (objc_msgSend((id)v10, "concurrencyType", MEMORY[0x1E4F143A8], 3221225472)) {
    return [*(id *)(a1 + 32) performBlockAndWait:v5];
  }
  else {
    return v6((uint64_t)v5);
  }
}

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v4 setEntity:v3];
  [(NSFetchRequest *)v4 setIncludesSubentities:1];
  [(NSFetchRequest *)v4 setIncludesPendingChanges:0];
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v4, "setRelationshipKeyPathsForPrefetching:", -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", *(void *)(a1 + 40)]);
  uint64_t v7 = 0;
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v4 error:&v7];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
  }

  return [v2 drain];
}

+ (NSMergePolicy)errorMergePolicy
{
  return (NSMergePolicy *)NSErrorMergePolicy;
}

+ (NSMergePolicy)mergeByPropertyStoreTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyStoreTrumpMergePolicy;
}

+ (NSMergePolicy)overwriteMergePolicy
{
  return (NSMergePolicy *)NSOverwriteMergePolicy;
}

+ (NSMergePolicy)rollbackMergePolicy
{
  return (NSMergePolicy *)NSRollbackMergePolicy;
}

@end