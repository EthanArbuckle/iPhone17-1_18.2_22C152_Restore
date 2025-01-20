@interface BKCatacomb
+ (id)catacombWithDir:(id)a3;
- (BKCatacomb)init;
- (NSString)catacombDir;
- (id)catacombCommitDir;
- (id)catacombPrepareDir;
- (id)content;
- (int)commitWrite;
- (int)deleteAll;
- (int)deleteFile:(id)a3;
- (int)readData:(id *)a3 fromFile:(id)a4;
- (int)readData:(id *)a3 fromFile:(id)a4 logString:(id *)a5;
- (int)recover;
- (int)syncDir:(id)a3;
- (int)writeData:(id)a3 toFile:(id)a4;
@end

@implementation BKCatacomb

- (BKCatacomb)init
{
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)BKCatacomb;
  v2 = [(BKCatacomb *)&v8 init];
  v3 = v2;
  if (v2)
  {
    catacombDir = v2->_catacombDir;
    v2->_catacombDir = (NSString *)@"/Library/Catacomb/";

    uint64_t v9 = *MEMORY[0x263F080A8];
    v10[0] = *MEMORY[0x263F08098];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    writeAttributes = v3->_writeAttributes;
    v3->_writeAttributes = (NSDictionary *)v5;
  }
  return v3;
}

+ (id)catacombWithDir:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BKCatacomb);
  if (v4)
  {
    uint64_t v5 = [[NSString alloc] initWithString:v3];
    catacombDir = v4->_catacombDir;
    v4->_catacombDir = (NSString *)v5;
  }
  return v4;
}

- (id)catacombPrepareDir
{
  return [(NSString *)self->_catacombDir stringByAppendingPathComponent:@"prepare/"];
}

- (id)catacombCommitDir
{
  return [(NSString *)self->_catacombDir stringByAppendingPathComponent:@"commit/"];
}

- (int)syncDir:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    int v5 = open((const char *)[v3 UTF8String], 0x100000);
    if (v5 == -1)
    {
      if (__osLog) {
        v10 = __osLog;
      }
      else {
        v10 = &_os_log_internal;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        v13 = "dirfd != -1";
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        __int16 v16 = 2080;
        v17 = &unk_22004A573;
        __int16 v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v20 = 1024;
        int v21 = 75;
        _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
      }
      int v7 = 5;
    }
    else
    {
      int v6 = v5;
      int v7 = fcntl(v5, 51);
      if (v7)
      {
        if (__osLog) {
          v11 = __osLog;
        }
        else {
          v11 = &_os_log_internal;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316162;
          v13 = "err == 0 ";
          __int16 v14 = 2048;
          uint64_t v15 = v7;
          __int16 v16 = 2080;
          v17 = &unk_22004A573;
          __int16 v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
          __int16 v20 = 1024;
          int v21 = 78;
          _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }
      }
      close(v6);
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      v13 = "dir";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = &unk_22004A573;
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v20 = 1024;
      int v21 = 72;
      _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    int v7 = 22;
  }

  return v7;
}

- (int)writeData:(id)a3 toFile:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!v6)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316162;
    v38 = "data";
    __int16 v39 = 2048;
    uint64_t v40 = 0;
    __int16 v41 = 2080;
    v42 = &unk_22004A573;
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v45 = 1024;
    int v46 = 97;
    goto LABEL_24;
  }
  if (!v7)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316162;
    v38 = "fileName";
    __int16 v39 = 2048;
    uint64_t v40 = 0;
    __int16 v41 = 2080;
    v42 = &unk_22004A573;
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v45 = 1024;
    int v46 = 98;
