void CNUICopyAccountInformation(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  CFArrayRef v15;
  CFArrayRef v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v21;
  const void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t vars8;

  v11 = a6;
  v26 = (id)objc_opt_new();
  v12 = objc_opt_new();
  if (a4)
  {
    v13 = objc_opt_new();
    if (a5)
    {
LABEL_3:
      v27 = (id)objc_opt_new();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  v27 = 0;
LABEL_6:
  v25 = a2;
  v14 = v11;
  v24 = v14;
  if (!v14)
  {
    v14 = +[ACAccountStore defaultStore];
  }
  v15 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
  if (v15)
  {
    v16 = v15;
    Count = CFArrayGetCount(v15);
    if (Count >= 1)
    {
      v18 = Count;
      for (i = 0; i != v18; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v16, i);
        sub_2FCC(ValueAtIndex, v26, a1, v12, v27, (uint64_t)a5, v13, (uint64_t)a4, v14);
      }
    }
    CFRelease(v16);
  }
  v21 = (const void *)ABAddressBookCopyLocalSource();
  if (v21)
  {
    v22 = v21;
    v23 = (void *)ABRecordCopyValue(v21, kABSourceEnabledProperty);
    if (([v23 BOOLValue] & 1) != 0 || !objc_msgSend(v26, "count")) {
      sub_2FCC(0, v26, a1, v12, v27, (uint64_t)a5, v13, (uint64_t)a4, v14);
    }
    CFRelease(v22);
  }
  if (v25) {
    *v25 = v26;
  }
  if (a3) {
    *a3 = v12;
  }
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v27;
  }
}

void sub_2FCC(const void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, void *a7, uint64_t a8, void *a9)
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  if (!a1)
  {
    v60 = 0;
    v22 = (const void *)ABAddressBookCopyLocalSource();
    v25 = 0;
    v19 = 0;
    CFStringRef v24 = @"local";
    goto LABEL_33;
  }
  uint64_t v18 = ABAccountCopyIdentifier();
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A1F4(a1);
    }
    v19 = 0;
    goto LABEL_13;
  }
  v19 = (__CFString *)v18;
  uint64_t v20 = [v17 displayTypeForAccountWithIdentifier:v18];
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v19;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Could not find account with identifier <%@> in the account store", buf, 0xCu);
    }
