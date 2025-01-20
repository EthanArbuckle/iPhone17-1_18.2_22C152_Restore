@interface CRKASMConcreteUser
- (BOOL)isAccountATOLocked;
- (BOOL)isAccountLockedDueToFailedLoginAttempts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConcreteUser:(id)a3;
- (BOOL)isFederated;
- (CRKASMConcreteUser)initWithBackingPerson:(id)a3;
- (CRKASMNameComponents)nameComponents;
- (CRKClassKitPerson)backingPerson;
- (NSDate)backingPersonInitialModificationDate;
- (NSString)appleID;
- (NSString)description;
- (NSString)identifier;
- (unint64_t)hash;
@end

@implementation CRKASMConcreteUser

- (CRKASMConcreteUser)initWithBackingPerson:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKASMConcreteUser;
  v6 = [(CRKASMConcreteUser *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectID];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    uint64_t v9 = [v5 appleID];
    appleID = v6->_appleID;
    v6->_appleID = (NSString *)v9;

    v11 = [[CRKASMConcreteNameComponents alloc] initWithPerson:v5];
    nameComponents = v6->_nameComponents;
    v6->_nameComponents = (CRKASMNameComponents *)v11;

    objc_storeStrong((id *)&v6->_backingPerson, a3);
    uint64_t v13 = [v5 dateLastModified];
    backingPersonInitialModificationDate = v6->_backingPersonInitialModificationDate;
    v6->_backingPersonInitialModificationDate = (NSDate *)v13;

    v6->_federated = [v5 isFederatedAccount];
    v6->_accountLockedDueToFailedLoginAttempts = [v5 isAccountFailedPasswordLocked];
    v6->_accountATOLocked = [v5 isAccountATOLocked];
  }

  return v6;
}

- (BOOL)isEqualToConcreteUser:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    LOBYTE(v11) = 0;
    goto LABEL_39;
  }
  uint64_t v9 = [(CRKASMConcreteUser *)self identifier];
  if (v9 || ([v8 identifier], (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CRKASMConcreteUser *)self identifier];
    v4 = [v8 identifier];
    if (![v3 isEqual:v4])
    {
      LOBYTE(v11) = 0;
      goto LABEL_35;
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v12 = [(CRKASMConcreteUser *)self appleID];
  if (v12 || ([v8 appleID], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = [(CRKASMConcreteUser *)self appleID];
    id v5 = [v8 appleID];
    if (![v13 isEqual:v5])
    {
      LOBYTE(v11) = 0;
      goto LABEL_32;
    }
    v22 = v13;
    int v26 = 1;
  }
  else
  {
    v23 = 0;
    int v26 = 0;
  }
  v14 = [(CRKASMConcreteUser *)self nameComponents];
  int v25 = v10;
  v24 = v5;
  if (v14 || ([v8 nameComponents], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = [(CRKASMConcreteUser *)self nameComponents];
    id v5 = [v8 nameComponents];
    if (![(id)v10 isEqual:v5])
    {
      LOBYTE(v11) = 0;
LABEL_25:

      goto LABEL_28;
    }
    v20 = v6;
    int v21 = 1;
  }
  else
  {
    v19 = 0;
    v20 = v6;
    int v21 = 0;
  }
  int v15 = [(CRKASMConcreteUser *)self isFederated];
  if (v15 == [v8 isFederated]
    && (int v16 = -[CRKASMConcreteUser isAccountLockedDueToFailedLoginAttempts](self, "isAccountLockedDueToFailedLoginAttempts"), v16 == [v8 isAccountLockedDueToFailedLoginAttempts]))
  {
    BOOL v17 = [(CRKASMConcreteUser *)self isAccountATOLocked];
    int v11 = v17 ^ [v8 isAccountATOLocked] ^ 1;
    if (v21) {
      goto LABEL_24;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
    if (v21)
    {
LABEL_24:
      v6 = v20;
      goto LABEL_25;
    }
  }
  v6 = v20;
LABEL_28:
  LODWORD(v10) = v25;
  id v5 = v24;
  if (v14)
  {

    if (!v26) {
      goto LABEL_33;
    }
    uint64_t v13 = v22;
  }
  else
  {

    uint64_t v13 = v22;
    if ((v26 & 1) == 0) {
      goto LABEL_33;
    }
  }
LABEL_32:

LABEL_33:
  if (!v12)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  if (v10)
  {
LABEL_35:
  }
LABEL_36:
  if (!v9) {

  }
LABEL_39:
  return v11;
}

- (unint64_t)hash
{
  v3 = [(CRKASMConcreteUser *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKASMConcreteUser *)self appleID];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CRKASMConcreteUser *)self nameComponents];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = [(CRKASMConcreteUser *)self isFederated];
  uint64_t v10 = v8 ^ v9 ^ [(CRKASMConcreteUser *)self isAccountLockedDueToFailedLoginAttempts];
  unint64_t v11 = v10 ^ [(CRKASMConcreteUser *)self isAccountATOLocked];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRKASMConcreteUser *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(CRKASMConcreteUser *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(CRKASMConcreteUser *)self isEqualToConcreteUser:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKASMConcreteUser *)self identifier];
  uint64_t v6 = [(CRKASMConcreteUser *)self appleID];
  uint64_t v7 = [(CRKASMConcreteUser *)self nameComponents];
  if ([(CRKASMConcreteUser *)self isFederated]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  uint64_t v9 = v8;
  if ([(CRKASMConcreteUser *)self isAccountLockedDueToFailedLoginAttempts]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  unint64_t v11 = v10;
  if ([(CRKASMConcreteUser *)self isAccountATOLocked]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  uint64_t v13 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, appleID = %@, nameComponents = %@, isFederated = %@, isAccountLockedDueToFailedLoginAttempts = %@, isAccountATOLocked = %@ }>", v4, self, v5, v6, v7, v9, v11, v12];

  return (NSString *)v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (CRKASMNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (BOOL)isFederated
{
  return self->_federated;
}

- (BOOL)isAccountLockedDueToFailedLoginAttempts
{
  return self->_accountLockedDueToFailedLoginAttempts;
}

- (BOOL)isAccountATOLocked
{
  return self->_accountATOLocked;
}

- (CRKClassKitPerson)backingPerson
{
  return self->_backingPerson;
}

- (NSDate)backingPersonInitialModificationDate
{
  return self->_backingPersonInitialModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPersonInitialModificationDate, 0);
  objc_storeStrong((id *)&self->_backingPerson, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end