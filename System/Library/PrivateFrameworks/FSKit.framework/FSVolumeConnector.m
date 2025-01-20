@interface FSVolumeConnector
+ (id)volumeConnectorModuleVolume:(id)a3 connection:(id)a4;
+ (id)volumeWithName:(id)a3 resource:(id)a4 connection:(id)a5;
- (FSItemGetAttributesRequest)standardGetAttrReq;
- (FSModuleVolume)ourVolume;
- (FSVolumeConnector)initWithModuleVolume:(id)a3 connection:(id)a4;
- (NSXPCConnection)ourConnection;
- (id)getFreeSpaceInVolume;
- (id)getStandardItemAttributes:(id)a3;
- (id)getStandardItemAttributesData:(id)a3;
- (id)getStandardItemAttributesDataForNewItem:(id)a3;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 type:(int64_t)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)fileAttributes:(id)a3 requestedAttributes:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)getRootFileHandle:(id)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)lookupIn:(id)a3 name:(id)a4 flags:(unsigned int)a5 requestID:(unint64_t)a6 replyHandler:(id)a7;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 replyHandler:(id)a9;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7;
- (void)makeSymlinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)mount:(id)a3 replyHandler:(id)a4;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)pathConfigurationOf:(id)a3 propertyName:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)readDirectory:(id)a3 requestedAttributes:(unint64_t)a4 intoBuffer:(id)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 replyHandler:(id)a9;
- (void)readDirectory:(id)a3 withAttr:(BOOL)a4 requestedAttributes:(unint64_t)a5 intoBuffer:(id)a6 cookie:(unint64_t)a7 verifier:(unint64_t)a8 requestID:(unint64_t)a9 replyHandler:(id)a10;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7;
- (void)readSymbolicLinkOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)reclaim:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 replyHandler:(id)a10;
- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 overItem:(id)a7 newName:(id)a8 replyHandler:(id)a9;
- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7;
- (void)setOurConnection:(id)a3;
- (void)setOurVolume:(id)a3;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8;
- (void)synchronize:(unsigned int)a3 replyHandler:(id)a4;
- (void)unmount:(id)a3;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6;
@end

@implementation FSVolumeConnector

- (FSVolumeConnector)initWithModuleVolume:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSVolumeConnector;
  v9 = [(FSVolumeConnector *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ourVolume, a3);
    objc_storeWeak((id *)&v10->_ourConnection, v8);
    v11 = [[FSItemGetAttributesRequest alloc] initWithWantedLIAttributes:81895];
    standardGetAttrReq = v10->_standardGetAttrReq;
    v10->_standardGetAttrReq = v11;

    atomic_store(0, &v10->_nextFreeSpaceSeqno);
    atomic_store(0, &v10->_nextAttributeSeqno);
  }

  return v10;
}

+ (id)volumeConnectorModuleVolume:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithModuleVolume:v7 connection:v6];

  return v8;
}

+ (id)volumeWithName:(id)a3 resource:(id)a4 connection:(id)a5
{
  id v8 = a5;
  v9 = +[FSModuleVolume volumeWithName:a3 resource:a4];
  v10 = (void *)[objc_alloc((Class)a1) initWithModuleVolume:v9 connection:v8];

  return v10;
}

- (id)getStandardItemAttributes:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  objc_initWeak(&location, self);
  id v6 = [(FSModuleVolume *)self->_ourVolume volume];
  standardGetAttrReq = self->_standardGetAttrReq;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__FSVolumeConnector_getStandardItemAttributes___block_invoke;
  v11[3] = &unk_26530BA80;
  objc_copyWeak(&v14, &location);
  v13 = &v16;
  id v8 = v5;
  v12 = v8;
  [v6 getAttributes:standardGetAttrReq ofItem:v4 replyHandler:v11];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v17[5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __47__FSVolumeConnector_getStandardItemAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__FSVolumeConnector_getStandardItemAttributes___block_invoke_cold_1(v6);
    }
  }
  WeakRetained = (atomic_ullong *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    atomic_fetch_add(WeakRetained + 2, 1uLL);
    objc_msgSend(v5, "setAttributeSeqno:");
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)getStandardItemAttributesData:(id)a3
{
  v3 = [(FSVolumeConnector *)self getStandardItemAttributes:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 attrsData];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)getStandardItemAttributesDataForNewItem:(id)a3
{
  id v4 = a3;
  id v5 = [(FSVolumeConnector *)self getStandardItemAttributes:v4];
  id v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "setType:", objc_msgSend(v5, "type"));
    id v7 = [v6 attrsData];
  }
  else
  {
    [v4 setType:0];
    id v7 = 0;
  }

  return v7;
}

- (id)getFreeSpaceInVolume
{
  unint64_t add = 0;
  v3 = [(FSVolumeConnector *)self ourVolume];
  id v4 = [v3 volume];
  id v5 = [v4 volumeStatistics];
  uint64_t v6 = [v5 availableBlocks];
  id v7 = [(FSVolumeConnector *)self ourVolume];
  id v8 = [v7 volume];
  id v9 = [v8 volumeStatistics];
  uint64_t v12 = [v9 blockSize] * v6;

  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_nextFreeSpaceSeqno, 1uLL);
  uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:&v12 length:16];
  return v10;
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a8;
  uint64_t v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v50 = "-[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:]";
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v14;
    __int16 v53 = 2048;
    NSUInteger v54 = location;
    __int16 v55 = 2048;
    NSUInteger v56 = length;
    __int16 v57 = 1024;
    int v58 = a5;
    __int16 v59 = 1024;
    unsigned int v60 = a6;
    __int16 v61 = 2048;
    unint64_t v62 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:theRangeLocation:%lu:theRangeLength:%lu:startIO:%d:flags:%d:operationID:%llu", buf, 0x40u);
  }

  v17 = self->_ourVolume;
  if ([(FSModuleVolume *)v17 supportsKOIOOps])
  {
    NSUInteger v37 = length;
    uint64_t v18 = [(FSModuleVolume *)v17 volume];
    id v38 = v14;
    v19 = [(FSModuleVolume *)v17 getItemForFH:v14];
    v20 = v19;
    if (v19)
    {
      if ([v19 type] == 1)
      {
        [(FSModuleVolume *)v17 volume];
        unint64_t v36 = a7;
        v22 = id v21 = v18;
        v23 = [v22 queueForItem:v20];

        uint64_t v18 = v21;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke;
        block[3] = &unk_26530BAD0;
        unsigned int v47 = a6;
        id v40 = v21;
        id v41 = v20;
        int v48 = a5;
        NSUInteger v44 = location;
        NSUInteger v45 = v37;
        unint64_t v46 = v36;
        v42 = self;
        id v43 = v15;
        dispatch_async(v23, block);
      }
      else
      {
        if ([v20 type] == 2) {
          uint64_t v33 = 21;
        }
        else {
          uint64_t v33 = 22;
        }
        v34 = fskit_std_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = [v20 type];
          *(_DWORD *)buf = 136315650;
          v50 = "-[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:]";
          __int16 v51 = 2048;
          uint64_t v52 = v35;
          __int16 v53 = 1024;
          LODWORD(v54) = v33;
          _os_log_impl(&dword_24DDB2000, v34, OS_LOG_TYPE_INFO, "%s: Given item is not a file (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, v33, 0, 0);
      }
    }
    else
    {
      v32 = fskit_std_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, 70, 0, 0);
    }
    id v14 = v38;
  }
  else
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      [(FSVolumeConnector *)v24 blockmapFile:v26 range:v27 startIO:v28 flags:v29 operationID:v30 replyHandler:v31];
    }

    (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, 45, 0, 0);
  }
}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke(uint64_t a1)
{
  [MEMORY[0x263EFF990] dataWithLength:24 * (*(_DWORD *)(a1 + 88) & 0x3F) + 24];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 mutableBytes];
  uint64_t v4 = [v2 length];
  id v5 = +[FSVolume extentPackerForBuffer:v3 bufLen:v4 extentCount:v19 + 3];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned int *)(a1 + 88);
  BOOL v9 = *(_DWORD *)(a1 + 92) != 0;
  uint64_t v10 = *(void *)(a1 + 80);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2;
  v13[3] = &unk_26530BAA8;
  id v16 = *(id *)(a1 + 56);
  v17 = &v18;
  id v11 = v2;
  uint64_t v12 = *(void *)(a1 + 48);
  id v14 = v11;
  uint64_t v15 = v12;
  objc_msgSend(v6, "blockmapFile:range:startIO:flags:operationID:usingPacker:replyHandler:", v7, *(void *)(a1 + 64), *(void *)(a1 + 72), v9, v8, v10, v5, v13);

  _Block_object_dispose(&v18, 8);
}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fs_posixCode");
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v6)
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, 24 * v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = [*(id *)(a1 + 40) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, void *))(v8 + 16))(v8, 0, v7, v9);
  }
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v33 = "-[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:]";
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2048;
    unint64_t v37 = a4;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    _os_log_debug_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:access:%ld:reqID:%llu", buf, 0x2Au);
  }

  v13 = self->_ourVolume;
  if ([(FSModuleVolume *)v13 supportsAccessOps])
  {
    id v14 = [(FSModuleVolume *)v13 volume];
    uint64_t v15 = [(FSModuleVolume *)v13 getItemForFH:v10];
    if (v15)
    {
      id v16 = [(FSModuleVolume *)v13 volume];
      v17 = [v16 queueForItem:v15];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke;
      v27[3] = &unk_26530BAF8;
      id v28 = v14;
      id v29 = v15;
      unint64_t v31 = a4;
      id v30 = v11;
      dispatch_async(v17, v27);
    }
    else
    {
      uint64_t v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }
  }
  else
  {
    uint64_t v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }
}

void __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_26530B1C0;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 checkAccessToItem:v2 requestedAccess:v3 replyHandler:v4];
}

uint64_t __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a8;
  id v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    int v48 = "-[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:]";
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v14;
    __int16 v51 = 2048;
    NSUInteger v52 = location;
    __int16 v53 = 2048;
    NSUInteger v54 = length;
    __int16 v55 = 1024;
    int v56 = a5;
    __int16 v57 = 1024;
    unsigned int v58 = a6;
    __int16 v59 = 2048;
    unint64_t v60 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:originalRangeLocation:%lu:originalRangeLength:%lu:ioStatus:%d:flags:%d:operationID:%llu", buf, 0x40u);
  }

  v17 = self->_ourVolume;
  if ([(FSModuleVolume *)v17 supportsKOIOOps])
  {
    uint64_t v18 = [(FSModuleVolume *)v17 volume];
    uint64_t v19 = [(FSModuleVolume *)v17 getItemForFH:v14];
    uint64_t v20 = v19;
    if (v19)
    {
      unint64_t v37 = (void *)v18;
      if ([v19 type] == 1)
      {
        uint64_t v21 = [(FSModuleVolume *)v17 volume];
        queue = [v21 queueForItem:v20];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke;
        block[3] = &unk_26530BB20;
        uint64_t v22 = v37;
        id v39 = v37;
        id v40 = v20;
        NSUInteger v42 = location;
        NSUInteger v43 = length;
        int v45 = a5;
        unsigned int v46 = a6;
        unint64_t v44 = a7;
        id v41 = v15;
        dispatch_async(queue, block);
      }
      else
      {
        if ([v20 type] == 2) {
          uint64_t v33 = 21;
        }
        else {
          uint64_t v33 = 22;
        }
        __int16 v34 = fskit_std_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = [v20 type];
          *(_DWORD *)buf = 136315650;
          int v48 = "-[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:]";
          __int16 v49 = 2048;
          uint64_t v50 = v35;
          __int16 v51 = 1024;
          LODWORD(v52) = v33;
          _os_log_impl(&dword_24DDB2000, v34, OS_LOG_TYPE_INFO, "%s: Given item is not a file (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t))v15 + 2))(v15, v33);
        uint64_t v22 = v37;
      }
    }
    else
    {
      unint64_t v31 = (void *)v18;
      v32 = fskit_std_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t))v15 + 2))(v15, 70);
      uint64_t v22 = v31;
    }
  }
  else
  {
    uint64_t v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      [(FSVolumeConnector *)v23 endIO:v25 range:v26 status:v27 flags:v28 operationID:v29 replyHandler:v30];
    }

    (*((void (**)(id, uint64_t))v15 + 2))(v15, 45);
  }
}

