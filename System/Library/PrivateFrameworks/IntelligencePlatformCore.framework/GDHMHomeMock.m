@interface GDHMHomeMock
- (CLLocation)location;
- (HMUser)currentUser;
- (NSArray)users;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)homeAccessControlForUser:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation GDHMHomeMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCurrentUser:(id)a3
{
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setUsers:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)homeAccessControlForUser:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_users(self, v5, v6, v7);
  v12 = objc_msgSend_firstObject(v8, v9, v10, v11);
  v16 = objc_msgSend_uniqueIdentifier(v12, v13, v14, v15);
  v20 = objc_msgSend_uniqueIdentifier(v4, v17, v18, v19);

  uint64_t isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);
  v24 = [GDHMHomeAccessControlMock alloc];
  IsAdminAnswer = objc_msgSend_initWithIsAdminAnswer_(v24, v25, isEqual, v26);
  return IsAdminAnswer;
}

@end