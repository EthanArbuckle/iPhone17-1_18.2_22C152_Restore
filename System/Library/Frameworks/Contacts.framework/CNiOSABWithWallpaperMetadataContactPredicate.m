@interface CNiOSABWithWallpaperMetadataContactPredicate
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABWithWallpaperMetadataContactPredicate

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  v7 = (void *)MEMORY[0x1E4F498B0];
  id v8 = a4;
  v9 = [v7 predicateForContactsWithWallpaperMetadata];
  [v8 sortOrder];

  v10 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();
  return v10;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F498B0], "predicateForContactsWithWallpaperMetadata", a3, a4, a5);
}

@end