void __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 80);
  if (v4)
  {
    id v5 = fs_errorForPOSIXError(*(_DWORD *)(a1 + 80));
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 84);
  uint64_t v7 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2;
  v8[3] = &unk_26530B198;
  id v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "endIO:range:status:flags:operationID:replyHandler:", v3, *(void *)(a1 + 56), *(void *)(a1 + 64), v5, v6, v7, v8);
  if (v4) {
}
  }

uint64_t __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "fs_posixCode");
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  v103[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (void (**)(id, uint64_t, void))a6;
  uint64_t v12 = self->_ourVolume;
  v13 = [a4 string];
  id v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v13;
    LOWORD(v103[0]) = 2048;
    *(void *)((char *)v103 + 2) = a5;
    _os_log_debug_impl(&dword_24DDB2000, v14, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:reqID:%llu", buf, 0x2Au);
  }

  if ([v13 isEqual:@"_S_f_location"])
  {
    id v15 = [(FSModuleVolume *)self->_ourVolume resource];
    id v16 = +[FSResource dynamicCast:v15];

    if (v16)
    {
      v17 = [v16 BSDName];
      uint64_t v18 = [NSString stringWithFormat:@"/dev/%@", v17];
    }
    else
    {
      uint64_t v26 = [(FSModuleVolume *)self->_ourVolume resource];
      v17 = +[FSResource dynamicCast:v26];

      if (!v17)
      {
        v11[2](v11, 45, 0);
        goto LABEL_31;
      }
      uint64_t v27 = [v17 URL];
      uint64_t v28 = [v27 path];

      uint64_t v18 = (void *)v28;
    }
    id v29 = v18;
    uint64_t v30 = (const char *)[v29 UTF8String];
    unint64_t v31 = [MEMORY[0x263EFF8F8] dataWithBytes:v30 length:strlen(v30) + 1];
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v31);

LABEL_31:
LABEL_32:

    goto LABEL_33;
  }
  if ([v13 isEqualToString:@"_N_mntflags"])
  {
    if ([(FSModuleVolume *)v12 reportAsLocal]) {
      uint64_t v19 = 0x10000000;
    }
    else {
      uint64_t v19 = 0;
    }
    if (![(FSModuleVolume *)v12 supportsOpenCloseOps]) {
      v19 |= 2uLL;
    }
    if ([(FSModuleVolume *)v12 supportsKOIOOps]) {
      v19 |= 0x40000000uLL;
    }
    if ([(FSModuleVolume *)v12 supportsOpenUnlink]) {
      uint64_t v20 = v19 | 0x2000;
    }
    else {
      uint64_t v20 = v19;
    }
    uint64_t v21 = (void *)MEMORY[0x263EFF8F8];
    goto LABEL_18;
  }
  if ([v13 isEqual:@"_N_PC_LINK_MAX"])
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v25 = [v16 maximumLinkCount];
LABEL_28:
    uint64_t v32 = v25;
LABEL_29:
    v17 = [v24 dataWithInteger:v32];
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v17);
    goto LABEL_31;
  }
  if ([v13 isEqual:@"_N_PC_NAME_MAX"])
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v25 = [v16 maximumNameLength];
    goto LABEL_28;
  }
  if ([v13 isEqual:@"_B_PC_NO_TRUNC"])
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v32 = [v16 truncatesLongNames] ^ 1;
    goto LABEL_29;
  }
  if ([v13 isEqual:@"_N_PC_FILESIZEBITS"])
  {
    int64_t v33 = [(FSModuleVolume *)self->_ourVolume getMaxFileSizeInBits];
LABEL_40:
    if (!v33)
    {
      ((void (*)(void (**)(id, uint64_t, void), uint64_t))v11[2])(v11, 45);
      goto LABEL_33;
    }
    uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithInteger:v33];
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v23);
    goto LABEL_20;
  }
  if ([v13 isEqual:@"_N_PC_XATTR_SIZE_BITS"])
  {
    int64_t v33 = [(FSModuleVolume *)self->_ourVolume getMaxXattrSizeInBits];
    goto LABEL_40;
  }
  if ([v13 isEqualToString:@"_N_f_bsize"])
  {
    __int16 v34 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v35 = [v16 volumeStatistics];
    uint64_t v36 = [v35 blockSize];
LABEL_53:
    unint64_t v37 = [v34 dataWithInteger:v36];
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v37);

    goto LABEL_32;
  }
  if ([v13 isEqualToString:@"_N_f_iosize"])
  {
    __int16 v34 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v35 = [v16 volumeStatistics];
    uint64_t v36 = [v35 ioSize];
    goto LABEL_53;
  }
  if ([v13 isEqualToString:@"_N_f_blocks"])
  {
    __int16 v34 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v35 = [v16 volumeStatistics];
    uint64_t v36 = [v35 totalBlocks];
    goto LABEL_53;
  }
  if ([v13 isEqualToString:@"_N_f_bavail"])
  {
    __int16 v34 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v35 = [v16 volumeStatistics];
    uint64_t v36 = [v35 availableBlocks];
    goto LABEL_53;
  }
  if ([v13 isEqualToString:@"_N_f_bfree"])
  {
    __int16 v34 = (void *)MEMORY[0x263EFF8F8];
    id v16 = [(FSModuleVolume *)v12 volume];
    uint64_t v35 = [v16 volumeStatistics];
    uint64_t v36 = [v35 freeBlocks];
    goto LABEL_53;
  }
  if (![v13 isEqualToString:@"_N_f_bused"])
  {
    if ([v13 isEqualToString:@"_N_f_subtype"])
    {
      __int16 v34 = (void *)MEMORY[0x263EFF8F8];
      id v16 = [(FSModuleVolume *)v12 volume];
      uint64_t v35 = [v16 volumeStatistics];
      uint64_t v36 = [v35 fileSystemSubType];
      goto LABEL_53;
    }
    if (([v13 isEqualToString:@"_B_has_perm_enforcement"] & 1) != 0
      || [v13 isEqualToString:@"_B_has_access_check"])
    {
      *(void *)buf = 0;
      unint64_t v44 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v45 = 8;
LABEL_62:
      uint64_t v22 = [v44 dataWithBytes:buf length:v45];
      goto LABEL_19;
    }
    if ([v13 isEqualToString:@"_O_vol_attributes_attr"])
    {
      *(_OWORD *)buf = xmmword_24DDF1C10;
      *(_OWORD *)&buf[16] = unk_24DDF1C20;
      v103[0] = 1574;
      unint64_t v44 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v45 = 40;
      goto LABEL_62;
    }
    if ([v13 isEqualToString:@"_N_caps_format"])
    {
      __int16 v38 = [(FSModuleVolume *)v12 volume];
      id v39 = [v38 supportedVolumeCapabilities];
      uint64_t v43 = [v39 capabilities];
      goto LABEL_56;
    }
    if ([v13 isEqualToString:@"_N_caps_interfaces"])
    {
      if ([(FSModuleVolume *)v12 supportsVolumeRenameOps]) {
        uint64_t v46 = 128;
      }
      else {
        uint64_t v46 = 0;
      }
      if ([(FSModuleVolume *)v12 supportsPreallocateOps]) {
        v46 |= 0x40uLL;
      }
      if ([(FSModuleVolume *)v12 supportsXattrOps]
        && ![(FSModuleVolume *)v12 supportsLimitedXattrOps])
      {
        v46 |= 0x4000uLL;
      }
      uint64_t v21 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v20 = v46;
      goto LABEL_18;
    }
    if ([v13 isEqualToString:@"_S_f_type"])
    {
      uint64_t v23 = [(FSModuleVolume *)v12 volume];
      unsigned int v47 = [v23 volumeStatistics];
      int v48 = [v47 fileSystemTypeName];
LABEL_82:
      __int16 v51 = v48;
      NSUInteger v52 = [v48 dataUsingEncoding:4];
      ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v52);

LABEL_83:
      goto LABEL_20;
    }
    if ([v13 isEqualToString:@"_S_f_vol_name"])
    {
      __int16 v49 = [(FSModuleVolume *)v12 volume];
      uint64_t v50 = [v49 name];

      if (v50)
      {
        uint64_t v23 = [(FSModuleVolume *)v12 volume];
        unsigned int v47 = [v23 name];
        int v48 = [v47 string];
        goto LABEL_82;
      }
    }
    if ([v13 isEqualToString:@"_O_f_uuid"])
    {
      __int16 v53 = [(FSModuleVolume *)v12 volume];
      NSUInteger v54 = [v53 volumeID];

      if (v54)
      {
        uint64_t v23 = [(FSModuleVolume *)v12 volume];
        unsigned int v47 = [v23 volumeID];
        __int16 v51 = [v47 uuidData];
        ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v51);
        goto LABEL_83;
      }
    }
    if ([v13 isEqualToString:@"_N_supported_xattr_namessize"])
    {
      if ([(FSModuleVolume *)v12 supportsLimitedXattrOps])
      {
        obuint64_t j = [(FSModuleVolume *)v12 volume];
        v83 = [(FSModuleVolume *)v12 getItemForFH:v10];
        if (v83)
        {
          __int16 v55 = [obj supportedXattrNamesForItem:v83];
          int v56 = v55;
          if (v55)
          {
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            uint64_t v57 = [v55 countByEnumeratingWithState:&v95 objects:v101 count:16];
            if (v57)
            {
              uint64_t v58 = v57;
              uint64_t v59 = 0;
              uint64_t v60 = *(void *)v96;
              do
              {
                for (uint64_t i = 0; i != v58; ++i)
                {
                  if (*(void *)v96 != v60) {
                    objc_enumerationMutation(v56);
                  }
                  unint64_t v62 = [*(id *)(*((void *)&v95 + 1) + 8 * i) string];
                  v59 += [v62 lengthOfBytesUsingEncoding:4] + 1;
                }
                uint64_t v58 = [v56 countByEnumeratingWithState:&v95 objects:v101 count:16];
              }
              while (v58);
            }
            else
            {
              uint64_t v59 = 0;
            }
            v72 = [MEMORY[0x263EFF8F8] dataWithInteger:v59];
            ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v72);
          }
          else
          {
            v11[2](v11, 45, 0);
          }
        }
        else
        {
          v70 = fskit_std_log();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            -[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:]();
          }

          v11[2](v11, 70, 0);
        }

        v73 = obj;
LABEL_136:

        goto LABEL_33;
      }
    }
    else if ([v13 isEqualToString:@"_O_supported_xattr_names"] {
           && [(FSModuleVolume *)v12 supportsLimitedXattrOps])
    }
    {
      v84 = [(FSModuleVolume *)v12 volume];
      v82 = [(FSModuleVolume *)v12 getItemForFH:v10];
      if (v82)
      {
        v81 = [v84 supportedXattrNamesForItem:v82];
        if (v81 && [v81 count])
        {
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v63 = v81;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v91 objects:v100 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = 0;
            uint64_t v67 = *(void *)v92;
            do
            {
              for (uint64_t j = 0; j != v65; ++j)
              {
                if (*(void *)v92 != v67) {
                  objc_enumerationMutation(v63);
                }
                v69 = [*(id *)(*((void *)&v91 + 1) + 8 * j) string];
                v66 += [v69 lengthOfBytesUsingEncoding:4] + 1;
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v91 objects:v100 count:16];
            }
            while (v65);
          }
          else
          {
            uint64_t v66 = 0;
          }

          v74 = [MEMORY[0x263EFF990] dataWithCapacity:v66];
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id obja = v63;
          uint64_t v75 = [obja countByEnumeratingWithState:&v87 objects:v99 count:16];
          if (v75)
          {
            uint64_t v76 = v75;
            uint64_t v77 = *(void *)v88;
            do
            {
              for (uint64_t k = 0; k != v76; ++k)
              {
                if (*(void *)v88 != v77) {
                  objc_enumerationMutation(obja);
                }
                id v79 = [*(id *)(*((void *)&v87 + 1) + 8 * k) string];
                v80 = (const char *)[v79 UTF8String];

                [v74 appendBytes:v80 length:strlen(v80) + 1];
              }
              uint64_t v76 = [obja countByEnumeratingWithState:&v87 objects:v99 count:16];
            }
            while (v76);
          }

          ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v74);
        }
        else
        {
          v11[2](v11, 45, 0);
        }
      }
      else
      {
        v71 = fskit_std_log();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          -[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:]();
        }

        v11[2](v11, 70, 0);
      }

      v73 = v84;
      goto LABEL_136;
    }
    v11[2](v11, 45, 0);
    goto LABEL_33;
  }
  __int16 v38 = [(FSModuleVolume *)v12 volume];
  id v39 = [v38 volumeStatistics];
  uint64_t v40 = [v39 totalBlocks];
  id v41 = [(FSModuleVolume *)v12 volume];
  NSUInteger v42 = [v41 volumeStatistics];
  uint64_t v43 = v40 - [v42 freeBlocks];

