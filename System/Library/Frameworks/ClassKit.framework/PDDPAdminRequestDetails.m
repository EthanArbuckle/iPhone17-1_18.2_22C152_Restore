@interface PDDPAdminRequestDetails
+ (Class)adminRequestAccountIdsType;
- (BOOL)hasAdminNote;
- (BOOL)hasAdminRequestId;
- (BOOL)hasApprovalStatus;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasDateCompleted;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasOptions;
- (BOOL)hasOrgId;
- (BOOL)hasRequestStatus;
- (BOOL)hasRequestor;
- (BOOL)hasStatus;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)adminRequestAccountIds;
- (NSString)adminNote;
- (NSString)adminRequestId;
- (NSString)bundleIdentifier;
- (NSString)orgId;
- (PDDPAdminRequestRequestor)requestor;
- (PDDPDate)dateCompleted;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPStatus)status;
- (id)adminRequestAccountIdsAtIndex:(unint64_t)a3;
- (id)approvalStatusAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestStatusAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsApprovalStatus:(id)a3;
- (int)StringAsRequestStatus:(id)a3;
- (int)StringAsType:(id)a3;
- (int)approvalStatus;
- (int)requestStatus;
- (int)type;
- (unint64_t)adminRequestAccountIdsCount;
- (unint64_t)hash;
- (unsigned)options;
- (void)addAdminRequestAccountIds:(id)a3;
- (void)clearAdminRequestAccountIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdminNote:(id)a3;
- (void)setAdminRequestAccountIds:(id)a3;
- (void)setAdminRequestId:(id)a3;
- (void)setApprovalStatus:(int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDateCompleted:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setHasApprovalStatus:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOptions:(unsigned int)a3;
- (void)setOrgId:(id)a3;
- (void)setRequestStatus:(int)a3;
- (void)setRequestor:(id)a3;
- (void)setStatus:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAdminRequestDetails

- (BOOL)hasAdminRequestId
{
  return self->_adminRequestId != 0;
}

- (BOOL)hasOrgId
{
  return self->_orgId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasDateCompleted
{
  return self->_dateCompleted != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F2898 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REQUEST_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REQUEST_EMAIL_VERIFICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CREATE_MAID_ACCOUNT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESET_PASSWORD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESET_VERIFICATION_CODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESEND_ACCOUNT_CREDENTIALS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)requestStatus
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_requestStatus;
  }
  else {
    return 0;
  }
}

- (void)setRequestStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requestStatus = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)requestStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F28C8 + a3);
  }

  return v3;
}

- (int)StringAsRequestStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REQUEST_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_NEW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_ISSUED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STATUS_COMPLETED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)approvalStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_approvalStatus;
  }
  else {
    return 0;
  }
}

- (void)setApprovalStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_approvalStatus = a3;
}

- (void)setHasApprovalStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApprovalStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)approvalStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1001F28F0 + a3);
  }

  return v3;
}

- (int)StringAsApprovalStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REQUEST_APPROVAL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APPROVAL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APPROVAL_PENDING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"APPROVAL_APPROVED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"APPROVAL_DECLINED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"APPROVAL_APPROVED_CREDENTIAL_EMAIL_NOT_ALLOWED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRequestor
{
  return self->_requestor != 0;
}

- (void)setOptions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)clearAdminRequestAccountIds
{
}

- (void)addAdminRequestAccountIds:(id)a3
{
  id v4 = a3;
  adminRequestAccountIds = self->_adminRequestAccountIds;
  id v8 = v4;
  if (!adminRequestAccountIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adminRequestAccountIds;
    self->_adminRequestAccountIds = v6;

    id v4 = v8;
    adminRequestAccountIds = self->_adminRequestAccountIds;
  }
  [(NSMutableArray *)adminRequestAccountIds addObject:v4];
}

- (unint64_t)adminRequestAccountIdsCount
{
  return (unint64_t)[(NSMutableArray *)self->_adminRequestAccountIds count];
}

- (id)adminRequestAccountIdsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_adminRequestAccountIds objectAtIndex:a3];
}

