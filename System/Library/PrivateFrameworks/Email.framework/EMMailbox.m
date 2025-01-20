@interface EMMailbox
+ (BOOL)_isOutgoingMailboxType:(int64_t)a3;
+ (BOOL)deleteMovesToTrashForMailboxes:(id)a3;
+ (BOOL)shouldArchiveByDefaultForMailboxes:(id)a3;
+ (BOOL)supportsArchivingForMailboxes:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsSelectAllForMailboxes:(id)a3;
+ (BOOL)typeIsValidTransferDestination:(int64_t)a3;
+ (id)_predicateForSmartMailboxes:(BOOL)a3;
+ (id)predicateForMailboxAccount:(id)a3;
+ (id)predicateForMailboxAccount:(id)a3 topLevelOnly:(BOOL)a4;
+ (id)predicateForMailboxAccountIdentifier:(id)a3 topLevelOnly:(BOOL)a4;
+ (id)predicateForMailboxChildren:(id)a3;
+ (id)predicateForMailboxName:(id)a3;
+ (id)predicateForMailboxType:(int64_t)a3;
+ (id)predicateForPrimaryMailboxWithAccount:(id)a3;
+ (id)predicateForRegularMailboxes;
+ (id)predicateForSmartMailboxes;
+ (id)predicateForTopLevelMailboxes;
+ (id)sortDescriptorForDisplayOrder;
+ (id)sortDescriptorForNameAscending:(BOOL)a3;
- (BOOL)_canArchiveForMailboxType:(int64_t)a3;
- (BOOL)_hasFetchedAccount;
- (BOOL)_shouldArchiveByDefault;
- (BOOL)canArchive;
- (BOOL)canContainMessages;
- (BOOL)descriptionUsesRealName;
- (BOOL)isCoreSpotlightMailbox;
- (BOOL)isDraftsMailbox;
- (BOOL)isInboxMailbox;
- (BOOL)isOutgoingMailbox;
- (BOOL)isSendLaterMailbox;
- (BOOL)isSentMailbox;
- (BOOL)isSmartMailbox;
- (BOOL)isTopLevelMailbox;
- (BOOL)shouldArchiveByDefault;
- (BOOL)supportsSelectAll;
- (EMMailbox)initWithCoder:(id)a3;
- (EMMailbox)initWithObjectID:(id)a3;
- (EMMailbox)initWithObjectID:(id)a3 name:(id)a4 accountIdentifier:(id)a5 type:(int64_t)a6 builder:(id)a7;
- (EMMailbox)initWithObjectID:(id)a3 repository:(id)a4 name:(id)a5 accountIdentifier:(id)a6 type:(int64_t)a7 builder:(id)a8;
- (EMMailbox)parent;
- (EMMailboxCollection)children;
- (EMMailboxObjectID)parentID;
- (EMMailboxRepository)repository;
- (EMObjectID)accountIdentifier;
- (EMReceivingAccount)account;
- (EMReceivingAccount)accountIfAvailable;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)name;
- (NSString)redactedName;
- (NSURL)externalURL;
- (id)_shouldArchiveByDefaultString;
- (int64_t)type;
- (void)_commonInitName:(id)a3 accountIdentifier:(id)a4 type:(int64_t)a5 canContainMessages:(BOOL)a6 children:(id)a7 parentID:(id)a8 builder:(id)a9;
- (void)encodeWithCoder:(id)a3;
- (void)setCanArchive:(BOOL)a3;
- (void)setCanContainMessages:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setDescriptionUsesRealName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentFromMailboxes:(id)a3;
- (void)setRepository:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation EMMailbox

- (EMMailbox)initWithObjectID:(id)a3 repository:(id)a4 name:(id)a5 accountIdentifier:(id)a6 type:(int64_t)a7 builder:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  if (!v19)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"EMMailbox.m", 49, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)EMMailbox;
  v20 = [(EMObject *)&v24 initWithObjectID:v15];
  v21 = v20;
  if (v20)
  {
    [(EMMailbox *)v20 setRepository:v16];
    [(EMMailbox *)v21 _commonInitName:v17 accountIdentifier:v18 type:a7 canContainMessages:0 children:0 parentID:0 builder:v19];
  }

  return v21;
}

