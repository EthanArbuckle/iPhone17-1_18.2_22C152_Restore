@interface ACProtobufAccountType
- (ACProtobufURL)objectID;
- (BOOL)hasCredentialProtectionPolicy;
- (BOOL)hasCredentialType;
- (BOOL)hasObjectID;
- (BOOL)hasObsolete;
- (BOOL)hasOwningBundleID;
- (BOOL)hasSupportsAuthentication;
- (BOOL)hasSupportsMultipleAccounts;
- (BOOL)hasVisibility;
- (BOOL)isEqual:(id)a3;
- (BOOL)obsolete;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsMultipleAccounts;
- (NSString)accountTypeDescription;
- (NSString)credentialProtectionPolicy;
- (NSString)credentialType;
- (NSString)identifier;
- (NSString)owningBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)supportsAuthentication;
- (int)visibility;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountTypeDescription:(id)a3;
- (void)setCredentialProtectionPolicy:(id)a3;
- (void)setCredentialType:(id)a3;
- (void)setHasObsolete:(BOOL)a3;
- (void)setHasSupportsAuthentication:(BOOL)a3;
- (void)setHasSupportsMultipleAccounts:(BOOL)a3;
- (void)setHasVisibility:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setObsolete:(BOOL)a3;
- (void)setOwningBundleID:(id)a3;
- (void)setSupportsAuthentication:(int)a3;
- (void)setSupportsMultipleAccounts:(BOOL)a3;
- (void)setVisibility:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufAccountType

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
}

- (void)setVisibility:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_visibility = a3;
}

- (void)setHasVisibility:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVisibility
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCredentialType
{
  return self->_credentialType != 0;
}

- (BOOL)hasCredentialProtectionPolicy
{
  return self->_credentialProtectionPolicy != 0;
}

- (void)setSupportsAuthentication:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportsAuthentication = a3;
}

- (void)setHasSupportsAuthentication:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsAuthentication
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportsMultipleAccounts:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsMultipleAccounts = a3;
}

- (void)setHasSupportsMultipleAccounts:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsMultipleAccounts
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasOwningBundleID
{
  return self->_owningBundleID != 0;
}

- (void)setObsolete:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_obsolete = a3;
}

