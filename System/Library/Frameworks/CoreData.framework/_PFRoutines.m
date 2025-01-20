@interface _PFRoutines
+ (BOOL)_isInMemoryStore:(uint64_t)a1;
+ (BOOL)createExternalReferenceLinkFromPath:(uint64_t)a3 toPath:(uint64_t)a4 protectionLevel:(void *)a5 error:;
+ (BOOL)isSanitizedVersionOf:(void *)a3 equalTo:;
+ (__CFDictionary)_createDictionaryPartitioningObjectIDs:(id)a3 intoHierarchies:(BOOL)a4;
+ (__CFDictionary)_createDictionaryPartitioningObjects:(id)a3 intoHierarchies:(BOOL)a4;
+ (__CFDictionary)createDictionaryPartitioningObjectsByEntity:(uint64_t)a1;
+ (__CFDictionary)createDictionaryPartitioningObjectsIDByRootEntity:(uint64_t)a1;
+ (__CFString)_getUUID;
+ (id)_coalescedPrefetchKeypaths:(uint64_t)a1;
+ (id)_frameworkHash;
+ (id)_newCollectionFromCollection:(uint64_t)a3 forParentContext:(objc_class *)a4 andClass:;
+ (id)_replaceBaseline:(void *)a3 inOrderedSet:(void *)a4 withOrderedSet:;
+ (id)newCollection:(void *)a3 fromCollection:(void *)a4 byAddingItems:;
+ (id)newMutableArrayFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableArrayFromCollection:(void *)a3 byRemovingItems:;
+ (id)newMutableOrderedSetFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableSetFromCollection:(uint64_t)a3 forParentContext:;
+ (id)newMutableSetFromCollection:(void *)a3 byIntersectingWithCollection:;
+ (id)newMutableSetFromCollection:(void *)a3 byRemovingItems:;
+ (id)newOrderedSetFromCollection:(void *)a3 byAddingItems:;
+ (id)newOrderedSetFromCollection:(void *)a3 byRemovingItems:;
+ (id)newSetFromCollection:(void *)a3 byAddingItems:;
+ (id)retainedDecodeValue:(void *)a3 forTransformableAttribute:;
+ (id)retainedEncodeObjectValue:(void *)a3 forTransformableAttribute:;
+ (id)valueForProcessArgument:(uint64_t)a1;
+ (uint64_t)BOOLValueForOverride:(uint64_t)a1;
+ (uint64_t)_createNicksBase64EncodedStringFromData:(uint64_t)a1;
+ (uint64_t)_doNameAndTypeCheck:(uint64_t)a1;
+ (uint64_t)_expressionIsCompoundIndexCompatible:(uint64_t)a1;
+ (uint64_t)_generateObjectIDMaptableForArray:(uint64_t *)a3 withMapping:(uint64_t *)a4 andEntries:;
+ (uint64_t)_generateUbiquityHashForPath:(uint64_t)a1;
+ (uint64_t)_getPFBundleVersionNumber;
+ (uint64_t)_groupObjectsByRootEntity:(uint64_t)a1;
+ (uint64_t)_isInMemoryStoreURL:(uint64_t)a1;
+ (uint64_t)_logDirectoryAccessDebugInformation:(uint64_t)a1;
+ (uint64_t)_newObjectIDsArrayWithMapping:(void *)a3 andEntries:(void *)a4 andCoordinator:;
+ (uint64_t)_objectsInOrderedCollection:(void *)a3 formSubstringInOrderedCollection:;
+ (uint64_t)_remoteChangeNotificationNameForStore:(uint64_t)a1;
+ (uint64_t)_rootEntityGroupsForObjects:(uint64_t)a3 passingBlock:;
+ (uint64_t)anyObjectFromCollection:(uint64_t)a1;
+ (uint64_t)attributeClassesForSecureCoding;
+ (uint64_t)convertCString:(unint64_t *)a3 toUnsignedInt64:(int)a4 withBase:;
+ (uint64_t)deleteFileForPFExternalReferenceData:(uint64_t)a1;
+ (uint64_t)fetchHeterogeneousCollectionByObjectIDs:(uint64_t)a3 intoContext:;
+ (uint64_t)historyChangesArrayClassesForSecureCoding;
+ (uint64_t)historyQueryGenDataClassesForSecureCoding;
+ (uint64_t)insecureBoolValueForOverride:(uint64_t)a1;
+ (uint64_t)integerValueForOverride:(uint64_t)a1;
+ (uint64_t)isUbiquitousURLDownloaded:(uint64_t)a3 error:;
+ (uint64_t)isUbiquitousURLUploaded:(uint64_t)a3 error:;
+ (uint64_t)moveInterimFileToPermanentLocation:(uint64_t)a1;
+ (uint64_t)newArrayOfObjectIDsFromCollection:(uint64_t)a1;
+ (uint64_t)newMutableOrderedSetFromCollection:(uint64_t)a1;
+ (uint64_t)newOrderedSetFromCollection:(void *)a3 byInsertingItems:(uint64_t)a4 atIndex:;
+ (uint64_t)newSetOfObjectIDsFromCollection:(uint64_t)a1;
+ (uint64_t)plistClassesForSecureCoding;
+ (uint64_t)readBytesForExternalReferenceData:(void *)a3 intoBuffer:(off_t)a4 range:(size_t)a5;
+ (uint64_t)sanitize:(uint64_t)a1;
+ (uint64_t)sensitiveIntegerValueForOverride:(uint64_t)a1;
+ (uint64_t)unarchiveCylicGraphObjectOfClasses:(uint64_t)a3 fromData:(uint64_t)a4 error:;
+ (uint64_t)writePFExternalReferenceDataToInterimFile:(uint64_t)a1;
+ (uint64_t)xpcStoreArchiverObjectIDClassesForSecureCoding;
+ (void)_logFileAccessDebugInformation:(uint64_t)a1;
+ (void)applicationActivateLifecyleNotifications;
+ (void)applicationDeactivateLifecyleNotifications;
+ (void)efficientlyEnumerateManagedObjectsInFetchRequest:(void *)a3 usingManagedObjectContext:(uint64_t)a4 andApplyBlock:;
+ (void)getIndexes:(void *)a3 fromCollection:(void *)a4 forObjectsInCollection:;
+ (void)initialize;
+ (void)readExternalReferenceDataFromFile:(uint64_t)a1;
+ (void)stringValueForOverride:(uint64_t)a1;
+ (void)wrapBlockInGuardedAutoreleasePool:(id)a3;
@end

@implementation _PFRoutines

+ (id)retainedEncodeObjectValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5 = self;
  v6 = (void *)MEMORY[0x18C127630](v5);
  uint64_t v7 = [a3 valueTransformerName];
  self;
  if (!v7 || (uint64_t v8 = [MEMORY[0x1E4F29248] valueTransformerForName:v7]) == 0)
  {
    v9 = (void *)[MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4F284F0]];
    goto LABEL_6;
  }
  v9 = (void *)v8;
  self;
  if (objc_opt_isKindOfClass())
  {
LABEL_6:
    v10 = (void *)[v9 reverseTransformedValue:a2];
    goto LABEL_7;
  }
  v10 = (void *)[v9 transformedValue:a2];
LABEL_7:
  id v11 = v10;
  return v11;
}

+ (id)retainedDecodeValue:(void *)a3 forTransformableAttribute:
{
  uint64_t v5 = self;
  v6 = (void *)MEMORY[0x18C127630](v5);
  uint64_t v7 = [a3 valueTransformerName];
  self;
  if (!v7 || (uint64_t v8 = [MEMORY[0x1E4F29248] valueTransformerForName:v7]) == 0)
  {
    v9 = (void *)[MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4F284F0]];
    goto LABEL_6;
  }
  v9 = (void *)v8;
  self;
  if (objc_opt_isKindOfClass())
  {
LABEL_6:
    v10 = (void *)[v9 transformedValue:a2];
    goto LABEL_7;
  }
  v10 = (void *)[v9 reverseTransformedValue:a2];
LABEL_7:
  id v11 = v10;
  return v11;
}

+ (__CFDictionary)createDictionaryPartitioningObjectsByEntity:(uint64_t)a1
{
  self;

  return +[_PFRoutines _createDictionaryPartitioningObjects:a2 intoHierarchies:0];
}

+ (__CFDictionary)_createDictionaryPartitioningObjects:(id)a3 intoHierarchies:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescription = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x1E4F1D548] + 24);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
  valueCallBacks.version = 0;
  *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
  valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D540] + 24);
  valueCallBacks.equal = 0;
  CFDictionaryRef v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, &valueCallBacks);
  CFIndex v7 = [a3 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = [v12 entity];
        if (v4)
        {
          if (v13)
          {
            if ((*(unsigned char *)(v13 + 120) & 4) != 0)
            {
              v14 = *(const void **)(v13 + 72);
            }
            else
            {
              do
              {
                v14 = (const void *)v13;
                uint64_t v13 = [(id)v13 superentity];
              }
              while (v13);
            }
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = (const void *)v13;
        }
        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }
        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }
      while (v11 != v9);
      uint64_t v16 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }
  return v6;
}

+ (uint64_t)attributeClassesForSecureCoding
{
  if (qword_1EB270598 != -1) {
    dispatch_once(&qword_1EB270598, &__block_literal_global_207);
  }
  return qword_1EB270590;
}

+ (uint64_t)plistClassesForSecureCoding
{
  if (qword_1EB2705D8 != -1) {
    dispatch_once(&qword_1EB2705D8, &__block_literal_global_222);
  }
  return qword_1EB2705D0;
}

+ (uint64_t)_doNameAndTypeCheck:(uint64_t)a1
{
  self;
  if (!a2) {
    return 1;
  }
  uint64_t v3 = [a2 count];
  if (!v3) {
    return 1;
  }
  unint64_t v4 = v3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = 0;
  unsigned int v7 = 1;
  while (1)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v6), "name");
    if (!result) {
      break;
    }
    if (v5 == objc_opt_class()) {
      return 0;
    }
    uint64_t v6 = v7;
    if (v4 <= v7++) {
      return 1;
    }
  }
  return result;
}

+ (id)newMutableSetFromCollection:(void *)a3 byRemovingItems:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = MEMORY[0x1F4188790]();
    uint64_t v10 = (char *)v32 - v9;
    if (v8 > 0x200)
    {
      uint64_t v10 = (char *)NSAllocateScannedUncollectable();
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      bzero((char *)v32 - v9, 8 * v8);
      if (v5)
      {
LABEL_4:
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0uLL;
        long long v50 = 0uLL;
        MEMORY[0x1F4188790]();
        unint64_t v33 = v7;
        unint64_t v34 = v5;
        v32[2] = v12;
        if (v5 > 0x200)
        {
          v35 = (const void **)NSAllocateScannedUncollectable();
        }
        else
        {
          v35 = (const void **)((char *)v32 - v11);
          bzero((char *)v32 - v11, 8 * v5);
        }
        v32[1] = v32;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v16 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v44;
          do
          {
            uint64_t v20 = 0;
            long long v21 = &v35[v18];
            do
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(a3);
              }
              v21[v20] = *(const void **)(*((void *)&v43 + 1) + 8 * v20);
              ++v20;
            }
            while (v17 != v20);
            uint64_t v17 = [a3 countByEnumeratingWithState:&v43 objects:v48 count:16];
            v18 += v20;
          }
          while (v17);
        }
        CFAllocatorRef v22 = _PFStackAllocatorCreate((unint64_t *)&v49, 1024);
        uint64_t v23 = *MEMORY[0x1E4F1D548];
        v40[1] = 0;
        v40[2] = 0;
        v40[0] = v23;
        long long v41 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
        uint64_t v42 = *(void *)(MEMORY[0x1E4F1D548] + 40);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v24 = 0;
        }
        else {
          v24 = (const CFSetCallBacks *)v40;
        }
        CFSetRef v25 = CFSetCreate(v22, v35, v34, v24);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v26 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          unint64_t v15 = 0;
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(a2);
              }
              v30 = *(const void **)(*((void *)&v36 + 1) + 8 * i);
              if (!CFSetGetValue(v25, v30)) {
                *(void *)&v10[8 * v15++] = v30;
              }
            }
            uint64_t v27 = [a2 countByEnumeratingWithState:&v36 objects:v47 count:16];
          }
          while (v27);
        }
        else
        {
          unint64_t v15 = 0;
        }
        if (v34 >= 0x201) {
          NSZoneFree(0, v35);
        }
        unint64_t v7 = v33;
        if (*((void *)&v50 + 1))
        {
          if (v25) {
            CFRelease(v25);
          }
        }
        else
        {
          *((void *)&v49 + 1) = v49;
        }
        goto LABEL_39;
      }
    }
    [a2 getObjects:v10];
    unint64_t v15 = v7;
