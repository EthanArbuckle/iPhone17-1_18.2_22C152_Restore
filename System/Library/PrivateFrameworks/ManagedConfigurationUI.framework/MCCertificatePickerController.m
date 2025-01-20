@interface MCCertificatePickerController
- (id)navigationTitle;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_setCellPropertiesOnSpecifier:(id)a3 forCertificate:(__SecCertificate *)a4;
- (void)setRowToSelect;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
@end

@implementation MCCertificatePickerController

- (id)navigationTitle
{
  return MCUILocalizedString(@"CERTIFICATES");
}

- (void)_setCellPropertiesOnSpecifier:(id)a3 forCertificate:(__SecCertificate *)a4
{
  id v10 = a3;
  v5 = (__CFString *)SecCertificateCopySubjectSummary(a4);
  if (v5) {
    [v10 setProperty:v5 forKey:@"kMCCellTitleKey"];
  }
  v6 = (void *)SecCertificateCopyIssuerSummary();
  if (v6) {
    [v10 setProperty:v6 forKey:@"kMCCellIssuerKey"];
  }
  SecCertificateNotValidAfter();
  CFDateRef v8 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
  v9 = v10;
  if (v8)
  {
    [v10 setProperty:v8 forKey:@"kMCCellExpirationDateKey"];
    v9 = v10;
  }
  [v9 setProperty:a4 forKey:@"kMCCertificateDetailsCertificateRefKey"];
}

- (id)specifiers
{
  keys[4] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) values];
    CFTypeRef result = 0;
    if ((int)[v5 count] < 1)
    {
      v15 = 0;
      v16 = 0;
LABEL_33:
      v26 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v15;
      v27 = v15;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      goto LABEL_34;
    }
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, 0);
    CFTypeID v7 = CFGetTypeID(ValueAtIndex);
    uint64_t v29 = v3;
    if (v7 == CFDataGetTypeID())
    {
      CFDateRef v8 = (void *)[objc_alloc(NSNumber) initWithInt:0x7FFFFFFFLL];
      v9 = (void *)*MEMORY[0x1E4F3BC80];
      keys[0] = *(void **)MEMORY[0x1E4F3B978];
      keys[1] = v9;
      id v10 = (void *)*MEMORY[0x1E4F3BB80];
      keys[2] = *(void **)MEMORY[0x1E4F3BB78];
      keys[3] = v10;
      v11 = (void *)*MEMORY[0x1E4F1CFD0];
      values[0] = *(void **)MEMORY[0x1E4F3B990];
      values[1] = v11;
      values[2] = v5;
      values[3] = v8;
      CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (SecItemCopyMatching(v12, &result))
      {
        if (result) {
          CFRelease(result);
        }
        CFTypeRef result = 0;
      }
      CFRelease(v12);

      int v13 = 0;
      CFTypeRef v14 = result;
      if (!result)
      {
LABEL_29:
        v16 = 0;
        v15 = 0;
LABEL_30:
        if (result) {
          CFRelease(result);
        }
        uint64_t v3 = v29;
        goto LABEL_33;
      }
    }
    else if (v7 == SecIdentityGetTypeID())
    {
      CFTypeRef v14 = v5;
      int v13 = 0;
      CFTypeRef result = v14;
      if (!v14) {
        goto LABEL_29;
      }
    }
    else
    {
      if (v7 != SecCertificateGetTypeID()) {
        goto LABEL_29;
      }
      CFTypeRef v14 = v5;
      CFTypeRef result = v14;
      int v13 = 1;
      if (!v14) {
        goto LABEL_29;
      }
    }
    int Count = CFArrayGetCount((CFArrayRef)v14);
    if (Count < 1) {
      goto LABEL_29;
    }
    CFIndex v18 = 0;
    v15 = 0;
    v16 = 0;
    uint64_t v31 = *MEMORY[0x1E4F930A8];
    uint64_t v19 = Count;
    uint64_t v30 = *MEMORY[0x1E4F93218];
    while (1)
    {
      keys[0] = 0;
      v20 = (__SecIdentity *)CFArrayGetValueAtIndex((CFArrayRef)result, v18);
      if (v13) {
        break;
      }
      SecIdentityCopyCertificate(v20, (SecCertificateRef *)keys);
      if (keys[0]) {
        goto LABEL_22;
      }
LABEL_25:
      if (v19 == ++v18) {
        goto LABEL_30;
      }
    }
    keys[0] = (void *)CFRetain(v20);
    if (!keys[0]) {
      goto LABEL_25;
    }
