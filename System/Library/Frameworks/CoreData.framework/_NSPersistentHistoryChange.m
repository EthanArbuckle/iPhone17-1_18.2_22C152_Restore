@interface _NSPersistentHistoryChange
+ (BOOL)supportsSecureCoding;
+ (CFMutableSetRef)_updatedPropertiesForEntity:(void *)a3 andData:;
+ (id)_mergeOldMask:(void *)a3 andNewMask:;
+ (void)_dataMaskForEntity:(const __CFBitVector *)a3 andDeltaMask:;
+ (void)_propertyDataForEntity:(void *)a3 withSetOfPropertyNames:;
- (_NSPersistentHistoryChange)initWithCoder:(id)a3;
- (_NSPersistentHistoryChange)initWithDictionary:(id)a3 andChangeObjectID:(id)a4;
- (_NSPersistentHistoryChange)initWithManagedObject:(id)a3;
- (id)_backingObjectID;
- (id)changedObjectID;
- (id)tombstone;
- (id)transaction;
- (id)updatedProperties;
- (int64_t)changeID;
- (int64_t)changeType;
- (void)_setTransaction:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryChange

- (void)dealloc
{
  self->_changedObjectID = 0;
  self->_tombstone = 0;

  self->_columns = 0;
  self->_sqlEntity = 0;

  self->_backingObjectID = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryChange;
  [(_NSPersistentHistoryChange *)&v3 dealloc];
}

+ (void)_dataMaskForEntity:(const __CFBitVector *)a3 andDeltaMask:
{
  v31[1] = *MEMORY[0x1E4F143B8];
  self;
  v5 = (void *)[a2 foreignKeyColumns];
  v6 = (void *)[a2 foreignEntityKeyColumns];
  v7 = (void *)[a2 foreignOrderKeyColumns];
  v8 = (void *)[a2 attributeColumns];
  v9 = (void *)[a2 toManyRelationships];
  v10 = (void *)[a2 manyToManyRelationships];
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v7 count] + v11;
  uint64_t v13 = [v6 count];
  uint64_t v14 = v12 + v13 + [v5 count];
  uint64_t v15 = [v9 count];
  uint64_t v16 = [v10 count];
  CFIndex v17 = v14 + v15 + v16;
  MEMORY[0x1F4188790](v16);
  v19 = (const UInt8 *)v31 - v18;
  bzero((char *)v31 - v18, v20);
  CFIndex Count = CFBitVectorGetCount(a3);
  CFIndex v22 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  CFIndex v23 = Count;
  CFIndex v24 = 0;
  char v25 = 0;
  do
  {
    while (CFBitVectorGetBitAtIndex(a3, v24))
    {
      char v25 = 1;
      v19[v24 >> 3] |= 1 << (~(_BYTE)v24 & 7);
      if (v22 == v24++) {
        goto LABEL_10;
      }
    }
    ++v24;
  }
  while (v23 != v24);
  if ((v25 & 1) == 0) {
    return 0;
  }
LABEL_10:
  CFBitVectorRef v27 = CFBitVectorCreate(0, v19, v17);
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(unint64_t)(v17 + 7) >> 3];
  v29 = (UInt8 *)[v28 mutableBytes];
  v32.location = 0;
  v32.length = v17;
  CFBitVectorGetBits(v27, v32, v29);
  CFRelease(v27);
  return v28;
}

- (void)_setTransaction:(id)a3
{
  self->_transaction = (NSPersistentHistoryTransaction *)a3;
}