LABEL_13:
    v25 = 0;
    goto LABEL_75;
  }
  v58 = (void *)v20;
  v60 = a1;
  DefaultSourceForAccount = (const void *)ABAddressBookGetDefaultSourceForAccount();
  if (DefaultSourceForAccount)
  {
    v22 = DefaultSourceForAccount;
    v23 = (void *)ABRecordCopyValue(DefaultSourceForAccount, kABSourceEnabledProperty);
    if ([v23 BOOLValue])
    {
      CFRetain(v22);

      CFStringRef v24 = v19;
LABEL_32:
      v25 = v58;
      goto LABEL_33;
    }
    id v56 = v15;
    CFStringRef v57 = v19;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v19;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Default store for account with identifier <%@> was not enabled.  Using another store instead", buf, 0xCu);
    }
  }
  else
  {
    id v56 = v15;
    CFStringRef v57 = v19;
    v23 = 0;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v26 = (id)ABAddressBookCopyArrayOfAllSourcesInAccount();
  id v27 = [v26 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v27)
  {
    id v28 = v27;
    id v53 = v16;
    id v54 = v14;
    id v55 = v13;
    id v63 = 0;
    v29 = 0;
    uint64_t v30 = *(void *)v65;
    ABPropertyID v31 = kABSourceEnabledProperty;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        v33 = v23;
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v26);
        }
        v34 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v23 = (void *)ABRecordCopyValue(v34, v31);

        v35 = (void *)ABRecordCopyValue(v34, kABSourceTypeProperty);
        if ([v23 BOOLValue])
        {
          if (([v35 intValue] & 0x1000000) != 0)
          {
            if (!v29) {
              v29 = v34;
            }
          }
          else if (!v63)
          {
            id v63 = v34;
          }
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v28);

    v22 = v63;
    if (v63)
    {

      id v15 = v56;
      v19 = (__CFString *)v57;
      CFStringRef v24 = v57;
      id v14 = v54;
      id v13 = v55;
      id v16 = v53;
      goto LABEL_32;
    }
    id v14 = v54;
    id v13 = v55;
    id v16 = v53;
    v19 = (__CFString *)v57;
    v25 = v58;
    if (v29)
    {
      CFTypeRef v41 = CFRetain(v29);
      if (v41)
      {
        v22 = v41;

        CFStringRef v24 = v57;
        id v15 = v56;
LABEL_33:
        [v13 addObject:v24];
        int IntValue = ABRecordGetIntValue();
        [v14 addObject:v22];
        CFRelease(v22);
        if (!a6) {
          goto LABEL_62;
        }
        if (v25)
        {
          v37 = [v25 accountTypeDescription];
        }
        else
        {
          v37 = 0;
        }
        if ((IntValue & 0xFEFFFFFF) == 4)
        {
          if (![(__CFString *)v37 length])
          {
            v38 = CNContactsUIBundle();
            v39 = v38;
            CFStringRef v40 = @"CARDDAV";
            goto LABEL_58;
          }
        }
        else if ((IntValue & 0xFEFFFFFF) == 1)
        {
          if (![(__CFString *)v37 length])
          {
            v38 = CNContactsUIBundle();
            v39 = v38;
            CFStringRef v40 = @"EXCHANGE";
LABEL_58:
            [v38 localizedStringForKey:v40 value:&stru_10D88 table:@"Localized"];
            uint64_t v44 = v59 = v25;

            v37 = (__CFString *)v44;
            v25 = v59;
          }
        }
        else
        {
          if (!IntValue)
          {
            CFStringRef v42 = &stru_10D88;
            v43 = v15;
LABEL_60:
            [v43 addObject:v42];
            goto LABEL_61;
          }
          if (IntValue != 16777219)
          {
            if (IntValue != 2)
            {
LABEL_61:

LABEL_62:
              if (!a8) {
                goto LABEL_75;
              }
              if (IntValue)
              {
                if (v60)
                {
                  [v17 accountWithIdentifier:v19];
                  v46 = v45 = v25;
                  v47 = [v46 displayAccount];
                  v48 = [v47 accountDescription];

                  v25 = v45;
                  if (v48) {
                    goto LABEL_72;
                  }
                }
                else
                {
                  v48 = 0;
                }
                if (!v25)
                {
LABEL_72:
                  if (![v48 length])
                  {
                    CNContactsUIBundle();
                    v51 = v50 = v25;
                    uint64_t v52 = [v51 localizedStringForKey:@"CONTACTS" value:&stru_10D88 table:@"AB"];

                    v25 = v50;
                    v48 = (void *)v52;
                  }
                  [v16 addObject:v48];

                  goto LABEL_75;
                }
                uint64_t v49 = [v25 accountTypeDescription];
              }
              else
              {
                uint64_t v49 = [(objc_class *)off_15598() localizedTitleForLocalSourceOfDataclass:kAccountDataclassContacts usedAtBeginningOfSentence:1];
              }
              v48 = (void *)v49;
              goto LABEL_72;
            }
            if ([(__CFString *)v37 length]) {
              goto LABEL_59;
            }
            v38 = CNContactsUIBundle();
            v39 = v38;
            CFStringRef v40 = @"MOBILEME";
            goto LABEL_58;
          }
          if (![(__CFString *)v37 length])
          {
            v38 = CNContactsUIBundle();
            v39 = v38;
            CFStringRef v40 = @"LDAP";
            goto LABEL_58;
          }
        }
LABEL_59:
        v43 = v15;
        CFStringRef v42 = v37;
        goto LABEL_60;
      }
    }
  }
  else
  {

    v19 = (__CFString *)v57;
    v25 = v58;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_A278((uint64_t)v19);
  }

  id v15 = v56;
LABEL_75:
}

Class sub_3614()
{
  if (qword_158F0 != -1) {
    dispatch_once(&qword_158F0, &stru_10978);
  }
  Class result = objc_getClass("ACUILocalization");
  qword_158E0 = (uint64_t)result;
  off_15598 = (uint64_t (*)())sub_3678;
  return result;
}

id sub_3678()
{
  return (id)qword_158E0;
}

void sub_3684(id a1)
{
  qword_158E8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  if (!qword_158E8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_A2F8();
  }
}

uint64_t CNUIContainerSelectionEnabled()
{
  return __os_feature_enabled_impl("Contacts", "container_selection");
}

uint64_t CNUIPronounsEnabled()
{
  return __os_feature_enabled_impl("CoreFoundation", "Colorado");
}

uint64_t CNContactCardSeparationEnabled()
{
  return __os_feature_enabled_impl("Contacts", "contact_card_separation");
}

uint64_t CNUnsavedDraftsEnabled()
{
  return __os_feature_enabled_impl("Contacts", "unsaved_drafts");
}

uint64_t CNDuplicateDetectionEnabled()
{
  return __os_feature_enabled_impl("Contacts", "duplicate_detection");
}

uint64_t CNUINarwhalEnabled()
{
  return __os_feature_enabled_impl("Transparency", "KTStaticId");
}

uint64_t CNUIDSDSUnknownNumberSIMLinePickerEnabled()
{
  return __os_feature_enabled_impl("Contacts", "dsds_unknown_number_SIM_line_picker");
}

uint64_t CNContactProviderEnabled()
{
  return __os_feature_enabled_impl("Contacts", "contact_provider");
}

uint64_t CNUIAllowMultiplePhoneNumbersSNaP()
{
  return __os_feature_enabled_impl("Contacts", "snap_allow_multiple_phone_numbers");
}

