@interface NSSQLSavePlan
- (id)_correlationTableUpdateTrackerForRelationship:(uint64_t)a1;
- (id)_newRowCacheRowForToManyUpdatesForRelationship:(void *)a3 rowCacheOriginal:(void *)a4 originalOrderKeys:(void *)a5 originalSnapshot:(char *)a6 value:(void *)a7 added:(void *)a8 deleted:(char *)a9 sourceRowPK:(void *)a10 properties:(void *)a11 sourceObject:(void *)a12 newIndexes:(void *)a13 reorderedIndexes:;
- (id)initForRequestContext:(id)a3;
- (id)newObjectsForExhaustiveLockConflictDetection;
- (id)newObjectsForUniquenessConflictDetectionGivenReportedFailures:(uint64_t)a1;
- (uint64_t)_addFileBackedFutureToDelete:(uint64_t)a1;
- (uint64_t)_createRowsForSave;
- (uint64_t)_registerChangedFOKs:(uint64_t)a3 deletions:(const void *)a4 forSourceObject:(void *)a5 andRelationship:;
- (uint64_t)newCorrelationTableUpdates;
- (uint64_t)newInsertedRows;
- (void)_computeUpdatedRowSplit;
- (void)_createCorrelationTrackerUpdatesForDeletedObject:(uint64_t)a1;
- (void)_findOrCreateChangeSnapshotForGlobalID:(uint64_t)a1;
- (void)_populateOrderKeysInOrderedSet:(uint64_t)a3 usingSourceObjectID:(void *)a4 inverseRelationship:(void *)a5 newIndexes:(void *)a6 reorderedIndexes:;
- (void)_populateRow:(unsigned char *)a3 fromObject:(int)a4 timestamp:(unsigned char *)a5 inserted:(double)a6 shouldAddToRowCache:;
- (void)_prepareForDeletionOfDatabaseExternalPropertiesForObject:(uint64_t)a1;
- (void)_recordToManyChangesForObject:(uint64_t)a3 inRow:(int)a4 usingTimestamp:(double)a5 inserted:;
- (void)dealloc;
- (void)newObjectsForFastLockConflictDetection;
@end

@implementation NSSQLSavePlan

- (void)_computeUpdatedRowSplit
{
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2) {
      v2 = (void *)[v2 persistentStoreRequest];
    }
    v3 = (void *)[v2 updatedObjects];
    if (v3)
    {
      v4 = v3;
      if ([v3 count])
      {
        v5 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v4);
        uint64_t v14 = 0;
        v15 = &v14;
        uint64_t v16 = 0x3052000000;
        v17 = __Block_byref_object_copy__49;
        v18 = __Block_byref_object_dispose__49;
        id v19 = 0;
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v8 = 0;
        v9 = &v8;
        uint64_t v10 = 0x3052000000;
        v11 = __Block_byref_object_copy__49;
        v12 = __Block_byref_object_dispose__49;
        id v13 = 0;
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v6 = (void *)a1[2];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke;
        v7[3] = &unk_1E544F470;
        v7[4] = a1;
        v7[5] = v5;
        v7[6] = &v14;
        v7[7] = &v8;
        [v6 enumerateKeysAndObjectsUsingBlock:v7];

        a1[6] = v15[5];
        a1[7] = v9[5];
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v14, 8);
      }
    }
  }
}

- (void)_populateRow:(unsigned char *)a3 fromObject:(int)a4 timestamp:(unsigned char *)a5 inserted:(double)a6 shouldAddToRowCache:
{
  uint64_t v8 = a3;
  uint64_t v10 = (void *)[a3 entity];
  v11 = v10;
  if (v10) {
    v143 = (void *)v10[13];
  }
  else {
    v143 = 0;
  }
  uint64_t v140 = _kvcPropertysPrimitiveGetters(v10);
  *a5 = 1;
  if ((v8[17] & 0x80) != 0) {
    [v8 willAccessValueForKey:0];
  }
  int v134 = a4;
  v141 = (void *)a2;
  v130 = v11;
  if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
    v12 = 0;
  }
  else {
    v12 = (void *)[*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  v132 = v12;
  v142 = (void *)[v12 foreignKeyColumns];
  uint64_t v13 = [v142 count];
  uint64_t v139 = (uint64_t)v8;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
    do
    {
      v17 = (void *)MEMORY[0x18C127630]();
      v18 = (void *)[v142 objectAtIndex:v15];
      id v19 = (void *)[v18 toOneRelationship];
      v20 = v19;
      if (v19 && *((unsigned char *)v19 + v16[282])) {
        goto LABEL_14;
      }
      v21 = v16;
      uint64_t v22 = [v19 name];
      unint64_t v23 = [v143 fastIndexForKnownKey:v22];
      if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
        v28 = (void *)[v8 primitiveValueForKey:v22];
      }
      else {
        _PF_Handler_Primitive_GetProperty((id **)v8, v23, v22, *(void *)(v140 + 8 * v23), v24, v25, v26, v27);
      }
      v29 = v28;
      uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "objectID"), "persistentStore");
      if (v30)
      {
        uint64_t v31 = a1[1];
        if (!v31 || v30 != *(void *)(v31 + 8))
        {
          id v129 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 133010, @"CoreData does not support persistent cross-store relationships", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, @"Source object", v29, @"Destination Object", objc_msgSend((id)objc_msgSend(v130, "propertiesByName"), "objectForKey:", v22), @"Relationship", 0));
          objc_exception_throw(v129);
        }
      }
      int isValidRelationshipDestination = -[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v29);
      BOOL v33 = !v29 || isValidRelationshipDestination == 0;
      uint64_t v34 = v33 ? 0 : objc_msgSend((id)objc_msgSend(v29, "objectID"), "_referenceData64");
      uint64_t v16 = v21;
      objc_msgSend(v141, "setForeignKeySlot:int64:", objc_msgSend(v18, "slot"), v34);
      if (!v20) {
        goto LABEL_14;
      }
      v35 = (void *)v20[9];
      if (v35)
      {
        if (v29
          && ((v37 = (void *)[v29 objectID], (uint64_t v38 = a1[1]) == 0)
            ? (uint64_t v39 = 0)
            : (uint64_t v39 = *(void *)(v38 + 8)),
              (uint64_t v40 = -[NSSQLCore entityForObjectID:](v39, v37)) != 0))
        {
          uint64_t v36 = *(unsigned int *)(v40 + 184);
        }
        else
        {
          uint64_t v36 = 0;
        }
        objc_msgSend(v141, "setForeignEntityKeySlot:entityKey:", objc_msgSend(v35, "slot"), v36);
        uint64_t v8 = (unsigned char *)v139;
      }
      v41 = (void *)v20[10];
      if (!v41) {
        goto LABEL_14;
      }
      if (v29)
      {
        v43 = (void *)v20[7];
        uint64_t v44 = [v29 entity];
        v45 = (void *)v44;
        if (v44) {
          v46 = *(void **)(v44 + 104);
        }
        else {
          v46 = 0;
        }
        v135 = v43;
        uint64_t v47 = [v43 name];
        uint64_t v48 = [v46 fastIndexForKnownKey:v47];
        if (v48 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v49 = (void *)[v29 primitiveValueForKey:v47];
        }
        else
        {
          unint64_t v50 = v48;
          uint64_t v51 = _kvcPropertysPrimitiveGetters(v45);
          _PF_Handler_Primitive_GetProperty((id **)v29, v50, v47, *(void *)(v51 + 8 * v50), v52, v53, v54, v55);
        }
        uint64_t v56 = (uint64_t)v49;
        uint64_t v8 = (unsigned char *)v139;
        if (v49)
        {
          uint64_t v42 = [v49 count];
          if (v42)
          {
            -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:]((uint64_t)a1, v56, [v29 objectID], v135, 0, 0);
            LODWORD(v42) = -[_NSFaultingMutableOrderedSet _orderKeyForObject:](v56, v139);
          }
        }
        else
        {
          LODWORD(v42) = 0;
        }
        uint64_t v16 = v21;
        if (v42)
        {
LABEL_52:
          if (v34) {
            uint64_t v57 = v42;
          }
          else {
            uint64_t v57 = 0;
          }
          uint64_t v58 = [v41 slot];
          uint64_t v59 = v57;
          uint64_t v8 = (unsigned char *)v139;
          [v141 setForeignOrderKeySlot:v58 orderKey:v59];
          goto LABEL_14;
        }
      }
      else
      {
        LODWORD(v42) = 0;
      }
      if (!v34) {
        goto LABEL_52;
      }
