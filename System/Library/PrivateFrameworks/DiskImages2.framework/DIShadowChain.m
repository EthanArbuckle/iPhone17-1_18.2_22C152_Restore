@interface DIShadowChain
+ (BOOL)supportsSecureCoding;
- (BOOL)addShadowNodes:(id)a3 error:(id *)a4;
- (BOOL)addShadowURLs:(id)a3 error:(id *)a4;
- (BOOL)hasBaseImageCache;
- (BOOL)isEmpty;
- (BOOL)shouldValidate;
- (BOOL)verifyNodes:(id)a3 error:(id *)a4;
- (DIShadowChain)init;
- (DIShadowChain)initWithCoder:(id)a3;
- (NSArray)mountPoints;
- (NSArray)nonCacheNodes;
- (NSArray)shadowStats;
- (NSMutableArray)nodes;
- (NSURL)activeShadowURL;
- (id)description;
- (id)statWithError:(id *)a3;
- (int64_t)topDiskImageNumBlocks;
- (void)encodeWithCoder:(id)a3;
- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4;
- (void)setShouldValidate:(BOOL)a3;
@end

@implementation DIShadowChain

- (DIShadowChain)init
{
  v8.receiver = self;
  v8.super_class = (Class)DIShadowChain;
  v2 = [(DIShadowChain *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }
  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v13 = [DIShadowNode alloc];
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0, (void)v17);
        [v7 addObject:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  BOOL v15 = [(DIShadowChain *)self addShadowNodes:v7 error:a4];
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    BOOL v15 = 1;
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v11 = [v10 URL];
      char v12 = [v11 isFileURL];

      if ((v12 & 1) == 0)
      {
        v16 = [NSString stringWithFormat:@"Shadow path %@ is not a valid file", v10];
        BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:v16 error:a4];
LABEL_14:
        BOOL v15 = v17;

        goto LABEL_15;
      }
      v13 = [(DIShadowChain *)self nodes];
      int v14 = [v13 containsObject:v10];

      if (v14)
      {
        v16 = [NSString stringWithFormat:@"Duplicate shadow values for: %@", v10];
        BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:v16 error:a4];
        goto LABEL_14;
      }
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    BOOL v15 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(DIShadowChain *)self verifyNodes:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [(DIShadowChain *)self nodes];
    [v8 addObjectsFromArray:v6];
  }
  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  BOOL v7 = [(DIShadowChain *)self nodes];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__DIShadowChain_openWritable_createNonExisting___block_invoke;
  v8[3] = &unk_2644A23B0;
  BOOL v9 = a3;
  BOOL v10 = a4;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __48__DIShadowChain_openWritable_createNonExisting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  uint64_t v7 = 514;
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v7 = 514;
    }
    else {
      uint64_t v7 = 2562;
    }
  }
  if ([v5 isCache])
  {
    [v6 createBackendWithFlags:v7];
    int v8 = *__error();
    if (DIForwardLogs())
    {
      BOOL v9 = getDIOSLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      BOOL v10 = [v6 URL];
      [v10 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      int v14 = getDIOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = [v6 URL];
        v16 = [v15 path];
        *(_DWORD *)buf = 68158211;
        int v29 = 61;
        __int16 v30 = 2080;
        v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
        __int16 v32 = 2113;
        id v33 = v16;
        _os_log_impl(&dword_21E237000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Cache file %{private}@ opened with RW access", buf, 0x1Cu);
      }
    }
    goto LABEL_33;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    char v12 = [*(id *)(a1 + 32) nodes];
    if ([v12 count] - 1 == a3) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v6 createBackendWithFlags:v13];
  if ((v13 & 3) != 0)
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      BOOL v17 = getDIOSLog();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      long long v18 = [v6 URL];
      [v18 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      long long v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_33;
      }
      goto LABEL_25;
    }
    long long v22 = getDIOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v6 URL];
      uint64_t v24 = [v23 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = v24;
      _os_log_impl(&dword_21E237000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: Shadow file %{private}@ opened with RW access", buf, 0x1Cu);
    }
  }
  else
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      long long v20 = getDIOSLog();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      long long v21 = [v6 URL];
      [v21 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      long long v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_33;
      }
LABEL_25:
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v19);
      free(v19);
      goto LABEL_33;
    }
    v25 = getDIOSLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v6 URL];
      v27 = [v26 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = v27;
      _os_log_impl(&dword_21E237000, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Using an existing shadow file: %{private}@", buf, 0x1Cu);
    }
  }
LABEL_33:
  *__error() = v8;
}

