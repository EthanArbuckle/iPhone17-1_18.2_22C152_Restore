@interface LiveFSAppleDouble
- (BOOL)containerFileExists;
- (LiveFSAppleDouble)initWithManager:(id)a3 baseFileHandle:(id)a4 name:(id)a5 andDirectoryHandle:(id)a6 andPurpose:(int)a7;
- (LiveFSAppleDoubleManager)manager;
- (NSString)baseFileHandle;
- (NSString)fileHandle;
- (NSString)fileName;
- (NSString)parentDirHandle;
- (OS_dispatch_semaphore)syncSem;
- (id)allXattrNamesAndPosixError:(int *)a3;
- (id)description;
- (id)valueForXattrNamed:(id)a3 posixError:(int *)a4;
- (int)ADFileErr;
- (int)closeFile;
- (int)createFile;
- (int)linkFileToDirectory:(id)a3 andName:(id)a4;
- (int)loadADHeader;
- (int)lookupFile;
- (int)openFile;
- (int)purpose;
- (int)removeFile;
- (int)removeXattrNamed:(id)a3;
- (int)renameFileToDirectory:(id)a3 andName:(id)a4;
- (int)setValue:(id)a3 forXattrNamed:(id)a4 how:(int)a5;
- (int)writeXattrInfo;
- (void)createFile;
- (void)dealloc;
- (void)initEmptyResourceFork:(rsrcfork_header *)a3;
- (void)loadADHeader;
- (void)loadAttrHeader;
- (void)openFile;
- (void)reclaimFile;
- (void)removeFile;
- (void)setBaseFileHandle:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setFileName:(id)a3;
- (void)setManager:(id)a3;
- (void)setParentDirHandle:(id)a3;
- (void)setSyncSem:(id)a3;
- (void)shiftDataDownAtOffset:(unsigned int)a3 lengh:(unsigned int)a4 howMuch:(unint64_t)a5;
- (void)shiftDataUp:(int64_t)a3 length:(unint64_t)a4 howMuch:(unint64_t)a5;
- (void)swapAttrHeader:(attr_header *)a3;
- (void)swapFileHeader:(apple_double_header *)a3;
@end

@implementation LiveFSAppleDouble

- (LiveFSAppleDouble)initWithManager:(id)a3 baseFileHandle:(id)a4 name:(id)a5 andDirectoryHandle:(id)a6 andPurpose:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)LiveFSAppleDouble;
  v16 = [(LiveFSAppleDouble *)&v22 init];
  v17 = v16;
  if (v16)
  {
    [(LiveFSAppleDouble *)v16 setManager:v12];
    v18 = [v12 AppleDoubleNameForFileNamed:v14];
    [(LiveFSAppleDouble *)v17 setFileName:v18];

    [(LiveFSAppleDouble *)v17 setParentDirHandle:v15];
    [(LiveFSAppleDouble *)v17 setFileHandle:0];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    [(LiveFSAppleDouble *)v17 setSyncSem:v19];

    [(LiveFSAppleDouble *)v17 setBaseFileHandle:v13];
    v17->_purpose = a7;
    if (![(LiveFSAppleDouble *)v17 openFile])
    {
      int v20 = [(LiveFSAppleDouble *)v17 loadADHeader];
      v17->_ADFileErr = v20;
      if (v20) {
        v17->_ADFileOK = 0;
      }
      [(LiveFSAppleDouble *)v17 closeFile];
    }
  }

  return v17;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  v1 = [v0 fileName];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_23AB0B000, v2, v3, "AD: start dealoc on %s for %@", v4, v5, v6, v7, 2u);
}

- (void)reclaimFile
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 fileHandle];
  uint64_t v5 = [a1 fileName];
  int v6 = 138413059;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = "-[LiveFSAppleDouble reclaimFile]";
  __int16 v10 = 2114;
  v11 = v4;
  __int16 v12 = 2113;
  id v13 = v5;
  _os_log_debug_impl(&dword_23AB0B000, a2, OS_LOG_TYPE_DEBUG, "AD[%@]:%s:start:%{public}@[%{private}@]", (uint8_t *)&v6, 0x2Au);
}

void __32__LiveFSAppleDouble_reclaimFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [*(id *)(a1 + 32) baseFileHandle];
  [v2 releaseForBaseFile:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(LiveFSAppleDouble *)self baseFileHandle];
  uint64_t v5 = [(LiveFSAppleDouble *)self fileName];
  int v6 = [(LiveFSAppleDouble *)self fileHandle];
  uint64_t v7 = [v3 stringWithFormat:@"<LIFSAD:%p>: [[%@]:[%@][%@]]: ok:%d, err:%d, open:%d, p:%d, ro:%d, emptyfi:%d, wcf:%d", self, v4, v5, v6, self->_ADFileOK, self->_ADFileErr, self->_ADFileOpen, self->_purpose, self->_readonly, self->_emptyfinderinfo, self->_weCreatedFile];

  return v7;
}

- (BOOL)containerFileExists
{
  return !self->_lookupFailed;
}

- (int)lookupFile
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  uint64_t v3 = [(LiveFSAppleDouble *)self fileHandle];

  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v5 = [(LiveFSAppleDouble *)self manager];
    int v6 = [v5 queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__LiveFSAppleDouble_lookupFile__block_invoke;
    v8[3] = &unk_264DC7E28;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v6, v8);

    int v4 = *((_DWORD *)v10 + 6);
    self->_lookupFailed = v4 != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

intptr_t __31__LiveFSAppleDouble_lookupFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) parentDirHandle];
  uint64_t v5 = [*(id *)(a1 + 32) fileName];
  int v6 = [*(id *)(a1 + 32) manager];
  uint64_t v7 = [v6 clientID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__LiveFSAppleDouble_lookupFile__block_invoke_2;
  v9[3] = &unk_264DC7D10;
  long long v10 = *(_OWORD *)(a1 + 32);
  [v3 lookupin:v4 name:v5 forClient:v7 usingFlags:0 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_lookupFile__block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) setFileHandle:a4];
  }
  uint64_t v5 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v5);
}

- (int)createFile
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0xD810000000;
  v18 = &unk_23AB2F9C6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
  uint64_t v3 = [(LiveFSAppleDouble *)self fileHandle];
  if (v3)
  {

LABEL_3:
    int v4 = 0;
    goto LABEL_4;
  }
  if (![(LiveFSAppleDouble *)self lookupFile]) {
    goto LABEL_3;
  }
  int v6 = [(LiveFSAppleDouble *)self manager];
  uint64_t v7 = [v6 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__LiveFSAppleDouble_createFile__block_invoke;
  block[3] = &unk_264DC7E78;
  block[4] = self;
  block[5] = &v31;
  block[6] = &v15;
  dispatch_sync(v7, block);

  if (!*((_DWORD *)v32 + 6))
  {
    uint64_t v9 = v16;
    if ((v16[5] & 0x100) != 0) {
      unint64_t v10 = v16[12];
    }
    else {
      unint64_t v10 = 0;
    }
    v16[5] &= 0x1AuLL;
    *((_DWORD *)v9 + 15) &= 0xFFFu;
    uint64_t v11 = [(LiveFSAppleDouble *)self manager];
    int v12 = [v11 queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __31__LiveFSAppleDouble_createFile__block_invoke_74;
    v13[3] = &unk_264DC7E78;
    v13[4] = self;
    v13[5] = &v15;
    v13[6] = &v31;
    dispatch_sync(v12, v13);

    int v4 = *((_DWORD *)v32 + 6);
    if (v4)
    {
      if (v4 == 17)
      {
        int v4 = [(LiveFSAppleDouble *)self lookupFile];
        goto LABEL_4;
      }
    }
    else
    {
      self->_weCreatedFile = 1;
      self->_baseFileID = v10;
      self->_lookupFailed = 0;
    }
    self->_weCreatedFile = v4 == 0;
    goto LABEL_4;
  }
  __int16 v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[LiveFSAppleDouble createFile]();
  }

  int v4 = *((_DWORD *)v32 + 6);
LABEL_4:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v31, 8);
  return v4;
}

intptr_t __31__LiveFSAppleDouble_createFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) baseFileHandle];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__LiveFSAppleDouble_createFile__block_invoke_2;
  v6[3] = &unk_264DC7E50;
  uint64_t v8 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  [v3 fileAttributes:v4 requestID:-1 reply:v6];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_createFile__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [a3 getBytes:*(void *)(*(void *)(a1 + 48) + 8) + 32 length:184];
  }
  int v4 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v4);
}

intptr_t __31__LiveFSAppleDouble_createFile__block_invoke_74(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) parentDirHandle];
  uint64_t v5 = [*(id *)(a1 + 32) fileName];
  int v6 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(*(void *)(a1 + 40) + 8) + 32 length:184];
  long long v7 = [*(id *)(a1 + 32) manager];
  uint64_t v8 = [v7 clientID];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__LiveFSAppleDouble_createFile__block_invoke_2_76;
  v11[3] = &unk_264DC7EA0;
  uint64_t v9 = *(void *)(a1 + 48);
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v9;
  [v3 createIn:v4 named:v5 attributes:v6 andClient:v8 requestID:-1 reply:v11];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __31__LiveFSAppleDouble_createFile__block_invoke_2_76(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) setFileHandle:a5];
  }
  int v6 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v6);
}

