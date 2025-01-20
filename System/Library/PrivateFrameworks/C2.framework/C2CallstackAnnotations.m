@interface C2CallstackAnnotations
+ (id)annotateBlockForContainerType:(int64_t)a3 block:(id)a4;
+ (void)annotateCallstackForContainerType:(int64_t)a3 block:(id)a4;
@end

@implementation C2CallstackAnnotations

+ (void)annotateCallstackForContainerType:(int64_t)a3 block:(id)a4
{
  id v4 = a4;
  c2_callstack_annotation_ThirdParty((uint64_t)v4);
}

+ (id)annotateBlockForContainerType:(int64_t)a3 block:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__C2CallstackAnnotations_annotateBlockForContainerType_block___block_invoke;
  v9[3] = &unk_1E6CCC778;
  id v10 = v5;
  int64_t v11 = a3;
  id v6 = v5;
  v7 = _Block_copy(v9);

  return v7;
}

uint64_t __62__C2CallstackAnnotations_annotateBlockForContainerType_block___block_invoke(uint64_t a1)
{
  return c2_callstack_annotation_ThirdParty(*(void *)(a1 + 32));
}

@end