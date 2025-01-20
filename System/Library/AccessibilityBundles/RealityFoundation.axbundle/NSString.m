@interface NSString
@end

@implementation NSString

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke()
{
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\{\\{\\{delay:([0-9]+(\\.[0-9]+)?)\\}\\}\\}" options:1 error:&v4];
  id v1 = v4;
  v2 = (void *)_accessibilityEnumerateDelayedDescriptionsWithBlock__regex;
  _accessibilityEnumerateDelayedDescriptionsWithBlock__regex = v0;

  if (!_accessibilityEnumerateDelayedDescriptionsWithBlock__regex)
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_cold_1((uint64_t)v1, v3);
    }
  }
}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_269(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rangeAtIndex:1];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL && v5 == 0)
  {
    v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_269_cold_1(v10);
    }

    uint64_t v9 = 0;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v5);
    [v7 doubleValue];
    uint64_t v9 = v8;
  }
  uint64_t v11 = [v3 range];
  uint64_t v13 = v12;

  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v15 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v11 - v14);
  if ([v15 length]) {
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 56) + 8)
  }
                                                                             + 24));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11 + v13;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24248E000, a2, OS_LOG_TYPE_ERROR, "Unable to create regular expression: %@", (uint8_t *)&v2, 0xCu);
}

void __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_269_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_24248E000, log, OS_LOG_TYPE_ERROR, "Problem detecting delay string. Using delay of 0.", v1, 2u);
}

@end