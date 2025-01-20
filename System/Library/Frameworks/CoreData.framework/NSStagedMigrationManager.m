@interface NSStagedMigrationManager
- (BOOL)_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:(id)a3 coordinatorModelVersionChecksum:(id)a4 error:(id *)a5;
- (NSArray)stages;
- (NSPersistentContainer)container;
- (NSStagedMigrationManager)initWithMigrationStages:(NSArray *)stages;
- (int64_t)_findCurrentMigrationStageFromModelChecksum:(id)a3;
- (void)dealloc;
- (void)setContainer:(id)a3;
@end

@implementation NSStagedMigrationManager

- (NSStagedMigrationManager)initWithMigrationStages:(NSArray *)stages
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:"), "count");
  if (v5 != [(NSArray *)stages count])
  {

    v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"Duplicate lightweight migration stages detected.";
    uint64_t v42 = 0;
    goto LABEL_67;
  }
  v47 = self;
  if (!self) {
    goto LABEL_64;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v48 = [(NSArray *)stages countByEnumeratingWithState:&v56 objects:v66 count:16];
  v46 = stages;
  if (!v48)
  {
    id v27 = 0;
    char v26 = 1;
    goto LABEL_42;
  }
  id v45 = 0;
  uint64_t v9 = *(void *)v57;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v57 != v9) {
      objc_enumerationMutation(stages);
    }
    v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
    context = (void *)MEMORY[0x18C127630]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v12 = (void *)[v11 versionChecksums];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:&v62 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v53;
        uint64_t v44 = v9;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v53 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            if ([v6 objectForKey:v17]
              || [v7 objectForKey:v17]
              || [v8 objectForKey:v17])
            {
              goto LABEL_37;
            }
            [v6 setObject:v17 forKey:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:&v62 count:16];
          stages = v46;
          uint64_t v9 = v44;
          if (v14) {
            continue;
          }
          break;
        }
      }
      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_23:
LABEL_28:
    if (++v10 == v48)
    {
      uint64_t v25 = [(NSArray *)stages countByEnumeratingWithState:&v56 objects:v66 count:16];
      uint64_t v48 = v25;
      if (!v25)
      {
        char v26 = 1;
        goto LABEL_38;
      }
      goto LABEL_5;
    }
  }
  v51 = 0;
  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolve:", &v51);
  v18 = v51;
  if (v51)
  {
    uint64_t v19 = v9;
    goto LABEL_25;
  }
  uint64_t v19 = v9;
  uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "resolvedModel"), "versionChecksum");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolve:", &v51);
  v18 = v51;
  if (v51)
  {
LABEL_25:
    id v45 = v18;
    BOOL v21 = 0;
  }
  else
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "resolvedModel"), "versionChecksum");
    uint64_t v43 = [v7 objectForKey:v20];
    [v7 setObject:v20 forKey:v20];
    uint64_t v23 = [v8 objectForKey:v22];
    [v8 setObject:v22 forKey:v22];
    if ([v6 objectForKey:v20]
      || (v24 = v22, BOOL v21 = (v23 | v43) == 0, [v6 objectForKey:v24]))
    {
      BOOL v21 = 0;
    }
    stages = v46;
  }
  objc_msgSend((id)objc_msgSend(v11, "currentModel"), "unresolve");
  objc_msgSend((id)objc_msgSend(v11, "nextModel"), "unresolve");
  if (v21)
  {
    uint64_t v9 = v19;
    goto LABEL_28;
  }
LABEL_37:
  char v26 = 0;
LABEL_38:
  if (v45)
  {
    id v27 = v45;
    char v26 = 0;
  }
  else
  {
    id v27 = 0;
  }
LABEL_42:

  if ((v26 & 1) == 0)
  {

    if (v27)
    {
      uint64_t v60 = *MEMORY[0x1E4F28A50];
      id v61 = v27;
      uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      goto LABEL_66;
    }
LABEL_64:
    uint64_t v42 = 0;
LABEL_66:
    v39 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v40 = *MEMORY[0x1E4F1C3C8];
    v41 = @"Duplicate version checksums across stages detected.";
LABEL_67:
    objc_exception_throw((id)[v39 exceptionWithName:v40 reason:v41 userInfo:v42]);
  }
  v50.receiver = v47;
  v50.super_class = (Class)NSStagedMigrationManager;
  v28 = [(NSStagedMigrationManager *)&v50 init];
  if (v28)
  {
    v29 = v46;
    v28->_stages = v29;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = 0;
      char v33 = 0;
      unint64_t v34 = 0;
      uint64_t v35 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v63 != v35) {
            objc_enumerationMutation(v29);
          }
          uint64_t v37 = *(void *)(*((void *)&v62 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ((v33 & 1) == 0) {
              unint64_t v34 = [(NSArray *)v28->_stages indexOfObject:v37];
            }
            ++v32;
            char v33 = 1;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v34 >= v34 + v32)
              {
                uint64_t v32 = 0;
              }
              else
              {
                do
                {
                  objc_msgSend(-[NSArray objectAtIndex:](v28->_stages, "objectAtIndex:", v34++), "setSubsequentStage:", v37);
                  --v32;
                }
                while (v32);
              }
              char v33 = 0;
              unint64_t v34 = 0;
            }
          }
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v31);
    }
  }
  return v28;
}

