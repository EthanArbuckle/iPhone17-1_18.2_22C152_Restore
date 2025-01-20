@interface ATXMPBContextMenuFeedbackTracker
- (BOOL)hasClientModelId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasExecutableType;
- (BOOL)hasMenuActionType;
- (BOOL)hasSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (NSString)executableType;
- (NSString)suggestion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)menuActionTypeAsString:(int)a3;
- (int)StringAsMenuActionType:(id)a3;
- (int)menuActionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setExecutableType:(id)a3;
- (void)setHasMenuActionType:(BOOL)a3;
- (void)setMenuActionType:(int)a3;
- (void)setSuggestion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBContextMenuFeedbackTracker

- (int)menuActionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_menuActionType;
  }
  else {
    return 1;
  }
}

- (void)setMenuActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_menuActionType = a3;
}

- (void)setHasMenuActionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMenuActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)menuActionTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"DismissOnce";
  }
  else if (a3 == 2)
  {
    v4 = @"NeverShowAgain";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMenuActionType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"DismissOnce"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NeverShowAgain"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasSuggestion
{
  return self->_suggestion != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBContextMenuFeedbackTracker;
  int v4 = [(ATXMPBContextMenuFeedbackTracker *)&v8 description];
  v5 = [(ATXMPBContextMenuFeedbackTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int menuActionType = self->_menuActionType;
    if (menuActionType == 1)
    {
      v5 = @"DismissOnce";
    }
    else if (menuActionType == 2)
    {
      v5 = @"NeverShowAgain";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_menuActionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"menuActionType"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  executableType = self->_executableType;
  if (executableType) {
    [v3 setObject:executableType forKey:@"executableType"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  suggestion = self->_suggestion;
  if (suggestion) {
    [v3 setObject:suggestion forKey:@"suggestion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBContextMenuFeedbackTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_suggestion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_menuActionType;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v5 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    id v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    id v4 = v5;
  }
  if (self->_suggestion)
  {
    objc_msgSend(v5, "setSuggestion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_menuActionType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_clientModelId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_executableType copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  uint64_t v13 = [(NSString *)self->_suggestion copyWithZone:a3];
  v14 = (void *)v6[5];
  v6[5] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_menuActionType != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 1)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_15;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:")) {
      goto LABEL_15;
    }
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:")) {
      goto LABEL_15;
    }
  }
  suggestion = self->_suggestion;
  if ((unint64_t)suggestion | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](suggestion, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_menuActionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_clientModelId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_executableType hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_consumerSubType hash];
  return v6 ^ [(NSString *)self->_suggestion hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[12])
  {
    self->_int menuActionType = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ATXMPBContextMenuFeedbackTracker setClientModelId:](self, "setClientModelId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBContextMenuFeedbackTracker setExecutableType:](self, "setExecutableType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBContextMenuFeedbackTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXMPBContextMenuFeedbackTracker setSuggestion:](self, "setSuggestion:");
    NSUInteger v4 = v5;
  }
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);

  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end