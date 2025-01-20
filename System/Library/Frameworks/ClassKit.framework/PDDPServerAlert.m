@interface PDDPServerAlert
+ (Class)otherButtonInfosType;
- (BOOL)hasAlertId;
- (BOOL)hasDateCreated;
- (BOOL)hasDateExpires;
- (BOOL)hasDateLastModified;
- (BOOL)hasDefaultButtonInfo;
- (BOOL)hasDisplayRoles;
- (BOOL)hasDisplayType;
- (BOOL)hasMessage;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)otherButtonInfos;
- (NSString)alertId;
- (NSString)message;
- (NSString)title;
- (PDDPButtonInfo)defaultButtonInfo;
- (PDDPDate)dateCreated;
- (PDDPDate)dateExpires;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)otherButtonInfosAtIndex:(unint64_t)a3;
- (int)displayRoles;
- (int)displayType;
- (unint64_t)hash;
- (unint64_t)otherButtonInfosCount;
- (void)addOtherButtonInfos:(id)a3;
- (void)clearOtherButtonInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlertId:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateExpires:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDefaultButtonInfo:(id)a3;
- (void)setDisplayRoles:(int)a3;
- (void)setDisplayType:(int)a3;
- (void)setHasDisplayRoles:(BOOL)a3;
- (void)setHasDisplayType:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setOtherButtonInfos:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPServerAlert

- (BOOL)hasAlertId
{
  return self->_alertId != 0;
}

- (void)setDisplayType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_displayType = a3;
}

- (void)setHasDisplayType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisplayType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDisplayRoles:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayRoles = a3;
}

- (void)setHasDisplayRoles:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayRoles
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasDateExpires
{
  return self->_dateExpires != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasDefaultButtonInfo
{
  return self->_defaultButtonInfo != 0;
}

- (void)clearOtherButtonInfos
{
}

- (void)addOtherButtonInfos:(id)a3
{
  id v4 = a3;
  otherButtonInfos = self->_otherButtonInfos;
  id v8 = v4;
  if (!otherButtonInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_otherButtonInfos;
    self->_otherButtonInfos = v6;

    id v4 = v8;
    otherButtonInfos = self->_otherButtonInfos;
  }
  [(NSMutableArray *)otherButtonInfos addObject:v4];
}

- (unint64_t)otherButtonInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_otherButtonInfos count];
}

- (id)otherButtonInfosAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_otherButtonInfos objectAtIndex:a3];
}

