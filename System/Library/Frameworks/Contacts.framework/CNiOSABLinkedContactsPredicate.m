@interface CNiOSABLinkedContactsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABLinkedContactsPredicate)initWithCoder:(id)a3;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABLinkedContactsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLinkedContactsPredicate)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNiOSABLinkedContactsPredicate;
  v3 = [(CNLinkedContactsPredicate *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNiOSABLinkedContactsPredicate;
  [(CNLinkedContactsPredicate *)&v3 encodeWithCoder:a3];
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v8 = [(CNLinkedContactsPredicate *)self contact];
  v9 = v8;
  if (v8)
  {
    int v10 = [v8 isUnified];
    uint64_t v11 = [v9 identifier];
    BOOL v12 = v10 == 0;
    if (v10) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v12) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v11;
    }
  }
  else
  {
    uint64_t v13 = [(CNLinkedContactsPredicate *)self contactIdentifier];
    uint64_t v14 = 0;
  }
  if (v13 | v14)
  {
    if (v14)
    {
      v19[0] = v14;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v15 = (__CFArray *)ABAddressBookCopyPeopleWithUUIDs();
      goto LABEL_15;
    }
    v16 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID();
    if (v16)
    {
      v17 = v16;
      v15 = ABPersonCopyArrayOfAllLinkedPeople(v16);
      CFRelease(v17);
      goto LABEL_15;
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

@end