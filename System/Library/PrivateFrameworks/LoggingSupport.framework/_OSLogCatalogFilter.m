@interface _OSLogCatalogFilter
- (BOOL)containsProcessID:(id)a3;
- (BOOL)containsProcessLookupSubstr:(id)a3;
- (BOOL)containsSenderLookupSubstr:(id)a3;
- (BOOL)containsSubsystemSubstr:(id)a3;
- (BOOL)containsUUID:(id)a3;
- (BOOL)isKeptCatalog:(catalog_s *)a3;
- (_OSLogCatalogFilter)initWithPredicate:(id)a3 collection:(id)a4;
- (void)addProcessID:(id)a3;
- (void)addProcessLookupSubstr:(id)a3;
- (void)addSenderLookupSubstr:(id)a3;
- (void)addSubsystem:(id)a3;
- (void)addUUID:(id)a3;
- (void)dealloc;
- (void)generateUUIDSet;
- (void)handleDSOFile:(_ftsent *)a3;
- (void)processComparisonPredicate:(id)a3;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4;
- (void)readDSCUUIDs;
- (void)readDSOUUIDs;
- (void)visitPredicate:(id)a3;
@end

@implementation _OSLogCatalogFilter

- (BOOL)containsSubsystemSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_subsysSubstrAccept;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "localizedStandardContainsString:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isKeptCatalog:(catalog_s *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_hasItems && !self->_hasSharedCacheItems)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke;
    v15[3] = &unk_1E5A428C0;
    v15[4] = self;
    v15[5] = &v16;
    _catalog_for_each_uuid((uint64_t)a3, (uint64_t)v15);
    if (*((unsigned char *)v17 + 24)) {
      goto LABEL_6;
    }
    var2 = a3->var2;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2;
    v14[3] = &unk_1E5A428E8;
    v14[4] = self;
    v14[5] = &v16;
    _os_trace_str_map_for_each((uint64_t)var2, (uint64_t)v14);
    if (*((unsigned char *)v17 + 24))
    {
LABEL_6:
      LOBYTE(v4) = 1;
    }
    else
    {
      var4 = a3->var4;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      long long v10 = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3;
      long long v11 = &unk_1E5A42910;
      long long v12 = self;
      long long v13 = &v16;
      if (var4)
      {
        id v4 = (void *)*((void *)var4 + 2);
        if (v4)
        {
          do
          {
            v10((uint64_t)v9, v4[4]);
            id v4 = (void *)*v4;
          }
          while (v4);
          LOBYTE(v4) = *((unsigned char *)v17 + 24) != 0;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

- (BOOL)containsProcessID:(id)a3
{
  return [(NSMutableSet *)self->_pidAccept containsObject:a3];
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_OSLogCatalogFilter *)self processComparisonPredicate:v4];
  }
}

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  id v6 = [v4 leftExpression];
  v5 = [v4 rightExpression];

  [(_OSLogCatalogFilter *)self processLeftExpression:v6 andRightExpression:v5];
  [(_OSLogCatalogFilter *)self processLeftExpression:v5 andRightExpression:v6];
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 expressionType] == 3)
  {
    uint64_t v7 = [v9 keyPath];
    if (([v7 isEqualToString:@"processID"] & 1) != 0
      || [v7 isEqualToString:@"processIdentifier"])
    {
      v8 = [v6 constantValue];
      [(_OSLogCatalogFilter *)self addProcessID:v8];
    }
    else if (([v7 isEqualToString:@"process"] & 1) != 0 {
           || [v7 isEqualToString:@"processImagePath"])
    }
    {
      v8 = [v6 constantValue];
      [(_OSLogCatalogFilter *)self addProcessLookupSubstr:v8];
    }
    else if (([v7 isEqualToString:@"sender"] & 1) != 0 {
           || [v7 isEqualToString:@"senderImagePath"])
    }
    {
      v8 = [v6 constantValue];
      [(_OSLogCatalogFilter *)self addSenderLookupSubstr:v8];
    }
    else
    {
      if (![v7 isEqualToString:@"subsystem"]) {
        goto LABEL_12;
      }
      v8 = [v6 constantValue];
      [(_OSLogCatalogFilter *)self addSubsystem:v8];
    }

LABEL_12:
  }
}

- (void)addSubsystem:(id)a3
{
  self->_hasItems = 1;
  [(NSMutableSet *)self->_subsysSubstrAccept addObject:a3];
}

- (BOOL)containsUUID:(id)a3
{
  return [(NSMutableSet *)self->_uuidAccept containsObject:a3];
}

- (_OSLogCatalogFilter)initWithPredicate:(id)a3 collection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = getenv("LOG_USE_CATALOGFILTER");
  if (v8 && !strcmp(v8, "0")) {
    goto LABEL_10;
  }
  id v9 = [v7 UUIDTextReference];
  int v10 = [v9 fileDescriptor];

  if (fcntl(v10, 50, __s1, 1024) == -1)
  {
    __error();
    _os_assumes_log();
LABEL_10:
    v26 = 0;
    goto LABEL_11;
  }
  long long v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44AB80];
  long long v12 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44AB98];
  long long v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF44ABB0];
  v28.receiver = self;
  v28.super_class = (Class)_OSLogCatalogFilter;
  v14 = [(_OSLogCatalogFilter *)&v28 init];
  if (v14)
  {
    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pidAccept = v14->_pidAccept;
    v14->_pidAccept = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    processLookupSubstr = v14->_processLookupSubstr;
    v14->_processLookupSubstr = v17;

    char v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderLookupSubstr = v14->_senderLookupSubstr;
    v14->_senderLookupSubstr = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    subsysSubstrAccept = v14->_subsysSubstrAccept;
    v14->_subsysSubstrAccept = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uuidAccept = v14->_uuidAccept;
    v14->_uuidAccept = v23;

    v14->_uuidtext_path = strdup(__s1);
    v25 = _OSLogGetSimplePredicate(v6, v11, v12, v13);
    [v25 acceptVisitor:v14 flags:0];
    if (v14->_hasItems) {
      [(_OSLogCatalogFilter *)v14 generateUUIDSet];
    }
  }
  self = v14;

  v26 = self;
