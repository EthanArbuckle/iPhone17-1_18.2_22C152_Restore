@interface CRRecentContact(CloudRecentsExtensions)
- (ABRecordRef)person;
- (id)_addressBookContext;
- (uint64_t)existingPerson;
- (uint64_t)matchedIdentifier;
- (uint64_t)property;
- (void)_setAddressBookContext:()CloudRecentsExtensions;
@end

@implementation CRRecentContact(CloudRecentsExtensions)

- (id)_addressBookContext
{
  return objc_getAssociatedObject(a1, "_CRAddressBookContextKey");
}

- (void)_setAddressBookContext:()CloudRecentsExtensions
{
}

- (uint64_t)property
{
  v1 = [a1 kind];
  uint64_t v2 = MFABPropertyForRecentsKind(v1);

  return v2;
}

- (uint64_t)existingPerson
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _addressBookContext];
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F29060] currentThread];
    v4 = [v3 threadDictionary];

    v5 = [v4 objectForKeyedSubscript:@"MFMailMessageLibraryAddressBook"];

    if (v5)
    {
    }
    else
    {
      CFTypeRef cf = 0;
      v5 = (void *)ABAddressBookCreateWithOptions(0, (CFErrorRef *)&cf);
      if (v5)
      {
        [v4 setObject:v5 forKeyedSubscript:@"MFMailMessageLibraryAddressBook"];
        CFRelease(v5);
      }
      else
      {
        v6 = MFLogGeneral();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v20 = cf;
          _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#Warning %@", buf, 0xCu);
        }
      }
      if (cf) {
        CFRelease(cf);
      }

      if (!v5)
      {
        uint64_t v2 = 0;
        goto LABEL_23;
      }
    }
    v7 = [a1 address];
    int v8 = [a1 property];
    v18 = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v10 = [a1 displayName];
    v11 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName(v5, v9, v8, v10);

    if (v11)
    {
      uint64_t v2 = objc_alloc_init(_MFCRRecentContactABContext);
      [(_MFCRRecentContactABContext *)v2 setExistingPerson:v11];
      CFTypeRef v12 = ABRecordCopyValue(v11, v8);
      v13 = v12;
      if (v12)
      {
        if (*MEMORY[0x1E4F49CC8] == v8) {
          CFIndex FirstIndexOfValueWithCallback = ABMultiValueGetFirstIndexOfValueWithCallback();
        }
        else {
          CFIndex FirstIndexOfValueWithCallback = ABMultiValueGetFirstIndexOfValue(v12, v7);
        }
        if (FirstIndexOfValueWithCallback != -1) {
          [(_MFCRRecentContactABContext *)v2 setIdentifier:ABMultiValueGetIdentifierAtIndex(v13, FirstIndexOfValueWithCallback)];
        }
        CFRelease(v13);
      }
      [a1 _setAddressBookContext:v2];
      CFRelease(v11);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
LABEL_23:
  uint64_t v15 = [(_MFCRRecentContactABContext *)v2 existingPerson];

  return v15;
}

- (ABRecordRef)person
{
  uint64_t v2 = [a1 _addressBookContext];
  ABRecordRef v3 = [(_MFCRRecentContactABContext *)v2 interimPerson];
  if (v3 || (ABRecordRef v3 = (ABRecordRef)[a1 existingPerson]) != 0)
  {
    v4 = v2;
  }
  else
  {
    v6 = [a1 kind];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F5CC80]];

    if (v7)
    {
      int v8 = 0;
      v9 = [a1 displayName];
      v10 = 0;
      v11 = 0;
      CFTypeRef v12 = 0;
    }
    else
    {
      v13 = [a1 displayName];
      v14 = objc_msgSend(v13, "ec_personNameComponents");

      uint64_t v15 = [v14 namePrefix];
      uint64_t v16 = [v14 givenName];
      v10 = [v14 middleName];
      uint64_t v17 = [v14 familyName];
      uint64_t v21 = [v14 nameSuffix];

      v9 = (void *)v16;
      v11 = (void *)v17;
      int v8 = (void *)v15;
      CFTypeRef v12 = (void *)v21;
    }
    ABRecordRef v3 = ABPersonCreate();
    ABRecordSetValue(v3, *MEMORY[0x1E4F49D00], v8, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E4F49B00], v9, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E4F49C30], v10, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E4F49BF8], v11, 0);
    ABRecordSetValue(v3, *MEMORY[0x1E4F49DA8], v12, 0);
    ABPropertyID v18 = [a1 property];
    ABMutableMultiValueRef Mutable = ABMultiValueCreateMutable(1u);
    ABMultiValueIdentifier outIdentifier = -1431655766;
    CFTypeRef v20 = (const void *)[a1 address];
    ABMultiValueAddValueAndLabel(Mutable, v20, (CFStringRef)*MEMORY[0x1E4F499C0], &outIdentifier);
    ABRecordSetValue(v3, v18, Mutable, 0);
    CFRelease(Mutable);
    v4 = objc_alloc_init(_MFCRRecentContactABContext);

    [(_MFCRRecentContactABContext *)v4 setInterimPerson:v3];
    [(_MFCRRecentContactABContext *)v4 setIdentifier:outIdentifier];
    [a1 _setAddressBookContext:v4];
    CFRelease(v3);
  }
  return v3;
}

- (uint64_t)matchedIdentifier
{
  uint64_t v2 = [a1 _addressBookContext];

  if (!v2) {
    [a1 person];
  }
  ABRecordRef v3 = [a1 _addressBookContext];
  uint64_t v4 = [v3 identifier];

  return v4;
}

@end