LABEL_14:
      ++v15;
    }
    while (v14 != v15);
  }
  v60 = (void *)[v132 attributeColumns];
  uint64_t v61 = [v60 count];
  uint64_t v62 = 0x20000;
  if (!_PF_INTERNAL_DATA_SIZE_THRESHOLD) {
    uint64_t v62 = 0;
  }
  unint64_t v136 = v62;
  if (v61)
  {
    uint64_t v63 = v61;
    uint64_t v64 = 0;
    v65 = (id *)v141[5];
    do
    {
      v66 = (void *)MEMORY[0x18C127630]();
      v67 = (_WORD *)[v60 objectAtIndex:v64];
      v68 = (void *)[v67 propertyDescription];
      if (v68 && [v68 superCompositeAttribute]) {
        v69 = -[NSPropertyDescription _rootName]((__CFString *)[v67 propertyDescription]);
      }
      else {
        v69 = (__CFString *)[v67 name];
      }
      uint64_t v70 = (uint64_t)v69;
      unint64_t v71 = [v143 fastIndexForKnownKey:v69];
      if (v71 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v76 = [v8 primitiveValueForKey:v70];
      }
      else {
        _PF_Handler_Primitive_GetProperty((id **)v8, v71, v70, *(void *)(v140 + 8 * v71), v72, v73, v74, v75);
      }
      v77 = (void *)v76;
      if (objc_msgSend((id)objc_msgSend(v67, "attributeDescription"), "attributeType") == 1000)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          *a5 = 0;
        }
      }
      unsigned int v78 = [v67 slot];
      unsigned int v85 = v78;
      if (v67 && (v67[16] & 8) != 0)
      {
        snapshot_get_value_as_object(v65, v78, v79, v80, v81, v82, v83, v84);
        [v8 setPrimitiveValue:v88 forKey:v70];
      }
      else if (v77)
      {
        Class Class = object_getClass(v65);
        int v87 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + v85);
        switch(v87)
        {
          case 'c':
            snapshot_set_int8(v65, v85, [v77 charValue]);
            break;
          case 'd':
            if ([v77 isNSNumber]) {
              [v77 doubleValue];
            }
            else {
              [v77 timeIntervalSinceReferenceDate];
            }
            snapshot_set_double((char *)v65, v85, v95);
            break;
          case 'e':
          case 'g':
          case 'h':
            goto LABEL_88;
          case 'f':
            [v77 floatValue];
            snapshot_set_float((char *)v65, v85, v96);
            break;
          case 'i':
            snapshot_set_int32((char *)v65, v85, [v77 intValue]);
            break;
          default:
            if (v87 != 113)
            {
              if (v87 == 115)
              {
                snapshot_set_int16((char *)v65, v85, [v77 shortValue]);
                break;
              }
LABEL_88:
              if ([v67 sqlType] != 16)
              {
LABEL_96:
                v94 = v77;
                goto LABEL_97;
              }
              Class v92 = object_getClass(v65);
              v93 = *(id *)((char *)v65 + *((unsigned int *)object_getIndexedIvars(v92) + v85 + 19));
              if ((([v67 isFileBackedFuture] & 1) != 0 || v77 == v93)
                && (![v67 isFileBackedFuture]
                 || [v77 isEqual:v93]))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v122 = v77;
                  goto LABEL_152;
                }
              }
              objc_opt_class();
              uint64_t v8 = (unsigned char *)v139;
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v77 _createdByUbiquityImport]) {
                goto LABEL_96;
              }
              v133 = v93;
              if (![v67 isFileBackedFuture])
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && [v77 isNSData]
                  && [v93 isEqualToData:v77])
                {
                  v77 = v93;
                }
                else
                {
                  uint64_t v102 = a1[1];
                  if (v102 && (uint64_t v103 = *(void *)(v102 + 8)) != 0 && (*(unsigned char *)(v103 + 201) & 0x40) != 0
                    || v136 >= [v77 length])
                  {
                    uint64_t v108 = 0;
                    uint64_t v113 = 0;
                  }
                  else
                  {
                    CFUUIDRef v104 = CFUUIDCreate(0);
                    CFStringRef v105 = CFUUIDCreateString(0, v104);
                    CFRelease(v104);
                    uint64_t v106 = a1[1];
                    if (v106) {
                      v107 = *(void **)(v106 + 152);
                    }
                    else {
                      v107 = 0;
                    }
                    uint64_t v108 = [v107 stringByAppendingPathComponent:v105];
                    uint64_t v8 = (unsigned char *)v139;
                    uint64_t v109 = a1[1];
                    if (v109) {
                      v110 = *(void **)(v109 + 160);
                    }
                    else {
                      v110 = 0;
                    }
                    uint64_t v111 = [v110 stringByAppendingPathComponent:v105];
                    CFStringRef v112 = v105;
                    uint64_t v113 = v111;
                    CFRelease(v112);
                  }
                  if (v133)
                  {
                    uint64_t v115 = objc_opt_class();
                    BOOL v33 = v115 == objc_opt_class();
                    uint64_t v8 = (unsigned char *)v139;
                    if (v33)
                    {
                      id v116 = (id)a1[13];
                      if (!v116)
                      {
                        id v116 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        a1[13] = v116;
                      }
                      [v116 addObject:v133];
                    }
                  }
                  v117 = [_PFExternalReferenceData alloc];
                  uint64_t v118 = a1[1];
                  if (v118 && (uint64_t v119 = *(void *)(v118 + 8)) != 0) {
                    uint64_t v120 = (*(_DWORD *)(v119 + 200) >> 2) & 7;
                  }
                  else {
                    uint64_t v120 = 0;
                  }
                  v77 = [(_PFExternalReferenceData *)v117 initForExternalLocation:v108 safeguardLocation:v113 data:v77 protectionLevel:v120];
                  id v121 = (id)a1[12];
                  if (!v121)
                  {
                    id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    a1[12] = v121;
                  }
                  [v121 addObject:v77];
                }
                goto LABEL_97;
              }
              uint64_t v98 = a1[1];
              if (v98) {
                v99 = *(void **)(v98 + 168);
              }
              else {
                v99 = 0;
              }
              id Property = objc_getProperty(v77, v97, 16, 1);
              if (v133) {
                BOOL v101 = [v133 fileURL] != 0;
              }
              else {
                BOOL v101 = 0;
              }
              BOOL v131 = v101;
              if ([v77 _isCloudKitSupportOriginated])
              {
                if (Property) {
                  BOOL v123 = 0;
                }
                else {
                  BOOL v123 = v101;
                }
                if (v123
                  && objc_msgSend((id)objc_msgSend(v77, "UUID"), "isEqual:", objc_msgSend(v133, "UUID")))
                {
LABEL_151:
                  v77 = v133;
LABEL_152:
                  uint64_t v8 = (unsigned char *)v139;
LABEL_97:
                  snapshot_set_object((char *)v65, v85, (uint64_t)v77);
                  break;
                }
                id v127 = (id)a1[14];
                if (!v127)
                {
                  id v127 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  a1[14] = v127;
                }
                [v127 addObject:v77];
                uint64_t v128 = objc_msgSend(v99, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v77, "UUID"), "UUIDString"));
                v77 = -[_NSDataFileBackedFuture initWithURL:UUID:size:]([_NSDataFileBackedFuture alloc], (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v128 isDirectory:0], objc_msgSend(v77, "UUID"), objc_msgSend(v77, "fileSize"));
                uint64_t v8 = (unsigned char *)v139;
                uint64_t v126 = (uint64_t)v133;
                if (!v131) {
                  goto LABEL_97;
                }
              }
              else
              {
                if (![v77 fileURL]
                  && objc_msgSend((id)objc_msgSend(v77, "UUID"), "isEqual:", objc_msgSend(v133, "UUID")))
                {
                  goto LABEL_151;
                }
                v124 = [_NSDataFileBackedFuture alloc];
                v77 = -[_NSDataFileBackedFuture initWithDirectoryURL:UUID:originalURL:](v124, (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v99 isDirectory:1], objc_msgSend(v77, "UUID"), Property);
                id v125 = (id)a1[14];
                if (!v125)
                {
                  id v125 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  a1[14] = v125;
                }
                [v125 addObject:v77];
                uint64_t v8 = (unsigned char *)v139;
                uint64_t v126 = (uint64_t)v133;
                if (!v131) {
                  goto LABEL_97;
                }
              }
              -[NSSQLSavePlan _addFileBackedFutureToDelete:]((uint64_t)a1, v126);
              goto LABEL_97;
            }
            snapshot_set_int64((char *)v65, v85, [v77 longLongValue]);
            break;
        }
      }
      else if (((*((unsigned __int8 *)v65 + ((unint64_t)v78 >> 3) + 28) >> (v78 & 7)) & 1) == 0)
      {
        if ([v67 sqlType] == 16)
        {
          Class v89 = object_getClass(v65);
          uint64_t v90 = *(uint64_t *)((char *)v65 + *((unsigned int *)object_getIndexedIvars(v89) + v85 + 19));
          uint64_t v91 = objc_opt_class();
          BOOL v33 = v91 == objc_opt_class();
          uint64_t v8 = (unsigned char *)v139;
          if (v33)
          {
            if ([v67 isFileBackedFuture])
            {
              -[NSSQLSavePlan _addFileBackedFutureToDelete:]((uint64_t)a1, v90);
            }
            else
            {
              id v114 = (id)a1[13];
              if (!v114)
              {
                id v114 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                a1[13] = v114;
              }
              [v114 addObject:v90];
            }
          }
        }
        snapshot_set_null((char *)v65, v85);
      }
      ++v64;
    }
    while (v63 != v64);
  }

  -[NSSQLSavePlan _recordToManyChangesForObject:inRow:usingTimestamp:inserted:]((uint64_t)a1, (uint64_t)v8, (uint64_t)v141, v134, a6);
}

- (void)_recordToManyChangesForObject:(uint64_t)a3 inRow:(int)a4 usingTimestamp:(double)a5 inserted:
{
  int v165 = a4;
  uint64_t v176 = a1;
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  uint64_t v153 = [(id)a2 managedObjectContext];
  v167 = (void *)[(id)a2 entity];
  if (v167)
  {
    uint64_t v164 = [(id)v167[13] keys];
    uint64_t v8 = v167;
    v166 = (void *)v167[14];
  }
  else
  {
    uint64_t v164 = [0 keys];
    uint64_t v8 = 0;
    v166 = 0;
  }
  uint64_t v163 = _kvcPropertysPrimitiveGetters(v8);
  if ((*(unsigned char *)(a2 + 17) & 0x80) != 0) {
    [(id)a2 willAccessValueForKey:0];
  }
  v155 = (void *)[(id)a3 objectID];
  if (a3
    && (*(unsigned char *)(a3 + 16) & 1) == 0
    && (uint64_t v9 = [*(id *)(*(void *)(a3 + 40) + 16) _storeInfo1]) != 0)
  {
    int v150 = 0;
    uint64_t v149 = v9;
    v157 = *(void **)(v9 + 40);
  }
  else
  {
    uint64_t v149 = 0;
    v157 = 0;
    int v150 = 1;
  }
  v159 = (void *)a3;
  uint64_t v10 = *(void *)(a2 + 48);
  if (v10) {
    v11 = *(void **)(v10 + 8);
  }
  else {
    v11 = 0;
  }
  uint64_t v156 = [v11 values];
  if (v156)
  {
    v158 = (void *)[MEMORY[0x1E4F1CA98] null];
    v172 = v159 ? (char *)[*(id *)(v159[5] + 16) _referenceData64] : 0;
    unint64_t v12 = v166[18];
    unint64_t v13 = v166[19] + v12;
    unint64_t v178 = v12;
    unint64_t v162 = v13;
    if (v12 < v13)
    {
      int v14 = v165;
      if (!v159) {
        int v14 = 0;
      }
      int v154 = v14;
      uint64_t v15 = *MEMORY[0x1E4F1C3B8];
      uint64_t v147 = *MEMORY[0x1E4F28A50];
      uint64_t v148 = v15;
      while (1)
      {
        v170 = (void *)MEMORY[0x18C127630]();
        v173 = *(void ***)(v164 + 8 * v178);
        id v174 = -[NSEntityDescription _relationshipNamed:](v167, (uint64_t)v173);
        unint64_t v20 = v166[16];
        BOOL v22 = v178 >= v20;
        unint64_t v21 = v178 - v20;
        BOOL v22 = !v22 || v21 >= v166[17];
        int v23 = !v22;
        LODWORD(v175) = v23;
        _PF_Handler_Primitive_GetProperty((id **)a2, v178, (uint64_t)v173, *(void *)(v163 + 8 * v178), v16, v17, v18, v19);
        uint64_t v25 = v24;
        if (v165)
        {
          uint64_t v26 = &NSOrderedSet_EmptyOrderedSet;
          if (!v175) {
            uint64_t v26 = &NSSet_EmptySet;
          }
          uint64_t v27 = (void *)*v26;
        }
        else
        {
          uint64_t v27 = *(void **)(v156 + 8 * v178);
        }
        v171 = v27;
        if (v24 == v27 || ([v24 isFault] & 1) != 0) {
          goto LABEL_214;
        }
        if (v158 != v25 && [v25 count]) {
          break;
        }
        id v30 = (id)NSSet_EmptySet;
        if (v158 == v171 || ![v171 count]) {
          goto LABEL_49;
        }
        unint64_t v31 = [v171 count];
        unint64_t v32 = MEMORY[0x1F4188790](v31);
        v35 = (char *)&v147 - v34;
        if (v32 > 0x200) {
          v35 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v147 - v34, 8 * v33);
        }
        [v171 getObjects:v35];
        id v168 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v35 count:v31];
        if (v31 >= 0x201) {
          NSZoneFree(0, v35);
        }
LABEL_53:
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        uint64_t v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v181, v190, 16, v147);
        if (v39)
        {
          uint64_t v40 = *(void *)v182;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v182 != v40) {
                objc_enumerationMutation(v30);
              }
              uint64_t v42 = *(void **)(*((void *)&v181 + 1) + 8 * i);
              uint64_t v43 = objc_msgSend((id)objc_msgSend(v42, "objectID"), "persistentStore");
              if (v43 != objc_msgSend((id)objc_msgSend((id)a2, "objectID"), "persistentStore"))
              {
                v132 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a2, @"Source object", v42, @"Destination Object", v174, @"Relationship", 0);
                id v133 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 133010, @"CoreData does not support persistent cross-store relationships", v132);

                objc_exception_throw(v133);
              }
            }
            uint64_t v39 = [v30 countByEnumeratingWithState:&v181 objects:v190 count:16];
          }
          while (v39);
        }
        if ([v30 count]) {
          goto LABEL_85;
        }
        uint64_t v44 = [v168 count];
        if (v44) {
          int v45 = 0;
        }
        else {
          int v45 = (int)v175;
        }
        if (v45 == 1)
        {
          if (!v25 || !v25[4])
          {
            [v171 count];
            id v46 = 0;
LABEL_84:

LABEL_85:
            if (!v154 || *(_DWORD *)(v159[5] + 12) != 1)
            {
              uint64_t v55 = [NSSQLRelationshipFaultRequestContext alloc];
              uint64_t v56 = *(void *)(v176 + 8);
              if (v56) {
                uint64_t v57 = *(void *)(v56 + 8);
              }
              else {
                uint64_t v57 = 0;
              }
              uint64_t v58 = [(NSSQLRelationshipFaultRequestContext *)v55 initWithObjectID:v155 relationship:v174 context:v153 sqlCore:v57];
              -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v58, 0);
              uint64_t v59 = *(void *)(v176 + 8);
              if (v59) {
                uint64_t v60 = *(void *)(v59 + 8);
              }
              else {
                uint64_t v60 = 0;
              }
              -[NSSQLCore dispatchRequest:withRetries:](v60, (void *)v58, 0);
              uint64_t v61 = (void *)[(id)v58 result];
              id v62 = v61;
              if (v58)
              {
                uint64_t v63 = *(void **)(v58 + 40);
                if (v63)
                {
                  id v125 = v63;
                  uint64_t v126 = [v125 code];
                  uint64_t v127 = [v125 description];
                  v188[0] = [v125 domain];
                  id v177 = (id)NSNumber;
                  uint64_t v128 = [v125 code];
                  uint64_t v129 = [v177 numberWithLong:v128];
                  v188[1] = v147;
                  v189[0] = v129;
                  v189[1] = v125;
                  v130 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v189 forKeys:v188 count:2];
                  id v131 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v148, v126, v127, v130);
                  objc_exception_throw(v131);
                }
              }

              if ([v61 count]) {
                id v160 = (id)[v61 firstObject];
              }
              else {
                id v160 = 0;
              }
              if (v175) {
                id v161 = (id)[v61 lastObject];
              }
              else {
                id v161 = 0;
              }

              if (!v160)
              {
                if (+[NSSQLCore debugDefault] < 2)
                {
                  if (+[NSSQLCore debugDefault] >= 1) {
                    _NSCoreDataLog(4, @"Optimistic locking failure for %@.  Original row was missing while recording to-many changes.", v140, v141, v142, v143, v144, v145, (uint64_t)v155);
                  }
                }
                else
                {
                  _NSCoreDataLog(4, @"Optimistic locking failure for %@.  Original row was missing while recording to-many changes.  New row = %@", v134, v135, v136, v137, v138, v139, (uint64_t)v155);
                }
                v185 = v155;
                v186 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
                uint64_t v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
                uint64_t v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
                objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:v148 reason:@"optimistic locking failure" userInfo:v146]);
              }
              v179 = 0;
              v180 = 0;
              id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, v161, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
              if (!v175) {
                goto LABEL_111;
              }
