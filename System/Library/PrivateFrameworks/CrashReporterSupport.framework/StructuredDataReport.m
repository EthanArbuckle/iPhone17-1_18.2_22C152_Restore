@interface StructuredDataReport
- (BOOL)isActionable;
- (StructuredDataReport)initWithType:(int)a3 withFile:(id)a4;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)generateCustomLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
@end

@implementation StructuredDataReport

- (StructuredDataReport)initWithType:(int)a3 withFile:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)StructuredDataReport;
  v6 = [(OSAReport *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_log_type = a3;
    v6->_raw_logfile = (NSString *)a4;
    *(CFAbsoluteTime *)((char *)&v7->super.super.isa + (int)*MEMORY[0x1E4F83970]) = CFAbsoluteTimeGetCurrent();
    [*(id *)((char *)&v7->super.super.isa + (int)*MEMORY[0x1E4F83978]) setObject:@"ips.synced" forKeyedSubscript:*MEMORY[0x1E4F839F0]];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)StructuredDataReport;
  [(StructuredDataReport *)&v3 dealloc];
}

- (id)problemType
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_log_type);
}

- (BOOL)isActionable
{
  return GetNameForLogType(self->_log_type) != 0;
}

- (id)appleCareDetails
{
  return 0;
}

- (id)reportNamePrefix
{
  return GetNameForLogType(self->_log_type);
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
}

- (void)generateCustomLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = NSString;
  uint64_t v7 = OSADateFormat();
  uint64_t v8 = [(id)objc_msgSend(v6 stringWithFormat:@"Date:%@\nIncident ID:%@\n%@\n", v7, -[OSAReport incidentID](self, "incidentID"), GetDeviceConfig()), "dataUsingEncoding:allowLossyConversion:", 4, 1];
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v8);
  objc_super v9 = fopen([(NSString *)self->_raw_logfile fileSystemRepresentation], "r");
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1CA58] dataWithLength:0x10000];
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        size_t v13 = fread((void *)[v12 mutableBytes], 1uLL, 0x10000uLL, v10);
        int v14 = ferror(v10);
        if (!v13) {
          break;
        }
        if (v14) {
          break;
        }
        [v12 setLength:v13];
        (*((void (**)(id, void *))a4 + 2))(a4, v12);
      }
      while (!feof(v10));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    raw_logfile = self->_raw_logfile;
    v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)buf = 138412546;
    v19 = raw_logfile;
    __int16 v20 = 2080;
    v21 = v17;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to open '%@': %s", buf, 0x16u);
  }
}

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke;
  v6[3] = &unk_1E5F05660;
  v6[4] = a4;
  v6[5] = &v7;
  [(StructuredDataReport *)self generateCustomLogAtLevel:a3 withBlock:v6];
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__StructuredDataReport_streamContentAtLevel_withBlock___block_invoke(uint64_t result, void *a2)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v2 = result;
    result = [a2 length];
    if (result)
    {
      result = (*(uint64_t (**)(void))(*(void *)(v2 + 32) + 16))();
      *(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

@end