+ (Class)otherButtonInfosType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPServerAlert;
  char v3 = [(PDDPServerAlert *)&v7 description];
  id v4 = [(PDDPServerAlert *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  alertId = self->_alertId;
  if (alertId) {
    [v3 setObject:alertId forKey:@"alert_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_displayType];
    [v4 setObject:v7 forKey:@"display_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v8 = +[NSNumber numberWithInt:self->_displayRoles];
    [v4 setObject:v8 forKey:@"display_roles"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v10 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v12 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"date_last_modified"];
  }
  dateExpires = self->_dateExpires;
  if (dateExpires)
  {
    v14 = [(PDDPDate *)dateExpires dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"date_expires"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  message = self->_message;
  if (message) {
    [v4 setObject:message forKey:@"message"];
  }
  defaultButtonInfo = self->_defaultButtonInfo;
  if (defaultButtonInfo)
  {
    v18 = [(PDDPButtonInfo *)defaultButtonInfo dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"default_button_info"];
  }
  if ([(NSMutableArray *)self->_otherButtonInfos count])
  {
    id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_otherButtonInfos, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v20 = self->_otherButtonInfos;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (void)v27);
          [v19 addObject:v25];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }

    [v4 setObject:v19 forKey:@"other_button_infos"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BD5A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_alertId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateExpires) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
  if (self->_defaultButtonInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_otherButtonInfos;
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
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_alertId)
  {
    objc_msgSend(v4, "setAlertId:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_displayType;
    *((unsigned char *)v4 + 80) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 12) = self->_displayRoles;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_dateCreated) {
    objc_msgSend(v10, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v10, "setDateLastModified:");
  }
  if (self->_dateExpires) {
    objc_msgSend(v10, "setDateExpires:");
  }
  if (self->_title) {
    objc_msgSend(v10, "setTitle:");
  }
  if (self->_message) {
    objc_msgSend(v10, "setMessage:");
  }
  if (self->_defaultButtonInfo) {
    objc_msgSend(v10, "setDefaultButtonInfo:");
  }
  if ([(PDDPServerAlert *)self otherButtonInfosCount])
  {
    [v10 clearOtherButtonInfos];
    unint64_t v6 = [(PDDPServerAlert *)self otherButtonInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPServerAlert *)self otherButtonInfosAtIndex:i];
        [v10 addOtherButtonInfos:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_alertId copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_displayType;
    *((unsigned char *)v5 + 80) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 12) = self->_displayRoles;
    *((unsigned char *)v5 + 80) |= 1u;
  }
  id v9 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  id v10 = (void *)v5[2];
  v5[2] = v9;

  id v11 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v12 = (void *)v5[4];
  v5[4] = v11;

  id v13 = [(PDDPDate *)self->_dateExpires copyWithZone:a3];
  long long v14 = (void *)v5[3];
  v5[3] = v13;

  id v15 = [(NSString *)self->_title copyWithZone:a3];
  v16 = (void *)v5[9];
  v5[9] = v15;

  id v17 = [(NSString *)self->_message copyWithZone:a3];
  v18 = (void *)v5[7];
  v5[7] = v17;

  id v19 = [(PDDPButtonInfo *)self->_defaultButtonInfo copyWithZone:a3];
  v20 = (void *)v5[5];
  v5[5] = v19;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = self->_otherButtonInfos;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        [v5 addOtherButtonInfos:v26];
      }
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v23);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  alertId = self->_alertId;
  if ((unint64_t)alertId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](alertId, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_displayType != *((_DWORD *)v4 + 13)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_28:
    unsigned __int8 v13 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_displayRoles != *((_DWORD *)v4 + 12)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_28;
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 2) && !-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
    goto LABEL_28;
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_28;
    }
  }
  dateExpires = self->_dateExpires;
  if ((unint64_t)dateExpires | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateExpires, "isEqual:")) {
      goto LABEL_28;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_28;
    }
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](message, "isEqual:")) {
      goto LABEL_28;
    }
  }
  defaultButtonInfo = self->_defaultButtonInfo;
  if ((unint64_t)defaultButtonInfo | *((void *)v4 + 5))
  {
    if (!-[PDDPButtonInfo isEqual:](defaultButtonInfo, "isEqual:")) {
      goto LABEL_28;
    }
  }
  otherButtonInfos = self->_otherButtonInfos;
  if ((unint64_t)otherButtonInfos | *((void *)v4 + 8)) {
    unsigned __int8 v13 = -[NSMutableArray isEqual:](otherButtonInfos, "isEqual:");
  }
  else {
    unsigned __int8 v13 = 1;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alertId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_displayType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_displayRoles;
LABEL_6:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(PDDPDate *)self->_dateCreated hash];
  unint64_t v7 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v8 = v7 ^ [(PDDPDate *)self->_dateExpires hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_title hash];
  NSUInteger v10 = [(NSString *)self->_message hash];
  unint64_t v11 = v10 ^ [(PDDPButtonInfo *)self->_defaultButtonInfo hash];
  return v9 ^ v11 ^ (unint64_t)[(NSMutableArray *)self->_otherButtonInfos hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PDDPServerAlert setAlertId:](self, "setAlertId:");
  }
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 2) != 0)
  {
    self->_displayType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 80);
  }
  if (v5)
  {
    self->_displayRoles = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  dateCreated = self->_dateCreated;
  uint64_t v7 = *((void *)v4 + 2);
  if (dateCreated)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPServerAlert setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v9 = *((void *)v4 + 4);
  if (dateLastModified)
  {
    if (v9) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPServerAlert setDateLastModified:](self, "setDateLastModified:");
  }
  dateExpires = self->_dateExpires;
  uint64_t v11 = *((void *)v4 + 3);
  if (dateExpires)
  {
    if (v11) {
      -[PDDPDate mergeFrom:](dateExpires, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPServerAlert setDateExpires:](self, "setDateExpires:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPServerAlert setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 7)) {
    -[PDDPServerAlert setMessage:](self, "setMessage:");
  }
  defaultButtonInfo = self->_defaultButtonInfo;
  uint64_t v13 = *((void *)v4 + 5);
  if (defaultButtonInfo)
  {
    if (v13) {
      -[PDDPButtonInfo mergeFrom:](defaultButtonInfo, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PDDPServerAlert setDefaultButtonInfo:](self, "setDefaultButtonInfo:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 8);
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[PDDPServerAlert addOtherButtonInfos:](self, "addOtherButtonInfos:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (NSString)alertId
{
  return self->_alertId;
}

- (void)setAlertId:(id)a3
{
}

- (int)displayType
{
  return self->_displayType;
}

- (int)displayRoles
{
  return self->_displayRoles;
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

- (PDDPDate)dateExpires
{
  return self->_dateExpires;
}

- (void)setDateExpires:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (PDDPButtonInfo)defaultButtonInfo
{
  return self->_defaultButtonInfo;
}

- (void)setDefaultButtonInfo:(id)a3
{
}

- (NSMutableArray)otherButtonInfos
{
  return self->_otherButtonInfos;
}

- (void)setOtherButtonInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_otherButtonInfos, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_defaultButtonInfo, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateExpires, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_alertId, 0);
}

@end