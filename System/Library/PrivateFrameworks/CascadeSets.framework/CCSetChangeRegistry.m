@interface CCSetChangeRegistry
+ (id)_keyForSet:(id)a3;
- (BOOL)_clear:(id *)a3;
- (BOOL)cleanupWithAllSets:(id)a3 error:(id *)a4;
- (BOOL)clearAllBookmarksAndCommit:(id *)a3;
- (BOOL)commitAllBookmarkUpdates:(id *)a3;
- (BOOL)enumerateAllBookmarks:(id *)a3 usingBlock:(id)a4;
- (BOOL)updateBookmark:(id)a3 forSet:(id)a4 error:(id *)a5;
- (CCSetChangeRegistry)init;
- (CCSetChangeRegistry)initWithFilename:(id)a3 directory:(id)a4 protectionClass:(int)a5 error:(id *)a6;
- (id)_archiveBookmark:(id)a3 error:(id *)a4;
- (id)_unarchiveBookmark:(id)a3 error:(id *)a4;
- (id)bookmarkForSet:(id)a3;
- (id)description;
- (id)descriptionForBookmark:(id)a3;
- (void)clearAllBookmarks;
- (void)rollbackAllBookmarkUpdates;
@end

@implementation CCSetChangeRegistry

- (CCSetChangeRegistry)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSetChangeRegistry)initWithFilename:(id)a3 directory:(id)a4 protectionClass:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCSetChangeRegistry;
  v12 = [(CCSetChangeRegistry *)&v17 init];
  if (v12
    && (v13 = [[CCDictionaryLog alloc] initWithFilename:v10 protectionClass:v7 directory:v11 readOnly:0 create:1 error:a6], log = v12->_log, v12->_log = v13, log, !v12->_log))
  {
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCSetChangeRegistry;
  v3 = [(CCSetChangeRegistry *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" backed by: %@", self->_log];

  return v4;
}

+ (id)_keyForSet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 uniqueHash];
    v5 = [v4 stringValue];
  }
  else
  {
    objc_super v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CCSetChangeRegistry _keyForSet:]((uint64_t)v3, v6);
    }

    v5 = 0;
  }

  return v5;
}

- (id)bookmarkForSet:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _keyForSet:v4];
  if (v5)
  {
    objc_super v6 = [(NSMutableDictionary *)self->_pendingUpdates objectForKey:v5];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
    }
    else if (self->_pendingClear {
           || ([(CCDictionaryLog *)self->_log objectForKey:v5],
    }
               (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v8 = 0;
      id v7 = 0;
    }
    else
    {
      id v10 = (void *)v9;
      id v14 = 0;
      id v11 = [(CCSetChangeRegistry *)self _unarchiveBookmark:v9 error:&v14];
      id v8 = v14;
      if (!v11)
      {
        v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(CCSetChangeRegistry *)(uint64_t)v4 bookmarkForSet:v12];
        }
      }
      id v7 = v11;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)updateBookmark:(id)a3 forSet:(id)a4 error:(id *)a5
{
  v49[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F07F80];
    v16 = NSString;
    objc_super v17 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v17);
    id v11 = [v16 stringWithFormat:@"Unexpected bookmark: %@ for set: %@", v10, v9];
    v49[0] = v11;
    v18 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    v19 = [v15 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v18];
    CCSetError(a5, v19);

LABEL_8:
    goto LABEL_9;
  }
  id v10 = [(id)objc_opt_class() _keyForSet:v9];
  id v11 = [v8 value];
  if (!v10)
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F07F80];
    v18 = [NSString stringWithFormat:@"Failed to resolve key for set: %@ bookmark: %@", v9, v11];
    v47 = v18;
    v21 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v22 = [v20 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v21];
    CCSetError(a5, v22);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_12;
    }
    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F07F80];
    v35 = NSString;
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = [v35 stringWithFormat:@"Unexpected bookmark value: %@ for set: %@", v37, v9];
    v43 = v38;
    v39 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v40 = [v34 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v39];
    CCSetError(a5, v40);

