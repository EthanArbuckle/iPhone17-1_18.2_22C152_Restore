@interface COMessagingServiceMeter
@end

@implementation COMessagingServiceMeter

void __32___COMessagingServiceMeter_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __32___COMessagingServiceMeter_init__block_invoke_2;
    v3[3] = &unk_2645CB288;
    id v4 = WeakRetained;
    [v4 _withLock:v3];
  }
}

void __32___COMessagingServiceMeter_init__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) peaks];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        v7 = COCoreLogForCategory(9);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = [v1 objectForKey:v6];
          *(_DWORD *)buf = 138412546;
          uint64_t v14 = v6;
          __int16 v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_INFO, "Peak usage for %@: %@ bytes", buf, 0x16u);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v17 count:16];
    }
    while (v3);
  }
}

void __59___COMessagingServiceMeter_clientIdentifier_canSendLength___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) peaks];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 > [v2 unsignedIntegerValue])
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v5 setObject:v4 forKey:*(void *)(a1 + 40)];
  }
}

void __62___COMessagingServiceMeter_clientIdentifier_canReceiveLength___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) peaks];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 > [v2 unsignedIntegerValue])
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v5 setObject:v4 forKey:*(void *)(a1 + 40)];
  }
}

void __51___COMessagingServiceMeter_isEvaluatingIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) peaks];
  uint64_t v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

@end