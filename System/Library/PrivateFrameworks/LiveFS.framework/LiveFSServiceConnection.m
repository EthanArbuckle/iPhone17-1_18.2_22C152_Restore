@interface LiveFSServiceConnection
+ (id)newConnectionForMount:(id)a3 connection:(id)a4 error:(id *)a5;
+ (id)newExportObjectForObject:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)initForMount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)sanitizedAttrsForNewObjectAttrs:(id)a3 forType:(unsigned int)a4;
- (unint64_t)ourID;
- (void)LIGetAttr:(id)a3 reply:(id)a4;
- (void)LIGetFsAttr:(id)a3 name:(id)a4 reply:(id)a5;
- (void)LIGetParentsAndAttributesForFileIDs:(id)a3 reply:(id)a4;
- (void)LIGetRootFileHandle:(id)a3;
- (void)LILookup:(id)a3 name:(id)a4 reply:(id)a5;
- (void)LISearch:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 reply:(id)a10;
- (void)LISearchAbort:(id)a3 reply:(id)a4;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)dealloc;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)getRootFileHandleWithError:(id)a3;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)scrubOurClientId;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation LiveFSServiceConnection

- (id)initForMount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LiveFSServiceConnection;
  v11 = [(LiveFSServiceConnection *)&v17 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v11->mount, a3);
  if (!a5)
  {
    v12->_ourID = [v9 newConnectionIDOrError:0];
LABEL_6:
    objc_storeWeak((id *)&v12->ourConnection, v10);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.LiveFSServiceConnection.setUpdateInterest", 0);
    setUpdateInterestQueue = v12->setUpdateInterestQueue;
    v12->setUpdateInterestQueue = (OS_dispatch_queue *)v14;

LABEL_7:
    v13 = v12;
    goto LABEL_8;
  }
  *a5 = 0;
  v13 = 0;
  v12->_ourID = [v9 newConnectionIDOrError:a5];
  if (!*a5) {
    goto LABEL_6;
  }
LABEL_8:

  return v13;
}

- (void)scrubOurClientId
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_ourID && self->mount)
  {
    v3 = livefs_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t ourID = self->_ourID;
      int v5 = 134217984;
      unint64_t v6 = ourID;
      _os_log_impl(&dword_23AB0B000, v3, OS_LOG_TYPE_DEFAULT, "About to scrub client mask 0x%016llx", (uint8_t *)&v5, 0xCu);
    }

    [(LiveFSVolume *)self->mount abortAllClientSearchesFor:self->_ourID];
    [(LiveFSVolume *)self->mount invalidateFileNodesForConnection:self->_ourID];
    [(LiveFSVolume *)self->mount releaseConnectionAllocation:self->_ourID];
    self->_unint64_t ourID = 0;
  }
}

- (void)dealloc
{
  if (self->_ourID && self->mount) {
    [(LiveFSServiceConnection *)self scrubOurClientId];
  }
  v3.receiver = self;
  v3.super_class = (Class)LiveFSServiceConnection;
  [(LiveFSServiceConnection *)&v3 dealloc];
}

+ (id)newConnectionForMount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initForMount:v9 connection:v8 error:a5];

  return v10;
}

+ (id)newExportObjectForObject:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 conformsToProtocol:&unk_26EE25C60])
  {
    id v10 = v8;
    v11 = (void *)[a1 newConnectionForMount:v10 connection:v9 error:a5];
    v12 = v11;
    if (v11) {
      objc_msgSend(v10, "rememberConnection:forID:", v9, objc_msgSend(v11, "ourID"));
    }
  }
  else if (a5)
  {
    getNSErrorFromLiveFSErrno(22);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  mount = self->mount;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__LiveFSServiceConnection_close_keepingMode_requestID_reply___block_invoke;
  v15[3] = &unk_264DC7A68;
  id v16 = v10;
  id v17 = v11;
  v15[4] = self;
  id v13 = v10;
  id v14 = v11;
  [(LiveFSVolume *)mount close:v13 keepingMode:v8 requestID:a5 reply:v15];
}

void __61__LiveFSServiceConnection_close_keepingMode_requestID_reply___block_invoke(void *a1, int a2, void *a3, uint64_t a4, void *a5, uint64_t a6, int a7, int a8)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2 && a7)
  {
    if (a6 | a4 || ([*(id *)(a1[4] + 8) workingSetInterest] ? (BOOL v17 = a8 == 0) : (BOOL v17 = 1), !v17))
    {
      v18 = livefs_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = a1[5];
        int v24 = 136315650;
        v25 = "-[LiveFSServiceConnection close:keepingMode:requestID:reply:]_block_invoke";
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        __int16 v28 = 2048;
        uint64_t v29 = a6;
        _os_log_impl(&dword_23AB0B000, v18, OS_LOG_TYPE_DEFAULT, "%s: last close in file %@ interest 0x%0llx", (uint8_t *)&v24, 0x20u);
      }

      id v20 = *(id *)(a1[4] + 8);
      int v21 = [v20 hasPersistentFileIDs];
      if (a6) {
        [v20 updatedItem:a1[5] name:a1[5] interestedItem:a1[5] interestedClients:a6];
      }
      if (a4) {
        [v20 updatedName:v16 interestedItem:v15 interestedClients:a4];
      }
      if (a8 && [*(id *)(a1[4] + 8) workingSetInterest])
      {
        v22 = (void *)a1[5];
        if (v21)
        {
          objc_msgSend(v20, "updatedItem:name:interestedItem:interestedClients:", v22, &stru_26EE1CB58, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
        }
        else
        {
          id v23 = v22;
          objc_msgSend(v20, "volumeWideUpdatedName:interestedItem:interestedClients:", v23, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
        }
      }
    }
  }
}

