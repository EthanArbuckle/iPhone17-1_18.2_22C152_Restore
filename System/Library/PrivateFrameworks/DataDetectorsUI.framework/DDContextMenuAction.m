@interface DDContextMenuAction
+ (BOOL)validateContext:(id)a3 silent:(BOOL)a4;
+ (id)buttonActionsForURL:(id)a3 result:(__DDResult *)a4 contact:(id)a5 icsString:(id)a6 context:(id)a7 view:(id)a8 identifier:(id)a9 suggestedActions:(id)a10 defaultAction:(id *)a11;
+ (id)contextMenuConfigurationAtIndex:(unint64_t)a3 inTextStorage:(id)a4 inView:(id)a5 context:(id)a6 menuIdentifier:(id)a7;
+ (id)contextMenuConfigurationForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 inView:(id)a7 context:(id)a8 menuIdentifier:(id)a9;
+ (id)contextMenuConfigurationWithRVItem:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6;
+ (id)contextMenuConfigurationWithResult:(__DDResult *)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6;
+ (id)contextMenuConfigurationWithURL:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6;
+ (id)defaultActionWithResult:(__DDResult *)a3 context:(id)a4;
+ (id)defaultActionWithURL:(id)a3 context:(id)a4;
+ (id)filterResultsForQuickActions:(id)a3;
+ (id)identificationStringsForMenuElement:(id)a3 useDefault:(BOOL)a4;
+ (id)previewActionForResult:(__DDResult *)a3 URL:(id)a4 context:(id)a5;
+ (id)previewViewProviderForPreviewAction:(id)a3 context:(id)a4;
+ (id)previewViewProviderForResult:(__DDResult *)a3 context:(id)a4;
+ (id)previewViewProviderForURL:(id)a3 context:(id)a4;
+ (id)updateContext:(id)a3 withSourceRect:(CGRect)a4;
+ (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6;
+ (void)performDefaultActionWithResult:(__DDResult *)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7;
+ (void)performDefaultActionWithURL:(id)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7;
- (DDContextMenuAction)initWithRVItem:(id)a3;
- (DDContextMenuAction)initWithResult:(__DDResult *)a3 URL:(id)a4;
- (id)_rawContextMenuContentForView:(id)a3 interactionDelegate:(id)a4 context:(id)a5 elements:(id)a6 defaultAction:(id *)a7 options:(int64_t)a8;
- (id)_updateMenuElementItems:(id)a3 withActions:(id)a4 view:(id)a5 interactionDelegate:(id)a6 options:(int64_t)a7 level:(unint64_t)a8 parent:(id)a9;
- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5;
- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5 defaultAction:(id *)a6 menuProvider:(id *)a7 options:(int64_t)a8;
- (id)initAtIndex:(unint64_t)a3 inTextStorage:(id)a4;
- (void)commonInitWithResult:(__DDResult *)a3 URL:(id)a4;
- (void)dealloc;
@end

@implementation DDContextMenuAction

+ (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 interactionType])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__DDContextMenuAction_performAction_fromView_alertController_interactionDelegate___block_invoke;
    v14[3] = &unk_1E5A855A0;
    id v15 = v9;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
  else
  {
    v13 = +[DDDetectionController sharedController];
    [v13 performAction:v9 fromView:v10 alertController:v11 interactionDelegate:v12];
  }
}

void __82__DDContextMenuAction_performAction_fromView_alertController_interactionDelegate___block_invoke(void *a1)
{
  id v2 = +[DDDetectionController sharedController];
  [v2 performAction:a1[4] fromView:a1[5] alertController:a1[6] interactionDelegate:a1[7]];
}

+ (BOOL)validateContext:(id)a3 silent:(BOOL)a4
{
  v5 = [a3 objectForKeyedSubscript:@"SourceRect"];

  if (!v5 && !a4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[DDContextMenuAction validateContext:silent:]();
  }
  return v5 != 0;
}

+ (id)updateContext:(id)a3 withSourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a3)
  {
    uint64_t v8 = [a3 mutableCopy];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = (void *)v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v9 setObject:v10 forKey:@"SourceRect"];

  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"defaultHttpActionRequested"];
  return v9;
}

+ (id)contextMenuConfigurationAtIndex:(unint64_t)a3 inTextStorage:(id)a4 inView:(id)a5 context:(id)a6 menuIdentifier:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = [[DDContextMenuAction alloc] initAtIndex:a3 inTextStorage:v11];
  id v16 = v15[1];
  id v17 = v15[2];
  id v18 = +[DDDetectionController updateContext:v14 forResult:v17 atIndex:a3 ofStorage:v11];

  if (!+[DDDetectionController largeScreenIdiom]) {
    goto LABEL_24;
  }
  v19 = [v18 objectForKeyedSubscript:@"SourceRect"];

  if (v19)
  {
    id v20 = a1;
    goto LABEL_23;
  }
  v21 = [v11 layoutManagers];
  v22 = [v21 firstObject];

  if (!v22)
  {
    if (objc_opt_respondsToSelector())
    {
      v22 = [v12 layoutManager];
    }
    else
    {
      v22 = 0;
    }
  }
  v23 = [v22 textContainers];
  uint64_t v52 = [v23 firstObject];

  v53 = v22;
  if (v17)
  {
    uint64_t RangeForURLification = DDResultGetRangeForURLification();
    uint64_t v26 = v25;
    id v20 = a1;
    goto LABEL_10;
  }
  v41 = [v16 scheme];
  if ([v41 isEqualToString:@"x-apple-data-detectors-clientdefined"])
  {
    v42 = [v18 objectForKeyedSubscript:@"CustomActionRanges"];

    if (v42)
    {
      v43 = [v16 path];
      uint64_t v44 = [v43 integerValue];

      v45 = [v18 objectForKeyedSubscript:@"CustomActionRanges"];
      id v20 = a1;
      if ([v45 count] <= v44)
      {
        uint64_t v26 = 0;
        uint64_t RangeForURLification = -1;
      }
      else
      {
        [v45 objectAtIndexedSubscript:v44];
        v46 = v51 = v45;
        uint64_t RangeForURLification = [v46 rangeValue];
        uint64_t v26 = v47;

        v45 = v51;
      }

      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  v48 = [v11 attribute:*MEMORY[0x1E4F42530] atIndex:a3 effectiveRange:&v55];

  id v20 = a1;
  if (!v48) {
    goto LABEL_21;
  }
  uint64_t RangeForURLification = v55;
  uint64_t v26 = v56;
LABEL_10:
  if (RangeForURLification != -1)
  {
    uint64_t v27 = objc_msgSend(v53, "glyphRangeForCharacterRange:actualCharacterRange:", RangeForURLification, v26, 0);
    v28 = (void *)v52;
    objc_msgSend(v53, "boundingRectForGlyphRange:inTextContainer:", v27, v29, v52);
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 textContainerInset];
      double v31 = v31 + v38;
      double v33 = v33 + v39;
    }
    uint64_t v40 = +[DDContextMenuAction updateContext:withSourceRect:](DDContextMenuAction, "updateContext:withSourceRect:", v18, v31, v33, v35, v37);

    id v18 = (void *)v40;
    goto LABEL_22;
  }