- (void)_commonInitName:(id)a3 accountIdentifier:(id)a4 type:(int64_t)a5 canContainMessages:(BOOL)a6 children:(id)a7 parentID:(id)a8 builder:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void (**)(id, EMMailbox *))a9;
  objc_storeStrong((id *)&self->_name, a3);
  objc_storeStrong((id *)&self->_accountIdentifier, a4);
  self->_type = a5;
  self->_canContainMessages = a6;
  self->_canArchive = [(EMMailbox *)self _canArchiveForMailboxType:a5];
  p_children = &self->_children;
  objc_storeStrong((id *)&self->_children, a7);
  objc_storeStrong((id *)&self->_parentID, a8);
  v18[2](v18, self);
  if (!self->_children)
  {
    v20 = [EMMailboxCollection alloc];
    v21 = [(EMMailbox *)self repository];
    uint64_t v22 = [(EMMailboxCollection *)v20 initWithMailbox:self repository:v21];
    v23 = *p_children;
    *p_children = (EMMailboxCollection *)v22;
  }
}

- (EMMailboxRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMMailbox;
  v4 = [(EMRepositoryObject *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMMailbox.m" lineNumber:84 description:@"Wrong repository type"];
    }
  }
  return (EMMailboxRepository *)v4;
}

- (BOOL)_canArchiveForMailboxType:(int64_t)a3
{
  return ((unint64_t)a3 > 5) | (0x11u >> a3) & 1;
}

- (void)setRepository:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"EMMailbox.m" lineNumber:89 description:@"Wrong repository type"];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EMMailbox;
  [(EMRepositoryObject *)&v8 setRepository:v5];
  v6 = [(EMMailbox *)self children];
  [v6 setRepository:v5];
}

- (EMMailboxCollection)children
{
  return self->_children;
}

+ (id)predicateForMailboxChildren:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28B98];
  id v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"parent.objectID.url"];
  v6 = (void *)MEMORY[0x1E4F28C68];
  objc_super v7 = [v3 objectID];
  objc_super v8 = [v7 url];
  v9 = [v6 expressionForConstantValue:v8];
  v10 = [v4 predicateWithLeftExpression:v5 rightExpression:v9 modifier:0 type:4 options:0];

  return v10;
}

- (void)setCanContainMessages:(BOOL)a3
{
  self->_canContainMessages = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMailbox;
  [(EMObject *)&v9 encodeWithCoder:v4];
  id v5 = [(EMMailbox *)self name];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_name"];

  v6 = [(EMMailbox *)self accountIdentifier];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_accountIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMailbox type](self, "type"), @"EFPropertyKey_type");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailbox canContainMessages](self, "canContainMessages"), @"EFPropertyKey_canContainMessages");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailbox canArchive](self, "canArchive"), @"EFPropertyKey_canArchive");
  objc_super v7 = [(EMMailbox *)self children];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_children"];

  objc_super v8 = [(EMMailbox *)self parentID];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_parentID"];
}

- (NSString)name
{
  return self->_name;
}

- (EMObjectID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)canArchive
{
  return self->_canArchive;
}

- (void)setParentFromMailboxes:(id)a3
{
  id v11 = a3;
  id v5 = [(EMMailbox *)self parentID];
  v6 = [(EMMailbox *)self parent];

  if (!v6)
  {
    if (v5)
    {
      objc_super v7 = [v11 objectForKey:v5];
      [(EMMailbox *)self setParent:v7];

      objc_super v8 = [(EMMailbox *)self parent];

      if (!v8)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"EMMailbox.m", 114, @"failed to set parent mailbox with id:%@", v5 object file lineNumber description];
      }
    }
  }
  parentID = self->_parentID;
  self->_parentID = 0;
}

- (void)setParent:(id)a3
{
}

- (EMMailboxObjectID)parentID
{
  id v3 = [(EMMailbox *)self parent];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectID];
  }
  else
  {
    id v5 = self->_parentID;
  }
  v6 = v5;

  return v6;
}

- (EMMailbox)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (EMMailbox *)WeakRetained;
}

- (BOOL)canContainMessages
{
  return self->_canContainMessages;
}

- (BOOL)isOutgoingMailbox
{
  if (+[EMMailbox _isOutgoingMailboxType:[(EMMailbox *)self type]])
  {
    return 1;
  }
  return [(EMMailbox *)self isSendLaterMailbox];
}

+ (BOOL)_isOutgoingMailboxType:(int64_t)a3
{
  return a3 == 6 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)isSentMailbox
{
  return [(EMMailbox *)self type] == 4;
}

