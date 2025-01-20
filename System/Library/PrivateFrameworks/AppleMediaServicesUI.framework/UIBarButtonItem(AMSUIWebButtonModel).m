@interface UIBarButtonItem(AMSUIWebButtonModel)
+ (id)barButtonItemWithWebButtonModel:()AMSUIWebButtonModel navigationBarModel:actionBlock:;
@end

@implementation UIBarButtonItem(AMSUIWebButtonModel)

+ (id)barButtonItemWithWebButtonModel:()AMSUIWebButtonModel navigationBarModel:actionBlock:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v17 = 0;
    v13 = v9;
    goto LABEL_11;
  }
  v11 = [v7 actionBlock];
  v12 = v11;
  if (!v11) {
    v11 = v10;
  }
  v13 = _Block_copy(v11);

  v14 = [v7 activityIndicator];

  if (!v14)
  {
    if ([v7 style] == 4)
    {
      id v15 = objc_alloc(MEMORY[0x263F824A8]);
      uint64_t v16 = [v7 _makeProxCardButtonWithActionBlock:v13];
      goto LABEL_9;
    }
    v21 = objc_msgSend(v7, "_imageForButtonWithNavStyle:", objc_msgSend(v8, "style"));
    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263F824A8]);
      v23 = (void *)MEMORY[0x263F823D0];
      v24 = [NSString string];
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __103__UIBarButtonItem_AMSUIWebButtonModel__barButtonItemWithWebButtonModel_navigationBarModel_actionBlock___block_invoke;
      v44 = &unk_2643E48F8;
      v25 = &v45;
      id v45 = v13;
      v26 = &v41;
      v27 = v23;
      v28 = v24;
      v29 = v21;
    }
    else
    {
      uint64_t v30 = [v7 title];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = [v7 title];
        char v33 = [v32 isEqualToString:&stru_26CC491D8];

        if (v33)
        {
          v17 = 0;
LABEL_21:
          objc_msgSend(v17, "setStyle:", objc_msgSend(v7, "_barButtonItemStyle"));

          goto LABEL_10;
        }
      }
      id v22 = objc_alloc(MEMORY[0x263F824A8]);
      v34 = (void *)MEMORY[0x263F823D0];
      v24 = [v7 title];
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __103__UIBarButtonItem_AMSUIWebButtonModel__barButtonItemWithWebButtonModel_navigationBarModel_actionBlock___block_invoke_2;
      v39 = &unk_2643E48F8;
      v25 = &v40;
      id v40 = v13;
      v26 = &v36;
      v27 = v34;
      v28 = v24;
      v29 = 0;
    }
    v35 = objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v28, v29, 0, v26, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45);
    v17 = (void *)[v22 initWithPrimaryAction:v35];

    goto LABEL_21;
  }
  id v15 = objc_alloc(MEMORY[0x263F824A8]);
  uint64_t v16 = [v7 _makeActivityIndicatorView];
LABEL_9:
  v18 = (void *)v16;
  v17 = (void *)[v15 initWithCustomView:v16];

LABEL_10:
  v19 = [v7 accessibilityLabel];
  [v17 setAccessibilityLabel:v19];

  [v17 setAccessibilityTraits:*MEMORY[0x263F83260]];
  [v17 setIsAccessibilityElement:1];
  objc_msgSend(v17, "setEnabled:", objc_msgSend(v7, "enabled"));
LABEL_11:

  return v17;
}

@end