LABEL_21:
  v28 = (void *)v52;
LABEL_22:

LABEL_23:
  if ([v20 validateContext:v18 silent:0])
  {
LABEL_24:
    v49 = [v15 contextMenuConfigurationWithIdentifier:v13 inView:v12 context:v18];
    goto LABEL_26;
  }
  v49 = 0;
LABEL_26:

  return v49;
}

+ (id)contextMenuConfigurationForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 inView:(id)a7 context:(id)a8 menuIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([a1 validateContext:v20 silent:0] && (dd_urlLooksSuspicious(v15) & 1) == 0)
  {
    v23 = +[DDDetectionController sharedController];
    id v28 = 0;
    uint64_t v24 = [v23 resultForURL:v15 identifier:v16 selectedText:v17 results:v18 context:v20 extendedContext:&v28];
    id v25 = v28;

    uint64_t v26 = [[DDContextMenuAction alloc] initWithResult:v24 URL:v15];
    v22 = [(DDContextMenuAction *)v26 contextMenuConfigurationWithIdentifier:v21 inView:v19 context:v25];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)contextMenuConfigurationWithResult:(__DDResult *)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([a1 validateContext:v11 silent:0])
  {
    id v13 = [[DDContextMenuAction alloc] initWithResult:a3 URL:0];
    id v14 = [(DDContextMenuAction *)v13 contextMenuConfigurationWithIdentifier:v12 inView:v10 context:v11];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)contextMenuConfigurationWithURL:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([a1 validateContext:v12 silent:0] && (dd_urlLooksSuspicious(v10) & 1) == 0)
  {
    id v15 = [[DDContextMenuAction alloc] initWithResult:0 URL:v10];
    id v14 = [(DDContextMenuAction *)v15 contextMenuConfigurationWithIdentifier:v13 inView:v11 context:v12];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)contextMenuConfigurationWithRVItem:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([a1 validateContext:v12 silent:0])
  {
    id v14 = [[DDContextMenuAction alloc] initWithRVItem:v10];
    id v15 = [(DDContextMenuAction *)v14 contextMenuConfigurationWithIdentifier:v13 inView:v11 context:v12];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)defaultActionWithResult:(__DDResult *)a3 context:(id)a4
{
  id v6 = a4;
  if ([a1 validateContext:v6 silent:0])
  {
    v7 = +[DDDetectionController sharedController];
    if ([v7 _shouldImmediatelyShowActionSheetForCoreResult:a3])
    {
      uint64_t v8 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F5F150] resultFromCoreResult:a3];
      id v10 = (void *)v7[7];
      id v11 = [v9 url];
      uint64_t v8 = [v10 defaultActionForURL:v11 result:a3 context:v6];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)defaultActionWithURL:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 validateContext:v7 silent:0])
  {
    uint64_t v8 = +[DDDetectionController sharedController];
    if ([v8 _shouldImmediatelyShowActionSheetForURL:v6])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [v8[7] defaultActionForURL:v6 result:0 context:v7];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)previewViewProviderForPreviewAction:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 allKeys];
  int v8 = [v7 containsObject:@"kDDContextMenuWantsPreviewKey"];

  if (v8)
  {
    id v9 = [v6 objectForKey:@"kDDContextMenuWantsPreviewKey"];
    int v10 = [v9 BOOLValue];
  }
  else
  {
    int v10 = 1;
  }
  id v11 = 0;
  if (v5 && v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__DDContextMenuAction_previewViewProviderForPreviewAction_context___block_invoke;
    v14[3] = &unk_1E5A85BE8;
    id v15 = v5;
    id v11 = (void *)MEMORY[0x1A6236DA0](v14);
  }
  id v12 = (void *)MEMORY[0x1A6236DA0](v11);

  return v12;
}

id __67__DDContextMenuAction_previewViewProviderForPreviewAction_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) url];
  if (v2
    && +[DDClientPreviewAction clientCanPerformActionWithUrl:v2])
  {
    if (dd_isDeviceLocked())
    {
      v3 = 0;
    }
    else
    {
      id v5 = [DDClientPreviewAction alloc];
      id v6 = [*(id *)(a1 + 32) context];
      id v7 = [(DDAction *)v5 initWithURL:v2 result:0 context:v6];
      v3 = [(DDClientPreviewAction *)v7 viewController];
    }
  }
  else
  {
    v3 = [*(id *)(a1 + 32) previewViewController];
  }

  return v3;
}