- (id)sanitizedAttrsForNewObjectAttrs:(id)a3 forType:(unsigned int)a4
{
  id v5 = (id) [a3 mutableCopy];
  uint64_t v6 = [v5 mutableBytes];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 + 8);
  if ((v8 & 2) != 0)
  {
    if ((v8 & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    if (a4 == 2) {
      int v10 = 448;
    }
    else {
      int v10 = 384;
    }
    *(_DWORD *)(v6 + 28) = v10;
    v8 |= 2uLL;
    *(void *)(v6 + 8) = v8;
    if ((v8 & 8) != 0)
    {
LABEL_3:
      if ((v8 & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  *(_DWORD *)(v6 + 36) = getuid();
  uint64_t v8 = *(void *)(v7 + 8) | 8;
  *(void *)(v7 + 8) = v8;
  if ((v8 & 0x10) == 0)
  {
LABEL_4:
    *(_DWORD *)(v7 + 40) = getgid();
    uint64_t v8 = *(void *)(v7 + 8) | 0x10;
    *(void *)(v7 + 8) = v8;
  }
LABEL_5:
  if ((~(_WORD)v8 & 0xAC00) == 0)
  {
LABEL_6:
    id v9 = v5;
    goto LABEL_15;
  }
  unsigned long long v13 = 0uLL;
  if (!clock_gettime(_CLOCK_REALTIME, (timespec *)&v13))
  {
    uint64_t v12 = *(void *)(v7 + 8);
    if ((v12 & 0x400) != 0)
    {
      if ((v12 & 0x800) != 0) {
        goto LABEL_20;
      }
    }
    else
    {
      *(_OWORD *)(v7 + 80) = v13;
      v12 |= 0x400uLL;
      *(void *)(v7 + 8) = v12;
      if ((v12 & 0x800) != 0)
      {
LABEL_20:
        if ((v12 & 0x2000) != 0) {
          goto LABEL_21;
        }
        goto LABEL_25;
      }
    }
    *(_OWORD *)(v7 + 96) = v13;
    v12 |= 0x800uLL;
    *(void *)(v7 + 8) = v12;
    if ((v12 & 0x2000) != 0)
    {
LABEL_21:
      if ((v12 & 0x8000) != 0) {
        goto LABEL_6;
      }
LABEL_26:
      *(_OWORD *)(v7 + 160) = v13;
      *(void *)(v7 + 8) = v12 | 0x8000;
      goto LABEL_6;
    }
LABEL_25:
    *(_OWORD *)(v7 + 128) = v13;
    v12 |= 0x2000uLL;
    *(void *)(v7 + 8) = v12;
    if ((v12 & 0x8000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = v14;
  if (self->_ourID)
  {
    id v16 = [(LiveFSServiceConnection *)self sanitizedAttrsForNewObjectAttrs:a5 forType:1];
    mount = self->mount;
    unint64_t ourID = self->_ourID;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __69__LiveFSServiceConnection_createIn_named_attributes_requestID_reply___block_invoke;
    v19[3] = &unk_264DC7A90;
    id v23 = v15;
    id v20 = v13;
    int v21 = self;
    id v22 = v12;
    [(LiveFSVolume *)mount createIn:v22 named:v20 attributes:v16 andClient:ourID requestID:a6 reply:v19];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void))v14 + 2))(v14, 70, 0, 0, 0, 0);
  }
}

void __69__LiveFSServiceConnection_createIn_named_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v12 = a5;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  char v8 = [*(id *)(a1 + 32) hasPrefix:@"."];
  if (!a2 && (v8 & 1) == 0 && (a4 || [*(id *)(*(void *)(a1 + 40) + 8) workingSetInterest]))
  {
    id v9 = *(id *)(*(void *)(a1 + 40) + 8);
    int v10 = [v9 hasPersistentFileIDs];
    if (a4) {
      [v9 updatedName:*(void *)(a1 + 32) interestedItem:*(void *)(a1 + 48) interestedClients:a4];
    }
    if ([v9 workingSetInterest] && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", @".") & 1) == 0)
    {
      if (v10)
      {
        objc_msgSend(v9, "updatedItem:name:interestedItem:interestedClients:", v12, *(void *)(a1 + 32), @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v9, "workingSetInterest"));
      }
      else
      {
        id v11 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 32)];
        objc_msgSend(v9, "volumeWideUpdatedName:interestedItem:interestedClients:", v11, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v9, "workingSetInterest"));
      }
    }
  }
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)LIGetRootFileHandle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__LiveFSServiceConnection_LIGetRootFileHandle___block_invoke;
    v8[3] = &unk_264DC7AB8;
    id v9 = v4;
    [(LiveFSVolume *)mount rootFileHandleForClient:ourID reply:v8];
  }
  else
  {
    (*((void (**)(id, __CFString *))v4 + 2))(v4, &stru_26EE1CB58);
  }
}

