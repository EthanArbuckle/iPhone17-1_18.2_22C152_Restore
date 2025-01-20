@interface CSVisualizationArchiver
@end

@implementation CSVisualizationArchiver

uint64_t __51___CSVisualizationArchiver_writeAllUnitsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t result = [*(id *)(a1 + 32) writeAllUnitsInTable:a2 block:*(void *)(a1 + 40)];
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 18));
  if (v9) {
    *a6 = 1;
  }
  return result;
}

void __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = *(_DWORD **)(v3 + 8);
  unint64_t v4 = *(void *)(v3 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v7 = *(_DWORD **)v3;
    uint64_t v8 = ((uint64_t)v5 - *(void *)v3) >> 2;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
      abort();
    }
    uint64_t v10 = v4 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    BOOL v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v12);
      v7 = *(_DWORD **)v3;
      v5 = *(_DWORD **)(v3 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    v14 = (_DWORD *)(v12 + 4 * v8);
    unint64_t v15 = v12 + 4 * v13;
    _DWORD *v14 = a2;
    v6 = v14 + 1;
    while (v5 != v7)
    {
      int v16 = *--v5;
      *--v14 = v16;
    }
    *(void *)uint64_t v3 = v14;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    _DWORD *v5 = a2;
    v6 = v5 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

uint64_t __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke_83(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load(*(unsigned __int8 **)(result + 32));
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(unsigned int *)(**(void **)(result + 40) + 4 * a2);
    [**(id **)(result + 48) writeUnit:v4 inTable:**(unsigned int **)(v3 + 56) state:*(void *)(v3 + 64)];
    uint64_t result = **(void **)(v3 + 72);
    if (result)
    {
      char v6 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(result + 16))(result, **(unsigned int **)(v3 + 56), v4, &v6);
      if (v6) {
        atomic_store(1u, *(unsigned __int8 **)(v3 + 32));
      }
    }
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)(**(void **)(v3 + 48) + 18));
    if (v5) {
      atomic_store(1u, *(unsigned __int8 **)(v3 + 32));
    }
  }
  return result;
}

id __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8
    || ((*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4),
        (unint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v9 = [v7 summaryOfUnit:a4 inTable:a3];
  }

  return v9;
}

id __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8
    || ((*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4),
        (unint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v9 = [v7 descriptionOfUnit:a4 inTable:a3];
  }

  return v9;
}

void __141___CSVisualizationArchiver_CSRemoteVisualization__beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock___block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v6 = CSStore2::GetLog((CSStore2 *)a1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v14 = 138543874;
    *(void *)unint64_t v15 = v7;
    *(_WORD *)&v15[8] = 2048;
    *(void *)&v15[10] = a2;
    __int16 v16 = 2112;
    uint64_t v17 = a3;
    _os_log_impl(&dword_1A7DB2000, v6, OS_LOG_TYPE_DEFAULT, "Received request for service %{public}@ from connection %p: %@", (uint8_t *)&v14, 0x20u);
  }

  uint64_t v8 = (void *)os_transaction_create();
  unint64_t v9 = funopen(a2, (int (__cdecl *)(void *, char *, int))CSStore2::readFromLockdownConnection, (int (__cdecl *)(void *, const char *, int))CSStore2::writeToLockdownConnection, 0, 0);
  if (v9)
  {
    [*(id *)(a1 + 48) processCommandFromConnection:a2 fileHandle:v9 providerBlock:*(void *)(a1 + 40)];
    fclose(v9);
  }
  else
  {
    uint64_t v10 = CSStore2::GetLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *__error();
      unint64_t v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = 67109378;
      *(_DWORD *)unint64_t v15 = v11;
      *(_WORD *)&v15[4] = 2080;
      *(void *)&v15[6] = v13;
      _os_log_error_impl(&dword_1A7DB2000, v10, OS_LOG_TYPE_ERROR, "Failed to open file handle for streaming visualization data: %i (%s)", (uint8_t *)&v14, 0x12u);
    }
  }
  softLinklockdown_disconnect((uint64_t)a2);
}

void __106___CSVisualizationArchiver_CSRemoteVisualization__provideVisualizerToConnection_fileHandle_providerBlock___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2)
  {
    uint64_t v3 = [_CSVisualizationArchiver alloc];
    uint64_t v4 = *(void *)(a1 + 48);
    id v9 = 0;
    unsigned __int8 v5 = [(_CSVisualizationArchiver *)v3 initWithVisualizer:v2 fileHandle:v4 closeWhenDone:0 allowCompression:1 error:&v9];
    char v6 = (CSStore2 *)v9;
    uint64_t v7 = v6;
    if (v5)
    {
      [(_CSVisualizationArchiver *)v5 writeAllUnitsWithBlock:0];
      [(_CSVisualizationArchiver *)v5 finishWriting];
    }
    else
    {
      uint64_t v8 = CSStore2::GetLog(v6);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        int v11 = v7;
        _os_log_error_impl(&dword_1A7DB2000, v8, OS_LOG_TYPE_ERROR, "Failed to create _CSVisualizationArchiver for streaming visualization data: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v7 = CSStore2::GetLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_INFO, "Callback block didn't vend a _CSVisualizer; no data will be returned to the Mac",
        buf,
        2u);
    }
  }
}

@end