+ (id)buttonActionsForURL:(id)a3 result:(__DDResult *)a4 contact:(id)a5 icsString:(id)a6 context:(id)a7 view:(id)a8 identifier:(id)a9 suggestedActions:(id)a10 defaultAction:(id *)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v16 || a4 || v17 || v18)
  {
    if ((dd_urlLooksSuspicious(v16) & 1) == 0)
    {
      if (_DDResultIsURL((uint64_t)a4))
      {
        uint64_t v24 = _DDURLFromResult((uint64_t)a4);
        id v25 = v24;
        if (!v24 || (dd_urlLooksSuspicious(v24) & 1) != 0)
        {

          goto LABEL_12;
        }
      }
      uint64_t v26 = +[DDDetectionController barcodeContext:v19 preview:1 contact:v17 ics:v18];

      uint64_t v27 = [[DDContextMenuAction alloc] initWithResult:a4 URL:v16];
      id v33 = 0;
      id v28 = [v26 objectForKeyedSubscript:@"kDDContextUsePlaceholderDefaultActionKey"];
      if ([v28 BOOLValue]) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 0;
      }
      id v30 = [(DDContextMenuAction *)v27 contextMenuConfigurationWithIdentifier:v21 inView:v20 context:v26 defaultAction:a11 menuProvider:&v33 options:v29];
      double v31 = (void (**)(id, id))v33;

      if (v31)
      {
        v23 = v31[2](v31, v22);
      }
      else
      {
        v23 = 0;
      }

      id v19 = v26;
      goto LABEL_21;
    }
  }
  else if (a11)
  {
    v23 = 0;
    *a11 = 0;
    goto LABEL_21;
  }
LABEL_12:
  v23 = 0;
LABEL_21:

  return v23;
}

- (id)_rawContextMenuContentForView:(id)a3 interactionDelegate:(id)a4 context:(id)a5 elements:(id)a6 defaultAction:(id *)a7 options:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v47 = a6;
  item = self->_item;
  if (item)
  {
    if ([(RVItem *)item normalizedType] == 6)
    {
      id v46 = v15;
      id v18 = v14;
      id v19 = [DDLookupAction alloc];
      id v20 = [(RVItem *)self->_item query];
      uint64_t v21 = [(DDLookupAction *)v19 initWithRVQuery:v20 context:v16];
    }
    else
    {
      uint64_t v24 = [(RVItem *)self->_item highlightRange];
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v26 = 0;
        uint64_t v27 = v47;
        goto LABEL_27;
      }
      id v46 = v15;
      id v18 = v14;
      unint64_t v28 = v24 + v25;
      uint64_t v29 = [(RVItem *)self->_item text];
      unint64_t v30 = [v29 length];

      if (v28 > v30)
      {
        id v26 = 0;
        id v14 = v18;
        id v15 = v46;
        uint64_t v27 = v47;
        goto LABEL_27;
      }
      double v31 = [DDLookupAction alloc];
      id v20 = [(RVItem *)self->_item text];
      uint64_t v32 = [(RVItem *)self->_item highlightRange];
      uint64_t v21 = -[DDLookupAction initWithQueryString:range:context:](v31, "initWithQueryString:range:context:", v20, v32, v33, v16);
    }
    v23 = (void *)v21;

    if (+[DDParsecAction isAvailable]) {
      id v22 = v23;
    }
    else {
      id v22 = 0;
    }
  }
  else
  {
    id v46 = v15;
    id v18 = v14;
    id v22 = +[DDContextMenuAction previewActionForResult:self->_result URL:self->_url context:v16];
    v23 = v22;
  }
  int64_t v34 = a8;
  if (!v23)
  {
    v45 = a7;
    double v39 = +[DDDetectionController sharedController];
    uint64_t v40 = [v39 actionsForResult:self->_result context:v16];
    double v37 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v40);

    if (-[DDActionGroup count]((uint64_t)v37))
    {
      uint64_t v27 = v47;
      id v14 = v18;
      id v41 = v18;
      id v15 = v46;
      [(DDContextMenuAction *)self _updateMenuElementItems:v47 withActions:v37 view:v41 interactionDelegate:v46 options:v34 level:0 parent:0];
      double v38 = LABEL_22:;
      a7 = v45;
      goto LABEL_23;
    }
    id v14 = v18;
    id v15 = v46;
LABEL_25:
    uint64_t v27 = v47;
    goto LABEL_26;
  }
  if (([v23 showMenuTitle] & 1) == 0)
  {
    menuTitle = self->_menuTitle;
    self->_menuTitle = 0;
  }
  uint64_t v36 = [v23 menuActions];
  id v14 = v18;
  if (!v36)
  {
    v45 = a7;
    v42 = +[DDDetectionController sharedController];
    v43 = [v42 actionsForResult:self->_result context:v16];
    double v37 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v43);

    id v15 = v46;
    if (-[DDActionGroup count]((uint64_t)v37))
    {
      uint64_t v27 = v47;
      [(DDContextMenuAction *)self _updateMenuElementItems:v47 withActions:v37 view:v14 interactionDelegate:v46 options:v34 level:0 parent:0];
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  double v37 = (void *)v36;
  id v15 = v46;
  uint64_t v27 = v47;
  double v38 = [(DDContextMenuAction *)self _updateMenuElementItems:v47 withActions:v36 view:v14 interactionDelegate:v46 options:v34 level:0 parent:0];
LABEL_23:
  *a7 = v38;
LABEL_26:

  id v26 = v22;
LABEL_27:

  return v26;
}