LABEL_22:
    if (v15)
    {
      if (v16)
      {
LABEL_24:
        v21 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:objc_opt_class() cell:3 edit:0];
        [v21 setProperty:objc_opt_class() forKey:v31];
        [v21 setProperty:v16 forKey:v30];
        [(MCCertificatePickerController *)self _setCellPropertiesOnSpecifier:v21 forCertificate:keys[0]];
        v22 = (void *)MEMORY[0x1E4F1C978];
        v23 = [v5 objectAtIndex:v18];
        v24 = [v22 arrayWithObject:v23];
        [v21 setValues:v24];

        [(objc_class *)v15 addObject:v21];
        CFRelease(keys[0]);

        goto LABEL_25;
      }
    }
    else
    {
      v15 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v16) {
        goto LABEL_24;
      }
    }
    id v25 = objc_alloc(NSNumber);
    +[MCCertificatePickerCell defaultCellHeight];
    v16 = objc_msgSend(v25, "initWithFloat:");
    goto LABEL_24;
  }
LABEL_34:
  return v4;
}

- (void)setRowToSelect
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int)*MEMORY[0x1E4F92F18];
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = (Class)0x7FFFFFFFFFFFFFFFLL;
  uint64_t v3 = (int)*MEMORY[0x1E4F92FA0];
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v3);
  v5 = (int *)MEMORY[0x1E4F92F38];
  if (*(void *)(v4 + (int)*MEMORY[0x1E4F92F38]))
  {
    CFTypeID v7 = (int *)MEMORY[0x1E4F92F48];
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + (int)*MEMORY[0x1E4F92F48]));
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)(*(char **)((char *)&self->super.super.super.super.super.super.isa + v3) + *v7));
      v11 = [v10 *(SEL *)(*(char **)((char *)&self->super.super.super.super.super.super.isa + v3) + *v5)];

      if (v11)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        CFDictionaryRef v12 = [(MCCertificatePickerController *)self specifiers];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            uint64_t v17 = 0;
            uint64_t v20 = v15 + v14;
            do
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v12);
              }
              CFIndex v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) values];
              uint64_t v19 = [v18 lastObject];

              if (v11 == v19)
              {
                *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = (Class)(v15 + v17);
                goto LABEL_14;
              }
              ++v17;
            }
            while (v14 != v17);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
            uint64_t v15 = v20;
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_14:
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCCertificatePickerController;
  CFTypeID v7 = [(PSListItemsController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    char v9 = [(MCCertificatePickerController *)self specifierAtIndex:[(MCCertificatePickerController *)self indexForIndexPath:v6]];
    id v10 = [v9 propertyForKey:@"kMCCellTitleKey"];
    [v8 setTitle:v10];

    v11 = [v9 propertyForKey:@"kMCCellIssuerKey"];
    [v8 setIssuer:v11];

    CFDictionaryRef v12 = [v9 propertyForKey:@"kMCCellExpirationDateKey"];
    [v8 setExpirationDate:v12];
  }
  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  CFTypeID v7 = [(MCCertificatePickerController *)self specifierAtIndex:[(MCCertificatePickerController *)self indexForIndexPath:a4]];
  id v5 = objc_alloc_init(*(Class *)&v7[*MEMORY[0x1E4F92F30]]);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E4F92F98]));
    [v5 setRootController:WeakRetained];

    [v5 setParentController:self];
    [v5 setSpecifier:v7];
    [(MCCertificatePickerController *)self showController:v5];
  }
}

@end