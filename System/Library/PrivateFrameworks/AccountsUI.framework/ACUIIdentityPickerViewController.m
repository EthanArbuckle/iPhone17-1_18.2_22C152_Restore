@interface ACUIIdentityPickerViewController
- (BOOL)_allowIdentitySelection;
- (BOOL)_isPropertyEnabled;
- (NSString)property;
- (__SecIdentity)_identityToAutoselectWithEnabled:(BOOL)a3;
- (__SecIdentity)_selectedIdentity;
- (id)_identitySpecifiers;
- (id)_specifiersForIdentities:(id)a3;
- (id)_valueForSwitchSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_finishedFetchingIdentities:(id)a3;
- (void)_setPropertyEnabled:(BOOL)a3 identity:(__SecIdentity *)a4;
- (void)_setValue:(id)a3 forSwitchSpecifier:(id)a4;
- (void)_updateCell:(id)a3 selected:(BOOL)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation ACUIIdentityPickerViewController

- (void)viewDidLoad
{
  v45 = self;
  SEL v44 = a2;
  id v43 = (id)[*(id *)((char *)&self->super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92FA0]) target];
  id v42 = &unk_1F3A1F698;
  unsigned __int8 v25 = 0;
  if (v43) {
    unsigned __int8 v25 = [v43 conformsToProtocol:v42];
  }
  if ((v25 ^ 1))
  {
    id v24 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    v23 = NSStringFromProtocol((Protocol *)v42);
    [v24 handleFailureInMethod:v44, v45, @"ACUIIdentityPickerViewController.m", 125, @"target must conform to %@", v23 object file lineNumber description];
  }
  objc_storeWeak((id *)&v45->_delegate, v43);
  id v41 = (id)[*(id *)((char *)&v45->super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92FA0]) propertyForKey:*MEMORY[0x1E4F931B0]];
  unsigned __int8 isKindOfClass = 0;
  if (v41)
  {
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((isKindOfClass ^ 1))
  {
    id v21 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:v44, v45, @"ACUIIdentityPickerViewController.m", 129, @"%@ must be an NSString", v41 object file lineNumber description];
  }
  uint64_t v2 = [v41 copy];
  property = v45->_property;
  v45->_property = (NSString *)v2;

  uint64_t v40 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&v45->_delegate);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    id v18 = objc_loadWeakRetained((id *)&v45->_delegate);
    uint64_t v40 = [v18 configurationOptionsForIdentityPickerController:v45];
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)&v45->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v14 = objc_loadWeakRetained((id *)&v45->_delegate);
      char v15 = [v14 allowEditingForIdentityPickerController:v45];

      char v39 = v15 & 1;
      uint64_t v4 = 3;
      if ((v15 & 1) == 0) {
        uint64_t v4 = 0;
      }
      uint64_t v40 = v4;
    }
  }
  v45->_userInteractiveSwitch = (v40 & 1) != 0;
  v45->_userInteractiveIdentityList = (v40 & 2) != 0;
  v45->_allowIdentitySelectionForDisabledSwitch = (v40 & 4) != 0;
  id v13 = objc_loadWeakRetained((id *)&v45->_delegate);
  id v12 = (id)[v13 emailAddressesForIdentityPickerController:v45];
  uint64_t v5 = [v12 copy];
  emailAddresses = v45->_emailAddresses;
  v45->_emailAddresses = (NSArray *)v5;

  v38.receiver = v45;
  v38.super_class = (Class)ACUIIdentityPickerViewController;
  [(ACUIIdentityPickerViewController *)&v38 viewDidLoad];
  if (v45->_userInteractiveIdentityList || v45->_userInteractiveSwitch)
  {
    queue = dispatch_get_global_queue(0, 0);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    int v33 = -1073741824;
    int v34 = 0;
    v35 = __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke;
    v36 = &unk_1E6D20118;
    v37 = v45;
    dispatch_async(queue, &v32);

    objc_storeStrong((id *)&v37, 0);
  }
  else
  {
    uint64_t v31 = [(ACUIIdentityPickerViewController *)v45 _selectedIdentity];
    if ([(ACUIIdentityPickerViewController *)v45 _isPropertyEnabled])
    {
      v10 = v45;
      char v28 = 0;
      if (v31)
      {
        id v29 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:v31];
        char v28 = 1;
        id v9 = v29;
      }
      else
      {
        id v9 = 0;
      }
      [(ACUIIdentityPickerViewController *)v10 _finishedFetchingIdentities:v9];
      if (v28) {
    }
      }
    else
    {
      id v27 = (id)[(ACUIIdentityPickerViewController *)v45 specifierForID:@"CertificatesGroup"];
      uint64_t v26 = 0;
      if (v27)
      {
        [(ACUIIdentityPickerViewController *)v45 getGroup:&v26 row:0 ofSpecifier:v27];
        v7 = v45;
        id v8 = (id)[(ACUIIdentityPickerViewController *)v45 specifiersInGroup:v26];
        -[ACUIIdentityPickerViewController removeContiguousSpecifiers:animated:](v7, "removeContiguousSpecifiers:animated:");

        [(ACUIIdentityPickerViewController *)v45 removeSpecifier:v27];
      }
      objc_storeStrong(&v27, 0);
    }
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
}

