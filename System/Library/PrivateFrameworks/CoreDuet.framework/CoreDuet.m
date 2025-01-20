id getCHManagerClass()
{
  void *v0;
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)getCHManagerClass_softClass;
  v6 = getCHManagerClass_softClass;
  if (!getCHManagerClass_softClass)
  {
    CallHistoryLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CHManager");
    getCHManagerClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECECAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCHRecentCallClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCHRecentCallClass_softClass;
  uint64_t v6 = getCHRecentCallClass_softClass;
  if (!getCHRecentCallClass_softClass)
  {
    CallHistoryLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CHRecentCall");
    getCHRecentCallClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECECBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactBirthdayKey()
{
  CNContactBirthdayKeySymbolLoc = (void **)getCNContactBirthdayKeySymbolLoc();
  if (CNContactBirthdayKeySymbolLoc)
  {
    id v1 = *CNContactBirthdayKeySymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getCNContactClass();
  }
}

id getCNContactClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNContactClass_softClass;
  uint64_t v6 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNContact");
    getCNContactClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECECD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactFamilyNameKey()
{
  CNContactFamilyNameKeySymbolLoc = (void **)getCNContactFamilyNameKeySymbolLoc();
  if (CNContactFamilyNameKeySymbolLoc)
  {
    id v1 = *CNContactFamilyNameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactFetchRequestClass(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactFetchRequestClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNContactFetchRequestClass_softClass;
  uint64_t v6 = getCNContactFetchRequestClass_softClass;
  if (!getCNContactFetchRequestClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNContactFetchRequest");
    getCNContactFetchRequestClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECECE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactFormatterClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNContactFormatterClass_softClass;
  uint64_t v6 = getCNContactFormatterClass_softClass;
  if (!getCNContactFormatterClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNContactFormatter");
    getCNContactFormatterClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECECF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactGivenNameKey()
{
  CNContactGivenNameKeySymbolLoc = (void **)getCNContactGivenNameKeySymbolLoc();
  if (CNContactGivenNameKeySymbolLoc)
  {
    id v1 = *CNContactGivenNameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactIdentifierKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactIdentifierKey()
{
  CNContactIdentifierKeySymbolLoc = (void **)getCNContactIdentifierKeySymbolLoc();
  if (CNContactIdentifierKeySymbolLoc)
  {
    id v1 = *CNContactIdentifierKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactImageDataAvailableKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactImageDataAvailableKey()
{
  CNContactImageDataAvailableKeySymbolLoc = (void **)getCNContactImageDataAvailableKeySymbolLoc();
  if (CNContactImageDataAvailableKeySymbolLoc)
  {
    id v1 = *CNContactImageDataAvailableKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactInstantMessageAddressesKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactInstantMessageAddressesKey()
{
  CNContactInstantMessageAddressesKeySymbolLoc = (void **)getCNContactInstantMessageAddressesKeySymbolLoc();
  if (CNContactInstantMessageAddressesKeySymbolLoc)
  {
    id v1 = *CNContactInstantMessageAddressesKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactMiddleNameKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactMiddleNameKey()
{
  CNContactMiddleNameKeySymbolLoc = (void **)getCNContactMiddleNameKeySymbolLoc();
  if (CNContactMiddleNameKeySymbolLoc)
  {
    id v1 = *CNContactMiddleNameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactNamePrefixKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactNamePrefixKey()
{
  CNContactNamePrefixKeySymbolLoc = (void **)getCNContactNamePrefixKeySymbolLoc();
  if (CNContactNamePrefixKeySymbolLoc)
  {
    id v1 = *CNContactNamePrefixKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactNameSuffixKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactNameSuffixKey()
{
  CNContactNameSuffixKeySymbolLoc = (void **)getCNContactNameSuffixKeySymbolLoc();
  if (CNContactNameSuffixKeySymbolLoc)
  {
    id v1 = *CNContactNameSuffixKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactNicknameKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactNicknameKey()
{
  CNContactNicknameKeySymbolLoc = (void **)getCNContactNicknameKeySymbolLoc();
  if (CNContactNicknameKeySymbolLoc)
  {
    id v1 = *CNContactNicknameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactOrganizationNameKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactOrganizationNameKey()
{
  CNContactOrganizationNameKeySymbolLoc = (void **)getCNContactOrganizationNameKeySymbolLoc();
  if (CNContactOrganizationNameKeySymbolLoc)
  {
    id v1 = *CNContactOrganizationNameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactPhoneNumbersKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactPhoneNumbersKey()
{
  CNContactPhoneNumbersKeySymbolLoc = (void **)getCNContactPhoneNumbersKeySymbolLoc();
  if (CNContactPhoneNumbersKeySymbolLoc)
  {
    id v1 = *CNContactPhoneNumbersKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactPostalAddressesKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactPostalAddressesKey()
{
  CNContactPostalAddressesKeySymbolLoc = (void **)getCNContactPostalAddressesKeySymbolLoc();
  if (CNContactPostalAddressesKeySymbolLoc)
  {
    id v1 = *CNContactPostalAddressesKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactPreviousFamilyNameKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactPreviousFamilyNameKey()
{
  CNContactPreviousFamilyNameKeySymbolLoc = (void **)getCNContactPreviousFamilyNameKeySymbolLoc();
  if (CNContactPreviousFamilyNameKeySymbolLoc)
  {
    id v1 = *CNContactPreviousFamilyNameKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactRelationsKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactRelationsKey()
{
  CNContactRelationsKeySymbolLoc = (void **)getCNContactRelationsKeySymbolLoc();
  if (CNContactRelationsKeySymbolLoc)
  {
    id v1 = *CNContactRelationsKeySymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getCNContactSocialProfilesKey();
  }
}

id getCNContactSocialProfilesKey()
{
  CNContactSocialProfilesKeySymbolLoc = (void **)getCNContactSocialProfilesKeySymbolLoc();
  if (CNContactSocialProfilesKeySymbolLoc)
  {
    id v1 = *CNContactSocialProfilesKeySymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getCNContactStoreClass();
  }
}

id getCNContactStoreClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNContactStoreClass_softClass;
  uint64_t v6 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNContactStore");
    getCNContactStoreClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECED334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNContactTypeKey()
{
  CNContactTypeKeySymbolLoc = (void **)getCNContactTypeKeySymbolLoc();
  if (CNContactTypeKeySymbolLoc)
  {
    id v1 = *CNContactTypeKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNContactUrlAddressesKey(CNContactBirthdayKey_cold_1);
  }
}

id getCNContactUrlAddressesKey()
{
  CNContactUrlAddressesKeySymbolLoc = (void **)getCNContactUrlAddressesKeySymbolLoc();
  if (CNContactUrlAddressesKeySymbolLoc)
  {
    id v1 = *CNContactUrlAddressesKeySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNFavoritesClass(CNContactBirthdayKey_cold_1);
  }
}

id getCNFavoritesClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNFavoritesClass_softClass;
  uint64_t v6 = getCNFavoritesClass_softClass;
  if (!getCNFavoritesClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNFavorites");
    getCNFavoritesClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECED4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNLabelContactRelationAssistant()
{
  CNLabelContactRelationAssistantSymbolLoc = (void **)getCNLabelContactRelationAssistantSymbolLoc();
  if (CNLabelContactRelationAssistantSymbolLoc)
  {
    id v1 = *CNLabelContactRelationAssistantSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationColleague(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationColleague()
{
  CNLabelContactRelationColleagueSymbolLoc = (void **)getCNLabelContactRelationColleagueSymbolLoc();
  if (CNLabelContactRelationColleagueSymbolLoc)
  {
    id v1 = *CNLabelContactRelationColleagueSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationFemaleFriend(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationFemaleFriend()
{
  CNLabelContactRelationFemaleFriendSymbolLoc = (void **)getCNLabelContactRelationFemaleFriendSymbolLoc();
  if (CNLabelContactRelationFemaleFriendSymbolLoc)
  {
    id v1 = *CNLabelContactRelationFemaleFriendSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationFriend(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationFriend()
{
  CNLabelContactRelationFriendSymbolLoc = (void **)getCNLabelContactRelationFriendSymbolLoc();
  if (CNLabelContactRelationFriendSymbolLoc)
  {
    id v1 = *CNLabelContactRelationFriendSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationMaleFriend(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationMaleFriend()
{
  CNLabelContactRelationMaleFriendSymbolLoc = (void **)getCNLabelContactRelationMaleFriendSymbolLoc();
  if (CNLabelContactRelationMaleFriendSymbolLoc)
  {
    id v1 = *CNLabelContactRelationMaleFriendSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationManager(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationManager()
{
  CNLabelContactRelationManagerSymbolLoc = (void **)getCNLabelContactRelationManagerSymbolLoc();
  if (CNLabelContactRelationManagerSymbolLoc)
  {
    id v1 = *CNLabelContactRelationManagerSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCNLabelContactRelationTeacher(CNContactBirthdayKey_cold_1);
  }
}

id getCNLabelContactRelationTeacher()
{
  CNLabelContactRelationTeacherSymbolLoc = (void **)getCNLabelContactRelationTeacherSymbolLoc();
  if (CNLabelContactRelationTeacherSymbolLoc)
  {
    id v1 = *CNLabelContactRelationTeacherSymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getCNPhoneNumberClass();
  }
}

id getCNPhoneNumberClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCNPhoneNumberClass_softClass;
  uint64_t v6 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNPhoneNumber");
    getCNPhoneNumberClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECED720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSMailboxArchive()
{
  CSMailboxArchiveSymbolLoc = (void **)getCSMailboxArchiveSymbolLoc();
  if (CSMailboxArchiveSymbolLoc)
  {
    id v1 = *CSMailboxArchiveSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCSMailboxInbox(CNContactBirthdayKey_cold_1);
  }
}

id getCSMailboxInbox()
{
  CSMailboxInboxSymbolLoc = (void **)getCSMailboxInboxSymbolLoc();
  if (CSMailboxInboxSymbolLoc)
  {
    id v1 = *CSMailboxInboxSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getCSMailboxSent(CNContactBirthdayKey_cold_1);
  }
}

id getCSMailboxSent()
{
  CSMailboxSentSymbolLoc = (void **)getCSMailboxSentSymbolLoc();
  if (CSMailboxSentSymbolLoc)
  {
    id v1 = *CSMailboxSentSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getHKHealthStoreClass(CNContactBirthdayKey_cold_1);
  }
}

id getHKHealthStoreClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v6 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    HealthKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("HKHealthStore");
    getHKHealthStoreClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECED8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMHomeManagerClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getHMHomeManagerClass_softClass;
  uint64_t v6 = getHMHomeManagerClass_softClass;
  if (!getHMHomeManagerClass_softClass)
  {
    HomeKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("HMHomeManager");
    getHMHomeManagerClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECED9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHMHomeManagerConfigurationClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getHMHomeManagerConfigurationClass_softClass;
  uint64_t v6 = getHMHomeManagerConfigurationClass_softClass;
  if (!getHMHomeManagerConfigurationClass_softClass)
  {
    HomeKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("HMHomeManagerConfiguration");
    getHMHomeManagerConfigurationClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEDAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHFetchOptionsClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getPHFetchOptionsClass_softClass;
  uint64_t v6 = getPHFetchOptionsClass_softClass;
  if (!getPHFetchOptionsClass_softClass)
  {
    PhotosLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PHFetchOptions");
    getPHFetchOptionsClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEDBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHPersonClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getPHPersonClass_softClass;
  uint64_t v6 = getPHPersonClass_softClass;
  if (!getPHPersonClass_softClass)
  {
    PhotosLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PHPerson");
    getPHPersonClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEDCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTRoutineManagerClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getRTRoutineManagerClass_softClass;
  uint64_t v6 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    CoreRoutineLibraryCore();
    v4[3] = (uint64_t)objc_getClass("RTRoutineManager");
    getRTRoutineManagerClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEDE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCHCallStatusConnectedOutgoing()
{
  v0 = (unsigned int *)getkCHCallStatusConnectedOutgoingSymbolLoc();
  if (v0) {
    return (id)*v0;
  }
  getCNContactBirthdayKey_cold_1();
  return get_CDContextualKeyPathClass();
}

id get_CDContextualKeyPathClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)get_CDContextualKeyPathClass_softClass;
  uint64_t v6 = get_CDContextualKeyPathClass_softClass;
  if (!get_CDContextualKeyPathClass_softClass)
  {
    CoreDuetContextLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_CDContextualKeyPath");
    get_CDContextualKeyPathClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEDF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFAFetchFamilyCircleRequestClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getFAFetchFamilyCircleRequestClass_softClass;
  uint64_t v6 = getFAFetchFamilyCircleRequestClass_softClass;
  if (!getFAFetchFamilyCircleRequestClass_softClass)
  {
    FamilyCircleLibraryCore();
    v4[3] = (uint64_t)objc_getClass("FAFetchFamilyCircleRequest");
    getFAFetchFamilyCircleRequestClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPETEventTracker2Class()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getPETEventTracker2Class_softClass;
  uint64_t v6 = getPETEventTracker2Class_softClass;
  if (!getPETEventTracker2Class_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PETEventTracker2");
    getPETEventTracker2Class_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSTManagementStateClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getSTManagementStateClass_softClass;
  uint64_t v6 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    ScreenTimeCoreLibraryCore();
    v4[3] = (uint64_t)objc_getClass("STManagementState");
    getSTManagementStateClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getSpotlightReceiverConnectionUIDKey()
{
  uint64_t SpotlightReceiverConnectionUIDKeySymbolLoc = getSpotlightReceiverConnectionUIDKeySymbolLoc();
  if (SpotlightReceiverConnectionUIDKeySymbolLoc) {
    return *(void *)SpotlightReceiverConnectionUIDKeySymbolLoc;
  }
  uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getCNContactEmailAddressesKey(CNContactBirthdayKey_cold_1);
}

id getCNContactEmailAddressesKey()
{
  CNContactEmailAddressesKeySymbolLoc = (void **)getCNContactEmailAddressesKeySymbolLoc();
  if (CNContactEmailAddressesKeySymbolLoc)
  {
    id v1 = *CNContactEmailAddressesKeySymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getBMDKEventClass();
  }
}

id getBMDKEventClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMDKEventClass_softClass;
  uint64_t v6 = getBMDKEventClass_softClass;
  if (!getBMDKEventClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMDKEvent");
    getBMDKEventClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRESiriActionsDonationsWhitelistClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getRESiriActionsDonationsWhitelistClass_softClass;
  uint64_t v6 = getRESiriActionsDonationsWhitelistClass_softClass;
  if (!getRESiriActionsDonationsWhitelistClass_softClass)
  {
    RelevanceEngineLibraryCore();
    v4[3] = (uint64_t)objc_getClass("RESiriActionsDonationsWhitelist");
    getRESiriActionsDonationsWhitelistClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDClientContextClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)get_CDClientContextClass_softClass;
  uint64_t v6 = get_CDClientContextClass_softClass;
  if (!get_CDClientContextClass_softClass)
  {
    CoreDuetContextLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_CDClientContext");
    get_CDClientContextClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextQueriesClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)get_CDContextQueriesClass_softClass;
  uint64_t v6 = get_CDContextQueriesClass_softClass;
  if (!get_CDContextQueriesClass_softClass)
  {
    CoreDuetContextLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_CDContextQueries");
    get_CDContextQueriesClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMDKEventStreamClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getBMDKEventStreamClass_softClass;
  uint64_t v6 = getBMDKEventStreamClass_softClass;
  if (!getBMDKEventStreamClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMDKEventStream");
    getBMDKEventStreamClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  uint64_t v6 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    AssistantServicesLibraryCore();
    v4[3] = (uint64_t)objc_getClass("AFPreferences");
    getAFPreferencesClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEE8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSSearchableIndexClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getCSSearchableIndexClass_softClass;
  uint64_t v6 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    CoreSpotlightLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CSSearchableIndex");
    getCSSearchableIndexClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEEA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkAFCloudStorageDeletedByUserDarwinNotification()
{
  uint64_t v0 = getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc();
  if (v0) {
    return *(void *)v0;
  }
  uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkAFCloudSyncPreferenceDidChangeDarwinNotification(CNContactBirthdayKey_cold_1);
}

uint64_t getkAFCloudSyncPreferenceDidChangeDarwinNotification()
{
  uint64_t v0 = getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc();
  if (v0) {
    return *(void *)v0;
  }
  uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeCalendarEvent(CNContactBirthdayKey_cold_1);
}

uint64_t getkUTTypeCalendarEvent()
{
  uint64_t v0 = getkUTTypeCalendarEventSymbolLoc();
  if (v0) {
    return *(void *)v0;
  }
  uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeEmailMessage(CNContactBirthdayKey_cold_1);
}

uint64_t getkUTTypeEmailMessage()
{
  uint64_t v0 = getkUTTypeEmailMessageSymbolLoc();
  if (v0) {
    return *(void *)v0;
  }
  uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
  return getkUTTypeMessage(CNContactBirthdayKey_cold_1);
}

id getkUTTypeMessage()
{
  uint64_t v0 = getkUTTypeMessageSymbolLoc();
  if (v0) {
    return *(id *)v0;
  }
  getCNContactBirthdayKey_cold_1();
  return getPETDistributionEventTrackerClass();
}

id getPETDistributionEventTrackerClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getPETDistributionEventTrackerClass_softClass;
  uint64_t v6 = getPETDistributionEventTrackerClass_softClass;
  if (!getPETDistributionEventTrackerClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PETDistributionEventTracker");
    getPETDistributionEventTrackerClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEEBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPETEventPropertyClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getPETEventPropertyClass_softClass;
  uint64_t v6 = getPETEventPropertyClass_softClass;
  if (!getPETEventPropertyClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PETEventProperty");
    getPETEventPropertyClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEECD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPETScalarEventTrackerClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getPETScalarEventTrackerClass_softClass;
  uint64_t v6 = getPETScalarEventTrackerClass_softClass;
  if (!getPETScalarEventTrackerClass_softClass)
  {
    ProactiveEventTrackerLibraryCore();
    v4[3] = (uint64_t)objc_getClass("PETScalarEventTracker");
    getPETScalarEventTrackerClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEEDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSCNAutocompleteFeedbackClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSCNAutocompleteFeedbackClass_softClass;
  uint64_t v6 = get_PSCNAutocompleteFeedbackClass_softClass;
  if (!get_PSCNAutocompleteFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSCNAutocompleteFeedback");
    get_PSCNAutocompleteFeedbackClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEEEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSAttachmentClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSAttachmentClass_softClass;
  uint64_t v6 = get_PSAttachmentClass_softClass;
  if (!get_PSAttachmentClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSAttachment");
    get_PSAttachmentClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEEFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSAutocompleteSuggestionClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSAutocompleteSuggestionClass_softClass;
  uint64_t v6 = get_PSAutocompleteSuggestionClass_softClass;
  if (!get_PSAutocompleteSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSAutocompleteSuggestion");
    get_PSAutocompleteSuggestionClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSContactSuggesterClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSContactSuggesterClass_softClass;
  uint64_t v6 = get_PSContactSuggesterClass_softClass;
  if (!get_PSContactSuggesterClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSContactSuggester");
    get_PSContactSuggesterClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSContactSuggestionClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSContactSuggestionClass_softClass;
  uint64_t v6 = get_PSContactSuggestionClass_softClass;
  if (!get_PSContactSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSContactSuggestion");
    get_PSContactSuggestionClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSContactSuggestionHandleAndAppClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSContactSuggestionHandleAndAppClass_softClass;
  uint64_t v6 = get_PSContactSuggestionHandleAndAppClass_softClass;
  if (!get_PSContactSuggestionHandleAndAppClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSContactSuggestionHandleAndApp");
    get_PSContactSuggestionHandleAndAppClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSFeedbackClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSFeedbackClass_softClass;
  uint64_t v6 = get_PSFeedbackClass_softClass;
  if (!get_PSFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSFeedback");
    get_PSFeedbackClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSMapsPredictionContextClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSMapsPredictionContextClass_softClass;
  uint64_t v6 = get_PSMapsPredictionContextClass_softClass;
  if (!get_PSMapsPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSMapsPredictionContext");
    get_PSMapsPredictionContextClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSMessagesPinningFeedbackClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSMessagesPinningFeedbackClass_softClass;
  uint64_t v6 = get_PSMessagesPinningFeedbackClass_softClass;
  if (!get_PSMessagesPinningFeedbackClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSMessagesPinningFeedback");
    get_PSMessagesPinningFeedbackClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSPredictionContextClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSPredictionContextClass_softClass;
  uint64_t v6 = get_PSPredictionContextClass_softClass;
  if (!get_PSPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSPredictionContext");
    get_PSPredictionContextClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSRecipientClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSRecipientClass_softClass;
  uint64_t v6 = get_PSRecipientClass_softClass;
  if (!get_PSRecipientClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSRecipient");
    get_PSRecipientClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEF960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSSiriHandleRankerPredictionContextClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSSiriHandleRankerPredictionContextClass_softClass;
  uint64_t v6 = get_PSSiriHandleRankerPredictionContextClass_softClass;
  if (!get_PSSiriHandleRankerPredictionContextClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSSiriHandleRankerPredictionContext");
    get_PSSiriHandleRankerPredictionContextClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEFA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSSuggesterClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSSuggesterClass_softClass;
  uint64_t v6 = get_PSSuggesterClass_softClass;
  if (!get_PSSuggesterClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSSuggester");
    get_PSSuggesterClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEFB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSSuggesterConfigurationClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSSuggesterConfigurationClass_softClass;
  uint64_t v6 = get_PSSuggesterConfigurationClass_softClass;
  if (!get_PSSuggesterConfigurationClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSSuggesterConfiguration");
    get_PSSuggesterConfigurationClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEFC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSSuggestionClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSSuggestionClass_softClass;
  uint64_t v6 = get_PSSuggestionClass_softClass;
  if (!get_PSSuggestionClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSSuggestion");
    get_PSSuggestionClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ECEFD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _cdcontextstore_signpost_set_object_begin(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    v2 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v2))
    {
      uint64_t v3 = _CDCurrentOrXPCProcessName();
      int v4 = 138543618;
      uint64_t v5 = v3;
      __int16 v6 = 2114;
      id v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetKeyPath", " Process=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);
    }
  }
}

void _cdcontextstore_signpost_evaluateCallback_begin(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v5))
    {
      int v6 = 138543618;
      id v7 = v3;
      __int16 v8 = 2114;
      id v9 = v4;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EvaluateCallback", " RegistrationID=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_18ECF13D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ECF2E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ECF39B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void legacy_log_signpost(void *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = 96;
    if (a2) {
      uint64_t v5 = 16;
    }
    uint64_t v6 = 24;
    if (a2) {
      uint64_t v6 = 8;
    }
    double v7 = (double)*(unint64_t *)&v3[v6] * 0.0009765625 * 0.0009765625;
    double v8 = (double)*(unint64_t *)&v3[v5] * 0.0009765625 * 0.0009765625;
  }
  else
  {
    double v8 = 0.0;
    double v7 = 0.0;
  }
  id v9 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = [v4 name];
    v11 = v10;
    if (a2) {
      v12 = @"Begin";
    }
    else {
      v12 = @"End";
    }
    v13 = [v10 stringByAppendingString:v12];
    int v14 = 138543874;
    v15 = v13;
    __int16 v16 = 2050;
    double v17 = v7;
    __int16 v18 = 2050;
    double v19 = v8;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Footprint", "Name=%{signpost.telemetry:string1,public}@ Footprint=%{signpost.telemetry:number1,public}.2fMB MaxFootprint=%{signpost.telemetry:number2,public}.2fMB  enableTelemetry=YES ", (uint8_t *)&v14, 0x20u);
  }
}

uint64_t _DKStringContainsPrivacySensitiveMetadataKey(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (_DKStringContainsPrivacySensitiveMetadataKey_onceToken != -1) {
    dispatch_once(&_DKStringContainsPrivacySensitiveMetadataKey_onceToken, &__block_literal_global_22);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)_DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(v1, "containsString:", *(void *)(*((void *)&v7 + 1) + 8 * i), (void)v7))
        {
          uint64_t v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

void sub_18ECF5800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18ECF5C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void sub_18ECF70D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_18ECF745C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _cdknowledge_signpost_query_end(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v4))
  {
    int v5 = 134349312;
    uint64_t v6 = a1;
    __int16 v7 = 2050;
    uint64_t v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", " ResultCount=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld  enableTelemetry=YES ", (uint8_t *)&v5, 0x16u);
  }
}

void _cdknowledge_signpost_query_begin(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v3 = +[_CDLogging knowledgeSignpost];
  BOOL v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      int v5 = _CDCurrentOrXPCProcessName();
      int v6 = 138543618;
      __int16 v7 = v5;
      __int16 v8 = 2114;
      id v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", " Process=%{signpost.telemetry:string1,public}@  Stream=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExecuteQuery", (const char *)&unk_18EEB7986, (uint8_t *)&v6, 2u);
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __cd_dispatch_async_capture_tx_block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void _cdcontextstore_signpost_evaluateCallback_end()
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)id v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EvaluateCallback", (const char *)&unk_18EEB7986, v1, 2u);
    }
  }
}

void _cdcontextstore_signpost_set_object_end()
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)id v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetKeyPath", (const char *)&unk_18EEB7986, v1, 2u);
    }
  }
}

void sub_18ECF9E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18ECFAF28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(lock);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18ECFB45C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v18);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t get_memory_usage(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  uint64_t result = getpid();
  if (a1 || a2 || a3)
  {
    uint64_t result = proc_pid_rusage(result, 4, (rusage_info_t *)v10);
    if (a1) {
      *a1 = *((void *)&v11 + 1);
    }
    if (a2)
    {
      uint64_t v9 = *((void *)&v24 + 1);
      if (!*((void *)&v24 + 1)) {
        uint64_t v9 = *((void *)&v11 + 1);
      }
      *a2 = v9;
    }
    if (a3) {
      *a3 = v22;
    }
  }
  if (a4) {
    return proc_reset_footprint_interval();
  }
  return result;
}

uint64_t _DKQueryLoggingEnabled()
{
  unsigned int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics && _DKQueryLoggingEnabled_onceToken != -1) {
    dispatch_once(&_DKQueryLoggingEnabled_onceToken, &__block_literal_global_71);
  }
  if (_DKQueryLoggingEnabled_disableQueryLogging) {
    return 0;
  }
  else {
    return has_internal_diagnostics;
  }
}

void sub_18ECFBBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CDCurrentOrXPCProcessName()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29268] currentConnection];
  id v1 = v0;
  if (!v0)
  {
    BOOL v4 = [MEMORY[0x1E4F28F80] processInfo];
    id v5 = [v4 processName];
    goto LABEL_7;
  }
  int v2 = [v0 processIdentifier];
  bzero(buffer, 0x400uLL);
  int v3 = proc_pidpath(v2, buffer, 0x400u);
  if ((v3 & 0x80000000) == 0) {
    buffer[v3] = 0;
  }
  BOOL v4 = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer, 0x8000100u);
  if ([v4 length])
  {
    id v5 = v4;
LABEL_7:
    int v6 = v5;
    goto LABEL_9;
  }
  __int16 v7 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v7 processName];

LABEL_9:
  return v6;
}

void _cdknowledge_signpost_save_begin(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v5 = +[_CDLogging knowledgeSignpost];
  BOOL v6 = os_signpost_enabled(v5);
  if (has_internal_diagnostics)
  {
    if (v6)
    {
      __int16 v7 = _CDCurrentOrXPCProcessName();
      int v8 = 138543874;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      __int16 v12 = 2050;
      long long v13 = a1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " Process=%{signpost.telemetry:string1,public}@  Stream=%{signpost.telemetry:string2,public}@  SaveCount=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    uint64_t v9 = a1;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " SaveCount=%{signpost.telemetry:number1,public}lu  enableTelemetry=YES ", (uint8_t *)&v8, 0xCu);
  }
}

void sub_18ECFD15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void _cdknowledge_signpost_save_end(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v2))
  {
    int v3 = 134349056;
    uint64_t v4 = a1;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveObjects", " ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v3, 0xCu);
  }
}

void setClassesForCDInteractionXPCInterface(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = a1;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v1, "setWithObjects:", v3, objc_opt_class(), 0);
  v46 = (void *)MEMORY[0x1E4F1CAD0];
  v48 = (void *)v4;
  uint64_t v44 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v46, "setWithObjects:", v44, v42, v40, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  get_PSSuggestionClass();
  uint64_t v32 = objc_opt_class();
  get_PSPredictionContextClass();
  uint64_t v31 = objc_opt_class();
  get_PSAttachmentClass();
  uint64_t v30 = objc_opt_class();
  get_PSSuggesterClass();
  uint64_t v29 = objc_opt_class();
  get_PSFeedbackClass();
  uint64_t v28 = objc_opt_class();
  get_PSRecipientClass();
  uint64_t v27 = objc_opt_class();
  get_PSSuggesterConfigurationClass();
  uint64_t v26 = objc_opt_class();
  get_PSMapsPredictionContextClass();
  uint64_t v15 = objc_opt_class();
  get_PSAutocompleteSuggestionClass();
  uint64_t v16 = objc_opt_class();
  get_PSSiriHandleRankerPredictionContextClass();
  uint64_t v17 = objc_opt_class();
  get_PSMessagesPinningFeedbackClass();
  uint64_t v18 = objc_opt_class();
  get_PSContactSuggestionHandleAndAppClass();
  uint64_t v19 = objc_opt_class();
  get_PSContactSuggestionClass();
  uint64_t v20 = objc_opt_class();
  get_PSContactSuggesterClass();
  uint64_t v21 = objc_opt_class();
  get_PSCNAutocompleteFeedbackClass();
  uint64_t v22 = objc_opt_class();
  get_PSCandidateClass();
  objc_msgSend(v47, "setWithObjects:", v45, v43, v41, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    objc_opt_class(),
  long long v23 = 0);
  [v2 setClasses:v14 forSelector:sel_recordInteractions_enforceDataLimits_enforcePrivacy_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_updateInteractions_enforceDataLimits_enforcePrivacy_reply_ argumentIndex:0 ofReply:0];
  long long v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v24 forSelector:sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v48 forSelector:sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v24 forSelector:sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v48 forSelector:sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_queryContactsUsingPredicate_sortDescriptors_limit_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v24 forSelector:sel_deleteInteractionsMatchingPredicate_sortDescriptors_limit_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v48 forSelector:sel_deleteInteractionsMatchingPredicate_sortDescriptors_limit_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_rankCandidateContacts_usingSettings_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_rankCandidateContacts_usingSettings_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_rankCandidateContacts_usingSettings_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsUsingSettings_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsForDate_usingSettings_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsForKeywordsInString_usingSettings_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_ argumentIndex:3 ofReply:0];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsUsingSettings_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsForDate_usingSettings_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v14 forSelector:sel_adviseInteractionsForKeywordsInString_usingSettings_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v14 forSelector:sel_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_suggestInteractionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_suggestInteractionsFromContext_maxSuggestions_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_suggestInteractionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_shareExtensionSuggestionsFromContext_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_shareExtensionSuggestionsFromContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_mapsSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_mapsSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_mapsSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_zkwSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_zkwSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_zkwSuggestionsFromContext_maxSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_computeShareSheetEphemeralFeaturesWithPredictionContext_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_computeShareSheetEphemeralFeaturesWithPredictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_validateCoreMLScoringModelWithRawInput_predictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_provideFeedbackForContactsAutocompleteSuggestions_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedNameSuggestionsFromContext_name_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedNameSuggestionsFromContext_name_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedNameSuggestionsFromContext_name_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedAutocompleteSuggestionsFromContext_candidates_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedMessagesPinsWithMaxSuggestions_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedMessagesPinsWithMaxSuggestions_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_provideMessagesPinningFeedback_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedFamilySuggestionsWithReply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_familyRecommendedSuggestionsWithPredictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_photosContactInferencesSuggestionsWithPredictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_photosRelationshipSuggestionsWithPredictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedSiriMLCRHandlesFromContext_handles_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedSiriMLCRHandlesFromContext_handles_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedSiriMLCRHandlesFromContext_handles_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_rankedHandlesFromCandidateHandles_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_rankedHandlesFromCandidateHandles_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v23 forSelector:sel_autocompleteSearchResultsWithPredictionContext_reply_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v23 forSelector:sel_autocompleteSearchResultsWithPredictionContext_reply_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v14 forSelector:sel_tuneSocialAdvisorUsingSettings_heartBeatHandler_reply_ argumentIndex:0 ofReply:0];
  uint64_t v25 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDE53FF8];
  [v2 setInterface:v25 forSelector:sel_tuneSocialAdvisorUsingSettings_heartBeatHandler_reply_ argumentIndex:1 ofReply:0];
}

uint64_t PeopleSuggesterLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PeopleSuggesterLibraryCore_frameworkLibrary;
  uint64_t v5 = PeopleSuggesterLibraryCore_frameworkLibrary;
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F6E8;
    long long v7 = *(_OWORD *)&off_1E560F6F8;
    v3[3] = _sl_dlopen();
    PeopleSuggesterLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18ED0074C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_PSCandidateClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)get_PSCandidateClass_softClass;
  uint64_t v6 = get_PSCandidateClass_softClass;
  if (!get_PSCandidateClass_softClass)
  {
    PeopleSuggesterLibraryCore();
    v4[3] = (uint64_t)objc_getClass("_PSCandidate");
    get_PSCandidateClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18ED00858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t slADClientAddValueForScalarKey(uint64_t a1, uint64_t a2)
{
  ADClientAddValueForScalarKeySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getADClientAddValueForScalarKeySymbolLoc();
  if (ADClientAddValueForScalarKeySymbolLoc)
  {
    return ADClientAddValueForScalarKeySymbolLoc(a1, a2);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getADClientAddValueForScalarKeySymbolLoc();
  }
}

uint64_t getADClientAddValueForScalarKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  uint64_t v6 = getADClientAddValueForScalarKeySymbolLoc_ptr;
  if (!getADClientAddValueForScalarKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientAddValueForScalarKey");
    getADClientAddValueForScalarKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18ED00C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getSpotlightReceiverConnectionUIDKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr;
  uint64_t v6 = getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr;
  if (!getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr)
  {
    id v1 = (void *)SpotlightReceiverLibrary();
    v4[3] = (uint64_t)dlsym(v1, "SpotlightReceiverConnectionUIDKey");
    getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18ED00FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED015C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18ED02078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DKDaemonInterface()
{
  if (_DKDaemonInterface_onceToken != -1) {
    dispatch_once(&_DKDaemonInterface_onceToken, &__block_literal_global_60);
  }
  uint64_t v0 = (void *)_DKDaemonInterface_interface;
  return v0;
}

void sub_18ED026F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED02DEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CDTargetBundleIdForBundleId(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_CDConstants mobileMessagesBundleId]();
  int v3 = [v1 isEqual:v2];

  if (v3)
  {
    uint64_t v4 = +[_CDConstants shareSheetTargetBundleIdMessages]();
  }
  else
  {
    uint64_t v5 = +[_CDConstants mobileMailBundleId]();
    int v6 = [v1 isEqual:v5];

    long long v7 = v1;
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v4 = +[_CDConstants shareSheetTargetBundleIdMail]();
  }
  long long v7 = (void *)v4;

LABEL_6:
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

void sub_18ED047D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

void sub_18ED04CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED05A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED05B30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED05DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED05F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED06864(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED06954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED06BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void _cdknowledge_signpost_delete_end(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v4))
  {
    int v5 = 134349312;
    uint64_t v6 = a1;
    __int16 v7 = 2050;
    uint64_t v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", " DeleteCount=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v5, 0x16u);
  }
}

void _cdknowledge_signpost_delete_begin(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int v3 = +[_CDLogging knowledgeSignpost];
  BOOL v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      int v5 = _CDCurrentOrXPCProcessName();
      int v6 = 138543618;
      __int16 v7 = v5;
      __int16 v8 = 2114;
      id v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", " Process=%{signpost.telemetry:string1,public}@  Entity=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeleteObjects", (const char *)&unk_18EEB7986, (uint8_t *)&v6, 2u);
  }
}

void sub_18ED070D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18ED07374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return *(void *)(v0 + *(int *)(v1 + 1968));
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  return *(void *)a1;
}

id OUTLINED_FUNCTION_2_4(int a1, const char *a2, id self)
{
  return objc_getProperty(self, a2, 24, 1);
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  uint64_t v2 = *(void **)(v0 + 312);
  return [v2 me];
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return *(void *)(v0 + *(int *)(v1 + 668));
}

void OUTLINED_FUNCTION_13(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x2Au);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_0_3(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_0_9(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_0_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_0_15(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_18ED09468(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = [*(id *)(v2 + 40) persistentStoreCoordinator];
    uint64_t v5 = [v4 persistentStores];
    BOOL v6 = [v5 count] == 0;

    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v6)
    {
      if (v7) {
        __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1();
      }

      objc_end_catch();
      JUMPOUT(0x18ED09428);
    }
    if (v7) {
      __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_2();
    }
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_18ED09924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_18ED09C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED09D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED0A03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_streamNameFromStreams(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && [v1 count]
    && ([v2 firstObject],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 name],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    if ([v2 count] == 1)
    {
      uint64_t v5 = [v2 firstObject];
      BOOL v6 = [v5 name];
    }
    else
    {
      BOOL v6 = @"multiple";
    }
  }
  else
  {
    BOOL v6 = @"unknown";
  }

  return v6;
}

void sub_18ED0DF18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED0E140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED0F4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18ED0F740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED0F9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t getCNContactEmailAddressesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    id v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18ED0FC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CDInteractionNSXPCInterface()
{
  if (_CDInteractionNSXPCInterface_onceToken != -1) {
    dispatch_once(&_CDInteractionNSXPCInterface_onceToken, &__block_literal_global_35);
  }
  uint64_t v0 = (void *)_CDInteractionNSXPCInterface_interface;
  return v0;
}

void _cdcontextstore_signpost_deregister_end()
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)id v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeRegisterKeyPath", (const char *)&unk_18EEB7986, v1, 2u);
    }
  }
}

void _cdcontextstore_signpost_deregister_begin(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v2 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v2))
    {
      uint64_t v3 = _CDCurrentOrXPCProcessName();
      int v4 = 138543618;
      uint64_t v5 = v3;
      __int16 v6 = 2114;
      id v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeRegisterKeyPath", " Process=%{signpost.telemetry:string1,public}@  RegistrationID=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_18ED15B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
}

void sub_18ED171D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location)
{
}

void sub_18ED199C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  uint64_t v2 = *(void **)(v0 + 312);
  return [v2 me];
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

void sub_18ED1B3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED1BAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_18ED1BE60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED1C4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_18ED1C7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED1CD14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED1D060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED22808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED22A94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CloudFamilyAnalysisPETCloudFamilyAnalysisEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_23:
        uint64_t v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 8) = v23;
        goto LABEL_38;
      case 4u:
        uint64_t v27 = objc_alloc_init(CloudFamilyAnalysisPETContactEvents);
        objc_storeStrong((id *)(a1 + 24), v27);
        if PBReaderPlaceMark() && (CloudFamilyAnalysisPETContactEventsReadFrom(v27, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t _CDStartDateCompare(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 startDate];
  __int16 v6 = [v4 startDate];
  uint64_t v7 = [v5 compare:v6];
  if (!v7)
  {
    char v8 = [v3 endDate];
    unsigned int v9 = [v4 endDate];
    uint64_t v7 = [v8 compare:v9];
    if (!v7)
    {
      unint64_t v10 = [v3 uuid];
      uint64_t v11 = [v4 uuid];
      uint64_t v7 = [v10 compare:v11];
    }
  }

  return v7;
}

uint64_t kCDStartDateReverseComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _CDStartDateCompare(a3, a2);
}

void sub_18ED2542C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED25A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CDNormalizedStringFromQueryString(void *a1)
{
  uint64_t v1 = [a1 dataUsingEncoding:4];
  unint64_t v2 = [v1 length];
  id v3 = objc_opt_new();
  if (!v2) {
    goto LABEL_185;
  }
  unsigned int v4 = 0;
  unsigned int v5 = 0;
  int v6 = 1;
  while (2)
  {
    switch(v6)
    {
      case 1:
        id v7 = v1;
        char v8 = v7;
        unsigned __int8 v98 = 0;
        if ((v5 & 0x80000000) != 0)
        {

          id v33 = v8;
          goto LABEL_105;
        }
        if ([v7 length] <= (unint64_t)v5)
        {
        }
        else
        {
          objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
          int v9 = v98;

          if (v9 != 67) {
            goto LABEL_65;
          }
          id v10 = v8;
          unsigned __int8 v98 = 0;
          if ([v10 length] <= (unint64_t)(v5 + 1)) {
            goto LABEL_64;
          }
          objc_msgSend(v10, "getBytes:range:", &v98, v5 + 1, 1);
          int v11 = v98;

          if (v11 != 65) {
            goto LABEL_65;
          }
          id v12 = v10;
          unsigned __int8 v98 = 0;
          if ([v12 length] <= (unint64_t)(v5 + 2)) {
            goto LABEL_64;
          }
          objc_msgSend(v12, "getBytes:range:", &v98, v5 + 2, 1);
          int v13 = v98;

          if (v13 != 83) {
            goto LABEL_65;
          }
          unint64_t v96 = v5 + 3;
          id v14 = v12;
          unsigned __int8 v98 = 0;
          if ([v14 length] <= v96) {
            goto LABEL_64;
          }
          objc_msgSend(v14, "getBytes:range:", &v98);
          int v15 = v98;

          if (v15 != 84) {
            goto LABEL_65;
          }
          unint64_t v16 = v5 + 4;
          id v17 = v14;
          unsigned __int8 v98 = 0;
          if ([v17 length] <= v16)
          {
LABEL_64:
          }
          else
          {
            objc_msgSend(v17, "getBytes:range:", &v98, v5 + 4, 1);
            int v18 = v98;

            if (v18 == 40)
            {
              if (!v4)
              {
                unsigned __int8 v98 = 63;
                [v3 appendBytes:&v98 length:1];
              }
              ++v4;
              if (v2 <= v16) {
                unsigned int v5 = v2;
              }
              else {
                v5 += 4;
              }
              int v6 = 2;
              goto LABEL_151;
            }
          }
        }
LABEL_65:
        id v38 = v8;
        unsigned __int8 v98 = 0;
        if ([v8 length] <= (unint64_t)v5)
        {

LABEL_71:
          id v40 = v8;
          unsigned __int8 v98 = 0;
          if ([v8 length] <= (unint64_t)v5)
          {

            goto LABEL_79;
          }
          objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
          int v41 = v98;

          if (v41 != 32) {
            goto LABEL_79;
          }
          id v42 = v8;
          unsigned __int8 v98 = 0;
          if ([v42 length] <= (unint64_t)(v5 + 1))
          {

            goto LABEL_79;
          }
          objc_msgSend(v42, "getBytes:range:", &v98, v5 + 1, 1);
          int v43 = v98;

          if (v43 != 45) {
            goto LABEL_79;
          }
          id v44 = v42;
          unsigned __int8 v98 = 0;
          if ([v44 length] <= (unint64_t)(v5 + 2))
          {

            unsigned int v46 = 0;
          }
          else
          {
            objc_msgSend(v44, "getBytes:range:", &v98, v5 + 2, 1);
            int v45 = (char)v98;

            unsigned int v46 = v45;
            if (v45 < 0)
            {
              int v47 = __maskrune(v45, 0x400uLL);
LABEL_155:
              if (v47) {
                goto LABEL_160;
              }
LABEL_79:
              id v48 = v8;
              unsigned __int8 v98 = 0;
              if ([v8 length] <= (unint64_t)v5)
              {

                goto LABEL_86;
              }
              objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
              int v49 = v98;

              if (v49 != 32) {
                goto LABEL_86;
              }
              id v50 = v8;
              unsigned __int8 v98 = 0;
              if ([v50 length] <= (unint64_t)(v5 + 1))
              {

                unsigned int v52 = 0;
              }
              else
              {
                objc_msgSend(v50, "getBytes:range:", &v98, v5 + 1, 1);
                int v51 = (char)v98;

                unsigned int v52 = v51;
                if (v51 < 0)
                {
                  if (__maskrune(v51, 0x400uLL)) {
                    goto LABEL_139;
                  }
                  goto LABEL_86;
                }
              }
              if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v52 + 60) & 0x400) != 0)
              {
LABEL_139:
                unsigned __int8 v98 = 32;
                objc_msgSend(v3, "appendBytes:length:", &v98, 1, v96);
                if (!v4)
                {
                  unsigned __int8 v98 = 63;
                  [v3 appendBytes:&v98 length:1];
                }
                ++v4;
                unint64_t v85 = v5 + 2;
LABEL_163:
                if (v2 <= v85) {
                  unsigned int v5 = v2;
                }
                else {
                  unsigned int v5 = v85;
                }
LABEL_47:
                int v6 = 4;
                goto LABEL_151;
              }
LABEL_86:
              id v53 = v8;
              unsigned __int8 v98 = 0;
              if ([v8 length] <= (unint64_t)v5)
              {

                goto LABEL_98;
              }
              objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
              int v54 = v98;

              if (v54 == 32)
              {
                id v55 = v8;
                unsigned __int8 v98 = 0;
                if ([v55 length] <= (unint64_t)(v5 + 1)) {
                  goto LABEL_97;
                }
                objc_msgSend(v55, "getBytes:range:", &v98, v5 + 1, 1);
                int v56 = v98;

                if (v56 != 45) {
                  goto LABEL_98;
                }
                id v57 = v55;
                unsigned __int8 v98 = 0;
                if ([v57 length] <= (unint64_t)(v5 + 2))
                {
LABEL_97:

                  goto LABEL_98;
                }
                objc_msgSend(v57, "getBytes:range:", &v98, v5 + 2, 1);
                int v58 = v98;

                if (v58 != 46) {
                  goto LABEL_98;
                }
                id v59 = v57;
                unsigned __int8 v98 = 0;
                if ([v59 length] <= (unint64_t)(v5 + 3))
                {

                  unsigned int v61 = 0;
                }
                else
                {
                  objc_msgSend(v59, "getBytes:range:", &v98, v5 + 3, 1);
                  int v60 = (char)v98;

                  unsigned int v61 = v60;
                  if (v60 < 0)
                  {
                    int v62 = __maskrune(v60, 0x400uLL);
LABEL_168:
                    if (v62)
                    {
                      unsigned __int8 v98 = 32;
                      [v3 appendBytes:&v98 length:1];
                      if (!v4)
                      {
                        unsigned __int8 v98 = 63;
                        [v3 appendBytes:&v98 length:1];
                      }
                      ++v4;
                      unint64_t v85 = v5 + 4;
                      goto LABEL_163;
                    }
                    goto LABEL_98;
                  }
                }
                int v62 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v61 + 60) & 0x400;
                goto LABEL_168;
              }
LABEL_98:
              id v63 = v8;
              unsigned __int8 v98 = 0;
              if ([v8 length] > (unint64_t)v5)
              {
                objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
                int v64 = v98;

                if (v64 != 32) {
                  goto LABEL_106;
                }
                id v65 = v8;
                unsigned __int8 v98 = 0;
                if ([v65 length] > (unint64_t)(v5 + 1))
                {
                  objc_msgSend(v65, "getBytes:range:", &v98, v5 + 1, 1);
                  int v66 = v98;

                  if (v66 != 46) {
                    goto LABEL_106;
                  }
                  id v67 = v65;
                  unsigned __int8 v98 = 0;
                  if ([v67 length] <= (unint64_t)(v5 + 2))
                  {

                    unsigned int v69 = 0;
                  }
                  else
                  {
                    objc_msgSend(v67, "getBytes:range:", &v98, v5 + 2, 1);
                    int v68 = (char)v98;

                    unsigned int v69 = v68;
                    if (v68 < 0)
                    {
                      int v70 = __maskrune(v68, 0x400uLL);
                      goto LABEL_159;
                    }
                  }
                  int v70 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v69 + 60) & 0x400;
LABEL_159:
                  if (v70)
                  {
LABEL_160:
                    unsigned __int8 v98 = 32;
                    objc_msgSend(v3, "appendBytes:length:", &v98, 1, v96);
                    if (!v4)
                    {
                      unsigned __int8 v98 = 63;
                      [v3 appendBytes:&v98 length:1];
                    }
                    ++v4;
                    unint64_t v85 = v5 + 3;
                    goto LABEL_163;
                  }
LABEL_106:
                  if ((int)v4 < 1)
                  {
                    unsigned __int8 v97 = 0;
                    id v75 = v8;
                    unsigned __int8 v98 = 0;
                    if ((v5 & 0x80000000) != 0) {
                      goto LABEL_146;
                    }
                    unint64_t v73 = v5;
LABEL_144:
                    if (objc_msgSend(v8, "length", v96) > v73)
                    {
                      objc_msgSend(v8, "getBytes:range:", &v98, v73, 1);
                      unsigned __int8 v87 = v98;
LABEL_147:

                      unsigned __int8 v97 = v87;
                      int v6 = 1;
                      [v3 appendBytes:&v97 length:1];
                      goto LABEL_148;
                    }
LABEL_146:
                    unsigned __int8 v87 = 0;
                    goto LABEL_147;
                  }
                  id v71 = v8;
                  v72 = v71;
                  unsigned __int8 v98 = 0;
                  if ((v5 & 0x80000000) != 0)
                  {

                    id v76 = v72;
                  }
                  else
                  {
                    unint64_t v73 = v5;
                    if ([v71 length] <= (unint64_t)v5)
                    {
                    }
                    else
                    {
                      objc_msgSend(v72, "getBytes:range:", &v98, v5, 1);
                      int v74 = v98;

                      if (v74 == 32) {
                        goto LABEL_117;
                      }
                    }
                    id v77 = v72;
                    unsigned __int8 v98 = 0;
                    if ([v72 length] > (unint64_t)v5)
                    {
                      objc_msgSend(v72, "getBytes:range:", &v98, v5, 1);
                      int v78 = v98;

                      if (v78 == 44)
                      {
LABEL_117:
                        id v79 = v72;
                        unsigned __int8 v98 = 0;
                        if ([v79 length] <= (unint64_t)v5)
                        {
                        }
                        else
                        {
                          objc_msgSend(v79, "getBytes:range:", &v98, v5, 1);
                          int v80 = v98;

                          if (v80 == 32) {
                            goto LABEL_29;
                          }
                        }
                        id v83 = v79;
                        unsigned __int8 v98 = 0;
                        if ([v83 length] <= (unint64_t)v5)
                        {
                        }
                        else
                        {
                          objc_msgSend(v83, "getBytes:range:", &v98, v5, 1);
                          int v84 = v98;

                          if (v84 == 44) {
                            goto LABEL_29;
                          }
                        }
                        unsigned __int8 v97 = 0;
                        id v86 = v83;
                        unsigned __int8 v98 = 0;
                        goto LABEL_144;
                      }
LABEL_121:
                      if (v4 >= 2)
                      {
                        v81 = @"N";
                        if (v4 >= 0xA)
                        {
                          v81 = @"NN";
                          if (v4 >= 0x64)
                          {
                            v81 = @"NNN";
                            if (v4 >= 0x3E8)
                            {
                              v81 = @"NNNN";
                              if (v4 >> 4 >= 0x271)
                              {
                                if (v4 >> 5 >= 0xC35) {
                                  v81 = @"NNNNNN+";
                                }
                                else {
                                  v81 = @"NNNNN";
                                }
                              }
                            }
                          }
                        }
                        v82 = -[__CFString dataUsingEncoding:](v81, "dataUsingEncoding:", 4, v96);
                        [v3 appendData:v82];
                      }
                      unsigned int v4 = 0;
LABEL_131:
                      int v6 = 1;
                      goto LABEL_151;
                    }
                  }

                  goto LABEL_121;
                }
              }
LABEL_105:

              goto LABEL_106;
            }
          }
          int v47 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v46 + 60) & 0x400;
          goto LABEL_155;
        }
        objc_msgSend(v8, "getBytes:range:", &v98, v5, 1);
        int v39 = v98;

        if (v39 != 34) {
          goto LABEL_71;
        }
        if (!v4)
        {
          unsigned __int8 v98 = 63;
          [v3 appendBytes:&v98 length:1];
        }
        ++v4;
        BOOL v37 = v2 > v5 + 1;
LABEL_60:
        if (v37) {
          ++v5;
        }
        else {
          unsigned int v5 = v2;
        }
LABEL_63:
        int v6 = 3;
LABEL_151:
        if (v2 > (int)v5) {
          continue;
        }
        if ((int)v4 >= 2)
        {
          v88 = @"NN";
          v89 = @"NNN";
          v90 = @"NNNN";
          v91 = @"NNNNNN+";
          if (v4 >> 5 < 0xC35) {
            v91 = @"NNNNN";
          }
          if (v4 >> 4 >= 0x271) {
            v90 = v91;
          }
          if (v4 >= 0x3E8) {
            v89 = v90;
          }
          if (v4 >= 0x64) {
            v88 = v89;
          }
          if (v4 >= 0xA) {
            v92 = v88;
          }
          else {
            v92 = @"N";
          }
          v93 = -[__CFString dataUsingEncoding:](v92, "dataUsingEncoding:", 4, v96);
          [v3 appendData:v93];
        }
LABEL_185:
        v94 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

        return v94;
      case 2:
        id v19 = v1;
        uint64_t v20 = v19;
        unsigned __int8 v98 = 0;
        if ((v5 & 0x80000000) != 0 || [v19 length] <= (unint64_t)v5)
        {

          int v6 = 2;
        }
        else
        {
          objc_msgSend(v20, "getBytes:range:", &v98, v5, 1);
          unsigned __int8 v21 = v98;

          if (v21 == 41) {
            int v6 = 1;
          }
          else {
            int v6 = 2;
          }
        }
LABEL_148:
        if (v2 > (int)(v5 + 1)) {
          ++v5;
        }
        else {
          unsigned int v5 = v2;
        }
        goto LABEL_151;
      case 3:
        id v22 = v1;
        uint64_t v23 = v22;
        unsigned __int8 v98 = 0;
        if ((v5 & 0x80000000) != 0)
        {

          id v34 = v23;
LABEL_58:

LABEL_59:
          BOOL v37 = v2 > (int)(v5 + 1);
          goto LABEL_60;
        }
        if ([v22 length] <= (unint64_t)v5)
        {
        }
        else
        {
          objc_msgSend(v23, "getBytes:range:", &v98, v5, 1);
          int v24 = v98;

          if (v24 == 34)
          {
LABEL_29:
            if (v2 > v5 + 1) {
              ++v5;
            }
            else {
              unsigned int v5 = v2;
            }
            goto LABEL_131;
          }
        }
        id v35 = v23;
        unsigned __int8 v98 = 0;
        if ([v23 length] <= (unint64_t)v5) {
          goto LABEL_58;
        }
        objc_msgSend(v23, "getBytes:range:", &v98, v5, 1);
        int v36 = v98;

        if (v36 != 92) {
          goto LABEL_59;
        }
        if (v2 <= v5 + 2) {
          unsigned int v5 = v2;
        }
        else {
          v5 += 2;
        }
        goto LABEL_63;
      case 4:
        id v25 = v1;
        char v26 = v25;
        unsigned __int8 v98 = 0;
        if ((v5 & 0x80000000) != 0 || [v25 length] <= (unint64_t)v5)
        {

          unsigned int v29 = 0;
        }
        else
        {
          unint64_t v27 = v5;
          objc_msgSend(v26, "getBytes:range:", &v98, v5, 1);
          int v28 = (char)v98;

          unsigned int v29 = v28;
          if (v28 < 0)
          {
            if (__maskrune(v28, 0x400uLL)) {
              goto LABEL_44;
            }
            id v30 = v26;
            unsigned __int8 v98 = 0;
            goto LABEL_42;
          }
        }
        if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v29 + 60) & 0x400) != 0) {
          goto LABEL_44;
        }
        id v31 = v26;
        unsigned __int8 v98 = 0;
        if ((v5 & 0x80000000) != 0) {
          goto LABEL_50;
        }
        unint64_t v27 = v5;
LABEL_42:
        if (objc_msgSend(v26, "length", v96) <= v27)
        {
LABEL_50:

          goto LABEL_131;
        }
        objc_msgSend(v26, "getBytes:range:", &v98, v27, 1);
        int v32 = v98;

        if (v32 != 46)
        {
          int v6 = 1;
          goto LABEL_151;
        }
LABEL_44:
        if (v2 > (int)(v5 + 1)) {
          ++v5;
        }
        else {
          unsigned int v5 = v2;
        }
        goto LABEL_47;
      default:
        goto LABEL_151;
    }
  }
}

void *_isTimeRestrictionOverwritten()
{
  if (!+[_CDDeviceInfo isRunningOnInternalBuild]) {
    return 0;
  }
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  uint64_t v1 = v0;
  if (v0)
  {
    unint64_t v2 = [v0 objectForKey:@"AutoSUTimeRestrictionOverwrite"];

    if (v2) {
      unint64_t v2 = (void *)[v1 BOOLForKey:@"AutoSUTimeRestrictionOverwrite"];
    }
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

void sub_18ED2D0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18ED2D170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED2D2B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t findAutoSuPlanByProbability(uint64_t a1, int *a2, int *a3, int *a4, int *a5, int *a6, void *a7)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  uint64_t v14 = 0;
  double v15 = 1.0;
  do
  {
    double v16 = *(double *)(a1 + v14);
    BOOL v17 = v16 >= 0.0 && v16 <= 1.0;
    if (!v17)
    {
      uint64_t v20 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        findAutoSuPlanByProbability_cold_1();
      }
LABEL_31:

      goto LABEL_32;
    }
    v14 += 8;
  }
  while (v14 != 768);
  uint64_t v18 = 0;
  *a3 = -1;
  *a4 = -1;
  *a6 = -1;
  while (1)
  {
    double v19 = *(double *)(a1 + 8 * v18);
    objc_msgSend(v13, "startThreshold", v15);
    if (v19 > v15) {
      break;
    }
    if (++v18 == 96) {
      goto LABEL_15;
    }
  }
  *a3 = v18;
LABEL_15:
  uint64_t v22 = 95;
  while (1)
  {
    double v23 = *(double *)(a1 + 8 * v22);
    if (*a6 == -1 && v23 > 0.0) {
      *a6 = v22;
    }
    [v13 endThreshold];
    if (v23 > v24) {
      break;
    }
    if (--v22 == -1) {
      goto LABEL_23;
    }
  }
  *a4 = v22;
LABEL_23:
  uint64_t v25 = *a3;
  if (v25 == -1 || *a4 == -1)
  {
    uint64_t v20 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      findAutoSuPlanByProbability_cold_2();
    }
    goto LABEL_31;
  }
  uint64_t v26 = v25 + 1;
  *a3 = v25 + 1;
  if (*a4 - ((int)v25 + 1) < 4)
  {
    unint64_t v27 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      findAutoSuPlanByProbability_cold_3(a3, a4, v27);
    }

    goto LABEL_32;
  }
  if ((int)v25 < -1)
  {
LABEL_39:
    uint64_t v20 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_INFO, "Unable to propose last unlock time. Returning default times.", (uint8_t *)&v55, 2u);
    }
    goto LABEL_31;
  }
  id v30 = (double *)(a1 + 8 * v26);
  while (1)
  {
    double v31 = 1.0 - *v30;
    [v13 unlockThreshold];
    if (v31 >= v32) {
      break;
    }
    --v30;
    BOOL v17 = (int)v26 <= 0;
    LODWORD(v26) = v26 - 1;
    if (v17) {
      goto LABEL_39;
    }
  }
  int v33 = [v13 unlockMarginInSlot];
  *a2 = (v26 - v33) & ~(((int)v26 - v33) >> 31);
  *a5 = *a4;
  id v34 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    int v35 = *a2;
    int v36 = *a3;
    int v37 = *a4;
    int v38 = *a5;
    int v39 = *a6;
    int v55 = 67110144;
    int v56 = v35;
    __int16 v57 = 1024;
    int v58 = v36;
    __int16 v59 = 1024;
    int v60 = v37;
    __int16 v61 = 1024;
    int v62 = v38;
    __int16 v63 = 1024;
    int v64 = v39;
    _os_log_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_INFO, "(Before intersection): bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d, unrestrictedSleepEnd:%d\n", (uint8_t *)&v55, 0x20u);
  }

  if (!_isTimeRestrictionOverwritten())
  {
    int v45 = *a3;
    int v46 = [v13 restrictionStartInSlot];
    if (v45 <= v46) {
      int v45 = v46;
    }
    int v47 = *a4;
    int v48 = [v13 restrictionEndInSlot];
    if (v47 >= v48) {
      int v47 = v48;
    }
    if (v47 - v45 > 3)
    {
      if (*a3 != v45) {
        +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.suStartTruncated"];
      }
      if (*a4 != v47) {
        +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.suEndTruncated"];
      }
      *a3 = v45;
      *a4 = v47;
      *a5 = v47;
      int v49 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        int v50 = *a2;
        int v51 = *a3;
        int v52 = *a4;
        int v53 = *a5;
        int v54 = *a6;
        int v55 = 67110144;
        int v56 = v50;
        __int16 v57 = 1024;
        int v58 = v51;
        __int16 v59 = 1024;
        int v60 = v52;
        __int16 v61 = 1024;
        int v62 = v53;
        __int16 v63 = 1024;
        int v64 = v54;
        _os_log_impl(&dword_18ECEB000, v49, OS_LOG_TYPE_INFO, "(After intersection): bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d unrestrictedSleepEnd:%d\n", (uint8_t *)&v55, 0x20u);
      }

      goto LABEL_61;
    }
    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.insufficientInterval"];
LABEL_32:
    uint64_t v28 = 0xFFFFFFFFLL;
    goto LABEL_33;
  }
  if (*a4 - *a3 < 4) {
    goto LABEL_32;
  }
  id v40 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    int v41 = *a2;
    int v42 = *a3;
    int v43 = *a4;
    int v44 = *a5;
    int v55 = 67109888;
    int v56 = v41;
    __int16 v57 = 1024;
    int v58 = v42;
    __int16 v59 = 1024;
    int v60 = v43;
    __int16 v61 = 1024;
    int v62 = v44;
    _os_log_impl(&dword_18ECEB000, v40, OS_LOG_TYPE_INFO, "Internal testing build - AutoSU Time Restriction check disabled\n(Without restriction) bestLastUnlock:%d, bestSuStart:%d, bestSuEnd:%d, expiration:%d\n", (uint8_t *)&v55, 0x1Au);
  }

LABEL_61:
  uint64_t v28 = 0;
LABEL_33:

  return v28;
}

uint64_t active_memory_limit()
{
  if (active_memory_limit_onceToken != -1) {
    dispatch_once(&active_memory_limit_onceToken, &__block_literal_global_1);
  }
  return active_memory_limit_limit;
}

void __active_memory_limit_block_invoke()
{
  v1[0] = 0;
  v1[1] = 0;
  getpid();
  if (memorystatus_control())
  {
    uint64_t v0 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __active_memory_limit_block_invoke_cold_2(v0);
    }
  }
  else
  {
    active_memory_limit_limit = LODWORD(v1[0]) << 20;
    uint64_t v0 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      __active_memory_limit_block_invoke_cold_1((int *)v1, v0);
    }
  }
}

void sub_18ED2F4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_DKSyncTransportName(uint64_t a1)
{
  uint64_t v1 = @"CloudDown";
  unint64_t v2 = &stru_1EDDE58B8;
  if (a1 == 8) {
    unint64_t v2 = @"CloudUp";
  }
  if (a1 != 4) {
    uint64_t v1 = v2;
  }
  if (a1 == 1) {
    id v3 = @"Rapport";
  }
  else {
    id v3 = v1;
  }
  if ([(__CFString *)v3 hasPrefix:@"Cloud"]) {
    return @"Cloud";
  }
  else {
    return v3;
  }
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t _CDPerfMetricInitialize()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_CDPerfMetricFamilies;
  _CDPerfMetricFamilies = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.coreduet.perfmetric", 0);
  uint64_t v3 = _CDPerfMetricQueue;
  _CDPerfMetricQueue = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void CDPerfMetricStartTiming(void *a1)
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    *a1 = v2;
  }
}

void CDPerfMetricEndTimingAndSetResultCountMaybeIncrementErrorCount(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 && a2)
  {
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    id v8 = a1;
    id v10 = [v7 date];
    [v10 timeIntervalSinceReferenceDate];
    *(void *)(a2 + 8) = v9;
    [v8 endTimingWithEvent:a2 resultCount:a3 incrementErrorCount:a4];
  }
}

void CDPerfMetricEndTiming(void *a1, uint64_t a2)
{
}

void CDPerfMetricEndTimingAndSetResultCount(void *a1, uint64_t a2, uint64_t a3)
{
}

void CDPerfMetricEndTimingAndIncrementErrorCount(void *a1, uint64_t a2)
{
}

void sub_18ED35C44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_18ED3724C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18ED3789C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18ED37BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED3A728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED3B814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  objc_destroyWeak(v43);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v45 - 144));
  _Unwind_Resume(a1);
}

void sub_18ED3CA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _siriSyncEnabledDidChangeCallback(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___siriSyncEnabledDidChangeCallback_block_invoke;
  v4[3] = &unk_1E560D578;
  id v5 = v2;
  id v3 = v2;
  +[_DKSyncSerializer performAsyncBlock:v4];
}

void sub_18ED3DEBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18ED3E16C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ___siriSyncEnabledDidChangeCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    -[_DKSync2Coordinator _deleteSiriEventsIfSiriCloudSyncHasBeenDisabled](v1);
  }
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return [v0 code];
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 40) = a1;
  return objc_opt_class();
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

uint64_t sleepPredictionWithParams2(double *a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  signed int v11 = validatePastDetection(a2, a3);
  if (v11 == -1)
  {
    int v44 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sleepPredictionWithParams2_cold_1(v44);
    }

    return 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v12 = v11;
    unsigned int v13 = v11 / 96;
    uint64_t v14 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sleepPredictionWithParams2_cold_3(v13, v14);
    }

    v51[1] = v51;
    unint64_t v15 = (384 * v13 + 15) & 0xFFFFFFFFFFFFFFF0;
    ((void (*)(void))MEMORY[0x1F4188790])();
    uint64_t v16 = v12 / 0x60;
    if ((int)v16 >= 1)
    {
      uint64_t v17 = 0;
      int v18 = -1;
      double v19 = (char *)v51 - v15;
      do
      {
        uint64_t v20 = v19;
        uint64_t v21 = 96;
        do
          *v20++ = *(_DWORD *)(a2 + 4 * (v18 + (int)v21--));
        while (v21);
        ++v17;
        v19 += 384;
        v18 += 96;
      }
      while (v17 != v16);
    }
    uint64_t v22 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
    double v24 = (int *)((char *)v51 - ((v23 + 15) & 0x7FFFFFFF0));
    uint64_t v25 = MEMORY[0x1F4188790](v22);
    unint64_t v27 = (char *)v51 - v26;
    earlyAggregate(v25, (uint64_t)v24, (uint64_t)v51 - v26, v13);
    uint64_t v29 = MEMORY[0x1F4188790](v28);
    MEMORY[0x1F4188790](v29);
    id v30 = cumulateSleepWakeProbability(v24, (uint64_t)v27, (uint64_t)v51 - v15, (uint64_t)v51 - v15, v13);
    unsigned int v31 = 96 * v13;
    uint64_t v32 = MEMORY[0x1F4188790](v30);
    id v34 = (char *)v51 - ((v33 + 15) & 0x7FFFFFFF0);
    MEMORY[0x1F4188790](v32);
    int v36 = (char *)v51 - v35;
    convert2dArrayTo1dReversedBitPattern((uint64_t)v51 - v15, v12, (uint64_t)v34);
    uint64_t v37 = convert2dArrayTo1dReversedBitPattern((uint64_t)v51 - v15, v12, (uint64_t)v36);
    uint64_t v38 = MEMORY[0x1F4188790](v37);
    id v40 = (double *)((char *)v51 - ((v39 + 15) & 0xFFFFFFFF0));
    MEMORY[0x1F4188790](v38);
    int v42 = (double *)((char *)v51 - v41);
    if (sleepPredictionWithParams1((uint64_t)v40, (uint64_t)v34, v31, a4, a5, a6)
      || sleepPredictionWithParams1((uint64_t)v42, (uint64_t)v36, v31, a4, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v45 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        sleepPredictionWithParams2_cold_2(96, v45);
      }

      uint64_t v46 = 0;
      do
      {
        *a1 = 1.0 - fmin(*v40, *v42);
        int v47 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          double v48 = *a1;
          double v49 = *v40;
          double v50 = *v42;
          *(_DWORD *)buf = 67109888;
          int v53 = v46;
          __int16 v54 = 2048;
          double v55 = v48;
          __int16 v56 = 2048;
          double v57 = v49;
          __int16 v58 = 2048;
          double v59 = v50;
          _os_log_debug_impl(&dword_18ECEB000, v47, OS_LOG_TYPE_DEBUG, "Sleep Prediction: prediction[%d] = %f, agg_sleep = %f, agg_wake = %f", buf, 0x26u);
        }

        ++v46;
        ++a1;
        ++v42;
        ++v40;
      }
      while (v46 != 96);
      return 0;
    }
  }
}

uint64_t convert1dReversedBitPatternTo2dArray(uint64_t result, unsigned int a2, _DWORD *a3)
{
  uint64_t v3 = a2 / 0x60;
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    int v5 = -1;
    do
    {
      int v6 = a3;
      uint64_t v7 = 96;
      do
        *v6++ = *(_DWORD *)(result + 4 * (v5 + (int)v7--));
      while (v7);
      ++v4;
      v5 += 96;
      a3 += 96;
    }
    while (v4 != v3);
  }
  return result;
}

void earlyAggregate(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a4;
    while (1)
    {
      int MaxInterval = getMaxInterval();
      uint64_t v10 = +[_CDLogging knowledgeChannel];
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (MaxInterval != -1) {
        break;
      }
      if (v11)
      {
        *(_DWORD *)buf = 67109120;
        int v15 = v7;
        unsigned int v12 = v10;
        unsigned int v13 = "Sleep Prediction: Day %d: could not find desired inactive period of any length\n";
LABEL_13:
        _os_log_debug_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 8u);
      }
LABEL_10:

      *(_DWORD *)(a2 + 4 * v7) = -1;
      *(_DWORD *)(a3 + 4 * v7++) = -1;
      a1 += 384;
      if (v8 == v7) {
        return;
      }
    }
    if (v11)
    {
      *(_DWORD *)buf = 67109632;
      int v15 = v7;
      __int16 v16 = 1024;
      int v17 = 0;
      __int16 v18 = 1024;
      int v19 = 0;
      _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "Sleep Prediction: Day %d: longest interval (start, duration) = (%d, %d)\n", buf, 0x14u);
    }

    uint64_t v10 = +[_CDLogging knowledgeChannel];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v7;
    unsigned int v12 = v10;
    unsigned int v13 = "Sleep Prediction: Day %d: could not find long enough inactive period to be considered as valid sleep period\n";
    goto LABEL_13;
  }
}

int *cumulateSleepWakeProbability(int *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5 >= 1)
  {
    uint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = a5;
    uint64_t v10 = a4;
    uint64_t v11 = a3;
    do
    {
      uint64_t v12 = 384 * v8;
      if (v7[v8] == -1)
      {
        uint64_t result = (int *)memset((void *)(a3 + v12), 255, 0x180uLL);
        uint64_t v14 = (int *)(a2 + 4 * v8);
        if (*v14 != -1) {
          goto LABEL_10;
        }
      }
      else
      {
        for (uint64_t i = 0; i != 96; ++i)
          *(_DWORD *)(v11 + 4 * i) = i >= v7[v8];
        uint64_t v14 = (int *)(a2 + 4 * v8);
        if (*v14 != -1)
        {
LABEL_10:
          for (uint64_t j = 0; j != 96; ++j)
            *(_DWORD *)(v10 + 4 * j) = j <= *v14;
          goto LABEL_14;
        }
      }
      uint64_t result = (int *)memset((void *)(a4 + v12), 255, 0x180uLL);
LABEL_14:
      ++v8;
      v11 += 384;
      v10 += 384;
    }
    while (v8 != v9);
  }
  return result;
}

uint64_t convert2dArrayTo1dReversedBitPattern(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = a2 / 0x60;
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = (int *)(result + 384 * v4++);
      int v6 = 96 * v4 - 1;
      uint64_t v7 = 96;
      do
      {
        int v8 = *v5++;
        *(_DWORD *)(a3 + 4 * v6--) = v8;
        --v7;
      }
      while (v7);
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t getMaxInterval()
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFF0);
  if ((int)v2 < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = 0;
  for (uint64_t i = (int *)(v0 + 4); *(i - 1) != 1; ++i)
  {
    if (v2 == ++v5) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v7 = v5 + 1;
  if ((int)v5 + 1 >= (int)v2) {
    return 0xFFFFFFFFLL;
  }
  while (*i)
  {
    ++v7;
    ++i;
    if (v2 == v7) {
      return 0xFFFFFFFFLL;
    }
  }
  if ((int)v2 <= (int)v7) {
    return 0xFFFFFFFFLL;
  }
  do
  {
    int v8 = *i++;
    if (v8 == 1) {
      break;
    }
    LODWORD(v7) = v7 + 1;
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  while ((int)v2 > (int)v7);
  int v10 = 0;
  LODWORD(v11) = 0;
  uint64_t v12 = v2 - 1;
  do
  {
    int v13 = *(_DWORD *)(v0 + 4 * v5);
    if (v13 == 1 && !*(_DWORD *)(v0 + 4 * v5 + 4)) {
      int v10 = v5;
    }
    if (!v13 && *(_DWORD *)(v0 + 4 * v5 + 4) == 1)
    {
      uint64_t v14 = &v4[8 * (int)v11];
      LODWORD(v11) = v11 + 1;
      *(_DWORD *)uint64_t v14 = v10 + 1;
      *((_DWORD *)v14 + 1) = v5 - v10;
    }
    ++v5;
  }
  while (v12 != v5);
  if ((int)v11 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v15 = (int *)(v4 + 4);
  int v16 = -1;
  int v17 = -1;
  uint64_t v11 = v11;
  do
  {
    if (*v15 > v16)
    {
      int v17 = *(v15 - 1);
      int v16 = *v15;
    }
    v15 += 2;
    --v11;
  }
  while (v11);
  uint64_t v9 = 0xFFFFFFFFLL;
  if (v16 != -1 && v17 != -1)
  {
    uint64_t v9 = 0;
    *uint64_t v1 = v17;
    v1[1] = v16;
  }
  return v9;
}

void sub_18ED405C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED40908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED40B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED40E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED41074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id reasonToString(uint64_t a1)
{
  v9[11] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)reasonToString_map;
  if (!reasonToString_map)
  {
    v8[0] = &unk_1EDE1D610;
    v8[1] = &unk_1EDE1D628;
    v9[0] = @"Frequent";
    v9[1] = @"Recent";
    v8[2] = &unk_1EDE1D640;
    v8[3] = &unk_1EDE1D658;
    v9[2] = @"TimeOfDay";
    v9[3] = @"Location";
    v8[4] = &unk_1EDE1D670;
    v8[5] = &unk_1EDE1D688;
    v9[4] = @"Calendar";
    v9[5] = @"RelatedContacts";
    v8[6] = &unk_1EDE1D6A0;
    v8[7] = &unk_1EDE1D6B8;
    v9[6] = @"ObservedInterest";
    v9[7] = @"WaitingForResponse";
    v8[8] = &unk_1EDE1D6D0;
    v8[9] = &unk_1EDE1D6E8;
    v9[8] = @"Keywords";
    v9[9] = @"Active";
    v8[10] = &unk_1EDE1D700;
    v9[10] = @"Nearby";
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:11];
    uint64_t v4 = (void *)reasonToString_map;
    reasonToString_map = v3;

    uint64_t v2 = (void *)reasonToString_map;
  }
  uint64_t v5 = [NSNumber numberWithInteger:a1];
  int v6 = [v2 objectForKeyedSubscript:v5];

  return v6;
}

void sub_18ED41B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED41CB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

void sub_18ED44778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FTCPPETParticipantReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_43:
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_39:
        *(unsigned char *)(a1 + 16) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18ED47A48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED47B94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED47CB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED47DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id resolve(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (resolve_onceToken != -1) {
    dispatch_once(&resolve_onceToken, &__block_literal_global_8);
  }
  id v10 = 0;
  uint64_t v5 = [v4 unifiedContactsMatchingPredicate:v3 keysToFetch:resolve_contactKeysToFetch error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      resolve_cold_1((uint64_t)v6, v7);
    }

    goto LABEL_7;
  }
  if (![v5 count])
  {
LABEL_7:
    char v8 = 0;
    goto LABEL_10;
  }
  char v8 = [v5 firstObject];
LABEL_10:

  return v8;
}

void __resolve_block_invoke()
{
  v18[16] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [getCNContactFormatterClass() descriptorForRequiredKeysForStyle:0];
  char v17 = getCNContactIdentifierKey();
  v18[0] = v17;
  int v16 = getCNContactNamePrefixKey();
  v18[1] = v16;
  int v15 = getCNContactGivenNameKey();
  v18[2] = v15;
  BOOL v14 = getCNContactMiddleNameKey();
  v18[3] = v14;
  char v13 = getCNContactFamilyNameKey();
  v18[4] = v13;
  unint64_t v12 = getCNContactPreviousFamilyNameKey();
  v18[5] = v12;
  uint64_t v1 = getCNContactNameSuffixKey();
  v18[6] = v1;
  uint64_t v2 = getCNContactNicknameKey();
  v18[7] = v2;
  id v3 = getCNContactOrganizationNameKey();
  v18[8] = v3;
  id v4 = getCNContactImageDataAvailableKey();
  v18[9] = v4;
  uint64_t v5 = getCNContactTypeKey();
  v18[10] = v5;
  id v6 = getCNContactPhoneNumbersKey();
  v18[11] = v6;
  uint64_t v7 = getCNContactEmailAddressesKey();
  v18[12] = v7;
  char v8 = getCNContactPostalAddressesKey();
  v18[13] = v8;
  unsigned int v9 = getCNContactInstantMessageAddressesKey();
  v18[14] = v9;
  v18[15] = v0;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:16];
  uint64_t v11 = (void *)resolve_contactKeysToFetch;
  resolve_contactKeysToFetch = v10;
}

double ceilDateWithOffset(double a1, long double a2, double a3, double a4)
{
  long double v6 = fmod(a1 + a4 - a3, a2);
  double v7 = a2 - v6;
  BOOL v8 = v6 == 0.0;
  double v9 = -0.0;
  if (!v8) {
    double v9 = v7;
  }
  return v9 + a1;
}

long double floorDateWithOffset(double a1, long double a2, double a3, double a4)
{
  return a1 - fmod(a1 + a4 - a3, a2);
}

void sub_18ED49AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, __CFString *a17, __CFString *a18, uint64_t a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  if (a2 != 1) {
    _Unwind_Resume(a1);
  }
  id v24 = objc_begin_catch(a1);
  uint64_t v25 = [*(id *)(v21 + 2288) syncChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:]((uint64_t)v24, v25);
  }

  if (!v19)
  {
LABEL_14:

    objc_end_catch();
    JUMPOUT(0x18ED49A60);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v24;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      char v28 = +[_DKSyncErrors domain];
      a16 = *MEMORY[0x1E4F28568];
      uint64_t v29 = [v24 reason];
      id v30 = (void *)v29;
      unsigned int v31 = @"Exception Caught";
      if (v29) {
        unsigned int v31 = (__CFString *)v29;
      }
      a17 = @"NSUnderlyingException";
      a18 = v31;
      a19 = (uint64_t)v24;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a18 forKeys:&a16 count:2];
      uint64_t v33 = [v27 errorWithDomain:v28 code:1 userInfo:v32];

      goto LABEL_13;
    }
    id v26 = +[_DKSyncErrors internalFailure];
  }
  uint64_t v33 = v26;
LABEL_13:
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v33);

  goto LABEL_14;
}