uint64_t __47__LiveFSServiceConnection_LIGetRootFileHandle___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getRootFileHandleWithError:(id)a3
{
  unint64_t ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    id v7 = a3;
    -[LiveFSVolume rootFileHandleForClient:reply:](mount, "rootFileHandleForClient:reply:", ourID);
  }
  else
  {
    id v6 = a3;
    getNSErrorFromLiveFSErrno(57);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void))a3 + 2))(v6, 0);
  }
}

- (void)lookupIn:(id)a3 name:(id)a4 usingFlags:(unsigned int)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  if (self->_ourID)
  {
    mount = self->mount;
    -[LiveFSVolume lookupin:name:forClient:usingFlags:requestID:reply:](mount, "lookupin:name:forClient:usingFlags:requestID:reply:", a3, a4);
  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void, void))a7 + 2))(a7, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = v14;
  if (self->_ourID)
  {
    id v16 = [(LiveFSServiceConnection *)self sanitizedAttrsForNewObjectAttrs:a5 forType:2];
    mount = self->mount;
    unint64_t ourID = self->_ourID;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__LiveFSServiceConnection_makeDirectoryIn_named_attributes_requestID_reply___block_invoke;
    v19[3] = &unk_264DC7A90;
    id v23 = v15;
    id v20 = v13;
    int v21 = self;
    id v22 = v12;
    [(LiveFSVolume *)mount makeDirectoryIn:v22 named:v20 attributes:v16 andClient:ourID requestID:a6 reply:v19];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void, void))v14 + 2))(v14, 70, 0, 0, 0, 0, 0);
  }
}

void __76__LiveFSServiceConnection_makeDirectoryIn_named_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v12 = a5;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  char v8 = [*(id *)(a1 + 32) hasPrefix:@"."];
  if (!a2 && (v8 & 1) == 0 && (a4 || [*(id *)(*(void *)(a1 + 40) + 8) workingSetInterest]))
  {
    id v9 = *(id *)(*(void *)(a1 + 40) + 8);
    int v10 = [v9 hasPersistentFileIDs];
    if (a4) {
      [v9 updatedName:*(void *)(a1 + 32) interestedItem:*(void *)(a1 + 48) interestedClients:a4];
    }
    if ([v9 workingSetInterest] && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", @".") & 1) == 0)
    {
      if (v10)
      {
        objc_msgSend(v9, "updatedItem:name:interestedItem:interestedClients:", v12, *(void *)(a1 + 32), @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v9, "workingSetInterest"));
      }
      else
      {
        id v11 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 32)];
        objc_msgSend(v9, "volumeWideUpdatedName:interestedItem:interestedClients:", v11, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v9, "workingSetInterest"));
      }
    }
  }
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = v17;
  if (self->_ourID)
  {
    uint64_t v19 = [(LiveFSServiceConnection *)self sanitizedAttrsForNewObjectAttrs:a6 forType:3];
    mount = self->mount;
    unint64_t ourID = self->_ourID;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __83__LiveFSServiceConnection_makeSymLinkIn_named_contents_attributes_requestID_reply___block_invoke;
    v22[3] = &unk_264DC7A90;
    id v26 = v18;
    id v23 = v15;
    int v24 = self;
    id v25 = v14;
    [(LiveFSVolume *)mount makeSymLinkIn:v25 named:v23 contents:v16 attributes:v19 andClient:ourID requestID:a7 reply:v22];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void))v17 + 2))(v17, 70, 0, 0, 0, 0);
  }
}

void __83__LiveFSServiceConnection_makeSymLinkIn_named_contents_attributes_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  char v7 = [*(id *)(a1 + 32) hasPrefix:@"."];
  if (!a2 && (v7 & 1) == 0)
  {
    char v8 = *(void **)(*(void *)(a1 + 40) + 8);
    if (a4)
    {
      id v10 = v8;
      [v10 updatedName:*(void *)(a1 + 32) interestedItem:*(void *)(a1 + 48) interestedClients:a4];
      id v9 = v10;
    }
    else
    {
      if (![v8 workingSetInterest]) {
        return;
      }
      id v9 = *(id *)(*(void *)(a1 + 40) + 8);
    }
  }
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = v15;
  unint64_t ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__LiveFSServiceConnection_makeLinkOf_named_inDirectory_requestID_reply___block_invoke;
    v19[3] = &unk_264DC7AE0;
    id v24 = v15;
    id v20 = v13;
    int v21 = self;
    id v22 = v14;
    id v23 = v12;
    [(LiveFSVolume *)mount makeLinkOf:v23 named:v20 inDirectory:v22 andClient:ourID requestID:a6 reply:v19];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v15 + 2))(v15, 70, 0, 0, 0);
  }
}

