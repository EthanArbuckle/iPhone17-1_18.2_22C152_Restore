@interface NSURL(FPFSHelpers)
- (BOOL)fp_deleteAllowingCoordination:()FPFSHelpers completionHandler:;
- (BOOL)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:;
- (id)_fp_lookupURLOfChildWithName:()FPFSHelpers notMatchingFileID:;
- (id)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:;
- (id)fp_isDatalessWithError:()FPFSHelpers;
- (id)fp_physicalURL;
- (id)fp_scanForURLOfChildWithName:()FPFSHelpers isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:;
- (id)fp_withReadWriteAccess:()FPFSHelpers;
- (uint64_t)fp_createSubFolder:()FPFSHelpers completionHandler:;
- (uint64_t)fp_deleteStaleBusyFileWithFileDescriptor:()FPFSHelpers coordinatorPurposeIdentifier:;
- (uint64_t)fp_deleteWithCompletionHandler:()FPFSHelpers;
- (uint64_t)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:;
- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:completionHandler:;
- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:usingBlock:completionHandler:;
- (uint64_t)fp_importUnderFolder:()FPFSHelpers completionHandler:;
- (uint64_t)fp_importUnderFolder:()FPFSHelpers usingBlock:completionHandler:;
- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:completionHandler:;
- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:moveHandler:completionHandler:;
- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:;
- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:;
- (uint64_t)fp_renameWithNewName:()FPFSHelpers allowCoordination:completionHandler:;
- (uint64_t)fp_renameWithNewName:()FPFSHelpers completionHandler:;
- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:allowCoordination:completionHandler:;
- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:completionHandler:;
- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowCoordination:completionHandler:;
- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:allowCoordination:completionHandler:;
- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:completionHandler:;
- (uint64_t)fp_trashUnderFolder:()FPFSHelpers allowCoordination:completionHandler:;
- (uint64_t)fp_trashUnderFolder:()FPFSHelpers completionHandler:;
- (uint64_t)getMaxChildrenCount;
- (void)fp_coordinatedDeleteWithHandler:()FPFSHelpers;
- (void)fp_defaultMoverBlock;
@end

@implementation NSURL(FPFSHelpers)

- (id)fp_isDatalessWithError:()FPFSHelpers
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0xB010000000;
  v26 = &unk_1A35160CD;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = a1;
  v5 = (const char *)[v4 fileSystemRepresentation];
  if ((lstat(v5, (stat *)(v24 + 4)) & 0x80000000) == 0) {
    goto LABEL_2;
  }
  if (*__error() == 63 && fpfs_supports_long_paths())
  {
    v7 = [v4 path];
    v8 = [v7 stringByDeletingLastPathComponent];

    v9 = [v4 path];
    v10 = [v9 lastPathComponent];

    id v11 = v8;
    int v12 = fpfs_open_longpath((char *)[v11 fileSystemRepresentation], 0x100000, 0);
    if (v12 < 0)
    {
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __45__NSURL_FPFSHelpers__fp_isDatalessWithError___block_invoke;
      v20 = &unk_1E5AF19C8;
      id v13 = v10;
      id v21 = v13;
      v22 = &v23;
      int v14 = fpfs_fchdir(v12, (uint64_t)&v17);
      int v15 = *__error();
      close(v12);
      *__error() = v15;

      if ((v14 & 0x80000000) == 0)
      {
LABEL_2:
        v6 = objc_msgSend(NSNumber, "numberWithInt:", (*((_DWORD *)v24 + 37) >> 30) & 1, v17, v18, v19, v20);
        goto LABEL_12;
      }
    }
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_12:
  _Block_object_dispose(&v23, 8);

  return v6;
}

- (void)fp_defaultMoverBlock
{
  return &__block_literal_global_6;
}

