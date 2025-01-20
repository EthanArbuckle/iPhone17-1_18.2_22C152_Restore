@interface BMPBScreenTimeRequestEvent
- (BOOL)hasApprovalTime;
- (BOOL)hasBundleID;
- (BOOL)hasEventTime;
- (BOOL)hasIsActionUserDevice;
- (BOOL)hasKind;
- (BOOL)hasRequestID;
- (BOOL)hasRequesterDSID;
- (BOOL)hasResponderDSID;
- (BOOL)hasStatus;
- (BOOL)hasWebsitePath;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)requestID;
- (NSString)requesterDSID;
- (NSString)responderDSID;
- (NSString)websitePath;
- (double)eventTime;
- (id)approvalTimeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kindAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsApprovalTime:(id)a3;
- (int)StringAsKind:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)approvalTime;
- (int)kind;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApprovalTime:(int)a3;
- (void)setBundleID:(id)a3;
- (void)setEventTime:(double)a3;
- (void)setHasApprovalTime:(BOOL)a3;
- (void)setHasEventTime:(BOOL)a3;
- (void)setHasIsActionUserDevice:(BOOL)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsActionUserDevice:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setRequestID:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setResponderDSID:(id)a3;
- (void)setStatus:(int)a3;
- (void)setWebsitePath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBScreenTimeRequestEvent

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setEventTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRequesterDSID
{
  return self->_requesterDSID != 0;
}

- (BOOL)hasResponderDSID
{
  return self->_responderDSID != 0;
}

- (int)kind
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_kind;
  }
  else {
    return 0;
  }
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKind
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)kindAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D71A0 + a3);
  }

  return v3;
}

- (int)StringAsKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"website"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"app"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D71B8 + a3);
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"pending"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"declined"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"approved"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)approvalTime
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_approvalTime;
  }
  else {
    return 0;
  }
}

- (void)setApprovalTime:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_approvalTime = a3;
}

- (void)setHasApprovalTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApprovalTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)approvalTimeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D71D8 + a3);
  }

  return v3;
}

- (int)StringAsApprovalTime:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"time15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"time60"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"allDay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasWebsitePath
{
  return self->_websitePath != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isActionUserDevice = a3;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsActionUserDevice
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBScreenTimeRequestEvent;
  int v4 = [(BMPBScreenTimeRequestEvent *)&v8 description];
  v5 = [(BMPBScreenTimeRequestEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_eventTime];
    [v4 setObject:v6 forKey:@"eventTime"];
  }
  requesterDSID = self->_requesterDSID;
  if (requesterDSID) {
    [v4 setObject:requesterDSID forKey:@"requesterDSID"];
  }
  responderDSID = self->_responderDSID;
  if (responderDSID) {
    [v4 setObject:responderDSID forKey:@"responderDSID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t kind = self->_kind;
    if (kind >= 3)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_kind);
    }
    else
    {
      v11 = *(&off_1E55D71A0 + kind);
    }
    [v4 setObject:v11 forKey:@"kind"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  uint64_t status = self->_status;
  if (status >= 4)
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
  }
  else
  {
    v13 = *(&off_1E55D71B8 + status);
  }
  [v4 setObject:v13 forKey:@"status"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_21:
    uint64_t approvalTime = self->_approvalTime;
    if (approvalTime >= 4)
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_approvalTime);
    }
    else
    {
      v15 = *(&off_1E55D71D8 + approvalTime);
    }
    [v4 setObject:v15 forKey:@"approvalTime"];
  }
LABEL_25:
  websitePath = self->_websitePath;
  if (websitePath) {
    [v4 setObject:websitePath forKey:@"websitePath"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_isActionUserDevice];
    [v4 setObject:v18 forKey:@"isActionUserDevice"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBScreenTimeRequestEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_requesterDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_responderDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_websitePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_eventTime;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  if (self->_requesterDSID)
  {
    objc_msgSend(v6, "setRequesterDSID:");
    id v4 = v6;
  }
  if (self->_responderDSID)
  {
    objc_msgSend(v6, "setResponderDSID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_kind;
    *((unsigned char *)v4 + 84) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 16) = self->_status;
  *((unsigned char *)v4 + 84) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 4) = self->_approvalTime;
    *((unsigned char *)v4 + 84) |= 2u;
  }
LABEL_13:
  if (self->_websitePath)
  {
    objc_msgSend(v6, "setWebsitePath:");
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_isActionUserDevice;
    *((unsigned char *)v4 + 84) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestID copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_eventTime;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_requesterDSID copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_responderDSID copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_kind;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 64) = self->_status;
  *(unsigned char *)(v5 + 84) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_approvalTime;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
LABEL_7:
  uint64_t v13 = [(NSString *)self->_websitePath copyWithZone:a3];
  v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_bundleID copyWithZone:a3];
  v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_isActionUserDevice;
    *(unsigned char *)(v5 + 84) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_eventTime != *((double *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_34;
  }
  requesterDSID = self->_requesterDSID;
  if ((unint64_t)requesterDSID | *((void *)v4 + 6)
    && !-[NSString isEqual:](requesterDSID, "isEqual:"))
  {
    goto LABEL_34;
  }
  responderDSID = self->_responderDSID;
  if ((unint64_t)responderDSID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](responderDSID, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_kind != *((_DWORD *)v4 + 8)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0 || self->_status != *((_DWORD *)v4 + 16)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_approvalTime != *((_DWORD *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_34;
  }
  websitePath = self->_websitePath;
  if ((unint64_t)websitePath | *((void *)v4 + 9)
    && !-[NSString isEqual:](websitePath, "isEqual:"))
  {
    goto LABEL_34;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_34;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 84) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x10) == 0)
    {
LABEL_34:
      BOOL v10 = 0;
      goto LABEL_35;
    }
    if (self->_isActionUserDevice)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_34;
    }
    BOOL v10 = 1;
  }
LABEL_35:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v17 = [(NSString *)self->_requestID hash];
  if (*(unsigned char *)&self->_has)
  {
    double eventTime = self->_eventTime;
    double v5 = -eventTime;
    if (eventTime >= 0.0) {
      double v5 = self->_eventTime;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_requesterDSID hash];
  NSUInteger v9 = [(NSString *)self->_responderDSID hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v10 = 2654435761 * self->_kind;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_status;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_approvalTime;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = 0;
LABEL_16:
  NSUInteger v13 = [(NSString *)self->_websitePath hash];
  NSUInteger v14 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_isActionUserDevice;
  }
  else {
    uint64_t v15 = 0;
  }
  return v3 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[BMPBScreenTimeRequestEvent setRequestID:](self, "setRequestID:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_double eventTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBScreenTimeRequestEvent setRequesterDSID:](self, "setRequesterDSID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBScreenTimeRequestEvent setResponderDSID:](self, "setResponderDSID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t kind = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_uint64_t status = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
LABEL_12:
    self->_uint64_t approvalTime = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_13:
  if (*((void *)v4 + 9))
  {
    -[BMPBScreenTimeRequestEvent setWebsitePath:](self, "setWebsitePath:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBScreenTimeRequestEvent setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
    self->_isActionUserDevice = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (void)setResponderDSID:(id)a3
{
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (void)setWebsitePath:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end