+ (id)filterResultsForQuickActions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (_DDResultIsURL([v9 coreResult]))
        {
          int v10 = [v9 url];
          id v11 = v10;
          if (!v10 || dd_urlLooksSuspicious(v10))
          {

            continue;
          }
        }
        if ((objc_msgSend(v9, "ddui_canBeCombinedToOthers") & 1) == 0)
        {
          id v12 = (void *)MEMORY[0x1A6236B60]();
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = v4;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v21 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (objc_msgSend(v9, "ddui_isEquivalentToResult:", *(void *)(*((void *)&v20 + 1) + 8 * j)))
                {

                  goto LABEL_24;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
        [v4 addObject:v9];
        if ([v4 count] == 50) {
          goto LABEL_26;
        }
LABEL_24:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
LABEL_26:

  return v4;
}

+ (id)identificationStringsForMenuElement:(id)a3 useDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 identifier];
    if (!v7 && !v4) {
      goto LABEL_15;
    }
    if (v7 == 0 && v4) {
      int v8 = @"none";
    }
    else {
      int v8 = (__CFString *)v7;
    }
    [v6 addObject:v8];
  }
  else
  {
    if (!v4) {
      goto LABEL_15;
    }
    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v8 isEqualToString:@"_UIImmutableCommand"])
    {
      int v10 = (const char *)[v5 action];
      if (v10)
      {
        id v11 = NSStringFromSelector(v10);
        [v6 addObject:v11];
      }
      id v12 = (const char *)[v5 fallbackAction];
      if (v12)
      {
        id v13 = NSStringFromSelector(v12);
        [v6 addObject:v13];
      }
    }
  }

LABEL_15:
  if ([v6 count]) {
    uint64_t v14 = v6;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 objectForKeyedSubscript:@"kDDContextUsePlaceholderDefaultActionKey"];
  if ([v11 BOOLValue]) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [(DDContextMenuAction *)self contextMenuConfigurationWithIdentifier:v10 inView:v9 context:v8 defaultAction:0 menuProvider:0 options:v12];

  return v13;
}

- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5 defaultAction:(id *)a6 menuProvider:(id *)a7 options:(int64_t)a8
{
  id v57 = a3;
  id v59 = a4;
  id v12 = a5;
  id v13 = self->_result;
  if (v13)
  {
    uint64_t v14 = (__DDResult *)DDCreateUpdatedResultWithContext(v13, v12);
    if (v14)
    {
      id v15 = self->_result;
      self->_result = v14;
      CFRelease(v15);
    }
  }
  uint64_t v16 = [v12 objectForKeyedSubscript:@"ICS"];
  if ([v16 length])
  {
    id v17 = +[DDAddEventAction cachedEventForICSString:v16];
    if (v17)
    {
      uint64_t v18 = +[DDAction contextByAddingValue:v17 toKey:0x1EF5023F8 inContext:v12];

      id v12 = (id)v18;
    }
  }
  uint64_t v19 = [v12 copy];

  v54 = v16;
  if (self->_originalItem) {
    long long v20 = [[DDRVInteractionDelegate alloc] initWithItem:self->_originalItem];
  }
  else {
    long long v20 = 0;
  }
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  v76[0] = 0;
  uint64_t v56 = v20;
  v58 = (void *)v19;
  long long v22 = [(DDContextMenuAction *)self _rawContextMenuContentForView:v59 interactionDelegate:v20 context:v19 elements:v21 defaultAction:v76 options:a8];
  id v23 = v76[0];
  objc_initWeak(&location, v59);
  if (![v21 count])
  {
    int64_t v34 = 0;
    goto LABEL_40;
  }
  if (self->_additionalLookupItem && +[DDParsecAction isAvailable])
  {
    long long v24 = [(RVItem *)self->_additionalLookupItem ddResult];
    long long v25 = [v24 value];

    if ([v25 length])
    {
      long long v26 = -[DDLookupAction initWithQueryString:range:context:]([DDLookupAction alloc], "initWithQueryString:range:context:", v25, 0, [v25 length], v19);
      long long v27 = +[DDActionGroup groupWithAction:]((uint64_t)DDActionGroup, v26);
      id v28 = [(DDContextMenuAction *)self _updateMenuElementItems:v21 withActions:v27 view:v59 interactionDelegate:v56 options:a8 level:0 parent:0];
    }
  }
  char v29 = a8 & 1;
  if ([v22 menuHasHeaderView])
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F42918];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke;
    v73[3] = &unk_1E5A85C10;
    id v74 = v22;
    double v31 = [v30 elementWithViewProvider:v73];
    [v21 insertObject:v31 atIndex:0];

    uint64_t v32 = 0;
    uint64_t v33 = v74;
LABEL_19:

    goto LABEL_25;
  }
  if (a8)
  {
    uint64_t v32 = 0;
    goto LABEL_25;
  }
  uint64_t v32 = [(NSAttributedString *)self->_menuTitle string];
  if ((unint64_t)[v32 length] >= 0x100)
  {
    uint64_t v33 = [v32 substringToIndex:255];
    uint64_t v35 = [v33 stringByAppendingString:@"…"];

    uint64_t v32 = (void *)v35;
    goto LABEL_19;
  }