void OUTLINED_FUNCTION_4_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_18ED4BA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED4BE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

#error "18ED4BF34: call analysis failed (funcsize=63)"

void sub_18ED4D5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED4D914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED4DC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_18ED4DE18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED4ED40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED4F090(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED4F784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 200));
  objc_destroyWeak((id *)(v13 - 192));
  _Unwind_Resume(a1);
}

void sub_18ED4F8C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED50218(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED509A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED52970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 248));
  objc_destroyWeak((id *)(v3 - 240));
  _Unwind_Resume(a1);
}

void sub_18ED52CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED539C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_18ED540A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18ED54288(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

#error "18ED54550: call analysis failed (funcsize=177)"

#error "18ED548B4: call analysis failed (funcsize=88)"

#error "18ED54C00: call analysis failed (funcsize=88)"

void sub_18ED555C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_18ED55780(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_14_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return *(void *)(v0 + 40);
}

void OUTLINED_FUNCTION_31(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x34u);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_39(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return *(void *)v0;
}

void OUTLINED_FUNCTION_45(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v2 = *v0;
  return [v2 code];
}

void sub_18ED58E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *mechanismToString(unint64_t a1)
{
  if (a1 > 0x14) {
    return @"Unknown";
  }
  else {
    return off_1E560E2E8[a1];
  }
}

__CFString *directionToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Incoming";
  }
  else {
    return off_1E560E390[a1 - 1];
  }
}

