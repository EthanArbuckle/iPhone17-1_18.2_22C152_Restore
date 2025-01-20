@interface AKIORegistryReader
+ (id)sharedInstance;
- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5;
- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4;
- (id)sfrManifest;
@end

@implementation AKIORegistryReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_54);
  }
  v2 = (void *)sharedInstance_reader;

  return v2;
}

uint64_t __36__AKIORegistryReader_sharedInstance__block_invoke()
{
  sharedInstance_reader = objc_alloc_init(AKIORegistryReader);

  return MEMORY[0x1F41817F8]();
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], (const char *)[a3 fileSystemRepresentation]);
    if (v8)
    {
      io_object_t v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFTypeRef CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [NSNumber numberWithInt:v5];
  v11 = v10;
  unsigned int v17 = v5;
  if (v8 && v9)
  {
    id v12 = [(AKIORegistryReader *)self copyDeviceTreeProperty:v8 key:v9];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 length] != 4)
      {
LABEL_11:
        id v14 = v11;

        goto LABEL_12;
      }
      [v12 getBytes:&v17 length:4];
      id v13 = [NSNumber numberWithInt:v17];
    }
    else
    {
      id v13 = v12;
    }
    id v15 = v13;

    v11 = v15;
    goto LABEL_11;
  }
  id v14 = v10;
LABEL_12:

  return v14;
}

- (id)sfrManifest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AKIORegistryReader_sfrManifest__block_invoke;
  block[3] = &unk_1E575EA70;
  block[4] = self;
  if (sfrManifest_onceToken != -1) {
    dispatch_once(&sfrManifest_onceToken, block);
  }
  return (id)sfrManifest_sfrManifest;
}

void __33__AKIORegistryReader_sfrManifest__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [NSString stringWithUTF8String:"IODeviceTree"];
  v4 = [v3 stringByAppendingString:@":/chosen/iBoot"];
  uint64_t v5 = (void *)[v2 copyDeviceTreeInt:v4 key:@"sfr-manifest-size" defaultValue:0];

  if (!v5 || ![v5 unsignedIntValue])
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_1(v13, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_12;
  }
  v6 = *(void **)(a1 + 32);
  v7 = [NSString stringWithUTF8String:"IODeviceTree"];
  id v8 = [v7 stringByAppendingString:@":/chosen/iBoot"];
  uint64_t v9 = [v6 copyDeviceTreeProperty:v8 key:@"sfr-manifest-data"];
  v10 = (void *)sfrManifest_sfrManifest;
  sfrManifest_sfrManifest = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(id)sfrManifest_sfrManifest length])
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_2(v13, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_12;
  }
  uint64_t v11 = objc_msgSend((id)sfrManifest_sfrManifest, "subdataWithRange:", 0, objc_msgSend(v5, "unsignedIntValue"));
  id v12 = (void *)sfrManifest_sfrManifest;
  sfrManifest_sfrManifest = v11;

  if (!sfrManifest_sfrManifest)
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_12:
  }
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end