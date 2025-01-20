@interface _PFResultObject
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFResultObject)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (_PFResultObject)retain;
- (__CFString)stringFromPtr:(void *)a1;
- (__CFString)taggedStringFromPtr:(__CFString *)result withLength:(char *)__s;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)_setParentBuffer:(id)a3;
- (void)dataFromPtr:(uint64_t)a1;
- (void)release;
@end

@implementation _PFResultObject

- (id)valueAtIndex:(unint64_t)a3
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x18C127630]();
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    resultSet = parent_buffer->_resultSet;
  }
  else {
    resultSet = 0;
  }
  $832F591C28F8B7CE1ACC7DCBC97655CC var7 = resultSet->var7;
  if ((*(unsigned char *)&var7 & 0x10) != 0)
  {
    if ((*(unsigned char *)&var7 & 0x40) != 0)
    {
      v42 = @"%@: backing buffer has been purged";
    }
    else
    {
      if ((*(unsigned char *)&var7 & 0x20) == 0) {
        goto LABEL_4;
      }
      v42 = @"%@: backing buffer can be purged";
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v42, _NSMethodExceptionProem());
    goto LABEL_29;
  }
LABEL_4:
  if (parent_buffer) {
    metadata = parent_buffer->_metadata;
  }
  else {
    metadata = 0;
  }
  v10 = [(NSKnownKeysDictionary *)metadata mapping];
  if ([(NSKnownKeysMappingStrategy *)v10 length] <= a3) {
    goto LABEL_29;
  }
  v11 = self + 1;
  unint64_t v12 = *((void *)&self[1].super.super.isa + a3);
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v13 = 0;
  if (a3)
  {
    v14 = self + 1;
    unint64_t v15 = a3;
    do
    {
      Class isa = v14->super.super.isa;
      v14 = (_PFResultObject *)((char *)v14 + 8);
      v13 += (uint64_t)isa;
      --v15;
    }
    while (v15);
  }
  uint64_t v115 = [(NSKnownKeysMappingStrategy *)v10 length];
  id v17 = [(NSKnownKeysDictionary *)metadata valueAtIndex:a3];
  if (a3 < 6 || self->_sql_entity_id != 16001) {
    goto LABEL_22;
  }
  if (!self[1]._primary_key)
  {
LABEL_29:
    return 0;
  }
  uint64_t v18 = vaddvq_s64(vaddq_s64(*(int64x2_t *)&self[1]._cd_rc, *(int64x2_t *)&self[1].super.super.isa));
  uint64_t v19 = *(void *)(((unint64_t)&v11->super.super.isa
                   + 8 * [(NSKnownKeysMappingStrategy *)v10 length]
                   + v18
                   + 7) & 0xFFFFFFFFFFFFFFF8);
  v20 = self->_parent_buffer;
  unint64_t v113 = v12;
  v114 = v5;
  if (v20 && (weakRequestStore = v20->_weakRequestStore) != 0) {
    id WeakRetained = objc_loadWeakRetained(&weakRequestStore->_object);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v23 = objc_msgSend((id)objc_msgSend(WeakRetained, "model"), "entityForID:", v19);
  id v24 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]((uint64_t)_PFPersistentHistoryModel, (void *)v23);
  int v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "name"), "stringByReplacingOccurrencesOfString:withString:", @"TOMBSTONE", &stru_1ED787880), "intValue");
  if (v25 < (int)[v24 count])
  {
    uint64_t v26 = [v24 objectAtIndexedSubscript:v25];
    if (v23) {
      v27 = (void *)[*(id *)(v23 + 40) objectForKey:v26];
    }
    else {
      v27 = 0;
    }
    id v17 = (id)[v27 propertyDescription];
  }

  unint64_t v12 = v113;
  v5 = v114;
