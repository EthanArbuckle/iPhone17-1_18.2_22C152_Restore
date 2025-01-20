@interface BSDescriptionStream
@end

@implementation BSDescriptionStream

uint64_t __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"(%u)", *(void *)(a1 + 32));
}

void __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  if ([v4 isEqual:v3]) {
    [*(id *)(a1 + 40) appendString:v4 withName:0];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __89__BSDescriptionStream_BacklightServices__bls_appendTimeInterval_withName_decomposeUnits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%.0lfms", *(double *)(a1 + 32) * 1000.0);
}

@end