@interface CNiOSABContaineriOSLegacyIdentifierPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDisabledContainers;
- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithCoder:(id)a3;
- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithPredicate:(id)a3;
- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3;
- (NSString)description;
- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4;
- (int)iOSLegacyIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABContaineriOSLegacyIdentifierPredicate

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithPredicate:(id)a3
{
  return [(CNiOSABContaineriOSLegacyIdentifierPredicate *)self initWithiOSLegacyIdentifier:0xFFFFFFFFLL];
}

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"iOSLegacyIdentifier == %d", *(void *)&a3);
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
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

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
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
  v5.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, @"_iOSLegacyIdentifier", v5.receiver, v5.super_class);
}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  values = (void *)ABAddressBookGetSourceWithRecordID(a3, [(CNiOSABContaineriOSLegacyIdentifierPredicate *)self iOSLegacyIdentifier]);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  objc_super v5 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  if (values) {
    return CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
  }

  return CFArrayCreate(v4, 0, 0, v5);
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContainer predicateForiOSLegacyIdentifier:]"];
  id v5 = (id)objc_msgSend(v3, "appendName:intValue:", @"legacyIdentifier", -[CNiOSABContaineriOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  v6 = [v3 build];

  return (NSString *)v6;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

@end