LABEL_39:
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v10 count:v15];
    if (v7 >= 0x201) {
      NSZoneFree(0, v10);
    }
    return (id)v31;
  }
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F1CA80];

  return objc_alloc_init(v13);
}

+ (uint64_t)newSetOfObjectIDsFromCollection:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  unint64_t v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    unint64_t v7 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v7];
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    [a2 getObjects:v7];
    if (!v4) {
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
  do
  {
    *(void *)&v7[8 * v8] = [*(id *)&v7[8 * v8] objectID];
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v9;
}

+ (uint64_t)anyObjectFromCollection:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  self;
  memset(v4, 0, sizeof(v4));
  uint64_t result = [a2 countByEnumeratingWithState:v4 objects:v5 count:16];
  if (result) {
    return **((void **)&v4[0] + 1);
  }
  return result;
}

+ (uint64_t)_isInMemoryStoreURL:(uint64_t)a1
{
  self;
  uint64_t result = [a2 isFileURL];
  if (result)
  {
    unint64_t v4 = (void *)[a2 path];
    return [v4 hasPrefix:@"/dev/null"];
  }
  return result;
}

+ (void)initialize
{
  *(_WORD *)&byte_1EB270ABD = 257;
  z9dsptsiQ80etb9782fsrs98bfdle88 = 0x101010101010101;
  *(uint64_t *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 7) = 0x101010101010101;
  dword_1EB270AB8 = 16843009;
  __pflogFaultLog = _PFLogGetErrorLog();
  _PF_USE_IOS_PLATFORM = 1;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    byte_1EB270ABE = 0;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      byte_1EB270ABD = 0;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        HIBYTE(dword_1EB270AB8) = 0;
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          BYTE1(dword_1EB270AB8) = 0;
          if ((dyld_program_sdk_at_least() & 1) == 0)
          {
            LOBYTE(dword_1EB270AB8) = 0;
            if ((dyld_program_sdk_at_least() & 1) == 0)
            {
              byte_1EB270AB6 = 0;
              if ((dyld_program_sdk_at_least() & 1) == 0)
              {
                byte_1EB270AB5 = 0;
                if ((dyld_program_sdk_at_least() & 1) == 0)
                {
                  byte_1EB270AB4 = 0;
                  unsigned int program_sdk_version = dyld_get_program_sdk_version();
                  if (_CFExecutableLinkedOnOrAfter() == 1)
                  {
                    int16x8_t v3 = (int16x8_t)vcgtq_u32((uint32x4_t)vdupq_n_s32(program_sdk_version), (uint32x4_t)xmmword_18AE54100);
                    *(int8x8_t *)v3.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v3), (int8x8_t)0x1000100010001);
                    dword_1EB270AB0 = vmovn_s16(v3).u32[0];
                  }
                  else
                  {
                    *(_WORD *)((char *)&dword_1EB270AB0 + 3) = 0;
                    *(_DWORD *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 7) = 0;
                    if (_CFExecutableLinkedOnOrAfter() != 1)
                    {
                      *(_WORD *)((char *)&z9dsptsiQ80etb9782fsrs98bfdle88 + 5) = 0;
                      if (_CFExecutableLinkedOnOrAfter() != 1)
                      {
                        BYTE4(z9dsptsiQ80etb9782fsrs98bfdle88) = 0;
                        if (_CFExecutableLinkedOnOrAfter() != 1) {
                          WORD1(z9dsptsiQ80etb9782fsrs98bfdle88) = 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BYTE2(dword_1EB270AB8) = BYTE1(dword_1EB270AB8);
  _PF_Private_Malloc_Zone = 0;
  _PF_INTERNAL_DATA_SIZE_THRESHOLD = 1;
  pthread_key_init_np();
  pthread_key_init_np();
  NSArray_EmptyArray = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C978]);
  NSSet_EmptySet = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  NSOrderedSet_EmptyOrderedSet = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  NSDictionary_EmptyDictionary = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  qword_1EB270578 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28D60]);
  NSKeyValueCoding_NullValue = [MEMORY[0x1E4F1CA98] null];
  _SELF_Expression = (uint64_t)(id)[MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  if (os_variant_has_internal_content()) {
    byte_1EB270AB7 = 1;
  }
  if (qword_1EB2705E0 != -1) {
    dispatch_once(&qword_1EB2705E0, &__block_literal_global_436);
  }
  if ((_MergedGlobals_68 & 1) == 0) {
    byte_1EB270ABC = 1;
  }
  unint64_t v4 = imp_implementationWithBlock(&__block_literal_global_4);
  imp_removeBlock(v4);
  self;
  self;

  self;
}

+ (id)_coalescedPrefetchKeypaths:(uint64_t)a1
{
  self;
  uint64_t v3 = [a2 count];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ([a2 isNSSet]) {
    a2 = (void *)[a2 allObjects];
  }
  if ([a2 isNSArray])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = v5;
    if (v3)
    {
      id v16 = v4;
      id v17 = v5;
      for (uint64_t i = 0; i != v3; ++i)
      {
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", i, v16), "componentsSeparatedByString:", @".");
        uint64_t v9 = [v8 count];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = v17;
          do
          {
            uint64_t v13 = (void *)[v8 objectAtIndex:v11];
            if ([v13 length])
            {
              uint64_t v14 = [v12 objectForKey:v13];
              if (!v14) {
                uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
              }
              [v12 setObject:v14 forKey:v13];
              uint64_t v12 = (void *)v14;
            }
            ++v11;
          }
          while (v10 != v11);
        }
      }
      id v4 = v16;
      id v6 = v17;
    }
  }
  else if ([a2 isNSDictionary])
  {
    id v6 = a2;
  }
  else
  {
    id v6 = 0;
  }
  [v4 drain];

  return v6;
}

+ (uint64_t)insecureBoolValueForOverride:(uint64_t)a1
{
  self;
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if ([v3 length]
    || (id v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", a2), objc_msgSend(v3, "length")))
  {
    return [v3 BOOLValue];
  }
  else
  {
    id v5 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v5 BOOLForKey:a2];
  }
}

+ (void)stringValueForOverride:(uint64_t)a1
{
  self;
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  id v4 = v3;
  if (byte_1EB270AB7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_1EB270ABC == 0;
  }
  if (v5 && (!v3 || ![v3 length]))
  {
    id v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", a2);
    if (!v6 || (id v4 = v6, ![v6 length])) {
      id v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "stringForKey:", a2);
    }
  }
  if ([v4 length]) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (uint64_t)BOOLValueForOverride:(uint64_t)a1
{
  self;
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if ([v3 length]) {
    goto LABEL_2;
  }
  if (byte_1EB270AB7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_1EB270ABC == 0;
  }
  if (!v5) {
    return 0;
  }
  id v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", a2);
  if ([v3 length])
  {
LABEL_2:
    return [v3 BOOLValue];
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v6 BOOLForKey:a2];
  }
}

+ (uint64_t)integerValueForOverride:(uint64_t)a1
{
  self;
  id v3 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if ([v3 length]) {
    goto LABEL_2;
  }
  if (byte_1EB270AB7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = byte_1EB270ABC == 0;
  }
  if (!v5) {
    return 0;
  }
  id v3 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", a2);
  if ([v3 length])
  {
LABEL_2:
    return [v3 integerValue];
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v6 integerForKey:a2];
  }
}

+ (id)valueForProcessArgument:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  if (!a2) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x18C127630](v3);
  BOOL v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "arguments");
  id v6 = (void *)[[NSString alloc] initWithFormat:@"-%@", a2];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
LABEL_4:
    uint64_t v11 = 0;
    uint64_t v12 = v8 + v9;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v16 + 1) + 8 * v11) isEqualToString:v6]) {
        break;
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v12;
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }

    if (v9 + v11 >= (unint64_t)([v5 count] - 1)) {
      goto LABEL_13;
    }
    uint64_t v13 = (void *)[v5 objectAtIndex:v9 + v11 + 1];
  }
  else
  {
LABEL_10:

LABEL_13:
    uint64_t v13 = 0;
  }
  id v14 = v13;
  return v13;
}

+ (uint64_t)sensitiveIntegerValueForOverride:(uint64_t)a1
{
  self;
  if (byte_1EB270AB7) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = byte_1EB270ABC == 0;
  }
  if (!v3) {
    return 0;
  }
  id v4 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, a2);
  if ([v4 length]
    || (id v4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKey:", a2), objc_msgSend(v4, "length")))
  {
    return [v4 integerValue];
  }
  else
  {
    id v6 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v6 integerForKey:a2];
  }
}

+ (uint64_t)_getPFBundleVersionNumber
{
  self;
  if (!_PF_BundleVersion)
  {
    v0 = (void *)[objc_alloc(NSNumber) initWithInteger:1419];
    uint64_t v1 = 0;
    atomic_compare_exchange_strong(&_PF_BundleVersion, (unint64_t *)&v1, (unint64_t)v0);
    if (v1) {
  }
    }
  return _PF_BundleVersion;
}

+ (uint64_t)unarchiveCylicGraphObjectOfClasses:(uint64_t)a3 fromData:(uint64_t)a4 error:
{
  self;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:a4];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  [v7 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  [v8 _allowDecodingCyclesInSecureMode];
  uint64_t v9 = [v8 decodeTopLevelObjectOfClasses:a2 forKey:*MEMORY[0x1E4F284E8] error:a4];

  return v9;
}

+ (uint64_t)_remoteChangeNotificationNameForStore:(uint64_t)a1
{
  return [NSString stringWithFormat:@"%@.%@", @"com.apple.coredata.NSPersistentStoreRemoteChangeNotification.remotenotification", objc_msgSend(a2, "identifier")];
}

+ (id)newSetFromCollection:(void *)a3 byAddingItems:
{
  self;
  BOOL v5 = (objc_class *)objc_opt_class();

  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)_PFRoutines, v5, a2, a3);
}

+ (id)newCollection:(void *)a3 fromCollection:(void *)a4 byAddingItems:
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v7 = [a3 count];
  unint64_t v8 = [a4 count] + v7;
  if (v8)
  {
    if (a3) {
      uint64_t v9 = a3;
    }
    else {
      uint64_t v9 = NSSet_EmptySet;
    }
    MEMORY[0x1F4188790]();
    uint64_t v11 = (char *)&v34 - v10;
    if (v8 > 0x200) {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v34 - v10, 8 * v8);
    }
    if ([a4 count])
    {
      long long v37 = &v34;
      long long v88 = 0u;
      long long v87 = 0u;
      long long v86 = 0u;
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      long long v81 = 0u;
      long long v80 = 0u;
      long long v79 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      MEMORY[0x1F4188790]();
      unint64_t v15 = (const void **)((char *)&v34 - v14);
      if (v7 > 0x200) {
        unint64_t v15 = (const void **)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v34 - v14, 8 * v13);
      }
      memset(v53, 0, sizeof(v53));
      if ([a4 countByEnumeratingWithState:v53 objects:&v56 count:16]) {
        uint64_t v36 = *(void *)v53[1];
      }
      else {
        uint64_t v36 = 0;
      }
      long long v41 = v15;
      unint64_t v38 = v8;
      long long v39 = &v34;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v17 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
      v40 = a2;
      if (v17)
      {
        uint64_t v18 = v17;
        unint64_t v35 = v7;
        unint64_t v16 = 0;
        uint64_t v19 = *(void *)v50;
        do
        {
          uint64_t v20 = 0;
          uint64_t v21 = &v41[v16];
          do
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v9);
            }
            CFAllocatorRef v22 = *(const void **)(*((void *)&v49 + 1) + 8 * v20);
            *(void *)&v11[8 * v16 + 8 * v20] = v22;
            v21[v20++] = v22;
          }
          while (v18 != v20);
          uint64_t v18 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
          v16 += v20;
        }
        while (v18);
        unint64_t v7 = v35;
      }
      else
      {
        unint64_t v16 = 0;
      }
      CFAllocatorRef v23 = _PFStackAllocatorCreate((unint64_t *)&v57, 1024);
      uint64_t v24 = *MEMORY[0x1E4F1D548];
      v46[1] = 0;
      v46[2] = 0;
      v46[0] = v24;
      long long v47 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
      uint64_t v48 = *(void *)(MEMORY[0x1E4F1D548] + 40);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CFSetRef v25 = 0;
      }
      else {
        CFSetRef v25 = (const CFSetCallBacks *)v46;
      }
      unint64_t v26 = v7;
      CFSetRef v27 = CFSetCreate(v23, v41, v7, v25);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v28 = [a4 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(a4);
            }
            v32 = *(const void **)(*((void *)&v42 + 1) + 8 * i);
            if (!CFSetGetValue(v27, v32)) {
              *(void *)&v11[8 * v16++] = v32;
            }
          }
          uint64_t v29 = [a4 countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v29);
      }
      if (v26 >= 0x201) {
        NSZoneFree(0, v41);
      }
      unint64_t v8 = v38;
      a2 = v40;
      if (*((void *)&v58 + 1))
      {
        if (v27) {
          CFRelease(v27);
        }
      }
      else
      {
        *((void *)&v57 + 1) = v57;
      }
    }
    else
    {
      [v9 getObjects:v11];
      unint64_t v16 = v8;
    }
    uint64_t v33 = [[a2 alloc] initWithObjects:v11 count:v16];
    if (v8 >= 0x201) {
      NSZoneFree(0, v11);
    }
    return (id)v33;
  }
  else
  {
    return objc_alloc_init(a2);
  }
}