void sub_3E70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3ED4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  if (!v4
    || (v5 = [*(id *)(a1 + 72) isContact:v3 presentInContainer:v4 store:*(void *)(a1 + 40)], id v3 = v9, v5))
  {
    v6 = [*(id *)(a1 + 48) stringFromContact:v3];
    v7 = v6;
    if (!*(unsigned char *)(a1 + 80) && ![v6 length]
      || [v7 length] && objc_msgSend(v7, "isEqualToString:", *(void *)(a1 + 56)))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }

  return _objc_release_x1();
}

uint64_t sub_3F90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  if (!v4
    || (v5 = [*(id *)(a1 + 96) isContact:v3 presentInContainer:v4 store:*(void *)(a1 + 40)], id v3 = v13, v5))
  {
    v6 = [*(id *)(a1 + 48) stringFromContact:v3];
    if ([v6 isEqualToString:*(void *)(a1 + 56)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      if (*(unsigned char *)(a1 + 104))
      {
        v7 = +[CNPhoneNumber phoneNumberWithStringValue:*(void *)(a1 + 64)];
        v8 = +[CNLabeledValue labeledValueWithLabel:*(void *)(a1 + 72) value:v7];
        id v9 = [v13 mutableCopy];
        v10 = [v9 phoneNumbers];
        v11 = [v10 arrayByAddingObject:v8];
        [v9 setPhoneNumbers:v11];

        [*(id *)(a1 + 80) updateContact:v9];
      }
    }
  }

  return _objc_release_x1();
}

void sub_4318(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    unsigned int v5 = [v3 log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_A380(v2, (uint64_t)v4, v5);
    }

    objc_end_catch();
    JUMPOUT(0x42D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_4390(id a1)
{
  qword_15900 = (uint64_t)objc_alloc_init((Class)NSPersonNameComponentsFormatter);

  _objc_release_x1();
}

void sub_449C(id a1)
{
  qword_15910 = (uint64_t)os_log_create("com.apple.contacts", "sim-import");

  _objc_release_x1();
}

id sub_4684(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 _clearSpecifiers];
}

void sub_4B28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 224);
  *(void *)(v2 + 224) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(void **)(v4 + 232);
  *(void *)(v4 + 232) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 184);
  id v30 = 0;
  id v31 = 0;
  CNUICopyAccountInformation(v6, 0, &v31, &v30, 0, 0);
  id v7 = v31;
  id v27 = v31;
  id v8 = v30;
  id v26 = v30;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), v7);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), v8);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 224) count];
  CFArrayRef v10 = ABAddressBookCopyArrayOfAllSources(*(ABAddressBookRef *)(*(void *)(a1 + 32) + 184));
  if (v10)
  {
    CFArrayRef v11 = v10;
    *(void *)(*(void *)(a1 + 32) + 240) = CFArrayGetCount(v10);
    CFRelease(v11);
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 240) = 0;
  }
  if ((uint64_t)v9 >= 1)
  {
    ABPropertyID v12 = kABSourceEnabledProperty;
    uint64_t v28 = kAccountDataclassContacts;
    for (unint64_t i = (unint64_t)v9 + 1; i > 1; --i)
    {
      CFNullRef v14 = (CFNullRef)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectAtIndex:", i - 2, v26, v27);
      CFNullRef v15 = v14;
      int valuePtr = 0;
      if (v14 != kCFNull)
      {
        CFNumberRef v16 = (const __CFNumber *)ABRecordCopyValue(v14, kABSourceTypeProperty);
        if (v16)
        {
          CFNumberRef v17 = v16;
          CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
          CFRelease(v17);
        }
      }
      CFBooleanRef v18 = (const __CFBoolean *)ABRecordCopyValue(v15, v12);
      CFBooleanRef v19 = v18;
      if (v18)
      {
        int Value = CFBooleanGetValue(v18);
        int v21 = valuePtr & 0x1000000;
        int IsContentReadonlyIncludingGuardianRestrictions = ABSourceIsContentReadonlyIncludingGuardianRestrictions();
        CFRelease(v19);
        LODWORD(v19) = Value != 0;
        if (IsContentReadonlyIncludingGuardianRestrictions) {
          BOOL v23 = 0;
        }
        else {
          BOOL v23 = v21 == 0;
        }
        if (v23 && Value != 0)
        {
          LODWORD(v19) = 1;
          goto LABEL_20;
        }
      }
      else
      {
        ABSourceIsContentReadonlyIncludingGuardianRestrictions();
      }
      [*(id *)(*(void *)(a1 + 32) + 224) removeObjectAtIndex:i - 2];
      [*(id *)(*(void *)(a1 + 32) + 232) removeObjectAtIndex:i - 2];
LABEL_20:
      if (!valuePtr && v19)
      {
        v25 = [(objc_class *)off_155A0() localizedTitleForLocalSourceOfDataclass:v28 usedAtBeginningOfSentence:1];
        [*(id *)(*(void *)(a1 + 32) + 232) replaceObjectAtIndex:i - 2 withObject:v25];
      }
    }
  }
}

id sub_4DE0(uint64_t a1, void *a2)
{
  return _[a2 _SIMStatusChanged];
}

