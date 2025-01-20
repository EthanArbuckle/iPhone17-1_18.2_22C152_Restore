@interface LSServerCleanEphemeralMobileContainersForFirstBoot
@end

@implementation LSServerCleanEphemeralMobileContainersForFirstBoot

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = _LSAliasGetPath(**(void ***)(a1 + 40), *(_DWORD *)(a3 + 12));
  if (v5)
  {
    id v15 = 0;
    v6 = [[FSNode alloc] initWithPath:v5 flags:0 error:&v15];
    id v7 = v15;
    if (!v6)
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1();
      }
      goto LABEL_10;
    }
    v8 = +[FSNode rootVolumeNode];
    if (![(FSNode *)v6 isEqual:v8])
    {
      v9 = +[FSNode systemDataVolumeNode];
      if ([(FSNode *)v6 isEqual:v9])
      {
LABEL_7:

        goto LABEL_10;
      }
      v10 = +[FSNode prebootVolumeNode];
      if ([(FSNode *)v6 isEqual:v10])
      {

        goto LABEL_7;
      }
      v11 = +[FSNode userDataVolumeNode];
      BOOL v12 = [(FSNode *)v6 isEqual:v11];

      if (v12) {
        goto LABEL_11;
      }
      v13 = _LSDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v5;
        _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEFAULT, "Marking container at %{public}@ for removal", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      v8 = [NSNumber numberWithUnsignedInt:a2];
      [v14 addObject:v8];
    }
LABEL_10:

LABEL_11:
  }
}

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_8();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_5_0(&dword_182959000, v1, (uint64_t)v1, "Could not create node for container with path %{public}@: %@", v2);
}

@end