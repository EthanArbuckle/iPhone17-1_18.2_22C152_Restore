id MFPreferredCompositeNameForPerson(const void *a1)
{
  return _MFPreferredCompositeNameForPerson(a1, 0);
}

void sub_1AF949884(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9499D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF949AFC(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF949B30()
{
}

void sub_1AF949BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF949E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF949FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *MFUIContentSizeCategoryMin(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  if (UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedAscending) {
    v5 = v3;
  }
  else {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

void sub_1AF94A064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MFIntegralRectToViewScale(void *a1)
{
  id v1 = a1;
  UIRoundToViewScale();
  double v3 = v2;
  UIRoundToViewScale();

  return v3;
}

void sub_1AF94A100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94A18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _MFPreferredCompositeNameForPerson(const void *a1, CFTypeRef *a2)
{
  v4 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
  if (!v4) {
    v4 = CFRetain(a1);
  }
  if (!ABPersonGetShortNamePreferNicknames()
    || (uint64_t v5 = (uint64_t)ABRecordCopyValue(v4, *MEMORY[0x1E4F49C48])) == 0)
  {
    uint64_t v5 = ABPersonCopyCompositeName();
    if (!v5)
    {
      v6 = 0;
      if (!a2) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  v6 = (void *)v5;
  if (a2) {
LABEL_9:
  }
    *a2 = CFRetain(v4);
LABEL_10:
  CFRelease(v4);

  return v6;
}

void sub_1AF94A254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94A2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94A490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF94A5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94A6CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __bundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v1 = (void *)bundle_bundle;
  bundle_bundle = v0;
}

void sub_1AF94A860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94AA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF94ABC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94AD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94B360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AF94B53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94B5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94B818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94BA90(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF94BC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName_block_invoke(id *a1, const void *a2)
{
  uint64_t v4 = [a1[4] countForObject:a2];
  ABPropertyID v5 = *MEMORY[0x1E4F49D00];
  v6 = [a1[5] namePrefix];
  unsigned int HasPrefix = _personPropertyHasPrefix(a2, v5, v6);

  ABPropertyID v8 = *MEMORY[0x1E4F49B00];
  v9 = [a1[5] givenName];
  unsigned int v10 = _personPropertyHasPrefix(a2, v8, v9);

  ABPropertyID v11 = *MEMORY[0x1E4F49C30];
  v12 = [a1[5] middleName];
  unsigned int v13 = _personPropertyHasPrefix(a2, v11, v12);

  ABPropertyID v14 = *MEMORY[0x1E4F49BF8];
  v15 = [a1[5] familyName];
  unsigned int v16 = _personPropertyHasPrefix(a2, v14, v15);

  ABPropertyID v17 = *MEMORY[0x1E4F49DA8];
  v18 = [a1[5] nameSuffix];
  unsigned int v19 = _personPropertyHasPrefix(a2, v17, v18);

  return v4
       + HasPrefix
       + v10
       + v13
       + v16
       + v19
       + _personPropertyHasPrefix(a2, *MEMORY[0x1E4F49C60], a1[6]);
}

void sub_1AF94BE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _personPropertyHasPrefix(const void *a1, ABPropertyID a2, void *a3)
{
  id v5 = a3;
  if ([v5 length])
  {
    v6 = (void *)ABRecordCopyValue(a1, a2);
    uint64_t v7 = [v6 hasPrefix:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1AF94BEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFPreferredCompositeNameForAddressAndDisplayName(const void *a1, void *a2, void *a3, CFTypeRef *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = _idealDisplayName(v7, v8);

  if (!a1) {
    goto LABEL_9;
  }
  if (![v7 length]) {
    goto LABEL_9;
  }
  unsigned int v10 = [v7 emailAddressValue];

  if (!v10) {
    goto LABEL_9;
  }
  v23[0] = v7;
  ABPropertyID v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(a1, v11, *MEMORY[0x1E4F49AC0], v9);

  if (v12)
  {
    uint64_t v13 = _MFPreferredCompositeNameForPerson(v12, a4);
    ABPropertyID v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v9;
    }
    id v16 = v15;

    CFRelease(v12);
  }
  else
  {
LABEL_9:
    id v16 = v9;
  }
  ABPropertyID v17 = v7;
  if (v16
    && (v18 = [v16 containsString:@"@"], ABPropertyID v17 = v16, v18)
    && (v19 = [v16 isEqualToString:v7], ABPropertyID v17 = v16, (v19 & 1) == 0))
  {
    id v20 = [NSString stringWithFormat:@"%@ <%@>", v16, v7];
  }
  else
  {
    id v20 = v17;
  }
  v21 = v20;

  return v21;
}

void sub_1AF94C0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFPreferredAbbreviatedNameForAddressAndDisplayName(const void *a1, void *a2, void *a3, CFTypeRef *a4)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = _idealDisplayName(v7, v8);

  if (a1)
  {
    if ([v7 length])
    {
      unsigned int v10 = [v7 emailAddressValue];

      if (v10)
      {
        v30[0] = v7;
        ABPropertyID v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
        v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(a1, v11, *MEMORY[0x1E4F49AC0], v9);

        if (v12) {
          goto LABEL_9;
        }
        uint64_t v13 = objc_msgSend(v9, "ec_personNameComponents");
        ABPropertyID v14 = [v13 givenName];
        if (v14)
        {
        }
        else
        {
          v15 = [v13 familyName];
          BOOL v16 = v15 == 0;

          if (v16)
          {

            goto LABEL_17;
          }
        }
        v12 = ABPersonCreate();
        ABPropertyID v17 = [v13 namePrefix];
        ABRecordSetValue(v12, *MEMORY[0x1E4F49D00], v17, 0);

        int v18 = [v13 givenName];
        ABRecordSetValue(v12, *MEMORY[0x1E4F49B00], v18, 0);

        char v19 = [v13 middleName];
        ABRecordSetValue(v12, *MEMORY[0x1E4F49C30], v19, 0);

        id v20 = [v13 familyName];
        ABRecordSetValue(v12, *MEMORY[0x1E4F49BF8], v20, 0);

        v21 = [v13 nameSuffix];
        ABRecordSetValue(v12, *MEMORY[0x1E4F49DA8], v21, 0);

        if (v12)
        {
LABEL_9:
          v22 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
          if (!v22) {
            v22 = CFRetain(v12);
          }
          uint64_t v23 = ABPersonCopyShortName();
          if (v23 || (uint64_t v23 = ABPersonCopyCompositeName()) != 0)
          {

            v9 = (void *)v23;
          }
          if (a4) {
            *a4 = CFRetain(v22);
          }
          CFRelease(v12);
          CFRelease(v22);
        }
      }
    }
  }
LABEL_17:
  v24 = v7;
  if (v9
    && (int v25 = [v9 containsString:@"@"], v24 = v9, v25)
    && (char v26 = [v9 isEqualToString:v7], v24 = v9, (v26 & 1) == 0))
  {
    id v27 = [NSString stringWithFormat:@"%@ <%@>", v9, v7];
  }
  else
  {
    id v27 = v24;
  }
  v28 = v27;

  return v28;
}

void sub_1AF94C430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _idealDisplayName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 length];
    if (v6 >= 3 && [v5 characterAtIndex:0] == 60)
    {
      int v7 = [v5 characterAtIndex:v6 - 1];
      BOOL v8 = v7 == 62;
      if (v7 == 62) {
        v6 -= 2;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    if (!objc_msgSend(v5, "compare:options:range:", v3, 9, v8, v6))
    {

      id v5 = 0;
    }
  }

  return v5;
}

void sub_1AF94C57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(const void *a1, void *a2, int a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  id v23 = a4;
  if (!a1)
  {
    uint64_t v17 = 0;
    goto LABEL_27;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obCFIndex j = v24;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)v34;
  int v10 = *MEMORY[0x1E4F49AC0];
  int v25 = *MEMORY[0x1E4F49CC8];
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(obj);
      }
      if (v10 == a3)
      {
        CFTypeRef v31 = 0;
        CFTypeRef cf = 0;
        CFArrayRef v12 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingEmailAddress();
        if (!v12) {
          continue;
        }
      }
      else
      {
        if (v25 != a3) {
          continue;
        }
        CFArrayRef v12 = (const __CFArray *)ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint();
        if (!v12) {
          continue;
        }
      }
      CFIndex Count = CFArrayGetCount(v12);
      if (Count >= 1)
      {
        for (CFIndex j = 0; j != Count; ++j)
        {
          ABRecordID ValueAtIndex = CFArrayGetValueAtIndex(v12, j);
          ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a1, ValueAtIndex);
          if (PersonWithRecordID) {
            [v7 addObject:PersonWithRecordID];
          }
        }
      }
      CFRelease(v12);
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v8);
LABEL_20:

  if ([v7 count] == 1)
  {
    uint64_t v17 = [v7 anyObject];
  }
  else if ([v7 count])
  {
    int v18 = objc_msgSend(v23, "ec_personNameComponents");
    char v19 = objc_alloc_init(_MFCountableMatchesContext);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName_block_invoke;
    v27[3] = &unk_1E5F790B0;
    id v28 = v7;
    id v20 = v18;
    id v29 = v20;
    id v30 = v23;
    [(_MFCountableMatchesContext *)v19 countInstances:v28 usingPredicate:v27];
    v21 = [(_MFCountableMatchesContext *)v19 highestMatches];
    uint64_t v17 = [v21 anyObject];
  }
  else
  {
    uint64_t v17 = 0;
  }

LABEL_27:
  return v17;
}

void sub_1AF94C8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF94CA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94CA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_MFCountableMatchesContext;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF94CB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __MFInitializeAddressBookConstants_block_invoke()
{
  ABRecordRef v0 = ABPersonCreate();

  CFRelease(v0);
}

void MFInitializeAddressBookConstants()
{
  if (MFInitializeAddressBookConstants_onceToken != -1) {
    dispatch_once(&MFInitializeAddressBookConstants_onceToken, &__block_literal_global);
  }
}

void sub_1AF94CC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94CE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AF94CEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94CFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94D848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeActivityHandoffOperation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF94DC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94DCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94DF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94E9A8(_Unwind_Exception *exception_object)
{
}

void sub_1AF94EB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94EB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94EC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94EE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1AF94F39C(_Unwind_Exception *a1)
{
  uint64_t v8 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF94F4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94F54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94F61C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94F7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)MFAddressBookManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t _AddressBookEventHandler(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleAddressBookChangeNotification];
}

uint64_t _addressBookPreferencesChanged(uint64_t a1, void *a2)
{
  return [a2 _handleAddressBookPrefsChangeNotification];
}

void sub_1AF94F984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FE0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF94FE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF950070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9502D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95051C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9507C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1AF950AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF950CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF950EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF950FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9511A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF951308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF951408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9514CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9515B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF951AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF951D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF951DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFAlertOverlayController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF951F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95207C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9520F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF952174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF952320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9524BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF952680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF952868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF952C44(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF952D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)MFAtomTextView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF952F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF953098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF953178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9532C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF95334C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9534C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9535A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9537C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95393C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9539AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF953BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1AF953D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF953EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF954100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9541D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95455C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF95490C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9549BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF954E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF954FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF955200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF955650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF95583C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF955AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF955C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF956010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9560DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9561F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95626C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF956444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95659C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9566B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF956758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF956A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF956CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF957358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1AF957600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9577A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9578A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9579F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF957AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF957C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF957E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF957F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF958008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF958304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1AF95858C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF958720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95892C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF958BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1AF958D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF958EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9593E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF959600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9596D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95977C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9598C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF959CFC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF959DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF959E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF959EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF959FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95A09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95A140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CFArrayRef v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF95A218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95A480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1AF95A5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95A8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AC60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95ACF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95ADDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95AEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95B11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CFArrayRef v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1AF95B3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95B4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95B570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95B6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95B7CC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF95B884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _MFShowAttachmentMarkup(uint64_t a1)
{
  objc_msgSend(NSString, "stringWithFormat:", @"<div style=\"border:1px solid black;\">%@<div style=\"background:yellow;\"><xmp>%@</xmp></div></div>",
    a1,
  id v1 = a1);

  return v1;
}

uint64_t MFContentTypeIsPlainText(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a1];
  if ([v1 conformsToType:*MEMORY[0x1E4F444F0]]) {
    uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F443F0]] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1AF95B960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF95BFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95C9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95CF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95D070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95D828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95DFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95E898(_Unwind_Exception *a1)
{
  uint64_t v8 = v7;

  _Unwind_Resume(a1);
}

void sub_1AF95EC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFWebKitMainThread;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF95F72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95F858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id initQLTypeCopyUTIForURLAndMimeType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (LoadQuickLook_loadPredicate != -1) {
    dispatch_once(&LoadQuickLook_loadPredicate, &__block_literal_global_347);
  }
  softLinkQLTypeCopyUTIForURLAndMimeType = (uint64_t (*)())dlsym((void *)LoadQuickLook_frameworkLibrary, "QLTypeCopyUTIForURLAndMimeType");
  uint64_t v5 = ((void (*)(id, id))softLinkQLTypeCopyUTIForURLAndMimeType)(v3, v4);

  return v5;
}

void sub_1AF95F954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __LoadQuickLook_block_invoke()
{
  LoadQuickLook_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  if (!LoadQuickLook_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

uint64_t initQLPreviewControllerSupportsContentType(void *a1)
{
  id v1 = a1;
  if (LoadQuickLook_loadPredicate != -1) {
    dispatch_once(&LoadQuickLook_loadPredicate, &__block_literal_global_347);
  }
  softLinkQLPreviewControllerSupportsContentType = (uint64_t (*)())dlsym((void *)LoadQuickLook_frameworkLibrary, "QLPreviewControllerSupportsContentType");
  uint64_t v2 = ((uint64_t (*)(id))softLinkQLPreviewControllerSupportsContentType)(v1);

  return v2;
}

void sub_1AF95FA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _DataConsumerPutBytesCallback(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  uint64_t v7 = [v5 appendData:v6];
  uint64_t v8 = v7 & ~(v7 >> 63);

  return v8;
}

void sub_1AF95FAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initPKPass()
{
  if (LoadPassKit_loadPredicate != -1) {
    dispatch_once(&LoadPassKit_loadPredicate, &__block_literal_global_358);
  }
  Class result = objc_getClass("PKPass");
  classPKPass = (uint64_t)result;
  getPKPassClass = (uint64_t (*)())PKPassFunction;
  return result;
}

id PKPassFunction()
{
  return (id)classPKPass;
}

void __LoadPassKit_block_invoke()
{
  LoadPassKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  if (!LoadPassKit_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_0.isa);
  }
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1AF95FC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF95FDA0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF960000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9603B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9604B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF960540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9605DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96068C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9607E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initPKPassView()
{
  if (LoadPassKitUI_loadPredicate != -1) {
    dispatch_once(&LoadPassKitUI_loadPredicate, &__block_literal_global_4);
  }
  Class result = objc_getClass("PKPassView");
  classPKPassView = (uint64_t)result;
  getPKPassViewClass = (uint64_t (*)())PKPassViewFunction;
  return result;
}

id PKPassViewFunction()
{
  return (id)classPKPassView;
}

void __LoadPassKitUI_block_invoke()
{
  LoadPassKitUI_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 2);
  if (!LoadPassKitUI_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_1.isa);
  }
}

void sub_1AF960A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF960B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(a1);
}

void sub_1AF960BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(a1);
}

void sub_1AF960C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF960D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF960E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9610F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9611E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF961344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF961460(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF961584(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF961678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9617CC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF961838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF961A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF961B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF961BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF961C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF961D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF961E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF962034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96212C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)MFAutocompleteResultsTableViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF96221C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF962330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9625FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF962958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF962B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1AF962BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF962CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF962E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF962EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF962F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF963100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9631CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9632B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF963330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF963470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);

  _Unwind_Resume(a1);
}

void sub_1AF963538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9635D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9636C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF963838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF963920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9639A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF963CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF963DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF963E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF963EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF964074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96418C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96422C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9644A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF964564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9647A4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF964860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9648EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF964A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF964CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF964D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF964E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF964F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF964FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF965048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9650D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF965158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9651E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9655DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 32; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AF965698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF965F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF966058(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF966220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9664E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF9666E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9667AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9668C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF966910()
{
}

void sub_1AF966B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF966EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF966FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF967220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9672C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF967428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFFloatToCSSPixelString(double a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", *(void *)&a1);
}

id MFCSSLinkColor()
{
  ABRecordRef v0 = [MEMORY[0x1E4FB1618] systemBlueColor];
  id v1 = MFCSSColorFromUIColor(v0);

  return v1;
}

void sub_1AF96757C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFCSSColorFromUIColor(void *a1)
{
  id v1 = a1;
  double v6 = NAN;
  double v7 = NAN;
  uint64_t v4 = -1;
  double v5 = NAN;
  [v1 getRed:&v7 green:&v6 blue:&v5 alpha:&v4];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"rgba(%d,%d,%d,%f)", (int)(v7 * 255.0), (int)(v6 * 255.0), (int)(v5 * 255.0), v4);

  return v2;
}

void sub_1AF967648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFUserStyleSheetDictionary(uint64_t a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v53 = [MEMORY[0x1E4F1CA60] dictionary];
  v52 = [MEMORY[0x1E4F1CA60] dictionary];
  id v1 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelOne];
  uint64_t v2 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelTwo];
  id v3 = [MEMORY[0x1E4FB1618] mailQuoteColorLevelThree];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    v66 = __QuotingColorList_block_invoke;
    v67 = &unk_1E5F79770;
    id v68 = v1;
    id v69 = v2;
    id v70 = v3;
    if (QuotingColorList_onceToken != -1) {
      dispatch_once(&QuotingColorList_onceToken, &block);
    }
    uint64_t v4 = &QuotingColorList_darkerQuotingColorCSS;
  }
  else
  {
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    v66 = __QuotingColorList_block_invoke_2;
    v67 = &unk_1E5F79770;
    id v68 = v1;
    id v69 = v2;
    id v70 = v3;
    if (QuotingColorList_onceToken_553 != -1) {
      dispatch_once(&QuotingColorList_onceToken_553, &block);
    }
    uint64_t v4 = &QuotingColorList_defaultQuotingColorCSS;
  }
  id v56 = (id)*v4;

  uint64_t v54 = [v56 count];
  v58 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v54)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 1;
    do
    {
      v55 = [MEMORY[0x1E4F28E78] string];
      uint64_t v7 = v6;
      do
      {
        [v55 appendString:@"BLOCKQUOTE "];
        --v7;
      }
      while (v7);
      [v58 setObject:&unk_1F08414B8 forKeyedSubscript:v55];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v8 = [&unk_1F08419E0 countByEnumeratingWithState:&v60 objects:v87 count:16];
      if (v8)
      {
        uint64_t v57 = *(void *)v61;
        do
        {
          uint64_t v59 = v8;
          for (uint64_t i = 0; i != v59; ++i)
          {
            if (*(void *)v61 != v57) {
              objc_enumerationMutation(&unk_1F08419E0);
            }
            uint64_t v10 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            ABPropertyID v11 = [MEMORY[0x1E4F28E78] string];
            unint64_t v12 = 0;
            do
            {
              if (v12 >= v5) {
                [v11 appendFormat:@"BLOCKQUOTE[%@] ", v10];
              }
              else {
                [v11 appendString:@"BLOCKQUOTE "];
              }
              ++v12;
            }
            while (v6 != v12);
            uint64_t v13 = [v56 objectAtIndex:v5];
            ABPropertyID v14 = [NSString stringWithFormat:@"1.0px solid %@ !important", v13];
            v15 = [NSString stringWithFormat:@"%@ !important", v13];
            v85[0] = @"color";
            v85[1] = @"border-left";
            v86[0] = v15;
            v86[1] = v14;
            BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
            [v58 setObject:v16 forKeyedSubscript:v11];
          }
          uint64_t v8 = [&unk_1F08419E0 countByEnumeratingWithState:&v60 objects:v87 count:16];
        }
        while (v8);
      }

      ++v5;
      ++v6;
    }
    while (v5 != v54);
  }
  [v53 addEntriesFromDictionary:v58];
  [v52 addEntriesFromDictionary:&unk_1F0841620];
  [v53 setObject:&unk_1F0841648 forKeyedSubscript:@"HTML"];
  [v53 setObject:&unk_1F0841670 forKeyedSubscript:@"._AppleShowQuotedContentButton"];
  [v53 setObject:&unk_1F0841698 forKeyedSubscript:@"._AppleShowQuotedContentButton .button"];
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  int v18 = [MEMORY[0x1E4F1CA60] dictionary];
  char v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  switch(a1)
  {
    case 0:
    case 4:
      v83 = @"color-scheme";
      v84 = @"light dark";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      [v53 setObject:v20 forKeyedSubscript:@":root:not(.testing-dark-mode)"];

      v81 = @"background-color";
      v82 = @"-apple-system-secondary-grouped-background";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      [v53 setObject:v21 forKeyedSubscript:@":root"];

      [v19 _bodyLeading];
      double v23 = v22;
      [v19 lineHeight];
      double v25 = v24;
      [v19 leading];
      v80[0] = @"0";
      v79[0] = @"margin";
      v79[1] = @"padding-top";
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", round(-(v25 - v26 - v23 * 1.45454545)));
      v80[1] = v27;
      v79[2] = @"padding-left";
      id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", 0x4030000000000000);
      v80[2] = v28;
      v79[3] = @"padding-right";
      id v29 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", 0x4030000000000000);
      v80[3] = v29;
      v79[4] = @"padding-bottom";
      id v30 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", 0x4035000000000000);
      v80[4] = v30;
      CFTypeRef v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:5];

      [v17 addEntriesFromDictionary:v31];
      uint64_t v32 = *MEMORY[0x1E4F5FD48];
      long long v33 = [NSString stringWithFormat:@".%@", *MEMORY[0x1E4F5FD48]];
      [v53 setObject:&unk_1F08416E8 forKeyedSubscript:v33];
      long long v34 = [NSString stringWithFormat:@"BLOCKQUOTE .%@", v32];
      [v53 setObject:&unk_1F0841710 forKeyedSubscript:v34];
      [v53 setObject:&unk_1F0841738 forKeyedSubscript:@".x-apple-edge-to-edge"];
      [v53 setObject:&unk_1F0841760 forKeyedSubscript:@".x-apple-edge-to-edge + .x-apple-edge-to-edge"];
      [v53 setObject:&unk_1F0841788 forKeyedSubscript:@".x-apple-wide-margin-edge-to-edge"];
      [v53 setObject:&unk_1F08417B0 forKeyedSubscript:@".x-apple-wide-margin-edge-to-edge + .x-apple-wide-margin-edge-to-edge"];
      [v18 setObject:@"3px" forKeyedSubscript:@"margin"];
      [v18 setObject:@"inline-block" forKeyedSubscript:@"display"];
      long long v35 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      [v53 setObject:v35 forKeyedSubscript:@"*"];
      [v35 setObject:@"initial !important" forKeyedSubscript:@"-webkit-user-modify"];
      long long v36 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
      LODWORD(v30) = UIContentSizeCategoryIsAccessibilityCategory(v36);

      if (v30) {
        [v35 setObject:@"initial !important" forKeyedSubscript:@"-webkit-text-size-adjust"];
      }

      goto LABEL_39;
    case 1:
    case 2:
      if (a1 == 2)
      {
        v77 = @"color-scheme";
        v78 = @"light dark";
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [v53 setObject:v37 forKeyedSubscript:@":root:not(.testing-dark-mode)"];

        v75 = @"background-color";
        v76 = @"-apple-system-secondary-grouped-background";
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        [v53 setObject:v38 forKeyedSubscript:@":root"];
      }
      else
      {
        [v53 setObject:&unk_1F08417D8 forKeyedSubscript:@":root"];
      }
      [v52 addEntriesFromDictionary:&unk_1F0841850];
      double v39 = 0.0;
      double v40 = 0.0;
      double v41 = 0.0;
      if (a1 != 2)
      {
        int v42 = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad", 0.0);
        double v39 = 6.0;
        if (v42)
        {
          double v39 = 10.0;
          double v41 = 20.0;
        }
        else
        {
          double v41 = 16.0;
        }
        double v40 = 5.0;
      }
      v73[0] = @"padding-top";
      v43 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", *(void *)&v39);
      v74[0] = v43;
      v73[1] = @"padding-left";
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", *(void *)&v41);
      v74[1] = v44;
      v73[2] = @"padding-right";
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", *(void *)&v41);
      v74[2] = v45;
      v73[3] = @"padding-bottom";
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fpx", *(void *)&v40);
      v74[3] = v46;
      CFTypeRef v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:4];

      [v17 addEntriesFromDictionary:v31];
      [v17 addEntriesFromDictionary:&unk_1F0841878];
      long long v33 = [NSString stringWithFormat:@"IMG.%@, img:-apple-has-attachment", 0x1F0817B60];
      [v53 setObject:&unk_1F08418A0 forKeyedSubscript:v33];
      long long v34 = [NSString stringWithFormat:@".%@", @"x-apple-drop-placeholder"];
      [v53 setObject:&unk_1F08418C8 forKeyedSubscript:v34];