LABEL_22:
  v34 = (unsigned int *)(((unint64_t)&v11->super.super.isa + 8 * v115 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  switch([v17 _propertyType])
  {
    case 2:
    case 6:
      uint64_t v41 = [v17 attributeType];
      goto LABEL_31;
    case 4:
      goto LABEL_64;
    case 5:
      uint64_t v41 = [v17 expressionResultType];
      if (v41)
      {
LABEL_31:
        if (v41 <= 799)
        {
          if (v41 > 399)
          {
            if (v41 <= 599)
            {
              if (v41 != 400)
              {
                if (v41 != 500) {
                  goto LABEL_45;
                }
                goto LABEL_84;
              }
              if (v12 > 0x1F) {
                v92 = -[_PFResultObject stringFromPtr:](self, v34);
              }
              else {
                v92 = -[_PFResultObject taggedStringFromPtr:withLength:]((__CFString *)self, (char *)v34);
              }
              v94 = v92;
              v95 = (objc_class *)MEMORY[0x1E4F28C28];
              goto LABEL_118;
            }
            if (v41 == 600)
            {
LABEL_84:
              v46 = (__CFString *)[NSNumber numberWithDouble:*(double *)v34];
              goto LABEL_105;
            }
            if (v41 == 700)
            {
              if (v12 > 0x1F) {
                v46 = -[_PFResultObject stringFromPtr:](self, v34);
              }
              else {
                v46 = -[_PFResultObject taggedStringFromPtr:withLength:]((__CFString *)self, (char *)v34);
              }
              goto LABEL_105;
            }
            goto LABEL_45;
          }
          if (v41 != 100 && v41 != 200)
          {
            if (v41 != 300) {
              goto LABEL_45;
            }
            v46 = (__CFString *)[NSNumber numberWithLongLong:*(void *)v34];
LABEL_105:
            v45 = v46;
            goto LABEL_106;
          }
LABEL_55:
          v46 = (__CFString *)[NSNumber numberWithInt:*v34];
          goto LABEL_105;
        }
        if (v41 <= 1099)
        {
          if (v41 == 800) {
            goto LABEL_55;
          }
          if (v41 == 900)
          {
            v93 = (__CFString *)CFDateCreate(0, *(CFAbsoluteTime *)v34);
            goto LABEL_122;
          }
          if (v41 != 1000) {
            goto LABEL_45;
          }
        }
        else
        {
          if (v41 <= 1799)
          {
            if (v41 != 1100)
            {
              if (v41 == 1200)
              {
                if (v12 > 0x1F) {
                  v44 = -[_PFResultObject stringFromPtr:](self, v34);
                }
                else {
                  v44 = -[_PFResultObject taggedStringFromPtr:withLength:]((__CFString *)self, (char *)v34);
                }
                v94 = v44;
                v95 = (objc_class *)MEMORY[0x1E4F1CB10];
LABEL_118:
                v93 = (__CFString *)[[v95 alloc] initWithString:v94];
                goto LABEL_122;
              }
LABEL_45:
              _NSCoreDataLog(1, @"Unsupported type for buffer allocated dictionary: %@", v35, v36, v37, v38, v39, v40, v41);
LABEL_46:
              v45 = 0;
              goto LABEL_123;
            }
            goto LABEL_74;
          }
          if (v41 != 1800)
          {
            if (v41 != 2000) {
              goto LABEL_45;
            }
            goto LABEL_64;
          }
        }
LABEL_74:
        v54 = -[_PFResultObject dataFromPtr:]((uint64_t)self, v34);
        v55 = v54;
        if (v41 != 1800)
        {
          if (v41 == 1100)
          {
            if ([v54 length] != 16) {
              goto LABEL_46;
            }
            v93 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v55, "bytes"));
            goto LABEL_122;
          }
          if (([v17 _isFileBackedFuture] & 1) == 0
            && (![v17 _storeBinaryDataExternally] || (*(unsigned char *)&resultSet->var7 & 2) != 0))
          {
            v93 = v55;
            goto LABEL_122;
          }
          v56 = self->_parent_buffer;
          if (v56 && (v57 = v56->_weakRequestStore) != 0) {
            id v58 = objc_loadWeakRetained(&v57->_object);
          }
          else {
            id v58 = 0;
          }
          if (*(unsigned char *)[v55 bytes] == 1)
          {
            v59 = [_PFExternalReferenceData alloc];
            uint64_t v60 = [v55 bytes];
            uint64_t v61 = [v55 length];
            if (v58) {
              uint64_t v62 = (*((_DWORD *)v58 + 50) >> 2) & 7;
            }
            else {
              uint64_t v62 = 0;
            }
            v63 = v59;
            uint64_t v64 = v60;
            uint64_t v65 = 0;
            uint64_t v66 = 0;
          }
          else
          {
            if (*(unsigned char *)[v55 bytes] == 3)
            {
              v96 = [_NSDataFileBackedFuture alloc];
              v97 = -[_NSDataFileBackedFuture initWithStoreMetadata:directory:](v96, "initWithStoreMetadata:directory:", v55, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(v58, "fileBackedFuturesDirectory"), 1));
LABEL_137:
              v45 = (__CFString *)v97;

              goto LABEL_123;
            }
            v98 = (const char *)([v55 bytes] + 1);
            uint64_t v99 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "stringWithFileSystemRepresentation:length:", v98, strnlen(v98, objc_msgSend(v55, "length") - 1));
            uint64_t v100 = objc_msgSend((id)objc_msgSend(v58, "externalDataReferencesDirectory"), "stringByAppendingPathComponent:", v99);
            if (v58)
            {
              if (!atomic_load((unint64_t *)v58 + 21)) {
                [v58 externalDataReferencesDirectory];
              }
              v102 = (void *)atomic_load((unint64_t *)v58 + 22);
              uint64_t v103 = [v102 stringByAppendingPathComponent:v99];
              if (objc_msgSend((id)objc_msgSend(v58, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey")&& !objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v100))
              {
                if (objc_msgSend((id)objc_msgSend(v58, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey")&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v100) & 1) == 0)
                {
                  id v106 = +[PFUbiquitySwitchboard ubiquitousExternalReferenceLocationForUUID:inStore:]((uint64_t)PFUbiquitySwitchboard, v99, v58);
                  v107 = [_PFExternalReferenceData alloc];
                  v108 = v5;
                  uint64_t v109 = [v55 bytes];
                  uint64_t v110 = [v55 length];
                  uint64_t v111 = v109;
                  v5 = v108;
                  v97 = [(_PFExternalReferenceData *)v107 initWithStoreBytes:v111 length:v110 externalLocation:v100 safeguardLocation:v103 protectionLevel:(*((_DWORD *)v58 + 50) >> 2) & 7 ubiquitousLocation:v106];
                }
                else
                {
                  v97 = v55;
                }
                goto LABEL_137;
              }
            }
            else
            {
              uint64_t v103 = [0 stringByAppendingPathComponent:v99];
            }
            v104 = [_PFExternalReferenceData alloc];
            uint64_t v105 = [v55 bytes];
            uint64_t v61 = [v55 length];
            if (v58) {
              uint64_t v62 = (*((_DWORD *)v58 + 50) >> 2) & 7;
            }
            else {
              uint64_t v62 = 0;
            }
            v63 = v104;
            uint64_t v64 = v105;
            uint64_t v65 = v100;
            uint64_t v66 = v103;
          }
          v97 = [(_PFExternalReferenceData *)v63 initWithStoreBytes:v64 length:v61 externalLocation:v65 safeguardLocation:v66 protectionLevel:v62];
          goto LABEL_137;
        }
        v93 = (__CFString *)+[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v54, v17);
LABEL_122:
        v45 = v93;
        goto LABEL_123;
      }
      [v17 expression];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_44:
        uint64_t v41 = 0;
        goto LABEL_45;
      }
LABEL_64:
      uint64_t v47 = *(void *)v34;
      uint64_t v48 = *((void *)v34 + 1);
      if (v47) {
        BOOL v49 = v48 == 0;
      }
      else {
        BOOL v49 = 1;
      }
      if (v49) {
        goto LABEL_102;
      }
      v50 = self->_parent_buffer;
      if (v50 && (v51 = v50->_weakRequestStore) != 0) {
        id v52 = objc_loadWeakRetained(&v51->_object);
      }
      else {
        id v52 = 0;
      }
      if (v47 < 16000)
      {
        uint64_t v53 = objc_msgSend((id)objc_msgSend(v52, "model"), "entityForID:", v47);
        if (v53)
        {
LABEL_104:
          v90 = (objc_class *)[v52 objectIDFactoryForSQLEntity:v53];

          v46 = (__CFString *)(id)[[v90 alloc] initWithPK64:v48];
          goto LABEL_105;
        }
        goto LABEL_101;
      }
      v67 = (void *)[v52 ancillarySQLModels];
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      uint64_t v68 = [v67 countByEnumeratingWithState:&v116 objects:v122 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v117;
        do
        {
          uint64_t v71 = 0;
          do
          {
            if (*(void *)v117 != v70) {
              objc_enumerationMutation(v67);
            }
            v72 = (unsigned int *)[v67 objectForKey:*(void *)(*((void *)&v116 + 1) + 8 * v71)];
            if (v72)
            {
              if (v47 <= v72[15]) {
                goto LABEL_95;
              }
              uint64_t v73 = v72[16];
            }
            else
            {
              uint64_t v73 = 0;
            }
            if (v47 <= v73)
            {
              uint64_t v74 = [v72 entityForID:v47];
              if (v74)
              {
                uint64_t v53 = v74;
                goto LABEL_104;
              }
            }
LABEL_95:
            ++v71;
          }
          while (v69 != v71);
          uint64_t v75 = [v67 countByEnumeratingWithState:&v116 objects:v122 count:16];
          uint64_t v69 = v75;
        }
        while (v75);
      }
      uint64_t v76 = [NSString stringWithUTF8String:"Unknown ancillary entityID - %lld"];
      _NSCoreDataLog(17, v76, v77, v78, v79, v80, v81, v82, v47);
      v83 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v121 = v47;
        _os_log_fault_impl(&dword_18AB82000, v83, OS_LOG_TYPE_FAULT, "CoreData: Unknown ancillary entityID - %lld", buf, 0xCu);
      }
LABEL_101:

      _NSCoreDataLog(1, @"BufferAllocations Result Object has an invalid Object ID", v84, v85, v86, v87, v88, v89, v112);
LABEL_102:
      v45 = 0;
LABEL_106:
      v91 = v45;
LABEL_123:
      return v45;
    default:
      _NSCoreDataLog(1, @"Unsupported property type: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v17);
      goto LABEL_44;
  }
}

- (__CFString)stringFromPtr:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v2 = a2;
  if (*a2 != -1)
  {
    if (!*a2)
    {
      v4 = (objc_class *)objc_opt_class();
      object_setClass(v2, v4);
    }
    v2[1] = a1;
    return (__CFString *)v2;
  }
  v6 = (const UInt8 *)a2 + +[_PFResultUniString bufferOffset];
  CFIndex v7 = *((unsigned int *)v2 + 4);
  v2[1] = a1;
  id v8 = a1;
  v9 = (__CFString *)CFStringCreateWithBytesNoCopy(0, v6, v7, 0x8000100u, 0, +[_PFResultUniString cfDeallocator]);

  return v9;
}

- (_PFResultObject)retain
{
  v3 = self->_parent_buffer;
  return self;
}

- (void)_setParentBuffer:(id)a3
{
  self->_parent_buffer = (_PFResultArray *)a3;
}

- (void)release
{
}

- (void)dataFromPtr:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = a2;
  if (!*a2)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v2, v4);
  }
  [v2 setParentObject:a1];
  return v2;
}

