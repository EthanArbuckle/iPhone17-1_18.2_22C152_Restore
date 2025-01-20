@interface DiskImageGraph
+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5;
+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4;
+ (BOOL)failWithNoPstackError:(id *)a3;
+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5;
+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7;
+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5;
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)createPstackDictWithNode:(id)a3;
+ (id)getFirstNonCacheAncestorWithNode:(id)a3 error:(id *)a4;
+ (id)getImageInfoDictWithURL:(id)a3 error:(id *)a4;
+ (id)getImageUUIDStrWithIdentityInfo:(id)a3 stackableUUIDFallback:(BOOL)a4 error:(id *)a5;
+ (id)getImageUUIDWithURL:(id)a3 allowMissingUUID:(BOOL)a4 error:(id *)a5;
+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4;
- (BOOL)appendCacheWithURL:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 setNewActive:(BOOL)a7 error:(id *)a8;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 toNode:(id)a7 setNewActive:(BOOL)a8 error:(id *)a9;
- (BOOL)appendWithURL:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 tag:(id)a4 numBlocks:(unint64_t)a5 error:(id *)a6;
- (BOOL)checkStackValidityWithError:(id *)a3;
- (BOOL)cloneToURL:(id)a3 error:(id *)a4;
- (BOOL)imported;
- (BOOL)loadImportedNodesWithError:(id *)a3;
- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)savePstackWithError:(id *)a3;
- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4;
- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4;
- (BOOL)validateAppendedImageWithURL:(id)a3 parentNode:(id)a4 isCache:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithBaseImageURL:(id)a3 newPstackURL:(id)a4 tag:(id)a5 error:(id *)a6;
- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7;
- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4;
- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5;
- (DiskImageGraphNode)activeNode;
- (NSMutableArray)imagesDictsArray;
- (NSMutableDictionary)nodes;
- (NSMutableDictionary)pstackDB;
- (NSURL)pstackURL;
- (id)activeInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (id)baseNode;
- (id)getImageWithTag:(id)a3 error:(id *)a4;
- (id)getImageWithUUID:(id)a3 error:(id *)a4;
- (id)infoWithExtra:(BOOL)a3 error:(id *)a4;
- (void)setActiveNode:(id)a3;
- (void)setImagesDictsArray:(id)a3;
- (void)setImported:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)setPstackDB:(id)a3;
- (void)setPstackURL:(id)a3;
@end

@implementation DiskImageGraph

+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5
{
  v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:0];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 readDataUpToLength:0x100000 error:a5];
    if (v9)
    {
      v10 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:2 format:0 error:a5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a4 = v10;
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = +[DiskImageGraph failWithNoPstackError:a5];
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = +[DiskImageGraph failWithNoPstackError:a5];
  }

  return v11;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:@"Not a pstack." forKeyedSubscript:@"DIErrorVerboseInfo"];
  v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:167 userInfo:v4];
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3 = a3;
  v4 = [v3 toDictionary];
  v5 = (void *)[v4 mutableCopy];
  [v3 setPstackDict:v5];

  v6 = (void *)MEMORY[0x263EFF9A0];
  v7 = [v3 UUID];
  v8 = [v7 UUIDString];
  v9 = (void *)MEMORY[0x263EFF980];
  v10 = [v3 pstackDict];

  BOOL v11 = [v9 arrayWithObject:v10];
  v12 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", @"1.0", @"PstackVersion", v8, @"ActiveNode", v11, @"Images", 0);

  return v12;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)DiskImageGraph;
  v15 = [(DiskImageGraph *)&v36 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  uint64_t v17 = [MEMORY[0x263F08C38] UUID];
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v35) = 0;
    v19 = [[PluginDiskImageGraphNode alloc] initWithPluginName:v11 pluginParams:v12 tag:v14 UUID:v17 parentNode:0 metadata:0 isCache:v35];
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    uint64_t v22 = +[DiskImageGraph createPstackDictWithNode:v21];
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    nodes = v16->_nodes;
    v16->_nodes = v24;

    v26 = [(DiskImageGraph *)v16 nodes];
    v27 = [(DiskImageGraphNode *)v21 UUID];
    v28 = [v27 UUIDString];
    [v26 setObject:v21 forKeyedSubscript:v28];

