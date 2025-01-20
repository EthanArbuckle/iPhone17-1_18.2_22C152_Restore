@interface DAABLegacyContainer
- (BOOL)arePropertiesReadonly;
- (BOOL)isAccount;
- (BOOL)isContact;
- (BOOL)isContainer;
- (BOOL)isContentReadonly;
- (BOOL)isGroup;
- (BOOL)isGuardianRestricted;
- (BOOL)isGuardianStateDirty;
- (BOOL)isLocal;
- (BOOL)isSearchContainer;
- (DAABLegacyContainer)initWithABSource:(void *)a3;
- (id)accountIdentifier;
- (id)asContainer;
- (id)cTag;
- (id)constraintsPath;
- (id)externalIdentifier;
- (id)identifier;
- (id)meContactIdentifier;
- (id)name;
- (id)syncData;
- (id)syncTag;
- (int64_t)type;
- (void)dealloc;
- (void)markAsDefault;
- (void)markForDeletion;
- (void)setAccountIdentifier:(id)a3;
- (void)setArePropertiesReadonly:(BOOL)a3;
- (void)setCTag:(id)a3;
- (void)setConstraintsPath:(id)a3;
- (void)setContentReadonly:(BOOL)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setGuardianRestricted:(BOOL)a3;
- (void)setGuardianStateDirty:(BOOL)a3;
- (void)setMeContactIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSyncData:(id)a3;
- (void)setSyncTag:(id)a3;
- (void)setType:(int64_t)a3;
- (void)source;
- (void)updateSaveRequest:(id)a3;
@end

@implementation DAABLegacyContainer

- (DAABLegacyContainer)initWithABSource:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DAABLegacyContainer;
  v4 = [(DAABLegacyContainer *)&v6 init];
  if (v4)
  {
    v4->_source = (void *)CFRetain(a3);
    ABSourceSetShouldIgnoreCapabilitiesRestrictions();
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_source);
  v3.receiver = self;
  v3.super_class = (Class)DAABLegacyContainer;
  [(DAABLegacyContainer *)&v3 dealloc];
}

- (id)identifier
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E28]);
  return v3;
}

- (id)name
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E40]);
  return v3;
}

- (void)setName:(id)a3
{
  id value = a3;
  v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E40], value, 0);
}

- (BOOL)isLocal
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E60]);
  BOOL v4 = [v3 integerValue] == 0;

  return v4;
}

- (int64_t)type
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E60]);
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setType:(int64_t)a3
{
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABPropertyID v5 = *MEMORY[0x1E4F49E60];
  objc_super v6 = (const void *)[NSNumber numberWithInteger:a3];
  ABRecordSetValue(v4, v5, v6, 0);
}

- (id)externalIdentifier
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E10]);
  return v3;
}

- (void)setExternalIdentifier:(id)a3
{
  id value = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E10], value, 0);
}

- (id)cTag
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E18]);
  return v3;
}

- (void)setCTag:(id)a3
{
  id value = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E18], value, 0);
}

- (id)syncTag
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E20]);
  return v3;
}

- (void)setSyncTag:(id)a3
{
  id value = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E20], value, 0);
}

- (id)syncData
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E58]);
  return v3;
}

- (void)setSyncData:(id)a3
{
  id value = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E58], value, 0);
}

- (id)constraintsPath
{
  v2 = [(DAABLegacyContainer *)self source];
  objc_super v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E4F49E00]);
  return v3;
}

- (void)setConstraintsPath:(id)a3
{
  id value = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  ABRecordSetValue(v4, *MEMORY[0x1E4F49E00], value, 0);
}

- (BOOL)isContentReadonly
{
  v2 = [(DAABLegacyContainer *)self source];
  return MEMORY[0x1F4107180](v2);
}

- (void)setContentReadonly:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  MEMORY[0x1F4107198](v4, v3);
}

- (BOOL)arePropertiesReadonly
{
  v2 = [(DAABLegacyContainer *)self source];
  return MEMORY[0x1F4107160](v2);
}

- (void)setArePropertiesReadonly:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = [(DAABLegacyContainer *)self source];
  MEMORY[0x1F41071A0](v4, v3);
}

- (BOOL)isSearchContainer
{
  return ((unint64_t)[(DAABLegacyContainer *)self type] >> 24) & 1;
}

- (id)meContactIdentifier
{
  v2 = NSNumber;
  [(DAABLegacyContainer *)self source];
  BOOL v3 = [v2 numberWithInt:ABRecordGetIntValue()];
  int64_t v4 = [v3 stringValue];

  return v4;
}

- (void)setMeContactIdentifier:(id)a3
{
  id v4 = a3;
  [(DAABLegacyContainer *)self source];
  AddressBook = (const void *)ABRecordGetAddressBook();
  ABRecordID v6 = [v4 intValue];

  ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(AddressBook, v6);
  v8 = [(DAABLegacyContainer *)self source];
  MEMORY[0x1F41071A8](v8, PersonWithRecordID, 0);
}

- (id)accountIdentifier
{
  v2 = NSNumber;
  [(DAABLegacyContainer *)self source];
  BOOL v3 = [v2 numberWithInt:ABRecordGetIntValue()];
  id v4 = [v3 stringValue];

  return v4;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = a3;
  [(DAABLegacyContainer *)self source];
  [v4 intValue];

  ABRecordSetIntValue();
}

- (void)markForDeletion
{
  [(DAABLegacyContainer *)self source];
  AddressBook = (const void *)ABRecordGetAddressBook();
  id v4 = [(DAABLegacyContainer *)self source];
  ABAddressBookRemoveRecord(AddressBook, v4, 0);
}

- (void)markAsDefault
{
  [(DAABLegacyContainer *)self source];
  uint64_t AddressBook = ABRecordGetAddressBook();
  id v4 = [(DAABLegacyContainer *)self source];
  MEMORY[0x1F4106D10](AddressBook, v4, 1);
}

- (BOOL)isGuardianRestricted
{
  return (ABRecordGetIntValue() >> 2) & 1;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  [(DAABLegacyContainer *)self source];
  ABRecordGetIntValue();
  [(DAABLegacyContainer *)self source];
  ABRecordSetIntValue();
}

- (BOOL)isGuardianStateDirty
{
  return (ABRecordGetIntValue() >> 3) & 1;
}

- (void)setGuardianStateDirty:(BOOL)a3
{
  [(DAABLegacyContainer *)self source];
  ABRecordGetIntValue();
  [(DAABLegacyContainer *)self source];
  ABRecordSetIntValue();
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
  return 1;
}

- (BOOL)isAccount
{
  return 0;
}

- (void)updateSaveRequest:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"DAABLegacyContainer cannot update CNSaveRequest" userInfo:0];
  objc_exception_throw(v4);
}

- (id)asContainer
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"DAABLegacyContainer does not support asContainer" userInfo:0];
  objc_exception_throw(v2);
}

- (void)source
{
  return self->_source;
}

@end