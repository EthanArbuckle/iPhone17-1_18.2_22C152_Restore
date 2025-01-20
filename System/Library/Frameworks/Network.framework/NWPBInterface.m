@interface NWPBInterface
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBInterface

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_subtype;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_index;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_generation;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_delegateIndex;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_mtu;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_expensive;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 9)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_subtype != *((_DWORD *)v4 + 8)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_37;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_index != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_generation != *((_DWORD *)v4 + 3)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_37;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_delegateIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if (v6)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mtu != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  BOOL v8 = (v6 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_expensive)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_37;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_37;
      }
      BOOL v8 = 1;
      goto LABEL_38;
    }
LABEL_37:
    BOOL v8 = 0;
  }
LABEL_38:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_type;
    *(unsigned char *)(v5 + 44) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_subtype;
    *(unsigned char *)(v5 + 44) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_index;
    *(unsigned char *)(v6 + 44) |= 4u;
    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 12) = self->_generation;
  *(unsigned char *)(v6 + 44) |= 2u;
  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    if ((v10 & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    *(_DWORD *)(v6 + 20) = self->_mtu;
    *(unsigned char *)(v6 + 44) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
LABEL_14:
  *(_DWORD *)(v6 + 8) = self->_delegateIndex;
  *(unsigned char *)(v6 + 44) |= 1u;
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v10 & 0x40) != 0)
  {
LABEL_10:
    *(unsigned char *)(v6 + 40) = self->_expensive;
    *(unsigned char *)(v6 + 44) |= 0x40u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return NWPBInterfaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E5248E28[type];
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    subuint64_t type = self->_subtype;
    if (subtype >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_subtype);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E5248E50[subtype];
    }
    [v3 setObject:v8 forKey:@"subtype"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_index];
    [v3 setObject:v13 forKey:@"index"];

    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  v14 = [NSNumber numberWithUnsignedInt:self->_generation];
  [v3 setObject:v14 forKey:@"generation"];

  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_16:
    if ((v10 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = [NSNumber numberWithUnsignedInt:self->_delegateIndex];
  [v3 setObject:v15 forKey:@"delegateIndex"];

  char v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_17:
    if ((v10 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  v16 = [NSNumber numberWithUnsignedInt:self->_mtu];
  [v3 setObject:v16 forKey:@"mtu"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    v11 = [NSNumber numberWithBool:self->_expensive];
    [v3 setObject:v11 forKey:@"expensive"];
  }
LABEL_19:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBInterface;
  id v4 = [(NWPBInterface *)&v8 description];
  char v5 = [(NWPBInterface *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end