void __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke(id *a1)
{
  v12[2] = a1;
  v12[1] = a1;
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 173);
  v12[0] = (id)[WeakRetained copyIdentitiesForIdentityPickerController:a1[4]];

  id v11 = _SortIdentities(v12[0], *((void **)a1[4] + 176));
  queue = MEMORY[0x1E4F14428];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke_2;
  id v8 = &unk_1E6D20098;
  id v9 = a1[4];
  id v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
}

uint64_t __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedFetchingIdentities:", *(void *)(a1 + 40), a1, a1);
}

- (id)specifiers
{
  uint64_t v40 = self;
  v39[1] = a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v40->_delegate);
    int v34 = (id *)v39;
    v39[0] = (id)[WeakRetained localizedSwitchNameForIdentityPickerController:v40];

    unint64_t v19 = 0x1E4F92000uLL;
    id v35 = 0;
    id v2 = (id)objc_msgSend(MEMORY[0x1E4F92E70], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39[0], v40, sel__setValue_forSwitchSpecifier_, sel__valueForSwitchSpecifier_, 0);
    int v33 = &v38;
    id v38 = v2;
    id v12 = v2;
    id v13 = [(ACUIIdentityPickerViewController *)v40 property];
    v30 = (void *)MEMORY[0x1E4F931B0];
    objc_msgSend(v12, "setProperty:forKey:");

    id v18 = (void *)MEMORY[0x1E4F93188];
    [v38 setProperty:@"Switch" forKey:*MEMORY[0x1E4F93188]];
    char v28 = (void *)MEMORY[0x1E4F93130];
    id v29 = @"NO";
    objc_msgSend(v38, "setProperty:forKey:");
    id v15 = *(id *)(v19 + 3696);
    unint64_t v20 = 0x1E4F28000uLL;
    uint64_t v14 = MEMORY[0x1E4F28B50];
    unint64_t v21 = 0x1E6D1F000uLL;
    id v17 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = &stru_1F39EF5C0;
    id v24 = @"Localizable";
    id v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", @"CERTIFICATES");
    id v3 = (id)objc_msgSend(v15, "groupSpecifierWithName:");
    uint64_t v32 = &v37;
    id v37 = v3;

    [v37 setProperty:@"CertificatesGroup" forKey:*v18];
    id v25 = *(id *)(v19 + 3696);
    id v22 = *(id *)(v20 + 2896);
    id v27 = (id)[v22 bundleForClass:objc_opt_class()];
    id v26 = (id)[v27 localizedStringForKey:@"LOADING" value:v23 table:v24];
    id v4 = (id)objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    uint64_t v31 = &v36;
    id v36 = v4;

    [v36 setProperty:v29 forKey:*v28];
    [v36 setProperty:@"CertificatesLoading" forKey:*v30];
    id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v6 = objc_msgSend(v5, "initWithObjects:", v38, v37, v36, 0);
    v7 = (void **)((char *)&v40->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
    id v8 = *v7;
    ACUIIdentityPickerViewController *v7 = (void *)v6;

    objc_storeStrong(v31, v35);
    objc_storeStrong(v32, v35);
    objc_storeStrong(v33, v35);
    objc_storeStrong(v34, v35);
  }
  id v9 = *(Class *)((char *)&v40->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v9;
}