+ (Class)adminRequestAccountIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAdminNote
{
  return self->_adminNote != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAdminRequestDetails;
  char v3 = [(PDDPAdminRequestDetails *)&v7 description];
  id v4 = [(PDDPAdminRequestDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  adminRequestId = self->_adminRequestId;
  if (adminRequestId) {
    [v3 setObject:adminRequestId forKey:@"admin_request_id"];
  }
  orgId = self->_orgId;
  if (orgId) {
    [v4 setObject:orgId forKey:@"org_id"];
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
  dateCompleted = self->_dateCompleted;
  if (dateCompleted)
  {
    v12 = [(PDDPDate *)dateCompleted dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"date_completed"];
  }
  status = self->_status;
  if (status)
  {
    v14 = [(PDDPStatus *)status dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"status"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 6)
    {
      v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v17 = *(&off_1001F2898 + type);
    }
    [v4 setObject:v17 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  uint64_t requestStatus = self->_requestStatus;
  if (requestStatus >= 5)
  {
    v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_requestStatus];
  }
  else
  {
    v19 = *(&off_1001F28C8 + requestStatus);
  }
  [v4 setObject:v19 forKey:@"request_status"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_25:
    uint64_t approvalStatus = self->_approvalStatus;
    if (approvalStatus >= 6)
    {
      v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_approvalStatus];
    }
    else
    {
      v21 = *(&off_1001F28F0 + approvalStatus);
    }
    [v4 setObject:v21 forKey:@"approval_status"];
  }
LABEL_29:
  requestor = self->_requestor;
  if (requestor)
  {
    v23 = [(PDDPAdminRequestRequestor *)requestor dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"requestor"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v24 = +[NSNumber numberWithUnsignedInt:self->_options];
    [v4 setObject:v24 forKey:@"options"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundle_identifier"];
  }
  adminRequestAccountIds = self->_adminRequestAccountIds;
  if (adminRequestAccountIds) {
    [v4 setObject:adminRequestAccountIds forKey:@"admin_request_account_ids"];
  }
  adminNote = self->_adminNote;
  if (adminNote) {
    [v4 setObject:adminNote forKey:@"admin_note"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003FCD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_adminRequestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_orgId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateCompleted) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_status) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_requestor) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_adminRequestAccountIds;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_adminNote) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_adminRequestId)
  {
    objc_msgSend(v4, "setAdminRequestId:");
    id v4 = v10;
  }
  if (self->_orgId)
  {
    objc_msgSend(v10, "setOrgId:");
    id v4 = v10;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v10, "setDateCreated:");
    id v4 = v10;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v10, "setDateLastModified:");
    id v4 = v10;
  }
  if (self->_dateCompleted)
  {
    objc_msgSend(v10, "setDateCompleted:");
    id v4 = v10;
  }
  if (self->_status)
  {
    objc_msgSend(v10, "setStatus:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_type;
    *((unsigned char *)v4 + 116) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 22) = self->_requestStatus;
  *((unsigned char *)v4 + 116) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_16:
    *((_DWORD *)v4 + 8) = self->_approvalStatus;
    *((unsigned char *)v4 + 116) |= 1u;
  }
LABEL_17:
  if (self->_requestor)
  {
    objc_msgSend(v10, "setRequestor:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_options;
    *((unsigned char *)v4 + 116) |= 2u;
  }
  if (self->_bundleIdentifier) {
    objc_msgSend(v10, "setBundleIdentifier:");
  }
  if ([(PDDPAdminRequestDetails *)self adminRequestAccountIdsCount])
  {
    [v10 clearAdminRequestAccountIds];
    unint64_t v6 = [(PDDPAdminRequestDetails *)self adminRequestAccountIdsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPAdminRequestDetails *)self adminRequestAccountIdsAtIndex:i];
        [v10 addAdminRequestAccountIds:v9];
      }
    }
  }
  if (self->_adminNote) {
    objc_msgSend(v10, "setAdminNote:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_adminRequestId copyWithZone:a3];
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_orgId copyWithZone:a3];
  uint64_t v9 = (void *)v5[10];
  v5[10] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  long long v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v13 = (void *)v5[8];
  v5[8] = v12;

  id v14 = [(PDDPDate *)self->_dateCompleted copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  id v16 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v17 = (void *)v5[13];
  v5[13] = v16;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_type;
    *((unsigned char *)v5 + 116) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 22) = self->_requestStatus;
  *((unsigned char *)v5 + 116) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)v5 + 8) = self->_approvalStatus;
    *((unsigned char *)v5 + 116) |= 1u;
  }