+ (uint64_t)sanitize:(uint64_t)a1
{
  self;
  BOOL v3 = NSString;
  uint64_t v4 = [a2 UTF8String];

  return [v3 stringWithUTF8String:v4];
}

+ (__CFString)_getUUID
{
  self;
  CFUUIDRef v0 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  uint64_t v1 = (__CFString *)CFUUIDCreateString(0, v0);
  CFRelease(v0);

  return v1;
}

+ (uint64_t)newArrayOfObjectIDsFromCollection:(uint64_t)a1
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  unint64_t v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    unint64_t v7 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v7];
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    [a2 getObjects:v7];
    if (!v4) {
      goto LABEL_13;
    }
  }
  uint64_t v8 = 0;
  do
  {
    *(void *)&v7[8 * v8] = [*(id *)&v7[8 * v8] objectID];
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v9;
}

+ (id)newOrderedSetFromCollection:(void *)a3 byAddingItems:
{
  self;
  uint64_t v5 = (objc_class *)objc_opt_class();

  return +[_PFRoutines newCollection:fromCollection:byAddingItems:]((uint64_t)_PFRoutines, v5, a2, a3);
}

+ (uint64_t)_generateObjectIDMaptableForArray:(uint64_t *)a3 withMapping:(uint64_t *)a4 andEntries:
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  self;
  if (![a2 count]) {
    return 0;
  }
  long long v85 = a4;
  long long v86 = a3;
  CFIndex v94 = objc_opt_class();
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryRef v9 = CFDictionaryCreateMutable(v7, 0, 0, 0);
  CFDictionaryRef v10 = CFDictionaryCreateMutable(v7, 0, 0, 0);
  CFArrayRef v97 = CFArrayCreateMutable(v7, 0, 0);
  CFAllocatorRef v87 = v7;
  v96 = CFArrayCreateMutable(v7, 0, 0);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  CFMutableDictionaryRef v98 = Mutable;
  v93 = (uint64_t **)[a2 countByEnumeratingWithState:&v115 objects:v123 count:16];
  if (v93)
  {
    uint64_t v90 = 0;
    id v91 = a2;
    v95 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v88 = 0;
    uint64_t v89 = 0;
    uint64_t v92 = *(void *)v116;
    while (2)
    {
      for (uint64_t i = 0; i != v93; uint64_t i = (uint64_t **)((char *)i + 1))
      {
        if (*(void *)v116 != v92) {
          objc_enumerationMutation(v91);
        }
        unint64_t v15 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v28 = 0;
          goto LABEL_106;
        }
        unint64_t v16 = (const void *)[v15 persistentStore];
        uint64_t v17 = [v15 entity];
        if (v16 != v13 || v17 != v12)
        {
          uint64_t v19 = (const void *)v17;
          Value = CFDictionaryGetValue(v98, v16);
          if (Value)
          {
            int v21 = (int)Value;
          }
          else
          {
            int v21 = v89 + 1;
            CFDictionarySetValue(v98, v16, (const void *)++v89);
          }
          CFAllocatorRef v22 = CFDictionaryGetValue(v9, v19);
          if (v22)
          {
            unsigned __int16 v23 = (unsigned __int16)v22;
          }
          else
          {
            unsigned __int16 v23 = v90 + 1;
            CFDictionarySetValue(v9, v19, (const void *)++v90);
          }
          uint64_t v24 = (const void *)((v21 << 16) | (unint64_t)v23);
          CFSetRef v25 = (char *)CFDictionaryGetValue(v10, v24);
          if (v25)
          {
            uint64_t v11 = v25;
            uint64_t v12 = (uint64_t)v19;
            uint64_t v13 = v16;
          }
          else
          {
            uint64_t v11 = (char *)(v88 + 1);
            CFDictionarySetValue(v10, v24, (const void *)(v88 + 1));
            uint64_t v12 = (uint64_t)v19;
            uint64_t v13 = v16;
            ++v88;
          }
        }
        CFArrayAppendValue(v97, v11 - 1);
        unint64_t v26 = (uint64_t **)[v15 _referenceData64];
        CFSetRef v27 = v95;
        if ((uint64_t)v26 > (uint64_t)v95) {
          CFSetRef v27 = v26;
        }
        v95 = v27;
        CFArrayAppendValue(v96, v26);
        Mutable = v98;
      }
      v93 = (uint64_t **)[v91 countByEnumeratingWithState:&v115 objects:v123 count:16];
      if (v93) {
        continue;
      }
      break;
    }
  }
  else
  {
    v95 = 0;
  }
  unint64_t Count = CFDictionaryGetCount(Mutable);
  unint64_t v30 = Count;
  if (Count <= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v31;
  }
  uint64_t v33 = (char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = &v85;
  if (Count > 0x200) {
    uint64_t v33 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v32 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v31);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v34 = -[__CFDictionary countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v111, v122, 16, v85);
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v112 != v36) {
          objc_enumerationMutation(Mutable);
        }
        unint64_t v38 = *(void **)(*((void *)&v111 + 1) + 8 * j);
        long long v39 = CFDictionaryGetValue(Mutable, v38);
        uint64_t v40 = [v38 identifier];
        long long v41 = &v33[8 * (void)v39];
        Mutable = v98;
        *((void *)v41 - 1) = v40;
      }
      uint64_t v35 = [(__CFDictionary *)Mutable countByEnumeratingWithState:&v111 objects:v122 count:16];
    }
    while (v35);
  }
  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:v30];
  if (v30 >= 0x201) {
    NSZoneFree(0, v33);
  }
  unint64_t v43 = CFDictionaryGetCount(v9);
  unint64_t v44 = v43;
  if (v43 <= 1) {
    uint64_t v45 = 1;
  }
  else {
    uint64_t v45 = v43;
  }
  if (v43 >= 0x201) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = v45;
  }
  long long v47 = (char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFIndex v94 = v42;
  if (v43 > 0x200) {
    long long v47 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v45);
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v48 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v107 objects:v121 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v108 != v50) {
          objc_enumerationMutation(v9);
        }
        long long v52 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        long long v53 = CFDictionaryGetValue(v9, v52);
        *(void *)&v47[8 * (void)v53 - 8] = [v52 name];
      }
      uint64_t v49 = [(__CFDictionary *)v9 countByEnumeratingWithState:&v107 objects:v121 count:16];
    }
    while (v49);
  }
  uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:v44];
  if (v44 >= 0x201) {
    NSZoneFree(0, v47);
  }
  unint64_t v55 = CFDictionaryGetCount(v10);
  unint64_t v56 = v55;
  if (v55 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v55;
  }
  if (v55 >= 0x201) {
    uint64_t v58 = 1;
  }
  else {
    uint64_t v58 = v57;
  }
  long long v59 = (const void **)((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v55 > 0x200) {
    long long v59 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v85 - ((8 * v58 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v57);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v60 = [(__CFDictionary *)v10 countByEnumeratingWithState:&v103 objects:v120 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v104;
    do
    {
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v104 != v62) {
          objc_enumerationMutation(v10);
        }
        long long v64 = *(const void **)(*((void *)&v103 + 1) + 8 * m);
        v59[(void)CFDictionaryGetValue(v10, v64) - 1] = v64;
      }
      uint64_t v61 = [(__CFDictionary *)v10 countByEnumeratingWithState:&v103 objects:v120 count:16];
    }
    while (v61);
  }
  CFArrayRef v65 = CFArrayCreate(v87, v59, v56, 0);
  if (v56 >= 0x201) {
    NSZoneFree(0, v59);
  }
  long long v66 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v67 = (uint64_t)v95;
  uint64_t v68 = [NSNumber numberWithUnsignedLongLong:v95];
  uint64_t v69 = objc_msgSend(v66, "arrayWithObjects:", v94, v54, v65, v68, 0);
  *long long v86 = v69;
  CFRelease(v65);
  if ((unint64_t)[(__CFArray *)v65 count] > 0xFE || v67 > 0xFFFFFF)
  {
    uint64_t v74 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v97, v96, 0);
    *long long v85 = v74;
  }
  else
  {
    unint64_t v70 = CFArrayGetCount(v96);
    CFIndex v94 = v70;
    v95 = &v85;
    if (v70 <= 1) {
      uint64_t v71 = 1;
    }
    else {
      uint64_t v71 = v70;
    }
    if (v70 >= 0x201) {
      uint64_t v72 = 1;
    }
    else {
      uint64_t v72 = v71;
    }
    long long v73 = (const void **)((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v70 > 0x200) {
      long long v73 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v85 - ((8 * v72 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v71);
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v75 = [(__CFArray *)v96 countByEnumeratingWithState:&v99 objects:v119 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = 0;
      uint64_t v78 = *(void *)v100;
      do
      {
        for (uint64_t n = 0; n != v76; ++n)
        {
          if (*(void *)v100 != v78) {
            objc_enumerationMutation(v96);
          }
          uint64_t v80 = *(void *)(*((void *)&v99 + 1) + 8 * n);
          *(&v73[v77] + n) = (const void *)((CFArrayGetValueAtIndex(v97, v77 + n) << 24) | v80 & 0xFFFFFF);
        }
        uint64_t v76 = [(__CFArray *)v96 countByEnumeratingWithState:&v99 objects:v119 count:16];
        v77 += n;
      }
      while (v76);
    }
    unint64_t v81 = v94;
    CFArrayRef v82 = CFArrayCreate(v87, v73, v94, 0);
    if (v81 >= 0x201) {
      NSZoneFree(0, v73);
    }
    uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObject:v82];
    *long long v85 = v83;
    CFRelease(v82);
  }
  Mutable = v98;
  uint64_t v28 = 1;
LABEL_106:
  CFRelease(Mutable);
  CFRelease(v9);
  CFRelease(v10);
  CFRelease(v97);
  CFRelease(v96);
  return v28;
}

+ (uint64_t)_newObjectIDsArrayWithMapping:(void *)a3 andEntries:(void *)a4 andCoordinator:
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  self;
  CFAllocatorRef v7 = (void *)[a2 objectAtIndex:0];
  uint64_t v8 = (char *)[a2 objectAtIndex:1];
  CFDictionaryRef v9 = (void *)[a2 objectAtIndex:2];
  uint64_t v69 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 3), "unsignedLongLongValue");
  CFArrayRef v78 = (const __CFArray *)[a3 objectAtIndex:0];
  CFArrayRef v74 = v78;
  if ((unint64_t)[a3 count] >= 2) {
    CFArrayRef v74 = (CFArrayRef)[a3 objectAtIndex:1];
  }
  unint64_t v10 = [v7 count];
  unint64_t v79 = [v8 count];
  unint64_t v80 = [v9 count];
  if (v10 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v10 >= 0x201) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = (char *)&v69 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v76 = v10;
  if (v10 > 0x200) {
    uint64_t v13 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v69 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
  }
  if (v79 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v79;
  }
  if (v79 >= 0x201) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  if (v79 > 0x200)
  {
    uint64_t v75 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    uint64_t v75 = (char *)&v69 - ((8 * v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v75, 8 * v14);
  }
  if (v80 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v80;
  }
  if (v80 >= 0x201) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16;
  }
  uint64_t v18 = (char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v80 > 0x200) {
    uint64_t v18 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v16);
  }
  uint64_t v72 = v8;
  uint64_t v77 = v18;
  unint64_t v19 = [(__CFArray *)v78 count];
  if (v19 <= 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v19 >= 0x201) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  CFAllocatorRef v22 = (char *)&v69 - ((8 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v73 = v19;
  if (v19 > 0x200)
  {
    uint64_t v71 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    uint64_t v71 = v22;
    bzero(v22, 8 * v20);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v94;
    while (2)
    {
      uint64_t v27 = 0;
      uint64_t v28 = v13;
      uint64_t v29 = &v13[8 * v25];
      do
      {
        if (*(void *)v94 != v26) {
          objc_enumerationMutation(v7);
        }
        uint64_t v30 = [a4 persistentStoreForIdentifier:*(void *)(*((void *)&v93 + 1) + 8 * v27)];
        if (!v30)
        {
          uint64_t v66 = 0;
          goto LABEL_93;
        }
        *(void *)&v29[8 * v27++] = v30;
      }
      while (v24 != v27);
      uint64_t v24 = [v7 countByEnumeratingWithState:&v93 objects:v100 count:16];
      v25 += v27;
      uint64_t v13 = v28;
      if (v24) {
        continue;
      }
      break;
    }
  }
  uint64_t v31 = objc_msgSend((id)objc_msgSend(a4, "managedObjectModel"), "entitiesByName");
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v32 = v72;
  uint64_t v33 = [v72 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v90;
    while (2)
    {
      long long v37 = v13;
      uint64_t v38 = 0;
      long long v39 = &v75[8 * v35];
      do
      {
        if (*(void *)v90 != v36) {
          objc_enumerationMutation(v32);
        }
        uint64_t v40 = [v31 objectForKey:*(void *)(*((void *)&v89 + 1) + 8 * v38)];
        if (!v40)
        {
          uint64_t v66 = 0;
          uint64_t v28 = v37;
          goto LABEL_93;
        }
        *(void *)&v39[8 * v38++] = v40;
      }
      while (v34 != v38);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v89 objects:v99 count:16];
      v35 += v38;
      uint64_t v13 = v37;
      if (v34) {
        continue;
      }
      break;
    }
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v41 = [v9 countByEnumeratingWithState:&v85 objects:v98 count:16];
  uint64_t v42 = v77;
  if (v41)
  {
    uint64_t v43 = v41;
    uint64_t v44 = 0;
    uint64_t v45 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v86 != v45) {
          objc_enumerationMutation(v9);
        }
        *(void *)&v42[8 * v44 + 8 * i] = *(void *)(*((void *)&v85 + 1) + 8 * i);
      }
      uint64_t v43 = [v9 countByEnumeratingWithState:&v85 objects:v98 count:16];
      v44 += i;
    }
    while (v43);
  }
  unint64_t v70 = v13;
  unint64_t v47 = [v9 count];
  long long v81 = 0u;
  long long v82 = 0u;
  BOOL v49 = v47 < 0xFF && v69 < 0x1000000;
  long long v83 = 0uLL;
  long long v84 = 0uLL;
  uint64_t v50 = [(__CFArray *)v78 countByEnumeratingWithState:&v81 objects:v97 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    long long v52 = 0;
    long long v53 = 0;
    uint64_t v54 = *(void *)v82;
    uint64_t v55 = 0x7FFFFFFFLL;
    while (2)
    {
      uint64_t v56 = 0;
      uint64_t v72 = v52;
      uint64_t v57 = &v71[8 * (void)v52];
      do
      {
        if (*(void *)v82 != v54) {
          objc_enumerationMutation(v78);
        }
        uint64_t v58 = *(void *)(*((void *)&v81 + 1) + 8 * v56);
        if (v49) {
          uint64_t v59 = v58 >> 24;
        }
        else {
          uint64_t v59 = *(void *)(*((void *)&v81 + 1) + 8 * v56);
        }
        if (v59 != v55)
        {
          if (v59 >= (uint64_t)v80
            || ((unsigned int v60 = WORD1(*(void *)&v77[8 * v59]) - 1,
                 unsigned int v61 = (unsigned __int16)*(void *)&v77[8 * v59] - 1,
                 v60 < v76)
              ? (BOOL v62 = v61 >= v79)
              : (BOOL v62 = 1),
                v62))
          {
            uint64_t v66 = 0;
            goto LABEL_92;
          }
          long long v53 = (objc_class *)[*(id *)&v70[8 * v60] objectIDFactoryForEntity:*(void *)&v75[8 * v61]];
          uint64_t v55 = v59;
        }
        if (v49) {
          uint64_t ValueAtIndex = v58 & 0xFFFFFF;
        }
        else {
          uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v74, (CFIndex)&v72[v56]);
        }
        *(void *)&v57[8 * v56++] = [[v53 alloc] initWithPK64:ValueAtIndex];
      }
      while (v51 != v56);
      uint64_t v51 = [(__CFArray *)v78 countByEnumeratingWithState:&v81 objects:v97 count:16];
      long long v52 = &v72[v56];
      if (v51) {
        continue;
      }
      break;
    }
  }
  long long v64 = [_PFArray alloc];
  uint64_t v65 = [(__CFArray *)v78 count];
  uint64_t v66 = [(_PFArray *)v64 initWithObjects:v71 count:v65 andFlags:18];