LABEL_24:
    _os_log_impl(&dword_21FFF3000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_25:
    uint64_t v22 = 0;
    __int16 v18 = 0;
    int v12 = 0;
    id v17 = 0;
    int v23 = 22;
    goto LABEL_77;
  }
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [(BKCatacomb *)self catacombCommitDir];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    if (__osLog) {
      v26 = __osLog;
    }
    else {
      v26 = &_os_log_internal;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
      __int16 v39 = 2048;
      uint64_t v40 = 0;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 100;
      _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v22 = 0;
    __int16 v18 = 0;
    int v12 = 0;
    id v17 = 0;
    int v23 = 1;
    goto LABEL_77;
  }
  int v12 = [(BKCatacomb *)self catacombPrepareDir];
  if (!v12)
  {
    if (__osLog) {
      v27 = __osLog;
    }
    else {
      v27 = &_os_log_internal;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "prepareDir";
      __int16 v39 = 2048;
      uint64_t v40 = 0;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 103;
      _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v22 = 0;
    __int16 v18 = 0;
    int v12 = 0;
    goto LABEL_44;
  }
  v13 = [MEMORY[0x263F08850] defaultManager];
  char v14 = [v13 fileExistsAtPath:v12];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
    writeAttributes = self->_writeAttributes;
    id v36 = 0;
    [v15 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:writeAttributes error:&v36];
    id v17 = v36;

    if (v17)
    {
      if (__osLog) {
        v32 = __osLog;
      }
      else {
        v32 = &_os_log_internal;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v38 = "!nserr";
        __int16 v39 = 2048;
        uint64_t v40 = 0;
        __int16 v41 = 2080;
        v42 = &unk_22004A573;
        __int16 v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v45 = 1024;
        int v46 = 109;
        _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v22 = 0;
      __int16 v18 = 0;
      goto LABEL_76;
    }
  }
  __int16 v18 = [v12 stringByAppendingPathComponent:v8];
  if (!v18)
  {
    if (__osLog) {
      v28 = __osLog;
    }
    else {
      v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "fullPath";
      __int16 v39 = 2048;
      uint64_t v40 = 0;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 113;
      _os_log_impl(&dword_21FFF3000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v22 = 0;
    __int16 v18 = 0;
LABEL_44:
    id v17 = 0;
    int v23 = 12;
    goto LABEL_77;
  }
  v19 = [MEMORY[0x263F08850] defaultManager];
  char v20 = [v19 createFileAtPath:v18 contents:0 attributes:self->_writeAttributes];

  if ((v20 & 1) == 0)
  {
    if (__osLog) {
      v29 = __osLog;
    }
    else {
      v29 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136316162;
    v38 = "[[NSFileManager defaultManager] createFileAtPath:fullPath contents:((void *)0) attributes:_writeAttributes]";
    __int16 v39 = 2048;
    uint64_t v40 = 0;
    __int16 v41 = 2080;
    v42 = &unk_22004A573;
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v45 = 1024;
    int v46 = 116;
    goto LABEL_55;
  }
  int v21 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v18];
  uint64_t v22 = v21;
  if (!v21)
  {
    if (__osLog) {
      v29 = __osLog;
    }
    else {
      v29 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136316162;
    v38 = "file";
    __int16 v39 = 2048;
    uint64_t v40 = 0;
    __int16 v41 = 2080;
    v42 = &unk_22004A573;
    __int16 v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v45 = 1024;
    int v46 = 119;
LABEL_55:
    _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_56:
    uint64_t v22 = 0;
    id v17 = 0;
LABEL_76:
    int v23 = 5;
    goto LABEL_77;
  }
  [v21 writeData:v6];
  int v23 = fcntl([v22 fileDescriptor], 51);
  if (v23)
  {
    if (__osLog) {
      v30 = __osLog;
    }
    else {
      v30 = &_os_log_internal;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      __int16 v39 = 2048;
      uint64_t v40 = v23;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 136;
      _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    [v22 closeFile];
  }
  else
  {
    [v22 closeFile];

    int v23 = [(BKCatacomb *)self syncDir:v12];
    if (!v23)
    {
      uint64_t v22 = 0;
      id v17 = 0;
      goto LABEL_13;
    }
    if (__osLog) {
      v31 = __osLog;
    }
    else {
      v31 = &_os_log_internal;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      __int16 v39 = 2048;
      uint64_t v40 = v23;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 143;
      _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v22 = 0;
  }
  id v17 = 0;
LABEL_77:
  int v33 = [(BKCatacomb *)self recover];
  if (v33)
  {
    int v34 = v33;
    if (__osLog) {
      v35 = __osLog;
    }
    else {
      v35 = &_os_log_internal;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "[self recover] == 0 ";
      __int16 v39 = 2048;
      uint64_t v40 = v34;
      __int16 v41 = 2080;
      v42 = &unk_22004A573;
      __int16 v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v45 = 1024;
      int v46 = 152;
      _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_13:

  return v23;
}

- (int)commitWrite
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = [(BKCatacomb *)self catacombPrepareDir];
  if (!v3)
  {
    if (__osLog) {
      v32 = __osLog;
    }
    else {
      v32 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "prepareDir";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 167;
    goto LABEL_43;
  }
  uint64_t v4 = [(BKCatacomb *)self catacombCommitDir];
  if (!v4)
  {
    if (__osLog) {
      v32 = __osLog;
    }
    else {
      v32 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "commitDir";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 170;
LABEL_43:
    _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_44:
    int v29 = 12;
    goto LABEL_32;
  }
  int v5 = (void *)v4;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    if (__osLog) {
      int v33 = __osLog;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "![[NSFileManager defaultManager] fileExistsAtPath:commitDir]";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 172;
    goto LABEL_55;
  }
  objc_super v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v3];

  if ((v9 & 1) == 0)
  {
    if (__osLog) {
      int v33 = __osLog;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "[[NSFileManager defaultManager] fileExistsAtPath:prepareDir]";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 173;
LABEL_55:
    _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_56:

    int v29 = 1;
    goto LABEL_32;
  }
  v10 = [MEMORY[0x263F08850] defaultManager];
  id v46 = 0;
  [v10 moveItemAtPath:v3 toPath:v5 error:&v46];
  id v11 = v46;

  if (v11)
  {
    if (__osLog) {
      int v34 = __osLog;
    }
    else {
      int v34 = &_os_log_internal;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v49 = "!nserr";
      __int16 v50 = 2048;
      uint64_t v51 = 0;
      __int16 v52 = 2080;
      v53 = &unk_22004A573;
      __int16 v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v56 = 1024;
      int v57 = 177;
      _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    goto LABEL_31;
  }
  int v12 = [MEMORY[0x263F08850] defaultManager];
  id v45 = 0;
  id v13 = [v12 contentsOfDirectoryAtPath:v5 error:&v45];
  id v14 = v45;

  if (v14)
  {
    if (__osLog) {
      v35 = __osLog;
    }
    else {
      v35 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "!nserr";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 181;
    goto LABEL_73;
  }
  id v36 = v3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = v13;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v15) {
    goto LABEL_17;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v42;
  id obj = v13;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      char v20 = v5;
      int v21 = [v5 stringByAppendingPathComponent:v19];
      uint64_t v22 = [(NSString *)self->_catacombDir stringByAppendingPathComponent:v19];
      int v23 = [MEMORY[0x263F08850] defaultManager];
      int v24 = [v23 fileExistsAtPath:v22];

      if (v24)
      {
        v25 = [MEMORY[0x263F08850] defaultManager];
        id v40 = 0;
        [v25 removeItemAtPath:v22 error:&v40];
        id v26 = v40;

        if (v26)
        {
          if (__osLog) {
            v30 = __osLog;
          }
          else {
            v30 = &_os_log_internal;
          }
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
          *(_DWORD *)buf = 136316162;
          v49 = "!nserr";
          __int16 v50 = 2048;
          uint64_t v51 = 0;
          __int16 v52 = 2080;
          v53 = &unk_22004A573;
          __int16 v54 = 2080;
          v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
          __int16 v56 = 1024;
          int v57 = 193;
          goto LABEL_29;
        }
      }
      v27 = [MEMORY[0x263F08850] defaultManager];
      id v39 = 0;
      [v27 moveItemAtPath:v21 toPath:v22 error:&v39];
      id v26 = v39;

      if (v26)
      {
        if (__osLog) {
          v30 = __osLog;
        }
        else {
          v30 = &_os_log_internal;
        }
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136316162;
        v49 = "!nserr";
        __int16 v50 = 2048;
        uint64_t v51 = 0;
        __int16 v52 = 2080;
        v53 = &unk_22004A573;
        __int16 v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v56 = 1024;
        int v57 = 197;
LABEL_29:
        _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_30:
        id v3 = v36;

        goto LABEL_31;
      }

      int v5 = v20;
    }
    id v13 = obj;
    uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_17:

  v28 = [MEMORY[0x263F08850] defaultManager];
  id v38 = 0;
  [v28 removeItemAtPath:v5 error:&v38];
  id v14 = v38;

  if (v14)
  {
    if (__osLog) {
      v35 = __osLog;
    }
    else {
      v35 = &_os_log_internal;
    }
    id v3 = v36;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136316162;
    v49 = "!nserr";
    __int16 v50 = 2048;
    uint64_t v51 = 0;
    __int16 v52 = 2080;
    v53 = &unk_22004A573;
    __int16 v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v56 = 1024;
    int v57 = 202;
LABEL_73:
    _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_74:

LABEL_31:
    int v29 = 5;
    goto LABEL_32;
  }
  [(BKCatacomb *)self syncDir:self->_catacombDir];

  int v29 = 0;
  id v3 = v36;
LABEL_32:

  return v29;
}

- (int)readData:(id *)a3 fromFile:(id)a4 logString:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v9 = v8;
  if (!a3)
  {
    if (__osLog) {
      id v36 = __osLog;
    }
    else {
      id v36 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    long long v42 = "data";
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2080;
    id v46 = &unk_22004A573;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v49 = 1024;
    int v50 = 218;
    goto LABEL_47;
  }
  if (!v8)
  {
    if (__osLog) {
      id v36 = __osLog;
    }
    else {
      id v36 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    long long v42 = "fileName";
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2080;
    id v46 = &unk_22004A573;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v49 = 1024;
    int v50 = 219;
LABEL_47:
    _os_log_impl(&dword_21FFF3000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    id v26 = 0;
    id v27 = 0;
    uint64_t v22 = 0;
    uint64_t v17 = 0;
    int v28 = 22;
    goto LABEL_34;
  }
  v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [(BKCatacomb *)self catacombCommitDir];
  int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    if (__osLog) {
      v37 = __osLog;
    }
    else {
      v37 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    long long v42 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2080;
    id v46 = &unk_22004A573;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v49 = 1024;
    int v50 = 221;
    goto LABEL_59;
  }
  id v13 = [MEMORY[0x263F08850] defaultManager];
  id v14 = [(BKCatacomb *)self catacombPrepareDir];
  int v15 = [v13 fileExistsAtPath:v14];

  if (v15)
  {
    if (__osLog) {
      v37 = __osLog;
    }
    else {
      v37 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    long long v42 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombPrepareDir]]";
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2080;
    id v46 = &unk_22004A573;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v49 = 1024;
    int v50 = 222;
LABEL_59:
    _os_log_impl(&dword_21FFF3000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_60:
    id v26 = 0;
    id v27 = 0;
    uint64_t v22 = 0;
    uint64_t v17 = 0;
    int v28 = 1;
    goto LABEL_34;
  }
  uint64_t v16 = [(NSString *)self->_catacombDir stringByAppendingPathComponent:v9];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    __int16 v18 = [MEMORY[0x263F08850] defaultManager];
    int v19 = [v18 fileExistsAtPath:v17];

    if (!v19)
    {
      int v24 = [MEMORY[0x263EFF8F8] data];
      id v26 = [NSString stringWithFormat:@"File '%@' doesn't exist", v17];
      uint64_t v22 = 0;
      goto LABEL_11;
    }
    char v20 = (void *)MEMORY[0x263F08840];
    int v21 = [NSURL fileURLWithPath:v17];
    id v40 = 0;
    uint64_t v22 = [v20 fileHandleForReadingFromURL:v21 error:&v40];
    id v23 = v40;

    if (v22)
    {
      id v39 = 0;
      int v24 = [v22 readDataToEndOfFileAndReturnError:&v39];
      id v25 = v39;

      if (v24)
      {

        id v26 = @"Succeeded";
LABEL_11:
        id v27 = v24;
        int v28 = 0;
        *a3 = v27;
        goto LABEL_34;
      }
      id v26 = [NSString stringWithFormat:@"readDataToEndOfFileAndReturnError(file:'%@'): -> %@", v17, v25];
      v32 = &_os_log_internal;
      if (__osLog) {
        int v33 = __osLog;
      }
      else {
        int v33 = &_os_log_internal;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        long long v42 = (const char *)v26;
        _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "%{public}@\n", buf, 0xCu);
      }
      if (__osLog) {
        int v34 = __osLog;
      }
      else {
        int v34 = v32;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        long long v42 = "0";
        __int16 v43 = 2048;
        uint64_t v44 = 0;
        __int16 v45 = 2080;
        id v46 = &unk_22004A573;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v49 = 1024;
        int v50 = 243;
        _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v23 = v25;
    }
    else
    {
      id v26 = [NSString stringWithFormat:@"fileHandleForReadingFromURL(file:'%@'): -> %@", v17, v23];
      int v29 = &_os_log_internal;
      if (__osLog) {
        v30 = __osLog;
      }
      else {
        v30 = &_os_log_internal;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        long long v42 = (const char *)v26;
        _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "%{public}@\n", buf, 0xCu);
      }
      if (__osLog) {
        v31 = __osLog;
      }
      else {
        v31 = v29;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        long long v42 = "0";
        __int16 v43 = 2048;
        uint64_t v44 = 0;
        __int16 v45 = 2080;
        id v46 = &unk_22004A573;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v49 = 1024;
        int v50 = 235;
        _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }

    id v27 = 0;
    int v28 = 5;
  }
  else
  {
    if (__osLog) {
      id v38 = __osLog;
    }
    else {
      id v38 = &_os_log_internal;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      long long v42 = "fullPath";
      __int16 v43 = 2048;
      uint64_t v44 = 0;
      __int16 v45 = 2080;
      id v46 = &unk_22004A573;
      __int16 v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v49 = 1024;
      int v50 = 225;
      _os_log_impl(&dword_21FFF3000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v26 = 0;
    id v27 = 0;
    uint64_t v22 = 0;
    uint64_t v17 = 0;
    int v28 = 12;
  }
LABEL_34:
  if (a5) {
    *a5 = v26;
  }

  return v28;
}

- (int)readData:(id *)a3 fromFile:(id)a4
{
  return [(BKCatacomb *)self readData:a3 fromFile:a4 logString:0];
}

- (int)deleteFile:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [(BKCatacomb *)self catacombCommitDir];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136316162;
      id v23 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      id v27 = &unk_22004A573;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v30 = 1024;
      int v31 = 277;
    }
    else
    {
      id v8 = [MEMORY[0x263F08850] defaultManager];
      int v9 = [(BKCatacomb *)self catacombPrepareDir];
      int v10 = [v8 fileExistsAtPath:v9];

      if (!v10)
      {
        uint64_t v11 = [(NSString *)self->_catacombDir stringByAppendingPathComponent:v4];
        if (v11)
        {
          int v12 = (void *)v11;
          id v13 = [MEMORY[0x263F08850] defaultManager];
          id v21 = 0;
          [v13 removeItemAtPath:v12 error:&v21];
          id v14 = v21;

          if (v14)
          {
            if (__osLog) {
              char v20 = __osLog;
            }
            else {
              char v20 = &_os_log_internal;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              id v23 = "!nserr";
              __int16 v24 = 2048;
              uint64_t v25 = 0;
              __int16 v26 = 2080;
              id v27 = &unk_22004A573;
              __int16 v28 = 2080;
              int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
              __int16 v30 = 1024;
              int v31 = 284;
              _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }

            int v15 = 5;
          }
          else
          {
            [(BKCatacomb *)self syncDir:self->_catacombDir];

            int v15 = 0;
          }
        }
        else
        {
          if (__osLog) {
            int v19 = __osLog;
          }
          else {
            int v19 = &_os_log_internal;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            id v23 = "fullPath";
            __int16 v24 = 2048;
            uint64_t v25 = 0;
            __int16 v26 = 2080;
            id v27 = &unk_22004A573;
            __int16 v28 = 2080;
            int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            __int16 v30 = 1024;
            int v31 = 281;
            _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          int v15 = 12;
        }
        goto LABEL_7;
      }
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        int v15 = 1;
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136316162;
      id v23 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombPrepareDir]]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      id v27 = &unk_22004A573;
      __int16 v28 = 2080;
      int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v30 = 1024;
      int v31 = 278;
    }
    _os_log_impl(&dword_21FFF3000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_25;
  }
  if (__osLog) {
    uint64_t v17 = __osLog;
  }
  else {
    uint64_t v17 = &_os_log_internal;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    id v23 = "fileName";
    __int16 v24 = 2048;
    uint64_t v25 = 0;
    __int16 v26 = 2080;
    id v27 = &unk_22004A573;
    __int16 v28 = 2080;
    int v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v30 = 1024;
    int v31 = 275;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  int v15 = 22;
LABEL_7:

  return v15;
}

- (int)recover
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = [(BKCatacomb *)self catacombPrepareDir];
  if (!v3)
  {
    if (__osLog) {
      int v33 = __osLog;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    int v50 = "prepareDir";
    __int16 v51 = 2048;
    uint64_t v52 = 0;
    __int16 v53 = 2080;
    __int16 v54 = &unk_22004A573;
    __int16 v55 = 2080;
    __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v57 = 1024;
    int v58 = 302;
    goto LABEL_47;
  }
  uint64_t v4 = [(BKCatacomb *)self catacombCommitDir];
  if (!v4)
  {
    if (__osLog) {
      int v33 = __osLog;
    }
    else {
      int v33 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    int v50 = "commitDir";
    __int16 v51 = 2048;
    uint64_t v52 = 0;
    __int16 v53 = 2080;
    __int16 v54 = &unk_22004A573;
    __int16 v55 = 2080;
    __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v57 = 1024;
    int v58 = 305;
LABEL_47:
    _os_log_impl(&dword_21FFF3000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    int v5 = 0;
    id v9 = 0;
    int v28 = 12;
    goto LABEL_22;
  }
  int v5 = (void *)v4;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v3];

  if (v7)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v47 = 0;
    [v8 removeItemAtPath:v3 error:&v47];
    id v9 = v47;

    if (v9)
    {
      if (__osLog) {
        int v34 = __osLog;
      }
      else {
        int v34 = &_os_log_internal;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v50 = "!nserr";
        __int16 v51 = 2048;
        uint64_t v52 = 0;
        __int16 v53 = 2080;
        __int16 v54 = &unk_22004A573;
        __int16 v55 = 2080;
        __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v57 = 1024;
        int v58 = 311;
        _os_log_impl(&dword_21FFF3000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_36;
    }
  }
  int v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 fileExistsAtPath:v5];

  if (v11)
  {
    int v12 = [MEMORY[0x263F08850] defaultManager];
    id v46 = 0;
    id v13 = [v12 contentsOfDirectoryAtPath:v5 error:&v46];
    id v9 = v46;

    if (!v9)
    {
      v37 = v3;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v9 = v13;
      uint64_t v14 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (!v14) {
        goto LABEL_17;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v43;
      id obj = v9;
LABEL_9:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * v17);
        int v19 = v5;
        char v20 = [v5 stringByAppendingPathComponent:v18];
        id v21 = [(NSString *)self->_catacombDir stringByAppendingPathComponent:v18];
        uint64_t v22 = [MEMORY[0x263F08850] defaultManager];
        int v23 = [v22 fileExistsAtPath:v21];

        if (v23)
        {
          __int16 v24 = [MEMORY[0x263F08850] defaultManager];
          id v41 = 0;
          [v24 removeItemAtPath:v21 error:&v41];
          id v9 = v41;

          if (v9) {
            break;
          }
        }
        uint64_t v25 = [MEMORY[0x263F08850] defaultManager];
        id v40 = 0;
        [v25 moveItemAtPath:v20 toPath:v21 error:&v40];
        id v9 = v40;

        if (v9)
        {
          if (__osLog) {
            __int16 v30 = __osLog;
          }
          else {
            __int16 v30 = &_os_log_internal;
          }
          int v5 = v19;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            int v50 = "!nserr";
            __int16 v51 = 2048;
            uint64_t v52 = 0;
            __int16 v53 = 2080;
            __int16 v54 = &unk_22004A573;
            __int16 v55 = 2080;
            __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            __int16 v57 = 1024;
            int v58 = 336;
            _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          id v3 = v37;
          int v31 = obj;
LABEL_35:

          goto LABEL_36;
        }

        ++v17;
        int v5 = v19;
        if (v15 == v17)
        {
          id v9 = obj;
          uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
          if (v15) {
            goto LABEL_9;
          }
LABEL_17:

          __int16 v26 = [MEMORY[0x263F08850] defaultManager];
          id v39 = 0;
          [v26 removeItemAtPath:v5 error:&v39];
          id v27 = v39;

          if (!v27)
          {
            id v3 = v37;
            goto LABEL_20;
          }
          if (__osLog) {
            id v36 = __osLog;
          }
          else {
            id v36 = &_os_log_internal;
          }
          id v3 = v37;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            int v50 = "!nserr";
            __int16 v51 = 2048;
            uint64_t v52 = 0;
            __int16 v53 = 2080;
            __int16 v54 = &unk_22004A573;
            __int16 v55 = 2080;
            __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            __int16 v57 = 1024;
            int v58 = 341;
            _os_log_impl(&dword_21FFF3000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }

          int v28 = 5;
          id v9 = v27;
          goto LABEL_22;
        }
      }
      if (__osLog) {
        uint64_t v32 = __osLog;
      }
      else {
        uint64_t v32 = &_os_log_internal;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v50 = "!nserr";
        __int16 v51 = 2048;
        uint64_t v52 = 0;
        __int16 v53 = 2080;
        __int16 v54 = &unk_22004A573;
        __int16 v55 = 2080;
        __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        __int16 v57 = 1024;
        int v58 = 332;
        _os_log_impl(&dword_21FFF3000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      id v3 = v37;
      int v31 = obj;
      int v5 = v19;
      goto LABEL_35;
    }
    if (__osLog) {
      v35 = __osLog;
    }
    else {
      v35 = &_os_log_internal;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v50 = "!nserr";
      __int16 v51 = 2048;
      uint64_t v52 = 0;
      __int16 v53 = 2080;
      __int16 v54 = &unk_22004A573;
      __int16 v55 = 2080;
      __int16 v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      __int16 v57 = 1024;
      int v58 = 320;
      _os_log_impl(&dword_21FFF3000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_36:
    int v28 = 5;
    goto LABEL_22;
  }
  id v9 = 0;
  if (v7)
  {
LABEL_20:
    [(BKCatacomb *)self syncDir:self->_catacombDir];

    id v9 = 0;
  }
  int v28 = 0;
LABEL_22:

  return v28;
}

- (int)deleteAll
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:self->_catacombDir];

  if (!v4) {
    return 0;
  }
  int v5 = [MEMORY[0x263F08850] defaultManager];
  catacombDir = self->_catacombDir;
  id v10 = 0;
  [v5 removeItemAtPath:catacombDir error:&v10];
  id v7 = v10;

  if (!v7) {
    return 0;
  }
  if (__osLog) {
    id v9 = __osLog;
  }
  else {
    id v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    int v12 = "!nserr";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    uint64_t v16 = &unk_22004A573;
    __int16 v17 = 2080;
    uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    __int16 v19 = 1024;
    int v20 = 363;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }

  return 5;
}

- (id)content
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  catacombDir = self->_catacombDir;
  uint64_t v7 = 0;
  int v5 = [v3 contentsOfDirectoryAtPath:catacombDir error:&v7];

  return v5;
}

- (NSString)catacombDir
{
  return self->_catacombDir;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_catacombDir, 0);
}

@end