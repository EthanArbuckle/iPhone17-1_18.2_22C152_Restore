@interface INUICKPInterfaceSectionConverter
+ (id)_interactionMatchingCardSection:(id)a3 inCard:(id)a4;
+ (id)generateInterfaceSectionsFromCard:(id)a3;
+ (unint64_t)_intrinsicInteractiveBehaviorForCardSection:(id)a3;
@end

@implementation INUICKPInterfaceSectionConverter

+ (id)generateInterfaceSectionsFromCard:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v4 cardSections];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v11 = [a1 _interactionMatchingCardSection:v10 inCard:v4];
          v12 = [v10 parametersForInteraction:v11];
        }
        else
        {
          v12 = 0;
        }
        v13 = -[INUICKPCardInterfaceSection initWithInteractiveBehavior:parameters:]([INUICKPCardInterfaceSection alloc], "initWithInteractiveBehavior:parameters:", [a1 _intrinsicInteractiveBehaviorForCardSection:v10], v12);
        [(INUICKPCardInterfaceSection *)v13 setCardSection:v10];
        [v5 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

+ (id)_interactionMatchingCardSection:(id)a3 inCard:(id)a4
{
  id v4 = objc_msgSend(a4, "interactions", a3);
  id v5 = [v4 anyObject];

  return v5;
}

+ (unint64_t)_intrinsicInteractiveBehaviorForCardSection:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_opt_class(), "inuickp_interactiveBehaviorPrecedenceOrder");
  uint64_t v20 = [v4 count];
  unint64_t v5 = objc_msgSend(v3, "inuickp_intrinsicInteractiveBehavior");
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
  v21 = v4;
  uint64_t v7 = [v4 indexOfObject:v6];

  if (objc_opt_respondsToSelector())
  {
    id v19 = v3;
    uint64_t v8 = [v3 actionCommands];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = v20 - v7;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = objc_msgSend(v14, "inuickp_intrinsicInteractiveBehavior");
            v16 = [NSNumber numberWithUnsignedInteger:v15];
            unint64_t v17 = v20 - [v21 indexOfObject:v16];

            if (v17 > v11)
            {
              unint64_t v11 = v17;
              unint64_t v5 = v15;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v3 = v19;
  }

  return v5;
}

@end