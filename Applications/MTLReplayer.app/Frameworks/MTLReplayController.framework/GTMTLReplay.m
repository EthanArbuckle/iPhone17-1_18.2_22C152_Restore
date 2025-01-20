@interface GTMTLReplay
@end

@implementation GTMTLReplay

void __GTMTLReplay_CLI_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@-%@", a1[4], v8, v7];

  v10 = (void (*)(id, void *))a1[6];
  v11 = [v13 stringByAppendingPathExtension:@"png"];
  v12 = +[NSURL fileURLWithPath:v11 isDirectory:0 relativeToURL:a1[5]];
  v10(v9, v12);
}

void __GTMTLReplay_CLI_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_7593A0];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_281(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_7593C8];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_301(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_7593F0];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_2_323(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = v3;
  if (v3)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || ([v3 objectForKeyedSubscript:@"Streaming APS Counters"],
          v4 = objc_claimAutoreleasedReturnValue(),
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 != 0,
          v4,
          id v3 = v14,
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        goto LABEL_8;
      }
      v5 = [v3 objectForKeyedSubscript:@"Streaming APS Profiling"];
      if (v5) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }

      id v3 = v14;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
LABEL_8:
        v6 = [v3 objectForKeyedSubscript:@"Remove APS Timeline"];

        id v7 = *(void **)(a1 + 40);
        if (v6)
        {
          [v7 removeAPSTimelineData];
          uint64_t v8 = *(void *)(a1 + 80);
LABEL_10:
          *(void *)(*(void *)(v8 + 8) + 24) = 0;
          goto LABEL_14;
        }
        [v7 addAPSTimelineData:v14];
        uint64_t v9 = *(void *)(a1 + 80);
      }
      else
      {
        v12 = [v14 objectForKeyedSubscript:@"Remove APS Counters"];

        id v13 = *(void **)(a1 + 40);
        if (v12)
        {
          [v13 removeAPSCounterData];
          uint64_t v8 = *(void *)(a1 + 72);
          goto LABEL_10;
        }
        [v13 addAPSCounterData:v14];
        uint64_t v9 = *(void *)(a1 + 72);
      }
    }
    else
    {
      v10 = [v14 objectForKeyedSubscript:@"Remove APS Data"];

      v11 = *(void **)(a1 + 40);
      if (v10)
      {
        [v11 removeAPSData];
        uint64_t v8 = *(void *)(a1 + 56);
        goto LABEL_10;
      }
      [v11 addAPSData:v14];
      uint64_t v9 = *(void *)(a1 + 56);
    }
    ++*(void *)(*(void *)(v9 + 8) + 24);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
LABEL_14:
}

void __GTMTLReplay_CLI_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (g_runningInCI)
    {
      v2 = +[NSString stringWithFormat:@"\tBatch ID Filtering Data %lu/%lu", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 40)];
      id v3 = [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

      v4 = __stdoutp;
      id v5 = v3;
      fprintf(v4, "#CI-INFO# %s\n", (const char *)[v5 UTF8String]);
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    [*(id *)(a1 + 32) addGPUTimelineData:v3];
    id v3 = v8;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (g_runningInCI)
    {
      v4 = +[NSString stringWithFormat:@"\tTimeline Data %lu", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

      v6 = __stdoutp;
      id v7 = v5;
      fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

      id v3 = v8;
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    [*(id *)(a1 + 32) addShaderProfilerData:v3];
    id v3 = v8;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (g_runningInCI)
    {
      v4 = +[NSString stringWithFormat:@"\tShader Profiler Data %lu", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

      v6 = __stdoutp;
      id v7 = v5;
      fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

      id v3 = v8;
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (g_runningInCI)
    {
      v2 = +[NSString stringWithFormat:@"\tBatch ID Filtering Data %lu/%lu", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 40)];
      id v3 = [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

      v4 = __stdoutp;
      id v5 = v3;
      fprintf(v4, "#CI-INFO# %s\n", (const char *)[v5 UTF8String]);
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_759418];
    [WeakRetained waitForCompletion];
    [WeakRetained writeGPUTimelineSerializedData];
  }
}

@end