- (int)openFile
{
  int v2 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  if (self->_ADFileOpen) {
    goto LABEL_17;
  }
  int purpose = self->_purpose;
  switch(purpose)
  {
    case 2:
      goto LABEL_5;
    case 1:
      int v5 = [(LiveFSAppleDouble *)self createFile];
LABEL_7:
      int v6 = v25;
      *((_DWORD *)v25 + 6) = v5;
      long long v7 = (int *)(v6 + 3);
      if (!v5)
      {
        uint64_t v8 = [(LiveFSAppleDouble *)self fileHandle];

        uint64_t v9 = v25;
        if (v8)
        {
          long long v7 = (int *)(v25 + 3);
        }
        else
        {
          *((_DWORD *)v25 + 6) = 2;
          long long v7 = (int *)(v9 + 3);
          self->_ADFileErr = 2;
        }
      }
      goto LABEL_12;
    case 0:
LABEL_5:
      int v5 = [(LiveFSAppleDouble *)self lookupFile];
      goto LABEL_7;
  }
  long long v7 = &v27;
  int v27 = 1;
LABEL_12:
  int v10 = *v7;
  if (*v7 || self->_purpose == 2)
  {
    if (v10 == 28) {
      int v10 = 1;
    }
    self->_ADFileErr = v10;
    int v2 = *v7;
  }
  else
  {
    int v12 = [(LiveFSAppleDouble *)self manager];
    id v13 = [v12 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__LiveFSAppleDouble_openFile__block_invoke;
    block[3] = &unk_264DC7E28;
    block[4] = self;
    block[5] = &v24;
    dispatch_sync(v13, block);

    if (self->_weCreatedFile)
    {
      if (self->_purpose == 1)
      {
        id v14 = [MEMORY[0x263EFF990] dataWithLength:4096];
        uint64_t v15 = [v14 mutableBytes];
        *(void *)uint64_t v15 = 0x20007160500;
        *(_WORD *)(v15 + 24) = 512;
        *(_OWORD *)(v15 + 26) = xmmword_23AB2BB10;
        *(void *)(v15 + 42) = 0x1E010000E20E0000;
        *(_OWORD *)(v15 + 8) = *(_OWORD *)"Mac OS X        ";
        *(_DWORD *)(v15 + 84) = 1381258305;
        *(_DWORD *)(v15 + 88) = bswap32(self->_baseFileID);
        *(void *)(v15 + 92) = 0x78000000E20E0000;
        *(void *)(v15 + 3810) = 0x1000000010000;
        *(_DWORD *)(v15 + 3822) = 503316480;
        *(void *)(v15 + 4066) = 0x1000000010000;
        *(_DWORD *)(v15 + 4078) = 503316480;
        *(_DWORD *)(v15 + 4090) = 503323648;
        *(_WORD *)(v15 + 4094) = -1;
        strcpy((char *)(v15 + 3826), "This resource fork intentionally left blank   ");
        v16 = [(LiveFSAppleDouble *)self manager];
        uint64_t v17 = [v16 queue];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __29__LiveFSAppleDouble_openFile__block_invoke_3;
        v20[3] = &unk_264DC7F18;
        v20[4] = self;
        id v21 = v14;
        long long v22 = &v24;
        id v18 = v14;
        dispatch_sync(v17, v20);
      }
      long long v19 = livefs_std_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSAppleDouble openFile]();
      }

      int v2 = *((_DWORD *)v25 + 6);
    }
    else
    {
      int v2 = *((_DWORD *)v25 + 6);
      self->_ADFileErr = v2;
      if (!v2) {
        self->_ADFileOK = 1;
      }
    }
  }
LABEL_17:
  _Block_object_dispose(&v24, 8);
  return v2;
}

intptr_t __29__LiveFSAppleDouble_openFile__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__LiveFSAppleDouble_openFile__block_invoke_2;
  v7[3] = &unk_264DC7EC8;
  long long v8 = *(_OWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292) == 1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  [v3 open:v4 withMode:v5 requestID:-1 reply:v7];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __29__LiveFSAppleDouble_openFile__block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 232) = 1;
  }
  int v2 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v2);
}

intptr_t __29__LiveFSAppleDouble_openFile__block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__LiveFSAppleDouble_openFile__block_invoke_4;
  v8[3] = &unk_264DC7EF0;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v6;
  [v3 writeTo:v4 atOffset:0 fromBuffer:v5 requestID:-1 reply:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __29__LiveFSAppleDouble_openFile__block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3 != 4096 || *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(_DWORD *)(v3 + 296) = 28;
  }
  else {
    *(unsigned char *)(v3 + 233) = 1;
  }
  int v4 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v4);
}

- (int)closeFile
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (self->_ADFileOpen)
  {
    uint64_t v3 = [(LiveFSAppleDouble *)self manager];
    int v4 = [v3 queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__LiveFSAppleDouble_closeFile__block_invoke;
    v7[3] = &unk_264DC7E28;
    void v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v4, v7);

    self->_weCreatedFile = 0;
    int v5 = *((_DWORD *)v9 + 6);
  }
  else
  {
    int v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

intptr_t __30__LiveFSAppleDouble_closeFile__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__LiveFSAppleDouble_closeFile__block_invoke_2;
  v7[3] = &unk_264DC7F40;
  long long v8 = *(_OWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292) == 1) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 1;
  }
  [v3 close:v4 keepingMode:v5 requestID:-1 reply:v7];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __30__LiveFSAppleDouble_closeFile__block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 232) = 0;
  int v2 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v2);
}

- (int)writeXattrInfo
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  [(LiveFSAppleDouble *)self swapFileHeader:self->_filehdr];
  if (self->_attrhdr) {
    -[LiveFSAppleDouble swapAttrHeader:](self, "swapAttrHeader:");
  }
  v9[3] = self->_IOSize;
  uint64_t v3 = [(LiveFSAppleDouble *)self manager];
  int v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__LiveFSAppleDouble_writeXattrInfo__block_invoke;
  block[3] = &unk_264DC7E78;
  block[4] = self;
  block[5] = &v8;
  void block[6] = &v12;
  dispatch_sync(v4, block);

  [(LiveFSAppleDouble *)self swapFileHeader:self->_filehdr];
  if (self->_attrhdr) {
    -[LiveFSAppleDouble swapAttrHeader:](self, "swapAttrHeader:");
  }
  int v5 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

intptr_t __35__LiveFSAppleDouble_writeXattrInfo__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 328);
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(v4 + 240) length:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__LiveFSAppleDouble_writeXattrInfo__block_invoke_2;
  v8[3] = &unk_264DC7F68;
  int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v8[4] = *(void *)(a1 + 32);
  [v3 writeTo:v5 atOffset:0 fromBuffer:v6 requestID:-1 reply:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __35__LiveFSAppleDouble_writeXattrInfo__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != a3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 296) = 28;
  }
  uint64_t v3 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v3);
}

- (void)swapFileHeader:(apple_double_header *)a3
{
  LODWORD(v3) = a3->var3;
  unsigned int v4 = bswap32(v3) >> 16;
  int8x8_t v5 = vrev32_s8(*(int8x8_t *)&a3->var0);
  if (*(void *)&a3->var0 != 333319) {
    LOWORD(v3) = v4;
  }
  *(int8x8_t *)&a3->var0 = v5;
  a3->var3 = v4;
  if ((_WORD)v3)
  {
    uint64_t v3 = (unsigned __int16)v3;
    uint64_t v6 = (unsigned int *)((char *)&a3->var4[0].var1 + 2);
    do
    {
      *((int8x8_t *)v6 - 1) = vrev32_s8(*(int8x8_t *)(v6 - 2));
      *uint64_t v6 = bswap32(*v6);
      v6 += 3;
      --v3;
    }
    while (v3);
  }
}

- (void)swapAttrHeader:(attr_header *)a3
{
  int8x16_t v3 = *(int8x16_t *)a3->var0.var6;
  int8x16_t v4 = vrev32q_s8(v3);
  unsigned int v5 = bswap32(HIWORD(a3->var6[2])) >> 16;
  if (v3.i32[0] == 1096045650) {
    unsigned __int16 v6 = HIWORD(a3->var6[2]);
  }
  else {
    unsigned __int16 v6 = v5;
  }
  *(int8x16_t *)a3->var0.var6 = v4;
  a3->var4 = bswap32(a3->var4);
  LOWORD(a3->var6[2]) = bswap32(LOWORD(a3->var6[2])) >> 16;
  HIWORD(a3->var6[2]) = v5;
  if (v6)
  {
    int v7 = 0;
    p_var7 = (int8x8_t *)&a3->var7;
    int8x16_t v9 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
    do
    {
      uint64_t v10 = (int8x8_t *)((char *)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC));
      if (v10 > (int8x8_t *)v9) {
        break;
      }
      int8x8_t *p_var7 = vrev32_s8(*p_var7);
      p_var7[1].i16[0] = bswap32(p_var7[1].u16[0]) >> 16;
      ++v7;
      p_var7 = v10;
    }
    while ((unsigned __int16)v7 < v6);
  }
}

- (void)initEmptyResourceFork:(rsrcfork_header *)a3
{
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)a3->var4 = 0u;
  *(_OWORD *)((char *)&a3->var9 + 2) = 0u;
  *(void *)&a3->var0 = 0x1000000010000;
  *(void *)&a3->var6 = 0x1000000010000;
  *(_OWORD *)a3->var4 = *(_OWORD *)"This resource fork intentionally left blank   ";
  *(_OWORD *)&a3->var4[16] = 0u;
  a3->var3 = 503316480;
  a3->var9 = 503316480;
  *(_DWORD *)&a3->var14 = 503323648;
  a3->var16 = -1;
  *(_OWORD *)&a3->var5[96] = 0u;
  *(_OWORD *)&a3->var5[112] = 0u;
  *(_OWORD *)&a3->var5[64] = 0u;
  *(_OWORD *)&a3->var5[80] = 0u;
  *(_OWORD *)&a3->var5[32] = 0u;
  *(_OWORD *)&a3->var5[48] = 0u;
  *(_OWORD *)a3->var5 = 0u;
  *(_OWORD *)&a3->var5[16] = 0u;
  *(_OWORD *)&a3->var4[80] = 0u;
  *(_OWORD *)&a3->var4[96] = 0u;
  *(_OWORD *)&a3->var4[48] = 0u;
  *(_OWORD *)&a3->var4[64] = 0u;
  *(_OWORD *)&a3->var4[16] = *(_OWORD *)"rk intentionally left blank   ";
  *(_OWORD *)&a3->var4[32] = 0u;
  strcpy((char *)&a3->var4[31], "y left blank   ");
}

- (void)loadAttrHeader
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "LoadAttrHeader: Loaded ATTR header[%d]", v2, v3, v4, v5, v6);
}