LABEL_56:
  uint64_t v21 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v20 = v43;
LABEL_18:
  uint64_t v22 = [v21 dataWithInteger:v20];
LABEL_19:
  uint64_t v23 = (void *)v22;
  v11[2](v11, 0, v22);
LABEL_20:

LABEL_33:
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = [a4 string];
  id v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v40 = "-[FSVolumeConnector setOtherAttributeOf:named:value:requestID:replyHandler:]";
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2112;
    unint64_t v44 = v15;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 2048;
    unint64_t v48 = a6;
    _os_log_debug_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:value:%@:reqID:%llu", buf, 0x34u);
  }

  v17 = self->_ourVolume;
  uint64_t v18 = [(FSModuleVolume *)v17 getItemForFH:v12];
  if (v18)
  {
    if (v15)
    {
      if ([v15 isEqual:@"_N_SYNC"])
      {
        uint64_t v19 = *(unsigned int *)[v13 bytes];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke;
        v37[3] = &unk_26530B198;
        __int16 v38 = (FSModuleVolume *)v14;
        [(FSVolumeConnector *)self synchronize:v19 replyHandler:v37];
        uint64_t v20 = v38;
      }
      else
      {
        if ([v15 isEqual:@"_O_f_preallocate"]
          && [(FSModuleVolume *)v17 supportsPreallocateOps])
        {
          uint64_t v22 = [(FSModuleVolume *)v17 volume];
          uint64_t v23 = [v22 queueForItem:v18];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_2;
          block[3] = &unk_26530BB70;
          uint64_t v32 = v17;
          id v33 = v13;
          id v36 = v14;
          id v34 = v18;
          uint64_t v35 = self;
          dispatch_async(v23, block);

          goto LABEL_19;
        }
        if (![v15 isEqual:@"_S_f_vol_name"]
          || ![(FSModuleVolume *)v17 supportsVolumeRenameOps])
        {
          (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 45, 0, 0);
          goto LABEL_19;
        }
        uint64_t v24 = [(FSModuleVolume *)self->_ourVolume volume];
        uint64_t v25 = [v24 globalWorkQueue];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_4;
        v26[3] = &unk_26530BBC0;
        uint64_t v27 = v17;
        id v28 = v13;
        id v29 = self;
        id v30 = v14;
        dispatch_sync(v25, v26);

        uint64_t v20 = v27;
      }
    }
    else
    {
      (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 22, 0, 0);
    }
  }
  else
  {
    uint64_t v21 = fskit_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector setOtherAttributeOf:named:value:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 70, 0, 0);
  }
LABEL_19:
}

uint64_t __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    a2 = objc_msgSend(a2, "fs_posixCode");
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, void *, void, void))(v2 + 16);
  return v3(v2, a2, 0, 0);
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  if ((unint64_t)[*(id *)(a1 + 40) length] <= 0xE7)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_6:
    v3();
    goto LABEL_7;
  }
  uint64_t v4 = [*(id *)(a1 + 40) bytes];
  if ((*(unsigned char *)(v4 + 16) & 0x20) != 0)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_6;
  }
  uint64_t v5 = v4;
  id v6 = [MEMORY[0x263EFF990] dataWithData:*(void *)(a1 + 40)];
  uint64_t v7 = [v6 mutableBytes];
  uint64_t v8 = +[FSVolume extentPackerForBuffer:v7 + 32 bufLen:192 extentCount:v7 + 224];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)v5;
  uint64_t v11 = *(void *)(v5 + 8);
  uint64_t v12 = *(unsigned int *)(v5 + 16);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_3;
  v16[3] = &unk_26530BB48;
  uint64_t v20 = v7;
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 56);
  id v17 = v6;
  uint64_t v18 = v14;
  id v19 = v13;
  id v15 = v6;
  [v2 preallocateSpaceForItem:v9 offset:v10 length:v11 flags:v12 usingPacker:v8 replyHandler:v16];

LABEL_7:
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(a1 + 56) + 24) = a2;
  id v9 = v5;
  if (v5 && objc_msgSend(v5, "fs_posixCode"))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, uint64_t, void *))(v6 + 16))(v6, 0, v7, v8);
  }
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = +[FSFileName nameWithData:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_5;
  v5[3] = &unk_26530BB98;
  id v4 = *(id *)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  [v2 setVolumeName:v3 replyHandler:v5];
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (a3)
  {
    (*(void (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), objc_msgSend(a3, "fs_posixCode"), 0, 0);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) ourVolume];
    id v6 = [v5 volume];
    [v6 setName:v9];

    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [v9 data];
    (*(void (**)(uint64_t, void, void *, void))(v7 + 16))(v7, 0, v8, 0);
  }
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  ourVolume = self->_ourVolume;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  uint64_t v8 = [(FSModuleVolume *)ourVolume volume];
  id v9 = [v8 volumeStatistics];

  if (v9)
  {
    id v19 = [(FSModuleVolume *)self->_ourVolume volume];
    uint64_t v10 = [v19 volumeStatistics];
    v7[2](v7, 0, v10);
  }
  else
  {
    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FSVolumeConnector volumeStatistics:requestID:replyHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    v7[2](v7, 45, 0);
  }
}

- (void)createIn:(id)a3 named:(id)a4 type:(int64_t)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v36 = "-[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]";
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v14;
    __int16 v39 = 2112;
    id v40 = v15;
    __int16 v41 = 2048;
    unint64_t v42 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theDirectory:%@:named:%@:reqID:%llu", buf, 0x2Au);
  }

  id v19 = self->_ourVolume;
  uint64_t v20 = [(FSModuleVolume *)v19 getItemForFH:v14];
  uint64_t v21 = v20;
  if (v20)
  {
    if ([v20 type] == 2)
    {
      uint64_t v22 = [(FSModuleVolume *)v19 volume];
      uint64_t v23 = [v22 queueForItem:v21];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke;
      block[3] = &unk_26530BC38;
      id v28 = v16;
      id v29 = v19;
      id v30 = v15;
      int64_t v34 = a5;
      id v31 = v21;
      uint64_t v32 = self;
      id v33 = v17;
      dispatch_async(v23, block);
    }
    else
    {
      uint64_t v25 = fskit_std_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [v21 type];
        *(_DWORD *)buf = 136315650;
        id v36 = "-[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]";
        __int16 v37 = 2048;
        uint64_t v38 = v26;
        __int16 v39 = 1024;
        LODWORD(v40) = 20;
        _os_log_impl(&dword_24DDB2000, v25, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void, void, void))v17 + 2))(v17, 20, 0, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void, void, void))v17 + 2))(v17, 70, 0, 0, 0, 0);
  }
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[FSItemAttributes requestWithData:*(void *)(a1 + 32)];
  [v2 setType:1];
  uint64_t v3 = [*(id *)(a1 + 40) volume];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2;
  v9[3] = &unk_26530BC10;
  uint64_t v6 = *(void *)(a1 + 80);
  id v12 = *(id *)(a1 + 72);
  int8x16_t v8 = *(int8x16_t *)(a1 + 56);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = *(id *)(a1 + 40);
  [v3 createItemNamed:v4 type:v6 inDirectory:v5 attributes:v2 replyHandler:v9];
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int8x16_t v10 = v9;
  if (v9)
  {
    int v11 = objc_msgSend(v9, "fs_posixCode");
    if (v11)
    {
      if (v11 == 17)
      {
        id v12 = fskit_std_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_2(v10);
        }
      }
      else
      {
        id v12 = fskit_std_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v30 = [v10 description];
          *(_DWORD *)buf = 136315394;
          __int16 v39 = "-[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]_block_invoke_2";
          __int16 v40 = 2112;
          __int16 v41 = v30;
          _os_log_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_INFO, "%s:error:%@", buf, 0x16u);
        }
      }

      id v29 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
      v29();
      goto LABEL_15;
    }
  }
  if (!v7)
  {
    uint64_t v21 = fskit_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    id v29 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  uint64_t v13 = [*(id *)(a1 + 32) getStandardItemAttributesDataForNewItem:v7];
  id v14 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) insertIntoFHCache:v7];
  id v15 = [*(id *)(a1 + 48) volume];
  id v16 = [v15 queueForItem:v7];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_357;
  v31[3] = &unk_26530BBE8;
  id v32 = *(id *)(a1 + 48);
  id v33 = v13;
  id v37 = *(id *)(a1 + 56);
  id v34 = v14;
  id v17 = v7;
  uint64_t v18 = *(void *)(a1 + 32);
  id v35 = v17;
  uint64_t v36 = v18;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(v16, v31);

LABEL_15:
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_357(uint64_t a1)
{
  if ([*(id *)(a1 + 32) spotlightIsEnabled] && *(void *)(a1 + 40))
  {
    uint64_t v2 = fskit_std_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_357_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 56) fileHandle];
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [*(id *)(a1 + 64) getFreeSpaceInVolume];
  (*(void (**)(uint64_t, void, uint64_t, void *, uint64_t, void *))(v10 + 16))(v10, 0, v11, v12, v13, v14);
}