+ (void)_propertyDataForEntity:(void *)a3 withSetOfPropertyNames:
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  self;
  v5 = (void *)[a2 foreignKeyColumns];
  v6 = (void *)[a2 foreignEntityKeyColumns];
  v7 = (void *)[a2 foreignOrderKeyColumns];
  v8 = (void *)[a2 attributeColumns];
  v9 = (void *)[a2 toManyRelationships];
  v10 = (void *)[a2 manyToManyRelationships];
  id v65 = v8;
  uint64_t v11 = [v8 count];
  id v64 = v7;
  uint64_t v12 = [v7 count] + v11;
  id v63 = v6;
  uint64_t v13 = [v6 count];
  uint64_t v14 = v12 + v13 + [v5 count];
  id v66 = v9;
  uint64_t v15 = [v9 count];
  id v62 = v10;
  uint64_t v16 = [v10 count];
  CFIndex v61 = v14 + v15 + v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (const UInt8 *)&v61 - v17;
  bzero((char *)&v61 - v17, v19);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v20 = [v5 countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    int v22 = 0;
    uint64_t v23 = *(void *)v88;
    do
    {
      uint64_t v24 = 0;
      int v25 = v22;
      do
      {
        if (*(void *)v88 != v23) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * v24), "toOneRelationship", v61), "name")))v18[(v25 + v24) >> 3] |= 1 << (~(v25 + v24) & 7); {
        ++v24;
        }
      }
      while (v21 != v24);
      uint64_t v21 = [v5 countByEnumeratingWithState:&v87 objects:v96 count:16];
      int v22 = v25 + v24;
    }
    while (v21);
    int v26 = v25 + v24;
  }
  else
  {
    int v26 = 0;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v27 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v95, 16, v61);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v84;
    do
    {
      uint64_t v30 = 0;
      int v31 = v26;
      id v32 = v63;
      do
      {
        if (*(void *)v84 != v29) {
          objc_enumerationMutation(v32);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * v30), "toOneRelationship"), "name")))v18[(v31 + v30) >> 3] |= 1 << (~(v31 + v30) & 7); {
        ++v30;
        }
      }
      while (v28 != v30);
      uint64_t v28 = [v32 countByEnumeratingWithState:&v83 objects:v95 count:16];
      int v26 = v31 + v30;
    }
    while (v28);
    int v26 = v31 + v30;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v33 = [v64 countByEnumeratingWithState:&v79 objects:v94 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v80;
    do
    {
      uint64_t v36 = 0;
      int v37 = v26;
      id v38 = v64;
      do
      {
        if (*(void *)v80 != v35) {
          objc_enumerationMutation(v38);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * v36), "toOneRelationship"), "name")))v18[(v37 + v36) >> 3] |= 1 << (~(v37 + v36) & 7); {
        ++v36;
        }
      }
      while (v34 != v36);
      uint64_t v34 = [v38 countByEnumeratingWithState:&v79 objects:v94 count:16];
      int v26 = v37 + v36;
    }
    while (v34);
    int v26 = v37 + v36;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v39 = [v65 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v76;
    do
    {
      uint64_t v42 = 0;
      int v43 = v26;
      id v44 = v65;
      do
      {
        if (*(void *)v76 != v41) {
          objc_enumerationMutation(v44);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * v42), "name")))v18[(v43 + v42) >> 3] |= 1 << (~(v43 + v42) & 7); {
        ++v42;
        }
      }
      while (v40 != v42);
      uint64_t v40 = [v44 countByEnumeratingWithState:&v75 objects:v93 count:16];
      int v26 = v43 + v42;
    }
    while (v40);
    int v26 = v43 + v42;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v45 = [v66 countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v72;
    do
    {
      uint64_t v48 = 0;
      int v49 = v26;
      id v50 = v66;
      do
      {
        if (*(void *)v72 != v47) {
          objc_enumerationMutation(v50);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * v48), "name")))v18[(v49 + v48) >> 3] |= 1 << (~(v49 + v48) & 7); {
        ++v48;
        }
      }
      while (v46 != v48);
      uint64_t v46 = [v50 countByEnumeratingWithState:&v71 objects:v92 count:16];
      int v26 = v49 + v48;
    }
    while (v46);
    int v26 = v49 + v48;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v51 = v62;
  uint64_t v52 = [v62 countByEnumeratingWithState:&v67 objects:v91 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v68 != v54) {
          objc_enumerationMutation(v51);
        }
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "name")))v18[(v26 + i) >> 3] |= 1 << (~(v26 + i) & 7); {
      }
        }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v67 objects:v91 count:16];
      v26 += i;
    }
    while (v53);
  }
  CFIndex v56 = v61;
  CFBitVectorRef v57 = CFBitVectorCreate(0, v18, v61);
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(unint64_t)(v56 + 7) >> 3];
  v59 = (UInt8 *)[v58 mutableBytes];
  v98.location = 0;
  v98.length = v56;
  CFBitVectorGetBits(v57, v98, v59);
  CFRelease(v57);
  return v58;
}

