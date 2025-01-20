@interface NSObject(IntentsUICardKitProvider)
+ (id)inuickp_interactiveBehaviorPrecedenceOrder;
- (uint64_t)inuickp_intrinsicInteractiveBehavior;
@end

@implementation NSObject(IntentsUICardKitProvider)

+ (id)inuickp_interactiveBehaviorPrecedenceOrder
{
  if (inuickp_interactiveBehaviorPrecedenceOrder_onceToken != -1) {
    dispatch_once(&inuickp_interactiveBehaviorPrecedenceOrder_onceToken, &__block_literal_global);
  }
  v0 = (void *)inuickp_interactiveBehaviorPrecedenceOrder_interactiveBehaviorPrecedenceOrder;
  return v0;
}

- (uint64_t)inuickp_intrinsicInteractiveBehavior
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![a1 conformsToProtocol:&unk_26E54B8E0]) {
    return 0;
  }
  v2 = objc_msgSend((id)objc_opt_class(), "inuickp_interactiveBehaviorPrecedenceOrder");
  uint64_t v17 = [v2 count];
  v3 = [NSNumber numberWithUnsignedInteger:0];
  v18 = v2;
  uint64_t v4 = [v2 indexOfObject:v3];

  uint64_t v5 = 0;
  if (objc_opt_respondsToSelector())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = [a1 actionCommands];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v5 = 0;
      unint64_t v9 = v17 - v4;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = objc_msgSend(v12, "inuickp_intrinsicInteractiveBehavior");
            v14 = [NSNumber numberWithUnsignedInteger:v13];
            unint64_t v15 = v17 - [v18 indexOfObject:v14];

            if (v15 > v9)
            {
              uint64_t v5 = v13;
              unint64_t v9 = v15;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

@end