- (void)_finishedFetchingIdentities:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v14->_identities, location[0]);
  id v12 = [(ACUIIdentityPickerViewController *)v14 _specifiersForIdentities:location[0]];
  unsigned __int8 v11 = [(ACUIIdentityPickerViewController *)v14 _isPropertyEnabled];
  uint64_t v10 = [(ACUIIdentityPickerViewController *)v14 _identityToAutoselectWithEnabled:v11];
  if (v14->_userInteractiveIdentityList && !v10)
  {
    unsigned __int8 v11 = 0;
    if (v14->_allowIdentitySelectionForDisabledSwitch) {
      uint64_t v10 = [(ACUIIdentityPickerViewController *)v14 _selectedIdentity];
    }
  }
  [(ACUIIdentityPickerViewController *)v14 _setPropertyEnabled:v11 & 1 identity:v10];
  id v9 = (id)[(ACUIIdentityPickerViewController *)v14 specifierForID:@"Switch"];
  if (v14->_userInteractiveSwitch && [location[0] count]) {
    [v9 setProperty:@"YES" forKey:*MEMORY[0x1E4F93130]];
  }
  uint64_t v8 = 0;
  [(ACUIIdentityPickerViewController *)v14 beginUpdates];
  [(ACUIIdentityPickerViewController *)v14 reloadSpecifier:v9 animated:1];
  id v4 = v14;
  id v5 = (id)[(ACUIIdentityPickerViewController *)v14 specifierForID:@"CertificatesGroup"];
  -[ACUIIdentityPickerViewController getGroup:row:ofSpecifier:](v4, "getGroup:row:ofSpecifier:", v3);

  uint64_t v6 = v14;
  id v7 = (id)[(ACUIIdentityPickerViewController *)v14 specifiersInGroup:v8];
  -[ACUIIdentityPickerViewController replaceContiguousSpecifiers:withSpecifiers:animated:](v6, "replaceContiguousSpecifiers:withSpecifiers:animated:");

  [(ACUIIdentityPickerViewController *)v14 endUpdates];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)_specifiersForIdentities:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = self;
  SEL v31 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = (void *)MEMORY[0x1E4F92E70];
  id v19 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v18 = (id)[v19 localizedStringForKey:@"CERTIFICATES" value:&stru_1F39EF5C0 table:@"Localizable"];
  id v28 = (id)objc_msgSend(v17, "groupSpecifierWithName:");

  [v28 setProperty:@"CertificatesGroup" forKey:*MEMORY[0x1E4F93188]];
  [v29 addObject:v28];
  if ([location count])
  {
    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0;
      unint64_t v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(obj);
        }
        SecIdentityRef v27 = *(SecIdentityRef *)(__b[1] + 8 * v13);
        SecCertificateRef certificateRef = 0;
        unsigned int v24 = 0;
        unsigned int v24 = SecIdentityCopyCertificate(v27, &certificateRef);
        if (v24)
        {
          uint64_t v10 = NSStringFromSelector(v31);
          NSLog(&cfstr_Secidentitycop.isa, v10, v24);
        }
        else if (certificateRef)
        {
          int v34 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
          id v23 = v34;
          if (v23)
          {
            id v22 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v23 target:v32 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
            id v9 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v27 forKey:@"Identity"];
            objc_msgSend(v22, "setUserInfo:");

            [v29 addObject:v22];
            objc_storeStrong(&v22, 0);
          }
          else
          {
            id v33 = (id)SecCertificateCopyProperties();
            id v21 = v33;
            uint64_t v8 = NSStringFromSelector(v31);
            NSLog(&cfstr_NoSummaryForCe.isa, v8, v21);

            objc_storeStrong(&v21, 0);
          }
          CFRelease(certificateRef);
          objc_storeStrong(&v23, 0);
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F92E70];
    id v7 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = (id)[v7 localizedStringForKey:@"NO_IDENTITIES_EXPLANATION" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v20 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

    [v20 setProperty:@"NO" forKey:*MEMORY[0x1E4F93130]];
    [v29 addObject:v20];
    objc_storeStrong(&v20, 0);
  }
  id v4 = v29;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)_identitySpecifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)((char *)&v16->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v9);
      id v5 = (id)[v14 userInfo];
      id v2 = (id)[v5 objectForKey:@"Identity"];
      BOOL v6 = v2 == 0;

      if (!v6) {
        [v15[0] addObject:v14];
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v4 = v15[0];
  objc_storeStrong(v15, 0);
  return v4;
}