LABEL_92:
  uint64_t v28 = v70;
LABEL_93:
  if (v73 >= 0x201) {
    NSZoneFree(0, v71);
  }
  uint64_t v67 = v77;
  if (v76 >= 0x201) {
    NSZoneFree(0, v28);
  }
  if (v79 >= 0x201) {
    NSZoneFree(0, v75);
  }
  if (v80 >= 0x201) {
    NSZoneFree(0, v67);
  }
  return v66;
}

+ (id)_frameworkHash
{
  if (qword_1EB270580 != -1) {
    dispatch_once(&qword_1EB270580, &__block_literal_global_59);
  }
  v2 = (void *)qword_1EB270588;

  return v2;
}

+ (uint64_t)_rootEntityGroupsForObjects:(uint64_t)a3 passingBlock:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a2);
        }
        unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ((*(unsigned int (**)(uint64_t, void *))(a3 + 16))(a3, v10))
        {
          uint64_t v11 = [v10 entity];
          if (v11)
          {
            if ((*(unsigned char *)(v11 + 120) & 4) != 0)
            {
              uint64_t v12 = *(void **)(v11 + 72);
            }
            else
            {
              do
              {
                uint64_t v12 = (void *)v11;
                uint64_t v11 = [(id)v11 superentity];
              }
              while (v11);
            }
          }
          else
          {
            uint64_t v12 = 0;
          }
          uint64_t v13 = [v12 name];
          id v14 = (id)[v5 objectForKey:v13];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v5 setObject:v14 forKey:v13];
          }
          [v14 addObject:v10];
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v15 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }
  uint64_t v16 = [v5 allValues];

  return v16;
}

+ (uint64_t)_groupObjectsByRootEntity:(uint64_t)a1
{
  self;

  return +[_PFRoutines _rootEntityGroupsForObjects:passingBlock:]((uint64_t)_PFRoutines, a2, (uint64_t)&__block_literal_global_75);
}

+ (uint64_t)_logDirectoryAccessDebugInformation:(uint64_t)a1
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  self;
  _NSCoreDataLog(1, @"Logging status information for directory path: %@", v3, v4, v5, v6, v7, v8, (uint64_t)a2);
  uint64_t v9 = (void *)[a2 pathComponents];
  memset(&v133, 0, sizeof(v133));
  uint64_t v10 = geteuid();
  _NSCoreDataLog(1, @"Executing as effective user %u", v11, v12, v13, v14, v15, v16, v10);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t result = [v9 countByEnumeratingWithState:&v129 objects:v134 count:16];
  if (result)
  {
    uint64_t v18 = result;
    long long v19 = &stru_1ED787880;
    uint64_t v20 = *(void *)v130;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v130 != v20) {
          objc_enumerationMutation(v9);
        }
        uint64_t v22 = *(void *)(*((void *)&v129 + 1) + 8 * v21);
        LOBYTE(v133.st_dev) = 0;
        long long v19 = (__CFString *)[(__CFString *)v19 stringByAppendingPathComponent:v22];
        uint64_t v23 = (const char *)[(__CFString *)v19 fileSystemRepresentation];
        if (stat(v23, &v133))
        {
          uint64_t v30 = __error();
          strerror(*v30);
          _NSCoreDataLog(1, @"Failed to stat path '%s', errno %d / %s.", v31, v32, v33, v34, v35, v36, (uint64_t)v23);
        }
        else
        {
          _NSCoreDataLog(1, @"Information for %s", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
          _NSCoreDataLog(1, @"  File Device ID: \t%d", v37, v38, v39, v40, v41, v42, v133.st_rdev);
          _NSCoreDataLog(1, @"  Device ID: \t\t%d", v43, v44, v45, v46, v47, v48, v133.st_dev);
          _NSCoreDataLog(1, @"  File Size: \t\t%lld bytes", v49, v50, v51, v52, v53, v54, v133.st_size);
          _NSCoreDataLog(1, @"  File inode: \t\t%llu", v55, v56, v57, v58, v59, v60, v133.st_ino);
          _NSCoreDataLog(1, @"  File user ID: \t\t%u", v61, v62, v63, v64, v65, v66, v133.st_uid);
          _NSCoreDataLog(1, @"  File group ID: \t\t%u", v67, v68, v69, v70, v71, v72, v133.st_gid);
          _NSCoreDataLog(1, @"  File Permissions: \t", v73, v74, v75, v76, v77, v78, v123);
          if ((v133.st_mode & 0xF000) == 0x4000) {
            long long v85 = @"d";
          }
          else {
            long long v85 = @"-";
          }
          _NSCoreDataLog(1, (uint64_t)v85, v79, v80, v81, v82, v83, v84, v124);
          _NSCoreDataLog(1, @"  %3o", v86, v87, v88, v89, v90, v91, v133.st_mode & 0x1FF);
          CFMutableDictionaryRef v98 = "is not";
          if ((v133.st_mode & 0xF000) == 0xA000) {
            CFMutableDictionaryRef v98 = "is";
          }
          _NSCoreDataLog(1, @"  component %s a symbolic link", v92, v93, v94, v95, v96, v97, (uint64_t)v98);
          if (access(v23, 4))
          {
            uint64_t v126 = *__error();
            _NSCoreDataLog(1, @"  component is not readable with errno %d", v105, v106, v107, v108, v109, v110, v126);
          }
          else
          {
            _NSCoreDataLog(1, @"  component is readable", v99, v100, v101, v102, v103, v104, v125);
          }
          if (access(v23, 2))
          {
            uint64_t v128 = *__error();
            _NSCoreDataLog(1, @"  component is not writeable with errno %d", v117, v118, v119, v120, v121, v122, v128);
          }
          else
          {
            _NSCoreDataLog(1, @"  component is writeable", v111, v112, v113, v114, v115, v116, v127);
          }
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t result = [v9 countByEnumeratingWithState:&v129 objects:v134 count:16];
      uint64_t v18 = result;
    }
    while (result);
  }
  return result;
}