LABEL_39:

      break;
    case 3:
      [v53 setObject:&unk_1F08416C0 forKeyedSubscript:@"*"];
      [v17 setObject:@"8px 0 0 0" forKeyedSubscript:@"padding"];
      [v17 setObject:@"0" forKeyedSubscript:@"margin"];
      break;
    default:
      break;
  }
  [v53 setObject:v52 forKeyedSubscript:@"@media (prefers-color-scheme: dark)"];
  [v17 setObject:@"break-word" forKeyedSubscript:@"word-wrap"];
  [v17 setObject:@"break-word" forKeyedSubscript:@"word-break"];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad")) {
    v47 = @"-apple-system-tall-body";
  }
  else {
    v47 = @"-apple-system-body";
  }
  [v17 setObject:v47 forKeyedSubscript:@"font"];
  [v53 setObject:v17 forKeyedSubscript:@"BODY"];
  [v53 setObject:v18 forKeyedSubscript:@"ATTACHMENT"];
  v71[0] = @"color";
  v48 = MFCSSLinkColor();
  v71[1] = @"word-break";
  v72[0] = v48;
  v72[1] = @"break-word";
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
  [v53 setObject:v49 forKeyedSubscript:@"A"];

  if (a1 != 1)
  {
    [v53 setObject:&unk_1F08418F0 forKeyedSubscript:@":root.apple-mail-light-only:not(.testing-dark-mode)"];
    [v53 setObject:&unk_1F0841918 forKeyedSubscript:@":root.apple-mail-implicit-dark-support:not(.testing-dark-mode)"];
    [v53 setObject:&unk_1F0841940, @"HTML, BODY" forKeyedSubscript];
  }
  [v53 setObject:&unk_1F0841968 forKeyedSubscript:@"TABLE"];
  [v53 setObject:&unk_1F0841990 forKeyedSubscript:@"PRE"];

  return v53;
}

void sub_1AF96837C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

id MFUserStyleSheetCSS(uint64_t a1)
{
  id v1 = MFUserStyleSheetDictionary(a1);
  uint64_t v2 = MFCSSStringFromDictionary(v1);

  return v2;
}

void sub_1AF968620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFCSSStringFromDictionary(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __MFCSSStringFromDictionary_block_invoke;
  v5[3] = &unk_1E5F79748;
  id v3 = v2;
  id v6 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

void sub_1AF9686EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __MFCSSStringFromDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    uint64_t v7 = MFCSSStringFromDictionary(v5);
    id v6 = [NSString stringWithFormat:@"%@ { %@ }", v8, v7];

    if (!v6) {
      goto LABEL_8;
    }
LABEL_6:
    [*(id *)(a1 + 32) appendFormat:@"%@\n", v6];
    goto LABEL_8;
  }
  id v6 = [NSString stringWithFormat:@"%@: %@; ", v8, v5];
  if (v6) {
    goto LABEL_6;
  }
LABEL_8:
}

void sub_1AF968840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void __QuotingColorList_block_invoke(void **a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = RGBColorCSSStringFromUIColor(a1[4]);
  v7[0] = v2;
  id v3 = RGBColorCSSStringFromUIColor(a1[5]);
  v7[1] = v3;
  uint64_t v4 = RGBColorCSSStringFromUIColor(a1[6]);
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  id v6 = (void *)QuotingColorList_darkerQuotingColorCSS;
  QuotingColorList_darkerQuotingColorCSS = v5;
}

void sub_1AF96893C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

id RGBColorCSSStringFromUIColor(void *a1)
{
  id v1 = a1;
  Components = CGColorGetComponents((CGColorRef)[v1 CGColor]);
  id v3 = "T@\"NSString\",N,R";
  LODWORD(v3) = llround(*Components * 255.0);
  LODWORD(v4) = llround(Components[1] * 255.0);
  LODWORD(v5) = llround(Components[2] * 255.0);
  LODWORD(v6) = llround(Components[3] * 255.0);
  uint64_t v7 = [NSString stringWithFormat:@"rgba(%hhu, %hhu, %hhu, %hhu)", v3, v4, v5, v6];

  return v7;
}

void sub_1AF968A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __QuotingColorList_block_invoke_2(void **a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = RGBColorCSSStringFromUIColor(a1[4]);
  v7[0] = v2;
  id v3 = RGBColorCSSStringFromUIColor(a1[5]);
  v7[1] = v3;
  uint64_t v4 = RGBColorCSSStringFromUIColor(a1[6]);
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v6 = (void *)QuotingColorList_defaultQuotingColorCSS;
  QuotingColorList_defaultQuotingColorCSS = v5;
}

void sub_1AF968AF4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF968E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF968FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF969040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9690B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF969220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF969378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF969434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96951C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9699E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1AF969D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF969DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF969E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A3BC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF96A4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96A920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96AB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96AD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96AF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B144(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF96B3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96BA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96BAF0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF96BBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96BC98(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF96BD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96BDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96BF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C04C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF96C0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96C96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96CA84(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF96CB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96CBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96CC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96CE6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96D9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96DB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96DBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96DD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96DE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96E040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96E1CC(_Unwind_Exception *a1)
{
  if (v2) {

  }
  _Unwind_Resume(a1);
}

void sub_1AF96E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF96E6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96E7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96EB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF96ECC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96ED50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96EE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96EE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96EF98(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF96F044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96F9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96FB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96FCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96FE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF96FF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF970020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF970108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9701A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97022C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9705CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF970728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF970878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF970960(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF970A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

id _ef_log_MFComposePhotoPickerController()
{
  if (_ef_log_MFComposePhotoPickerController_onceToken != -1) {
    dispatch_once(&_ef_log_MFComposePhotoPickerController_onceToken, &__block_literal_global_9);
  }
  ABRecordRef v0 = (void *)_ef_log_MFComposePhotoPickerController_log;

  return v0;
}

void sub_1AF970D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF970FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AF9712CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF9713EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF971584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9717B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF971948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  double v24 = v23;

  _Unwind_Resume(a1);
}

void sub_1AF971A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  int v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1AF971B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF971D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97204C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1AF97223C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF972548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  double v24 = v23;

  _Unwind_Resume(a1);
}

void sub_1AF9726D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getPHPickerConfigurationClass_block_invoke(uint64_t a1)
{
  PhotosUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPickerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHPickerConfigurationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MFComposePhotoPickerController.m", 24, @"Unable to find class %s", "PHPickerConfiguration");

    __break(1u);
  }
}

void sub_1AF9728B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PhotosUILibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PhotosUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5F79A30;
    uint64_t v5 = 0;
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *PhotosUILibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"MFComposePhotoPickerController.m", 21, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  ABRecordRef v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1AF972A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __PhotosUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUILibraryCore_frameworkLibrary = result;
  return result;
}

void __getPHPickerViewControllerClass_block_invoke(uint64_t a1)
{
  PhotosUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPickerViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPickerViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getPHPickerViewControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MFComposePhotoPickerController.m", 23, @"Unable to find class %s", "PHPickerViewController");

    __break(1u);
  }
}

void sub_1AF972B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1AF972D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF972E70(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9730EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9731DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF973268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9735FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF973804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF973B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF973DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF973FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97418C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9742CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9744D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9746CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97487C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t _fastCountOfCompleteMatches(void *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a2;
  double v26 = v4;
  id v29 = v5;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    double v24 = [v4 componentsSeparatedByCharactersInSet:v6];

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obCFIndex j = v24;
    uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v32 = v29;
          uint64_t v8 = [v32 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v35;
LABEL_9:
            uint64_t v10 = 0;
            while (1)
            {
              if (*(void *)v35 != v9) {
                objc_enumerationMutation(v32);
              }
              ABPropertyID v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
              if (objc_msgSend(v33, "count", v24) == 1) {
                break;
              }
              unint64_t v12 = [v11 address];
              uint64_t v13 = [v11 displayString];
              ABPropertyID v14 = objc_msgSend(v13, "ea_personNameComponents");
              v15 = [v14 givenName];

              if (v15)
              {
                BOOL v16 = [v14 givenName];
                uint64_t v17 = [v16 rangeOfString:v7 options:1];

                if (!v17) {
                  goto LABEL_19;
                }
              }
              if (([v14 familyName],
                    int v18 = objc_claimAutoreleasedReturnValue(),
                    v18,
                    v18)
                && ([v14 familyName],
                    char v19 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v20 = [v19 rangeOfString:v7 options:1],
                    v19,
                    !v20)
                || v12 && ![v12 rangeOfString:v7 options:1])
              {
LABEL_19:
                [v33 addObject:v11];
              }

              if (v8 == ++v10)
              {
                uint64_t v8 = [v32 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v8) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v30);
    }

    id v21 = v33;
    *a3 = v21;
    uint64_t v22 = [v21 count];
  }
  else
  {
    uint64_t v22 = [v5 count];
  }

  return v22;
}

void sub_1AF974BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF974E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _sortedArrayByRelevancy(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  long long v60 = v5;
  uint64_t v65 = v6;
  if (![v5 length])
  {
    id v46 = v6;
    *a3 = v46;
    *a4 = MEMORY[0x1E4F1CBF0];
    id v47 = v46;
    goto LABEL_55;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)MEMORY[0x1E4F237B8];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = ___sortedArrayByRelevancy_block_invoke;
  v78[3] = &unk_1E5F79AC8;
  id v61 = v7;
  id v79 = v61;
  [v8 enumerateTokensForString:v5 locale:0 options:0 withHandler:v78];
  id v71 = [MEMORY[0x1E4F1CA48] array];
  __base = (char *)malloc_type_calloc(0x18uLL, [v6 count], 0xD6B67E75uLL);
  unint64_t v9 = 0;
LABEL_3:
  if (v9 < [v6 count])
  {
    long long v63 = [v6 objectAtIndex:v9];
    id v68 = [v63 displayString];
    id v69 = [v63 address];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obCFIndex j = v61;
    uint64_t v10 = [obj countByEnumeratingWithState:&v74 objects:v92 count:16];
    unint64_t v64 = v9;
    if (!v10)
    {
      char v73 = 0;
      uint64_t v11 = -1;
      goto LABEL_47;
    }
    char v73 = 0;
    uint64_t v67 = *(void *)v75;
    uint64_t v11 = -1;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v70 = v10;
      do
      {
        if (*(void *)v75 != v67) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v74 + 1) + 8 * v12);
        id v14 = v69;
        id v15 = v13;
        if (!v69)
        {
          int v18 = 0;
LABEL_15:

          uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_16;
        }
        uint64_t v17 = [v14 rangeOfString:v15 options:385];
        int v18 = v17 == 0;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        uint64_t v19 = v16;

        uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17 - v19 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_17;
        }
        uint64_t v72 = v17 - v19 + 15;
        if (v17)
        {
          int v18 = 0;
          v73 |= v17 == 0;
          goto LABEL_17;
        }
        id v14 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
        objc_msgSend(v14, "addAttribute:value:range:", @"MFComposeRecipientStringMatchType", @"MFComposeRecipientStringMatchAddress", 0, v19);
        [v71 addObject:v14];
        int v18 = 1;
        char v73 = 1;
LABEL_16:

LABEL_17:
        id v20 = v68;
        id v21 = v15;
        if ([v21 length])
        {
          uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
          double v23 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v88 = 0;
          v89 = &v88;
          uint64_t v90 = 0x2020000000;
          char v91 = 0;
          v87[0] = 0;
          v87[1] = v87;
          v87[2] = 0x2020000000;
          v87[3] = 0;
          double v24 = (void *)MEMORY[0x1E4F237B8];
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = ___getDisplayNameMatches_block_invoke;
          v80[3] = &unk_1E5F79B08;
          id v81 = v21;
          id v25 = v22;
          id v82 = v25;
          v85 = &v88;
          v86 = v87;
          id v26 = v20;
          id v83 = v26;
          id v27 = v23;
          id v84 = v27;
          [v24 enumerateTokensForString:v26 locale:0 options:0 withHandler:v80];
          int v18 = *((unsigned __int8 *)v89 + 24);
          id v28 = v25;
          id v29 = v84;
          id v30 = v27;

          _Block_object_dispose(v87, 8);
          _Block_object_dispose(&v88, 8);
        }
        else
        {
          id v30 = (id)MEMORY[0x1E4F1CBF0];
          id v28 = (id)MEMORY[0x1E4F1CBF0];
        }

        id v31 = v28;
        [v71 addObjectsFromArray:v30];
        char v73 = (v18 | v73 & 1) != 0;
        unint64_t v32 = [v31 count];
        if (v32
          && ([v31 objectAtIndex:0],
              id v33 = objc_claimAutoreleasedReturnValue(),
              uint64_t v34 = [v33 integerValue],
              v33,
              v34 != 0x7FFFFFFFFFFFFFFFLL))
        {
          uint64_t v35 = v34 + 5;
        }
        else
        {
          uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v32 < 2)
        {
          uint64_t v36 = 0;
        }
        else if (v32 - 2 < 2)
        {
          uint64_t v36 = 10;
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v37 = 3;
          do
          {
            long long v38 = [v31 objectAtIndex:v37 - 2];
            uint64_t v39 = [v38 integerValue];

            v36 += v39;
            ++v37;
          }
          while (v32 != v37);
          if (v36 != 0x7FFFFFFFFFFFFFFFLL) {
            v36 += 10;
          }
        }
        long long v40 = [v31 lastObject];
        uint64_t v41 = [v40 integerValue];

        if (v35 >= v36) {
          uint64_t v42 = v36;
        }
        else {
          uint64_t v42 = v35;
        }
        if (v42 >= v41) {
          uint64_t v42 = v41;
        }
        if (v42 >= v72) {
          uint64_t v43 = v72;
        }
        else {
          uint64_t v43 = v42;
        }

        v11 += v43;
        ++v12;
      }
      while (v12 != v70);
      uint64_t v44 = [obj countByEnumeratingWithState:&v74 objects:v92 count:16];
      uint64_t v10 = v44;
      if (!v44)
      {
LABEL_47:

        v45 = &__base[24 * v64];
        *(void *)v45 = v11;
        *((void *)v45 + 1) = v64;
        v45[16] = v73;

        id v6 = v65;
        unint64_t v9 = v64 + 1;
        goto LABEL_3;
      }
    }
  }
  qsort(__base, [v6 count], 0x18uLL, (int (__cdecl *)(const void *, const void *))_relevancyComparator);
  v48 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v49 = 0;
  v50 = __base + 16;
  while (v49 < [v6 count])
  {
    uint64_t v51 = *((void *)v50 - 1);
    char v52 = *v50;
    id v53 = [v65 objectAtIndex:v51];
    [v47 setObject:v53 atIndexedSubscript:v49];

    if (v52)
    {
      uint64_t v54 = [v65 objectAtIndex:v51];
      [v48 addObject:v54];
    }
    ++v49;
    v50 += 24;
    id v6 = v65;
  }
  free(__base);
  id v55 = v48;
  *a3 = v55;
  id v56 = v71;
  *a4 = v56;

  id v6 = v65;
LABEL_55:

  return v47;
}

void sub_1AF9755D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_1AF975818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97589C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9759F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF975B28(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF975C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF975CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF975E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF975F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF975FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9760B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9763D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9764B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9765F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1AF9766E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF976844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF976968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF976B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF976D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF976E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF976EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9770A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF977210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF977428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97751C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9775E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97778C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97786C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF977C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___sortedArrayByRelevancy_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithString:a2];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_1AF977D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _relevancyComparator(void *a1, void *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  else {
    return v2;
  }
}

void ___getDisplayNameMatches_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v21 = xmmword_1E5F79AE8;
  uint64_t v22 = @"MFComposeRecipientStringMatchLastName";
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = v7;
  id v10 = v8;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v9, "rangeOfString:options:", v10, 385, v21, v22, v23);
    unint64_t v13 = v11;
    unint64_t v14 = v12;
    BOOL v15 = v11 == 0;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v16 = v11 - v12;
    }
  }
  else
  {
    BOOL v15 = 0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  }

  uint64_t v17 = *(void **)(a1 + 40);
  int v18 = [NSNumber numberWithInteger:v16];
  [v17 addObject:v18];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v15;
  if (v15)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && a3 + a4 >= (unint64_t)[*(id *)(a1 + 48) length])
    {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 2;
    }
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
    objc_msgSend(v19, "addAttribute:value:range:", @"MFComposeRecipientStringMatchType", *((void *)&v21 + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)), v13, v14);
    [*(id *)(a1 + 56) addObject:v19];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  for (uint64_t i = 16; i != -8; i -= 8)
}

void sub_1AF977F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 16; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AF978014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97809C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF978110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeRecipientTextView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9782DC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9786D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97892C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF978C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AF978EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF978FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF979068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF979120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9791CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF979278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF979350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9795EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF979850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9799DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF979B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF979BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF979D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF979DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF979E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF979F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF979FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF97A4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF97A890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97A9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97ABCC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF97AC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97ACF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97AE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97B9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97BAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF97BC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97BD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97BDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97BE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97BF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97C08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97C204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97C2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97C5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97C6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CEE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97CFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF97D714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1AF97D7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97DA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97DAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97DC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF97DD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF97DEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97E034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97E14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97E230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97E610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1AF97E9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF97EC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97ECAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97ED70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97EE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97EF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF97F14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF97F41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97F600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97F844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF97F960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF97FC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_1AF97FE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF97FF1C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF97FFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9800DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF980154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9801D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98024C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9802E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF980628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF980688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF980798(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF980884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF980A30(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF980B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF980BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF980CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF980DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF980ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF980FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9810A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF981148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9811D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9812E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF981518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF981734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9817CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9818E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF981C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9821BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  for (uint64_t i = 8; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AF982344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9824AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF982544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9828DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1AF982990()
{
}

void sub_1AF98299C()
{
}

void sub_1AF9829A8()
{
  JUMPOUT(0x1AF982984);
}

void sub_1AF9829B4()
{
}

void sub_1AF982A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF982C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9830B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF983154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFComposeRecipientView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF983214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9832C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF983374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9834A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF983538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF983844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF983B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF983BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF983EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF984014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9840C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF984190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9842A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF984394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF984414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF984498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF984588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF984614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF984684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9847D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9849A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF984CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98500C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9851B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98539C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF985430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98552C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9855D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF985708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9857F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98585C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9858D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98595C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF985E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF985FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9860E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9861E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98625C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98634C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF986470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF986560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF986E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF9870DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF987198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF987250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98739C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9878D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF987B90(_Unwind_Exception *a1)
{
  for (uint64_t i = 8; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AF987CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF987D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF987ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF987F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF987FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF988064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9880E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9883B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9884CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9885BC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9886D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF988830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF988F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98936C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF9896C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF989994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF989E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF989EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98A000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98A210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98A3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98A4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98A628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF98ACF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98AE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98AFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98B94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98BA4C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF98BB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98BBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98BC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98BF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF98C040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98C9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98CA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98CB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98CE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1AF98D054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98D354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98D3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF98DAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98DB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98DBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id cleanupSubjectString(void *a1, BOOL *a2)
{
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];
  BOOL v6 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v3 componentsSeparatedByCharactersInSet:v4];
    uint64_t v8 = [v7 componentsJoinedByString:@" "];

    id v3 = (id)v8;
  }
  if (a2) {
    *a2 = v6;
  }

  return v3;
}

void sub_1AF98DCA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98DD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98DFE0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF98E094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MFComposeSubjectView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF98E2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF98E478()
{
  JUMPOUT(0x1AF98E468);
}

void sub_1AF98E488()
{
}

void sub_1AF98E51C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF98E5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AF98E90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98E9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF98EA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98ECA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98EE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F33C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1AF98F6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98F9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF98FA64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9900AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1AF990344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99047C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF990640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99090C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF990AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF990B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF990C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF990D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99186C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,void *a28,uint64_t a29,void *a30,void *a31,uint64_t a32,uint64_t a33,void *a34,void *a35,uint64_t a36,void *a37,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1AF9921A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AF9923E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF992A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF992EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF992F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF992FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF993114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF993404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9935E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1AF99386C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF993980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF993A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF994234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  _Unwind_Resume(a1);
}

void sub_1AF994458()
{
  JUMPOUT(0x1AF994468);
}

void sub_1AF994520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9945C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF994670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _subjectWithPrefix(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F608F0] subjectWithoutPrefixForSubject:v3];

  if (v5)
  {
    if ([v5 hasPrefix:v4])
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [NSString stringWithFormat:@"%@%@", v4, v5];
    }
    id v9 = v6;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"NO_SUBJECT" value:&stru_1F0817A00 table:@"Main"];
    id v9 = [v4 stringByAppendingString:v8];
  }

  return v9;
}

