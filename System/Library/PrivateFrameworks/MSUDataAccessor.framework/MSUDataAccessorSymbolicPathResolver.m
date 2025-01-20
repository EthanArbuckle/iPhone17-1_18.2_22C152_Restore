@interface MSUDataAccessorSymbolicPathResolver
+ (id)resolvedSymbol:(id)a3 error:(id *)a4;
+ (id)symbolicPathResolver;
- (MSUDataAccessorSymbolicPathResolver)init;
- (id)resolve:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)overrideSymbol:(id)a3 resolvedPath:(id)a4;
@end

@implementation MSUDataAccessorSymbolicPathResolver

+ (id)symbolicPathResolver
{
  v2 = objc_alloc_init(MSUDataAccessorSymbolicPathResolver);
  return v2;
}

+ (id)resolvedSymbol:(id)a3 error:(id *)a4
{
  v48[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (resolvedSymbol_error__onceToken != -1) {
    dispatch_once(&resolvedSymbol_error__onceToken, &__block_literal_global_0);
  }
  id v7 = (id)resolvedSymbol_error__symbolCache;
  objc_sync_enter(v7);
  id v8 = (id)[(id)resolvedSymbol_error__symbolCache objectForKeyedSubscript:v6];
  v9 = v8;
  if (v8)
  {
    v10 = (__CFString *)v8;
    id v11 = 0;
    goto LABEL_34;
  }
  if ([v6 isEqualToString:@"ecid"])
  {
    id v45 = 0;
    id v12 = +[MSUDataAccessor ioreg:@"IODeviceTree:/chosen/manifest-properties" property:@"ECID" error:&v45];
    id v11 = v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 length] == 8)
    {
      v13 = (void *)[v12 bytes];
      v10 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"%llX", *v13);
    }
    else
    {
      id v16 = (id)MGCopyAnswer();
      v17 = v16;
      if (v16) {
        v10 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"%llX", objc_msgSend(v16, "longLongValue"));
      }
      else {
        v10 = 0;
      }
    }
LABEL_24:
    if (v10) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  if ([v6 isEqualToString:@"boardid"])
  {
    id v14 = (id)MGCopyAnswer();
    v15 = v14;
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"chipid"])
  {
    id v14 = (id)MGCopyAnswer();
    v15 = v14;
    if (v14)
    {
LABEL_16:
      v10 = (__CFString *)(id)objc_msgSend(NSString, "stringWithFormat:", @"%X", objc_msgSend(v14, "intValue"));
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"hwmodel"])
  {
    id v44 = 0;
    v10 = (__CFString *)+[MSUDataAccessor hardwareModelWithError:&v44];
    id v18 = v44;
    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"nsih"])
  {
    id v22 = +[MSUDataAccessor sharedDataAccessor];
    id v43 = 0;
    v10 = (__CFString *)[v22 copyBootManifestHashWithError:&v43];
    id v11 = v43;

    goto LABEL_24;
  }
  if ([v6 isEqualToString:@"volguuid"])
  {
    v42 = 0;
    v10 = (__CFString *)+[MSUDataAccessor bootUUIDWithError:&v42];
    id v18 = v42;
LABEL_28:
    id v11 = v18;
    if (v10) {
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  if (([v6 isEqualToString:@"preboot"] & 1) != 0
    || ([v6 isEqualToString:@"sourcepreboot"] & 1) != 0)
  {
    id v11 = 0;
    v10 = @"/private/preboot";
    goto LABEL_25;
  }
  if (([v6 isEqualToString:@"iscpreboot"] & 1) != 0
    || ([v6 isEqualToString:@"hardware"] & 1) != 0)
  {
LABEL_46:
    id v11 = 0;
    if (a4) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  if ([v6 isEqualToString:@"bootobjectspath"])
  {
    id v41 = 0;
    id v23 = +[MSUDataAccessor ioreg:@"IODeviceTree:/chosen" property:@"boot-objects-path" error:&v41];
    id v11 = v41;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v23, "bytes"));
      v10 = (__CFString *)(id)[@"/" stringByAppendingPathComponent:v24];
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_24;
  }
  if (![v6 isEqualToString:@"cryptex1ticketpath"])
  {
    v30 = MSUDASharedLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[MSUDataAccessorSymbolicPathResolver resolvedSymbol:error:]((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);
    }

    goto LABEL_46;
  }
  unint64_t v25 = +[MSUDataAccessor cryptex1TicketType];
  if (!v25) {
    goto LABEL_46;
  }
  id v40 = (id)[a1 resolvedSymbol:@"preboot" error:0];
  id v26 = (id)[a1 resolvedSymbol:@"hwmodel" error:0];
  id v27 = (id)[a1 resolvedSymbol:@"ecid" error:0];
  v28 = v27;
  if (v25 == 1 && v26 && v27)
  {
    id v29 = (id)[NSString stringWithFormat:@"apticket.%@.%@.im4m", v26, v27];
LABEL_65:
    v37 = v29;
    v10 = 0;
    if (v40 && v29)
    {
      v38 = NSString;
      v48[0] = v40;
      v48[1] = @"cryptex1";
      v48[2] = @"current";
      v48[3] = v29;
      id v39 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
      v10 = (__CFString *)(id)[v38 pathWithComponents:v39];
    }
    goto LABEL_69;
  }
  v37 = 0;
  if (v25 == 2)
  {
    v10 = 0;
    if (v26)
    {
      id v29 = (id)[NSString stringWithFormat:@"apticket.%@.im4m", v26];
      goto LABEL_65;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_69:

LABEL_19:
  id v11 = 0;
  if (v10)
  {
LABEL_25:
    [(id)resolvedSymbol_error__symbolCache setObject:v10 forKeyedSubscript:v6];
    goto LABEL_34;
  }
LABEL_29:
  if (a4)
  {
LABEL_30:
    v46[0] = *MEMORY[0x263F07F80];
    v46[1] = @"symbol";
    v47[0] = @"Path symbol resolution failure";
    v47[1] = v6;
    id v19 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
    v20 = (void *)[v19 mutableCopy];

    if (v11) {
      [v20 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08608]];
    }
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"MSUDAError" code:6007 userInfo:v20];
  }
LABEL_33:
  v10 = 0;
LABEL_34:

  objc_sync_exit(v7);
  return v10;
}

