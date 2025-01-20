@interface CNiOSABMeContactsPredicate
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABMeContactsPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F498B0], "predicateForMeContact", a3, a4, a5);
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  values = (void *)ABAddressBookCopyMe();
  if (values)
  {
    v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    CFRelease(values);
    return v7;
  }
  else
  {
    v9 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    return CFArrayCreate(0, 0, 0, v9);
  }
}

@end