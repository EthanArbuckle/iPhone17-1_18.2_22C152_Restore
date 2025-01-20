@interface KSRequestThrottle
@end

@implementation KSRequestThrottle

float __26___KSRequestThrottle_init__block_invoke(uint64_t a1, char a2)
{
  return (float)(1 << a2);
}

_DWORD *__34___KSRequestThrottle_postRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  result = *(_DWORD **)(a1 + 32);
  if (!result[8])
  {
    return (_DWORD *)[result _launch];
  }
  return result;
}

void __29___KSRequestThrottle__launch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29___KSRequestThrottle__launch__block_invoke_2;
    v8[3] = &unk_2648915E8;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
  }
}

void __29___KSRequestThrottle__launch__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_25;
  }
  v5 = WeakRetained + 32;
  float v6 = (*(float (**)(void))(*((void *)WeakRetained + 1) + 16))();
  double v7 = *((double *)v4 + 2);
  if (v7 <= v6) {
    float v8 = v7;
  }
  else {
    float v8 = v6;
  }
  int v9 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v10 && *((double *)v4 + 2) <= v8)
  {
    if (!*((void *)v4 + 6))
    {
LABEL_24:
      *((_DWORD *)v4 + 8) = 0;
      v16 = (void *)*((void *)v4 + 3);
      *((void *)v4 + 3) = 0;

      goto LABEL_25;
    }
    v14 = KSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __29___KSRequestThrottle__launch__block_invoke_2_cold_3();
    }

    uint64_t v10 = *(void *)(a1 + 32);
LABEL_18:
    if (v10 && *v5 && *((void *)v4 + 6))
    {
      v15 = KSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __29___KSRequestThrottle__launch__block_invoke_2_cold_1((uint64_t *)v4 + 6, (int *)v4 + 8, v15);
      }
    }
    goto LABEL_24;
  }
  if (v9) {
    goto LABEL_18;
  }
  if (*((void *)v4 + 6) && (*(unsigned char *)v5 & 0x7F) == 0)
  {
    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __29___KSRequestThrottle__launch__block_invoke_2_cold_2();
    }
  }
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0));
  v13 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29___KSRequestThrottle__launch__block_invoke_22;
  block[3] = &unk_2648914D8;
  objc_copyWeak(&v18, v2);
  dispatch_after(v12, v13, block);

  objc_destroyWeak(&v18);
LABEL_25:
}

void __29___KSRequestThrottle__launch__block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _launch];
}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_1(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = *a2;
  int v5 = 136315650;
  float v6 = "-[_KSRequestThrottle _launch]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  Throttle(%@): success after %i tries", (uint8_t *)&v5, 0x1Cu);
}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_ERROR, "%s  Throttle(%@): 128 attempts counted", (uint8_t *)v1, 0x16u);
}

void __29___KSRequestThrottle__launch__block_invoke_2_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22B2BC000, v0, OS_LOG_TYPE_ERROR, "%s  Throttle(%@): giving up", (uint8_t *)v1, 0x16u);
}

@end