void __60__MSUDataAccessorSymbolicPathResolver_resolvedSymbol_error___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)resolvedSymbol_error__symbolCache;
  resolvedSymbol_error__symbolCache = (uint64_t)v0;
}

- (MSUDataAccessorSymbolicPathResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSUDataAccessorSymbolicPathResolver;
  v2 = [(MSUDataAccessorSymbolicPathResolver *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    overrides = v2->_overrides;
    v2->_overrides = v3;
  }
  return v2;
}

- (void)dealloc
{
  overrides = self->_overrides;
  self->_overrides = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSUDataAccessorSymbolicPathResolver;
  [(MSUDataAccessorSymbolicPathResolver *)&v4 dealloc];
}

- (void)overrideSymbol:(id)a3 resolvedPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_overrides;
  objc_sync_enter(v8);
  overrides = self->_overrides;
  if (v7) {
    [(NSMutableDictionary *)overrides setObject:v7 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)overrides removeObjectForKey:v6];
  }
  objc_sync_exit(v8);
}

- (id)resolve:(id)a3 error:(id *)a4
{
  v68[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v62 = 0;
  v63[0] = &v62;
  v63[1] = 0x3032000000;
  v63[2] = __Block_byref_object_copy_;
  v63[3] = __Block_byref_object_dispose_;
  id v64 = 0;
  id v61 = 0;
  id v7 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])" options:0 error:&v61];
  id v8 = v61;
  if (v8)
  {
    v9 = MSUDASharedLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSUDataAccessorSymbolicPathResolver resolve:error:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08608];
    v67[0] = *MEMORY[0x263F07F80];
    v67[1] = v18;
    v68[0] = @"bad regex";
    v68[1] = v8;
    v67[2] = @"regex";
    v68[2] = @"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])";
    id v19 = (id)[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
    id v20 = (id)[v17 errorWithDomain:@"MSUDASymbolicPathResolverError" code:102 userInfo:v19];
    v21 = *(void **)(v63[0] + 40);
    *(void *)(v63[0] + 40) = v20;

    goto LABEL_5;
  }
  if (!v7)
  {
    uint64_t v33 = MSUDASharedLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[MSUDataAccessorSymbolicPathResolver resolve:error:](v33, v34, v35, v36, v37, v38, v39, v40);
    }

    id v41 = (void *)MEMORY[0x263F087E8];
    v65[0] = *MEMORY[0x263F07F80];
    v65[1] = @"regex";
    v66[0] = @"could not alloc/init regex";
    v66[1] = @"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])";
    id v42 = (id)[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
    id v43 = (id)[v41 errorWithDomain:@"MSUDASymbolicPathResolverError" code:101 userInfo:v42];
    id v44 = *(void **)(v63[0] + 40);
    *(void *)(v63[0] + 40) = v43;

LABEL_5:
    id v22 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  id v23 = (id)[MEMORY[0x263F089D8] string];
  uint64_t v24 = v58[3];
  uint64_t v25 = [v6 length];
  uint64_t v48 = MEMORY[0x263EF8330];
  uint64_t v49 = 3254779904;
  v50 = __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke;
  v51 = &__block_descriptor_72_e8_32s40s48s56r64r_e37_v32__0__NSTextCheckingResult_8Q16_B24l;
  v55 = &v57;
  id v26 = v6;
  id v52 = v26;
  id v27 = v23;
  id v53 = v27;
  v54 = self;
  v56 = &v62;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, v24, v25, &v48);
  uint64_t v28 = objc_msgSend(v26, "length", v48, v49, v50, v51);
  uint64_t v29 = v58[3];
  if (v28 != v29)
  {
    uint64_t v30 = [v26 length];
    id v31 = (id)objc_msgSend(v26, "substringWithRange:", v29, v30 - v58[3]);
    [v27 appendString:v31];
  }
  if (*(void *)(v63[0] + 40))
  {
    uint64_t v32 = MSUDASharedLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[MSUDataAccessorSymbolicPathResolver resolve:error:]((uint64_t)v63, (uint64_t)v27, v32);
    }

    id v22 = 0;
  }
  else
  {
    id v22 = v27;
  }

  _Block_object_dispose(&v57, 8);
  if (!a4)
  {
LABEL_6:
    if (!v22) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_20:
  *a4 = *(id *)(v63[0] + 40);
  if (!v22) {
    goto LABEL_24;
  }
LABEL_21:
  id v45 = MSUDASharedLogger();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
    -[MSUDataAccessorSymbolicPathResolver resolve:error:]((uint64_t)v6, (uint64_t)v22, v45);
  }