LABEL_25:
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_2;
  v67[3] = &unk_1E5A85C38;
  id v68 = v21;
  char v72 = v29;
  id v36 = v58;
  id v69 = v36;
  id v37 = v32;
  id v70 = v37;
  id v38 = v57;
  id v71 = v38;
  double v39 = (void *)MEMORY[0x1A6236DA0](v67);
  uint64_t v40 = v39;
  if (a7) {
    *a7 = (id)[v39 copy];
  }
  id v41 = [(id)objc_opt_class() previewViewProviderForPreviewAction:v22 context:v36];
  int64_t v34 = +[UIContextMenuConfiguration configurationWithIdentifier:v38 previewProvider:v41 actionProvider:v40];

  if (v22)
  {
    v42 = [v22 commitURL];
    [v34 setInteractionURL:v42];

    if (([v22 wantsSeamlessCommit] & 1) != 0
      || [v22 wantsCustomViewControllerCommit])
    {
      uint64_t v43 = dd_isDeviceLocked() ^ 1;
    }
    else
    {
      uint64_t v43 = 0;
    }
    [v34 setExpandPreviewOnInteraction:v43];
    if (v43)
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_3;
      v64[3] = &unk_1E5A85C60;
      objc_copyWeak(&v66, &location);
      id v65 = v22;
      [v34 setInteractionViewControllerProvider:v64];

      objc_destroyWeak(&v66);
    }
    objc_msgSend(v34, "setPrefersActionMenuStyle:", objc_msgSend(v22, "prefersActionMenuStyle"));
  }
  if (a6)
  {
    uint64_t v44 = [v23 defaultAction];

    if (v44)
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_4;
      v60[3] = &unk_1E5A85C88;
      id v52 = v37;
      objc_copyWeak(&v63, &location);
      id v23 = v44;
      id v61 = v23;
      v62 = v56;
      v45 = (void *)MEMORY[0x1A6236DA0](v60);
      id v46 = [v23 compactTitle];
      id v47 = [v23 compactIcon];
      v48 = [v23 generateIdentifier];
      v49 = +[DDUIAction actionWithTitle:v46 image:v47 identifier:v48 handler:v45];

      objc_msgSend(v49, "setDd_action:", v23);
      objc_msgSend(v49, "setDd_handler:", v45);
      id v50 = v49;
      *a6 = v50;

      objc_destroyWeak(&v63);
      id v37 = v52;
    }
    else
    {
      id v23 = 0;
      *a6 = 0;
    }
  }

LABEL_40:
  objc_destroyWeak(&location);

  return v34;
}

uint64_t __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) menuHeaderView];
}

id __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(a1 + 32)];
  if (+[DDParsecAction isAvailable])
  {
    id v37 = &unk_1EF510C68;
  }
  else
  {
    id v37 = [&unk_1EF510C68 arrayByAddingObject:*MEMORY[0x1E4F43BC8]];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v5 = (void *)[v4 copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (!v6) {
      goto LABEL_45;
    }
    uint64_t v7 = v6;
    uint64_t v35 = a1;
    id v36 = v4;
    id v34 = v3;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v11 = +[DDContextMenuAction identificationStringsForMenuElement:useDefault:](DDContextMenuAction, "identificationStringsForMenuElement:useDefault:", v10, 0, v34);
        id v12 = [v11 firstObject];

        if (v12)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v13 = [&unk_1EF510C80 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v47;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v47 != v15) {
                  objc_enumerationMutation(&unk_1EF510C80);
                }
                if ([v12 hasPrefix:*(void *)(*((void *)&v46 + 1) + 8 * j)])
                {
                  [v36 removeObject:v10];
                  goto LABEL_21;
                }
              }
              uint64_t v14 = [&unk_1EF510C80 countByEnumeratingWithState:&v46 objects:v56 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
LABEL_21:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v7);
    id v3 = v34;
    BOOL v4 = v36;
    goto LABEL_44;
  }
  uint64_t v35 = a1;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v43 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * k);
        id v23 = +[DDContextMenuAction identificationStringsForMenuElement:v22 useDefault:0];
        long long v24 = [v23 firstObject];

        if (!v24 || ([v37 containsObject:v24] & 1) == 0) {
          [v4 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v19);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  a1 = v35;
  id v5 = [*(id *)(v35 + 40) objectForKey:@"kDDContextMenuActionsKey"];
  uint64_t v25 = [v5 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v5);
        }
        uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * m);
        uint64_t v30 = +[DDContextMenuAction identificationStringsForMenuElement:v29 useDefault:0];
        double v31 = [v30 firstObject];

        if (!v31 || ([v37 containsObject:v31] & 1) == 0) {
          [v4 addObject:v29];
        }
      }
      uint64_t v26 = [v5 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v26);
LABEL_44:
    a1 = v35;
  }
LABEL_45:

  uint64_t v32 = [MEMORY[0x1E4F42B80] menuWithTitle:*(void *)(a1 + 48) image:0 identifier:*(void *)(a1 + 56) options:*(unsigned __int8 *)(a1 + 64) children:v4];

  return v32;
}

id __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) expandViewController];
  BOOL v4 = [v3 popoverPresentationController];
  [*(id *)(a1 + 32) setupPopoverPresentationController:v4 view:WeakRetained];

  return v3;
}

uint64_t __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    +[DDContextMenuAction performAction:*(void *)(a1 + 32) fromView:WeakRetained alertController:0 interactionDelegate:*(void *)(a1 + 40)];
  }
  return MEMORY[0x1F41817F8]();
}

- (id)initAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DDContextMenuAction;
  uint64_t v7 = [(DDContextMenuAction *)&v16 init];
  if (v7)
  {
    uint64_t v8 = +[DDDetectionController sharedController];
    uint64_t v9 = [v8 resultForLinkAtIndex:a3 inTextStorage:v6];

    if (v9)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v11 = +[DDDetectionController sharedController];
      uint64_t v10 = [v11 linkAtIndex:a3 inTextStorage:v6];
    }
    [(DDContextMenuAction *)v7 commonInitWithResult:v9 URL:v10];
    id v12 = +[DDDetectionController sharedController];
    uint64_t v13 = [v12 attributedTitleForResultAtIndex:a3 ofStorage:v6 updaterBlock:0];
    menuTitle = v7->_menuTitle;
    v7->_menuTitle = (NSAttributedString *)v13;
  }
  return v7;
}

