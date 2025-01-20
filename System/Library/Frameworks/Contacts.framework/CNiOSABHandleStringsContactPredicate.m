@interface CNiOSABHandleStringsContactPredicate
+ (id)peopleForPredicate:(id)a3 sortOrder:(unsigned int)a4 addressBook:(void *)a5;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)handlesPredicateWithMap:(id)a3;
@end

@implementation CNiOSABHandleStringsContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  v6 = [(CNHandleStringsContactPredicate *)self handleStrings];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
    v9 = [(CNiOSABHandleStringsContactPredicate *)self handlesPredicateWithMap:v8];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F498B0] predicateForNoContacts];
    }
    v12 = v11;
  }
  else
  {
    v12 = [MEMORY[0x1E4F498B0] predicateForNoContacts];
  }

  return v12;
}

- (id)handlesPredicateWithMap:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5A410];
  id v5 = a3;
  v6 = [(CNHandleStringsContactPredicate *)self handleStrings];
  uint64_t v7 = [v4 classificationOfHandleStrings:v6];

  v8 = [v7 emailAddresses];
  v9 = [v7 phoneNumbers];
  v10 = [v7 unknown];
  objc_msgSend(v10, "_cn_each:", &__block_literal_global_6_3);

  id v11 = (void *)MEMORY[0x1E4F498B0];
  v12 = [(CNHandleStringsContactPredicate *)self containerIdentifiers];
  v13 = [v11 predicateForContactsMatchingPhoneNumbers:v9 emailAddresses:v8 containerIdentifiers:v12 map:v5];

  return v13;
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
  id v11 = a4;
  v12 = [(CNHandleStringsContactPredicate *)self handleStrings];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    if (a5)
    {
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
      v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    v17 = [(CNiOSABHandleStringsContactPredicate *)self handlesPredicateWithMap:v15];
    v16 = objc_msgSend((id)objc_opt_class(), "peopleForPredicate:sortOrder:addressBook:", v17, objc_msgSend(v11, "sortOrder"), a3);
    populateMatchInfoFromMap_block_invoke((uint64_t)v16, v14, v15, v16);
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    if (a7)
    {
      *a7 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    }
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (__CFArray *)v16;
}

+ (id)peopleForPredicate:(id)a3 sortOrder:(unsigned int)a4 addressBook:(void *)a5
{
  if (a3)
  {
    id v5 = (void *)ABAddressBookCopyAllPeopleForBufferPredicate();
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

@end