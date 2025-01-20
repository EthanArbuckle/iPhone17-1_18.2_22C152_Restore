@interface PDDPEEPayload
- (BOOL)hasAction;
- (BOOL)hasAdminRequest;
- (BOOL)hasAdminRequestAccount;
- (BOOL)hasClassInfo;
- (BOOL)hasClassMember;
- (BOOL)hasGroupInfo;
- (BOOL)hasGroupMember;
- (BOOL)hasLocation;
- (BOOL)hasOrganization;
- (BOOL)hasPayloadSize;
- (BOOL)hasPerson;
- (BOOL)hasRequestZone;
- (BOOL)hasResponseZone;
- (BOOL)hasRole;
- (BOOL)hasStatus;
- (BOOL)hasTempObjectId;
- (BOOL)hasTempParentObjectId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tempObjectId;
- (NSString)tempParentObjectId;
- (PDDPAdminRequestAccount)adminRequestAccount;
- (PDDPAdminRequestDetails)adminRequest;
- (PDDPClass)classInfo;
- (PDDPClassMember)classMember;
- (PDDPEERequestZone)requestZone;
- (PDDPEEResponseZone)responseZone;
- (PDDPGroup)groupInfo;
- (PDDPGroupMember)groupMember;
- (PDDPLocation)location;
- (PDDPOrganization)organization;
- (PDDPPerson)person;
- (PDDPRole)role;
- (PDDPStatus)status;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsAction:(id)a3;
- (int)StringAsType:(id)a3;
- (int)action;
- (int)payloadSize;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setAdminRequest:(id)a3;
- (void)setAdminRequestAccount:(id)a3;
- (void)setClassInfo:(id)a3;
- (void)setClassMember:(id)a3;
- (void)setGroupInfo:(id)a3;
- (void)setGroupMember:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasPayloadSize:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setOrganization:(id)a3;
- (void)setPayloadSize:(int)a3;
- (void)setPerson:(id)a3;
- (void)setRequestZone:(id)a3;
- (void)setResponseZone:(id)a3;
- (void)setRole:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTempObjectId:(id)a3;
- (void)setTempParentObjectId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEEPayload

- (void)setPayloadSize:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)action
{
  if (*(unsigned char *)&self->_has) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F6268 + a3);
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ACTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UPSERT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DELETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REPLACE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F6288 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST_ZONE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESPONSE_ZONE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PERSON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CLASS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CLASS_MEMBER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ROLE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ORGANIZATION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ADMIN_REQUEST"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ADMIN_REQUEST_ACCOUNT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"GROUP"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"GROUP_MEMBER"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasRequestZone
{
  return self->_requestZone != 0;
}

