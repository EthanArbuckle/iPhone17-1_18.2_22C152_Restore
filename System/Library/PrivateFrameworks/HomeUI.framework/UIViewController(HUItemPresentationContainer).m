@interface UIViewController(HUItemPresentationContainer)
- (id)hu_presentedItem;
- (id)hu_topmostPresentedItem;
@end

@implementation UIViewController(HUItemPresentationContainer)

- (id)hu_presentedItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(a1, "childViewControllers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hu_presentedItem");
        if (v6)
        {
          v7 = (void *)v6;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)hu_topmostPresentedItem
{
  uint64_t v2 = [a1 presentedViewController];
  if (v2)
  {
    uint64_t v3 = [a1 presentedViewController];
    uint64_t v4 = objc_msgSend(v3, "hu_topmostPresentedItem");
  }
  else
  {
    uint64_t v4 = objc_msgSend(a1, "hu_presentedItem");
  }

  return v4;
}

@end