- (int64_t)_findCurrentMigrationStageFromModelChecksum:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  stages = self->_stages;
  uint64_t v6 = [(NSArray *)stages countByEnumeratingWithState:&v23 objects:v29 count:16];
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(stages);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_msgSend((id)objc_msgSend(v11, "versionChecksums"), "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL) {
            return [(NSArray *)self->_stages indexOfObject:v11];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "currentModel"), "versionChecksum"), "isEqual:", a3))return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11); {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nextModel"), "versionChecksum"), "isEqual:", a3))return -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v11) + 1;
            }
          }
          else
          {
            uint64_t v12 = [NSString stringWithUTF8String:"I don't know how to handle this type of migration stage %@"];
            uint64_t v13 = objc_opt_class();
            _NSCoreDataLog(17, v12, v14, v15, v16, v17, v18, v19, v13);
            uint64_t v20 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v21 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v21;
              _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this type of migration stage %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v8 = [(NSArray *)stages countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (BOOL)_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:(id)a3 coordinatorModelVersionChecksum:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_stages;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (!v9)
  {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  v39 = a5;
  uint64_t v11 = *(void *)v44;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v40 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v41 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a3);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v40 = [(NSArray *)self->_stages indexOfObject:v15];
        }
        uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "versionChecksums"), "indexOfObject:", a4);
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = v16;
          NSUInteger v41 = [(NSArray *)self->_stages indexOfObject:v15];
          uint64_t v13 = v17;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"), "isEqual:", a3))NSUInteger v40 = -[NSArray indexOfObject:](self->_stages, "indexOfObject:", v15); {
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "currentModel"), "versionChecksum"), "isEqual:", a4) & 1) != 0
          }
            || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "nextModel"), "versionChecksum"), "isEqual:", a4))
          {
            NSUInteger v41 = [(NSArray *)self->_stages indexOfObject:v15];
          }
        }
        else
        {
          uint64_t v18 = [NSString stringWithUTF8String:"I don't know how to handle this type of migration stage %@"];
          uint64_t v19 = objc_opt_class();
          _NSCoreDataLog(17, v18, v20, v21, v22, v23, v24, v25, v19);
          long long v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            uint64_t v54 = v27;
            _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this type of migration stage %@", buf, 0xCu);
          }
        }
      }
    }
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  }
  while (v10);
  uint64_t v28 = v41;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    a5 = v39;
    uint64_t v29 = v40;
LABEL_24:
    uint64_t v30 = *MEMORY[0x1E4F281F8];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    long long v52 = @"Cannot use staged migration with an unknown coordinator model version.";
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v30, 134504, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    BOOL v32 = 0;
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  uint64_t v31 = 0;
  BOOL v32 = 1;
  a5 = v39;
  uint64_t v29 = v40;
LABEL_26:
  if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_35;
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v28 >= v29) {
      goto LABEL_35;
    }
    char v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F281F8];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    objc_super v50 = @"A store file cannot be migrated backwards with staged migration.";
    uint64_t v35 = (void *)MEMORY[0x1E4F1C9E8];
    v36 = &v50;
    uint64_t v37 = &v49;
    goto LABEL_34;
  }
  if (v28 <= v29 && v13 < v12)
  {
    char v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F281F8];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    uint64_t v48 = @"A store file cannot be migrated backwards with staged migration.";
    uint64_t v35 = (void *)MEMORY[0x1E4F1C9E8];
    v36 = &v48;
    uint64_t v37 = &v47;
LABEL_34:
    uint64_t v31 = objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 134506, objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1));
    BOOL v32 = 0;
  }
LABEL_35:
  if (a5) {
    *a5 = v31;
  }
  return v32;
}

- (void)dealloc
{
  self->_stages = 0;
  self->_container = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStagedMigrationManager;
  [(NSStagedMigrationManager *)&v3 dealloc];
}

- (NSArray)stages
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
}

@end