void sub_1AF9947CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1AF9948FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF994BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF994CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF995170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF99532C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9953A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF995418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9958A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF995AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF995B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF995CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF995DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF995FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99627C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  uint64_t v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1AF996784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF996AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF996BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF996CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF996D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF996FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9970C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9971D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9972B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF997598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1AF9976E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9977E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF997888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF997960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF997B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF997C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF997CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF997FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1AF998108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99863C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1AF998874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF998908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9989B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF998FB8(_Unwind_Exception *a1)
{
  uint64_t v10 = v3;
  objc_destroyWeak(v8);
  objc_destroyWeak(v10);
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak((id *)(v9 - 144));

  _Unwind_Resume(a1);
}

void sub_1AF9990EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF999164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9991D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99924C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9992CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF999350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF999428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9994D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99955C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9995DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF999738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF999878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9998F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF999E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF99A0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99A134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99A1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99A318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99A460(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF99A574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99AC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_1AF99AE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99AEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B51C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF99B604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99B96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AF99BA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99BA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99BB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99BCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99BDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99C04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99C224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99C358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99C5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF99C720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99CA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id plainTextDocumentFromStringsAndQuoteLevels(void *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = objc_alloc_init(MEMORY[0x1E4F77C30]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v11;
  uint64_t v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11);
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count] == 2)
        {
          uint64_t v8 = [v7 objectAtIndexedSubscript:0];
          uint64_t v9 = [v7 objectAtIndexedSubscript:1];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (!a2 || (int)[v9 intValue] <= 0)) {
              objc_msgSend(v12, "appendString:withQuoteLevel:", v8, objc_msgSend(v9, "intValue"));
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v12;
}

void sub_1AF99CC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99CD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99CE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99CFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  id v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1AF99D1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99D298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99D30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99D578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF99D66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99D8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF99DA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99DB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99DC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99E048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1AF99E244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  id v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1AF99E3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  long long v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1AF99E6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1AF99E808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99E9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99EA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99EAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99EC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99ED3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99EE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF99EF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99F9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1AF99FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99FAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99FB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99FBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99FCA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF99FF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A0120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A027C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A031C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A0C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, void *a11, id *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(location);

  objc_destroyWeak(a10);
  objc_destroyWeak(a12);

  objc_destroyWeak((id *)(v36 - 136));
  _Unwind_Resume(a1);
}

void sub_1AF9A0F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A0F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A0FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A102C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A10C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A11E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9A132C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9A14B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A1524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A1638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A1784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A18C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A19CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A1C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A1E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A1F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A2078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A25D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9A292C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9A2B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9A2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A2F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A300C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A30DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A32C0()
{
}

void sub_1AF9A3324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A338C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A35A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A36B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A37F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A395C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A3F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A408C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A42E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A44F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A472C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A47EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A48D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A49E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A4F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A5014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A5188(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9A5230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A52D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A5398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A55F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A5710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A57FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A5F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A60B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A610C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A61A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A6298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A6328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A63FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A6548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A664C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A678C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A68D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A69D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A6A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A6E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A71E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A72C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A732C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AF9A7824(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9A7930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A7C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A7CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A7D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A7EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9A7F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A81C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A8250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A835C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A84E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A85B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A8BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A8DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A8F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A92CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A93D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A97E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9A9DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AA48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFContactsSearchManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9AA724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFArray *_CopySortedArrayWithValues(CFComparisonResult (__cdecl *a1)(const void *, const void *, void *), const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v14 = (const void **)&a9;
  if (a2)
  {
    do
    {
      CFArrayAppendValue(Mutable, a2);
      id v12 = v14++;
      a2 = *v12;
    }
    while (*v12);
  }
  if (a1)
  {
    v15.length = CFArrayGetCount(Mutable);
    v15.location = 0;
    CFArraySortValues(Mutable, v15, a1, 0);
  }
  return Mutable;
}

void sub_1AF9AA850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFContactsSearchResultsModel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9AAB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _filterOutExistingRecipientsFromResults(void *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v24 = a1;
  id v26 = a2;
  if ([v26 count])
  {
    id v25 = (id)[v24 mutableCopy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v24;
    uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v37 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v6, "isGroup", v24))
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v7 = v26;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v8)
            {
              uint64_t v9 = *(void *)v33;
              while (2)
              {
                for (uint64_t j = 0; j != v8; ++j)
                {
                  if (*(void *)v33 != v9) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * j);
                  id v12 = [v6 children];
                  LOBYTE(v11) = [v12 containsObject:v11];

                  if ((v11 & 1) == 0)
                  {

                    [v25 removeObject:v6];
                    goto LABEL_18;
                  }
                }
                uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v41 count:16];
                if (v8) {
                  continue;
                }
                break;
              }
            }

LABEL_18:
            long long v13 = [v6 children];
            uint64_t v14 = [v13 count];
            BOOL v15 = v14 - [v7 count] == 1;

            if (v15)
            {
              long long v16 = [v6 children];
              uint64_t v17 = (void *)[v16 mutableCopy];

              long long v30 = 0u;
              long long v31 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              id v18 = v7;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v29;
                do
                {
                  for (uint64_t k = 0; k != v19; ++k)
                  {
                    if (*(void *)v29 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    [v17 removeObject:*(void *)(*((void *)&v28 + 1) + 8 * k)];
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
                }
                while (v19);
              }

              if ([v17 count] == 1)
              {
                [v25 removeObject:v6];
                uint64_t v22 = [v17 objectAtIndex:0];
                if ([v22 wasCompleteMatch]) {
                  [v25 insertObject:v22 atIndex:0];
                }
              }
            }
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v3);
    }
  }
  else
  {
    id v25 = v24;
  }

  return v25;
}

void sub_1AF9AAEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void addEntriesForRecipientsIfNotInDictionary(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isGroup", (void)v16)) {
          [v12 address];
        }
        else {
        long long v13 = [v12 normalizedAddress];
        }
        if (!v13) {
          __assert_rtn("addEntriesForRecipientsIfNotInDictionary", "MFContactsSearchResultsModel.m", 165, "address != nil");
        }
        uint64_t v14 = [v6 objectForKey:v13];
        BOOL v15 = v14 == 0;

        if (v15) {
          [v7 setObject:v12 forKey:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void sub_1AF9AB124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AB1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AB35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AB458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AB628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AB7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ABA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ABAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ABC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _shouldCancel(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 _isResetting]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v3 isCancelled];
  }

  return v5;
}

void sub_1AF9ABD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ABE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ABFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF9AC7C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF9AC860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AC990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ACAF0(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9ACBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ACCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ACED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD448(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9AD568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AD8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ADDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AE0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AE2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AE464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AE570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AE6DC(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9AF1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *a20,id *location,id *a22,id *a23,id *a24,id *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,void *a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  objc_destroyWeak(a20);
  objc_destroyWeak(location);

  objc_destroyWeak(a22);
  objc_destroyWeak(a23);

  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak((id *)(v79 - 184));

  _Unwind_Resume(a1);
}

void sub_1AF9AF5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9AF6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9AF824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AF9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AFAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF9AFB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AFC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AFD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AFEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9AFFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B01B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B02B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B03A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1AF9B073C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B08E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9B0A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9B0BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B0FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B12A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B13E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B14A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B1784(_Unwind_Exception *a1)
{
  id v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1AF9B191C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B1A98(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9B1BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B1D2C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9B1E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B1FC0(_Unwind_Exception *a1)
{
  uint64_t v10 = v6;

  _Unwind_Resume(a1);
}

void sub_1AF9B274C(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9B28B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B2A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B2C90(_Unwind_Exception *a1)
{
  id v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9B2D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B2E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B2EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B2F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B30FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B31E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B32DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B33FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B35C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9B380C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B38FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B39E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3C58(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9B3ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B3F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)MFEMMessageStore;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9B401C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B42D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B43F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B4814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B4DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B52CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B5454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B55FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B59E4(_Unwind_Exception *a1)
{
  id v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1AF9B5B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B5B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B5EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B620C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B64F0(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9B6538()
{
}

void sub_1AF9B6600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B66C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B67EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B6FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B701C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B7160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B7268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B7460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B74E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFHardwareJPEGScaler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9B7564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B75F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B7924(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9B7DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B80A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B81C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B859C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B860C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B8720(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9B879C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B91A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B958C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _serverSocketConnectCallback(uint64_t a1, uint64_t a2, uint64_t a3, CFSocketNativeHandle *a4, uint64_t a5)
{
  CFSocketNativeHandle v6 = *a4;
  CFWriteStreamRef writeStream = (CFWriteStreamRef)0xAAAAAAAAAAAAAAAALL;
  CFReadStreamRef readStream = (CFReadStreamRef)0xAAAAAAAAAAAAAAAALL;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, &readStream, &writeStream);
  id v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_INFO, "#Hand-Off [LAN] LAN server connection established", v8, 2u);
  }
  (*(void (**)(void))(*(void *)(a5 + 32) + 16))();
  CFRelease(readStream);
  CFRelease(writeStream);
}

void sub_1AF9B9E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B9F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9B9F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_MFMailAccountProxySource;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9BA6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BA93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BAAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _AccountsChanged(uint64_t a1, void *a2)
{
  return [a2 _resetAccountsChanged:1];
}

void sub_1AF9BAB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BABF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BACD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BAEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BB990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BBB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BBC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BBDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BBEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BC6C8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9BC7F8(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9BC928(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9BC9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BCB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BCC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BCE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BCFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD4A0()
{
}

void sub_1AF9BD540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BD9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BDB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BDCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v11 = v10;

  a9.super_class = (Class)MFMailComposeController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9BE518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BE874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BEB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BEBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BEDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BEF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BF0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BF1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1AF9BF3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BF5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BF7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BFA74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BFBB0(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9BFD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BFDCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BFE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9BFF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C0180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C042C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C054C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9C069C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C0734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C0848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C09B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C0AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C152C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v39 - 144));

  _Unwind_Resume(a1);
}

void sub_1AF9C182C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C199C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C1B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C1C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C1F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C29C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C2FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C3340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C3438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C35D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C3760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C3864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C3E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C47D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C4F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C52A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C539C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C549C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C55C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C56B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C586C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5A8C(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9C5B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C5BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C62B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C64AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C6744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C6808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C68E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C6948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C6C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C6D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C71CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C7334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C73C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C74B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C75A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C7750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C7A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C7BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C7E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v16 = v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9C7EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9C81A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C83B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9C8448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9C85AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C862C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C86AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C8FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C904C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C90C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C95E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9AA8()
{
}

void sub_1AF9C9B24(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9C9BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9C9EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CA870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CAB08(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9CACB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CADB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CB9FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CBB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CBD1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CBE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CBF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CC04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CC114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CC1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CC31C(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9CC4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CC5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF9CC6C4(_Unwind_Exception *exception_object)
{
  if (v2) {

  }
  _Unwind_Resume(exception_object);
}

void sub_1AF9CC9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCCF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CCEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CD984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9CDDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CDF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _MFAutosaveLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  uint64_t v10 = MFLogGeneral();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

  if (v11)
  {
    id v12 = (void *)[[NSString alloc] initWithFormat:v9 arguments:&a9];
    long long v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v15 = v12;
      _os_log_impl(&dword_1AF945000, v13, OS_LOG_TYPE_INFO, "** [AutoSave] %@", buf, 0xCu);
    }
  }
}

void sub_1AF9CE290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CE938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CEB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CEBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CEE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Block_object_dispose((const void *)(v25 - 160), 8);
  _Block_object_dispose((const void *)(v25 - 112), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1AF9CF08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CF220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CF3B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CF480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CF5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9CF698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CF714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CFA68(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9CFBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CFCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9CFDA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1AF9CFF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D00C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D0288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D033C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D03F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D09BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D0BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D0D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D0EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D149C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D1FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D22D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D2568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D26C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AF9D27EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D2BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1AF9D390C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9D3E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9D44DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D4B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D50C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D53B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D5720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D5994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D5AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D5ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D60B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D6AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id a62)
{
  _Block_object_dispose(&a57, 8);

  _Unwind_Resume(a1);
}

void sub_1AF9D6EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D6F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D6FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D70F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D7158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AF9D7ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D7BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D7CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D8128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D8950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D8BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D8D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  long long v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1AF9D8ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D8F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D9924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D9C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D9E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9D9FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DA2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9DA43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1AF9DA530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  uint64_t v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1AF9DAECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DB62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DBA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DBC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9DBD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DBE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DBFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DC1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DC3F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1AF9DC730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DC8C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DCA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD5BC(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9DD688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DD9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DDAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DDB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DDF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DDFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE59C(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9DE730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DE9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DECC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DEDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DF89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DFA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DFC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9DFD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E029C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E03E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E06C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E09A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E0F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E12A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E14FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E161C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E17E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E1F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E216C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E243C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E2574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E262C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9E26A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E2734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E2838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E2CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E2EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E30E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E32B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E33F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E347C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E36B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E37C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3EBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3F2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E3FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E40DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E431C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E45C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E46AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E49C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E4BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E50FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E53BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E5D40(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9E6204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E63A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF9E641C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E65D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E687C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E6C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E6DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E6EB0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9E6FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF9E703C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E72B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E7F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E83B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E84A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E8F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E9098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E9204(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1AF9E950C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E95D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E9658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E99D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E9B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AF9E9CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9E9D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EA1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9EA37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EA4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1AF9EA524()
{
}

void sub_1AF9EA5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EA66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EA72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EAA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9EAB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EAC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EAD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EAEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EAFF4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9EB11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB4C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EB8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBA94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EBDF4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9EC014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AF9EC180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_1AF9EC210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EC490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EC624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  uint64_t v21 = v20;

  objc_destroyWeak(v18);
  _Unwind_Resume(a1);
}

void sub_1AF9EC854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EC98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v15 - 40));

  _Unwind_Resume(a1);
}

void sub_1AF9ECB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ECDE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ECEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9ECF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EDF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EE348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

Class initQLItem()
{
  if (LoadQuickLook_loadPredicate_0 != -1) {
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2413);
  }
  Class result = objc_getClass("QLItem");
  classQLItem = (uint64_t)result;
  getQLItemClass = (uint64_t (*)())QLItemFunction;
  return result;
}

id QLItemFunction()
{
  return (id)classQLItem;
}

void __LoadQuickLook_block_invoke_0()
{
  LoadQuickLook_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  if (!LoadQuickLook_frameworkLibrary_0) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

Class initQLPreviewController()
{
  if (LoadQuickLook_loadPredicate_0 != -1) {
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2413);
  }
  Class result = objc_getClass("QLPreviewController");
  classQLPreviewController = (uint64_t)result;
  getQLPreviewControllerClass = (uint64_t (*)())QLPreviewControllerFunction;
  return result;
}

id QLPreviewControllerFunction()
{
  return (id)classQLPreviewController;
}

Class initQLDismissAction()
{
  if (LoadQuickLook_loadPredicate_0 != -1) {
    dispatch_once(&LoadQuickLook_loadPredicate_0, &__block_literal_global_2413);
  }
  Class result = objc_getClass("QLDismissAction");
  classQLDismissAction = (uint64_t)result;
  getQLDismissActionClass = (uint64_t (*)())QLDismissActionFunction;
  return result;
}

id QLDismissActionFunction()
{
  return (id)classQLDismissAction;
}

Class initCloudSharing()
{
  if (LoadCloudSharing_loadPredicate != -1) {
    dispatch_once(&LoadCloudSharing_loadPredicate, &__block_literal_global_2422);
  }
  Class result = objc_getClass("CloudSharing");
  classCloudSharing = (uint64_t)result;
  getCloudSharingClass = (uint64_t (*)())CloudSharingFunction;
  return result;
}

id CloudSharingFunction()
{
  return (id)classCloudSharing;
}

void __LoadCloudSharing_block_invoke()
{
  LoadCloudSharing_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudSharing.framework/CloudSharing", 2);
  if (!LoadCloudSharing_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_2.isa);
  }
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1AF9EE77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EE854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EE950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EE9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EEB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EEBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMailComposeInternalViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9EEF94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EF95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EFA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EFC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EFDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EFE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9EFFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F0070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F0B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9F0EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F11C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F12EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1AF9F164C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F19B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F1E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F20D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F244C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F25B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F26C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  uint64_t v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1AF9F2DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F2FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F33FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F39B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F3BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4000(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AF9F40BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F429C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F441C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AF9F4788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F4F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F506C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F519C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F56D4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9F5774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)MFMailComposeRecipientTextView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9F5844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F58C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F59A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F5FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F60A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F61E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F63AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F6D50(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9F7104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F73DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7508(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AF9F75E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F77C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F790C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AF9F799C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMailComposeToField;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9F7B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F7FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F8074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F81F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F851C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F89F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F8C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9F8C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F8D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)MFMailComposeView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AF9F8FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F93F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F970C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F99CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9F9D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FA5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FA8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FA960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FA9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FAD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FAE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FB100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _layoutField(void *a1, void *a2, double *a3, double a4, CGFloat Height)
{
  id v8 = a1;
  id v9 = a2;
  id v13 = v8;
  [v13 alpha];
  if (v10 == 0.0)
  {
  }
  else
  {
    BOOL v11 = [v13 superview];

    if (v11)
    {
      id v12 = v13;
      if (v9 != v13)
      {
        [v13 frame];
        Height = CGRectGetHeight(v15);
        id v12 = v13;
      }
      a3[3] = Height;
      objc_msgSend(v12, "setFrame:", *a3, a3[1], a3[2], Height);
      [v13 frame];
      a3[1] = CGRectGetMaxY(v16);
    }
  }
}

void sub_1AF9FB218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FB5C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FBA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FBAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FBBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FBC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FBE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FC230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FC740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FC9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FCAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FCFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FD290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FD5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FD730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FD7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FD930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FDA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FDAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FDD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,void *a25)
{
  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AF9FE248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1AF9FE400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FE504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FE610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FE738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FE82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FE990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FEA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FEAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FED40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FEE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FEED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FF9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FFA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FFB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FFC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AF9FFEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA002AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA005A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA007F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA009CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA00F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA010AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA012F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA013BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA015BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA017A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA019D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA01D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t MFMailComposeResultMake(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

void sub_1AFA02344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA024B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA026C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0273C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA027AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0282C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AFA02C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AFA02CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA02EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA02FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0303C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA030A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA031F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA032D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0333C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA033AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA034A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA035F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA037CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0384C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA038C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA039EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA03F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA040AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _ArrayContainsKindOfObjects(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___ArrayContainsKindOfObjects_block_invoke;
    v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v6[4] = a2;
    uint64_t v4 = objc_msgSend(v3, "ef_all:", v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1AFA041D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0445C(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AFA04A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA04F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA05148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA052F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0553C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA057CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA059E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  objc_destroyWeak(v25);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

void sub_1AFA05BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA05D2C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA06014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v30 - 104));

  _Unwind_Resume(a1);
}

void sub_1AFA06434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AFA06594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0662C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0669C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA067F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA06898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA06D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA06E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)_MFMailCompositionContext;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA06F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA06F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA071AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA073C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA074F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGRect v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1AFA07780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA07FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0800C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0806C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA080CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0813C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA081A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA082F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA083D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA084D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA085E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0862C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0868C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA086EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0875C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA087C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA088A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA089F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA08FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0901C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0907C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA090EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA091A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA092E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA093BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0942C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA094E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA095B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA096FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0976C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA097C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA098D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v10;

  _Unwind_Resume(a1);
}

void sub_1AFA09C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA09E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0A190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0A8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0B090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0B244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0BB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0C16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0C79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0C908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0CB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0CF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0D754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0DBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0E104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0E410(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1AFA0E5CC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA0E694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0E9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0EB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0EBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0ECAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0EDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0EF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F104(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AFA0F2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F44C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0F8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)MFMailPopoverManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA0FA84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0FD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA0FFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  CGRect v16 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA10090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA103BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA10630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA10F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1126C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1130C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA113D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1144C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA114E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AFA11570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA115E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA11674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA117B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA11CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFA11ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA120B0()
{
}

void sub_1AFA12208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1231C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA126AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA12F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA130C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1331C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___imageConversionScheduler_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.Mail.MFMediaExporter.imageConversionScheduler" qualityOfService:25];
  id v1 = (void *)_imageConversionScheduler_sInstance;
  _imageConversionScheduler_sInstance = v0;
}

void sub_1AFA134FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA13618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1AFA13814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1390C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1AFA13A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t _SMSCapabilityChanged()
{
  return +[MFMessageComposeViewController _updateServiceAvailability];
}

void sub_1AFA13B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA13BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA13C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA13CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA13EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1407C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1414C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA141EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1423C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1428C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA142DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA143BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA144DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA147B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA14F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA15020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA150F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA152D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1AFA156D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA15F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Block_object_dispose((const void *)(v20 - 192), 8);
  _Block_object_dispose((const void *)(v20 - 160), 8);

  _Unwind_Resume(a1);
}

void sub_1AFA16218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA165F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1674C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA16F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA171A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1722C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA172C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMessageComposeViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA17750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA17FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1800C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA180BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AFA183EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA184C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _MFMessageSentCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = a5;
  CFSocketNativeHandle v6 = getIMMessageSentDistributedNotificationUserInfoMessageGUIDKey();
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = getIMMessageSentDistributedNotificationUserInfoSucessKey();
  id v9 = [v5 objectForKeyedSubscript:v8];
  char v10 = [v9 BOOLValue];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___MFMessageSentCallback_block_invoke;
  v12[3] = &unk_1E5F79898;
  id v13 = v7;
  char v14 = v10;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void sub_1AFA18B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA18E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t initIMSPIShareSheetCanSendMedia(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (LoadIMCore_loadPredicate != -1) {
    dispatch_once(&LoadIMCore_loadPredicate, &__block_literal_global_445);
  }
  CFSocketNativeHandle v6 = (uint64_t (*)())dlsym((void *)LoadIMCore_frameworkLibrary, "IMSPIShareSheetCanSendMedia");
  softLinkIMSPIShareSheetCanSendMedia = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void __LoadIMCore_block_invoke()
{
  LoadIMCore_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IMCore.framework/IMCore", 2);
  if (!LoadIMCore_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_3.isa);
  }
}

id initSWCopyRepresentationTypeIdentifier()
{
  if (LoadSharedWithYouCore_loadPredicate != -1) {
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_452);
  }
  uint64_t v0 = (id *)dlsym((void *)LoadSharedWithYouCore_frameworkLibrary, "SWCopyRepresentationTypeIdentifier");
  objc_storeStrong((id *)&constantSWCopyRepresentationTypeIdentifier, *v0);
  getSWCopyRepresentationTypeIdentifier = (uint64_t (*)())SWCopyRepresentationTypeIdentifierFunction;
  id v1 = (void *)constantSWCopyRepresentationTypeIdentifier;

  return v1;
}

id SWCopyRepresentationTypeIdentifierFunction()
{
  return (id)constantSWCopyRepresentationTypeIdentifier;
}

void __LoadSharedWithYouCore_block_invoke()
{
  LoadSharedWithYouCore_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/SharedWithYouCore.framework/SharedWithYouCore", 2);
  if (!LoadSharedWithYouCore_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_4.isa);
  }
}

Class init_SWPendingCollaboration()
{
  if (LoadSharedWithYouCore_loadPredicate != -1) {
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_452);
  }
  Class result = objc_getClass("_SWPendingCollaboration");
  class_SWPendingCollaboration = (uint64_t)result;
  get_SWPendingCollaborationClass = (uint64_t (*)())_SWPendingCollaborationFunction;
  return result;
}

id _SWPendingCollaborationFunction()
{
  return (id)class_SWPendingCollaboration;
}

Class init_SWCollaborationShareOptions()
{
  if (LoadSharedWithYouCore_loadPredicate != -1) {
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_452);
  }
  Class result = objc_getClass("_SWCollaborationShareOptions");
  class_SWCollaborationShareOptions = (uint64_t)result;
  get_SWCollaborationShareOptionsClass = (uint64_t (*)())_SWCollaborationShareOptionsFunction;
  return result;
}

id _SWCollaborationShareOptionsFunction()
{
  return (id)class_SWCollaborationShareOptions;
}

Class init_SWCollaborationMetadata()
{
  if (LoadSharedWithYouCore_loadPredicate != -1) {
    dispatch_once(&LoadSharedWithYouCore_loadPredicate, &__block_literal_global_452);
  }
  Class result = objc_getClass("_SWCollaborationMetadata");
  class_SWCollaborationMetadata = (uint64_t)result;
  get_SWCollaborationMetadataClass = (uint64_t (*)())_SWCollaborationMetadataFunction;
  return result;
}

id _SWCollaborationMetadataFunction()
{
  return (id)class_SWCollaborationMetadata;
}

id initIMMessageSentDistributedNotificationUserInfoMessageGUIDKey()
{
  if (LoadIMSharedUtilities_loadPredicate != -1) {
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_462);
  }
  uint64_t v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotificationUserInfoMessageGUIDKey");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey, *v0);
  getIMMessageSentDistributedNotificationUserInfoMessageGUIDKey = (uint64_t (*)())IMMessageSentDistributedNotificationUserInfoMessageGUIDKeyFunction;
  id v1 = (void *)constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey;

  return v1;
}

id IMMessageSentDistributedNotificationUserInfoMessageGUIDKeyFunction()
{
  return (id)constantIMMessageSentDistributedNotificationUserInfoMessageGUIDKey;
}

void __LoadIMSharedUtilities_block_invoke()
{
  LoadIMSharedUtilities_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 2);
  if (!LoadIMSharedUtilities_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_5.isa);
  }
}

id initIMMessageSentDistributedNotificationUserInfoSucessKey()
{
  if (LoadIMSharedUtilities_loadPredicate != -1) {
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_462);
  }
  uint64_t v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotificationUserInfoSucessKey");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotificationUserInfoSucessKey, *v0);
  getIMMessageSentDistributedNotificationUserInfoSucessKey = (uint64_t (*)())IMMessageSentDistributedNotificationUserInfoSucessKeyFunction;
  id v1 = (void *)constantIMMessageSentDistributedNotificationUserInfoSucessKey;

  return v1;
}