LABEL_4:
    v29 = v16;
    goto LABEL_12;
  }
  int v30 = *__error();
  if (DIForwardLogs())
  {
    v31 = getDIOSLog();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v38 = 73;
    __int16 v39 = 2080;
    v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    v32 = (char *)_os_log_send_and_compose_impl();

    if (v32)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v32);
      free(v32);
    }
  }
  else
  {
    v33 = getDIOSLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v38 = 73;
      __int16 v39 = 2080;
      v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl(&dword_21E237000, v33, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }
  }
  v29 = 0;
  *__error() = v30;
LABEL_12:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  v2 = [(DiskImageGraph *)self pstackDB];
  id v3 = [v2 objectForKeyedSubscript:@"Images"];

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  BOOL v6 = 0;
  if ([v5 validateAndPopObjectForKey:@"PstackVersion" className:objc_opt_class() isOptional:0 error:a4])
  {
    if ([v5 validateAndPopObjectForKey:@"ImportPstack" className:objc_opt_class() isOptional:1 error:a4])
    {
      BOOL v6 = 0;
      if ([v5 validateAndPopObjectForKey:@"ActiveNode" className:objc_opt_class() isOptional:0 error:a4])
      {
        BOOL v6 = 0;
        if ([v5 validateAndPopObjectForKey:@"Images" className:objc_opt_class() isOptional:0 error:a4])
        {
          if ([v5 count])
          {
            v7 = [NSString stringWithFormat:@"Validation failed, input contains unexpected data."];
            BOOL v6 = +[DIError failWithPOSIXCode:22 verboseInfo:v7 error:a4];
          }
          else
          {
            BOOL v6 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)DiskImageGraph;
  id v12 = [(DiskImageGraph *)&v26 init];
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:v10 error:a6])goto LABEL_10; {
    v12->_imported = a5;
    }
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    uint64_t v17 = [(NSMutableDictionary *)v12->_pstackDB objectForKeyedSubscript:@"Images"];
    BOOL v18 = +[DiskImageGraph populateNodesDictsWithArray:v17 pstackURL:v11 nodesDict:v12->_nodes isTopLevelPstack:1 error:a6];

    if (!v18 || ![(DiskImageGraph *)v12 loadImportedNodesWithError:a6]) {
      goto LABEL_10;
    }
    v19 = [(DiskImageGraph *)v12 nodes];
    v20 = [(NSMutableDictionary *)v12->_pstackDB objectForKeyedSubscript:@"ActiveNode"];
    uint64_t v21 = [v19 objectForKey:v20];
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      v23 = +[DIError nilWithPOSIXCode:22 description:@"Bad pstack format, node with active UUID not found." error:a6];
      goto LABEL_9;
    }
    if (!+[DiskImageGraph createNodesConnectivityWithNodesDict:v12->_nodes error:a6]|| ![(DiskImageGraph *)v12 checkStackValidityWithError:a6])
    {
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  v23 = v12;
LABEL_9:
  v24 = v23;
LABEL_11:

  return v24;
}

- (BOOL)loadImportedNodesWithError:(id *)a3
{
  v5 = [(DiskImageGraph *)self pstackDB];
  BOOL v6 = [v5 objectForKeyedSubscript:@"ImportPstack"];

  if (!v6) {
    goto LABEL_9;
  }
  if (![(DiskImageGraph *)self imported])
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      v7 = @"Multiple imports are not allowed.";
      goto LABEL_6;
    }
    v8 = NSURL;
    v9 = [v6 firstObject];
    id v10 = [(DiskImageGraph *)self pstackURL];
    id v11 = [v10 URLByDeletingLastPathComponent];
    id v12 = [v8 fileURLWithPath:v9 relativeToURL:v11];

    a3 = [[DiskImageGraph alloc] initWithPstackURL:v12 imported:1 error:a3];
    if (!a3)
    {

      goto LABEL_10;
    }
    uint64_t v13 = [(DiskImageGraph *)self nodes];
    id v14 = [a3 nodes];
    [v13 addEntriesFromDictionary:v14];

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }
  v7 = @"nested imports are not allowed.";
LABEL_6:
  LOBYTE(a3) = +[DIError failWithPOSIXCode:22 description:v7 error:a3];
LABEL_10:

  return (char)a3;
}

- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4
{
  return [(DiskImageGraph *)self initWithPstackURL:a3 imported:0 error:a4];
}

- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v13 = 0;
  BOOL v9 = +[DiskImageGraph loadPlistDictFromURL:v8 dict:&v13 error:a5];
  id v10 = v13;
  if (v9)
  {
    self = [(DiskImageGraph *)self initWithData:v10 pstackURL:v8 imported:v6 error:a5];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  objc_super v26 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v9 = [MEMORY[0x263F08850] defaultManager];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke;
  v17[3] = &unk_2644A21F0;
  v20 = &v28;
  id v10 = v7;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  uint64_t v21 = &v22;
  [v8 enumerateKeysAndObjectsUsingBlock:v17];
  uint64_t v12 = v29[5];
  if (v12)
  {
    id v13 = (void *)v23[5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2;
    v15[3] = &unk_2644A2218;
    id v16 = v11;
    [v13 enumerateObjectsUsingBlock:v15];
    if (a5) {
      *a5 = (id) v29[5];
    }
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12 == 0;
}

void __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = (void *)a1[4];
    BOOL v9 = [v7 filePath];
    id v10 = [v9 lastPathComponent];
    id v11 = [v8 URLByAppendingPathComponent:v10];

    uint64_t v12 = (void *)a1[5];
    id v13 = [v7 filePath];
    uint64_t v14 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v14 + 40);
    LOBYTE(v12) = [v12 copyItemAtURL:v13 toURL:v11 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);

    if (v12) {
      [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v11];
    }
    else {
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
    uint64_t v15 = *(void *)(a1[6] + 8);
    id v18 = *(id *)(v15 + 40);
    +[DIError failWithPOSIXCode:45 verboseInfo:@"Clone of plugin nodes is not supported." error:&v18];
    id v16 = v18;
    id v7 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
}

uint64_t __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self pstackURL];
  id v8 = [v7 lastPathComponent];
  BOOL v9 = [v6 URLByAppendingPathComponent:v8];

  id v10 = (void *)MEMORY[0x263EFF9A0];
  id v11 = [(DiskImageGraph *)self pstackDB];
  uint64_t v12 = [v10 dictionaryWithDictionary:v11];

  id v13 = [(DiskImageGraph *)self pstackDB];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"Images"];

  int v38 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:");
  uint64_t v15 = [(DiskImageGraph *)self pstackDB];
  id v16 = [v15 objectForKeyedSubscript:@"ImportPstack"];

  if (v16)
  {
    uint64_t v17 = @"Cannot clone a pstack with an import.";
LABEL_16:
    uint64_t v31 = 22;
LABEL_17:
    BOOL v30 = +[DIError failWithPOSIXCode:v31 description:v17 error:a4];
    goto LABEL_18;
  }
  if (([v6 isFileURL] & 1) == 0)
  {
    uint64_t v17 = @"Destination folder URL must be of 'file' scheme.";
    goto LABEL_16;
  }
  if (![v6 hasDirectoryPath]
    || ([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    uint64_t v17 = @"Destination folder URL must represent an existing folder.";
    uint64_t v31 = 20;
    goto LABEL_17;
  }
  id v33 = v14;
  v34 = v12;
  uint64_t v35 = a4;
  objc_super v36 = v9;
  id v37 = v6;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v24 = (void *)[v23 mutableCopy];
        v25 = [v23 objectForKeyedSubscript:@"FilePath"];
        objc_super v26 = [v25 componentsSeparatedByString:@"/"];
        id v27 = [v26 lastObject];
        [v24 setObject:v27 forKeyedSubscript:@"FilePath"];

        [v38 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v20);
  }

  uint64_t v28 = [(DiskImageGraph *)self nodes];
  id v6 = v37;
  BOOL v29 = +[DiskImageGraph copyDictNodesToFolder:v37 dict:v28 error:v35];

  if (v29)
  {
    uint64_t v12 = v34;
    BOOL v9 = v36;
    BOOL v30 = +[DiskImageGraph saveToPlistWithDictionary:v34 URL:v36 error:v35];
  }
  else
  {
    BOOL v30 = 0;
    BOOL v9 = v36;
    uint64_t v12 = v34;
  }
  uint64_t v14 = v33;
LABEL_18:

  return v30;
}

