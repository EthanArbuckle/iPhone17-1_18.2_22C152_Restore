@interface DATrafficLogger
+ (BOOL)enabled;
- (DATrafficLogger)initWithFilename:(id)a3;
- (NSString)filename;
- (void)_ensureCustomLogFile;
- (void)logSnippet:(id)a3;
- (void)setFilename:(id)a3;
- (void)slurpAndRemoveLookasideFile:(id)a3 prefixString:(id)a4 suffixString:(id)a5;
@end

@implementation DATrafficLogger

- (void)_ensureCustomLogFile
{
  if (_ensureCustomLogFile_once != -1) {
    dispatch_once(&_ensureCustomLogFile_once, &__block_literal_global_8);
  }
  v3 = [(DATrafficLogger *)self filename];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__DATrafficLogger__ensureCustomLogFile__block_invoke_2;
    block[3] = &unk_1E6570FC0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)_ensureCustomLogFile_logSetupQueue, block);
  }
}

void __39__DATrafficLogger__ensureCustomLogFile__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_ensureCustomLogFile_knownCustomNames;
  _ensureCustomLogFile_knownCustomNames = v0;

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.dataaccess.DATrafficQueue", v4);
  v3 = (void *)_ensureCustomLogFile_logSetupQueue;
  _ensureCustomLogFile_logSetupQueue = (uint64_t)v2;
}

void __39__DATrafficLogger__ensureCustomLogFile__block_invoke_2(uint64_t a1)
{
  v20[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ensureCustomLogFile_knownCustomNames;
  v3 = [*(id *)(a1 + 32) filename];
  LOBYTE(v2) = [(id)v2 containsObject:v3];

  if ((v2 & 1) == 0)
  {
    v4 = (void *)[&__block_literal_global_4 copy];
    v19[0] = *MEMORY[0x1E4F50E58];
    v20[0] = DACustomLogDirectory();
    v19[1] = *MEMORY[0x1E4F50E68];
    v5 = [*(id *)(a1 + 32) filename];
    uint64_t v6 = *MEMORY[0x1E4F50E70];
    v20[1] = v5;
    v20[2] = &unk_1F2322320;
    uint64_t v7 = *MEMORY[0x1E4F50E60];
    v19[2] = v6;
    v19[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4F50E80];
    uint64_t v9 = *MEMORY[0x1E4F1CFC8];
    v20[3] = @"DALogLevel";
    v20[4] = v9;
    uint64_t v10 = *MEMORY[0x1E4F50E50];
    v19[4] = v8;
    v19[5] = v10;
    v11 = (void *)MEMORY[0x1C87CCD40](v4);
    v20[5] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

    v13 = [MEMORY[0x1E4F50E38] DAManagedDefaultForKey:@"DALogLevel"];

    if (!v13)
    {
      if ([MEMORY[0x1E4F50E38] isAppleInternalInstall])
      {
        v14 = (void *)[v12 mutableCopy];
        [v14 setObject:&unk_1F2322338 forKeyedSubscript:*MEMORY[0x1E4F50E78]];

        v12 = v14;
      }
    }
    v15 = [*(id *)(a1 + 32) filename];
    v18 = v15;
    MEMORY[0x1C87CC740]([MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1], v12);

    v16 = (void *)_ensureCustomLogFile_knownCustomNames;
    v17 = [*(id *)(a1 + 32) filename];
    [v16 addObject:v17];
  }
}

CFStringRef __39__DATrafficLogger__ensureCustomLogFile__block_invoke_3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFStringRef theString)
{
  return CFStringCreateCopy(0, theString);
}

- (DATrafficLogger)initWithFilename:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DATrafficLogger;
  v5 = [(DATrafficLogger *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(DATrafficLogger *)v5 setFilename:v4];
    [(DATrafficLogger *)v6 _ensureCustomLogFile];
  }

  return v6;
}

+ (BOOL)enabled
{
  return MEMORY[0x1F410D268](6, a2);
}

- (void)logSnippet:(id)a3
{
  id v4 = a3;
  if (+[DATrafficLogger enabled])
  {
    v5 = (void *)[v4 copy];

    id v4 = v5;
    uint64_t v6 = [(DATrafficLogger *)self filename];
    DACPLoggingAppendDataToLogFile();
  }
}

void __30__DATrafficLogger_logSnippet___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)slurpAndRemoveLookasideFile:(id)a3 prefixString:(id)a4 suffixString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[DATrafficLogger enabled])
  {
    v11 = [(DATrafficLogger *)self filename];
    id v12 = v8;
    DACPLoggingSlurpFileIntoLogFile();
  }
}

void __73__DATrafficLogger_slurpAndRemoveLookasideFile_prefixString_suffixString___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
}

@end