- (uint64_t)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:
{
  return objc_msgSend(a1, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", a3, a4, 0, 0, 0);
}

- (id)_fp_lookupURLOfChildWithName:()FPFSHelpers notMatchingFileID:
{
  id v6 = a4;
  v7 = [a1 URLByAppendingPathComponent:a3];
  id v18 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C5A0];
  int v9 = [v7 getResourceValue:&v18 forKey:*MEMORY[0x1E4F1C5A0] error:0];
  id v10 = v18;
  id v11 = v10;
  if (v9)
  {
    if (v6 && v10 && ([v6 isEqual:v10] & 1) != 0)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = v7;
      v7 = v12;
    }
  }
  else
  {
    id v13 = (void *)_CFURLPromiseCopyPhysicalURL();

    if (v13)
    {
      id v17 = 0;
      int v14 = [v13 getResourceValue:&v17 forKey:v8 error:0];
      id v15 = v17;

      if (!v14 || v6 && v15 && ([v6 isEqual:v15] & 1) != 0)
      {
        id v12 = 0;
        v7 = v13;
      }
      else
      {
        id v12 = v13;
        v7 = v12;
      }
      id v11 = v15;
    }
    else
    {
      id v12 = 0;
      v7 = 0;
    }
  }

  return v12;
}

- (id)fp_scanForURLOfChildWithName:()FPFSHelpers isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:
{
  v86[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = *MEMORY[0x1E4F1CDD0];
  uint64_t v73 = *MEMORY[0x1E4F1C6E8];
  v86[0] = *MEMORY[0x1E4F1C6E8];
  v86[1] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1C5A0];
  v86[2] = *MEMORY[0x1E4F1C5A0];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
  v68 = a1;
  v16 = [v12 enumeratorAtURL:a1 includingPropertiesForKeys:v15 options:1 errorHandler:0];

  id v82 = 0;
  v70 = v10;
  v69 = objc_msgSend(v10, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v82, 0, a4);
  id v17 = v82;
  id v18 = objc_alloc_init(FPNSURLBitVectorForBounce);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (!v20)
  {
    v22 = 0;
    id v42 = 0;
    v43 = v19;
    goto LABEL_56;
  }
  uint64_t v21 = v20;
  uint64_t v63 = v14;
  id obj = v19;
  v65 = v17;
  v66 = 0;
  v67 = v11;
  v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = *(void *)v79;
LABEL_3:
  uint64_t v25 = 0;
  uint64_t v64 = v23 + v21;
  while (1)
  {
    if (*(void *)v79 != v24) {
      objc_enumerationMutation(obj);
    }
    v26 = *(void **)(*((void *)&v78 + 1) + 8 * v25);
    long long v27 = (void *)MEMORY[0x1A6248870]();
    if (v23 + v25 > a5
      || [(FPNSURLBitVectorForBounce *)v18 foundAllAvailableBounceNumbers])
    {
      break;
    }
    id v77 = 0;
    int v28 = [v26 getResourceValue:&v77 forKey:v73 error:0];
    id v29 = v77;
    long long v30 = v29;
    if (v28) {
      BOOL v31 = v29 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_25;
    }
    if (_CFURLIsPromiseName())
    {
      uint64_t v32 = _CFURLCopyLogicalNameOfPromiseAtURL();

      long long v30 = (void *)v32;
      if (!v32) {
        goto LABEL_25;
      }
    }
    if (!v22 && ![v70 compare:v30 options:1])
    {
      if (v67)
      {
        id v76 = 0;
        char v38 = [v26 getResourceValue:&v76 forKey:v63 error:0];
        id v34 = v76;
        if ((v38 & 1) == 0)
        {
          v39 = fp_current_or_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            -[NSURL(FPFSHelpers) fp_scanForURLOfChildWithName:isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:](v83, v26, &v84, v39);
          }
        }
        if (v34 && ([v67 isEqual:v34] & 1) != 0)
        {
          v22 = 0;
          uint64_t v33 = (uint64_t)v30;
          goto LABEL_24;
        }
      }
      else
      {
        id v34 = 0;
      }
      id v40 = v26;
      v22 = v40;
      if (!a7)
      {
        id v53 = v40;

        id v42 = v66;
        id v11 = v67;
        id v17 = v65;
        id v19 = obj;
        goto LABEL_74;
      }

LABEL_17:
      id v75 = 0;
      uint64_t v33 = objc_msgSend(v30, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v75, 0, objc_msgSend(v26, "fp_isFolder"));
      id v34 = v75;

      if (v34 && ![v69 compare:v33 options:1])
      {
        unint64_t v35 = [v34 unsignedIntegerValue];
        if (v35 <= objc_msgSend(NSString, "fp_maximumBounceLevel")) {
          [(FPNSURLBitVectorForBounce *)v18 markBounceNumberAsFound:v34];
        }
        if (!v66 || (int v36 = [v66 intValue], v36 < (int)objc_msgSend(v34, "intValue")))
        {
          id v37 = v34;

          v66 = v37;
        }
      }
LABEL_24:

      long long v30 = (void *)v33;
      goto LABEL_25;
    }
    if (a7) {
      goto LABEL_17;
    }
LABEL_25:

    if (v21 == ++v25)
    {
      uint64_t v41 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
      uint64_t v21 = v41;
      uint64_t v23 = v64;
      if (!v41)
      {
        id v19 = obj;

        if (a7)
        {
          id v42 = v66;
          id v11 = v67;
          id v17 = v65;
          if (v22)
          {
            v43 = [(FPNSURLBitVectorForBounce *)v18 findNextAvailableBounceNumber];
            int v44 = [v43 intValue];
            if (v44 < (int)[v66 intValue])
            {
              id v45 = v43;

              id v42 = v45;
            }
            id v42 = v42;
            *a7 = v42;
LABEL_56:
          }
        }
        else
        {
          id v42 = v66;
          id v11 = v67;
          id v17 = v65;
        }
        id v53 = v22;
        goto LABEL_75;
      }
      goto LABEL_3;
    }
  }
  if (!v22)
  {
    v22 = objc_msgSend(v68, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v70, v67);
  }
  id v17 = v65;
  id v19 = obj;
  if (!a7 || !v22)
  {
    v48 = v66;
    id v11 = v67;
    goto LABEL_73;
  }
  if ([(FPNSURLBitVectorForBounce *)v18 bitCount] < 2)
  {
    v48 = v66;
    goto LABEL_62;
  }
  v46 = v22;
  uint64_t v47 = 1;
  while (2)
  {
    v48 = [(FPNSURLBitVectorForBounce *)v18 findNextAvailableBounceNumberFromIndex:v47];
    int v49 = [v48 intValue];
    int v50 = [v48 intValue] + 1;
    if (v50 >= (int)[v66 intValue])
    {
LABEL_53:
      uint64_t v47 = (v49 + 1);

      if ((int)v47 >= [(FPNSURLBitVectorForBounce *)v18 bitCount])
      {
        v48 = v66;
        goto LABEL_61;
      }
      continue;
    }
    break;
  }
  v51 = objc_msgSend(v46, "fp_bouncedNameWithIndex:", objc_msgSend(v48, "longValue") + 1);
  v52 = objc_msgSend(v68, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v51, 0);

  if (v52)
  {

    goto LABEL_53;
  }

