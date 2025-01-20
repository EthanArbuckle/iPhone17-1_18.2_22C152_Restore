@interface CSUISettingsBundleController
- (BOOL)_cnfreg_overrideForController:(id)a3 withDictionary:(id)a4;
- (CSUISettingsBundleController)initWithParentListController:(id)a3;
- (Class)controllerClassToInstantiate:(id)a3;
- (id)name;
- (id)settingsClassName;
- (int64_t)serviceType;
- (void)_resetSpecifierAction:(id)a3;
- (void)bundleTappedWithSpecifier:(id)a3;
@end

@implementation CSUISettingsBundleController

- (CSUISettingsBundleController)initWithParentListController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSUISettingsBundleController;
  v3 = [(CSUISettingsBundleController *)&v7 initWithParentListController:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F4A568] sharedInstance];
    v5 = [(CSUISettingsBundleController *)v3 name];
    [v4 addListenerID:v5 capabilities:*MEMORY[0x263F4A888]];
  }
  return v3;
}

- (Class)controllerClassToInstantiate:(id)a3
{
  v4 = [(CSUISettingsBundleController *)self settingsClassName];
  Class v5 = NSClassFromString(v4);

  if (MarcoShouldLogRegistration())
  {
    v6 = [(CSUISettingsBundleController *)self name];
    MarcoLogRegistration();
  }
  return v5;
}

- (void)_resetSpecifierAction:(id)a3
{
  id v4 = a3;
  v3 = NSStringFromSelector(sel_lazyLoadSpecialBundleForSpecifier_);
  [v4 setProperty:v3 forKey:*MEMORY[0x263F60040]];

  [v4 setControllerLoadAction:sel_lazyLoadSpecialBundleForSpecifier_];
}

- (void)bundleTappedWithSpecifier:(id)a3
{
  id v4 = (char *)a3;
  if (MarcoShouldLogRegistration())
  {
    Class v5 = [(CSUISettingsBundleController *)self name];
    v23 = v4;
    MarcoLogRegistration();
  }
  v6 = objc_msgSend(MEMORY[0x263F4A568], "sharedInstance", v23);
  char v7 = [v6 isConnected];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x263F4A568] sharedInstance];
    [v8 blockUntilConnected];
  }
  [v4 setProperty:self forKey:@"bundleController"];
  v9 = [v4 propertyForKey:@"ft-serviceType"];
  uint64_t v10 = [v9 integerValue];
  v11 = +[CNFRegController controllerForServiceType:v10];
  v12 = v11;
  if (!v11)
  {
    if (MarcoShouldLogRegistration())
    {
      v16 = [(CSUISettingsBundleController *)self name];
      uint64_t v24 = v10;
      MarcoLogRegistration();
    }
    goto LABEL_19;
  }
  if (([v11 isServiceSupported] & 1) == 0)
  {
    if (MarcoShouldLogRegistration())
    {
      v17 = [(CSUISettingsBundleController *)self name];
      MarcoLogRegistration();
    }
LABEL_19:
    -[CSUISettingsBundleController _resetSpecifierAction:](self, "_resetSpecifierAction:", v4, v24);
    goto LABEL_29;
  }
  if (([v12 isConnected] & 1) == 0) {
    [v12 connect:1];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__CSUISettingsBundleController_bundleTappedWithSpecifier___block_invoke;
  v25[3] = &unk_2644F13C0;
  v25[4] = self;
  [v12 setWillLaunchURLBlock:v25];
  [v12 resetNetworkFirstRunAlert];
  CNFRegSetStringTableForServiceType([(CSUISettingsBundleController *)self serviceType]);
  v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 1)
  {
    CNFRegSetGlobalAppearanceStyle(2);
    CNFRegSetSupportsAutoRotation(1);
  }
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      uint64_t v15 = [MEMORY[0x263F4A610] iMessageService];
      goto LABEL_21;
    }
    if (v10)
    {
      v18 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v15 = [MEMORY[0x263F4A610] facetimeService];
LABEL_21:
  v18 = (void *)v15;
LABEL_23:
  if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:v18 inProgressRegisteringNonPhoneAccount:0])
  {
    v19 = (objc_class *)objc_opt_class();
  }
  else
  {
    v19 = [(CSUISettingsBundleController *)self controllerClassToInstantiate:v12];
  }
  v20 = v19;
  [v4 setControllerLoadAction:0];
  *(void *)&v4[*MEMORY[0x263F5FE18]] = v20;
  if (MarcoShouldLogRegistration())
  {
    v21 = [(CSUISettingsBundleController *)self name];
    uint64_t v24 = (uint64_t)v20;
    MarcoLogRegistration();
  }
  v22 = [(CSUISettingsBundleController *)self settingsClassName];
  [v4 setProperty:v22 forKey:@"cnf-completionclass"];

  [v4 setProperty:MEMORY[0x263EFFA88] forKey:@"cnf-hideLearnMoreButton"];
LABEL_29:
}

