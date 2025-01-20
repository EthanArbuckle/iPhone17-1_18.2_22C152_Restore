@interface DAContactsBasedAccount
- (BOOL)isAccount;
- (BOOL)isContact;
- (BOOL)isContainer;
- (BOOL)isGroup;
- (BOOL)markedForDeletion;
- (CNAccount)account;
- (DAContactsBasedAccount)initWithAccount:(id)a3;
- (id)externalIdentifier;
- (id)identifier;
- (int)legacyIdentifier;
- (void)markForDeletion;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)updateSaveRequest:(id)a3;
@end

@implementation DAContactsBasedAccount

- (DAContactsBasedAccount)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAContactsBasedAccount;
  v6 = [(DAContactsBasedAccount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (int)legacyIdentifier
{
  v2 = [(DAContactsBasedAccount *)self account];
  int v3 = [v2 iOSLegacyIdentifier];

  return v3;
}

- (id)identifier
{
  v2 = [(DAContactsBasedAccount *)self account];
  int v3 = [v2 identifier];

  return v3;
}

- (id)externalIdentifier
{
  v2 = [(DAContactsBasedAccount *)self account];
  int v3 = [v2 externalIdentifierString];

  return v3;
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
  id v8 = a3;
  BOOL v4 = [(DAContactsBasedAccount *)self markedForDeletion];
  id v5 = [(DAContactsBasedAccount *)self account];
  v6 = v5;
  if (v4)
  {
    [v8 removeAccount:v5];
  }
  else
  {
    int v7 = [v5 iOSLegacyIdentifier];

    if (v7 != -1) {
      goto LABEL_6;
    }
    v6 = [(DAContactsBasedAccount *)self account];
    [v8 addAccount:v6];
  }

LABEL_6:
}

- (void)markForDeletion
{
}

- (CNAccount)account
{
  return self->_account;
}

- (BOOL)markedForDeletion
{
  return self->_markedForDeletion;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  self->_markedForDeletion = a3;
}

- (void).cxx_destruct
{
}

@end