void sub_18ED5F6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t __initPercentEscapes_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v1 = (void *)[v0 mutableCopy];

  objc_msgSend(v1, "addCharactersInRange:", 37, 1);
  uint64_t v2 = [v1 copy];

  uint64_t v3 = (void *)percentEscapes;
  percentEscapes = v2;

  uint64_t v4 = [(id)percentEscapes invertedSet];
  uint64_t v5 = inversePercentEscapes;
  inversePercentEscapes = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

id stringifyRecipientList_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 recipients];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = +[_CDInteraction generateConversationIdFromInteractionRecipientRecords:v3];

  return v4;
}

BOOL _DKPRStreamReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(_DKPRValueType **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v18 = objc_alloc_init(_DKPRValueType);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (_DKPRValueTypeReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _DKPRValueReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unsigned int v18 = objc_alloc_init(_DKPRValueType);
          objc_storeStrong((id *)(a1 + 48), v18);
          if PBReaderPlaceMark() && (_DKPRValueTypeReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_36;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 56) |= 4u;
          break;
        case 5u:
          *(unsigned char *)(a1 + 56) |= 2u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          uint64_t v35 = 16;
          goto LABEL_48;
        case 6u:
          uint64_t v20 = PBReaderReadData();
          uint64_t v21 = 32;
LABEL_36:
          uint64_t v32 = *(void **)(a1 + v21);
          *(void *)(a1 + v21) = v20;

          continue;
        case 7u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          uint64_t v35 = 8;
LABEL_48:
          *(void *)(a1 + v35) = v31;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v3;
        uint64_t v26 = *(void *)(a2 + v25);
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_41;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          uint64_t v24 = 0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v24 = 0;
      }
LABEL_43:
      *(void *)(a1 + 24) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id _CDDomainAvailabilityDescription(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = v2;
  if (a1) {
    [v2 addObject:@"system"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"user"];
  }
  uint64_t v4 = [v3 componentsJoinedByString:@"|"];

  return v4;
}

void __dataCollectionIsEnabled_block_invoke()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
  id v37 = 0;
  uint64_t v1 = [v0 getUserDefaultVoiceSubscriptionContext:&v37];
  id v2 = v37;
  if (v1) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id v36 = 0;
    uint64_t v12 = (void *)[v0 copyMobileSubscriberCountryCode:v1 error:&v36];
    id v13 = v36;
    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      id v35 = 0;
      uint64_t v22 = [v0 copyMobileSubscriberIsoCountryCode:v12 error:&v35];
      id v4 = v35;
      unsigned int v23 = (void *)dataCollectionIsEnabled_countryCode;
      dataCollectionIsEnabled_countryCode = v22;

      if (!dataCollectionIsEnabled_countryCode || v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          __dataCollectionIsEnabled_block_invoke_cold_3((uint64_t)v4, v26, v27, v28, v29, v30, v31, v32);
        }
        uint64_t v33 = (void *)dataCollectionIsEnabled_countryCode;
        dataCollectionIsEnabled_countryCode = 0;
      }
      else
      {
        if ([(id)dataCollectionIsEnabled_countryCode length])
        {
          uint64_t v24 = [(id)dataCollectionIsEnabled_countryCode lowercaseString];
          uint64_t v25 = (void *)dataCollectionIsEnabled_countryCode;
          dataCollectionIsEnabled_countryCode = v24;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unint64_t v34 = 0;
            _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Country code not set", v34, 2u);
          }
          uint64_t v25 = (void *)dataCollectionIsEnabled_countryCode;
          dataCollectionIsEnabled_countryCode = 0;
        }

        id v4 = 0;
      }
    }
    else
    {
      id v4 = v13;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        __dataCollectionIsEnabled_block_invoke_cold_2((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    id v4 = v2;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __dataCollectionIsEnabled_block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  id v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

void OUTLINED_FUNCTION_6_2(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x3Eu);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return *(void *)(v0 + *(int *)(v1 + 1968));
}

uint64_t PersonLinkingPersonPairReadFrom(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = objc_alloc_init(PersonLinkingPerson);
        uint64_t v19 = 24;
        goto LABEL_23;
      case 2u:
        uint64_t v18 = objc_alloc_init(PersonLinkingPerson);
        uint64_t v19 = 32;
LABEL_23:
        objc_storeStrong((id *)(a1 + v19), v18);
        if (PBReaderPlaceMark() && PersonLinkingPersonReadFrom(v18, a2))
        {
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_40:
        *(unsigned char *)(a1 + 40) = v23 != 0;
        goto LABEL_43;
      case 4u:
        *(unsigned char *)(a1 + 44) |= 1u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
        {
          int v30 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v30 = 0;
        }
        *(_DWORD *)(a1 + 8) = v30;
        goto LABEL_43;
      case 5u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v31;

        goto LABEL_43;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

void sub_18ED67758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED68A40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6A20C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 688), 8);
  _Block_object_dispose((const void *)(v1 + 736), 8);
  _Unwind_Resume(a1);
}

void sub_18ED6A938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6AE6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DKOBSERVER_IS_CALLING_ASYNC_INVOCATION__(void *a1)
{
  id v2 = a1;
  uint64_t v1 = (void *)MEMORY[0x192FB2F20]();
  [v2 invoke];
}

void __DKOBSERVER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x192FB2F20]();
  v6[2](v6, v8, v5);
}

void sub_18ED6B214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6B414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6B7A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6BC30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ED6BE60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _DKPrivacySensitiveMetadataKeys()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[_DKDigitalHealthMetadataKey webpageURL];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

uint64_t InteractionAnalysisPETInteractionEventReadFrom(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v17) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = (v10 & 7) == 4;
        }
        if (!v18)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v19 = *v3;
              unint64_t v20 = *(void *)(a2 + v19);
              if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
                *(void *)(a2 + v19) = v20 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + v16) = 1;
                uint64_t v21 = 0;
              }
              *(void *)(a1 + 8) = v21;
              goto LABEL_30;
            case 2u:
              uint64_t v22 = PBReaderReadString();
              uint64_t v23 = 40;
              goto LABEL_29;
            case 3u:
              uint64_t v22 = PBReaderReadString();
              uint64_t v23 = 24;
              goto LABEL_29;
            case 4u:
              uint64_t v22 = PBReaderReadString();
              uint64_t v23 = 32;
              goto LABEL_29;
            case 5u:
              uint64_t v22 = PBReaderReadString();
              uint64_t v23 = 48;
              goto LABEL_29;
            case 6u:
              uint64_t v22 = PBReaderReadString();
              uint64_t v23 = 16;
LABEL_29:
              uint64_t v25 = *(void **)(a1 + v23);
              *(void *)(a1 + v23) = v22;

              goto LABEL_30;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_30:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _MAPIntervalToCDPeriod(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F141F8];
  if (3 * *MEMORY[0x1E4F141F8] >= a1) {
    return 1;
  }
  if (5 * v1 >= a1) {
    return 2;
  }
  if (11 * v1 >= a1) {
    return 3;
  }
  if (17 * v1 >= a1) {
    return 4;
  }
  if (23 * v1 >= a1) {
    return 5;
  }
  if (*MEMORY[0x1E4F141E8] >= a1) {
    return 6;
  }
  return 7;
}

void sub_18ED7009C(_Unwind_Exception *a1)
{
}

void sub_18ED71DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ED7249C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t FTCPPETInteractionLogEventReadFrom(char *a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 1) {
        break;
      }
      if (v17 != 3)
      {
        if (v17 != 2)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_49;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_41;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_43:
        uint64_t v31 = 16;
        goto LABEL_48;
      }
      unint64_t v29 = objc_alloc_init(FTCPPETInteraction);
      [a1 addInteractions:v29];
      if (!PBReaderPlaceMark() || (FTCPPETInteractionReadFrom((uint64_t)v29, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v20 = 0;
    while (1)
    {
      uint64_t v26 = *v3;
      unint64_t v27 = *(void *)(a2 + v26);
      if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
      *(void *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_45;
      }
      v24 += 7;
      BOOL v14 = v25++ >= 9;
      if (v14)
      {
        uint64_t v20 = 0;
        goto LABEL_47;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_47:
    uint64_t v31 = 8;
LABEL_48:
    *(void *)&a1[v31] = v20;
    goto LABEL_49;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t significantFigureRound(uint64_t result, unint64_t a2)
{
  if (result)
  {
    double v2 = (double)a2;
    double v3 = (double)result;
    double v4 = log10((double)result);
    double v5 = __exp10(v2 - ceil(v4));
    return (unint64_t)(round(v5 * v3) / v5);
  }
  return result;
}

void sub_18ED78584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED7A95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_18ED7AE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_18ED7D3D8(_Unwind_Exception *a1)
{
}

uint64_t _DKPRCompressedChangeSetReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x1E4F940E8];
  double v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadData();
        char v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *meetingStatusToString(unint64_t a1)
{
  if (a1 > 7) {
    return @"Pending";
  }
  else {
    return off_1E560E8A0[a1];
  }
}

__CFString *contactIdTypeToString(uint64_t a1)
{
  uint64_t v1 = @"Person";
  if (a1 == 1) {
    uint64_t v1 = @"Organization";
  }
  if (a1 == 2) {
    return @"None";
  }
  else {
    return v1;
  }
}

void sub_18ED83270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED88220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED88868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED89084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED89B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED8A1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED8A794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED8AE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18ED8B8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18ED8DF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_18ED903BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18ED90B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED91280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED92EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_18ED937B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18ED93CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        __DKSYNCBLOCKOPERATION_IS_CALLING_OUT_TO_A_BLOCK__(*(void **)(*((void *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __DKSYNCBLOCKOPERATION_IS_CALLING_OUT_TO_A_BLOCK__(void *a1)
{
  uint64_t v2 = a1;
  id v1 = (void *)MEMORY[0x192FB2F20]();
  v2[2]();
}

void _DKSync3PolicyDuplicateNSStringPropertyValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v8 = [v6 objectForKeyedSubscript:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v10 = [v6 objectForKeyedSubscript:v5];
  uint64_t v11 = v10;
  if (isKindOfClass)
  {
    [v7 setObject:v10 forKeyedSubscript:v5];
LABEL_6:

    goto LABEL_7;
  }

  if (v11)
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      _DKSync3PolicyDuplicateNSStringPropertyValue_cold_1();
    }
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t _DKSync3PolicyDoesContainRequiredProperties(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, (void)v17);
        if (!v13)
        {
          int v15 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            _DKSync3PolicyDoesContainRequiredProperties_cold_1((uint64_t)v5, v12, v15);
          }

          uint64_t v14 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_13:

  return v14;
}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 objectForKeyedSubscript:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    uint64_t v10 = objc_msgSend(v6, "objectForKeyedSubscript:", v5, 0, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v16 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_1();
            }

            goto LABEL_17;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = [v6 objectForKeyedSubscript:v5];
    [v7 setObject:v10 forKeyedSubscript:v5];
    goto LABEL_17;
  }
  int v15 = [v6 objectForKeyedSubscript:v5];

  if (v15)
  {
    uint64_t v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_2();
    }
LABEL_17:
  }
}

void _DKSync3PolicyDuplicateNSNumberPropertyValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 objectForKeyedSubscript:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v10 = [v6 objectForKeyedSubscript:v5];
  uint64_t v11 = v10;
  if (isKindOfClass)
  {
    [v7 setObject:v10 forKeyedSubscript:v5];
LABEL_6:

    goto LABEL_7;
  }

  if (v11)
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      _DKSync3PolicyDuplicateNSNumberPropertyValue_cold_1();
    }
    goto LABEL_6;
  }
LABEL_7:
}

void OUTLINED_FUNCTION_7_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_18EDA1FCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDA2050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDA4FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EDA84D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDA8BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MailIntelligencePETMailIntelligenceAnalysisEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
LABEL_23:
        long long v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

        goto LABEL_49;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_44:
        *(_DWORD *)(a1 + 16) = v23;
        goto LABEL_49;
      case 4u:
        unint64_t v27 = objc_alloc_init(MailIntelligencePETContactEvents);
        objc_storeStrong((id *)(a1 + 32), v27);
        if PBReaderPlaceMark() && (MailIntelligencePETContactEventsReadFrom(v27, a2))
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        while (2)
        {
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_48:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v30;
        goto LABEL_49;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_49;
    }
  }
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return *(void *)(v0 + *(int *)(v1 + 3260));
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return *(void *)(v0 + *(int *)(v1 + 3260));
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return *(void *)(v0 + *(int *)(v1 + 3260));
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return *(void *)(v0 + *(int *)(v1 + 3256));
}