LABEL_103:
              uint64_t v64 = [v169 count];
              if (v64)
              {
                id v177 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                for (uint64_t j = 0; j != v64; ++j)
                {
                  uint64_t v66 = [NSNumber numberWithUnsignedInteger:v180[j]];
                  [v177 addObject:v66];
                }
                -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
                if (!v175) {
                  goto LABEL_112;
                }
              }
              else
              {
                id v177 = (id)NSArray_EmptyArray;
                -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
              }
              -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](v159, v177, v174);
              goto LABEL_112;
            }
            id v160 = (id)NSArray_EmptyArray;
            if (v175)
            {
              id v161 = (id)NSArray_EmptyArray;
              v179 = 0;
              v180 = 0;
              id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, v161, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
              goto LABEL_103;
            }
            v179 = 0;
            v180 = 0;
            id v169 = -[NSSQLSavePlan _newRowCacheRowForToManyUpdatesForRelationship:rowCacheOriginal:originalOrderKeys:originalSnapshot:value:added:deleted:sourceRowPK:properties:sourceObject:newIndexes:reorderedIndexes:](v176, v174, v160, 0, v171, (char *)v25, v30, v168, v172, v157, (void *)a2, (void **)&v180, (void **)&v179);
            id v161 = 0;
LABEL_111:
            -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
            id v177 = 0;
LABEL_112:
            v173 = (void **)[v157 objectForKey:v173];
            uint64_t v67 = [v174 inverseRelationship];
            v68 = v173;
            if (!v67)
            {
              if (v173) {
                v69 = v173[7];
              }
              else {
                v69 = 0;
              }
              uint64_t v70 = objc_msgSend((id)objc_msgSend(v69, "foreignKey"), "slot");
              if (v69 && (unint64_t v71 = (void *)v69[10]) != 0) {
                uint64_t v72 = [v71 slot];
              }
              else {
                uint64_t v72 = 0;
              }
              uint64_t v73 = [v30 count];
              unint64_t v74 = [v169 count];
              v151 = &v147;
              MEMORY[0x1F4188790](v74);
              v77 = (char *)&v147 - v76;
              unint64_t v152 = v78;
              if (v78 > 0x200) {
                v77 = (char *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)&v147 - v76, 8 * v75);
              }
              if (v175)
              {
                uint64_t v79 = [v169 getObjects:v77];
                if (v74)
                {
                  for (uint64_t k = 0; k != v74; ++k)
                  {
                    uint64_t v81 = (void *)MEMORY[0x18C127630](v79);
                    if (v179[k])
                    {
                      uint64_t v82 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, *(void **)&v77[8 * k]);
                      [v82 setForeignKeySlot:v70 int64:v172];
                      [v82 setForeignOrderKeySlot:v72 orderKey:v180[k]];
                    }
                  }
                }
              }
              else
              {
                uint64_t v83 = [v30 getObjects:v77];
                if (v73)
                {
                  uint64_t v84 = (id *)v77;
                  do
                  {
                    unsigned int v85 = (void *)MEMORY[0x18C127630](v83);
                    v86 = (void *)[*v84 objectID];
                    int v87 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v86);
                    [v87 setForeignKeySlot:v70 int64:v172];
                    ++v84;
                    --v73;
                  }
                  while (v73);
                }
              }
              if (v152 >= 0x201) {
                NSZoneFree(0, v77);
              }
              unint64_t v88 = [v168 count];
              unint64_t v89 = v88;
              if (v88 <= v74) {
                unint64_t v90 = v74;
              }
              else {
                unint64_t v90 = v88;
              }
              MEMORY[0x1F4188790](v88);
              v93 = (id *)((char *)&v147 - v92);
              if (v90 > 0x200) {
                v93 = (id *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)&v147 - v92, 8 * v91);
              }
              if ((v175 & 1) == 0)
              {
                uint64_t v94 = [v168 getObjects:v93];
                if (v89)
                {
                  double v95 = v93;
                  do
                  {
                    float v96 = (void *)MEMORY[0x18C127630](v94);
                    v97 = (void *)[*v95 objectID];
                    objc_msgSend(-[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v176, v97), "setForeignKeySlot:int64:", v70, 0);
                    ++v95;
                    --v89;
                  }
                  while (v89);
                }
              }
              if (v90 >= 0x201) {
                NSZoneFree(0, v93);
              }
              v68 = v173;
            }
            if (v68 && *((unsigned char *)v68 + 24) == 9 && (v68[8] ? (int v98 = 1) : (int v98 = (int)v175), v98 == 1))
            {
              if (*(unsigned char *)(v176 + 148)) {
                id v99 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              else {
                id v99 = 0;
              }
              uint64_t v106 = [v30 count];
              if (v106)
              {
                v171 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v30);
                CFUUIDRef v104 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2 * v106];
              }
              else
              {
                v171 = 0;
                CFUUIDRef v104 = 0;
              }
              if (v175)
              {
                id v175 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                id v107 = objc_alloc(MEMORY[0x1E4F1CA80]);
                uint64_t v108 = (void *)[v107 initWithArray:v171];
                uint64_t v109 = [v169 count];
                if (v109)
                {
                  for (uint64_t m = 0; v109 != m; ++m)
                  {
                    uint64_t v111 = [v169 objectAtIndex:m];
                    if (v173[8])
                    {
                      if ([v108 containsObject:v111])
                      {
                        BOOL v112 = v99 == 0;
                        [v104 addObject:v111];
                        objc_msgSend(v104, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        goto LABEL_184;
                      }
                      if (v179[m])
                      {
LABEL_183:
                        BOOL v112 = v99 == 0;
                        [v175 addObject:v111];
                        uint64_t v113 = [v177 objectAtIndex:m];
                        [v175 addObject:v113];
LABEL_184:
                        if (!v112)
                        {
                          [v99 addObject:v111];
                          objc_msgSend(v99, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        }
                      }
                    }
                    else if (v179[m])
                    {
                      goto LABEL_183;
                    }
                  }
                }
              }
              else
              {
                id v175 = 0;
                uint64_t v108 = v104;
                CFUUIDRef v104 = v171;
                v171 = 0;
              }

              if (v173[8])
              {
                id v114 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
                id v115 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173);
                -[NSSQLCorrelationTableUpdateTracker trackInserts:deletes:reorders:forObjectWithID:]((uint64_t)v115, v104, v114, v175, (uint64_t)v155);
                if (v99)
                {
                  id v116 = v114;

                  goto LABEL_194;
                }

LABEL_203:
                id v116 = 0;
              }
              else
              {
                id v117 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173[7]);
                -[NSSQLCorrelationTableUpdateTracker trackReorders:forObjectWithID:]((uint64_t)v117, v175, (uint64_t)v155);
                if (!v99) {
                  goto LABEL_203;
                }
                id v116 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
LABEL_194:
                if ([v99 count]) {
                  uint64_t v118 = (uint64_t)v99;
                }
                else {
                  uint64_t v118 = 0;
                }
                if ([v116 count]) {
                  uint64_t v119 = (uint64_t)v116;
                }
                else {
                  uint64_t v119 = 0;
                }
                -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](v176, v118, v119, v155, v174);
              }

