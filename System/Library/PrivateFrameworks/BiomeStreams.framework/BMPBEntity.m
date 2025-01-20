@interface BMPBEntity
- (BMPBPersonEntity)personEntity;
- (BMPBTopicEntity)topicEntity;
- (BOOL)hasEntityType;
- (BOOL)hasPersonEntity;
- (BOOL)hasTopicEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entityTypeAsString:(int)a3;
- (int)StringAsEntityType:(id)a3;
- (int)entityType;
- (unint64_t)hash;
- (void)clearOneofValuesForEntityType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityType:(int)a3;
- (void)setHasEntityType:(BOOL)a3;
- (void)setPersonEntity:(id)a3;
- (void)setTopicEntity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBEntity

- (BOOL)hasPersonEntity
{
  return self->_personEntity != 0;
}

- (void)setPersonEntity:(id)a3
{
  v4 = (BMPBPersonEntity *)a3;
  [(BMPBEntity *)self clearOneofValuesForEntityType];
  *(unsigned char *)&self->_has |= 1u;
  self->_entityType = 1;
  personEntity = self->_personEntity;
  self->_personEntity = v4;
}

- (BOOL)hasTopicEntity
{
  return self->_topicEntity != 0;
}

- (void)setTopicEntity:(id)a3
{
  v4 = (BMPBTopicEntity *)a3;
  [(BMPBEntity *)self clearOneofValuesForEntityType];
  *(unsigned char *)&self->_has |= 1u;
  self->_entityType = 2;
  topicEntity = self->_topicEntity;
  self->_topicEntity = v4;
}

- (int)entityType
{
  if (*(unsigned char *)&self->_has) {
    return self->_entityType;
  }
  else {
    return 0;
  }
}

- (void)setEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_entityType = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E55D6CC8[a3];
  }

  return v3;
}

- (int)StringAsEntityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"personEntity"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"topicEntity"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForEntityType
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_entityType = 0;
  personEntity = self->_personEntity;
  self->_personEntity = 0;

  topicEntity = self->_topicEntity;
  self->_topicEntity = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBEntity;
  int v4 = [(BMPBEntity *)&v8 description];
  v5 = [(BMPBEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  personEntity = self->_personEntity;
  if (personEntity)
  {
    v5 = [(BMPBPersonEntity *)personEntity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"personEntity"];
  }
  topicEntity = self->_topicEntity;
  if (topicEntity)
  {
    v7 = [(BMPBTopicEntity *)topicEntity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"topicEntity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t entityType = self->_entityType;
    if (entityType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entityType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D6CC8[entityType];
    }
    [v3 setObject:v9 forKey:@"entityType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personEntity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_topicEntity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_entityType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_personEntity)
  {
    objc_msgSend(v4, "setPersonEntity:");
    id v4 = v5;
  }
  if (self->_topicEntity)
  {
    objc_msgSend(v5, "setTopicEntity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_entityType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(BMPBPersonEntity *)self->_personEntity copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(BMPBTopicEntity *)self->_topicEntity copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_entityType != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  personEntity = self->_personEntity;
  if ((unint64_t)personEntity | *((void *)v4 + 2) && !-[BMPBPersonEntity isEqual:](personEntity, "isEqual:")) {
    goto LABEL_11;
  }
  topicEntity = self->_topicEntity;
  if ((unint64_t)topicEntity | *((void *)v4 + 3)) {
    char v7 = -[BMPBTopicEntity isEqual:](topicEntity, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_entityType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(BMPBPersonEntity *)self->_personEntity hash] ^ v3;
  return v4 ^ [(BMPBTopicEntity *)self->_topicEntity hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[8])
  {
    self->_uint64_t entityType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  personEntity = self->_personEntity;
  uint64_t v7 = *((void *)v5 + 2);
  v10 = v5;
  if (personEntity)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[BMPBPersonEntity mergeFrom:](personEntity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[BMPBEntity setPersonEntity:](self, "setPersonEntity:");
  }
  uint64_t v5 = v10;
LABEL_9:
  topicEntity = self->_topicEntity;
  uint64_t v9 = *((void *)v5 + 3);
  if (topicEntity)
  {
    if (v9) {
      -[BMPBTopicEntity mergeFrom:](topicEntity, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[BMPBEntity setTopicEntity:](self, "setTopicEntity:");
  }

  MEMORY[0x1F41817F8]();
}

- (BMPBPersonEntity)personEntity
{
  return self->_personEntity;
}

- (BMPBTopicEntity)topicEntity
{
  return self->_topicEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicEntity, 0);

  objc_storeStrong((id *)&self->_personEntity, 0);
}

@end