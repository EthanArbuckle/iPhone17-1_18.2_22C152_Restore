@interface _INPBEventParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsEventOrganizer;
- (BOOL)hasIsUser;
- (BOOL)hasPerson;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEventOrganizer;
- (BOOL)isUser;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)person;
- (_INPBEventParticipant)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasIsEventOrganizer:(BOOL)a3;
- (void)setHasIsUser:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsEventOrganizer:(BOOL)a3;
- (void)setIsUser:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBEventParticipant

- (void).cxx_destruct
{
}

- (int)status
{
  return self->_status;
}

- (_INPBContact)person
{
  return self->_person;
}

- (BOOL)isUser
{
  return self->_isUser;
}

- (BOOL)isEventOrganizer
{
  return self->_isEventOrganizer;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBEventParticipant *)self hasIsEventOrganizer])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBEventParticipant isEventOrganizer](self, "isEventOrganizer"));
    [v3 setObject:v4 forKeyedSubscript:@"isEventOrganizer"];
  }
  if ([(_INPBEventParticipant *)self hasIsUser])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBEventParticipant isUser](self, "isUser"));
    [v3 setObject:v5 forKeyedSubscript:@"isUser"];
  }
  v6 = [(_INPBEventParticipant *)self person];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"person"];

  if ([(_INPBEventParticipant *)self hasStatus])
  {
    uint64_t v8 = [(_INPBEventParticipant *)self status];
    if ((v8 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5519790[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"status"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBEventParticipant *)self hasIsEventOrganizer]) {
    uint64_t v3 = 2654435761 * self->_isEventOrganizer;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBEventParticipant *)self hasIsUser]) {
    uint64_t v4 = 2654435761 * self->_isUser;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBContact *)self->_person hash];
  if ([(_INPBEventParticipant *)self hasStatus]) {
    uint64_t v6 = 2654435761 * self->_status;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  int v5 = [(_INPBEventParticipant *)self hasIsEventOrganizer];
  if (v5 != [v4 hasIsEventOrganizer]) {
    goto LABEL_17;
  }
  if ([(_INPBEventParticipant *)self hasIsEventOrganizer])
  {
    if ([v4 hasIsEventOrganizer])
    {
      int isEventOrganizer = self->_isEventOrganizer;
      if (isEventOrganizer != [v4 isEventOrganizer]) {
        goto LABEL_17;
      }
    }
  }
  int v7 = [(_INPBEventParticipant *)self hasIsUser];
  if (v7 != [v4 hasIsUser]) {
    goto LABEL_17;
  }
  if ([(_INPBEventParticipant *)self hasIsUser])
  {
    if ([v4 hasIsUser])
    {
      int isUser = self->_isUser;
      if (isUser != [v4 isUser]) {
        goto LABEL_17;
      }
    }
  }
  v9 = [(_INPBEventParticipant *)self person];
  v10 = [v4 person];
  v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v12 = [(_INPBEventParticipant *)self person];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(_INPBEventParticipant *)self person];
      v15 = [v4 person];
      int v16 = [v14 isEqual:v15];

      if (!v16) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    int v17 = [(_INPBEventParticipant *)self hasStatus];
    if (v17 == [v4 hasStatus])
    {
      if (![(_INPBEventParticipant *)self hasStatus]
        || ![v4 hasStatus]
        || (int status = self->_status, status == [v4 status]))
      {
        BOOL v18 = 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
  }
LABEL_17:
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBEventParticipant allocWithZone:](_INPBEventParticipant, "allocWithZone:") init];
  if ([(_INPBEventParticipant *)self hasIsEventOrganizer]) {
    [(_INPBEventParticipant *)v5 setIsEventOrganizer:[(_INPBEventParticipant *)self isEventOrganizer]];
  }
  if ([(_INPBEventParticipant *)self hasIsUser]) {
    [(_INPBEventParticipant *)v5 setIsUser:[(_INPBEventParticipant *)self isUser]];
  }
  id v6 = [(_INPBContact *)self->_person copyWithZone:a3];
  [(_INPBEventParticipant *)v5 setPerson:v6];

  if ([(_INPBEventParticipant *)self hasStatus]) {
    [(_INPBEventParticipant *)v5 setStatus:[(_INPBEventParticipant *)self status]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBEventParticipant *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBEventParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBEventParticipant *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBEventParticipant *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBEventParticipant *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_INPBEventParticipant *)self hasIsEventOrganizer]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBEventParticipant *)self hasIsUser]) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(_INPBEventParticipant *)self person];

  if (v4)
  {
    int v5 = [(_INPBEventParticipant *)self person];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBEventParticipant *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBEventParticipantReadFrom(self, (uint64_t)a3);
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DECLINED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TENTATIVE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DELEGATED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"IN_PROCESS"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5519790[a3 - 1];
  }

  return v3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int status = a3;
  }
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setPerson:(id)a3
{
}

- (void)setHasIsUser:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsUser
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isUser = a3;
}

- (void)setHasIsEventOrganizer:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsEventOrganizer
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEventOrganizer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isEventOrganizer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end