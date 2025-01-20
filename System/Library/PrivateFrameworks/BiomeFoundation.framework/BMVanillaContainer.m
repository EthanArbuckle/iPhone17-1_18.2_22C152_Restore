@interface BMVanillaContainer
+ (id)containerForPersonaIdentifier:(id)a3 error:(id *)a4;
- (unsigned)containerType;
@end

@implementation BMVanillaContainer

+ (id)containerForPersonaIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!container_query_create())
  {
    if (!a4)
    {
LABEL_11:
      v16 = 0;
      goto LABEL_15;
    }
LABEL_7:
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMAccessErrorDomain" code:10 userInfo:0];
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  container_query_set_class();
  container_query_operation_set_flags();
  id v6 = v5;
  [v6 cStringUsingEncoding:4];
  container_query_set_persona_unique_string();
  xpc_object_t v7 = xpc_string_create("com.apple.biomed");
  container_query_set_identifiers();

  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v17 = (void *)container_error_copy_unlocalized_description();
    v18 = __biome_log_for_category(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[BMVanillaContainer containerForPersonaIdentifier:error:]((uint64_t)v17, v18);
    }

    free(v17);
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  v8 = [NSString stringWithCString:container_get_path() encoding:4];
  v9 = [v8 stringByAppendingPathComponent:@"Biome"];

  v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  v11 = (void *)container_copy_sandbox_token();
  uint64_t v12 = sandbox_extension_consume();
  v13 = __biome_log_for_category(6);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (id)objc_opt_class();
    if (v12 == -1)
    {
      v19 = __error();
      v15 = strerror(*v19);
    }
    else
    {
      v15 = "no error";
    }
    int v21 = 138413058;
    id v22 = v14;
    __int16 v23 = 2048;
    v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v12;
    __int16 v27 = 2082;
    v28 = v15;
    _os_log_impl(&dword_1B30A0000, v13, OS_LOG_TYPE_DEFAULT, "%@ sandbox_extension_consume(%p) = %lld, %{public}s", (uint8_t *)&v21, 0x2Au);
  }
  container_query_free();
  free(v11);
  v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v10 personaIdentifier:v6];

LABEL_15:
  return v16;
}

- (unsigned)containerType
{
  return 2;
}

+ (void)containerForPersonaIdentifier:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Error executing query: %s", (uint8_t *)&v2, 0xCu);
}

@end