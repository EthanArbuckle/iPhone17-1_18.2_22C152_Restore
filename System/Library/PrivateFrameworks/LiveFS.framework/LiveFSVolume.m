@interface LiveFSVolume
- (BOOL)hasPersistentFileIDs;
- (BOOL)renameChangesFileID;
- (LiveFSVolume)init;
- (unint64_t)newConnectionIDOrError:(id *)a3;
- (unint64_t)workingSetInterest;
- (void)LISMPUpdateItem:(id)a3 nameOrPath:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6 op:(int)a7;
- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)deletedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7;
- (void)deletedName:(id)a3 item:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7;
- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8;
- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)historyResetItem:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5;
- (void)historyResetName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5;
- (void)invalidateAllConnections;
- (void)invalidateFileNodesForConnection:(unint64_t)a3;
- (void)itemRenamedIn:(id)a3 named:(id)a4 originalID:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8 interestedClients:(unint64_t)a9;
- (void)itemUpdatesDone:(id)a3 interestedClients:(unint64_t)a4;
- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10;
- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)releaseConnectionAllocation:(unint64_t)a3;
- (void)rememberConnection:(id)a3 forID:(unint64_t)a4;
- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4;
- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9;
- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)setWorkingSetInterest:(unint64_t)a3;
- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8;
- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6;
- (void)updatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5;
- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5;
- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5;
- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5;
- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6;
@end

@implementation LiveFSVolume

- (LiveFSVolume)init
{
  v7.receiver = self;
  v7.super_class = (Class)LiveFSVolume;
  v2 = [(LiveFSVolume *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    currentConnections = v2->_currentConnections;
    v2->_currentConnections = (NSMapTable *)v3;

    if (!v2->_currentConnections)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v2->validConnections = 0;
    v2->connectionCount = 0;
    v2->_workingSetInterest = 0;
  }
  v5 = v2;
LABEL_6:

  return v5;
}

- (unint64_t)newConnectionIDOrError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  int connectionCount = v4->connectionCount;
  if (connectionCount < 64)
  {
    uint64_t v7 = 0;
    v4->int connectionCount = connectionCount + 1;
    unint64_t validConnections = v4->validConnections;
    do
    {
      unint64_t v6 = 1 << v7;
      if ((validConnections & (1 << v7)) == 0) {
        break;
      }
    }
    while (v7++ != 63);
    v4->unint64_t validConnections = validConnections | v6;
  }
  else if (a3)
  {
    getNSErrorFromLiveFSErrno(24);
    unint64_t v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v6 = 0;
  }
  objc_sync_exit(v4);

  return v6;
}

- (void)releaseConnectionAllocation:(unint64_t)a3
{
  if ((a3 & (a3 - 1)) != 0) {
    -[LiveFSVolume releaseConnectionAllocation:]();
  }
  if ((self->validConnections & a3) == 0) {
    -[LiveFSVolume releaseConnectionAllocation:]();
  }
  if (self->connectionCount <= 0) {
    -[LiveFSVolume releaseConnectionAllocation:]();
  }
  obj = self;
  objc_sync_enter(obj);
  self->validConnections &= ~a3;
  currentConnections = obj->_currentConnections;
  unint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMapTable *)currentConnections removeObjectForKey:v6];

  --self->connectionCount;
  objc_sync_exit(obj);
}

- (void)invalidateFileNodesForConnection:(unint64_t)a3
{
}

- (void)invalidateAllConnections
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(NSMapTable *)obj->_currentConnections dictionaryRepresentation];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2];

  objc_sync_exit(obj);
}

uint64_t __40__LiveFSVolume_invalidateAllConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)rememberConnection:(id)a3 forID:(unint64_t)a4
{
  id v9 = a3;
  unint64_t v6 = self;
  objc_sync_enter(v6);
  currentConnections = v6->_currentConnections;
  v8 = [NSNumber numberWithUnsignedLongLong:a4];
  [(NSMapTable *)currentConnections setObject:v9 forKey:v8];

  objc_sync_exit(v6);
}