LABEL_205:
            }
            else if ([v68 isToMany])
            {
              if ((*(unsigned char *)(v176 + 148) & 1) != 0 && v168 && [v168 count])
              {
                v100 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v168);
                -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](v176, 0, (uint64_t)v100, v155, v174);
              }
              uint64_t v101 = *(void *)(v176 + 8);
              if (v101)
              {
                if (*(unsigned char *)(v101 + 82)
                  && (!v175
                   || [v30 count]
                   || [v168 count]
                   || [v171 count]))
                {
                  id v102 = [NSString alloc];
                  if (v150) {
                    uint64_t v103 = 0;
                  }
                  else {
                    uint64_t v103 = *(unsigned int *)(v149 + 184);
                  }
                  CFUUIDRef v104 = objc_msgSend(v102, "initWithFormat:", @"%u-%lld", v103, objc_msgSend(v155, "_referenceData64"));
                  CFStringRef v105 = (void *)[*(id *)(v176 + 128) objectForKey:v104];
                  if (v105)
                  {
                    objc_msgSend(v105, "addObject:", objc_msgSend(v174, "name"));
                  }
                  else
                  {
                    id v120 = objc_alloc(MEMORY[0x1E4F1CA80]);
                    id v121 = objc_msgSend(v120, "initWithObjects:", objc_msgSend(v174, "name"), 0);
                    [*(id *)(v176 + 128) setObject:v121 forKey:v104];
                  }
                  goto LABEL_205;
                }
              }
            }
            v122 = v179;
            if (v179)
            {
              BOOL v123 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone)
              {
                BOOL v123 = malloc_default_zone();
                v122 = v179;
              }
              malloc_zone_free(v123, v122);
              v124 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
              if (!_PF_Private_Malloc_Zone) {
                v124 = malloc_default_zone();
              }
              malloc_zone_free(v124, v180);
            }

            uint64_t v54 = v160;
            goto LABEL_213;
          }
          id v46 = -[_NSFaultingMutableOrderedSet _newOrderKeys]((uint64_t)v25);
          uint64_t v47 = (os_unfair_lock_s *)[*(id *)(v176 + 8) rowCache];
          uint64_t v48 = -[NSPersistentStoreCache ancillaryOrderKeysForSourceObjectID:forProperty:afterTimestamp:](v47, v155, v174, *(double *)&NSSQLDistantPastTimeInterval);
          uint64_t v49 = [v171 count];
          if (!v48) {
            goto LABEL_84;
          }
          uint64_t v50 = v49;
          uint64_t v51 = [v46 count];
          if (v51 != [(os_unfair_lock_s *)v48 count] || v50 != [(os_unfair_lock_s *)v48 count]) {
            goto LABEL_84;
          }
          if (v50)
          {
            uint64_t v52 = 0;
            do
            {
              uint64_t v53 = [v171 objectAtIndex:v52];
              if (v53 != [v25 objectAtIndex:v52]
                || (objc_msgSend((id)objc_msgSend(v46, "objectAtIndex:", v52), "isEqual:", -[os_unfair_lock_s objectAtIndex:](v48, "objectAtIndex:", v52)) & 1) == 0)
              {
                goto LABEL_84;
              }
            }
            while (v50 != ++v52);
          }
        }
        else if (v44)
        {
          goto LABEL_85;
        }
        if (v154 && *(_DWORD *)(v159[5] + 12) == 1)
        {
          -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, (void *)NSArray_EmptyArray, v174, a5);
          if (v175) {
            -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](v159, (void *)NSArray_EmptyArray, v174);
          }
        }
        id v177 = 0;
        uint64_t v54 = 0;
        id v161 = 0;
LABEL_213:

LABEL_214:
        if (++v178 == v162) {
          return;
        }
      }
      unint64_t v28 = [v25 count];
      uint64_t v29 = (uint64_t)v171;
      if (v158 != v171)
      {
        uint64_t v29 = [v171 count];
        if (v29)
        {
          id v168 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v171, v25);
          id v30 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v25, v171);
          goto LABEL_53;
        }
      }
      MEMORY[0x1F4188790](v29);
      uint64_t v38 = (char *)&v147 - v37;
      if (v28 > 0x200) {
        uint64_t v38 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v147 - v37, 8 * v36);
      }
      [v25 getObjects:v38];
      id v30 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v38 count:v28];
      if (v28 >= 0x201) {
        NSZoneFree(0, v38);
      }
LABEL_49:
      id v168 = (id)NSSet_EmptySet;
      goto LABEL_53;
    }
  }
}

- (id)_correlationTableUpdateTrackerForRelationship:(uint64_t)a1
{
  v4 = (const void *)[a2 correlationTableName];
  id Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v4);
  if (!Value)
  {
    id Value = [[NSSQLCorrelationTableUpdateTracker alloc] initForRelationship:a2];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, Value);
  }
  return Value;
}

- (id)initForRequestContext:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NSSQLSavePlan;
  v4 = [(NSSQLSavePlan *)&v21 init];
  v5 = v4;
  if (v4)
  {
    v4->_requestContext = (NSSQLSaveChangesRequestContext *)a3;
    if (a3)
    {
      uint64_t v6 = *((void *)a3 + 1);
      if (v6) {
        LODWORD(v6) = (*(_DWORD *)(v6 + 200) >> 5) & 1;
      }
    }
    else
    {
      LODWORD(v6) = 0;
    }
    v4->_flags = (_sqlSaveFlags)(*(_DWORD *)&v4->_flags & 0xFFFFFFFE | v6);
    CFIndex v7 = *MEMORY[0x1E4F1D530];
    keyCallBacks.retain = 0;
    keyCallBacks.release = 0;
    keyCallBacks.version = v7;
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
    valueCallBacks.version = *MEMORY[0x1E4F1D540];
    *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
    valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D540] + 24);
    valueCallBacks.equal = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v4->_changeCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, &valueCallBacks);
    requestContext = v5->_requestContext;
    if (requestContext) {
      requestContext = [(NSSQLStoreRequestContext *)requestContext persistentStoreRequest];
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](requestContext, "insertedObjects"), "count");
    uint64_t v10 = v5->_requestContext;
    if (v10) {
      uint64_t v10 = [(NSSQLStoreRequestContext *)v10 persistentStoreRequest];
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v10, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_insertCache = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    v11 = v5->_requestContext;
    if (v11) {
      v11 = [(NSSQLStoreRequestContext *)v11 persistentStoreRequest];
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v11, "insertedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyCache = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    unint64_t v12 = v5->_requestContext;
    if (v12) {
      unint64_t v12 = [(NSSQLStoreRequestContext *)v12 persistentStoreRequest];
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v12, "insertedObjects"), "count");
    unint64_t v13 = v5->_requestContext;
    if (v13) {
      unint64_t v13 = [(NSSQLStoreRequestContext *)v13 persistentStoreRequest];
    }
    objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v13, "updatedObjects"), "count");
    _CFDictionarySetCapacity();
    v5->_toManyRelationshipChanges = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_rowsToDelete = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*(unsigned char *)&v5->_flags)
    {
      v5->_updatedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
      v5->_deletedFOKRowsInCurrentSave = CFDictionaryCreateMutable(v8, 0, &keyCallBacks, &valueCallBacks);
    }
    v5->_rowsToAddToRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5->_objectIDsToRemoveFromRowCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (a3) {
      uint64_t v14 = *((void *)a3 + 1);
    }
    else {
      uint64_t v14 = 0;
    }
    v5->_usedIndexes = (NSMutableDictionary *)-[NSSQLCore harvestIndexStatisticsFromConnections](v14);
    uint64_t v15 = v5->_requestContext;
    if (v15) {
      uint64_t v15 = [(NSSQLStoreRequestContext *)v15 persistentStoreRequest];
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext insertedObjects](v15, "insertedObjects"), "count")) {
      goto LABEL_29;
    }
    uint64_t v16 = v5->_requestContext;
    if (v16) {
      uint64_t v16 = [(NSSQLStoreRequestContext *)v16 persistentStoreRequest];
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext updatedObjects](v16, "updatedObjects"), "count")) {
      goto LABEL_29;
    }
    uint64_t v17 = v5->_requestContext;
    if (v17) {
      uint64_t v17 = [(NSSQLStoreRequestContext *)v17 persistentStoreRequest];
    }
    if (objc_msgSend((id)-[NSSQLSaveChangesRequestContext deletedObjects](v17, "deletedObjects"), "count")
      || [(NSMutableDictionary *)v5->_usedIndexes count])
    {
LABEL_29:
      *(_DWORD *)&v5->_flags |= 2u;
    }
  }
  return v5;
}

const void *__40__NSSQLSavePlan__computeUpdatedRowSplit__block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), a2);
  if (!result)
  {
    if ([*(id *)(a1 + 40) containsObject:a2]) {
      uint64_t v7 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v7 = *(void *)(a1 + 56);
    }
    CFAllocatorRef v8 = *(void **)(*(void *)(v7 + 8) + 40);
    return (const void *)[v8 addObject:a3];
  }
  return result;
}

- (uint64_t)newInsertedRows
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = *(void **)(a1 + 24);
  unint64_t v2 = [v1 count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 > 0x200) {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  }
  [v1 getObjects:v6 andKeys:0 count:v3];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v6 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return v7;
}

- (uint64_t)newCorrelationTableUpdates
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = *(void **)(a1 + 32);
  unint64_t v2 = [v1 count];
  unint64_t v3 = v2;
  if (v2 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v2;
  }
  if (v2 >= 0x201) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 > 0x200) {
    uint64_t v6 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
  }
  [v1 getObjects:v6 andKeys:0 count:v3];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v6 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0, v6);
  }
  return v7;
}