- (id)objectForKey:(id)a3
{
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    metadata = parent_buffer->_metadata;
  }
  else {
    metadata = 0;
  }
  uint64_t v6 = [(NSKnownKeysMappingStrategy *)[(NSKnownKeysDictionary *)metadata mapping] indexForKey:a3];

  return [(_PFResultObject *)self valueAtIndex:v6];
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self)
  {
    unint64_t v8 = self;
    if (!a3->var0) {
      a3->var2 = (unint64_t *)self;
    }
    a3->var1 = a4;
    uint64_t v9 = *(void *)(self + 8);
    if (v9) {
      v10 = *(void **)(v9 + 40);
    }
    else {
      v10 = 0;
    }
    v11 = (void *)[v10 mapping];
    unint64_t v12 = [v11 length];
    uint64_t v13 = [v11 keys];
    self = 0;
    unint64_t var0 = a3->var0;
    if (a5 && var0 < v12)
    {
      self = 0;
      do
      {
        if (*(void *)(v8 + 40 + 8 * var0)) {
          a4[self++] = *(id *)(v13 + 8 * var0);
        }
        ++var0;
      }
      while (var0 < v12 && self < a5);
    }
    a3->unint64_t var0 = var0;
  }
  return self;
}

- (_PFResultObject)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (__CFString)taggedStringFromPtr:(__CFString *)result withLength:(char *)__s
{
  if (!result) {
    return result;
  }
  v2 = result;
  result = *(__CFString **)__s;
  if (*(void *)__s == -1)
  {
    result = -[_PFResultObject stringFromPtr:](v2, __s);
    if (result) {
      return result;
    }
    goto LABEL_11;
  }
  if ((*(unsigned char *)(*(void *)(v2->info + 24) + 40) & 2) != 0)
  {
    int64_t v3 = strlen(__s);
    if (v3 > 7)
    {
      unint64_t v5 = 0;
    }
    else
    {
      int64_t v4 = v3;
      uint64_t v16 = 0;
      __memmove_chk();
      unint64_t v5 = (8 * v4) | (v16 << 7) | 0x8000000000000002;
      unint64_t v14 = *MEMORY[0x1E4FBA8E0] ^ v5;
      if ((~v14 & 0xC000000000000007) != 0) {
        unint64_t v5 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v14 & 7));
      }
    }
    result = (__CFString *)(id)v5;
  }
  if (!result)
  {
LABEL_11:
    uint64_t v6 = [NSString stringWithUTF8String:"Unexpected tagged string result"];
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v15);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unexpected tagged string result", (uint8_t *)&v15, 2u);
    }
    return 0;
  }
  return result;
}

- (unint64_t)retainCount
{
  return [(_PFResultArray *)self->_parent_buffer retainCount];
}

- (id)keyEnumerator
{
  int64_t v3 = [_PFResultObjectKeyEnumerator alloc];
  parent_buffer = self->_parent_buffer;
  if (parent_buffer) {
    metadata = parent_buffer->_metadata;
  }
  else {
    metadata = 0;
  }
  uint64_t v6 = [(NSKnownKeysMappingStrategy *)[(NSKnownKeysDictionary *)metadata mapping] keys];
  uint64_t v7 = self->_parent_buffer;
  if (v7) {
    uint64_t v8 = v7->_metadata;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = -[_PFResultObjectKeyEnumerator initWithArray:forTarget:withReferenceValues:andRange:](v3, "initWithArray:forTarget:withReferenceValues:andRange:", v6, self, &self[1], 0, [(NSKnownKeysMappingStrategy *)[(NSKnownKeysDictionary *)v8 mapping] length]);

  return v9;
}

@end