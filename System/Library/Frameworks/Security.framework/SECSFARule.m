@interface SECSFARule
- (BOOL)hasAction;
- (BOOL)hasEventClass;
- (BOOL)hasEventType;
- (BOOL)hasMatch;
- (BOOL)hasProcess;
- (BOOL)hasRepeatAfterSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)match;
- (NSString)eventType;
- (NSString)process;
- (SECSFAAction)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventClassAsString:(int)a3;
- (int)StringAsEventClass:(id)a3;
- (int)eventClass;
- (int64_t)repeatAfterSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(id)a3;
- (void)setEventClass:(int)a3;
- (void)setEventType:(id)a3;
- (void)setHasEventClass:(BOOL)a3;
- (void)setHasRepeatAfterSeconds:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setProcess:(id)a3;
- (void)setRepeatAfterSeconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFARule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setProcess:(id)a3
{
}

- (NSString)process
{
  return self->_process;
}

- (int64_t)repeatAfterSeconds
{
  return self->_repeatAfterSeconds;
}

- (void)setAction:(id)a3
{
}

- (SECSFAAction)action
{
  return self->_action;
}

- (void)setMatch:(id)a3
{
}

- (NSData)match
{
  return self->_match;
}

- (void)setEventType:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFARule setEventType:](self, "setEventType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[SECSFARule setMatch:](self, "setMatch:");
    id v4 = v7;
  }
  action = self->_action;
  uint64_t v6 = *((void *)v4 + 2);
  if (action)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFAAction mergeFrom:](action, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[SECSFARule setAction:](self, "setAction:");
  }
  id v4 = v7;
LABEL_11:
  if (*((unsigned char *)v4 + 56))
  {
    self->_repeatAfterSeconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[SECSFARule setProcess:](self, "setProcess:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_eventClass = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventType hash];
  uint64_t v4 = [(NSData *)self->_match hash];
  unint64_t v5 = [(SECSFAAction *)self->_action hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_repeatAfterSeconds;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_process hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_eventClass;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventType, "isEqual:")) {
      goto LABEL_20;
    }
  }
  match = self->_match;
  if ((unint64_t)match | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](match, "isEqual:")) {
      goto LABEL_20;
    }
  }
  action = self->_action;
  if ((unint64_t)action | *((void *)v4 + 2))
  {
    if (!-[SECSFAAction isEqual:](action, "isEqual:")) {
      goto LABEL_20;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 56);
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_repeatAfterSeconds != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_20;
  }
  process = self->_process;
  if ((unint64_t)process | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](process, "isEqual:"))
    {
LABEL_20:
      BOOL v11 = 0;
      goto LABEL_21;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 56);
  }
  BOOL v11 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_eventClass != *((_DWORD *)v4 + 6)) {
      goto LABEL_20;
    }
    BOOL v11 = 1;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_eventType copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_match copyWithZone:a3];
  char v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(SECSFAAction *)self->_action copyWithZone:a3];
  BOOL v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_repeatAfterSeconds;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_process copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventClass;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    objc_msgSend(v4, "setEventType:");
    id v4 = v5;
  }
  if (self->_match)
  {
    objc_msgSend(v5, "setMatch:");
    id v4 = v5;
  }
  if (self->_action)
  {
    objc_msgSend(v5, "setAction:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_repeatAfterSeconds;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_process)
  {
    objc_msgSend(v5, "setProcess:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventClass;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_match)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_process)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 32;
          goto LABEL_34;
        case 2u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 40;
          goto LABEL_34;
        case 3u:
          v21 = objc_alloc_init(SECSFAAction);
          objc_storeStrong((id *)&self->_action, v21);
          if (!PBReaderPlaceMark() || (SECSFAActionReadFrom((uint64_t)v21, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v20) = 0;
            return v20;
          }
          PBReaderRecallMark();

LABEL_50:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_51;
          }
          break;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          int64_t v24 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v25 = *v4;
            unint64_t v26 = *(void *)((char *)a3 + v25);
            if (v26 == -1 || v26 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v26);
              *(void *)((char *)a3 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v15 = v23++ >= 9;
                if (v15)
                {
                  int64_t v24 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            int64_t v24 = 0;
          }
LABEL_45:
          self->_repeatAfterSeconds = v24;
          goto LABEL_50;
        case 5u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 48;
LABEL_34:
          v28 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;

          goto LABEL_50;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v32 = *v4;
            unint64_t v33 = *(void *)((char *)a3 + v32);
            if (v33 == -1 || v33 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v33);
              *(void *)((char *)a3 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v15 = v30++ >= 9;
                if (v15)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v31) = 0;
          }
LABEL_49:
          self->_eventClass = v31;
          goto LABEL_50;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          goto LABEL_50;
      }
    }
  }
LABEL_51:
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  eventType = self->_eventType;
  if (eventType) {
    [v3 setObject:eventType forKey:@"eventType"];
  }
  match = self->_match;
  if (match) {
    [v4 setObject:match forKey:@"match"];
  }
  action = self->_action;
  if (action)
  {
    uint64_t v8 = [(SECSFAAction *)action dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"action"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v9 = [NSNumber numberWithLongLong:self->_repeatAfterSeconds];
    [v4 setObject:v9 forKey:@"repeatAfterSeconds"];
  }
  process = self->_process;
  if (process) {
    [v4 setObject:process forKey:@"process"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t eventClass = self->_eventClass;
    if eventClass < 0xF && ((0x7C03u >> eventClass))
    {
      uint64_t v12 = (void *)*((void *)&off_1E5477520 + eventClass);
    }
    else
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventClass);
    }
    [v4 setObject:v12 forKey:@"eventClass"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFARule;
  id v4 = [(SECSFARule *)&v8 description];
  id v5 = [(SECSFARule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsEventClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Errors"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HardFailure"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SoftFailure"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Note"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Rockwell"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)eventClassAsString:(int)a3
{
  if a3 < 0xF && ((0x7C03u >> a3))
  {
    id v3 = (void *)*((void *)&off_1E5477520 + a3);
  }
  else
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v3;
}

- (BOOL)hasEventClass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEventClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEventClass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t eventClass = a3;
}

- (int)eventClass
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventClass;
  }
  else {
    return 0;
  }
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (BOOL)hasRepeatAfterSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRepeatAfterSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRepeatAfterSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_repeatAfterSeconds = a3;
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (BOOL)hasMatch
{
  return self->_match != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

@end