- (NSString)ef_publicDescription
{
  BOOL v3 = [(EMMailbox *)self descriptionUsesRealName];
  id v4 = [(EMObject *)self objectID];
  id v5 = v4;
  if (v3)
  {
    v6 = [v4 debugDescription];

    objc_super v7 = [(EMMailbox *)self name];
  }
  else
  {
    v6 = [v4 description];

    objc_super v8 = (void *)MEMORY[0x1E4F60E00];
    objc_super v9 = [(EMMailbox *)self name];
    objc_super v7 = [v8 fullyOrPartiallyRedactedStringForString:v9];
  }
  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  [(EMMailbox *)self type];
  v12 = ECNSStringFromMailboxMailboxType();
  [(EMMailbox *)self canArchive];
  v13 = NSStringFromBOOL();
  v14 = [(EMMailbox *)self _shouldArchiveByDefaultString];
  id v15 = [v10 stringWithFormat:@"<%@: %p> ObjectID:%@ Name:%@ Type:%@ CanArchive:%@ ShouldArchive:%@", v11, self, v6, v7, v12, v13, v14];

  return (NSString *)v15;
}

- (BOOL)descriptionUsesRealName
{
  BOOL result = self->_descriptionUsesRealName
        || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
            BOOL v3 = objc_claimAutoreleasedReturnValue(),
            char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F60CC0]],
            v3,
            (v4 & 1) != 0)
        || (unint64_t)([(EMMailbox *)self type] - 1) < 7;
  return result;
}

- (id)_shouldArchiveByDefaultString
{
  BOOL v3 = [(EMMailbox *)self _canArchiveForMailboxType:[(EMMailbox *)self type]];
  BOOL v4 = [(EMMailbox *)self _hasFetchedAccount];
  id v5 = @"?";
  if (v3 && v4)
  {
    [(EMMailbox *)self shouldArchiveByDefault];
    NSStringFromBOOL();
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_hasFetchedAccount
{
  return self->_account != 0;
}

- (BOOL)isInboxMailbox
{
  return [(EMMailbox *)self type] == 7;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isSmartMailbox
{
  return 0;
}

- (NSURL)externalURL
{
  v2 = self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v2)
  {
    BOOL v4 = v2;
    do
    {
      if ([v4 type] == 8) {
        break;
      }
      id v5 = [v4 name];
      [v3 insertObject:v5 atIndex:0];

      uint64_t v6 = [v4 parent];

      BOOL v4 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([v3 count])
  {
    objc_super v7 = [(EMMailbox *)v2 account];
    objc_super v8 = [v7 identityEmailAddress];

    id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v9 setScheme:@"x-apple-mail-mailbox"];
    v10 = [v8 localPart];
    [v9 setUser:v10];

    uint64_t v11 = [v8 domain];
    [v9 setHost:v11];

    v12 = [NSString pathWithComponents:v3];
    v13 = [@"/" stringByAppendingPathComponent:v12];
    [v9 setPath:v13];

    v14 = [v9 URL];
  }
  else
  {
    v14 = 0;
  }

  return (NSURL *)v14;
}

- (EMMailbox)initWithObjectID:(id)a3 name:(id)a4 accountIdentifier:(id)a5 type:(int64_t)a6 builder:(id)a7
{
  return [(EMMailbox *)self initWithObjectID:a3 repository:0 name:a4 accountIdentifier:a5 type:a6 builder:a7];
}

- (EMReceivingAccount)account
{
  p_account = &self->_account;
  account = self->_account;
  if (!account)
  {
    id v5 = [(EMMailbox *)self repository];
    uint64_t v6 = [v5 accountRepository];
    objc_super v7 = [(EMMailbox *)self accountIdentifier];
    objc_super v8 = [v6 accountForIdentifier:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)p_account, v9);

    account = *p_account;
  }
  return account;
}

- (BOOL)isCoreSpotlightMailbox
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (EMMailbox)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMMailbox;
  id v5 = [(EMObject *)&v16 initWithCoder:v4];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_name"];
  objc_super v7 = (void *)v6;
  objc_super v8 = &stru_1F1A3DFB0;
  if (v6) {
    objc_super v8 = (__CFString *)v6;
  }
  id v9 = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_accountIdentifier"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"EFPropertyKey_type"];
  uint64_t v12 = [v4 decodeBoolForKey:@"EFPropertyKey_canContainMessages"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_children"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_parentID"];
  [(EMMailbox *)v5 _commonInitName:v9 accountIdentifier:v10 type:v11 canContainMessages:v12 children:v13 parentID:v14 builder:&__block_literal_global_25];

  return v5;
}

- (BOOL)isSendLaterMailbox
{
  v2 = [(EMMailbox *)self name];
  char v3 = [v2 isEqualToString:@"x-apple-send-later"];

  return v3;
}

+ (BOOL)deleteMovesToTrashForMailboxes:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    char v4 = objc_msgSend(v3, "ef_all:", &__block_literal_global_24);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

BOOL __63__EMMailbox_TriageInteraction__deleteMovesToTrashForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] != 3 && objc_msgSend(v2, "type") != 1;

  return v3;
}

