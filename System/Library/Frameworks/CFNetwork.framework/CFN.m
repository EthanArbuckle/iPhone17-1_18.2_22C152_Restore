@interface CFN
@end

@implementation CFN

void __50____CFN_ConnectionContextManager_registerSession___block_invoke_2(uint64_t a1)
{
}

void __53____CFN_ConnectionMetrics_collectDataTransferReport___block_invoke(uint64_t a1, void *a2)
{
}

void __34____CFN_ConnectionMetrics_tcpInfo__block_invoke(uint64_t a1)
{
}

__CFN_ConnectionContextManager *__47____CFN_ConnectionContextManager_sharedManager__block_invoke()
{
  result = objc_alloc_init(__CFN_ConnectionContextManager);
  _sharedManager = (uint64_t)result;
  return result;
}

uint64_t __36____CFN_ConnectionMetrics_establish__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __41____CFN_ConnectionMetrics__subflowCounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
  v7 = *(void **)(a1 + 32);
  v8 = [NSString stringWithUTF8String:a2];
  [v7 setObject:v6 forKeyedSubscript:v8];

  return 1;
}

void __40____CFN_ConnectionMetrics_subflowCounts__block_invoke(uint64_t a1)
{
}

@end