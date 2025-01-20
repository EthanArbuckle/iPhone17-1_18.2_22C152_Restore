@interface CNiOSABMapDataContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABMapDataContactPredicate)initWithCoder:(id)a3;
- (CNiOSABMapDataContactPredicate)initWithString:(id)a3;
- (NSString)description;
- (NSString)mapString;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABMapDataContactPredicate

- (CNiOSABMapDataContactPredicate)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABMapDataContactPredicate;
  v5 = [(CNPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mapString = v5->_mapString;
    v5->_mapString = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABMapDataContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABMapDataContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mapString"];
    uint64_t v7 = [v6 copy];
    mapString = v5->_mapString;
    v5->_mapString = (NSString *)v7;

    objc_super v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABMapDataContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_mapString, @"_mapString", v5.receiver, v5.super_class);
}

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
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  objc_super v9 = [(CNiOSABMapDataContactPredicate *)self mapString];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    objc_super v11 = [(CNiOSABMapDataContactPredicate *)self mapString];
    v12 = (void *)ABAddressBookCopyPersonMatchingMapData();

    values = v12;
    if (v12)
    {
      v13 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      CFRelease(values);
    }
    else
    {
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    v13 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v13;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactMatchingMapString:]"];
  objc_super v5 = [(CNiOSABMapDataContactPredicate *)self mapString];
  id v6 = (id)[v3 appendName:@"mapString" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)mapString
{
  return self->_mapString;
}

- (void).cxx_destruct
{
}

@end