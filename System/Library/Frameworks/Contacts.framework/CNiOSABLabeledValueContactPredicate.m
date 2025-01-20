@interface CNiOSABLabeledValueContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABLabeledValueContactPredicate)initWithCoder:(id)a3;
- (CNiOSABLabeledValueContactPredicate)initWithLabeledValueIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABLabeledValueContactPredicate

- (CNiOSABLabeledValueContactPredicate)initWithLabeledValueIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  id v3 = a3;
  v4 = [(CNPredicate *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLabeledValueContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  uint64_t v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABLabeledValueContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"_identifier", v5.receiver, v5.super_class);
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
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x1E4F5A298];
  v14 = [(CNiOSABLabeledValueContactPredicate *)self identifier];
  LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  if (v13)
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:400 userInfo:0];
      v15 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    int v23 = -1;
    v16 = [(CNiOSABLabeledValueContactPredicate *)self identifier];
    PersonMatchingMultiValueUUID = (void *)ABAddressBookFindPersonMatchingMultiValueUUID();

    values = PersonMatchingMultiValueUUID;
    if (PersonMatchingMultiValueUUID)
    {
      v15 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      v18 = +[CNiOSABConversions contactIdentifierFromABPerson:]((uint64_t)CNiOSABConversions, values);
      v19 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
      NSMapInsert(v19, (const void *)(v23 + 1), MEMORY[0x1E4F1CBF0]);
      v25 = v19;
      v26 = v18;
      uint64_t v24 = *MEMORY[0x1E4F49868];
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v27[0] = v20;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    }
    else
    {
      v15 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    }
  }

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactMatchingLabeledValueIdentifier:]"];
  objc_super v5 = [(CNiOSABLabeledValueContactPredicate *)self identifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end