@interface NSString(AXRealityFoundationUtilities)
- (void)_accessibilityEnumerateDelayedDescriptionsWithBlock:()AXRealityFoundationUtilities;
@end

@implementation NSString(AXRealityFoundationUtilities)

- (void)_accessibilityEnumerateDelayedDescriptionsWithBlock:()AXRealityFoundationUtilities
{
  id v4 = a3;
  if (_accessibilityEnumerateDelayedDescriptionsWithBlock__onceToken != -1) {
    dispatch_once(&_accessibilityEnumerateDelayedDescriptionsWithBlock__onceToken, &__block_literal_global_1);
  }
  if (_accessibilityEnumerateDelayedDescriptionsWithBlock__regex)
  {
    id v5 = a1;
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v6 = (void *)_accessibilityEnumerateDelayedDescriptionsWithBlock__regex;
    uint64_t v7 = [v5 length];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __94__NSString_AXRealityFoundationUtilities___accessibilityEnumerateDelayedDescriptionsWithBlock___block_invoke_269;
    v16 = &unk_265149918;
    id v8 = v5;
    id v17 = v8;
    v19 = &v21;
    id v9 = v4;
    id v18 = v9;
    v20 = &v25;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v7, &v13);
    uint64_t v10 = v22[3];
    uint64_t v11 = objc_msgSend(v8, "length", v13, v14, v15, v16);
    v12 = objc_msgSend(v8, "substringWithRange:", v10, v11 - v22[3]);
    if ([v12 length]) {
      (*((void (**)(id, void *, double))v9 + 2))(v9, v12, v26[3]);
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    (*((void (**)(id, void *, double))v4 + 2))(v4, a1, 0.0);
  }
}

@end