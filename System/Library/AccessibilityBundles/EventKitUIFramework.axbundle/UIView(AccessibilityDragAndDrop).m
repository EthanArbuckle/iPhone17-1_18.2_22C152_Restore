@interface UIView(AccessibilityDragAndDrop)
- (id)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop eventGestureController:;
- (uint64_t)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop;
@end

@implementation UIView(AccessibilityDragAndDrop)

- (uint64_t)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop
{
  return [a1 _accessibilityDragAndDropTargetViewForDrop:a3 eventGestureController:0];
}

- (id)_accessibilityDragAndDropTargetViewForDrop:()AccessibilityDragAndDrop eventGestureController:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 superview];
  if (v5)
  {
    v6 = (void *)v5;
    v17 = a4;
    do
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v7 = [v6 interactions];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
LABEL_5:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v12 delegate];
          }
          else
          {
            v13 = 0;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }

          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v9) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
        id v14 = v6;
        if (v17) {
          void *v17 = v13;
        }

        if (v14) {
          goto LABEL_20;
        }
      }
      else
      {
LABEL_14:
      }
      uint64_t v15 = [v6 superview];

      v6 = (void *)v15;
    }
    while (v15);
  }
  id v14 = 0;
LABEL_20:

  return v14;
}

@end