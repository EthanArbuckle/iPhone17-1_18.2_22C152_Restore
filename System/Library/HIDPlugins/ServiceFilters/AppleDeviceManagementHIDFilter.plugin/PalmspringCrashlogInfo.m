@interface PalmspringCrashlogInfo
+ (unsigned)maxInfoReportSize;
- (NSMutableArray)entries;
- (PalmspringCrashlogInfo)initWithData:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unsigned)version;
@end

@implementation PalmspringCrashlogInfo

+ (unsigned)maxInfoReportSize
{
  return 1029;
}

- (PalmspringCrashlogInfo)initWithData:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PalmspringCrashlogInfo;
  v6 = [(PalmspringCrashlogInfo *)&v28 init];
  if (!v6)
  {
LABEL_16:
    v25 = 0;
    goto LABEL_17;
  }
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  os_log_t v9 = os_log_create("com.apple.hid.AppleTopCase", (const char *)[v8 UTF8String]);
  log = v6->_log;
  v6->_log = (OS_os_log *)v9;

  v11 = v6->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_83E0(v11, a2);
  }
  if ((unint64_t)[v5 length] <= 4)
  {
    v12 = v6->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_8288(v12, v5);
    }
    goto LABEL_16;
  }
  id v13 = v5;
  v14 = (unsigned __int8 *)[v13 bytes];
  v15 = v6->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = v14[1];
    int v17 = v14[2];
    *(_DWORD *)buf = 67109376;
    int v30 = v16;
    __int16 v31 = 1024;
    int v32 = v17;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Crashlog info report header extracted: version %d, # of crashlogs %d", buf, 0xEu);
  }
  id v18 = (id)((32 * v14[2]) | 5);
  if ([v13 length] != v18)
  {
    v26 = v6->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_8330(v26, v13, (int)v18);
    }
    goto LABEL_16;
  }
  v6->_version = v14[1];
  v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  entries = v6->_entries;
  v6->_entries = v19;

  if (v14[2])
  {
    unint64_t v21 = 0;
    v22 = (char *)(v14 + 11);
    do
    {
      __strlcpy_chk();
      v23 = +[NSString stringWithCString:buf encoding:4];
      v24 = [[PalmspringCrashlogInfoEntry alloc] initWithUniqueID:*(v22 - 6) type:*(v22 - 5) headerAndRawBlobSize:*((unsigned int *)v22 - 1) name:v23];
      [(NSMutableArray *)v6->_entries addObject:v24];

      ++v21;
      v22 += 32;
    }
    while (v21 < v14[2]);
  }
  v25 = v6;
LABEL_17:

  return v25;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_entries countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end