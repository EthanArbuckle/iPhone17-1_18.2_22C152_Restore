@interface CNiOSABGroupiOSLegacyIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3;
- (NSString)description;
- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4;
- (int)iOSLegacyIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABGroupiOSLegacyIdentifierPredicate

- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"iOSLegacyIdentifier == %d", *(void *)&a3);
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
  v6 = [(CNPredicate *)&v8 initWithPredicate:v5];

  if (v6) {
    v6->_iOSLegacyIdentifier = a3;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
  v5 = [(CNPredicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_iOSLegacyIdentifier = [v4 decodeInt32ForKey:@"_iOSLegacyIdentifier"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, @"_iOSLegacyIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  ABRecordRef GroupWithRecordID = ABAddressBookGetGroupWithRecordID(a3, [(CNiOSABGroupiOSLegacyIdentifierPredicate *)self iOSLegacyIdentifier]);
  if (GroupWithRecordID) {
    CFArrayAppendValue(Mutable, GroupWithRecordID);
  }
  return Mutable;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNGroup predicateForiOSLegacyIdentifier:]"];
  id v5 = (id)objc_msgSend(v3, "appendName:intValue:", @"legacyIdentifier", -[CNiOSABGroupiOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  v6 = [v3 build];

  return (NSString *)v6;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

@end