@interface FBSSnapshot
@end

@implementation FBSSnapshot

uint64_t __23___FBSSnapshot_capture__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __23___FBSSnapshot_CGImage__block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[2] && !v2[4])
  {
    v4 = (void *)v2[3];
    if (v4) {
      BOOL v5 = a2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      id v7 = [v4 CGImageBuilder];
      id v6 = [v7 setOpaque:[*(id *)(*(void *)(a1 + 32) + 8) isOpaque]];
      *(void *)(*(void *)(a1 + 32) + 16) = [v7 buildCGImage];
    }
  }
}

@end