LABEL_9:
    BOOL v23 = 0;
    goto LABEL_10;
  }
  v12 = objc_opt_class();
  v13 = [v11 set];
  id v14 = [v12 _keyForSet:v13];

  if (([v10 isEqual:v14] & 1) == 0)
  {
    v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F07F80];
    v28 = NSString;
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = [v28 stringWithFormat:@"Unexpected set: %@ (key: %@) for bookmark: %@ (key: %@)", v30, v10, v11, v14];
    v45 = v31;
    v32 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v33 = [v41 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v32];
    CCSetError(a5, v33);

    goto LABEL_9;
  }

LABEL_12:
  pendingUpdates = self->_pendingUpdates;
  if (!pendingUpdates)
  {
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v27 = self->_pendingUpdates;
    self->_pendingUpdates = v26;

    pendingUpdates = self->_pendingUpdates;
  }
  [(NSMutableDictionary *)pendingUpdates setObject:v8 forKey:v10];
  BOOL v23 = 1;
LABEL_10:

  return v23;
}

- (void)clearAllBookmarks
{
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  self->_pendingClear = 1;
}

- (void)rollbackAllBookmarkUpdates
{
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = 0;

  self->_pendingClear = 0;
}

- (BOOL)commitAllBookmarkUpdates:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_pendingClear && ![(CCSetChangeRegistry *)self _clear:a3])
  {
    [(CCSetChangeRegistry *)self rollbackAllBookmarkUpdates];
    return 0;
  }
  else
  {
    p_pendingUpdates = &self->_pendingUpdates;
    if (self->_pendingUpdates)
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](*p_pendingUpdates, "count"));
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](*p_pendingUpdates, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obj = [(NSMutableDictionary *)*p_pendingUpdates allKeys];
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v13 = [(NSMutableDictionary *)self->_pendingUpdates objectForKey:v12];
            id v14 = [(CCSetChangeRegistry *)self _archiveBookmark:v13 error:a3];

            if (!v14)
            {
              BOOL v16 = 0;
              goto LABEL_18;
            }
            [v6 addObject:v12];
            [v7 addObject:v14];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      log = self->_log;
      id v21 = 0;
      BOOL v16 = [(CCDictionaryLog *)log writeUpdatedObjects:v7 forKeys:v6 error:&v21];
      id obj = v21;
      if (!v16)
      {
        objc_super v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(CCSetChangeRegistry *)&self->_pendingUpdates commitAllBookmarkUpdates:v17];
        }

        CCSetError(a3, obj);
      }
LABEL_18:
      [(CCSetChangeRegistry *)self rollbackAllBookmarkUpdates];
    }
    else
    {
      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CCSetChangeRegistry commitAllBookmarkUpdates:](v18);
      }

      [(CCSetChangeRegistry *)self rollbackAllBookmarkUpdates];
      return 1;
    }
  }
  return v16;
}

- (BOOL)_clear:(id *)a3
{
  log = self->_log;
  id v9 = 0;
  BOOL v5 = [(CCDictionaryLog *)log clear:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCSetChangeRegistry _clear:]((uint64_t)v6, v7);
    }

    CCSetError(a3, v6);
  }

  return v5;
}