- (int)loadADHeader
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  int v99 = 0;
  if (!self->_ADFileOK) {
    goto LABEL_4;
  }
  uint64_t v3 = [(LiveFSAppleDouble *)self manager];
  uint64_t v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke;
  block[3] = &unk_264DC7E28;
  block[4] = self;
  block[5] = &v96;
  dispatch_sync(v4, block);

  if (*((_DWORD *)v97 + 6) || (self->_ADFileAttributes.fa_validmask & 0x40) == 0)
  {
LABEL_4:
    int v5 = 93;
    goto LABEL_5;
  }
  if (self->_purpose == 1)
  {
    unint64_t fa_size = 0x10000;
  }
  else if (self->_ADFileAttributes.fa_size >= 0x10000)
  {
    unint64_t fa_size = 0x10000;
  }
  else
  {
    unint64_t fa_size = self->_ADFileAttributes.fa_size;
  }
  uint64_t v8 = [MEMORY[0x263EFF990] dataWithLength:fa_size];
  int8x16_t v9 = [(LiveFSAppleDouble *)self manager];
  uint64_t v10 = [v9 queue];
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_3;
  v90[3] = &unk_264DC7FE0;
  v90[4] = self;
  v92 = &v96;
  unint64_t v94 = fa_size;
  v93 = &v100;
  id v11 = v8;
  id v91 = v11;
  dispatch_sync(v10, v90);

  int v5 = *((_DWORD *)v97 + 6);
  if (v5) {
    goto LABEL_34;
  }
  uint64_t v12 = livefs_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSAppleDouble loadADHeader].cold.7();
  }

  if ((unint64_t)v101[3] <= 0x19)
  {
    id v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[LiveFSAppleDouble loadADHeader]();
    }

    goto LABEL_33;
  }
  self->_IOSize = fa_size;
  if (!(fa_size >> 16) && !self->_purpose)
  {
    [(LiveFSAppleDouble *)self closeFile];
    uint64_t v14 = [(LiveFSAppleDouble *)self manager];
    int v15 = [v14 queue];
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_84;
    v89[3] = &unk_264DC7E28;
    v89[4] = self;
    v89[5] = &v96;
    dispatch_sync(v15, v89);

    [(LiveFSAppleDouble *)self setFileHandle:0];
  }
  int v5 = *((_DWORD *)v97 + 6);
  if (v5) {
    goto LABEL_34;
  }
  id v16 = v11;
  uint64_t v17 = [v16 mutableBytes];
  uint64_t v18 = v17;
  unsigned int v20 = *(_DWORD *)v17;
  unsigned int v19 = *(_DWORD *)(v17 + 4);
  *(_DWORD *)uint64_t v17 = bswap32(*(_DWORD *)v17);
  *(_DWORD *)(v17 + 4) = bswap32(v19);
  long long v22 = (unsigned __int16 *)(v17 + 24);
  unsigned int v21 = *(unsigned __int16 *)(v17 + 24);
  unsigned int v23 = __rev16(v21);
  *(_WORD *)(v17 + 24) = v23;
  if (v20 != 118883584 || v19 != 512 || !v21 || v23 >= 0x10)
  {
    long long v25 = livefs_std_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v57 = *(_DWORD *)v18;
      int v58 = *(_DWORD *)(v18 + 4);
      int v59 = *(unsigned __int16 *)(v18 + 24);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v57;
      LOWORD(v111) = 1024;
      *(_DWORD *)((char *)&v111 + 2) = v58;
      HIWORD(v111) = 1024;
      LODWORD(v112) = v59;
      _os_log_error_impl(&dword_23AB0B000, v25, OS_LOG_TYPE_ERROR, "LFSAD: loadADHeader: magic is wrong: %d, %d, %d", buf, 0x14u);
    }
    goto LABEL_32;
  }
  unint64_t v24 = 12 * v23 + 26;
  if (v101[3] < v24)
  {
    long long v25 = livefs_std_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[LiveFSAppleDouble loadADHeader]();
    }
LABEL_32:

LABEL_33:
    int v5 = 93;
    goto LABEL_34;
  }
  unsigned int v26 = 0;
  *(void *)buf = 0;
  v111 = buf;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  v71 = 0;
  v72 = (_DWORD *)(v17 + 34);
  do
  {
    uint64_t v27 = v18 + 12 * v26;
    unsigned int v29 = *(_DWORD *)(v27 + 26);
    long long v28 = (apple_double_entry *)(v27 + 26);
    unsigned int v30 = bswap32(v29);
    v28->var0 = v30;
    p_var1 = &v28->var1;
    unint64_t v32 = bswap32(v28->var1);
    p_unsigned int var2 = &v28->var2;
    unsigned int var2 = v28->var2;
    v28->var1 = v32;
    unsigned int v35 = bswap32(var2);
    v28->unsigned int var2 = v35;
    unsigned int v36 = v35 + v32;
    BOOL v37 = __CFADD__(v35, v32);
    if (v24 > v32 || v37 || self->_ADFileAttributes.fa_size < v36)
    {
      v56 = livefs_std_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        -[LiveFSAppleDouble loadADHeader]();
      }
LABEL_78:

      goto LABEL_79;
    }
    if ((_WORD)v26)
    {
      uint64_t v38 = 0;
      v39 = v72;
      while (1)
      {
        unsigned int v40 = *(v39 - 1);
        if (v36 > v40 && *v39 + v40 > v32) {
          break;
        }
        v39 += 3;
        if (v26 == ++v38) {
          goto LABEL_47;
        }
      }
      v56 = livefs_std_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        -[LiveFSAppleDouble loadADHeader].cold.6();
      }
      goto LABEL_78;
    }
LABEL_47:
    if (v30 == 2)
    {
      if (var2)
      {
        *((void *)v111 + 3) = v28;
        if (var2 == 503382016 && self->_purpose != 1)
        {
          v45 = [(LiveFSAppleDouble *)self fileHandle];
          BOOL v46 = v45 == 0;

          if (!v46)
          {
            v47 = [(LiveFSAppleDouble *)self manager];
            v48 = [v47 queue];
            v87[0] = MEMORY[0x263EF8330];
            v87[1] = 3221225472;
            v87[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_86;
            v87[3] = &unk_264DC8008;
            __int16 v88 = v26;
            v87[4] = self;
            v87[5] = buf;
            v87[6] = v18;
            v49 = v48;
            dispatch_sync(v48, v87);
          }
        }
      }
      else
      {
        if (self->_purpose != 1) {
          goto LABEL_63;
        }
        *((void *)v111 + 3) = v28;
      }
      unsigned int v23 = *v22;
      p_readonly = &self->_readonly;
      if (v23 - 1 != v26) {
LABEL_62:
      }
        BOOL *p_readonly = 1;
    }
    else if (v30 == 9 && v35 >= 0x20)
    {
      if (v32 > 0xFFFFFFDF || v101[3] < (unint64_t)(v32 + 32))
      {
        v56 = livefs_std_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          unsigned int v60 = *p_var2;
          unsigned int v61 = *p_var1;
          *(_DWORD *)v104 = 67109632;
          unsigned int v105 = v26;
          __int16 v106 = 1024;
          unsigned int v107 = v60;
          __int16 v108 = 1024;
          unsigned int v109 = v61;
          _os_log_error_impl(&dword_23AB0B000, v56, OS_LOG_TYPE_ERROR, "LFSAD: loadADHeader: FinderInfo[%d] is not well formed: %u@%u", v104, 0x14u);
        }
        goto LABEL_78;
      }
      v41 = (void *)(v18 + v32);
      uint64_t v42 = *v41 | v41[1];
      uint64_t v43 = v41[2] | v41[3];
      p_readonly = &self->_emptyfinderinfo;
      v71 = v28;
      if (!(v42 | v43)) {
        goto LABEL_62;
      }
    }
LABEL_63:
    unsigned int v26 = (unsigned __int16)(v26 + 1);
  }
  while (v26 < (unsigned __int16)v23);
  objc_storeStrong((id *)&self->_ADHeaderBuffer, v16);
  self->_ADBufferHeaderBytesValid = v101[3];
  self->_rawAD = (char *)v18;
  self->_filehdr = (apple_double_header *)v18;
  self->_finderinfo = v71;
  v50 = (apple_double_entry *)*((void *)v111 + 3);
  self->_rsrcfork = v50;
  finderinfo = v71;
  if (*(_WORD *)(v18 + 24) == 2)
  {
    finderinfo = v71;
    if (v71 == (apple_double_entry *)(v18 + 26))
    {
      finderinfo = v71;
      if (v50 == (apple_double_entry *)(v18 + 38))
      {
        finderinfo = v71;
        if (v71->var1 == 50)
        {
          finderinfo = v71;
          if (self->_purpose == 1)
          {
            finderinfo = v71;
            if (v71->var2 == 32)
            {
              int v52 = *(_DWORD *)(v18 + 30);
              size_t v53 = (4064 - v52);
              if (v50)
              {
                uint64_t v54 = *(unsigned int *)(v18 + 46);
                if (v54)
                {
                  [(LiveFSAppleDouble *)self shiftDataDownAtOffset:*(unsigned int *)(v18 + 42) lengh:v54 howMuch:(4064 - v52)];
                  uint64_t v55 = 120;
                  goto LABEL_87;
                }
              }
              size_t v62 = *(unsigned int *)(v18 + 42) + v53;
              if (v62 + 286 < self->_IOSize)
              {
                int v5 = 93;
                *((_DWORD *)v97 + 6) = 93;
                goto LABEL_80;
              }
              v63 = [(LiveFSAppleDouble *)self manager];
              v64 = [v63 queue];
              v74[0] = MEMORY[0x263EF8330];
              v74[1] = 3221225472;
              v74[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_3_88;
              v74[3] = &unk_264DC8058;
              long long v75 = xmmword_23AB2BB20;
              long long v76 = 0u;
              long long v77 = 0u;
              size_t v78 = v62;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              v74[4] = self;
              v74[5] = &v96;
              dispatch_sync(v64, v74);

              v53 -= 286;
              bzero((void *)(v18 + 82), v53);
              [(LiveFSAppleDouble *)self initEmptyResourceFork:(char *)self->_filehdr + *(unsigned int *)((char *)&self->_filehdr->var4[1].var0 + 2) + v53];
              *(unsigned int *)((char *)&self->_filehdr->var4[1].var1 + 2) = 286;
              uint64_t v55 = 4096;
LABEL_87:
              filehdr = self->_filehdr;
              *(unsigned int *)((char *)&filehdr->var4[0].var1 + 2) += v53;
              unsigned int v66 = *(unsigned int *)((char *)&filehdr->var4[1].var0 + 2) + v53;
              *(unsigned int *)((char *)&filehdr->var4[1].var0 + 2) = v66;
              *(_DWORD *)(v18 + 84) = 1096045650;
              *(_DWORD *)(v18 + 88) = self->_baseFileID;
              *(_DWORD *)(v18 + 92) = v66;
              *(_DWORD *)(v18 + 96) = 120;
              *(_DWORD *)(v18 + 116) = 0;
              *(void *)(v18 + 100) = 0;
              *(void *)(v18 + 108) = 0;
              -[LiveFSAppleDouble swapFileHeader:](self, "swapFileHeader:");
              [(LiveFSAppleDouble *)self swapAttrHeader:v18];
              v67 = [(LiveFSAppleDouble *)self manager];
              v68 = [v67 queue];
              v73[0] = MEMORY[0x263EF8330];
              v73[1] = 3221225472;
              v73[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_5;
              v73[3] = &unk_264DC80A8;
              v73[4] = self;
              v73[5] = &v96;
              v73[6] = v55;
              dispatch_sync(v68, v73);

              [(LiveFSAppleDouble *)self swapFileHeader:self->_filehdr];
              if (*((_DWORD *)v97 + 6))
              {
                v69 = livefs_std_log();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                  -[LiveFSAppleDouble loadADHeader].cold.5();
                }

                int v5 = *((_DWORD *)v97 + 6);
                goto LABEL_80;
              }
              finderinfo = self->_finderinfo;
            }
          }
        }
      }
    }
  }
  if (finderinfo && finderinfo == (apple_double_entry *)(v18 + 26) && *(_DWORD *)(v18 + 34) >= 0x24u)
  {
    if (v71->var1 == 50)
    {
      [(LiveFSAppleDouble *)self loadAttrHeader];
      goto LABEL_97;
    }
LABEL_79:
    int v5 = 93;
    goto LABEL_80;
  }
LABEL_97:
  v70 = livefs_std_log();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSAppleDouble loadADHeader].cold.4();
  }

  int v5 = 0;
