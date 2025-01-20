@interface ATXMPBBlendingLayoutSelectionTracker
- (BOOL)hasAbGroup;
- (BOOL)hasConsumerSubType;
- (BOOL)hasExecuableTypeOfHighestRankingSuggestion;
- (BOOL)hasHighestConfidenceCategory;
- (BOOL)hasHighestRankingClientModelABGroup;
- (BOOL)hasHighestRankingClientModelId;
- (BOOL)hasLayoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)consumerSubType;
- (NSString)execuableTypeOfHighestRankingSuggestion;
- (NSString)highestConfidenceCategory;
- (NSString)highestRankingClientModelABGroup;
- (NSString)highestRankingClientModelId;
- (NSString)layoutType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setExecuableTypeOfHighestRankingSuggestion:(id)a3;
- (void)setHighestConfidenceCategory:(id)a3;
- (void)setHighestRankingClientModelABGroup:(id)a3;
- (void)setHighestRankingClientModelId:(id)a3;
- (void)setLayoutType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingLayoutSelectionTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (BOOL)hasHighestRankingClientModelId
{
  return self->_highestRankingClientModelId != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasExecuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasHighestRankingClientModelABGroup
{
  return self->_highestRankingClientModelABGroup != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingLayoutSelectionTracker;
  v4 = [(ATXMPBBlendingLayoutSelectionTracker *)&v8 description];
  v5 = [(ATXMPBBlendingLayoutSelectionTracker *)self dictionaryRepresentation];
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
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory) {
    [v4 setObject:highestConfidenceCategory forKey:@"highestConfidenceCategory"];
  }
  highestRankingClientModelId = self->_highestRankingClientModelId;
  if (highestRankingClientModelId) {
    [v4 setObject:highestRankingClientModelId forKey:@"highestRankingClientModelId"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if (execuableTypeOfHighestRankingSuggestion) {
    [v4 setObject:execuableTypeOfHighestRankingSuggestion forKey:@"execuableTypeOfHighestRankingSuggestion"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  highestRankingClientModelABGroup = self->_highestRankingClientModelABGroup;
  if (highestRankingClientModelABGroup) {
    [v4 setObject:highestRankingClientModelABGroup forKey:@"highestRankingClientModelABGroup"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingLayoutSelectionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_highestRankingClientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_highestRankingClientModelABGroup)
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
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    id v4 = v5;
  }
  if (self->_highestRankingClientModelId)
  {
    objc_msgSend(v5, "setHighestRankingClientModelId:");
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    id v4 = v5;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    objc_msgSend(v5, "setExecuableTypeOfHighestRankingSuggestion:");
    id v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    id v4 = v5;
  }
  if (self->_highestRankingClientModelABGroup)
  {
    objc_msgSend(v5, "setHighestRankingClientModelABGroup:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_layoutType copyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSString *)self->_highestConfidenceCategory copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_highestRankingClientModelId copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSString *)self->_execuableTypeOfHighestRankingSuggestion copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  uint64_t v16 = [(NSString *)self->_abGroup copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  uint64_t v18 = [(NSString *)self->_highestRankingClientModelABGroup copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((layoutType = self->_layoutType, !((unint64_t)layoutType | v4[7]))
     || -[NSString isEqual:](layoutType, "isEqual:"))
    && ((highestConfidenceCategory = self->_highestConfidenceCategory,
         !((unint64_t)highestConfidenceCategory | v4[4]))
     || -[NSString isEqual:](highestConfidenceCategory, "isEqual:"))
    && ((highestRankingClientModelId = self->_highestRankingClientModelId,
         !((unint64_t)highestRankingClientModelId | v4[6]))
     || -[NSString isEqual:](highestRankingClientModelId, "isEqual:"))
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[2]))
     || -[NSString isEqual:](consumerSubType, "isEqual:"))
    && ((execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion,
         !((unint64_t)execuableTypeOfHighestRankingSuggestion | v4[3]))
     || -[NSString isEqual:](execuableTypeOfHighestRankingSuggestion, "isEqual:"))
    && ((abGroup = self->_abGroup, !((unint64_t)abGroup | v4[1]))
     || -[NSString isEqual:](abGroup, "isEqual:")))
  {
    highestRankingClientModelABGroup = self->_highestRankingClientModelABGroup;
    if ((unint64_t)highestRankingClientModelABGroup | v4[5]) {
      char v12 = -[NSString isEqual:](highestRankingClientModelABGroup, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_layoutType hash];
  NSUInteger v4 = [(NSString *)self->_highestConfidenceCategory hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_highestRankingClientModelId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_consumerSubType hash];
  NSUInteger v7 = [(NSString *)self->_execuableTypeOfHighestRankingSuggestion hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_abGroup hash];
  return v6 ^ v8 ^ [(NSString *)self->_highestRankingClientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[7]) {
    [(ATXMPBBlendingLayoutSelectionTracker *)self setLayoutType:"setLayoutType:"];
  }
  if (v4[4]) {
    -[ATXMPBBlendingLayoutSelectionTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
  }
  if (v4[6]) {
    -[ATXMPBBlendingLayoutSelectionTracker setHighestRankingClientModelId:](self, "setHighestRankingClientModelId:");
  }
  if (v4[2]) {
    -[ATXMPBBlendingLayoutSelectionTracker setConsumerSubType:](self, "setConsumerSubType:");
  }
  if (v4[3]) {
    -[ATXMPBBlendingLayoutSelectionTracker setExecuableTypeOfHighestRankingSuggestion:](self, "setExecuableTypeOfHighestRankingSuggestion:");
  }
  if (v4[1]) {
    -[ATXMPBBlendingLayoutSelectionTracker setAbGroup:](self, "setAbGroup:");
  }
  if (v4[5]) {
    -[ATXMPBBlendingLayoutSelectionTracker setHighestRankingClientModelABGroup:](self, "setHighestRankingClientModelABGroup:");
  }
}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
}

- (NSString)highestRankingClientModelId
{
  return self->_highestRankingClientModelId;
}

- (void)setHighestRankingClientModelId:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)execuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion;
}

- (void)setExecuableTypeOfHighestRankingSuggestion:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)highestRankingClientModelABGroup
{
  return self->_highestRankingClientModelABGroup;
}

- (void)setHighestRankingClientModelABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestRankingClientModelId, 0);
  objc_storeStrong((id *)&self->_highestRankingClientModelABGroup, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_execuableTypeOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end