- (void)lookupIn:(id)a3 name:(id)a4 flags:(unsigned int)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a7;
  uint64_t v13 = self->_ourVolume;
  id v14 = [(FSModuleVolume *)v13 getItemForFH:a3];
  id v15 = v14;
  if (v14)
  {
    if ([v14 type] == 2)
    {
      id v16 = [(FSModuleVolume *)v13 volume];
      id v17 = [v16 queueForItem:v15];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke;
      block[3] = &unk_26530BCD8;
      id v24 = v12;
      void block[4] = self;
      uint64_t v21 = v13;
      unsigned int v25 = a5;
      id v22 = v11;
      id v23 = v15;
      dispatch_async(v17, block);
    }
    else
    {
      id v19 = fskit_std_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[FSVolumeConnector lookupIn:name:flags:requestID:replyHandler:]";
        __int16 v28 = 2048;
        uint64_t v29 = [v15 type];
        __int16 v30 = 1024;
        int v31 = 20;
        _os_log_impl(&dword_24DDB2000, v19, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void, void))v12 + 2))(v12, 20, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector lookupIn:name:flags:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void, void))v12 + 2))(v12, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }
}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int v31 = __Block_byref_object_copy__4;
  uint64_t v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v24 = 0;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_2;
  id v15 = &unk_26530BCB0;
  id v2 = *(id *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v20 = v2;
  uint64_t v16 = v3;
  id v17 = v4;
  uint64_t v21 = &v24;
  id v22 = &v28;
  int v23 = *(_DWORD *)(a1 + 72);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 56);
  uint64_t v5 = _Block_copy(&v12);
  if ((*(unsigned char *)(a1 + 75) & 0x10) != 0
    && objc_msgSend(*(id *)(a1 + 40), "supportsKOIOOps", v12, v13, v14, v15, v16, v17, v18))
  {
    uint64_t v6 = [MEMORY[0x263EFF990] dataWithLength:48];
    uint64_t v7 = (void *)v29[5];
    v29[5] = v6;

    uint64_t v8 = [ (id) v29[5] mutableBytes];
    uint64_t v9 = [(id)v29[5] length];
    uint64_t v10 = +[FSVolume extentPackerForBuffer:v8 bufLen:v9 extentCount:v25 + 3];
    id v11 = [*(id *)(a1 + 40) volume];
    [v11 lookupItemNamed:*(void *)(a1 + 48) inDirectory:*(void *)(a1 + 56) usingPacker:v10 replyHandler:v5];
  }
  else
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "volume", v12, v13, v14, v15);
    [v10 lookupItemNamed:*(void *)(a1 + 48) inDirectory:*(void *)(a1 + 56) replyHandler:v5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    (*(void (**)(void, uint64_t, uint64_t, void, void, void, void, void, void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), objc_msgSend(v9, "fs_posixCode"), 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) getStandardItemAttributesDataForNewItem:v7];
    [*(id *)(a1 + 40) insertIntoFHCache:v7];
    uint64_t v12 = *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v12)
    {
      uint64_t v13 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "subdataWithRange:", 0, 24 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__4;
    v44[4] = __Block_byref_object_dispose__4;
    id v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__4;
    v42[4] = __Block_byref_object_dispose__4;
    id v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    int v41 = -1;
    id v14 = &off_24DDF1000;
    if ((*(unsigned char *)(a1 + 91) & 0x20) != 0)
    {
      id v15 = NSString;
      uint64_t v16 = [*(id *)(a1 + 48) string];
      id v17 = [v15 stringWithFormat:@"._%@", v16];

      id v18 = [*(id *)(a1 + 40) volume];
      id v19 = +[FSFileName nameWithString:v17];
      uint64_t v20 = *(void *)(a1 + 56);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_3;
      v35[3] = &unk_26530BC60;
      uint64_t v38 = v44;
      __int16 v39 = v42;
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(a1 + 40);
      id v37 = v40;
      v35[4] = v21;
      id v36 = v22;
      [v18 lookupItemNamed:v19 inDirectory:v20 replyHandler:v35];

      id v14 = &off_24DDF1000;
    }
    int v23 = [*(id *)(a1 + 40) volume];
    uint64_t v24 = [v23 queueForItem:v7];

    block[0] = MEMORY[0x263EF8330];
    block[1] = *((void *)v14 + 354);
    block[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_4;
    block[3] = &unk_26530BC88;
    id v31 = *(id *)(a1 + 64);
    uint64_t v32 = v40;
    id v28 = v7;
    id v29 = v11;
    id v33 = v44;
    id v34 = v42;
    id v30 = v13;
    id v25 = v13;
    id v26 = v11;
    dispatch_async(v24, block);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

    _Block_object_dispose(v44, 8);
  }
}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  if (a4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(a4, "fs_posixCode");
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    uint64_t v7 = [*(id *)(a1 + 32) getStandardItemAttributesDataForNewItem:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1 + 40) insertIntoFHCache:v10];
  }
}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v8 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  if (v6)
  {
    uint64_t v7 = [*(id *)(v5 + 40) fileHandle];
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(uint64_t, void, uint64_t, id, uint64_t, void *, void, void, void, void))(v2 + 16))(v2, 0, v3, v8, v4, v7, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), 0, *(void *)(a1 + 48), 0);
  if (v6) {
}
  }

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v39 = "-[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:]";
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v15;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v16;
    __int16 v46 = 1024;
    int v47 = a6;
    __int16 v48 = 2048;
    unint64_t v49 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v18, OS_LOG_TYPE_DEBUG, "%s:start:parentDirectory:%@:theDirectory:%@:name:%@:flags:%d:reqID:%llu", buf, 0x3Au);
  }

  id v19 = self->_ourVolume;
  uint64_t v20 = [(FSModuleVolume *)v19 getItemForFH:v14];
  if (v20)
  {
    uint64_t v21 = [(FSModuleVolume *)v19 getItemForFH:v15];
    id v22 = v21;
    if (v21)
    {
      if ([v21 type] == 2)
      {
        int v23 = [(FSModuleVolume *)v19 volume];
        uint64_t v24 = [v23 queueForItem:v22];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke;
        block[3] = &unk_26530BD50;
        id v31 = v19;
        id v32 = v20;
        id v33 = v24;
        id v37 = v17;
        id v34 = v16;
        id v35 = v22;
        id v36 = self;
        id v25 = v24;
        dispatch_async(v25, block);
      }
      else
      {
        id v28 = fskit_std_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [v22 type];
          *(_DWORD *)buf = 136315650;
          __int16 v39 = "-[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:]";
          __int16 v40 = 2048;
          uint64_t v41 = v29;
          __int16 v42 = 1024;
          LODWORD(v43) = 20;
          _os_log_impl(&dword_24DDB2000, v28, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 20, 0, 0);
      }
    }
    else
    {
      int v27 = fskit_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 70, 0, 0);
    }
  }
  else
  {
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 70, 0, 0);
  }
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = [v2 queueForItem:*(void *)(a1 + 40)];

  if (v3 == *(NSObject **)(a1 + 48))
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_362;
    v6[3] = &unk_26530BD28;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    id v4 = *(id *)(a1 + 80);
    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = v4;
    dispatch_sync(v3, v6);
  }
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_362(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_26530BD00;
  id v10 = *(id *)(a1 + 72);
  int8x16_t v7 = *(int8x16_t *)(a1 + 56);
  id v6 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  [v2 removeItem:v3 named:v4 fromDirectory:v5 replyHandler:v8];
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(v3);
    }

    (*(void (**)(void, uint64_t, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), objc_msgSend(v3, "fs_posixCode"), 0, 0);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 48);
    int8x16_t v7 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, void *))(v6 + 16))(v6, 0, v5, v7);
  }
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v39 = "-[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:]";
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v14;
    __int16 v42 = 2112;
    id v43 = v15;
    __int16 v44 = 2112;
    id v45 = v16;
    __int16 v46 = 1024;
    int v47 = a6;
    __int16 v48 = 2048;
    unint64_t v49 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:theDirectory:%@:name:%@:flags:%d:reqID:%llu", buf, 0x3Au);
  }

  id v19 = self->_ourVolume;
  uint64_t v20 = [(FSModuleVolume *)v19 getItemForFH:v15];
  uint64_t v21 = v20;
  if (v20)
  {
    if ([v20 type] == 2)
    {
      id v22 = [(FSModuleVolume *)v19 getItemForFH:v14];
      if (v22)
      {
        int v23 = [(FSModuleVolume *)v19 volume];
        uint64_t v24 = [v23 queueForItem:v21];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke;
        block[3] = &unk_26530BD50;
        id v31 = v19;
        id v32 = v22;
        id v33 = v24;
        id v37 = v17;
        id v34 = v16;
        id v35 = v21;
        id v36 = self;
        id v25 = v24;
        dispatch_async(v25, block);
      }
      else
      {
        uint64_t v29 = fskit_std_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:]();
        }

        (*((void (**)(id, uint64_t, void, void, void))v17 + 2))(v17, 70, 0, 0, 0);
      }
    }
    else
    {
      int v27 = fskit_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = [v21 type];
        *(_DWORD *)buf = 136315650;
        __int16 v39 = "-[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:]";
        __int16 v40 = 2048;
        uint64_t v41 = v28;
        __int16 v42 = 1024;
        LODWORD(v43) = 20;
        _os_log_impl(&dword_24DDB2000, v27, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void, void))v17 + 2))(v17, 20, 0, 0, 0);
    }
  }
  else
  {
    id v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void, void))v17 + 2))(v17, 70, 0, 0, 0);
  }
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  id v3 = [v2 queueForItem:*(void *)(a1 + 40)];

  if (v3 == *(NSObject **)(a1 + 48))
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_363;
    v6[3] = &unk_26530BD28;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    id v4 = *(id *)(a1 + 80);
    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = v4;
    dispatch_sync(v3, v6);
  }
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_363(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_26530BD78;
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  void v8[4] = v7;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  [v2 removeItem:v3 named:v4 fromDirectory:v5 replyHandler:v8];
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(v3);
    }

    (*(void (**)(void, uint64_t, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), objc_msgSend(v3, "fs_posixCode"), 0, 0, 0);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    id v6 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, void *, void *))(v7 + 16))(v7, 0, v6, v5, v8);
  }
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector reclaim:requestID:replyHandler:]();
  }

  id v10 = self->_ourVolume;
  id v11 = [(FSModuleVolume *)v10 getAndRemoveItemForFH:v7];
  if (v11)
  {
    id v12 = [(FSModuleVolume *)v10 volume];
    uint64_t v13 = [v12 queueForItem:v11];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke;
    v15[3] = &unk_26530BBC0;
    id v16 = v10;
    id v17 = v11;
    id v18 = self;
    id v19 = v8;
    dispatch_async(v13, v15);
  }
  else
  {
    id v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector reclaim:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 70, 0);
  }
}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2;
  v5[3] = &unk_26530BDA0;
  id v4 = *(id *)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  [v2 reclaimItem:v3 replyHandler:v5];
}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "fs_posixCode");
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
  }
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FSVolumeConnector open:withMode:requestID:replyHandler:]";
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 1024;
    int v37 = a4;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    _os_log_debug_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:mode:%d:reqID:%llu", buf, 0x26u);
  }

  uint64_t v13 = self->_ourVolume;
  if ([(FSModuleVolume *)v13 supportsOpenCloseOps])
  {
    id v14 = [(FSModuleVolume *)v13 volume];
    id v15 = [(FSModuleVolume *)v13 getItemForFH:v10];
    if (v15)
    {
      id v16 = [(FSModuleVolume *)v13 volume];
      id v17 = [v16 queueForItem:v15];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke;
      v27[3] = &unk_26530BDC8;
      id v28 = v14;
      id v29 = v15;
      int v31 = a4;
      id v30 = v11;
      dispatch_async(v17, v27);
    }
    else
    {
      id v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector open:withMode:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }
  }
  else
  {
    id v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector open:withMode:requestID:replyHandler:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }
}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_26530B198;
  id v5 = *(id *)(a1 + 48);
  [v1 openItem:v2 withModes:v3 replyHandler:v4];
}

uint64_t __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "fs_posixCode");
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_2();
    }

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v4();
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FSVolumeConnector close:keepingMode:requestID:replyHandler:]";
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 1024;
    int v37 = a4;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    _os_log_debug_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:mode:%d:reqID:%llu", buf, 0x26u);
  }

  uint64_t v13 = self->_ourVolume;
  if ([(FSModuleVolume *)v13 supportsOpenCloseOps])
  {
    id v14 = [(FSModuleVolume *)v13 volume];
    id v15 = [(FSModuleVolume *)v13 getItemForFH:v10];
    if (v15)
    {
      id v16 = [(FSModuleVolume *)v13 volume];
      id v17 = [v16 queueForItem:v15];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke;
      v27[3] = &unk_26530BDC8;
      id v28 = v14;
      id v29 = v15;
      int v31 = a4;
      id v30 = v11;
      dispatch_async(v17, v27);
    }
    else
    {
      id v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector close:keepingMode:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }
  }
  else
  {
    id v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector close:keepingMode:requestID:replyHandler:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }
}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_26530B198;
  id v5 = *(id *)(a1 + 48);
  [v1 closeItem:v2 keepingModes:v3 replyHandler:v4];
}

