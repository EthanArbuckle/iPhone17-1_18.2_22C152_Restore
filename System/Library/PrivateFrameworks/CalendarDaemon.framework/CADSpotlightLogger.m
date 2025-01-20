@interface CADSpotlightLogger
+ (void)_logWithFormat:(id)a3 args:(char *)a4 prependErrorMarker:(BOOL)a5;
+ (void)log:(id)a3;
+ (void)logError:(id)a3;
@end

@implementation CADSpotlightLogger

+ (void)logError:(id)a3
{
  [a1 _logWithFormat:a3 args:&v3 prependErrorMarker:1];
}

+ (void)log:(id)a3
{
  [a1 _logWithFormat:a3 args:&v3 prependErrorMarker:0];
}

+ (void)_logWithFormat:(id)a3 args:(char *)a4 prependErrorMarker:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (_logWithFormat_args_prependErrorMarker__onceToken != -1) {
    dispatch_once(&_logWithFormat_args_prependErrorMarker__onceToken, &__block_literal_global_2);
  }
  v8 = (void *)[[NSString alloc] initWithFormat:v7 arguments:a4];
  v9 = (void *)_logWithFormat_args_prependErrorMarker__dateFormatter;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  v11 = [v9 stringFromDate:v10];

  id v12 = [NSString alloc];
  if (v5) {
    v13 = @"%@ SPOTLIGHT_ERROR %@\n";
  }
  else {
    v13 = @"%@ %@\n";
  }
  v14 = objc_msgSend(v12, "initWithFormat:", v13, v11, v8);
  id v15 = [v14 dataUsingEncoding:4];
  DACPLoggingAppendDataToLogFile();
}

void __61__CADSpotlightLogger__logWithFormat_args_prependErrorMarker___block_invoke()
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F5E9B0];
  uint64_t v0 = DACustomLogDirectory();
  uint64_t v1 = *MEMORY[0x1E4F5E9C0];
  v10[0] = v0;
  v10[1] = @"SpotlightLog";
  uint64_t v2 = *MEMORY[0x1E4F5E9C8];
  v9[1] = v1;
  v9[2] = v2;
  v9[3] = *MEMORY[0x1E4F5E9B8];
  v10[2] = &unk_1F151D668;
  v10[3] = @"DALogLevel";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v4 = [MEMORY[0x1E4F5E940] DAManagedDefaultForKey:@"DALogLevel"];

  if (!v4 && [MEMORY[0x1E4F5E940] isAppleInternalInstall])
  {
    BOOL v5 = (void *)[v3 mutableCopy];
    [v5 setObject:&unk_1F151D680 forKeyedSubscript:*MEMORY[0x1E4F5E9D0]];

    uint64_t v3 = v5;
  }
  v8 = @"SpotlightLog";
  MEMORY[0x1C1866D20]([MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1], v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v7 = (void *)_logWithFormat_args_prependErrorMarker__dateFormatter;
  _logWithFormat_args_prependErrorMarker__dateFormatter = (uint64_t)v6;

  [(id)_logWithFormat_args_prependErrorMarker__dateFormatter setFormatOptions:4083];
}

void __61__CADSpotlightLogger__logWithFormat_args_prependErrorMarker___block_invoke_19(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

@end