@interface DAContactsContainer
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
- (BOOL)markedAsDefault;
- (BOOL)markedForDeletion;
- (CNMutableContainer)mutableContainer;
- (DAContactsContainer)initWithCNContainer:(id)a3;
- (id)accountIdentifier;
- (id)cTag;
- (id)constraintsPath;
- (id)externalIdentifier;
- (id)identifier;
- (id)meContactIdentifier;
- (id)name;
- (id)syncData;
- (id)syncTag;
- (int64_t)type;
- (void)asSource;
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
- (void)setMarkedAsDefault:(BOOL)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setMeContactIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSyncData:(id)a3;
- (void)setSyncTag:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateSaveRequest:(id)a3;
@end

@implementation DAContactsContainer

- (DAContactsContainer)initWithCNContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAContactsContainer;
  v5 = [(DAContactsContainer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableContainer = v5->_mutableContainer;
    v5->_mutableContainer = (CNMutableContainer *)v6;
  }
  return v5;
}

- (id)identifier
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  v3 = [v2 identifier];

  return v3;
}

- (id)name
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  v3 = [v2 name];

  return v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setName:v4];
}

- (BOOL)isLocal
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  BOOL v3 = [v2 type] == 1;

  return v3;
}

- (int64_t)type
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 type];

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4 = [(DAContactsContainer *)self mutableContainer];
  [v4 setType:a3];
}

- (id)externalIdentifier
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 externalIdentifier];

  return v3;
}

- (void)setExternalIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setExternalIdentifier:v4];
}

- (id)cTag
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 externalModificationTag];

  return v3;
}

- (void)setCTag:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setExternalModificationTag:v4];
}

- (id)syncTag
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 externalSyncTag];

  return v3;
}

- (void)setSyncTag:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setExternalSyncTag:v4];
}

- (id)syncData
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 externalSyncData];

  return v3;
}

- (void)setSyncData:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setExternalSyncData:v4];
}

- (id)constraintsPath
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 constraintsPath];

  return v3;
}

- (void)setConstraintsPath:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setConstraintsPath:v4];
}

- (id)meContactIdentifier
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 meIdentifier];

  return v3;
}

- (void)setMeContactIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setMeIdentifier:v4];
}

- (id)accountIdentifier
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  int64_t v3 = [v2 accountIdentifier];

  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DAContactsContainer *)self mutableContainer];
  [v5 setAccountIdentifier:v4];
}

- (BOOL)isContentReadonly
{
  if (([(DAContactsContainer *)self type] & 0x1000000) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int64_t v3 = [(DAContactsContainer *)self mutableContainer];
    BOOL v4 = [v3 restrictions] & 1;
  }
  return v4;
}

- (void)setContentReadonly:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(DAContactsContainer *)self mutableContainer];
  uint64_t v5 = [v7 restrictions];
  uint64_t v6 = [(DAContactsContainer *)self mutableContainer];
  [v6 setRestrictions:v5 & 0xFFFFFFFFFFFFFFFELL | v3];
}

- (BOOL)arePropertiesReadonly
{
  if (([(DAContactsContainer *)self type] & 0x1000000) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v3 = [(DAContactsContainer *)self mutableContainer];
    unint64_t v4 = ((unint64_t)[v3 restrictions] >> 1) & 1;
  }
  return v4;
}

- (void)setArePropertiesReadonly:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(DAContactsContainer *)self mutableContainer];
  uint64_t v5 = [v9 restrictions];
  uint64_t v6 = [(DAContactsContainer *)self mutableContainer];
  id v7 = v6;
  uint64_t v8 = 2;
  if (!v3) {
    uint64_t v8 = 0;
  }
  [v6 setRestrictions:v5 & 0xFFFFFFFFFFFFFFFDLL | v8];
}

- (BOOL)isGuardianRestricted
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  char v3 = [v2 isGuardianRestricted];

  return v3;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DAContactsContainer *)self mutableContainer];
  [v4 setGuardianRestricted:v3 shouldPushChangeToServer:0];
}

- (BOOL)isGuardianStateDirty
{
  v2 = [(DAContactsContainer *)self mutableContainer];
  char v3 = [v2 isGuardianStateDirty];

  return v3;
}

- (void)setGuardianStateDirty:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DAContactsContainer *)self mutableContainer];
  [v4 setGuardianStateDirty:v3];
}

- (BOOL)isSearchContainer
{
  return 0;
}

- (void)markForDeletion
{
}

- (void)markAsDefault
{
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
  id v8 = a3;
  BOOL v4 = [(DAContactsContainer *)self markedForDeletion];
  uint64_t v5 = [(DAContactsContainer *)self mutableContainer];
  uint64_t v6 = v5;
  if (v4)
  {
    [v8 deleteContainer:v5];
  }
  else
  {
    int v7 = [v5 iOSLegacyIdentifier];

    if (v7 == -1) {
      goto LABEL_6;
    }
    uint64_t v6 = [(DAContactsContainer *)self mutableContainer];
    [v8 updateContainer:v6];
  }

LABEL_6:
}

- (void)asSource
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"DAContactsContainer does not support asSource" userInfo:0];
  objc_exception_throw(v2);
}

- (CNMutableContainer)mutableContainer
{
  return self->_mutableContainer;
}

- (BOOL)markedForDeletion
{
  return self->_markedForDeletion;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  self->_markedForDeletion = a3;
}

- (BOOL)markedAsDefault
{
  return self->_markedAsDefault;
}

- (void)setMarkedAsDefault:(BOOL)a3
{
  self->_markedAsDefault = a3;
}

- (void).cxx_destruct
{
}

@end