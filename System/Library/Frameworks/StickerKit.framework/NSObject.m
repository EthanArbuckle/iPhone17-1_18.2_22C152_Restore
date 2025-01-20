@interface NSObject
@end

@implementation NSObject

void __69__NSObject_STKLoggable__stk_loggingDescriptionFromLoggable_isPretty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48)
    && (objc_opt_class(), ITKDynamicCast(), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(v6, "itk_prettyDescriptionWithTabLevel:", 1);
    [v8 appendFormat:@"\t%@ = %@\n", v10, v9];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", *(void *)(a1 + 40), v10, v5);
  }
}

@end