void __72__LiveFSServiceConnection_makeLinkOf_named_inDirectory_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  char v10 = [*(id *)(a1 + 32) hasPrefix:@"."];
  if (!a2 && (v10 & 1) == 0 && (a6 | a4 || [*(id *)(*(void *)(a1 + 40) + 8) workingSetInterest]))
  {
    id v13 = *(id *)(*(void *)(a1 + 40) + 8);
    int v11 = [v13 hasPersistentFileIDs];
    if (a4) {
      [v13 updatedName:*(void *)(a1 + 32) interestedItem:*(void *)(a1 + 48) interestedClients:a4];
    }
    if (a6) {
      [v13 updatedItem:*(void *)(a1 + 56) name:*(void *)(a1 + 32) interestedItem:*(void *)(a1 + 56) interestedClients:a6];
    }
    if ([v13 workingSetInterest] && (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", @".") & 1) == 0)
    {
      if (v11)
      {
        objc_msgSend(v13, "updatedItem:name:interestedItem:interestedClients:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v13, "workingSetInterest"));
      }
      else
      {
        id v12 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 32)];
        objc_msgSend(v13, "volumeWideUpdatedName:interestedItem:interestedClients:", v12, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v13, "workingSetInterest"));
      }
    }
  }
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  uint64_t v19 = v18;
  if (self->_ourID)
  {
    id v20 = [(LiveFSServiceConnection *)self sanitizedAttrsForNewObjectAttrs:a6 forType:1];
    mount = self->mount;
    unint64_t ourID = self->_ourID;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __95__LiveFSServiceConnection_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_reply___block_invoke;
    v23[3] = &unk_264DC7A90;
    id v26 = v19;
    v23[4] = self;
    id v24 = v16;
    id v25 = v17;
    [(LiveFSVolume *)mount makeCloneOf:v15 named:v24 inDirectory:v25 attributes:v20 usingFlags:v10 andClient:ourID requestID:a8 reply:v23];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void))v18 + 2))(v18, 70, 0, 0, 0, 0);
  }
}

void __95__LiveFSServiceConnection_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v11 = a5;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!a2 && (a4 || [*(id *)(*(void *)(a1 + 32) + 8) workingSetInterest]))
  {
    id v8 = *(id *)(*(void *)(a1 + 32) + 8);
    int v9 = [v8 hasPersistentFileIDs];
    if (a4) {
      [v8 updatedName:*(void *)(a1 + 40) interestedItem:*(void *)(a1 + 48) interestedClients:a4];
    }
    if ([v8 workingSetInterest] && (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", @".") & 1) == 0)
    {
      if (v9)
      {
        objc_msgSend(v8, "updatedItem:name:interestedItem:interestedClients:", v11, *(void *)(a1 + 40), @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v8, "workingSetInterest"));
      }
      else
      {
        uint64_t v10 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 40)];
        objc_msgSend(v8, "volumeWideUpdatedName:interestedItem:interestedClients:", v10, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v8, "workingSetInterest"));
      }
    }
  }
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if ([FSKitVolumeMachPortForKernelMount isEqualToString:v11])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->ourConnection);
    uint64_t v10 = [WeakRetained valueForEntitlement:@"com.apple.private.LiveFS.setmachport"];

    if (v10 && ([v10 BOOLValue] & 1) != 0) {
      [(LiveFSVolume *)self->mount fetchVolumeMachPortLabeled:v11 forClient:self->_ourID requestID:a4 reply:v8];
    }
    else {
      v8[2](v8, 13, 0);
    }
  }
  else
  {
    v8[2](v8, 102, 0);
  }
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  unint64_t ourID = self->_ourID;
  if (ourID) {
    [(LiveFSVolume *)self->mount reclaim:a3 forClient:ourID requestID:a4 reply:a5];
  }
  else {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  mount = self->mount;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__LiveFSServiceConnection_removeItem_from_named_usingFlags_requestID_reply___block_invoke;
  v21[3] = &unk_264DC7B08;
  v21[4] = self;
  id v22 = v15;
  id v23 = v14;
  id v24 = v16;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  [(LiveFSVolume *)mount removeItem:a3 from:v18 named:v19 usingFlags:v10 requestID:a7 reply:v21];
}

void __76__LiveFSServiceConnection_removeItem_from_named_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v16 = a6;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!a2)
  {
    if (a5 | a4
      || ([*(id *)(*(void *)(a1 + 32) + 8) workingSetInterest] ? (BOOL v12 = a7 == 0) : (BOOL v12 = 1), !v12))
    {
      id v13 = *(id *)(*(void *)(a1 + 32) + 8);
      int v14 = [v13 hasPersistentFileIDs];
      if (a4) {
        [v13 deletedName:*(void *)(a1 + 40) item:v16 interestedItem:*(void *)(a1 + 48) how:0 interestedClients:a4];
      }
      if (a5) {
        [v13 deletedItem:v16 name:*(void *)(a1 + 40) interestedItem:v16 how:0 interestedClients:a5];
      }
      if ([v13 workingSetInterest]
        && ([*(id *)(a1 + 40) hasPrefix:@"."] & 1) == 0
        && (a7 & 1) == 0)
      {
        if (v14)
        {
          objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(void *)(a1 + 40), @"NSFileProviderWorkingSetContainerItemIdentifier", 0, objc_msgSend(v13, "workingSetInterest"));
        }
        else
        {
          id v15 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 40)];
          objc_msgSend(v13, "volumeWideDeletedName:interestedItem:interestedClients:", v15, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v13, "workingSetInterest"));
        }
      }
    }
  }
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  mount = self->mount;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __81__LiveFSServiceConnection_removeDirectory_from_named_usingFlags_requestID_reply___block_invoke;
  v21[3] = &unk_264DC7B08;
  v21[4] = self;
  id v22 = v15;
  id v23 = v14;
  id v24 = v16;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  [(LiveFSVolume *)mount removeDirectory:a3 from:v18 named:v19 usingFlags:v10 requestID:a7 reply:v21];
}