- (void)setActiveNode:(id)a3
{
  objc_storeStrong((id *)&self->_activeNode, a3);
  id v5 = a3;
  id v7 = [v5 UUID];
  id v6 = [v7 UUIDString];
  [(NSMutableDictionary *)self->_pstackDB setObject:v6 forKeyedSubscript:@"ActiveNode"];
}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  objc_super v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke;
  v18[3] = &unk_2644A2240;
  BOOL v22 = a6;
  id v14 = v12;
  id v19 = v14;
  uint64_t v21 = &v23;
  id v15 = v13;
  id v20 = v15;
  [v11 enumerateObjectsUsingBlock:v18];
  id v16 = (void *)v24[5];
  if (a7 && v16) {
    *a7 = v16;
  }

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

void __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  BOOL v9 = [v7 URLByDeletingLastPathComponent];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = +[DiskImageGraphNode GraphNodeWithDictionary:v8 updateChangesToDict:v6 workDir:v9 error:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    id v12 = *(void **)(a1 + 40);
    id v13 = [v11 UUID];
    id v14 = [v13 UUIDString];
    [v12 setObject:v11 forKey:v14];
  }
  else
  {
    *a4 = 1;
  }
}

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke;
  v9[3] = &unk_2644A2268;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v12;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (void *)v13[5];
  if (a4 && v7) {
    *a4 = v7;
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v15 = a3;
  id v6 = [v15 parentUUID];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v15 parentUUID];
    BOOL v9 = [v8 UUIDString];
    id v10 = [v7 objectForKey:v9];

    if (v10)
    {
      [v15 setParent:v10];
      id v11 = [v15 parent];
      uint64_t v12 = [v11 children];
      [v12 addObject:v15];
    }
    else
    {
      *a4 = 1;
      uint64_t v13 = +[DIError errorWithPOSIXCode:22 verboseInfo:@"Missing parent node in graph."];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  id v5 = [(DiskImageGraph *)self activeNode];
  unint64_t v6 = -1;
  while (v5)
  {
    id v7 = [v5 parent];

    id v8 = [(DiskImageGraph *)self nodes];
    unint64_t v9 = [v8 count];

    ++v6;
    id v5 = v7;
    if (v9 <= v6)
    {
      BOOL v10 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Invalid pstack, Active stack contains a loop." error:a3];

      return v10;
    }
  }
  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  id v5 = [(DiskImageGraph *)self pstackDB];
  unint64_t v6 = [(DiskImageGraph *)self pstackURL];
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:v5 URL:v6 error:a3];

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:a5];
  unint64_t v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v7 options:1 error:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self nodes];
  id v8 = [v6 UUIDString];

  unint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [(DiskImageGraph *)self setActiveNode:v9];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot find image with provided UUID." error:a4];
  }

  return v10;
}

- (id)getImageWithTag:(id)a3 error:(id *)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v6 = a3;
  id v17 = v6;
  id v7 = [(DiskImageGraph *)self nodes];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__DiskImageGraph_getImageWithTag_error___block_invoke;
  v15[3] = &unk_2644A2290;
  void v15[4] = v16;
  id v8 = [v7 keysOfEntriesPassingTest:v15];

  if ([v8 count])
  {
    if ([v8 count] == 1)
    {
      unint64_t v9 = [(DiskImageGraph *)self nodes];
      BOOL v10 = [v8 anyObject];
      id v11 = [v9 objectForKey:v10];

      goto LABEL_7;
    }
    uint64_t v12 = @"More than one image in the stack has the provided tag, please specify UUID instead.";
    uint64_t v13 = 22;
  }
  else
  {
    uint64_t v12 = @"Cannot find image with provided tag.";
    uint64_t v13 = 2;
  }
  id v11 = +[DIError nilWithPOSIXCode:v13 verboseInfo:v12 error:a4];
