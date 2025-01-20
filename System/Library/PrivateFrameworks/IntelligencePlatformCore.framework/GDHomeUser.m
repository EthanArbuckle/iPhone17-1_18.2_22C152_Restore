@interface GDHomeUser
- (BOOL)isAdministratorForHome:(id)a3;
- (GDHomeUser)initWithHMUser:(id)a3;
- (NSString)name;
- (NSString)userID;
- (NSUUID)uniqueIdentifier;
@end

@implementation GDHomeUser

- (void).cxx_destruct
{
}

- (NSString)userID
{
  return (NSString *)((uint64_t (*)(HMUser *, char *))MEMORY[0x1F4181798])(self->_inner, sel_userID);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_msgSend_uniqueIdentifier(self->_inner, a2, v2, v3);
}

- (NSString)name
{
  return (NSString *)objc_msgSend_name(self->_inner, a2, v2, v3);
}

- (BOOL)isAdministratorForHome:(id)a3
{
  v5 = objc_msgSend_hmHome(a3, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_homeAccessControlForUser_(v5, v6, (uint64_t)self->_inner, v7);

  LOBYTE(v5) = objc_msgSend_isAdministrator(v8, v9, v10, v11);
  return (char)v5;
}

- (GDHomeUser)initWithHMUser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDHomeUser;
  v6 = [(GDHomeUser *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inner, a3);
  }

  return v7;
}

@end