uint64_t __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "fs_posixCode");
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_2();
    }

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v4();
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v42 = "-[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:]";
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v12;
    __int16 v45 = 2048;
    unint64_t v46 = a4;
    __int16 v47 = 2112;
    id v48 = v13;
    __int16 v49 = 2048;
    unint64_t v50 = a6;
    _os_log_debug_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:atOffset:%llu:buffer:%@:reqID:%llu", buf, 0x34u);
  }

  id v16 = self->_ourVolume;
  if ([(FSModuleVolume *)v16 supportsReadWriteOps])
  {
    id v17 = [(FSModuleVolume *)v16 volume];
    id v18 = [(FSModuleVolume *)v16 getItemForFH:v12];
    uint64_t v19 = v18;
    if (v18)
    {
      if ([v18 type] == 1)
      {
        uint64_t v20 = [(FSModuleVolume *)v16 volume];
        uint64_t v21 = [v20 queueForItem:v19];

        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke;
        v34[3] = &unk_26530BE18;
        id v35 = v17;
        id v36 = v13;
        id v37 = v19;
        unint64_t v40 = a4;
        __int16 v38 = self;
        id v39 = v14;
        dispatch_async(v21, v34);
      }
      else
      {
        if ([v19 type] == 2) {
          uint64_t v31 = 21;
        }
        else {
          uint64_t v31 = 22;
        }
        id v32 = fskit_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = [v19 type];
          *(_DWORD *)buf = 136315650;
          __int16 v42 = "-[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:]";
          __int16 v43 = 2048;
          uint64_t v44 = v33;
          __int16 v45 = 1024;
          LODWORD(v46) = v31;
          _os_log_impl(&dword_24DDB2000, v32, OS_LOG_TYPE_INFO, "%s: Given item is not a file (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, v31, 0, 0);
      }
    }
    else
    {
      id v30 = fskit_std_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 70, 0, 0);
    }
  }
  else
  {
    uint64_t v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:](v22, v23, v24, v25, v26, v27, v28, v29);
    }

    (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 45, 0, 0);
  }
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2;
  v7[3] = &unk_26530BDF0;
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  v7[4] = *(void *)(a1 + 56);
  id v8 = v6;
  [v2 writeContents:v3 toFile:v4 atOffset:v5 replyHandler:v7];
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, uint64_t, void *))(v7 + 16))(v7, 0, a2, v8);
  }
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = "-[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:]";
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v12;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2048;
    unint64_t v49 = a6;
    _os_log_debug_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:atOffset:%llu:buffer:%@:reqID:%llu", buf, 0x34u);
  }

  id v16 = self->_ourVolume;
  if ([(FSModuleVolume *)v16 supportsReadWriteOps])
  {
    id v17 = [(FSModuleVolume *)v16 volume];
    id v18 = [(FSModuleVolume *)v16 getItemForFH:v12];
    uint64_t v19 = v18;
    if (v18)
    {
      if ([v18 type] == 1)
      {
        uint64_t v20 = [(FSModuleVolume *)v16 volume];
        uint64_t v21 = [v20 queueForItem:v19];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke;
        block[3] = &unk_26530BE68;
        id v35 = v17;
        id v36 = v19;
        unint64_t v39 = a4;
        id v37 = v13;
        id v38 = v14;
        dispatch_async(v21, block);
      }
      else
      {
        if ([v19 type] == 2) {
          uint64_t v31 = 21;
        }
        else {
          uint64_t v31 = 22;
        }
        id v32 = fskit_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = [v19 type];
          *(_DWORD *)buf = 136315650;
          uint64_t v41 = "-[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:]";
          __int16 v42 = 2048;
          uint64_t v43 = v33;
          __int16 v44 = 1024;
          LODWORD(v45) = v31;
          _os_log_impl(&dword_24DDB2000, v32, OS_LOG_TYPE_INFO, "%s: Given item is not a file (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void))v14 + 2))(v14, v31, 0);
      }
    }
    else
    {
      id v30 = fskit_std_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 70, 0);
    }
  }
  else
  {
    uint64_t v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:](v22, v23, v24, v25, v26, v27, v28, v29);
    }

    (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 45, 0);
  }
}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = [*(id *)(a1 + 48) length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2;
  v7[3] = &unk_26530BE40;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 readFromFile:v3 offset:v4 length:v5 intoBuffer:v6 replyHandler:v7];
}

uint64_t __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_2();
    }
  }
  else
  {
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_1();
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)NSUInteger location = 136315906;
    *(void *)&location[4] = "-[FSVolumeConnector setFileAttributesOf:to:requestID:replyHandler:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2048;
    unint64_t v32 = a5;
    _os_log_debug_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:setAttrs:%@:reqID:%llu", location, 0x2Au);
  }

  id v14 = self->_ourVolume;
  id v15 = [(FSModuleVolume *)v14 getItemForFH:v10];
  if (v15)
  {
    objc_initWeak((id *)location, self);
    id v16 = [(FSModuleVolume *)v14 volume];
    id v17 = [v16 queueForItem:v15];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke;
    v19[3] = &unk_26530BEB8;
    id v20 = v11;
    uint64_t v21 = v14;
    id v22 = v15;
    id v24 = v12;
    objc_copyWeak(&v25, (id *)location);
    uint64_t v23 = self;
    dispatch_async(v17, v19);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)location);
  }
  else
  {
    id v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector setFileAttributesOf:to:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 70, 0, 0, 0);
  }
}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[FSItemAttributes requestWithData:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) volume];
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_26530BE90;
  id v12 = *(id *)(a1 + 64);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v2;
  id v11 = v7;
  [v3 setAttributes:v7 onItem:v4 replyHandler:v8];

  objc_destroyWeak(&v13);
}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = (atomic_ullong *)objc_loadWeakRetained((id *)(a1 + 64));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      atomic_fetch_add(WeakRetained + 2, 1uLL);
      objc_msgSend(v5, "setAttributeSeqno:");
    }
    if ((*(unsigned char *)([*(id *)(a1 + 32) bytes] + 8) & 0x40) != 0)
    {
      id v9 = [*(id *)(a1 + 40) getFreeSpaceInVolume];
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [v5 attrsData];
    (*(void (**)(uint64_t, void, void *, uint64_t, void *))(v10 + 16))(v10, 0, v11, [*(id *)(a1 + 48) consumedAttributes], v9);
  }
}

- (void)fileAttributes:(id)a3 requestedAttributes:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = self->_ourVolume;
  id v12 = [(FSModuleVolume *)v11 getItemForFH:v9];
  if (v12)
  {
    objc_initWeak(&location, self);
    id v13 = [(FSModuleVolume *)v11 volume];
    id v14 = [v13 queueForItem:v12];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke;
    v16[3] = &unk_26530BF08;
    v20[1] = (id)a4;
    id v17 = v11;
    id v18 = v12;
    id v19 = v10;
    objc_copyWeak(v20, &location);
    dispatch_async(v14, v16);
    objc_destroyWeak(v20);

    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector fileAttributes:requestedAttributes:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 70, 0);
  }
}

void __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[FSItemGetAttributesRequest alloc] initWithWantedLIAttributes:*(void *)(a1 + 64)];
  uint64_t v3 = [*(id *)(a1 + 32) volume];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke_2;
  v5[3] = &unk_26530BEE0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v3 getAttributes:v2 ofItem:v4 replyHandler:v5];

  objc_destroyWeak(&v7);
}

void __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (a3)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), objc_msgSend(a3, "fs_posixCode"), 0);
  }
  else
  {
    WeakRetained = (atomic_ullong *)objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      atomic_fetch_add(WeakRetained + 2, 1uLL);
      objc_msgSend(v9, "setAttributeSeqno:");
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v9 attrsData];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

- (void)readDirectory:(id)a3 withAttr:(BOOL)a4 requestedAttributes:(unint64_t)a5 intoBuffer:(id)a6 cookie:(unint64_t)a7 verifier:(unint64_t)a8 requestID:(unint64_t)a9 replyHandler:(id)a10
{
  BOOL v13 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v16 = a6;
  id v17 = a10;
  id v18 = self->_ourVolume;
  id v19 = [(FSModuleVolume *)v18 getItemForFH:a3];
  id v20 = v19;
  if (v19)
  {
    if ([v19 type] == 2)
    {
      if (a7 == -1)
      {
        (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 4294966295, 0, 0);
      }
      else
      {
        if (v13)
        {
          uint64_t v21 = [[FSItemGetAttributesRequest alloc] initWithWantedLIAttributes:a5];
          [(FSItemGetAttributesRequest *)v21 setWantedAttributes:8];
        }
        else
        {
          uint64_t v21 = 0;
        }
        id v24 = [(FSModuleVolume *)v18 volume];
        id v25 = [v24 queueForItem:v20];

        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
        v27[3] = &unk_26530BF58;
        id v28 = v16;
        BOOL v35 = v13;
        __int16 v29 = v18;
        unint64_t v33 = a7;
        unint64_t v34 = a8;
        id v30 = v20;
        __int16 v31 = v21;
        id v32 = v17;
        uint64_t v26 = v21;
        dispatch_sync(v25, v27);
      }
    }
    else
    {
      uint64_t v23 = fskit_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v37 = "-[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:]";
        __int16 v38 = 2048;
        uint64_t v39 = [v20 type];
        __int16 v40 = 1024;
        int v41 = 20;
        _os_log_impl(&dword_24DDB2000, v23, OS_LOG_TYPE_INFO, "%s: Given item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 20, 0, 0);
    }
  }
  else
  {
    id v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 70, 0, 0);
  }
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v16 = &v17;
  uint64_t v2 = [*(id *)(a1 + 32) mutableBytes];
  uint64_t v3 = [*(id *)(a1 + 32) length];
  uint64_t v4 = +[FSVolume newDirEntryPacker:v2 bufLen:v3 bytesPacked:v14[3] withAttr:*(unsigned __int8 *)(a1 + 88)];
  id v5 = [*(id *)(a1 + 40) volume];
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2;
  v10[3] = &unk_26530BF30;
  id v11 = *(id *)(a1 + 64);
  id v12 = &v13;
  [v5 enumerateDirectory:v8 startingAtCookie:v6 verifier:v7 providingAttributes:v9 usingPacker:v4 replyHandler:v10];

  _Block_object_dispose(&v13, 8);
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  uint64_t v6 = [v4 domain];
  uint64_t v7 = v6;
  if (v6 != @"FSVolumeErrorDomain")
  {

LABEL_9:
    objc_msgSend(v5, "fs_posixCode");
    id v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_2();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  uint64_t v9 = [v5 code];

  if (v9 != 1) {
    goto LABEL_9;
  }
  id v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
  v8();
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14 = a8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__FSVolumeConnector_readDirectory_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
  v16[3] = &unk_26530BF80;
  id v17 = v14;
  id v15 = v14;
  [(FSVolumeConnector *)self readDirectory:a3 withAttr:0 requestedAttributes:0 intoBuffer:a4 cookie:a5 verifier:a6 requestID:a7 replyHandler:v16];
}

uint64_t __85__FSVolumeConnector_readDirectory_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readDirectory:(id)a3 requestedAttributes:(unint64_t)a4 intoBuffer:(id)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 replyHandler:(id)a9
{
  id v16 = a9;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __105__FSVolumeConnector_readDirectory_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
  v18[3] = &unk_26530BF80;
  id v19 = v16;
  id v17 = v16;
  [(FSVolumeConnector *)self readDirectory:a3 withAttr:1 requestedAttributes:a4 intoBuffer:a5 cookie:a6 verifier:a7 requestID:a8 replyHandler:v18];
}

uint64_t __105__FSVolumeConnector_readDirectory_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readSymbolicLinkOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector readSymbolicLinkOf:requestID:replyHandler:]();
  }

  id v10 = self->_ourVolume;
  id v11 = [(FSModuleVolume *)v10 getItemForFH:v7];
  id v12 = v11;
  if (v11)
  {
    if ([v11 type] == 3)
    {
      uint64_t v13 = [(FSModuleVolume *)v10 volume];
      id v14 = [v13 queueForItem:v12];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke;
      v17[3] = &unk_26530BBC0;
      id v18 = v10;
      id v19 = v12;
      id v20 = self;
      id v21 = v8;
      dispatch_async(v14, v17);
    }
    else
    {
      id v16 = fskit_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = "-[FSVolumeConnector readSymbolicLinkOf:requestID:replyHandler:]";
        __int16 v24 = 2048;
        uint64_t v25 = [v12 type];
        __int16 v26 = 1024;
        int v27 = 22;
        _os_log_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_INFO, "%s: Given item is not a symlink (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 22, 0, 0);
    }
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector readSymbolicLinkOf:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 70, 0, 0);
  }
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2;
  v6[3] = &unk_26530BFA8;
  id v8 = *(id *)(a1 + 56);
  int8x16_t v5 = *(int8x16_t *)(a1 + 40);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 readSymbolicLink:v3 replyHandler:v6];
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int8x16_t v7 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [v5 data];
    (*(void (**)(uint64_t, void, void *, void *))(v9 + 16))(v9, 0, v10, v7);
  }
}