+ (BOOL)supportsArchivingForMailboxes:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    char v4 = objc_msgSend(v3, "ef_any:", &__block_literal_global_2);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __62__EMMailbox_TriageInteraction__supportsArchivingForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canArchive];
}

+ (BOOL)shouldArchiveByDefaultForMailboxes:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    char v4 = objc_msgSend(v3, "ef_any:", &__block_literal_global_4_0);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __67__EMMailbox_TriageInteraction__shouldArchiveByDefaultForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldArchiveByDefault];
}

+ (BOOL)supportsSelectAllForMailboxes:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    char v4 = objc_msgSend(v3, "ef_all:", &__block_literal_global_6);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __62__EMMailbox_TriageInteraction__supportsSelectAllForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsSelectAll];
}

- (EMMailbox)initWithObjectID:(id)a3
{
  id v5 = a3;
  [(EMMailbox *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMMailbox initWithObjectID:]", "EMMailbox.m", 45, "0");
}

- (EMReceivingAccount)accountIfAvailable
{
  return self->_account;
}

- (BOOL)isTopLevelMailbox
{
  id v2 = [(EMMailbox *)self parent];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 type] == 8;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isDraftsMailbox
{
  return [(EMMailbox *)self type] == 5;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

+ (BOOL)typeIsValidTransferDestination:(int64_t)a3
{
  char v4 = objc_msgSend(a1, "_isOutgoingMailboxType:");
  BOOL v5 = a3 != 8;
  if (a3 == -100) {
    BOOL v5 = 0;
  }
  if (a3 == -500) {
    BOOL v5 = 0;
  }
  return (v4 & 1) == 0 && v5;
}

- (void)setDescriptionUsesRealName:(BOOL)a3
{
  self->_descriptionUsesRealName = a3;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(EMObject *)self objectID];
  uint64_t v6 = [v5 debugDescription];
  objc_super v7 = [(EMMailbox *)self name];
  [(EMMailbox *)self type];
  objc_super v8 = ECNSStringFromMailboxMailboxType();
  [(EMMailbox *)self canArchive];
  id v9 = NSStringFromBOOL();
  v10 = [(EMMailbox *)self _shouldArchiveByDefaultString];
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p> ObjectID:%@ Name:%@ Type:%@ CanArchive:%@ ShouldArchive:%@", v4, self, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BOOL)shouldArchiveByDefault
{
  unint64_t v3 = [(EMMailbox *)self type] - 1;
  if (v3 < 5 && ((0x17u >> v3) & 1) != 0) {
    return 0;
  }
  return [(EMMailbox *)self _shouldArchiveByDefault];
}

- (BOOL)_shouldArchiveByDefault
{
  id v2 = [(EMMailbox *)self account];
  char v3 = [v2 shouldArchiveByDefault];

  return v3;
}

- (void)setChildren:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)redactedName
{
  return self->_redactedName;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setCanArchive:(BOOL)a3
{
  self->_canArchive = a3;
}

+ (id)predicateForMailboxName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  BOOL v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"name"];
  uint64_t v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
  objc_super v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:4 options:0];

  return v7;
}

+ (id)predicateForMailboxType:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  BOOL v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"type"];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C68];
  objc_super v7 = [NSNumber numberWithInteger:a3];
  objc_super v8 = [v6 expressionForConstantValue:v7];
  id v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)predicateForMailboxAccount:(id)a3
{
  id v3 = [a1 predicateForMailboxAccount:a3 topLevelOnly:0];
  return v3;
}

+ (id)predicateForMailboxAccount:(id)a3 topLevelOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void *)MEMORY[0x1E4F28B98];
  objc_super v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"account.objectID.representedObjectID"];
  id v9 = (void *)MEMORY[0x1E4F28C68];
  v10 = [v6 objectID];
  uint64_t v11 = [v10 representedObjectID];
  uint64_t v12 = [v9 expressionForConstantValue:v11];
  v13 = [v7 predicateWithLeftExpression:v8 rightExpression:v12 modifier:0 type:4 options:0];

  if (v4)
  {
    v14 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v13;
    id v15 = [a1 predicateForTopLevelMailboxes];
    v19[1] = v15;
    objc_super v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v17 = [v14 andPredicateWithSubpredicates:v16];

    v13 = (void *)v17;
  }

  return v13;
}