id IMMessageSentDistributedNotificationUserInfoSucessKeyFunction()
{
  return (id)constantIMMessageSentDistributedNotificationUserInfoSucessKey;
}

id initIMMessageSentDistributedNotification()
{
  if (LoadIMSharedUtilities_loadPredicate != -1) {
    dispatch_once(&LoadIMSharedUtilities_loadPredicate, &__block_literal_global_462);
  }
  uint64_t v0 = (id *)dlsym((void *)LoadIMSharedUtilities_frameworkLibrary, "IMMessageSentDistributedNotification");
  objc_storeStrong((id *)&constantIMMessageSentDistributedNotification, *v0);
  getIMMessageSentDistributedNotification = (uint64_t (*)())IMMessageSentDistributedNotificationFunction;
  id v1 = (void *)constantIMMessageSentDistributedNotification;

  return v1;
}

id IMMessageSentDistributedNotificationFunction()
{
  return (id)constantIMMessageSentDistributedNotification;
}

void sub_1AFA19434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageContentLoadingView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA19544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA195EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA19668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA19A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA19D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA19FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageContentProgressLayer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA1A3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A550(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1AFA1A68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1A8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1AA00(_Unwind_Exception *a1)
{
  CFSocketNativeHandle v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1AFA1AA44()
{
}

void sub_1AFA1AA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageURLProtocol;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA1ACF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id v27 = v25;
  objc_destroyWeak(v26);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AFA1AE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1AF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1B10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1B7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AFA1B9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1BAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1BBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1BCCC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AFA1BE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1BFE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1C224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1C484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1C54C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA1C744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1C944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1CBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1CC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1CD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFModernAddressAtom;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA1CFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1DAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1DB8C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA1DC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1DD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1DDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1DF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double _drawingOffsetForPresentationOption(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  double result = *MEMORY[0x1E4F1DAD8];
  while (_predefinedAtomIconDrawingOffsets[v2] != a1 || _predefinedAtomIconDrawingOffsets[v2 + 3] > a2)
  {
    v2 += 4;
    if (v2 == 12) {
      return result;
    }
  }
  return 0.0;
}

id MFAtomViewIconImageForPresentationOption(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7 = a2;
  long long v35 = v7;
  if (!MFAtomViewIconImageForPresentationOption_accessoryIconCache)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = (void *)MFAtomViewIconImageForPresentationOption_accessoryIconCache;
    MFAtomViewIconImageForPresentationOption_accessoryIconCache = (uint64_t)v8;
  }
  if (a1 <= 2047)
  {
    if (a1 == 16)
    {
      double v10 = 0.8;
LABEL_11:
      id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:v10 alpha:1.0];
      if (!v11) {
        id v11 = v7;
      }
      goto LABEL_14;
    }
    if (a1 != 1024) {
      goto LABEL_26;
    }
LABEL_9:
    double v10 = 0.5;
    goto LABEL_11;
  }
  if (a1 == 4096 || a1 == 2048) {
    goto LABEL_9;
  }
LABEL_26:
  id v11 = v7;
  if (a1 != 0x2000)
  {
LABEL_14:
    long long v36 = 0;
    goto LABEL_15;
  }
  long long v31 = @"small";
  if (a4) {
    long long v31 = @"large";
  }
  long long v32 = [NSString stringWithFormat:@"%@-%@", v31, @"downtime", v7];
  uint64_t v33 = _MFAtomViewIconImageVariantNameForGlyphType((uint64_t)v32, a3);

  long long v36 = (void *)v33;
LABEL_15:
  id v12 = v11;
  id v13 = [MEMORY[0x1E4F28E78] string];
  id v14 = v12;
  Components = CGColorGetComponents((CGColorRef)[v14 CGColor]);
  id v16 = v14;
  for (size_t i = CGColorGetNumberOfComponents((CGColorRef)[v16 CGColor]); i; --i)
    objc_msgSend(v13, "appendFormat:", @"%f.", *(void *)Components++);

  long long v18 = [v36 stringByAppendingFormat:@"_%@", v13];

  long long v19 = [(id)MFAtomViewIconImageForPresentationOption_accessoryIconCache objectForKey:v18];
  if (!v19)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v22 = [v20 imageNamed:v36 inBundle:v21];

    if (v22)
    {
      if (v16)
      {
        uint64_t v23 = [v22 _flatImageWithColor:v16];

        id v22 = (id)v23;
      }
      id v24 = [MFAtomIcon alloc];
      id v22 = v22;
      uint64_t v25 = [v22 CGImage];
      [v22 scale];
      id v27 = -[MFAtomIcon initWithCGImage:scale:orientation:](v24, "initWithCGImage:scale:orientation:", v25, [v22 imageOrientation], v26);
      uint64_t v28 = 0;
      long long v19 = v27;
      double v29 = *MEMORY[0x1E4F1DAD8];
      double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      while (_predefinedAtomIconDrawingOffsets[v28] != a1 || _predefinedAtomIconDrawingOffsets[v28 + 3] > a3)
      {
        v28 += 4;
        if (v28 == 12) {
          goto LABEL_32;
        }
      }
      double v30 = *(double *)&_predefinedAtomIconDrawingOffsets[v28 + 2];
      double v29 = 0.0;
LABEL_32:
      -[MFAtomIcon setDrawingOffset:](v27, "setDrawingOffset:", v29, v30);
      [(id)MFAtomViewIconImageForPresentationOption_accessoryIconCache setObject:v19 forKey:v18];
    }
    else
    {
      long long v19 = 0;
    }
  }

  return v19;
}

void sub_1AFA1E324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E61C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1E9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1EAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1F8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _MFAtomViewIconImageVariantNameForGlyphType(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = xmmword_1E5F7CDF0;
  long long v9 = *(_OWORD *)&off_1E5F7CE00;
  long long v10 = xmmword_1E5F7CE10;
  id v11 = @"XXXL";
  uint64_t v3 = 6;
  if (a2 < 6) {
    uint64_t v3 = a2;
  }
  id v4 = *((id *)&v8 + v3);
  id v5 = [NSString stringWithFormat:@"%@-%@.png", v4, a1, v8, v9, v10, v11, v12];
  for (uint64_t i = 48; i != -8; i -= 8)

  return v5;
}

void sub_1AFA1FA6C(_Unwind_Exception *a1)
{
  for (uint64_t i = 48; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_1AFA1FAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1FBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1FCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1FD7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1FF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA1FFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA204CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA209D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA20F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, char a10)
{
  for (uint64_t i = 16; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void sub_1AFA2118C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA21330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2183C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA218E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA219C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA21AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA21C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA21EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFA22290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AFA223CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA224BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AFA2256C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA22780(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA22814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA228A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA22BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA22D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA22EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA233EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2355C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA23770(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA23860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA239F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA23ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)MFModernLabelledAtomList;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA24228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA242FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA249D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA24F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA254F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2578C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA258C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA259F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA25EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA261AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);

  _Block_object_dispose((const void *)(v50 - 224), 8);
  _Block_object_dispose((const void *)(v50 - 160), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1AFA263CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA265F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA266AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA26848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFModernUIContentSizeCategoryOrdering()
{
  v8[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB27E8];
  v8[0] = *MEMORY[0x1E4FB27C8];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB27D0];
  v8[2] = *MEMORY[0x1E4FB27D8];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4FB27B8];
  v8[4] = *MEMORY[0x1E4FB27C0];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB2798];
  v8[6] = *MEMORY[0x1E4FB27B0];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB2788];
  v8[8] = *MEMORY[0x1E4FB2790];
  v8[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB2778];
  v8[10] = *MEMORY[0x1E4FB2780];
  v8[11] = v5;
  CFSocketNativeHandle v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:12];

  return v6;
}

id MFModernUIApplicationPreferredContentSizeCode()
{
  uint64_t v0 = MFModernUIContentSizeCategoryOrdering();
  uint64_t v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v2 = [v1 preferredContentSizeCategory];

  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v4 = [v0 objectAtIndex:i];
    char v5 = [v4 isEqualToString:v2];

    if (v5) {
      break;
    }
  }
  CFSocketNativeHandle v6 = [NSString stringWithUTF8String:MFModernUIApplicationPreferredContentSizeCode_contentSizeCodes[i]];

  return v6;
}

void sub_1AFA26BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()
{
  uint64_t v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];

  uint64_t v2 = MFModernUIContentSizeCategoryOrdering();
  unint64_t v3 = [v2 indexOfObject:v1];
  BOOL v4 = v3 > [v2 indexOfObject:*MEMORY[0x1E4FB27D0]];

  return v4;
}

void sub_1AFA26C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MFModernUIApplicationPreferredContentSizeIsAccessibility()
{
  uint64_t v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v1 = [v0 preferredContentSizeCategory];

  uint64_t v2 = MFModernUIContentSizeCategoryOrdering();
  unint64_t v3 = [v2 indexOfObject:v1];
  BOOL v4 = v3 >= [v2 indexOfObject:*MEMORY[0x1E4FB2798]];

  return v4;
}

void sub_1AFA26D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MFIsAuthorizedToAccessPhotoLibrary()
{
  uint64_t v0 = [(objc_class *)getPHPhotoLibraryClass() authorizationStatus];
  return v0 == 3 || v0 == 0;
}

uint64_t MFCameraRollSaveAssetWithURL(void *a1, uint64_t a2)
{
  id v3 = a1;
  BOOL v4 = [v3 path];
  BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v4);

  CFSocketNativeHandle v6 = [(objc_class *)getPHPhotoLibraryClass() sharedPhotoLibrary];
  if (IsCompatibleWithSavedPhotosAlbum)
  {
    id v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __MFCameraRollSaveAssetWithURL_block_invoke;
    v12[3] = &unk_1E5F79088;
    void v12[4] = v3;
    uint64_t v8 = [v6 performChangesAndWait:v12 error:a2];
  }
  else
  {
    id v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __MFCameraRollSaveAssetWithURL_block_invoke_2;
    v11[3] = &unk_1E5F79088;
    v11[4] = v3;
    uint64_t v8 = [v6 performChangesAndWait:v11 error:a2];
  }
  uint64_t v9 = v8;

  return v9;
}

void sub_1AFA272A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id __MFCameraRollSaveAssetWithURL_block_invoke(uint64_t a1)
{
  return (id)[(objc_class *)getPHAssetChangeRequestClass() creationRequestForAssetFromVideoAtFileURL:*(void *)(a1 + 32)];
}

id __MFCameraRollSaveAssetWithURL_block_invoke_2(uint64_t a1)
{
  return (id)[(objc_class *)getPHAssetChangeRequestClass() creationRequestForAssetFromImageAtFileURL:*(void *)(a1 + 32)];
}

uint64_t MFCameraRollSaveImage(void *a1, uint64_t a2)
{
  id v3 = a1;
  BOOL v4 = [(objc_class *)getPHPhotoLibraryClass() sharedPhotoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __MFCameraRollSaveImage_block_invoke;
  v8[3] = &unk_1E5F79088;
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = [v4 performChangesAndWait:v8 error:a2];

  return v6;
}

void sub_1AFA2741C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __MFCameraRollSaveImage_block_invoke(uint64_t a1)
{
  return (id)[(objc_class *)getPHAssetChangeRequestClass() creationRequestForAssetFromImage:*(void *)(a1 + 32)];
}

Class initPHPhotoLibrary()
{
  if (LoadPhotos_loadPredicate != -1) {
    dispatch_once(&LoadPhotos_loadPredicate, &__block_literal_global_29);
  }
  Class result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary = (uint64_t)result;
  getPHPhotoLibraryClass = (uint64_t (*)())PHPhotoLibraryFunction;
  return result;
}

id PHPhotoLibraryFunction()
{
  return (id)classPHPhotoLibrary;
}

void __LoadPhotos_block_invoke()
{
  LoadPhotos_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  if (!LoadPhotos_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_6.isa);
  }
}

Class initPHAssetChangeRequest()
{
  if (LoadPhotos_loadPredicate != -1) {
    dispatch_once(&LoadPhotos_loadPredicate, &__block_literal_global_29);
  }
  Class result = objc_getClass("PHAssetChangeRequest");
  classPHAssetChangeRequest = (uint64_t)result;
  getPHAssetChangeRequestClass = (uint64_t (*)())PHAssetChangeRequestFunction;
  return result;
}

id PHAssetChangeRequestFunction()
{
  return (id)classPHAssetChangeRequest;
}

