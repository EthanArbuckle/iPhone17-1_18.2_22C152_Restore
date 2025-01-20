@interface PSSpecifier
@end

@implementation PSSpecifier

void __49__PSSpecifier_AccountsUI__acui_iconForDataclass___block_invoke(id *a1)
{
  v32[2] = a1;
  v32[1] = a1;
  v32[0] = (id)[MEMORY[0x1E4F92E00] settingsIconCache];
  id v1 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  v2 = (void *)acui_iconForDataclass__dataClassIcons;
  acui_iconForDataclass__dataClassIcons = (uint64_t)v1;

  id v10 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93038]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v11 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93018]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v12 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FA8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v13 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FB0]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v14 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FD0]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v15 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FD8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v16 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FE0]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v17 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FE8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v18 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93008]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v19 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FF0]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v20 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FF8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v21 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93000]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v22 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93010]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v23 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93030]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v24 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93020]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v25 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FB8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v26 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FC0]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v27 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F92FC8]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v28 = (id)[v32[0] imageForKey:*MEMORY[0x1E4F93028]];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id v29 = (id)[MEMORY[0x1E4F42948] currentDevice];
  BOOL v30 = [v29 userInterfaceIdiom] != 0;

  if (v30)
  {
    id v6 = (id)[MEMORY[0x1E4F42948] currentDevice];
    BOOL v7 = [v6 userInterfaceIdiom] != 4;

    if (v7)
    {
      id v4 = (id)[a1[4] imageForApplicationBundleIdentifier:@"com.apple.facetime"];
      objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");
    }
    else
    {
      id v5 = (id)[a1[4] imageForApplicationBundleIdentifier:@"com.apple.NanoPhone"];
      objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");
    }
  }
  else
  {
    id v8 = (id)[a1[4] imageForApplicationBundleIdentifier:@"com.apple.mobilephone"];
    objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");
  }
  id v3 = (id)[a1[4] imageForApplicationBundleIdentifier:@"com.apple.GenerativePlaygroundApp"];
  objc_msgSend((id)acui_iconForDataclass__dataClassIcons, "setObject:forKeyedSubscript:");

  id location = (id)[a1[4] imageForApplicationBundleIdentifier:@"com.apple.journal"];
  if (location) {
    [(id)acui_iconForDataclass__dataClassIcons setObject:location forKeyedSubscript:*MEMORY[0x1E4F175E0]];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v32, 0);
}

void __63__PSSpecifier_AccountsUI__circularImageFromCGImage_size_scale___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v7 = a1;
  CGContextRef v6 = (CGContextRef)[location[0] CGContext];
  long long v4 = 0u;
  long long v5 = 0u;
  long long v4 = *MEMORY[0x1E4F1DAD8];
  long long v5 = *(_OWORD *)(a1 + 40);
  id v3 = (id)objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", v4, v5);
  CGContextAddPath(v6, (CGPathRef)[v3 CGPath]);
  CGContextClip(v6);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

void __70__PSSpecifier_AccountsUI__acui_specifierIconForAccountTypeIdentifier___block_invoke(void *a1)
{
  v22[2] = a1;
  v22[1] = a1;
  v22[0] = (id)[MEMORY[0x1E4F92E00] settingsIconCache];
  id v1 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  v2 = (void *)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache;
  acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache = (uint64_t)v1;

  id v3 = (id)[v22[0] imageForKey:*MEMORY[0x1E4F93040]];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  long long v4 = (void *)MEMORY[0x1E4F42A80];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v4, "imageNamed:inBundle:", @"Exchange_small");
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  uint64_t v7 = (void *)MEMORY[0x1E4F42A80];
  id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = (id)objc_msgSend(v7, "imageNamed:inBundle:", @"Gmail_small");
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v10 = (void *)MEMORY[0x1E4F42A80];
  id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = (id)objc_msgSend(v10, "imageNamed:inBundle:", @"Yahoo_small");
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v13 = (id)[v22[0] imageForKey:*MEMORY[0x1E4F92FA8]];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v15 = (void *)MEMORY[0x1E4F92FB0];
  id v14 = (id)[v22[0] imageForKey:*MEMORY[0x1E4F92FB0]];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v16 = (id)[v22[0] imageForKey:*v15];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v19 = (void *)MEMORY[0x1E4F92FE8];
  id v17 = (id)[v22[0] imageForKey:*MEMORY[0x1E4F92FE8]];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v18 = (id)[v22[0] imageForKey:*v19];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v20 = (id)[v22[0] imageForKey:*v19];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  id v21 = (id)[v22[0] imageForKey:*MEMORY[0x1E4F93048]];
  objc_msgSend((id)acui_specifierIconForAccountTypeIdentifier__accountTypeImageCache, "setObject:forKeyedSubscript:");

  objc_storeStrong(v22, 0);
}

void __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [v2[0] startAnimating];
  [a1[4] setAccessoryView:v2[0]];
  objc_storeStrong(v2, 0);
}

void __46__PSSpecifier_AccountsUI___switchSpinnerTimer__block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 40) propertyForKey:*MEMORY[0x1E4F930F0]];
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:");

  id v3 = (id)[*(id *)(a1 + 32) accessoryView];
  [v3 setEnabled:1];
}

@end