- (uint64_t)_createRowsForSave
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void **)(result + 8);
    if (v2) {
      unint64_t v2 = (void *)[v2 persistentStoreRequest];
    }
    unint64_t v3 = (void *)[v2 insertedObjects];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v65;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v65 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v64 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x18C127630]();
          v11 = (const void *)[v9 objectID];
          unint64_t v12 = (void *)[v9 entity];
          if (v12)
          {
            uint64_t v14 = *(void *)(v1 + 8);
            if (v14) {
              uint64_t v15 = *(void **)(v14 + 8);
            }
            else {
              uint64_t v15 = 0;
            }
            unint64_t v13 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v15, v12);
          }
          else
          {
            unint64_t v13 = 0;
          }
          uint64_t v16 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(v1 + 8), v11);
          uint64_t v17 = objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v13), "initWithSQLEntity:objectID:", v13, v11);
          uint64_t v18 = v17;
          if (v16) {
            uint64_t v19 = *(unsigned int *)(*(void *)&v16[10]._os_unfair_lock_opaque + 12) + 1;
          }
          else {
            uint64_t v19 = 1;
          }
          [v17 setOptLock:v19];
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 16), v11, v18);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v1 + 24), v11, v18);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v20 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
        uint64_t v6 = v20;
      }
      while (v20);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v21 = [v3 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v3);
          }
          uint64_t v24 = *(unsigned char **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v25 = (void *)MEMORY[0x18C127630]();
          id Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), (const void *)[v24 objectID]);
          char v59 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]((void *)v1, (uint64_t)Value, v24, 1, &v59, v5);
          if (v59) {
            [*(id *)(v1 + 64) addObject:Value];
          }
          else {
            objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(Value, "objectID"));
          }
        }
        uint64_t v21 = [v3 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v21);
    }
    uint64_t v27 = *(void **)(v1 + 8);
    if (v27) {
      uint64_t v27 = (void *)[v27 persistentStoreRequest];
    }
    unint64_t v28 = (void *)[v27 updatedObjects];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v28);
          }
          unint64_t v32 = *(unsigned char **)(*((void *)&v55 + 1) + 8 * j);
          uint64_t v33 = (void *)MEMORY[0x18C127630]();
          uint64_t v34 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, (void *)[v32 objectID]);
          char v59 = 1;
          -[NSSQLSavePlan _populateRow:fromObject:timestamp:inserted:shouldAddToRowCache:]((void *)v1, (uint64_t)v34, v32, 0, &v59, v5);
          if (v59) {
            [*(id *)(v1 + 64) addObject:v34];
          }
          else {
            objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(v34, "objectID"));
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v29);
    }
    v35 = *(void **)(v1 + 8);
    if (v35) {
      v35 = (void *)[v35 persistentStoreRequest];
    }
    uint64_t v36 = (void *)[v35 deletedObjects];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    result = [v36 countByEnumeratingWithState:&v51 objects:v68 count:16];
    uint64_t v37 = result;
    if (result)
    {
      uint64_t v38 = *(void *)v52;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v40 = *(void **)(*((void *)&v51 + 1) + 8 * v39);
          v41 = (void *)MEMORY[0x18C127630]();
          uint64_t v42 = (void *)[v40 objectID];
          uint64_t v43 = (void *)[v40 entity];
          if (v43)
          {
            uint64_t v44 = *(void *)(v1 + 8);
            int v45 = v44 ? *(void **)(v44 + 8) : 0;
            uint64_t v46 = _sqlCoreLookupSQLEntityForEntityDescription(v45, v43);
            uint64_t v47 = v46;
            if (v46)
            {
              int v48 = *(_DWORD *)(v46 + 280);
              if (v48)
              {
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v40);
                int v48 = *(_DWORD *)(v47 + 280);
              }
              if ((v48 & 2) != 0) {
                -[NSSQLSavePlan _prepareForDeletionOfDatabaseExternalPropertiesForObject:](v1, v40);
              }
            }
          }
          -[NSSQLSavePlan _createCorrelationTrackerUpdatesForDeletedObject:](v1, v40);
          uint64_t v49 = -[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](v1, v42);
          id v50 = v49;
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v1 + 16), v42);
          if (v49) {
            [*(id *)(v1 + 40) addObject:v49];
          }

          ++v39;
        }
        while (v37 != v39);
        result = [v36 countByEnumeratingWithState:&v51 objects:v68 count:16];
        uint64_t v37 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_findOrCreateChangeSnapshotForGlobalID:(uint64_t)a1
{
  id Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (!Value)
  {
    double v5 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), a2);
    if (!v5)
    {
      uint64_t v6 = (id *)-[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(void *)(a1 + 8), (uint64_t)a2);
      -[NSSQLStoreRequestContext setQueryGenerationToken:](v6, 0);
      uint64_t v7 = *(void *)(a1 + 8);
      if (v7) {
        uint64_t v8 = *(void *)(v7 + 8);
      }
      else {
        uint64_t v8 = 0;
      }
      -[NSSQLCore dispatchRequest:withRetries:](v8, v6, 0);
      uint64_t v9 = (os_unfair_lock_s *)(id)[v6 result];
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 8);
        if (v10) {
          [*(id *)(v10 + 136) setObject:v9 forKey:a2];
        }
      }

      v11 = v9;
      if (!v9)
      {
        uint64_t v14 = *(void *)(a1 + 8);
        if (v14) {
          uint64_t v15 = *(void **)(v14 + 8);
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v16 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v15, (void *)[a2 entity]);
        unint64_t v12 = objc_msgSend(+[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v16), "initWithSQLEntity:objectID:", v16, a2);
        goto LABEL_11;
      }
      double v5 = v9;
    }
    unint64_t v12 = (void *)[(os_unfair_lock_s *)v5 copy];
LABEL_11:
    id Value = v12;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), a2, v12);
  }
  return Value;
}

- (void)newObjectsForFastLockConflictDetection
{
  if (result)
  {
    uint64_t v1 = (void *)result[1];
    if (v1) {
      uint64_t v1 = (void *)[v1 persistentStoreRequest];
    }
    unint64_t v2 = (void *)[v1 lockedObjects];
    return v2;
  }
  return result;
}

- (void)_createCorrelationTrackerUpdatesForDeletedObject:(uint64_t)a1
{
  unint64_t v2 = a2;
  uint64_t v50 = a1;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 entity];
  double v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [*(id *)(v3 + 104) keys];
    uint64_t v6 = v4[14];
  }
  else
  {
    uint64_t v5 = [0 keys];
    uint64_t v6 = 0;
  }
  uint64_t v53 = _kvcPropertysPrimitiveGetters(v4);
  if ((*((unsigned char *)v2 + 17) & 0x80) != 0) {
    [v2 willAccessValueForKey:0];
  }
  uint64_t v49 = [v2 objectID];
  uint64_t v7 = [v2 entity];
  if (v7
    && ((uint64_t v8 = (void *)v7, (v9 = *(void *)(v50 + 8)) == 0) ? (v10 = 0) : (v10 = *(void **)(v9 + 8)),
        (uint64_t v11 = _sqlCoreLookupSQLEntityForEntityDescription(v10, v8)) != 0))
  {
    id v54 = *(id *)(v11 + 40);
  }
  else
  {
    id v54 = 0;
  }
  uint64_t v12 = *((void *)v2 + 6);
  if (v12) {
    unint64_t v13 = *(void **)(v12 + 8);
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v52 = [v13 values];
  if (v52)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
    unint64_t v15 = *(void *)(v6 + 144);
    uint64_t v14 = *(void *)(v6 + 152);
    uint64_t v16 = v14 + v15;
    if (v15 < v14 + v15)
    {
      uint64_t v17 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
      uint64_t v47 = v5;
      int v48 = v2;
      while (1)
      {
        uint64_t v18 = *(void *)(v5 + 8 * v15);
        uint64_t v19 = objc_msgSend(v54, "objectForKey:", v18, v47, v48);
        if (v19)
        {
          uint64_t v24 = (void *)v19;
          if (*(unsigned char *)(v19 + 24) == 9)
          {
            if (*(void *)(v19 + v17[163]))
            {
              _PF_Handler_Primitive_GetProperty((id **)v2, v15, v18, *(void *)(v53 + 8 * v15), v20, v21, v22, v23);
              uint64_t v26 = *(void **)(v52 + 8 * v15);
              if (v25 != v26)
              {
                uint64_t v27 = v25;
                if (([v25 isFault] & 1) == 0) {
                  break;
                }
              }
            }
          }
        }
LABEL_56:
        if (++v15 == v16) {
          return;
        }
      }
      if ((void *)v51 == v27 || ![v27 count])
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        if ((void *)v51 != v26 && [v26 count])
        {
          unint64_t v30 = [v26 count];
          unint64_t v31 = MEMORY[0x1F4188790](v30);
          uint64_t v34 = (char *)&v47 - v33;
          if (v31 > 0x200) {
            uint64_t v34 = (char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero((char *)&v47 - v33, 8 * v32);
          }
          [v26 getObjects:v34];
          uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v34 count:v30];
          if (v30 >= 0x201) {
            NSZoneFree(0, v34);
          }
          goto LABEL_39;
        }
        v35 = (objc_class *)MEMORY[0x1E4F1CA80];
      }
      else
      {
        if ((void *)v51 != v26 && [v26 count])
        {
          id v28 = +[_PFRoutines newMutableSetFromCollection:byIntersectingWithCollection:]((uint64_t)_PFRoutines, v26, v27);
          id v29 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v26, v27);
LABEL_35:
          uint64_t v36 = v29;
LABEL_39:
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v38 = [v28 countByEnumeratingWithState:&v59 objects:v64 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v60 != v40) {
                  objc_enumerationMutation(v28);
                }
                objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "objectID"));
              }
              uint64_t v39 = [v28 countByEnumeratingWithState:&v59 objects:v64 count:16];
            }
            while (v39);
          }
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v42 = [v36 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v43; ++j)
              {
                if (*(void *)v56 != v44) {
                  objc_enumerationMutation(v36);
                }
                objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * j), "objectID"));
              }
              uint64_t v43 = [v36 countByEnumeratingWithState:&v55 objects:v63 count:16];
            }
            while (v43);
          }
          if ([v37 count])
          {
            id v46 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v50, v24);
            -[NSSQLCorrelationTableUpdateTracker trackInserts:deletes:reorders:forObjectWithID:]((uint64_t)v46, 0, v37, 0, v49);
          }

          uint64_t v5 = v47;
          unint64_t v2 = v48;
          uint64_t v17 = &OBJC_IVAR___NSSQLCore__historyTrackingOptions;
          goto LABEL_56;
        }
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v35 = (objc_class *)MEMORY[0x1E4F1CA80];
      }
      id v29 = objc_alloc_init(v35);
      goto LABEL_35;
    }
  }
}