LABEL_80:
  _Block_object_dispose(buf, 8);
LABEL_34:

LABEL_5:
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
  return v5;
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2;
  v6[3] = &unk_264DC7F90;
  long long v7 = *(_OWORD *)(a1 + 32);
  [v3 fileAttributes:v4 requestID:-1 reply:v6];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [a3 getBytes:*(void *)(a1 + 32) + 24 length:184];
  }
  uint64_t v4 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v4);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_4;
  v8[3] = &unk_264DC7FB8;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v3 readFrom:v4 length:v5 atOffset:0 requestID:-1 reply:v8];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (a3)
  {
    id v4 = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 length];
    [*(id *)(a1 + 32) setData:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 40) syncSem];
  dispatch_semaphore_signal(v5);
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_84(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  id v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = [*(id *)(a1 + 32) manager];
  uint64_t v6 = [v5 clientID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_85;
  v8[3] = &unk_264DC7F90;
  long long v9 = *(_OWORD *)(a1 + 32);
  [v3 reclaim:v4 forClient:v6 requestID:-1 reply:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_85(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v2 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v2);
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_86(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  id v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = (*(_DWORD *)(*(void *)(a1 + 48) + 12 * *(unsigned __int16 *)(a1 + 56) + 30) + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_87;
  v7[3] = &unk_264DC7F90;
  long long v8 = *(_OWORD *)(a1 + 32);
  [v3 readFrom:v4 length:64 atOffset:v5 requestID:-1 reply:v7];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_2_87(uint64_t a1, int a2, id a3)
{
  if (!a2
    && !strcmp((const char *)[a3 bytes], "This resource fork intentionally left blank "))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = objc_msgSend(*(id *)(a1 + 32), "syncSem", a3);
  dispatch_semaphore_signal(v4);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_3_88(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  id v4 = [v3 mount];
  uint64_t v5 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 + 48 length:184];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_4_89;
  v9[3] = &unk_264DC8030;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v2;
  uint64_t v11 = v7;
  id v8 = v2;
  [v4 setFileAttributesOf:v5 to:v6 requestID:-1 reply:v9];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_4_89(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __33__LiveFSAppleDouble_loadADHeader__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  id v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(*(void *)(a1 + 32) + 240) length:*(void *)(a1 + 48)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__LiveFSAppleDouble_loadADHeader__block_invoke_6;
  v7[3] = &unk_264DC8080;
  uint64_t v9 = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  [v3 writeTo:v4 atOffset:0 fromBuffer:v5 requestID:-1 reply:v7];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __33__LiveFSAppleDouble_loadADHeader__block_invoke_6(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || *(void *)(a1 + 48) != a3)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 0;
    if (a3 && *(void *)(a1 + 48) != a3)
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      int v4 = 28;
    }
    else
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(_DWORD *)(v3 + 24) != 28) {
        goto LABEL_9;
      }
      int v4 = 5;
    }
    *(_DWORD *)(v3 + 24) = v4;
  }
LABEL_9:
  uint64_t v5 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v5);
}

- (id)valueForXattrNamed:(id)a3 posixError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v35 = 0;
  unsigned int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  uint64_t v29 = 0;
  unsigned int v30 = &v29;
  uint64_t v31 = 0x3032000000;
  unint64_t v32 = __Block_byref_object_copy__4;
  uint64_t v33 = __Block_byref_object_dispose__4;
  id v34 = 0;
  if (self->_purpose >= 2u)
  {
    id v13 = 0;
    int v14 = 1;
  }
  else
  {
    if (self->_ADFileOK)
    {
      if ([v6 isEqualToString:@"com.apple.FinderInfo"])
      {
        finderinfo = self->_finderinfo;
        if (finderinfo && !self->_emptyfinderinfo)
        {
          uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:&self->_rawAD[finderinfo->var1] length:32];
          id v10 = (void *)v30[5];
          v30[5] = v9;

          uint64_t v11 = v30;
          if (v30[5]) {
            int v12 = 0;
          }
          else {
            int v12 = 12;
          }
          *a4 = v12;
LABEL_22:
          id v13 = (id)v11[5];
          goto LABEL_25;
        }
      }
      else if (![v7 isEqualToString:@"com.apple.ResourceFork"])
      {
        attrhdr = self->_attrhdr;
        if (attrhdr)
        {
          *((_DWORD *)v36 + 6) = 93;
          if (HIWORD(attrhdr->var6[2]))
          {
            unsigned int v16 = 0;
            attr_entry = self->_attr_entry;
            do
            {
              uint64_t var3 = attr_entry->var3;
              uint64_t v19 = ((_WORD)var3 + 14) & 0x1FC;
              if ((char *)((unint64_t)attr_entry + v19) > &self->_rawAD[self->_ADBufferHeaderBytesValid]) {
                break;
              }
              if (var3 <= 0x80 && !attr_entry->var4[var3 - 1])
              {
                if (!strcmp((const char *)attr_entry->var4, (const char *)[v7 UTF8String]))
                {
                  uint64_t var0 = attr_entry->var0;
                  if (self->_ADBufferHeaderBytesValid <= (attr_entry->var1 + var0))
                  {
                    int v25 = [(LiveFSAppleDouble *)self openFile];
                    *((_DWORD *)v36 + 6) = v25;
                    if (!v25)
                    {
                      unsigned int v26 = [(LiveFSAppleDouble *)self manager];
                      uint64_t v27 = [v26 queue];
                      v28[0] = MEMORY[0x263EF8330];
                      v28[1] = 3221225472;
                      v28[2] = __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke;
                      v28[3] = &unk_264DC80D0;
                      v28[4] = self;
                      v28[5] = &v35;
                      v28[6] = &v29;
                      v28[7] = attr_entry;
                      dispatch_sync(v27, v28);

                      [(LiveFSAppleDouble *)self closeFile];
                    }
                  }
                  else
                  {
                    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", &self->_rawAD[var0]);
                    unsigned int v23 = (void *)v30[5];
                    v30[5] = v22;

                    if (v30[5]) {
                      int v24 = 0;
                    }
                    else {
                      int v24 = 12;
                    }
                    *((_DWORD *)v36 + 6) = v24;
                  }
                  break;
                }
                attrhdr = self->_attrhdr;
                uint64_t v19 = (attr_entry->var3 + 14) & 0x1FC;
              }
              attr_entry = (attr_entry *)((char *)attr_entry + v19);
              ++v16;
            }
            while (v16 < HIWORD(attrhdr->var6[2]));
          }
          *a4 = *((_DWORD *)v36 + 6);
          uint64_t v11 = v30;
          goto LABEL_22;
        }
      }
    }
    id v13 = 0;
    int v14 = 93;
  }
  *a4 = v14;
LABEL_25:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);

  return v13;
}

intptr_t __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(unsigned int **)(a1 + 56);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke_2;
  v9[3] = &unk_264DC7E50;
  uint64_t v11 = *(void *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 32);
  [v3 readFrom:v4 length:v6 atOffset:v7 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

void __51__LiveFSAppleDouble_valueForXattrNamed_posixError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  uint64_t v6 = [*(id *)(a1 + 32) syncSem];
  dispatch_semaphore_signal(v6);
}

