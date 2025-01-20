@interface DAABLegacyAccount
- (BOOL)isAccount;
- (BOOL)isContact;
- (BOOL)isContainer;
- (BOOL)isGroup;
- (DAABLegacyAccount)initWithABAccout:(void *)a3;
- (id)externalIdentifier;
- (id)identifier;
- (int)legacyIdentifier;
- (void)account;
- (void)dealloc;
- (void)markForDeletion;
- (void)updateSaveRequest:(id)a3;
@end

@implementation DAABLegacyAccount

- (DAABLegacyAccount)initWithABAccout:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DAABLegacyAccount;
  v4 = [(DAABLegacyAccount *)&v6 init];
  if (v4) {
    v4->_account = (void *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_account);
  v3.receiver = self;
  v3.super_class = (Class)DAABLegacyAccount;
  [(DAABLegacyAccount *)&v3 dealloc];
}

- (int)legacyIdentifier
{
  v2 = [(DAABLegacyAccount *)self account];
  return ABRecordGetRecordID(v2);
}

- (id)identifier
{
  [(DAABLegacyAccount *)self account];
  v2 = (void *)ABAccountCopyInternalUUID();
  return v2;
}

- (id)externalIdentifier
{
  [(DAABLegacyAccount *)self account];
  v2 = (void *)ABAccountCopyIdentifier();
  return v2;
}

- (BOOL)isContact
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isContainer
{
  return 0;
}

- (BOOL)isAccount
{
  return 1;
}

- (void)updateSaveRequest:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"DAABLegacyAccount cannot update CNSaveRequest" userInfo:0];
  objc_exception_throw(v4);
}

- (void)markForDeletion
{
  [(DAABLegacyAccount *)self account];
  AddressBook = (const void *)ABRecordGetAddressBook();
  id v4 = [(DAABLegacyAccount *)self account];
  ABAddressBookRemoveRecord(AddressBook, v4, 0);
}

- (void)account
{
  return self->_account;
}

@end