- (DDContextMenuAction)initWithResult:(__DDResult *)a3 URL:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DDContextMenuAction;
  uint64_t v7 = [(DDContextMenuAction *)&v13 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(DDContextMenuAction *)v7 commonInitWithResult:a3 URL:v6];
    if (a3)
    {
      uint64_t v9 = +[DDDetectionController sharedController];
      uint64_t v10 = [v9 attributedTitleForResult:a3 updaterBlock:0];
LABEL_6:
      menuTitle = v8->_menuTitle;
      v8->_menuTitle = (NSAttributedString *)v10;

      goto LABEL_7;
    }
    if (v6)
    {
      uint64_t v9 = +[DDDetectionController sharedController];
      uint64_t v10 = [v9 attributedTitleForURL:v6 updaterBlock:0];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (DDContextMenuAction)initWithRVItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_originalItem, a3);
  switch([v5 normalizedType])
  {
    case 1:
      uint64_t v14 = [v5 normalizedURL];
      if (v14)
      {
        uint64_t v15 = [v5 normalizedURL];
        char v16 = dd_urlLooksSuspicious(v15);

        if (v16) {
          goto LABEL_13;
        }
        id v17 = [v5 normalizedURL];
        uint64_t v18 = self;
        uint64_t v19 = 0;
        uint64_t v20 = v17;
        goto LABEL_18;
      }
      break;
    case 2:
    case 6:
      v31.receiver = self;
      v31.super_class = (Class)DDContextMenuAction;
      self = [(DDContextMenuAction *)&v31 init];
      if (self)
      {
        id v6 = [v5 query];
        uint64_t v7 = [v6 title];

        if (![(__CFString *)v7 length])
        {
          uint64_t v8 = [v5 ddResult];
          uint64_t v9 = [v8 matchedString];

          uint64_t v7 = (__CFString *)v9;
        }
        if (![(__CFString *)v7 length])
        {
          uint64_t v10 = [v5 text];

          uint64_t v11 = [v5 highlightRange];
          uint64_t v13 = v12;
          if ([v10 length] && v11 + v13 <= (unint64_t)objc_msgSend(v10, "length"))
          {
            objc_msgSend(v10, "substringWithRange:", v11, v13);
            uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v7 = 0;
          }
        }
        uint64_t v26 = &stru_1EF5023D8;
        if (v7) {
          uint64_t v26 = v7;
        }
        uint64_t v27 = v26;

        objc_storeStrong((id *)&self->_item, a3);
        id v28 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v27];

        menuTitle = self->_menuTitle;
        self->_menuTitle = v28;
      }
      goto LABEL_24;
    case 3:
      long long v21 = [v5 ddResult];
      int v22 = [v21 category];

      if (v22 == 1)
      {
LABEL_13:
        uint64_t v14 = 0;
      }
      else
      {
        id v23 = [v5 ddResult];
        long long v24 = [v23 type];
        if ([v24 isEqualToString:*MEMORY[0x1E4F5F080]]) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = v5;
        }
        objc_storeStrong((id *)&self->_additionalLookupItem, v25);

        id v17 = [v5 ddResult];
        uint64_t v19 = [v17 coreResult];
        uint64_t v18 = self;
        uint64_t v20 = 0;
LABEL_18:
        self = [(DDContextMenuAction *)v18 initWithResult:v19 URL:v20];

        uint64_t v14 = self;
      }
      break;
    default:
LABEL_24:
      self = self;
      uint64_t v14 = self;
      break;
  }

  return v14;
}

- (void)commonInitWithResult:(__DDResult *)a3 URL:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    id v9 = v7;
    self->_result = (__DDResult *)CFRetain(a3);
    uint64_t v8 = +[DDDetectionController sharedController];
    [v8 interactionDidStartForResult:a3];
  }
  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    id v9 = v7;
    objc_storeStrong((id *)&self->_url, a4);
    uint64_t v8 = +[DDDetectionController sharedController];
    [v8 interactionDidStartForURL:v9];
  }

  id v7 = v9;
LABEL_6:
}