- (int)setValue:(id)a3 forXattrNamed:(id)a4 how:(int)a5
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v76 = a4;
  uint64_t v112 = 0;
  uint64_t v113 = &v112;
  uint64_t v114 = 0x2020000000;
  int v115 = 0;
  if (self->_purpose != 1)
  {
    int v12 = 1;
    goto LABEL_43;
  }
  if (!self->_ADFileOK)
  {
    int v115 = 1;
    goto LABEL_35;
  }
  int v8 = [(LiveFSAppleDouble *)self openFile];
  *((_DWORD *)v113 + 6) = v8;
  if (!v8)
  {
    unsigned int v74 = [v75 length];
    int v9 = [v76 length];
    if ([v76 isEqualToString:@"com.apple.FinderInfo"])
    {
      if ([v75 length] != 32)
      {
        int v12 = 22;
        goto LABEL_43;
      }
      long long v10 = (void *)[v75 bytes];
      if ((a5 - 3) <= 0xFFFFFFFD && !(*v10 | v10[1] | v10[2] | v10[3])) {
        goto LABEL_8;
      }
    }
    else
    {
      long long v10 = 0;
    }
    __src = v10;
    size_t v71 = v9 + 1;
    unint64_t v73 = (v71 + 14) & 0xFFFFFFFFFFFFFFFCLL;
LABEL_16:
    if (!objc_msgSend(v76, "isEqualToString:", @"com.apple.FinderInfo", __src))
    {
      if (![v76 isEqualToString:@"com.apple.ResourceFork"])
      {
        if ((unint64_t)v74 >> 31)
        {
          int v12 = 7;
          goto LABEL_43;
        }
        attrhdr = self->_attrhdr;
        if (!attrhdr) {
          goto LABEL_31;
        }
        attr_entry = self->_attr_entry;
        unsigned int var4 = attrhdr->var4;
        unsigned int var3 = attrhdr->var3;
        if (HIWORD(attrhdr->var6[2]))
        {
          int v16 = 0;
          while ((char *)((unint64_t)attr_entry + ((attr_entry->var3 + 14) & 0x1FC)) <= &self->_rawAD[self->_ADBufferHeaderBytesValid])
          {
            uint64_t v17 = [NSString stringWithUTF8String:attr_entry->var4];
            char v18 = [v76 isEqualToString:v17];

            if (v18)
            {
              if (a5 == 1) {
                goto LABEL_99;
              }
              if (attr_entry->var1 == v74)
              {
                if (v73 + v74 + var4 + var3 > 0x10000)
                {
                  v63 = [(LiveFSAppleDouble *)self manager];
                  v64 = [v63 queue];
                  v106[0] = MEMORY[0x263EF8330];
                  v106[1] = 3221225472;
                  v106[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3;
                  v106[3] = &unk_264DC7F18;
                  v106[4] = self;
                  id v107 = v75;
                  __int16 v108 = &v112;
                  dispatch_sync(v64, v106);

                  if (*((_DWORD *)v113 + 6))
                  {
                    v65 = livefs_std_log();
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
                      -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.5();
                    }
                  }
                }
                else
                {
                  memcpy((char *)attrhdr + attr_entry->var0, (const void *)[v75 bytes], v74);
                  self->_IOSize = self->_attrhdr->var4 + self->_attrhdr->var3;
                  int v60 = [(LiveFSAppleDouble *)self writeXattrInfo];
                  *((_DWORD *)v113 + 6) = v60;
                  if (v60)
                  {
                    unsigned int v61 = livefs_std_log();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                      -[LiveFSAppleDouble setValue:forXattrNamed:how:].cold.4();
                    }
                  }
                }
                goto LABEL_35;
              }
              int v12 = [(LiveFSAppleDouble *)self removeXattrNamed:v76];
              *((_DWORD *)v113 + 6) = v12;
              a5 = 1;
              if (!v12) {
                goto LABEL_16;
              }
              goto LABEL_43;
            }
            attr_entry = (attr_entry *)((char *)attr_entry + ((attr_entry->var3 + 14) & 0x1FC));
            if (++v16 >= HIWORD(attrhdr->var6[2])) {
              break;
            }
          }
        }
        if (a5 == 2) {
          goto LABEL_31;
        }
        uint64_t v21 = attrhdr->var3;
        if (v73 + v21 > 0x10000)
        {
          uint64_t v19 = v113;
          int v20 = 28;
          goto LABEL_34;
        }
        unint64_t v29 = v73 + v74 + var4 + var3;
        uint64_t var2 = attrhdr->var2;
        unint64_t v31 = (var2 - (v21 + attrhdr->var4));
        BOOL v36 = v73 + v74 >= v31;
        unint64_t v32 = v73 + v74 - v31;
        if (v32 != 0 && v36)
        {
          unint64_t v33 = (v32 + 4095) & 0xFFFFFFFFFFFFF000;
          unint64_t v34 = v33 + var2;
          unint64_t v35 = (0x10000 - var2);
          BOOL v36 = v34 <= 0x10000 || v29 >= 0x10001;
          if (v36) {
            unint64_t v37 = v33;
          }
          else {
            unint64_t v37 = v35;
          }
          unint64_t fa_size = self->_ADFileAttributes.fa_size;
          v39 = [(LiveFSAppleDouble *)self manager];
          unsigned int v40 = [v39 queue];
          v93[0] = MEMORY[0x263EF8330];
          v93[1] = 3221225472;
          v93[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_97;
          v93[3] = &unk_264DC8058;
          long long v94 = xmmword_23AB2BB20;
          long long v95 = 0u;
          long long v96 = 0u;
          unint64_t v97 = fa_size + v37;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          v93[4] = self;
          v93[5] = &v112;
          dispatch_sync(v40, v93);

          if (*((_DWORD *)v113 + 6))
          {
            v41 = livefs_std_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              -[LiveFSAppleDouble setValue:forXattrNamed:how:]();
            }

            goto LABEL_35;
          }
          rsrcfork = self->_rsrcfork;
          if (rsrcfork)
          {
            uint64_t v46 = rsrcfork->var2;
            if (v46)
            {
              [(LiveFSAppleDouble *)self shiftDataDownAtOffset:rsrcfork->var1 lengh:v46 howMuch:v37];
              rsrcfork = self->_rsrcfork;
            }
            rsrcfork->var1 += v37;
          }
          self->_finderinfo->var2 += v37;
          attrhdr->var2 += v37;
        }
        uint64_t v47 = attrhdr->var3;
        if (v29 >= 0x10001) {
          [(LiveFSAppleDouble *)self shiftDataDownAtOffset:v47 lengh:attrhdr->var4 howMuch:v73];
        }
        else {
          memmove((char *)attrhdr + v47 + v73, (char *)attrhdr + v47, attrhdr->var4);
        }
        unsigned int v48 = attrhdr->var3 + v73;
        attrhdr->unsigned int var3 = v48;
        v49 = self->_attr_entry;
        if (v49 != attr_entry)
        {
          v50 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
          do
          {
            v51 = (attr_entry *)((char *)v49 + ((v49->var3 + 14) & 0x1FC));
            if (v51 > (attr_entry *)v50) {
              break;
            }
            v49->var0 += v73;
            v49 = v51;
          }
          while (v51 != attr_entry);
        }
        uint64_t v52 = attrhdr->var4;
        if (v29 >= 0x10001)
        {
          size_t v53 = [(LiveFSAppleDouble *)self manager];
          uint64_t v54 = [v53 queue];
          v89[0] = MEMORY[0x263EF8330];
          v89[1] = 3221225472;
          v89[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_99;
          v89[3] = &unk_264DC8148;
          v89[4] = self;
          uint64_t v92 = v52 + v48;
          id v90 = v75;
          id v91 = &v112;
          dispatch_sync(v54, v89);

          if (*((_DWORD *)v113 + 6))
          {
            uint64_t v55 = livefs_std_log();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              -[LiveFSAppleDouble setValue:forXattrNamed:how:]();
            }

            goto LABEL_35;
          }
        }
        else
        {
          memcpy((char *)attrhdr + v48 + v52, (const void *)[v75 bytes], v74);
        }
        attr_entry->var1 = v74;
        attr_entry->uint64_t var0 = attrhdr->var4 + attrhdr->var3;
        attr_entry->unsigned int var3 = v71;
        attr_entry->uint64_t var2 = 0;
        memcpy(attr_entry->var4, (const void *)[v76 UTF8String], v71);
        ++HIWORD(attrhdr->var6[2]);
        attrhdr->var4 += v74;
        v56 = self->_attrhdr;
        unsigned int v57 = v56->var3;
        if (v29 < 0x10001) {
          v57 += v56->var4;
        }
        self->_IOSize = v57;
        int v58 = [(LiveFSAppleDouble *)self writeXattrInfo];
        *((_DWORD *)v113 + 6) = v58;
        if (v58)
        {
          int v59 = livefs_std_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            -[LiveFSAppleDouble setValue:forXattrNamed:how:]();
          }
        }
        goto LABEL_35;
      }
      if (self->_ADFileAttributes.fa_type != 1)
      {
        uint64_t v19 = v113;
        int v20 = 1;
        goto LABEL_34;
      }
      v44 = self->_rsrcfork;
      if (!v44) {
        goto LABEL_31;
      }
      if (v44->var2)
      {
        if (a5 != 1) {
          goto LABEL_110;
        }
LABEL_99:
        uint64_t v19 = v113;
        int v20 = 17;
        goto LABEL_34;
      }
      if (a5 != 2)
      {
LABEL_110:
        unsigned int v66 = [(LiveFSAppleDouble *)self manager];
        v67 = [v66 queue];
        v109[0] = MEMORY[0x263EF8330];
        v109[1] = 3221225472;
        v109[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke;
        v109[3] = &unk_264DC7F18;
        v109[4] = self;
        id v68 = v75;
        id v110 = v68;
        v111 = &v112;
        dispatch_sync(v67, v109);

        if (!*((_DWORD *)v113 + 6))
        {
          self->_rsrcfork->uint64_t var2 = [v68 length];
          self->_IOSize = 120;
          int v69 = [(LiveFSAppleDouble *)self writeXattrInfo];
          *((_DWORD *)v113 + 6) = v69;
        }

        goto LABEL_35;
      }
LABEL_31:
      uint64_t v19 = v113;
      int v20 = 93;
LABEL_34:
      *((_DWORD *)v19 + 6) = v20;
      goto LABEL_35;
    }
    finderinfo = self->_finderinfo;
    if (finderinfo && !self->_emptyfinderinfo)
    {
      uint64_t v43 = __src;
      if (a5 == 1) {
        goto LABEL_99;
      }
    }
    else
    {
      uint64_t v43 = __src;
      if (a5 == 2) {
        goto LABEL_31;
      }
    }
    if ((a5 - 1) <= 1 && !(*v43 | v43[1] | v43[2] | v43[3]))
    {
LABEL_8:
      int v11 = [(LiveFSAppleDouble *)self removeXattrNamed:@"com.apple.FinderInfo"];
      if (v11 == 93) {
        int v12 = 0;
      }
      else {
        int v12 = v11;
      }
      *((_DWORD *)v113 + 6) = v12;
      goto LABEL_43;
    }
    if (finderinfo)
    {
      memcpy((char *)self->_filehdr + finderinfo->var1, v43, v74);
      self->_IOSize = 120;
      int v62 = [(LiveFSAppleDouble *)self writeXattrInfo];
      *((_DWORD *)v113 + 6) = v62;
      self->_emptyfinderinfo = 0;
      goto LABEL_35;
    }
    goto LABEL_31;
  }
LABEL_35:
  if (!*((_DWORD *)v113 + 6))
  {
    uint64_t v85 = 0;
    long long v86 = &v85;
    uint64_t v87 = 0x2020000000;
    int v88 = 0;
    uint64_t v79 = 0;
    long long v80 = &v79;
    uint64_t v81 = 0x3032000000;
    long long v82 = __Block_byref_object_copy__4;
    long long v83 = __Block_byref_object_dispose__4;
    id v84 = [MEMORY[0x263EFF990] dataWithCapacity:184];
    uint64_t v22 = [(LiveFSAppleDouble *)self manager];
    unsigned int v23 = [v22 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_101;
    block[3] = &unk_264DC7E78;
    block[4] = self;
    block[5] = &v85;
    void block[6] = &v79;
    dispatch_sync(v23, block);

    if (!*((_DWORD *)v86 + 6))
    {
      *(void *)([ (id) v80[5] mutableBytes] + 8) = 2048;
      int v24 = [(LiveFSAppleDouble *)self manager];
      int v25 = [v24 queue];
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3_103;
      v77[3] = &unk_264DC7E78;
      v77[4] = self;
      v77[5] = &v79;
      v77[6] = &v85;
      dispatch_sync(v25, v77);

      if (*((_DWORD *)v113 + 6))
      {
        unsigned int v26 = livefs_std_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = *((_DWORD *)v86 + 6);
          *(_DWORD *)buf = 67109120;
          int v117 = v27;
          _os_log_impl(&dword_23AB0B000, v26, OS_LOG_TYPE_DEFAULT, "error updating MTIME on base file:%d", buf, 8u);
        }
      }
    }
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(&v85, 8);
  }
  [(LiveFSAppleDouble *)self closeFile];
  int v12 = *((_DWORD *)v113 + 6);
LABEL_43:
  _Block_object_dispose(&v112, 8);

  return v12;
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 264) + 4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2;
  v8[3] = &unk_264DC80F8;
  void v8[4] = *(void *)(a1 + 48);
  [v3 writeTo:v4 atOffset:v6 fromBuffer:v5 requestID:-1 reply:v8];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