void sub_1AFA27B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA27F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2803C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA280CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2816C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA283F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA284EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA285E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA287C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA28974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA28B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA28CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA28D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA28FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA290FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1AFA29764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA29F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2A120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2A270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2A3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2A628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2A738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AFA2A868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1AFA2A9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_1AFA2AA60(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AFA2AB14(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AFA2ABD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1AFA2AD00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AFA2AE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2AEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2AFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2B124(_Unwind_Exception *a1)
{
  BOOL v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA2B620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2BAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2BE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2BEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2BF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2BFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2C128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2C298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2C764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id _plaintextDocumentForMimePart(void *a1)
{
  id v1 = a1;
  if ([v1 approximateRawSize])
  {
    uint64_t v2 = (void *)[v1 copyBodyDataToOffset:-1 resultOffset:0 downloadIfNecessary:1];
    id v3 = (void *)MFCreateStringWithData();
    id v4 = objc_alloc_init(MEMORY[0x1E4F77C30]);
    [v4 appendString:v3 withQuoteLevel:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1AFA2C974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2D9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2DB94(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA2DC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2DD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2DDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2DEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E16C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AFA2E274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1AFA2E86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2E954(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1AFA2E9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2EA94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2EB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2EE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2EF28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2EFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2F928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2FADC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA2FB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFProgressView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA2FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA2FD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA30008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3029C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3035C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA30478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA306B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA307BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA309AC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA30AEC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA30C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFABPropertyForRecentsKind(void *a1)
{
  id v1 = a1;
  MFInitializeAddressBookConstants();
  if ([(id)*MEMORY[0x1E4F5CC60] isEqualToString:v1])
  {
    uint64_t v2 = *MEMORY[0x1E4F49AC0];
  }
  else if ([(id)*MEMORY[0x1E4F5CC80] isEqualToString:v1])
  {
    uint64_t v2 = *MEMORY[0x1E4F49CC8];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1AFA30D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFRecentsKindForABProperty(int a1)
{
  MFInitializeAddressBookConstants();
  if (*MEMORY[0x1E4F49AC0] == a1)
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F5CC60];
LABEL_5:
    id v3 = *v2;
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F49CC8] == a1)
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F5CC80];
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

void sub_1AFA30E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_MFCRRecentContactABContext;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA30F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA31240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _MFPhoneNumbersEqualCallback(void *a1, void *a2)
{
  [a1 UTF8String];
  [a2 UTF8String];
  id v3 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  uint64_t v4 = CPPhoneNumbersEqual();
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

void sub_1AFA3164C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA31718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA31A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1AFA320A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42)
{
  _Block_object_dispose((const void *)(v47 - 152), 8);
  _Unwind_Resume(a1);
}

id MFLocalizedAddressSeparator()
{
  if (MFLocalizedAddressSeparator_onceToken != -1) {
    dispatch_once(&MFLocalizedAddressSeparator_onceToken, &__block_literal_global_91);
  }
  uint64_t v0 = (void *)MFLocalizedAddressSeparator___result;

  return v0;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1AFA322D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA323B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3259C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA328C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AFA32B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __MFLocalizedAddressSeparator_block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v3 localizedStringForKey:@"ADDRESS_SEPARATOR" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)MFLocalizedAddressSeparator___result;
  MFLocalizedAddressSeparator___Class result = v1;
}

void sub_1AFA32C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA32F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA336FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA338C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA33AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA34554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

id _displayNameForRecipient(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 displayString];
  if (v4 && a2)
  {
    id v5 = +[MFAddressBookManager sharedManager];
    uint64_t v6 = (const void *)[v5 addressBook];

    id v7 = [v3 address];
    uint64_t v8 = MFPreferredAbbreviatedNameForAddressAndDisplayName(v6, v7, v4, 0);
  }
  else
  {
    uint64_t v8 = [v3 displayString];
    id v7 = v4;
  }

  return v8;
}

void sub_1AFA348C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA34DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AFA35064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3529C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA352EC()
{
}

void sub_1AFA3540C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA35AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3610C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA361D0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA362BC(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA364EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA365DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA366EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA368C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1AFA369C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36B0C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA36BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36E44(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA36EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA36F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _baseDetailAttributes()
{
  uint64_t v0 = +[_MFTableCellAttributesCache sharedInstance];
  uint64_t v1 = [v0 cachedAttributesForIdentifier:@"detailBase" constructionBlock:&__block_literal_global_224_0];

  return v1;
}

void sub_1AFA37018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA370DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA371BC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA37258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA372F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3738C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA374F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1AFA377E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3786C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)_MFTableCellAttributesCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA37958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___baseDetailAttributes_block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0 options:0];
  v4[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];
  v4[1] = @"mf_tintType";
  v5[0] = v1;
  v5[1] = @"mf_ttdimmed";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_1AFA37A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA37F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3805C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA38100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA381B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFRoundProgressView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1AFA384B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA385A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA386E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA387E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA38C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA38E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1AFA38F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA391B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3964C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA397EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA398D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3993C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA39EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3A3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3A50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3A5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3A8BC(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1AFA3A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3AA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3AB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3B734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3BA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3BBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3BC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3BD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3BFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C2FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C3B0(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA3C4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3C888(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1AFA3C91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3CDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3CEE4()
{
}

id EFLocalizedStringWithValue()
{
  uint64_t v0 = _EFLocalizedString();

  return v0;
}

void sub_1AFA3D0A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3D114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3D300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3D430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3D4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3D7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AFA3DA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class initTLAlertConfiguration()
{
  if (LoadToneLibrary_loadPredicate != -1) {
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_35);
  }
  Class result = objc_getClass("TLAlertConfiguration");
  classTLAlertConfiguration = (uint64_t)result;
  getTLAlertConfigurationClass = (uint64_t (*)())TLAlertConfigurationFunction;
  return result;
}

id TLAlertConfigurationFunction()
{
  return (id)classTLAlertConfiguration;
}

void __LoadToneLibrary_block_invoke()
{
  LoadToneLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ToneLibrary.framework/ToneLibrary", 2);
  if (!LoadToneLibrary_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_7.isa);
  }
}

Class initTLAlert()
{
  if (LoadToneLibrary_loadPredicate != -1) {
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_35);
  }
  Class result = objc_getClass("TLAlert");
  classTLAlert = (uint64_t)result;
  getTLAlertClass = (uint64_t (*)())TLAlertFunction;
  return result;
}

id TLAlertFunction()
{
  return (id)classTLAlert;
}

Class initFMDFMIPManager()
{
  if (LoadFindMyDevice_loadPredicate != -1) {
    dispatch_once(&LoadFindMyDevice_loadPredicate, &__block_literal_global_39);
  }
  Class result = objc_getClass("FMDFMIPManager");
  classFMDFMIPManager = (uint64_t)result;
  getFMDFMIPManagerClass = (uint64_t (*)())FMDFMIPManagerFunction;
  return result;
}

id FMDFMIPManagerFunction()
{
  return (id)classFMDFMIPManager;
}

void __LoadFindMyDevice_block_invoke()
{
  LoadFindMyDevice_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FindMyDevice.framework/FindMyDevice", 2);
  if (!LoadFindMyDevice_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi_8.isa);
  }
}

void sub_1AFA3DC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3DDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3DF30(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA3DFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA3E0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3E18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3E41C(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1AFA3E528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3E608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3E8CC(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA3E9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3EA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3EAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3EB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3EB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3ED94(_Unwind_Exception *a1)
{
  uint64_t v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA3EE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F534(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA3F670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3F700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3FAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3FC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1AFA3FD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA3FE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA401FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFAddressHasSafeDomain(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 emailAddressValue];
  id v3 = [v2 domain];

  uint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
  id v5 = [v4 managedEmailDomains];
  uint64_t v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_38);

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __MFAddressHasSafeDomain_block_invoke_2;
    v9[3] = &unk_1E5F7C7A0;
    id v10 = v3;
    uint64_t v7 = objc_msgSend(v6, "ef_any:", v9);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void sub_1AFA404D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __MFAddressHasSafeDomain_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 rangeOfString:@"@"];
  uint64_t v4 = v2;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 substringFromIndex:v3 + 1];
  }

  return v4;
}

void sub_1AFA4059C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL __MFAddressHasSafeDomain_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

unint64_t MFFirstIndexPassingTest(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    unint64_t v4 = MFFirstIndexInRangePassingTest(0, a1 - 1, v3);
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void sub_1AFA40628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t MFFirstIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(void, void))v5;
  if (a1 > a2) {
    goto LABEL_2;
  }
  if ((*((uint64_t (**)(id, unint64_t))v5 + 2))(v5, a1))
  {
    a2 = a1;
    goto LABEL_5;
  }
  if (v6[2](v6, a2))
  {
    while (a1 + 1 < a2)
    {
      if (v6[2](v6, (a2 + a1) >> 1)) {
        a2 = (a2 + a1) >> 1;
      }
      else {
        a1 = (a2 + a1) >> 1;
      }
    }
  }
  else
  {
LABEL_2:
    a2 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_5:

  return a2;
}

void sub_1AFA406F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFLastIndexPassingTest(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = MFLastIndexInRangePassingTest(0, a1 - 1, v3);
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void sub_1AFA40758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MFLastIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1 <= a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __MFLastIndexInRangePassingTest_block_invoke;
    v11[3] = &unk_1E5F7D348;
    id v12 = v5;
    unint64_t v8 = MFFirstIndexInRangePassingTest(a1, a2, v11);
    unint64_t v9 = v8 - 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = a2;
    }
    if (v8 == a1) {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

void sub_1AFA4083C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __MFLastIndexInRangePassingTest_block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

void sub_1AFA40900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CopyCompositionServicesDomain()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F77E10];
  uint64_t v1 = CPCopySharedResourcesPreferencesDomainForDomain();
  if (!v1)
  {
    id v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      uint64_t v5 = v0;
      _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "#Warning Unable to find shared resources preference domain for %@", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

void sub_1AFA40F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA40FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41438(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA415A4(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1AFA41788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA418D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41A14(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1AFA41A54()
{
}

void sub_1AFA41B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA41EFC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA42000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __MapImageNameNumberAware_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0841A40];
  uint64_t v1 = (void *)MapImageNameNumberAware_sDigitAwareSet;
  MapImageNameNumberAware_sDigitAwareSet = v0;
}

void sub_1AFA42458(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1AFA42548(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1AFA425EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA4266C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA426EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA4276C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1AFA42CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA42F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA430A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA43168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AFA43210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1AFA433EC()
{
  return sub_1AFA53FE8();
}

uint64_t sub_1AFA4341C()
{
  uint64_t v17 = 0;
  long long v18 = sub_1AFA43914;
  double v30 = sub_1AFA440D0;
  uint64_t v42 = &v48;
  uint64_t v48 = 0;
  uint64_t v41 = &v47;
  uint64_t v47 = 0;
  long long v40 = &v45;
  uint64_t v45 = 0;
  uint64_t v39 = &v44;
  uint64_t v44 = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  uint64_t v24 = *(void *)(v27 - 8);
  uint64_t v25 = v27 - 8;
  unint64_t v11 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v27, v0, v1, v2);
  double v29 = (char *)&v11 - v11;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v15 = v16 - 8;
  unint64_t v12 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v17, v3, v4, v5);
  uint64_t v21 = (char *)&v11 - v12;
  uint64_t v32 = sub_1AFA53EB8();
  uint64_t v22 = *(void *)(v32 - 8);
  uint64_t v23 = v32 - 8;
  unint64_t v13 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v32, v6, v7, v8);
  long long v35 = (char *)&v11 - v13;
  uint64_t v9 = sub_1AFA438A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v21, v9, v16);
  uint64_t v19 = sub_1AFA53E38();
  unint64_t v20 = sub_1AFA43DC0();
  sub_1AFA43E44();
  uint64_t v31 = 0;
  sub_1AFA53EC8();
  uint64_t v36 = sub_1AFA53E08();
  long long v34 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v33 = v22 + 8;
  v34(v35, v32);
  sub_1AFA53E28();
  uint64_t v48 = v36;
  uint64_t v26 = sub_1AFA4405C();
  uint64_t v28 = &v46;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v29, v26, v27);
  swift_endAccess();
  sub_1AFA53ED8();
  uint64_t v37 = sub_1AFA53E08();
  v34(v35, v32);
  sub_1AFA53E28();
  uint64_t v47 = v37;
  uint64_t v38 = sub_1AFA53E28();
  swift_bridgeObjectRelease();
  sub_1AFA53E28();
  uint64_t v45 = v38;
  uint64_t v43 = sub_1AFA53E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AFA53E28();
  uint64_t v44 = v43;
  sub_1AFA442BC();
  sub_1AFA442BC();
  sub_1AFA442BC();
  sub_1AFA442BC();
  return v43;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_1AFA438A0()
{
  if (qword_1E9AF6018 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6640);
}

uint64_t sub_1AFA43914@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v40 = a2;
  uint64_t v27 = a1;
  uint64_t v56 = 0;
  uint64_t v46 = sub_1AFA53C08();
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = v46 - 8;
  unint64_t v22 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v46, v2, v3, v4);
  uint64_t v45 = (char *)&v22 - v22;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F20);
  uint64_t v47 = *(void *)(v50 - 8);
  uint64_t v48 = v50 - 8;
  unint64_t v23 = (*(void *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v50, v5, v6, v7);
  unint64_t v49 = (char *)&v22 - v23;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F68);
  uint64_t v30 = *(void *)(v33 - 8);
  uint64_t v31 = v33 - 8;
  unint64_t v24 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v33, v8, v9, v10);
  uint64_t v32 = (char *)&v22 - v24;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F38);
  uint64_t v35 = *(void *)(v38 - 8);
  uint64_t v36 = v38 - 8;
  unint64_t v25 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v38, v11, v12, v13);
  uint64_t v37 = (char *)&v22 - v25;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F50);
  uint64_t v51 = *(void *)(v54 - 8);
  uint64_t v52 = v54 - 8;
  unint64_t v26 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = MEMORY[0x1F4188790](v27, v14, v15, v16);
  id v53 = (char *)&v22 - v26;
  uint64_t v56 = v17;
  unint64_t v28 = sub_1AFA45294();
  sub_1AFA53C28();
  uint64_t KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF3010);
  sub_1AFA43FCC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  uint64_t v34 = swift_getKeyPath();
  sub_1AFA45348();
  uint64_t v39 = MEMORY[0x1E4FBB550];
  sub_1AFA43FCC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v38);
  uint64_t v55 = 20;
  sub_1AFA53C18();
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v45, *MEMORY[0x1E4F27548], v46);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EE0);
  v40[3] = v18;
  unint64_t v19 = sub_1AFA453CC();
  unint64_t v20 = v40;
  v40[4] = v19;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  unint64_t v42 = sub_1AFA456A0();
  sub_1AFA45724();
  sub_1AFA53BF8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v53, v54);
}

unint64_t sub_1AFA43DC0()
{
  uint64_t v2 = qword_1E9AF2F90;
  if (!qword_1E9AF2F90)
  {
    sub_1AFA53E38();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA43E44()
{
  uint64_t v2 = qword_1E9AF2F88;
  if (!qword_1E9AF2F88)
  {
    sub_1AFA53E38();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F88);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA43EC8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v12 = a2;
  uint64_t v10 = a1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  uint64_t v13 = *(void *)(v15 - 8);
  uint64_t v14 = v15 - 8;
  unint64_t v11 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v15, v10, v15, v2);
  uint64_t v16 = (char *)&v9 - v11;
  (*(void (**)(char *))(v13 + 16))((char *)&v9 - v11);
  uint64_t v3 = sub_1AFA53F08();
  uint64_t v4 = v13;
  uint64_t v5 = v15;
  uint64_t v6 = v3;
  uint64_t v7 = v16;
  uint64_t *v12 = v6;
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v5);
}

uint64_t sub_1AFA43FCC()
{
  return sub_1AFA53BE8();
}

uint64_t sub_1AFA44000@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_1AFA457A8(a1, &v6);
  uint64_t v5 = v6;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5D80);
  *a2 = MEMORY[0x1B3E85A60](v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AFA4405C()
{
  if (qword_1E9AF5F80 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6628);
}

uint64_t sub_1AFA440D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v15 = a1;
  uint64_t v28 = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F08);
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v13 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v22, v2, v3, v4);
  uint64_t v21 = (char *)&v13 - v13;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F80);
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v14 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x1F4188790](v15, v5, v6, v7);
  unint64_t v25 = (char *)&v13 - v14;
  uint64_t v28 = v8;
  unint64_t v18 = sub_1AFA44EC4();
  sub_1AFA53C28();
  char v27 = 1;
  sub_1AFA53C18();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EF0);
  v16[3] = v9;
  unint64_t v10 = sub_1AFA44FC0();
  unint64_t v11 = v16;
  v16[4] = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  sub_1AFA45210();
  sub_1AFA53BD8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v25, v26);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AFA442BC()
{
}

uint64_t sub_1AFA442E8()
{
  v17[1] = 0;
  uint64_t v29 = MEMORY[0x1E4F42228];
  uint64_t v34 = MEMORY[0x1E4F42238];
  id v53 = 0;
  uint64_t v52 = 0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA0);
  uint64_t v36 = *(void *)(v40 - 8);
  uint64_t v37 = v40 - 8;
  unint64_t v18 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x1F4188790](0, v0, v1, v2);
  uint64_t v38 = (char *)v17 - v18;
  unint64_t v19 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3, (char *)v17 - v18, v5, v6);
  uint64_t v39 = (char *)v17 - v19;
  id v53 = (char *)v17 - v19;
  uint64_t v27 = sub_1AFA53E88();
  uint64_t v24 = *(void *)(v27 - 8);
  uint64_t v25 = v27 - 8;
  unint64_t v20 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v27, v7, v8, v9);
  uint64_t v26 = (char *)v17 - v20;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2F98);
  uint64_t v30 = *(void *)(v44 - 8);
  uint64_t v31 = v44 - 8;
  uint64_t v22 = *(void *)(v30 + 64);
  unint64_t v21 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v44, v10, v11, v12);
  uint64_t v32 = (char *)v17 - v21;
  unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)v17 - v21, v13, v14, v15);
  uint64_t v43 = (char *)v17 - v23;
  uint64_t v52 = (char *)v17 - v23;
  sub_1AFA53E98();
  uint64_t v28 = MEMORY[0x1E4F42278];
  MEMORY[0x1B3E85810](v26, v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v27);
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v32, v43, v44);
  uint64_t v50 = v27;
  uint64_t v51 = v28;
  uint64_t v35 = 1;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1B3E85830](v32, v44);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v30 + 8);
  uint64_t v45 = v30 + 8;
  v46(v32, v44);
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v38, v39, v40);
  uint64_t v48 = v44;
  uint64_t v49 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v47 = sub_1AFA53E58();
  unint64_t v42 = *(void (**)(char *, uint64_t))(v36 + 8);
  uint64_t v41 = v36 + 8;
  v42(v38, v40);
  v42(v39, v40);
  v46(v43, v44);
  return v47;
}

uint64_t sub_1AFA44708()
{
  return sub_1AFA53F48();
}

uint64_t sub_1AFA44740()
{
  return sub_1AFA433EC();
}

uint64_t sub_1AFA44758()
{
  return sub_1AFA53DA8();
}

uint64_t sub_1AFA447C0()
{
  return sub_1AFA53DC8();
}

uint64_t sub_1AFA447D8()
{
  return sub_1AFA44708();
}

uint64_t sub_1AFA447F0()
{
  return sub_1AFA53DB8();
}

uint64_t sub_1AFA44808()
{
  return sub_1AFA4341C();
}

uint64_t sub_1AFA44820()
{
  return sub_1AFA442E8();
}

uint64_t sub_1AFA44838@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AFA433EC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_1AFA44868()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  __swift_allocate_value_buffer(v1, qword_1E9AF6628);
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9AF6628);
  sub_1AFA53FE8();
  sub_1AFA53E78();
  sub_1AFA541E8();
  return sub_1AFA53F38();
}

uint64_t sub_1AFA44944@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4405C();
  swift_beginAccess();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
  return swift_endAccess();
}

uint64_t sub_1AFA449CC(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v6 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13, v1, v2, v3);
  uint64_t v8 = (char *)&v5 - v6;
  uint64_t v7 = sub_1AFA4405C();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v12, v13);
  uint64_t v9 = &v14;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 40))(v7, v8, v13);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t sub_1AFA44B18()
{
  sub_1AFA4405C();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FA8);
  sub_1AFA53F18();
  swift_endAccess();
  return v1 & 1;
}

uint64_t sub_1AFA44B8C()
{
  return swift_endAccess();
}

uint64_t sub_1AFA44C28()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  __swift_allocate_value_buffer(v1, qword_1E9AF6640);
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9AF6640);
  sub_1AFA53FE8();
  return sub_1AFA53EF8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_1AFA44DA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA438A0();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

unint64_t sub_1AFA44E0C()
{
  return sub_1AFA44E24();
}

unint64_t sub_1AFA44E24()
{
  uint64_t v2 = qword_1E9AF2FB8;
  if (!qword_1E9AF2FB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA44EA4()
{
  return MEMORY[0x1E4FBB1B0];
}

void *type metadata accessor for AddToYourEmailTip()
{
  return &unk_1F0816B10;
}

unint64_t sub_1AFA44EC4()
{
  uint64_t v2 = qword_1E9AF2F78;
  if (!qword_1E9AF2F78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F80);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F78);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

unint64_t sub_1AFA44FC0()
{
  uint64_t v2 = qword_1E9AF2EE8;
  if (!qword_1E9AF2EE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2EF0);
    sub_1AFA45064();
    sub_1AFA450E8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2EE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45064()
{
  uint64_t v2 = qword_1E9AF2F70;
  if (!qword_1E9AF2F70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F80);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA450E8()
{
  uint64_t v2 = qword_1E9AF2EF8;
  if (!qword_1E9AF2EF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2EF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    uint64_t result = v2;
    uint64_t *v3 = v1;
  }
  return result;
}

unint64_t sub_1AFA45210()
{
  uint64_t v2 = qword_1E9AF2F00;
  if (!qword_1E9AF2F00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45294()
{
  uint64_t v2 = qword_1E9AF2F58;
  if (!qword_1E9AF2F58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F68);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45318()
{
  return sub_1AFA43DC0();
}

unint64_t sub_1AFA45330()
{
  return sub_1AFA43E44();
}

unint64_t sub_1AFA45348()
{
  uint64_t v2 = qword_1E9AF2F28;
  if (!qword_1E9AF2F28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F38);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA453CC()
{
  uint64_t v2 = qword_1E9AF2ED8;
  if (!qword_1E9AF2ED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2EE0);
    sub_1AFA45470();
    sub_1AFA4561C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2ED8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45470()
{
  uint64_t v2 = qword_1E9AF2F48;
  if (!qword_1E9AF2F48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F50);
    sub_1AFA45504();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45504()
{
  uint64_t v2 = qword_1E9AF2F30;
  if (!qword_1E9AF2F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F38);
    sub_1AFA45598();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45598()
{
  uint64_t v2 = qword_1E9AF2F60;
  if (!qword_1E9AF2F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F68);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA4561C()
{
  uint64_t v2 = qword_1E9AF2F10;
  if (!qword_1E9AF2F10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA456A0()
{
  uint64_t v2 = qword_1E9AF2F40;
  if (!qword_1E9AF2F40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F50);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA45724()
{
  uint64_t v2 = qword_1E9AF2F18;
  if (!qword_1E9AF2F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2F20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2F18);
    return WitnessTable;
  }
  return v2;
}

void *sub_1AFA457A8(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  sub_1AFA53E28();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t sub_1AFA457E0()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1AFA45848(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation);
  swift_beginAccess();
  void *v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_1AFA458C8())()
{
  return sub_1AFA45934;
}

uint64_t sub_1AFA45934()
{
  return swift_endAccess();
}

uint64_t sub_1AFA45974()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1B3E87490](v2);
  swift_endAccess();
  return v3;
}

void sub_1AFA459DC(void *a1)
{
  id v1 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
}

void (*sub_1AFA45A5C(void *a1))(id **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  void v5[4] = v1;
  uint64_t v2 = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  v5[5] = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_presentingController;
  uint64_t v4 = v1 + v2;
  swift_beginAccess();
  void v5[3] = MEMORY[0x1B3E87490](v4);
  return sub_1AFA45B00;
}

void sub_1AFA45B00(id **a1, char a2)
{
  uint64_t v5 = *a1;
  if (a2)
  {
    id v3 = v5[3];
    id v2 = v3;
    swift_unknownObjectWeakAssign();

    sub_1AFA466D4(v5 + 3);
  }
  else
  {
    id v4 = v5[3];
    swift_unknownObjectWeakAssign();
  }
  swift_endAccess();
  free(v5);
}

uint64_t sub_1AFA45BB4()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1B3E87490](v2);
  swift_endAccess();
  return v3;
}

void sub_1AFA45C1C(void *a1)
{
  id v1 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
}

void (*sub_1AFA45C9C(void *a1))(id **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  void v5[4] = v1;
  uint64_t v2 = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  v5[5] = OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipPopoverController;
  uint64_t v4 = v1 + v2;
  swift_beginAccess();
  void v5[3] = MEMORY[0x1B3E87490](v4);
  return sub_1AFA45B00;
}

uint64_t sub_1AFA45D40()
{
  uint64_t v4 = (char *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
  swift_beginAccess();
  char v5 = *v4;
  uint64_t result = swift_endAccess();
  if (v5)
  {
    nullsub_1(result);
    uint64_t v2 = (unsigned char *)(v3 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
    swift_beginAccess();
    unsigned char *v2 = 0;
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1AFA45E08()
{
  uint64_t v2 = (unsigned char *)(v0 + OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip);
  swift_beginAccess();
  unsigned char *v2 = 0;
  return swift_endAccess();
}

uint64_t (*sub_1AFA45E70(void *a1))()
{
  *a1 = v1;
  sub_1AFA45D40();
  return sub_1AFA45EC8;
}

uint64_t sub_1AFA45EC8()
{
  return sub_1AFA45E08();
}

id MessageUITipsManager.__allocating_init(with:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return MessageUITipsManager.init(with:)(a1);
}

id MessageUITipsManager.init(with:)(void *a1)
{
  char v14 = a1;
  id v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = v1;
  char v5 = v1;
  unint64_t v6 = v1;
  id v15 = v1;
  *(void *)&v1[OBJC_IVAR____TtC9MessageUI20MessageUITipsManager_tipObservation] = 0;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();

  v1[OBJC_IVAR____TtC9MessageUI20MessageUITipsManager____lazy_storage___addToYourEmailTip] = 1;
  id v7 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
  v13.receiver = v15;
  v13.super_class = (Class)type metadata accessor for MessageUITipsManager();
  id v12 = objc_msgSendSuper2(&v13, sel_init);
  id v8 = v12;
  id v15 = v12;

  return v12;
}

uint64_t type metadata accessor for MessageUITipsManager()
{
  return self;
}

uint64_t sub_1AFA46144()
{
  uint64_t v52 = sub_1AFA48CB8;
  uint64_t v53 = MEMORY[0x1E4FBCFD8];
  uint64_t v54 = &unk_1E9AF5DB0;
  uint64_t v70 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = sub_1AFA53D78();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v56, v1, v2, v3);
  long long v60 = (char *)v28 - v59;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC8);
  unint64_t v61 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v4, v5, v6, v7);
  long long v62 = (char *)v28 - v61;
  uint64_t v70 = v0;
  uint64_t v69 = sub_1AFA45974();
  BOOL v50 = v69 != 0;
  BOOL v49 = v50;
  sub_1AFA466D4((id *)&v69);
  if (v49)
  {
    uint64_t v47 = 0;
    uint64_t v8 = sub_1AFA540F8();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 56))(v62, 1);
    id v9 = v51;
    sub_1AFA540D8();
    uint64_t v10 = sub_1AFA540C8();
    id v11 = v51;
    uint64_t v48 = v10;
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v53;
    uint64_t v14 = (uint64_t)v54;
    id v15 = (void *)v12;
    uint64_t v16 = (uint64_t)v62;
    v15[2] = v48;
    v15[3] = v13;
    v15[4] = v11;
    uint64_t v17 = sub_1AFA46F08(v16, v14, (uint64_t)v15, MEMORY[0x1E4FBC848] + 8);
    return sub_1AFA45848(v17);
  }
  else
  {
    unint64_t v19 = v60;
    uint64_t v20 = sub_1AFA46700();
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v19, v20, v56);
    uint64_t v45 = sub_1AFA53D58();
    int v44 = sub_1AFA54128();
    unint64_t v42 = &v67;
    uint64_t v67 = 2;
    unint64_t v40 = sub_1AFA46770();
    unint64_t v41 = sub_1AFA467EC();
    sub_1AFA46868();
    sub_1AFA54058();
    uint32_t v43 = v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF3000);
    uint64_t v46 = sub_1AFA541E8();
    if (os_log_type_enabled(v45, (os_log_type_t)v44))
    {
      uint64_t v21 = v55;
      uint64_t v30 = (uint8_t *)sub_1AFA54158();
      v28[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FD8);
      uint64_t v29 = 0;
      uint64_t v31 = sub_1AFA48BFC(0);
      uint64_t v32 = sub_1AFA48BFC(v29);
      uint64_t v36 = &v66;
      v66 = v30;
      uint64_t v37 = &v65;
      uint64_t v65 = v31;
      uint64_t v34 = &v64;
      uint64_t v64 = v32;
      unsigned int v33 = 0;
      sub_1AFA48C58(0, &v66);
      sub_1AFA48C58(v33, v36);
      uint64_t v63 = v46;
      uint64_t v35 = v28;
      MEMORY[0x1F4188790](v28, v22, v23, v24);
      uint64_t v25 = v37;
      uint64_t v26 = &v28[-6];
      uint64_t v38 = &v28[-6];
      v26[2] = v36;
      v26[3] = v25;
      v26[4] = v27;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FC8);
      sub_1AFA48CE8();
      sub_1AFA54048();
      if (v21)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AF945000, v45, (os_log_type_t)v44, "Trying to observe tip display changes with no MFMailComposeController instance", v30, v43);
        v28[0] = 0;
        sub_1AFA48D6C(v31);
        sub_1AFA48D6C(v32);
        sub_1AFA54138();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v60, v56);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AFA466D4(id *a1)
{
}

uint64_t sub_1AFA46700()
{
  if (qword_1E9AF5F60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53D78();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF5F68);
}

unint64_t sub_1AFA46770()
{
  uint64_t v2 = qword_1E9AF2FF8;
  if (!qword_1E9AF2FF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FF8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA467EC()
{
  uint64_t v2 = qword_1E9AF2FF0;
  if (!qword_1E9AF2FF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA46868()
{
  uint64_t v2 = qword_1E9AF2FC0;
  if (!qword_1E9AF2FC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA468E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 32) = a4;
  *(void *)(v4 + 16) = v4;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 128) = 0;
  *(void *)(v4 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FE8);
  *(void *)(v4 + 48) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FE0);
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = *(void *)(v5 - 8);
  *(void *)(v4 + 72) = swift_task_alloc();
  *(void *)(v4 + 24) = a4;
  *(void *)(v4 + 80) = sub_1AFA540D8();
  *(void *)(v4 + 88) = sub_1AFA540C8();
  uint64_t v9 = sub_1AFA540B8();
  *(void *)(v4 + 96) = v9;
  *(void *)(v4 + 104) = v6;
  return MEMORY[0x1F4188298](sub_1AFA46A60, v9, v6);
}

uint64_t sub_1AFA46A60()
{
  uint64_t v6 = MEMORY[0x1E4FBCFD8];
  *(void *)(v0 + 16) = v0;
  sub_1AFA45D40();
  sub_1AFA49054();
  sub_1AFA53D98();
  sub_1AFA54178();
  uint64_t v5 = sub_1AFA540C8();
  *(void *)(v0 + 112) = v5;
  uint64_t v1 = (void *)swift_task_alloc();
  v4[15] = v1;
  void *v1 = v4[2];
  v1[1] = sub_1AFA46B94;
  uint64_t v2 = v4[7];
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))MEMORY[0x1F4187FD8])((char *)v4 + 129, v5, v6, v2);
}

uint64_t sub_1AFA46B94()
{
  uint64_t v5 = *v1;
  *(void *)(*v1 + 16) = *v1;
  uint64_t result = swift_task_dealloc();
  if (!v0)
  {
    swift_unknownObjectRelease();
    uint64_t v3 = *(void *)(v5 + 104);
    uint64_t v4 = *(void *)(v5 + 96);
    return MEMORY[0x1F4188298](sub_1AFA46CEC, v4, v3);
  }
  return result;
}

uint64_t sub_1AFA46CEC()
{
  uint64_t v7 = MEMORY[0x1E4FBCFD8];
  *(void *)(v0 + 16) = v0;
  int v8 = *(unsigned __int8 *)(v0 + 129);
  if (v8 == 2)
  {
    (*(void (**)(void))(*(void *)(v6 + 64) + 8))();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v6 + 16) + 8);
    return v1();
  }
  else
  {
    *(unsigned char *)(v6 + 128) = v8 & 1;
    if (v8) {
      sub_1AFA472CC();
    }
    else {
      sub_1AFA48040();
    }
    uint64_t v5 = sub_1AFA540C8();
    *(void *)(v6 + 112) = v5;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v6 + 120) = v3;
    void *v3 = *(void *)(v6 + 16);
    v3[1] = sub_1AFA46B94;
    uint64_t v4 = *(void *)(v6 + 56);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1F4187FD8])(v6 + 129, v5, v7, v4);
  }
}

uint64_t sub_1AFA46F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = sub_1AFA540F8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_1AFA4A724(a1);
  }
  else
  {
    sub_1AFA540E8();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  uint64_t v6 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    sub_1AFA540B8();
    swift_unknownObjectRelease();
  }
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = a4;
  void v5[3] = a2;
  void v5[4] = a3;
  return swift_task_create();
}

