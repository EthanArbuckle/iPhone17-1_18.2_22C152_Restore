@interface CNiOSABEKParticipantPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABEKParticipantPredicate)initWithCoder:(id)a3;
- (CNiOSABEKParticipantPredicate)initWithName:(id)a3 URL:(id)a4 emailAddress:(id)a5 customDescription:(id)a6;
- (NSString)customDescription;
- (NSString)description;
- (NSString)emailAddress;
- (NSString)name;
- (NSURL)URL;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomDescription:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setName:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CNiOSABEKParticipantPredicate

- (CNiOSABEKParticipantPredicate)initWithName:(id)a3 URL:(id)a4 emailAddress:(id)a5 customDescription:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSABEKParticipantPredicate;
  v14 = [(CNPredicate *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    URL = v14->_URL;
    v14->_URL = (NSURL *)v17;

    uint64_t v19 = [v12 copy];
    emailAddress = v14->_emailAddress;
    v14->_emailAddress = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    customDescription = v14->_customDescription;
    v14->_customDescription = (NSString *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABEKParticipantPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABEKParticipantPredicate;
  v5 = [(CNPredicate *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_emailAddress"];
    uint64_t v10 = [v9 copy];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_customDescription"];
    uint64_t v13 = [v12 copy];
    customDescription = v5->_customDescription;
    v5->_customDescription = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_URL"];
    uint64_t v16 = [v15 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABEKParticipantPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_emailAddress forKey:@"_emailAddress"];
  [v4 encodeObject:self->_customDescription forKey:@"_customDescription"];
  [v4 encodeObject:self->_URL forKey:@"_URL"];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNiOSABEKParticipantPredicate *)self customDescription];

  if (v4)
  {
    objc_super v5 = [(CNiOSABEKParticipantPredicate *)self customDescription];
    id v6 = (id)[v3 appendName:@"kind" object:v5];
  }
  else
  {
    id v7 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"];
  }
  v8 = [(CNiOSABEKParticipantPredicate *)self name];
  id v9 = (id)[v3 appendName:@"name" object:v8];

  uint64_t v10 = [(CNiOSABEKParticipantPredicate *)self URL];
  id v11 = (id)[v3 appendName:@"URL" object:v10];

  id v12 = [(CNiOSABEKParticipantPredicate *)self emailAddress];
  id v13 = (id)[v3 appendName:@"emailAddress" object:v12];

  v14 = [v3 build];

  return (NSString *)v14;
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
  id v7 = (__CFArray *)a3;
  values = 0;
  if (a3)
  {
    id v9 = [(CNiOSABEKParticipantPredicate *)self emailAddress];
    if ([(__CFString *)v9 length])
    {
      if (CFStringFind(v9, @"@", 0).location != -1)
      {
        PersonMatchingEmailAddress = (const void *)ABAddressBookFindPersonMatchingEmailAddress();
        if (PersonMatchingEmailAddress)
        {
          values = (void *)CFRetain(PersonMatchingEmailAddress);
          if (values) {
            goto LABEL_10;
          }
        }
      }
    }
    id v11 = [(CNiOSABEKParticipantPredicate *)self URL];

    if (v11)
    {
      id v12 = [(CNiOSABEKParticipantPredicate *)self URL];
      values = (void *)CNiOSABEKParticipantMatchingCopyPersonByURL((uint64_t)v7, v12);

      if (values) {
        goto LABEL_10;
      }
    }
    id v13 = [(CNiOSABEKParticipantPredicate *)self name];

    if (v13
      && ([(CNiOSABEKParticipantPredicate *)self name],
          v14 = objc_claimAutoreleasedReturnValue(),
          values = (void *)CNiOSABEKParticipantMatchingCopyPersonByName((uint64_t)v7, (uint64_t)v14),
          v14,
          values))
    {
LABEL_10:
      id v7 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      CFRelease(values);
      values = 0;
    }
    else
    {
      id v7 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  return v7;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end