uint64_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 + 264) + 4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4;
  v10[3] = &unk_264DC7EF0;
  uint64_t v8 = *(void *)(a1 + 48);
  v10[4] = v6;
  v10[5] = v8;
  [v3 writeTo:v4 atOffset:v7 fromBuffer:v5 requestID:-1 reply:v10];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_97(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  int v4 = [v3 mount];
  uint64_t v5 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 + 48 length:184];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_98;
  v8[3] = &unk_264DC8120;
  objc_copyWeak(&v11, &location);
  uint64_t v10 = *(void *)(a1 + 40);
  id v7 = v2;
  id v9 = v7;
  [v4 setFileAttributesOf:v5 to:v6 requestID:-1 reply:v8];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_98(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = WeakRetained == 0;
  }
  if (!v7) {
    [v8 getBytes:WeakRetained + 24 length:184];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_99(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) fileHandle];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_100;
  v9[3] = &unk_264DC7EF0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  v9[5] = v6;
  [v3 writeTo:v4 atOffset:v5 fromBuffer:v7 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_100(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_101(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  int v4 = [*(id *)(a1 + 32) baseFileHandle];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_102;
  v6[3] = &unk_264DC7E50;
  uint64_t v8 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  [v3 fileAttributes:v4 requestID:-1 reply:v6];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_2_102(void *a1, int a2)
{
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setData:");
  }
  uint64_t v3 = *(NSObject **)(a1[4] + 336);

  return dispatch_semaphore_signal(v3);
}

void __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_3_103(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  int v4 = [v3 mount];
  uint64_t v5 = [*(id *)(a1 + 32) baseFileHandle];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4_104;
  v9[3] = &unk_264DC8030;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v2;
  uint64_t v11 = v7;
  id v8 = v2;
  [v4 setFileAttributesOf:v5 to:v6 requestID:-1 reply:v9];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_setValue_forXattrNamed_how___block_invoke_4_104(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)removeXattrNamed:(id)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v97 = 0;
  long long v98 = &v97;
  uint64_t v99 = 0x2020000000;
  int v100 = 0;
  if (self->_purpose != 1)
  {
    int v14 = 1;
    goto LABEL_70;
  }
  if (self->_ADFileOK)
  {
    int v5 = [(LiveFSAppleDouble *)self openFile];
    *((_DWORD *)v98 + 6) = v5;
    if (!v5)
    {
      uint64_t v6 = livefs_std_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSAppleDouble removeXattrNamed:]8();
      }

      attrhdr = self->_attrhdr;
      if (attrhdr)
      {
        int v8 = HIWORD(attrhdr->var6[2]);
        if (self->_rsrcfork) {
          int v9 = v8 + 1;
        }
        else {
          int v9 = v8;
        }
        if (self->_finderinfo && !self->_emptyfinderinfo) {
          ++v9;
        }
        id v10 = livefs_std_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[LiveFSAppleDouble removeXattrNamed:]7();
        }

        if ([v4 isEqualToString:@"com.apple.FinderInfo"])
        {
          finderinfo = self->_finderinfo;
          if (finderinfo && !self->_emptyfinderinfo)
          {
            if (v9 != 1)
            {
              int v12 = (_OWORD *)((char *)&self->_filehdr->var0 + finderinfo->var1);
              *int v12 = 0u;
              v12[1] = 0u;
              self->_IOSize = 120;
              int v13 = [(LiveFSAppleDouble *)self writeXattrInfo];
              *((_DWORD *)v98 + 6) = v13;
              if (!v13) {
                self->_emptyfinderinfo = 1;
              }
              goto LABEL_55;
            }
LABEL_85:
            *((_DWORD *)v98 + 6) = 0;
LABEL_86:
            uint64_t v55 = [(LiveFSAppleDouble *)self fileHandle];
            v56 = livefs_std_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              -[LiveFSAppleDouble removeXattrNamed:].cold.5();
            }

            [(LiveFSAppleDouble *)self closeFile];
            unsigned int v57 = [(LiveFSAppleDouble *)self manager];
            int v58 = [v57 queue];
            v81[0] = MEMORY[0x263EF8330];
            v81[1] = 3221225472;
            v81[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_105;
            v81[3] = &unk_264DC7F18;
            v81[4] = self;
            id v59 = v55;
            id v82 = v59;
            long long v83 = &v97;
            dispatch_sync(v58, v81);

            int v60 = livefs_std_log();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
              -[LiveFSAppleDouble removeXattrNamed:].cold.4();
            }

            goto LABEL_55;
          }
        }
        else
        {
          int v15 = livefs_std_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[LiveFSAppleDouble removeXattrNamed:]6();
          }

          if ([v4 isEqualToString:@"com.apple.ResourceFork"])
          {
            if (self->_ADFileAttributes.fa_type != 1)
            {
              int v32 = 1;
              goto LABEL_54;
            }
            rsrcfork = self->_rsrcfork;
            if (rsrcfork && rsrcfork->var2)
            {
              *((_DWORD *)v98 + 6) = 0;
              if (v9 != 1)
              {
                uint64_t var2 = rsrcfork->var2;
                if (self->_ADFileAttributes.fa_size != var2 + rsrcfork->var1) {
                  goto LABEL_37;
                }
                char v18 = [(LiveFSAppleDouble *)self manager];
                uint64_t v19 = [v18 queue];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke;
                block[3] = &unk_264DC8058;
                long long v85 = xmmword_23AB2BB20;
                long long v86 = 0u;
                long long v87 = 0u;
                uint64_t v88 = var2;
                long long v89 = 0u;
                long long v90 = 0u;
                long long v91 = 0u;
                long long v92 = 0u;
                long long v93 = 0u;
                long long v94 = 0u;
                long long v95 = 0u;
                long long v96 = 0u;
                block[4] = self;
                block[5] = &v97;
                dispatch_sync(v19, block);

                if (*((_DWORD *)v98 + 6))
                {
                  int v20 = livefs_std_log();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    int v21 = *((_DWORD *)v98 + 6);
                    LODWORD(buf) = 67109120;
                    DWORD1(buf) = v21;
                    _os_log_impl(&dword_23AB0B000, v20, OS_LOG_TYPE_DEFAULT, "removeXattrName: error truncating to resource fork length's:%d", (uint8_t *)&buf, 8u);
                  }
                }
                if (!*((_DWORD *)v98 + 6))
                {
LABEL_37:
                  self->_rsrcfork->uint64_t var2 = 0;
                  self->_IOSize = 120;
                  int v22 = [(LiveFSAppleDouble *)self writeXattrInfo];
                  *((_DWORD *)v98 + 6) = v22;
                }
                goto LABEL_55;
              }
              goto LABEL_86;
            }
          }
          else
          {
            unsigned int v23 = livefs_std_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              -[LiveFSAppleDouble removeXattrNamed:]5();
            }

            int v24 = livefs_std_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[LiveFSAppleDouble removeXattrNamed:]4();
            }

            if (HIWORD(self->_attrhdr->var6[2]))
            {
              attr_entry = self->_attr_entry;
              unsigned int v26 = 1;
              while ((char *)((unint64_t)attr_entry + ((attr_entry->var3 + 14) & 0x1FC)) <= &self->_rawAD[self->_ADBufferHeaderBytesValid])
              {
                int v27 = livefs_std_log();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(buf) = 136315138;
                  *(void *)((char *)&buf + 4) = attr_entry->var4;
                  _os_log_debug_impl(&dword_23AB0B000, v27, OS_LOG_TYPE_DEBUG, "removeXattrName: looking at [%s]", (uint8_t *)&buf, 0xCu);
                }

                long long v28 = [NSString stringWithUTF8String:attr_entry->var4];
                char v29 = [v4 isEqualToString:v28];

                if (v29)
                {
                  int v74 = HIWORD(self->_attrhdr->var6[2]);
                  uint64_t v42 = livefs_std_log();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
                    -[LiveFSAppleDouble removeXattrNamed:]3();
                  }

                  if (v9 != 1)
                  {
                    uint64_t v43 = self->_attrhdr;
                    unsigned int var3 = v43->var3;
                    unsigned int var4 = v43->var4;
                    uint64_t v46 = livefs_std_log();
                    unsigned int v47 = var4 + var3;
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                      -[LiveFSAppleDouble removeXattrNamed:]2();
                    }

                    uint64_t var0 = attr_entry->var0;
                    uint64_t var1 = attr_entry->var1;
                    uint64_t v50 = (attr_entry->var3 + 14) & 0x1FCLL;
                    if (v74 != v26) {
                      memcpy(attr_entry, (char *)attr_entry + v50, (char *)self->_attrhdr + self->_attrhdr->var3 - ((char *)attr_entry + v50));
                    }
                    v51 = livefs_std_log();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                      -[LiveFSAppleDouble removeXattrNamed:]1();
                    }

                    uint64_t v52 = self->_attrhdr;
                    uint64_t v53 = v52->var3;
                    if (v47 <= 0x10000)
                    {
                      memmove((char *)v52 + v53 - v50, (char *)v52 + v53, var0 - v53);
                      if (v74 != v26) {
                        memmove((char *)self->_attrhdr + var0 - v50, (char *)self->_attrhdr + var0 + var1, self->_attrhdr->var4 + self->_attrhdr->var3 - (var1 + var0));
                      }
                      bzero((char *)self->_attrhdr + self->_attrhdr->var3 + self->_attrhdr->var4 - v50 - var1, v50 + var1);
                      unint64_t v54 = self->_attrhdr->var4 + self->_attrhdr->var3;
                    }
                    else
                    {
                      [(LiveFSAppleDouble *)self shiftDataUp:v53 length:var0 - v53 howMuch:v50];
                      if (v74 != v26) {
                        [(LiveFSAppleDouble *)self shiftDataUp:var1 + var0 length:self->_attrhdr->var4 + self->_attrhdr->var3 - (var1 + var0) howMuch:v50 + var1];
                      }
                      unint64_t v54 = self->_attrhdr->var3 - v50;
                    }
                    self->_IOSize = v54;
                    unsigned int v61 = livefs_std_log();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
                      -[LiveFSAppleDouble removeXattrNamed:]0();
                    }

                    int v62 = self->_attrhdr;
                    unsigned __int16 v63 = HIWORD(v62->var6[2]) - 1;
                    HIWORD(v62->var6[2]) = v63;
                    unsigned int v64 = v62->var4 - var1;
                    v62->var3 -= v50;
                    v62->unsigned int var4 = v64;
                    int v65 = v63;
                    if (v63)
                    {
                      unsigned int v66 = self->_attr_entry;
                      v67 = &self->_rawAD[self->_ADBufferHeaderBytesValid];
                      do
                      {
                        id v68 = (attr_entry *)((char *)v66 + ((v66->var3 + 14) & 0x1FC));
                        if (v68 > (attr_entry *)v67) {
                          break;
                        }
                        unsigned int v69 = v66->var0;
                        if (v66->var0 > var0)
                        {
                          v69 -= var1;
                          v66->uint64_t var0 = v69;
                        }
                        v66->uint64_t var0 = v69 - v50;
                        unsigned int v66 = v68;
                        --v65;
                      }
                      while (v65);
                    }
                    v70 = livefs_std_log();
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
                      -[LiveFSAppleDouble removeXattrNamed:].cold.9();
                    }

                    int v71 = [(LiveFSAppleDouble *)self writeXattrInfo];
                    *((_DWORD *)v98 + 6) = v71;
                    if (v71)
                    {
                      v72 = livefs_std_log();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                        -[LiveFSAppleDouble removeXattrNamed:].cold.8();
                      }
                    }
                    unint64_t v73 = livefs_std_log();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
                      -[LiveFSAppleDouble removeXattrNamed:].cold.7();
                    }

                    goto LABEL_55;
                  }
                  goto LABEL_85;
                }
                attr_entry = (attr_entry *)((char *)attr_entry + ((attr_entry->var3 + 14) & 0x1FC));
                if (v26++ >= HIWORD(self->_attrhdr->var6[2])) {
                  break;
                }
              }
            }
            unint64_t v31 = livefs_std_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[LiveFSAppleDouble removeXattrNamed:].cold.6();
            }
          }
        }
        int v32 = 93;