- (id)statWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  shadowStats = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(DIShadowChain *)self nodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
      BOOL v10 = [v9 fileBackend];
      BOOL v11 = v10 == 0;

      if (v11) {
        break;
      }
      char v12 = [v9 fileBackend];
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 backend];
      }
      else
      {
        uint64_t v20 = 0;
        long long v21 = 0;
      }
      get_sink_backend((uint64_t)&v20, &v22);
      uint64_t fd_from_backend = get_fd_from_backend((uint64_t)&v22);
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
      }
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }

      if ((fd_from_backend & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:150 verboseInfo:@"Unexpected backend type for shadow file" error:a3];
        goto LABEL_22;
      }
      BOOL v15 = [[DIStatFS alloc] initWithFileDescriptor:fd_from_backend error:a3];
      v16 = v15;
      if (!v15)
      {
        +[DIError failWithEnumValue:150 verboseInfo:@"Could not stat shadow file" error:a3];
        goto LABEL_22;
      }
      [(DIStatFS *)v15 logWithHeader:@"Shadow underlying FS"];
      [shadowStats addObject:v16];

      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    +[DIError failWithEnumValue:150 verboseInfo:@"Bakcend not initialized for file" error:a3];
LABEL_22:

    BOOL v17 = 0;
    goto LABEL_23;
  }
LABEL_18:

  BOOL v17 = shadowStats;
  shadowStats = self->_shadowStats;
  self->_shadowStats = v17;
LABEL_23:

  return v17;
}

- (NSArray)mountPoints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(DIShadowChain *)self shadowStats];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) mountedOnURL];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  v2 = [(DIShadowChain *)self nodes];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  if ([(DIShadowChain *)self isEmpty]
    || ([(DIShadowChain *)self nodes],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 lastObject],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isCache],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(DIShadowChain *)self nodes];
    uint64_t v8 = [v7 lastObject];
    uint64_t v6 = [v8 URL];
  }
  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  if ([(DIShadowChain *)self isEmpty]) {
    return 0;
  }
  v4 = [(DIShadowChain *)self nodes];
  char v5 = [v4 firstObject];
  char v3 = [v5 isCache];

  return v3;
}

- (NSArray)nonCacheNodes
{
  char v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_1];
  v4 = [(DIShadowChain *)self nodes];
  char v5 = [v4 filteredArrayUsingPredicate:v3];

  return (NSArray *)v5;
}

uint64_t __30__DIShadowChain_nonCacheNodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCache] ^ 1;
}

- (int64_t)topDiskImageNumBlocks
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(DIShadowChain *)self isEmpty])
  {
    uint64_t v6 = [(DIShadowChain *)self nodes];
    uint64_t v7 = [v6 lastObject];

    uint64_t v8 = [v7 fileBackend];
    BOOL v9 = v8;
    if (v8)
    {
      [v8 backend];
      uint64_t v10 = *(void *)buf;
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)buf = 0;
    *(void *)uint64_t v15 = 0;

    int v12 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 176))(v10);
    dup(v12);
    diskimage_uio::diskimage_open_params::create();
  }
  int v3 = *__error();
  if (DIForwardLogs())
  {
    v4 = getDIOSLog();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&uint8_t buf[4] = 38;
    *(_WORD *)uint64_t v15 = 2080;
    *(void *)&v15[2] = "-[DIShadowChain topDiskImageNumBlocks]";
    char v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    long long v11 = getDIOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)uint64_t v15 = 2080;
      *(void *)&v15[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_ERROR, "%.*s: numBlocks queried for an empty shadowChain.", buf, 0x12u);
    }
  }
  *__error() = v3;
  return -22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIShadowChain;
  char v5 = [(DIShadowChain *)&v17 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"nodes"];
    nodes = v5->_nodes;
    v5->_nodes = (NSMutableArray *)v9;

    long long v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    long long v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"shadowStats"];
    shadowStats = v5->_shadowStats;
    v5->_shadowStats = (NSArray *)v14;

    v5->_shouldValidate = [v4 decodeBoolForKey:@"shouldValidate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DIShadowChain *)self nodes];
  [v6 encodeObject:v4 forKey:@"nodes"];

  char v5 = [(DIShadowChain *)self shadowStats];
  [v6 encodeObject:v5 forKey:@"shadowStats"];

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowChain shouldValidate](self, "shouldValidate"), @"shouldValidate");
}

- (id)description
{
  v2 = NSString;
  int v3 = [(DIShadowChain *)self nodes];
  id v4 = [v2 stringWithFormat:@"ShadowChain: %@", v3];

  return v4;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowStats, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end