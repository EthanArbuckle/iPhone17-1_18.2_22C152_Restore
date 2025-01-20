@interface _MPCProtoItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoItem

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MPCProtoItemIdentifierSet *)self->_identifierSet hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_excludeFromShuffle;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 24);
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_mediaType != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  identifierSet = self->_identifierSet;
  if ((unint64_t)identifierSet | *((void *)v4 + 1))
  {
    if (!-[_MPCProtoItemIdentifierSet isEqual:](identifierSet, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_excludeFromShuffle)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_mediaType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(_MPCProtoItemIdentifierSet *)self->_identifierSet copyWithZone:a3];
  BOOL v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_excludeFromShuffle;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_identifierSet)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_mediaType];
    [v3 setObject:v4 forKey:@"mediaType"];
  }
  identifierSet = self->_identifierSet;
  if (identifierSet)
  {
    uint64_t v6 = [(_MPCProtoItemIdentifierSet *)identifierSet dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"identifierSet"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v7 = [NSNumber numberWithBool:self->_excludeFromShuffle];
    [v3 setObject:v7 forKey:@"excludeFromShuffle"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoItem;
  id v4 = [(_MPCProtoItem *)&v8 description];
  id v5 = [(_MPCProtoItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end