+ (void)_logFileAccessDebugInformation:(uint64_t)a1
{
  uint64_t v199 = *MEMORY[0x1E4F143B8];
  self;
  if (a2)
  {
    memset(&v197, 0, sizeof(v197));
    if (stat(a2, &v197))
    {
      uint64_t v3 = __error();
      strerror(*v3);
      _NSCoreDataLog(1, @"Failed to stat path '%s', errno %d / %s.", v4, v5, v6, v7, v8, v9, (uint64_t)a2);
      uint64_t v190 = geteuid();
      _NSCoreDataLog(1, @"Executing as effective user %u", v10, v11, v12, v13, v14, v15, v190);
    }
    else
    {
      uint64_t v16 = geteuid();
      _NSCoreDataLog(1, @"Executing as effective user %u", v17, v18, v19, v20, v21, v22, v16);
      _NSCoreDataLog(1, @"Information for %s", v23, v24, v25, v26, v27, v28, (uint64_t)a2);
      _NSCoreDataLog(1, @"---------------------------", v29, v30, v31, v32, v33, v34, v192);
      _NSCoreDataLog(1, @"  File Device ID: \t%d", v35, v36, v37, v38, v39, v40, v197.st_rdev);
      _NSCoreDataLog(1, @"  Device ID: \t\t%d", v41, v42, v43, v44, v45, v46, v197.st_dev);
      _NSCoreDataLog(1, @"  File Size: \t\t%lld bytes", v47, v48, v49, v50, v51, v52, v197.st_size);
      _NSCoreDataLog(1, @"  File inode: \t\t%llu", v53, v54, v55, v56, v57, v58, v197.st_ino);
      _NSCoreDataLog(1, @"  File user ID: \t\t%u", v59, v60, v61, v62, v63, v64, v197.st_uid);
      _NSCoreDataLog(1, @"  File group ID: \t\t%u", v65, v66, v67, v68, v69, v70, v197.st_gid);
      _NSCoreDataLog(1, @"  File Permissions: \t", v71, v72, v73, v74, v75, v76, v193);
      if ((v197.st_mode & 0xF000) == 0x4000) {
        uint64_t v83 = @"d";
      }
      else {
        uint64_t v83 = @"-";
      }
      _NSCoreDataLog(1, (uint64_t)v83, v77, v78, v79, v80, v81, v82, v194);
      _NSCoreDataLog(1, @"  %3o", v84, v85, v86, v87, v88, v89, v197.st_mode & 0x1FF);
      if ((v197.st_mode & 0xF000) == 0xA000) {
        uint64_t v96 = "is";
      }
      else {
        uint64_t v96 = "is not";
      }
      _NSCoreDataLog(1, @"  file %s a symbolic link", v90, v91, v92, v93, v94, v95, (uint64_t)v96);
    }
    memset(&v198, 0, 512);
    if (statfs(a2, &v198))
    {
      uint64_t v103 = __error();
      uint64_t v104 = *v103;
      strerror(*v103);
      _NSCoreDataLog(1, @"Failed to statfs file; errno %d / %s.",
        v105,
        v106,
        v107,
        v108,
        v109,
        v110,
        v104);
      return;
    }
    _NSCoreDataLog(1, @"Information for file system", v97, v98, v99, v100, v101, v102, v191);
    _NSCoreDataLog(1, @"---------------------------", v111, v112, v113, v114, v115, v116, v195);
    _NSCoreDataLog(1, @"  File system type: \t\t%#lx", v117, v118, v119, v120, v121, v122, v198.f_type);
    _NSCoreDataLog(1, @"  File system flags: \t\t%#lx", v123, v124, v125, v126, v127, v128, v198.f_flags);
    uint32_t f_flags = v198.f_flags;
    if (v198.f_flags)
    {
      _NSCoreDataLog(1, @"MNT_RDONLY", v129, v130, v131, v132, v133, v134, v196);
      uint32_t f_flags = v198.f_flags;
      if ((v198.f_flags & 0x2000) == 0)
      {
LABEL_15:
        if ((f_flags & 0x4000) == 0) {
          goto LABEL_16;
        }
        goto LABEL_24;
      }
    }
    else if ((v198.f_flags & 0x2000) == 0)
    {
      goto LABEL_15;
    }
    _NSCoreDataLog(1, @"  MNT_QUOTA", v129, v130, v131, v132, v133, v134, v196);
    uint32_t f_flags = v198.f_flags;
    if ((v198.f_flags & 0x4000) == 0)
    {
LABEL_16:
      if ((f_flags & 0x200000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
LABEL_24:
    _NSCoreDataLog(1, @"  MNT_ROOTFS", v129, v130, v131, v132, v133, v134, v196);
    uint32_t f_flags = v198.f_flags;
    if ((v198.f_flags & 0x200000) == 0)
    {
LABEL_17:
      if ((f_flags & 0x800000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
LABEL_25:
    _NSCoreDataLog(1, @"  MNT_UNKNOWNPERMISSIONS", v129, v130, v131, v132, v133, v134, v196);
    uint32_t f_flags = v198.f_flags;
    if ((v198.f_flags & 0x800000) == 0)
    {
LABEL_18:
      if ((f_flags & 0x2000000) == 0)
      {
LABEL_20:
        _NSCoreDataLog(1, @"  Total data blocks: \t\t%lu", v129, v130, v131, v132, v133, v134, v198.f_blocks);
        _NSCoreDataLog(1, @"  Free data blocks: \t\t%lu", v136, v137, v138, v139, v140, v141, v198.f_bfree);
        _NSCoreDataLog(1, @"  Free blocks for nonsuperuser:\t%lu", v142, v143, v144, v145, v146, v147, v198.f_bavail);
        _NSCoreDataLog(1, @"  Total i-nodes: \t\t\t%lu", v148, v149, v150, v151, v152, v153, v198.f_files);
        _NSCoreDataLog(1, @"  File system ID: \t\t%#x, %#x", v154, v155, v156, v157, v158, v159, v198.f_fsid.val[0]);
        _NSCoreDataLog(1, @"  Free i-nodes: \t\t\t%llu", v160, v161, v162, v163, v164, v165, v198.f_ffree);
        _NSCoreDataLog(1, @"  Owner UID: \t\t\t%u", v166, v167, v168, v169, v170, v171, v198.f_owner);
        _NSCoreDataLog(1, @"  Filesystem type name: \t\t%s", v172, v173, v174, v175, v176, v177, (uint64_t)v198.f_fstypename);
        _NSCoreDataLog(1, @"  Mount on name: \t\t\t%s", v178, v179, v180, v181, v182, v183, (uint64_t)v198.f_mntonname);
        _NSCoreDataLog(1, @"  Mount from name: \t\t%s", v184, v185, v186, v187, v188, v189, (uint64_t)v198.f_mntfromname);
        return;
      }
LABEL_19:
      _NSCoreDataLog(1, @"  MNT_DEFWRITE", v129, v130, v131, v132, v133, v134, v196);
      goto LABEL_20;
    }
LABEL_26:
    _NSCoreDataLog(1, @"  MNT_JOURNALED", v129, v130, v131, v132, v133, v134, v196);
    if ((v198.f_flags & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
}

+ (uint64_t)_generateUbiquityHashForPath:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v3 = v13;
  if (([a2 getCString:v13 maxLength:1024 encoding:4] & 1) == 0)
  {
    uint64_t v3 = (const char *)[a2 UTF8String];
    if (!v3) {
      return 1;
    }
  }
  size_t v4 = strlen(v3);
  if (!v4) {
    return 1;
  }
  size_t v5 = v4;
  if (v4 < 0x400)
  {
    uint64_t v7 = 0;
    uint64_t v6 = &v12;
  }
  else
  {
    uint64_t v6 = (char *)malloc_type_calloc(1uLL, v4 + 1, 0x30ED6BC5uLL);
    uint64_t v7 = v6;
  }
  uint64_t v9 = 0;
  uint64_t v10 = v3 - 1;
  do
  {
    v6[v9] = v10[v5];
    --v10;
    ++v9;
  }
  while (v5 != v9);
  v6[v5] = 0;
  uint64_t v8 = CFHashBytes();
  if (v7) {
    free(v7);
  }
  return v8;
}

+ (uint64_t)convertCString:(unint64_t *)a3 toUnsignedInt64:(int)a4 withBase:
{
  self;
  __endptr = 0;
  unint64_t v7 = strtouq(a2, &__endptr, a4);
  if (__endptr) {
    BOOL v8 = __endptr == a2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || *__endptr)
  {
    unint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
  *a3 = v7;
  return v9;
}

+ (uint64_t)xpcStoreArchiverObjectIDClassesForSecureCoding
{
  if (qword_1EB2705A8 != -1) {
    dispatch_once(&qword_1EB2705A8, &__block_literal_global_214);
  }
  return qword_1EB2705A0;
}

+ (uint64_t)historyChangesArrayClassesForSecureCoding
{
  if (qword_1EB2705B8 != -1) {
    dispatch_once(&qword_1EB2705B8, &__block_literal_global_217);
  }
  return qword_1EB2705B0;
}

+ (uint64_t)historyQueryGenDataClassesForSecureCoding
{
  if (qword_1EB2705C8 != -1) {
    dispatch_once(&qword_1EB2705C8, &__block_literal_global_220);
  }
  return qword_1EB2705C0;
}

+ (uint64_t)writePFExternalReferenceDataToInterimFile:(uint64_t)a1
{
  v50[2] = *MEMORY[0x1E4F143B8];
  self;
  if (![a2 hasExternalReferenceContent]) {
    return 0;
  }
  uint64_t v3 = (const char *)[a2 _externalReferenceLocation];
  size_t v4 = strlen(v3);
  size_t v5 = (char *)malloc_type_calloc(1uLL, v4 + 9, 0x6D80D3E0uLL);
  strcat(&strncat(v5, v3, v4)[v4 - 1], ".interim");
  uint64_t v6 = (void *)[a2 _originalData];
  uint64_t v7 = [NSString stringWithUTF8String:v5];
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    uint64_t v11 = [v6 _safeguardLocation];
    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v10 = (void *)[NSString stringWithUTF8String:v11];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    if (v9 != objc_opt_class()) {
      goto LABEL_12;
    }
    uint64_t v10 = (void *)[-[_PFEvanescentData url]((id *)v6) path];
    if (![v10 UTF8String]) {
      goto LABEL_12;
    }
  }
  uint64_t v46 = 0;
  if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, (uint64_t)v10, v7, [a2 preferredProtectionLevel], &v46))
  {
    uint64_t v18 = v5;
    goto LABEL_26;
  }
  uint64_t v43 = v7;
  uint64_t v44 = v46;
  _NSCoreDataLog(1, @"Failed to clone external data reference from %@ to %@ error: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
LABEL_12:
  uint64_t v45 = v3;
  int v19 = open(v5, 2561, 420, v43, v44);
  if (v19 < 0)
  {
    free(v5);
    uint64_t v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3B8];
    uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Can't open externalDataReference interim file : %d", *__error());
    v49[0] = @"Problem Path";
    uint64_t v42 = [NSString stringWithUTF8String:v3];
    v49[1] = @"com.apple.coredata.ubiquity.eat";
    v50[0] = v42;
    v50[1] = MEMORY[0x1E4F1CC38];
    uint64_t v39 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v40 = v50;
    uint64_t v41 = v49;
LABEL_29:
    objc_exception_throw((id)objc_msgSend(v35, "exceptionWithName:reason:userInfo:", v36, v37, objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 2)));
  }
  int v20 = v19;
  uint64_t v21 = [a2 _bytesLengthForExternalReference];
  uint64_t v22 = malloc_type_malloc(0x40000uLL, 0x100004077774924uLL);
  off_t v23 = 0;
  if (v21 >= 0x40000) {
    size_t v24 = 0x40000;
  }
  else {
    size_t v24 = v21;
  }
  do
  {
    objc_msgSend(v6, "getBytes:range:", v22, v23, v24);
    if (pwrite(v20, v22, v24, v23) != v24)
    {
      uint64_t v34 = *__error();
      close(v20);
      free(v5);
      free(v22);
      uint64_t v35 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v36 = *MEMORY[0x1E4F1C3B8];
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Can't create externalDataReference interim file : %d", v34);
      v47[0] = @"Problem Path";
      uint64_t v38 = [NSString stringWithUTF8String:v45];
      v47[1] = @"com.apple.coredata.ubiquity.eat";
      v48[0] = v38;
      v48[1] = MEMORY[0x1E4F1CC38];
      uint64_t v39 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v40 = v48;
      uint64_t v41 = v47;
      goto LABEL_29;
    }
    v21 -= v24;
    v23 += v24;
    if (v21 >= 0x40000) {
      size_t v24 = 0x40000;
    }
    else {
      size_t v24 = v21;
    }
  }
  while (v21 > 0);
  uint64_t v25 = [a2 preferredProtectionLevel];
  fcntl(v20, 64, v25);
  close(v20);
  uint64_t v26 = [a2 _safeguardLocation];
  if (v26)
  {
    uint64_t v46 = 0;
    if (+[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, v7, [NSString stringWithUTF8String:v26], v25, &v46))
    {
      [a2 doCleanupOnDealloc];
    }
    else
    {
      _NSCoreDataLog(1, @"Failed to clone external data reference from %@ to %@ error: %@", v27, v28, v29, v30, v31, v32, v7);
    }
  }
  free(v5);
  uint64_t v18 = (char *)v22;
LABEL_26:
  free(v18);
  return v7;
}

+ (BOOL)createExternalReferenceLinkFromPath:(uint64_t)a3 toPath:(uint64_t)a4 protectionLevel:(void *)a5 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  self;
  id v30 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtPath:toPath:error:", a2, a3, &v30) & 1) == 0)
  {
    if ([v30 code] != 516
      || (uint64_t v9 = (void *)[v30 domain],
          ![v9 isEqualToString:*MEMORY[0x1E4F281F8]]))
    {
      if (v30)
      {
        if (a5)
        {
          BOOL result = 0;
          *a5 = v30;
          return result;
        }
      }
      else
      {
        uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m");
        uint64_t v25 = __pflogFaultLog;
        BOOL result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!result) {
          return result;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_PFRoutines.m";
        __int16 v33 = 1024;
        int v34 = 2111;
        _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      return 0;
    }
    id v30 = 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v35[0] = a2;
  v35[1] = a3;
  uint64_t v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = open((const char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) UTF8String], 1, 420);
        if (v15 >= 1)
        {
          int v16 = v15;
          fcntl(v15, 64, a4);
          close(v16);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v12);
  }
  return 1;
}

+ (uint64_t)moveInterimFileToPermanentLocation:(uint64_t)a1
{
  v14[2] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v3 = (const std::__fs::filesystem::path *)[a2 _externalReferenceLocation];
  size_t v4 = strlen((const char *)v3);
  size_t v5 = (std::__fs::filesystem::path *)malloc_type_calloc(1uLL, v4 + 9, 0x6BEAF62CuLL);
  strcat(&strncat((char *)v5, (const char *)v3, v4)[v4 - 1], ".interim");
  rename(v5, v3, v6);
  if (v7)
  {
    uint64_t v9 = *__error();
    free(v5);
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Can't copy interim file to permanent location : %d", v9);
    v13[0] = @"Problem object";
    v13[1] = @"com.apple.coredata.ubiquity.eat";
    v14[0] = a2;
    v14[1] = MEMORY[0x1E4F1CC38];
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 2)));
  }
  free(v5);
  return 1;
}

+ (void)readExternalReferenceDataFromFile:(uint64_t)a1
{
  v29[1] = *MEMORY[0x1E4F143B8];
  self;
  if (![a2 hasExternalReferenceContent]) {
    return 0;
  }
  uint64_t v3 = (const char *)[a2 _safeguardLocation];
  if (v3)
  {
    size_t v4 = v3;
    int v5 = open(v3, 0);
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    size_t v4 = (const char *)[a2 _externalReferenceLocation];
    int v6 = open(v4, 0);
    if (v6 < 0)
    {
      int v7 = __error();
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to open file with path: %s (%d)", v4, *v7);
      long long v26 = @"com.apple.coredata.ubiquity.eat";
      uint64_t v27 = MEMORY[0x1E4F1CC38];
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = &v27;
      uint64_t v13 = &v26;
LABEL_13:
      uint64_t v20 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      uint64_t v21 = v8;
      uint64_t v22 = v9;
LABEL_14:
      objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v10 userInfo:v20]);
    }
  }
  else
  {
    size_t v4 = (const char *)[a2 _externalReferenceLocation];
    int v6 = open(v4, 0);
    if (v6 < 0)
    {
      uint64_t v23 = __error();
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to open file with path %s (%d)", v4, *v23);
      long long v28 = @"com.apple.coredata.ubiquity.eat";
      v29[0] = MEMORY[0x1E4F1CC38];
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = v29;
      uint64_t v13 = &v28;
      goto LABEL_13;
    }
  }
  int v5 = v6;