- (void)dealloc
{
  result = self->_result;
  if (result) {
    CFRelease(result);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDContextMenuAction;
  [(DDContextMenuAction *)&v4 dealloc];
}

- (id)_updateMenuElementItems:(id)a3 withActions:(id)a4 view:(id)a5 interactionDelegate:(id)a6 options:(int64_t)a7 level:(unint64_t)a8 parent:(id)a9
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = (id *)a4;
  id v14 = a5;
  id v65 = a6;
  uint64_t v15 = (id *)a9;
  id v59 = v14;
  v60 = v12;
  id v66 = v13;
  if (!v12)
  {
    uint64_t v18 = 0;
    goto LABEL_68;
  }
  id v57 = v15;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __105__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options_level_parent___block_invoke;
  v80[3] = &unk_1E5A85CB0;
  id v16 = v14;
  id v81 = v16;
  -[DDActionGroup finalizeWithFilter:]((uint64_t)v13, v80);
  if (-[DDActionGroup count]((uint64_t)v13))
  {
    objc_initWeak(&location, v16);
    id v17 = -[DDActionGroup children](v13);

    int64_t v55 = a7 & 5;
    if (v17)
    {
      id v63 = [MEMORY[0x1E4F1CA48] array];
      if (a8) {
        BOOL v56 = -[DDActionGroup inlinedGroup]((BOOL)v13);
      }
      else {
        BOOL v56 = 0;
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v76 = 0u;
      long long v75 = 0u;
      long long v24 = -[DDActionGroup children](v13);
      id v23 = 0;
      uint64_t v20 = 0;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v76;
        do
        {
          uint64_t v27 = 0;
          id v28 = v23;
          uint64_t v29 = v20;
          do
          {
            if (*(void *)v76 != v26) {
              objc_enumerationMutation(v24);
            }
            id v23 = [(DDContextMenuAction *)self _updateMenuElementItems:v63 withActions:*(void *)(*((void *)&v75 + 1) + 8 * v27) view:v16 interactionDelegate:v65 options:a7 level:!v56 + a8 parent:v66];

            uint64_t v20 = selectDefaultAction(v29, v23);

            ++v27;
            id v28 = v23;
            uint64_t v29 = v20;
          }
          while (v25 != v27);
          uint64_t v25 = [v24 countByEnumeratingWithState:&v75 objects:v83 count:16];
        }
        while (v25);
      }

      if (a8)
      {
        uint64_t v30 = -[DDActionGroup mainAction]((uint64_t)v66);

        [v30 setTreatAsMenu:1];
        if (v56)
        {
          objc_super v31 = 0;
          id v32 = v63;
        }
        else
        {
          id v32 = v63;
          if (a8 == 1)
          {
            uint64_t v33 = [v30 menuName];
          }
          else
          {
            if (v55 == 5) {
              [v30 serviceCompactName];
            }
            else {
            uint64_t v33 = [v30 serviceName];
            }
          }
          objc_super v31 = (void *)v33;
        }
        id v34 = (void *)MEMORY[0x1E4F42B80];
        uint64_t v35 = [v30 menuIcon];
        id v36 = [v30 generateIdentifier];
        id v37 = [v34 menuWithTitle:v31 image:v35 identifier:v36 options:v56 children:v32];
        [v60 addObject:v37];

        [v30 setTreatAsMenu:0];
        id v23 = v30;
      }
      else if (v63)
      {
        objc_msgSend(v60, "addObjectsFromArray:");
      }
LABEL_61:

      uint64_t v19 = v63;
LABEL_62:

      if ((a7 & 2) != 0 && [v20 isMemberOfClass:objc_opt_class()]) {
        long long v53 = objc_alloc_init(DDPlaceholderAction);
      }
      else {
        long long v53 = v20;
      }
      uint64_t v18 = v53;

      objc_destroyWeak(&location);
      goto LABEL_67;
    }
    uint64_t v19 = -[DDActionGroup ddAction](v13);
    if (!v19)
    {
      uint64_t v20 = 0;
      goto LABEL_62;
    }
    uint64_t v20 = selectDefaultAction(0, v19);
    char v62 = [v19 menuItemattributes];
    long long v21 = v19;
    if (![v19 menuItemNameCanFallbackToServiceName]) {
      goto LABEL_48;
    }
    if (a8 == 2)
    {
      long long v38 = -[DDActionGroup children](v57);
      BOOL v39 = (unint64_t)[v38 count] > 1;

      if (!v39) {
        goto LABEL_48;
      }
      long long v40 = [v21 _serviceIdentifier];
      if (v40)
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v41 = -[DDActionGroup children](v57);
        uint64_t v42 = [v41 countByEnumeratingWithState:&v71 objects:v82 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v72;
          while (2)
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v72 != v43) {
                objc_enumerationMutation(v41);
              }
              long long v45 = -[DDActionGroup ddAction](*(id **)(*((void *)&v71 + 1) + 8 * i));
              long long v46 = [v45 _serviceIdentifier];
              char v47 = [v46 isEqualToString:v40];

              if ((v47 & 1) == 0)
              {

                goto LABEL_72;
              }
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v71 objects:v82 count:16];
            if (v42) {
              continue;
            }
            break;
          }
        }

        goto LABEL_48;
      }
LABEL_72:
      if (v55 == 5) {
        [v21 serviceCompactName];
      }
      else {
      uint64_t v22 = [v21 serviceName];
      }
    }
    else
    {
      if (a8 != 1) {
        goto LABEL_48;
      }
      uint64_t v22 = [v19 menuName];
    }
    id v23 = (void *)v22;
    if (v22)
    {
LABEL_52:
      long long v48 = (void *)MEMORY[0x1E4F426E8];
      if (v62)
      {
        long long v49 = 0;
      }
      else
      {
        long long v49 = [v21 icon];
      }
      long long v50 = [v21 generateIdentifier];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __105__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options_level_parent___block_invoke_2;
      v67[3] = &unk_1E5A85C88;
      objc_copyWeak(&v70, &location);
      id v63 = v21;
      id v68 = v63;
      id v69 = v65;
      long long v51 = [v48 actionWithTitle:v23 image:v49 identifier:v50 handler:v67];

      if ((v62 & 1) == 0) {
      if (-[DDActionGroup extractedActions]((BOOL)v57))
      }
        [v63 extractedActionSubtitle];
      else {
      long long v52 = [v63 subtitle];
      }
      [v51 setSubtitle:v52];

      objc_msgSend(v51, "setAttributes:", objc_msgSend(v63, "menuItemattributes"));
      [v60 addObject:v51];

      objc_destroyWeak(&v70);
      goto LABEL_61;
    }
LABEL_48:
    if (v55 == 5) {
      [v21 oneLinerLocalizedSubItemName];
    }
    else {
    id v23 = [v21 localizedSubItemName];
    }
    goto LABEL_52;
  }
  uint64_t v18 = 0;
LABEL_67:

  uint64_t v15 = v57;
LABEL_68:

  return v18;
}

BOOL __105__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options_level_parent___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DDActionController presentingBaseView:*(void *)(a1 + 32) isLargeEnoughForAction:a2];
}

void __105__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options_level_parent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[DDContextMenuAction performAction:*(void *)(a1 + 32) fromView:WeakRetained alertController:0 interactionDelegate:*(void *)(a1 + 40)];
}

