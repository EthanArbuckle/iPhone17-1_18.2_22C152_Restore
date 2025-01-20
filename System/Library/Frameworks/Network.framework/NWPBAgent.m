@interface NWPBAgent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentIdentifier, 0);
  objc_storeStrong((id *)&self->_agentDescription, 0);
  objc_storeStrong((id *)&self->_agentData, 0);

  objc_storeStrong((id *)&self->_agentClass, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(NWPBAgentClass *)self->_agentClass hash];
  NSUInteger v4 = [(NSString *)self->_agentIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_agentDescription hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_active;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_userActivated;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761 * self->_voluntary;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSData *)self->_agentData hash];
  }
LABEL_9:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_networkProvider;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_nexusProvider;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSData *)self->_agentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  agentClass = self->_agentClass;
  if ((unint64_t)agentClass | *((void *)v4 + 1))
  {
    if (!-[NWPBAgentClass isEqual:](agentClass, "isEqual:")) {
      goto LABEL_44;
    }
  }
  agentIdentifier = self->_agentIdentifier;
  if ((unint64_t)agentIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](agentIdentifier, "isEqual:")) {
      goto LABEL_44;
    }
  }
  agentDescription = self->_agentDescription;
  if ((unint64_t)agentDescription | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](agentDescription, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0) {
      goto LABEL_44;
    }
    if (self->_active)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0) {
      goto LABEL_44;
    }
    if (self->_userActivated)
    {
      if (!*((unsigned char *)v4 + 43)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 43))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0) {
      goto LABEL_44;
    }
    if (self->_voluntary)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_44;
    }
    if (self->_networkProvider)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0) {
      goto LABEL_50;
    }
LABEL_44:
    char v8 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 48) & 4) == 0) {
    goto LABEL_44;
  }
  if (!self->_nexusProvider)
  {
    if (!*((unsigned char *)v4 + 42)) {
      goto LABEL_50;
    }
    goto LABEL_44;
  }
  if (!*((unsigned char *)v4 + 42)) {
    goto LABEL_44;
  }
LABEL_50:
  agentData = self->_agentData;
  if ((unint64_t)agentData | *((void *)v4 + 2)) {
    char v8 = -[NSData isEqual:](agentData, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_45:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBAgentClass *)self->_agentClass copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_agentIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_agentDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v5 + 40) = self->_active;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 43) = self->_userActivated;
  *(unsigned char *)(v5 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(unsigned char *)(v5 + 41) = self->_networkProvider;
    *(unsigned char *)(v5 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(unsigned char *)(v5 + 44) = self->_voluntary;
  *(unsigned char *)(v5 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 42) = self->_nexusProvider;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_7:
  uint64_t v13 = [(NSData *)self->_agentData copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_agentClass)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_agentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_agentDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_13:
  if (self->_agentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NWPBAgentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  agentClass = self->_agentClass;
  if (agentClass)
  {
    uint64_t v5 = [(NWPBAgentClass *)agentClass dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"agentClass"];
  }
  agentIdentifier = self->_agentIdentifier;
  if (agentIdentifier) {
    [v3 setObject:agentIdentifier forKey:@"agentIdentifier"];
  }
  agentDescription = self->_agentDescription;
  if (agentDescription) {
    [v3 setObject:agentDescription forKey:@"agentDescription"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithBool:self->_active];
    [v3 setObject:v12 forKey:@"active"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v13 = [NSNumber numberWithBool:self->_userActivated];
  [v3 setObject:v13 forKey:@"userActivated"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = [NSNumber numberWithBool:self->_voluntary];
  [v3 setObject:v14 forKey:@"voluntary"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  v15 = [NSNumber numberWithBool:self->_networkProvider];
  [v3 setObject:v15 forKey:@"networkProvider"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    uint64_t v9 = [NSNumber numberWithBool:self->_nexusProvider];
    [v3 setObject:v9 forKey:@"nexusProvider"];
  }
LABEL_13:
  agentData = self->_agentData;
  if (agentData) {
    [v3 setObject:agentData forKey:@"agentData"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBAgent;
  id v4 = [(NWPBAgent *)&v8 description];
  uint64_t v5 = [(NWPBAgent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end