+ (id)_mergeOldMask:(void *)a3 andNewMask:
{
  self;
  uint64_t v5 = [a2 bytes];
  uint64_t v6 = [a3 bytes];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if ([a2 length])
  {
    unint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      if ([a3 length] <= v8) {
        break;
      }
      char v12 = *(unsigned char *)(v6 + v8) | *(unsigned char *)(v5 + v8);
      [v7 appendBytes:&v12 length:1];
      unint64_t v8 = v9;
    }
    while ([a2 length] > (unint64_t)v9++);
  }
  return v7;
}

- (_NSPersistentHistoryChange)initWithDictionary:(id)a3 andChangeObjectID:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  if (a4 && v7)
  {
    uint64_t v8 = [a4 _referenceData64];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"CHANGETYPE"), "unsignedIntegerValue");
    v116 = (void *)[a3 valueForKey:@"COLUMNS"];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"ENTITY"), "unsignedLongValue");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"ENTITYPK"), "longLongValue");
    char v12 = (__CFString *)[a4 persistentStore];
    uint64_t v13 = v12;
    int64_t v115 = v8;
    v118 = self;
    uint64_t v113 = v11;
    uint64_t v114 = v10;
    if (!v12 || (v10 ? (BOOL v14 = v11 < 1) : (BOOL v14 = 1), v14))
    {
      uint64_t v43 = [NSString stringWithUTF8String:"Unexpectedly nil entry in: entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
      id v44 = (void *)[(__CFString *)v13 model];
      if (v44) {
        id v44 = (void *)v44[4];
      }
      [v44 valueForKey:@"name"];
      uint64_t v45 = (void *)[(__CFString *)v13 model];
      if (v45) {
        uint64_t v45 = (void *)v45[4];
      }
      [v45 valueForKey:@"entityID"];
      if (v13) {
        uint64_t v52 = v13;
      }
      else {
        uint64_t v52 = @"<null>";
      }
      _NSCoreDataLog(17, v43, v46, v47, v48, v49, v50, v51, 0);
      uint64_t v53 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_58;
      }
      uint64_t v54 = (void *)[(__CFString *)v13 model];
      if (v54) {
        uint64_t v54 = (void *)v54[4];
      }
      uint64_t v55 = [v54 valueForKey:@"name"];
      if (v55) {
        CFIndex v56 = (__CFString *)v55;
      }
      else {
        CFIndex v56 = @"<null>";
      }
      CFBitVectorRef v57 = (void *)[(__CFString *)v13 model];
      if (v57) {
        CFBitVectorRef v57 = (void *)v57[4];
      }
      uint64_t v58 = [v57 valueForKey:@"entityID"];
      *(_DWORD *)buf = 138413570;
      if (v58) {
        v59 = (__CFString *)v58;
      }
      else {
        v59 = @"<null>";
      }
      v122 = 0;
      __int16 v123 = 2048;
      uint64_t v124 = v10;
      __int16 v125 = 2048;
      uint64_t v126 = v11;
      __int16 v127 = 2112;
      v128 = v56;
      __int16 v129 = 2112;
      v130 = v59;
      __int16 v131 = 2112;
      v132 = v52;
      v60 = "CoreData: Unexpectedly nil entry in: entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@";
      CFIndex v61 = v53;
      uint32_t v62 = 62;
    }
    else
    {
      uint64_t v15 = objc_msgSend((id)-[__CFString model](v12, "model"), "entityForID:", v10);
      if (v15)
      {
        v117 = (void *)v15;
        uint64_t v112 = [(__CFString *)v13 newObjectIDForEntity:v15 pk:v11];
        if (!v112)
        {
          uint64_t v16 = [NSString stringWithUTF8String:"Unexpected change - objectID failed for entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
          uint64_t v17 = (void *)[(__CFString *)v13 model];
          if (v17) {
            uint64_t v17 = (void *)v17[4];
          }
          uint64_t v18 = [v17 valueForKey:@"name"];
          if (v18) {
            size_t v19 = (__CFString *)v18;
          }
          else {
            size_t v19 = @"<null>";
          }
          uint64_t v20 = (void *)[(__CFString *)v13 model];
          if (v20) {
            uint64_t v20 = (void *)v20[4];
          }
          uint64_t v21 = [v20 valueForKey:@"entityID"];
          if (v21) {
            uint64_t v28 = (__CFString *)v21;
          }
          else {
            uint64_t v28 = @"<null>";
          }
          v110 = v28;
          v111 = v13;
          uint64_t v108 = v11;
          v109 = v19;
          _NSCoreDataLog(17, v16, v22, v23, v24, v25, v26, v27, (uint64_t)v117);
          uint64_t v29 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v101 = (void *)[(__CFString *)v13 model];
            if (v101) {
              v101 = (void *)v101[4];
            }
            uint64_t v102 = [v101 valueForKey:@"name"];
            if (v102) {
              v103 = (__CFString *)v102;
            }
            else {
              v103 = @"<null>";
            }
            v104 = (void *)[(__CFString *)v13 model];
            if (v104) {
              v104 = (void *)v104[4];
            }
            uint64_t v105 = [v104 valueForKey:@"entityID"];
            *(_DWORD *)buf = 138413570;
            if (v105) {
              v106 = (__CFString *)v105;
            }
            else {
              v106 = @"<null>";
            }
            v122 = v117;
            __int16 v123 = 2048;
            uint64_t v124 = v10;
            __int16 v125 = 2048;
            uint64_t v126 = v11;
            __int16 v127 = 2112;
            v128 = v103;
            __int16 v129 = 2112;
            v130 = v106;
            __int16 v131 = 2112;
            v132 = v13;
            _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Unexpected change - objectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@", buf, 0x3Eu);
          }
        }
        if (v9 == 2)
        {
          id v30 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, v117);
          if ([v30 count])
          {
            int v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v30, "count"));
            if ([v30 count])
            {
              unint64_t v32 = 0;
              do
              {
                uint64_t v33 = [NSString stringWithFormat:@"%@%lu", @"TOMBSTONE", v32, v108, v109, v110, v111];
                uint64_t v34 = [a3 objectForKey:v33];
                if (v34 != NSKeyValueCoding_NullValue)
                {
                  uint64_t v35 = [a3 objectForKey:v33];
                  if (v35) {
                    objc_msgSend(v31, "setObject:forKey:", v35, objc_msgSend(v30, "objectAtIndexedSubscript:", v32));
                  }
                }
                ++v32;
              }
              while (v32 < [v30 count]);
            }
            if (![v31 count])
            {

              int v31 = 0;
            }
          }
          else
          {
            int v31 = 0;
          }
          long long v74 = (void *)v112;

          int v73 = 1;
        }
        else
        {
          int v31 = 0;
          int v73 = 1;
          long long v74 = (void *)v112;
        }
        goto LABEL_59;
      }
      uint64_t v63 = [NSString stringWithUTF8String:"Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@"];
      id v64 = (void *)[(__CFString *)v13 model];
      if (v64) {
        id v64 = (void *)v64[4];
      }
      [v64 valueForKey:@"name"];
      id v65 = (void *)[(__CFString *)v13 model];
      if (v65) {
        id v65 = (void *)v65[4];
      }
      [v65 valueForKey:@"entityID"];
      _NSCoreDataLog(17, v63, v66, v67, v68, v69, v70, v71, v10);
      uint64_t v72 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_58:
        int v73 = 0;
        long long v74 = 0;
        v117 = 0;
        int v31 = 0;
