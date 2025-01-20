@interface FSVolume
+ (id)extentPackerForBuffer:(void *)a3 bufLen:(unint64_t)a4 extentCount:(unsigned int *)a5;
+ (id)newDirEntryPacker:(void *)a3 bufLen:(unint64_t)a4 bytesPacked:(unint64_t *)a5 withAttr:(BOOL)a6;
+ (id)volumeIdentifierDescription:(id)a3;
- (BOOL)wasTerminated;
- (FSFileName)name;
- (FSVolume)initWithVolumeID:(id)a3 volumeName:(id)a4;
- (FSVolumeIdentifier)volumeID;
- (OS_dispatch_queue)globalWorkQueue;
- (OS_dispatch_queue)renameWorkQueue;
- (id)queueForItem:(id)a3;
- (int64_t)state;
- (void)dealloc;
- (void)setGlobalWorkQueue:(id)a3;
- (void)setName:(id)a3;
- (void)setRenameWorkQueue:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setVolumeID:(id)a3;
- (void)setWasTerminated:(BOOL)a3;
@end

@implementation FSVolume

- (FSVolume)initWithVolumeID:(id)a3 volumeName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSVolume;
  v9 = [(FSVolume *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_volumeID, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    uint64_t v11 = dispatch_get_global_queue(2, 0);
    globalWorkQueue = v10->_globalWorkQueue;
    v10->_globalWorkQueue = (OS_dispatch_queue *)v11;
  }
  return v10;
}

- (void)dealloc
{
  renameWorkQueue = self->_renameWorkQueue;
  self->_renameWorkQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)FSVolume;
  [(FSVolume *)&v4 dealloc];
}

- (OS_dispatch_queue)renameWorkQueue
{
  v2 = self;
  objc_sync_enter(v2);
  renameWorkQueue = v2->_renameWorkQueue;
  if (!renameWorkQueue)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.fskit.rename.queue", 0);
    v5 = v2->_renameWorkQueue;
    v2->_renameWorkQueue = (OS_dispatch_queue *)v4;

    renameWorkQueue = v2->_renameWorkQueue;
  }
  v6 = renameWorkQueue;
  objc_sync_exit(v2);

  return v6;
}

- (void)setRenameWorkQueue:(id)a3
{
  id v7 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_renameWorkQueue;
  objc_storeStrong((id *)&v5->_renameWorkQueue, a3);
  if (v6) {

  }
  objc_sync_exit(v5);
}

- (FSVolumeIdentifier)volumeID
{
  return (FSVolumeIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVolumeID:(id)a3
{
}

- (FSFileName)name
{
  return (FSFileName *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)wasTerminated
{
  return self->_wasTerminated;
}

- (void)setWasTerminated:(BOOL)a3
{
  self->_wasTerminated = a3;
}

- (OS_dispatch_queue)globalWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGlobalWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalWorkQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
  objc_storeStrong((id *)&self->_renameWorkQueue, 0);
}

- (id)queueForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 queue];
  }
  else {
  v5 = [(FSVolume *)self globalWorkQueue];
  }

  return v5;
}

+ (id)newDirEntryPacker:(void *)a3 bufLen:(unint64_t)a4 bytesPacked:(unint64_t *)a5 withAttr:(BOOL)a6
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  BOOL v12 = a6;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FSVolume_Project__newDirEntryPacker_bufLen_bytesPacked_withAttr___block_invoke;
  aBlock[3] = &unk_26530B588;
  aBlock[4] = v11;
  aBlock[5] = v13;
  aBlock[6] = v10;
  aBlock[7] = v15;
  aBlock[8] = v14;
  v6 = _Block_copy(aBlock);
  id v7 = _Block_copy(v6);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  return v7;
}

