@interface CAFControlParameter
+ (id)parseParameters:(id)a3;
- (BOOL)supportsInvalid;
- (CAFCachedDescription)cachedDescription;
- (CAFControlParameter)initWithConfig:(id)a3;
- (NSString)formatString;
- (NSString)name;
- (id)currentDescriptionForCache:(id)a3;
- (unint64_t)format;
- (void)setCachedDescription:(id)a3;
@end

@implementation CAFControlParameter

- (NSString)formatString
{
  unint64_t v2 = [(CAFControlParameter *)self format];
  return (NSString *)NSStringFromCharacteristicMetadataFormat(v2);
}

- (CAFControlParameter)initWithConfig:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAFControlParameter;
  id v5 = [(CAFControlParameter *)&v24 init];
  if (!v5) {
    goto LABEL_13;
  }
  objc_opt_class();
  id v6 = [v4 objectForKeyedSubscript:@"name"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v7;

  if (!*((void *)v5 + 2))
  {
    v14 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CAFControlParameter initWithConfig:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_20;
  }
  objc_opt_class();
  id v9 = [v4 objectForKeyedSubscript:@"format"];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (!v10)
  {
    v22 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CAFControlParameter initWithConfig:]((uint64_t *)v5 + 2, v22);
    }

LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  *((void *)v5 + 3) = [v10 unsignedIntegerValue];
  *((unsigned char *)v5 + 8) = +[CAFCarConfiguration getBoolean:v4 key:@"supportsInvalid"];
  v11 = [[CAFCachedDescription alloc] initWithCacheable:v5];
  v12 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v11;

LABEL_13:
  v13 = (CAFControlParameter *)v5;
LABEL_21:

  return v13;
}

+ (id)parseParameters:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__CAFControlParameter_parseParameters___block_invoke;
    v6[3] = &unk_265264440;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __39__CAFControlParameter_parseParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  id v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [[CAFControlParameter alloc] initWithConfig:v7];
    if (v8)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
    }
    else
    {
      uint64_t v19 = CAFServiceLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __39__CAFControlParameter_parseParameters___block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 8);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = 0;

      *a4 = 1;
    }
  }
  else
  {

    uint64_t v9 = CAFServiceLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __39__CAFControlParameter_parseParameters___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    *a4 = 1;
  }
}

- (id)currentDescriptionForCache:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CAFControlParameter *)self name];
  id v7 = [(CAFControlParameter *)self formatString];
  BOOL v8 = [(CAFControlParameter *)self supportsInvalid];
  uint64_t v9 = &stru_26FD46EB0;
  if (v8) {
    uint64_t v9 = @"?";
  }
  uint64_t v10 = [v4 stringWithFormat:@"<%@: %p %@ %@%@>", v5, self, v6, v7, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)format
{
  return self->_format;
}

- (BOOL)supportsInvalid
{
  return self->_supportsInvalid;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConfig:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "Parsing control parameter: %@ failed for format", (uint8_t *)&v3, 0xCu);
}

void __39__CAFControlParameter_parseParameters___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__CAFControlParameter_parseParameters___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end