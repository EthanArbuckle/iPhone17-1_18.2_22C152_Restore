@interface CSAutocompleteContactsWrapper
+ (Class)CNAutocompleteFetchRequestClass;
+ (Class)CNAutocompleteStoreClass;
@end

@implementation CSAutocompleteContactsWrapper

+ (Class)CNAutocompleteFetchRequestClass
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)getCNAutocompleteFetchRequestClass_softClass;
  uint64_t v8 = getCNAutocompleteFetchRequestClass_softClass;
  if (!getCNAutocompleteFetchRequestClass_softClass)
  {
    ContactsAutocompleteLibraryCore();
    v6[3] = (uint64_t)objc_getClass("CNAutocompleteFetchRequest");
    getCNAutocompleteFetchRequestClass_softClass = v6[3];
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);

  return (Class)v3;
}

+ (Class)CNAutocompleteStoreClass
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)getCNAutocompleteStoreClass_softClass;
  uint64_t v8 = getCNAutocompleteStoreClass_softClass;
  if (!getCNAutocompleteStoreClass_softClass)
  {
    ContactsAutocompleteLibraryCore();
    v6[3] = (uint64_t)objc_getClass("CNAutocompleteStore");
    getCNAutocompleteStoreClass_softClass = v6[3];
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);

  return (Class)v3;
}

@end