@interface CATransaction(CoreMaterialAdditions)
+ (void)mt_addCompletionBlock:()CoreMaterialAdditions;
@end

@implementation CATransaction(CoreMaterialAdditions)

+ (void)mt_addCompletionBlock:()CoreMaterialAdditions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1B3E741F0](v4);
    v7 = [a1 completionBlock];
    v8 = v7;
    if (v7)
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __62__CATransaction_CoreMaterialAdditions__mt_addCompletionBlock___block_invoke;
      v13 = &unk_1E5F1B960;
      id v14 = v7;
      id v15 = v5;
      uint64_t v9 = MEMORY[0x1B3E741F0](&v10);

      v6 = (void *)v9;
    }
    objc_msgSend(a1, "setCompletionBlock:", v6, v10, v11, v12, v13);
  }
}

@end