- (void)dealloc
{
  CFRelease(self->_changeCache);
  self->_changeCache = 0;
  CFRelease(self->_toManyCache);
  self->_toManyCache = 0;
  CFRelease(self->_insertCache);
  self->_insertCache = 0;

  self->_toManyRelationshipChanges = 0;
  self->_rowsToDelete = 0;

  self->_externalDataReferencesToDelete = 0;
  self->_externalDataReferencesToSave = 0;

  self->_fileBackedFuturesToCopy = 0;
  self->_fileBackedFuturesToDelete = 0;

  self->_updatedByRequest = 0;
  self->_updatedByForeignKey = 0;

  self->_rowsToAddToRowCache = 0;
  self->_objectIDsToRemoveFromRowCache = 0;

  self->_usedIndexes = 0;
  updatedFOKRowsInCurrentSave = self->_updatedFOKRowsInCurrentSave;
  if (updatedFOKRowsInCurrentSave)
  {
    CFRelease(updatedFOKRowsInCurrentSave);
    self->_updatedFOKRowsInCurrentSave = 0;
    CFRelease(self->_deletedFOKRowsInCurrentSave);
    self->_deletedFOKRowsInCurrentSave = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSSQLSavePlan;
  [(NSSQLSavePlan *)&v4 dealloc];
}

- (id)_newRowCacheRowForToManyUpdatesForRelationship:(void *)a3 rowCacheOriginal:(void *)a4 originalOrderKeys:(void *)a5 originalSnapshot:(char *)a6 value:(void *)a7 added:(void *)a8 deleted:(char *)a9 sourceRowPK:(void *)a10 properties:(void *)a11 sourceObject:(void *)a12 newIndexes:(void *)a13 reorderedIndexes:
{
  v233 = a6;
  uint64_t v256 = *MEMORY[0x1E4F143B8];
  id v219 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v224 = a11;
  id v226 = (id)[a11 objectID];
  unint64_t v20 = [a7 count];
  v222 = a8;
  unint64_t v230 = [a8 count];
  v223 = a2;
  int v21 = [a2 isOrdered];
  if (!a3)
  {
    uint64_t v208 = *MEMORY[0x1E4F1C3B8];
    v209 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v210 = [NSNumber numberWithInt:134030];
    id v211 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v208, 134030, @"Invalid rowCache row is nil", (void *)[v209 dictionaryWithObject:v210 forKey:*MEMORY[0x1E4F281F8]]);
    objc_exception_throw(v211);
  }
  int v22 = v21;
  if (v21)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else if ([a3 isNSArray])
  {
    id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a3];
  }
  else
  {
    id v23 = (id)[a3 mutableCopy];
  }
  id v235 = v23;
  id v221 = a10;
  uint64_t v220 = [a3 count];
  MEMORY[0x1F4188790](v220);
  uint64_t v26 = (char *)&v212 - v25;
  unint64_t v218 = v27;
  if (v27 > 0x200)
  {
    uint64_t v28 = NSAllocateScannedUncollectable();
    uint64_t v26 = (char *)v28;
  }
  else
  {
    bzero((char *)&v212 - v25, 8 * v24);
  }
  int v229 = v22;
  v228 = v26;
  if (!v22)
  {
    if (v20)
    {
      MEMORY[0x1F4188790](v28);
      uint64_t v32 = (char *)&v212 - v31;
      uint64_t v33 = v26;
      if (v20 > 0x200) {
        uint64_t v32 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v212 - v31, 8 * v20);
      }
      [a7 getObjects:v32];
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      do
      {
        uint64_t v36 = [*(id *)&v32[8 * v34] objectID];
        if (v36) {
          *(void *)&v33[8 * v35++] = v36;
        }
        ++v34;
      }
      while (v20 != v34);
      BOOL v37 = v20 < 0x201;
      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v33 count:v35];
      [v235 addObjectsFromArray:v38];

      if (!v37) {
        NSZoneFree(0, v32);
      }
      uint64_t v26 = v33;
    }
    goto LABEL_216;
  }
  v227 = a13;
  v217 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a5);
  if (([a3 isNSArray] & 1) == 0) {
    a3 = (void *)[a3 array];
  }
  if ([a3 isEqual:v217])
  {
    uint64_t v29 = [v223 name];
    unint64_t v30 = (void *)[v221 objectForKey:v29];
    if (*(unsigned char *)(a1 + 148)) {
      id v234 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v234 = 0;
    }
    uint64_t v39 = v227;
    id v215 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v30 isToMany])
    {
      if (v30 && (uint64_t v40 = v30[7]) != 0) {
        v41 = *(void **)(v40 + 80);
      }
      else {
        v41 = 0;
      }
      LODWORD(v231) = [v41 slot];
    }
    else
    {
      LODWORD(v231) = 0;
    }
    size_t v54 = [v233 count];
    long long v55 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      long long v55 = malloc_default_zone();
    }
    *uint64_t v39 = malloc_type_zone_calloc(v55, v54, 1uLL, 0x100004077774924uLL);
    long long v56 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      long long v56 = malloc_default_zone();
    }
    *a12 = malloc_type_zone_calloc(v56, v54, 8uLL, 0x100004000313F17uLL);
    long long v57 = v233;
    id v225 = v30;
    -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:](a1, (uint64_t)v233, (uint64_t)v226, v30, (void **)a12, v39);
    v227 = (void **)[v57 count];
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v248 = 0u;
    long long v249 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    uint64_t v59 = [v57 countByEnumeratingWithState:&v248 objects:v255 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v249;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v249 != v60) {
            objc_enumerationMutation(v233);
          }
          uint64_t v62 = [*(id *)(*((void *)&v248 + 1) + 8 * i) objectID];
          [v235 addObject:v62];
        }
        uint64_t v59 = [v233 countByEnumeratingWithState:&v248 objects:v255 count:16];
      }
      while (v59);
    }
    if ([v225 isToMany])
    {
      if (v227)
      {
        for (uint64_t j = 0; j != v227; uint64_t j = (void **)((char *)j + 1))
        {
          long long v64 = (void *)MEMORY[0x18C127630]();
          uint64_t v65 = (const void *)objc_msgSend((id)objc_msgSend(v233, "objectAtIndex:", j), "objectID");
          if (!-[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v65)) {
            [v58 addObject:v65];
          }
        }
      }
      id v232 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v58 count])
      {
        long long v66 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v66, "setEntity:", objc_msgSend((id)objc_msgSend(v225, "destinationEntity"), "entityDescription"));
        -[NSFetchRequest setPredicate:](v66, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v58]);
        [(NSFetchRequest *)v66 setAllocationType:1];
        [(NSFetchRequest *)v66 setResultType:2];
        long long v67 = objc_alloc_init(NSExpressionDescription);
        [(NSPropertyDescription *)v67 setName:@"self"];
        -[NSExpressionDescription setExpression:](v67, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
        [(NSExpressionDescription *)v67 setExpressionResultType:2000];
        v68 = objc_alloc_init(NSExpressionDescription);
        [(NSPropertyDescription *)v68 setName:@"fok"];
        if (v225 && (uint64_t v69 = *((void *)v225 + 7)) != 0) {
          uint64_t v70 = *(void **)(v69 + 80);
        }
        else {
          uint64_t v70 = 0;
        }
        uint64_t v71 = [v70 name];
        -[NSExpressionDescription setExpression:](v68, "setExpression:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v71]);
        [(NSExpressionDescription *)v68 setExpressionResultType:200];
        -[NSFetchRequest setPropertiesToFetch:](v66, "setPropertiesToFetch:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v67, v68, 0));
        uint64_t v72 = [NSSQLFetchRequestContext alloc];
        uint64_t v73 = *(void *)(a1 + 8);
        if (v73)
        {
          uint64_t v74 = *(void *)(v73 + 32);
          uint64_t v75 = *(void *)(v73 + 8);
        }
        else
        {
          uint64_t v74 = 0;
          uint64_t v75 = 0;
        }
        uint64_t v76 = [(NSSQLFetchRequestContext *)v72 initWithRequest:v66 context:v74 sqlCore:v75];
        -[NSSQLStoreRequestContext setQueryGenerationToken:](v76, 0);
        uint64_t v77 = *(void *)(a1 + 8);
        if (v77) {
          uint64_t v78 = *(void *)(v77 + 8);
        }
        else {
          uint64_t v78 = 0;
        }
        -[NSSQLCore dispatchRequest:withRetries:](v78, v76, 0);
        id v79 = (id)[v76 result];

        long long v246 = 0u;
        long long v247 = 0u;
        long long v244 = 0u;
        long long v245 = 0u;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v244 objects:v254 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v245;
          do
          {
            for (uint64_t k = 0; k != v80; ++k)
            {
              if (*(void *)v245 != v81) {
                objc_enumerationMutation(v79);
              }
              uint64_t v83 = *(void **)(*((void *)&v244 + 1) + 8 * k);
              uint64_t v84 = [v83 objectForKey:@"self"];
              [v232 setObject:v83 forKey:v84];
            }
            uint64_t v80 = [v79 countByEnumeratingWithState:&v244 objects:v254 count:16];
          }
          while (v80);
        }

        id v58 = 0;
      }
    }
    else
    {
      id v232 = 0;
    }

    if ([v225 isToMany])
    {
      id v214 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v227)
      {
        uint64_t v88 = 0;
        unint64_t v216 = v231;
        while (1)
        {
          unint64_t v89 = (void *)MEMORY[0x18C127630]();
          unint64_t v90 = (void *)[v233 objectAtIndex:v88];
          uint64_t v91 = (const void *)[v90 objectID];
          uint64_t v92 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v91);
          v93 = v92 ? 0 : (void *)[v232 objectForKey:v91];
          -[NSSQLSavePlan _populateOrderKeysInOrderedSet:usingSourceObjectID:inverseRelationship:newIndexes:reorderedIndexes:](a1, (uint64_t)v233, (uint64_t)v226, v225, 0, 0);
          uint64_t v94 = -[_NSFaultingMutableOrderedSet _orderKeyForObject:]((uint64_t)v233, (uint64_t)v90);
          uint64_t v95 = v94;
          if (v92) {
            break;
          }
          if (objc_msgSend((id)objc_msgSend(v93, "objectForKey:", @"fok"), "intValue") != v94)
          {
            [v214 addObject:v91];
LABEL_90:
            objc_msgSend(v87, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v95), v91);
          }
LABEL_91:
          if (v227 == (void **)++v88) {
            goto LABEL_92;
          }
        }
        if (*(uint32_t *)((char *)&v92[v216]._os_unfair_lock_opaque
                         + _NSSQLRowInstanceSize
                         + ((2 * v92[4]._os_unfair_lock_opaque) & 0x1FFF8)) == v94)
          goto LABEL_91;
        goto LABEL_90;
      }