void sub_1AFA471C0()
{
  if (sub_1AFA457E0())
  {
    swift_retain();
    sub_1AFA49028();
    sub_1AFA54108();
    swift_release();
  }
  else
  {
    sub_1AFA49028();
  }
  sub_1AFA45848(0);
  sub_1AFA459DC(0);
}

void sub_1AFA472CC()
{
  v98 = "Fatal error";
  v99 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v100 = "MessageUI/MessageUITipsManager.swift";
  v101 = sub_1AFA48CB8;
  uint64_t v139 = 0;
  uint64_t v102 = 0;
  id v132 = 0;
  v127 = 0;
  double v126 = 0.0;
  v121 = 0;
  uint64_t v103 = sub_1AFA53D78();
  uint64_t v104 = *(void *)(v103 - 8);
  uint64_t v105 = v103 - 8;
  unint64_t v106 = (*(void *)(v104 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v103, v1, v2, v3);
  v107 = (char *)v28 - v106;
  uint64_t v139 = v0;
  id v108 = (id)sub_1AFA45974();
  if (!v108)
  {
LABEL_36:
    uint64_t v16 = v107;
    uint64_t v17 = sub_1AFA46700();
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v16, v17, v103);
    uint64_t v45 = sub_1AFA53D58();
    int v44 = sub_1AFA54128();
    unint64_t v42 = &v137;
    uint64_t v137 = 2;
    unint64_t v40 = sub_1AFA46770();
    unint64_t v41 = sub_1AFA467EC();
    sub_1AFA46868();
    sub_1AFA54058();
    uint32_t v43 = v138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF3000);
    uint64_t v46 = sub_1AFA541E8();
    if (os_log_type_enabled(v45, (os_log_type_t)v44))
    {
      uint64_t v18 = v102;
      uint64_t v30 = (uint8_t *)sub_1AFA54158();
      v28[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FD8);
      uint64_t v29 = 0;
      uint64_t v31 = sub_1AFA48BFC(0);
      uint64_t v32 = sub_1AFA48BFC(v29);
      uint64_t v36 = &v136;
      v136 = v30;
      uint64_t v37 = &v135;
      uint64_t v135 = v31;
      uint64_t v34 = &v134;
      uint64_t v134 = v32;
      unsigned int v33 = 0;
      sub_1AFA48C58(0, &v136);
      sub_1AFA48C58(v33, v36);
      uint64_t v133 = v46;
      uint64_t v35 = v28;
      MEMORY[0x1F4188790](v28, v19, v20, v21);
      uint64_t v22 = v37;
      uint64_t v23 = &v28[-6];
      uint64_t v38 = &v28[-6];
      void v23[2] = v36;
      v23[3] = v22;
      v23[4] = v24;
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FC8);
      sub_1AFA48CE8();
      sub_1AFA54048();
      if (v18)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AF945000, v45, (os_log_type_t)v44, "Trying to present more than one MiniTipPopoverViewController", v30, v43);
        v28[0] = 0;
        sub_1AFA48D6C(v31);
        sub_1AFA48D6C(v32);
        sub_1AFA54138();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v103);
    return;
  }
  id v97 = v108;
  id v96 = v108;
  id v132 = v108;
  id v131 = objc_msgSend(v108, sel_presentedViewController);
  BOOL v95 = v131 == 0;
  BOOL v94 = v95;
  sub_1AFA466D4(&v131);
  if (!v94 || (v130 = sub_1AFA45BB4(), BOOL v93 = v130 == 0, v92 = v93, sub_1AFA466D4((id *)&v130), !v92))
  {

    goto LABEL_36;
  }
  uint64_t v90 = sub_1AFA53DE8();
  sub_1AFA45D40();
  v128 = &unk_1F0816B10;
  unint64_t v129 = sub_1AFA49054();
  id v91 = objc_msgSend(v96, sel_view);
  if (v91)
  {
    id v89 = v91;
  }
  else
  {
    char v25 = 2;
    uint64_t v26 = 66;
    int v27 = 0;
    sub_1AFA54198();
    __break(1u);
  }
  id v80 = v89;
  sub_1AFA47DBC();
  id v81 = (void *)sub_1AFA53DF8();
  v127 = v81;
  double v82 = *MEMORY[0x1E4FB2C68];
  double v83 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
  id v84 = objc_msgSend(v96, sel_traitCollection);
  id v85 = objc_msgSend(v84, sel_horizontalSizeClass);

  uint64_t v88 = &v125;
  id v125 = v85;
  v86 = &v124;
  uint64_t v124 = 1;
  uint64_t v87 = type metadata accessor for UIUserInterfaceSizeClass();
  sub_1AFA49174();
  if (sub_1AFA541F8())
  {
    id v79 = objc_msgSend(v96, sel_view);
    if (v79)
    {
      id v78 = v79;
    }
    else
    {
      char v25 = 2;
      uint64_t v26 = 72;
      int v27 = 0;
      sub_1AFA54198();
      __break(1u);
    }
    id v73 = v78;
    objc_msgSend(v78, sel_bounds);
    double v109 = v4;
    double v110 = v5;
    double v111 = v6;
    double v112 = v7;
    double v74 = v4;
    double v75 = v5;
    double v76 = v6;
    double v77 = v7;

    double v126 = sub_1AFA47DD8(v74, v75, v76, v77);
  }
  else
  {
    double v126 = v82;
  }
  int v8 = v81;
  id v9 = v81;
  double v122 = v126;
  double v123 = v83;
  objc_msgSend(v8, sel_setPreferredContentSize_, v126, v83);

  id v72 = (id)sub_1AFA53DD8();
  if (v72)
  {
    id v71 = v72;
    id v70 = v72;
    objc_msgSend(v72, sel_setPermittedArrowDirections_, 2);
  }
  id v10 = v96;
  self;
  uint64_t v69 = swift_dynamicCastObjCClass();
  if (v69)
  {
    uint32_t v68 = (void *)v69;
  }
  else
  {
    uint64_t v67 = 0;

    uint32_t v68 = v67;
  }
  v66 = v68;
  if (v68)
  {
    uint64_t v65 = v66;
    id v63 = v66;
    v121 = v66;
    uint64_t v64 = (void *)sub_1AFA53DD8();
    if (v64)
    {
      long long v62 = v64;
      id v60 = v64;
      id v61 = objc_msgSend(v63, sel_mailComposeView);
      if (v61)
      {
        id v59 = v61;
      }
      else
      {
        char v25 = 2;
        uint64_t v26 = 81;
        int v27 = 0;
        sub_1AFA54198();
        __break(1u);
      }
      id v53 = v59;
      id v54 = objc_msgSend(v59, sel_keyboardLayoutGuide);

      objc_msgSend(v54, sel_layoutFrame);
      double v117 = v11;
      double v118 = v12;
      double v119 = v13;
      double v120 = v14;
      double v55 = v11;
      double v56 = v12;
      double v57 = v13;
      double v58 = v14;

      double v113 = v55;
      double v114 = v56;
      double v115 = v57;
      double v116 = v58;
      objc_msgSend(v60, sel_setSourceRect_, v55, v56, v57, v58);
    }
  }
  uint64_t v52 = (void *)sub_1AFA53DD8();
  if (v52)
  {
    id v51 = v52;
    id v50 = v52;
    id v47 = objc_msgSend(v96, sel_view);
    uint64_t v48 = sub_1AFA47E18(v47);

    sub_1AFA491F8();
    id v49 = (id)sub_1AFA54068();
    swift_bridgeObjectRelease();
    objc_msgSend(v50, sel_setPassthroughViews_, v49);
  }
  objc_msgSend(v96, sel_presentViewController_animated_completion_, v81, 1, 0);
  id v15 = v81;
  sub_1AFA45C1C(v81);
}

uint64_t (*sub_1AFA47DBC())()
{
  return nullsub_1;
}

CGFloat sub_1AFA47DD8(double a1, double a2, double a3, double a4)
{
  return CGRectGetWidth(*(CGRect *)&a1);
}

uint64_t sub_1AFA47E18(void *a1)
{
  id v1 = a1;
  if (!a1)
  {
    sub_1AFA491F8();
    return sub_1AFA541E8();
  }
  id v15 = objc_msgSend(a1, sel_superview);
  if (!v15) {
    goto LABEL_8;
  }
  uint64_t ObjectType = swift_getObjectType();
  if (ObjectType == sub_1AFA49260())
  {

LABEL_8:
    sub_1AFA491F8();
    uint64_t v10 = sub_1AFA541E8();
    id v9 = v6;
    id v7 = a1;
    void *v9 = a1;
    sub_1AFA48B0C();

    return v10;
  }
  id v3 = v15;
  sub_1AFA47E18(v15);

  sub_1AFA491F8();
  sub_1AFA541E8();
  double v11 = v4;
  id v5 = a1;
  *double v11 = a1;
  sub_1AFA48B0C();
  uint64_t v12 = sub_1AFA54088();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

void sub_1AFA48040()
{
  uint64_t v37 = sub_1AFA48CB8;
  uint64_t v51 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = sub_1AFA53D78();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = v39 - 8;
  unint64_t v42 = (*(void *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39, v1, v2, v3);
  uint32_t v43 = (char *)v14 - v42;
  uint64_t v51 = v0;
  uint64_t v50 = sub_1AFA45BB4();
  BOOL v36 = v50 != 0;
  BOOL v35 = v36;
  sub_1AFA466D4((id *)&v50);
  if (v35)
  {
    v44[0] = (id)sub_1AFA45BB4();
    if (v44[0])
    {
      unsigned int v33 = v44;
      id v34 = v44[0];
      id v4 = v44[0];
      sub_1AFA466D4(v33);
      objc_msgSend(v34, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
    else
    {
      sub_1AFA466D4(v44);
    }
    sub_1AFA45C1C(0);
  }
  else
  {
    id v5 = v43;
    uint64_t v6 = sub_1AFA46700();
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v5, v6, v39);
    uint64_t v31 = sub_1AFA53D58();
    int v30 = sub_1AFA54128();
    uint64_t v28 = &v48;
    uint64_t v48 = 2;
    unint64_t v26 = sub_1AFA46770();
    unint64_t v27 = sub_1AFA467EC();
    sub_1AFA46868();
    sub_1AFA54058();
    uint32_t v29 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF3000);
    uint64_t v32 = (void *)sub_1AFA541E8();
    if (os_log_type_enabled(v31, (os_log_type_t)v30))
    {
      uint64_t v7 = v38;
      uint64_t v16 = (uint8_t *)sub_1AFA54158();
      v14[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FD8);
      uint64_t v15 = 0;
      uint64_t v17 = sub_1AFA48BFC(0);
      uint64_t v18 = sub_1AFA48BFC(v15);
      uint64_t v22 = &v47;
      id v47 = v16;
      uint64_t v23 = &v46;
      uint64_t v46 = v17;
      uint64_t v20 = &v45;
      uint64_t v45 = v18;
      unsigned int v19 = 0;
      sub_1AFA48C58(0, &v47);
      sub_1AFA48C58(v19, v22);
      v44[1] = v32;
      uint64_t v21 = v14;
      MEMORY[0x1F4188790](v14, v8, v9, v10);
      double v11 = v23;
      uint64_t v12 = &v14[-6];
      uint64_t v24 = &v14[-6];
      v12[2] = v22;
      v12[3] = v11;
      void v12[4] = v13;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2FC8);
      sub_1AFA48CE8();
      sub_1AFA54048();
      if (v7)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1AF945000, v31, (os_log_type_t)v30, "Could not dismiss Tip, no existing view controller", v16, v29);
        v14[1] = 0;
        sub_1AFA48D6C(v17);
        sub_1AFA48D6C(v18);
        sub_1AFA54138();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v39);
  }
}

uint64_t static MessageUITipsManager.setShouldDisplay(to:)()
{
  return sub_1AFA44B8C();
}

uint64_t static MessageUITipsManager.donateHasUsedAttachment()()
{
  uint64_t v11 = 0;
  uint64_t v10 = sub_1AFA53EA8();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v6 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v10, v0, v1, v2);
  uint64_t v9 = (char *)&v5 - v6;
  uint64_t v11 = v3;
  nullsub_1((char *)&v5 - v6);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F422A0], v10);
  sub_1AFA49054();
  sub_1AFA53D88();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v10);
}

uint64_t static MessageUITipsManager.donateHasSentEmailEvent()()
{
  uint64_t v13 = 0;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF2EC0);
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v12, v0, v1, v2);
  uint64_t v3 = (char *)&v7 - v8;
  uint64_t v11 = (char *)&v7 - v8;
  uint64_t v13 = v4;
  uint64_t v5 = sub_1AFA438A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v3, v5, v12);
  sub_1AFA53EE8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v12);
}

id MessageUITipsManager.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MessageUITipsManager.init()()
{
  if (!"MessageUI.MessageUITipsManager")
  {
    sub_1AFA54198();
    __break(1u);
  }
  uint64_t result = sub_1AFA4964C((uint64_t)"MessageUI.MessageUITipsManager", 30, (unint64_t)"init()", 6, 2, (unint64_t)"MessageUI/MessageUITipsManager.swift", 36, 2, v1, 0xFuLL, 0x1BuLL);
  __break(1u);
  return result;
}

id MessageUITipsManager.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageUITipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AFA48A44()
{
  uint64_t v1 = sub_1AFA53D78();
  __swift_allocate_value_buffer(v1, qword_1E9AF5F68);
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9AF5F68);
  return sub_1AFA48A90();
}

