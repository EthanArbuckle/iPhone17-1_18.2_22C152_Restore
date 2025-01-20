@interface BRXPCClientUtils
+ (BOOL)executeXPCWithMaxRetries:(unint64_t)a3 error:(id *)a4 block:(id)a5;
+ (void)executeAsyncXPCWithMaxRetries:(unint64_t)a3 completion:(id)a4 xpcInvokeBlock:(id)a5;
@end

@implementation BRXPCClientUtils

+ (BOOL)executeXPCWithMaxRetries:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, id *))a5;
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
  if (a3)
  {
    do
    {

      id v14 = 0;
      char v8 = v6[2](v6, &v14);
      id v9 = v14;
      v7 = v9;
      if ((v8 & 1) != 0 || !objc_msgSend(v9, "br_isNSXPCConnectionError")) {
        break;
      }
      v10 = brc_bread_crumbs((uint64_t)"+[BRXPCClientUtils executeXPCWithMaxRetries:error:block:]", 32);
      v11 = brc_default_log(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Block execution failed because of XPC - retrying%@", buf, 0xCu);
      }

      --a3;
    }
    while (a3);
  }
  else
  {
    char v8 = 0;
  }
  if (a4) {
    *a4 = v7;
  }

  return v8;
}

+ (void)executeAsyncXPCWithMaxRetries:(unint64_t)a3 completion:(id)a4 xpcInvokeBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4FB36F8] sharedManager];
  v10 = [v9 currentPersona];
  v11 = [v10 userPersonaUniqueString];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke;
  v16[3] = &unk_1E59AD5D0;
  id v17 = v11;
  id v18 = v7;
  id v19 = v8;
  unint64_t v20 = a3;
  v12 = (void (**)(id, void *))v8;
  id v13 = v11;
  id v14 = v7;
  v15 = (void *)MEMORY[0x19F3C48D0](v16);
  v12[2](v12, v15);
}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(v3, "br_isNSXPCConnectionError") & 1) != 0 && (uint64_t v4 = *(void *)(a1 + 56), v4 != 1))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2;
      v9[3] = &unk_1E59AD5A8;
      id v6 = *(id *)(a1 + 40);
      id v8 = *(void **)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      id v10 = v6;
      uint64_t v12 = v7;
      id v11 = v8;
      +[BRPersonaUtils performWithPersonaID:v5 block:v9];
    }
    else
    {
      +[BRXPCClientUtils executeAsyncXPCWithMaxRetries:v4 - 1 completion:*(void *)(a1 + 40) xpcInvokeBlock:*(void *)(a1 + 48)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs((uint64_t)"+[BRXPCClientUtils executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:]_block_invoke_2", 54);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2_cold_1((uint64_t)v4, v5);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    +[BRXPCClientUtils executeAsyncXPCWithMaxRetries:a1[6] - 1 completion:a1[4] xpcInvokeBlock:a1[5]];
  }
}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for _br_addDomain retry%@", (uint8_t *)&v2, 0xCu);
}

@end