- (BOOL)hasResponseZone
{
  return self->_responseZone != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (BOOL)hasClassInfo
{
  return self->_classInfo != 0;
}

- (BOOL)hasClassMember
{
  return self->_classMember != 0;
}

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (BOOL)hasTempObjectId
{
  return self->_tempObjectId != 0;
}

- (BOOL)hasTempParentObjectId
{
  return self->_tempParentObjectId != 0;
}

- (BOOL)hasOrganization
{
  return self->_organization != 0;
}

- (BOOL)hasAdminRequest
{
  return self->_adminRequest != 0;
}

- (BOOL)hasAdminRequestAccount
{
  return self->_adminRequestAccount != 0;
}

- (BOOL)hasGroupInfo
{
  return self->_groupInfo != 0;
}

- (BOOL)hasGroupMember
{
  return self->_groupMember != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEEPayload;
  id v3 = [(PDDPEEPayload *)&v7 description];
  int v4 = [(PDDPEEPayload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithInt:self->_payloadSize];
    [v3 setObject:v5 forKey:@"payload_size"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t action = self->_action;
  if (action >= 4)
  {
    objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_action];
  }
  else
  {
    objc_super v7 = *(&off_1001F6268 + action);
  }
  [v3 setObject:v7 forKey:@"action"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    uint64_t type = self->_type;
    if (type >= 0xE)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v9 = *(&off_1001F6288 + type);
    }
    [v3 setObject:v9 forKey:@"type"];
  }
LABEL_14:
  status = self->_status;
  if (status)
  {
    v11 = [(PDDPStatus *)status dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"status"];
  }
  requestZone = self->_requestZone;
  if (requestZone)
  {
    v13 = [(PDDPEERequestZone *)requestZone dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"request_zone"];
  }
  responseZone = self->_responseZone;
  if (responseZone)
  {
    v15 = [(PDDPEEResponseZone *)responseZone dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"response_zone"];
  }
  location = self->_location;
  if (location)
  {
    v17 = [(PDDPLocation *)location dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"location"];
  }
  person = self->_person;
  if (person)
  {
    v19 = [(PDDPPerson *)person dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"person"];
  }
  classInfo = self->_classInfo;
  if (classInfo)
  {
    v21 = [(PDDPClass *)classInfo dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"class_info"];
  }
  classMember = self->_classMember;
  if (classMember)
  {
    v23 = [(PDDPClassMember *)classMember dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"class_member"];
  }
  role = self->_role;
  if (role)
  {
    v25 = [(PDDPRole *)role dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"role"];
  }
  tempObjectId = self->_tempObjectId;
  if (tempObjectId) {
    [v3 setObject:tempObjectId forKey:@"temp_object_id"];
  }
  tempParentObjectId = self->_tempParentObjectId;
  if (tempParentObjectId) {
    [v3 setObject:tempParentObjectId forKey:@"temp_parent_object_id"];
  }
  organization = self->_organization;
  if (organization)
  {
    v29 = [(PDDPOrganization *)organization dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"organization"];
  }
  adminRequest = self->_adminRequest;
  if (adminRequest)
  {
    v31 = [(PDDPAdminRequestDetails *)adminRequest dictionaryRepresentation];
    [v3 setObject:v31 forKey:@"admin_request"];
  }
  adminRequestAccount = self->_adminRequestAccount;
  if (adminRequestAccount)
  {
    v33 = [(PDDPAdminRequestAccount *)adminRequestAccount dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"admin_request_account"];
  }
  groupInfo = self->_groupInfo;
  if (groupInfo)
  {
    v35 = [(PDDPGroup *)groupInfo dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"group_info"];
  }
  groupMember = self->_groupMember;
  if (groupMember)
  {
    v37 = [(PDDPGroupMember *)groupMember dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"group_member"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10015BA14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requestZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_responseZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_person)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_classMember)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_role)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_tempObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_tempParentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_organization)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_adminRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_adminRequestAccount)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_groupInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_groupMember)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[20] = self->_payloadSize;
    *((unsigned char *)v4 + 148) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_action;
  *((unsigned char *)v4 + 148) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[36] = self->_type;
    *((unsigned char *)v4 + 148) |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_status)
  {
    objc_msgSend(v4, "setStatus:");
    id v4 = v6;
  }
  if (self->_requestZone)
  {
    objc_msgSend(v6, "setRequestZone:");
    id v4 = v6;
  }
  if (self->_responseZone)
  {
    objc_msgSend(v6, "setResponseZone:");
    id v4 = v6;
  }
  if (self->_location)
  {
    objc_msgSend(v6, "setLocation:");
    id v4 = v6;
  }
  if (self->_person)
  {
    objc_msgSend(v6, "setPerson:");
    id v4 = v6;
  }
  if (self->_classInfo)
  {
    objc_msgSend(v6, "setClassInfo:");
    id v4 = v6;
  }
  if (self->_classMember)
  {
    objc_msgSend(v6, "setClassMember:");
    id v4 = v6;
  }
  if (self->_role)
  {
    objc_msgSend(v6, "setRole:");
    id v4 = v6;
  }
  if (self->_tempObjectId)
  {
    objc_msgSend(v6, "setTempObjectId:");
    id v4 = v6;
  }
  if (self->_tempParentObjectId)
  {
    objc_msgSend(v6, "setTempParentObjectId:");
    id v4 = v6;
  }
  if (self->_organization)
  {
    objc_msgSend(v6, "setOrganization:");
    id v4 = v6;
  }
  if (self->_adminRequest)
  {
    objc_msgSend(v6, "setAdminRequest:");
    id v4 = v6;
  }
  if (self->_adminRequestAccount)
  {
    objc_msgSend(v6, "setAdminRequestAccount:");
    id v4 = v6;
  }
  if (self->_groupInfo)
  {
    objc_msgSend(v6, "setGroupInfo:");
    id v4 = v6;
  }
  if (self->_groupMember)
  {
    objc_msgSend(v6, "setGroupMember:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 2) = self->_action;
    *((unsigned char *)v5 + 148) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 20) = self->_payloadSize;
  *((unsigned char *)v5 + 148) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 36) = self->_type;
    *((unsigned char *)v5 + 148) |= 4u;
  }