LABEL_7:

  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __40__DiskImageGraph_getImageWithTag_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 tag];
  uint64_t v5 = [v4 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(DiskImageGraph *)self nodes];
  id v8 = [v6 UUIDString];

  unint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[DIError nilWithPOSIXCode:2 verboseInfo:@"Cannot find image with provided uuid." error:a4];
  }
  id v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(DiskImageGraph *)self getImageWithTag:a3 error:a4];
  if (v5) {
    [(DiskImageGraph *)self setActiveNode:v5];
  }

  return v5 != 0;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = [(DiskImageGraph *)self nodes];
  id v10 = [v8 UUIDString];

  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11) {
    BOOL v12 = [(DiskImageGraph *)self removeWithNode:v11 recursive:v6 error:a5];
  }
  else {
    BOOL v12 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot find image with provided UUID." error:a5];
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = [(DiskImageGraph *)self getImageWithTag:a3 error:a5];
  if (v8) {
    BOOL v9 = [(DiskImageGraph *)self removeWithNode:v8 recursive:v6 error:a5];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = [v8 parent];

  if (v9)
  {
    id v10 = [v8 getDescendants];
    if (![v10 count] || v6)
    {
      uint64_t v14 = [(DiskImageGraph *)self activeNode];
      if ((id)v14 == v8)
      {
      }
      else
      {
        id v15 = (void *)v14;
        id v16 = [(DiskImageGraph *)self activeNode];
        int v17 = [v10 containsObject:v16];

        if (!v17)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v18 = objc_msgSend(v8, "children", 0);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(DiskImageGraph *)self removeWithNode:*(void *)(*((void *)&v29 + 1) + 8 * i) recursive:v6 error:0];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }
            while (v20);
          }

          [v8 deleteImage];
          uint64_t v23 = [(DiskImageGraph *)self imagesDictsArray];
          uint64_t v24 = [v8 pstackDict];
          [v23 removeObject:v24];

          uint64_t v25 = [(DiskImageGraph *)self nodes];
          objc_super v26 = [v8 UUID];
          id v27 = [v26 UUIDString];
          [v25 removeObjectForKey:v27];

          BOOL v13 = 1;
          goto LABEL_19;
        }
      }
      id v11 = @"The requested operation will delete the active node, please set another one first.";
      uint64_t v12 = 22;
    }
    else
    {
      id v11 = @"The requested operation will delete all children of the provided node. use recursive removal to surpress this error.";
      uint64_t v12 = 1;
    }
    BOOL v13 = +[DIError failWithPOSIXCode:v12 verboseInfo:v11 error:a5];
LABEL_19:

    goto LABEL_20;
  }
  BOOL v13 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot delete base image node." error:a5];
LABEL_20:

  return v13;
}

+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFileURL])
  {
    id v7 = [v5 URLByStandardizingPath];
    id v8 = [v7 path];

    BOOL v9 = [v6 URLByStandardizingPath];
    id v10 = [v9 path];

    if ([v8 hasPrefix:v10])
    {
      id v11 = NSURL;
      uint64_t v12 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v10, "length") + 1);
      id v13 = [v11 fileURLWithPath:v12 relativeToURL:v6];
    }
    else
    {
      id v13 = [v5 absoluteURL];
    }
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

- (id)baseNode
{
  v2 = [(DiskImageGraph *)self activeNode];
  id v3 = [v2 parent];

  if (v3)
  {
    do
    {
      v4 = [v2 parent];

      id v5 = [v4 parent];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (NSURL)pstackURL
{
  return self->_pstackURL;
}

- (void)setPstackURL:(id)a3
{
}

- (NSMutableDictionary)pstackDB
{
  return self->_pstackDB;
}

- (void)setPstackDB:(id)a3
{
}

- (void)setImagesDictsArray:(id)a3
{
}

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (DiskImageGraphNode)activeNode
{
  return self->_activeNode;
}

- (BOOL)imported
{
  return self->_imported;
}

- (void)setImported:(BOOL)a3
{
  self->_imported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNode, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_imagesDictsArray, 0);
  objc_storeStrong((id *)&self->_pstackDB, 0);
  objc_storeStrong((id *)&self->_pstackURL, 0);
}

- (id)infoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v6 = [(DiskImageGraph *)self baseNode];
  id v7 = [v6 recursiveInfoWithExtra:v5 error:a4];

  return v7;
}

- (id)activeInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = [(DiskImageGraph *)self activeNode];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    while (1)
    {
      uint64_t v10 = [v9 infoWithExtra:v5 error:a4];
      if (!v10) {
        break;
      }
      id v11 = (void *)v10;
      [v7 addObject:v10];
      uint64_t v12 = [v9 parent];

      BOOL v9 = (void *)v12;
      if (!v12) {
        goto LABEL_5;
      }
    }
    id v13 = 0;
  }
  else
  {
LABEL_5:
    BOOL v9 = [v7 reverseObjectEnumerator];
    id v13 = [v9 allObjects];
  }

  return v13;
}