- (void)setHasObsolete:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasObsolete
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufAccountType;
  v4 = [(ACProtobufAccountType *)&v8 description];
  v5 = [(ACProtobufAccountType *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  accountTypeDescription = self->_accountTypeDescription;
  if (accountTypeDescription) {
    [v3 setObject:accountTypeDescription forKey:@"accountTypeDescription"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  objectID = self->_objectID;
  if (objectID)
  {
    objc_super v8 = [(ACProtobufURL *)objectID dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"objectID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_visibility];
    [v4 setObject:v9 forKey:@"visibility"];
  }
  credentialType = self->_credentialType;
  if (credentialType) {
    [v4 setObject:credentialType forKey:@"credentialType"];
  }
  credentialProtectionPolicy = self->_credentialProtectionPolicy;
  if (credentialProtectionPolicy) {
    [v4 setObject:credentialProtectionPolicy forKey:@"credentialProtectionPolicy"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithInt:self->_supportsAuthentication];
    [v4 setObject:v13 forKey:@"supportsAuthentication"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_supportsMultipleAccounts];
    [v4 setObject:v14 forKey:@"supportsMultipleAccounts"];
  }
  owningBundleID = self->_owningBundleID;
  if (owningBundleID) {
    [v4 setObject:owningBundleID forKey:@"owningBundleID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_obsolete];
    [v4 setObject:v16 forKey:@"obsolete"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_objectID) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v4 = v6;
  if (self->_credentialType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_credentialProtectionPolicy)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_owningBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [v6 setAccountTypeDescription:self->_accountTypeDescription];
  [v6 setIdentifier:self->_identifier];
  if (self->_objectID) {
    objc_msgSend(v6, "setObjectID:");
  }
  v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_visibility;
    *((unsigned char *)v6 + 68) |= 2u;
  }
  if (self->_credentialType)
  {
    objc_msgSend(v6, "setCredentialType:");
    v4 = v6;
  }
  if (self->_credentialProtectionPolicy)
  {
    objc_msgSend(v6, "setCredentialProtectionPolicy:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[14] = self->_supportsAuthentication;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 65) = self->_supportsMultipleAccounts;
    *((unsigned char *)v4 + 68) |= 8u;
  }
  if (self->_owningBundleID)
  {
    objc_msgSend(v6, "setOwningBundleID:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_obsolete;
    *((unsigned char *)v4 + 68) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountTypeDescription copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(ACProtobufURL *)self->_objectID copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_visibility;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_credentialType copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_credentialProtectionPolicy copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 56) = self->_supportsAuthentication;
    *(unsigned char *)(v5 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 65) = self->_supportsMultipleAccounts;
    *(unsigned char *)(v5 + 68) |= 8u;
  }
  uint64_t v17 = [(NSString *)self->_owningBundleID copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 64) = self->_obsolete;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  accountTypeDescription = self->_accountTypeDescription;
  if ((unint64_t)accountTypeDescription | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountTypeDescription, "isEqual:")) {
      goto LABEL_35;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((void *)v4 + 5))
  {
    if (!-[ACProtobufURL isEqual:](objectID, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_visibility != *((_DWORD *)v4 + 15)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_35;
  }
  credentialType = self->_credentialType;
  if ((unint64_t)credentialType | *((void *)v4 + 3)
    && !-[NSString isEqual:](credentialType, "isEqual:"))
  {
    goto LABEL_35;
  }
  credentialProtectionPolicy = self->_credentialProtectionPolicy;
  if ((unint64_t)credentialProtectionPolicy | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialProtectionPolicy, "isEqual:")) {
      goto LABEL_35;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_supportsAuthentication != *((_DWORD *)v4 + 14)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0) {
      goto LABEL_35;
    }
    if (self->_supportsMultipleAccounts)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_35;
  }
  owningBundleID = self->_owningBundleID;
  if ((unint64_t)owningBundleID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](owningBundleID, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  BOOL v12 = (*((unsigned char *)v4 + 68) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) != 0)
    {
      if (self->_obsolete)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_35;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_35;
      }
      BOOL v12 = 1;
      goto LABEL_36;
    }
LABEL_35:
    BOOL v12 = 0;
  }
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v13 = [(NSString *)self->_accountTypeDescription hash];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(ACProtobufURL *)self->_objectID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_visibility;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_credentialType hash];
  NSUInteger v7 = [(NSString *)self->_credentialProtectionPolicy hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_supportsAuthentication;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v9 = 2654435761 * self->_supportsMultipleAccounts;
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
LABEL_9:
  NSUInteger v10 = [(NSString *)self->_owningBundleID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_obsolete;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 1))
  {
    -[ACProtobufAccountType setAccountTypeDescription:](self, "setAccountTypeDescription:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[ACProtobufAccountType setIdentifier:](self, "setIdentifier:");
    id v4 = v8;
  }
  objectID = self->_objectID;
  uint64_t v6 = *((void *)v4 + 5);
  if (objectID)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ACProtobufAccountType setObjectID:](self, "setObjectID:");
  }
  id v4 = v8;
LABEL_11:
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_visibility = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[ACProtobufAccountType setCredentialType:](self, "setCredentialType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[ACProtobufAccountType setCredentialProtectionPolicy:](self, "setCredentialProtectionPolicy:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 68);
  if (v7)
  {
    self->_supportsAuthentication = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 68);
  }
  if ((v7 & 8) != 0)
  {
    self->_supportsMultipleAccounts = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 6))
  {
    -[ACProtobufAccountType setOwningBundleID:](self, "setOwningBundleID:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    self->_obsolete = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 4u;
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (void)setAccountTypeDescription:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (int)visibility
{
  return self->_visibility;
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
}

- (NSString)credentialProtectionPolicy
{
  return self->_credentialProtectionPolicy;
}

- (void)setCredentialProtectionPolicy:(id)a3
{
}

- (int)supportsAuthentication
{
  return self->_supportsAuthentication;
}

- (BOOL)supportsMultipleAccounts
{
  return self->_supportsMultipleAccounts;
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (void)setOwningBundleID:(id)a3
{
}

- (BOOL)obsolete
{
  return self->_obsolete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credentialProtectionPolicy, 0);

  objc_storeStrong((id *)&self->_accountTypeDescription, 0);
}

@end