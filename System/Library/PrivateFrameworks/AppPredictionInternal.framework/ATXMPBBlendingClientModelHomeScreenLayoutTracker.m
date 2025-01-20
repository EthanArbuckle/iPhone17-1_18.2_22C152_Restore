@interface ATXMPBBlendingClientModelHomeScreenLayoutTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientModelABGroup;
- (BOOL)hasClientModelId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasLayoutType;
- (BOOL)hasNumSuggestionsForClientModelInLayout;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)clientModelABGroup;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (NSString)layoutType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)numSuggestionsForClientModelInLayout;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientModelABGroup:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3;
- (void)setLayoutType:(id)a3;
- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingClientModelHomeScreenLayoutTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numSuggestionsForClientModelInLayout = a3;
}

- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumSuggestionsForClientModelInLayout
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingClientModelHomeScreenLayoutTracker;
  v4 = [(ATXMPBBlendingClientModelHomeScreenLayoutTracker *)&v8 description];
  v5 = [(ATXMPBBlendingClientModelHomeScreenLayoutTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType) {
    [v3 setObject:layoutType forKey:@"layoutType"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_numSuggestionsForClientModelInLayout];
    [v4 setObject:v7 forKey:@"numSuggestionsForClientModelInLayout"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup) {
    [v4 setObject:clientModelABGroup forKey:@"clientModelABGroup"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelHomeScreenLayoutTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_layoutType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_layoutType)
  {
    objc_msgSend(v4, "setLayoutType:");
    id v4 = v5;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v5, "setClientModelId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_numSuggestionsForClientModelInLayout;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v5, "setClientModelABGroup:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_layoutType copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_numSuggestionsForClientModelInLayout;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_abGroup copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  uint64_t v14 = [(NSString *)self->_clientModelABGroup copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:")) {
      goto LABEL_17;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_numSuggestionsForClientModelInLayout != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 4)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_17;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_17;
    }
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((void *)v4 + 2)) {
    char v10 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_layoutType hash];
  NSUInteger v4 = [(NSString *)self->_clientModelId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_numSuggestionsForClientModelInLayout;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_consumerSubType hash];
  NSUInteger v7 = [(NSString *)self->_abGroup hash];
  return v6 ^ v7 ^ [(NSString *)self->_clientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 5))
  {
    [(ATXMPBBlendingClientModelHomeScreenLayoutTracker *)self setLayoutType:"setLayoutType:"];
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setClientModelId:](self, "setClientModelId:");
    NSUInteger v4 = v5;
  }
  if (v4[13])
  {
    self->_numSuggestionsForClientModelInLayout = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    NSUInteger v4 = v5;
  }
}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (unsigned)numSuggestionsForClientModelInLayout
{
  return self->_numSuggestionsForClientModelInLayout;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end