LABEL_92:
      if ([v214 count])
      {
        float v96 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setEntity:](v96, "setEntity:", objc_msgSend((id)objc_msgSend(v225, "destinationEntity"), "entityDescription"));
        -[NSFetchRequest setPredicate:](v96, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v214]);
        v97 = [NSSQLFetchRequestContext alloc];
        uint64_t v98 = *(void *)(a1 + 8);
        if (v98)
        {
          uint64_t v99 = *(void *)(v98 + 32);
          uint64_t v100 = *(void *)(v98 + 8);
        }
        else
        {
          uint64_t v99 = 0;
          uint64_t v100 = 0;
        }
        uint64_t v101 = [(NSSQLFetchRequestContext *)v97 initWithRequest:v96 context:v99 sqlCore:v100];
        -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v101, 0);
        *(_DWORD *)(*(void *)(v101 + 136) + 72) = *(_DWORD *)(*(void *)(v101 + 136) + 72) & 0xFFFFFFE3 | 8;
        uint64_t v102 = *(void *)(a1 + 8);
        if (v102) {
          uint64_t v103 = *(void *)(v102 + 8);
        }
        else {
          uint64_t v103 = 0;
        }
        -[NSSQLCore dispatchRequest:withRetries:](v103, (void *)v101, 0);
        id v104 = (id)[(id)v101 result];

        long long v242 = 0u;
        long long v243 = 0u;
        long long v240 = 0u;
        long long v241 = 0u;
        uint64_t v105 = [v104 countByEnumeratingWithState:&v240 objects:v253 count:16];
        if (v105)
        {
          uint64_t v106 = *(void *)v241;
          do
          {
            for (uint64_t m = 0; m != v105; ++m)
            {
              if (*(void *)v241 != v106) {
                objc_enumerationMutation(v104);
              }
              uint64_t v108 = *(void **)(*((void *)&v240 + 1) + 8 * m);
              uint64_t v109 = *(void *)(a1 + 8);
              uint64_t v110 = [v108 objectID];
              if (v109) {
                [*(id *)(v109 + 136) setObject:v108 forKey:v110];
              }
            }
            uint64_t v105 = [v104 countByEnumeratingWithState:&v240 objects:v253 count:16];
          }
          while (v105);
        }

        id v111 = 0;
      }
      else
      {
        id v111 = v214;
      }

      long long v238 = 0u;
      long long v239 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      uint64_t v116 = [v87 countByEnumeratingWithState:&v236 objects:v252 count:16];
      if (v116)
      {
        uint64_t v117 = *(void *)v237;
        do
        {
          for (uint64_t n = 0; n != v116; ++n)
          {
            if (*(void *)v237 != v117) {
              objc_enumerationMutation(v87);
            }
            uint64_t v119 = *(const void **)(*((void *)&v236 + 1) + 8 * n);
            id v120 = (void *)[v87 objectForKey:v119];
            id v121 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v119);
            id Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v119);
            if (Value) {
              BOOL v123 = 1;
            }
            else {
              BOOL v123 = v121 == 0;
            }
            if (!v123)
            {
              id Value = (void *)[(os_unfair_lock_s *)v121 copy];
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v119, Value);
            }
            if (Value)
            {
              uint64_t v124 = [v120 intValue];
              [Value setForeignOrderKeySlot:v231 orderKey:v124];
              [v234 addObject:v119];
              [v234 addObject:v120];
            }
          }
          uint64_t v116 = [v87 countByEnumeratingWithState:&v236 objects:v252 count:16];
        }
        while (v116);
      }
    }
    else
    {
      id v87 = 0;
    }

    if (v234)
    {
      if ([v234 count]) {
        uint64_t v125 = (uint64_t)v234;
      }
      else {
        uint64_t v125 = 0;
      }
      if ([v215 count]) {
        uint64_t v126 = (uint64_t)v215;
      }
      else {
        uint64_t v126 = 0;
      }
      uint64_t v127 = (const void *)[v224 objectID];
      -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](a1, v125, v126, v127, v223);
    }
    else
    {
      id v234 = 0;
    }
    goto LABEL_215;
  }
  id v232 = a4;
  id v215 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v222);
  if (*(unsigned char *)(a1 + 148)) {
    id v226 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v226 = 0;
  }
  uint64_t v42 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v233);
  uint64_t v43 = [v222 count];
  uint64_t v44 = v217;
  uint64_t v45 = [v217 count];
  id v234 = v42;
  if (v43 == v45)
  {
    uint64_t v46 = [v44 count];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = [a3 count];
      if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v44, a3))
      {
        uint64_t v49 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(v44, "objectAtIndex:", 0));
        if (v49)
        {
          uint64_t v50 = v49 + v47;
          uint64_t v51 = v48 - (v49 + v47);
          uint64_t v52 = a12;
          if (v51)
          {
            id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithArray:range:copyItems:", a3, 0, v49, 0);
            MEMORY[0x1F4188790](v53);
            v205 = (char *)&v212 - v204;
            objc_msgSend(a3, "getObjects:range:", (char *)&v212 - v204, v50, v51);
            id v86 = v232;
            [v53 addObjects:v205 count:v51];
            goto LABEL_163;
          }
          id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithArray:range:copyItems:", a3, 0, v49, 0);
LABEL_162:
          id v86 = v232;
LABEL_163:
          [v53 addObjectsFromArray:v234];
          id v225 = 0;
          goto LABEL_164;
        }
        id v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithArray:range:copyItems:", a3, v47, v48 - v47, 0);
      }
      else
      {
        id v115 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, a3, v215);
      }
    }
    else
    {
      id v115 = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:a3];
    }
    id v53 = v115;
    uint64_t v52 = a12;
    goto LABEL_162;
  }
  id v85 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, v215);
  if (!+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v85, v42))
  {

    BOOL v112 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a7);
    unint64_t v216 = [a3 mutableCopy];
    id v113 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v44, (void *)v216);
    id v114 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v113, v112);

    if (v226) {
      id v225 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v215, v114);
    }
    else {
      id v225 = 0;
    }
    uint64_t v128 = v217;
    uint64_t v129 = [v217 count];
    uint64_t v52 = a12;
    if (v129 == [v114 count])
    {
      id v130 = 0;
    }
    else
    {
      id v131 = (void *)[v128 mutableCopy];
      id v130 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v131, v114);
    }
    uint64_t v132 = [v128 count];
    uint64_t v133 = [v114 count];
    id v214 = v114;
    if (v132 == v133)
    {
      id v134 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v234, v128);
      id v135 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v134, a3);
    }
    else
    {
      id v134 = v130;
      if (!+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]((uint64_t)_PFRoutines, v130, a3))
      {

        uint64_t v136 = (void *)v216;
        id v137 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, (void *)v216, v217);
        [v137 minusSet:v215];
        id v53 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v234, v114);
        uint64_t v138 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v222);
        [v136 removeObjectsInArray:v138];

        id v213 = v137;
        if ([v137 count])
        {
          v212 = a12;
          uint64_t v139 = v136;
          v231 = (_NSFaultingMutableOrderedSet *)[v136 count];
          if (v231)
          {
            uint64_t v140 = 0;
            uint64_t v141 = 0;
            uint64_t v142 = 0;
            char v143 = 0;
            do
            {
              uint64_t v144 = [v139 objectAtIndex:v140];
              if ([v53 containsObject:v144])
              {
                if ((unint64_t)v142 | v141)
                {
                  uint64_t v145 = objc_msgSend(v139, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v142, v141));
                  uint64_t v146 = [v53 indexOfObject:v144];
                  objc_msgSend(v53, "insertObjects:atIndexes:", v145, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v146, v141));
                  char v143 = 0;
                }
                uint64_t v142 = 0;
                uint64_t v141 = 0;
              }
              else
              {
                BOOL v147 = (v143 & 1) == 0;
                if ((v143 & 1) == 0) {
                  uint64_t v142 = v140;
                }
                char v143 = 1;
                if (v147) {
                  uint64_t v141 = 1;
                }
                else {
                  ++v141;
                }
              }
              uint64_t v140 = (_NSFaultingMutableOrderedSet *)((char *)v140 + 1);
            }
            while (v231 != v140);
          }
          else
          {
            uint64_t v142 = 0;
            uint64_t v141 = 0;
          }
          if ((unint64_t)v142 | v141)
          {
            uint64_t v206 = objc_msgSend(v139, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v142, v141));
            uint64_t v207 = [v53 count];
            objc_msgSend(v53, "insertObjects:atIndexes:", v206, objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v207, v141));
          }
          uint64_t v52 = v212;
          id v134 = v213;
        }
        else
        {
          id v134 = v213;
        }
        goto LABEL_145;
      }
      id v135 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v130, a3, v234);
    }
    id v53 = v135;
LABEL_145:
    id v86 = v232;

    goto LABEL_164;
  }
  id v53 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]((uint64_t)_PFRoutines, v85, v42, a3);

  id v225 = 0;
  uint64_t v52 = a12;
  id v86 = v232;
LABEL_164:
  uint64_t v148 = [v223 name];
  id v232 = (id)[v221 objectForKey:v148];
  if ([v232 isToMany])
  {
    if (v232 && (uint64_t v149 = *((void *)v232 + 7)) != 0) {
      int v150 = *(void **)(v149 + 80);
    }
    else {
      int v150 = 0;
    }
    LODWORD(v216) = [v150 slot];
  }
  else
  {
    LODWORD(v216) = 0;
  }

  char v151 = [v53 isNSArray];
  id v152 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v153 = (uint64_t)v53;
  if ((v151 & 1) == 0) {
    uint64_t v153 = objc_msgSend(v53, "array", v53);
  }
  id v235 = (id)[v152 initWithArray:v153];
  v231 = [[_NSFaultingMutableOrderedSet alloc] initWithOrderedSet:v53];

  if ([(_NSFaultingMutableOrderedSet *)v231 count])
  {
    int v154 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      int v154 = malloc_default_zone();
    }
    v155 = malloc_type_zone_calloc(v154, [(_NSFaultingMutableOrderedSet *)v231 count], 1uLL, 0x100004077774924uLL);
    *v227 = v155;
    uint64_t v156 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v156 = malloc_default_zone();
    }
    *uint64_t v52 = malloc_type_zone_calloc(v156, [(_NSFaultingMutableOrderedSet *)v231 count], 8uLL, 0x100004000313F17uLL);
    -[_NSFaultingMutableOrderedSet _populateOrderKeysUsingSnapshot:orderKeys:newIndexes:reorderedIndexes:]((uint64_t)v231, a3, v86, (void **)v52, v227);
    -[_NSFaultingMutableOrderedSet _updateOrderKeysFromOrderOfObjectIDs:]((id *)v233, v231);
  }
  v233 = (char *)[v235 count];
  if (v233)
  {
    v157 = 0;
    v227 = (void **)v216;
    do
    {
      v158 = (void *)MEMORY[0x18C127630]();
      v159 = (const void *)[v235 objectAtIndex:v157];
      id v160 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v159);
      if (!v160)
      {
        id v161 = (id *)-[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(void *)(a1 + 8), (uint64_t)v159);
        -[NSSQLStoreRequestContext setQueryGenerationToken:](v161, 0);
        uint64_t v162 = *(void *)(a1 + 8);
        if (v162) {
          uint64_t v163 = *(void *)(v162 + 8);
        }
        else {
          uint64_t v163 = 0;
        }
        -[NSSQLCore dispatchRequest:withRetries:](v163, v161, 0);
        id v160 = (os_unfair_lock_s *)(id)[v161 result];
        if (v160)
        {
          uint64_t v164 = *(void *)(a1 + 8);
          if (v164) {
            [*(id *)(v164 + 136) setObject:v160 forKey:v159];
          }
        }

        int v165 = v160;
      }
      if ([v232 isToMany])
      {
        uint64_t v166 = -[_NSFaultingMutableOrderedSet _orderKeyForObject:]((uint64_t)v231, (uint64_t)v159);
        uint64_t v167 = v166;
        uint32_t v168 = v160
             ? *(uint32_t *)((char *)&v160[(void)v227]._os_unfair_lock_opaque
                           + _NSSQLRowInstanceSize
                           + ((2 * v160[4]._os_unfair_lock_opaque) & 0x1FFF8))
             : 0;
        if (v168 != v166)
        {
          id v169 = objc_msgSend((id)objc_msgSend(v224, "managedObjectContext"), "objectRegisteredForID:", v159);
          if (([v169 isDeleted] & 1) == 0)
          {
            if ([v169 isFault])
            {
              v170 = (id *)-[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(void *)(a1 + 8), [v169 objectID]);
              -[NSSQLStoreRequestContext setQueryGenerationToken:](v170, 0);
              uint64_t v171 = *(void *)(a1 + 8);
              if (v171) {
                uint64_t v172 = *(void *)(v171 + 8);
              }
              else {
                uint64_t v172 = 0;
              }
              -[NSSQLCore dispatchRequest:withRetries:](v172, v170, 0);
              id v160 = (os_unfair_lock_s *)(id)[v170 result];

              v173 = v160;
            }
            id v174 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v159);
            if (!v174 && v160)
            {
              id v174 = (void *)[(os_unfair_lock_s *)v160 copy];
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v159, v174);
            }
            if (v174)
            {
              [v174 setForeignOrderKeySlot:v216 orderKey:v167];
              [v226 addObject:v159];
              uint64_t v175 = [NSNumber numberWithUnsignedInt:v167];
              [v226 addObject:v175];
            }
          }
        }
      }
      ++v157;
    }
    while (v233 != v157);
  }
  id v176 = v226;
  if (v226)
  {
    if ([v226 count]) {
      uint64_t v177 = (uint64_t)v226;
    }
    else {
      uint64_t v177 = 0;
    }
    if ([v225 count]) {
      uint64_t v178 = (uint64_t)v225;
    }
    else {
      uint64_t v178 = 0;
    }
    v179 = (const void *)[v224 objectID];
    -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:](a1, v177, v178, v179, v223);
    id v176 = v226;
  }

LABEL_215:
  uint64_t v26 = v228;