LABEL_61:
  v22 = v46;
LABEL_62:
  id v11 = v67;
  if (v65 && v48)
  {
    v54 = v22;
    v55 = NSNumber;
    uint64_t v56 = [v65 longValue];
    uint64_t v57 = [v48 longValue];
    if (v56 <= v57) {
      uint64_t v58 = v57;
    }
    else {
      uint64_t v58 = v56;
    }
    v59 = v55;
    v22 = v54;
    id v60 = [v59 numberWithLong:v58];
  }
  else
  {
    if (v65) {
      v61 = v65;
    }
    else {
      v61 = v48;
    }
    id v60 = v61;
  }
  *a7 = v60;
LABEL_73:
  id v53 = v22;
  id v42 = v48;
LABEL_74:

LABEL_75:

  return v53;
}

- (uint64_t)getMaxChildrenCount
{
  if (os_variant_has_internal_content() && getMaxChildrenCount_once != -1) {
    dispatch_once(&getMaxChildrenCount_once, &__block_literal_global_35);
  }
  return getMaxChildrenCount_maxChildrenCount;
}

- (id)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:
{
  id v12 = a3;
  id v13 = a5;
  if (!v12)
  {
    id v15 = 0;
    goto LABEL_16;
  }
  if (a7)
  {
    id v14 = 0;
  }
  else
  {
    id v21 = 0;
    char v16 = [a1 getResourceValue:&v21 forKey:*MEMORY[0x1E4F1C8C8] error:0];
    id v14 = v21;
    if ((v16 & 1) == 0)
    {
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[NSURL(FPFSHelpers) fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:](a1);
      }
    }
    if (v14 && ([v14 BOOLValue] & 1) == 0)
    {
      uint64_t v19 = objc_msgSend(a1, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v12, v13);
      goto LABEL_15;
    }
    id v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPFSHelpers) fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:](a1);
    }
  }
  uint64_t v19 = objc_msgSend(a1, "fp_scanForURLOfChildWithName:isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:", v12, a4, objc_msgSend(a1, "getMaxChildrenCount"), v13, a6);