- (__SecIdentity)_identityToAutoselectWithEnabled:(BOOL)a3
{
  BOOL v5 = a3;
  id v4 = [(ACUIIdentityPickerViewController *)self _selectedIdentity];
  if (self->_userInteractiveIdentityList && v5 && !v4 && [(NSArray *)self->_identities count]) {
    return (__SecIdentity *)[(NSArray *)self->_identities objectAtIndex:0];
  }
  return v4;
}

- (void)_setValue:(id)a3 forSwitchSpecifier:(id)a4
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  unsigned __int8 v6 = [location[0] BOOLValue] & 1;
  uint64_t v5 = [(ACUIIdentityPickerViewController *)v9 _identityToAutoselectWithEnabled:v6];
  [(ACUIIdentityPickerViewController *)v9 _setPropertyEnabled:v6 & 1 identity:v5];
  [(ACUIIdentityPickerViewController *)v9 reload];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)_setPropertyEnabled:(BOOL)a3 identity:(__SecIdentity *)a4
{
  BOOL v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained identityPickerController:self setPropertyEnabled:v6 withIdentity:a4];
}

- (id)_valueForSwitchSpecifier:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)objc_msgSend(NSNumber, "numberWithBool:", -[ACUIIdentityPickerViewController _isPropertyEnabled](v6, "_isPropertyEnabled"));
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_isPropertyEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained isPropertyEnabledForIdentityPickerController:self];

  return v4 & 1;
}

