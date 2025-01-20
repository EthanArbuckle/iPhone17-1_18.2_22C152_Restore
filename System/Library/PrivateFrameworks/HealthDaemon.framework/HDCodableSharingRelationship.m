@interface HDCodableSharingRelationship
+ (Class)authorizationIdentifiersType;
+ (Class)sharingAuthorizationsType;
- (BOOL)hasDateModified;
- (BOOL)hasRecipientIdentifier;
- (BOOL)hasRecipientType;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSMutableArray)authorizationIdentifiers;
- (NSMutableArray)sharingAuthorizations;
- (NSString)recipientIdentifier;
- (double)dateModified;
- (id)authorizationIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recipientTypeAsString:(int)a3;
- (id)sharingAuthorizationsAtIndex:(unint64_t)a3;
- (int)StringAsRecipientType:(id)a3;
- (int)recipientType;
- (unint64_t)authorizationIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)sharingAuthorizationsCount;
- (void)addAuthorizationIdentifiers:(id)a3;
- (void)addSharingAuthorizations:(id)a3;
- (void)clearAuthorizationIdentifiers;
- (void)clearSharingAuthorizations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationIdentifiers:(id)a3;
- (void)setDateModified:(double)a3;
- (void)setHasDateModified:(BOOL)a3;
- (void)setHasRecipientType:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRecipientType:(int)a3;
- (void)setSharingAuthorizations:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSharingRelationship

- (BOOL)hasRecipientIdentifier
{
  return self->_recipientIdentifier != 0;
}

- (int)recipientType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recipientType;
  }
  else {
    return 0;
  }
}

- (void)setRecipientType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recipientType = a3;
}

- (void)setHasRecipientType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecipientType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)recipientTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"ClinicalAccount";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"SharedSummary";
  }
  return v4;
}

- (int)StringAsRecipientType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SharedSummary"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ClinicalAccount"];
  }

  return v4;
}

- (void)setDateModified:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateModified = a3;
}

- (void)setHasDateModified:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateModified
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAuthorizationIdentifiers
{
}

- (void)addAuthorizationIdentifiers:(id)a3
{
  id v4 = a3;
  authorizationIdentifiers = self->_authorizationIdentifiers;
  id v8 = v4;
  if (!authorizationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_authorizationIdentifiers;
    self->_authorizationIdentifiers = v6;

    id v4 = v8;
    authorizationIdentifiers = self->_authorizationIdentifiers;
  }
  [(NSMutableArray *)authorizationIdentifiers addObject:v4];
}

- (unint64_t)authorizationIdentifiersCount
{
  return [(NSMutableArray *)self->_authorizationIdentifiers count];
}

- (id)authorizationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authorizationIdentifiers objectAtIndex:a3];
}

+ (Class)authorizationIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearSharingAuthorizations
{
}

- (void)addSharingAuthorizations:(id)a3
{
  id v4 = a3;
  sharingAuthorizations = self->_sharingAuthorizations;
  id v8 = v4;
  if (!sharingAuthorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sharingAuthorizations;
    self->_sharingAuthorizations = v6;

    id v4 = v8;
    sharingAuthorizations = self->_sharingAuthorizations;
  }
  [(NSMutableArray *)sharingAuthorizations addObject:v4];
}

- (unint64_t)sharingAuthorizationsCount
{
  return [(NSMutableArray *)self->_sharingAuthorizations count];
}

- (id)sharingAuthorizationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sharingAuthorizations objectAtIndex:a3];
}

+ (Class)sharingAuthorizationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSharingRelationship;
  id v4 = [(HDCodableSharingRelationship *)&v8 description];
  v5 = [(HDCodableSharingRelationship *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier) {
    [v3 setObject:recipientIdentifier forKey:@"recipientIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int recipientType = self->_recipientType;
    if (recipientType)
    {
      if (recipientType == 1)
      {
        objc_super v8 = @"ClinicalAccount";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recipientType);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"SharedSummary";
    }
    [v4 setObject:v8 forKey:@"recipientType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_dateModified];
    [v4 setObject:v9 forKey:@"dateModified"];
  }
  authorizationIdentifiers = self->_authorizationIdentifiers;
  if (authorizationIdentifiers) {
    [v4 setObject:authorizationIdentifiers forKey:@"authorizationIdentifiers"];
  }
  if ([(NSMutableArray *)self->_sharingAuthorizations count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sharingAuthorizations, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = self->_sharingAuthorizations;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"sharingAuthorizations"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v19 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingRelationshipReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_recipientIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_authorizationIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_sharingAuthorizations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_recipientIdentifier)
  {
    objc_msgSend(v4, "setRecipientIdentifier:");
    id v4 = v14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_recipientType;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_dateModified;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if ([(HDCodableSharingRelationship *)self authorizationIdentifiersCount])
  {
    [v14 clearAuthorizationIdentifiers];
    unint64_t v6 = [(HDCodableSharingRelationship *)self authorizationIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableSharingRelationship *)self authorizationIdentifiersAtIndex:i];
        [v14 addAuthorizationIdentifiers:v9];
      }
    }
  }
  if ([(HDCodableSharingRelationship *)self sharingAuthorizationsCount])
  {
    [v14 clearSharingAuthorizations];
    unint64_t v10 = [(HDCodableSharingRelationship *)self sharingAuthorizationsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(HDCodableSharingRelationship *)self sharingAuthorizationsAtIndex:j];
        [v14 addSharingAuthorizations:v13];
      }
    }
  }
  if (self->_syncIdentity) {
    objc_msgSend(v14, "setSyncIdentity:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_recipientIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_recipientType;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_dateModified;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = self->_authorizationIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAuthorizationIdentifiers:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v15 = self->_sharingAuthorizations;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (void)v24);
        [(id)v5 addSharingAuthorizations:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  id v21 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  long long v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  recipientIdentifier = self->_recipientIdentifier;
  if ((unint64_t)recipientIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](recipientIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_recipientType != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_dateModified != *((double *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_20;
  }
  authorizationIdentifiers = self->_authorizationIdentifiers;
  if ((unint64_t)authorizationIdentifiers | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](authorizationIdentifiers, "isEqual:"))
  {
    goto LABEL_20;
  }
  sharingAuthorizations = self->_sharingAuthorizations;
  if ((unint64_t)sharingAuthorizations | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](sharingAuthorizations, "isEqual:")) {
      goto LABEL_20;
    }
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 6)) {
    char v9 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recipientIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_recipientType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double dateModified = self->_dateModified;
  double v6 = -dateModified;
  if (dateModified >= 0.0) {
    double v6 = self->_dateModified;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  uint64_t v10 = v4 ^ v3 ^ v9 ^ [(NSMutableArray *)self->_authorizationIdentifiers hash];
  uint64_t v11 = [(NSMutableArray *)self->_sharingAuthorizations hash];
  return v10 ^ v11 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[HDCodableSharingRelationship setRecipientIdentifier:](self, "setRecipientIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_int recipientType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_double dateModified = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HDCodableSharingRelationship *)self addAuthorizationIdentifiers:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v4 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[HDCodableSharingRelationship addSharingAuthorizations:](self, "addSharingAuthorizations:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  syncIdentity = self->_syncIdentity;
  uint64_t v17 = *((void *)v4 + 6);
  if (syncIdentity)
  {
    if (v17) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[HDCodableSharingRelationship setSyncIdentity:](self, "setSyncIdentity:");
  }
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (double)dateModified
{
  return self->_dateModified;
}

- (NSMutableArray)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (void)setAuthorizationIdentifiers:(id)a3
{
}

- (NSMutableArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sharingAuthorizations, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

@end