+ (id)predicateForMailboxAccountIdentifier:(id)a3 topLevelOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = (void *)MEMORY[0x1E4F28B98];
  objc_super v8 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"account.objectID.representedObjectID"];
  id v9 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];
  v10 = [v7 predicateWithLeftExpression:v8 rightExpression:v9 modifier:0 type:4 options:0];

  if (v4)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
    v16[0] = v10;
    uint64_t v12 = [a1 predicateForTopLevelMailboxes];
    v16[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v14 = [v11 andPredicateWithSubpredicates:v13];

    v10 = (void *)v14;
  }

  return v10;
}

+ (id)predicateForPrimaryMailboxWithAccount:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [a1 predicateForMailboxAccount:v4 topLevelOnly:0];
  id v6 = [a1 predicateForMailboxType:7];
  objc_super v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v6;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForTopLevelMailboxes
{
  id v2 = (void *)MEMORY[0x1E4F28B98];
  id v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"isTopLevelMailbox"];
  id v4 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  BOOL v5 = [v2 predicateWithLeftExpression:v3 rightExpression:v4 modifier:0 type:4 options:0];

  return v5;
}

+ (id)predicateForSmartMailboxes
{
  return (id)[a1 _predicateForSmartMailboxes:1];
}

+ (id)predicateForRegularMailboxes
{
  return (id)[a1 _predicateForSmartMailboxes:0];
}

+ (id)_predicateForSmartMailboxes:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28B98];
  BOOL v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"isSmartMailbox"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  objc_super v7 = [NSNumber numberWithBool:v3];
  objc_super v8 = [v6 expressionForConstantValue:v7];
  id v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)sortDescriptorForNameAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F60F30] sortDescriptorWithKey:@"name" ascending:a3];
}

+ (id)sortDescriptorForDisplayOrder
{
  return (id)[MEMORY[0x1E4F60F30] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_27];
}

uint64_t __60__EMMailbox_EMQueryAdditions__sortDescriptorForDisplayOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v35 = a3;
  id v5 = v4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v36 = v5;
  if (v5)
  {
    do
    {
      [v6 insertObject:v5 atIndex:0];
      uint64_t v7 = [v5 parent];

      id v5 = (id)v7;
    }
    while (v7);
  }
  id v8 = v35;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  if (v8)
  {
    v10 = v8;
    do
    {
      [v9 insertObject:v10 atIndex:0];
      uint64_t v11 = [v10 parent];

      v10 = (void *)v11;
    }
    while (v11);
  }
  unint64_t v12 = [v6 count];
  v34 = v8;
  unint64_t v13 = [v9 count];
  unint64_t v32 = v13;
  unint64_t v33 = v12;
  if (v12 >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  if (v14)
  {
    unint64_t v15 = 1;
    v37 = v6;
    do
    {
      objc_super v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", v15 - 1, v32, v33);
      uint64_t v17 = [v9 objectAtIndexedSubscript:v15 - 1];
      id v18 = v16;
      id v19 = v17;
      uint64_t v20 = [v18 type];
      uint64_t v21 = [v19 type];
      if (v20 == v21)
      {
        id v22 = [v18 name];
        v23 = [v19 name];
        uint64_t v24 = [v22 localizedStandardCompare:v23];
      }
      else
      {
        if (_mailboxTypeOrder_onceToken != -1) {
          dispatch_once(&_mailboxTypeOrder_onceToken, &__block_literal_global_41);
        }
        id v22 = (id)_mailboxTypeOrder_order;
        id v25 = [NSNumber numberWithInteger:v20];
        unint64_t v26 = [v22 indexOfObject:v25];

        v27 = [NSNumber numberWithInteger:v21];
        unint64_t v28 = [v22 indexOfObject:v27];

        if (v26 < v28) {
          uint64_t v24 = -1;
        }
        else {
          uint64_t v24 = 1;
        }
        id v6 = v37;
      }

      BOOL v29 = v24 == 0;
      if (v24) {
        break;
      }
    }
    while (v15++ < v14);
  }
  else
  {
    uint64_t v24 = 0;
    BOOL v29 = 1;
  }
  if (v29 && v33 != v32)
  {
    if (v33 >= v32)
    {
      if (v33 > v32) {
        uint64_t v24 = 1;
      }
    }
    else
    {
      uint64_t v24 = -1;
    }
  }

  return v24;
}

@end