+ (id)previewActionForResult:(__DDResult *)a3 URL:(id)a4 context:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  id v8 = a5;
  if ((unint64_t)a3 | v7)
  {
    if (a3)
    {
      Categordouble y = DDResultGetCategory();
      switch(Category)
      {
        case 0:
        case 5:
          CFStringRef Type = (const __CFString *)DDResultGetType();
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F0E8])
            || CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F038]))
          {
            uint64_t v13 = DDURLPreviewAction;
            goto LABEL_58;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F000]))
          {
            uint64_t v13 = DDFlightPreviewAction;
            goto LABEL_58;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F080])
            || CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5EFA0]))
          {
            uint64_t v13 = DDParsecPreviewAction;
            goto LABEL_58;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5EF80])) {
            goto LABEL_23;
          }
          if (CFEqual(Type, (CFStringRef)*MEMORY[0x1E4F5F090]))
          {
            uint64_t v13 = DDConversionPreviewAction;
            goto LABEL_58;
          }
          if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F070], 0)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            +[DDContextMenuAction previewActionForResult:URL:context:]((uint64_t)Type);
          }
          goto LABEL_23;
        case 1:
          if (+[DDNewsPreviewAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDNewsPreviewAction;
          }
          else if (+[DDAppleStorePreviewAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDAppleStorePreviewAction;
          }
          else if (+[DDMapAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDMapAction;
          }
          else if (+[DDURLPreviewAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDURLPreviewAction;
          }
          else if (+[DDChatBotAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDChatBotAction;
          }
          else if (+[DDPersonAction handlesUrl:0 result:a3])
          {
            uint64_t v13 = DDPersonAction;
          }
          else
          {
            id v14 = 0;
            if (!+[DDGenericURLPreviewAction handlesUrl:0 result:a3])goto LABEL_61; {
            uint64_t v13 = DDGenericURLPreviewAction;
            }
          }
LABEL_58:
          id v15 = [v13 alloc];
          unint64_t v16 = 0;
          id v17 = a3;
          break;
        case 2:
          uint64_t v13 = DDPersonAction;
          goto LABEL_58;
        case 3:
          uint64_t v13 = DDMapAction;
          goto LABEL_58;
        case 4:
          uint64_t v13 = DDTimeLineAction;
          goto LABEL_58;
        case 6:
          uint64_t v13 = DDMoneyPreviewAction;
          goto LABEL_58;
        default:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            +[DDContextMenuAction previewActionForResult:URL:context:]((uint64_t)a3, Category);
          }
          goto LABEL_23;
      }
    }
    else
    {
      if (!v7)
      {
LABEL_23:
        id v14 = 0;
        goto LABEL_61;
      }
      if (+[DDClientPreviewAction clientCanPerformActionWithUrl:v7])
      {
        id v12 = DDClientPreviewAction;
      }
      else if (+[DDNewsPreviewAction handlesUrl:v7 result:0])
      {
        id v12 = DDNewsPreviewAction;
      }
      else if (+[DDAppleStorePreviewAction handlesUrl:v7 result:0])
      {
        id v12 = DDAppleStorePreviewAction;
      }
      else if (+[DDMapAction handlesUrl:v7 result:0])
      {
        id v12 = DDMapAction;
      }
      else if (+[DDURLPreviewAction handlesUrl:v7 result:0])
      {
        id v12 = DDURLPreviewAction;
      }
      else if (+[DDChatBotAction handlesUrl:v7 result:0])
      {
        id v12 = DDChatBotAction;
      }
      else if (+[DDPersonAction handlesUrl:v7 result:0])
      {
        id v12 = DDPersonAction;
      }
      else
      {
        id v14 = 0;
        if (!+[DDGenericURLPreviewAction handlesUrl:v7 result:0])goto LABEL_61; {
        id v12 = DDGenericURLPreviewAction;
        }
      }
      id v15 = [v12 alloc];
      unint64_t v16 = v7;
      id v17 = 0;
    }
    uint64_t v11 = [v15 initWithURL:v16 result:v17 context:v8];
  }
  else
  {
    uint64_t v11 = +[DDPreviewAction previewActionForURL:0 result:0 context:v8];
  }
  id v14 = (void *)v11;
LABEL_61:

  return v14;
}

+ (void)performDefaultActionWithResult:(__DDResult *)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  id v12 = (objc_class *)MEMORY[0x1E4F962F0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = [v12 alloc];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5F150]) initWithCoreResult:a3];
  id v18 = (id)[v16 initWithDDResult:v17];

  +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", v18, v15, v14, v13, x, y);
}

+ (void)performDefaultActionWithURL:(id)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  id v12 = (objc_class *)MEMORY[0x1E4F962F0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 alloc];
  id v18 = [v16 absoluteString];
  id v19 = (id)objc_msgSend(v17, "initWithURL:rangeInContext:", v16, 0, objc_msgSend(v18, "length"));

  +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", v19, v15, v14, v13, x, y);
}

+ (id)previewViewProviderForURL:(id)a3 context:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a1 previewActionForResult:0 URL:a3 context:v6];
  id v8 = [a1 previewViewProviderForPreviewAction:v7 context:v6];

  return v8;
}

+ (id)previewViewProviderForResult:(__DDResult *)a3 context:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a1 previewActionForResult:a3 URL:0 context:v6];
  id v8 = [a1 previewViewProviderForPreviewAction:v7 context:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalLookupItem, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (void)validateContext:silent:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Requesting a DDContextMenuConfiguration without a source rect is invalid. See +[DDContextMenuConfiguration updateContext:withSourceRect:]", v0, 2u);
}

+ (void)previewActionForResult:(uint64_t)a1 URL:(int)a2 context:.cold.1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown DDResult category %d for result %@; could not find any actions",
    (uint8_t *)v2,
    0x12u);
}

+ (void)previewActionForResult:(uint64_t)a1 URL:context:.cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown result type %@ in the Misc category; no actions found",
    (uint8_t *)&v1,
    0xCu);
}

@end