LABEL_15:
  id v15 = (void *)v19;

LABEL_16:

  return v15;
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:completionHandler:
{
  return objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:", a3, a4, 2, a5, a6, a7);
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  return objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", a3, a4, 2, a5, a6, a7, a8);
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_msgSend(a1, "fp_defaultMoverBlock");
  uint64_t v18 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", v16, v15, a5, a6, a7, v17, v14);

  return v18;
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  if (fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__onceToken != -1) {
    dispatch_once(&fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__onceToken, &__block_literal_global_44);
  }
  qos_class_t v19 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E5AF1A10;
  block[4] = a1;
  id v27 = v15;
  char v32 = a6;
  char v33 = a7;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  uint64_t v31 = a5;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  dispatch_block_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v19, 0, block);
  dispatch_async((dispatch_queue_t)fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue, v24);

  return 1;
}

- (BOOL)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v84 = a3;
  id v13 = a4;
  id v74 = a8;
  v70 = a9;
  id v105 = 0;
  id v106 = 0;
  id v71 = v13;
  long long v81 = objc_msgSend(v71, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v106, &v105, objc_msgSend(a1, "fp_isFolder"));
  id v14 = v106;
  id v72 = v105;
  id v83 = a1;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__1;
  v103 = __Block_byref_object_dispose__1;
  id v104 = 0;
  if (![v14 intValue])
  {

    id v14 = &unk_1EF6C3860;
  }
  uint64_t section = __fp_create_section();
  id v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v61 = objc_msgSend(v83, "fp_shortDescription");
    objc_msgSend(v84, "fp_shortDescription");
    v62 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v113 = 134218754;
    *(void *)&v113[4] = section;
    *(_WORD *)&v113[12] = 2112;
    *(void *)&v113[14] = v61;
    *(_WORD *)&v113[22] = 2112;
    v114 = v62;
    LOWORD(v115) = 2112;
    *(void *)((char *)&v115 + 2) = v71;
    _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx moving %@ to %@ as %@", v113, 0x2Au);
  }
  *(void *)v113 = 0;
  *(void *)&v113[8] = v113;
  *(void *)&v113[16] = 0x3032000000;
  v114 = __Block_byref_object_copy__1;
  *(void *)&long long v115 = __Block_byref_object_dispose__1;
  *((void *)&v115 + 1) = 0;
  id v76 = objc_msgSend(MEMORY[0x1E4F28CA0], "fp_fileCoordinatorForCurrentProcess:", 0);
  int v16 = [v83 startAccessingSecurityScopedResource];
  id v17 = (id)_CFURLPromiseCopyPhysicalURL();
  if (!v17) {
    id v17 = v83;
  }
  int v69 = v16;
  if (a5)
  {
    id v97 = 0;
    uint64_t v19 = *MEMORY[0x1E4F1C530];
    id v96 = 0;
    char v20 = [v17 getResourceValue:&v97 forKey:v19 error:&v96];
    id v75 = v97;
    id v18 = v96;
    if ((v20 & 1) == 0)
    {
      id v21 = fp_current_or_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        [v83 path];
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:]();
      }
    }
  }
  else
  {
    id v75 = 0;
    id v18 = 0;
  }
  id v95 = 0;
  char v22 = [v17 getResourceValue:&v95 forKey:*MEMORY[0x1E4F1C5A0] error:0];
  v67 = v17;
  v68 = v18;
  id v82 = v95;
  if ((v22 & 1) == 0)
  {
    id v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:]();
    }
  }
  int v24 = 0;
  long long v80 = 0;
  uint64_t v25 = &v94;
  if (!a6) {
    uint64_t v25 = 0;
  }
  long long v78 = v25;
  uint64_t v77 = *MEMORY[0x1E4F281F8];
  char v26 = 1;
  id v27 = v71;
  do
  {
    *(void *)v111 = 0;
    *(void *)&v111[8] = v111;
    *(void *)&v111[16] = 0x2020000000;
    LOBYTE(v112) = 0;
    if (v26)
    {
      uint64_t v28 = objc_msgSend(v83, "fp_isFolder");
      if (a6) {
        id v94 = 0;
      }
      id v29 = objc_msgSend(v84, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v27, v28, v82, v78, 0);
      if (a6)
      {
        id v30 = v94;
        if (v30)
        {
          int v31 = [v14 intValue];
          if (v31 < (int)[v30 intValue])
          {
            id v30 = v30;

            id v14 = v30;
          }
        }
      }
      else
      {
        id v30 = 0;
      }
    }
    else
    {
      id v29 = objc_msgSend(v84, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v27, v82);
    }
    if (v29)
    {
      char v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        char v33 = objc_msgSend(v84, "fp_shortDescription");
        *(_DWORD *)buf = 138412546;
        v108 = v27;
        __int16 v109 = 2112;
        v110 = v33;
        _os_log_impl(&dword_1A33AE000, v32, OS_LOG_TYPE_INFO, "[INFO] won't create '%@' because it already exists under %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)&v111[8] + 24) = 0;
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorForCollisionWithURL:", v29);
      id v35 = 0;
      int v36 = *(void **)(*(void *)&v113[8] + 40);
      *(void *)(*(void *)&v113[8] + 40) = v34;
    }
    else
    {
      id v37 = [v83 path];
      uint64_t v38 = objc_msgSend(v84, "URLByAppendingPathComponent:isDirectory:", v27, objc_msgSend(v37, "hasSuffix:", @"/"));

      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke;
      v86[3] = &unk_1E5AF1A38;
      id v87 = v75;
      v90 = v113;
      char v93 = a7;
      id v39 = v76;
      id v88 = v39;
      v91 = v111;
      id v89 = v74;
      v92 = &v99;
      uint64_t v40 = MEMORY[0x1A6248B00](v86);
      uint64_t v41 = (void *)v40;
      if (a7)
      {
        id v85 = 0;
        [v39 coordinateWritingItemAtURL:v83 options:a5 writingItemAtURL:v38 options:4 error:&v85 byAccessor:v40];
        id v35 = v85;
      }
      else
      {
        (*(void (**)(uint64_t, id, uint64_t))(v40 + 16))(v40, v83, v38);
        id v35 = 0;
      }

      int v24 = 0;
      int v36 = v87;
      long long v80 = (void *)v38;
    }

    if (!*(unsigned char *)(*(void *)&v111[8] + 24) && a6)
    {
      id v42 = [*(id *)(*(void *)&v113[8] + 40) domain];
      if ([v42 isEqualToString:v77])
      {
        BOOL v43 = [*(id *)(*(void *)&v113[8] + 40) code] == 516;

        if (!v43) {
          goto LABEL_48;
        }
        int v44 = *(void **)(*(void *)&v113[8] + 40);
        *(void *)(*(void *)&v113[8] + 40) = 0;

        id v45 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);

        unint64_t v46 = [v45 unsignedIntegerValue];
        if (v46 > objc_msgSend(NSString, "fp_maximumBounceLevel"))
        {
          id v42 = objc_opt_new();
          [v42 setDateStyle:1];
          [v42 setTimeStyle:2];
          uint64_t v47 = [MEMORY[0x1E4F1C9C8] date];
          v48 = [v42 stringFromDate:v47];

          int v49 = [v48 stringByReplacingOccurrencesOfString:@":" withString:@"'"];

          int v50 = [v49 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

          v51 = [NSString stringWithFormat:@"%@ %@", v81, v50];

          if (v72)
          {
            id v52 = [v51 stringByAppendingPathExtension:v72];
          }
          else
          {
            id v52 = v51;
          }
          uint64_t v53 = (uint64_t)v52;

          int v24 = 1;
          id v45 = &unk_1EF6C3860;
          goto LABEL_47;
        }
        uint64_t v53 = objc_msgSend(v81, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v45, v72, 0);
        int v24 = 1;
        id v42 = v27;
      }
      else
      {
        id v45 = v14;
        uint64_t v53 = (uint64_t)v27;
      }
      v51 = v81;
LABEL_47:

      id v27 = (void *)v53;
      long long v81 = v51;
      id v14 = v45;
    }
LABEL_48:

    _Block_object_dispose(v111, 8);
    if (v35) {
      char v54 = 1;
    }
    else {
      char v54 = a6 ^ 1;
    }
    if (v54) {
      break;
    }
    char v26 = 0;
  }
  while (((v24 ^ 1) & 1) == 0);
  if (v69) {
    [v83 stopAccessingSecurityScopedResource];
  }
  if (v35 || *(void *)(*(void *)&v113[8] + 40))
  {
    v55 = fp_current_or_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = objc_msgSend(v83, "fp_shortDescription");
      uint64_t v64 = objc_msgSend(v84, "fp_shortDescription");
      v65 = (void *)v64;
      id v66 = v35;
      if (!v35) {
        id v66 = *(id *)(*(void *)&v113[8] + 40);
      }
      *(_DWORD *)v111 = 138412802;
      *(void *)&v111[4] = v63;
      *(_WORD *)&v111[12] = 2112;
      *(void *)&v111[14] = v64;
      *(_WORD *)&v111[22] = 2112;
      id v112 = v66;
      _os_log_error_impl(&dword_1A33AE000, v55, OS_LOG_TYPE_ERROR, "[ERROR] couldn't move %@ to %@: %@", v111, 0x20u);
    }
    uint64_t v56 = v35;
    if (!v35) {
      uint64_t v56 = *(void **)(*(void *)&v113[8] + 40);
    }
    id v57 = v56;

    id v58 = v57;
  }
  else
  {
    id v58 = v68;
  }
  v59 = v58;
  v70[2](v70, v100[5]);

  _Block_object_dispose(v113, 8);
  __fp_leave_section_Debug((uint64_t)&section);
  _Block_object_dispose(&v99, 8);

  return v59 == 0;
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(a1, "fp_defaultMoverBlock");
  uint64_t v11 = objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:usingBlock:completionHandler:", v9, a4, v10, v8);

  return v11;
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers usingBlock:completionHandler:
{
  return objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:usingBlock:completionHandler:", a3, 1, a4, a5);
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:usingBlock:completionHandler:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [a1 lastPathComponent];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__NSURL_FPFSHelpers__fp_importUnderFolder_allowCoordination_usingBlock_completionHandler___block_invoke;
  v17[3] = &unk_1E5AF1A60;
  id v18 = v10;
  id v14 = v10;
  uint64_t v15 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:moveHandler:completionHandler:", v12, v13, 0, a4, v11, v17);

  return v15;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 lastPathComponent];
  uint64_t v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v9, v10, 0, a4, v8);

  return v11;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:allowCoordination:completionHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v11)
  {
    id v11 = [a1 lastPathComponent];
  }
  uint64_t v13 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v10, v11, 0, a5, v12);

  return v13;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:completionHandler:
{
  return objc_msgSend(a1, "fp_reparentUnderFolder:withNewName:allowCoordination:completionHandler:", a3, a4, 1, a5);
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:allowCoordination:completionHandler:
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a1 lastPathComponent];
  uint64_t v13 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v11, v12, a4, a5, v10);

  return v13;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:completionHandler:
{
  return objc_msgSend(a1, "fp_reparentUnderFolder:allowBouncing:allowCoordination:completionHandler:", a3, a4, 1, a5);
}