uint64_t sub_1AFA48A90()
{
  return sub_1AFA53D68();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AFA48B0C()
{
}

void sub_1AFA48B50(uint64_t a1@<X8>)
{
  sub_1AFA48B8C();
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2 & 1;
}

void sub_1AFA48BB0(void *a1@<X8>)
{
  sub_1AFA48BE0();
  *a1 = v1;
}

uint64_t sub_1AFA48BFC(uint64_t a1)
{
  if (a1) {
    return sub_1AFA54158();
  }
  else {
    return 0;
  }
}

uint64_t sub_1AFA48C58(uint64_t result, unsigned char **a2)
{
  char v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1AFA48C6C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1AFA48CB8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return sub_1AFA48C6C(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_1AFA48CE8()
{
  uint64_t v2 = qword_1E9AF2FD0;
  if (!qword_1E9AF2FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF2FC8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA48D6C(uint64_t result)
{
  if (result)
  {
    sub_1AFA54148();
    return sub_1AFA54138();
  }
  return result;
}

uint64_t sub_1AFA48DDC()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AFA48E24(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  void *v3 = *(void *)(v5 + 16);
  v3[1] = sub_1AFA48EFC;
  return sub_1AFA468E4(a1, v6, v7, v8);
}

uint64_t sub_1AFA48EFC()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AFA49028()
{
}

unint64_t sub_1AFA49054()
{
  uint64_t v2 = qword_1E9AF2FB0;
  if (!qword_1E9AF2FB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF2FB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for UIUserInterfaceSizeClass()
{
  uint64_t v4 = qword_1E9AF5DD0;
  if (!qword_1E9AF5DD0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9AF5DD0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_1AFA49174()
{
  uint64_t v2 = qword_1E9AF5DB8;
  if (!qword_1E9AF5DB8)
  {
    type metadata accessor for UIUserInterfaceSizeClass();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF5DB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1AFA491F8()
{
  uint64_t v2 = qword_1E9AF5DC0;
  if (!qword_1E9AF5DC0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9AF5DC0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1AFA49260()
{
  uint64_t v2 = qword_1E9AF5DC8;
  if (!qword_1E9AF5DC8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9AF5DC8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1AFA492C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1AFA49300(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  sub_1AFA541A8();
  __break(1u);
LABEL_12:
  uint64_t result = sub_1AFA54198();
  __break(1u);
  return result;
}

uint64_t sub_1AFA4964C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  uint64_t v31 = sub_1AFA49F10;
  uint64_t v32 = sub_1AFA49F54;
  unsigned int v33 = "Fatal error";
  id v34 = "Unexpectedly found nil while unwrapping an Optional value";
  BOOL v35 = "Swift/StaticString.swift";
  BOOL v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  uint64_t v38 = "UnsafeBufferPointer with negative count";
  uint64_t v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        unsigned int v19 = v18;
        uint64_t v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x1F4188790](v32, v18, v20, a4);
        uint64_t v16 = v31;
        uint64_t v17 = &v41;
        sub_1AFA49300(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      sub_1AFA54198();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    sub_1AFA54198();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  v18[0] = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    sub_1AFA54198();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_1AFA49B38(v18[0], v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = sub_1AFA541A8();
  __break(1u);
  return result;
}

uint64_t method lookup function for MessageUITipsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageUITipsManager.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of MessageUITipsManager.controllerDidAppear()()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xD8))();
}

uint64_t dispatch thunk of MessageUITipsManager.controllerDidDisappear()()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xE0))();
}

uint64_t sub_1AFA49B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = sub_1AFA4A4CC;
  uint64_t v31 = sub_1AFA49F54;
  uint64_t v32 = "Fatal error";
  unsigned int v33 = "Unexpectedly found nil while unwrapping an Optional value";
  id v34 = "Swift/StaticString.swift";
  BOOL v35 = "Not enough bits to represent the passed value";
  BOOL v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  uint64_t v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        unsigned int v19 = &v17;
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x1F4188790](v31, &v17, v20, a4);
        uint64_t v15 = v30;
        uint64_t v16 = &v40;
        sub_1AFA49300(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      sub_1AFA54198();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    sub_1AFA54198();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    sub_1AFA54198();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_1AFA49F80(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = sub_1AFA541A8();
  __break(1u);
  return result;
}

uint64_t sub_1AFA49F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1AFA49B38(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_1AFA49F54(uint64_t a1, uint64_t a2)
{
  return sub_1AFA492C8(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1AFA49F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    sub_1AFA54198();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_1AFA54198();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_1AFA54198();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                sub_1AFA54198();
                __break(1u);
              }
              sub_1AFA54198();
              __break(1u);
            }
            sub_1AFA54198();
            __break(1u);
          }
          sub_1AFA54198();
          __break(1u);
        }
        sub_1AFA54198();
        __break(1u);
      }
      sub_1AFA54198();
      __break(1u);
    }
    sub_1AFA54198();
    __break(1u);
  }
  uint64_t result = sub_1AFA54198();
  __break(1u);
  return result;
}

uint64_t sub_1AFA4A4CC(uint64_t a1, uint64_t a2)
{
  return sub_1AFA49F80(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_1AFA4A4E8(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  void *v3 = *(void *)(v5 + 16);
  v3[1] = sub_1AFA4A5E8;
  return v6(a1);
}

uint64_t sub_1AFA4A5E8()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

void sub_1AFA4A718()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_1AFA4A724(uint64_t a1)
{
  uint64_t v3 = sub_1AFA540F8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_1AFA4A7D4()
{
  return swift_deallocObject();
}

uint64_t sub_1AFA4A81C(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  int v7 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  void *v3 = *(void *)(v6 + 16);
  v3[1] = sub_1AFA48EFC;
  uint64_t v4 = dword_1E9AF5DD8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1E9AF5DD8 + v4))(a1, v7);
}

uint64_t sub_1AFA4A910()
{
  uint64_t result = sub_1AFA53FE8();
  qword_1E9AF64E8 = result;
  qword_1E9AF64F0 = v1;
  return result;
}

uint64_t *sub_1AFA4A954()
{
  if (qword_1E9AF64E0 != -1) {
    swift_once();
  }
  return &qword_1E9AF64E8;
}

uint64_t sub_1AFA4A9B8()
{
  uint64_t result = sub_1AFA53FE8();
  qword_1E9AF6500 = result;
  qword_1E9AF6508 = v1;
  return result;
}

uint64_t *sub_1AFA4A9FC()
{
  if (qword_1E9AF64F8 != -1) {
    swift_once();
  }
  return &qword_1E9AF6500;
}

uint64_t PhotoPickerItem.assetIdentifier.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetIdentifier);
  sub_1AFA53E28();
  return v2;
}

void *PhotoPickerItem.assetURL.getter@<X0>(void *a1@<X8>)
{
  return sub_1AFA4ACC0((const void *)(v1 + OBJC_IVAR___MFComposePhotoPickerItem_assetURL), a1);
}

void *sub_1AFA4ACC0(const void *a1, void *a2)
{
  uint64_t v6 = sub_1AFA53C58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t PhotoPickerItem.assetData.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetData);
  sub_1AFA4AF90(v2, *(void *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_assetData + 8));
  return v2;
}

uint64_t sub_1AFA4AF04(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1AFA4AF90(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_1AFA4AFDC(result, a2);
  }
  return result;
}

uint64_t sub_1AFA4AFDC(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_retain();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t PhotoPickerItem.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR___MFComposePhotoPickerItem_contentType;
  uint64_t v2 = sub_1AFA53D48();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t PhotoPickerItem.contentIdentifier.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MFComposePhotoPickerItem_contentIdentifier);
  sub_1AFA53E28();
  return v2;
}

uint64_t sub_1AFA4B2F4()
{
  uint64_t v19 = 0;
  uint64_t v15 = sub_1AFA53D48();
  uint64_t v11 = *(void *)(v15 - 8);
  uint64_t v12 = v15 - 8;
  uint64_t v8 = *(void *)(v11 + 64);
  unint64_t v7 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v15, v0, v15, v1);
  uint64_t v13 = (char *)&v6 - v7;
  unint64_t v9 = v7;
  MEMORY[0x1F4188790]((char *)&v6 - v7, v2, v3, v4);
  uint64_t v14 = (char *)&v6 - v9;
  uint64_t v19 = v10;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v6 - v9, v10 + OBJC_IVAR___MFComposePhotoPickerItem_contentType);
  sub_1AFA53D28();
  int v18 = sub_1AFA53D38();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v16 = v11 + 8;
  v17(v13, v15);
  v17(v14, v15);
  return v18 & 1;
}

uint64_t sub_1AFA4B470()
{
  uint64_t result = sub_1AFA53FE8();
  qword_1E9AF6518 = result;
  qword_1E9AF6520 = v1;
  return result;
}

uint64_t *sub_1AFA4B4B4()
{
  if (qword_1E9AF6510 != -1) {
    swift_once();
  }
  return &qword_1E9AF6518;
}

uint64_t static PhotoPickerItem.contentIdentifierPrefix.getter()
{
  uint64_t v1 = *sub_1AFA4B4B4();
  sub_1AFA53E28();
  return v1;
}

id PhotoPickerItem.__allocating_init(assetIdentifier:assetURL:assetData:contentType:)(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  id v7 = objc_allocWithZone(v6);
  return PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(a1, a2, a3, a4, a5, a6);
}

id PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v47 = a1;
  uint64_t v68 = a2;
  uint64_t v67 = a3;
  uint64_t v65 = a4;
  unint64_t v66 = a5;
  uint64_t v64 = a6;
  id v82 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v79 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  uint64_t v76 = 0;
  uint64_t v59 = 0;
  uint64_t v63 = sub_1AFA53D48();
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v62 = v63 - 8;
  unint64_t v39 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v63, v7, v8, v9);
  double v57 = (char *)&v39 - v39;
  unint64_t v40 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x1F4188790](v47, v68, v67, v65);
  uint64_t v41 = (char *)&v39 - v40;
  uint64_t v80 = v10;
  uint64_t v81 = v11;
  uint64_t v79 = v12;
  uint64_t v77 = v13;
  uint64_t v78 = v14;
  uint64_t v76 = v15;
  uint64_t v16 = v6;
  uint64_t v17 = v6;
  int v18 = v6;
  uint64_t v19 = v6;
  unsigned int v20 = v6;
  id v82 = v6;
  sub_1AFA53E28();
  uint64_t v21 = v68;
  uint64_t v22 = &v6[OBJC_IVAR___MFComposePhotoPickerItem_assetIdentifier];
  *(void *)uint64_t v22 = v47;
  *((void *)v22 + 1) = v21;

  sub_1AFA4ACC0(v67, v41);
  sub_1AFA4BB50(v41, &v6[OBJC_IVAR___MFComposePhotoPickerItem_assetURL]);

  sub_1AFA4AF90(v65, v66);
  id v23 = v58;
  unint64_t v24 = v66;
  uint64_t v25 = &v58[OBJC_IVAR___MFComposePhotoPickerItem_assetData];
  *(void *)uint64_t v25 = v65;
  *((void *)v25 + 1) = v24;

  uint64_t v26 = sub_1AFA541D8();
  id v54 = &v74;
  uint64_t v74 = v26;
  uint64_t v75 = v27;
  uint64_t v51 = "";
  int v52 = 1;
  sub_1AFA53FE8();
  uint64_t v42 = v28;
  sub_1AFA541C8();
  swift_bridgeObjectRelease();
  unint64_t v29 = sub_1AFA4B4B4();
  uint64_t v43 = *v29;
  uint64_t v44 = v29[1];
  sub_1AFA53E28();
  unint64_t v45 = v73;
  v73[0] = v43;
  v73[1] = v44;
  uint64_t v48 = MEMORY[0x1E4FBB1A0];
  uint64_t v49 = MEMORY[0x1E4FBB208];
  uint64_t v50 = MEMORY[0x1E4FBB200];
  sub_1AFA541B8();
  sub_1AFA4BC78();
  sub_1AFA53FE8();
  uint64_t v46 = v30;
  sub_1AFA541C8();
  swift_bridgeObjectRelease();
  uint64_t v71 = v47;
  uint64_t v72 = v68;
  sub_1AFA541B8();
  sub_1AFA53FE8();
  uint64_t v53 = v31;
  sub_1AFA541C8();
  uint64_t v32 = v58;
  swift_bridgeObjectRelease();
  uint64_t v56 = v74;
  uint64_t v55 = v75;
  sub_1AFA53E28();
  sub_1AFA4BC78();
  uint64_t v33 = sub_1AFA53FD8();
  id v34 = (uint64_t *)&v32[OBJC_IVAR___MFComposePhotoPickerItem_contentIdentifier];
  *id v34 = v33;
  v34[1] = v35;

  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v57, v64, v63);
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(&v32[OBJC_IVAR___MFComposePhotoPickerItem_contentType], v57, v63);

  id v60 = v82;
  BOOL v36 = (objc_class *)type metadata accessor for PhotoPickerItem();
  v70.receiver = v60;
  v70.super_class = v36;
  id v69 = objc_msgSendSuper2(&v70, sel_init);
  id v37 = v69;
  id v82 = v69;
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v64, v63);
  sub_1AFA4BD1C(v65, v66);
  sub_1AFA4BD68((uint64_t)v67);
  swift_bridgeObjectRelease();

  return v69;
}

void *sub_1AFA4BB50(const void *a1, void *a2)
{
  uint64_t v6 = sub_1AFA53C58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AFA4BC78()
{
}

uint64_t type metadata accessor for PhotoPickerItem()
{
  uint64_t v1 = qword_1E9AF6528;
  if (!qword_1E9AF6528) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_1AFA4BD1C(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_1AFA4AF04(result, a2);
  }
  return result;
}

uint64_t sub_1AFA4BD68(uint64_t a1)
{
  uint64_t v3 = sub_1AFA53C58();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_1AFA4C13C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v57 = a1;
  uint64_t v48 = 0;
  id v73 = sub_1AFA4CC7C;
  unint64_t v45 = sub_1AFA4CE78;
  uint64_t v46 = sub_1AFA4CEA4;
  uint64_t v47 = sub_1AFA4CF8C;
  uint64_t v87 = 0;
  v86 = 0;
  id v85 = 0;
  id v84 = 0;
  uint64_t v83 = 0;
  uint64_t v82 = 0;
  unint64_t v49 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x1F4188790](0, v2, v3, v4);
  uint64_t v50 = (uint64_t)&v38 - v49;
  unint64_t v51 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x1F4188790](v5, (char *)&v38 - v49, v7, v8);
  uint64_t v52 = (uint64_t)&v38 - v51;
  unint64_t v53 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x1F4188790](v9, (char *)&v38 - v51, v11, v12);
  uint64_t v54 = (uint64_t)&v38 - v53;
  unint64_t v55 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13, (char *)&v38 - v53, v15, v16);
  uint64_t v70 = (uint64_t)&v38 - v55;
  uint64_t v58 = sub_1AFA53D48();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  uint64_t v66 = *(void *)(v59 + 64);
  unint64_t v61 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x1F4188790](v57, v17, v18, v19);
  uint64_t v62 = (char *)&v38 - v61;
  uint64_t v87 = (char *)&v38 - v61;
  unint64_t v63 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = MEMORY[0x1F4188790](v20, v21, v22, v23);
  uint64_t v64 = (char *)&v38 - v63;
  v86 = (char *)&v38 - v63;
  unint64_t v65 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v28 = MEMORY[0x1F4188790](v24, v25, v26, v27);
  uint64_t v67 = (char *)&v38 - v65;
  id v85 = (char *)&v38 - v65;
  unint64_t v68 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = MEMORY[0x1F4188790](v28, v29, v30, v31);
  id v69 = (char *)&v38 - v68;
  id v84 = (char *)&v38 - v68;
  uint64_t v83 = v32;
  uint64_t v82 = v33;
  uint64_t v81 = v32;
  uint64_t v71 = &v76;
  uint64_t v77 = v33;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E00);
  unint64_t v74 = sub_1AFA4CCA8();
  sub_1AFA54038();
  uint64_t v75 = 0;
  uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
  uint64_t v43 = v59 + 48;
  if (v42(v70, 1, v58) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v69, v70, v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v44, v69, v58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v44, 0, 1, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v69, v58);
  }
  uint64_t v35 = v75;
  sub_1AFA4CD2C(v70);
  uint64_t v80 = v57;
  unint64_t v40 = &v38;
  MEMORY[0x1F4188790](v45, &v38, v72, v74);
  *(&v38 - 2) = v56;
  uint64_t result = sub_1AFA54038();
  uint64_t v41 = v35;
  if (v35)
  {
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }
  if (v42(v54, 1, v58) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v67, v54, v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v44, v67, v58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v44, 0, 1, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v67, v58);
  }
  uint64_t v36 = v41;
  sub_1AFA4CD2C(v54);
  uint64_t v79 = v57;
  uint64_t result = sub_1AFA54038();
  uint64_t v39 = v36;
  if (v36) {
    goto LABEL_14;
  }
  if (v42(v52, 1, v58) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v64, v52, v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v44, v64, v58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v44, 0, 1, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v64, v58);
  }
  uint64_t v37 = v39;
  sub_1AFA4CD2C(v52);
  uint64_t v78 = v57;
  uint64_t result = sub_1AFA54038();
  if (v37) {
    goto LABEL_15;
  }
  if (v42(v50, 1, v58) == 1)
  {
    sub_1AFA4CD2C(v50);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v44, 1, 1, v58);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v62, v50, v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v44, v62, v58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v44, 0, 1, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v62, v58);
  }
}

uint64_t sub_1AFA4CBE0()
{
  sub_1AFA53CE8();
  sub_1AFA4A954();
  sub_1AFA53E28();
  char v1 = sub_1AFA53FF8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1AFA4CC7C()
{
  return sub_1AFA4CBE0() & 1;
}

unint64_t sub_1AFA4CCA8()
{
  uint64_t v2 = qword_1E9AF5E08;
  if (!qword_1E9AF5E08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF5E00);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF5E08);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA4CD2C(uint64_t a1)
{
  uint64_t v3 = sub_1AFA53D48();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_1AFA4CDDC()
{
  sub_1AFA53CE8();
  sub_1AFA4A9FC();
  sub_1AFA53E28();
  char v1 = sub_1AFA53FF8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1AFA4CE78()
{
  return sub_1AFA4CDDC() & 1;
}

uint64_t sub_1AFA4CEA4(uint64_t a1)
{
  uint64_t v12 = 0;
  uint64_t v9 = sub_1AFA53D48();
  uint64_t v7 = *(void *)(v9 - 8);
  uint64_t v8 = v9 - 8;
  unint64_t v6 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v9, v2, v3, v4);
  uint64_t v10 = (char *)&v6 - v6;
  uint64_t v12 = a1;
  sub_1AFA53D28();
  int v11 = sub_1AFA53D38();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v9);
  return v11 & 1;
}

uint64_t sub_1AFA4CF8C(uint64_t a1)
{
  uint64_t v12 = 0;
  uint64_t v9 = sub_1AFA53D48();
  uint64_t v7 = *(void *)(v9 - 8);
  uint64_t v8 = v9 - 8;
  unint64_t v6 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v9, v2, v3, v4);
  uint64_t v10 = (char *)&v6 - v6;
  uint64_t v12 = a1;
  sub_1AFA53D18();
  int v11 = sub_1AFA53D38();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v9);
  return v11 & 1;
}

uint64_t sub_1AFA4D208()
{
  sub_1AFA4B4B4();
  sub_1AFA53E28();
  char v3 = sub_1AFA54018();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_1AFA53E28();
  sub_1AFA4B4B4();
  sub_1AFA53E28();
  sub_1AFA54008();
  swift_bridgeObjectRelease();
  sub_1AFA4D35C();
  sub_1AFA54118();
  uint64_t v1 = MEMORY[0x1B3E859F0]();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1AFA4D35C()
{
  uint64_t v2 = qword_1E9AF5E10;
  if (!qword_1E9AF5E10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF5E10);
    return WitnessTable;
  }
  return v2;
}

id PhotoPickerItem.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t PhotoPickerItem.init()()
{
  if (!"MessageUI.PhotoPickerItem")
  {
    sub_1AFA54198();
    __break(1u);
  }
  uint64_t result = sub_1AFA4964C((uint64_t)"MessageUI.PhotoPickerItem", 25, (unint64_t)"init()", 6, 2, (unint64_t)"MessageUI/PhotoPickerItem.swift", 31, 2, v1, 0xCuLL, 0xEuLL);
  __break(1u);
  return result;
}

id PhotoPickerItem.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AFA4D738(uint64_t a1)
{
  if ((*(void *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000) {
    sub_1AFA4AF04(*(void *)a1, *(void *)(a1 + 8));
  }
  return a1;
}

uint64_t sub_1AFA4D78C()
{
  return type metadata accessor for PhotoPickerItem();
}

uint64_t sub_1AFA4D7A8()
{
  uint64_t updated = sub_1AFA4DA08();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_1AFA53D48();
    if (v1 <= 0x3F)
    {
      uint64_t updated = swift_updateClassMetadata2();
      if (!updated) {
        return 0;
      }
    }
  }
  return updated;
}

uint64_t method lookup function for PhotoPickerItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotoPickerItem.isVideo.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x78))() & 1;
}

uint64_t dispatch thunk of PhotoPickerItem.__allocating_init(assetIdentifier:assetURL:assetData:contentType:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static PhotoPickerItem.bestTypeToLoad(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of static PhotoPickerItem.assetIdentifierFromContentIdentifier(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1AFA4DA08()
{
  uint64_t v4 = qword_1E9AF5E18;
  if (!qword_1E9AF5E18)
  {
    sub_1AFA53C58();
    unint64_t v3 = sub_1AFA54168();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_1E9AF5E18);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_1AFA4DAB0()
{
  uint64_t v2 = qword_1E9AF5E28;
  if (!qword_1E9AF5E28)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9AF5E28);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1AFA4DB18()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses);
  swift_beginAccess();
  uint64_t v3 = *v2;
  sub_1AFA53E28();
  swift_endAccess();
  return v3;
}

uint64_t sub_1AFA4DB80(uint64_t a1)
{
  sub_1AFA53E28();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses);
  swift_beginAccess();
  void *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AFA4DC04())()
{
  return sub_1AFA45934;
}

uint64_t sub_1AFA4DCC8()
{
  uint64_t v3 = (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x58))();
  unint64_t v1 = sub_1AFA4DAB0();
  int v4 = MEMORY[0x1B3E85940](v3, MEMORY[0x1E4FBB1A0], v1, MEMORY[0x1E4FBB1B0]);
  swift_bridgeObjectRelease();
  return (v4 ^ 1) & 1;
}

uint64_t sub_1AFA4DD6C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v19 = v3;
  uint64_t v4 = sub_1AFA53E28();
  uint64_t v14 = (*(uint64_t (**)(uint64_t))((*v3 & *MEMORY[0x1E4FBC8C8]) + 0x58))(v4);
  v17[0] = a2;
  v17[1] = a3;
  unint64_t v5 = sub_1AFA4DAB0();
  MEMORY[0x1B3E85960](&v18, v17, v14, MEMORY[0x1E4FBB1A0], v5, MEMORY[0x1E4FBB1B0]);
  sub_1AFA4BC78();
  uint64_t v15 = v18;
  if (v18)
  {
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_cancel);
    uint64_t v9 = (void (*)(void))(*(uint64_t (**)(void))((*v11 & *MEMORY[0x1E4FBC8C8]) + 0x68))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E38);
    sub_1AFA53F58();
    v9();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1AFA53E28();
  id v6 = a1;
  uint64_t v8 = (uint64_t (*)(void))(*(uint64_t (**)(void))((*v11 & *MEMORY[0x1E4FBC8C8]) + 0x68))();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E38);
  sub_1AFA53FA8();
  return v8();
}

uint64_t sub_1AFA4E0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v13 = v2;
  uint64_t v3 = sub_1AFA53E28();
  uint64_t v9 = (*(uint64_t (**)(uint64_t))((*v2 & *MEMORY[0x1E4FBC8C8]) + 0x58))(v3);
  v11[0] = a1;
  v11[1] = a2;
  unint64_t v4 = sub_1AFA4DAB0();
  MEMORY[0x1B3E85960](&v12, v11, v9, MEMORY[0x1E4FBB1A0], v4, MEMORY[0x1E4FBB1B0]);
  sub_1AFA4BC78();
  uint64_t v10 = v12;
  if (v12)
  {
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

void sub_1AFA4E280(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v14 = v2;
  uint64_t v3 = sub_1AFA53E28();
  uint64_t v9 = (*(uint64_t (**)(uint64_t))((*v2 & *MEMORY[0x1E4FBC8C8]) + 0x58))(v3);
  v12[0] = a1;
  v12[1] = a2;
  unint64_t v4 = sub_1AFA4DAB0();
  MEMORY[0x1B3E85960](&v13, v12, v9, MEMORY[0x1E4FBB1A0], v4, MEMORY[0x1E4FBB1B0]);
  sub_1AFA4BC78();
  uint64_t v10 = v13;
  if (v13)
  {
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_cancel);
    unint64_t v5 = (void (*)(void))(*(uint64_t (**)(void))((*v6 & *MEMORY[0x1E4FBC8C8]) + 0x68))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E38);
    sub_1AFA53F58();
    v5();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AFA4E4DC()
{
  uint64_t v4 = (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x58))();
  sub_1AFA4DAB0();
  unsigned int v5 = MEMORY[0x1B3E85940](v4, MEMORY[0x1E4FBB1A0]);
  swift_bridgeObjectRelease();
  uint64_t result = v5;
  if ((v5 & 1) == 0)
  {
    (*(void (**)(void))((*v3 & *MEMORY[0x1E4FBC8C8]) + 0x58))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E38);
    sub_1AFA4E738();
    sub_1AFA54048();
    sub_1AFA442BC();
    uint64_t v2 = (uint64_t (*)(void))(*(uint64_t (**)(void))((*v3 & *MEMORY[0x1E4FBC8C8]) + 0x68))();
    sub_1AFA4E7BC();
    sub_1AFA53F88();
    return v2();
  }
  return result;
}

