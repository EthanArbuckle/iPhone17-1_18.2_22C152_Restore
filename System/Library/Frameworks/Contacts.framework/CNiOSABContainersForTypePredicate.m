@interface CNiOSABContainersForTypePredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includeDisabledContainers;
- (CNiOSABContainersForTypePredicate)initWithCoder:(id)a3;
- (CNiOSABContainersForTypePredicate)initWithType:(int64_t)a3 includingDisabledContainers:(BOOL)a4;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContainersForTypePredicate

- (CNiOSABContainersForTypePredicate)initWithType:(int64_t)a3 includingDisabledContainers:(BOOL)a4
{
  v7 = (void *)MEMORY[0x1E4F28F60];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  v9 = [v7 predicateWithFormat:@"type == %@", v8];

  v14.receiver = self;
  v14.super_class = (Class)CNiOSABContainersForTypePredicate;
  v10 = [(CNPredicate *)&v14 initWithPredicate:v9];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_includeDisabledContainers = a4;
    v12 = v10;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForTypePredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContainersForTypePredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForTypePredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  v6 = +[CNiOSABConstantsMapping CNToABSourceTypeConstantsMapping];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNiOSABContainersForTypePredicate type](self, "type"));
  objc_super v8 = [v6 mappedConstant:v7];

  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {
    if (a4)
    {
      +[CNErrorFactory errorWithCode:400 userInfo:0];
      v11 = 0;
      *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    [(CNiOSABContainersForTypePredicate *)self includeDisabledContainers];
    v10 = (void *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
    if (v10)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __74__CNiOSABContainersForTypePredicate_cn_copyContainersInAddressBook_error___block_invoke;
      v13[3] = &unk_1E56B5170;
      id v14 = v8;
      objc_msgSend(v10, "_cn_filter:", v13);
      v11 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
    }
  }
  return v11;
}

BOOL __74__CNiOSABContainersForTypePredicate_cn_copyContainersInAddressBook_error___block_invoke(uint64_t a1)
{
  int IntValue = ABRecordGetIntValue();
  return IntValue == [*(id *)(a1 + 32) intValue];
}

- (NSString)description
{
  v3 = NSString;
  int64_t v4 = [(CNiOSABContainersForTypePredicate *)self type];
  objc_super v5 = +[CNContainer descriptionForContainerType:[(CNiOSABContainersForTypePredicate *)self type]];
  v6 = [v3 stringWithFormat:@"%ld(%@)", v4, v5];

  v7 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v8 = (id)[v7 appendName:@"kind" object:@"-[CNContainer predicateForContainersWithType:]"];
  id v9 = (id)[v7 appendObject:v6 withName:@"type"];
  v10 = [v7 build];

  return (NSString *)v10;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)includeDisabledContainers
{
  return self->_includeDisabledContainers;
}

@end