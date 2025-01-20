@interface LSCopyRationalizedGroupContainerURLDict
@end

@implementation LSCopyRationalizedGroupContainerURLDict

void ___LSCopyRationalizedGroupContainerURLDict_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (_NSIsNSString())
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5 isDirectory:1];
    if (v6) {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
  }
}

@end