- (void)makeSymlinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = fskit_std_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    id v37 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]";
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v14;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2112;
    id v45 = v17;
    __int16 v46 = 2048;
    unint64_t v47 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v19, OS_LOG_TYPE_DEBUG, "%s:start:theDirectory:%@:name:%@:contents:%@:setAttrs:%@:reqID:%llu", buf, 0x3Eu);
  }

  id v20 = self->_ourVolume;
  id v21 = [(FSModuleVolume *)v20 getItemForFH:v14];
  id v22 = v21;
  if (v21)
  {
    if ([v21 type] == 2)
    {
      uint64_t v23 = [(FSModuleVolume *)v20 volume];
      __int16 v24 = [v23 queueForItem:v22];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke;
      block[3] = &unk_26530BFD0;
      id v29 = v17;
      id v30 = v16;
      __int16 v31 = v20;
      id v32 = v15;
      id v33 = v22;
      unint64_t v34 = self;
      id v35 = v18;
      dispatch_async(v24, block);
    }
    else
    {
      __int16 v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = [v22 type];
        *(_DWORD *)buf = 136315650;
        id v37 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]";
        __int16 v38 = 2048;
        uint64_t v39 = v27;
        __int16 v40 = 1024;
        LODWORD(v41) = 20;
        _os_log_impl(&dword_24DDB2000, v26, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, 20, 0, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v25 = fskit_std_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, 70, 0, 0, 0, 0);
  }
}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[FSItemAttributes requestWithData:*(void *)(a1 + 32)];
  uint64_t v3 = [[FSFileName alloc] initWithData:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 48) volume];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2;
  v9[3] = &unk_26530BC10;
  id v12 = *(id *)(a1 + 80);
  int8x16_t v8 = *(int8x16_t *)(a1 + 64);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = *(id *)(a1 + 48);
  [v4 createSymbolicLinkNamed:v5 inDirectory:v6 attributes:v2 linkContents:v3 replyHandler:v9];
}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int8x16_t v10 = v9;
  if (v9 && (v11 = objc_msgSend(v9, "fs_posixCode"), (int v12 = v11) != 0))
  {
    if (v11 == 17)
    {
      uint64_t v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2_cold_1();
      }
    }
    else
    {
      uint64_t v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        id v22 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]_block_invoke_2";
        __int16 v23 = 1024;
        LODWORD(v24) = v12;
        _os_log_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_INFO, "%s:reply:error:%d", (uint8_t *)&v21, 0x12u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) getStandardItemAttributesDataForNewItem:v7];
    id v15 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) insertIntoFHCache:v7];
    id v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v7 fileHandle];
      int v21 = 136315906;
      id v22 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]_block_invoke";
      __int16 v23 = 2112;
      __int16 v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_debug_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEBUG, "%s:reply:error:0:directoryAttrs:%@:theItem:%@:theAttrs:%@", (uint8_t *)&v21, 0x2Au);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [v7 fileHandle];
    id v19 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, void *, void *, void *))(v17 + 16))(v17, 0, v15, v18, v14, v19);
  }
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v37 = "-[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:]";
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2048;
    unint64_t v45 = a6;
    _os_log_debug_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEBUG, "%s:start:targetFile:%@:name:%@:theDirectory:%@:reqID:%llu", buf, 0x34u);
  }

  uint64_t v17 = self->_ourVolume;
  id v18 = [(FSModuleVolume *)v17 getItemForFH:v12];
  if (v18)
  {
    id v19 = [(FSModuleVolume *)v17 getItemForFH:v14];
    id v20 = v19;
    if (v19)
    {
      if ([v19 type] == 2)
      {
        int v21 = [(FSModuleVolume *)v17 volume];
        id v22 = [v21 queueForItem:v18];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke;
        block[3] = &unk_26530BD50;
        uint64_t v29 = v17;
        id v30 = v20;
        id v31 = v22;
        id v35 = v15;
        id v32 = v18;
        id v33 = v13;
        unint64_t v34 = self;
        __int16 v23 = v22;
        dispatch_async(v23, block);
      }
      else
      {
        __int16 v26 = fskit_std_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [v20 type];
          *(_DWORD *)buf = 136315650;
          id v37 = "-[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:]";
          __int16 v38 = 2048;
          uint64_t v39 = v27;
          __int16 v40 = 1024;
          LODWORD(v41) = 20;
          _os_log_impl(&dword_24DDB2000, v26, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void, void, void))v15 + 2))(v15, 20, 0, 0, 0);
      }
    }
    else
    {
      __int16 v25 = fskit_std_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void, void, void))v15 + 2))(v15, 70, 0, 0, 0);
    }
  }
  else
  {
    __int16 v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:]();
    }

    (*((void (**)(id, uint64_t, void, void, void))v15 + 2))(v15, 70, 0, 0, 0);
  }
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = [v2 queueForItem:*(void *)(a1 + 40)];

  if (v3 == *(NSObject **)(a1 + 48))
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_372;
    v6[3] = &unk_26530BD28;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 64);
    id v10 = *(id *)(a1 + 40);
    id v4 = *(id *)(a1 + 80);
    uint64_t v11 = *(void *)(a1 + 72);
    id v12 = v4;
    dispatch_sync(v3, v6);
  }
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_372(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_26530BFF8;
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  void v8[4] = v7;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  [v2 createLinkToItem:v3 named:v4 inDirectory:v5 replyHandler:v8];
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    uint64_t v5 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, id, void *))(v6 + 16))(v6, 0, v5, v8, v7);
  }
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v34 = "-[FSVolumeConnector xattrOf:named:requestID:replyHandler:]";
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2048;
    unint64_t v40 = a5;
    _os_log_debug_impl(&dword_24DDB2000, v13, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:reqID:%llu", buf, 0x2Au);
  }

  id v14 = self->_ourVolume;
  if ([(FSModuleVolume *)v14 supportsXattrOps])
  {
    id v15 = [(FSModuleVolume *)v14 volume];
    id v16 = [(FSModuleVolume *)v14 getItemForFH:v10];
    if (v16)
    {
      uint64_t v17 = [(FSModuleVolume *)v14 volume];
      id v18 = [v17 queueForItem:v16];

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke;
      v28[3] = &unk_26530C048;
      id v29 = v15;
      id v30 = v11;
      id v31 = v16;
      id v32 = v12;
      dispatch_async(v18, v28);
    }
    else
    {
      uint64_t v27 = fskit_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector xattrOf:named:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 70, 0);
    }
  }
  else
  {
    id v19 = fskit_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector xattrOf:named:requestID:replyHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 45, 0);
  }
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_26530C020;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 getXattrNamed:v2 ofItem:v3 replyHandler:v4];
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_2();
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_1();
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = "-[FSVolumeConnector setXattrOf:named:value:how:requestID:replyHandler:]";
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2048;
    unint64_t v49 = a7;
    _os_log_debug_impl(&dword_24DDB2000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:value:%@:reqID:%llu", buf, 0x34u);
  }

  id v19 = self->_ourVolume;
  if ([(FSModuleVolume *)v19 supportsXattrOps])
  {
    uint64_t v20 = [(FSModuleVolume *)v19 volume];
    uint64_t v21 = [(FSModuleVolume *)v19 getItemForFH:v14];
    if (v21)
    {
      uint64_t v22 = [(FSModuleVolume *)v19 volume];
      uint64_t v23 = [v22 queueForItem:v21];

      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke;
      v33[3] = &unk_26530C070;
      id v34 = v20;
      id v35 = v15;
      id v36 = v16;
      id v37 = v21;
      unint64_t v39 = a6;
      id v38 = v17;
      dispatch_async(v23, v33);
    }
    else
    {
      id v32 = fskit_std_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector setXattrOf:named:value:how:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t))v17 + 2))(v17, 70);
    }
  }
  else
  {
    uint64_t v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      [(FSVolumeConnector *)v24 setXattrOf:v26 named:v27 value:v28 how:v29 requestID:v30 replyHandler:v31];
    }

    (*((void (**)(id, uint64_t))v17 + 2))(v17, 45);
  }
}

void __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2;
  v6[3] = &unk_26530B198;
  uint64_t v5 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  [v1 setXattrNamed:v2 toData:v3 onItem:v4 policy:v5 replyHandler:v6];
}

uint64_t __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "fs_posixCode");
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v5();
  }
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector listXattrsOf:requestID:replyHandler:]();
  }

  id v10 = self->_ourVolume;
  if ([(FSModuleVolume *)v10 supportsXattrOps])
  {
    id v11 = [(FSModuleVolume *)v10 volume];
    id v12 = [(FSModuleVolume *)v10 getItemForFH:v7];
    if (v12)
    {
      id v13 = [(FSModuleVolume *)v10 volume];
      id v14 = [v13 queueForItem:v12];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke;
      block[3] = &unk_26530C0B8;
      id v25 = v11;
      id v26 = v12;
      id v27 = v8;
      dispatch_async(v14, block);
    }
    else
    {
      uint64_t v23 = fskit_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector listXattrsOf:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 70, 0);
    }
  }
  else
  {
    id v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector listXattrsOf:requestID:replyHandler:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 45, 0);
  }
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2;
  v3[3] = &unk_26530B878;
  id v4 = *(id *)(a1 + 48);
  [v1 listXattrsOfItem:v2 replyHandler:v3];
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fs_posixCode");
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5)
    {
      id v9 = objc_msgSend(v5, "fs_map:", &__block_literal_global_12);
    }
    else
    {
      id v9 = 0;
    }
    id v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_375(uint64_t a1, void *a2)
{
  return [a2 string];
}

- (void)getRootFileHandle:(id)a3
{
  ourVolume = self->_ourVolume;
  id v5 = (void (**)(id, uint64_t, void))a3;
  id v6 = [(FSModuleVolume *)ourVolume rootFSItem];

  if (v6)
  {
    id v8 = [(FSModuleVolume *)self->_ourVolume rootFSItem];
    uint64_t v7 = [v8 fileHandle];
    v5[2](v5, v7, 0);

    id v5 = (void (**)(id, uint64_t, void))v7;
  }
  else
  {
    fs_errorForPOSIXError(2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, void), void))v5[2])(v5, 0);
  }
}

- (void)mount:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector mount:replyHandler:]();
  }

  id v9 = self->_ourVolume;
  id v10 = [(FSModuleVolume *)v9 volume];
  id v11 = [v10 globalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FSVolumeConnector_mount_replyHandler___block_invoke;
  block[3] = &unk_26530C0B8;
  uint64_t v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v9;
  dispatch_sync(v11, block);
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] volume];
  uint64_t v3 = [a1[5] parameters];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__FSVolumeConnector_mount_replyHandler___block_invoke_2;
  v4[3] = &unk_26530C0E0;
  id v6 = a1[6];
  id v5 = a1[4];
  [v2 mountWithOptions:v3 replyHandler:v4];
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_2(v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) fetchAndSetTypeForItem:v5];
    [*(id *)(a1 + 32) insertIntoFHCache:v5];
    [*(id *)(a1 + 32) setRootFSItem:v5];
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_1(v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)synchronize:(unsigned int)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(FSModuleVolume *)self->_ourVolume volume];
  id v8 = [v7 globalWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FSVolumeConnector_synchronize_replyHandler___block_invoke;
  block[3] = &unk_26530C108;
  unsigned int v12 = a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __46__FSVolumeConnector_synchronize_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) volume];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__FSVolumeConnector_synchronize_replyHandler___block_invoke_2;
  v4[3] = &unk_26530B198;
  id v5 = *(id *)(a1 + 40);
  [v2 synchronizeWithFlags:v3 replyHandler:v4];
}

uint64_t __46__FSVolumeConnector_synchronize_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unmount:(id)a3
{
  id v4 = a3;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector unmount:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  id v13 = self->_ourVolume;
  id v14 = [(FSModuleVolume *)v13 volume];
  id v15 = [v14 globalWorkQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __29__FSVolumeConnector_unmount___block_invoke;
  v18[3] = &unk_26530C130;
  uint64_t v19 = v13;
  id v20 = v4;
  id v16 = v4;
  id v17 = v13;
  dispatch_sync(v15, v18);
}

void __29__FSVolumeConnector_unmount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __29__FSVolumeConnector_unmount___block_invoke_2;
  v3[3] = &unk_26530C130;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 unmountWithReplyHandler:v3];
}

