@interface UIView(DC)
+ (uint64_t)dc_animateWithDuration:()DC timingFunction:animations:;
+ (void)dc_animateWithDuration:()DC timingFunction:animations:completion:;
- (BOOL)dc_isRTL;
- (id)dc_imageRenderedFromLayer;
- (id)dc_imageRenderedFromViewHierarchy;
- (id)dc_imageViewRenderedFromLayer;
- (id)dc_imageViewRenderedFromViewHierarchy;
- (id)dc_renderImage;
- (id)dc_renderImageView;
- (uint64_t)dc_crashIfWindowIsSecure;
- (uint64_t)dc_directionalSafeAreaInsets;
- (uint64_t)dc_isInSecureWindow;
- (void)dc_addConstraintsToFillSuperview;
- (void)dc_crashIfWindowIsSecure;
- (void)dc_isInSecureWindow;
- (void)dc_removeAllConstraintsForSubview:()DC;
@end

@implementation UIView(DC)

- (BOOL)dc_isRTL
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

- (uint64_t)dc_directionalSafeAreaInsets
{
  return [a1 safeAreaInsets];
}

- (uint64_t)dc_isInSecureWindow
{
  v2 = [a1 window];

  if (v2)
  {
    v3 = [a1 window];
    v4 = [v3 screen];
    v5 = [v4 displayIdentity];
    uint64_t v6 = [v5 expectsSecureRendering];

    return v6;
  }
  else
  {
    v8 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[UIView(DC) dc_isInSecureWindow](v8);
    }

    return 1;
  }
}

- (uint64_t)dc_crashIfWindowIsSecure
{
  uint64_t result = objc_msgSend(a1, "dc_isInSecureWindow");
  if (result)
  {
    v2 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[UIView(DC) dc_crashIfWindowIsSecure](v2);
    }

    return [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Attempted to show notes during unsecure session."];
  }
  return result;
}

- (id)dc_imageRenderedFromLayer
{
  v2 = [a1 layer];
  [v2 layoutIfNeeded];

  v3 = [MEMORY[0x263F1C688] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x263F1C680]);
  [a1 bounds];
  v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__UIView_DC__dc_imageRenderedFromLayer__block_invoke;
  v10[3] = &unk_2642A9DD8;
  v10[4] = a1;
  v8 = [v7 imageWithActions:v10];

  return v8;
}

- (id)dc_imageRenderedFromViewHierarchy
{
  v2 = [a1 layer];
  [v2 layoutIfNeeded];

  v3 = [MEMORY[0x263F1C688] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x263F1C680]);
  [a1 bounds];
  v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__UIView_DC__dc_imageRenderedFromViewHierarchy__block_invoke;
  v10[3] = &unk_2642A9DD8;
  v10[4] = a1;
  v8 = [v7 imageWithActions:v10];

  return v8;
}

- (id)dc_imageViewRenderedFromLayer
{
  id v2 = objc_alloc(MEMORY[0x263F1C6D0]);
  [a1 bounds];
  v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "dc_imageRenderedFromLayer");
  [v3 setImage:v4];

  return v3;
}

- (id)dc_imageViewRenderedFromViewHierarchy
{
  id v2 = objc_alloc(MEMORY[0x263F1C6D0]);
  [a1 bounds];
  v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "dc_imageRenderedFromViewHierarchy");
  [v3 setImage:v4];

  return v3;
}

- (void)dc_removeAllConstraintsForSubview:()DC
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = objc_msgSend(a1, "constraints", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 firstItem];
        if ((id)v12 == v4)
        {
        }
        else
        {
          v13 = (void *)v12;
          id v14 = [v11 secondItem];

          if (v14 != v4) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [a1 removeConstraints:v5];
}

- (void)dc_addConstraintsToFillSuperview
{
  id v1 = a1;
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  _NSDictionaryOfVariableBindings(&cfstr_View.isa, v1, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v2 = (void *)MEMORY[0x263F08938];
  v3 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v6];
  [v2 activateConstraints:v3];

  id v4 = (void *)MEMORY[0x263F08938];
  double v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v6];
  [v4 activateConstraints:v5];
}

- (id)dc_renderImage
{
  id v2 = [a1 layer];
  [v2 layoutIfNeeded];

  v3 = [MEMORY[0x263F1C688] defaultFormat];
  id v4 = objc_alloc(MEMORY[0x263F1C680]);
  [a1 bounds];
  uint64_t v7 = objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__UIView_DC__dc_renderImage__block_invoke;
  v10[3] = &unk_2642A9DD8;
  v10[4] = a1;
  uint64_t v8 = [v7 imageWithActions:v10];

  return v8;
}

- (id)dc_renderImageView
{
  id v2 = objc_alloc(MEMORY[0x263F1C6D0]);
  [a1 bounds];
  v3 = objc_msgSend(v2, "initWithFrame:");
  id v4 = objc_msgSend(a1, "dc_renderImage");
  [v3 setImage:v4];

  return v3;
}

+ (uint64_t)dc_animateWithDuration:()DC timingFunction:animations:
{
  return objc_msgSend(a1, "dc_animateWithDuration:timingFunction:animations:completion:", a3, a4, 0);
}

+ (void)dc_animateWithDuration:()DC timingFunction:animations:completion:
{
  id v9 = a6;
  if (a5)
  {
    v10 = (void *)MEMORY[0x263F158F8];
    id v11 = a5;
    id v12 = a4;
    [v10 begin];
    [MEMORY[0x263F158F8] setAnimationTimingFunction:v12];

    v13 = (void *)MEMORY[0x263F1CB60];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__UIView_DC__dc_animateWithDuration_timingFunction_animations_completion___block_invoke;
    v14[3] = &unk_2642A9E00;
    id v15 = v9;
    [v13 animateWithDuration:v11 animations:v14 completion:a1];

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)dc_isInSecureWindow
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "It is invalid to call dc_isInSecureWindow for views that don't have a window.", v1, 2u);
}

- (void)dc_crashIfWindowIsSecure
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Attempted to show notes during unsecure session.", v1, 2u);
}

@end