- (__SecIdentity)_selectedIdentity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = (__SecIdentity *)[WeakRetained selectedIdentityForIdentityPickerController:self];

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  v19.receiver = v23;
  v19.super_class = (Class)ACUIIdentityPickerViewController;
  id v20 = [(ACUIIdentityPickerViewController *)&v19 tableView:location[0] cellForRowAtIndexPath:v21];
  id v18 = (id)[(ACUIIdentityPickerViewController *)v23 specifierAtIndex:[(ACUIIdentityPickerViewController *)v23 indexForIndexPath:v21]];
  id v10 = (id)[v18 userInfo];
  uint64_t v11 = (const void *)[v10 objectForKey:@"Identity"];

  if (v11)
  {
    id v17 = [(ACUIIdentityPickerViewController *)v23 _selectedIdentity];
    if ([(ACUIIdentityPickerViewController *)v23 _isPropertyEnabled]
      || (BOOL v8 = 0, v23->_allowIdentitySelectionForDisabledSwitch))
    {
      BOOL v8 = _SecIdentityEqual(v17, v11);
    }
    [(ACUIIdentityPickerViewController *)v23 _updateCell:v20 selected:v8];
    char v16 = [(ACUIIdentityPickerViewController *)v23 _allowIdentitySelection];
    char v14 = 0;
    char v12 = 0;
    if (v16)
    {
      id v15 = (id)[MEMORY[0x1E4F428B8] labelColor];
      char v14 = 1;
      id v7 = v15;
    }
    else
    {
      id v13 = (id)[MEMORY[0x1E4F428B8] secondaryLabelColor];
      char v12 = 1;
      id v7 = v13;
    }
    id v6 = (id)[v20 textLabel];
    [v6 setTextColor:v7];

    if (v12) {
    if (v14)
    }

    [v20 setSelectionStyle:(v16 & 1) != 0];
    [v20 setAccessoryType:2];
  }
  id v5 = v20;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  unsigned int v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = (id)[(ACUIIdentityPickerViewController *)v24 specifierAtIndex:[(ACUIIdentityPickerViewController *)v24 indexForIndexPath:v22]];
  id v13 = (id)[v21 userInfo];
  uint64_t v14 = [v13 objectForKey:@"Identity"];

  uint64_t v20 = v14;
  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
    uint64_t v11 = (const void *)[WeakRetained copyTrustForIdentityPickerController:v24 identity:v20];

    CFTypeRef v19 = v11;
    if (v11)
    {
      id v18 = (id)[MEMORY[0x1E4F58108] defaultTrustManager];
      unsigned int v17 = 0;
      id v6 = v18;
      CFTypeRef v5 = v19;
      id v7 = [(NSArray *)v24->_emailAddresses objectAtIndex:0];
      unsigned int v8 = objc_msgSend(v6, "actionForSMIMETrust:sender:", v5);

      unsigned int v17 = v8;
      id v4 = objc_alloc(MEMORY[0x1E4F580F8]);
      id v16 = (id)[v4 initWithTrust:v19 action:v8];
      id v9 = (id)[(ACUIIdentityPickerViewController *)v24 navigationController];
      [v9 pushViewController:v16 animated:1];

      CFRelease(v19);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    v15.receiver = v24;
    v15.super_class = (Class)ACUIIdentityPickerViewController;
    [(ACUIIdentityPickerViewController *)&v15 tableView:location[0] accessoryButtonTappedForRowWithIndexPath:v22];
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = (id)[(ACUIIdentityPickerViewController *)v26 specifierAtIndex:[(ACUIIdentityPickerViewController *)v26 indexForIndexPath:v24]];
  id v14 = (id)[v23 userInfo];
  objc_super v15 = (const void *)[v14 objectForKey:@"Identity"];

  id v22 = v15;
  id v21 = [(ACUIIdentityPickerViewController *)v26 _selectedIdentity];
  if (v15)
  {
    if ([(ACUIIdentityPickerViewController *)v26 _allowIdentitySelection]
      && !_SecIdentityEqual(v22, v21))
    {
      [(ACUIIdentityPickerViewController *)v26 _setPropertyEnabled:[(ACUIIdentityPickerViewController *)v26 _isPropertyEnabled] identity:v22];
      memset(__b, 0, sizeof(__b));
      id v11 = [(ACUIIdentityPickerViewController *)v26 _identitySpecifiers];
      uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v27 count:16];
      if (v12)
      {
        uint64_t v8 = *(void *)__b[2];
        uint64_t v9 = 0;
        unint64_t v10 = v12;
        while (1)
        {
          uint64_t v7 = v9;
          if (*(void *)__b[2] != v8) {
            objc_enumerationMutation(v11);
          }
          id v20 = *(id *)(__b[1] + 8 * v9);
          id v18 = (id)[v20 propertyForKey:*MEMORY[0x1E4F93220]];
          id v4 = v22;
          id v5 = (id)[v20 userInfo];
          BOOL v6 = _SecIdentityEqual(v4, (const void *)[v5 objectForKey:@"Identity"]);

          BOOL v17 = v6;
          [(ACUIIdentityPickerViewController *)v26 _updateCell:v18 selected:v6];
          objc_storeStrong(&v18, 0);
          ++v9;
          if (v7 + 1 >= v10)
          {
            uint64_t v9 = 0;
            unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v27 count:16];
            if (!v10) {
              break;
            }
          }
        }
      }
    }
    [location[0] selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
  else
  {
    v16.receiver = v26;
    v16.super_class = (Class)ACUIIdentityPickerViewController;
    [(ACUIIdentityPickerViewController *)&v16 tableView:location[0] didSelectRowAtIndexPath:v24];
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_allowIdentitySelection
{
  BOOL v4 = 0;
  if (self->_userInteractiveIdentityList)
  {
    BOOL v3 = 1;
    if (!self->_allowIdentitySelectionForDisabledSwitch) {
      return [(ACUIIdentityPickerViewController *)self _isPropertyEnabled];
    }
    return v3;
  }
  return v4;
}

- (void)_updateCell:(id)a3 selected:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] _checkmarkImage:0];
  id v6 = (id)[location[0] imageView];
  [v6 setImage:v7];

  double v4 = 1.0;
  if (!a4) {
    double v4 = 0.0;
  }
  double v8 = v4;
  id v9 = (id)[location[0] imageView];
  [v9 setAlpha:v8];

  objc_storeStrong(location, 0);
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

@end