- (uint64_t)fp_trashUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 lastPathComponent];
  uint64_t v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:", v9, v10, 1, 1, a4, v8);

  return v11;
}

- (uint64_t)fp_trashUnderFolder:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_trashUnderFolder:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_renameWithNewName:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 URLByDeletingLastPathComponent];
  uint64_t v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v10, v9, 0, a4, v8);

  return v11;
}

- (uint64_t)fp_renameWithNewName:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_renameWithNewName:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_createSubFolder:()FPFSHelpers completionHandler:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  id v8 = objc_msgSend(a1, "fp_existingURLOfChildWithName:isFolder:", v6, 1);
  if (!v8)
  {
    id v24 = 0;
    uint64_t v13 = objc_msgSend(a1, "fp_uniqueTempFolderWithError:", &v24);
    id v14 = v24;
    id v23 = v14;
    uint64_t v15 = objc_msgSend(v13, "fp_addDocumentTrackingWithError:", &v23);
    id v11 = v23;

    if (!v15)
    {
      v7[2](v7, 0, v11);
      uint64_t v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    int v16 = [a1 URLByAppendingPathComponent:v6 isDirectory:1];
    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = v11;
    uint64_t v12 = [v17 moveItemAtURL:v13 toURL:v16 error:&v22];
    id v18 = v22;

    if (v12)
    {
      ((void (**)(id, void *, id))v7)[2](v7, v16, 0);
LABEL_14:

      id v11 = v18;
      goto LABEL_15;
    }
    uint64_t v19 = [v18 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v20 = [v18 code];

      if (v20 != 516)
      {
LABEL_13:
        v7[2](v7, 0, v18);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorForCollisionWithURL:", v16);
      uint64_t v19 = v18;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_msgSend(a1, "fp_shortDescription");
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_INFO, "[INFO] won't create '%@' because it already exists under %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorForCollisionWithURL:", v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v11);
  uint64_t v12 = 0;
LABEL_16:

  return v12;
}

- (uint64_t)fp_deleteStaleBusyFileWithFileDescriptor:()FPFSHelpers coordinatorPurposeIdentifier:
{
  id v6 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v7 = objc_msgSend(MEMORY[0x1E4F28CA0], "fp_fileCoordinatorForCurrentProcess:", v6);
  id v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke;
  v13[3] = &unk_1E5AF1AB0;
  id v8 = v7;
  int v17 = a3;
  id v14 = v8;
  uint64_t v15 = a1;
  int v16 = &v19;
  [v8 coordinateReadingItemAtURL:a1 options:0x80000 error:&v18 byAccessor:v13];
  id v9 = v18;
  if (v9)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPFSHelpers) fp_deleteStaleBusyFileWithFileDescriptor:coordinatorPurposeIdentifier:]();
    }
  }
  uint64_t v11 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (void)fp_coordinatedDeleteWithHandler:()FPFSHelpers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  id v22 = 0;
  v5 = objc_msgSend(MEMORY[0x1E4F28CA0], "fp_fileCoordinatorForCurrentProcess:", 0);
  id v20 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C530];
  id v19 = 0;
  char v7 = [a1 getResourceValue:&v20 forKey:v6 error:&v19];
  id v8 = v20;
  id v9 = v19;
  if ((v7 & 1) == 0)
  {
    id v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [a1 path];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:]();
    }
  }
  id v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke;
  v14[3] = &unk_1E5AF1AD8;
  id v11 = v8;
  id v15 = v11;
  int v17 = v21;
  id v12 = v4;
  id v16 = v12;
  [v5 coordinateWritingItemAtURL:a1 options:1 error:&v18 byAccessor:v14];
  id v13 = v18;
  if (v13) {
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v13);
  }

  _Block_object_dispose(v21, 8);
}