void __58__CSUISettingsBundleController_bundleTappedWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 scheme];
  int v4 = [v3 hasPrefix:@"prefs"];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FD50]));
    id v8 = [WeakRetained navigationController];

    v6 = [v8 presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    char v7 = [v8 presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)_cnfreg_overrideForController:(id)a3 withDictionary:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKey:@"path"];
  v9 = (void *)MEMORY[0x263EFF980];
  uint64_t v10 = [v8 pathComponents];
  v11 = [v9 arrayWithArray:v10];

  if ([v11 count])
  {
    v12 = [v11 objectAtIndex:0];
    v13 = MEMORY[0x223C3A360]();
    uint64_t v14 = [v13 objectForKey:@"object"];
    v58 = [v6 regController];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FD50]));
    v57 = [WeakRetained rootController];

    if (([v14 isEqualToString:@"CHANGE_PASSWORD"] & 1) != 0
      || [v14 isEqualToString:@"REAUTHORIZE"])
    {
      v56 = v14;
      v54 = v13;
      v16 = [v7 objectForKey:@"appleID"];
      if (v16)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v17 = [v58 appleIDAccounts];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v66 objects:v71 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          v49 = v8;
          v51 = v12;
          id v46 = v6;
          v47 = v11;
          uint64_t v20 = *(void *)v67;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v67 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v23 = [v22 loginDisplayString];
              int v24 = [v23 isEqualToString:v16];

              if (v24)
              {
                id v55 = v22;
                goto LABEL_16;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v66 objects:v71 count:16];
            if (v19) {
              continue;
            }
            break;
          }
          id v55 = 0;
LABEL_16:
          id v6 = v46;
          v11 = v47;
          id v8 = v49;
          v12 = v51;
        }
        else
        {
          id v55 = 0;
        }
      }
      else
      {
        id v55 = 0;
      }
      v35 = v57;
      if ([v56 isEqualToString:@"CHANGE_PASSWORD"])
      {
        v29 = +[FTRegUtilities standaloneNewPasswordControllerWithRegController:v58 appleID:v16];
      }
      else
      {
        v53 = v12;
        v36 = [v7 objectForKey:@"authID"];
        v37 = [v7 objectForKey:@"authToken"];
        if ((!v36 || ![v36 length]) && (!v37 || !objc_msgSend(v37, "length")))
        {
          uint64_t v38 = [v55 authorizationID];

          [v55 authorizationToken];
          v39 = v11;
          uint64_t v41 = v40 = v8;

          v36 = (void *)v38;
          v37 = (void *)v41;
          id v8 = v40;
          v11 = v39;
          v35 = v57;
        }
        v29 = +[FTRegUtilities standaloneAuthorizationControllerWithRegController:v58 authID:v36 token:v37];

        v12 = v53;
      }
    }
    else
    {
      if (![v14 isEqualToString:@"LOCATION"]
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        BOOL v25 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v56 = v14;
      v54 = v13;
      id v26 = v6;
      v16 = [v7 objectForKey:@"guid"];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v55 = v26;
      v27 = [v26 regController];
      v28 = [v27 appleIDAccounts];

      v29 = (void *)[v28 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v29)
      {
        v50 = v8;
        v52 = v12;
        v48 = v11;
        uint64_t v30 = *(void *)v63;
LABEL_22:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v63 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v62 + 1) + 8 * v31);
          v33 = [v32 uniqueID];
          char v34 = [v33 isEqualToString:v16];

          if (v34) {
            break;
          }
          if (v29 == (void *)++v31)
          {
            v29 = (void *)[v28 countByEnumeratingWithState:&v62 objects:v70 count:16];
            if (v29) {
              goto LABEL_22;
            }
            goto LABEL_50;
          }
        }
        id v45 = v32;

        if (v45)
        {
          v29 = [v55 _localeChooserForAccount:v45];
          v28 = v45;
LABEL_50:
          v11 = v48;
          id v8 = v50;
          v12 = v52;
          goto LABEL_51;
        }
        v29 = 0;
        v11 = v48;
        id v8 = v50;
        v12 = v52;
        v35 = v57;
      }
      else
      {
LABEL_51:
        v35 = v57;
      }
    }

    if (v29)
    {
      v42 = [v35 presentedViewController];

      v13 = v54;
      uint64_t v14 = v56;
      if (v42)
      {
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __77__CSUISettingsBundleController__cnfreg_overrideForController_withDictionary___block_invoke;
        v59[3] = &unk_2644F0868;
        id v60 = v35;
        id v61 = v29;
        id v43 = v29;
        [v60 dismissViewControllerAnimated:1 completion:v59];
      }
      else
      {
        [v35 presentViewController:v29 animated:1 completion:0];
      }

      BOOL v25 = 1;
    }
    else
    {
      BOOL v25 = 0;
      v13 = v54;
      uint64_t v14 = v56;
    }
    goto LABEL_46;
  }
  BOOL v25 = 0;
LABEL_47:

  return v25;
}

uint64_t __77__CSUISettingsBundleController__cnfreg_overrideForController_withDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (int64_t)serviceType
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  Class v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CSUISettingsBundleController.m", 228, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)settingsClassName
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  Class v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CSUISettingsBundleController.m", 233, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)name
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  Class v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CSUISettingsBundleController.m", 238, @"Call to abstract method (%@) on %@", v5, objc_opt_class() object file lineNumber description];

  return 0;
}

@end