uint64_t CloudFamilyAnalysisPETContactEventsReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(CloudFamilyAnalysisPETContactEvent);
        [a1 addContactEvent:v17];
        if (!PBReaderPlaceMark() || (CloudFamilyAnalysisPETContactEventReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _DKPREventDataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_45:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v26;
      }
      else if (v17 == 2)
      {
        uint64_t v30 = PBReaderReadData();
        uint64_t v31 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v30;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EDAE3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EDAE560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18EDB114C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EDB3B44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDB3CFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDB4D2C(_Unwind_Exception *a1)
{
}

void sub_18EDB8050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDBAA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_18EDBAD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBAFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBC600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBD66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_18EDBDBF4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2_cold_1();
    }

    uint64_t v5 = -[_DKKnowledgeStorage errorForException:](*(void *)(v2 + 48), v3);
    uint64_t v6 = *(void *)(*(void *)(v2 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_end_catch();
    JUMPOUT(0x18EDBDBBCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_18EDBDF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EDBE48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBED68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBF6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EDBFDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_18EDC08A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18EDC0B60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDC0DF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_11_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ContactsLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ContactsLibraryCore_frameworkLibrary;
  uint64_t v5 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F4E8;
    long long v7 = *(_OWORD *)&off_1E560F4F8;
    v3[3] = _sl_dlopen();
    ContactsLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC1544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ContactsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ContactsLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v0 = ContactsLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getCNContactBirthdayKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactBirthdayKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactBirthdayKeySymbolLoc_ptr;
  if (!getCNContactBirthdayKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactBirthdayKey");
    getCNContactBirthdayKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC1720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactBirthdayKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactBirthdayKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactBirthdayKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCNContactEmailAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactEmailAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactEmailAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactFamilyNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactFamilyNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC18B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactGivenNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC19F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactGivenNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactGivenNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactIdentifierKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactIdentifierKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactIdentifierKeySymbolLoc_ptr;
  if (!getCNContactIdentifierKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC1B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactIdentifierKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactIdentifierKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactIdentifierKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactImageDataAvailableKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactImageDataAvailableKey");
    getCNContactImageDataAvailableKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC1C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactImageDataAvailableKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactImageDataAvailableKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactImageDataAvailableKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactInstantMessageAddressesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactInstantMessageAddressesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactInstantMessageAddressesKeySymbolLoc_ptr;
  if (!getCNContactInstantMessageAddressesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactInstantMessageAddressesKey");
    getCNContactInstantMessageAddressesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC1DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactInstantMessageAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactInstantMessageAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactInstantMessageAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactMiddleNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactMiddleNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC1EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactMiddleNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactMiddleNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactMiddleNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactNamePrefixKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactNamePrefixKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactNamePrefixKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactNamePrefixKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNamePrefixKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactNameSuffixKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactNameSuffixKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactNameSuffixKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactNameSuffixKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNameSuffixKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactNicknameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC22B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactNicknameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactNicknameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactNicknameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactOrganizationNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactOrganizationNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactOrganizationNameKeySymbolLoc_ptr;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactOrganizationNameKey");
    getCNContactOrganizationNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC23F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactOrganizationNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactOrganizationNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactOrganizationNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactPhoneNumbersKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactPhoneNumbersKeySymbolLoc_ptr;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactPhoneNumbersKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactPhoneNumbersKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPhoneNumbersKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactPostalAddressesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactPostalAddressesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactPostalAddressesKeySymbolLoc_ptr;
  if (!getCNContactPostalAddressesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactPostalAddressesKey");
    getCNContactPostalAddressesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactPostalAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactPostalAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPostalAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactPreviousFamilyNameKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactPreviousFamilyNameKey");
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC27B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactPreviousFamilyNameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactPreviousFamilyNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactPreviousFamilyNameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactRelationsKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactRelationsKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactRelationsKeySymbolLoc_ptr;
  if (!getCNContactRelationsKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactRelationsKey");
    getCNContactRelationsKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC28F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactRelationsKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactRelationsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactRelationsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactSocialProfilesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactSocialProfilesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactSocialProfilesKeySymbolLoc_ptr;
  if (!getCNContactSocialProfilesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactSocialProfilesKey");
    getCNContactSocialProfilesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactSocialProfilesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactSocialProfilesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactSocialProfilesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactTypeKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactTypeKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactTypeKeySymbolLoc_ptr;
  if (!getCNContactTypeKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactTypeKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactTypeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactUrlAddressesKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactUrlAddressesKeySymbolLoc_ptr;
  uint64_t v6 = getCNContactUrlAddressesKeySymbolLoc_ptr;
  if (!getCNContactUrlAddressesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactUrlAddressesKey");
    getCNContactUrlAddressesKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactUrlAddressesKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactUrlAddressesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactUrlAddressesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationAssistantSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationAssistantSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationAssistantSymbolLoc_ptr;
  if (!getCNLabelContactRelationAssistantSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationAssistant");
    getCNLabelContactRelationAssistantSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationAssistantSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationAssistant");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationAssistantSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationColleagueSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationColleagueSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationColleagueSymbolLoc_ptr;
  if (!getCNLabelContactRelationColleagueSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationColleague");
    getCNLabelContactRelationColleagueSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC2F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationColleagueSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationColleague");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationColleagueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationFemaleFriendSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFemaleFriendSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationFemaleFriend");
    getCNLabelContactRelationFemaleFriendSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC3070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationFemaleFriendSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationFemaleFriend");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationFemaleFriendSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationFriendSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationFriendSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFriendSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationFriend");
    getCNLabelContactRelationFriendSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC31B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationFriendSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationFriend");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationFriendSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationMaleFriendSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationMaleFriendSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationMaleFriend");
    getCNLabelContactRelationMaleFriendSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC32F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationMaleFriendSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationMaleFriend");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationMaleFriendSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationManagerSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationManagerSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationManagerSymbolLoc_ptr;
  if (!getCNLabelContactRelationManagerSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationManager");
    getCNLabelContactRelationManagerSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC3430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationManagerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationManagerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNLabelContactRelationTeacherSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNLabelContactRelationTeacherSymbolLoc_ptr;
  uint64_t v6 = getCNLabelContactRelationTeacherSymbolLoc_ptr;
  if (!getCNLabelContactRelationTeacherSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNLabelContactRelationTeacher");
    getCNLabelContactRelationTeacherSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC3570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNLabelContactRelationTeacherSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNLabelContactRelationTeacher");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNLabelContactRelationTeacherSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCNContactStoreDidChangeNotificationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  uint64_t v6 = getCNContactStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)ContactsLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CNContactStoreDidChangeNotification");
    getCNContactStoreDidChangeNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC36B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCNContactStoreDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ContactsLibrary();
  uint64_t result = dlsym(v2, "CNContactStoreDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class getCNContactStoreDidChangeNotification()
{
  uint64_t v0 = (void **)getCNContactStoreDidChangeNotificationSymbolLoc();
  if (v0)
  {
    uint64_t v1 = *v0;
    return (Class)v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return __getCNContactClass_block_invoke(CNContactBirthdayKey_cold_1);
  }
}

Class __getCNContactClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNContact");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNContactFetchRequestClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNContactFetchRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactFetchRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNContactFormatterClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNContactFormatter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactFormatterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNContactStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNContactStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNPhoneNumberClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNPhoneNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNPhoneNumberClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNChangeHistoryFetchRequestClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getCNChangeHistoryFetchRequestClass_softClass;
  uint64_t v6 = getCNChangeHistoryFetchRequestClass_softClass;
  if (!getCNChangeHistoryFetchRequestClass_softClass)
  {
    ContactsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CNChangeHistoryFetchRequest");
    getCNChangeHistoryFetchRequestClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC39E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNChangeHistoryFetchRequestClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNChangeHistoryFetchRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNChangeHistoryFetchRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNFavoritesClass_block_invoke(uint64_t a1)
{
  ContactsLibraryCore();
  Class result = objc_getClass("CNFavorites");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCNFavoritesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HomeKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = HomeKitLibraryCore_frameworkLibrary;
  uint64_t v5 = HomeKitLibraryCore_frameworkLibrary;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F530;
    long long v7 = *(_OWORD *)&off_1E560F540;
    v3[3] = _sl_dlopen();
    HomeKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC3BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HomeKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  HomeKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  HomeKitLibraryCore();
  Class result = objc_getClass("HMHomeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMHomeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHMHomeManagerConfigurationClass_block_invoke(uint64_t a1)
{
  HomeKitLibraryCore();
  Class result = objc_getClass("HMHomeManagerConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMHomeManagerConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ProactiveEventTrackerLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ProactiveEventTrackerLibraryCore_frameworkLibrary;
  uint64_t v5 = ProactiveEventTrackerLibraryCore_frameworkLibrary;
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F550;
    long long v7 = *(_OWORD *)&off_1E560F560;
    v3[3] = _sl_dlopen();
    ProactiveEventTrackerLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC3E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ProactiveEventTrackerLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ProactiveEventTrackerLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPETDistributionEventTrackerClass_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibraryCore();
  Class result = objc_getClass("PETDistributionEventTracker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPETDistributionEventTrackerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPETEventPropertyClass_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibraryCore();
  Class result = objc_getClass("PETEventProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPETEventPropertyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPETEventTracker2Class_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibraryCore();
  Class result = objc_getClass("PETEventTracker2");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPETEventTracker2Class_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPETScalarEventTrackerClass_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibraryCore();
  Class result = objc_getClass("PETScalarEventTracker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPETScalarEventTrackerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotosLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PhotosLibraryCore_frameworkLibrary;
  uint64_t v5 = PhotosLibraryCore_frameworkLibrary;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F570;
    long long v7 = *(_OWORD *)&off_1E560F580;
    v3[3] = _sl_dlopen();
    PhotosLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC411C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PhotosLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PhotosLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPHFetchOptionsClass_block_invoke(uint64_t a1)
{
  PhotosLibraryCore();
  Class result = objc_getClass("PHFetchOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPHFetchOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPHPersonClass_block_invoke(uint64_t a1)
{
  PhotosLibraryCore();
  Class result = objc_getClass("PHPerson");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPHPersonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreRoutineLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreRoutineLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreRoutineLibraryCore_frameworkLibrary;
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F590;
    long long v7 = *(_OWORD *)&off_1E560F5A0;
    v3[3] = _sl_dlopen();
    CoreRoutineLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC437C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreRoutineLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreRoutineLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  CoreRoutineLibraryCore();
  Class result = objc_getClass("RTRoutineManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRTRoutineManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HealthKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = HealthKitLibraryCore_frameworkLibrary;
  uint64_t v5 = HealthKitLibraryCore_frameworkLibrary;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F5B0;
    long long v7 = *(_OWORD *)&off_1E560F5C0;
    v3[3] = _sl_dlopen();
    HealthKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC4588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HealthKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  HealthKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibraryCore();
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getHKMedicalIDStoreClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getHKMedicalIDStoreClass_softClass;
  uint64_t v6 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    HealthKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("HKMedicalIDStore");
    getHKMedicalIDStoreClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC4778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKMedicalIDStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibraryCore();
  Class result = objc_getClass("HKMedicalIDStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKMedicalIDStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FamilyCircleLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = FamilyCircleLibraryCore_frameworkLibrary;
  uint64_t v5 = FamilyCircleLibraryCore_frameworkLibrary;
  if (!FamilyCircleLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F5D0;
    long long v7 = *(_OWORD *)&off_1E560F5E0;
    v3[3] = _sl_dlopen();
    FamilyCircleLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC48F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FamilyCircleLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  FamilyCircleLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFAFetchFamilyCircleRequestClass_block_invoke(uint64_t a1)
{
  FamilyCircleLibraryCore();
  Class result = objc_getClass("FAFetchFamilyCircleRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFAFetchFamilyCircleRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CallHistoryLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CallHistoryLibraryCore_frameworkLibrary;
  uint64_t v5 = CallHistoryLibraryCore_frameworkLibrary;
  if (!CallHistoryLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F5F0;
    long long v7 = *(_OWORD *)&off_1E560F600;
    v3[3] = _sl_dlopen();
    CallHistoryLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC4B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CallHistoryLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CallHistoryLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CallHistoryLibrary()
{
  uint64_t v0 = CallHistoryLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getkCHCallStatusConnectedOutgoingSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCHCallStatusConnectedOutgoingSymbolLoc_ptr;
  uint64_t v6 = getkCHCallStatusConnectedOutgoingSymbolLoc_ptr;
  if (!getkCHCallStatusConnectedOutgoingSymbolLoc_ptr)
  {
    id v1 = (void *)CallHistoryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCHCallStatusConnectedOutgoing");
    getkCHCallStatusConnectedOutgoingSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC4CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCHCallStatusConnectedOutgoingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CallHistoryLibrary();
  uint64_t result = dlsym(v2, "kCHCallStatusConnectedOutgoing");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCHCallStatusConnectedOutgoingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCHManagerClass_block_invoke(uint64_t a1)
{
  CallHistoryLibraryCore();
  Class result = objc_getClass("CHManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCHManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCHRecentCallClass_block_invoke(uint64_t a1)
{
  CallHistoryLibraryCore();
  Class result = objc_getClass("CHRecentCall");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCHRecentCallClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeStreamsLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = BiomeStreamsLibraryCore_frameworkLibrary;
  uint64_t v5 = BiomeStreamsLibraryCore_frameworkLibrary;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F610;
    long long v7 = *(_OWORD *)&off_1E560F620;
    v3[3] = _sl_dlopen();
    BiomeStreamsLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC4EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __BiomeStreamsLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  BiomeStreamsLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDKEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMDKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMDKEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDKEventStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMDKEventStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMDKEventStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMLibraryStreamsPrunerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMLibraryStreamsPrunerClass_softClass;
  uint64_t v6 = getBMLibraryStreamsPrunerClass_softClass;
  if (!getBMLibraryStreamsPrunerClass_softClass)
  {
    BiomeStreamsLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMLibraryStreamsPruner");
    getBMLibraryStreamsPrunerClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC5140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMLibraryStreamsPrunerClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibraryCore();
  Class result = objc_getClass("BMLibraryStreamsPruner");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMLibraryStreamsPrunerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BiomeStorageLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = BiomeStorageLibraryCore_frameworkLibrary;
  uint64_t v5 = BiomeStorageLibraryCore_frameworkLibrary;
  if (!BiomeStorageLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F630;
    long long v7 = *(_OWORD *)&off_1E560F640;
    v3[3] = _sl_dlopen();
    BiomeStorageLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC52BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __BiomeStorageLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  BiomeStorageLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMStoreConfigClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMStoreConfigClass_softClass;
  uint64_t v6 = getBMStoreConfigClass_softClass;
  if (!getBMStoreConfigClass_softClass)
  {
    BiomeStorageLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMStoreConfig");
    getBMStoreConfigClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC5458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStoreConfigClass_block_invoke(uint64_t a1)
{
  BiomeStorageLibraryCore();
  Class result = objc_getClass("BMStoreConfig");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMStoreConfigClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getBMStoreStreamClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getBMStoreStreamClass_softClass;
  uint64_t v6 = getBMStoreStreamClass_softClass;
  if (!getBMStoreStreamClass_softClass)
  {
    BiomeStorageLibraryCore();
    v4[3] = (uint64_t)objc_getClass("BMStoreStream");
    getBMStoreStreamClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC55B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStoreStreamClass_block_invoke(uint64_t a1)
{
  BiomeStorageLibraryCore();
  Class result = objc_getClass("BMStoreStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMStoreStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RelevanceEngineLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = RelevanceEngineLibraryCore_frameworkLibrary;
  uint64_t v5 = RelevanceEngineLibraryCore_frameworkLibrary;
  if (!RelevanceEngineLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F650;
    long long v7 = *(_OWORD *)&off_1E560F660;
    v3[3] = _sl_dlopen();
    RelevanceEngineLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC5734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RelevanceEngineLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  RelevanceEngineLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RelevanceEngineLibrary()
{
  uint64_t v0 = RelevanceEngineLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getREIsSupergreenUsedInLastOneDaySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr;
  uint64_t v6 = getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr;
  if (!getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr)
  {
    id v1 = (void *)RelevanceEngineLibrary();
    v4[3] = (uint64_t)dlsym(v1, "REIsSupergreenUsedInLastOneDay");
    getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC5910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getREIsSupergreenUsedInLastOneDaySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)RelevanceEngineLibrary();
  uint64_t result = dlsym(v2, "REIsSupergreenUsedInLastOneDay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getREIsSupergreenUsedInLastOneDaySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slREIsSupergreenUsedInLastOneDay()
{
  REIsSupergreenUsedInLastOneDaySymbolLoc = (uint64_t (*)(void))getREIsSupergreenUsedInLastOneDaySymbolLoc();
  if (REIsSupergreenUsedInLastOneDaySymbolLoc)
  {
    return REIsSupergreenUsedInLastOneDaySymbolLoc();
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return getREIsSupergreenUsedInLastSevenDaysSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getREIsSupergreenUsedInLastSevenDaysSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr;
  uint64_t v6 = getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr;
  if (!getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr)
  {
    id v1 = (void *)RelevanceEngineLibrary();
    v4[3] = (uint64_t)dlsym(v1, "REIsSupergreenUsedInLastSevenDays");
    getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC5A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getREIsSupergreenUsedInLastSevenDaysSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)RelevanceEngineLibrary();
  uint64_t result = dlsym(v2, "REIsSupergreenUsedInLastSevenDays");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getREIsSupergreenUsedInLastSevenDaysSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slREIsSupergreenUsedInLastSevenDays()
{
  REIsSupergreenUsedInLastSevenDaysSymbolLoc = (uint64_t (*)(void))getREIsSupergreenUsedInLastSevenDaysSymbolLoc();
  if (REIsSupergreenUsedInLastSevenDaysSymbolLoc)
  {
    return REIsSupergreenUsedInLastSevenDaysSymbolLoc();
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return getRESupergreenSuggestedImageDonationWidthSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getRESupergreenSuggestedImageDonationWidthSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr;
  uint64_t v6 = getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr;
  if (!getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr)
  {
    id v1 = (void *)RelevanceEngineLibrary();
    v4[3] = (uint64_t)dlsym(v1, "RESupergreenSuggestedImageDonationWidth");
    getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC5BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getRESupergreenSuggestedImageDonationWidthSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)RelevanceEngineLibrary();
  uint64_t result = dlsym(v2, "RESupergreenSuggestedImageDonationWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRESupergreenSuggestedImageDonationWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class slRESupergreenSuggestedImageDonationWidth()
{
  RESupergreenSuggestedImageDonationWidthSymbolLoc = (uint64_t (*)(void))getRESupergreenSuggestedImageDonationWidthSymbolLoc();
  if (RESupergreenSuggestedImageDonationWidthSymbolLoc)
  {
    return (Class)RESupergreenSuggestedImageDonationWidthSymbolLoc();
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return __getRESiriActionsDonationsWhitelistClass_block_invoke(CNContactBirthdayKey_cold_1);
  }
}

Class __getRESiriActionsDonationsWhitelistClass_block_invoke(uint64_t a1)
{
  RelevanceEngineLibraryCore();
  Class result = objc_getClass("RESiriActionsDonationsWhitelist");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRESiriActionsDonationsWhitelistClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ScreenTimeCoreLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ScreenTimeCoreLibraryCore_frameworkLibrary;
  uint64_t v5 = ScreenTimeCoreLibraryCore_frameworkLibrary;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F670;
    long long v7 = *(_OWORD *)&off_1E560F680;
    v3[3] = _sl_dlopen();
    ScreenTimeCoreLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC5DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ScreenTimeCoreLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  ScreenTimeCoreLibraryCore();
  Class result = objc_getClass("STManagementState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTManagementStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = AssistantServicesLibraryCore_frameworkLibrary;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F690;
    long long v7 = *(_OWORD *)&off_1E560F6A0;
    v3[3] = _sl_dlopen();
    AssistantServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC5FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AssistantServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AssistantServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0 = AssistantServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr;
  uint64_t v6 = getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr;
  if (!getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kAFCloudStorageDeletedByUserDarwinNotification");
    getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC61D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  uint64_t result = dlsym(v2, "kAFCloudStorageDeletedByUserDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAFCloudStorageDeletedByUserDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr;
  uint64_t v6 = getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr;
  if (!getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)AssistantServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kAFCloudSyncPreferenceDidChangeDarwinNotification");
    getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC6314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  uint64_t result = dlsym(v2, "kAFCloudSyncPreferenceDidChangeDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAFCloudSyncPreferenceDidChangeDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  AssistantServicesLibraryCore();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libMobileGestaltLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v5 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F6B0;
    uint64_t v7 = 0;
    v3[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC64E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libMobileGestaltLibrary()
{
  uint64_t v0 = libMobileGestaltLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getMGCopyAnswerSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMGCopyAnswerSymbolLoc_ptr;
  uint64_t v6 = getMGCopyAnswerSymbolLoc_ptr;
  if (!getMGCopyAnswerSymbolLoc_ptr)
  {
    id v1 = (void *)libMobileGestaltLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MGCopyAnswer");
    getMGCopyAnswerSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC66CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGCopyAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libMobileGestaltLibrary();
  uint64_t result = dlsym(v2, "MGCopyAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGCopyAnswerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  MGCopyAnswerSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMGCopyAnswerSymbolLoc();
  if (MGCopyAnswerSymbolLoc)
  {
    return MGCopyAnswerSymbolLoc(a1, a2);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return MobileKeyBagLibraryCore();
  }
}

uint64_t MobileKeyBagLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  uint64_t v5 = MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F6C8;
    long long v7 = *(_OWORD *)&off_1E560F6D8;
    v3[3] = _sl_dlopen();
    MobileKeyBagLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC6890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MobileKeyBagLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  MobileKeyBagLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v0 = MobileKeyBagLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getMKBDeviceFormattedForContentProtectionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr;
  uint64_t v6 = getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr;
  if (!getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr)
  {
    id v1 = (void *)MobileKeyBagLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MKBDeviceFormattedForContentProtection");
    getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC6A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceFormattedForContentProtectionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceFormattedForContentProtection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceFormattedForContentProtectionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slMKBDeviceFormattedForContentProtection()
{
  MKBDeviceFormattedForContentProtectionSymbolLoc = (uint64_t (*)(void))getMKBDeviceFormattedForContentProtectionSymbolLoc();
  if (MKBDeviceFormattedForContentProtectionSymbolLoc)
  {
    return MKBDeviceFormattedForContentProtectionSymbolLoc();
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return getMKBDeviceUnlockedSinceBootSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMKBDeviceUnlockedSinceBootSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v6 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    id v1 = (void *)MobileKeyBagLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC6BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slMKBDeviceUnlockedSinceBoot()
{
  MKBDeviceUnlockedSinceBootSymbolLoc = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc();
  if (MKBDeviceUnlockedSinceBootSymbolLoc)
  {
    return MKBDeviceUnlockedSinceBootSymbolLoc();
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return __PeopleSuggesterLibraryCore_block_invoke(CNContactBirthdayKey_cold_1);
  }
}

uint64_t __PeopleSuggesterLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PeopleSuggesterLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreMotionLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreMotionLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreMotionLibraryCore_frameworkLibrary;
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F708;
    long long v7 = *(_OWORD *)&off_1E560F718;
    v3[3] = _sl_dlopen();
    CoreMotionLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC7354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreMotionLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreMotionLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getCMMotionActivityManagerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getCMMotionActivityManagerClass_softClass;
  uint64_t v6 = getCMMotionActivityManagerClass_softClass;
  if (!getCMMotionActivityManagerClass_softClass)
  {
    CoreMotionLibraryCore();
    v4[3] = (uint64_t)objc_getClass("CMMotionActivityManager");
    getCMMotionActivityManagerClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC74F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCMMotionActivityManagerClass_block_invoke(uint64_t a1)
{
  CoreMotionLibraryCore();
  Class result = objc_getClass("CMMotionActivityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMMotionActivityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AggregateDictionaryLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AggregateDictionaryLibraryCore_frameworkLibrary;
  uint64_t v5 = AggregateDictionaryLibraryCore_frameworkLibrary;
  if (!AggregateDictionaryLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F728;
    long long v7 = *(_OWORD *)&off_1E560F738;
    v3[3] = _sl_dlopen();
    AggregateDictionaryLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC766C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AggregateDictionaryLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AggregateDictionaryLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AggregateDictionaryLibrary()
{
  uint64_t v0 = AggregateDictionaryLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getADClientAddValueForScalarKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientAddValueForScalarKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientAddValueForScalarKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getADClientClearDistributionKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientClearDistributionKeySymbolLoc_ptr;
  uint64_t v6 = getADClientClearDistributionKeySymbolLoc_ptr;
  if (!getADClientClearDistributionKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientClearDistributionKey");
    getADClientClearDistributionKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC7898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getADClientClearDistributionKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientClearDistributionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientClearDistributionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slADClientClearDistributionKey(uint64_t a1)
{
  ADClientClearDistributionKeySymbolLoc = (uint64_t (*)(uint64_t))getADClientClearDistributionKeySymbolLoc();
  if (ADClientClearDistributionKeySymbolLoc)
  {
    return ADClientClearDistributionKeySymbolLoc(a1);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getADClientClearScalarKeySymbolLoc();
  }
}

uint64_t getADClientClearScalarKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientClearScalarKeySymbolLoc_ptr;
  uint64_t v6 = getADClientClearScalarKeySymbolLoc_ptr;
  if (!getADClientClearScalarKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientClearScalarKey");
    getADClientClearScalarKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC7A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getADClientClearScalarKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientClearScalarKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientClearScalarKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slADClientClearScalarKey(uint64_t a1)
{
  ADClientClearScalarKeySymbolLoc = (uint64_t (*)(uint64_t))getADClientClearScalarKeySymbolLoc();
  if (ADClientClearScalarKeySymbolLoc)
  {
    return ADClientClearScalarKeySymbolLoc(a1);
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return getADClientPushValueForDistributionKeySymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getADClientPushValueForDistributionKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientPushValueForDistributionKeySymbolLoc_ptr;
  uint64_t v6 = getADClientPushValueForDistributionKeySymbolLoc_ptr;
  if (!getADClientPushValueForDistributionKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientPushValueForDistributionKey");
    getADClientPushValueForDistributionKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC7BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getADClientPushValueForDistributionKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientPushValueForDistributionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientPushValueForDistributionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slADClientPushValueForDistributionKey(uint64_t a1, double a2)
{
  ADClientPushValueForDistributionKeySymbolLoc = (uint64_t (*)(uint64_t, __n128))getADClientPushValueForDistributionKeySymbolLoc();
  if (ADClientPushValueForDistributionKeySymbolLoc)
  {
    v5.n128_f64[0] = a2;
    return ADClientPushValueForDistributionKeySymbolLoc(a1, v5);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getADClientSetValueForDistributionKeySymbolLoc();
  }
}

uint64_t getADClientSetValueForDistributionKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientSetValueForDistributionKeySymbolLoc_ptr;
  uint64_t v6 = getADClientSetValueForDistributionKeySymbolLoc_ptr;
  if (!getADClientSetValueForDistributionKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientSetValueForDistributionKey");
    getADClientSetValueForDistributionKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC7D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getADClientSetValueForDistributionKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientSetValueForDistributionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientSetValueForDistributionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slADClientSetValueForDistributionKey(uint64_t a1, double a2)
{
  ADClientSetValueForDistributionKeySymbolLoc = (uint64_t (*)(uint64_t, __n128))getADClientSetValueForDistributionKeySymbolLoc();
  if (ADClientSetValueForDistributionKeySymbolLoc)
  {
    v5.n128_f64[0] = a2;
    return ADClientSetValueForDistributionKeySymbolLoc(a1, v5);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return getADClientSetValueForScalarKeySymbolLoc();
  }
}

uint64_t getADClientSetValueForScalarKeySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getADClientSetValueForScalarKeySymbolLoc_ptr;
  uint64_t v6 = getADClientSetValueForScalarKeySymbolLoc_ptr;
  if (!getADClientSetValueForScalarKeySymbolLoc_ptr)
  {
    id v1 = (void *)AggregateDictionaryLibrary();
    v4[3] = (uint64_t)dlsym(v1, "ADClientSetValueForScalarKey");
    getADClientSetValueForScalarKeySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC7EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getADClientSetValueForScalarKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AggregateDictionaryLibrary();
  uint64_t result = dlsym(v2, "ADClientSetValueForScalarKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getADClientSetValueForScalarKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t slADClientSetValueForScalarKey(uint64_t a1, uint64_t a2)
{
  ADClientSetValueForScalarKeySymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getADClientSetValueForScalarKeySymbolLoc();
  if (ADClientSetValueForScalarKeySymbolLoc)
  {
    return ADClientSetValueForScalarKeySymbolLoc(a1, a2);
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return CoreSpotlightLibraryCore(CNContactBirthdayKey_cold_1);
  }
}

uint64_t CoreSpotlightLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreSpotlightLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreSpotlightLibraryCore_frameworkLibrary;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F748;
    long long v7 = *(_OWORD *)&off_1E560F758;
    v3[3] = _sl_dlopen();
    CoreSpotlightLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC808C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreSpotlightLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreSpotlightLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreSpotlightLibrary()
{
  uint64_t v0 = CoreSpotlightLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getCSMailboxArchiveSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCSMailboxArchiveSymbolLoc_ptr;
  uint64_t v6 = getCSMailboxArchiveSymbolLoc_ptr;
  if (!getCSMailboxArchiveSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CSMailboxArchive");
    getCSMailboxArchiveSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCSMailboxArchiveSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "CSMailboxArchive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSMailboxArchiveSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCSMailboxInboxSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCSMailboxInboxSymbolLoc_ptr;
  uint64_t v6 = getCSMailboxInboxSymbolLoc_ptr;
  if (!getCSMailboxInboxSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CSMailboxInbox");
    getCSMailboxInboxSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC83A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCSMailboxInboxSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "CSMailboxInbox");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSMailboxInboxSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getCSMailboxSentSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCSMailboxSentSymbolLoc_ptr;
  uint64_t v6 = getCSMailboxSentSymbolLoc_ptr;
  if (!getCSMailboxSentSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CSMailboxSent");
    getCSMailboxSentSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC84E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCSMailboxSentSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "CSMailboxSent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSMailboxSentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getMDItemAccountHandlesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemAccountHandlesSymbolLoc_ptr;
  uint64_t v6 = getMDItemAccountHandlesSymbolLoc_ptr;
  if (!getMDItemAccountHandlesSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemAccountHandles");
    getMDItemAccountHandlesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemAccountHandlesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemAccountHandles");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemAccountHandlesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemAccountHandles()
{
  MDItemAccountHandlesSymbolLoc = (void **)getMDItemAccountHandlesSymbolLoc();
  if (MDItemAccountHandlesSymbolLoc)
  {
    id v1 = *MDItemAccountHandlesSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemAccountIdentifierSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemAccountIdentifierSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemAccountIdentifierSymbolLoc_ptr;
  uint64_t v6 = getMDItemAccountIdentifierSymbolLoc_ptr;
  if (!getMDItemAccountIdentifierSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemAccountIdentifier");
    getMDItemAccountIdentifierSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC879C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemAccountIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemAccountIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemAccountIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemAccountIdentifier()
{
  MDItemAccountIdentifierSymbolLoc = (void **)getMDItemAccountIdentifierSymbolLoc();
  if (MDItemAccountIdentifierSymbolLoc)
  {
    id v1 = *MDItemAccountIdentifierSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemAdditionalRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemAdditionalRecipientPersonsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemAdditionalRecipientPersonsSymbolLoc_ptr;
  uint64_t v6 = getMDItemAdditionalRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemAdditionalRecipientPersonsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemAdditionalRecipientPersons");
    getMDItemAdditionalRecipientPersonsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemAdditionalRecipientPersonsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemAdditionalRecipientPersons");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemAdditionalRecipientPersonsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemAdditionalRecipientPersons()
{
  MDItemAdditionalRecipientPersonsSymbolLoc = (void **)getMDItemAdditionalRecipientPersonsSymbolLoc();
  if (MDItemAdditionalRecipientPersonsSymbolLoc)
  {
    id v1 = *MDItemAdditionalRecipientPersonsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemAuthorPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemAuthorPersonsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemAuthorPersonsSymbolLoc_ptr;
  uint64_t v6 = getMDItemAuthorPersonsSymbolLoc_ptr;
  if (!getMDItemAuthorPersonsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemAuthorPersons");
    getMDItemAuthorPersonsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemAuthorPersonsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemAuthorPersons");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemAuthorPersonsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemAuthorPersons()
{
  MDItemAuthorPersonsSymbolLoc = (void **)getMDItemAuthorPersonsSymbolLoc();
  if (MDItemAuthorPersonsSymbolLoc)
  {
    id v1 = *MDItemAuthorPersonsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemContentCreationDateSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemContentCreationDateSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemContentCreationDateSymbolLoc_ptr;
  uint64_t v6 = getMDItemContentCreationDateSymbolLoc_ptr;
  if (!getMDItemContentCreationDateSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemContentCreationDate");
    getMDItemContentCreationDateSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemContentCreationDateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemContentCreationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentCreationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemContentCreationDate()
{
  MDItemContentCreationDateSymbolLoc = (void **)getMDItemContentCreationDateSymbolLoc();
  if (MDItemContentCreationDateSymbolLoc)
  {
    id v1 = *MDItemContentCreationDateSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemContentTypeSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemContentTypeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemContentTypeSymbolLoc_ptr;
  uint64_t v6 = getMDItemContentTypeSymbolLoc_ptr;
  if (!getMDItemContentTypeSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemContentType");
    getMDItemContentTypeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemContentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemContentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemContentType()
{
  MDItemContentTypeSymbolLoc = (void **)getMDItemContentTypeSymbolLoc();
  if (MDItemContentTypeSymbolLoc)
  {
    id v1 = *MDItemContentTypeSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemDisplayNameSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemDisplayNameSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemDisplayNameSymbolLoc_ptr;
  uint64_t v6 = getMDItemDisplayNameSymbolLoc_ptr;
  if (!getMDItemDisplayNameSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemDisplayName");
    getMDItemDisplayNameSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC8EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemDisplayNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemDisplayName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemDisplayNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemDisplayName()
{
  MDItemDisplayNameSymbolLoc = (void **)getMDItemDisplayNameSymbolLoc();
  if (MDItemDisplayNameSymbolLoc)
  {
    id v1 = *MDItemDisplayNameSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemEmailHeadersDictionarySymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemEmailHeadersDictionarySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemEmailHeadersDictionarySymbolLoc_ptr;
  uint64_t v6 = getMDItemEmailHeadersDictionarySymbolLoc_ptr;
  if (!getMDItemEmailHeadersDictionarySymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemEmailHeadersDictionary");
    getMDItemEmailHeadersDictionarySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC9054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemEmailHeadersDictionarySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemEmailHeadersDictionary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemEmailHeadersDictionarySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemEmailHeadersDictionary()
{
  MDItemEmailHeadersDictionarySymbolLoc = (void **)getMDItemEmailHeadersDictionarySymbolLoc();
  if (MDItemEmailHeadersDictionarySymbolLoc)
  {
    id v1 = *MDItemEmailHeadersDictionarySymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemHiddenAdditionalRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemHiddenAdditionalRecipientPersonsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr;
  uint64_t v6 = getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemHiddenAdditionalRecipientPersons");
    getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC91C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemHiddenAdditionalRecipientPersons");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemHiddenAdditionalRecipientPersonsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemHiddenAdditionalRecipientPersons()
{
  MDItemHiddenAdditionalRecipientPersonsSymbolLoc = (void **)getMDItemHiddenAdditionalRecipientPersonsSymbolLoc();
  if (MDItemHiddenAdditionalRecipientPersonsSymbolLoc)
  {
    id v1 = *MDItemHiddenAdditionalRecipientPersonsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemMailboxesSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemMailboxesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemMailboxesSymbolLoc_ptr;
  uint64_t v6 = getMDItemMailboxesSymbolLoc_ptr;
  if (!getMDItemMailboxesSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemMailboxes");
    getMDItemMailboxesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC933C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemMailboxesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemMailboxes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemMailboxesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemMailboxes()
{
  MDItemMailboxesSymbolLoc = (void **)getMDItemMailboxesSymbolLoc();
  if (MDItemMailboxesSymbolLoc)
  {
    id v1 = *MDItemMailboxesSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemPrimaryRecipientPersonsSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemPrimaryRecipientPersonsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemPrimaryRecipientPersonsSymbolLoc_ptr;
  uint64_t v6 = getMDItemPrimaryRecipientPersonsSymbolLoc_ptr;
  if (!getMDItemPrimaryRecipientPersonsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemPrimaryRecipientPersons");
    getMDItemPrimaryRecipientPersonsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC94B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemPrimaryRecipientPersonsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemPrimaryRecipientPersons");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemPrimaryRecipientPersonsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemPrimaryRecipientPersons()
{
  MDItemPrimaryRecipientPersonsSymbolLoc = (void **)getMDItemPrimaryRecipientPersonsSymbolLoc();
  if (MDItemPrimaryRecipientPersonsSymbolLoc)
  {
    id v1 = *MDItemPrimaryRecipientPersonsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemRecipientEmailAddressesSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemRecipientEmailAddressesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemRecipientEmailAddressesSymbolLoc_ptr;
  uint64_t v6 = getMDItemRecipientEmailAddressesSymbolLoc_ptr;
  if (!getMDItemRecipientEmailAddressesSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemRecipientEmailAddresses");
    getMDItemRecipientEmailAddressesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC9624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemRecipientEmailAddressesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemRecipientEmailAddresses");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemRecipientEmailAddressesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemRecipientEmailAddresses()
{
  MDItemRecipientEmailAddressesSymbolLoc = (void **)getMDItemRecipientEmailAddressesSymbolLoc();
  if (MDItemRecipientEmailAddressesSymbolLoc)
  {
    id v1 = *MDItemRecipientEmailAddressesSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemRecipientsSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemRecipientsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemRecipientsSymbolLoc_ptr;
  uint64_t v6 = getMDItemRecipientsSymbolLoc_ptr;
  if (!getMDItemRecipientsSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemRecipients");
    getMDItemRecipientsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC9798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemRecipientsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemRecipients");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemRecipientsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemRecipients()
{
  MDItemRecipientsSymbolLoc = (void **)getMDItemRecipientsSymbolLoc();
  if (MDItemRecipientsSymbolLoc)
  {
    id v1 = *MDItemRecipientsSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)getMDItemSubjectSymbolLoc(CNContactBirthdayKey_cold_1);
  }
}

uint64_t getMDItemSubjectSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDItemSubjectSymbolLoc_ptr;
  uint64_t v6 = getMDItemSubjectSymbolLoc_ptr;
  if (!getMDItemSubjectSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDItemSubject");
    getMDItemSubjectSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC990C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDItemSubjectSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemSubject");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemSubjectSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDItemSubject()
{
  MDItemSubjectSymbolLoc = (void **)getMDItemSubjectSymbolLoc();
  if (MDItemSubjectSymbolLoc)
  {
    id v1 = *MDItemSubjectSymbolLoc;
    return v1;
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return (id)getMDSearchQueryOptionFetchAttributesSymbolLoc();
  }
}

uint64_t getMDSearchQueryOptionFetchAttributesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr;
  uint64_t v6 = getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr;
  if (!getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MDSearchQueryOptionFetchAttributes");
    getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC9A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDSearchQueryOptionFetchAttributesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDSearchQueryOptionFetchAttributes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDSearchQueryOptionFetchAttributesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDSearchQueryOptionFetchAttributes()
{
  AttributesSymbolLoc = (void **)getMDSearchQueryOptionFetchAttributesSymbolLoc();
  if (AttributesSymbolLoc)
  {
    id v1 = *AttributesSymbolLoc;
    return v1;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    return (id)__getCSSearchableIndexClass_block_invoke(CNContactBirthdayKey_cold_1);
  }
}

Class __getCSSearchableIndexClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibraryCore();
  Class result = objc_getClass("CSSearchableIndex");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSSearchableIndexClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMDSearchQueryClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getMDSearchQueryClass_softClass;
  uint64_t v6 = getMDSearchQueryClass_softClass;
  if (!getMDSearchQueryClass_softClass)
  {
    CoreSpotlightLibraryCore();
    v4[3] = (uint64_t)objc_getClass("MDSearchQuery");
    getMDSearchQueryClass_softClass = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_18EDC9C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMDSearchQueryClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibraryCore();
  Class result = objc_getClass("MDSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDSearchQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpotlightReceiverLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SpotlightReceiverLibraryCore_frameworkLibrary;
  uint64_t v5 = SpotlightReceiverLibraryCore_frameworkLibrary;
  if (!SpotlightReceiverLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F768;
    long long v7 = *(_OWORD *)&off_1E560F778;
    v3[3] = _sl_dlopen();
    SpotlightReceiverLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDC9DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SpotlightReceiverLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SpotlightReceiverLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpotlightReceiverLibrary()
{
  uint64_t v0 = SpotlightReceiverLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getSpotlightReceiverRegisterSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSpotlightReceiverRegisterSymbolLoc_ptr;
  uint64_t v6 = getSpotlightReceiverRegisterSymbolLoc_ptr;
  if (!getSpotlightReceiverRegisterSymbolLoc_ptr)
  {
    id v1 = (void *)SpotlightReceiverLibrary();
    v4[3] = (uint64_t)dlsym(v1, "SpotlightReceiverRegister");
    getSpotlightReceiverRegisterSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDC9FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSpotlightReceiverRegisterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpotlightReceiverLibrary();
  uint64_t result = dlsym(v2, "SpotlightReceiverRegister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSpotlightReceiverRegisterSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void cd_SpotlightReceiverRegister(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  SpotlightReceiverRegisterSymbolLoc = (void (*)(id, id))getSpotlightReceiverRegisterSymbolLoc();
  if (SpotlightReceiverRegisterSymbolLoc)
  {
    SpotlightReceiverRegisterSymbolLoc(v6, v3);
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = getCNContactBirthdayKey_cold_1();
    __getSpotlightReceiverConnectionUIDKeySymbolLoc_block_invoke(CNContactBirthdayKey_cold_1);
  }
}

void *__getSpotlightReceiverConnectionUIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SpotlightReceiverLibrary();
  uint64_t result = dlsym(v2, "SpotlightReceiverConnectionUIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSpotlightReceiverConnectionUIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreServicesLibraryCore_frameworkLibrary;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F788;
    long long v7 = *(_OWORD *)&off_1E560F798;
    v3[3] = _sl_dlopen();
    CoreServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDCA1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreServicesLibrary()
{
  uint64_t v0 = CoreServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getkUTTypeMessageSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkUTTypeMessageSymbolLoc_ptr;
  uint64_t v6 = getkUTTypeMessageSymbolLoc_ptr;
  if (!getkUTTypeMessageSymbolLoc_ptr)
  {
    id v1 = (void *)CoreServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kUTTypeMessage");
    getkUTTypeMessageSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDCA3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkUTTypeMessageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreServicesLibrary();
  uint64_t result = dlsym(v2, "kUTTypeMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkUTTypeMessageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkUTTypeEmailMessageSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkUTTypeEmailMessageSymbolLoc_ptr;
  uint64_t v6 = getkUTTypeEmailMessageSymbolLoc_ptr;
  if (!getkUTTypeEmailMessageSymbolLoc_ptr)
  {
    id v1 = (void *)CoreServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kUTTypeEmailMessage");
    getkUTTypeEmailMessageSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDCA50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkUTTypeEmailMessageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreServicesLibrary();
  uint64_t result = dlsym(v2, "kUTTypeEmailMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkUTTypeEmailMessageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkUTTypeCalendarEventSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkUTTypeCalendarEventSymbolLoc_ptr;
  uint64_t v6 = getkUTTypeCalendarEventSymbolLoc_ptr;
  if (!getkUTTypeCalendarEventSymbolLoc_ptr)
  {
    id v1 = (void *)CoreServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kUTTypeCalendarEvent");
    getkUTTypeCalendarEventSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDCA64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkUTTypeCalendarEventSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreServicesLibrary();
  uint64_t result = dlsym(v2, "kUTTypeCalendarEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkUTTypeCalendarEventSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getUTTypeConformsToSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUTTypeConformsToSymbolLoc_ptr;
  uint64_t v6 = getUTTypeConformsToSymbolLoc_ptr;
  if (!getUTTypeConformsToSymbolLoc_ptr)
  {
    id v1 = (void *)CoreServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UTTypeConformsTo");
    getUTTypeConformsToSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDCA78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUTTypeConformsToSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreServicesLibrary();
  uint64_t result = dlsym(v2, "UTTypeConformsTo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUTTypeConformsToSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t cd_UTTypeConformsTo(uint64_t a1, uint64_t a2)
{
  UTTypeConformsToSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getUTTypeConformsToSymbolLoc();
  if (UTTypeConformsToSymbolLoc)
  {
    return UTTypeConformsToSymbolLoc(a1, a2);
  }
  else
  {
    getCNContactBirthdayKey_cold_1();
    return CoreDuetContextLibraryCore();
  }
}

uint64_t CoreDuetContextLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = CoreDuetContextLibraryCore_frameworkLibrary;
  uint64_t v5 = CoreDuetContextLibraryCore_frameworkLibrary;
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F7A8;
    long long v7 = *(_OWORD *)&off_1E560F7B8;
    v3[3] = _sl_dlopen();
    CoreDuetContextLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDCA950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreDuetContextLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreDuetContextLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMCoreLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = IMCoreLibraryCore_frameworkLibrary;
  uint64_t v5 = IMCoreLibraryCore_frameworkLibrary;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E560F7C8;
    long long v7 = *(_OWORD *)&off_1E560F7D8;
    v3[3] = _sl_dlopen();
    IMCoreLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_18EDCAC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IMCoreLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  IMCoreLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMCoreLibrary()
{
  uint64_t v0 = IMCoreLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  uint64_t v6 = getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr)
  {
    id v1 = (void *)IMCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IMSPIGetDisplayNameAndParticipantsForChatWithGUID");
    getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_18EDCADE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IMCoreLibrary();
  uint64_t result = dlsym(v2, "IMSPIGetDisplayNameAndParticipantsForChatWithGUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

id sIMSPIGetDisplayNameAndParticipantsForChatWithGUID(void *a1)
{
  id v1 = a1;
  IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc = (void (*)(id))getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc();
  if (IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc)
  {
    uint64_t v3 = IMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc(v1);

    return v3;
  }
  else
  {
    uint64_t CNContactBirthdayKey_cold_1 = (void *)getCNContactBirthdayKey_cold_1();
    return (id)+[_DKFetchRecordZoneChangesOperation _removesDependenciesAfterFinish];
  }
}

void sub_18EDCCAA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18EDCD1FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDCD388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _logChannel()
{
  if (_logChannel_onceToken != -1) {
    dispatch_once(&_logChannel_onceToken, &__block_literal_global_552);
  }
  uint64_t v0 = (void *)_logChannel_logChannel;
  return v0;
}

void ___logChannel_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreduet.receiver.notifier", "");
  id v1 = (void *)_logChannel_logChannel;
  _logChannel_logChannel = (uint64_t)v0;

  if (!_logChannel_logChannel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    ___logChannel_block_invoke_cold_1();
  }
}

uint64_t _DKPRValueTypeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_39:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EDCEFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EDD0064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_18EDD02B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDD1070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_18EDD2400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDD4B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudFamilyAnalysisPETContactEventReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          a1[108] |= 0x2000uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            uint64_t v21 = *(void *)(a2 + v20);
            unint64_t v22 = v21 + 1;
            if (v21 == -1 || v22 > *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v22;
            v19 |= (unint64_t)(v23 & 0x7F) << v17;
            if ((v23 & 0x80) == 0) {
              goto LABEL_427;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_429;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_427:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_429:
          uint64_t v303 = 78;
          goto LABEL_438;
        case 2u:
          a1[107] |= 0x400000000000000uLL;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 59;
          goto LABEL_686;
        case 3u:
          a1[108] |= 0x800uLL;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x320], 8) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 76;
          goto LABEL_686;
        case 4u:
          a1[108] |= 4uLL;
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 67;
          goto LABEL_686;
        case 5u:
          a1[107] |= 0x8000000000000000;
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 64;
          goto LABEL_686;
        case 6u:
          a1[108] |= 1uLL;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 65;
          goto LABEL_686;
        case 7u:
          a1[108] |= 2uLL;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 66;
          goto LABEL_686;
        case 8u:
          a1[108] |= 0x400uLL;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v3_Block_object_dispose(&STACK[0x320], 8) = v39 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 75;
          goto LABEL_686;
        case 9u:
          a1[108] |= 0x80uLL;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 72;
          goto LABEL_686;
        case 0xAu:
          a1[108] |= 0x100uLL;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 73;
          goto LABEL_686;
        case 0xBu:
          a1[108] |= 0x200uLL;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 74;
          goto LABEL_686;
        case 0xCu:
          a1[107] |= 0x4000000000000000uLL;
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 63;
          goto LABEL_686;
        case 0xDu:
          a1[107] |= 0x800000000000000uLL;
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v4_Block_object_dispose(&STACK[0x320], 8) = v49 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 60;
          goto LABEL_686;
        case 0xEu:
          a1[107] |= 0x1000000000000000uLL;
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 61;
          goto LABEL_686;
        case 0xFu:
          a1[107] |= 0x2000000000000000uLL;
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v53 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 62;
          goto LABEL_686;
        case 0x10u:
          a1[108] |= 0x40uLL;
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v55);
            *(void *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 71;
          goto LABEL_686;
        case 0x11u:
          a1[108] |= 8uLL;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 68;
          goto LABEL_686;
        case 0x12u:
          a1[108] |= 0x10uLL;
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v5_Block_object_dispose(&STACK[0x320], 8) = v59 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 69;
          goto LABEL_686;
        case 0x13u:
          a1[108] |= 0x20uLL;
          uint64_t v60 = *v3;
          unint64_t v61 = *(void *)(a2 + v60);
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v61);
            *(void *)(a2 + v60) = v61 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 70;
          goto LABEL_686;
        case 0x14u:
          a1[108] |= 0x4000uLL;
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v63);
            *(void *)(a2 + v62) = v63 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 79;
          goto LABEL_686;
        case 0x15u:
          a1[108] |= 0x1000uLL;
          uint64_t v64 = *v3;
          unint64_t v65 = *(void *)(a2 + v64);
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v65);
            *(void *)(a2 + v64) = v65 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 77;
          goto LABEL_686;
        case 0x16u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v19 = 0;
          a1[108] |= 0x100000000uLL;
          while (2)
          {
            uint64_t v68 = *v3;
            uint64_t v69 = *(void *)(a2 + v68);
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
              *(void *)(a2 + v6_Block_object_dispose(&STACK[0x320], 8) = v70;
              v19 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                BOOL v14 = v67++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_433:
          uint64_t v303 = 97;
          goto LABEL_438;
        case 0x17u:
          a1[108] |= 0x8000uLL;
          uint64_t v72 = *v3;
          unint64_t v73 = *(void *)(a2 + v72);
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v73 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 80;
          goto LABEL_686;
        case 0x18u:
          a1[108] |= 0x800000uLL;
          uint64_t v74 = *v3;
          unint64_t v75 = *(void *)(a2 + v74);
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v75);
            *(void *)(a2 + v74) = v75 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 88;
          goto LABEL_686;
        case 0x19u:
          a1[108] |= 0x100000uLL;
          uint64_t v76 = *v3;
          unint64_t v77 = *(void *)(a2 + v76);
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v77);
            *(void *)(a2 + v76) = v77 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 85;
          goto LABEL_686;
        case 0x1Au:
          a1[108] |= 0x200000uLL;
          uint64_t v78 = *v3;
          unint64_t v79 = *(void *)(a2 + v78);
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v7_Block_object_dispose(&STACK[0x320], 8) = v79 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 86;
          goto LABEL_686;
        case 0x1Bu:
          a1[108] |= 0x400000uLL;
          uint64_t v80 = *v3;
          unint64_t v81 = *(void *)(a2 + v80);
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v81 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 87;
          goto LABEL_686;
        case 0x1Cu:
          a1[108] |= 0x80000000uLL;
          uint64_t v82 = *v3;
          unint64_t v83 = *(void *)(a2 + v82);
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v83);
            *(void *)(a2 + v82) = v83 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 96;
          goto LABEL_686;
        case 0x1Du:
          a1[108] |= 0x10000000uLL;
          uint64_t v84 = *v3;
          unint64_t v85 = *(void *)(a2 + v84);
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v85);
            *(void *)(a2 + v84) = v85 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 93;
          goto LABEL_686;
        case 0x1Eu:
          a1[108] |= 0x20000000uLL;
          uint64_t v86 = *v3;
          unint64_t v87 = *(void *)(a2 + v86);
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v87);
            *(void *)(a2 + v86) = v87 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 94;
          goto LABEL_686;
        case 0x1Fu:
          a1[108] |= 0x40000000uLL;
          uint64_t v88 = *v3;
          unint64_t v89 = *(void *)(a2 + v88);
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v89);
            *(void *)(a2 + v8_Block_object_dispose(&STACK[0x320], 8) = v89 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 95;
          goto LABEL_686;
        case 0x20u:
          a1[108] |= 0x80000uLL;
          uint64_t v90 = *v3;
          unint64_t v91 = *(void *)(a2 + v90);
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v91);
            *(void *)(a2 + v90) = v91 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 84;
          goto LABEL_686;
        case 0x21u:
          a1[108] |= 0x10000uLL;
          uint64_t v92 = *v3;
          unint64_t v93 = *(void *)(a2 + v92);
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v93);
            *(void *)(a2 + v92) = v93 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 81;
          goto LABEL_686;
        case 0x22u:
          a1[108] |= 0x20000uLL;
          uint64_t v94 = *v3;
          unint64_t v95 = *(void *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v95);
            *(void *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 82;
          goto LABEL_686;
        case 0x23u:
          a1[108] |= 0x40000uLL;
          uint64_t v96 = *v3;
          unint64_t v97 = *(void *)(a2 + v96);
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v97);
            *(void *)(a2 + v96) = v97 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 83;
          goto LABEL_686;
        case 0x24u:
          a1[108] |= 0x8000000uLL;
          uint64_t v98 = *v3;
          unint64_t v99 = *(void *)(a2 + v98);
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v99);
            *(void *)(a2 + v9_Block_object_dispose(&STACK[0x320], 8) = v99 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 92;
          goto LABEL_686;
        case 0x25u:
          a1[108] |= 0x1000000uLL;
          uint64_t v100 = *v3;
          unint64_t v101 = *(void *)(a2 + v100);
          if (v101 <= 0xFFFFFFFFFFFFFFF7 && v101 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v101);
            *(void *)(a2 + v100) = v101 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 89;
          goto LABEL_686;
        case 0x26u:
          a1[108] |= 0x2000000uLL;
          uint64_t v102 = *v3;
          unint64_t v103 = *(void *)(a2 + v102);
          if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v103);
            *(void *)(a2 + v102) = v103 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 90;
          goto LABEL_686;
        case 0x27u:
          a1[108] |= 0x4000000uLL;
          uint64_t v104 = *v3;
          unint64_t v105 = *(void *)(a2 + v104);
          if (v105 <= 0xFFFFFFFFFFFFFFF7 && v105 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v105);
            *(void *)(a2 + v104) = v105 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 91;
          goto LABEL_686;
        case 0x28u:
          a1[108] |= 0x200000000uLL;
          uint64_t v106 = *v3;
          unint64_t v107 = *(void *)(a2 + v106);
          if (v107 <= 0xFFFFFFFFFFFFFFF7 && v107 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v107);
            *(void *)(a2 + v106) = v107 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 98;
          goto LABEL_686;
        case 0x29u:
          char v108 = 0;
          unsigned int v109 = 0;
          uint64_t v19 = 0;
          a1[107] |= 0x40000000000000uLL;
          while (2)
          {
            uint64_t v110 = *v3;
            uint64_t v111 = *(void *)(a2 + v110);
            unint64_t v112 = v111 + 1;
            if (v111 == -1 || v112 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v113 = *(unsigned char *)(*(void *)(a2 + *v7) + v111);
              *(void *)(a2 + v110) = v112;
              v19 |= (unint64_t)(v113 & 0x7F) << v108;
              if (v113 < 0)
              {
                v108 += 7;
                BOOL v14 = v109++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_437:
          uint64_t v303 = 55;
LABEL_438:
          a1[v303] = v19;
          continue;
        case 0x2Au:
          char v114 = 0;
          unsigned int v115 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x400000000uLL;
          while (2)
          {
            uint64_t v117 = *v3;
            uint64_t v118 = *(void *)(a2 + v117);
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v118);
              *(void *)(a2 + v117) = v119;
              v116 |= (unint64_t)(v120 & 0x7F) << v114;
              if (v120 < 0)
              {
                v114 += 7;
                BOOL v14 = v115++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_442:
          uint64_t v304 = 792;
          goto LABEL_495;
        case 0x2Bu:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x8000000000uLL;
          while (2)
          {
            uint64_t v123 = *v3;
            uint64_t v124 = *(void *)(a2 + v123);
            unint64_t v125 = v124 + 1;
            if (v124 == -1 || v125 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v126 = *(unsigned char *)(*(void *)(a2 + *v7) + v124);
              *(void *)(a2 + v123) = v125;
              v116 |= (unint64_t)(v126 & 0x7F) << v121;
              if (v126 < 0)
              {
                v121 += 7;
                BOOL v14 = v122++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_446:
          uint64_t v304 = 812;
          goto LABEL_495;
        case 0x2Cu:
          a1[107] |= 0x80000000000000uLL;
          uint64_t v127 = *v3;
          unint64_t v128 = *(void *)(a2 + v127);
          if (v128 <= 0xFFFFFFFFFFFFFFF7 && v128 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v128);
            *(void *)(a2 + v127) = v128 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 56;
          goto LABEL_686;
        case 0x2Du:
          a1[107] |= 2uLL;
          uint64_t v129 = *v3;
          unint64_t v130 = *(void *)(a2 + v129);
          if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v130);
            *(void *)(a2 + v129) = v130 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 2;
          goto LABEL_686;
        case 0x2Eu:
          a1[107] |= 0x4000000000uLL;
          uint64_t v131 = *v3;
          unint64_t v132 = *(void *)(a2 + v131);
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v132);
            *(void *)(a2 + v131) = v132 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 39;
          goto LABEL_686;
        case 0x2Fu:
          a1[107] |= 0x10000000000000uLL;
          uint64_t v133 = *v3;
          unint64_t v134 = *(void *)(a2 + v133);
          if (v134 <= 0xFFFFFFFFFFFFFFF7 && v134 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v134);
            *(void *)(a2 + v133) = v134 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 53;
          goto LABEL_686;
        case 0x30u:
          a1[107] |= 1uLL;
          uint64_t v135 = *v3;
          unint64_t v136 = *(void *)(a2 + v135);
          if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v136);
            *(void *)(a2 + v135) = v136 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 1;
          goto LABEL_686;
        case 0x31u:
          a1[107] |= 0x8000000000uLL;
          uint64_t v137 = *v3;
          unint64_t v138 = *(void *)(a2 + v137);
          if (v138 <= 0xFFFFFFFFFFFFFFF7 && v138 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v138);
            *(void *)(a2 + v137) = v138 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 40;
          goto LABEL_686;
        case 0x32u:
          a1[107] |= 0x80000000000uLL;
          uint64_t v139 = *v3;
          unint64_t v140 = *(void *)(a2 + v139);
          if (v140 <= 0xFFFFFFFFFFFFFFF7 && v140 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v140);
            *(void *)(a2 + v139) = v140 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 44;
          goto LABEL_686;
        case 0x33u:
          a1[107] |= 0x10000000000uLL;
          uint64_t v141 = *v3;
          unint64_t v142 = *(void *)(a2 + v141);
          if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v142);
            *(void *)(a2 + v141) = v142 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 41;
          goto LABEL_686;
        case 0x34u:
          a1[107] |= 0x20000000000uLL;
          uint64_t v143 = *v3;
          unint64_t v144 = *(void *)(a2 + v143);
          if (v144 <= 0xFFFFFFFFFFFFFFF7 && v144 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v144);
            *(void *)(a2 + v143) = v144 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 42;
          goto LABEL_686;
        case 0x35u:
          a1[107] |= 0x40000000000uLL;
          uint64_t v145 = *v3;
          unint64_t v146 = *(void *)(a2 + v145);
          if (v146 <= 0xFFFFFFFFFFFFFFF7 && v146 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v146);
            *(void *)(a2 + v145) = v146 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 43;
          goto LABEL_686;
        case 0x36u:
          a1[107] |= 0x8000000000000uLL;
          uint64_t v147 = *v3;
          unint64_t v148 = *(void *)(a2 + v147);
          if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v148);
            *(void *)(a2 + v147) = v148 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 52;
          goto LABEL_686;
        case 0x37u:
          a1[107] |= 0x1000000000000uLL;
          uint64_t v149 = *v3;
          unint64_t v150 = *(void *)(a2 + v149);
          if (v150 <= 0xFFFFFFFFFFFFFFF7 && v150 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v150);
            *(void *)(a2 + v149) = v150 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 49;
          goto LABEL_686;
        case 0x38u:
          a1[107] |= 0x2000000000000uLL;
          uint64_t v151 = *v3;
          unint64_t v152 = *(void *)(a2 + v151);
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v152);
            *(void *)(a2 + v151) = v152 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 50;
          goto LABEL_686;
        case 0x39u:
          a1[107] |= 0x4000000000000uLL;
          uint64_t v153 = *v3;
          unint64_t v154 = *(void *)(a2 + v153);
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v154);
            *(void *)(a2 + v153) = v154 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 51;
          goto LABEL_686;
        case 0x3Au:
          a1[107] |= 0x200000uLL;
          uint64_t v155 = *v3;
          unint64_t v156 = *(void *)(a2 + v155);
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v156);
            *(void *)(a2 + v155) = v156 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 22;
          goto LABEL_686;
        case 0x3Bu:
          a1[107] |= 0x40000uLL;
          uint64_t v157 = *v3;
          unint64_t v158 = *(void *)(a2 + v157);
          if (v158 <= 0xFFFFFFFFFFFFFFF7 && v158 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v158);
            *(void *)(a2 + v157) = v158 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 19;
          goto LABEL_686;
        case 0x3Cu:
          a1[107] |= 0x80000uLL;
          uint64_t v159 = *v3;
          unint64_t v160 = *(void *)(a2 + v159);
          if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v160);
            *(void *)(a2 + v159) = v160 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 20;
          goto LABEL_686;
        case 0x3Du:
          a1[107] |= 0x100000uLL;
          uint64_t v161 = *v3;
          unint64_t v162 = *(void *)(a2 + v161);
          if (v162 <= 0xFFFFFFFFFFFFFFF7 && v162 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v162);
            *(void *)(a2 + v161) = v162 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 21;
          goto LABEL_686;
        case 0x3Eu:
          a1[107] |= 0x800000000000uLL;
          uint64_t v163 = *v3;
          unint64_t v164 = *(void *)(a2 + v163);
          if (v164 <= 0xFFFFFFFFFFFFFFF7 && v164 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v164);
            *(void *)(a2 + v163) = v164 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 48;
          goto LABEL_686;
        case 0x3Fu:
          a1[107] |= 0x100000000000uLL;
          uint64_t v165 = *v3;
          unint64_t v166 = *(void *)(a2 + v165);
          if (v166 <= 0xFFFFFFFFFFFFFFF7 && v166 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v166);
            *(void *)(a2 + v165) = v166 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 45;
          goto LABEL_686;
        case 0x40u:
          a1[107] |= 0x200000000000uLL;
          uint64_t v167 = *v3;
          unint64_t v168 = *(void *)(a2 + v167);
          if (v168 <= 0xFFFFFFFFFFFFFFF7 && v168 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v168);
            *(void *)(a2 + v167) = v168 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 46;
          goto LABEL_686;
        case 0x41u:
          a1[107] |= 0x400000000000uLL;
          uint64_t v169 = *v3;
          unint64_t v170 = *(void *)(a2 + v169);
          if (v170 <= 0xFFFFFFFFFFFFFFF7 && v170 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v170);
            *(void *)(a2 + v169) = v170 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 47;
          goto LABEL_686;
        case 0x42u:
          a1[107] |= 0x200uLL;
          uint64_t v171 = *v3;
          unint64_t v172 = *(void *)(a2 + v171);
          if (v172 <= 0xFFFFFFFFFFFFFFF7 && v172 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v172);
            *(void *)(a2 + v171) = v172 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 10;
          goto LABEL_686;
        case 0x43u:
          a1[107] |= 0x40uLL;
          uint64_t v173 = *v3;
          unint64_t v174 = *(void *)(a2 + v173);
          if (v174 <= 0xFFFFFFFFFFFFFFF7 && v174 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v174);
            *(void *)(a2 + v173) = v174 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 7;
          goto LABEL_686;
        case 0x44u:
          a1[107] |= 0x80uLL;
          uint64_t v175 = *v3;
          unint64_t v176 = *(void *)(a2 + v175);
          if (v176 <= 0xFFFFFFFFFFFFFFF7 && v176 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v176);
            *(void *)(a2 + v175) = v176 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 8;
          goto LABEL_686;
        case 0x45u:
          a1[107] |= 0x100uLL;
          uint64_t v177 = *v3;
          unint64_t v178 = *(void *)(a2 + v177);
          if (v178 <= 0xFFFFFFFFFFFFFFF7 && v178 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v178);
            *(void *)(a2 + v177) = v178 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 9;
          goto LABEL_686;
        case 0x46u:
          a1[107] |= 0x20000uLL;
          uint64_t v179 = *v3;
          unint64_t v180 = *(void *)(a2 + v179);
          if (v180 <= 0xFFFFFFFFFFFFFFF7 && v180 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v180);
            *(void *)(a2 + v179) = v180 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 18;
          goto LABEL_686;
        case 0x47u:
          a1[107] |= 0x4000uLL;
          uint64_t v181 = *v3;
          unint64_t v182 = *(void *)(a2 + v181);
          if (v182 <= 0xFFFFFFFFFFFFFFF7 && v182 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v182);
            *(void *)(a2 + v181) = v182 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 15;
          goto LABEL_686;
        case 0x48u:
          a1[107] |= 0x8000uLL;
          uint64_t v183 = *v3;
          unint64_t v184 = *(void *)(a2 + v183);
          if (v184 <= 0xFFFFFFFFFFFFFFF7 && v184 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v184);
            *(void *)(a2 + v183) = v184 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 16;
          goto LABEL_686;
        case 0x49u:
          a1[107] |= 0x10000uLL;
          uint64_t v185 = *v3;
          unint64_t v186 = *(void *)(a2 + v185);
          if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v186);
            *(void *)(a2 + v185) = v186 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 17;
          goto LABEL_686;
        case 0x4Au:
          a1[107] |= 0x20uLL;
          uint64_t v187 = *v3;
          unint64_t v188 = *(void *)(a2 + v187);
          if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v188);
            *(void *)(a2 + v187) = v188 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 6;
          goto LABEL_686;
        case 0x4Bu:
          a1[107] |= 4uLL;
          uint64_t v189 = *v3;
          unint64_t v190 = *(void *)(a2 + v189);
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v190);
            *(void *)(a2 + v189) = v190 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 3;
          goto LABEL_686;
        case 0x4Cu:
          a1[107] |= 8uLL;
          uint64_t v191 = *v3;
          unint64_t v192 = *(void *)(a2 + v191);
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v192);
            *(void *)(a2 + v191) = v192 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 4;
          goto LABEL_686;
        case 0x4Du:
          a1[107] |= 0x10uLL;
          uint64_t v193 = *v3;
          unint64_t v194 = *(void *)(a2 + v193);
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v194);
            *(void *)(a2 + v193) = v194 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 5;
          goto LABEL_686;
        case 0x4Eu:
          a1[107] |= 0x2000uLL;
          uint64_t v195 = *v3;
          unint64_t v196 = *(void *)(a2 + v195);
          if (v196 <= 0xFFFFFFFFFFFFFFF7 && v196 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v196);
            *(void *)(a2 + v195) = v196 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 14;
          goto LABEL_686;
        case 0x4Fu:
          a1[107] |= 0x400uLL;
          uint64_t v197 = *v3;
          unint64_t v198 = *(void *)(a2 + v197);
          if (v198 <= 0xFFFFFFFFFFFFFFF7 && v198 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v198);
            *(void *)(a2 + v197) = v198 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 11;
          goto LABEL_686;
        case 0x50u:
          a1[107] |= 0x800uLL;
          uint64_t v199 = *v3;
          unint64_t v200 = *(void *)(a2 + v199);
          if (v200 <= 0xFFFFFFFFFFFFFFF7 && v200 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v200);
            *(void *)(a2 + v199) = v200 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 12;
          goto LABEL_686;
        case 0x51u:
          a1[107] |= 0x1000uLL;
          uint64_t v201 = *v3;
          unint64_t v202 = *(void *)(a2 + v201);
          if (v202 <= 0xFFFFFFFFFFFFFFF7 && v202 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v202);
            *(void *)(a2 + v201) = v202 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 13;
          goto LABEL_686;
        case 0x52u:
          a1[107] |= 0x20000000uLL;
          uint64_t v203 = *v3;
          unint64_t v204 = *(void *)(a2 + v203);
          if (v204 <= 0xFFFFFFFFFFFFFFF7 && v204 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v204);
            *(void *)(a2 + v203) = v204 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 30;
          goto LABEL_686;
        case 0x53u:
          a1[107] |= 0x4000000uLL;
          uint64_t v205 = *v3;
          unint64_t v206 = *(void *)(a2 + v205);
          if (v206 <= 0xFFFFFFFFFFFFFFF7 && v206 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v206);
            *(void *)(a2 + v205) = v206 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 27;
          goto LABEL_686;
        case 0x54u:
          a1[107] |= 0x8000000uLL;
          uint64_t v207 = *v3;
          unint64_t v208 = *(void *)(a2 + v207);
          if (v208 <= 0xFFFFFFFFFFFFFFF7 && v208 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v208);
            *(void *)(a2 + v207) = v208 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 28;
          goto LABEL_686;
        case 0x55u:
          a1[107] |= 0x10000000uLL;
          uint64_t v209 = *v3;
          unint64_t v210 = *(void *)(a2 + v209);
          if (v210 <= 0xFFFFFFFFFFFFFFF7 && v210 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v210);
            *(void *)(a2 + v209) = v210 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 29;
          goto LABEL_686;
        case 0x56u:
          a1[107] |= 0x2000000000uLL;
          uint64_t v211 = *v3;
          unint64_t v212 = *(void *)(a2 + v211);
          if (v212 <= 0xFFFFFFFFFFFFFFF7 && v212 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v212);
            *(void *)(a2 + v211) = v212 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 38;
          goto LABEL_686;
        case 0x57u:
          a1[107] |= 0x400000000uLL;
          uint64_t v213 = *v3;
          unint64_t v214 = *(void *)(a2 + v213);
          if (v214 <= 0xFFFFFFFFFFFFFFF7 && v214 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v214);
            *(void *)(a2 + v213) = v214 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 35;
          goto LABEL_686;
        case 0x58u:
          a1[107] |= 0x800000000uLL;
          uint64_t v215 = *v3;
          unint64_t v216 = *(void *)(a2 + v215);
          if (v216 <= 0xFFFFFFFFFFFFFFF7 && v216 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v216);
            *(void *)(a2 + v215) = v216 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 36;
          goto LABEL_686;
        case 0x59u:
          a1[107] |= 0x1000000000uLL;
          uint64_t v217 = *v3;
          unint64_t v218 = *(void *)(a2 + v217);
          if (v218 <= 0xFFFFFFFFFFFFFFF7 && v218 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v218);
            *(void *)(a2 + v217) = v218 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 37;
          goto LABEL_686;
        case 0x5Au:
          a1[107] |= 0x2000000uLL;
          uint64_t v219 = *v3;
          unint64_t v220 = *(void *)(a2 + v219);
          if (v220 <= 0xFFFFFFFFFFFFFFF7 && v220 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v220);
            *(void *)(a2 + v219) = v220 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 26;
          goto LABEL_686;
        case 0x5Bu:
          a1[107] |= 0x400000uLL;
          uint64_t v221 = *v3;
          unint64_t v222 = *(void *)(a2 + v221);
          if (v222 <= 0xFFFFFFFFFFFFFFF7 && v222 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v222);
            *(void *)(a2 + v221) = v222 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 23;
          goto LABEL_686;
        case 0x5Cu:
          a1[107] |= 0x800000uLL;
          uint64_t v223 = *v3;
          unint64_t v224 = *(void *)(a2 + v223);
          if (v224 <= 0xFFFFFFFFFFFFFFF7 && v224 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v224);
            *(void *)(a2 + v223) = v224 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 24;
          goto LABEL_686;
        case 0x5Du:
          a1[107] |= 0x1000000uLL;
          uint64_t v225 = *v3;
          unint64_t v226 = *(void *)(a2 + v225);
          if (v226 <= 0xFFFFFFFFFFFFFFF7 && v226 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v226);
            *(void *)(a2 + v225) = v226 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 25;
          goto LABEL_686;
        case 0x5Eu:
          a1[107] |= 0x200000000uLL;
          uint64_t v227 = *v3;
          unint64_t v228 = *(void *)(a2 + v227);
          if (v228 <= 0xFFFFFFFFFFFFFFF7 && v228 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v228);
            *(void *)(a2 + v227) = v228 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 34;
          goto LABEL_686;
        case 0x5Fu:
          a1[107] |= 0x40000000uLL;
          uint64_t v229 = *v3;
          unint64_t v230 = *(void *)(a2 + v229);
          if (v230 <= 0xFFFFFFFFFFFFFFF7 && v230 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v230);
            *(void *)(a2 + v229) = v230 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 31;
          goto LABEL_686;
        case 0x60u:
          a1[107] |= 0x80000000uLL;
          uint64_t v231 = *v3;
          unint64_t v232 = *(void *)(a2 + v231);
          if (v232 <= 0xFFFFFFFFFFFFFFF7 && v232 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v232);
            *(void *)(a2 + v231) = v232 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 32;
          goto LABEL_686;
        case 0x61u:
          a1[107] |= 0x100000000uLL;
          uint64_t v233 = *v3;
          unint64_t v234 = *(void *)(a2 + v233);
          if (v234 <= 0xFFFFFFFFFFFFFFF7 && v234 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v234);
            *(void *)(a2 + v233) = v234 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 33;
          goto LABEL_686;
        case 0x62u:
          a1[107] |= 0x200000000000000uLL;
          uint64_t v235 = *v3;
          unint64_t v236 = *(void *)(a2 + v235);
          if (v236 <= 0xFFFFFFFFFFFFFFF7 && v236 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v236);
            *(void *)(a2 + v235) = v236 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 58;
          goto LABEL_686;
        case 0x63u:
          a1[107] |= 0x20000000000000uLL;
          uint64_t v237 = *v3;
          unint64_t v238 = *(void *)(a2 + v237);
          if (v238 <= 0xFFFFFFFFFFFFFFF7 && v238 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v238);
            *(void *)(a2 + v237) = v238 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 54;
          goto LABEL_686;
        case 0x64u:
          a1[107] |= 0x100000000000000uLL;
          uint64_t v239 = *v3;
          unint64_t v240 = *(void *)(a2 + v239);
          if (v240 <= 0xFFFFFFFFFFFFFFF7 && v240 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v240);
            *(void *)(a2 + v239) = v240 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v305 = 57;
LABEL_686:
          a1[v305] = v27;
          continue;
        case 0x65u:
          char v241 = 0;
          unsigned int v242 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v243 = *v3;
            unint64_t v244 = *(void *)(a2 + v243);
            if (v244 == -1 || v244 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v245 = *(unsigned char *)(*(void *)(a2 + *v7) + v244);
              *(void *)(a2 + v243) = v244 + 1;
              v116 |= (unint64_t)(v245 & 0x7F) << v241;
              if (v245 < 0)
              {
                v241 += 7;
                BOOL v14 = v242++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_450:
          uint64_t v304 = 808;
          goto LABEL_495;
        case 0x66u:
          uint64_t v246 = PBReaderReadString();
          v247 = (void *)a1[106];
          a1[106] = v246;

          continue;
        case 0x67u:
          char v248 = 0;
          unsigned int v249 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v250 = *v3;
            unint64_t v251 = *(void *)(a2 + v250);
            if (v251 == -1 || v251 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v252 = *(unsigned char *)(*(void *)(a2 + *v7) + v251);
              *(void *)(a2 + v250) = v251 + 1;
              v116 |= (unint64_t)(v252 & 0x7F) << v248;
              if (v252 < 0)
              {
                v248 += 7;
                BOOL v14 = v249++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_454:
          uint64_t v304 = 804;
          goto LABEL_495;
        case 0x68u:
          char v253 = 0;
          unsigned int v254 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x800000000000uLL;
          while (2)
          {
            uint64_t v255 = *v3;
            unint64_t v256 = *(void *)(a2 + v255);
            if (v256 == -1 || v256 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v257 = *(unsigned char *)(*(void *)(a2 + *v7) + v256);
              *(void *)(a2 + v255) = v256 + 1;
              v116 |= (unint64_t)(v257 & 0x7F) << v253;
              if (v257 < 0)
              {
                v253 += 7;
                BOOL v14 = v254++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_458:
          uint64_t v304 = 844;
          goto LABEL_495;
        case 0x69u:
          char v258 = 0;
          unsigned int v259 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x800000000uLL;
          while (2)
          {
            uint64_t v260 = *v3;
            unint64_t v261 = *(void *)(a2 + v260);
            if (v261 == -1 || v261 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v262 = *(unsigned char *)(*(void *)(a2 + *v7) + v261);
              *(void *)(a2 + v260) = v261 + 1;
              v116 |= (unint64_t)(v262 & 0x7F) << v258;
              if (v262 < 0)
              {
                v258 += 7;
                BOOL v14 = v259++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_462:
          uint64_t v304 = 796;
          goto LABEL_495;
        case 0x6Au:
          char v263 = 0;
          unsigned int v264 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v265 = *v3;
            unint64_t v266 = *(void *)(a2 + v265);
            if (v266 == -1 || v266 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v267 = *(unsigned char *)(*(void *)(a2 + *v7) + v266);
              *(void *)(a2 + v265) = v266 + 1;
              v116 |= (unint64_t)(v267 & 0x7F) << v263;
              if (v267 < 0)
              {
                v263 += 7;
                BOOL v14 = v264++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_466:
          uint64_t v304 = 800;
          goto LABEL_495;
        case 0x6Bu:
          char v268 = 0;
          unsigned int v269 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x200000000000uLL;
          while (2)
          {
            uint64_t v270 = *v3;
            unint64_t v271 = *(void *)(a2 + v270);
            if (v271 == -1 || v271 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v272 = *(unsigned char *)(*(void *)(a2 + *v7) + v271);
              *(void *)(a2 + v270) = v271 + 1;
              v116 |= (unint64_t)(v272 & 0x7F) << v268;
              if (v272 < 0)
              {
                v268 += 7;
                BOOL v14 = v269++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_470:
          uint64_t v304 = 836;
          goto LABEL_495;
        case 0x6Cu:
          char v273 = 0;
          unsigned int v274 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x400000000000uLL;
          while (2)
          {
            uint64_t v275 = *v3;
            unint64_t v276 = *(void *)(a2 + v275);
            if (v276 == -1 || v276 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v277 = *(unsigned char *)(*(void *)(a2 + *v7) + v276);
              *(void *)(a2 + v275) = v276 + 1;
              v116 |= (unint64_t)(v277 & 0x7F) << v273;
              if (v277 < 0)
              {
                v273 += 7;
                BOOL v14 = v274++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_474:
          uint64_t v304 = 840;
          goto LABEL_495;
        case 0x6Du:
          char v278 = 0;
          unsigned int v279 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x10000000000uLL;
          while (2)
          {
            uint64_t v280 = *v3;
            unint64_t v281 = *(void *)(a2 + v280);
            if (v281 == -1 || v281 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v282 = *(unsigned char *)(*(void *)(a2 + *v7) + v281);
              *(void *)(a2 + v280) = v281 + 1;
              v116 |= (unint64_t)(v282 & 0x7F) << v278;
              if (v282 < 0)
              {
                v278 += 7;
                BOOL v14 = v279++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_478:
          uint64_t v304 = 816;
          goto LABEL_495;
        case 0x6Eu:
          char v283 = 0;
          unsigned int v284 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x20000000000uLL;
          while (2)
          {
            uint64_t v285 = *v3;
            unint64_t v286 = *(void *)(a2 + v285);
            if (v286 == -1 || v286 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v287 = *(unsigned char *)(*(void *)(a2 + *v7) + v286);
              *(void *)(a2 + v285) = v286 + 1;
              v116 |= (unint64_t)(v287 & 0x7F) << v283;
              if (v287 < 0)
              {
                v283 += 7;
                BOOL v14 = v284++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_482:
          uint64_t v304 = 820;
          goto LABEL_495;
        case 0x6Fu:
          char v288 = 0;
          unsigned int v289 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x80000000000uLL;
          while (2)
          {
            uint64_t v290 = *v3;
            unint64_t v291 = *(void *)(a2 + v290);
            if (v291 == -1 || v291 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v292 = *(unsigned char *)(*(void *)(a2 + *v7) + v291);
              *(void *)(a2 + v290) = v291 + 1;
              v116 |= (unint64_t)(v292 & 0x7F) << v288;
              if (v292 < 0)
              {
                v288 += 7;
                BOOL v14 = v289++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_486:
          uint64_t v304 = 828;
          goto LABEL_495;
        case 0x70u:
          char v293 = 0;
          unsigned int v294 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x100000000000uLL;
          while (2)
          {
            uint64_t v295 = *v3;
            unint64_t v296 = *(void *)(a2 + v295);
            if (v296 == -1 || v296 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v297 = *(unsigned char *)(*(void *)(a2 + *v7) + v296);
              *(void *)(a2 + v295) = v296 + 1;
              v116 |= (unint64_t)(v297 & 0x7F) << v293;
              if (v297 < 0)
              {
                v293 += 7;
                BOOL v14 = v294++ >= 9;
                if (v14)
                {
                  LODWORD(v116) = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v116) = 0;
          }
LABEL_490:
          uint64_t v304 = 832;
          goto LABEL_495;
        case 0x71u:
          char v298 = 0;
          unsigned int v299 = 0;
          uint64_t v116 = 0;
          a1[108] |= 0x40000000000uLL;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v300 = *v3;
        unint64_t v301 = *(void *)(a2 + v300);
        if (v301 == -1 || v301 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v302 = *(unsigned char *)(*(void *)(a2 + *v7) + v301);
        *(void *)(a2 + v300) = v301 + 1;
        v116 |= (unint64_t)(v302 & 0x7F) << v298;
        if ((v302 & 0x80) == 0) {
          goto LABEL_492;
        }
        v298 += 7;
        BOOL v14 = v299++ >= 9;
        if (v14)
        {
          LODWORD(v116) = 0;
          goto LABEL_494;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_492:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v116) = 0;
      }
LABEL_494:
      uint64_t v304 = 824;
LABEL_495:
      *(_DWORD *)((char *)a1 + v304) = v116;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EDE9B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18EDE9E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PersonLinkingPersonReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = (void *)a1[2];
        a1[2] = v17;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v18 = PBReaderReadString();
    if (v18) {
      [a1 addEmails:v18];
    }
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EDEAD78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEB114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEBB18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEC004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEC3B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEC71C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEC8D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDEC9C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDECD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDECF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDED2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return *(void *)(v0 + *(int *)(v1 + 492));
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  uint64_t v2 = *(void **)(v0 + 312);
  return [v2 me];
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

void OUTLINED_FUNCTION_8_3(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log, uint8_t buf)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, &buf, 0x48u);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return *(void *)(v0 + *(int *)(v1 + 492));
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  uint64_t v2 = *(void **)(v0 + 312);
  return [v2 me];
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return *(void *)(v0 + *(int *)(v1 + 492));
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return *(void *)(v0 + *(int *)(v1 + 492));
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return *(void *)(v1 + *(int *)(v0 + 492));
}

id _DKSyncLoggingWindowsDescription(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  if ([v1 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      char v7 = 1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((v7 & 1) == 0) {
            [v2 appendString:@", ", (void)v12];
          }
          unint64_t v10 = objc_msgSend(v9, "debugDescription", (void)v12);
          [v2 appendString:v10];

          char v7 = 0;
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        char v7 = 0;
      }
      while (v5);
    }
  }
  else
  {
    [v2 appendString:@"no windows"];
  }

  return v2;
}

void sub_18EDF10AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF1330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char *bucket_name_for_timing(double a1)
{
  unsigned int v1 = 0;
  unint64_t v2 = (unint64_t)a1;
  if ((unint64_t)a1)
  {
    do
    {
      ++v1;
      BOOL v3 = v2 > 1;
      v2 >>= 1;
    }
    while (v3);
  }
  if (v1 >= 0x14) {
    unsigned int v1 = 20;
  }
  return _bucket_names[v1];
}

uint64_t _DKPREventReadFrom(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    uint64_t v16 = *v5;
    int v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(unsigned char *)(a2 + v16)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v17 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v19 = objc_alloc_init(_DKPRStream);
        objc_storeStrong((id *)(a1 + 80), v19);
        if (PBReaderPlaceMark() && _DKPRStreamReadFrom((uint64_t)v19, a2)) {
          goto LABEL_39;
        }
        goto LABEL_80;
      case 2u:
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v46 = 40;
        goto LABEL_77;
      case 3u:
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v46 = 32;
        goto LABEL_77;
      case 4u:
        uint64_t v19 = objc_alloc_init(_DKPRValue);
        objc_storeStrong((id *)(a1 + 88), v19);
        if (!PBReaderPlaceMark() || (_DKPRValueReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_80;
        }
        goto LABEL_39;
      case 5u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v26;

        goto LABEL_78;
      case 6u:
        uint64_t v19 = objc_alloc_init(_DKPRSource);
        objc_storeStrong((id *)(a1 + 72), v19);
        if (!PBReaderPlaceMark() || (_DKPRSourceReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_80;
        }
        goto LABEL_39;
      case 7u:
        uint64_t v19 = objc_alloc_init(_DKPRMetadataEntry);
        -[_DKPREvent addMetadata:](a1, v19);
        if PBReaderPlaceMark() && (_DKPRMetadataEntryReadFrom((uint64_t)v19, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_78:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_80:

        return 0;
      case 8u:
        *(unsigned char *)(a1 + 96) |= 4u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v2_Block_object_dispose(&STACK[0x320], 8) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v46 = 24;
        goto LABEL_77;
      case 9u:
        *(unsigned char *)(a1 + 96) |= 2u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v46 = 16;
LABEL_77:
        *(void *)(a1 + v46) = v23;
        goto LABEL_78;
      case 0xAu:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(unsigned char *)(a1 + 96) |= 8u;
        while (2)
        {
          uint64_t v35 = *v3;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                uint64_t v34 = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_63:
        uint64_t v45 = 48;
        goto LABEL_68;
      case 0xBu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v34 = 0;
        *(unsigned char *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v34 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v15 = v40++ >= 9;
              if (v15)
              {
                uint64_t v34 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_67:
        uint64_t v45 = 8;
LABEL_68:
        *(void *)(a1 + v45) = v34;
        goto LABEL_78;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_78;
    }
  }
}

#error "18EDF44F8: call analysis failed (funcsize=56)"

uint64_t OUTLINED_FUNCTION_4_9()
{
  unint64_t v2 = *(void **)(v0 + 320);
  return [v2 me];
}

void OUTLINED_FUNCTION_5_8(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x34u);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return *(void *)(*(void *)(v0 + 32) + *(int *)(v1 + 668));
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return *(void *)(v0 + *(int *)(v1 + 668));
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return *(void *)(v0 + *(int *)(v1 + 668));
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return *(void *)(v0 + *(int *)(v1 + 668));
}

void sub_18EDF6070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EDF6920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDF6AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _clientNeedsHelpCallback(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_18ECEB000, "Duet: clientNeedsHelpCallback", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v5, &v13);
  os_activity_scope_leave(&v13);

  id v6 = a2;
  id v7 = a3;
  if (v6
    && ([NSString stringWithFormat:@"com.apple.coreduet.client-needs-help."],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 containsString:v8],
        v8,
        (v9 & 1) != 0))
  {
    unint64_t v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      _clientNeedsHelpCallback_cold_3();
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        _clientNeedsHelpCallback_cold_2();
      }
    }
    -[_DKCoreDataStorage handleClientCallForHelp](v6);
    uint64_t v12 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13.opaque[0]) = 138412290;
      *(uint64_t *)((char *)v13.opaque + 4) = (uint64_t)v7;
      _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEFAULT, "Done handling client help call: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      _clientNeedsHelpCallback_cold_1();
    }
  }
}

void sub_18EDF71A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EDF75B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF7764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF77FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF7AA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF82EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_sync_exit(v24);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_18EDF8AE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF8C38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDF94EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18EDF9958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18EDFA08C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EDFA28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDFA434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EDFA7C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    uint64_t v12 = [*(id *)(v10 + 32) persistentStoreCoordinator];
    os_activity_scope_state_s v13 = [v12 persistentStores];
    BOOL v14 = [v13 count] == 0;

    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v14)
    {
      if (v15) {
        __146___DKCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit_includeSubentities_includePendingChanges___block_invoke_cold_1();
      }

      objc_end_catch();
      JUMPOUT(0x18EDFA6E0);
    }
    if (v15) {
      __145___DKCoreDataStorage_updateObjectsInContext_entityName_predicate_sortDescriptors_batchFetchLimit_totalFetchLimit_includeSubentities_updateBlock___block_invoke_cold_2();
    }
    objc_exception_throw(v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _cdknowledge_isInternal()
{
  return os_variant_has_internal_diagnostics();
}

void _cdknowledge_signpost_count_begin(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v3 = +[_CDLogging knowledgeSignpost];
  BOOL v4 = os_signpost_enabled(v3);
  if (has_internal_diagnostics)
  {
    if (v4)
    {
      uint64_t v5 = _CDCurrentOrXPCProcessName();
      int v6 = 138543618;
      id v7 = v5;
      __int16 v8 = 2114;
      id v9 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CountObjects", " Process=%{signpost.telemetry:string1,public}@  Entity=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CountObjects", (const char *)&unk_18EEB7986, (uint8_t *)&v6, 2u);
  }
}

void _cdknowledge_signpost_count_end(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v4))
  {
    int v5 = 134349312;
    uint64_t v6 = a1;
    __int16 v7 = 2050;
    uint64_t v8 = a2;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CountObjects", " Count=%{signpost.telemetry:number1,public}lu  ErrorCode=%{signpost.telemetry:number2,public}ld ", (uint8_t *)&v5, 0x16u);
  }
}

void _cdknowledge_signpost_event_count(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int v5 = +[_CDLogging knowledgeSignpost];
  BOOL v6 = os_signpost_enabled(v5);
  if (has_internal_diagnostics)
  {
    if (v6)
    {
      int v10 = 134349314;
      uint64_t v11 = a1;
      __int16 v12 = 2114;
      id v13 = v3;
      __int16 v7 = " EventCount=%{signpost.telemetry:number1,public}lu  Stream=%{signpost.telemetry:string2,public}@ ";
      uint64_t v8 = v5;
      uint32_t v9 = 22;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CountEvents", v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 134349056;
    uint64_t v11 = a1;
    __int16 v7 = " EventCount=%{signpost.telemetry:number1,public}lu ";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void _cdcontextstore_signpost_register_begin(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (os_variant_has_internal_diagnostics())
  {
    int v5 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v5))
    {
      int v6 = 138543618;
      id v7 = v3;
      __int16 v8 = 2114;
      id v9 = v4;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RegisterKeyPath", " RegistrationID=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v6, 0x16u);
    }
  }
}

void _cdcontextstore_signpost_register_end()
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)id v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RegisterKeyPath", (const char *)&unk_18EEB7986, v1, 2u);
    }
  }
}

void _cdcontextstore_signpost_get_object_begin(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t v2 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v2))
    {
      id v3 = _CDCurrentOrXPCProcessName();
      int v4 = 138543618;
      int v5 = v3;
      __int16 v6 = 2114;
      id v7 = v1;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetKeyPath", " Process=%{signpost.telemetry:string1,public}@  KeyPath=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ", (uint8_t *)&v4, 0x16u);
    }
  }
}

void _cdcontextstore_signpost_get_object_end()
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = +[_CDLogging contextChannel];
    if (os_signpost_enabled(v0))
    {
      *(_WORD *)id v1 = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetKeyPath", (const char *)&unk_18EEB7986, v1, 2u);
    }
  }
}

void sub_18EDFBE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CDPrettyPrintCollection(void *a1, unsigned int a2, unint64_t a3, unsigned int a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = v6;
  if (v6)
  {
    memset(v33, 0, sizeof(v33));
    if ([v6 countByEnumeratingWithState:v33 objects:v35 count:16]) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    uint64_t v10 = v9;
    if (v8 == 1) {
      [v9 appendString:@"\n"];
    }
    char v27 = objc_opt_respondsToSelector();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v25 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = @", ";
      uint64_t v15 = *(void *)v30;
      if (v8) {
        uint64_t v14 = @",\n";
      }
      uint64_t v26 = v14;
      char v16 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((v16 & 1) == 0) {
            [v10 appendString:v26];
          }
          if (v8)
          {
            unint64_t v19 = 0;
            do
            {
              [v10 appendString:@"    "];
              ++v19;
            }
            while (v19 <= a3);
          }
          if (v27)
          {
            uint64_t v20 = [v11 objectForKey:v18];
            [v10 appendFormat:@"%@=", v18];
            if ([v20 conformsToProtocol:&unk_1EDE494D0])
            {
              uint64_t v21 = _CDPrettyPrintCollection(v20, v8, a3 + 1, a4);
              goto LABEL_28;
            }
            if (a4)
            {
              objc_msgSend(v10, "appendString:", objc_msgSend(v20, "performSelector:", sel_debugDescription));
            }
            else
            {
              uint64_t v21 = [v20 description];
LABEL_28:
              uint64_t v23 = (void *)v21;
              [v10 appendString:v21];
            }
            goto LABEL_30;
          }
          if (a4)
          {
            objc_msgSend(v10, "appendString:", objc_msgSend(v18, "performSelector:", sel_debugDescription));
          }
          else
          {
            unint64_t v22 = [v18 description];
            [v10 appendString:v22];
          }
LABEL_30:
          char v16 = 0;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
        char v16 = 0;
      }
      while (v13);
    }

    if (v8)
    {
      [v10 appendString:@"\n"];
      for (; a3; --a3)
        [v10 appendString:@"    "];
    }
    [v10 appendString:@""]);
    id v7 = v25;
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@", 0];
  }

  return v10;
}

void *_CDLoggingUUIDAsInteger(void *result)
{
  void v1[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1[0] = 0;
    v1[1] = 0;
    [result getUUIDBytes:v1];
    return (void *)bswap64(v1[0]);
  }
  return result;
}

id _CDFormattedDate(void *a1)
{
  uint64_t v1 = _CDFormattedDate_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_CDFormattedDate_onceToken, &__block_literal_global_102);
  }
  id v3 = [(id)_CDFormattedDate_formatter stringFromDate:v2];

  return v3;
}

id _CDRandomDataWithLength()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  uint64_t v1 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v2 = v0;
  if (SecRandomCopyBytes(v1, 0x20uLL, (void *)[v2 mutableBytes]))
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9B8] dataWithData:v2];
  }

  return v3;
}

uint64_t _CDTruncatedSHA256(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if ([v4 length])
  {
    id v5 = v4;
    CC_SHA256_Update(&c, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }
  id v6 = [v3 dataUsingEncoding:4];
  CC_SHA256_Update(&c, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  CC_SHA256_Final(md, &c);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
  uint64_t v10 = 0;
  [v7 getBytes:&v10 length:8];
  uint64_t v8 = v10;

  return v8;
}

void sub_18EDFEB90(_Unwind_Exception *a1)
{
}

void sub_18EDFEBB0(void *a1)
{
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return *(void *)(v0 + *(int *)(v1 + 936));
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return *(void *)(v0 + *(int *)(v1 + 936));
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  id v2 = *(void **)(v0 + 312);
  return [v2 me];
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  id v2 = *(void **)(v0 + 312);
  return [v2 me];
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  id v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

uint64_t OUTLINED_FUNCTION_14_4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 + *(int *)(v1 + 936));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return *(void *)(v0 + *(int *)(v1 + 936));
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  id v2 = *(void **)(v0 + 304);
  return [v2 transportType];
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return *(void *)(v0 + *(int *)(v1 + 936));
}

void OUTLINED_FUNCTION_20_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x48u);
}

void OUTLINED_FUNCTION_21(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x48u);
}

uint64_t _DKPRSourceReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_26;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_26;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_26;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_26;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_26:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(&STACK[0x320], 8) = v17;

          continue;
        case 6u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_37;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_39;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_39:
      *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x320], 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE0459C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18EE04B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_18EE059A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EE065D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE06C20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE07060(_Unwind_Exception *exception_object)
{
}

uint64_t _handleShutdownNotification(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = a3;
    _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Got shutdown notification %@", (uint8_t *)&v6, 0xCu);
  }
  return [a2 handleShutdownNotification];
}

void sub_18EE073B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE08888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE0898C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE08A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t KnowledgeMonitorLibraryCore()
{
  if (!KnowledgeMonitorLibraryCore_frameworkLibrary) {
    KnowledgeMonitorLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return KnowledgeMonitorLibraryCore_frameworkLibrary;
}

uint64_t __KnowledgeMonitorLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  KnowledgeMonitorLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t UsageTrackingLibraryCore()
{
  if (!UsageTrackingLibraryCore_frameworkLibrary) {
    UsageTrackingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return UsageTrackingLibraryCore_frameworkLibrary;
}

uint64_t __UsageTrackingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UsageTrackingLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18EE0F5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE0FF94(_Unwind_Exception *a1)
{
}

uint64_t VisionSignalGradingEntryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t MailIntelligencePETContactEventsReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(MailIntelligencePETContactEvent);
        [a1 addContactEvent:v17];
        if (!PBReaderPlaceMark() || (MailIntelligencePETContactEventReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PersonLinkingLinkedPairEventReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = (PersonLinkingPersonPair *)a1[2];
        a1[2] = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(PersonLinkingPersonPair);
    [a1 addPairs:v18];
    if (!PBReaderPlaceMark() || (PersonLinkingPersonPairReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _DKPRMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_DKPRMetadataEntry);
        -[_DKPRMetadata addEntry:](a1, v17);
        if (!PBReaderPlaceMark() || (_DKPRMetadataEntryReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE13B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE160D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v1 = (void *)MEMORY[0x192FB2F20]();
  v2[2]();
}

void sub_18EE16378(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    unint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      char v14 = objc_opt_respondsToSelector();
      if (v14)
      {
        int v15 = [v11 callStackSymbols];
      }
      else
      {
        int v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if (v14) {
    }
      }
    objc_exception_throw(v11);
  }
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_SYNC_OUT_TO_A_BLOCK__(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v1 = (void *)MEMORY[0x192FB2F20]();
  v2[2]();
}

void sub_18EE16508(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    unint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      char v14 = objc_opt_respondsToSelector();
      if (v14)
      {
        int v15 = [v11 callStackSymbols];
      }
      else
      {
        int v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if (v14) {
    }
      }
    objc_exception_throw(v11);
  }
  _Unwind_Resume(a1);
}

void __DKSYNCDISPATCHER_IS_CALLING_AFTER_OUT_TO_A_BLOCK__(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v1 = (void *)MEMORY[0x192FB2F20]();
  v2[2]();
}

void sub_18EE16698(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    unint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      char v14 = objc_opt_respondsToSelector();
      if (v14)
      {
        int v15 = [v11 callStackSymbols];
      }
      else
      {
        int v15 = 0;
      }
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v11;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v15;
      _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Uncaught exception %{public}@ thrown at %{public}@", (uint8_t *)&buf, 0x16u);
      if (v14) {
    }
      }
    objc_exception_throw(v11);
  }
  _Unwind_Resume(a1);
}

BOOL _DKPRChangeSetReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(_DKPREvent);
        -[_DKPRChangeSet addEvents:](a1, v17);
        if (!PBReaderPlaceMark() || (_DKPREventReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadString();
    uint64_t v17 = (_DKPREvent *)objc_claimAutoreleasedReturnValue();
    if (v17) {
      -[_DKPRChangeSet addDeleteEventID:](a1, v17);
    }
LABEL_25:

    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE18910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE18B64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CDClientStateFromEventIndexerBookmark(uint64_t a1)
{
  id v5 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v5];
  id v2 = v5;
  if (v2)
  {
    id v3 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _CDClientStateFromEventIndexerBookmark_cold_1();
    }
  }
  return v1;
}

void recordInteractionsAsync(void *a1, void *a2, NSUInteger a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  char v13 = (void (**)(void, void, void))[a6 copy];
  v28.length = [v12 count];
  v28.location = 0;
  v29.location = a3;
  v29.length = 128;
  NSRange v14 = NSIntersectionRange(v28, v29);
  if (v14.length)
  {
    int v15 = objc_msgSend(v12, "subarrayWithRange:", v14.location, v14.length);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __recordInteractionsAsync_block_invoke;
    v17[3] = &unk_1E56104A0;
    id v18 = v11;
    id v19 = v12;
    NSUInteger v21 = v14.location + v14.length;
    char v23 = a4;
    char v24 = a5;
    unsigned int v20 = v13;
    NSRange v22 = v14;
    [v18 recordInteractions:v15 enforceDataLimits:a4 enforcePrivacy:a5 reply:v17];
  }
  else
  {
    char v16 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = [v12 count];
      _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEFAULT, "[async path] successfully sent all %tu interactions to coreduet daemon", buf, 0xCu);
    }

    v13[2](v13, 1, 0);
  }
}

uint64_t __recordInteractionsAsync_block_invoke(uint64_t a1, int a2)
{
  id v4 = +[_CDLogging interactionChannel];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "[async path] batch sent successfully", v7, 2u);
    }

    return recordInteractionsAsync(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __recordInteractionsAsync_block_invoke_cold_1(a1, v5);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_18EE1C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18EE1CFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EE1D440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18EE1D88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EE1DCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18EE1E0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18EE1E440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18EE1E708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18EE1EB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18EE1EF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18EE216E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EE2467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE24B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sleepPrediction(double *a1, uint64_t a2, unsigned int a3)
{
  return sleepPredictionWithParams2(a1, a2, a3, 0.8, 0.7, 0.5);
}

uint64_t sleepPredictionWithParams(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6, int a7)
{
  if (a7 == 1) {
    return sleepPredictionWithParams1(a1, a2, a3, a4, a5, a6);
  }
  else {
    return sleepPredictionWithParams2((double *)a1, a2, a3, a4, a5, a6);
  }
}

uint64_t validatePastDetection(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || (int)a2 % 96) {
    return 0xFFFFFFFFLL;
  }
  int v3 = a2 - 2;
  if (a2 >= 2)
  {
    while (*(_DWORD *)(a1 + 4 * v3) == *(_DWORD *)(a1 + 4 * (int)(a2 - 1)))
    {
      if (v3-- <= 0)
      {
        int v3 = -1;
        break;
      }
    }
  }
  int v5 = (int)(~v3 + a2) % 96 + v3 + 1;
  if (v5 / 96 < 3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

uint64_t sleepPredictionWithParams1(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6)
{
  uint64_t result = validatePastDetection(a2, a3);
  if (result != -1)
  {
    LODWORD(v12) = (int)result / 96;
    if ((int)result / 96 >= 3)
    {
      unint64_t v13 = 0;
      LODWORD(v14) = (int)v12 / 7;
      if ((int)v12 / 7 >= 4) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = v14;
      }
      if ((int)v12 >= 6) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = v12;
      }
      double v15 = a6 + 1.0;
      uint64_t v16 = (int)result;
      uint64_t v17 = 576;
      int v18 = 1;
LABEL_11:
      if ((int)v12 < 1)
      {
LABEL_38:
        uint64_t v35 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v36 = 0;
          _os_log_impl(&dword_18ECEB000, v35, OS_LOG_TYPE_INFO, "Sleep Prediction: some data available, but no valid data in the past few days", v36, 2u);
        }
      }
      else
      {
        double v19 = 0.0;
        double v20 = 1.0;
        uint64_t v21 = v12;
        int64_t v22 = v13;
        double v23 = 0.0;
        while (v22 < v16)
        {
          int v24 = *(_DWORD *)(a2 + 4 * v22);
          double v25 = -0.0;
          if (v24 != -1) {
            double v25 = v20;
          }
          double v23 = v23 + v25;
          if (v24 != -1) {
            double v19 = v19 + (double)v24 * v20;
          }
          double v20 = v20 * a4;
          v22 += 96;
          if (!--v21)
          {
            if (v23 == 0.0) {
              goto LABEL_38;
            }
            double v26 = v19 / v23;
            if (v14)
            {
              if ((int)v14 >= 1)
              {
                double v27 = 1.0;
                double v28 = 0.0;
                uint64_t v29 = v17;
                uint64_t v30 = v14;
                double v31 = 0.0;
                while (v29 >= 1 && v29 <= v16)
                {
                  int v32 = *(_DWORD *)(a2 + 4 * v29);
                  double v33 = -0.0;
                  if (v32 != -1) {
                    double v33 = v27;
                  }
                  double v31 = v31 + v33;
                  if (v32 != -1) {
                    double v28 = v28 + (double)v32 * v27;
                  }
                  double v27 = v27 * a5;
                  v29 += 672;
                  if (!--v30) {
                    goto LABEL_32;
                  }
                }
                return (v18 << 31 >> 31);
              }
              double v31 = 0.0;
              double v28 = 0.0;
LABEL_32:
              double v34 = v28 / v31;
              if (v31 == 0.0) {
                double v34 = v26;
              }
              double v26 = (v26 + a6 * v34) / v15;
            }
            *(double *)(a1 + 8 * v13++) = v26;
            ++v17;
            int v18 = v13 < 0x60;
            if (v13 != 96) {
              goto LABEL_11;
            }
            return (v18 << 31 >> 31);
          }
        }
      }
      return (v18 << 31 >> 31);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t MailIntelligencePETContactEventReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          a1[100] |= 0x80uLL;
          while (1)
          {
            uint64_t v20 = *v3;
            uint64_t v21 = *(void *)(a2 + v20);
            unint64_t v22 = v21 + 1;
            if (v21 == -1 || v22 > *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v22;
            v19 |= (unint64_t)(v23 & 0x7F) << v17;
            if ((v23 & 0x80) == 0) {
              goto LABEL_407;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_409;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_407:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_409:
          uint64_t v290 = 72;
          goto LABEL_479;
        case 2u:
          a1[100] |= 0x40uLL;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 71;
          goto LABEL_652;
        case 3u:
          a1[99] |= 0x2000000000000000uLL;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v2_Block_object_dispose(&STACK[0x320], 8) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 62;
          goto LABEL_652;
        case 4u:
          a1[99] |= 0x400000000000000uLL;
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 59;
          goto LABEL_652;
        case 5u:
          a1[99] |= 0x800000000000000uLL;
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 60;
          goto LABEL_652;
        case 6u:
          a1[99] |= 0x1000000000000000uLL;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 61;
          goto LABEL_652;
        case 7u:
          a1[100] |= 0x20uLL;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 70;
          goto LABEL_652;
        case 8u:
          a1[100] |= 4uLL;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v3_Block_object_dispose(&STACK[0x320], 8) = v39 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 67;
          goto LABEL_652;
        case 9u:
          a1[100] |= 8uLL;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 68;
          goto LABEL_652;
        case 0xAu:
          a1[100] |= 0x10uLL;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 69;
          goto LABEL_652;
        case 0xBu:
          a1[99] |= 0x200000000000000uLL;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 58;
          goto LABEL_652;
        case 0xCu:
          a1[99] |= 0x40000000000000uLL;
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 55;
          goto LABEL_652;
        case 0xDu:
          a1[99] |= 0x80000000000000uLL;
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v4_Block_object_dispose(&STACK[0x320], 8) = v49 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 56;
          goto LABEL_652;
        case 0xEu:
          a1[99] |= 0x100000000000000uLL;
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 57;
          goto LABEL_652;
        case 0xFu:
          a1[100] |= 2uLL;
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v53 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 66;
          goto LABEL_652;
        case 0x10u:
          a1[99] |= 0x4000000000000000uLL;
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v55);
            *(void *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 63;
          goto LABEL_652;
        case 0x11u:
          a1[99] |= 0x8000000000000000;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 64;
          goto LABEL_652;
        case 0x12u:
          a1[100] |= 1uLL;
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v5_Block_object_dispose(&STACK[0x320], 8) = v59 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 65;
          goto LABEL_652;
        case 0x13u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v19 = 0;
          a1[100] |= 0x1000000uLL;
          while (2)
          {
            uint64_t v62 = *v3;
            uint64_t v63 = *(void *)(a2 + v62);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
              *(void *)(a2 + v62) = v64;
              v19 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v14 = v61++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_413;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_413:
          uint64_t v290 = 90;
          goto LABEL_479;
        case 0x14u:
          a1[100] |= 0x8000uLL;
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 81;
          goto LABEL_652;
        case 0x15u:
          a1[100] |= 0x1000uLL;
          uint64_t v68 = *v3;
          unint64_t v69 = *(void *)(a2 + v68);
          if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v69);
            *(void *)(a2 + v6_Block_object_dispose(&STACK[0x320], 8) = v69 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 78;
          goto LABEL_652;
        case 0x16u:
          a1[100] |= 0x2000uLL;
          uint64_t v70 = *v3;
          unint64_t v71 = *(void *)(a2 + v70);
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v71);
            *(void *)(a2 + v70) = v71 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 79;
          goto LABEL_652;
        case 0x17u:
          a1[100] |= 0x4000uLL;
          uint64_t v72 = *v3;
          unint64_t v73 = *(void *)(a2 + v72);
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v73 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 80;
          goto LABEL_652;
        case 0x18u:
          a1[100] |= 0x800000uLL;
          uint64_t v74 = *v3;
          unint64_t v75 = *(void *)(a2 + v74);
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v75);
            *(void *)(a2 + v74) = v75 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 89;
          goto LABEL_652;
        case 0x19u:
          a1[100] |= 0x100000uLL;
          uint64_t v76 = *v3;
          unint64_t v77 = *(void *)(a2 + v76);
          if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v77);
            *(void *)(a2 + v76) = v77 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 86;
          goto LABEL_652;
        case 0x1Au:
          a1[100] |= 0x200000uLL;
          uint64_t v78 = *v3;
          unint64_t v79 = *(void *)(a2 + v78);
          if (v79 <= 0xFFFFFFFFFFFFFFF7 && v79 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v7_Block_object_dispose(&STACK[0x320], 8) = v79 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 87;
          goto LABEL_652;
        case 0x1Bu:
          a1[100] |= 0x400000uLL;
          uint64_t v80 = *v3;
          unint64_t v81 = *(void *)(a2 + v80);
          if (v81 <= 0xFFFFFFFFFFFFFFF7 && v81 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v81 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 88;
          goto LABEL_652;
        case 0x1Cu:
          a1[100] |= 0x800uLL;
          uint64_t v82 = *v3;
          unint64_t v83 = *(void *)(a2 + v82);
          if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v83);
            *(void *)(a2 + v82) = v83 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 77;
          goto LABEL_652;
        case 0x1Du:
          a1[100] |= 0x100uLL;
          uint64_t v84 = *v3;
          unint64_t v85 = *(void *)(a2 + v84);
          if (v85 <= 0xFFFFFFFFFFFFFFF7 && v85 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v85);
            *(void *)(a2 + v84) = v85 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 74;
          goto LABEL_652;
        case 0x1Eu:
          a1[100] |= 0x200uLL;
          uint64_t v86 = *v3;
          unint64_t v87 = *(void *)(a2 + v86);
          if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v87);
            *(void *)(a2 + v86) = v87 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 75;
          goto LABEL_652;
        case 0x1Fu:
          a1[100] |= 0x400uLL;
          uint64_t v88 = *v3;
          unint64_t v89 = *(void *)(a2 + v88);
          if (v89 <= 0xFFFFFFFFFFFFFFF7 && v89 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v89);
            *(void *)(a2 + v8_Block_object_dispose(&STACK[0x320], 8) = v89 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 76;
          goto LABEL_652;
        case 0x20u:
          a1[100] |= 0x80000uLL;
          uint64_t v90 = *v3;
          unint64_t v91 = *(void *)(a2 + v90);
          if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v91);
            *(void *)(a2 + v90) = v91 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 85;
          goto LABEL_652;
        case 0x21u:
          a1[100] |= 0x10000uLL;
          uint64_t v92 = *v3;
          unint64_t v93 = *(void *)(a2 + v92);
          if (v93 <= 0xFFFFFFFFFFFFFFF7 && v93 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v93);
            *(void *)(a2 + v92) = v93 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 82;
          goto LABEL_652;
        case 0x22u:
          a1[100] |= 0x20000uLL;
          uint64_t v94 = *v3;
          unint64_t v95 = *(void *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v95);
            *(void *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 83;
          goto LABEL_652;
        case 0x23u:
          a1[100] |= 0x40000uLL;
          uint64_t v96 = *v3;
          unint64_t v97 = *(void *)(a2 + v96);
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v97);
            *(void *)(a2 + v96) = v97 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 84;
          goto LABEL_652;
        case 0x24u:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v19 = 0;
          a1[99] |= 0x10000000000000uLL;
          while (2)
          {
            uint64_t v100 = *v3;
            uint64_t v101 = *(void *)(a2 + v100);
            unint64_t v102 = v101 + 1;
            if (v101 == -1 || v102 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
              *(void *)(a2 + v100) = v102;
              v19 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                BOOL v14 = v99++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_417;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_417:
          uint64_t v290 = 53;
          goto LABEL_479;
        case 0x25u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x2000000uLL;
          while (2)
          {
            uint64_t v107 = *v3;
            uint64_t v108 = *(void *)(a2 + v107);
            unint64_t v109 = v108 + 1;
            if (v108 == -1 || v109 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
              *(void *)(a2 + v107) = v109;
              v106 |= (unint64_t)(v110 & 0x7F) << v104;
              if (v110 < 0)
              {
                v104 += 7;
                BOOL v14 = v105++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_421;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_421:
          uint64_t v291 = 728;
          goto LABEL_474;
        case 0x26u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x40000000uLL;
          while (2)
          {
            uint64_t v113 = *v3;
            uint64_t v114 = *(void *)(a2 + v113);
            unint64_t v115 = v114 + 1;
            if (v114 == -1 || v115 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v116 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
              *(void *)(a2 + v113) = v115;
              v106 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                BOOL v14 = v112++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_425;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_425:
          uint64_t v291 = 748;
          goto LABEL_474;
        case 0x27u:
          a1[99] |= 0x20000000000000uLL;
          uint64_t v117 = *v3;
          unint64_t v118 = *(void *)(a2 + v117);
          if (v118 <= 0xFFFFFFFFFFFFFFF7 && v118 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v118);
            *(void *)(a2 + v117) = v118 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 54;
          goto LABEL_652;
        case 0x28u:
          a1[99] |= 0x2000000000uLL;
          uint64_t v119 = *v3;
          unint64_t v120 = *(void *)(a2 + v119);
          if (v120 <= 0xFFFFFFFFFFFFFFF7 && v120 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v120);
            *(void *)(a2 + v119) = v120 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 38;
          goto LABEL_652;
        case 0x29u:
          a1[99] |= 0x8000000000000uLL;
          uint64_t v121 = *v3;
          unint64_t v122 = *(void *)(a2 + v121);
          if (v122 <= 0xFFFFFFFFFFFFFFF7 && v122 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v122);
            *(void *)(a2 + v121) = v122 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 52;
          goto LABEL_652;
        case 0x2Au:
          a1[99] |= 1uLL;
          uint64_t v123 = *v3;
          unint64_t v124 = *(void *)(a2 + v123);
          if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v124);
            *(void *)(a2 + v123) = v124 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 1;
          goto LABEL_652;
        case 0x2Bu:
          a1[99] |= 0x4000000000uLL;
          uint64_t v125 = *v3;
          unint64_t v126 = *(void *)(a2 + v125);
          if (v126 <= 0xFFFFFFFFFFFFFFF7 && v126 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v126);
            *(void *)(a2 + v125) = v126 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 39;
          goto LABEL_652;
        case 0x2Cu:
          a1[99] |= 0x40000000000uLL;
          uint64_t v127 = *v3;
          unint64_t v128 = *(void *)(a2 + v127);
          if (v128 <= 0xFFFFFFFFFFFFFFF7 && v128 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v128);
            *(void *)(a2 + v127) = v128 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 43;
          goto LABEL_652;
        case 0x2Du:
          a1[99] |= 0x8000000000uLL;
          uint64_t v129 = *v3;
          unint64_t v130 = *(void *)(a2 + v129);
          if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v130);
            *(void *)(a2 + v129) = v130 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 40;
          goto LABEL_652;
        case 0x2Eu:
          a1[99] |= 0x10000000000uLL;
          uint64_t v131 = *v3;
          unint64_t v132 = *(void *)(a2 + v131);
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v132);
            *(void *)(a2 + v131) = v132 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 41;
          goto LABEL_652;
        case 0x2Fu:
          a1[99] |= 0x20000000000uLL;
          uint64_t v133 = *v3;
          unint64_t v134 = *(void *)(a2 + v133);
          if (v134 <= 0xFFFFFFFFFFFFFFF7 && v134 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v134);
            *(void *)(a2 + v133) = v134 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 42;
          goto LABEL_652;
        case 0x30u:
          a1[99] |= 0x4000000000000uLL;
          uint64_t v135 = *v3;
          unint64_t v136 = *(void *)(a2 + v135);
          if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v136);
            *(void *)(a2 + v135) = v136 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 51;
          goto LABEL_652;
        case 0x31u:
          a1[99] |= 0x800000000000uLL;
          uint64_t v137 = *v3;
          unint64_t v138 = *(void *)(a2 + v137);
          if (v138 <= 0xFFFFFFFFFFFFFFF7 && v138 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v138);
            *(void *)(a2 + v137) = v138 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 48;
          goto LABEL_652;
        case 0x32u:
          a1[99] |= 0x1000000000000uLL;
          uint64_t v139 = *v3;
          unint64_t v140 = *(void *)(a2 + v139);
          if (v140 <= 0xFFFFFFFFFFFFFFF7 && v140 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v140);
            *(void *)(a2 + v139) = v140 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 49;
          goto LABEL_652;
        case 0x33u:
          a1[99] |= 0x2000000000000uLL;
          uint64_t v141 = *v3;
          unint64_t v142 = *(void *)(a2 + v141);
          if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v142);
            *(void *)(a2 + v141) = v142 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 50;
          goto LABEL_652;
        case 0x34u:
          a1[99] |= 0x100000uLL;
          uint64_t v143 = *v3;
          unint64_t v144 = *(void *)(a2 + v143);
          if (v144 <= 0xFFFFFFFFFFFFFFF7 && v144 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v144);
            *(void *)(a2 + v143) = v144 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 21;
          goto LABEL_652;
        case 0x35u:
          a1[99] |= 0x20000uLL;
          uint64_t v145 = *v3;
          unint64_t v146 = *(void *)(a2 + v145);
          if (v146 <= 0xFFFFFFFFFFFFFFF7 && v146 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v146);
            *(void *)(a2 + v145) = v146 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 18;
          goto LABEL_652;
        case 0x36u:
          a1[99] |= 0x40000uLL;
          uint64_t v147 = *v3;
          unint64_t v148 = *(void *)(a2 + v147);
          if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v148);
            *(void *)(a2 + v147) = v148 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 19;
          goto LABEL_652;
        case 0x37u:
          a1[99] |= 0x80000uLL;
          uint64_t v149 = *v3;
          unint64_t v150 = *(void *)(a2 + v149);
          if (v150 <= 0xFFFFFFFFFFFFFFF7 && v150 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v150);
            *(void *)(a2 + v149) = v150 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 20;
          goto LABEL_652;
        case 0x38u:
          a1[99] |= 0x400000000000uLL;
          uint64_t v151 = *v3;
          unint64_t v152 = *(void *)(a2 + v151);
          if (v152 <= 0xFFFFFFFFFFFFFFF7 && v152 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v152);
            *(void *)(a2 + v151) = v152 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 47;
          goto LABEL_652;
        case 0x39u:
          a1[99] |= 0x80000000000uLL;
          uint64_t v153 = *v3;
          unint64_t v154 = *(void *)(a2 + v153);
          if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v154);
            *(void *)(a2 + v153) = v154 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 44;
          goto LABEL_652;
        case 0x3Au:
          a1[99] |= 0x100000000000uLL;
          uint64_t v155 = *v3;
          unint64_t v156 = *(void *)(a2 + v155);
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v156);
            *(void *)(a2 + v155) = v156 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 45;
          goto LABEL_652;
        case 0x3Bu:
          a1[99] |= 0x200000000000uLL;
          uint64_t v157 = *v3;
          unint64_t v158 = *(void *)(a2 + v157);
          if (v158 <= 0xFFFFFFFFFFFFFFF7 && v158 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v158);
            *(void *)(a2 + v157) = v158 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 46;
          goto LABEL_652;
        case 0x3Cu:
          a1[99] |= 0x100uLL;
          uint64_t v159 = *v3;
          unint64_t v160 = *(void *)(a2 + v159);
          if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v160);
            *(void *)(a2 + v159) = v160 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 9;
          goto LABEL_652;
        case 0x3Du:
          a1[99] |= 0x20uLL;
          uint64_t v161 = *v3;
          unint64_t v162 = *(void *)(a2 + v161);
          if (v162 <= 0xFFFFFFFFFFFFFFF7 && v162 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v162);
            *(void *)(a2 + v161) = v162 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 6;
          goto LABEL_652;
        case 0x3Eu:
          a1[99] |= 0x40uLL;
          uint64_t v163 = *v3;
          unint64_t v164 = *(void *)(a2 + v163);
          if (v164 <= 0xFFFFFFFFFFFFFFF7 && v164 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v164);
            *(void *)(a2 + v163) = v164 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 7;
          goto LABEL_652;
        case 0x3Fu:
          a1[99] |= 0x80uLL;
          uint64_t v165 = *v3;
          unint64_t v166 = *(void *)(a2 + v165);
          if (v166 <= 0xFFFFFFFFFFFFFFF7 && v166 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v166);
            *(void *)(a2 + v165) = v166 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 8;
          goto LABEL_652;
        case 0x40u:
          a1[99] |= 0x10000uLL;
          uint64_t v167 = *v3;
          unint64_t v168 = *(void *)(a2 + v167);
          if (v168 <= 0xFFFFFFFFFFFFFFF7 && v168 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v168);
            *(void *)(a2 + v167) = v168 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 17;
          goto LABEL_652;
        case 0x41u:
          a1[99] |= 0x2000uLL;
          uint64_t v169 = *v3;
          unint64_t v170 = *(void *)(a2 + v169);
          if (v170 <= 0xFFFFFFFFFFFFFFF7 && v170 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v170);
            *(void *)(a2 + v169) = v170 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 14;
          goto LABEL_652;
        case 0x42u:
          a1[99] |= 0x4000uLL;
          uint64_t v171 = *v3;
          unint64_t v172 = *(void *)(a2 + v171);
          if (v172 <= 0xFFFFFFFFFFFFFFF7 && v172 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v172);
            *(void *)(a2 + v171) = v172 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 15;
          goto LABEL_652;
        case 0x43u:
          a1[99] |= 0x8000uLL;
          uint64_t v173 = *v3;
          unint64_t v174 = *(void *)(a2 + v173);
          if (v174 <= 0xFFFFFFFFFFFFFFF7 && v174 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v174);
            *(void *)(a2 + v173) = v174 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 16;
          goto LABEL_652;
        case 0x44u:
          a1[99] |= 0x10uLL;
          uint64_t v175 = *v3;
          unint64_t v176 = *(void *)(a2 + v175);
          if (v176 <= 0xFFFFFFFFFFFFFFF7 && v176 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v176);
            *(void *)(a2 + v175) = v176 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 5;
          goto LABEL_652;
        case 0x45u:
          a1[99] |= 2uLL;
          uint64_t v177 = *v3;
          unint64_t v178 = *(void *)(a2 + v177);
          if (v178 <= 0xFFFFFFFFFFFFFFF7 && v178 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v178);
            *(void *)(a2 + v177) = v178 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 2;
          goto LABEL_652;
        case 0x46u:
          a1[99] |= 4uLL;
          uint64_t v179 = *v3;
          unint64_t v180 = *(void *)(a2 + v179);
          if (v180 <= 0xFFFFFFFFFFFFFFF7 && v180 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v180);
            *(void *)(a2 + v179) = v180 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 3;
          goto LABEL_652;
        case 0x47u:
          a1[99] |= 8uLL;
          uint64_t v181 = *v3;
          unint64_t v182 = *(void *)(a2 + v181);
          if (v182 <= 0xFFFFFFFFFFFFFFF7 && v182 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v182);
            *(void *)(a2 + v181) = v182 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 4;
          goto LABEL_652;
        case 0x48u:
          a1[99] |= 0x1000uLL;
          uint64_t v183 = *v3;
          unint64_t v184 = *(void *)(a2 + v183);
          if (v184 <= 0xFFFFFFFFFFFFFFF7 && v184 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v184);
            *(void *)(a2 + v183) = v184 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 13;
          goto LABEL_652;
        case 0x49u:
          a1[99] |= 0x200uLL;
          uint64_t v185 = *v3;
          unint64_t v186 = *(void *)(a2 + v185);
          if (v186 <= 0xFFFFFFFFFFFFFFF7 && v186 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v186);
            *(void *)(a2 + v185) = v186 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 10;
          goto LABEL_652;
        case 0x4Au:
          a1[99] |= 0x400uLL;
          uint64_t v187 = *v3;
          unint64_t v188 = *(void *)(a2 + v187);
          if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v188);
            *(void *)(a2 + v187) = v188 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 11;
          goto LABEL_652;
        case 0x4Bu:
          a1[99] |= 0x800uLL;
          uint64_t v189 = *v3;
          unint64_t v190 = *(void *)(a2 + v189);
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v190);
            *(void *)(a2 + v189) = v190 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 12;
          goto LABEL_652;
        case 0x4Cu:
          a1[99] |= 0x10000000uLL;
          uint64_t v191 = *v3;
          unint64_t v192 = *(void *)(a2 + v191);
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v192);
            *(void *)(a2 + v191) = v192 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 29;
          goto LABEL_652;
        case 0x4Du:
          a1[99] |= 0x2000000uLL;
          uint64_t v193 = *v3;
          unint64_t v194 = *(void *)(a2 + v193);
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v194);
            *(void *)(a2 + v193) = v194 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 26;
          goto LABEL_652;
        case 0x4Eu:
          a1[99] |= 0x4000000uLL;
          uint64_t v195 = *v3;
          unint64_t v196 = *(void *)(a2 + v195);
          if (v196 <= 0xFFFFFFFFFFFFFFF7 && v196 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v196);
            *(void *)(a2 + v195) = v196 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 27;
          goto LABEL_652;
        case 0x4Fu:
          a1[99] |= 0x8000000uLL;
          uint64_t v197 = *v3;
          unint64_t v198 = *(void *)(a2 + v197);
          if (v198 <= 0xFFFFFFFFFFFFFFF7 && v198 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v198);
            *(void *)(a2 + v197) = v198 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 28;
          goto LABEL_652;
        case 0x50u:
          a1[99] |= 0x1000000000uLL;
          uint64_t v199 = *v3;
          unint64_t v200 = *(void *)(a2 + v199);
          if (v200 <= 0xFFFFFFFFFFFFFFF7 && v200 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v200);
            *(void *)(a2 + v199) = v200 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 37;
          goto LABEL_652;
        case 0x51u:
          a1[99] |= 0x200000000uLL;
          uint64_t v201 = *v3;
          unint64_t v202 = *(void *)(a2 + v201);
          if (v202 <= 0xFFFFFFFFFFFFFFF7 && v202 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v202);
            *(void *)(a2 + v201) = v202 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 34;
          goto LABEL_652;
        case 0x52u:
          a1[99] |= 0x400000000uLL;
          uint64_t v203 = *v3;
          unint64_t v204 = *(void *)(a2 + v203);
          if (v204 <= 0xFFFFFFFFFFFFFFF7 && v204 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v204);
            *(void *)(a2 + v203) = v204 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 35;
          goto LABEL_652;
        case 0x53u:
          a1[99] |= 0x800000000uLL;
          uint64_t v205 = *v3;
          unint64_t v206 = *(void *)(a2 + v205);
          if (v206 <= 0xFFFFFFFFFFFFFFF7 && v206 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v206);
            *(void *)(a2 + v205) = v206 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 36;
          goto LABEL_652;
        case 0x54u:
          a1[99] |= 0x1000000uLL;
          uint64_t v207 = *v3;
          unint64_t v208 = *(void *)(a2 + v207);
          if (v208 <= 0xFFFFFFFFFFFFFFF7 && v208 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v208);
            *(void *)(a2 + v207) = v208 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 25;
          goto LABEL_652;
        case 0x55u:
          a1[99] |= 0x200000uLL;
          uint64_t v209 = *v3;
          unint64_t v210 = *(void *)(a2 + v209);
          if (v210 <= 0xFFFFFFFFFFFFFFF7 && v210 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v210);
            *(void *)(a2 + v209) = v210 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 22;
          goto LABEL_652;
        case 0x56u:
          a1[99] |= 0x400000uLL;
          uint64_t v211 = *v3;
          unint64_t v212 = *(void *)(a2 + v211);
          if (v212 <= 0xFFFFFFFFFFFFFFF7 && v212 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v212);
            *(void *)(a2 + v211) = v212 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 23;
          goto LABEL_652;
        case 0x57u:
          a1[99] |= 0x800000uLL;
          uint64_t v213 = *v3;
          unint64_t v214 = *(void *)(a2 + v213);
          if (v214 <= 0xFFFFFFFFFFFFFFF7 && v214 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v214);
            *(void *)(a2 + v213) = v214 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 24;
          goto LABEL_652;
        case 0x58u:
          a1[99] |= 0x100000000uLL;
          uint64_t v215 = *v3;
          unint64_t v216 = *(void *)(a2 + v215);
          if (v216 <= 0xFFFFFFFFFFFFFFF7 && v216 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v216);
            *(void *)(a2 + v215) = v216 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 33;
          goto LABEL_652;
        case 0x59u:
          a1[99] |= 0x20000000uLL;
          uint64_t v217 = *v3;
          unint64_t v218 = *(void *)(a2 + v217);
          if (v218 <= 0xFFFFFFFFFFFFFFF7 && v218 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v218);
            *(void *)(a2 + v217) = v218 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 30;
          goto LABEL_652;
        case 0x5Au:
          a1[99] |= 0x40000000uLL;
          uint64_t v219 = *v3;
          unint64_t v220 = *(void *)(a2 + v219);
          if (v220 <= 0xFFFFFFFFFFFFFFF7 && v220 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v220);
            *(void *)(a2 + v219) = v220 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 31;
          goto LABEL_652;
        case 0x5Bu:
          a1[99] |= 0x80000000uLL;
          uint64_t v221 = *v3;
          unint64_t v222 = *(void *)(a2 + v221);
          if (v222 <= 0xFFFFFFFFFFFFFFF7 && v222 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v27 = *(void *)(*(void *)(a2 + *v7) + v222);
            *(void *)(a2 + v221) = v222 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v27 = 0;
          }
          uint64_t v292 = 32;
LABEL_652:
          a1[v292] = v27;
          continue;
        case 0x5Cu:
          char v223 = 0;
          unsigned int v224 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x20000000uLL;
          while (2)
          {
            uint64_t v225 = *v3;
            unint64_t v226 = *(void *)(a2 + v225);
            if (v226 == -1 || v226 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v227 = *(unsigned char *)(*(void *)(a2 + *v7) + v226);
              *(void *)(a2 + v225) = v226 + 1;
              v106 |= (unint64_t)(v227 & 0x7F) << v223;
              if (v227 < 0)
              {
                v223 += 7;
                BOOL v14 = v224++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_429;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_429:
          uint64_t v291 = 744;
          goto LABEL_474;
        case 0x5Du:
          uint64_t v228 = PBReaderReadString();
          uint64_t v229 = (void *)a1[98];
          a1[98] = v228;

          continue;
        case 0x5Eu:
          char v230 = 0;
          unsigned int v231 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x10000000uLL;
          while (2)
          {
            uint64_t v232 = *v3;
            unint64_t v233 = *(void *)(a2 + v232);
            if (v233 == -1 || v233 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v234 = *(unsigned char *)(*(void *)(a2 + *v7) + v233);
              *(void *)(a2 + v232) = v233 + 1;
              v106 |= (unint64_t)(v234 & 0x7F) << v230;
              if (v234 < 0)
              {
                v230 += 7;
                BOOL v14 = v231++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_433:
          uint64_t v291 = 740;
          goto LABEL_474;
        case 0x5Fu:
          char v235 = 0;
          unsigned int v236 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x4000000000uLL;
          while (2)
          {
            uint64_t v237 = *v3;
            unint64_t v238 = *(void *)(a2 + v237);
            if (v238 == -1 || v238 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v239 = *(unsigned char *)(*(void *)(a2 + *v7) + v238);
              *(void *)(a2 + v237) = v238 + 1;
              v106 |= (unint64_t)(v239 & 0x7F) << v235;
              if (v239 < 0)
              {
                v235 += 7;
                BOOL v14 = v236++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_437;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_437:
          uint64_t v291 = 780;
          goto LABEL_474;
        case 0x60u:
          char v240 = 0;
          unsigned int v241 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x4000000uLL;
          while (2)
          {
            uint64_t v242 = *v3;
            unint64_t v243 = *(void *)(a2 + v242);
            if (v243 == -1 || v243 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v244 = *(unsigned char *)(*(void *)(a2 + *v7) + v243);
              *(void *)(a2 + v242) = v243 + 1;
              v106 |= (unint64_t)(v244 & 0x7F) << v240;
              if (v244 < 0)
              {
                v240 += 7;
                BOOL v14 = v241++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_441;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_441:
          uint64_t v291 = 732;
          goto LABEL_474;
        case 0x61u:
          char v245 = 0;
          unsigned int v246 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x8000000uLL;
          while (2)
          {
            uint64_t v247 = *v3;
            unint64_t v248 = *(void *)(a2 + v247);
            if (v248 == -1 || v248 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v249 = *(unsigned char *)(*(void *)(a2 + *v7) + v248);
              *(void *)(a2 + v247) = v248 + 1;
              v106 |= (unint64_t)(v249 & 0x7F) << v245;
              if (v249 < 0)
              {
                v245 += 7;
                BOOL v14 = v246++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_445;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_445:
          uint64_t v291 = 736;
          goto LABEL_474;
        case 0x62u:
          char v250 = 0;
          unsigned int v251 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x1000000000uLL;
          while (2)
          {
            uint64_t v252 = *v3;
            unint64_t v253 = *(void *)(a2 + v252);
            if (v253 == -1 || v253 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v254 = *(unsigned char *)(*(void *)(a2 + *v7) + v253);
              *(void *)(a2 + v252) = v253 + 1;
              v106 |= (unint64_t)(v254 & 0x7F) << v250;
              if (v254 < 0)
              {
                v250 += 7;
                BOOL v14 = v251++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_449;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_449:
          uint64_t v291 = 772;
          goto LABEL_474;
        case 0x63u:
          char v255 = 0;
          unsigned int v256 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x2000000000uLL;
          while (2)
          {
            uint64_t v257 = *v3;
            unint64_t v258 = *(void *)(a2 + v257);
            if (v258 == -1 || v258 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v259 = *(unsigned char *)(*(void *)(a2 + *v7) + v258);
              *(void *)(a2 + v257) = v258 + 1;
              v106 |= (unint64_t)(v259 & 0x7F) << v255;
              if (v259 < 0)
              {
                v255 += 7;
                BOOL v14 = v256++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_453;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_453:
          uint64_t v291 = 776;
          goto LABEL_474;
        case 0x64u:
          char v260 = 0;
          unsigned int v261 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x80000000uLL;
          while (2)
          {
            uint64_t v262 = *v3;
            unint64_t v263 = *(void *)(a2 + v262);
            if (v263 == -1 || v263 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v264 = *(unsigned char *)(*(void *)(a2 + *v7) + v263);
              *(void *)(a2 + v262) = v263 + 1;
              v106 |= (unint64_t)(v264 & 0x7F) << v260;
              if (v264 < 0)
              {
                v260 += 7;
                BOOL v14 = v261++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_457;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_457:
          uint64_t v291 = 752;
          goto LABEL_474;
        case 0x65u:
          char v265 = 0;
          unsigned int v266 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x100000000uLL;
          while (2)
          {
            uint64_t v267 = *v3;
            unint64_t v268 = *(void *)(a2 + v267);
            if (v268 == -1 || v268 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v269 = *(unsigned char *)(*(void *)(a2 + *v7) + v268);
              *(void *)(a2 + v267) = v268 + 1;
              v106 |= (unint64_t)(v269 & 0x7F) << v265;
              if (v269 < 0)
              {
                v265 += 7;
                BOOL v14 = v266++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_461;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_461:
          uint64_t v291 = 756;
          goto LABEL_474;
        case 0x66u:
          char v270 = 0;
          unsigned int v271 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x400000000uLL;
          while (2)
          {
            uint64_t v272 = *v3;
            unint64_t v273 = *(void *)(a2 + v272);
            if (v273 == -1 || v273 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v274 = *(unsigned char *)(*(void *)(a2 + *v7) + v273);
              *(void *)(a2 + v272) = v273 + 1;
              v106 |= (unint64_t)(v274 & 0x7F) << v270;
              if (v274 < 0)
              {
                v270 += 7;
                BOOL v14 = v271++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_465;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_465:
          uint64_t v291 = 764;
          goto LABEL_474;
        case 0x67u:
          char v275 = 0;
          unsigned int v276 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x800000000uLL;
          while (2)
          {
            uint64_t v277 = *v3;
            unint64_t v278 = *(void *)(a2 + v277);
            if (v278 == -1 || v278 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v279 = *(unsigned char *)(*(void *)(a2 + *v7) + v278);
              *(void *)(a2 + v277) = v278 + 1;
              v106 |= (unint64_t)(v279 & 0x7F) << v275;
              if (v279 < 0)
              {
                v275 += 7;
                BOOL v14 = v276++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_469;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_469:
          uint64_t v291 = 768;
          goto LABEL_474;
        case 0x68u:
          char v280 = 0;
          unsigned int v281 = 0;
          uint64_t v106 = 0;
          a1[100] |= 0x200000000uLL;
          while (2)
          {
            uint64_t v282 = *v3;
            unint64_t v283 = *(void *)(a2 + v282);
            if (v283 == -1 || v283 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v284 = *(unsigned char *)(*(void *)(a2 + *v7) + v283);
              *(void *)(a2 + v282) = v283 + 1;
              v106 |= (unint64_t)(v284 & 0x7F) << v280;
              if (v284 < 0)
              {
                v280 += 7;
                BOOL v14 = v281++ >= 9;
                if (v14)
                {
                  LODWORD(v106) = 0;
                  goto LABEL_473;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v106) = 0;
          }
LABEL_473:
          uint64_t v291 = 760;
LABEL_474:
          *(_DWORD *)((char *)a1 + v291) = v106;
          continue;
        case 0x69u:
          char v285 = 0;
          unsigned int v286 = 0;
          uint64_t v19 = 0;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v287 = *v3;
        unint64_t v288 = *(void *)(a2 + v287);
        if (v288 == -1 || v288 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v289 = *(unsigned char *)(*(void *)(a2 + *v7) + v288);
        *(void *)(a2 + v287) = v288 + 1;
        v19 |= (unint64_t)(v289 & 0x7F) << v285;
        if ((v289 & 0x80) == 0) {
          goto LABEL_476;
        }
        v285 += 7;
        BOOL v14 = v286++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_478;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_476:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_478:
      uint64_t v290 = 73;
LABEL_479:
      a1[v290] = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t VisionSignalGradingVisionGradeReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          unsigned int v18 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v17;

          continue;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 40) |= 0x20u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_70:
          BOOL v56 = v22 != 0;
          uint64_t v57 = 39;
          goto LABEL_87;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v2_Block_object_dispose(&STACK[0x320], 8) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v2_Block_object_dispose(&STACK[0x320], 8) = 0;
          }
LABEL_74:
          uint64_t v58 = 32;
          goto LABEL_92;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_78:
          BOOL v56 = v34 != 0;
          uint64_t v57 = 36;
          goto LABEL_87;
        case 5u:
          uint64_t v38 = PBReaderReadString();
          if (v38) {
            [(id)a1 addExtractedSignals:v38];
          }

          continue;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)(a1 + 40) |= 0x10u;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  uint64_t v41 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v41 = 0;
          }
LABEL_82:
          BOOL v56 = v41 != 0;
          uint64_t v57 = 38;
          goto LABEL_87;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v4_Block_object_dispose(&STACK[0x320], 8) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  uint64_t v47 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v47 = 0;
          }
LABEL_86:
          BOOL v56 = v47 != 0;
          uint64_t v57 = 37;
LABEL_87:
          *(unsigned char *)(a1 + v57) = v56;
          continue;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
        *(void *)(a2 + v53) = v54 + 1;
        v28 |= (unint64_t)(v55 & 0x7F) << v51;
        if ((v55 & 0x80) == 0) {
          goto LABEL_89;
        }
        v51 += 7;
        BOOL v14 = v52++ >= 9;
        if (v14)
        {
          LODWORD(v2_Block_object_dispose(&STACK[0x320], 8) = 0;
          goto LABEL_91;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_89:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v2_Block_object_dispose(&STACK[0x320], 8) = 0;
      }
LABEL_91:
      uint64_t v58 = 8;
LABEL_92:
      *(_DWORD *)(a1 + v5_Block_object_dispose(&STACK[0x320], 8) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL VisionSignalGradingVisionGradeEventReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(VisionSignalGradingVisionGrade);
        [a1 addVisionGrades:v17];
        if (!PBReaderPlaceMark() || (VisionSignalGradingVisionGradeReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(VisionSignalGradingEntry);
    [a1 addPopularityEntries:v17];
    if (!PBReaderPlaceMark() || (VisionSignalGradingEntryReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _DKPRMetadataEntryReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v22;
      }
      else if (v17 == 2)
      {
        char v26 = objc_alloc_init(_DKPRValue);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (_DKPRValueReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE3AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE3B4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_18EE3BD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18EE3C5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18EE3CE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EE3D1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18EE3DAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EE3DED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18EE3E1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE3E688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EE3EA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t FTCPPETInteractionReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unint64_t v17 = objc_alloc_init(FTCPPETParticipant);
          [(id)a1 addParticipants:v17];
          if PBReaderPlaceMark() && (FTCPPETParticipantReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_42;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              uint64_t v21 = 0;
              goto LABEL_44;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_44:
          *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v21;
          continue;
        case 3u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 24;
          goto LABEL_40;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          break;
        case 5u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 16;
LABEL_40:
          unsigned int v33 = *(void **)(a1 + v26);
          *(void *)(a1 + v26) = v25;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_46;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v29 = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v29 = 0;
      }
LABEL_48:
      *(unsigned char *)(a1 + 40) = v29 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE3FE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EE40240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_18EE40E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

void sub_18EE4101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _CDCollectDonationMetricsForEventsInDomain(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  int v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.coreduet.spotlightreceiver", v4];
  uint64_t v6 = [v3 count];
  uint64_t v7 = [NSString stringWithFormat:@"%@.donations", v5];
  +[_CDDiagnosticDataReporter addValue:v6 forScalarKey:v7];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        if ([v4 isEqualToString:@"relevantShortcuts"])
        {
          char v13 = [v12 metadata];
          BOOL v14 = _DKRelevantShortcutMetadataKey;
LABEL_10:
          int v15 = [(__objc2_class *)v14 serializedKeyImage];
          uint64_t v16 = [v13 objectForKeyedSubscript:v15];

          goto LABEL_12;
        }
        if ([v4 isEqualToString:@"intents"])
        {
          char v13 = [v12 metadata];
          BOOL v14 = _DKIntentMetadataKey;
          goto LABEL_10;
        }
        uint64_t v16 = 0;
LABEL_12:
        if (v16) {
          double v17 = 1.0;
        }
        else {
          double v17 = 0.0;
        }
        uint64_t v18 = [NSString stringWithFormat:@"%@.donationHasImage", v5];
        +[_CDDiagnosticDataReporter pushValue:v18 forDistributionKey:v17];

        if (v16)
        {
          double v19 = (double)(unint64_t)[v16 length];
          unsigned int v20 = [NSString stringWithFormat:@"%@.averageImageBytes", v5];
          +[_CDDiagnosticDataReporter pushValue:v20 forDistributionKey:v19];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

void sub_18EE45F9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_18EE46930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_18EE483B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CDNormalizeString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B88];
  id v2 = a1;
  id v3 = [v1 alphanumericCharacterSet];
  id v4 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  return v4;
}

void sub_18EE4A2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EE4AA78(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf, int a18, __int16 a19, __int16 a20,const char *a21,long long a22)
{
  if (a2 == 1)
  {
    id v22 = objc_begin_catch(a1);
    long long v23 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      long long v24 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        uint64_t v26 = [v22 callStackSymbols];
      }
      else
      {
        uint64_t v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v22;
      a20 = 2082;
      a21 = "-[_DKSyncRapportCommonStorage handleDeviceFound:]";
      LOWORD(a22) = 2114;
      *(void *)((char *)&a22 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    objc_end_catch();
    JUMPOUT(0x18EE4A578);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4B4AC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long buf,int a22,__int16 a23,__int16 a24,const char *a25,long long a26)
{
  if (a2 == 1)
  {
    id v26 = objc_begin_catch(a1);
    uint64_t v27 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      unsigned int v28 = [(id)objc_opt_class() description];
      char v29 = objc_opt_respondsToSelector();
      if (v29)
      {
        uint64_t v30 = [v26 callStackSymbols];
      }
      else
      {
        uint64_t v30 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v26;
      a24 = 2082;
      a25 = "-[_DKSyncRapportCommonStorage handleDeviceChanged:changes:]";
      LOWORD(a26) = 2114;
      *(void *)((char *)&a26 + 2) = v30;
      _os_log_fault_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v29) {
    }
      }
    objc_end_catch();
    JUMPOUT(0x18EE4AFD4);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4BAD0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf, int a18, __int16 a19, __int16 a20,const char *a21,long long a22)
{
  if (a2 == 1)
  {
    id v22 = objc_begin_catch(a1);
    long long v23 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      long long v24 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        id v26 = [v22 callStackSymbols];
      }
      else
      {
        id v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v22;
      a20 = 2082;
      a21 = "-[_DKSyncRapportCommonStorage handleDeviceLost:]";
      LOWORD(a22) = 2114;
      *(void *)((char *)&a22 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    objc_end_catch();
    JUMPOUT(0x18EE4B848);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4BFE4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v21 = objc_begin_catch(a1);
    id v22 = [*(id *)(v20 + 2288) syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      long long v23 = [(id)objc_opt_class() description];
      char v24 = objc_opt_respondsToSelector();
      if (v24)
      {
        char v25 = [v21 callStackSymbols];
      }
      else
      {
        char v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportCommonStorage handleActivateWithError:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v24) {
    }
      }
    objc_end_catch();
    JUMPOUT(0x18EE4BF1CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4C5DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,long long buf,int a28,__int16 a29,__int16 a30,const char *a31,long long a32)
{
  if (a2 == 1)
  {
    id v34 = objc_begin_catch(a1);
    uint64_t v35 = [*(id *)(v32 + 2288) syncChannel];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      unint64_t v36 = [(id)objc_opt_class() description];
      char v37 = objc_opt_respondsToSelector();
      if (v37)
      {
        uint64_t v38 = [v34 callStackSymbols];
      }
      else
      {
        uint64_t v38 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v36;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v34;
      a30 = 2082;
      a31 = "-[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:]";
      LOWORD(a32) = 2114;
      *(void *)((char *)&a32 + 2) = v38;
      _os_log_fault_impl(&dword_18ECEB000, v35, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v37) {
    }
      }
    [v33 transformCaughtObject:v34 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE4C438);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4CA8C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, const char *a15, long long a16)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    double v19 = [*(id *)(v16 + 2288) syncChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [(id)objc_opt_class() description];
      char v21 = objc_opt_respondsToSelector();
      if (v21)
      {
        id v22 = [v18 callStackSymbols];
      }
      else
      {
        id v22 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v18;
      a14 = 2082;
      a15 = "-[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:]";
      LOWORD(a16) = 2114;
      *(void *)((char *)&a16 + 2) = v22;
      _os_log_fault_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v21) {
    }
      }
    [v17 transformCaughtObject:v18 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE4C9D0);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4E06C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v21 = objc_begin_catch(a1);
    id v22 = [*(id *)(v20 + 2288) syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      long long v23 = [(id)objc_opt_class() description];
      char v24 = objc_opt_respondsToSelector();
      if (v24)
      {
        char v25 = [v21 callStackSymbols];
      }
      else
      {
        char v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportCommonStorage handleActivateCompanionLinkClient:forPeer:error:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v24) {
    }
      }
    objc_end_catch();
    JUMPOUT(0x18EE4DDACLL);
  }
  _Unwind_Resume(a1);
}

void sub_18EE4EFD4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long buf, int a20,__int16 a21,__int16 a22,const char *a23,long long a24)
{
  if (a2 == 1)
  {
    id v26 = objc_begin_catch(a1);
    uint64_t v27 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      unsigned int v28 = [(id)objc_opt_class() description];
      v30[0] = objc_opt_respondsToSelector();
      if (v30[0])
      {
        char v29 = [v26 callStackSymbols];
      }
      else
      {
        char v29 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v26;
      a22 = 2082;
      a23 = "-[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a24) = 2114;
      *(void *)((char *)&a24 + 2) = v29;
      _os_log_fault_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v30[0]) {
    }
      }
    [v25 transformCaughtObject:v26 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v24) {
      JUMPOUT(0x18EE4ED04);
    }
    JUMPOUT(0x18EE4ECCCLL);
  }
  _Unwind_Resume(a1);
}

void sub_18EE51520(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a2 == 1)
  {
    id v70 = objc_begin_catch(a1);
    unint64_t v71 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      uint64_t v72 = [(id)objc_opt_class() description];
      char v73 = objc_opt_respondsToSelector();
      if (v73)
      {
        uint64_t v74 = [v70 callStackSymbols];
      }
      else
      {
        uint64_t v74 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v72;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v70;
      a68 = 2082;
      a69 = "-[_DKSyncRapportKnowledgeStorage handleFetchEventsWithRequest:options:responseHandler:]";
      LOWORD(a70) = 2114;
      *(void *)((char *)&a70 + 2) = v74;
      _os_log_fault_impl(&dword_18ECEB000, v71, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v73) {
    }
      }
    [a43 transformCaughtObject:v70 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE51234);
  }
  _Unwind_Resume(a1);
}

void sub_18EE52358(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46)
{
  if (a2 == 1)
  {
    id v46 = objc_begin_catch(a1);
    uint64_t v47 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      uint64_t v48 = [(id)objc_opt_class() description];
      char v49 = objc_opt_respondsToSelector();
      if (v49)
      {
        char v50 = [v46 callStackSymbols];
      }
      else
      {
        char v50 = 0;
      }
      LODWORD(STACK[0x220]) = 138544130;
      STACK[0x224] = (unint64_t)v48;
      LOWORD(STACK[0x22C]) = 2114;
      STACK[0x22E] = (unint64_t)v46;
      LOWORD(STACK[0x236]) = 2082;
      STACK[0x238] = (unint64_t)"-[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithRequest:options:responseHandler:]";
      LOWORD(STACK[0x240]) = 2114;
      STACK[0x242] = (unint64_t)v50;
      _os_log_fault_impl(&dword_18ECEB000, v47, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&STACK[0x220], 0x2Au);
      if (v49) {
    }
      }
    [a46 transformCaughtObject:v46 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE5226CLL);
  }
  _Unwind_Resume(a1);
}

void sub_18EE53C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23)
{
  if (a2 == 1)
  {
    id v24 = objc_begin_catch(exception_object);
    char v25 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      id v26 = [(id)objc_opt_class() description];
      char v27 = objc_opt_respondsToSelector();
      if (v27)
      {
        unsigned int v28 = [v24 callStackSymbols];
      }
      else
      {
        unsigned int v28 = 0;
      }
      *(_DWORD *)(v23 - 20_Block_object_dispose(&STACK[0x320], 8) = 138544130;
      uint64_t v29 = v23 - 208;
      *(void *)(v29 + 4) = v26;
      *(_WORD *)(v23 - 196) = 2114;
      *(void *)(v29 + 14) = v24;
      *(_WORD *)(v23 - 186) = 2082;
      *(void *)(v23 - 184) = "-[_DKSyncRapportKnowledgeStorage handleFetchEventsWithResponse:options:error:peer:plStart"
                               "Date:completion:]";
      *(_WORD *)(v23 - 176) = 2114;
      *(void *)(v29 + 34) = v28;
      _os_log_fault_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)(v23 - 208), 0x2Au);
      if (v27) {
    }
      }
    [a20 transformCaughtObject:v24 existingError:a21];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE53A48);
  }
  _Unwind_Resume(exception_object);
}

void sub_18EE555D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  char v44 = v36;
  if (a2 == 1)
  {
    id v38 = objc_begin_catch(exception_object);
    char v39 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      unsigned int v40 = [(id)objc_opt_class() description];
      char v41 = objc_opt_respondsToSelector();
      if (v41)
      {
        uint64_t v42 = [v38 callStackSymbols];
      }
      else
      {
        uint64_t v42 = 0;
      }
      *(_DWORD *)(v37 - 192) = 138544130;
      uint64_t v43 = v37 - 192;
      *(void *)(v43 + 4) = v40;
      *(_WORD *)(v37 - 180) = 2114;
      *(void *)(v43 + 14) = v38;
      *(_WORD *)(v37 - 170) = 2082;
      *(void *)(v37 - 16_Block_object_dispose(&STACK[0x320], 8) = "-[_DKSyncRapportKnowledgeStorage handleFetchDeletedEventIDsWithResponse:options:error:pee"
                               "r:plStartDate:completion:]";
      *(_WORD *)(v37 - 160) = 2114;
      *(void *)(v43 + 34) = v42;
      _os_log_fault_impl(&dword_18ECEB000, v39, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)(v37 - 192), 0x2Au);
      if (v41) {
    }
      }
    [a26 transformCaughtObject:v38 existingError:v44];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE55404);
  }
  _Unwind_Resume(exception_object);
}

void sub_18EE5608C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf, int a14, __int16 a15, __int16 a16, const char *a17, long long a18)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    id v21 = [*(id *)(v18 + 2288) syncChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      id v22 = [(id)objc_opt_class() description];
      char v23 = objc_opt_respondsToSelector();
      if (v23)
      {
        id v24 = [v20 callStackSymbols];
      }
      else
      {
        id v24 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v22;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v20;
      a16 = 2082;
      a17 = "-[_DKSyncRapportContextStorage handleFetchContextValuesWithRequest:options:responseHandler:]";
      LOWORD(a1_Block_object_dispose(&STACK[0x320], 8) = 2114;
      *(void *)((char *)&a18 + 2) = v24;
      _os_log_fault_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v23) {
    }
      }
    [v19 transformCaughtObject:v20 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE55FC4);
  }
  _Unwind_Resume(a1);
}

void sub_18EE56830(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v21 = objc_begin_catch(a1);
    id v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      char v23 = [(id)objc_opt_class() description];
      char v24 = objc_opt_respondsToSelector();
      if (v24)
      {
        char v25 = [v21 callStackSymbols];
      }
      else
      {
        char v25 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v21;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSendContextValuesWithRequest:options:responseHandler:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v25;
      _os_log_fault_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v24) {
    }
      }
    [v20 transformCaughtObject:v21 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE566D0);
  }
  _Unwind_Resume(a1);
}

void sub_18EE57058(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long buf,int a26,__int16 a27,__int16 a28,const char *a29,long long a30)
{
  if (a2 == 1)
  {
    id v31 = objc_begin_catch(a1);
    uint64_t v32 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      unsigned int v33 = [(id)objc_opt_class() description];
      char v34 = objc_opt_respondsToSelector();
      if (v34)
      {
        uint64_t v35 = [v31 callStackSymbols];
      }
      else
      {
        uint64_t v35 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v33;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v31;
      a28 = 2082;
      a29 = "-[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]";
      LOWORD(a30) = 2114;
      *(void *)((char *)&a30 + 2) = v35;
      _os_log_fault_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v34) {
    }
      }
    [v30 transformCaughtObject:v31 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE56E04);
  }
  _Unwind_Resume(a1);
}

void sub_18EE5787C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long buf,int a26,__int16 a27,__int16 a28,const char *a29,long long a30)
{
  if (a2 == 1)
  {
    id v31 = objc_begin_catch(a1);
    uint64_t v32 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      unsigned int v33 = [(id)objc_opt_class() description];
      char v34 = objc_opt_respondsToSelector();
      if (v34)
      {
        uint64_t v35 = [v31 callStackSymbols];
      }
      else
      {
        uint64_t v35 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v33;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v31;
      a28 = 2082;
      a29 = "-[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithRequest:options:responseHandler:]";
      LOWORD(a30) = 2114;
      *(void *)((char *)&a30 + 2) = v35;
      _os_log_fault_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v34) {
    }
      }
    [v30 transformCaughtObject:v31 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x18EE57628);
  }
  _Unwind_Resume(a1);
}

void sub_18EE58250(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v22 = objc_begin_catch(a1);
    char v23 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      char v24 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        id v26 = [v22 callStackSymbols];
      }
      else
      {
        id v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v24;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v22;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleFetchContextValuesWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    [v21 transformCaughtObject:v22 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20) {
      JUMPOUT(0x18EE580D4);
    }
    JUMPOUT(0x18EE580A4);
  }
  _Unwind_Resume(a1);
}

void sub_18EE58BBC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v23 = objc_begin_catch(a1);
    char v24 = [*(id *)(v22 + 2288) syncChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      char v27 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        id v26 = [v23 callStackSymbols];
      }
      else
      {
        id v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSendContextValuesWithResponse:options:error:peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    [v21 transformCaughtObject:v23 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20) {
      JUMPOUT(0x18EE58A34);
    }
    JUMPOUT(0x18EE58A08);
  }
  _Unwind_Resume(a1);
}

void sub_18EE59528(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v23 = objc_begin_catch(a1);
    char v24 = [*(id *)(v22 + 2288) syncChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      char v27 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        id v26 = [v23 callStackSymbols];
      }
      else
      {
        id v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleSubscribeToContextValueChangeNotificationsWithResponse:options:error:pe"
            "er:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    [v21 transformCaughtObject:v23 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20) {
      JUMPOUT(0x18EE593A0);
    }
    JUMPOUT(0x18EE59374);
  }
  _Unwind_Resume(a1);
}

void sub_18EE59E94(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, const char *a19, long long a20)
{
  if (a2 == 1)
  {
    id v23 = objc_begin_catch(a1);
    char v24 = [*(id *)(v22 + 2288) syncChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      char v27 = [(id)objc_opt_class() description];
      char v25 = objc_opt_respondsToSelector();
      if (v25)
      {
        id v26 = [v23 callStackSymbols];
      }
      else
      {
        id v26 = 0;
      }
      LODWORD(buf) = 138544130;
      *(void *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v23;
      a18 = 2082;
      a19 = "-[_DKSyncRapportContextStorage handleUnsubscribeToContextValueChangeNotificationsWithResponse:options:error:"
            "peer:plStartDate:completion:]";
      LOWORD(a20) = 2114;
      *(void *)((char *)&a20 + 2) = v26;
      _os_log_fault_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Caught %{public}@ in %{public}s thrown at %{public}@", (uint8_t *)&buf, 0x2Au);
      if (v25) {
    }
      }
    [v21 transformCaughtObject:v23 existingError:0];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v20) {
      JUMPOUT(0x18EE59D0CLL);
    }
    JUMPOUT(0x18EE59CE0);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_11(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_11_5(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return [v0 me];
}

void OUTLINED_FUNCTION_19_2(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x2Au);
}

void sub_18EE5B7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t _CDSizeMetricInitialize()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_CDSizeMetricFamilies;
  _CDSizeMetricFamilies = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.coreduet.sizemetric", 0);
  uint64_t v3 = _CDSizeMetricQueue;
  _CDSizeMetricQueue = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void CDSizeMetricAddSize(uint64_t a1, unsigned int a2)
{
  if (a1) {
    -[_CDMutableSizeMetric addBytes:](a1, a2);
  }
}

BOOL InteractionAnalysisPETInteractionEventsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(InteractionAnalysisPETInteractionEvent **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(&STACK[0x320], 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(InteractionAnalysisPETInteractionEvent);
    -[InteractionAnalysisPETInteractionEvents addInteractionEvent:](a1, v18);
    if (!PBReaderPlaceMark()
      || (InteractionAnalysisPETInteractionEventReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_18EE5F608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE60390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE604DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE60708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE6094C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE60B38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE60DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE60F64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61514(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18EE617CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61AB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE61C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE6233C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE623D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE63174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id obj)
{
}

void sub_18EE6380C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18EE639B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void findAutoSuPlanByProbability_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Illegal probabilities[]", v2, v3, v4, v5, v6);
}

void findAutoSuPlanByProbability_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Unable to find bestSuStart or bestSuEnd with corresponding prob above desired threshold", v2, v3, v4, v5, v6);
}

void findAutoSuPlanByProbability_cold_3(int *a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Interval too short, bestSuStart=%d, bestSuEnd=%d", (uint8_t *)v5, 0xEu);
}

void __active_memory_limit_block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "active memory limit: %dMB", (uint8_t *)v3, 8u);
}

void __active_memory_limit_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "failed to get memory limit properties", v1, 2u);
}

void sleepPredictionWithParams2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Sleep Prediction: Insufficient data: after removing all the leading continuous full days, the number of remaining full days < 3\n", v1, 2u);
}

void sleepPredictionWithParams2_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Sleep Prediction: %d probabilities given by sleep prediction algo. v2 (sleep: 0; wake: 1)",
    (uint8_t *)v2,
    8u);
}

void sleepPredictionWithParams2_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Sleep Prediction: number of days in consideration = %d\n", (uint8_t *)v2, 8u);
}

#error "18EE69CB8: call analysis failed (funcsize=42)"

#error "18EE69D6C: call analysis failed (funcsize=42)"

#error "18EE69E20: call analysis failed (funcsize=42)"

#error "18EE69ED4: call analysis failed (funcsize=42)"

#error "18EE69F88: call analysis failed (funcsize=42)"

#error "18EE6A03C: call analysis failed (funcsize=42)"

#error "18EE6A0F0: call analysis failed (funcsize=42)"

#error "18EE6A1A4: call analysis failed (funcsize=42)"

#error "18EE6A258: call analysis failed (funcsize=42)"

#error "18EE6A30C: call analysis failed (funcsize=42)"

#error "18EE6A3C0: call analysis failed (funcsize=42)"

#error "18EE6A474: call analysis failed (funcsize=42)"

#error "18EE6A528: call analysis failed (funcsize=42)"

#error "18EE6A5DC: call analysis failed (funcsize=42)"

#error "18EE6A690: call analysis failed (funcsize=42)"

#error "18EE6A744: call analysis failed (funcsize=42)"

void resolve_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Contact Resolution: Error fetching contacts from Contact Store = %@", (uint8_t *)&v2, 0xCu);
}

#error "18EE6BDF4: call analysis failed (funcsize=43)"

#error "18EE6C448: call analysis failed (funcsize=43)"

#error "18EE6D7B8: call analysis failed (funcsize=54)"

#error "18EE6D8B8: call analysis failed (funcsize=64)"

#error "18EE6D9C8: call analysis failed (funcsize=63)"

void __dataCollectionIsEnabled_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __dataCollectionIsEnabled_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __dataCollectionIsEnabled_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

#error "18EE6FB44: call analysis failed (funcsize=75)"

#error "18EE6FC8C: call analysis failed (funcsize=75)"

#error "18EE6FDD4: call analysis failed (funcsize=75)"

void _DKSync3PolicyDuplicateNSStringPropertyValue_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(v1, v2), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_10_1(), "objectForKeyedSubscript:");
  id v4 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_7_3(&dword_18ECEB000, v5, v6, "Not setting %@ because %@ is a %@ instead of a %@", v7, v8, v9, v10, v11);
}

void _DKSync3PolicyDoesContainRequiredProperties_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_18ECEB000, log, OS_LOG_TYPE_FAULT, "Policy %@ is missing key %@", (uint8_t *)&v3, 0x16u);
}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = v1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_class();
  id v4 = v3;
  objc_opt_class();
  int v7 = 138413058;
  uint64_t v8 = v2;
  OUTLINED_FUNCTION_13_1();
  __int16 v9 = v5;
  uint64_t v10 = v3;
  __int16 v11 = v5;
  uint64_t v12 = v6;
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Not setting %@ because %@ is a %@ instead of a %@", (uint8_t *)&v7, 0x2Au);
}

void _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue_cold_2()
{
  OUTLINED_FUNCTION_12_0();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(v1, v2), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_10_1(), "objectForKeyedSubscript:");
  id v4 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_7_3(&dword_18ECEB000, v5, v6, "Not setting %@ because %@ is a %@ instead of a %@", v7, v8, v9, v10, v11);
}

void _DKSync3PolicyDuplicateNSNumberPropertyValue_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(v1, v2), "objectForKeyedSubscript:");
  objc_claimAutoreleasedReturnValue();
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_10_1(), "objectForKeyedSubscript:");
  id v4 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_7_3(&dword_18ECEB000, v5, v6, "Not setting %@ because %@ is a %@ instead of a %@", v7, v8, v9, v10, v11);
}

#error "18EE74928: call analysis failed (funcsize=72)"

#error "18EE74A64: call analysis failed (funcsize=72)"

#error "18EE74BA0: call analysis failed (funcsize=72)"

#error "18EE74CDC: call analysis failed (funcsize=72)"

#error "18EE75120: call analysis failed (funcsize=72)"

uint64_t getCNContactBirthdayKey_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](v0);
}

void ___logChannel_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t for _CDReceiverNotifier", v0, 2u);
}

#error "18EE78C14: call analysis failed (funcsize=74)"

#error "18EE78D58: call analysis failed (funcsize=74)"

#error "18EE790A8: call analysis failed (funcsize=81)"

#error "18EE79208: call analysis failed (funcsize=81)"

#error "18EE79350: call analysis failed (funcsize=74)"

#error "18EE79500: call analysis failed (funcsize=102)"

#error "18EE79CD8: call analysis failed (funcsize=72)"

#error "18EE79E0C: call analysis failed (funcsize=72)"

#error "18EE7A2C4: call analysis failed (funcsize=72)"

#error "18EE7A6A0: call analysis failed (funcsize=82)"

void _clientNeedsHelpCallback_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v0, v1, "Unable to handle help callback for %@ (%@)");
}

void _clientNeedsHelpCallback_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "Got unexpected observer in client help callback %@.", v2, v3, v4, v5, v6);
}

void _clientNeedsHelpCallback_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Client needs help: %@", v2, v3, v4, v5, v6);
}

#error "18EE7C6D4: call analysis failed (funcsize=75)"

#error "18EE7C98C: call analysis failed (funcsize=75)"

#error "18EE7CAD4: call analysis failed (funcsize=75)"

#error "18EE7CD34: call analysis failed (funcsize=91)"

#error "18EE7CE70: call analysis failed (funcsize=73)"

#error "18EE7CFD0: call analysis failed (funcsize=82)"

#error "18EE7D134: call analysis failed (funcsize=82)"

#error "18EE7D2B8: call analysis failed (funcsize=89)"

#error "18EE7D918: call analysis failed (funcsize=73)"

void _CDClientStateFromEventIndexerBookmark_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "[Spotlight Indexer] Error archiving updated bookmark: %@", v2, v3, v4, v5, v6);
}

void __recordInteractionsAsync_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromRange(*(NSRange *)(a1 + 64));
  uint64_t v5 = [*(id *)(a1 + 40) count];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "[async path] got !ok from daemon for chunk %{public}@ in %tu interactions", (uint8_t *)&v6, 0x16u);
}

#error "18EE825B0: call analysis failed (funcsize=61)"

#error "18EE826B8: call analysis failed (funcsize=61)"

#error "18EE827C0: call analysis failed (funcsize=61)"

#error "18EE82BD4: call analysis failed (funcsize=61)"

#error "18EE82CDC: call analysis failed (funcsize=61)"

#error "18EE82F9C: call analysis failed (funcsize=61)"

#error "18EE830A4: call analysis failed (funcsize=61)"

#error "18EE84514: call analysis failed (funcsize=61)"

#error "18EE8461C: call analysis failed (funcsize=61)"

#error "18EE84724: call analysis failed (funcsize=61)"

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1F4113888]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
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

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t CRIsAppleInternal()
{
  return MEMORY[0x1F4116E50]();
}

uint64_t INExtractKeyImage()
{
  return MEMORY[0x1F40E9AB0]();
}

uint64_t INInsertKeyImageExtraction()
{
  return MEMORY[0x1F40E9AC8]();
}

uint64_t INTrimToKeyImage()
{
  return MEMORY[0x1F40E9BA0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x1F40E90E8]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1F40E9110]();
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return (CFStringRef)MEMORY[0x1F40E9120](snapshot);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1F4116E70]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1F4116EA8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D88]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CDDComplicationChangeNotificationString()
{
  return MEMORY[0x1F4113B80]();
}

uint64_t _CDDComplicationChangeOverCloudNotificationString()
{
  return MEMORY[0x1F4113B88]();
}

uint64_t _CDDCurrentActiveComplications()
{
  return MEMORY[0x1F4113B90]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1F417DFF0]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1F417DFF8]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x1F417E030]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1F417E048]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x1F417E050]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1F417E078]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1F417E1C0]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1F417E1D0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1F417E1D8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1F417E218]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1F417E230]();
}

uint64_t archive_write_set_format_pax_restricted()
{
  return MEMORY[0x1F417E250]();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1F40CD8D0]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1F40CD8D8]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x1F40CD8E0]();
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1F40CDD98]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1F40CDDA8]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x1F40CDDB0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vrsum(const float *__A, vDSP_Stride __IA, const float *__S, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1F40CE9B0]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1F40CF048]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1F40CF060]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1F40CF068]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x1F40CF080]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1F40CF090]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1F40CF0A8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}