id sub_1AFA4E6E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), sel_cancel);
}

unint64_t sub_1AFA4E738()
{
  uint64_t v2 = qword_1E9AF5E40;
  if (!qword_1E9AF5E40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9AF5E38);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9AF5E40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1AFA4E7BC()
{
  return 0;
}

id PhotoPickerProgressManager.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PhotoPickerProgressManager.init()()
{
  id v1 = v0;
  uint64_t v8 = v0;
  uint64_t v4 = OBJC_IVAR___MFComposePhotoPickerProgressManager_progresses;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5E20);
  sub_1AFA541E8();
  sub_1AFA4DAB0();
  *(void *)&v5[v4] = sub_1AFA53F68();

  v7.receiver = v8;
  v7.super_class = (Class)type metadata accessor for PhotoPickerProgressManager();
  id v6 = objc_msgSendSuper2(&v7, sel_init);
  id v2 = v6;
  uint64_t v8 = v6;

  return v6;
}

uint64_t type metadata accessor for PhotoPickerProgressManager()
{
  return self;
}

id PhotoPickerProgressManager.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoPickerProgressManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PhotoPickerProgressManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.hasAnyProgress.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x70))() & 1;
}

uint64_t dispatch thunk of PhotoPickerProgressManager.setProgress(_:for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x78))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.progress(for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x80))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.cancelProgress(for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x88))();
}

uint64_t dispatch thunk of PhotoPickerProgressManager.cancelEverything()()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x90))();
}

uint64_t SwiftHelloMessageUI.world.getter()
{
  return sub_1AFA53FE8();
}

Swift::String __swiftcall SwiftHelloMessageUI.world(truncated:)(Swift::Int truncated)
{
  SwiftHelloMessageUI.world.getter();
  uint64_t v12 = (void *)sub_1AFA53FB8();
  id v13 = objc_msgSend(v12, sel_mf_substringTruncatedToIndex_, truncated);

  swift_bridgeObjectRelease();
  if (v13)
  {
    uint64_t v7 = sub_1AFA53FC8();
    uint64_t v8 = v1;

    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  if (v10)
  {
    uint64_t v5 = v9;
    id v6 = v10;
  }
  else
  {
    sub_1AFA54198();
    __break(1u);
  }
  uint64_t v2 = v5;
  uint64_t v3 = v6;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

id SwiftHelloMessageUI.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SwiftHelloMessageUI.init()()
{
  id v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v4, sel_init);
  id v1 = v3;
  id v5 = v3;

  return v3;
}

id SwiftHelloMessageUI.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SwiftHelloMessageUI()
{
  return self;
}

uint64_t sub_1AFA4EF8C()
{
  return v0;
}

uint64_t sub_1AFA4EFB0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1AFA4EFF0()
{
  return sub_1AFA4EF8C();
}

id sub_1AFA4F02C()
{
  sub_1AFA51848();
  type metadata accessor for ResourceBundleClass();
  id result = sub_1AFA4F074();
  qword_1E9AF6540 = (uint64_t)result;
  return result;
}

id sub_1AFA4F074()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);

  return v0;
}

uint64_t *sub_1AFA4F0CC()
{
  if (qword_1E9AF6538 != -1) {
    swift_once();
  }
  return &qword_1E9AF6540;
}

uint64_t sub_1AFA4F130()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6680);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6680);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F1C0()
{
  if (qword_1E9AF6548 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6680);
}

uint64_t sub_1AFA4F230@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F1C0();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F294()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6698);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6698);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F324()
{
  if (qword_1E9AF6550 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6698);
}

uint64_t sub_1AFA4F394@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F324();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F3F8()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF66B0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF66B0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F488()
{
  if (qword_1E9AF6558 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF66B0);
}

uint64_t sub_1AFA4F4F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F488();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F55C()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF66C8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF66C8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F5EC()
{
  if (qword_1E9AF6560 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF66C8);
}

uint64_t sub_1AFA4F65C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F5EC();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F6C0()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF66E0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF66E0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F750()
{
  if (qword_1E9AF6568 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF66E0);
}

uint64_t sub_1AFA4F7C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F750();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F824()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF66F8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF66F8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4F8B4()
{
  if (qword_1E9AF6570 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF66F8);
}

uint64_t sub_1AFA4F924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4F8B4();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4F988()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6710);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6710);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4FA18()
{
  if (qword_1E9AF6578 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6710);
}

uint64_t sub_1AFA4FA88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4FA18();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4FAEC()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6728);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6728);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4FB7C()
{
  if (qword_1E9AF6580 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6728);
}

uint64_t sub_1AFA4FBEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4FB7C();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4FC50()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6740);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6740);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4FCE0()
{
  if (qword_1E9AF6588 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6740);
}

uint64_t sub_1AFA4FD50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4FCE0();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4FDB4()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6758);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6758);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4FE44()
{
  if (qword_1E9AF6590 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6758);
}

uint64_t sub_1AFA4FEB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4FE44();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA4FF18()
{
  uint64_t v2 = sub_1AFA53CB8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6770);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6770);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA4FFA8()
{
  if (qword_1E9AF6598 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CB8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6770);
}

uint64_t sub_1AFA50018@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA4FFA8();
  uint64_t v1 = sub_1AFA53CB8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA5007C()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6788);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6788);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA5010C()
{
  if (qword_1E9AF65A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6788);
}

uint64_t sub_1AFA5017C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA5010C();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA501E0()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF67A0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF67A0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50270()
{
  if (qword_1E9AF65A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF67A0);
}

uint64_t sub_1AFA502E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50270();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50344()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF67B8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF67B8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA503D4()
{
  if (qword_1E9AF65B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF67B8);
}

uint64_t sub_1AFA50444@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA503D4();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA504A8()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF67D0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF67D0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50538()
{
  if (qword_1E9AF65B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF67D0);
}

uint64_t sub_1AFA505A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50538();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA5060C()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF67E8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF67E8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA5069C()
{
  if (qword_1E9AF65C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF67E8);
}

uint64_t sub_1AFA5070C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA5069C();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50770()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6800);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6800);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50800()
{
  if (qword_1E9AF65C8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6800);
}

uint64_t sub_1AFA50870@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50800();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA508D4()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6818);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6818);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50964()
{
  if (qword_1E9AF65D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6818);
}

uint64_t sub_1AFA509D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50964();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50A38()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6830);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6830);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50AC8()
{
  if (qword_1E9AF65D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6830);
}

uint64_t sub_1AFA50B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50AC8();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50B9C()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6848);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6848);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50C2C()
{
  if (qword_1E9AF65E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6848);
}

uint64_t sub_1AFA50C9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50C2C();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50D00()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6860);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6860);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50D90()
{
  if (qword_1E9AF65E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6860);
}

uint64_t sub_1AFA50E00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50D90();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50E64()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6878);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6878);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA50EF4()
{
  if (qword_1E9AF65F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6878);
}

uint64_t sub_1AFA50F64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA50EF4();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA50FC8()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6890);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6890);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA51058()
{
  if (qword_1E9AF65F8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6890);
}

uint64_t sub_1AFA510C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA51058();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA5112C()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF68A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF68A8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA511BC()
{
  if (qword_1E9AF6600 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF68A8);
}

uint64_t sub_1AFA5122C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA511BC();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA51290()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF68C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF68C0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA51320()
{
  if (qword_1E9AF6608 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF68C0);
}

uint64_t sub_1AFA51390@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA51320();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA513F4()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF68D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF68D8);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA51484()
{
  if (qword_1E9AF6610 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF68D8);
}

uint64_t sub_1AFA514F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA51484();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA51558()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF68F0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF68F0);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA515E8()
{
  if (qword_1E9AF6618 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF68F0);
}

uint64_t sub_1AFA51658@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA515E8();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_1AFA516BC()
{
  uint64_t v2 = sub_1AFA53CD8();
  __swift_allocate_value_buffer(v2, qword_1E9AF6908);
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9AF6908);
  sub_1AFA53FE8();
  id v0 = (id)*sub_1AFA4F0CC();
  return sub_1AFA53CA8();
}

uint64_t sub_1AFA5174C()
{
  if (qword_1E9AF6620 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1AFA53CD8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF6908);
}

uint64_t sub_1AFA517BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AFA5174C();
  uint64_t v1 = sub_1AFA53CD8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

unint64_t sub_1AFA51848()
{
  uint64_t v2 = qword_1E9AF3018;
  if (!qword_1E9AF3018)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9AF3018);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1AFA53BD8()
{
  return MEMORY[0x1F40E43E8]();
}

uint64_t sub_1AFA53BE8()
{
  return MEMORY[0x1F40E4400]();
}

uint64_t sub_1AFA53BF8()
{
  return MEMORY[0x1F40E4418]();
}

uint64_t sub_1AFA53C08()
{
  return MEMORY[0x1F40E4428]();
}

uint64_t sub_1AFA53C18()
{
  return MEMORY[0x1F40E4440]();
}

uint64_t sub_1AFA53C28()
{
  return MEMORY[0x1F40E4450]();
}

uint64_t sub_1AFA53C38()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1AFA53C48()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1AFA53C58()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1AFA53C68()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1AFA53C78()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1AFA53C88()
{
  return MEMORY[0x1F4187458]();
}

uint64_t sub_1AFA53C98()
{
  return MEMORY[0x1F4187460]();
}

uint64_t sub_1AFA53CA8()
{
  return MEMORY[0x1F40E05D0]();
}

uint64_t sub_1AFA53CB8()
{
  return MEMORY[0x1F40E05D8]();
}

uint64_t sub_1AFA53CC8()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1AFA53CD8()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1AFA53CE8()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1AFA53CF8()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1AFA53D08()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1AFA53D18()
{
  return MEMORY[0x1F41879A0]();
}

uint64_t sub_1AFA53D28()
{
  return MEMORY[0x1F41879A8]();
}

uint64_t sub_1AFA53D38()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1AFA53D48()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1AFA53D58()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AFA53D68()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1AFA53D78()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AFA53D88()
{
  return MEMORY[0x1F4102158]();
}

uint64_t sub_1AFA53D98()
{
  return MEMORY[0x1F4102178]();
}

uint64_t sub_1AFA53DA8()
{
  return MEMORY[0x1F41021C0]();
}

uint64_t sub_1AFA53DB8()
{
  return MEMORY[0x1F41021D0]();
}

uint64_t sub_1AFA53DC8()
{
  return MEMORY[0x1F41021E8]();
}

uint64_t sub_1AFA53DD8()
{
  return MEMORY[0x1F4102200]();
}

uint64_t sub_1AFA53DE8()
{
  return MEMORY[0x1F4102218]();
}

uint64_t sub_1AFA53DF8()
{
  return MEMORY[0x1F4102220]();
}

uint64_t sub_1AFA53E08()
{
  return MEMORY[0x1F4102290]();
}

uint64_t sub_1AFA53E18()
{
  return MEMORY[0x1F41022A8]();
}

uint64_t sub_1AFA53E28()
{
  return MEMORY[0x1F41022C0]();
}

uint64_t sub_1AFA53E38()
{
  return MEMORY[0x1F41022D0]();
}

uint64_t sub_1AFA53E48()
{
  return MEMORY[0x1F41022F8]();
}

uint64_t sub_1AFA53E58()
{
  return MEMORY[0x1F4102308]();
}

uint64_t sub_1AFA53E68()
{
  return MEMORY[0x1F4102320]();
}

uint64_t sub_1AFA53E78()
{
  return MEMORY[0x1F4102360]();
}

uint64_t sub_1AFA53E88()
{
  return MEMORY[0x1F4102380]();
}

uint64_t sub_1AFA53E98()
{
  return MEMORY[0x1F4102398]();
}

uint64_t sub_1AFA53EA8()
{
  return MEMORY[0x1F41023B8]();
}

uint64_t sub_1AFA53EB8()
{
  return MEMORY[0x1F4102490]();
}

uint64_t sub_1AFA53EC8()
{
  return MEMORY[0x1F41024A0]();
}

uint64_t sub_1AFA53ED8()
{
  return MEMORY[0x1F41024B0]();
}

uint64_t sub_1AFA53EE8()
{
  return MEMORY[0x1F41024B8]();
}

uint64_t sub_1AFA53EF8()
{
  return MEMORY[0x1F41024D0]();
}

uint64_t sub_1AFA53F08()
{
  return MEMORY[0x1F41024E8]();
}

uint64_t sub_1AFA53F18()
{
  return MEMORY[0x1F4102560]();
}

uint64_t sub_1AFA53F28()
{
  return MEMORY[0x1F4102568]();
}

uint64_t sub_1AFA53F38()
{
  return MEMORY[0x1F4102580]();
}

uint64_t sub_1AFA53F48()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1AFA53F58()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1AFA53F68()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1AFA53F78()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1AFA53F88()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1AFA53F98()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1AFA53FA8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1AFA53FB8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1AFA53FC8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1AFA53FD8()
{
  return MEMORY[0x1F4183968]();
}

uint64_t sub_1AFA53FE8()
{
  return MEMORY[0x1F4183978]();
}

uint64_t sub_1AFA53FF8()
{
  return MEMORY[0x1F4183990]();
}

uint64_t sub_1AFA54008()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1AFA54018()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1AFA54028()
{
  return MEMORY[0x1F4183B80]();
}

uint64_t sub_1AFA54038()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1AFA54048()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1AFA54058()
{
  return MEMORY[0x1F4183D00]();
}

uint64_t sub_1AFA54068()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1AFA54078()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1AFA54088()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1AFA54098()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1AFA540A8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1AFA540B8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1AFA540C8()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1AFA540D8()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1AFA540E8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1AFA540F8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1AFA54108()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1AFA54118()
{
  return MEMORY[0x1F41843E8]();
}

uint64_t sub_1AFA54128()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AFA54138()
{
  return MEMORY[0x1F41845D8]();
}

uint64_t sub_1AFA54148()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1AFA54158()
{
  return MEMORY[0x1F4184618]();
}

uint64_t sub_1AFA54168()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AFA54178()
{
  return MEMORY[0x1F4187FC0]();
}

uint64_t sub_1AFA54198()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AFA541A8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AFA541B8()
{
  return MEMORY[0x1F41859F8]();
}

uint64_t sub_1AFA541C8()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1AFA541D8()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1AFA541E8()
{
  return MEMORY[0x1F4185A28]();
}

uint64_t sub_1AFA541F8()
{
  return MEMORY[0x1F4185BB0]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingEmailAddress()
{
  return MEMORY[0x1F4106B58]();
}

uint64_t ABAddressBookCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint()
{
  return MEMORY[0x1F4106B60]();
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  return (CFStringRef)MEMORY[0x1F4106B88](label);
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x1F4106BF0](options, error);
}

ABAuthorizationStatus ABAddressBookGetAuthorizationStatus(void)
{
  return MEMORY[0x1F4106C30]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1F4106C60](addressBook, *(void *)&recordID);
}

uint64_t ABAddressBookRegisterChangeCallback()
{
  return MEMORY[0x1F4106CC8]();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
}

uint64_t ABAddressBookUnregisterChangeCallback()
{
  return MEMORY[0x1F4106D68]();
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

uint64_t ABCFindPersonMatchingEmailAddress()
{
  return MEMORY[0x1F4106D88]();
}

uint64_t ABCFindPersonMatchingPhoneNumber()
{
  return MEMORY[0x1F4106D90]();
}

BOOL ABMultiValueAddValueAndLabel(ABMutableMultiValueRef multiValue, CFTypeRef value, CFStringRef label, ABMultiValueIdentifier *outIdentifier)
{
  return MEMORY[0x1F4106EC0](multiValue, value, label, outIdentifier);
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x1F4106ED8](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x1F4106EE8](multiValue, index);
}

ABMutableMultiValueRef ABMultiValueCreateMutable(ABPropertyType type)
{
  return (ABMutableMultiValueRef)MEMORY[0x1F4106EF0](*(void *)&type);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x1F4106F00](multiValue);
}

CFIndex ABMultiValueGetFirstIndexOfValue(ABMultiValueRef multiValue, CFTypeRef value)
{
  return MEMORY[0x1F4106F08](multiValue, value);
}

uint64_t ABMultiValueGetFirstIndexOfValueWithCallback()
{
  return MEMORY[0x1F4106F10]();
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x1F4106F18](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x1F4106F20](multiValue, *(void *)&identifier);
}

CFComparisonResult ABPersonComparePeopleByName(ABRecordRef person1, ABRecordRef person2, ABPersonSortOrdering ordering)
{
  return MEMORY[0x1F4106F68](person1, person2, *(void *)&ordering);
}

uint64_t ABPersonCopyCompositeName()
{
  return MEMORY[0x1F4106F78]();
}

uint64_t ABPersonCopyPreferredLinkedPersonForName()
{
  return MEMORY[0x1F4106FA0]();
}

uint64_t ABPersonCopyShortName()
{
  return MEMORY[0x1F4106FA8]();
}

ABRecordRef ABPersonCreate(void)
{
  return (ABRecordRef)MEMORY[0x1F4106FC0]();
}

uint64_t ABPersonGetShortNamePreferNicknames()
{
  return MEMORY[0x1F4107000]();
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  return MEMORY[0x1F4107008]();
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  return (CFStringRef)MEMORY[0x1F4107100](record);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1F4107110](record, *(void *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1F4107128](record);
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x1F4107138](record, *(void *)&property, value, error);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

CFSocketRef CFSocketCreate(CFAllocatorRef allocator, SInt32 protocolFamily, SInt32 socketType, SInt32 protocol, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1F40D8288](allocator, *(void *)&protocolFamily, *(void *)&socketType, *(void *)&protocol, callBackTypes, callout, context);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8290](allocator, s, order);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x1F40D82B0](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

CFSocketError CFSocketSetAddress(CFSocketRef s, CFDataRef address)
{
  return MEMORY[0x1F40D82D8](s, address);
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2B8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1F40E96D0]();
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9748](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9930](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A00](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CGImageSourceIsColorOptimizedForSharing()
{
  return MEMORY[0x1F40E9A50]();
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1F4109338]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1F4109358]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1F4109368]();
}

uint64_t CPPhoneNumberCopyNormalized()
{
  return MEMORY[0x1F4109380]();
}

uint64_t CPPhoneNumberGetLastFour()
{
  return MEMORY[0x1F4109388]();
}

uint64_t CPPhoneNumbersEqual()
{
  return MEMORY[0x1F41093A8]();
}

CFStringRef CTFontCopyLocalizedName(CTFontRef font, CFStringRef nameKey, CFStringRef *actualLanguage)
{
  return (CFStringRef)MEMORY[0x1F40DF2D8](font, nameKey, actualLanguage);
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1F40DF448]();
}

uint64_t CTFontDescriptorGetTextStyleWithSymbolicTraits()
{
  return MEMORY[0x1F40DF450]();
}

uint64_t CTFontIsSystemUIFont()
{
  return MEMORY[0x1F40DF610]();
}

uint64_t CTFontIsTextStyleFont()
{
  return MEMORY[0x1F40DF618]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1F4117B38]();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return MEMORY[0x1F41177E8]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1F41177F0]();
}

uint64_t EMLogCategoryMessageLoading()
{
  return MEMORY[0x1F41177F8]();
}

uint64_t EMLogCompose()
{
  return MEMORY[0x1F4117800]();
}

uint64_t EMLogMailDrop()
{
  return MEMORY[0x1F4117808]();
}

uint64_t EMStringFromSubtype()
{
  return MEMORY[0x1F4117838]();
}

uint64_t FigAspenCreateJPEGFromIOSurface()
{
  return MEMORY[0x1F410FB90]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x1F4103080]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x1F410FBA0]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MFComposeLog()
{
  return MEMORY[0x1F412EF98]();
}

uint64_t MFCreateStringWithData()
{
  return MEMORY[0x1F412C0B8]();
}

uint64_t MFCreateURLForContentID()
{
  return MEMORY[0x1F412EF78]();
}

uint64_t MFEncodingForCharset()
{
  return MEMORY[0x1F412C0D0]();
}

uint64_t MFGetTypeInfo()
{
  return MEMORY[0x1F412C0E8]();
}

uint64_t MFGreenTeaLogger()
{
  return MEMORY[0x1F412EFA8]();
}

uint64_t MFIsMobileMail()
{
  return MEMORY[0x1F412EFB0]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1F412EFB8]();
}

uint64_t MFLookupLocalizedString()
{
  return MEMORY[0x1F412EF80]();
}

uint64_t MFMessageComposeLoadingSignpostLog()
{
  return MEMORY[0x1F412EFC8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MSDEntitledOpenComposeProtocolDelegateXPCInterface()
{
  return MEMORY[0x1F412C4D8]();
}

uint64_t MSMailComposeWindowTargetContentIdentifierWithIdentifier()
{
  return MEMORY[0x1F412C4F0]();
}

uint64_t MSSharedContactStore()
{
  return MEMORY[0x1F412C508]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFCreateGIFFromVideoURL()
{
  return MEMORY[0x1F4140658]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1F4166CF0]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x1F4166D98]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4166F00]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1F4166F08]();
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1F4166F10](videoPath);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

uint64_t WebThreadLock()
{
  return MEMORY[0x1F4176BB0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIAccessibilityLargeTextFontSize()
{
  return MEMORY[0x1F4166F80]();
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x1F4167050]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1F4186390]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1F40CC670](*(void *)&a1.s_addr);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1F4186708]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}