LABEL_9:
  fcntl(v5, 48, 1);
  size_t v15 = [a2 _bytesLengthForExternalReference];
  uint64_t v14 = PF_CALLOC_UNSCANNED_BYTES(v15);
  ssize_t v16 = read(v5, v14, v15);
  close(v5);
  if (v16 != v15)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    uint64_t v10 = [NSString stringWithFormat:@"Missing bytes from file at path %s, expected %lu, got %lu", v4, v15, v16];
    uint64_t v24 = @"com.apple.coredata.ubiquity.eat";
    uint64_t v25 = MEMORY[0x1E4F1CC38];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v21 = v18;
    uint64_t v22 = v19;
    goto LABEL_14;
  }
  return v14;
}

+ (uint64_t)readBytesForExternalReferenceData:(void *)a3 intoBuffer:(off_t)a4 range:(size_t)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t result = [a2 hasExternalReferenceContent];
  if (!result) {
    return result;
  }
  uint64_t v10 = (const char *)[a2 _safeguardLocation];
  if (!v10)
  {
    uint64_t v11 = (const char *)[a2 _externalReferenceLocation];
    int v13 = open(v11, 0);
    if (v13 < 0)
    {
      long long v28 = __error();
      size_t v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3C8];
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to open file with path: %s (%d)", v11, *v28);
      uint64_t v35 = @"com.apple.coredata.ubiquity.eat";
      v36[0] = MEMORY[0x1E4F1CC38];
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v19 = v36;
      uint64_t v20 = &v35;
      goto LABEL_14;
    }
LABEL_7:
    int v12 = v13;
    goto LABEL_8;
  }
  uint64_t v11 = v10;
  int v12 = open(v10, 0);
  if (v12 < 0)
  {
    uint64_t v11 = (const char *)[a2 _externalReferenceLocation];
    int v13 = open(v11, 0);
    if (v13 < 0)
    {
      uint64_t v14 = __error();
      size_t v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3C8];
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to open file with path: %s (%d)", v11, *v14);
      __int16 v33 = @"com.apple.coredata.ubiquity.eat";
      uint64_t v34 = MEMORY[0x1E4F1CC38];
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v19 = &v34;
      uint64_t v20 = &v33;
LABEL_14:
      uint64_t v25 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
      long long v26 = v15;
      uint64_t v27 = v16;
LABEL_15:
      objc_exception_throw((id)[v26 exceptionWithName:v27 reason:v17 userInfo:v25]);
    }
    goto LABEL_7;
  }
LABEL_8:
  fcntl(v12, 48, 1);
  ssize_t v21 = pread(v12, a3, a5, a4);
  if (v21 < 0)
  {
    close(v12);
    size_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to read content of file with path: %s (%d)", v11, *__error());
    uint64_t v31 = @"com.apple.coredata.ubiquity.eat";
    uint64_t v32 = MEMORY[0x1E4F1CC38];
    uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = &v32;
    uint64_t v20 = &v31;
    goto LABEL_14;
  }
  ssize_t v22 = v21;
  uint64_t result = close(v12);
  if (v22 != a5)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to read requested number of bytes from path: %s (got %lu)", v11, v22);
    long long v29 = @"com.apple.coredata.ubiquity.eat";
    uint64_t v30 = MEMORY[0x1E4F1CC38];
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    long long v26 = v23;
    uint64_t v27 = v24;
    goto LABEL_15;
  }
  return result;
}

+ (uint64_t)deleteFileForPFExternalReferenceData:(uint64_t)a1
{
  self;
  uint64_t result = [a2 hasExternalReferenceContent];
  if (result)
  {
    uint64_t v4 = [a2 externalReferenceLocationString];
    int v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t result = [v5 fileExistsAtPath:v4];
    if (result)
    {
      return [v5 removeItemAtPath:v4 error:0];
    }
  }
  return result;
}

+ (BOOL)_isInMemoryStore:(uint64_t)a1
{
  if ((__CFString *)[a2 type] != @"SQLite") {
    return [a2 type] == (void)@"InMemory";
  }
  if (a2) {
    return (a2[201] >> 6) & 1;
  }
  return 0;
}

+ (uint64_t)_createNicksBase64EncodedStringFromData:(uint64_t)a1
{
  self;
  uint64_t v3 = [a2 bytes];
  unint64_t v4 = [a2 length];
  uint64_t v5 = (2 * ((v4 * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL;
  int v6 = malloc_type_calloc(v5 + (v5 + 4) / 0x4CuLL + 5, 1uLL, 0x100004077774924uLL);
  int v7 = v6;
  if (!v4)
  {
    unsigned int v9 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = 0;
  unsigned int v9 = 0;
  do
  {
    unsigned int v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      unsigned int v12 = v9 + 1;
      v6[v9] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[((unint64_t)(*(unsigned __int8 *)(v3 + v8) | (*(unsigned __int8 *)(v3 + v8 - 1) << 8)) >> 6) & 0x3F];
      unint64_t v11 = *(unsigned char *)(v3 + v8) & 0x3F;
      int v13 = 2;
LABEL_10:
      v9 += v13;
      v6[v12] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[v11];
      goto LABEL_11;
    }
    if (v10 == 1)
    {
      unint64_t v11 = ((unint64_t)(*(unsigned __int8 *)(v3 + v8) | (*(unsigned __int8 *)(v3 + v8 - 1) << 8)) >> 4) & 0x3F;
      goto LABEL_9;
    }
    if (!v10)
    {
      unint64_t v11 = (unint64_t)*(unsigned __int8 *)(v3 + v8) >> 2;
LABEL_9:
      int v13 = 1;
      unsigned int v12 = v9;
      goto LABEL_10;
    }
LABEL_11:
    if (v9)
    {
      HIDWORD(v14) = 678152731 * v9;
      LODWORD(v14) = 678152731 * v9;
      if ((v14 >> 2) <= 0x35E50D7) {
        v6[v9++] = 10;
      }
    }
    ++v8;
  }
  while (v4 > v8);
  unsigned int v15 = v8 % 3;
  uint64_t v16 = v3 + v8;
  if (v15 == 2)
  {
    char v19 = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[4 * (*(unsigned char *)(v16 - 1) & 0xF)];
    int v18 = 2;
    int v20 = 1;
    unsigned int v17 = v9;
LABEL_20:
    unsigned int v21 = v20 + v9;
    v6[v17] = v19;
    v9 += v18;
    v6[v21] = 61;
  }
  else if (v15 == 1)
  {
    unsigned int v17 = v9 + 1;
    v6[v9] = _createNicksBase64EncodedStringFromData____NSCoreDataNicksBase64EncodingTable[16
                                                                                         * (*(unsigned char *)(v16 - 1) & 3)];
    int v18 = 3;
    char v19 = 61;
    int v20 = 2;
    goto LABEL_20;
  }
LABEL_21:
  id v22 = [NSString alloc];

  return [v22 initWithBytesNoCopy:v7 length:v9 encoding:1 freeWhenDone:1];
}

+ (void)getIndexes:(void *)a3 fromCollection:(void *)a4 forObjectsInCollection:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  self;
  if ([a4 count])
  {
    long long v81 = 0u;
    long long v80 = 0u;
    long long v79 = 0u;
    long long v78 = 0u;
    long long v77 = 0u;
    long long v76 = 0u;
    long long v75 = 0u;
    long long v74 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v7 = [a3 count];
    uint64_t v32 = &v31;
    unint64_t v8 = MEMORY[0x1F4188790](v7);
    unint64_t v11 = (const void **)((char *)&v31 - v10);
    size_t v12 = 8 * v9;
    unint64_t v31 = v8;
    if (v8 > 0x200)
    {
      unint64_t v11 = (const void **)NSAllocateScannedUncollectable();
      uint64_t v34 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v31 - v10, 8 * v9);
      MEMORY[0x1F4188790](v13);
      uint64_t v34 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v34, v12);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v49, 16, v31, v32);
    __int16 v33 = v11;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v44;
      do
      {
        uint64_t v18 = 0;
        char v19 = (char *)&v11[v16];
        int v20 = &v34[8 * v16];
        do
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * v18);
          *(void *)&v20[8 * v18] = v16 + v18 + 1;
          *(void *)&v19[8 * v18++] = v21;
        }
        while (v15 != v18);
        uint64_t v15 = [a3 countByEnumeratingWithState:&v43 objects:v49 count:16];
        v16 += v18;
        unint64_t v11 = v33;
      }
      while (v15);
    }
    memset(v42, 0, sizeof(v42));
    [a4 countByEnumeratingWithState:v42 objects:&v48 count:16];
    unint64_t v22 = v31;
    CFAllocatorRef v23 = _PFStackAllocatorCreate((unint64_t *)&v50, 1024);
    memset(v39, 0, sizeof(v39));
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
    uint64_t v41 = *(void *)(MEMORY[0x1E4F1D530] + 40);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = (const CFDictionaryKeyCallBacks *)v39;
    }
    CFDictionaryRef v25 = CFDictionaryCreate(v23, v11, (const void **)v34, v22, v24, 0);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v26 = [a4 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      int v28 = 0;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(a4);
          }
          *(_DWORD *)(a2 + 4 * (v28 + i)) = CFDictionaryGetValue(v25, *(const void **)(*((void *)&v35 + 1)+ 8 * i))- 1;
        }
        uint64_t v27 = [a4 countByEnumeratingWithState:&v35 objects:v47 count:16];
        v28 += i;
      }
      while (v27);
    }
    if (v22 >= 0x201)
    {
      NSZoneFree(0, v34);
      NSZoneFree(0, v33);
    }
    if (*((void *)&v51 + 1))
    {
      if (v25) {
        CFRelease(v25);
      }
    }
  }
}

+ (uint64_t)newMutableOrderedSetFromCollection:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v3 = [a2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 > 0x200) {
    uint64_t v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
  }
  [a2 getObjects:v7];
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v8;
}

