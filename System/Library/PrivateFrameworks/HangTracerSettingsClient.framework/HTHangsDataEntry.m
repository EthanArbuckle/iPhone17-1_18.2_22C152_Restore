@interface HTHangsDataEntry
+ (id)sortedEntriesByFileType:(id)a3;
+ (id)sortedHangIDsByCreationDate:(id)a3;
- (BOOL)isBeingProcessed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLogFile;
- (HTHangsDataEntry)initWithPath:(id)a3 hangID:(id)a4 creationDate:(id)a5 duration:(double)a6 processBundleID:(id)a7 processPath:(id)a8 processRecord:(id)a9;
- (LSApplicationRecord)processRecord;
- (NSDate)creationDate;
- (NSString)displayName;
- (NSString)hangID;
- (NSString)path;
- (NSString)processBundleID;
- (NSString)processPath;
- (double)duration;
- (int64_t)durationLevel;
- (unint64_t)fileSize;
- (unint64_t)hash;
@end

@implementation HTHangsDataEntry

- (HTHangsDataEntry)initWithPath:(id)a3 hangID:(id)a4 creationDate:(id)a5 duration:(double)a6 processBundleID:(id)a7 processPath:(id)a8 processRecord:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v37.receiver = self;
  v37.super_class = (Class)HTHangsDataEntry;
  v22 = [(HTHangsDataEntry *)&v37 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    path = v22->_path;
    v22->_path = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    hangID = v22->_hangID;
    v22->_hangID = (NSString *)v25;

    objc_storeStrong((id *)&v22->_creationDate, a5);
    v22->_duration = a6;
    v27 = (void *)[v19 copy];
    v28 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v29 = [v27 stringByTrimmingCharactersInSet:v28];
    processBundleID = v22->_processBundleID;
    v22->_processBundleID = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    processPath = v22->_processPath;
    v22->_processPath = (NSString *)v31;

    objc_storeStrong((id *)&v22->_processRecord, a9);
    if ([(NSString *)v22->_path hasSuffix:@"ips"]) {
      char v33 = 1;
    }
    else {
      char v33 = [(NSString *)v22->_path hasSuffix:@"ips.synced"];
    }
    v22->_isLogFile = v33;
    v34 = v22->_path;
    if (v34) {
      BOOL v35 = [(NSString *)v34 length] == 0;
    }
    else {
      BOOL v35 = 1;
    }
    v22->_isBeingProcessed = v35;
  }

  return v22;
}

- (int64_t)durationLevel
{
  return HTLevelForHangDuration(self->_duration);
}

- (unint64_t)hash
{
  return [(NSString *)self->_hangID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HTHangsDataEntry *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSString *)v4->_hangID isEqual:self->_hangID];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSString)displayName
{
  if (displayName_onceToken != -1) {
    dispatch_once(&displayName_onceToken, &__block_literal_global_2);
  }
  processRecord = self->_processRecord;
  if (processRecord)
  {
    v4 = [(LSApplicationRecord *)processRecord localizedName];
  }
  else
  {
    v4 = 0;
  }
  char v5 = [v4 stringByTrimmingCharactersInSet:displayName_characterSet];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    v7 = [(NSString *)self->_processBundleID componentsSeparatedByString:@"."];
    uint64_t v8 = [v7 lastObject];

    v4 = (void *)v8;
  }
  v9 = [v4 stringByTrimmingCharactersInSet:displayName_characterSet];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v11 = [(NSString *)self->_processPath componentsSeparatedByString:@"/"];
    uint64_t v12 = [v11 lastObject];

    v4 = (void *)v12;
  }
  v13 = [v4 stringByTrimmingCharactersInSet:displayName_characterSet];
  if ([v13 length])
  {
    id v14 = v4;
  }
  else
  {
    HTUIPlaceholderUnknownProcess();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return (NSString *)v15;
}

void __31__HTHangsDataEntry_displayName__block_invoke()
{
  v0 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)displayName_characterSet;
  displayName_characterSet = v1;

  v3 = (void *)displayName_characterSet;
  id v4 = [MEMORY[0x263F08708] controlCharacterSet];
  [v3 formUnionWithCharacterSet:v4];
}

- (unint64_t)fileSize
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  path = self->_path;
  id v10 = 0;
  char v5 = [v3 attributesOfItemAtPath:path error:&v10];
  id v6 = v10;
  unint64_t v7 = [v5 fileSize];

  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (v8)
  {
    NSLog(&cfstr_UnableToRetrie.isa, self->_path, v6);
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)sortedHangIDsByCreationDate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allKeys];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HTHangsDataEntry_sortedHangIDsByCreationDate___block_invoke;
  v8[3] = &unk_265353F18;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 sortedArrayUsingComparator:v8];

  return v6;
}

uint64_t __48__HTHangsDataEntry_sortedHangIDsByCreationDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKeyedSubscript:a2];
  BOOL v8 = [v7 firstObject];

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v10 = [v9 firstObject];

  v11 = [v10 creationDate];
  uint64_t v12 = [v8 creationDate];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

+ (id)sortedEntriesByFileType:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_19];
}

uint64_t __44__HTHangsDataEntry_sortedEntriesByFileType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isLogFile];
  int v7 = [v5 isLogFile];
  if (v6 && v7)
  {
    BOOL v8 = NSURL;
    id v9 = [v4 path];
    id v10 = [v8 fileURLWithPath:v9 isDirectory:0];
    BOOL v11 = +[HTHangSymbolicator isLogFileSymbolicated:v10];

    if (v11)
    {
      uint64_t v12 = 1;
      goto LABEL_13;
    }
    id v14 = NSURL;
    v15 = [v5 path];
    id v16 = [v14 fileURLWithPath:v15 isDirectory:0];
    BOOL v17 = +[HTHangSymbolicator isLogFileSymbolicated:v16];

    if (v17)
    {
      uint64_t v12 = -1;
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  char v13 = v6 | v7;
  if (v6) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = 1;
  }
  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:

  return v12;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)hangID
{
  return self->_hangID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)processBundleID
{
  return self->_processBundleID;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (LSApplicationRecord)processRecord
{
  return self->_processRecord;
}

- (BOOL)isLogFile
{
  return self->_isLogFile;
}

- (BOOL)isBeingProcessed
{
  return self->_isBeingProcessed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processRecord, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_processBundleID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_hangID, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end