LABEL_11:

  return v26;
}

- (void)generateUUIDSet
{
  if ([(NSMutableSet *)self->_processLookupSubstr count]
    || [(NSMutableSet *)self->_senderLookupSubstr count])
  {
    [(_OSLogCatalogFilter *)self readDSOUUIDs];
  }
  if ([(NSMutableSet *)self->_senderLookupSubstr count])
  {
    [(_OSLogCatalogFilter *)self readDSCUUIDs];
  }
}

- (void)dealloc
{
  free(self->_uuidtext_path);
  v3.receiver = self;
  v3.super_class = (Class)_OSLogCatalogFilter;
  [(_OSLogCatalogFilter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidAccept, 0);
  objc_storeStrong((id *)&self->_subsysSubstrAccept, 0);
  objc_storeStrong((id *)&self->_senderLookupSubstr, 0);
  objc_storeStrong((id *)&self->_processLookupSubstr, 0);
  objc_storeStrong((id *)&self->_pidAccept, 0);
}

- (void)readDSCUUIDs
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  snprintf(__str, 0x400uLL, "%s/dsc", self->_uuidtext_path);
  objc_super v3 = opendir(__str);
  if (v3)
  {
    id v4 = v3;
    while (1)
    {
      v5 = readdir(v4);
      if (!v5) {
        break;
      }
      if (v5->d_type == 8)
      {
        __n128 v8 = 0uLL;
        if (_convertUUIDStringToUUID(v5->d_name, (unsigned __int8 *)&v8))
        {
          uuidtext_path = self->_uuidtext_path;
          v7[0] = MEMORY[0x1E4F143A8];
          v7[1] = 3221225472;
          v7[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke;
          v7[3] = &unk_1E5A42960;
          v7[4] = self;
          _os_trace_uuiddb_dsc_run_block_on_map(uuidtext_path, &v8, (uint64_t)v7);
        }
      }
    }
    closedir(v4);
  }
  else
  {
    _os_assumes_log();
  }
}

- (void)handleDSOFile:(_ftsent *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = openat(-2, a3->fts_path, 0);
  if (v3 == -1)
  {
    __error();
LABEL_8:
    _os_assumes_log();
    return;
  }
  int v4 = v3;
  v5 = (void *)_os_trace_mmap();
  _os_assumes_log();
  if (v5) {
    munmap(v5, 0);
  }
  if (close(v4) == -1)
  {
    int v6 = *__error();
    uint64_t v7 = *__error();
    if (v6 != 9) {
      goto LABEL_8;
    }
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v7;
    __break(1u);
  }
}

- (void)readDSOUUIDs
{
  v13[2] = *(char **)MEMORY[0x1E4F143B8];
  v13[0] = self->_uuidtext_path;
  v13[1] = 0;
  int v3 = fts_open(v13, 2, 0);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = MEMORY[0x1E4F14390];
LABEL_3:
    while (1)
    {
      int v6 = fts_read(v4);
      if (!v6) {
        break;
      }
      uint64_t v7 = v6;
      int fts_level = (unsigned __int16)v6->fts_level;
      if (fts_level == 2)
      {
        if (v6->fts_info == 8
          && strlen(v6->fts_name) == 30
          && (v7->fts_name[0] & 0x80000000) == 0
          && (*(_DWORD *)(v5 + 4 * v7->fts_name[0] + 60) & 0x10000) != 0)
        {
          unint64_t v9 = 0;
          while (v9 != 29)
          {
            unint64_t v10 = v9;
            int v11 = v7->fts_name[v9 + 1];
            if ((v11 & 0x80000000) == 0)
            {
              int v12 = *(_DWORD *)(v5 + 4 * v11 + 60);
              unint64_t v9 = v10 + 1;
              if ((v12 & 0x10000) != 0) {
                continue;
              }
            }
            if (v10 < 0x1D) {
              goto LABEL_3;
            }
            break;
          }
          [(_OSLogCatalogFilter *)self handleDSOFile:v7];
        }
      }
      else if (fts_level == 1 {
             && (v6->fts_info != 1
      }
              || strlen(v6->fts_name) != 2
              || v7->fts_name[0] < 0
              || (*(_DWORD *)(v5 + 4 * v7->fts_name[0] + 60) & 0x10000) == 0
              || v7->fts_name[1] < 0
              || (*(_DWORD *)(v5 + 4 * v7->fts_name[1] + 60) & 0x10000) == 0))
      {
        fts_set(v4, v7, 4);
      }
    }
    fts_close(v4);
  }
  else
  {
    _os_assumes_log();
  }
}

- (BOOL)containsSenderLookupSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_senderLookupSubstr;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "localizedStandardContainsString:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsProcessLookupSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_processLookupSubstr;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "localizedStandardContainsString:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addSenderLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  [(NSMutableSet *)self->_senderLookupSubstr addObject:a3];
}

- (void)addProcessLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  [(NSMutableSet *)self->_processLookupSubstr addObject:a3];
}

- (void)addUUID:(id)a3
{
}

- (void)addProcessID:(id)a3
{
  self->_hasItems = 1;
  [(NSMutableSet *)self->_pidAccept addObject:a3];
}

@end