+ (uint64_t)_objectsInOrderedCollection:(void *)a3 formSubstringInOrderedCollection:
{
  self;
  uint64_t v5 = [a2 count];
  if (v5 - 1 >= (unint64_t)[a3 count]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [a2 count] + v6;
  if (v8 > [a3 count]) {
    return 0;
  }
  uint64_t v10 = [a2 count];
  if (!v10) {
    return 1;
  }
  unint64_t v11 = v10;
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "isEqual:", objc_msgSend(a3, "objectAtIndex:", v7));
  if (result)
  {
    uint64_t v12 = 1;
    do
    {
      unint64_t v13 = v12;
      if (v11 == v12) {
        break;
      }
      int v14 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v12), "isEqual:", objc_msgSend(a3, "objectAtIndex:", v7 + v12));
      uint64_t v12 = v13 + 1;
    }
    while (v14);
    return v13 >= v11;
  }
  return result;
}

+ (uint64_t)newOrderedSetFromCollection:(void *)a3 byInsertingItems:(uint64_t)a4 atIndex:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self;
  if ([a3 count])
  {
    uint64_t v7 = [a2 count];
    unint64_t v8 = [a3 count];
    unint64_t v9 = [a2 count];
    unint64_t v10 = v9;
    if (v9 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9;
    }
    if (v9 >= 0x201) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    unint64_t v13 = (char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9 > 0x200) {
      unint64_t v13 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
    }
    unint64_t v17 = v7 + v8 + 1;
    if (v17 > 1) {
      uint64_t v18 = v7 + v8 + 1;
    }
    else {
      uint64_t v18 = 1;
    }
    if (v17 >= 0x201) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    int v20 = (char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v30[1] = v30;
    unint64_t v31 = v7 + v8 + 1;
    unint64_t v32 = v10;
    if (v17 > 0x200) {
      int v20 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v18);
    }
    if (v8 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
    CFAllocatorRef v23 = (char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200) {
      CFAllocatorRef v23 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v30 - ((8 * v22 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v21);
    }
    uint64_t v33 = v7;
    [a2 getObjects:v13];
    [a3 getObjects:v23];
    memmove(v20, v13, 8 * a4);
    if (v8)
    {
      int v24 = 0;
      CFDictionaryRef v25 = v23;
      unint64_t v26 = v8;
      uint64_t v27 = a4;
      do
      {
        if (([a2 containsObject:*(void *)v25] & 1) == 0)
        {
          *(void *)&v20[8 * a4++] = *(void *)v25;
          ++v24;
        }
        v25 += 8;
        --v26;
      }
      while (v26);
    }
    else
    {
      uint64_t v27 = a4;
      int v24 = 0;
    }
    uint64_t v28 = v33;
    if (v33 != v27) {
      memmove(&v20[8 * v24 + 8 * v27], &v13[8 * v27], 8 * (v33 - v27));
    }
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v20 count:v28 + v24];
    if (v32 >= 0x201) {
      NSZoneFree(0, v13);
    }
    if (v31 >= 0x201) {
      NSZoneFree(0, v20);
    }
    if (v8 >= 0x201) {
      NSZoneFree(0, v23);
    }
    return v29;
  }
  else
  {
    int v14 = [a2 isNSArray];
    id v15 = objc_alloc(MEMORY[0x1E4F1CA70]);
    if (v14)
    {
      return [v15 initWithArray:a2];
    }
    else
    {
      return [v15 initWithOrderedSet:a2];
    }
  }
}

+ (id)newOrderedSetFromCollection:(void *)a3 byRemovingItems:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = MEMORY[0x1F4188790](v6);
    unint64_t v10 = (char *)v33 - v9;
    if (v8 > 0x200)
    {
      uint64_t v11 = NSAllocateScannedUncollectable();
      unint64_t v10 = (char *)v11;
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      bzero((char *)v33 - v9, 8 * v8);
      if (v5)
      {
LABEL_4:
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        MEMORY[0x1F4188790](v11);
        unint64_t v34 = v7;
        unint64_t v35 = v5;
        v33[2] = v13;
        if (v5 > 0x200)
        {
          long long v36 = (const void **)NSAllocateScannedUncollectable();
        }
        else
        {
          long long v36 = (const void **)((char *)v33 - v12);
          bzero((char *)v33 - v12, 8 * v5);
        }
        v33[1] = v33;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v17 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = 0;
          uint64_t v20 = *(void *)v45;
          do
          {
            uint64_t v21 = 0;
            uint64_t v22 = &v36[v19];
            do
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(a3);
              }
              v22[v21] = *(const void **)(*((void *)&v44 + 1) + 8 * v21);
              ++v21;
            }
            while (v18 != v21);
            uint64_t v18 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
            v19 += v21;
          }
          while (v18);
        }
        CFAllocatorRef v23 = _PFStackAllocatorCreate((unint64_t *)&v50, 1024);
        uint64_t v24 = *MEMORY[0x1E4F1D548];
        v41[1] = 0;
        v41[2] = 0;
        v41[0] = v24;
        long long v42 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
        uint64_t v43 = *(void *)(MEMORY[0x1E4F1D548] + 40);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CFDictionaryRef v25 = 0;
        }
        else {
          CFDictionaryRef v25 = (const CFSetCallBacks *)v41;
        }
        CFSetRef v26 = CFSetCreate(v23, v36, v35, v25);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v27 = [a2 countByEnumeratingWithState:&v37 objects:v48 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          unint64_t v16 = 0;
          uint64_t v29 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v38 != v29) {
                objc_enumerationMutation(a2);
              }
              unint64_t v31 = *(const void **)(*((void *)&v37 + 1) + 8 * i);
              if (!CFSetGetValue(v26, v31)) {
                *(void *)&v10[8 * v16++] = v31;
              }
            }
            uint64_t v28 = [a2 countByEnumeratingWithState:&v37 objects:v48 count:16];
          }
          while (v28);
        }
        else
        {
          unint64_t v16 = 0;
        }
        if (v35 >= 0x201) {
          NSZoneFree(0, v36);
        }
        unint64_t v7 = v34;
        if (*((void *)&v51 + 1))
        {
          if (v26) {
            CFRelease(v26);
          }
        }
        else
        {
          *((void *)&v50 + 1) = v50;
        }
        goto LABEL_39;
      }
    }
    [a2 getObjects:v10];
    unint64_t v16 = v7;
LABEL_39:
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v10 count:v16];
    if (v7 >= 0x201) {
      NSZoneFree(0, v10);
    }
    return (id)v32;
  }
  int v14 = (objc_class *)MEMORY[0x1E4F1CA70];

  return objc_alloc_init(v14);
}

+ (id)newMutableSetFromCollection:(void *)a3 byIntersectingWithCollection:
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v5 = [a2 count];
  uint64_t v6 = [a3 count];
  if (v5 && (unint64_t v7 = v6) != 0)
  {
    uint64_t v35 = (uint64_t)&v35;
    MEMORY[0x1F4188790](v6);
    uint64_t v9 = (char *)&v35 - v8;
    if (v5 > 0x200)
    {
      uint64_t v10 = NSAllocateScannedUncollectable();
      uint64_t v9 = (char *)v10;
    }
    else
    {
      bzero((char *)&v35 - v8, 8 * v5);
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    MEMORY[0x1F4188790](v10);
    int v14 = (const void **)((char *)&v35 - v13);
    if (v7 > 0x200) {
      int v14 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v35 - v13, 8 * v7);
    }
    unint64_t v36 = v7;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v35);
    unint64_t v37 = v5;
    long long v38 = v14;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v47;
      do
      {
        uint64_t v19 = 0;
        uint64_t v20 = (char *)&v14[v17];
        do
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(a3);
          }
          *(void *)&v20[8 * v19] = *(void *)(*((void *)&v46 + 1) + 8 * v19);
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [a3 countByEnumeratingWithState:&v46 objects:v51 count:16];
        v17 += v19;
        int v14 = v38;
      }
      while (v16);
    }
    CFAllocatorRef v21 = _PFStackAllocatorCreate((unint64_t *)&v52, 1024);
    uint64_t v22 = *MEMORY[0x1E4F1D548];
    v43[1] = 0;
    v43[2] = 0;
    v43[0] = v22;
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
    uint64_t v45 = *(void *)(MEMORY[0x1E4F1D548] + 40);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFAllocatorRef v23 = 0;
    }
    else {
      CFAllocatorRef v23 = (const CFSetCallBacks *)v43;
    }
    uint64_t v24 = v14;
    unint64_t v25 = v36;
    CFSetRef v26 = CFSetCreate(v21, v24, v36, v23);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v27 = [a2 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(a2);
          }
          uint64_t v32 = *(const void **)(*((void *)&v39 + 1) + 8 * i);
          if (CFSetGetValue(v26, v32)) {
            *(void *)&v9[8 * v29++] = v32;
          }
        }
        uint64_t v28 = [a2 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v28);
    }
    else
    {
      uint64_t v29 = 0;
    }
    if (v25 >= 0x201) {
      NSZoneFree(0, v38);
    }
    unint64_t v33 = v37;
    if (*((void *)&v53 + 1))
    {
      if (v26) {
        CFRelease(v26);
      }
    }
    else
    {
      *((void *)&v52 + 1) = v52;
    }
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:v9 count:v29];
    if (v33 >= 0x201) {
      NSZoneFree(0, v9);
    }
    return (id)v34;
  }
  else
  {
    uint64_t v11 = (objc_class *)MEMORY[0x1E4F1CA80];
    return objc_alloc_init(v11);
  }
}

+ (id)newMutableArrayFromCollection:(void *)a3 byRemovingItems:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v5 = [a3 count];
  uint64_t v6 = [a2 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = MEMORY[0x1F4188790](v6);
    uint64_t v10 = (char *)v33 - v9;
    if (v8 > 0x200)
    {
      uint64_t v11 = NSAllocateScannedUncollectable();
      uint64_t v10 = (char *)v11;
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      bzero((char *)v33 - v9, 8 * v8);
      if (v5)
      {
LABEL_4:
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        MEMORY[0x1F4188790](v11);
        unint64_t v34 = v7;
        unint64_t v35 = v5;
        v33[2] = v13;
        if (v5 > 0x200)
        {
          unint64_t v36 = (const void **)NSAllocateScannedUncollectable();
        }
        else
        {
          unint64_t v36 = (const void **)((char *)v33 - v12);
          bzero((char *)v33 - v12, 8 * v5);
        }
        v33[1] = v33;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v17 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = 0;
          uint64_t v20 = *(void *)v45;
          do
          {
            uint64_t v21 = 0;
            uint64_t v22 = &v36[v19];
            do
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(a3);
              }
              v22[v21] = *(const void **)(*((void *)&v44 + 1) + 8 * v21);
              ++v21;
            }
            while (v18 != v21);
            uint64_t v18 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
            v19 += v21;
          }
          while (v18);
        }
        CFAllocatorRef v23 = _PFStackAllocatorCreate((unint64_t *)&v50, 1024);
        uint64_t v24 = *MEMORY[0x1E4F1D548];
        v41[1] = 0;
        v41[2] = 0;
        v41[0] = v24;
        long long v42 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 24);
        uint64_t v43 = *(void *)(MEMORY[0x1E4F1D548] + 40);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v25 = 0;
        }
        else {
          unint64_t v25 = (const CFSetCallBacks *)v41;
        }
        CFSetRef v26 = CFSetCreate(v23, v36, v35, v25);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v27 = [a2 countByEnumeratingWithState:&v37 objects:v48 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          unint64_t v16 = 0;
          uint64_t v29 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v38 != v29) {
                objc_enumerationMutation(a2);
              }
              unint64_t v31 = *(const void **)(*((void *)&v37 + 1) + 8 * i);
              if (!CFSetGetValue(v26, v31)) {
                *(void *)&v10[8 * v16++] = v31;
              }
            }
            uint64_t v28 = [a2 countByEnumeratingWithState:&v37 objects:v48 count:16];
          }
          while (v28);
        }
        else
        {
          unint64_t v16 = 0;
        }
        if (v35 >= 0x201) {
          NSZoneFree(0, v36);
        }
        unint64_t v7 = v34;
        if (*((void *)&v51 + 1))
        {
          if (v26) {
            CFRelease(v26);
          }
        }
        else
        {
          *((void *)&v50 + 1) = v50;
        }
        goto LABEL_39;
      }
    }
    [a2 getObjects:v10];
    unint64_t v16 = v7;
LABEL_39:
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v10 count:v16];
    if (v7 >= 0x201) {
      NSZoneFree(0, v10);
    }
    return (id)v32;
  }
  int v14 = (objc_class *)MEMORY[0x1E4F1CA48];

  return objc_alloc_init(v14);
}