+ (id)getImageInfoDictWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[DIImageInfoParams alloc] initWithURL:v5 error:a4];

  if (v6 && [(DIImageInfoParams *)v6 retrieveWithError:a4])
  {
    id v7 = [(DIImageInfoParams *)v6 imageInfo];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)getImageUUIDStrWithIdentityInfo:(id)a3 stackableUUIDFallback:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"Stable UUID"];
  if (!v8)
  {
    if (v6 && ([v7 objectForKey:@"UUID"], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = (void *)v9;
      int v10 = *__error();
      if (DIForwardLogs())
      {
        id v11 = getDIOSLog();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v16 = 91;
        __int16 v17 = 2080;
        id v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();

        if (v12)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v12);
          free(v12);
        }
      }
      else
      {
        id v13 = getDIOSLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v16 = 91;
          __int16 v17 = 2080;
          id v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
          _os_log_impl(&dword_21E237000, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Stable UUID not found in provided image, Falling back to using Stackable UUID.", buf, 0x12u);
        }
      }
      *__error() = v10;
    }
    else
    {
      uint64_t v8 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Provided image has no UUID info." error:a5];
    }
  }

  return v8;
}

+ (id)getImageUUIDWithURL:(id)a3 allowMissingUUID:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = +[DiskImageGraph getImageInfoDictWithURL:v7 error:a5];

  if (!v9)
  {
    id v15 = 0;
    int v16 = 0;
    goto LABEL_23;
  }
  int v10 = [v9 objectForKeyedSubscript:@"Image Format"];
  char v11 = [v10 isEqualToString:@"RAW"];

  if (v11)
  {
    if (v6)
    {
      int v12 = *__error();
      if (DIForwardLogs())
      {
        id v13 = getDIOSLog();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v23 = 74;
        __int16 v24 = 2080;
        uint64_t v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
        uint64_t v14 = (char *)_os_log_send_and_compose_impl();

        if (v14)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v14);
          free(v14);
        }
      }
      else
      {
        uint64_t v20 = getDIOSLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v23 = 74;
          __int16 v24 = 2080;
          uint64_t v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
          _os_log_impl(&dword_21E237000, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Base image is raw format, using nil UUID.", buf, 0x12u);
        }
      }
      *__error() = v12;
      uint64_t v19 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    }
    else
    {
      uint64_t v19 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Provided image has no UUID info." error:a5];
    }
    int v16 = (void *)v19;
    goto LABEL_20;
  }
  uint64_t v17 = [v9 objectForKey:@"Identity Info"];

  if (!v17)
  {
    int v16 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Provided image has no identity info." error:a5];
    uint64_t v8 = 0;
LABEL_20:
    id v15 = 0;
    goto LABEL_23;
  }
  id v15 = +[DiskImageGraph getImageUUIDStrWithIdentityInfo:v17 stackableUUIDFallback:v6 error:a5];
  if (v15)
  {
    uint64_t v18 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
    if (!v18)
    {
      uint64_t v18 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Error in new image's UUID." error:a5];
    }
    int v16 = (void *)v18;
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v8 = (void *)v17;
LABEL_23:

  return v16;
}

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(DiskImageGraph *)self activeNode];
  LOBYTE(a5) = [(DiskImageGraph *)self appendWithURL:v9 isCache:0 tag:v8 numBlocks:0 toNode:v10 setNewActive:0 error:a5];

  return (char)a5;
}

- (BOOL)appendCacheWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(DiskImageGraph *)self activeNode];
  LOBYTE(a5) = [(DiskImageGraph *)self appendWithURL:v9 isCache:1 tag:v8 numBlocks:0 toNode:v10 setNewActive:0 error:a5];

  return (char)a5;
}

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  int v12 = [(DiskImageGraph *)self activeNode];
  LOBYTE(a6) = [(DiskImageGraph *)self appendWithURL:v11 isCache:0 tag:v10 numBlocks:a5 toNode:v12 setNewActive:0 error:a6];

  return (char)a6;
}

+ (id)getFirstNonCacheAncestorWithNode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isCache])
  {
    do
    {
      BOOL v6 = [v5 parent];

      id v5 = v6;
    }
    while (([v6 isCache] & 1) != 0);
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v6 = v5;
    if (v5)
    {
LABEL_4:
      id v7 = v6;
      goto LABEL_7;
    }
  }
  id v7 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Pstack corrupted, found a cache node without a non-cache ancestor." error:a4];
LABEL_7:
  id v8 = v7;

  return v8;
}

