@interface ATXMPBBlendingLayerRefreshTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientModelId;
- (BOOL)hasComputationTime;
- (BOOL)hasConsumerSubType;
- (BOOL)hasInterarrivalTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)computationTime;
- (unsigned)interarrivalTime;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setComputationTime:(unsigned int)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setHasComputationTime:(BOOL)a3;
- (void)setHasInterarrivalTime:(BOOL)a3;
- (void)setInterarrivalTime:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingLayerRefreshTracker

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setInterarrivalTime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interarrivalTime = a3;
}

- (void)setHasInterarrivalTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterarrivalTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setComputationTime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_computationTime = a3;
}

- (void)setHasComputationTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComputationTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingLayerRefreshTracker;
  v4 = [(ATXMPBBlendingLayerRefreshTracker *)&v8 description];
  v5 = [(ATXMPBBlendingLayerRefreshTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_interarrivalTime];
    [v4 setObject:v7 forKey:@"interarrivalTime"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_computationTime];
    [v4 setObject:v8 forKey:@"computationTime"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingLayerRefreshTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_interarrivalTime;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_computationTime;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    id v4 = v6;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v6, "setConsumerSubType:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_interarrivalTime;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_computationTime;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_abGroup copyWithZone:a3];
  v10 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v9;

  uint64_t v11 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_interarrivalTime != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_computationTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1) && !-[NSString isEqual:](abGroup, "isEqual:")) {
    goto LABEL_18;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](consumerSubType, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientModelId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_interarrivalTime;
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
  uint64_t v5 = 2654435761 * self->_computationTime;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_abGroup hash];
  return v6 ^ [(NSString *)self->_consumerSubType hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  NSUInteger v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingLayerRefreshTracker setClientModelId:](self, "setClientModelId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_interarrivalTime = v4[10];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_computationTime = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingLayerRefreshTracker setAbGroup:](self, "setAbGroup:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBBlendingLayerRefreshTracker setConsumerSubType:](self, "setConsumerSubType:");
    uint64_t v4 = v6;
  }
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (unsigned)interarrivalTime
{
  return self->_interarrivalTime;
}

- (unsigned)computationTime
{
  return self->_computationTime;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end