- (BOOL)fp_deleteAllowingCoordination:()FPFSHelpers completionHandler:
{
  uint64_t v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke;
  v11[3] = &unk_1E5AF1B00;
  v11[4] = &v12;
  uint64_t v7 = MEMORY[0x1A6248B00](v11);
  id v8 = (void *)v7;
  if (a3) {
    objc_msgSend(a1, "fp_coordinatedDeleteWithHandler:", v7);
  }
  else {
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, a1, 0);
  }
  v6[2](v6, v13[5]);
  BOOL v9 = v13[5] == 0;

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (uint64_t)fp_deleteWithCompletionHandler:()FPFSHelpers
{
  return objc_msgSend(a1, "fp_deleteAllowingCoordination:completionHandler:", 1, a3);
}

- (id)fp_withReadWriteAccess:()FPFSHelpers
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = open((const char *)[v5 fileSystemRepresentation], 260);
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v7 = v6;
    id v8 = v4[2](v4, v6);
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 domain];
      if (v10 != (void *)*MEMORY[0x1E4F28798] || [v9 code] == 13)
      {

        goto LABEL_6;
      }
      uint64_t v27 = [v9 code];

      if (v27 == 1)
      {
LABEL_6:
        id v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1();
        }

        memset(&v39, 0, sizeof(v39));
        if (fstat(v7, &v39) < 0)
        {
          uint64_t v23 = fp_current_or_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:]();
          }

          close(v7);
          objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_56;
        }
        id v38 = 0;
        uint64_t v12 = *MEMORY[0x1E4F1C5E8];
        v37[1] = 0;
        uint64_t v35 = v12;
        char v13 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v38);
        id v14 = v38;
        id v15 = 0;

        if ((v13 & 1) == 0)
        {
          id v16 = fp_current_or_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:]0();
          }
        }
        if (v14)
        {
          id v17 = (__CFFileSecurity *)objc_alloc_init(MEMORY[0x1E4F1CA08]);
          if (!CFFileSecuritySetAccessControlList(v17, (acl_t)1))
          {
            id v18 = fp_current_or_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.9();
            }
          }
          v37[0] = v15;
          char v19 = [v5 setResourceValue:v17 forKey:v35 error:v37];
          id v9 = v37[0];

          if ((v19 & 1) == 0)
          {
            uint64_t v28 = fp_current_or_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.8();
            }

            close(v7);
            id v22 = v9;

            id v9 = v22;
            goto LABEL_55;
          }

          mode_t st_mode = v39.st_mode;
        }
        else
        {
          mode_t st_mode = v39.st_mode;
          if ((v39.st_mode & 0x80) != 0)
          {
            uint64_t v29 = fp_current_or_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.7(&v39.st_mode, v29);
            }

            close(v7);
            id v26 = v15;
            goto LABEL_54;
          }
          id v9 = v15;
        }
        if (fchmod(v7, st_mode | 0x80) < 0)
        {
          id v30 = fp_current_or_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:]();
          }
        }
        else
        {
          id v24 = v4[2](v4, v7);

          id v25 = v5;
          if (access((const char *)[v25 fileSystemRepresentation], 0))
          {
            close(v7);
            if (*__error() != 2)
            {
              char v33 = fp_current_or_default_log();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.6();
              }

              objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              id v9 = v24;
              goto LABEL_55;
            }
            id v26 = v24;
            goto LABEL_54;
          }
          if (v14)
          {
            id v36 = v24;
            char v31 = [v25 setResourceValue:v14 forKey:v35 error:&v36];
            id v9 = v36;

            if ((v31 & 1) == 0)
            {
              char v32 = fp_current_or_default_log();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.5();
              }

              goto LABEL_53;
            }
          }
          else
          {
            id v9 = v24;
          }
          if ((fchmod(v7, v39.st_mode) & 0x80000000) == 0)
          {
LABEL_53:
            close(v7);
            id v26 = v9;
LABEL_54:
            id v22 = v26;
            id v9 = v26;
            goto LABEL_55;
          }
          id v30 = fp_current_or_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.4();
          }
        }

        close(v7);
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
        id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

        goto LABEL_56;
      }
    }
    close(v7);
    id v22 = v9;
    id v9 = v22;
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v21 = fp_current_or_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[NSURL(FPFSHelpers) fp_withReadWriteAccess:]();
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

  return v22;
}

