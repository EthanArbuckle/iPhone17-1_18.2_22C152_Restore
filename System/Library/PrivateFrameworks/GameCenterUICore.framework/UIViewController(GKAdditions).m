@interface UIViewController(GKAdditions)
- (id)_gkPresentActivityViewControllerForActivityItems:()GKAdditions fromView:withCompletionHandler:;
- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:;
- (uint64_t)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions;
- (void)_gkConfigureFocusGuidesForNavigationBar:()GKAdditions;
- (void)_gkDismissActivityViewControllerAnimated:()GKAdditions;
- (void)_gkForceNextContentUpdate;
- (void)_gkHandleURLPathComponents:()GKAdditions query:;
- (void)_gkPresentActivityViewController:()GKAdditions fromView:;
- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:;
- (void)_gkResetContents;
- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions;
@end

@implementation UIViewController(GKAdditions)

- (uint64_t)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions
{
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
  return result;
}

- (void)_gkResetContents
{
  [a1 _gkForceNextContentUpdate];
  id v2 = [a1 presentedViewController];
  [v2 _gkResetContents];
}

- (void)_gkForceNextContentUpdate
{
  id v2 = dispatch_get_current_queue();
  v3 = v2;
  if (v2 != MEMORY[0x263EF83A0])
  {
    v4 = NSString;
    label = dispatch_queue_get_label(v2);
    v6 = (void *)MEMORY[0x263EF83A0];
    v7 = dispatch_queue_get_label(MEMORY[0x263EF83A0]);
    v8 = [MEMORY[0x263F08B88] callStackSymbols];
    v9 = [v4 stringWithFormat:@"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[UIViewController(GKAdditions) _gkForceNextContentUpdate]", label, v7, v8];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKUIKitAdditions.m"];
    id v11 = [v10 lastPathComponent];
    v12 = [v4 stringWithFormat:@"%@ (_actualCurrentQueue == dispatch_get_main_queue())\n[%s (%s:%d)]", v9, "-[UIViewController(GKAdditions) _gkForceNextContentUpdate]", objc_msgSend(v11, "UTF8String"), 87];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v12 format];
  }

  objc_setAssociatedObject(a1, @"_gkContentUpdateHandlers", 0, (void *)0x301);
  objc_setAssociatedObject(a1, @"_gkContentRecentlyUpdated", 0, (void *)0x301);
}

- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  id v6 = v3;
  gk_dispatch_as_group();
}

- (void)_gkHandleURLPathComponents:()GKAdditions query:
{
  id v14 = a3;
  id v6 = a4;
  v7 = [a1 childViewControllers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [a1 childViewControllers];
    v10 = [v9 objectAtIndex:0];

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v11 = [a1 presentedViewController];

  if (v11)
  {
    v12 = [a1 presentedViewController];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v10 = [a1 presentedViewController];
LABEL_7:
      [v10 _gkHandleURLPathComponents:v14 query:v6];
LABEL_8:
    }
  }
}

- (void)_gkDismissActivityViewControllerAnimated:()GKAdditions
{
  id v4 = [a1 navigationController];
  [v4 dismissViewControllerAnimated:a3 completion:0];
}

- (void)_gkPresentActivityViewController:()GKAdditions fromView:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 popoverPresentationController];
  [v8 setSourceView:v6];

  id v9 = [a1 navigationController];
  [v9 presentViewController:v7 animated:1 completion:0];
}

- (id)_gkPresentActivityViewControllerForActivityItems:()GKAdditions fromView:withCompletionHandler:
{
  v24[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __113__UIViewController_GKAdditions___gkPresentActivityViewControllerForActivityItems_fromView_withCompletionHandler___block_invoke;
  v21 = &unk_26478A160;
  v22 = a1;
  id v23 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)MEMORY[0x22A644A10](&v18);
  id v13 = objc_alloc((Class)objc_opt_class());
  id v14 = objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v11, 0, v18, v19, v20, v21, v22);

  [v14 setCompletionWithItemsHandler:v12];
  uint64_t v15 = *MEMORY[0x263F1CF98];
  v24[0] = *MEMORY[0x263F1CFA0];
  v24[1] = v15;
  v24[2] = *MEMORY[0x263F1CFB0];
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  [v14 setExcludedActivityTypes:v16];

  [a1 _gkPresentActivityViewController:v14 fromView:v10];
  return v14;
}

- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:
{
  id v8 = a4;
  id v6 = [a1 presentedViewController];
  id v7 = v6;
  if (v6 && [v6 _gkShouldRefreshContentsForDataType:a3 userInfo:v8]) {
    [v7 _gkRefreshContentsForDataType:a3 userInfo:v8];
  }
  if ([a1 _gkShouldRefreshContentsForDataType:a3 userInfo:v8]) {
    [v7 _gkRefreshContentsForDataType:a3 userInfo:v8];
  }
}

- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:
{
  id v6 = a4;
  id v7 = [a1 presentedViewController];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 _gkShouldRefreshContentsForDataType:a3 userInfo:v6];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_gkConfigureFocusGuidesForNavigationBar:()GKAdditions
{
  v52[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F1C640];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    v52[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
    [v6 setPreferredFocusEnvironments:v7];

    id v8 = [a1 view];
    [v8 addLayoutGuide:v6];

    id v9 = objc_alloc_init(MEMORY[0x263F1C640]);
    id v51 = v5;
    v24 = v5;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
    [v9 setPreferredFocusEnvironments:v10];

    id v11 = [a1 view];
    [v11 addLayoutGuide:v9];

    v34 = (void *)MEMORY[0x263F08938];
    v48 = [v6 leadingAnchor];
    v49 = [a1 view];
    v47 = [v49 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v50[0] = v46;
    v44 = [v6 trailingAnchor];
    v45 = [a1 view];
    v42 = [v45 trailingAnchor];
    v41 = [v44 constraintEqualToAnchor:v42];
    v50[1] = v41;
    v43 = v6;
    v39 = [v6 topAnchor];
    v40 = [a1 view];
    v38 = [v40 topAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v50[2] = v37;
    v35 = [v6 bottomAnchor];
    v36 = [a1 view];
    v33 = [v36 topAnchor];
    [v5 frame];
    v32 = [v35 constraintEqualToAnchor:v33 constant:v12];
    v50[3] = v32;
    v29 = [v9 leadingAnchor];
    v30 = [a1 view];
    v28 = [v30 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v50[4] = v27;
    v25 = [v9 trailingAnchor];
    v26 = [a1 view];
    id v23 = [v26 trailingAnchor];
    id v13 = [v25 constraintEqualToAnchor:v23];
    v50[5] = v13;
    v31 = v9;
    id v14 = [v9 topAnchor];
    uint64_t v15 = [a1 view];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v50[6] = v17;
    uint64_t v18 = [v9 bottomAnchor];
    uint64_t v19 = [a1 view];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:1.0];
    v50[7] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
    [v34 activateConstraints:v22];
  }
}

@end