void __81__LiveFSServiceConnection_removeDirectory_from_named_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v16 = a6;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!a2)
  {
    if (a5 | a4
      || ([*(id *)(*(void *)(a1 + 32) + 8) workingSetInterest] ? (BOOL v12 = a7 == 0) : (BOOL v12 = 1), !v12))
    {
      id v13 = *(id *)(*(void *)(a1 + 32) + 8);
      int v14 = [v13 hasPersistentFileIDs];
      if (a4) {
        [v13 deletedName:*(void *)(a1 + 40) item:v16 interestedItem:*(void *)(a1 + 48) how:0 interestedClients:a4];
      }
      if (a5) {
        [v13 deletedItem:v16 name:*(void *)(a1 + 40) interestedItem:v16 how:0 interestedClients:a5];
      }
      if ([v13 workingSetInterest]
        && ([*(id *)(a1 + 40) hasPrefix:@"."] & 1) == 0
        && (a7 & 1) == 0)
      {
        if (v14)
        {
          objc_msgSend(v13, "deletedItem:name:interestedItem:how:interestedClients:", v16, *(void *)(a1 + 40), @"NSFileProviderWorkingSetContainerItemIdentifier", 0, objc_msgSend(v13, "workingSetInterest"));
        }
        else
        {
          id v15 = [*(id *)(a1 + 48) stringByAppendingPathComponent:*(void *)(a1 + 40)];
          objc_msgSend(v13, "volumeWideDeletedName:interestedItem:interestedClients:", v15, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v13, "workingSetInterest"));
        }
      }
    }
  }
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a11;
  int v20 = [v18 hasPrefix:@"."];
  int v21 = [v16 hasPrefix:@"."];
  mount = self->mount;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __105__LiveFSServiceConnection_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_reply___block_invoke;
  v29[3] = &unk_264DC7B30;
  if (v20) {
    int v23 = 2;
  }
  else {
    int v23 = 3;
  }
  if (!v21) {
    int v23 = v20;
  }
  v29[4] = self;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  int v35 = v23;
  unsigned int v36 = a9;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  id v28 = v19;
  [(LiveFSVolume *)mount renameItemIn:v27 named:v26 toDirectory:v25 newName:v24 usingFlags:a9 & 0xFFFF7FFF requestID:a10 reply:v29];
}

void __105__LiveFSServiceConnection_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_reply___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, char a9, uint64_t a10, void *a11, char a12)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v17 = a8;
  id v18 = a11;
  int v29 = *(_DWORD *)(a1 + 80);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  if (!a2)
  {
    uint64_t v19 = a6 | a4 | a7 | a10;
    if (v19) {
      goto LABEL_3;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 8) workingSetInterest])
    {
      char v24 = a9 ^ 1;
      if (*(_DWORD *)(a1 + 80) == 2) {
        char v24 = 0;
      }
      if ((v24 & 1) != 0 || (a12 & 1) == 0)
      {
LABEL_3:
        id v20 = *(id *)(*(void *)(a1 + 32) + 8);
        int v28 = [v20 hasPersistentFileIDs];
        [v20 itemRenamedIn:*(void *)(a1 + 40) named:*(void *)(a1 + 48) originalID:v17 intoDirectory:*(void *)(a1 + 56) newName:*(void *)(a1 + 64) atopItem:v18 interestedClients:v19];
        int v21 = livefs_std_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 48);
          uint64_t v23 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 136316674;
          id v31 = "-[LiveFSServiceConnection renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:reply:]_block_invoke";
          __int16 v32 = 2048;
          uint64_t v33 = a4;
          __int16 v34 = 2048;
          uint64_t v35 = a6;
          __int16 v36 = 2048;
          uint64_t v37 = a7;
          __int16 v38 = 2048;
          uint64_t v39 = a10;
          __int16 v40 = 2112;
          uint64_t v41 = v22;
          __int16 v42 = 2112;
          uint64_t v43 = v23;
          _os_log_impl(&dword_23AB0B000, v21, OS_LOG_TYPE_DEFAULT, "%s: fromDir %02llx toDir %02llx moved %02llx overwritten %02llx from Name %@ to name %@", buf, 0x48u);
        }

        if ([v20 workingSetInterest] && (a12 & 1) == 0)
        {
          if (v28)
          {
            objc_msgSend(v20, "deletedItem:name:interestedItem:how:interestedClients:", v18, *(void *)(a1 + 64), @"NSFileProviderWorkingSetContainerItemIdentifier", 0, objc_msgSend(v20, "workingSetInterest"));
          }
          else
          {
            id v25 = [*(id *)(a1 + 56) stringByAppendingPathComponent:*(void *)(a1 + 64)];
            objc_msgSend(v20, "volumeWideDeletedName:interestedItem:interestedClients:", v25, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
          }
        }
        if ((*(unsigned char *)(a1 + 85) & 0x80) != 0 && v29 == 1) {
          goto LABEL_29;
        }
        if (![v20 workingSetInterest]) {
          goto LABEL_29;
        }
        if (a9) {
          goto LABEL_29;
        }
        int v26 = *(_DWORD *)(a1 + 80);
        if (v26 == 2) {
          goto LABEL_29;
        }
        if (v26 == 1)
        {
          if (v28)
          {
            objc_msgSend(v20, "deletedItem:name:interestedItem:how:interestedClients:", v17, *(void *)(a1 + 48), @"NSFileProviderWorkingSetContainerItemIdentifier", 1, objc_msgSend(v20, "workingSetInterest"));
LABEL_29:

            goto LABEL_30;
          }
          id v27 = v17;
          objc_msgSend(v20, "volumeWideDeletedName:interestedItem:interestedClients:", v27, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
        }
        else
        {
          if (v28)
          {
            objc_msgSend(v20, "updatedItem:name:interestedItem:interestedClients:", v17, *(void *)(a1 + 64), @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
            goto LABEL_29;
          }
          id v27 = v17;
          objc_msgSend(v20, "volumeWideUpdatedName:interestedItem:interestedClients:", v27, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v20, "workingSetInterest"));
        }

        goto LABEL_29;
      }
    }
  }