LABEL_54:
        *((_DWORD *)v98 + 6) = v32;
        goto LABEL_55;
      }
      *((_DWORD *)v98 + 6) = 93;
    }
  }
  else
  {
    int v100 = 93;
  }
LABEL_55:
  if (!*((_DWORD *)v98 + 6))
  {
    uint64_t v77 = 0;
    size_t v78 = &v77;
    uint64_t v79 = 0x2020000000;
    int v80 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v104 = 0x3032000000;
    long long v105 = __Block_byref_object_copy__4;
    __int16 v106 = __Block_byref_object_dispose__4;
    id v107 = [MEMORY[0x263EFF990] dataWithCapacity:184];
    unint64_t v33 = [(LiveFSAppleDouble *)self manager];
    unint64_t v34 = [v33 queue];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_107;
    v76[3] = &unk_264DC7E78;
    v76[4] = self;
    v76[5] = &v77;
    v76[6] = &buf;
    dispatch_sync(v34, v76);

    if (!*((_DWORD *)v78 + 6))
    {
      *(void *)([*(id *)(*((void *)&buf + 1) + 40) mutableBytes] + 8) = 2048;
      unint64_t v35 = [(LiveFSAppleDouble *)self manager];
      BOOL v36 = [v35 queue];
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_3;
      v75[3] = &unk_264DC7E78;
      v75[4] = self;
      v75[5] = &buf;
      v75[6] = &v77;
      dispatch_sync(v36, v75);

      if (*((_DWORD *)v78 + 6))
      {
        unint64_t v37 = livefs_std_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = *((_DWORD *)v78 + 6);
          *(_DWORD *)long long v101 = 67109120;
          int v102 = v38;
          _os_log_impl(&dword_23AB0B000, v37, OS_LOG_TYPE_DEFAULT, "removeXattrNamed: Error updating base file's mtime:%d", v101, 8u);
        }
      }
    }
    v39 = livefs_std_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSAppleDouble removeXattrNamed:]();
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v77, 8);
  }
  [(LiveFSAppleDouble *)self closeFile];
  if (*((_DWORD *)v98 + 6))
  {
    unsigned int v40 = livefs_std_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[LiveFSAppleDouble removeXattrNamed:]();
    }
  }
  else
  {
    unsigned int v40 = livefs_std_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSAppleDouble removeXattrNamed:]();
    }
  }

  int v14 = *((_DWORD *)v98 + 6);
LABEL_70:
  _Block_object_dispose(&v97, 8);

  return v14;
}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  id v4 = [v3 mount];
  int v5 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 + 48 length:184];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2;
  v8[3] = &unk_264DC8120;
  objc_copyWeak(&v11, &location);
  uint64_t v10 = *(void *)(a1 + 40);
  id v7 = v2;
  id v9 = v7;
  [v4 setFileAttributesOf:v5 to:v6 requestID:-1 reply:v8];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = WeakRetained;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = WeakRetained == 0;
  }
  if (!v7) {
    [v8 getBytes:WeakRetained + 24 length:184];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_105(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) parentDirHandle];
  uint64_t v6 = [*(id *)(a1 + 32) fileName];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_106;
  v9[3] = &unk_264DC7D60;
  uint64_t v7 = *(void *)(a1 + 48);
  void v9[4] = *(void *)(a1 + 32);
  v9[5] = v7;
  [v3 removeItem:v4 from:v5 named:v6 usingFlags:0 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_106(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_107(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) baseFileHandle];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_108;
  v6[3] = &unk_264DC7E50;
  uint64_t v8 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  [v3 fileAttributes:v4 requestID:-1 reply:v6];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_2_108(void *a1, int a2)
{
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setData:");
  }
  uint64_t v3 = *(NSObject **)(a1[4] + 336);

  return dispatch_semaphore_signal(v3);
}

void __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  uint64_t v4 = [v3 mount];
  int v5 = [*(id *)(a1 + 32) baseFileHandle];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_4;
  v9[3] = &unk_264DC8030;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v2;
  uint64_t v11 = v7;
  id v8 = v2;
  [v4 setFileAttributesOf:v5 to:v6 requestID:-1 reply:v9];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __38__LiveFSAppleDouble_removeXattrNamed___block_invoke_4(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allXattrNamesAndPosixError:(int *)a3
{
  int v5 = [MEMORY[0x263EFF980] array];
  int purpose = self->_purpose;
  if (purpose != 1)
  {
    if (purpose)
    {
      id v15 = 0;
      *a3 = 1;
      goto LABEL_26;
    }
    int purpose = !self->_finderinfo && !self->_attrhdr && !self->_rsrcfork
           || (self->_ADFileAttributes.fa_size & 0xFFFFFFFFFFFF0000) != 0;
  }
  *a3 = 0;
  if (self->_ADFileOK && (!purpose || ![(LiveFSAppleDouble *)self openFile]))
  {
    if (self->_finderinfo && !self->_emptyfinderinfo)
    {
      uint64_t v7 = [NSString stringWithUTF8String:"com.apple.FinderInfo"];
      [v5 addObject:v7];
    }
    if (self->_rsrcfork)
    {
      id v8 = [NSString stringWithUTF8String:"com.apple.ResourceFork"];
      [v5 addObject:v8];
    }
    attrhdr = self->_attrhdr;
    if (attrhdr && HIWORD(attrhdr->var6[2]))
    {
      unsigned int v10 = 0;
      attr_entry = self->_attr_entry;
      do
      {
        uint64_t var3 = attr_entry->var3;
        uint64_t v13 = ((_WORD)var3 + 14) & 0x1FC;
        if ((char *)((unint64_t)attr_entry + v13) > &self->_rawAD[self->_ADBufferHeaderBytesValid]) {
          break;
        }
        if (var3 <= 0x80 && !*(&attr_entry->var3 + var3))
        {
          int v14 = [NSString stringWithUTF8String:attr_entry->var4];
          [v5 addObject:v14];

          attrhdr = self->_attrhdr;
          uint64_t v13 = (attr_entry->var3 + 14) & 0x1FC;
        }
        attr_entry = (attr_entry *)((char *)attr_entry + v13);
        ++v10;
      }
      while (v10 < HIWORD(attrhdr->var6[2]));
    }
    [(LiveFSAppleDouble *)self closeFile];
  }
  id v15 = v5;
LABEL_26:

  return v15;
}

- (int)removeFile
{
  uint64_t v11 = 0;
  v12[0] = &v11;
  v12[1] = 0x2020000000;
  int v13 = 0;
  if (self->_purpose == 2)
  {
    uint64_t v3 = [(LiveFSAppleDouble *)self fileHandle];

    if (v3)
    {
      uint64_t v4 = livefs_std_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSAppleDouble removeFile]();
      }

      int v5 = [(LiveFSAppleDouble *)self manager];
      uint64_t v6 = [v5 queue];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __31__LiveFSAppleDouble_removeFile__block_invoke;
      v10[3] = &unk_264DC7E28;
      v10[4] = self;
      v10[5] = &v11;
      dispatch_sync(v6, v10);

      uint64_t v7 = livefs_std_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(LiveFSAppleDouble *)(uint64_t)v12 removeFile];
      }

      self->_int purpose = 666;
      int v8 = *(_DWORD *)(v12[0] + 24);
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 1;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __31__LiveFSAppleDouble_removeFile__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  int v5 = [*(id *)(a1 + 32) parentDirHandle];
  uint64_t v6 = [*(id *)(a1 + 32) fileName];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__LiveFSAppleDouble_removeFile__block_invoke_2;
  v8[3] = &unk_264DC7D60;
  long long v9 = *(_OWORD *)(a1 + 32);
  [v3 removeItem:v4 from:v5 named:v6 usingFlags:0 requestID:-1 reply:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __31__LiveFSAppleDouble_removeFile__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__LiveFSAppleDouble_removeFile__block_invoke_2_cold_1();
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

- (int)renameFileToDirectory:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  if (self->_purpose == 2)
  {
    int v8 = [(LiveFSAppleDouble *)self fileHandle];

    if (v8)
    {
      long long v9 = [(LiveFSAppleDouble *)self manager];
      unsigned int v10 = [v9 AppleDoubleNameForFileNamed:v7];

      uint64_t v11 = [(LiveFSAppleDouble *)self manager];
      int v12 = [v11 queue];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke;
      v17[3] = &unk_264DC8198;
      v17[4] = self;
      id v18 = v6;
      id v13 = v10;
      id v19 = v13;
      int v20 = &v21;
      dispatch_sync(v12, v17);

      int v14 = livefs_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSAppleDouble renameFileToDirectory:andName:]();
      }

      self->_int purpose = 666;
      int v15 = *((_DWORD *)v22 + 6);
    }
    else
    {
      int v15 = 0;
    }
  }
  else
  {
    int v15 = 1;
  }
  _Block_object_dispose(&v21, 8);

  return v15;
}

intptr_t __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) parentDirHandle];
  int v5 = [*(id *)(a1 + 32) fileName];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke_2;
  v10[3] = &unk_264DC8170;
  uint64_t v8 = *(void *)(a1 + 56);
  v10[4] = *(void *)(a1 + 32);
  v10[5] = v8;
  [v3 renameItemIn:v4 named:v5 toDirectory:v6 newName:v7 usingFlags:0 requestID:-1 reply:v10];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__LiveFSAppleDouble_renameFileToDirectory_andName___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