id sub_4EBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDefaultContacts:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48)];
}

void sub_5090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_50A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_50B8(uint64_t a1)
{
}

void sub_50C0(uint64_t a1)
{
  id v9 = (id)ABAddressBookCopyDefaultSource(*(ABAddressBookRef *)(*(void *)(a1 + 32) + 184));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 224) indexOfObject:v9];
  if (v9 && v2 < [*(id *)(*(void *)(a1 + 32) + 232) count])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 232) objectAtIndex:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 232) objectAtIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(a1 + 32) _setDefaultContacts:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) specifier:0];
  }
}

void sub_54B4(uint64_t a1, void *a2, const void *a3)
{
  id v4 = a2;
  if (CFEqual(kCTPhoneBookSelectedNotification, a3))
  {
    [v4 _phonebookSelected];
  }
  else if (CFEqual(kCTPhoneBookFetchNotification, a3))
  {
    [v4 _phonebookAvailable];
  }
  else
  {
    [v4 _erroredDuringSIMPhonebookFetch];
  }
}

id sub_5954(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _fetchSIMPhonebook];
}

id sub_5C10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginImportToStoreID:*(unsigned int *)(a1 + 40)];
}

void sub_5D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5D8C(uint64_t a1)
{
  ABAddressBookRevert(*(ABAddressBookRef *)(*(void *)(a1 + 32) + 184));
  CFArrayRef v2 = ABAddressBookCopyArrayOfAllSources(*(ABAddressBookRef *)(*(void *)(a1 + 32) + 184));
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    CFRelease(v3);
  }
  else
  {
    CFIndex Count = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 240);
  if (Count != v6 && v6 != 0)
  {
    id v8 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = 0;

    [*(id *)(a1 + 32) setSpecifiers:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v9 = *(void *)(a1 + 32);
    CFArrayRef v10 = *(void **)(v9 + 224);
    *(void *)(v9 + 224) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    ABPropertyID v12 = *(void **)(v11 + 232);
    *(void *)(v11 + 232) = 0;

    *(void *)(*(void *)(a1 + 32) + 240) = 0;
  }
  id v15 = (id)ABAddressBookCopyChangesSinceSequenceNumber();
  id v13 = [v15 objectForKey:kABAddressBookChangesToMeCardsKey];
  unsigned int v14 = [v13 BOOLValue];

  if (v14)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 248) = ABAddressBookGetSequenceNumber();
    [*(id *)(a1 + 32) performSelectorOnMainThread:"_reloadMeCardCellIfVisible" withObject:0 waitUntilDone:0];
  }
}

void sub_6958(uint64_t a1)
{
  id v2 = +[CNContactProviderSupport allDomainsCountWithError:0];
  if ([*(id *)(a1 + 32) providerCount] != v2)
  {
    [*(id *)(a1 + 32) setProviderCount:v2];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_6A1C;
    v4[3] = &unk_10AD0;
    CFArrayRef v3 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

id sub_6A1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

Class sub_7138()
{
  if (qword_15928 != -1) {
    dispatch_once(&qword_15928, &stru_10AF0);
  }
  Class result = objc_getClass("ACUILocalization");
  qword_15918 = (uint64_t)result;
  off_155A0 = (uint64_t (*)())sub_719C;
  return result;
}

id sub_719C()
{
  return (id)qword_15918;
}

void sub_71A8(id a1)
{
  qword_15920 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  if (!qword_15920 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_A2F8();
  }
}

void sub_7458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7474(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7484(uint64_t a1)
{
}

int64_t sub_748C(id a1, CNContactProviderSupportDomain *a2, CNContactProviderSupportDomain *a3)
{
  id v4 = a3;
  id v5 = [(CNContactProviderSupportDomain *)a2 displayName];
  uint64_t v6 = [(CNContactProviderSupportDomain *)v4 displayName];

  id v7 = [v5 compare:v6 options:1];
  return (int64_t)v7;
}

id sub_7500(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 displayName];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:a1[4] set:a1[7] get:a1[8] detail:0 cell:6 edit:0];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setUserInfo:v3];
  id v8 = (void *)a1[5];
  uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v8 addObject:v9];
}

void sub_8444()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  unint64_t v2 = 0x800000000000D500;
  if (!v1) {
    unint64_t v2 = 0x800000000000D530;
  }
  byte_15938 = 1;
  qword_15940 = v2;
}

