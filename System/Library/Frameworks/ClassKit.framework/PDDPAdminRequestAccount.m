@interface PDDPAdminRequestAccount
+ (Class)conflictingPersonIdsType;
+ (Class)requestedLocationIdsType;
- (BOOL)hasAdminRequestAccountId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasParentRequestId;
- (BOOL)hasPerson;
- (BOOL)hasRequestedRoleId;
- (BOOL)hasRequestedRoleType;
- (BOOL)hasTemporaryPassword;
- (BOOL)hasVerificationCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)conflictingPersonIds;
- (NSMutableArray)requestedLocationIds;
- (NSString)adminRequestAccountId;
- (NSString)parentRequestId;
- (NSString)requestedRoleId;
- (NSString)temporaryPassword;
- (NSString)verificationCode;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPPerson)person;
- (id)conflictingPersonIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestedLocationIdsAtIndex:(unint64_t)a3;
- (id)requestedRoleTypeAsString:(int)a3;
- (int)StringAsRequestedRoleType:(id)a3;
- (int)requestedRoleType;
- (unint64_t)conflictingPersonIdsCount;
- (unint64_t)hash;
- (unint64_t)requestedLocationIdsCount;
- (void)addConflictingPersonIds:(id)a3;
- (void)addRequestedLocationIds:(id)a3;
- (void)clearConflictingPersonIds;
- (void)clearRequestedLocationIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdminRequestAccountId:(id)a3;
- (void)setConflictingPersonIds:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasRequestedRoleType:(BOOL)a3;
- (void)setParentRequestId:(id)a3;
- (void)setPerson:(id)a3;
- (void)setRequestedLocationIds:(id)a3;
- (void)setRequestedRoleId:(id)a3;
- (void)setRequestedRoleType:(int)a3;
- (void)setTemporaryPassword:(id)a3;
- (void)setVerificationCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAdminRequestAccount

- (BOOL)hasAdminRequestAccountId
{
  return self->_adminRequestAccountId != 0;
}

- (BOOL)hasParentRequestId
{
  return self->_parentRequestId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (int)requestedRoleType
{
  if (*(unsigned char *)&self->_has) {
    return self->_requestedRoleType;
  }
  else {
    return 0;
  }
}

- (void)setRequestedRoleType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestedRoleType = a3;
}

- (void)setHasRequestedRoleType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedRoleType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)requestedRoleTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F5CF0 + a3);
  }

  return v3;
}

- (int)StringAsRequestedRoleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ROLE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATOR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SITE_MANAGER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MANAGER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INSTRUCTOR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STAFF"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STUDENT"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRequestedRoleId
{
  return self->_requestedRoleId != 0;
}

- (void)clearRequestedLocationIds
{
}

- (void)addRequestedLocationIds:(id)a3
{
  id v4 = a3;
  requestedLocationIds = self->_requestedLocationIds;
  id v8 = v4;
  if (!requestedLocationIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requestedLocationIds;
    self->_requestedLocationIds = v6;

    id v4 = v8;
    requestedLocationIds = self->_requestedLocationIds;
  }
  [(NSMutableArray *)requestedLocationIds addObject:v4];
}

- (unint64_t)requestedLocationIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_requestedLocationIds count];
}

- (id)requestedLocationIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_requestedLocationIds objectAtIndex:a3];
}

+ (Class)requestedLocationIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTemporaryPassword
{
  return self->_temporaryPassword != 0;
}

- (BOOL)hasVerificationCode
{
  return self->_verificationCode != 0;
}

- (void)clearConflictingPersonIds
{
}

- (void)addConflictingPersonIds:(id)a3
{
  id v4 = a3;
  conflictingPersonIds = self->_conflictingPersonIds;
  id v8 = v4;
  if (!conflictingPersonIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_conflictingPersonIds;
    self->_conflictingPersonIds = v6;

    id v4 = v8;
    conflictingPersonIds = self->_conflictingPersonIds;
  }
  [(NSMutableArray *)conflictingPersonIds addObject:v4];
}

- (unint64_t)conflictingPersonIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_conflictingPersonIds count];
}

- (id)conflictingPersonIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_conflictingPersonIds objectAtIndex:a3];
}

