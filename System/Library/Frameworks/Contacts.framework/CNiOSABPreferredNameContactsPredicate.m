@interface CNiOSABPreferredNameContactsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (CNiOSABPreferredNameContactsPredicate)initWithCoder:(id)a3;
- (CNiOSABPreferredNameContactsPredicate)initWithRange:(_NSRange)a3;
- (NSString)description;
- (_NSRange)range;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABPreferredNameContactsPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (CNiOSABPreferredNameContactsPredicate)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  v5 = [(CNPredicate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_range.NSUInteger location = location;
    v5->_range.NSUInteger length = length;
    v7 = v5;
  }

  return v6;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v7 = [v6 managedConfiguration];
  int v8 = [v7 deviceHasManagementRestrictions];

  if (v8)
  {
    objc_super v9 = [v6 managedConfiguration];
    v10 = ABAddressBookIndexSetOfAllowedSourceIdentifiersIncludingDisabledSources();

    v11 = (void *)MEMORY[0x1E4F498B0];
    uint64_t v12 = [(CNiOSABPreferredNameContactsPredicate *)self range];
    uint64_t v14 = v13;
    uint64_t v15 = [v6 sortOrder];

    v16 = objc_msgSend(v11, "predicateForContactsInRange:allowedStoreIdentifiers:sortOrder:", v12, v14, v10, v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F498B0];
    uint64_t v18 = [(CNiOSABPreferredNameContactsPredicate *)self range];
    uint64_t v20 = v19;
    uint64_t v21 = [v6 sortOrder];

    v16 = objc_msgSend(v17, "predicateForContactsInRange:sortOrder:", v18, v20, v21);
  }

  return v16;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredNameContactsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  v5 = [(CNPredicate *)&v12 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    p_range = &v5->_range;
    int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_range"];
    p_range->NSUInteger location = [v8 rangeValue];
    v6->_range.NSUInteger length = v9;

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  id v4 = a3;
  [(CNPredicate *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_range.location, self->_range.length, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"_range"];
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
  id v8 = a4;
  [(CNiOSABPreferredNameContactsPredicate *)self range];
  NSUInteger v9 = [v8 managedConfiguration];
  [v8 sortOrder];

  v10 = (__CFArray *)ABCopyArrayOfPreferredNamePeopleAtOffsetForManagedConfiguration();
  return v10;
}

- (NSString)description
{
  NSUInteger v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForPreferredNameInRange:]"];
  v10.NSUInteger location = [(CNiOSABPreferredNameContactsPredicate *)self range];
  v5 = NSStringFromRange(v10);
  id v6 = (id)[v3 appendName:@"range" object:v5];

  v7 = [v3 build];

  return (NSString *)v7;
}

@end