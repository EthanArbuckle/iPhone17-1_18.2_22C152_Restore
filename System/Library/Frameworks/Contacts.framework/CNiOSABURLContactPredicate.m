@interface CNiOSABURLContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABURLContactPredicate)initWithCoder:(id)a3;
- (CNiOSABURLContactPredicate)initWithURLString:(id)a3;
- (NSString)description;
- (NSString)urlString;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABURLContactPredicate

- (CNiOSABURLContactPredicate)initWithURLString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABURLContactPredicate;
  v5 = [(CNPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABURLContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABURLContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlString"];
    uint64_t v7 = [v6 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v7;

    objc_super v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABURLContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, @"_urlString", v5.receiver, v5.super_class);
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
  id v15 = 0;
  v8 = [(CNiOSABURLContactPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v15];
  id v9 = v15;
  v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a7)
  {
    uint64_t v12 = [v9 code];
    v13 = [v10 userInfo];
    *a7 = +[CNErrorFactory errorWithCode:v12 userInfo:v13];
  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  v14 = [(CNiOSABURLContactPredicate *)self urlString];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4F498B8];
    v17 = [(CNiOSABURLContactPredicate *)self urlString];
    v18 = [v16 personPredicateWithValue:v17 comparison:0 forProperty:*MEMORY[0x1E4F49DB0] addressBook:a3];

    if (v18)
    {
      v26[0] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v20 = +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v19, [v12 sortOrder], a5, objc_msgSend(v12, "options"), a3, v13, a7);
    }
    else
    {
      v23 = +[CNErrorFactory errorWithCode:400 userInfo:0];
      v24 = v23;
      if (a7) {
        *a7 = v23;
      }

      v20 = 0;
    }
  }
  else
  {
    v21 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    v22 = v21;
    if (a7) {
      *a7 = v21;
    }

    v20 = 0;
  }

  return v20;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactMatchingURLString:]"];
  objc_super v5 = [(CNiOSABURLContactPredicate *)self urlString];
  id v6 = (id)[v3 appendName:@"urlString" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
}

@end