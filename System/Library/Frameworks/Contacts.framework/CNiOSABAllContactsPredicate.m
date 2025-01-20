@interface CNiOSABAllContactsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNiOSABAllContactsPredicate)initWithCoder:(id)a3;
- (NSString)description;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABAllContactsPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F498B0], "predicateForAllContacts", a3, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAllContactsPredicate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABAllContactsPredicate;
  return [(CNPredicate *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNiOSABAllContactsPredicate;
  [(CNPredicate *)&v3 encodeWithCoder:a3];
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
  ABPersonSortOrdering v8 = [a4 sortOrder];

  return ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(a3, 0, v8);
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F5A3E0], "isObject:equalToOther:withBlocks:", self, a3, &__block_literal_global_87, 0);
}

uint64_t __39__CNiOSABAllContactsPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (NSString)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v3 = (id)[v2 appendName:@"kind" object:@"-[CNContact predicateForAllContacts:]"];
  objc_super v4 = [v2 build];

  return (NSString *)v4;
}

@end