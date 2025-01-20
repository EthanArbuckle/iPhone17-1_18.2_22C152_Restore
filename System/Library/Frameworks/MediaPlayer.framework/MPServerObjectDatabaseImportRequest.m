@interface MPServerObjectDatabaseImportRequest
- (ICUserIdentity)userIdentity;
- (NSDate)assetURLExpirationDate;
- (NSDate)expirationDate;
- (id)_initWithPayload:(id)a3;
- (id)payload;
- (void)setExpirationDate:(id)a3;
- (void)setPayload:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPServerObjectDatabaseImportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLExpirationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong(&self->_payload, 0);
}

- (NSDate)assetURLExpirationDate
{
  return self->_assetURLExpirationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setPayload:(id)a3
{
}

- (id)payload
{
  return self->_payload;
}

- (void)setUserIdentity:(id)a3
{
  id obj = a3;
  if (!obj)
  {
    id obj = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  userIdentity = self->_userIdentity;
  p_userIdentity = &self->_userIdentity;
  v6 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  char v7 = [(ICUserIdentity *)userIdentity isEqualToIdentity:obj inStore:v6];

  if ((v7 & 1) == 0) {
    objc_storeStrong((id *)p_userIdentity, obj);
  }
}

- (void)setExpirationDate:(id)a3
{
  v11 = (NSDate *)a3;
  if (!v11)
  {
    v4 = [MEMORY[0x1E4F1C9C8] now];
    v11 = [v4 dateByAddingTimeInterval:604800.0];
  }
  v5 = self->_expirationDate;
  v6 = v11;
  expirationDate = v11;
  if (v5 != v11)
  {
    v8 = v5;
    char v9 = [(NSDate *)v5 isEqual:v11];

    if (v9) {
      goto LABEL_7;
    }
    v10 = (NSDate *)[(NSDate *)v11 copy];
    expirationDate = self->_expirationDate;
    self->_expirationDate = v10;
    v6 = v11;
  }
  v11 = v6;

LABEL_7:
}

- (id)_initWithPayload:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPServerObjectDatabaseImportRequest;
  v6 = [(MPServerObjectDatabaseImportRequest *)&v18 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_payload, a3);
    uint64_t v8 = [MEMORY[0x1E4FB87B8] activeAccount];
    userIdentity = v7->_userIdentity;
    v7->_userIdentity = (ICUserIdentity *)v8;

    v10 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v11 = [v10 dateByAddingTimeInterval:604800.0];
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v11;

    v13 = [MEMORY[0x1E4F1C9C8] now];
    v14 = +[MPPlaybackUserDefaults standardUserDefaults];
    [v14 assetURLExpirationDuration];
    uint64_t v15 = objc_msgSend(v13, "dateByAddingTimeInterval:");
    assetURLExpirationDate = v7->_assetURLExpirationDate;
    v7->_assetURLExpirationDate = (NSDate *)v15;
  }
  return v7;
}

@end