- (id)fp_physicalURL
{
  uint64_t v2 = _CFURLPromiseCopyPhysicalURL();
  v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)v2;
  }
  else {
    id v4 = a1;
  }
  id v5 = v4;

  return v5;
}

- (void)fp_scanForURLOfChildWithName:()FPFSHelpers isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:.cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 lastPathComponent];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A33AE000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] can't get fileID of '%@'", a1, 0xCu);
}

- (void)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] performing case-insensitive lookup on top of case sensitive file-system at %@", v4, v5, v6, v7, v8);
}

- (void)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:.cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] cannot get case sensitivity for %@", v4, v5, v6, v7, v8);
}

- (void)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] can't retrieve fileID for %@", v2, v3, v4, v5, v6);
}

- (void)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_1(v2, v3, v4, 5.778e-34);
  _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't read mtime from %@: %@", v5, 0x16u);
}

- (void)fp_deleteStaleBusyFileWithFileDescriptor:()FPFSHelpers coordinatorPurposeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Coordination for reading failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.1()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] can't open file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.2()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] can't stat file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.3()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] can't fixup permissions of \"%s\" for write operation %{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.4()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] can't restore permissions of \"%s\" %{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.5()
{
  OUTLINED_FUNCTION_11_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] can't restore ACL of \"%s\"; %@", v5, v6, v7, v8, 2u);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.6()
{
  OUTLINED_FUNCTION_5_1();
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] can't access file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.7(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] user already has write access (m:%{darwin.mode}d)", (uint8_t *)v3, 8u);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.8()
{
  OUTLINED_FUNCTION_11_1();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] can't remove ACL from \"%s\"; %@", v5, v6, v7, v8, 2u);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.9()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] can't set no ACL on provided file security", v1, 2u);
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.10()
{
  OUTLINED_FUNCTION_11_1();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] can't fetch file security info from \"%s\"; %@",
    v5,
    v6,
    v7,
    v8,
    2u);
}

@end