uint64_t sub_84D4(void *a1)
{
  swift_getObjectType();
  uint64_t v37 = sub_9518(&qword_15810);
  uint64_t v39 = *(void *)(v37 - 8);
  __chkstk_darwin();
  v36 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFStringRef v40 = v1;
  [v1 setSelectionStyle:0];
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v5 = self;
  id v6 = [v5 bundleForClass:ObjCClassFromMetadata];
  NSString v7 = sub_A4E0();
  NSString v8 = sub_A4E0();
  id v9 = [v6 localizedStringForKey:v7 value:0 table:v8];

  uint64_t v10 = sub_A510();
  ABPropertyID v12 = v11;

  id v13 = (char *)swift_allocObject();
  *((void *)v13 + 2) = a1;
  *((void *)v13 + 3) = v10;
  v38 = (char *)v10;
  *((void *)v13 + 4) = v12;
  id v14 = a1;
  swift_bridgeObjectRetain();
  id v15 = [v5 bundleForClass:ObjCClassFromMetadata];
  NSString v16 = sub_A4E0();
  NSString v17 = sub_A4E0();
  id v18 = [v15 localizedStringForKey:v16 value:0 table:v17];

  uint64_t v19 = sub_A510();
  int v21 = v20;

  id v22 = [v5 bundleForClass:ObjCClassFromMetadata];
  NSString v23 = sub_A4E0();
  NSString v24 = sub_A4E0();
  id v25 = [v22 localizedStringForKey:v23 value:0 table:v24];

  uint64_t v26 = sub_A510();
  uint64_t v28 = v27;

  uint64_t v41 = v19;
  CFStringRef v42 = v21;
  v45._countAndFlagsBits = 23328;
  v45._object = (void *)0xE200000000000000;
  sub_A530(v45);
  v46._countAndFlagsBits = v26;
  v46._object = v28;
  sub_A530(v46);
  swift_bridgeObjectRelease();
  v47._countAndFlagsBits = 10333;
  v47._object = (void *)0xE200000000000000;
  sub_A530(v47);
  if (qword_15930 != -1) {
    swift_once();
  }
  if (byte_15938) {
    uint64_t v29 = 0xD000000000000021;
  }
  else {
    uint64_t v29 = 0;
  }
  id v30 = (void *)qword_15940;
  swift_bridgeObjectRetain();
  v48._countAndFlagsBits = v29;
  v48._object = v30;
  sub_A530(v48);
  swift_bridgeObjectRelease();
  v49._countAndFlagsBits = 41;
  v49._object = (void *)0xE100000000000000;
  sub_A530(v49);
  id v31 = v42;
  __chkstk_darwin();
  *(&v36 - 6) = v38;
  *(&v36 - 5) = v12;
  *(&v36 - 4) = v32;
  *(&v36 - 3) = v31;
  *(&v36 - 2) = (char *)sub_959C;
  *(&v36 - 1) = v13;
  sub_9518(&qword_15818);
  sub_9F94(&qword_15820, &qword_15818);
  v33 = v36;
  sub_A470();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_A480();
  uint64_t v34 = v37;
  uint64_t v43 = v37;
  uint64_t v44 = sub_9F94(&qword_15828, &qword_15810);
  sub_96A0(&v41);
  sub_A460();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v34);
  sub_A540();
  return swift_release();
}

uint64_t sub_89E0(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_A490();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_A4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = __chkstk_darwin();
  id v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v15 = [a1 target];
    uint64_t v39 = v10;
    uint64_t v40 = v7;
    uint64_t v37 = a2;
    uint64_t v38 = v11;
    if (v15)
    {
      self;
      NSString v16 = (void *)swift_dynamicCastObjCClass();
      if (v16)
      {
        id v36 = v16;
        id v15 = [v16 navigationItem];
LABEL_7:
        id v17 = [objc_allocWithZone((Class)UILabel) init];
        id v18 = self;
        NSString v19 = sub_A4E0();
        id v20 = [v18 preferredFontForTextStyle:v19];

        [v17 setFont:v20];
        sub_9518(&qword_15848);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_C9F0;
        *(void *)(inited + 32) = NSForegroundColorAttributeName;
        id v22 = self;
        swift_bridgeObjectRetain();
        NSString v23 = NSForegroundColorAttributeName;
        id v24 = [v22 labelColor];
        id v25 = [v24 colorWithAlphaComponent:a3];

        *(void *)(inited + 64) = sub_9EE4(0, &qword_15850);
        *(void *)(inited + 40) = v25;
        sub_8FA8(inited, &qword_15880, &qword_15888, (uint64_t (*)(uint64_t))sub_9C24);
        id v26 = objc_allocWithZone((Class)NSAttributedString);
        NSString v27 = sub_A4E0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_9E9C(&qword_15858, type metadata accessor for Key);
        Class isa = sub_A4D0().super.isa;
        swift_bridgeObjectRelease();
        id v29 = [v26 initWithString:v27 attributes:isa];

        [v17 setAttributedText:v29];
        sub_9EE4(0, &qword_15860);
        id v30 = (void *)sub_A550();
        uint64_t v31 = swift_allocObject();
        *(void *)(v31 + 16) = v15;
        *(void *)(v31 + 24) = v17;
        aBlock[4] = sub_9F60;
        aBlock[5] = v31;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_90D8;
        aBlock[3] = &unk_10CD0;
        v32 = _Block_copy(aBlock);
        id v33 = v15;
        id v34 = v17;
        swift_release();
        sub_A4A0();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_9E9C(&qword_15868, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_9518(&qword_15870);
        sub_9F94(&qword_15878, &qword_15870);
        sub_A570();
        sub_A560();
        _Block_release(v32);

        (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v6);
        return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v14, v39);
      }
      swift_unknownObjectRelease();
      id v15 = 0;
    }
    id v36 = 0;
    goto LABEL_7;
  }
  return result;
}