LABEL_30:
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  mount = self->mount;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__LiveFSServiceConnection_setFileAttributesOf_to_requestID_reply___block_invoke;
  v15[3] = &unk_264DC7B58;
  id v16 = v10;
  id v17 = v11;
  v15[4] = self;
  id v13 = v10;
  id v14 = v11;
  [(LiveFSVolume *)mount setFileAttributesOf:v13 to:a4 requestID:a5 reply:v15];
}

void __66__LiveFSServiceConnection_setFileAttributesOf_to_requestID_reply___block_invoke(void *a1, int a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, int a8)
{
  id v21 = a4;
  id v14 = a6;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2)
  {
    if (a7 | a5 || (uint64_t v15 = [*(id *)(a1[4] + 8) workingSetInterest], a8 != 2) && v15)
    {
      id v16 = *(id *)(a1[4] + 8);
      int v17 = [v16 hasPersistentFileIDs];
      if (a7) {
        [v16 updatedItem:a1[5] name:a1[5] interestedItem:a1[5] interestedClients:a7];
      }
      if (a5) {
        [v16 updatedName:v14 interestedItem:v21 interestedClients:a5];
      }
      uint64_t v18 = [v16 workingSetInterest];
      if (a8 == 2 || !v18) {
        goto LABEL_19;
      }
      uint64_t v19 = (void *)a1[5];
      if (a8 == 1)
      {
        if (v17)
        {
          objc_msgSend(v16, "deletedItem:name:interestedItem:how:interestedClients:", v19, &stru_26EE1CB58, @"NSFileProviderWorkingSetContainerItemIdentifier", 1, objc_msgSend(v16, "workingSetInterest"));
LABEL_19:

          goto LABEL_20;
        }
        id v20 = v19;
        objc_msgSend(v16, "volumeWideDeletedName:interestedItem:interestedClients:", v20, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v16, "workingSetInterest"));
      }
      else
      {
        if (v17)
        {
          objc_msgSend(v16, "updatedItem:name:interestedItem:interestedClients:", v19, &stru_26EE1CB58, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v16, "workingSetInterest"));
          goto LABEL_19;
        }
        id v20 = v19;
        objc_msgSend(v16, "volumeWideUpdatedName:interestedItem:interestedClients:", v20, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v16, "workingSetInterest"));
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 sharedBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__3;
  int v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v15 = [v13 createDispatchData];
  id v16 = (void *)v23[5];
  void v23[5] = v15;

  uint64_t v17 = v23[5];
  if (v17)
  {
    mount = self->mount;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__LiveFSServiceConnection_writeTo_atOffset_sharedBuffer_requestID_reply___block_invoke;
    v19[3] = &unk_264DC7B80;
    id v21 = &v22;
    id v20 = v14;
    [(LiveFSVolume *)mount writeTo:v12 atOffset:a4 fromBuffer:v17 requestID:a6 reply:v19];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void))v14 + 2))(v14, 12, 0, 0);
  }
  _Block_object_dispose(&v22, 8);
}

void __73__LiveFSServiceConnection_writeTo_atOffset_sharedBuffer_requestID_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
  id v7 = a4;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a8;
  mount = self->mount;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__LiveFSServiceConnection_setXattrOf_named_value_how_requestID_reply___block_invoke;
  v19[3] = &unk_264DC7BA8;
  id v20 = v14;
  id v21 = v15;
  void v19[4] = self;
  id v17 = v14;
  id v18 = v15;
  [(LiveFSVolume *)mount setXattrOf:v17 named:a4 value:a5 how:v10 requestID:a7 reply:v19];
}