uint64_t __29__FSVolumeConnector_unmount___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __29__FSVolumeConnector_unmount___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = (id)[*(id *)(a1 + 32) stopUsingVolume];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 replyHandler:(id)a9
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = fskit_std_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    uint64_t v58 = "-[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:]";
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v15;
    __int16 v61 = 2112;
    id v62 = v16;
    __int16 v63 = 2112;
    id v64 = v17;
    __int16 v65 = 2112;
    id v66 = v18;
    __int16 v67 = 1024;
    unsigned int v68 = a7;
    __int16 v69 = 2048;
    unint64_t v70 = a8;
    _os_log_debug_impl(&dword_24DDB2000, v20, OS_LOG_TYPE_DEBUG, "%s:start:sourceFile:%@:name:%@:theDirectory:%@:attributes:%@:flags:%d:reqID:%llu", buf, 0x44u);
  }

  uint64_t v21 = self->_ourVolume;
  if ([(FSModuleVolume *)v21 supportsCloneOps])
  {
    id v45 = [(FSModuleVolume *)v21 volume];
    uint64_t v22 = [(FSModuleVolume *)v21 getItemForFH:v17];
    uint64_t v23 = v22;
    if (v22)
    {
      if ([v22 type] == 2)
      {
        uint64_t v24 = [(FSModuleVolume *)v21 getItemForFH:v15];
        if (v24)
        {
          id v43 = (void *)v24;
          __int16 v44 = v16;
          id v25 = (void *)v24;
          id v26 = [(FSModuleVolume *)v21 volume];
          __int16 v42 = [v26 queueForItem:v23];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke;
          block[3] = &unk_26530C1A8;
          id v47 = v21;
          id v27 = v25;
          id v16 = v44;
          id v48 = v27;
          id v49 = v42;
          id v55 = v19;
          id v50 = v18;
          id v51 = v45;
          id v52 = v23;
          unsigned int v56 = a7;
          id v53 = v44;
          NSUInteger v54 = self;
          uint64_t v28 = v42;
          dispatch_async(v28, block);

          uint64_t v29 = v43;
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v41 = fskit_std_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:]();
          }

          (*((void (**)(id, uint64_t, void, void, void, void))v19 + 2))(v19, 70, 0, 0, 0, 0);
        }
      }
      else
      {
        unint64_t v39 = fskit_std_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = [v23 type];
          *(_DWORD *)buf = 136315650;
          uint64_t v58 = "-[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:]";
          __int16 v59 = 2048;
          uint64_t v60 = v40;
          __int16 v61 = 1024;
          LODWORD(v62) = 20;
          _os_log_impl(&dword_24DDB2000, v39, OS_LOG_TYPE_INFO, "%s: Given parent item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
        }

        (*((void (**)(id, uint64_t, void, void, void, void))v19 + 2))(v19, 20, 0, 0, 0, 0);
      }
    }
    else
    {
      id v38 = fskit_std_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:]();
      }

      (*((void (**)(id, uint64_t, void, void, void, void))v19 + 2))(v19, 70, 0, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v30 = fskit_std_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    (*((void (**)(id, uint64_t, void, void, void, void))v19 + 2))(v19, 45, 0, 0, 0, 0);
  }
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = [v2 queueForItem:*(void *)(a1 + 40)];

  if (*(NSObject **)(a1 + 48) == v3)
  {
    uint64_t v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    uint64_t v4 = +[FSItemAttributes requestWithData:*(void *)(a1 + 56)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_380;
    block[3] = &unk_26530C180;
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 80);
    id v14 = v4;
    int v18 = *(_DWORD *)(a1 + 104);
    id v5 = *(id *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 88);
    id v17 = v5;
    uint64_t v15 = v6;
    id v16 = *(id *)(a1 + 32);
    id v7 = v4;
    dispatch_sync(v3, block);
  }
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_380(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 96);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2;
  v10[3] = &unk_26530C158;
  id v8 = *(id *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 72);
  id v13 = v8;
  void v10[4] = v9;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 80);
  [v2 makeCloneOf:v3 inDirectory:v4 named:v5 attributes:v6 usingFlags:v7 replyHandler:v10];
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "fs_posixCode");
    uint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) getStandardItemAttributesDataForNewItem:v5];
    id v8 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) insertIntoFHCache:v5];
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [v5 fileHandle];
    id v11 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, void, void *, void *, void *, void *))(v9 + 16))(v9, 0, v8, v10, v7, v11);
  }
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  uint64_t v6 = (void (**)(id, void *))a6;
  uint64_t v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector setUpdateInterest:interest:requestID:replyHandler:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  uint64_t v15 = fs_errorForPOSIXError(45);
  v6[2](v6, v15);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  uint64_t v7 = (void (**)(id, void, void *))a5;
  if ([(id)*MEMORY[0x263F52250] isEqualToString:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_ourConnection);
    uint64_t v9 = [WeakRetained valueForEntitlement:@"com.apple.private.LiveFS.setmachport"];

    if (v9 && ([v9 BOOLValue] & 1) != 0)
    {
      if ([(FSModuleVolume *)self->_ourVolume supportsKOIOOps])
      {
        uint64_t v10 = [(FSModuleVolume *)self->_ourVolume ourExtension];
        uint64_t v11 = [v10 getFSMachPort];

        if (v11)
        {
          v7[2](v7, 0, v11);
        }
        else
        {
          uint64_t v36 = fskit_std_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:](v36, v37, v38, v39, v40, v41, v42, v43);
          }

          v7[2](v7, 102, 0);
        }
      }
      else
      {
        uint64_t v28 = fskit_std_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:](v28, v29, v30, v31, v32, v33, v34, v35);
        }

        v7[2](v7, 45, 0);
      }
    }
    else
    {
      id v20 = fskit_std_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      v7[2](v7, 13, 0);
    }
  }
  else
  {
    uint64_t v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:].cold.4(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    v7[2](v7, 102, 0);
  }
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  uint64_t v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector parentsAndAttributesForItemsByID:requestID:replyHandler:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v5[2](v5, 45, 0);
}

- (void)pathConfigurationOf:(id)a3 propertyName:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v19 = a3;
  id v9 = a6;
  uint64_t v10 = (void (**)(void, void, void))v9;
  switch(a4)
  {
    case 4:
      uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
      uint64_t v12 = [v11 maximumNameLength];
      goto LABEL_5;
    case 5:
    case 6:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      goto LABEL_6;
    case 7:
      uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
      uint64_t v13 = [v11 isChownRestricted];
      goto LABEL_9;
    case 8:
      uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
      uint64_t v13 = [v11 truncatesLongNames] ^ 1;
LABEL_9:
      v10[2](v10, 0, v13);
      goto LABEL_21;
    case 11:
      uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
      uint64_t v14 = [v11 supportedVolumeCapabilities];
      ((void (**)(void, void, BOOL))v10)[2](v10, 0, [v14 caseSensitivity] == 1);
      goto LABEL_20;
    case 12:
      uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
      uint64_t v14 = [v11 supportedVolumeCapabilities];
      if ([v14 caseSensitivity] == 1)
      {
        v10[2](v10, 0, 1);
      }
      else
      {
        uint64_t v17 = [(FSModuleVolume *)self->_ourVolume volume];
        uint64_t v18 = [v17 supportedVolumeCapabilities];
        ((void (**)(void, void, BOOL))v10)[2](v10, 0, [v18 caseSensitivity] == 2);
      }
LABEL_20:

      goto LABEL_21;
    case 18:
      int64_t v15 = [(FSModuleVolume *)self->_ourVolume getMaxFileSizeInBits];
      if (v15) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = 45;
      }
      v10[2](v10, v16, v15);
      goto LABEL_22;
    default:
      if (a4 == 1)
      {
        uint64_t v11 = [(FSModuleVolume *)self->_ourVolume volume];
        uint64_t v12 = [v11 maximumLinkCount];
LABEL_5:
        v10[2](v10, 0, v12);
LABEL_21:
      }
      else
      {
LABEL_6:
        (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 45, 0);
      }
LABEL_22:

      return;
  }
}

- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 overItem:(id)a7 newName:(id)a8 replyHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = self->_ourVolume;
  uint64_t v23 = [(FSModuleVolume *)v22 volume];
  queue = [v23 queueForItem:v16];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke;
  block[3] = &unk_26530C1F8;
  uint64_t v34 = v22;
  id v35 = v16;
  id v36 = v15;
  id v37 = v17;
  id v38 = v20;
  id v39 = v18;
  uint64_t v41 = self;
  id v42 = v21;
  id v40 = v19;
  id v24 = v21;
  id v25 = v19;
  id v26 = v18;
  id v27 = v20;
  id v28 = v17;
  id v29 = v15;
  id v30 = v16;
  uint64_t v31 = v22;
  dispatch_sync(queue, block);
}

void __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) volume];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke_2;
  v11[3] = &unk_26530C1D0;
  id v9 = *(id *)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 88);
  id v16 = v9;
  void v11[4] = v10;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  [v2 renameItem:v3 inDirectory:v4 named:v5 toNewName:v6 inDirectory:v7 overItem:v8 replyHandler:v11];
}

void __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = objc_msgSend(a3, "fs_posixCode");
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, void, void, void, void, void))(v4 + 16);
    v6(v4, v5, 0, 0, 0, 0, 0);
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 40)];
    uint64_t v7 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 48)];
    uint64_t v8 = [*(id *)(a1 + 32) getStandardItemAttributesData:*(void *)(a1 + 56)];
    if (*(void *)(a1 + 64))
    {
      id v9 = objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:");
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = objc_msgSend(0, "fs_posixCode");
    id v12 = [*(id *)(a1 + 32) getFreeSpaceInVolume];
    (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, void *))(v10 + 16))(v10, v11, v13, v7, v8, v9, v12);
  }
}

- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 replyHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  uint64_t v23 = self->_ourVolume;
  id v24 = v23;
  if (!v21 || v21 == v17)
  {
    [(FSVolumeConnector *)self renameItemIn:v16 item:v17 oldName:v18 toDirectory:v19 overItem:v21 newName:v20 replyHandler:v22];
  }
  else
  {
    id v25 = [(FSModuleVolume *)v23 volume];
    queue = [v25 queueForItem:v21];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_newName_toItem_usingFlags_replyHandler___block_invoke;
    block[3] = &unk_26530C220;
    void block[4] = self;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    id v32 = v21;
    id v33 = v20;
    id v34 = v22;
    dispatch_sync(queue, block);

    id v24 = (FSModuleVolume *)queue;
  }
}

uint64_t __98__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_newName_toItem_usingFlags_replyHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) renameItemIn:*(void *)(a1 + 40) item:*(void *)(a1 + 48) oldName:*(void *)(a1 + 56) toDirectory:*(void *)(a1 + 64) overItem:*(void *)(a1 + 72) newName:*(void *)(a1 + 80) replyHandler:*(void *)(a1 + 88)];
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a11;
  id v24 = self->_ourVolume;
  id v25 = [(FSModuleVolume *)v24 getItemForFH:v17];
  id v26 = v25;
  if (!v25)
  {
    id v28 = fskit_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]();
    }
    goto LABEL_9;
  }
  if ([v25 type] == 2)
  {
    if (v17 == v20)
    {
      id v27 = v26;
    }
    else
    {
      id v27 = [(FSModuleVolume *)v24 getItemForFH:v20];
      if (!v27)
      {
        id v28 = fskit_std_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:].cold.4();
        }
LABEL_9:

        (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 70, 0, 0, 0, 0, 0);
        goto LABEL_52;
      }
    }
    uint64_t v58 = v27;
    if ([v27 type] != 2)
    {
      id v32 = fskit_std_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v80 = "-[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]";
        __int16 v81 = 2048;
        uint64_t v82 = [v58 type];
        __int16 v83 = 1024;
        int v84 = 20;
        _os_log_impl(&dword_24DDB2000, v32, OS_LOG_TYPE_INFO, "%s: Given toDirectory item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
      }

      (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 20, 0, 0, 0, 0, 0);
      goto LABEL_51;
    }
    uint64_t v57 = [(FSModuleVolume *)v24 getItemForFH:v19];
    if (!v57)
    {
      id v31 = fskit_std_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]();
      }
      goto LABEL_26;
    }
    id v56 = v21;
    if (v22)
    {
      if (v19 == v22)
      {
        id v30 = v57;
      }
      else
      {
        id v30 = [(FSModuleVolume *)v24 getItemForFH:v22];
        if (!v30)
        {
          id v31 = fskit_std_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]();
          }
LABEL_26:

          (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 70, 0, 0, 0, 0, 0);
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
      }
      NSUInteger v54 = v18;
      id v33 = v30;
      uint64_t v34 = [v30 type];
      id v53 = v33;
      if (v34 != [v57 type])
      {
        id v18 = v54;
        if ([v33 type] == 2)
        {
          id v49 = fskit_std_log();
          id v21 = v56;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]";
            __int16 v81 = 1024;
            LODWORD(v82) = 21;
            _os_log_impl(&dword_24DDB2000, v49, OS_LOG_TYPE_INFO, "%s: Given fromItem is not a directory, but toItem is a directory. Error = %d.", buf, 0x12u);
          }

          (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 21, 0, 0, 0, 0, 0);
        }
        else
        {
          id v21 = v56;
          if ([v57 type] != 2)
          {
            id v51 = v22;
            id v52 = v19;
            goto LABEL_31;
          }
          id v50 = fskit_std_log();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]";
            __int16 v81 = 1024;
            LODWORD(v82) = 20;
            _os_log_impl(&dword_24DDB2000, v50, OS_LOG_TYPE_INFO, "%s: Given fromItem is a directory, but toItem is not a directory. Error = %d.", buf, 0x12u);
          }

          (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 20, 0, 0, 0, 0, 0);
        }

        goto LABEL_50;
      }
      id v51 = v22;
      id v52 = v19;
      id v21 = v56;
    }
    else
    {
      id v51 = 0;
      id v52 = v19;
      id v53 = 0;
      NSUInteger v54 = v18;
    }
