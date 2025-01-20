@interface MKRouteETAFetcher
@end

@implementation MKRouteETAFetcher

void __88___MKRouteETAFetcher_requestNewETAForTransportType_additionalTransportTypes_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = 0;

  if (a1[5] == *(void *)(a1[4] + 88))
  {
    *(CFAbsoluteTime *)(a1[4] + 32) = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = a1[4];
    v10 = [v5 source];
    [v10 _coordinate];
    *(void *)(v9 + 16) = v11;
    *(void *)(v9 + 24) = v12;

    uint64_t v13 = a1[4];
    if (v6)
    {
      *(unsigned char *)(v13 + 56) = 1;
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      id v25 = v5;
      *(unsigned char *)(v13 + 56) = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v14 = [v5 _sortedETAs];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            unsigned int v20 = [v19 transportType];
            if (v20 > 5) {
              uint64_t v21 = 1;
            }
            else {
              uint64_t v21 = qword_18BD1B718[v20];
            }
            v22 = +[_MKRouteETA routeETAWithDistance:travelTime:transportType:status:](_MKRouteETA, "routeETAWithDistance:travelTime:transportType:status:", v21, [v19 status], (double)objc_msgSend(v19, "distance"), (double)objc_msgSend(v19, "travelTimeBestEstimate"));
            v23 = *(void **)(a1[4] + 8);
            v24 = [NSNumber numberWithUnsignedInteger:v21];
            [v23 setObject:v22 forKeyedSubscript:v24];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v16);
      }

      id v5 = v25;
      (*(void (**)(void))(a1[6] + 16))();
      id v6 = 0;
    }
  }
}

@end