uint64_t __67__FSVolume_Project__newDirEntryPacker_bufLen_bytesPacked_withAttr___block_invoke(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v12 = a2;
  id v13 = a6;
  objc_super v14 = [v12 data];
  size_t v15 = [v14 length];

  if (!v15)
  {
LABEL_5:
    if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
    {
      if (!v13)
      {
LABEL_14:
        uint64_t v22 = 0;
        goto LABEL_34;
      }
      uint64_t v19 = (v15 + 208) & 0xFFFFFFF8;
      uint64_t v20 = **(void **)(*(void *)(a1[7] + 8) + 24);
      if ((unint64_t)(v20 + v19) <= *(void *)(*(void *)(a1[8] + 8) + 24))
      {
        uint64_t v25 = *(void *)(*(void *)(a1[6] + 8) + 24) + v20;
        [v13 getLIAttributes:v25 + 16];
        id v26 = [v12 data];
        memcpy((void *)(v25 + 200), (const void *)[v26 bytes], v15);

        uint64_t v22 = 0;
        *(unsigned char *)(v25 + 200 + v15) = 0;
        *(_WORD *)(v25 + 10) = 200;
        *(_WORD *)(v25 + 12) = v15;
        if (a7) {
          __int16 v27 = 0;
        }
        else {
          __int16 v27 = (v15 + 208) & 0xFFF8;
        }
        *(_WORD *)(v25 + 8) = v27;
        if (a7) {
          uint64_t v28 = -1;
        }
        else {
          uint64_t v28 = a5;
        }
        *(void *)uint64_t v25 = v28;
        v29 = *(void **)(*(void *)(a1[7] + 8) + 24);
        *v29 += v19;
        *(void *)(*(void *)(a1[5] + 8) + 24) = v25;
        goto LABEL_34;
      }
      *(_WORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 8) = 0;
    }
    else
    {
      unint64_t v23 = (v15 + 29) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v24 = **(void **)(*(void *)(a1[7] + 8) + 24);
      if (v24 + v23 <= *(void *)(*(void *)(a1[8] + 8) + 24))
      {
        uint64_t v36 = a5;
        uint64_t v30 = *(void *)(*(void *)(a1[6] + 8) + 24) + v24;
        id v31 = [v12 data];
        memcpy((void *)(v30 + 21), (const void *)[v31 bytes], v15);

        uint64_t v22 = 0;
        *(unsigned char *)(v30 + 21 + v15) = 0;
        *(_WORD *)(v30 + 18) = v15;
        *(unsigned char *)(v30 + 20) = a3;
        if (a7) {
          __int16 v32 = 0;
        }
        else {
          __int16 v32 = (v15 + 29) & 0xFFF8;
        }
        *(_WORD *)(v30 + 16) = v32;
        uint64_t v33 = v36;
        if (a7) {
          uint64_t v33 = -1;
        }
        *(void *)uint64_t v30 = a4;
        *(void *)(v30 + 8) = v33;
        v34 = *(void **)(*(void *)(a1[7] + 8) + 24);
        *v34 += v23;
        *(void *)(*(void *)(a1[5] + 8) + 24) = v30;
        goto LABEL_34;
      }
      *(_WORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 16) = 0;
    }
    uint64_t v22 = 1;
    goto LABEL_34;
  }
  uint64_t v16 = 0;
  while (1)
  {
    id v17 = [v12 data];
    int v18 = *(unsigned __int8 *)([v17 bytes] + v16);

    if (v18 == 47) {
      break;
    }
    if (v15 == ++v16) {
      goto LABEL_5;
    }
  }
  if (!a7) {
    goto LABEL_14;
  }
  uint64_t v21 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if (!v21) {
      uint64_t v21 = *(void *)(*(void *)(a1[6] + 8) + 24) + **(void **)(*(void *)(a1[7] + 8) + 24);
    }
    uint64_t v22 = 0;
    *(_WORD *)(v21 + 8) = 0;
    *(void *)uint64_t v21 = -1;
  }
  else
  {
    if (!v21) {
      uint64_t v21 = *(void *)(*(void *)(a1[6] + 8) + 24) + **(void **)(*(void *)(a1[7] + 8) + 24);
    }
    uint64_t v22 = 0;
    *(_WORD *)(v21 + 16) = 0;
    *(void *)(v21 + 8) = -1;
  }
LABEL_34:

  return v22;
}

+ (id)extentPackerForBuffer:(void *)a3 bufLen:(unint64_t)a4 extentCount:(unsigned int *)a5
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = a5;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__FSVolume_Project__extentPackerForBuffer_bufLen_extentCount___block_invoke;
  v8[3] = &unk_26530B5B0;
  v8[4] = v10;
  v8[5] = v9;
  v8[6] = v12;
  v8[7] = a3;
  v5 = _Block_copy(v8);
  v6 = _Block_copy(v5);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  return v6;
}

BOOL __62__FSVolume_Project__extentPackerForBuffer_bufLen_extentCount___block_invoke(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  unint64_t v6 = *(unsigned int *)(*(void *)(a1[4] + 8) + 24) + 24;
  unint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (v6 <= v7)
  {
    uint64_t v13 = a1[7] + 24 * **(unsigned int **)(*(void *)(a1[6] + 8) + 24);
    uint64_t v14 = [a2 fileDescriptor];
    if (a3) {
      int v15 = 0x2000000;
    }
    else {
      int v15 = 0x1000000;
    }
    *(_DWORD *)uint64_t v13 = v15 & 0xFF000000 | v14 & 0xFFFFFF;
    *(_DWORD *)(v13 + 4) = a6;
    *(void *)(v13 + 8) = a5;
    *(void *)(v13 + 16) = a4;
    uint64_t v16 = *(_DWORD **)(*(void *)(a1[6] + 8) + 24);
    ++*v16;
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) += 24;
  }
  return v6 > v7;
}

+ (id)volumeIdentifierDescription:(id)a3
{
  return (id)[a3 debugDescription];
}

@end