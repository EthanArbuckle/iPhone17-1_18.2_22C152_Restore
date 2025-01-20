@interface UIRemoteDictionaryViewControllerAccessibility
@end

@implementation UIRemoteDictionaryViewControllerAccessibility

void __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = a1;
  location[0] = (id)[a1[4] accessoryView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location[0] allTargets];
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(__b[1] + 8 * v14);
        memset(v18, 0, sizeof(v18));
        id v10 = (id)[location[0] actionsForTarget:v21 forControlEvent:64];
        uint64_t v11 = [v10 countByEnumeratingWithState:v18 objects:v23 count:16];
        if (v11)
        {
          uint64_t v7 = *(void *)v18[2];
          uint64_t v8 = 0;
          unint64_t v9 = v11;
          while (1)
          {
            uint64_t v6 = v8;
            if (*(void *)v18[2] != v7) {
              objc_enumerationMutation(v10);
            }
            id v19 = *(id *)(v18[1] + 8 * v8);
            if (objc_msgSend(v19, "isEqualToString:", @"_handleDeleteButton:", v1))
            {
              id v4 = accessibilityLocalizedString(@"dictionary.delete.button");
              objc_msgSend(location[0], "setAccessibilityLabel:");

              id v5 = accessibilityLocalizedString(@"dictionary.delete.button.hint");
              objc_msgSend(location[0], "setAccessibilityHint:");

              goto LABEL_16;
            }
            if ([v19 isEqualToString:@"_handleDownloadButton:"]) {
              break;
            }
            id v1 = v19;
            _AXAssert();
            ++v8;
            if (v6 + 1 >= v9)
            {
              uint64_t v8 = 0;
              unint64_t v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v18, v23, 16, v1);
              if (!v9) {
                goto LABEL_16;
              }
            }
          }
          id v2 = accessibilityLocalizedString(@"dictionary.download.button");
          objc_msgSend(location[0], "setAccessibilityLabel:");

          id v3 = accessibilityLocalizedString(@"dictionary.download.button.hint");
          objc_msgSend(location[0], "setAccessibilityHint:");
        }
LABEL_16:

        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
}

void __82___UIRemoteDictionaryViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke_345(uint64_t a1)
{
  id v1 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

@end