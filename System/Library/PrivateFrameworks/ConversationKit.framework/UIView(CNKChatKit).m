@interface UIView(CNKChatKit)
- (id)subviewForEffectsBrowserViewController;
@end

@implementation UIView(CNKChatKit)

- (id)subviewForEffectsBrowserViewController
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "subviews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = [v6 valueForKey:@"_viewDelegate"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v6;

          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

@end