@interface DAContactSearchResultElement(ABAdditions)
- (ABRecordRef)newAddressBookRecordWithSource:()ABAdditions;
- (__CFString)localizedStringForKey:()ABAdditions formatArg:;
@end

@implementation DAContactSearchResultElement(ABAdditions)

- (ABRecordRef)newAddressBookRecordWithSource:()ABAdditions
{
  ABRecordRef v5 = ABPersonCreate();
  if (v5)
  {
    if ([a1 displayName]) {
      ABRecordSetValue(v5, kABCPersonDisplayNameProperty, (CFTypeRef)[a1 displayName], 0);
    }
    if ([a1 firstName]) {
      ABRecordSetValue(v5, kABPersonFirstNameProperty, (CFTypeRef)[a1 firstName], 0);
    }
    if ([a1 lastName]) {
      ABRecordSetValue(v5, kABPersonLastNameProperty, (CFTypeRef)[a1 lastName], 0);
    }
    if ([a1 emailAddress])
    {
      ABMutableMultiValueRef Mutable = ABMultiValueCreateMutable(1u);
      ABMultiValueAddValueAndLabel(Mutable, (CFTypeRef)[a1 emailAddress], @"_$!<Work>!$_", 0);
      ABRecordSetValue(v5, kABPersonEmailProperty, Mutable, 0);
      CFRelease(Mutable);
    }
    if ([a1 workPhone]
      || [a1 mobilePhone]
      || [a1 homePhone]
      || [a1 faxPhone]
      || [a1 pagerNumber]
      || [a1 iPhone]
      || [a1 mainPhone]
      || [a1 workFaxPhone])
    {
      ABMutableMultiValueRef v7 = ABMultiValueCreateMutable(1u);
      if ([a1 workPhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 workPhone], @"_$!<Work>!$_", 0);
      }
      if ([a1 mobilePhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 mobilePhone], @"_$!<Mobile>!$_", 0);
      }
      if ([a1 homePhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 homePhone], @"_$!<Home>!$_", 0);
      }
      if ([a1 faxPhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 faxPhone], @"_$!<HomeFAX>!$_", 0);
      }
      if ([a1 pagerNumber]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 pagerNumber], @"_$!<Pager>!$_", 0);
      }
      if ([a1 iPhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 iPhone], @"iPhone", 0);
      }
      if ([a1 mainPhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 mainPhone], @"_$!<Main>!$_", 0);
      }
      if ([a1 workFaxPhone]) {
        ABMultiValueAddValueAndLabel(v7, (CFTypeRef)[a1 workFaxPhone], @"_$!<WorkFAX>!$_", 0);
      }
      ABRecordSetValue(v5, kABPersonPhoneProperty, v7, 0);
      CFRelease(v7);
    }
    if ([a1 company]) {
      ABRecordSetValue(v5, kABPersonOrganizationProperty, (CFTypeRef)[a1 company], 0);
    }
    if ([a1 title]) {
      ABRecordSetValue(v5, kABPersonJobTitleProperty, (CFTypeRef)[a1 title], 0);
    }
    ABMutableMultiValueRef v8 = ABMultiValueCreateMutable(5u);
    if ([a1 city] || objc_msgSend(a1, "state") || objc_msgSend(a1, "zip") || objc_msgSend(a1, "country"))
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
      if ([a1 street]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "street"), @"Street");
      }
      if ([a1 city]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "city"), @"City");
      }
      if ([a1 state]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "state"), @"State");
      }
      if ([a1 zip]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "zip"), @"ZIP");
      }
      if ([a1 country]) {
        objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a1, "country"), @"Country");
      }
      ABMultiValueAddValueAndLabel(v8, v9, @"_$!<Work>!$_", 0);
    }
    else if ([a1 postalAddress] || objc_msgSend(a1, "street"))
    {
      CFStringRef v16 = (const __CFString *)[a1 street];
      if (!v16) {
        CFStringRef v16 = (const __CFString *)[a1 postalAddress];
      }
      v17 = ABCreateAddressDictionaryWithString(v16);
      if (!v17) {
        v17 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v16, @"Street", 0);
      }
      ABMultiValueAddValueAndLabel(v8, v17, @"_$!<Work>!$_", 0);
      CFRelease(v17);
    }
    if ([a1 homePostalAddress])
    {
      v10 = ABCreateAddressDictionaryWithString((const __CFString *)[a1 homePostalAddress]);
      if (!v10) {
        v10 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(a1, "homePostalAddress"), @"Street", 0);
      }
      ABMultiValueAddValueAndLabel(v8, v10, @"_$!<Home>!$_", 0);
      CFRelease(v10);
    }
    if (ABMultiValueGetCount(v8) >= 1) {
      ABRecordSetValue(v5, kABPersonAddressProperty, v8, 0);
    }
    CFRelease(v8);
    if ([a1 jpegPhoto]) {
      ABPersonSetImageData(v5, (CFDataRef)[a1 jpegPhoto], 0);
    }
    if ([a1 imUsername])
    {
      ABMutableMultiValueRef v11 = ABMultiValueCreateMutable(1u);
      uint64_t v12 = [a1 imService];
      if (v12) {
        v13 = (__CFString *)v12;
      }
      else {
        v13 = @"AIM";
      }
      ABMultiValueAddValueAndLabel(v11, (CFTypeRef)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(a1, "imUsername"), @"username", v13, @"service", 0), @"_$!<Work>!$_", 0);
      ABRecordSetValue(v5, kABPersonInstantMessageProperty, v11, 0);
      CFRelease(v11);
    }
    if ([a1 buildingName] || objc_msgSend(a1, "appleFloor"))
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      if ([a1 buildingName])
      {
        objc_msgSend(v14, "appendString:", objc_msgSend(a1, "localizedStringForKey:formatArg:", @"NOTES_BUILDING_NAME_FORMAT", objc_msgSend(a1, "buildingName")));
        if ([a1 appleFloor]) {
          [v14 appendString:@"\n"];
        }
      }
      if ([a1 appleFloor]) {
        objc_msgSend(v14, "appendString:", objc_msgSend(a1, "localizedStringForKey:formatArg:", @"NOTES_APPLE_FLOOR_FORMAT", objc_msgSend(a1, "appleFloor")));
      }
      ABRecordSetValue(v5, kABPersonNoteProperty, v14, 0);
    }
    if (a3)
    {
      ABSourceSetShouldIgnoreCapabilitiesRestrictions((uint64_t)a3, 1);
      ABRecordSetValue(v5, kABPersonStoreReferenceProperty, a3, 0);
      if ([a1 identifierOnServer]) {
        ABRecordSetValue(v5, kABPersonExternalIdentifierProperty, (CFTypeRef)[a1 identifierOnServer], 0);
      }
      ABSourceSetShouldIgnoreCapabilitiesRestrictions((uint64_t)a3, 0);
    }
  }
  return v5;
}

- (__CFString)localizedStringForKey:()ABAdditions formatArg:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (__CFBundle *)_ABBundle();
  CFStringRef v7 = CFBundleCopyLocalizedString(v6, a3, 0, @"Localized");
  if (v7)
  {
    CFStringRef v8 = v7;
    uint64_t v12 = 0;
    uint64_t v9 = [NSString stringWithValidatedFormat:v7, @"%@", &v12, a4 validFormatSpecifiers error];
    if (v12)
    {
      v10 = ABOSLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v14 = v8;
        __int16 v15 = 2114;
        uint64_t v16 = a4;
        __int16 v17 = 2114;
        uint64_t v18 = v12;
        _os_log_error_impl(&dword_19DCDB000, v10, OS_LOG_TYPE_ERROR, "Error creating localized string from format = %{public}@, value = %{public}@, error = %{public}@", buf, 0x20u);
      }
    }
    CFRelease(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v9) {
    return (__CFString *)v9;
  }
  else {
    return &stru_1EF03E278;
  }
}

@end