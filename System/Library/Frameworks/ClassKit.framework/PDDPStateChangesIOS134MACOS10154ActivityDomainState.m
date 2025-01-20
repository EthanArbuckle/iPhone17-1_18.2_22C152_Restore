@interface PDDPStateChangesIOS134MACOS10154ActivityDomainState
- (BOOL)hasDomain;
- (BOOL)hasFlags;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)flagsAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsFlags:(id)a3;
- (int)StringAsState:(id)a3;
- (int)domain;
- (int)flags;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(int)a3;
- (void)setFlags:(int)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangesIOS134MACOS10154ActivityDomainState

- (int)domain
{
  if (*(unsigned char *)&self->_has) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F5C90 + a3);
  }

  return v3;
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DOMAIN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACTIVITY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PERSONAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROGRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MESSAGE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HANDOUT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1001F5CC0 + a3);
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ACTIVITY_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INCOMPLETE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DONE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RETURNING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RETURNED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RETURN_FAILED"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)flags
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_flags;
  }
  else {
    return 0;
  }
}

- (void)setFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)flagsAsString:(int)a3
{
  if (a3 <= 31)
  {
    int v4 = @"UNKNOWN_CUSTOM_STATE";
    switch(a3)
    {
      case 0:
        goto LABEL_45;
      case 1:
        int v4 = @"SUBMITTED";
        break;
      case 2:
        int v4 = @"REVISION_REQUESTED";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_44;
      case 4:
        int v4 = @"LOCKED";
        break;
      case 8:
        int v4 = @"UNLOCKED";
        break;
      default:
        if (a3 != 16) {
          goto LABEL_44;
        }
        int v4 = @"SUBMITTED_LATE";
        break;
    }
    return v4;
  }
  if (a3 > 255)
  {
    switch(a3)
    {
      case 256:
        int v4 = @"OPERATION_PENDING";
        break;
      case 512:
        int v4 = @"OPERATION_FAILED";
        break;
      case 1024:
        int v4 = @"STARTED";
        break;
      default:
        goto LABEL_44;
    }
  }
  else
  {
    switch(a3)
    {
      case 32:
        int v4 = @"ACTIVITY_ASK_TO_COMPLETE";
        break;
      case 64:
        int v4 = @"CONSIDERED_LOCK";
        break;
      case 128:
        int v4 = @"IS_LEGACY";
        return v4;
      default:
LABEL_44:
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_45:
        return v4;
    }
  }
  return v4;
}

- (int)StringAsFlags:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CUSTOM_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUBMITTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REVISION_REQUESTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOCKED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNLOCKED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SUBMITTED_LATE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_ASK_TO_COMPLETE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CONSIDERED_LOCK"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"IS_LEGACY"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"OPERATION_PENDING"])
  {
    int v4 = 256;
  }
  else if ([v3 isEqualToString:@"OPERATION_FAILED"])
  {
    int v4 = 512;
  }
  else if ([v3 isEqualToString:@"STARTED"])
  {
    int v4 = 1024;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangesIOS134MACOS10154ActivityDomainState;
  id v3 = [(PDDPStateChangesIOS134MACOS10154ActivityDomainState *)&v7 description];
  int v4 = [(PDDPStateChangesIOS134MACOS10154ActivityDomainState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t state = self->_state;
    if (state >= 6)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
    }
    else
    {
      v8 = *(&off_1001F5CC0 + state);
    }
    [v3 setObject:v8 forKey:@"state"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_36;
    }
LABEL_13:
    uint64_t flags = self->_flags;
    if ((int)flags <= 31)
    {
      v10 = @"UNKNOWN_CUSTOM_STATE";
      switch((int)flags)
      {
        case 0:
          goto LABEL_35;
        case 1:
          v10 = @"SUBMITTED";
          break;
        case 2:
          v10 = @"REVISION_REQUESTED";
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_34;
        case 4:
          v10 = @"LOCKED";
          break;
        case 8:
          v10 = @"UNLOCKED";
          break;
        default:
          if (flags != 16) {
            goto LABEL_34;
          }
          v10 = @"SUBMITTED_LATE";
          break;
      }
      goto LABEL_35;
    }
    if ((int)flags > 255)
    {
      switch(flags)
      {
        case 0x100:
          v10 = @"OPERATION_PENDING";
          goto LABEL_35;
        case 0x200:
          v10 = @"OPERATION_FAILED";
          goto LABEL_35;
        case 0x400:
          v10 = @"STARTED";
          goto LABEL_35;
      }
    }
    else
    {
      switch(flags)
      {
        case 0x20:
          v10 = @"ACTIVITY_ASK_TO_COMPLETE";
          goto LABEL_35;
        case 0x40:
          v10 = @"CONSIDERED_LOCK";
          goto LABEL_35;
        case 0x80:
          v10 = @"IS_LEGACY";
LABEL_35:
          [v3 setObject:v10 forKey:@"flags"];

          goto LABEL_36;
      }
    }
LABEL_34:
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", flags];
    goto LABEL_35;
  }
  uint64_t domain = self->_domain;
  if (domain >= 6)
  {
    v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_domain];
  }
  else
  {
    v6 = *(&off_1001F5C90 + domain);
  }
  [v3 setObject:v6 forKey:@"domain"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_36:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001314F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_domain;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_state;
  *((unsigned char *)v4 + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_flags;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_domain;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_state;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_flags;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_state != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_flags != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_domain;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_state;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_flags;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_uint64_t domain = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t state = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t flags = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

@end