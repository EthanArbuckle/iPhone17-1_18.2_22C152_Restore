@interface UIViewController(Spinner)
- (id)composeFeedbackToolbarItem;
- (uint64_t)leftToolbarItem;
- (uint64_t)newFeedbackButtonState;
- (uint64_t)showSpinnerWithStatus:()Spinner userInteractionEnabled:animated:;
- (uint64_t)showToolbarWithSpinner:()Spinner withStatusString:userInteractionEnabled:animated:;
- (uint64_t)showToolbarWithStatus:()Spinner animated:;
- (uint64_t)showToolbarWithStatus:()Spinner subtitle:animated:;
- (void)hideSpinner;
- (void)resumeSpinnerWithStatus:()Spinner userInteractionEnabled:;
- (void)showSpinnerWithStatus:()Spinner userInteractionEnabled:;
- (void)showToolbarWithSpinner:()Spinner withStatusString:subtitleButtonString:userInteractionEnabled:animated:;
- (void)updateNewFeedbackButtonState;
@end

@implementation UIViewController(Spinner)

- (void)hideSpinner
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__UIViewController_Spinner__hideSpinner__block_invoke;
  aBlock[3] = &unk_264873FE8;
  aBlock[4] = a1;
  v2 = (void (**)(void))_Block_copy(aBlock);
  v3 = [a1 viewIfLoaded];
  v4 = [v3 window];

  if (v4)
  {
    v2[2](v2);
  }
  else
  {
    v5 = [MEMORY[0x263F08A48] mainQueue];
    [v5 addOperationWithBlock:v2];
  }
}

- (void)resumeSpinnerWithStatus:()Spinner userInteractionEnabled:
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = +[FBKLog appHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "Resuming toolbar activity indicator with status [%{public}@]", (uint8_t *)&v8, 0xCu);
  }

  [a1 showSpinnerWithStatus:v6 userInteractionEnabled:a4 animated:0];
}

- (void)showSpinnerWithStatus:()Spinner userInteractionEnabled:
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = +[FBKLog appHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "Showing toolbar activity indicator with status [%{public}@]", (uint8_t *)&v8, 0xCu);
  }

  [a1 showSpinnerWithStatus:v6 userInteractionEnabled:a4 animated:1];
}

- (uint64_t)showToolbarWithStatus:()Spinner animated:
{
  return [a1 showToolbarWithSpinner:0 withStatusString:a3 userInteractionEnabled:1 animated:a4];
}

- (uint64_t)showToolbarWithStatus:()Spinner subtitle:animated:
{
  return [a1 showToolbarWithSpinner:0 withStatusString:a3 subtitleButtonString:a4 userInteractionEnabled:1 animated:a5];
}

- (uint64_t)showSpinnerWithStatus:()Spinner userInteractionEnabled:animated:
{
  return [a1 showToolbarWithSpinner:1 withStatusString:a3 userInteractionEnabled:a4 animated:a5];
}

- (uint64_t)showToolbarWithSpinner:()Spinner withStatusString:userInteractionEnabled:animated:
{
  return [a1 showToolbarWithSpinner:a3 withStatusString:a4 subtitleButtonString:0 userInteractionEnabled:a5 animated:a6];
}

