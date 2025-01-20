@interface CNiOSABGroupNameMatchingPredicate
+ (BOOL)supportsSecureCoding;
+ (id)groupNameTokenizingCharacterSet;
+ (id)tokenizeString:(id)a3;
- (BOOL)groupName:(id)a3 matchesSearchTokens:(id)a4;
- (CNiOSABGroupNameMatchingPredicate)initWithCoder:(id)a3;
- (CNiOSABGroupNameMatchingPredicate)initWithName:(id)a3;
- (NSString)description;
- (NSString)name;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABGroupNameMatchingPredicate

- (CNiOSABGroupNameMatchingPredicate)initWithName:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E4F28F60];
  if (v4) {
    v7 = v4;
  }
  else {
    v7 = &stru_1EE052B80;
  }
  v8 = [@"*" stringByAppendingString:v7];
  v9 = [v6 predicateWithFormat:@"name LIKE[cd] %@", v8];
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  v10 = [(CNPredicate *)&v14 initWithPredicate:v9];

  if (v10)
  {
    uint64_t v11 = [(__CFString *)v5 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupNameMatchingPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  v8 = [(CNiOSABGroupNameMatchingPredicate *)self name];
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    if (!a4) {
      return 0;
    }
    +[CNErrorFactory errorWithCode:400 userInfo:0];
    Mutable = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return Mutable;
  }
  CFArrayRef v10 = ABAddressBookCopyArrayOfAllGroups(a3);
  if (v10)
  {
    CFArrayRef v11 = v10;
    if (CFArrayGetCount(v10))
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      v12 = objc_opt_class();
      v13 = [(CNiOSABGroupNameMatchingPredicate *)self name];
      objc_super v14 = [v12 tokenizeString:v13];

      if (CFArrayGetCount(v11) >= 1)
      {
        CFIndex v15 = 0;
        ABPropertyID v16 = *MEMORY[0x1E4F499B0];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v11, v15);
          CFTypeRef v18 = ABRecordCopyValue(ValueAtIndex, v16);
          if (v18) {
            CFTypeRef v19 = CFAutorelease(v18);
          }
          else {
            CFTypeRef v19 = 0;
          }
          if ([(CNiOSABGroupNameMatchingPredicate *)self groupName:v19 matchesSearchTokens:v14])
          {
            CFArrayAppendValue(Mutable, ValueAtIndex);
          }
          ++v15;
        }
        while (v15 < CFArrayGetCount(v11));
      }
      CFRelease(v11);

      return Mutable;
    }
    CFRelease(v11);
  }
  v21 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];

  return CFArrayCreate(0, 0, 0, v21);
}

- (BOOL)groupName:(id)a3 matchesSearchTokens:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() tokenizeString:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke;
  v10[3] = &unk_1E56B4F68;
  id v11 = v7;
  id v8 = v7;
  LOBYTE(v7) = objc_msgSend(v5, "_cn_all:", v10);

  return (char)v7;
}

uint64_t __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke_2;
  v8[3] = &unk_1E56B4F68;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_hasPrefix:", *(void *)(a1 + 32));
}

+ (id)tokenizeString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 groupNameTokenizingCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = objc_msgSend(v6, "_cn_filter:", *MEMORY[0x1E4F5A2A0]);

  return v7;
}

+ (id)groupNameTokenizingCharacterSet
{
  v2 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  id v3 = [v2 invertedSet];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeCharactersInString:@"@"];

  return v4;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNGroup predicateForGroupWithNameMatching:]"];
  id v5 = [(CNiOSABGroupNameMatchingPredicate *)self name];
  id v6 = (id)[v3 appendName:@"name" object:v5];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end