LABEL_59:
        long long v75 = v74;
        if (!objc_opt_class())
        {
          uint64_t v76 = [NSString stringWithUTF8String:"Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
          long long v77 = (void *)[(__CFString *)v13 model];
          if (v77) {
            long long v77 = (void *)v77[4];
          }
          [v77 valueForKey:@"name"];
          long long v78 = (void *)[(__CFString *)v13 model];
          if (v78) {
            long long v78 = (void *)v78[4];
          }
          [v78 valueForKey:@"entityID"];
          if (v13) {
            long long v85 = v13;
          }
          else {
            long long v85 = @"<null>";
          }
          _NSCoreDataLog(17, v76, v79, v80, v81, v82, v83, v84, (uint64_t)v117);
          long long v86 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            long long v89 = (void *)[(__CFString *)v13 model];
            if (v89) {
              long long v89 = (void *)v89[4];
            }
            uint64_t v90 = [v89 valueForKey:@"name"];
            if (v90) {
              v91 = (__CFString *)v90;
            }
            else {
              v91 = @"<null>";
            }
            v92 = (void *)[(__CFString *)v13 model];
            if (v92) {
              v92 = (void *)v92[4];
            }
            uint64_t v93 = [v92 valueForKey:@"entityID"];
            *(_DWORD *)buf = 138413570;
            if (v93) {
              v94 = (__CFString *)v93;
            }
            else {
              v94 = @"<null>";
            }
            v122 = v117;
            __int16 v123 = 2048;
            uint64_t v124 = v114;
            __int16 v125 = 2048;
            uint64_t v126 = v113;
            __int16 v127 = 2112;
            v128 = v91;
            __int16 v129 = 2112;
            v130 = v94;
            __int16 v131 = 2112;
            v132 = v85;
            _os_log_fault_impl(&dword_18AB82000, v86, OS_LOG_TYPE_FAULT, "CoreData: Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@", buf, 0x3Eu);
          }
        }
        v119.receiver = v118;
        v119.super_class = (Class)_NSPersistentHistoryChange;
        long long v87 = [(_NSPersistentHistoryChange *)&v119 init];
        uint64_t v42 = v87;
        if (v87)
        {
          v87->_changeID = v115;
          v87->_changedObjectID = (NSManagedObjectID *)v75;
          v42->_changeType = v9;
          if (v31) {
            v42->_tombstone = (NSDictionary *)v31;
          }
          if (v116) {
            v42->_columns = (NSData *)v116;
          }
          if (v73) {
            v42->_sqlEntity = (NSSQLEntity *)v117;
          }
          v42->_backingObjectID = (NSManagedObjectID *)a4;
        }

        return v42;
      }
      v95 = (void *)[(__CFString *)v13 model];
      if (v95) {
        v95 = (void *)v95[4];
      }
      uint64_t v96 = [v95 valueForKey:@"name"];
      if (v96) {
        uint64_t v97 = (__CFString *)v96;
      }
      else {
        uint64_t v97 = @"<null>";
      }
      CFRange v98 = (void *)[(__CFString *)v13 model];
      if (v98) {
        CFRange v98 = (void *)v98[4];
      }
      uint64_t v99 = [v98 valueForKey:@"entityID"];
      *(_DWORD *)buf = 134218754;
      if (v99) {
        v100 = (__CFString *)v99;
      }
      else {
        v100 = @"<null>";
      }
      v122 = (void *)v10;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v97;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v100;
      __int16 v127 = 2112;
      v128 = v13;
      v60 = "CoreData: Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@";
      CFIndex v61 = v72;
      uint32_t v62 = 42;
    }
    _os_log_fault_impl(&dword_18AB82000, v61, OS_LOG_TYPE_FAULT, v60, buf, v62);
    goto LABEL_58;
  }
  v120.receiver = self;
  v120.super_class = (Class)_NSPersistentHistoryChange;
  uint64_t v42 = [(_NSPersistentHistoryChange *)&v120 init];
  if (v42) {
    _NSCoreDataLog(1, @"_NSPersistentHistoryChange was created with an empty changeDictionary or changeObjectID", v36, v37, v38, v39, v40, v41, v107);
  }
  return v42;
}