void __70__LiveFSServiceConnection_setXattrOf_named_value_how_requestID_reply___block_invoke(void *a1, int a2, void *a3, uint64_t a4, void *a5, uint64_t a6, int a7)
{
  id v20 = a3;
  id v13 = a5;
  (*(void (**)(void))(a1[6] + 16))();
  if (!a2)
  {
    if (a6 | a4 || (uint64_t v14 = [*(id *)(a1[4] + 8) workingSetInterest], a7 != 2) && v14)
    {
      id v15 = *(id *)(a1[4] + 8);
      int v16 = [v15 hasPersistentFileIDs];
      if (a6) {
        [v15 updatedItem:a1[5] name:a1[5] interestedItem:a1[5] interestedClients:a6];
      }
      if (a4) {
        [v15 updatedName:v13 interestedItem:v20 interestedClients:a4];
      }
      uint64_t v17 = [v15 workingSetInterest];
      if (a7 == 2 || !v17) {
        goto LABEL_19;
      }
      id v18 = (void *)a1[5];
      if (a7 == 1)
      {
        if (v16)
        {
          objc_msgSend(v15, "deletedItem:name:interestedItem:how:interestedClients:", v18, &stru_26EE1CB58, @"NSFileProviderWorkingSetContainerItemIdentifier", 1, objc_msgSend(v15, "workingSetInterest"));
LABEL_19:

          goto LABEL_20;
        }
        id v19 = v18;
        objc_msgSend(v15, "volumeWideDeletedName:interestedItem:interestedClients:", v19, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v15, "workingSetInterest"));
      }
      else
      {
        if (v16)
        {
          objc_msgSend(v15, "updatedItem:name:interestedItem:interestedClients:", v18, &stru_26EE1CB58, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v15, "workingSetInterest"));
          goto LABEL_19;
        }
        id v19 = v18;
        objc_msgSend(v15, "volumeWideUpdatedName:interestedItem:interestedClients:", v19, @"NSFileProviderWorkingSetContainerItemIdentifier", objc_msgSend(v15, "workingSetInterest"));
      }

      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 reply:(id)a11
{
  uint64_t v11 = *(void *)&a9;
  uint64_t v13 = *(void *)&a7;
  p_ourConnection = &self->ourConnection;
  id v19 = a11;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_ourConnection);
  id v24 = +[LiveFSVolumeSearchResultConnector newSearchConnector:v21 connection:WeakRetained maxData:v13 maxDelay:v11 initialCredits:a8];

  [(LiveFSVolume *)self->mount search:v22 token:v21 criteria:v20 returnProxy:v24 forClient:self->_ourID requestID:a10 reply:v19];
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = (void (**)(id, NSObject *))a6;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__3;
  __int16 v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  int v12 = [v10 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];
  int v13 = [v10 isEqualToString:@"NSFileProviderWorkingSetContainerItemIdentifier"];
  if ((v12 & v8) == 1)
  {
    uint64_t v14 = getNSErrorFromLiveFSErrno(22);
    v11[2](v11, v14);
LABEL_6:

    goto LABEL_16;
  }
  int v15 = v13;
  if ((v12 | v13 ^ 1) == 1)
  {
    int v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    setUpdateInterestQueue = self->setUpdateInterestQueue;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke;
    id v25 = &unk_264DC7BF8;
    int v26 = self;
    BOOL v31 = v8;
    id v27 = v10;
    int v29 = &v32;
    unint64_t v30 = a5;
    uint64_t v14 = v16;
    int v28 = v14;
    dispatch_async(setUpdateInterestQueue, &v22);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (v33[5])
    {
      ((void (*)(void (**)(id, NSObject *)))v11[2])(v11);

      goto LABEL_6;
    }
  }
  if ((v12 | v15) == 1)
  {
    id v18 = self->mount;
    objc_sync_enter(v18);
    mount = self->mount;
    if (v8)
    {
      unint64_t v20 = self->_ourID | [(LiveFSVolume *)self->mount workingSetInterest];
    }
    else
    {
      unint64_t ourID = self->_ourID;
      unint64_t v20 = [(LiveFSVolume *)self->mount workingSetInterest] & ~ourID;
    }
    -[LiveFSVolume setWorkingSetInterest:](mount, "setWorkingSetInterest:", v20, v22, v23, v24, v25, v26);
    objc_sync_exit(v18);
  }
  if (!v8) {
    [(LiveFSVolume *)self->mount itemUpdatesDone:v10 interestedClients:self->_ourID];
  }
  v11[2](v11, 0);
LABEL_16:
  _Block_object_dispose(&v32, 8);
}

void __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  id v4 = *(void **)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke_2;
  v9[3] = &unk_264DC7BD0;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v8;
  long long v10 = v8;
  [v4 setUpdateInterest:v2 interest:v3 forClient:v5 requestID:v6 reply:v9];
}

void __70__LiveFSServiceConnection_setUpdateInterest_interest_requestID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  if (self->_ourID) {
    [(LiveFSVolume *)self->mount verifyItemExistenceByIDs:a3 requestID:a4 reply:a5];
  }
  else {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 70, 0);
  }
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  if (self->_ourID) {
    [(LiveFSVolume *)self->mount parentsAndAttributesForItemsByID:a3 requestID:a4 reply:a5];
  }
  else {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 70, 0);
  }
}

- (void)pathsAndAttributesForItemsByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = v9;
  if (self->_ourID)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    int v15 = __75__LiveFSServiceConnection_pathsAndAttributesForItemsByIDs_requestID_reply___block_invoke;
    int v16 = &unk_264DC7C20;
    id v18 = v9;
    id v11 = v8;
    id v17 = v11;
    int v12 = _Block_copy(&v13);
    -[LiveFSVolume parentsAndAttributesForItemsByID:requestID:reply:](self->mount, "parentsAndAttributesForItemsByID:requestID:reply:", v11, a4, v12, v13, v14, v15, v16);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 70, 0);
  }
}