LABEL_5:
  id v8 = [(PDDPStatus *)self->_status copyWithZone:a3];
  v9 = (void *)v6[15];
  v6[15] = v8;

  id v10 = [(PDDPEERequestZone *)self->_requestZone copyWithZone:a3];
  v11 = (void *)v6[12];
  v6[12] = v10;

  id v12 = [(PDDPEEResponseZone *)self->_responseZone copyWithZone:a3];
  v13 = (void *)v6[13];
  v6[13] = v12;

  id v14 = [(PDDPLocation *)self->_location copyWithZone:a3];
  v15 = (void *)v6[8];
  v6[8] = v14;

  id v16 = [(PDDPPerson *)self->_person copyWithZone:a3];
  v17 = (void *)v6[11];
  v6[11] = v16;

  id v18 = [(PDDPClass *)self->_classInfo copyWithZone:a3];
  v19 = (void *)v6[4];
  v6[4] = v18;

  id v20 = [(PDDPClassMember *)self->_classMember copyWithZone:a3];
  v21 = (void *)v6[5];
  v6[5] = v20;

  id v22 = [(PDDPRole *)self->_role copyWithZone:a3];
  v23 = (void *)v6[14];
  v6[14] = v22;

  id v24 = [(NSString *)self->_tempObjectId copyWithZone:a3];
  v25 = (void *)v6[16];
  v6[16] = v24;

  id v26 = [(NSString *)self->_tempParentObjectId copyWithZone:a3];
  v27 = (void *)v6[17];
  v6[17] = v26;

  id v28 = [(PDDPOrganization *)self->_organization copyWithZone:a3];
  v29 = (void *)v6[9];
  v6[9] = v28;

  id v30 = [(PDDPAdminRequestDetails *)self->_adminRequest copyWithZone:a3];
  v31 = (void *)v6[2];
  v6[2] = v30;

  id v32 = [(PDDPAdminRequestAccount *)self->_adminRequestAccount copyWithZone:a3];
  v33 = (void *)v6[3];
  v6[3] = v32;

  id v34 = [(PDDPGroup *)self->_groupInfo copyWithZone:a3];
  v35 = (void *)v6[6];
  v6[6] = v34;

  id v36 = [(PDDPGroupMember *)self->_groupMember copyWithZone:a3];
  v37 = (void *)v6[7];
  v6[7] = v36;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_payloadSize != *((_DWORD *)v4 + 20)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