+ (id)_newCollectionFromCollection:(uint64_t)a3 forParentContext:(objc_class *)a4 andClass:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v7 = [a2 count];
  if (v7)
  {
    unint64_t v8 = v7;
    if (v7 >= 0x201) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v7;
    }
    unint64_t v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v11 = (char *)v21 - v10;
    if (v7 > 0x200) {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v21 - v10, 8 * v7);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v21[1] = v21;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(a2);
          }
          *(void *)&v11[8 * v15 + 8 * i] = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) objectID], a3);
        }
        uint64_t v14 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
        v15 += i;
      }
      while (v14);
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v18 = [[a4 alloc] initWithObjects:v11 count:v15];
    uint64_t v19 = 0;
    if (v8 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v8;
    }
    do

    while (v20 != v19);
    if (v8 >= 0x201) {
      NSZoneFree(0, v11);
    }
    return (id)v18;
  }
  else
  {
    return objc_alloc_init(a4);
  }
}

+ (id)newMutableArrayFromCollection:(uint64_t)a3 forParentContext:
{
  self;
  unint64_t v5 = (objc_class *)objc_opt_class();

  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)newMutableSetFromCollection:(uint64_t)a3 forParentContext:
{
  self;
  unint64_t v5 = (objc_class *)objc_opt_class();

  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)newMutableOrderedSetFromCollection:(uint64_t)a3 forParentContext:
{
  self;
  unint64_t v5 = (objc_class *)objc_opt_class();

  return +[_PFRoutines _newCollectionFromCollection:forParentContext:andClass:]((uint64_t)_PFRoutines, a2, a3, v5);
}

+ (id)_replaceBaseline:(void *)a3 inOrderedSet:(void *)a4 withOrderedSet:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v7 = [a3 count];
  uint64_t v8 = [a2 count];
  if (v7)
  {
    uint64_t v9 = v8;
    if ([a4 count])
    {
      if (v9)
      {
        uint64_t v10 = objc_msgSend(a3, "indexOfObject:", objc_msgSend(a2, "firstObject"));
        if (v10)
        {
          uint64_t v11 = v10;
          if (v10 + v9 == v7)
          {
            unint64_t v12 = v7 - v9;
            uint64_t v13 = [a4 count];
            unint64_t v14 = v13 + v12;
            MEMORY[0x1F4188790](v13);
            uint64_t v17 = (char *)&v37 - v16;
            if (v14 > 0x200) {
              uint64_t v17 = (char *)NSAllocateScannedUncollectable();
            }
            else {
              bzero((char *)&v37 - v16, 8 * v15);
            }
            objc_msgSend(a3, "getObjects:range:", v17, 0, v12);
            long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v17 count:v12];
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            uint64_t v25 = [a4 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v38 != v27) {
                    objc_enumerationMutation(a4);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                  if (([v24 containsObject:v29] & 1) == 0) {
                    *(void *)&v17[8 * v12++] = v29;
                  }
                }
                uint64_t v26 = [a4 countByEnumeratingWithState:&v37 objects:v41 count:16];
              }
              while (v26);
            }

            uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:v17 count:v12];
            if (v14 >= 0x201) {
              NSZoneFree(0, v17);
            }
          }
          else
          {
            MEMORY[0x1F4188790](v10);
            long long v23 = (char *)&v37 - v22;
            if (v7 > 0x200) {
              long long v23 = (char *)NSAllocateScannedUncollectable();
            }
            else {
              bzero((char *)&v37 - v22, 8 * v7);
            }
            [a3 getObjects:v23];
            unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v23 count:v7];
            if (v7 >= 0x201) {
              NSZoneFree(0, v23);
            }
            uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v9);
            if (v9 == [a4 count])
            {
              if (([a4 isNSArray] & 1) == 0) {
                a4 = (void *)[a4 array];
              }
              [v31 replaceObjectsAtIndexes:v32 withObjects:a4];
            }
            else
            {
              [v31 removeObjectsAtIndexes:v32];
              uint64_t v33 = [a4 count];
              uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v33);
              if ([a4 isNSArray])
              {
                unint64_t v35 = v31;
                uint64_t v36 = (uint64_t)a4;
              }
              else
              {
                uint64_t v36 = [a4 array];
                unint64_t v35 = v31;
              }
              [v35 insertObjects:v36 atIndexes:v34];
            }
            uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v31];
          }
          return (id)v30;
        }
        uint64_t v21 = objc_msgSend(a3, "objectsAtIndexes:", objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v9, v7 - v9));
        uint64_t v20 = a4;
      }
      else
      {
        uint64_t v20 = a4;
        uint64_t v21 = a3;
      }
      return +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v20, v21);
    }
    else if (v9)
    {
      return +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, a3, a2);
    }
    else
    {
      return (id)+[_PFRoutines newMutableOrderedSetFromCollection:]((uint64_t)_PFRoutines, a3);
    }
  }
  else if ([a4 isNSOrderedSet])
  {
    return (id)[a4 mutableCopy];
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1CA70]);
    return (id)[v19 initWithArray:a4];
  }
}

+ (uint64_t)_expressionIsCompoundIndexCompatible:(uint64_t)a1
{
  self;
  uint64_t result = [a2 expressionType];
  if (result != 1)
  {
    if (result == 3)
    {
      uint64_t v4 = [a2 keyPath];
      return [@"self" caseInsensitiveCompare:v4]
          || [@"self" caseInsensitiveCompare:v4] != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (__CFDictionary)_createDictionaryPartitioningObjectIDs:(id)a3 intoHierarchies:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(&callBacks, 0, sizeof(callBacks));
  callBacks.copyDescriptiouint64_t n = *(CFSetCopyDescriptionCallBack *)(MEMORY[0x1E4F1D548] + 24);
  memset(&keyCallBacks, 0, 24);
  *(_OWORD *)&keyCallBacks.copyDescriptiouint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D530] + 24);
  keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E4F1D530] + 40);
  valueCallBacks.versiouint64_t n = 0;
  *(_OWORD *)&valueCallBacks.retaiuint64_t n = *(_OWORD *)(MEMORY[0x1E4F1D540] + 8);
  valueCallBacks.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D540] + 24);
  valueCallBacks.equal = 0;
  CFDictionaryRef v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, &valueCallBacks);
  CFIndex v7 = [a3 count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        unint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = [v12 entity];
        if (v4)
        {
          if (v13)
          {
            if ((*(unsigned char *)(v13 + 120) & 4) != 0)
            {
              unint64_t v14 = *(const void **)(v13 + 72);
            }
            else
            {
              do
              {
                unint64_t v14 = (const void *)v13;
                uint64_t v13 = [(id)v13 superentity];
              }
              while (v13);
            }
          }
          else
          {
            unint64_t v14 = 0;
          }
        }
        else
        {
          unint64_t v14 = (const void *)v13;
        }
        Value = (void *)CFDictionaryGetValue(v6, v14);
        if (!Value)
        {
          Value = CFSetCreateMutable(0, v7, &callBacks);
          CFDictionarySetValue(v6, v14, Value);
          CFRelease(Value);
        }
        CFSetAddValue((CFMutableSetRef)Value, v12);
        ++v11;
      }
      while (v11 != v9);
      uint64_t v16 = [a3 countByEnumeratingWithState:&v18 objects:v25 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }
  return v6;
}

+ (uint64_t)fetchHeterogeneousCollectionByObjectIDs:(uint64_t)a3 intoContext:
{
  self;
  self;
  unint64_t v5 = +[_PFRoutines _createDictionaryPartitioningObjects:a2 intoHierarchies:1];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  unint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  uint64_t v14 = 0;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke;
  v8[3] = &unk_1E544BCD8;
  v8[4] = a3;
  v8[5] = &v9;
  [(__CFDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v8];

  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (__CFDictionary)createDictionaryPartitioningObjectsIDByRootEntity:(uint64_t)a1
{
  self;

  return +[_PFRoutines _createDictionaryPartitioningObjectIDs:a2 intoHierarchies:1];
}

+ (uint64_t)isUbiquitousURLUploaded:(uint64_t)a3 error:
{
  self;
  id v6 = 0;
  uint64_t result = [a2 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C790] error:a3];
  if (result) {
    return [v6 BOOLValue];
  }
  return result;
}

+ (uint64_t)isUbiquitousURLDownloaded:(uint64_t)a3 error:
{
  self;
  id v6 = 0;
  uint64_t result = [a2 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C758] error:a3];
  if (result) {
    return [v6 BOOLValue];
  }
  return result;
}

+ (BOOL)isSanitizedVersionOf:(void *)a3 equalTo:
{
  self;
  unint64_t v5 = (const char *)[a2 UTF8String];
  id v6 = (const char *)[a3 UTF8String];
  size_t v7 = strlen(v6);
  return strncmp(v5, v6, v7) == 0;
}

+ (void)applicationDeactivateLifecyleNotifications
{
  return &unk_1ED7E97A8;
}

+ (void)applicationActivateLifecyleNotifications
{
  return &unk_1ED7E97C0;
}

+ (void)wrapBlockInGuardedAutoreleasePool:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  (*((void (**)(id))a3 + 2))(a3);
}

+ (void)efficientlyEnumerateManagedObjectsInFetchRequest:(void *)a3 usingManagedObjectContext:(uint64_t)a4 andApplyBlock:
{
  v52[1] = *MEMORY[0x1E4F143B8];
  self;
  if (![a2 fetchBatchSize])
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v37 = *MEMORY[0x1E4F1C3C8];
    long long v51 = @"offendingFetch";
    v52[0] = a2;
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    long long v39 = @"This method can't be very efficient if you don't bother to set a batch size!";
    goto LABEL_24;
  }
  if ([a3 hasChanges])
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unpredictably (depending on the batching algorithm used and downstream code) leading to inconsistent behavior across platforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is reset between batches. Only call this method on clean contexts.");
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v40);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to begin batch processing with pending changes. At best these changes may be saved unpredictably (depending on the batching algorithm used and downstream code) leading to inconsistent behavior across platforms / datasets. At worst they will be forgotten, and references to them invalidated when the context is reset between batches. Only call this method on clean contexts.", buf, 2u);
    }
  }
  context = (void *)MEMORY[0x18C127630]();
  uint64_t v46 = 0;
  char v45 = 0;
  uint64_t v14 = (void *)[a3 queryGenerationToken];
  if (v14 == +[NSQueryGenerationToken unpinnedQueryGenerationToken])
  {
    uint64_t v15 = [NSString stringWithUTF8String:"Efficient batching requires the use of query generations: %@"];
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)a2);
    uint64_t v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v50 = a2;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Efficient batching requires the use of query generations: %@", buf, 0xCu);
    }
  }
  buf[0] = 0;
  uint64_t v23 = [a3 executeFetchRequest:a2 error:&v46];
  if (v23)
  {
    long long v24 = (void *)v23;
    long long v41 = a2;
    unint64_t v25 = [a2 fetchBatchSize];
    uint64_t v43 = v24;
    unint64_t v26 = [v24 count];
    if (v26 / v25 * v25 == v26) {
      uint64_t v27 = v26 / v25;
    }
    else {
      uint64_t v27 = v26 / v25 + 1;
    }
    if (v27)
    {
      unint64_t v28 = v26;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      unint64_t v31 = v25;
      while (1)
      {
        unint64_t v32 = v28 >= v31 ? v31 : v28;
        uint64_t v33 = v32 + v29;
        uint64_t v34 = (void *)MEMORY[0x18C127630]();
        unint64_t v35 = (void *)MEMORY[0x18C127630]();
        (*(void (**)(uint64_t, uint64_t, void, char *, uint8_t *))(a4 + 16))(a4, objc_msgSend(v43, "subarrayWithRange:", v30, v33), 0, &v45, buf);
        if (!v45)
        {
          if ([a3 hasChanges]) {
            break;
          }
        }
        [a3 reset];
        v30 += v25;
        v31 += v25;
        v29 -= v25;
        if (!--v27) {
          goto LABEL_22;
        }
      }
      uint64_t v36 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v37 = *MEMORY[0x1E4F1C3C8];
      long long v47 = @"offendingFetch";
      long long v48 = v41;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      long long v39 = @"Batch finished processing with pending changes in the moc. This prevents the context from being reset and purging rows / snapshots from memory. Please save at the end of each batch.";
LABEL_24:
      objc_exception_throw((id)[v36 exceptionWithName:v37 reason:v39 userInfo:v38]);
    }
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t, char *, uint8_t *))(a4 + 16))(a4, 0, v46, &v45, buf);
    char v45 = 1;
  }
LABEL_22:
  [a3 reset];
}

@end