- (BOOL)cleanupWithAllSets:(id)a3 error:(id *)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(CCDictionaryLog *)self->_log allKeys];
  uint64_t v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v91 = [v7 count];
    *(_WORD *)&v91[4] = 1024;
    *(_DWORD *)&v91[6] = [v6 count];
    *(_WORD *)v92 = 2112;
    *(void *)&v92[2] = v6;
    _os_log_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEFAULT, "Starting cleanup with %u registry entries and %u available sets: %@", buf, 0x18u);
  }

  id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v76 + 1) + 8 * i);
        uint64_t v16 = [(id)objc_opt_class() _keyForSet:v15];
        if (!v16)
        {
          v38 = (void *)MEMORY[0x263F087E8];
          uint64_t v87 = *MEMORY[0x263F07F80];
          v39 = NSString;
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          uint64_t v42 = [v39 stringWithFormat:@"Unexpected set: %@", v41];
          v88 = v42;
          v43 = [NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          uint64_t v44 = [v38 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v43];
          CCSetError(a4, v44);

          BOOL v37 = 0;
          v36 = v10;
          goto LABEL_45;
        }
        objc_super v17 = (void *)v16;
        [v9 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v12);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v7;
  uint64_t v69 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (!v69) {
    goto LABEL_32;
  }
  uint64_t v68 = *(void *)v73;
  v65 = v7;
  v66 = a4;
  while (2)
  {
    for (uint64_t j = 0; j != v69; ++j)
    {
      if (*(void *)v73 != v68) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v72 + 1) + 8 * j);
      v20 = [(CCDictionaryLog *)self->_log objectForKey:v19];
      id v21 = [(CCSetChangeRegistry *)self _unarchiveBookmark:v20 error:a4];

      if (!v21) {
        goto LABEL_44;
      }
      long long v22 = [v21 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      long long v24 = [v21 value];
      if (isKindOfClass)
      {
        long long v25 = [v9 objectForKey:v19];
        if (v25)
        {
          uint64_t v26 = +[CCSetChangeBookmark currentBookmarkVersion];
          if ([v24 bookmarkVersion] == v26)
          {

LABEL_29:
            a4 = v66;
            goto LABEL_30;
          }
          v53 = (void *)MEMORY[0x263F087E8];
          uint64_t v82 = *MEMORY[0x263F07F80];
          v54 = [NSString stringWithFormat:@"Registry contains a bookmark with invalid software version (expected %d): %@", v26, v24];
          v83 = v54;
          v55 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          v56 = [v53 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v55];
          CCSetError(v66, v56);
        }
        else
        {
          unint64_t v30 = +[CCDatabaseSetChangeEnumerator sharedItemCountFromBookmark:v24];
          unint64_t v31 = +[CCDatabaseSetChangeEnumerator localItemInstanceCountFromBookmark:v24];
          if (!(v30 | v31))
          {
            log = self->_log;
            id v71 = 0;
            BOOL v33 = [(CCDictionaryLog *)log clearObjectForKey:v19 error:&v71];
            id v34 = v71;
            if (v33)
            {
              v35 = __biome_log_for_category();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v91 = v24;
                _os_log_impl(&dword_249B92000, v35, OS_LOG_TYPE_DEFAULT, "Registry bookmark cleaned up: %@", buf, 0xCu);
              }

              goto LABEL_29;
            }
            CCSetError(v66, v34);

            goto LABEL_43;
          }
          unint64_t v57 = v31;
          v70 = (void *)MEMORY[0x263F087E8];
          uint64_t v84 = *MEMORY[0x263F07F80];
          v58 = NSString;
          v59 = [NSNumber numberWithUnsignedInteger:v30];
          v64 = [NSNumber numberWithUnsignedInteger:v57];
          v60 = [v58 stringWithFormat:@"Registry bookmark reflects non-removed state: {shared items: %@, local instances: %@} for a set which is no longer available: %@", v59, v64, v24];
          v85 = v60;
          v61 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          v54 = [v70 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v61];

          v62 = __biome_log_for_category();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v91 = self;
            *(_WORD *)&v91[8] = 2112;
            *(void *)v92 = v54;
            _os_log_impl(&dword_249B92000, v62, OS_LOG_TYPE_DEFAULT, "Inconsistency detected in registry: %@ error: %@", buf, 0x16u);
          }

          CCSetError(v66, v54);
        }

LABEL_43:
        goto LABEL_44;
      }
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
        v45 = (void *)MEMORY[0x263F087E8];
        uint64_t v80 = *MEMORY[0x263F07F80];
        uint64_t v46 = NSString;
        v47 = [v21 value];
        uint64_t v48 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v48);
        v50 = [v46 stringWithFormat:@"Unexpected bookmark value: %@ of bookmark: %@ key: %@", v49, v21, v19];
        v81 = v50;
        v51 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        v52 = [v45 errorWithDomain:@"com.apple.CascadeSets.Set" code:2 userInfo:v51];
        CCSetError(a4, v52);

LABEL_44:
        BOOL v37 = 0;
        id v7 = v65;
        v36 = obj;
        goto LABEL_45;
      }
      long long v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138412546;
        *(void *)v91 = v29;
        *(_WORD *)&v91[8] = 2112;
        *(void *)v92 = v19;
        _os_log_debug_impl(&dword_249B92000, v24, OS_LOG_TYPE_DEBUG, "Skipping cleanup for serialized set bookmark (%@) key: %@", buf, 0x16u);
      }
