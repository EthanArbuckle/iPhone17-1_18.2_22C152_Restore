@interface CRKConcretePersonaBlockPerformer
- (id)currentPersona;
- (void)adoptPersonaWithUniqueString:(id)a3 andPerformBlock:(id)a4;
@end

@implementation CRKConcretePersonaBlockPerformer

- (void)adoptPersonaWithUniqueString:(id)a3 andPerformBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (!v6)
  {
LABEL_8:
    v13 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  v8 = [(CRKConcretePersonaBlockPerformer *)self currentPersona];
  v9 = v8;
  if (!v8)
  {
    v14 = _CRKLogASM_0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:](v14);
    }

    goto LABEL_8;
  }
  v10 = [v8 userPersonaUniqueString];
  v11 = [v9 userPersonaUniqueString];
  char v12 = [v11 isEqual:v6];

  if (v12)
  {
    v13 = 0;
    goto LABEL_9;
  }
  id v22 = 0;
  v13 = (void *)[v9 copyCurrentPersonaContextWithError:&v22];
  id v18 = v22;
  if (v13)
  {
    uint64_t v19 = [v9 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v6];

    if (!v19) {
      goto LABEL_9;
    }
    v20 = _CRKLogASM_0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:].cold.4((uint64_t)v6, v20);
    }
    id v18 = (id)v19;
  }
  else
  {
    v20 = _CRKLogASM_0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [v18 verboseDescription];
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:](v21, v24, v20);
    }
  }

LABEL_9:
  v7[2](v7);
  if (v13)
  {
    v15 = [v9 restorePersonaWithSavedPersonaContext:v13];
    if (v15)
    {
      v16 = _CRKLogASM_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [v15 verboseDescription];
        -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:](v17, buf, v16);
      }
    }
  }
}

- (id)currentPersona
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  v3 = [v2 currentPersona];

  return v3;
}

- (void)adoptPersonaWithUniqueString:(os_log_t)log andPerformBlock:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to restore old persona: %{public}@", buf, 0xCu);
}

- (void)adoptPersonaWithUniqueString:(os_log_t)log andPerformBlock:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "There is no current persona", v1, 2u);
}

- (void)adoptPersonaWithUniqueString:(os_log_t)log andPerformBlock:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Error copying current persona context: %{public}@", buf, 0xCu);
}

- (void)adoptPersonaWithUniqueString:(uint64_t)a1 andPerformBlock:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to create persona context for persona identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

@end