void __75__LiveFSServiceConnection_pathsAndAttributesForItemsByIDs_requestID_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a2)
  {
    uint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = [*(id *)(a1 + 32) bytes];
    uint64_t v30 = a1;
    unint64_t v7 = [*(id *)(a1 + 32) length];
    if ((v7 & 0x7FFFFFFF8) == 0)
    {
LABEL_27:
      (*(void (**)(void))(*(void *)(v30 + 40) + 16))();

      goto LABEL_28;
    }
    uint64_t v8 = 0;
    uint64_t v9 = (v7 >> 3);
    unint64_t v10 = 0x263F08000uLL;
    uint64_t v33 = v9;
    uint64_t v34 = v6;
    __int16 v36 = v5;
    while (1)
    {
      id v11 = [*(id *)(v10 + 2584) numberWithUnsignedLongLong:*(void *)(v6 + 8 * v8)];
      int v12 = [v5 objectForKeyedSubscript:v11];
      if (v12) {
        break;
      }
LABEL_26:

      if (++v8 == v9) {
        goto LABEL_27;
      }
    }
    id v13 = v12;
    uint64_t v14 = [v13 objectForKeyedSubscript:@"attributes"];
    int v15 = v14;
    if (!v14)
    {
      uint64_t v22 = v13;
LABEL_25:

      goto LABEL_26;
    }
    id v16 = v14;
    uint64_t v17 = [v16 bytes];
    uint64_t v35 = v15;
    if (*(void *)(v17 + 72) == *(void *)(v17 + 64))
    {
      LOBYTE(v37[0]) = 0;
      id v18 = v37;
      id v19 = v13;
LABEL_9:
      id v20 = [NSString stringWithUTF8String:v18];
      id v21 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v20, @"path", v16, @"attributes", 0);
      [v32 setObject:v21 forKeyedSubscript:v11];
    }
    else
    {
      uint64_t v23 = [v13 objectForKeyedSubscript:@"name"];
      if (!v23)
      {
        uint64_t v22 = 0;
        int v29 = v13;
LABEL_24:

        id v13 = v29;
        int v15 = v35;
        goto LABEL_25;
      }
      id v31 = v16;
      char v24 = 0;
      id v25 = &v38;
      id v19 = v13;
      while (1)
      {
        id v20 = v23;
        int v26 = (const char *)[v20 UTF8String];
        size_t v27 = strlen(v26);
        if (!v27 || (id v18 = (uint64_t *)((char *)v25 + ~v27), v18 < v37))
        {
          id v21 = v13;
          id v13 = 0;
          id v5 = v36;
          goto LABEL_23;
        }
        memcpy((char *)v25 + ~v27, v26, v27);
        *((unsigned char *)v25 - 1) = v24;
        uint64_t v28 = [v19 objectForKeyedSubscript:@"parent"];
        if (!v28)
        {

          id v5 = v36;
          id v16 = v31;
          goto LABEL_9;
        }
        id v21 = (void *)v28;
        id v5 = v36;
        int v29 = [v36 objectForKeyedSubscript:v28];

        if (!v29) {
          break;
        }

        uint64_t v23 = [v29 objectForKeyedSubscript:@"name"];
        char v24 = 47;
        id v25 = v18;
        id v19 = v29;
        if (!v23)
        {
          uint64_t v22 = 0;
          id v5 = v36;
          uint64_t v9 = v33;
          uint64_t v6 = v34;
          unint64_t v10 = 0x263F08000;
          goto LABEL_24;
        }
      }

      id v13 = 0;
      id v19 = 0;
    }
LABEL_23:
    uint64_t v22 = v13;

    id v13 = v20;
    int v29 = v19;
    uint64_t v9 = v33;
    uint64_t v6 = v34;
    unint64_t v10 = 0x263F08000;
    goto LABEL_24;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:
}

- (void)LIGetAttr:(id)a3 reply:(id)a4
{
}

- (void)LIGetFsAttr:(id)a3 name:(id)a4 reply:(id)a5
{
}

- (void)LIGetParentsAndAttributesForFileIDs:(id)a3 reply:(id)a4
{
}

- (void)LILookup:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  unint64_t ourID = self->_ourID;
  if (ourID)
  {
    mount = self->mount;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__LiveFSServiceConnection_LILookup_name_reply___block_invoke;
    v12[3] = &unk_264DC7C48;
    id v13 = v8;
    [(LiveFSVolume *)mount lookupin:a3 name:a4 forClient:ourID usingFlags:0 requestID:-1 reply:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t, void, void, void, void, void, void))v8 + 2))(v8, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0);
  }
}

uint64_t __47__LiveFSServiceConnection_LILookup_name_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)LISearch:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 reply:(id)a10
{
}

- (void)LISearchAbort:(id)a3 reply:(id)a4
{
}

- (unint64_t)ourID
{
  return self->_ourID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->setUpdateInterestQueue, 0);
  objc_destroyWeak((id *)&self->ourConnection);

  objc_storeStrong((id *)&self->mount, 0);
}

@end