LABEL_30:
    }
    id v7 = v65;
    uint64_t v69 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_32:

  v36 = __biome_log_for_category();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249B92000, v36, OS_LOG_TYPE_DEFAULT, "Cleanup completed successfully", buf, 2u);
  }
  BOOL v37 = 1;
LABEL_45:

  return v37;
}

- (BOOL)clearAllBookmarksAndCommit:(id *)a3
{
  [(CCSetChangeRegistry *)self rollbackAllBookmarkUpdates];
  [(CCSetChangeRegistry *)self clearAllBookmarks];

  return [(CCSetChangeRegistry *)self commitAllBookmarkUpdates:a3];
}

- (BOOL)enumerateAllBookmarks:(id *)a3 usingBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  char v27 = (void (**)(id, void *, void *))a4;
  id v6 = [(CCDictionaryLog *)self->_log allKeys];
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = [v6 count];
    _os_log_impl(&dword_249B92000, v7, OS_LOG_TYPE_DEFAULT, "Enumerating %u registry entries", buf, 8u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v9)
  {
    BOOL v23 = 1;
    id v11 = v8;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v26 = a3;
  id v11 = 0;
  uint64_t v12 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      id v14 = v11;
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v16 = (void *)MEMORY[0x24C5B1100]();
      objc_super v17 = [(CCDictionaryLog *)self->_log objectForKey:v15];
      id v28 = v11;
      v18 = [(CCSetChangeRegistry *)self _unarchiveBookmark:v17 error:&v28];
      id v11 = v28;

      if (!v18)
      {

        long long v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[CCSetChangeRegistry enumerateAllBookmarks:usingBlock:]((uint64_t)v11, v24);
        }

        CCSetError(v26, v11);
        BOOL v23 = 0;
        goto LABEL_21;
      }
      uint64_t v19 = [v18 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v21 = [v18 value];
        long long v22 = [v21 set];
        v27[2](v27, v22, v18);
      }
      else
      {
        id v21 = __biome_log_for_category();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        long long v22 = [v18 value];
        *(_DWORD *)buf = 138412290;
        id v34 = v22;
        _os_log_impl(&dword_249B92000, v21, OS_LOG_TYPE_DEFAULT, "Skipping bookmark: %@", buf, 0xCu);
      }

LABEL_14:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  BOOL v23 = 1;
LABEL_21:

  return v23;
}

- (id)descriptionForBookmark:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 value];

    id v3 = (id)v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 description];
LABEL_7:
    id v8 = (void *)v5;
    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = NSString;
  if (isKindOfClass)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Serialized set bookmark: %@", v3];
    goto LABEL_7;
  }
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  id v8 = [v7 stringWithFormat:@"Unsupported bookmark: %@", v10];

LABEL_9:

  return v8;
}

- (id)_unarchiveBookmark:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x263F08710], "bm_allowedClassesForSecureCodingBMBookmark");
  id v12 = 0;
  id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v7 fromData:v6 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl(&dword_249B92000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive bookmark (%@) from registry: %@ error: %@", buf, 0x20u);
    }

    CCSetError(a4, v9);
  }

  return v8;
}

- (id)_archiveBookmark:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v11 = 0;
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_error_impl(&dword_249B92000, v9, OS_LOG_TYPE_ERROR, "Failed to archive bookmark (%@) to registry: %@ error: %@", buf, 0x20u);
    }

    CCSetError(a4, v8);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

+ (void)_keyForSet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Unexpected set class: %@ expected: %@", (uint8_t *)&v7, 0x16u);
}

- (void)bookmarkForSet:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_249B92000, a2, a3, "failed to unarchive bookmark for set: %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)commitAllBookmarkUpdates:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_249B92000, log, OS_LOG_TYPE_DEBUG, "No pending updates to commit", v1, 2u);
}

- (void)commitAllBookmarkUpdates:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_249B92000, a2, a3, "Failed to commit pending updates: %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_clear:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Failed to commit clear registry: %@", (uint8_t *)&v2, 0xCu);
}

- (void)enumerateAllBookmarks:(uint64_t)a1 usingBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Failed to complete bookmark enumeration: %@", (uint8_t *)&v2, 0xCu);
}

@end