@interface CNiOSABPhoneNumberContactPredicate
+ (id)countryCodeForPredicate:(id)a3;
+ (id)stringValueForPredicate:(id)a3;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
@end

@implementation CNiOSABPhoneNumberContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  v7 = [(id)objc_opt_class() stringValueForPredicate:self];
  v8 = [(id)objc_opt_class() countryCodeForPredicate:self];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F498B0];
    v11 = -[CNPhoneNumberContactPredicate prefixHint]((uint64_t)self);
    v12 = -[CNPhoneNumberContactPredicate groupIdentifiers]((uint64_t)self);
    v9 = [v10 predicateForContactsMatchingPhoneNumber:v7 country:v8 homeCountryCode:0 prefixHint:v11 groupIdentifiers:v12 limitToOneResult:!-[CNPhoneNumberContactPredicate returnsMultipleResults]((BOOL)self)];

    if (v9) {
      goto LABEL_5;
    }
  }
  CNSetError(a5, 400, 0);
LABEL_5:

  return v9;
}

+ (id)stringValueForPredicate:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = a3;
  v5 = -[CNPhoneNumberContactPredicate digits]((uint64_t)v4);
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if (v3)
  {
    v6 = -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)v4);

    v7 = [v6 digits];
    id v4 = v6;
  }
  else
  {
    v7 = -[CNPhoneNumberContactPredicate digits]((uint64_t)v4);
  }

  return v7;
}

+ (id)countryCodeForPredicate:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = a3;
  v5 = -[CNPhoneNumberContactPredicate countryCode]((uint64_t)v4);
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if (v3)
  {
    v6 = -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)v4);

    v7 = [v6 countryCode];
    id v4 = v6;
  }
  else
  {
    v7 = -[CNPhoneNumberContactPredicate countryCode]((uint64_t)v4);
  }

  return v7;
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9 = a4;
  v10 = [(id)objc_opt_class() stringValueForPredicate:self];
  v11 = [(id)objc_opt_class() countryCodeForPredicate:self];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:400 userInfo:0];
      v12 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F498B0];
    v14 = -[CNPhoneNumberContactPredicate prefixHint]((uint64_t)self);
    v15 = -[CNPhoneNumberContactPredicate groupIdentifiers]((uint64_t)self);
    v16 = [v13 predicateForContactsMatchingPhoneNumber:v10 country:v11 homeCountryCode:0 prefixHint:v14 groupIdentifiers:v15 limitToOneResult:!-[CNPhoneNumberContactPredicate returnsMultipleResults]((BOOL)self)];

    [v9 sortOrder];
    v12 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();
  }
  return v12;
}

@end