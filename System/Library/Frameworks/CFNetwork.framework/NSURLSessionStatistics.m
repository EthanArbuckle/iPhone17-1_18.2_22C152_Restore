@interface NSURLSessionStatistics
@end

@implementation NSURLSessionStatistics

void __57____NSURLSessionStatistics_createCFNetworkTaskMetrics_s___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) session];
  v4 = (void *)v3;
  if (v3
    && (int v5 = CFEqual((CFTypeRef)[*(id *)(v3 + 112) disposition], &unk_1EC0A58A8), v4, v5))
  {
    uint64_t v6 = [v13 copy];
  }
  else
  {
    uint64_t v7 = [v13 count];
    do
    {
      uint64_t v8 = v7--;
      if (v7 < 0) {
        break;
      }
      v9 = [v13 objectAtIndexedSubscript:v7];
      uint64_t v10 = v9 ? v9[26] : 0;
    }
    while (v10 != 1025);
    uint64_t v6 = objc_msgSend(v13, "subarrayWithRange:", v8, objc_msgSend(v13, "count") - v8);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

@end