LABEL_47:
    unsigned __int8 v20 = 0;
    goto LABEL_48;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_action != *((_DWORD *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0 || self->_type != *((_DWORD *)v4 + 36)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 4) != 0)
  {
    goto LABEL_47;
  }
  status = self->_status;
  if ((unint64_t)status | *((void *)v4 + 15) && !-[PDDPStatus isEqual:](status, "isEqual:")) {
    goto LABEL_47;
  }
  requestZone = self->_requestZone;
  if ((unint64_t)requestZone | *((void *)v4 + 12))
  {
    if (!-[PDDPEERequestZone isEqual:](requestZone, "isEqual:")) {
      goto LABEL_47;
    }
  }
  responseZone = self->_responseZone;
  if ((unint64_t)responseZone | *((void *)v4 + 13))
  {
    if (!-[PDDPEEResponseZone isEqual:](responseZone, "isEqual:")) {
      goto LABEL_47;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 8))
  {
    if (!-[PDDPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_47;
    }
  }
  person = self->_person;
  if ((unint64_t)person | *((void *)v4 + 11))
  {
    if (!-[PDDPPerson isEqual:](person, "isEqual:")) {
      goto LABEL_47;
    }
  }
  classInfo = self->_classInfo;
  if ((unint64_t)classInfo | *((void *)v4 + 4))
  {
    if (!-[PDDPClass isEqual:](classInfo, "isEqual:")) {
      goto LABEL_47;
    }
  }
  classMember = self->_classMember;
  if ((unint64_t)classMember | *((void *)v4 + 5))
  {
    if (!-[PDDPClassMember isEqual:](classMember, "isEqual:")) {
      goto LABEL_47;
    }
  }
  role = self->_role;
  if ((unint64_t)role | *((void *)v4 + 14))
  {
    if (!-[PDDPRole isEqual:](role, "isEqual:")) {
      goto LABEL_47;
    }
  }
  tempObjectId = self->_tempObjectId;
  if ((unint64_t)tempObjectId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](tempObjectId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  tempParentObjectId = self->_tempParentObjectId;
  if ((unint64_t)tempParentObjectId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](tempParentObjectId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  organization = self->_organization;
  if ((unint64_t)organization | *((void *)v4 + 9))
  {
    if (!-[PDDPOrganization isEqual:](organization, "isEqual:")) {
      goto LABEL_47;
    }
  }
  adminRequest = self->_adminRequest;
  if ((unint64_t)adminRequest | *((void *)v4 + 2))
  {
    if (!-[PDDPAdminRequestDetails isEqual:](adminRequest, "isEqual:")) {
      goto LABEL_47;
    }
  }
  adminRequestAccount = self->_adminRequestAccount;
  if ((unint64_t)adminRequestAccount | *((void *)v4 + 3))
  {
    if (!-[PDDPAdminRequestAccount isEqual:](adminRequestAccount, "isEqual:")) {
      goto LABEL_47;
    }
  }
  groupInfo = self->_groupInfo;
  if ((unint64_t)groupInfo | *((void *)v4 + 6))
  {
    if (!-[PDDPGroup isEqual:](groupInfo, "isEqual:")) {
      goto LABEL_47;
    }
  }
  groupMember = self->_groupMember;
  if ((unint64_t)groupMember | *((void *)v4 + 7)) {
    unsigned __int8 v20 = -[PDDPGroupMember isEqual:](groupMember, "isEqual:");
  }
  else {
    unsigned __int8 v20 = 1;
  }
LABEL_48:

  return v20;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_payloadSize;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_action;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_type;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(PDDPStatus *)self->_status hash];
  unint64_t v7 = [(PDDPEERequestZone *)self->_requestZone hash];
  unint64_t v8 = v6 ^ v7 ^ [(PDDPEEResponseZone *)self->_responseZone hash];
  unint64_t v9 = [(PDDPLocation *)self->_location hash];
  unint64_t v10 = v9 ^ [(PDDPPerson *)self->_person hash];
  unint64_t v11 = v8 ^ v10 ^ [(PDDPClass *)self->_classInfo hash];
  unint64_t v12 = [(PDDPClassMember *)self->_classMember hash];
  unint64_t v13 = v12 ^ [(PDDPRole *)self->_role hash];
  unint64_t v14 = v13 ^ [(NSString *)self->_tempObjectId hash];
  unint64_t v15 = v11 ^ v14 ^ [(NSString *)self->_tempParentObjectId hash];
  unint64_t v16 = [(PDDPOrganization *)self->_organization hash];
  unint64_t v17 = v16 ^ [(PDDPAdminRequestDetails *)self->_adminRequest hash];
  unint64_t v18 = v17 ^ [(PDDPAdminRequestAccount *)self->_adminRequestAccount hash];
  unint64_t v19 = v18 ^ [(PDDPGroup *)self->_groupInfo hash];
  return v15 ^ v19 ^ [(PDDPGroupMember *)self->_groupMember hash];
}

- (void)mergeFrom:(id)a3
{
  id v31 = a3;
  char v4 = *((unsigned char *)v31 + 148);
  if ((v4 & 2) != 0)
  {
    self->_payloadSize = *((_DWORD *)v31 + 20);
    *(unsigned char *)&self->_has |= 2u;
    char v4 = *((unsigned char *)v31 + 148);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v31 + 148) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t action = *((_DWORD *)v31 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v31 + 148) & 4) != 0)
  {
LABEL_4:
    self->_uint64_t type = *((_DWORD *)v31 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  status = self->_status;
  uint64_t v6 = *((void *)v31 + 15);
  if (status)
  {
    if (v6) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPEEPayload setStatus:](self, "setStatus:");
  }
  requestZone = self->_requestZone;
  uint64_t v8 = *((void *)v31 + 12);
  if (requestZone)
  {
    if (v8) {
      -[PDDPEERequestZone mergeFrom:](requestZone, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPEEPayload setRequestZone:](self, "setRequestZone:");
  }
  responseZone = self->_responseZone;
  uint64_t v10 = *((void *)v31 + 13);
  if (responseZone)
  {
    if (v10) {
      -[PDDPEEResponseZone mergeFrom:](responseZone, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPEEPayload setResponseZone:](self, "setResponseZone:");
  }
  location = self->_location;
  uint64_t v12 = *((void *)v31 + 8);
  if (location)
  {
    if (v12) {
      -[PDDPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPEEPayload setLocation:](self, "setLocation:");
  }
  person = self->_person;
  uint64_t v14 = *((void *)v31 + 11);
  if (person)
  {
    if (v14) {
      -[PDDPPerson mergeFrom:](person, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPEEPayload setPerson:](self, "setPerson:");
  }
  classInfo = self->_classInfo;
  uint64_t v16 = *((void *)v31 + 4);
  if (classInfo)
  {
    if (v16) {
      -[PDDPClass mergeFrom:](classInfo, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[PDDPEEPayload setClassInfo:](self, "setClassInfo:");
  }
  classMember = self->_classMember;
  uint64_t v18 = *((void *)v31 + 5);
  if (classMember)
  {
    if (v18) {
      -[PDDPClassMember mergeFrom:](classMember, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[PDDPEEPayload setClassMember:](self, "setClassMember:");
  }
  role = self->_role;
  uint64_t v20 = *((void *)v31 + 14);
  if (role)
  {
    if (v20) {
      -[PDDPRole mergeFrom:](role, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[PDDPEEPayload setRole:](self, "setRole:");
  }
  if (*((void *)v31 + 16)) {
    -[PDDPEEPayload setTempObjectId:](self, "setTempObjectId:");
  }
  if (*((void *)v31 + 17)) {
    -[PDDPEEPayload setTempParentObjectId:](self, "setTempParentObjectId:");
  }
  organization = self->_organization;
  uint64_t v22 = *((void *)v31 + 9);
  if (organization)
  {
    if (v22) {
      -[PDDPOrganization mergeFrom:](organization, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[PDDPEEPayload setOrganization:](self, "setOrganization:");
  }
  adminRequest = self->_adminRequest;
  uint64_t v24 = *((void *)v31 + 2);
  if (adminRequest)
  {
    if (v24) {
      -[PDDPAdminRequestDetails mergeFrom:](adminRequest, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[PDDPEEPayload setAdminRequest:](self, "setAdminRequest:");
  }
  adminRequestAccount = self->_adminRequestAccount;
  uint64_t v26 = *((void *)v31 + 3);
  if (adminRequestAccount)
  {
    if (v26) {
      -[PDDPAdminRequestAccount mergeFrom:](adminRequestAccount, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[PDDPEEPayload setAdminRequestAccount:](self, "setAdminRequestAccount:");
  }
  groupInfo = self->_groupInfo;
  uint64_t v28 = *((void *)v31 + 6);
  if (groupInfo)
  {
    if (v28) {
      -[PDDPGroup mergeFrom:](groupInfo, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[PDDPEEPayload setGroupInfo:](self, "setGroupInfo:");
  }
  groupMember = self->_groupMember;
  uint64_t v30 = *((void *)v31 + 7);
  if (groupMember)
  {
    if (v30) {
      -[PDDPGroupMember mergeFrom:](groupMember, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[PDDPEEPayload setGroupMember:](self, "setGroupMember:");
  }
}

- (int)payloadSize
{
  return self->_payloadSize;
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (PDDPEERequestZone)requestZone
{
  return self->_requestZone;
}

- (void)setRequestZone:(id)a3
{
}

- (PDDPEEResponseZone)responseZone
{
  return self->_responseZone;
}

- (void)setResponseZone:(id)a3
{
}

- (PDDPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (PDDPPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (PDDPClass)classInfo
{
  return self->_classInfo;
}

- (void)setClassInfo:(id)a3
{
}

- (PDDPClassMember)classMember
{
  return self->_classMember;
}

- (void)setClassMember:(id)a3
{
}

- (PDDPRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSString)tempObjectId
{
  return self->_tempObjectId;
}

- (void)setTempObjectId:(id)a3
{
}

- (NSString)tempParentObjectId
{
  return self->_tempParentObjectId;
}

- (void)setTempParentObjectId:(id)a3
{
}

- (PDDPOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (PDDPAdminRequestDetails)adminRequest
{
  return self->_adminRequest;
}

- (void)setAdminRequest:(id)a3
{
}

- (PDDPAdminRequestAccount)adminRequestAccount
{
  return self->_adminRequestAccount;
}

- (void)setAdminRequestAccount:(id)a3
{
}

- (PDDPGroup)groupInfo
{
  return self->_groupInfo;
}

- (void)setGroupInfo:(id)a3
{
}

- (PDDPGroupMember)groupMember
{
  return self->_groupMember;
}

- (void)setGroupMember:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempParentObjectId, 0);
  objc_storeStrong((id *)&self->_tempObjectId, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_responseZone, 0);
  objc_storeStrong((id *)&self->_requestZone, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_groupMember, 0);
  objc_storeStrong((id *)&self->_groupInfo, 0);
  objc_storeStrong((id *)&self->_classMember, 0);
  objc_storeStrong((id *)&self->_classInfo, 0);
  objc_storeStrong((id *)&self->_adminRequestAccount, 0);

  objc_storeStrong((id *)&self->_adminRequest, 0);
}

@end