+ (Class)conflictingPersonIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAdminRequestAccount;
  id v3 = [(PDDPAdminRequestAccount *)&v7 description];
  id v4 = [(PDDPAdminRequestAccount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  adminRequestAccountId = self->_adminRequestAccountId;
  if (adminRequestAccountId) {
    [v3 setObject:adminRequestAccountId forKey:@"admin_request_account_id"];
  }
  parentRequestId = self->_parentRequestId;
  if (parentRequestId) {
    [v4 setObject:parentRequestId forKey:@"parent_request_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    id v8 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v10 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_last_modified"];
  }
  person = self->_person;
  if (person)
  {
    v12 = [(PDDPPerson *)person dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"person"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t requestedRoleType = self->_requestedRoleType;
    if (requestedRoleType >= 7)
    {
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_requestedRoleType];
    }
    else
    {
      v14 = *(&off_1001F5CF0 + requestedRoleType);
    }
    [v4 setObject:v14 forKey:@"requested_role_type"];
  }
  requestedRoleId = self->_requestedRoleId;
  if (requestedRoleId) {
    [v4 setObject:requestedRoleId forKey:@"requested_role_id"];
  }
  requestedLocationIds = self->_requestedLocationIds;
  if (requestedLocationIds) {
    [v4 setObject:requestedLocationIds forKey:@"requested_location_ids"];
  }
  temporaryPassword = self->_temporaryPassword;
  if (temporaryPassword) {
    [v4 setObject:temporaryPassword forKey:@"temporary_password"];
  }
  verificationCode = self->_verificationCode;
  if (verificationCode) {
    [v4 setObject:verificationCode forKey:@"verification_code"];
  }
  conflictingPersonIds = self->_conflictingPersonIds;
  if (conflictingPersonIds) {
    [v4 setObject:conflictingPersonIds forKey:@"conflicting_person_ids"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013558C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_adminRequestAccountId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentRequestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_person) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_requestedRoleId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_requestedLocationIds;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_temporaryPassword) {
    PBDataWriterWriteStringField();
  }
  if (self->_verificationCode) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_conflictingPersonIds;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_adminRequestAccountId)
  {
    objc_msgSend(v4, "setAdminRequestAccountId:");
    id v4 = v13;
  }
  if (self->_parentRequestId)
  {
    objc_msgSend(v13, "setParentRequestId:");
    id v4 = v13;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v13, "setDateCreated:");
    id v4 = v13;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v13, "setDateLastModified:");
    id v4 = v13;
  }
  if (self->_person)
  {
    objc_msgSend(v13, "setPerson:");
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 18) = self->_requestedRoleType;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_requestedRoleId) {
    objc_msgSend(v13, "setRequestedRoleId:");
  }
  if ([(PDDPAdminRequestAccount *)self requestedLocationIdsCount])
  {
    [v13 clearRequestedLocationIds];
    unint64_t v5 = [(PDDPAdminRequestAccount *)self requestedLocationIdsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPAdminRequestAccount *)self requestedLocationIdsAtIndex:i];
        [v13 addRequestedLocationIds:v8];
      }
    }
  }
  if (self->_temporaryPassword) {
    objc_msgSend(v13, "setTemporaryPassword:");
  }
  if (self->_verificationCode) {
    objc_msgSend(v13, "setVerificationCode:");
  }
  if ([(PDDPAdminRequestAccount *)self conflictingPersonIdsCount])
  {
    [v13 clearConflictingPersonIds];
    unint64_t v9 = [(PDDPAdminRequestAccount *)self conflictingPersonIdsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(PDDPAdminRequestAccount *)self conflictingPersonIdsAtIndex:j];
        [v13 addConflictingPersonIds:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_adminRequestAccountId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_parentRequestId copyWithZone:a3];
  unint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  id v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(PDDPPerson *)self->_person copyWithZone:a3];
  long long v15 = (void *)v5[6];
  v5[6] = v14;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 18) = self->_requestedRoleType;
    *((unsigned char *)v5 + 96) |= 1u;
  }
  id v16 = [(NSString *)self->_requestedRoleId copyWithZone:a3];
  long long v17 = (void *)v5[8];
  v5[8] = v16;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v18 = self->_requestedLocationIds;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a3];
        [v5 addRequestedLocationIds:v23];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v20);
  }

  id v24 = [(NSString *)self->_temporaryPassword copyWithZone:a3];
  v25 = (void *)v5[10];
  v5[10] = v24;

  id v26 = [(NSString *)self->_verificationCode copyWithZone:a3];
  v27 = (void *)v5[11];
  v5[11] = v26;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = self->_conflictingPersonIds;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v30; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v35);
        [v5 addConflictingPersonIds:v33];
      }
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  adminRequestAccountId = self->_adminRequestAccountId;
  if ((unint64_t)adminRequestAccountId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](adminRequestAccountId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  parentRequestId = self->_parentRequestId;
  if ((unint64_t)parentRequestId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentRequestId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_27;
    }
  }
  person = self->_person;
  if ((unint64_t)person | *((void *)v4 + 6))
  {
    if (!-[PDDPPerson isEqual:](person, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_requestedRoleType != *((_DWORD *)v4 + 18)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
LABEL_27:
    unsigned __int8 v15 = 0;
    goto LABEL_28;
  }
  requestedRoleId = self->_requestedRoleId;
  if ((unint64_t)requestedRoleId | *((void *)v4 + 8)
    && !-[NSString isEqual:](requestedRoleId, "isEqual:"))
  {
    goto LABEL_27;
  }
  requestedLocationIds = self->_requestedLocationIds;
  if ((unint64_t)requestedLocationIds | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](requestedLocationIds, "isEqual:")) {
      goto LABEL_27;
    }
  }
  temporaryPassword = self->_temporaryPassword;
  if ((unint64_t)temporaryPassword | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](temporaryPassword, "isEqual:")) {
      goto LABEL_27;
    }
  }
  verificationCode = self->_verificationCode;
  if ((unint64_t)verificationCode | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](verificationCode, "isEqual:")) {
      goto LABEL_27;
    }
  }
  conflictingPersonIds = self->_conflictingPersonIds;
  if ((unint64_t)conflictingPersonIds | *((void *)v4 + 2)) {
    unsigned __int8 v15 = -[NSMutableArray isEqual:](conflictingPersonIds, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_adminRequestAccountId hash];
  NSUInteger v4 = [(NSString *)self->_parentRequestId hash];
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v7 = [(PDDPPerson *)self->_person hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_requestedRoleType;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_requestedRoleId hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_requestedLocationIds hash];
  unint64_t v11 = v10 ^ [(NSString *)self->_temporaryPassword hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_verificationCode hash];
  return v9 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_conflictingPersonIds hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PDDPAdminRequestAccount setAdminRequestAccountId:](self, "setAdminRequestAccountId:");
  }
  if (*((void *)v4 + 5)) {
    -[PDDPAdminRequestAccount setParentRequestId:](self, "setParentRequestId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 3);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPAdminRequestAccount setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 4);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPAdminRequestAccount setDateLastModified:](self, "setDateLastModified:");
  }
  person = self->_person;
  uint64_t v10 = *((void *)v4 + 6);
  if (person)
  {
    if (v10) {
      -[PDDPPerson mergeFrom:](person, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPAdminRequestAccount setPerson:](self, "setPerson:");
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_uint64_t requestedRoleType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8)) {
    -[PDDPAdminRequestAccount setRequestedRoleId:](self, "setRequestedRoleId:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 7);
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(PDDPAdminRequestAccount *)self addRequestedLocationIds:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 10)) {
    -[PDDPAdminRequestAccount setTemporaryPassword:](self, "setTemporaryPassword:");
  }
  if (*((void *)v4 + 11)) {
    -[PDDPAdminRequestAccount setVerificationCode:](self, "setVerificationCode:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 2);
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[PDDPAdminRequestAccount addConflictingPersonIds:](self, "addConflictingPersonIds:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (NSString)adminRequestAccountId
{
  return self->_adminRequestAccountId;
}

- (void)setAdminRequestAccountId:(id)a3
{
}

- (NSString)parentRequestId
{
  return self->_parentRequestId;
}

- (void)setParentRequestId:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (PDDPPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (NSString)requestedRoleId
{
  return self->_requestedRoleId;
}

- (void)setRequestedRoleId:(id)a3
{
}

- (NSMutableArray)requestedLocationIds
{
  return self->_requestedLocationIds;
}

- (void)setRequestedLocationIds:(id)a3
{
}

- (NSString)temporaryPassword
{
  return self->_temporaryPassword;
}

- (void)setTemporaryPassword:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSMutableArray)conflictingPersonIds
{
  return self->_conflictingPersonIds;
}

- (void)setConflictingPersonIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_temporaryPassword, 0);
  objc_storeStrong((id *)&self->_requestedRoleId, 0);
  objc_storeStrong((id *)&self->_requestedLocationIds, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_parentRequestId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_conflictingPersonIds, 0);

  objc_storeStrong((id *)&self->_adminRequestAccountId, 0);
}

@end