- (int)linkFileToDirectory:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (self->_purpose == 2)
  {
    uint64_t v8 = [(LiveFSAppleDouble *)self fileHandle];

    if (v8)
    {
      long long v9 = [(LiveFSAppleDouble *)self manager];
      unsigned int v10 = [v9 AppleDoubleNameForFileNamed:v7];

      uint64_t v11 = [(LiveFSAppleDouble *)self manager];
      int v12 = [v11 queue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke;
      v15[3] = &unk_264DC8198;
      v15[4] = self;
      id v13 = v10;
      id v16 = v13;
      id v17 = v6;
      id v18 = &v19;
      dispatch_sync(v12, v15);

      uint64_t v8 = livefs_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[LiveFSAppleDouble linkFileToDirectory:andName:]();
      }

      LODWORD(v8) = *((_DWORD *)v20 + 6);
    }
  }
  else
  {
    LODWORD(v8) = 1;
  }
  _Block_object_dispose(&v19, 8);

  return (int)v8;
}

intptr_t __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) manager];
  uint64_t v8 = [v7 clientID];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke_2;
  v11[3] = &unk_264DC81C0;
  uint64_t v9 = *(void *)(a1 + 56);
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v9;
  [v3 makeLinkOf:v4 named:v6 inDirectory:v5 andClient:v8 requestID:-1 reply:v11];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __49__LiveFSAppleDouble_linkFileToDirectory_andName___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

- (void)shiftDataDownAtOffset:(unsigned int)a3 lengh:(unsigned int)a4 howMuch:(unint64_t)a5
{
  uint64_t v8 = [MEMORY[0x263EFF990] dataWithLength:4096];
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  if (a4)
  {
    if (a5)
    {
      unsigned int v9 = a3 + a4 - 4096;
      if (v9 >= a3)
      {
        id v17 = v20;
        int v10 = 4096;
        do
        {
          uint64_t v11 = [(LiveFSAppleDouble *)self manager];
          int v12 = [v11 queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke;
          block[3] = &unk_264DC8210;
          int v29 = v10;
          unsigned int v30 = v9;
          block[4] = self;
          long long v28 = &v31;
          id v13 = v8;
          id v27 = v13;
          dispatch_sync(v12, block);

          if (*((_DWORD *)v32 + 6))
          {
            int v14 = 2;
          }
          else
          {
            int v15 = [(LiveFSAppleDouble *)self manager];
            id v16 = [v15 queue];
            v19[0] = MEMORY[0x263EF8330];
            v19[1] = 3221225472;
            v20[0] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_3;
            v20[1] = &unk_264DC8260;
            unsigned int v24 = v9;
            v20[2] = self;
            unint64_t v23 = a5;
            id v21 = v13;
            int v22 = &v31;
            int v25 = v10;
            dispatch_sync(v16, v19);

            if (*((_DWORD *)v32 + 6) || v9 - v10 < a3 && (int v10 = a3 - v9, a3 == v9)) {
              int v14 = 2;
            }
            else {
              int v14 = 0;
            }
          }
          if (v14) {
            break;
          }
          v9 -= v10;
        }
        while (v9 >= a3);
      }
    }
  }
  _Block_object_dispose(&v31, 8);
}

void __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  uint64_t v6 = *(unsigned int *)(a1 + 60);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_2;
  v10[3] = &unk_264DC81E8;
  id v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v3 readFrom:v4 length:v5 atOffset:v6 requestID:-1 reply:v10];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "setData:");
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 336);

  return dispatch_semaphore_signal(v4);
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(void *)(a1 + 56) + *(unsigned int *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_4;
  v9[3] = &unk_264DC8238;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 68);
  void v9[4] = *(void *)(a1 + 32);
  v9[5] = v7;
  [v3 writeTo:v4 atOffset:v5 fromBuffer:v6 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __57__LiveFSAppleDouble_shiftDataDownAtOffset_lengh_howMuch___block_invoke_4(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(_DWORD *)(v3 + 24) && *(_DWORD *)(a1 + 48) != a3) {
    *(_DWORD *)(v3 + 24) = 5;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336));
}

- (void)shiftDataUp:(int64_t)a3 length:(unint64_t)a4 howMuch:(unint64_t)a5
{
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  if (a5 >= 0x1000) {
    unint64_t v8 = 4096;
  }
  else {
    unint64_t v8 = a5;
  }
  uint64_t v9 = [MEMORY[0x263EFF990] dataWithCapacity:v8];
  int64_t v10 = a4 + a3;
  if ((uint64_t)(a4 + a3) > a3)
  {
    id v17 = v20;
    do
    {
      id v11 = [(LiveFSAppleDouble *)self manager];
      uint64_t v12 = [v11 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke;
      block[3] = &unk_264DC8288;
      unint64_t v29 = v8;
      int64_t v30 = a3;
      block[4] = self;
      long long v28 = &v31;
      id v13 = v9;
      id v27 = v13;
      dispatch_sync(v12, block);

      if (*((_DWORD *)v32 + 6))
      {
        int v14 = 2;
      }
      else
      {
        int v15 = [(LiveFSAppleDouble *)self manager];
        id v16 = [v15 queue];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v20[0] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_3;
        v20[1] = &unk_264DC82B0;
        v20[2] = self;
        int64_t v23 = a3;
        unint64_t v24 = a5;
        id v21 = v13;
        int v22 = &v31;
        unint64_t v25 = v8;
        dispatch_sync(v16, v19);

        if (*((_DWORD *)v32 + 6) || v8 + a3 > v10 && (unint64_t v8 = v10 - a3, v10 == a3)) {
          int v14 = 2;
        }
        else {
          int v14 = 0;
        }
      }
      if (v14) {
        break;
      }
      a3 += v8;
    }
    while (a3 < v10);
  }
  _Block_object_dispose(&v31, 8);
}

void __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_2;
  v10[3] = &unk_264DC81E8;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  [v3 readFrom:v4 length:v5 atOffset:v6 requestID:-1 reply:v10];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "setData:");
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 336);

  return dispatch_semaphore_signal(v4);
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 mount];
  uint64_t v4 = [*(id *)(a1 + 32) fileHandle];
  uint64_t v5 = *(void *)(a1 + 56) - *(void *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_4;
  v9[3] = &unk_264DC8080;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  v9[5] = *(void *)(a1 + 48);
  void v9[6] = v7;
  void v9[4] = *(void *)(a1 + 32);
  [v3 writeTo:v4 atOffset:v5 fromBuffer:v6 requestID:-1 reply:v9];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 336), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__LiveFSAppleDouble_shiftDataUp_length_howMuch___block_invoke_4(void *a1, int a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1[5] + 8);
  if (!*(_DWORD *)(v3 + 24) && a1[6] != a3) {
    *(_DWORD *)(v3 + 24) = 5;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 336));
}

- (LiveFSAppleDoubleManager)manager
{
  return (LiveFSAppleDoubleManager *)objc_getProperty(self, a2, 304, 1);
}

- (void)setManager:(id)a3
{
}

- (NSString)parentDirHandle
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setParentDirHandle:(id)a3
{
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileHandle
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (OS_dispatch_semaphore)syncSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSyncSem:(id)a3
{
}

- (int)purpose
{
  return self->_purpose;
}

- (int)ADFileErr
{
  return self->_ADFileErr;
}

- (NSString)baseFileHandle
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBaseFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFileHandle, 0);
  objc_storeStrong((id *)&self->syncSem, 0);
  objc_storeStrong((id *)&self->fileHandle, 0);
  objc_storeStrong((id *)&self->fileName, 0);
  objc_storeStrong((id *)&self->parentDirHandle, 0);
  objc_storeStrong((id *)&self->manager, 0);

  objc_storeStrong((id *)&self->_ADHeaderBuffer, 0);
}

- (void)createFile
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "AD:createFile:finish:error getting attrs:%d", v2, v3, v4, v5, v6);
}

- (void)openFile
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "AD:openfile:finish:%d", v2, v3, v4, v5, v6);
}

- (void)loadADHeader
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  int v3 = 134217984;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_8(&dword_23AB0B000, v1, v2, "LFSAD: loadADHeader: successfully read apple double file: %zu", (uint8_t *)&v3);
}

- (void)setValue:forXattrNamed:how:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "setValue:forXattrNamed:how: error writing final xattr info: %d", v2, v3, v4, v5, v6);
}

- (void)setValue:forXattrNamed:how:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "setValue:forXattrNamed:how: error writing value: %d", v2, v3, v4, v5, v6);
}

- (void)setValue:forXattrNamed:how:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "setValue:forXattrNamed:how: error truncating: %d", v2, v3, v4, v5, v6);
}

- (void)setValue:forXattrNamed:how:.cold.4()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "setValue:forXattrNamed:how: error writing out header: %d", v2, v3, v4, v5, v6);
}

- (void)setValue:forXattrNamed:how:.cold.5()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "setValue:forXattrNamed:how: error replaceing xattr: %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrNamed: return %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "removeXattrNamed: return %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: updated ctime/mtime on the base file", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.4()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrName: Remove finished with - %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.5()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "removeXattrNamed: removing AppleDouble file: %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.6()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: did not find matching xattr, bailing", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.7()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrName: Success at removing an attr![%d]", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.8()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "removeXattrNamed: failed to write updated xattr info: %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.9()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: adjusted all offsets.", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.10()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: removed data for xattr.", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.11()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: compacted the entries", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.12()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrName: splitData: %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.13()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrName: Found entry to delete with lastOne: %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.14()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: about to itterate over all XATTRS", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.15()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: Not removing resource fork", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.16()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AB0B000, v0, v1, "removeXattrName: Not removing finderinfo", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.17()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "removeXattrName: Total number of attrs in the file - %d", v2, v3, v4, v5, v6);
}

- (void)removeXattrNamed:.cold.18()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_23AB0B000, v0, v1, "removeXattrName: removing xattr - %@", v2);
}

- (void)removeFile
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_23AB0B000, v0, v1, "removeFile: Start on %s", v2, v3, v4, v5, v6);
}

void __31__LiveFSAppleDouble_removeFile__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_23AB0B000, v0, v1, "removeFile: removed on %s", v2, v3, v4, v5, v6);
}

- (void)renameFileToDirectory:andName:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "renameFile: Rename finished with - %d", v2, v3, v4, v5, v6);
}

- (void)linkFileToDirectory:andName:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_23AB0B000, v0, v1, "renameFile: Link finished with - %d", v2, v3, v4, v5, v6);
}

@end