LABEL_31:
    id v35 = [(FSModuleVolume *)v24 volume];
    id v36 = [v35 queueForItem:v26];

    id v37 = [(FSModuleVolume *)v24 volume];
    id v38 = [v37 queueForItem:v58];

    dispatch_queue_t queue = v36;
    if (v36 == v38)
    {
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke;
      v70[3] = &unk_26530C248;
      v70[4] = self;
      id v71 = v26;
      id v72 = v57;
      id v18 = v54;
      id v73 = v54;
      id v74 = v58;
      id v47 = v21;
      __int16 v44 = v53;
      id v75 = v47;
      id v76 = v53;
      unsigned int v78 = a9;
      id v77 = v23;
      id v48 = v53;
      dispatch_async(v36, v70);
    }
    else
    {
      if (v36 >= v38) {
        id v39 = v38;
      }
      else {
        id v39 = v36;
      }
      if (v36 >= v38) {
        id v40 = v36;
      }
      else {
        id v40 = v38;
      }
      uint64_t v41 = v39;
      id v42 = v40;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_2;
      block[3] = &unk_26530C270;
      uint64_t v60 = v42;
      __int16 v61 = self;
      id v62 = v26;
      id v63 = v57;
      id v64 = v54;
      id v65 = v58;
      id v43 = v21;
      __int16 v44 = v53;
      id v66 = v43;
      id v67 = v53;
      unsigned int v69 = a9;
      id v68 = v23;
      id v45 = v53;
      __int16 v46 = v42;
      dispatch_async(v41, block);

      id v18 = v54;
    }

    id v21 = v56;
    id v22 = v51;
    id v19 = v52;
    goto LABEL_50;
  }
  id v29 = fskit_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v80 = "-[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:]";
    __int16 v81 = 2048;
    uint64_t v82 = [v26 type];
    __int16 v83 = 1024;
    int v84 = 20;
    _os_log_impl(&dword_24DDB2000, v29, OS_LOG_TYPE_INFO, "%s: Given fromDirectory item is not a directory (type = %lu). Error = %d.", buf, 0x1Cu);
  }

  (*((void (**)(id, uint64_t, void, void, void, void, void))v23 + 2))(v23, 20, 0, 0, 0, 0, 0);
LABEL_52:
}

uint64_t __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  LODWORD(v2) = *(_DWORD *)(a1 + 96);
  return [*(id *)(a1 + 32) renameItemIn:*(void *)(a1 + 40) item:*(void *)(a1 + 48) oldName:*(void *)(a1 + 56) toDirectory:*(void *)(a1 + 64) newName:*(void *)(a1 + 72) toItem:*(void *)(a1 + 80) usingFlags:v2 replyHandler:*(void *)(a1 + 88)];
}

void __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_3;
  block[3] = &unk_26530C248;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  int v12 = *(_DWORD *)(a1 + 104);
  id v11 = *(id *)(a1 + 96);
  dispatch_sync(v2, block);
}

uint64_t __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_3(uint64_t a1)
{
  LODWORD(v2) = *(_DWORD *)(a1 + 96);
  return [*(id *)(a1 + 32) renameItemIn:*(void *)(a1 + 40) item:*(void *)(a1 + 48) oldName:*(void *)(a1 + 56) toDirectory:*(void *)(a1 + 64) newName:*(void *)(a1 + 72) toItem:*(void *)(a1 + 80) usingFlags:v2 replyHandler:*(void *)(a1 + 88)];
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v6 = (void (**)(id, uint64_t))a6;
  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector replenishSearchCreditsFor:credits:requestID:replyHandler:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v6[2](v6, 45);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v5 = (void (**)(id, uint64_t))a5;
  id v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector abortSearch:requestID:replyHandler:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v5[2](v5, 45);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11
{
  uint64_t v11 = (void (**)(id, uint64_t))a11;
  uint64_t v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FSVolumeConnector search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:replyHandler:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  v11[2](v11, 45);
}

- (FSModuleVolume)ourVolume
{
  return (FSModuleVolume *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOurVolume:(id)a3
{
}

- (NSXPCConnection)ourConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ourConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setOurConnection:(id)a3
{
}

- (FSItemGetAttributesRequest)standardGetAttrReq
{
  return (FSItemGetAttributesRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardGetAttrReq, 0);
  objc_destroyWeak((id *)&self->_ourConnection);
  objc_storeStrong((id *)&self->_ourVolume, 0);
}

void __47__FSVolumeConnector_getStandardItemAttributes___block_invoke_cold_1(void *a1)
{
  objc_msgSend(a1, "fs_posixCode");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13_0(&dword_24DDB2000, v1, v2, "%s:reply:error:%d", v3, v4, v5, v6, 2u);
}

- (void)blockmapFile:range:startIO:flags:operationID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)blockmapFile:(uint64_t)a3 range:(uint64_t)a4 startIO:(uint64_t)a5 flags:(uint64_t)a6 operationID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)checkAccessTo:requestedAccess:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)checkAccessTo:(uint64_t)a3 requestedAccess:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)endIO:range:status:flags:operationID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)endIO:(uint64_t)a3 range:(uint64_t)a4 status:(uint64_t)a5 flags:(uint64_t)a6 operationID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)otherAttributeOf:named:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:error:%d", v2, v3, v4, v5, v6);
}

- (void)setOtherAttributeOf:named:value:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:error:%d", v2, v3, v4, v5, v6);
}

- (void)volumeStatistics:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createIn:named:type:attributes:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:error:%d", v2, v3, v4, v5, v6);
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:error:%@", v4, v5, v6, v7, 2u);
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_357_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lookupIn:name:flags:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)removeDirectory:from:named:usingFlags:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:dir:error:%d", v2, v3, v4, v5, v6);
}

- (void)removeDirectory:from:named:usingFlags:requestID:replyHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:file:error:%d", v2, v3, v4, v5, v6);
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_24DDB2000, v0, v1, "%s:dirQ==parentQ:error:%d", v2, v3, v4, v5, v6);
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_15_0(&dword_24DDB2000, v2, v3, "%s:remove:error:%@", v4, v5, v6, v7, 2u);
}

- (void)removeItem:from:named:usingFlags:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:dir:error:%d", v2, v3, v4, v5, v6);
}

- (void)removeItem:from:named:usingFlags:requestID:replyHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:file:error:%d", v2, v3, v4, v5, v6);
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_24DDB2000, v0, v1, "%s:dirQ==fileQ:error:%d", v2, v3, v4, v5, v6);
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_15_0(&dword_24DDB2000, v2, v3, "%s:remove:error:%@", v4, v5, v6, v7, 2u);
}

- (void)reclaim:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)reclaim:requestID:replyHandler:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:start:theItem:%@:reqID:%llu", v2);
}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)open:withMode:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)open:(uint64_t)a3 withMode:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)close:keepingMode:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)close:(uint64_t)a3 keepingMode:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)writeTo:atOffset:fromBuffer:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)writeTo:(uint64_t)a3 atOffset:(uint64_t)a4 fromBuffer:(uint64_t)a5 requestID:(uint64_t)a6 replyHandler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:reply:error:0:actuallyWritten:%zu", v2, v3, v4, v5, 2u);
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)readFrom:atOffset:intoBuffer:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)readFrom:(uint64_t)a3 atOffset:(uint64_t)a4 intoBuffer:(uint64_t)a5 requestID:(uint64_t)a6 replyHandler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:reply:error:0:actuallyRead:%zu", v2, v3, v4, v5, 2u);
}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)setFileAttributesOf:to:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)fileAttributes:requestedAttributes:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)readSymbolicLinkOf:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)readSymbolicLinkOf:requestID:replyHandler:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:start:theDirectory:%@:reqID:%llu", v2);
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:reply:error:0:linkData:%@:linkAttrs:%@", v2);
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)makeSymlinkIn:named:contents:attributes:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_18();
  int v2 = 17;
  _os_log_debug_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_DEBUG, "%s:reply:error:%d", v1, 0x12u);
}

- (void)makeLinkOf:named:inDirectory:requestID:replyHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_11_0();
  _os_log_error_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_ERROR, "%s:reply:targetFile:%@:error:%d", (uint8_t *)v1, 0x1Cu);
}

- (void)makeLinkOf:named:inDirectory:requestID:replyHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_11_0();
  _os_log_error_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_ERROR, "%s:reply:theDirectory:%@:error:%d", (uint8_t *)v1, 0x1Cu);
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_24DDB2000, v0, v1, "%s:dirQ==fileQ:error:%d", v2, v3, v4, v5, v6);
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)xattrOf:named:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)xattrOf:(uint64_t)a3 named:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:reply:error:0:value:%@", v2, v3, v4, v5, 2u);
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)setXattrOf:named:value:how:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)setXattrOf:(uint64_t)a3 named:(uint64_t)a4 value:(uint64_t)a5 how:(uint64_t)a6 requestID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)listXattrsOf:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)listXattrsOf:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listXattrsOf:requestID:replyHandler:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_24DDB2000, v0, v1, "%s:start:theItem:%@:%llu", v2);
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:reply:error:0:value:%@", v2, v3, v4, v5, 2u);
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)mount:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:start:options:%@", v2, v3, v4, v5, 2u);
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 fileHandle];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:error:0:rootItem:%@", v4, v5, v6, v7, 2u);
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_2(void *a1)
{
  objc_msgSend(a1, "fs_posixCode");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13_0(&dword_24DDB2000, v1, v2, "%s:error:%d", v3, v4, v5, v6, 2u);
}

- (void)unmount:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __29__FSVolumeConnector_unmount___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, v6);
}

- (void)makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:file:error:%d", v2, v3, v4, v5, v6);
}

- (void)makeCloneOf:(uint64_t)a3 named:(uint64_t)a4 inDirectory:(uint64_t)a5 attributes:(uint64_t)a6 usingFlags:(uint64_t)a7 requestID:(uint64_t)a8 replyHandler:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_24DDB2000, v0, v1, "%s:dirQ==itemQ:error:%d", v2, v3, v4, v5, v6);
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:reply:error:%d", v2, v3, v4, v5, 2u);
}

- (void)setUpdateInterest:(uint64_t)a3 interest:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parentsAndAttributesForItemsByID:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:fromDir:error:%d", v2, v3, v4, v5, v6);
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:fromItem:error:%d", v2, v3, v4, v5, v6);
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:file:error:%d", v2, v3, v4, v5, v6);
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:toDir:error:%d", v2, v3, v4, v5, v6);
}

- (void)replenishSearchCreditsFor:(uint64_t)a3 credits:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)abortSearch:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)search:(uint64_t)a3 token:(uint64_t)a4 criteria:(uint64_t)a5 resumeAt:(uint64_t)a6 maxData:(uint64_t)a7 maxDelay:(uint64_t)a8 initialCredits:requestID:replyHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end