- (void)showToolbarWithSpinner:()Spinner withStatusString:subtitleButtonString:userInteractionEnabled:animated:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  v14 = +[FBKLog appHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v47 = v12;
    _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Showing toolbar activity indicator with status [%{public}@]", buf, 0xCu);
  }

  v15 = [a1 view];
  [v15 setUserInteractionEnabled:a6];

  if (v12)
  {
    unsigned int v41 = a7;
    int v39 = a3;
    if (showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__onceToken != -1) {
      dispatch_once(&showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__onceToken, &__block_literal_global_21);
    }
    uint64_t v16 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    id v17 = objc_alloc(MEMORY[0x263F828E0]);
    v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v18 setAdjustsFontForContentSizeCategory:0];
    [v18 setText:v12];
    [v18 setFont:v16];
    v19 = [MEMORY[0x263F825C8] labelColor];
    [v18 setTextColor:v19];

    id v42 = v13;
    v40 = (void *)v16;
    if (v13)
    {
      id v20 = objc_alloc_init(MEMORY[0x263F828E0]);
      [v20 setAdjustsFontForContentSizeCategory:0];
      [v20 setText:v13];
      [v20 setFont:v16];
      v21 = [MEMORY[0x263F825C8] tintColor];
      [v20 setTextColor:v21];

      id v22 = objc_alloc(MEMORY[0x263F82BF8]);
      v45[0] = v18;
      v45[1] = v20;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
      id v24 = (id)[v22 initWithArrangedSubviews:v23];

      [v24 setAxis:1];
      [v24 setAlignment:3];
      [v24 setDistribution:3];
      v25 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:a1 action:sel_didTapSubtitleAction_];
      [v24 addGestureRecognizer:v25];

      uint64_t v26 = [v24 accessibilityTraits];
      [v24 setAccessibilityTraits:*MEMORY[0x263F83260] | v26];
      v27 = [NSString stringWithFormat:@"%@, %@", v12, v13];
      [v24 setAccessibilityLabel:v27];

      [v24 setIsAccessibilityElement:1];
    }
    else
    {
      id v24 = v18;
    }
    if (v39)
    {
      v28 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v28 startAnimating];
      id v29 = objc_alloc_init(MEMORY[0x263F82BF8]);
      [v29 setAxis:0];
      [v29 setSpacing:1.17549435e-38];
      [v29 setAlignment:3];
      [v29 addArrangedSubview:v28];
      [v29 addArrangedSubview:v24];
      v30 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v29];
    }
    else
    {
      v30 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v24];
    }
    v31 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    v32 = [a1 leftToolbarItem];
    if (v32) {
      [v31 addObject:v32];
    }
    [v31 addObject:showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing];
    [v31 addObject:v30];
    [v31 addObject:showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__rightSpacing];
    v33 = [a1 composeFeedbackToolbarItem];
    if (v33) {
      [v31 addObject:v33];
    }
    v34 = [MEMORY[0x263EFF8C0] arrayWithArray:v31];
    [a1 setToolbarItems:v34 animated:v41];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke_2;
    aBlock[3] = &unk_264875490;
    aBlock[4] = a1;
    char v44 = v41;
    v35 = (void (**)(void))_Block_copy(aBlock);
    v36 = [a1 viewIfLoaded];
    v37 = [v36 window];

    if (v37)
    {
      v35[2](v35);
    }
    else
    {
      v38 = [MEMORY[0x263F08A48] mainQueue];
      [v38 addOperationWithBlock:v35];
    }
    id v13 = v42;
  }
}

- (uint64_t)leftToolbarItem
{
  return 0;
}

- (void)updateNewFeedbackButtonState
{
  id v3 = [a1 toolbarItems];
  v2 = [v3 lastObject];
  if ((char *)[v2 action] == sel_createNewFeedback_)
  {
    objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "newFeedbackButtonState") == 2);
    [a1 setToolbarItems:v3 animated:0];
  }
}

- (uint64_t)newFeedbackButtonState
{
  return 0;
}

- (id)composeFeedbackToolbarItem
{
  uint64_t v2 = [a1 newFeedbackButtonState];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = [a1 toolbarItems];
    v5 = [v4 lastObject];

    if (!v5 || (char *)[v5 action] != sel_createNewFeedback_)
    {
      id v6 = objc_alloc(MEMORY[0x263F824A8]);
      v7 = [MEMORY[0x263F827E8] imageNamed:@"bubble.and.pencil"];
      uint64_t v8 = [v6 initWithImage:v7 style:0 target:a1 action:sel_createNewFeedback_];

      v5 = (void *)v8;
    }
    [v5 setEnabled:v3 == 2];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"COMPOSE" value:&stru_26DDF6A30 table:0];
    [v5 setAccessibilityLabel:v10];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end