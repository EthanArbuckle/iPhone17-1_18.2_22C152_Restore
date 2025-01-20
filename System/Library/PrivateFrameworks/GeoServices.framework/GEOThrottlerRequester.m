@interface GEOThrottlerRequester
+ (GEOThrottlerRequester)sharedRequester;
- (BOOL)_getTokenAndInfo:(id *)a3 forRequest:(id)a4 nextSafeRequestTime:(double *)a5 availableRequestCount:(unsigned int *)a6 error:(id *)a7;
- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6;
- (BOOL)getThrottleStateFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6;
- (id)getTokenOrInfoFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6;
@end

@implementation GEOThrottlerRequester

- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  if (+[GEOPlatform isRunningInGeod])
  {
    v11 = +[GEODataRequestThrottler sharedThrottler];
    char v12 = [v11 allowRequest:a3 forClient:v10 throttlerToken:a5 error:a6];
  }
  else
  {
    id v18 = *a5;
    id v13 = v18;
    BOOL v14 = [(GEOThrottlerRequester *)self _getTokenAndInfo:&v18 forRequest:a3 nextSafeRequestTime:0 availableRequestCount:0 error:a6];
    id v15 = v18;

    if (v14)
    {
      id v16 = v15;
      *a5 = v16;
      char v12 = v16 != 0;
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

+ (GEOThrottlerRequester)sharedRequester
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEOThrottlerRequester_sharedRequester__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2A08F0 != -1) {
    dispatch_once(&qword_1EB2A08F0, block);
  }
  v2 = (void *)_MergedGlobals_349;

  return (GEOThrottlerRequester *)v2;
}

void __40__GEOThrottlerRequester_sharedRequester__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_349;
  _MergedGlobals_349 = (uint64_t)v1;
}

- (BOOL)_getTokenAndInfo:(id *)a3 forRequest:(id)a4 nextSafeRequestTime:(double *)a5 availableRequestCount:(unsigned int *)a6 error:(id *)a7
{
  uint64_t var0 = a4.var1.var0;
  id v13 = [(GEOXPCRequest *)[GEOThrottlerIsSafeRequest alloc] initWithMessage:@"throttler.isSafe" traits:0 auditToken:0 throttleToken:0];
  [(GEOThrottlerIsSafeRequest *)v13 setRequestKindType:a4];
  [(GEOThrottlerIsSafeRequest *)v13 setRequestKindSubtype:var0];
  [(GEOThrottlerIsSafeRequest *)v13 setNextSafeRequestTime:a5 != 0];
  [(GEOThrottlerIsSafeRequest *)v13 setAvailableRequestCount:a6 != 0];
  [(GEOThrottlerIsSafeRequest *)v13 setIncludeToken:a3 != 0];
  if (a3) {
    [(GEOThrottlerIsSafeRequest *)v13 setThrottlerToken:*a3];
  }
  BOOL v14 = [(GEOXPCRequest *)v13 sendSync:0 error:0];
  id v15 = v14;
  if (a5)
  {
    [v14 nextSafeRequestTime];
    *(void *)a5 = v16;
  }
  if (a6) {
    *a6 = [v15 availableRequestCount];
  }
  if (a7)
  {
    v17 = [v15 error];

    if (v17)
    {
      *a7 = [v15 error];
    }
  }
  if (a3)
  {
    *a3 = [v15 throttlerToken];
  }
  id v18 = [v15 error];
  BOOL v19 = v18 == 0;

  return v19;
}

- (id)getTokenOrInfoFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6
{
  id v11 = 0;
  BOOL v6 = [(GEOThrottlerRequester *)self _getTokenAndInfo:&v11 forRequest:a3 nextSafeRequestTime:a4 availableRequestCount:a5 error:a6];
  id v7 = v11;
  v8 = v7;
  id v9 = 0;
  if (v6) {
    id v9 = v7;
  }

  return v9;
}

- (BOOL)getThrottleStateFor:(id)a3 nextSafeRequestTime:(double *)a4 availableRequestCount:(unsigned int *)a5 error:(id *)a6
{
  return [(GEOThrottlerRequester *)self _getTokenAndInfo:0 forRequest:a3 nextSafeRequestTime:a4 availableRequestCount:a5 error:a6];
}

@end