unint64_t sub_8FA8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_9518(a2);
  uint64_t v7 = sub_A580();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_9FD8(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_9CB8(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_90D8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_911C()
{
  id v0 = [self sharedApplication];
  sub_A450(v1);
  uint64_t v3 = v2;
  sub_8FA8((uint64_t)&_swiftEmptyArrayStorage, &qword_15838, &qword_15840, (uint64_t (*)(uint64_t))sub_9C24);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_9E9C(&qword_15830, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = sub_A4D0().super.isa;
  swift_bridgeObjectRelease();
  [v0 openURL:v3 options:isa completionHandler:0];
}

id sub_92B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v10 = sub_A4E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:specifier:", a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_94B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContactsSettingsPlacardCell()
{
  return self;
}

uint64_t sub_9518(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_955C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_959C(double a1)
{
  return sub_89E0(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_95A8()
{
  return sub_A4C0();
}

uint64_t sub_9658(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_96A0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_9718(uint64_t a1, uint64_t a2)
{
  return sub_9898(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_973C(uint64_t a1, uint64_t a2)
{
  return sub_9898(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_975C(uint64_t a1, id *a2)
{
  uint64_t result = sub_A4F0();
  *a2 = 0;
  return result;
}

uint64_t sub_97D4(uint64_t a1, id *a2)
{
  char v3 = sub_A500();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_9854@<X0>(void *a1@<X8>)
{
  sub_A510();
  NSString v2 = sub_A4E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_9898(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_A510();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_98DC()
{
  sub_A510();
  sub_A520();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_9930()
{
  sub_A510();
  sub_A5B0();
  sub_A520();
  Swift::Int v0 = sub_A5C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_99A8()
{
  uint64_t v0 = sub_A510();
  uint64_t v2 = v1;
  if (v0 == sub_A510() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_A5A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_9A38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A510();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_9A64(uint64_t a1)
{
  uint64_t v2 = sub_9E9C(&qword_15858, type metadata accessor for Key);
  uint64_t v3 = sub_9E9C(&qword_158D0, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_9B20@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_A4E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_9B68(uint64_t a1)
{
  uint64_t v2 = sub_9E9C(&qword_15830, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_9E9C(&qword_158D8, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_9C24(uint64_t a1)
{
  sub_A510();
  sub_A5B0();
  sub_A520();
  Swift::Int v2 = sub_A5C0();
  swift_bridgeObjectRelease();

  return sub_9CC8(a1, v2);
}

_OWORD *sub_9CB8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_9CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_A510();
    uint64_t v8 = v7;
    if (v6 == sub_A510() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_A5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_A510();
          uint64_t v15 = v14;
          if (v13 == sub_A510() && v15 == v16) {
            break;
          }
          char v18 = sub_A5A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_9E54(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_9E9C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9EE4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_9F20()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_9F60()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return [result setTitleView:*(void *)(v0 + 24)];
  }
  return result;
}

uint64_t sub_9F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_9F8C()
{
  return swift_release();
}

uint64_t sub_9F94(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_9658(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9FD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_9518(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_A03C()
{
  return sub_9E9C(&qword_158A0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_A084()
{
  return sub_9E9C(&qword_158A8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_A0CC()
{
  return sub_9E9C(&qword_158B0, type metadata accessor for Key);
}

uint64_t sub_A114()
{
  return sub_9E9C(&qword_158B8, type metadata accessor for Key);
}

uint64_t sub_A15C()
{
  return sub_9E9C(&qword_158C0, type metadata accessor for Key);
}

uint64_t sub_A1A4()
{
  return sub_9E9C(&qword_158C8, type metadata accessor for OpenExternalURLOptionsKey);
}

void sub_A1F4(const void *a1)
{
  v1[0] = 67109120;
  v1[1] = ABRecordGetRecordID(a1);
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got nil identifier for account with record ID %i.", (uint8_t *)v1, 8u);
}

void sub_A278(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not find any enabled sources for the account with identifier <%@>.", (uint8_t *)&v1, 0xCu);
}

void sub_A2F8()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI (%d)", (uint8_t *)v1, 8u);
}

void sub_A380(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Could not parse provided name string “%{public}@”: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_A408()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "scrolling me card cell into view", v0, 2u);
}

void sub_A450(NSURL *retstr@<X8>)
{
}

uint64_t sub_A460()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_A470()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_A480()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_A490()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_A4A0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_A4B0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_A4C0()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:applicationBundleIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_A4D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_A4E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A4F0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_A500()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_A510()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A520()
{
  return String.hash(into:)();
}

void sub_A530(Swift::String a1)
{
}

uint64_t sub_A540()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_A550()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_A560()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_A570()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_A580()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_A5A0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A5B0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_A5C0()
{
  return Hasher._finalize()();
}

uint64_t ABAccountCopyIdentifier()
{
  return _ABAccountCopyIdentifier();
}

uint64_t ABAddressBookCopyArrayOfAllAccounts()
{
  return _ABAddressBookCopyArrayOfAllAccounts();
}

CFArrayRef ABAddressBookCopyArrayOfAllSources(ABAddressBookRef addressBook)
{
  return _ABAddressBookCopyArrayOfAllSources(addressBook);
}

uint64_t ABAddressBookCopyArrayOfAllSourcesInAccount()
{
  return _ABAddressBookCopyArrayOfAllSourcesInAccount();
}

uint64_t ABAddressBookCopyChangesSinceSequenceNumber()
{
  return _ABAddressBookCopyChangesSinceSequenceNumber();
}

ABRecordRef ABAddressBookCopyDefaultSource(ABAddressBookRef addressBook)
{
  return _ABAddressBookCopyDefaultSource(addressBook);
}

uint64_t ABAddressBookCopyLocalSource()
{
  return _ABAddressBookCopyLocalSource();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return _ABAddressBookCreateWithOptions(options, error);
}

uint64_t ABAddressBookGetDefaultSourceForAccount()
{
  return _ABAddressBookGetDefaultSourceForAccount();
}

uint64_t ABAddressBookGetSequenceNumber()
{
  return _ABAddressBookGetSequenceNumber();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

uint64_t ABPeoplePickerPrefs()
{
  return _ABPeoplePickerPrefs();
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef record)
{
  return _ABPersonGetCompositeNameFormatForRecord(record);
}

uint64_t ABPersonGetShortNameFormat()
{
  return _ABPersonGetShortNameFormat();
}

uint64_t ABPersonGetShortNameFormatEnabled()
{
  return _ABPersonGetShortNameFormatEnabled();
}

uint64_t ABPersonGetShortNamePreferNicknames()
{
  return _ABPersonGetShortNamePreferNicknames();
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  return _ABPersonGetSortOrdering();
}

uint64_t ABPersonSetShortNameFormatEnabled()
{
  return _ABPersonSetShortNameFormatEnabled();
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return _ABRecordCopyValue(record, property);
}

uint64_t ABRecordGetIntValue()
{
  return _ABRecordGetIntValue();
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return _ABRecordGetRecordID(record);
}

uint64_t ABSourceIsContentReadonlyIncludingGuardianRestrictions()
{
  return _ABSourceIsContentReadonlyIncludingGuardianRestrictions();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

uint64_t CNContactsUIBundle()
{
  return _CNContactsUIBundle();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return _CTSIMSupportGetSIMStatus();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return _CTTelephonyCenterAddObserver();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

uint64_t CTTelephonyCenterRemoveEveryObserver()
{
  return _CTTelephonyCenterRemoveEveryObserver();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return _CTTelephonyCenterRemoveObserver();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PSIsNanoMirroringDomain()
{
  return _PSIsNanoMirroringDomain();
}

uint64_t SpecifiersFromPlist()
{
  return _SpecifiersFromPlist();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CNUILog()
{
  return __CNUILog();
}

uint64_t _CTServerConnectionCopyPhoneBookEntry()
{
  return __CTServerConnectionCopyPhoneBookEntry();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionFetchPhonebook()
{
  return __CTServerConnectionFetchPhonebook();
}

uint64_t _CTServerConnectionGetPhonebookEntryCount()
{
  return __CTServerConnectionGetPhonebookEntryCount();
}

uint64_t _CTServerConnectionSelectPhonebook()
{
  return __CTServerConnectionSelectPhonebook();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__beginImportToStoreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginImportToStoreID:");
}

id objc_msgSend__cn_each_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cn_each:");
}

id objc_msgSend__cn_safeSortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cn_safeSortedArrayUsingComparator:");
}

id objc_msgSend__ctServerConnection(void *a1, const char *a2, ...)
{
  return _[a1 _ctServerConnection];
}

id objc_msgSend__dismissMeCardPickerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissMeCardPickerAnimated:");
}

id objc_msgSend__erroredDuringSIMPhonebookFetch(void *a1, const char *a2, ...)
{
  return _[a1 _erroredDuringSIMPhonebookFetch];
}

id objc_msgSend__importAlreadyInProgress(void *a1, const char *a2, ...)
{
  return _[a1 _importAlreadyInProgress];
}

id objc_msgSend__ios_meContactWithKeysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ios_meContactWithKeysToFetch:error:");
}

id objc_msgSend__noteImportEnded(void *a1, const char *a2, ...)
{
  return _[a1 _noteImportEnded];
}

id objc_msgSend__noteImportStarted(void *a1, const char *a2, ...)
{
  return _[a1 _noteImportStarted];
}

id objc_msgSend__phonebookAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _phonebookAvailable];
}

id objc_msgSend__phonebookSelected(void *a1, const char *a2, ...)
{
  return _[a1 _phonebookSelected];
}

id objc_msgSend__reloadMeCardCellIfVisible(void *a1, const char *a2, ...)
{
  return _[a1 _reloadMeCardCellIfVisible];
}

id objc_msgSend__setDefaultContacts_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDefaultContacts:specifier:");
}

id objc_msgSend__simPhonebookEntryAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_simPhonebookEntryAtIndex:");
}

id objc_msgSend__stopListeningForSIMPhonebookNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopListeningForSIMPhonebookNotifications];
}

id objc_msgSend__updateABStoresAndNames(void *a1, const char *a2, ...)
{
  return _[a1 _updateABStoresAndNames];
}

id objc_msgSend__updateSIMImportSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSIMImportSpecifier:");
}

id objc_msgSend__updateSIMImportVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateSIMImportVisibility];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return _[a1 accountDescription];
}

id objc_msgSend_accountTypeDescription(void *a1, const char *a2, ...)
{
  return _[a1 accountTypeDescription];
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addContact_toContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContact:toContainerWithIdentifier:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTask:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allDomainsCountWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allDomainsCountWithError:");
}

id objc_msgSend_allDomainsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allDomainsWithError:");
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_containersMatchingPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containersMatchingPredicate:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 currentEnvironment];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_disableDomain_bundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableDomain:bundleIdentifier:error:");
}

id objc_msgSend_dismissPopoverAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissPopoverAnimated:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayAccount(void *a1, const char *a2, ...)
{
  return _[a1 displayAccount];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayTypeForAccountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayTypeForAccountWithIdentifier:");
}

id objc_msgSend_domainIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 domainIdentifier];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enableDomain_bundleIdentifier_shouldSynchronize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableDomain:bundleIdentifier:shouldSynchronize:error:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_executeSaveRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSaveRequest:error:");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_importPhonebookEntry_intoContactStore_container_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importPhonebookEntry:intoContactStore:container:");
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifier:");
}

id objc_msgSend_indexPathForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForIndex:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactStore:");
}

id objc_msgSend_initWithContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentViewController:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isContact_presentInContainer_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContact:presentInContainer:store:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFeatureEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFeatureEnabled:");
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingToParentViewController];
}

id objc_msgSend_isNicknameSharingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isNicknameSharingEnabled];
}

id objc_msgSend_isPopoverVisible(void *a1, const char *a2, ...)
{
  return _[a1 isPopoverVisible];
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueWithLabel:value:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTitleForLocalSourceOfDataclass_usedAtBeginningOfSentence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleForLocalSourceOfDataclass:usedAtBeginningOfSentence:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nameComponentsFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameComponentsFromString:");
}

id objc_msgSend_nicknameProvider(void *a1, const char *a2, ...)
{
  return _[a1 nicknameProvider];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_overrideComponentsInContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideComponentsInContact:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_personNameComponentsFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personNameComponentsFromString:");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_predicateForContactsMatchingName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingName:");
}

id objc_msgSend_predicateForContactsMatchingPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:");
}

id objc_msgSend_predicateForContainerOfContactWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContainerOfContactWithIdentifier:");
}

id objc_msgSend_predicateForiOSLegacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForiOSLegacyIdentifier:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_prepareName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareName:");
}

id objc_msgSend_presentPopoverFromRect_inView_permittedArrowDirections_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPopoverFromRect:inView:permittedArrowDirections:animated:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_provideSettingsNavigationDonation(void *a1, const char *a2, ...)
{
  return _[a1 provideSettingsNavigationDonation];
}

id objc_msgSend_providerCount(void *a1, const char *a2, ...)
{
  return _[a1 providerCount];
}

id objc_msgSend_ps_insertObject_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObject:afterObject:");
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _[a1 rootController];
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_setAppPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPolicy:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHidesSearchableSources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSearchableSources:");
}

id objc_msgSend_setMeContact_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMeContact:error:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNameString_onContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameString:onContact:");
}

id objc_msgSend_setOnboardingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnboardingController:");
}

id objc_msgSend_setOnlyRealContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnlyRealContacts:");
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumbers:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setProviderCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderCount:");
}

id objc_msgSend_setShortNameFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortNameFormat:");
}

id objc_msgSend_setShouldDisplayAddNewContactRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDisplayAddNewContactRow:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedNameAndPhotoSharingFooterText(void *a1, const char *a2, ...)
{
  return _[a1 sharedNameAndPhotoSharingFooterText];
}

id objc_msgSend_sharingAudience(void *a1, const char *a2, ...)
{
  return _[a1 sharingAudience];
}

id objc_msgSend_sharingAudienceDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 sharingAudienceDisplayString];
}

id objc_msgSend_shortNameEnabled(void *a1, const char *a2, ...)
{
  return _[a1 shortNameEnabled];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_startOnboardingOrEditForMode_fromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOnboardingOrEditForMode:fromViewController:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:");
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:style:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_taskFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskFinished:");
}

id objc_msgSend_taskIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskIsRunning:");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_updateContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContact:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}