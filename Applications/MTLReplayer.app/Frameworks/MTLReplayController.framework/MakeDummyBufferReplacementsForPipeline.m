@interface MakeDummyBufferReplacementsForPipeline
@end

@implementation MakeDummyBufferReplacementsForPipeline

id ___MakeDummyBufferReplacementsForPipeline_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"type"];
  if ([v4 unsignedIntValue])
  {
    id v5 = 0;
  }
  else
  {
    v6 = [v3 objectForKeyedSubscript:@"index"];
    id v5 = [v6 isEqualToNumber:*(void *)(a1 + 32)];
  }
  return v5;
}

@end