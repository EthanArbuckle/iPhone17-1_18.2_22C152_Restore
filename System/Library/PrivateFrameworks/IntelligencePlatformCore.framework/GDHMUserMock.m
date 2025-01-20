@interface GDHMUserMock
- (NSString)name;
- (NSString)userID;
- (NSUUID)uniqueIdentifier;
- (void)setName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation GDHMUserMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setUserID:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end