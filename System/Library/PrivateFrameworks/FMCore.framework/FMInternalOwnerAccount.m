@interface FMInternalOwnerAccount
- (FMInternalOwnerAccount)initWithAccount:(id)a3;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)personId;
- (NSString)username;
- (id)description;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPersonId:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMInternalOwnerAccount

- (FMInternalOwnerAccount)initWithAccount:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMInternalOwnerAccount;
  v5 = [(FMInternalOwnerAccount *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "aa_personID");
    personId = v5->_personId;
    v5->_personId = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "aa_firstName");
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "aa_lastName");
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v10;

    uint64_t v12 = [v4 username];
    username = v5->_username;
    v5->_username = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(FMInternalOwnerAccount *)self username];
  uint64_t v6 = [(FMInternalOwnerAccount *)self personId];
  v7 = [v3 stringWithFormat:@"<%@: %p %@[%@]>", v4, self, v5, v6];

  return v7;
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_personId, 0);
}

@end