- (id)changedObjectID
{
  return self->_changedObjectID;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (id)updatedProperties
{
  columns = self->_columns;
  if (!columns) {
    return 0;
  }
  sqlEntity = self->_sqlEntity;
  if (!sqlEntity) {
    return 0;
  }
  CFMutableSetRef v4 = +[_NSPersistentHistoryChange _updatedPropertiesForEntity:andData:]((uint64_t)_NSPersistentHistoryChange, sqlEntity, columns);

  return v4;
}

+ (CFMutableSetRef)_updatedPropertiesForEntity:(void *)a3 andData:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = (void *)[a2 foreignKeyColumns];
  uint64_t v6 = (void *)[a2 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[a2 foreignOrderKeyColumns];
  uint64_t v8 = (void *)[a2 attributeColumns];
  uint64_t v9 = (void *)[a2 toManyRelationships];
  uint64_t v10 = (void *)[a2 manyToManyRelationships];
  id v65 = v8;
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v7 count];
  uint64_t v13 = [v6 count];
  uint64_t v14 = [v5 count];
  uint64_t v66 = v9;
  uint64_t v15 = [v9 count];
  uint64_t v67 = v10;
  unint64_t v16 = v12 + v11 + v13 + v14 + v15 + [v10 count];
  if (v16 > 8 * [a3 length]) {
    return 0;
  }
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFBitVectorRef v18 = CFBitVectorCreate(0, (const UInt8 *)[a3 bytes], v16);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v19)
  {
    int v20 = 0;
    uint64_t v21 = *(void *)v89;
    do
    {
      uint64_t v22 = 0;
      int v23 = v20;
      do
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = *(void **)(*((void *)&v88 + 1) + 8 * v22);
        if (CFBitVectorGetBitAtIndex(v18, (v23 + v22)))
        {
          uint64_t v25 = (void *)[v24 toOneRelationship];
          if (v25)
          {
            uint64_t v26 = [v25 propertyDescription];
            if (v26) {
              [(__CFSet *)Mutable addObject:v26];
            }
          }
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v88 objects:v97 count:16];
      int v20 = v23 + v22;
    }
    while (v19);
    LODWORD(v19) = v23 + v22;
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v27 = [v6 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v85;
    do
    {
      uint64_t v30 = 0;
      int v31 = v19;
      do
      {
        if (*(void *)v85 != v29) {
          objc_enumerationMutation(v6);
        }
        unint64_t v32 = *(void **)(*((void *)&v84 + 1) + 8 * v30);
        if (CFBitVectorGetBitAtIndex(v18, (v31 + v30)))
        {
          uint64_t v33 = (void *)[v32 toOneRelationship];
          if (v33)
          {
            uint64_t v34 = [v33 propertyDescription];
            if (v34) {
              [(__CFSet *)Mutable addObject:v34];
            }
          }
        }
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v6 countByEnumeratingWithState:&v84 objects:v96 count:16];
      LODWORD(v19) = v31 + v30;
    }
    while (v28);
    LODWORD(v19) = v31 + v30;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v35 = [v7 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v81;
    do
    {
      uint64_t v38 = 0;
      int v39 = v19;
      do
      {
        if (*(void *)v81 != v37) {
          objc_enumerationMutation(v7);
        }
        uint64_t v40 = *(void **)(*((void *)&v80 + 1) + 8 * v38);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v38)))
        {
          uint64_t v41 = (void *)[v40 toOneRelationship];
          if (v41)
          {
            uint64_t v42 = [v41 propertyDescription];
            if (v42) {
              [(__CFSet *)Mutable addObject:v42];
            }
          }
        }
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v7 countByEnumeratingWithState:&v80 objects:v95 count:16];
      LODWORD(v19) = v19 + v38;
    }
    while (v36);
    LODWORD(v19) = v39 + v38;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v43 = [v65 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v77;
    do
    {
      uint64_t v46 = 0;
      int v47 = v19;
      do
      {
        if (*(void *)v77 != v45) {
          objc_enumerationMutation(v65);
        }
        uint64_t v48 = *(void **)(*((void *)&v76 + 1) + 8 * v46);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v46))) {
          -[__CFSet addObject:](Mutable, "addObject:", [v48 attributeDescription]);
        }
        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [v65 countByEnumeratingWithState:&v76 objects:v94 count:16];
      LODWORD(v19) = v19 + v46;
    }
    while (v44);
    LODWORD(v19) = v47 + v46;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v49 = [v66 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v73;
    do
    {
      uint64_t v52 = 0;
      int v53 = v19;
      do
      {
        if (*(void *)v73 != v51) {
          objc_enumerationMutation(v66);
        }
        uint64_t v54 = *(void **)(*((void *)&v72 + 1) + 8 * v52);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v52)))
        {
          if (v54) {
            uint64_t v55 = [v54 propertyDescription];
          }
          else {
            uint64_t v55 = 0;
          }
          [(__CFSet *)Mutable addObject:v55];
        }
        ++v52;
      }
      while (v50 != v52);
      uint64_t v56 = [v66 countByEnumeratingWithState:&v72 objects:v93 count:16];
      uint64_t v50 = v56;
      LODWORD(v19) = v19 + v52;
    }
    while (v56);
    LODWORD(v19) = v53 + v52;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v57 = [v67 countByEnumeratingWithState:&v68 objects:v92 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v69;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(v67);
        }
        CFIndex v61 = *(void **)(*((void *)&v68 + 1) + 8 * v60);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v60)))
        {
          if (v61) {
            uint64_t v62 = [v61 propertyDescription];
          }
          else {
            uint64_t v62 = 0;
          }
          [(__CFSet *)Mutable addObject:v62];
        }
        ++v60;
      }
      while (v58 != v60);
      uint64_t v63 = [v67 countByEnumeratingWithState:&v68 objects:v92 count:16];
      uint64_t v58 = v63;
      LODWORD(v19) = v19 + v60;
    }
    while (v63);
  }
  CFRelease(v18);
  return Mutable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryChange)initWithManagedObject:(id)a3
{
  if (a3 && (uint64_t v5 = *((void *)a3 + 6)) != 0) {
    uint64_t v6 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  if ([v6 valueForKey:@"CHANGETYPE"] && objc_msgSend(a3, "objectID"))
  {
    uint64_t v7 = [_NSPersistentHistoryChange alloc];
    uint64_t v8 = [a3 objectID];
    return [(_NSPersistentHistoryChange *)v7 initWithDictionary:v6 andChangeObjectID:v8];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_NSPersistentHistoryChange;
    unint64_t v16 = [(_NSPersistentHistoryChange *)&v17 init];
    if (v16) {
      _NSCoreDataLog(1, @"_NSPersistentHistoryChange was created with an empty MO - %@", v10, v11, v12, v13, v14, v15, (uint64_t)a3);
    }
    return v16;
  }
}

- (_NSPersistentHistoryChange)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_NSPersistentHistoryChange;
  CFMutableSetRef v4 = [(_NSPersistentHistoryChange *)&v8 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x18C127630]();
    v4->_changedObjectID = (NSManagedObjectID *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines xpcStoreArchiverObjectIDClassesForSecureCoding]() forKey:@"NSPersistentHistoryChangeObjectID"];
    v4->_changeID = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSPersistentHistoryChangeID"), "longLongValue");
    v4->_changeType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSPersistentHistoryChangeType"), "integerValue");
    v4->_tombstone = (NSDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines attributeClassesForSecureCoding]() forKey:@"NSPersistentHistoryChangeTombstone"];
    v4->_columns = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryChangeColumn"];
    changedObjectID = v4->_changedObjectID;
    if (changedObjectID) {
      v4->_sqlEntity = (NSSQLEntity *)(id)_sqlEntityForEntityDescription([(NSPersistentStore *)[(NSManagedObjectID *)changedObjectID persistentStore] model], (void *)[(NSManagedObjectID *)v4->_changedObjectID entity]);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x18C127630](self, a2);
  [a3 encodeObject:self->_changedObjectID forKey:@"NSPersistentHistoryChangeObjectID"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_changeID), @"NSPersistentHistoryChangeID");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_changeType), @"NSPersistentHistoryChangeType");
  [a3 encodeObject:self->_tombstone forKey:@"NSPersistentHistoryChangeTombstone"];
  [a3 encodeObject:self->_transaction forKey:@"NSPersistentHistoryChangeTransaction"];
  [a3 encodeObject:self->_columns forKey:@"NSPersistentHistoryChangeColumn"];
}

- (id)tombstone
{
  return self->_tombstone;
}

- (id)transaction
{
  return self->_transaction;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

@end