LABEL_24:
  id v46 = v22;

  _Block_object_dispose(&v62, 8);
  return v46;
}

void __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke(uint64_t a1, id a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 range];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v8 != v9)
    {
      id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v9, objc_msgSend(v7, "range")- *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      [*(id *)(a1 + 40) appendString:v10];
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v7 range];
    id v14 = (id)objc_msgSend(v11, "substringWithRange:", v12, v13);
    if ([v7 rangeAtIndex:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v7 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v7 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v7 rangeAtIndex:4] != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v15 = (id)objc_msgSend(v14, "substringWithRange:", 1, objc_msgSend(v14, "length") - 2);
            id v16 = (id)[*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:v15];
            if (!v16)
            {
              uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
              id obj = *(id *)(v17 + 40);
              id v16 = +[MSUDataAccessorSymbolicPathResolver resolvedSymbol:v15 error:&obj];
              objc_storeStrong((id *)(v17 + 40), obj);
              if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
              {
                *a4 = 1;
              }
              else if (v16)
              {
                [*(id *)(a1 + 40) appendString:v16];
              }
            }
          }
          goto LABEL_15;
        }
        uint64_t v18 = *(void **)(a1 + 40);
        id v19 = @"]";
      }
      else
      {
        uint64_t v18 = *(void **)(a1 + 40);
        id v19 = @"[";
      }
    }
    else
    {
      uint64_t v18 = *(void **)(a1 + 40);
      id v19 = @"\\"";
    }
    [v18 appendString:v19];
LABEL_15:
    uint64_t v20 = [v7 range];
    [v7 range];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21 + v20;
  }
}

- (void).cxx_destruct
{
}

+ (void)resolvedSymbol:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resolve:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_2104E7000, log, OS_LOG_TYPE_DEBUG, "returning resolved path for symbolic path %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)resolve:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resolve:(os_log_t)log error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2104E7000, log, OS_LOG_TYPE_ERROR, "error %@ ; discarding incomplete unresolved path: %@",
    (uint8_t *)&v4,
    0x16u);
}

- (void)resolve:(uint64_t)a3 error:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end