- (void)LISMPUpdateItem:(id)a3 nameOrPath:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6 op:(int)a7
{
  id v22 = a3;
  id v23 = a4;
  id v25 = a5;
  v12 = self;
  objc_sync_enter(v12);
  int v13 = 0;
  int v14 = 0;
  v15 = 0;
  v16 = 0;
  int v24 = a7;
  while (v14 < v12->connectionCount)
  {
    uint64_t v17 = 1 << v13;
    if ((v12->validConnections & v17) != 0) {
      ++v14;
    }
    if ((v17 & a6) != 0)
    {
      currentConnections = v12->_currentConnections;
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      v20 = [(NSMapTable *)currentConnections objectForKey:v19];

      if (v20)
      {
        v21 = [v20 remoteObjectProxy];

        if (v21)
        {
          switch(v24)
          {
            case 0:
              [v21 updatedItem:v22 name:v23 interestedItem:v25];
              break;
            case 1:
              [v21 deletedItem:v22 name:v23 how:0 interestedItem:v25];
              break;
            case 2:
              [v21 updatedName:v23 interestedItem:v25];
              break;
            case 3:
              [v21 deletedName:v23 item:v22 how:0 interestedItem:v25];
              break;
            case 4:
              [v21 volumeWideUpdatedName:v23 interestedItem:v25];
              break;
            case 5:
              [v21 volumeWideDeletedName:v23 interestedItem:v25];
              break;
            case 6:
              [v21 historyResetItem:v22 interestedItem:v25];
              break;
            case 7:
              [v21 historyResetName:v23 interestedItem:v25];
              break;
            case 8:
              [v21 updatesDoneFor:v25];
              break;
            default:
              goto LABEL_12;
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
      v20 = v16;
    }
    v21 = v15;
LABEL_12:
    ++v13;
    v15 = v21;
    v16 = v20;
    if (v13 == 64) {
      goto LABEL_23;
    }
  }
  v20 = v16;
  v21 = v15;
LABEL_23:
  objc_sync_exit(v12);
}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6
{
}

- (void)deletedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7
{
}

- (void)updatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
}

- (void)deletedName:(id)a3 item:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7
{
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
}

- (void)itemUpdatesDone:(id)a3 interestedClients:(unint64_t)a4
{
}

- (void)itemRenamedIn:(id)a3 named:(id)a4 originalID:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8 interestedClients:(unint64_t)a9
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  v15 = self;
  objc_sync_enter(v15);
  int v16 = 0;
  int v17 = 0;
  v18 = 0;
  v19 = 0;
  while (v17 < v15->connectionCount)
  {
    uint64_t v20 = 1 << v16;
    if ((v15->validConnections & v20) != 0) {
      ++v17;
    }
    if ((v20 & a9) != 0)
    {
      currentConnections = v15->_currentConnections;
      id v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      id v23 = [(NSMapTable *)currentConnections objectForKey:v22];

      if (v23)
      {
        int v24 = [v23 remoteObjectProxy];

        if (v24) {
          [v24 renamedItem:v30 named:v29 fromDirectory:v28 intoDirectory:v27 newName:v26 atopItem:v25];
        }
        goto LABEL_11;
      }
    }
    else
    {
      id v23 = v19;
    }
    int v24 = v18;
LABEL_11:
    ++v16;
    v18 = v24;
    v19 = v23;
    if (v16 == 64) {
      goto LABEL_14;
    }
  }
  id v23 = v19;
  int v24 = v18;
LABEL_14:
  objc_sync_exit(v15);
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4
{
  id v5 = a4;
  getNSErrorFromLiveFSErrno(45);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10
{
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  char v10 = 0;
  char v9 = 0;
  (*((void (**)(id, uint64_t, void, void, void, void, void, void, char, void, void, char, void))a9
   + 2))(a9, 45, 0, 0, 0, 0, 0, 0, v9, 0, 0, v10, 0);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a7;
  id v9 = (id)objc_opt_new();
  (*((void (**)(id, uint64_t, id, void))a7 + 2))(v8, 45, v9, 0);
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8 = a7;
  getNSErrorFromLiveFSErrno(45);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);
}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
}

- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
}

- (unint64_t)workingSetInterest
{
  return self->_workingSetInterest;
}

- (void)setWorkingSetInterest:(unint64_t)a3
{
  self->_workingSetInterest = a3;
}

- (BOOL)renameChangesFileID
{
  return self->_renameChangesFileID;
}

- (BOOL)hasPersistentFileIDs
{
  return self->_hasPersistentFileIDs;
}

- (void).cxx_destruct
{
}

- (void)releaseConnectionAllocation:.cold.1()
{
  __assert_rtn("-[LiveFSVolume releaseConnectionAllocation:]", "LiveFSVolume.m", 63, "(client & (client - 1)) == 0");
}

- (void)releaseConnectionAllocation:.cold.2()
{
}

- (void)releaseConnectionAllocation:.cold.3()
{
}

@end