LABEL_216:
  if (!v220 || !v230) {
    goto LABEL_252;
  }
  uint64_t v180 = [v223 name];
  long long v181 = (void *)[v221 objectForKey:v180];
  uint64_t v182 = [v181 isToMany];
  char v183 = v182 ^ 1;
  if (!v181) {
    char v183 = 1;
  }
  if ((v183 & 1) == 0 && (uint64_t v182 = v181[7]) != 0 && *(unsigned char *)(v182 + 88))
  {
    uint64_t v182 = objc_msgSend((id)objc_msgSend((id)v182, "foreignKey"), "slot");
    uint64_t v184 = v182;
    LODWORD(v234) = 1;
  }
  else
  {
    LODWORD(v234) = 0;
    uint64_t v184 = 0;
  }
  v231 = (_NSFaultingMutableOrderedSet *)&v212;
  MEMORY[0x1F4188790](v182);
  uint64_t v187 = (char *)&v212 - v185;
  if (v186 > 0x200) {
    uint64_t v187 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v212 - v185, 8 * v186);
  }
  uint64_t v188 = [v222 getObjects:v187];
  uint64_t v189 = 0;
  v233 = a9;
  LODWORD(v232) = v184;
  do
  {
    v190 = (void *)MEMORY[0x18C127630](v188);
    uint64_t v191 = (const void *)[*(id *)&v187[8 * v189] objectID];
    v192 = v191;
    if ((v229 & 1) == 0) {
      *(void *)&v228[8 * v189] = v191;
    }
    if (v234)
    {
      v193 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), v191);
      if (v193) {
        goto LABEL_242;
      }
      if (-[NSSQLSaveChangesRequestContext originalRowForObjectID:](*(void *)(a1 + 8), v192))
      {
        v193 = 0;
        goto LABEL_242;
      }
      v194 = (id *)-[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](*(void *)(a1 + 8), (uint64_t)v192);
      -[NSSQLStoreRequestContext setQueryGenerationToken:](v194, 0);
      uint64_t v195 = *(void *)(a1 + 8);
      if (v195) {
        uint64_t v196 = *(void *)(v195 + 8);
      }
      else {
        uint64_t v196 = 0;
      }
      -[NSSQLCore dispatchRequest:withRetries:](v196, v194, 0);
      id v197 = (id)[v194 result];
      if (v197)
      {
        uint64_t v198 = *(void *)(a1 + 8);
        if (v198) {
          [*(id *)(v198 + 136) setObject:v197 forKey:v192];
        }
      }

      id v199 = v197;
      uint64_t v184 = v232;
      if (v197)
      {
        v193 = (void *)[v197 copy];
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), v192, v193);

LABEL_242:
        v200 = (char *)-[NSSQLRow foreignKeyForSlot:]((uint64_t)v193, v184);
        if (v200 == v233) {
          [v193 setForeignKeySlot:v184 int64:0];
        }
      }
    }
    ++v189;
  }
  while (v230 != v189);
  if ((v229 & 1) == 0)
  {
    id v201 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v202 = (void *)[v201 initWithObjects:v228 count:v230];
    [v235 minusSet:v202];
  }
  if (v230 >= 0x201) {
    NSZoneFree(0, v187);
  }
  uint64_t v26 = v228;
LABEL_252:
  if (v218 >= 0x201) {
    NSZoneFree(0, v26);
  }
  [v219 drain];
  return v235;
}

- (void)_populateOrderKeysInOrderedSet:(uint64_t)a3 usingSourceObjectID:(void *)a4 inverseRelationship:(void *)a5 newIndexes:(void *)a6 reorderedIndexes:
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (!a2 || a6 || a5 || !*(void *)(a2 + 32))
  {
    if (a4) {
      uint64_t v11 = [a4 propertyDescription];
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [NSSQLRelationshipFaultRequestContext alloc];
    uint64_t v13 = *(void *)(a1 + 8);
    if (v13)
    {
      uint64_t v14 = *(void *)(v13 + 32);
      uint64_t v15 = *(void *)(v13 + 8);
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    uint64_t v16 = [(NSSQLRelationshipFaultRequestContext *)v12 initWithObjectID:a3 relationship:v11 context:v14 sqlCore:v15];
    -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)v16, 0);
    uint64_t v17 = *(void *)(a1 + 8);
    if (v17) {
      uint64_t v18 = *(void *)(v17 + 8);
    }
    else {
      uint64_t v18 = 0;
    }
    -[NSSQLCore dispatchRequest:withRetries:](v18, (void *)v16, 0);
    id v19 = (id)[(id)v16 result];
    if (v16)
    {
      unint64_t v20 = *(void **)(v16 + 40);
      if (v20)
      {
        id v24 = v20;
        uint64_t v25 = [v24 code];
        uint64_t v26 = [v24 description];
        v30[0] = [v24 domain];
        uint64_t v27 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v24, "code"));
        v30[1] = *MEMORY[0x1E4F28A50];
        v31[0] = v27;
        v31[1] = v24;
        uint64_t v28 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
        id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3B8], v25, v26, v28);
        objc_exception_throw(v29);
      }
    }

    BOOL v21 = [v19 count] == 2;
    int v22 = (void *)[v19 firstObject];
    if (v21) {
      id v23 = (void *)[v19 lastObject];
    }
    else {
      id v23 = NSOrderedSet_EmptyOrderedSet;
    }
    -[_NSFaultingMutableOrderedSet _populateOrderKeysUsingSnapshot:orderKeys:newIndexes:reorderedIndexes:](a2, v22, v23, a5, a6);
  }
}

- (uint64_t)_registerChangedFOKs:(uint64_t)a3 deletions:(const void *)a4 forSourceObject:(void *)a5 andRelationship:
{
  uint64_t v8 = result;
  if (a2)
  {
    id v10 = (id)[*(id *)(result + 80) objectForKey:a4];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 80), a4, v10);
    }
    result = objc_msgSend(v10, "setValue:forKey:", a2, objc_msgSend(a5, "name"));
  }
  if (a3)
  {
    id v11 = (id)[*(id *)(v8 + 88) objectForKey:a4];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v8 + 88), a4, v11);
    }
    uint64_t v12 = [a5 name];
    return [v11 setValue:a3 forKey:v12];
  }
  return result;
}

- (uint64_t)_addFileBackedFutureToDelete:(uint64_t)a1
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 8);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 fileBackedFuturesDirectory];
  if (a2) {
    uint64_t v7 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v7, "path"), "hasPrefix:", v6);
  if (result)
  {
    id v9 = *(id *)(a1 + 120);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(a1 + 120) = v9;
    }
    return [v9 addObject:a2];
  }
  return result;
}

- (void)_prepareForDeletionOfDatabaseExternalPropertiesForObject:(uint64_t)a1
{
  uint64_t v4 = (void *)[a2 entity];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6) {
      uint64_t v7 = *(void **)(v6 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v4 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v7, v5);
  }
  uint64_t v8 = (void *)[v4 entityDescription];
  if (v8)
  {
    id v9 = v8;
    id v10 = (void *)v8[13];
    uint64_t v11 = [v8 propertiesByName];
    uint64_t v12 = v9[14];
    unint64_t v13 = *(void *)(v12 + 48);
    uint64_t v14 = *(void *)(v12 + 56);
    uint64_t v15 = _kvcPropertysPrimitiveGetters(v9);
    if (v13 < v14 + v13)
    {
      uint64_t v16 = v15;
      uint64_t v17 = (id *)(v11 + 8 * v13 + 24);
      do
      {
        uint64_t v18 = (void *)MEMORY[0x18C127630]();
        id v19 = *v17;
        if ([*v17 storesBinaryDataExternally]
          && ([v19 isFileBackedFuture] & 1) == 0)
        {
          uint64_t v27 = [v19 name];
          unint64_t v28 = [v10 fastIndexForKnownKey:v27];
          if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v33 = [a2 primitiveValueForKey:v27];
          }
          else {
            _PF_Handler_Primitive_GetProperty((id **)a2, v28, v27, *(void *)(v16 + 8 * v28), v29, v30, v31, v32);
          }
          uint64_t v34 = v33;
          if (v33)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = *(id *)(a1 + 104);
              if (!v35)
              {
                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                *(void *)(a1 + 104) = v35;
              }
              [v35 addObject:v34];
            }
          }
          uint64_t v36 = (id *)-[NSSQLSavePlan _findOrCreateChangeSnapshotForGlobalID:](a1, (void *)[a2 objectID]);
          CFDateRef v37 = (const __CFDate *)v36;
          if (v36)
          {
            if ((_BYTE)v36[2])
            {
              uint64_t v36 = 0;
            }
            else
            {
              uint64_t v36 = (id *)[*((id *)v36[5] + 2) _storeInfo1];
              if (v36) {
                uint64_t v36 = (id *)[v36[5] objectForKey:v27];
              }
            }
          }
          CFDateRef v38 = -[NSSQLRow attributeValueForSlot:](v37, [v36 slot]);
          if (v38)
          {
            CFDateRef v39 = v38;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v40 = *(id *)(a1 + 104);
              if (!v40)
              {
                id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                *(void *)(a1 + 104) = v40;
              }
              [v40 addObject:v39];
            }
          }
        }
        else if ([v19 isFileBackedFuture])
        {
          uint64_t v20 = [v19 name];
          unint64_t v21 = [v10 fastIndexForKnownKey:v20];
          if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v26 = [a2 primitiveValueForKey:v20];
          }
          else {
            _PF_Handler_Primitive_GetProperty((id **)a2, v21, v20, *(void *)(v16 + 8 * v21), v22, v23, v24, v25);
          }
          if (v26) {
            -[NSSQLSavePlan _addFileBackedFutureToDelete:](a1, v26);
          }
        }
        ++v17;
        --v14;
      }
      while (v14);
    }
  }
  else
  {
    [0 propertiesByName];
    __break(1u);
  }
}

- (id)newObjectsForExhaustiveLockConflictDetection
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = *(void **)(a1 + 8);
  if (v2) {
    unint64_t v2 = (void *)[v2 persistentStoreRequest];
  }
  uint64_t v3 = (void *)[v2 updatedObjects];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count]) {
      uint64_t v4 = (void *)[v4 mutableCopy];
    }
    else {
      uint64_t v4 = 0;
    }
  }
  uint64_t v5 = *(void **)(a1 + 8);
  if (v5) {
    uint64_t v5 = (void *)[v5 persistentStoreRequest];
  }
  uint64_t v6 = (void *)[v5 deletedObjects];
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 count])
    {
      if (v4) {
        [v4 unionSet:v7];
      }
      else {
        uint64_t v4 = (void *)[v7 mutableCopy];
      }
    }
  }
  uint64_t v8 = *(void **)(a1 + 8);
  if (v8) {
    uint64_t v8 = (void *)[v8 persistentStoreRequest];
  }
  id v9 = (void *)[v8 lockedObjects];
  if (v9)
  {
    id v10 = v9;
    if ([v9 count])
    {
      if (v4)
      {
        [v4 unionSet:v10];
        return v4;
      }
      uint64_t v4 = (void *)[v10 mutableCopy];
    }
  }
  if (v4) {
    return v4;
  }
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA80];

  return objc_alloc_init(v12);
}

- (id)newObjectsForUniquenessConflictDetectionGivenReportedFailures:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([a2 count])
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(a2);
          }
          uint64_t v9 = *(void *)(a1 + 8);
          if (v9 && (uint64_t v10 = *(void *)(v9 + 32)) != 0) {
            id v11 = _PFRetainedObjectIDCore(v10, *(void **)(*((void *)&v34 + 1) + 8 * v8), 0, 1);
          }
          else {
            id v11 = 0;
          }
          [v4 addObject:v11];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v12 = [a2 countByEnumeratingWithState:&v34 objects:v40 count:16];
        uint64_t v6 = v12;
      }
      while (v12);
    }
  }
  else
  {
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    unint64_t v13 = *(void **)(a1 + 8);
    if (v13) {
      unint64_t v13 = (void *)[v13 persistentStoreRequest];
    }
    uint64_t v14 = (void *)[v13 updatedObjects];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          [v4 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v16);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = *(void **)(a1 + 8);
    if (v19) {
      id v19 = objc_msgSend(v19, "persistentStoreRequest", (void)v26);
    }
    uint64_t v20 = objc_msgSend(v19, "insertedObjects", (void)v26);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [v4 addObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v22);
    }
  }
  return v4;
}

@end