- (BOOL)validateAppendedImageWithURL:(id)a3 parentNode:(id)a4 isCache:(BOOL)a5 error:(id *)a6
{
  int v7 = a5;
  id v10 = a4;
  id v11 = +[DiskImageGraph getImageInfoDictWithURL:a3 error:a6];
  if (v11 && [v10 validateAppendedImageWithInfo:v11 error:a6])
  {
    int v12 = [v11 objectForKeyedSubscript:@"Image Format"];
    int v13 = [v12 isEqualToString:@"ASIF"];

    if (v13)
    {
      uint64_t v14 = [v11 objectForKeyedSubscript:@"ASIF Info"];
      id v15 = [v14 objectForKeyedSubscript:@"Is Cache"];
      int v16 = [v15 BOOLValue];

      if (v16 == v7)
      {
        uint64_t v19 = [(DiskImageGraph *)self nodes];
        uint64_t v20 = [v11 objectForKeyedSubscript:@"Identity Info"];
        uint64_t v21 = [v20 objectForKeyedSubscript:@"Stable UUID"];
        BOOL v22 = [v19 objectForKeyedSubscript:v21];

        if (!v22)
        {
          BOOL v18 = 1;
          goto LABEL_11;
        }
        uint64_t v17 = @"Stack already contains an image with the same stable UUID.";
      }
      else
      {
        uint64_t v17 = @"Image cache flag does not match the requested operation.";
      }
    }
    else
    {
      uint64_t v17 = @"Can only append ASIF formatted images to pstack.";
    }
    BOOL v18 = +[DIError failWithPOSIXCode:22 verboseInfo:v17 error:a6];
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_11:

  return v18;
}

- (DiskImageGraph)initWithBaseImageURL:(id)a3 newPstackURL:(id)a4 tag:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)DiskImageGraph;
  int v13 = [(DiskImageGraph *)&v32 init];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_4;
  }
  [(DiskImageGraph *)v13 setPstackURL:v11];
  uint64_t v15 = +[DiskImageGraph getImageUUIDWithURL:v10 allowMissingUUID:1 error:a6];
  if (v15)
  {
    int v16 = (void *)v15;
    uint64_t v17 = [(DiskImageGraph *)v14 pstackURL];
    BOOL v18 = [v17 URLByDeletingLastPathComponent];
    uint64_t v19 = +[DiskImageGraph getRelativeIfContainedWithChildURL:v10 parentURL:v18];

    uint64_t v20 = [[DiskImageGraphNodeNative alloc] initWithURL:v19 tag:v12 UUID:v16 parentNode:0 metadata:0 isCache:0];
    [(DiskImageGraph *)v14 setActiveNode:v20];
    uint64_t v21 = +[DiskImageGraph createPstackDictWithNode:v20];
    [(DiskImageGraph *)v14 setPstackDB:v21];

    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(DiskImageGraph *)v14 setNodes:v22];

    int v23 = [(DiskImageGraph *)v14 nodes];
    __int16 v24 = [(DiskImageGraphNode *)v20 UUID];
    uint64_t v25 = [v24 UUIDString];
    [v23 setObject:v20 forKeyedSubscript:v25];

    id v10 = (id)v19;
LABEL_4:
    uint64_t v26 = v14;
    goto LABEL_12;
  }
  int v27 = *__error();
  if (DIForwardLogs())
  {
    id v28 = getDIOSLog();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v34 = 70;
    __int16 v35 = 2080;
    objc_super v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
    long long v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v29);
      free(v29);
    }
  }
  else
  {
    long long v30 = getDIOSLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v34 = 70;
      __int16 v35 = 2080;
      objc_super v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
      _os_log_impl(&dword_21E237000, v30, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }
  }
  uint64_t v26 = 0;
  *__error() = v27;