LABEL_5:
  id v19 = [(PDDPAdminRequestRequestor *)self->_requestor copyWithZone:a3];
  v20 = (void *)v5[12];
  v5[12] = v19;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_options;
    *((unsigned char *)v5 + 116) |= 2u;
  }
  id v21 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v22 = (void *)v5[5];
  v5[5] = v21;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v23 = self->_adminRequestAccountIds;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [v5 addAdminRequestAccountIds:v28];
      }
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v25);
  }

  id v29 = [(NSString *)self->_adminNote copyWithZone:a3];
  v30 = (void *)v5[1];
  v5[1] = v29;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  adminRequestId = self->_adminRequestId;
  if ((unint64_t)adminRequestId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](adminRequestId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  orgId = self->_orgId;
  if ((unint64_t)orgId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](orgId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 7))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_43;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 8))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_43;
    }
  }
  dateCompleted = self->_dateCompleted;
  if ((unint64_t)dateCompleted | *((void *)v4 + 6))
  {
    if (!-[PDDPDate isEqual:](dateCompleted, "isEqual:")) {
      goto LABEL_43;
    }
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 13))
  {
    if (!-[PDDPStatus isEqual:](status, "isEqual:")) {
      goto LABEL_43;
    }
  }
  char has = (char)self->_has;
  char v12 = *((unsigned char *)v4 + 116);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) == 0 || self->_type != *((_DWORD *)v4 + 28)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0 || self->_requestStatus != *((_DWORD *)v4 + 22)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_43;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_approvalStatus != *((_DWORD *)v4 + 8)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_43;
  }
  requestor = self->_requestor;
  if ((unint64_t)requestor | *((void *)v4 + 12))
  {
    if (!-[PDDPAdminRequestRequestor isEqual:](requestor, "isEqual:"))
    {
LABEL_43:
      unsigned __int8 v17 = 0;
      goto LABEL_44;
    }
    char has = (char)self->_has;
    char v12 = *((unsigned char *)v4 + 116);
  }
  if ((has & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_options != *((_DWORD *)v4 + 18)) {
      goto LABEL_43;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_43;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](bundleIdentifier, "isEqual:"))
  {
    goto LABEL_43;
  }
  adminRequestAccountIds = self->_adminRequestAccountIds;
  if ((unint64_t)adminRequestAccountIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](adminRequestAccountIds, "isEqual:")) {
      goto LABEL_43;
    }
  }
  adminNote = self->_adminNote;
  if ((unint64_t)adminNote | *((void *)v4 + 1)) {
    unsigned __int8 v17 = -[NSString isEqual:](adminNote, "isEqual:");
  }
  else {
    unsigned __int8 v17 = 1;
  }
LABEL_44:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_adminRequestId hash];
  NSUInteger v15 = [(NSString *)self->_orgId hash];
  unint64_t v3 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v4 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v5 = [(PDDPDate *)self->_dateCompleted hash];
  unint64_t v6 = [(PDDPStatus *)self->_status hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v7 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_requestStatus;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_approvalStatus;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v9 = 0;
LABEL_8:
  unint64_t v10 = [(PDDPAdminRequestRequestor *)self->_requestor hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_options;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_bundleIdentifier hash];
  unint64_t v13 = v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_adminRequestAccountIds hash];
  return v13 ^ [(NSString *)self->_adminNote hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[PDDPAdminRequestDetails setAdminRequestId:](self, "setAdminRequestId:");
  }
  if (*((void *)v4 + 10)) {
    -[PDDPAdminRequestDetails setOrgId:](self, "setOrgId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 7);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPAdminRequestDetails setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 8);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPAdminRequestDetails setDateLastModified:](self, "setDateLastModified:");
  }
  dateCompleted = self->_dateCompleted;
  uint64_t v10 = *((void *)v4 + 6);
  if (dateCompleted)
  {
    if (v10) {
      -[PDDPDate mergeFrom:](dateCompleted, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPAdminRequestDetails setDateCompleted:](self, "setDateCompleted:");
  }
  status = self->_status;
  uint64_t v12 = *((void *)v4 + 13);
  if (status)
  {
    if (v12) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPAdminRequestDetails setStatus:](self, "setStatus:");
  }
  char v13 = *((unsigned char *)v4 + 116);
  if ((v13 & 8) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 8u;
    char v13 = *((unsigned char *)v4 + 116);
    if ((v13 & 4) == 0)
    {
LABEL_27:
      if ((v13 & 1) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_uint64_t requestStatus = *((_DWORD *)v4 + 22);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 116))
  {
LABEL_28:
    self->_uint64_t approvalStatus = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_29:
  requestor = self->_requestor;
  uint64_t v15 = *((void *)v4 + 12);
  if (requestor)
  {
    if (v15) {
      -[PDDPAdminRequestRequestor mergeFrom:](requestor, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[PDDPAdminRequestDetails setRequestor:](self, "setRequestor:");
  }
  if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    self->_options = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5)) {
    -[PDDPAdminRequestDetails setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 2);
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[PDDPAdminRequestDetails addAdminRequestAccountIds:](self, "addAdminRequestAccountIds:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 1)) {
    -[PDDPAdminRequestDetails setAdminNote:](self, "setAdminNote:");
  }
}

- (NSString)adminRequestId
{
  return self->_adminRequestId;
}

- (void)setAdminRequestId:(id)a3
{
}

- (NSString)orgId
{
  return self->_orgId;
}

- (void)setOrgId:(id)a3
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

- (PDDPDate)dateCompleted
{
  return self->_dateCompleted;
}

- (void)setDateCompleted:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (PDDPAdminRequestRequestor)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(id)a3
{
}

- (unsigned)options
{
  return self->_options;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSMutableArray)adminRequestAccountIds
{
  return self->_adminRequestAccountIds;
}

- (void)setAdminRequestAccountIds:(id)a3
{
}

- (NSString)adminNote
{
  return self->_adminNote;
}

- (void)setAdminNote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dateCompleted, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_adminRequestId, 0);
  objc_storeStrong((id *)&self->_adminRequestAccountIds, 0);

  objc_storeStrong((id *)&self->_adminNote, 0);
}

@end