LABEL_12:

  return v26;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 setNewActive:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a3;
  int v16 = [(DiskImageGraph *)self activeNode];
  LOBYTE(a8) = [(DiskImageGraph *)self appendWithURL:v15 isCache:v11 tag:v14 numBlocks:a6 toNode:v16 setNewActive:v9 error:a8];

  return (char)a8;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 toNode:(id)a7 setNewActive:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v13 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  char v18 = [v15 checkResourceIsReachableAndReturnError:0];
  uint64_t v19 = +[DiskImageGraph getFirstNonCacheAncestorWithNode:v17 error:a9];
  uint64_t v20 = (void *)v19;
  if (!v19)
  {
    BOOL v24 = 0;
    goto LABEL_7;
  }
  char v21 = v18 ^ 1;
  if (!a6) {
    char v21 = 1;
  }
  if (v21)
  {
    BOOL v52 = v9;
    id v53 = v17;
    v54 = (void *)v19;
    if (v18)
    {
      if (![(DiskImageGraph *)self validateAppendedImageWithURL:v15 parentNode:v19 isCache:v13 error:a9])goto LABEL_21; {
LABEL_13:
      }
      id v51 = v16;
      long long v29 = [(DiskImageGraph *)self pstackURL];
      long long v30 = [v29 URLByDeletingLastPathComponent];
      uint64_t v25 = +[DiskImageGraph getRelativeIfContainedWithChildURL:v15 parentURL:v30];

      long long v31 = +[DiskImageGraph getImageUUIDWithURL:v25 allowMissingUUID:0 error:a9];
      BOOL v24 = v31 != 0;
      if (v31)
      {
        objc_super v32 = [[DiskImageGraphNodeNative alloc] initWithURL:v25 tag:v51 UUID:v31 parentNode:v53 metadata:0 isCache:v13];
        id v33 = [(DiskImageGraph *)self nodes];
        int v34 = [(DiskImageGraphNode *)v32 UUID];
        __int16 v35 = [v34 UUIDString];
        [v33 setObject:v32 forKey:v35];

        objc_super v36 = [(DiskImageGraph *)self imagesDictsArray];
        uint64_t v37 = [(DiskImageGraphNodeNative *)v32 toDictionary];
        [v36 addObject:v37];

        int v38 = [(DiskImageGraph *)self nodes];
        long long v39 = [(DiskImageGraphNode *)v32 parentUUID];
        long long v40 = [v39 UUIDString];
        long long v41 = [v38 objectForKey:v40];
        [(DiskImageGraphNode *)v32 setParent:v41];

        long long v42 = [(DiskImageGraph *)self imagesDictsArray];
        v43 = [v42 lastObject];
        [(DiskImageGraphNode *)v32 setPstackDict:v43];

        if (v52) {
          [(DiskImageGraph *)self setActiveNode:v32];
        }

        id v16 = v51;
        id v17 = v53;
      }
      else
      {
        int v44 = *__error();
        if (DIForwardLogs())
        {
          v45 = getDIOSLog();
          os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 68157954;
          int v56 = 95;
          __int16 v57 = 2080;
          v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
          v46 = (char *)_os_log_send_and_compose_impl();

          if (v46)
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v46);
            free(v46);
          }
        }
        else
        {
          v48 = getDIOSLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            int v56 = 95;
            __int16 v57 = 2080;
            v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
            _os_log_impl(&dword_21E237000, v48, OS_LOG_TYPE_ERROR, "%.*s: Failed to get info of newly created shadow/cache, will try to delete if an image was created.", buf, 0x12u);
          }
        }
        id v17 = v53;
        *__error() = v44;
        id v16 = v51;
        if ((v18 & 1) == 0)
        {
          v49 = [MEMORY[0x263F08850] defaultManager];
          [v49 removeItemAtURL:v25 error:0];

          id v17 = v53;
        }
      }

      goto LABEL_28;
    }
    uint64_t v26 = [DIStackParams alloc];
    uint64_t v27 = [v17 URL];
    id v28 = [(DIStackParams *)v26 initWithURL:v27 error:a9];

    LOBYTE(v27) = [(DIStackParams *)v28 appendWithURL:v15 isCache:v13 numBlocks:a6 error:a9];
    if (v27)
    {
      if ([(DiskImageGraph *)self validateAppendedImageWithURL:v15 parentNode:v54 isCache:v13 error:a9])
      {
        goto LABEL_13;
      }
      v47 = [MEMORY[0x263F08850] defaultManager];
      [v47 removeItemAtURL:v15 error:0];
    }
LABEL_21:
    BOOL v24 = 0;
    uint64_t v25 = v15;
    id v17 = v53;
LABEL_28:
    uint64_t v20 = v54;
    goto LABEL_29;
  }
  id v22 = (void *)v19;
  BOOL v23 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Append of existing image with custom size is not supported." error:a9];
  uint64_t v20 = v22;
  BOOL v24 = v23;
LABEL_7:
  uint64_t v25 = v15;
LABEL_29:

  return v24;
}

@end