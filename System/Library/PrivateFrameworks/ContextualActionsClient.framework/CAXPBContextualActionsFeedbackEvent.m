@interface CAXPBContextualActionsFeedbackEvent
- (BOOL)hasDeviceContext;
- (BOOL)hasSelectedAction;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAXPBContextualAction)selectedAction;
- (CAXPBPredictionContext)deviceContext;
- (CAXPBSuggestion)suggestion;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAXPBContextualActionsFeedbackEvent

- (BOOL)hasSelectedAction
{
  return self->_selectedAction != 0;
}

- (BOOL)hasSuggestion
{
  return self->_suggestion != 0;
}

- (BOOL)hasDeviceContext
{
  return self->_deviceContext != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAXPBContextualActionsFeedbackEvent;
  v4 = [(CAXPBContextualActionsFeedbackEvent *)&v8 description];
  v5 = [(CAXPBContextualActionsFeedbackEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  selectedAction = self->_selectedAction;
  if (selectedAction)
  {
    v5 = [(CAXPBContextualAction *)selectedAction dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"selectedAction"];
  }
  suggestion = self->_suggestion;
  if (suggestion)
  {
    v7 = [(CAXPBSuggestion *)suggestion dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"suggestion"];
  }
  deviceContext = self->_deviceContext;
  if (deviceContext)
  {
    v9 = [(CAXPBPredictionContext *)deviceContext dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"deviceContext"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionsFeedbackEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_selectedAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_suggestion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deviceContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_selectedAction)
  {
    objc_msgSend(v4, "setSelectedAction:");
    id v4 = v5;
  }
  if (self->_suggestion)
  {
    objc_msgSend(v5, "setSuggestion:");
    id v4 = v5;
  }
  if (self->_deviceContext)
  {
    objc_msgSend(v5, "setDeviceContext:");
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CAXPBContextualAction *)self->_selectedAction copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(CAXPBSuggestion *)self->_suggestion copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(CAXPBPredictionContext *)self->_deviceContext copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((selectedAction = self->_selectedAction, !((unint64_t)selectedAction | v4[2]))
     || -[CAXPBContextualAction isEqual:](selectedAction, "isEqual:"))
    && ((suggestion = self->_suggestion, !((unint64_t)suggestion | v4[4]))
     || -[CAXPBSuggestion isEqual:](suggestion, "isEqual:"))
    && ((deviceContext = self->_deviceContext, !((unint64_t)deviceContext | v4[1]))
     || -[CAXPBPredictionContext isEqual:](deviceContext, "isEqual:")))
  {
    sessionIdentifier = self->_sessionIdentifier;
    if ((unint64_t)sessionIdentifier | v4[3]) {
      char v9 = -[NSString isEqual:](sessionIdentifier, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CAXPBContextualAction *)self->_selectedAction hash];
  unint64_t v4 = [(CAXPBSuggestion *)self->_suggestion hash] ^ v3;
  unint64_t v5 = [(CAXPBPredictionContext *)self->_deviceContext hash];
  return v4 ^ v5 ^ [(NSString *)self->_sessionIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  selectedAction = self->_selectedAction;
  uint64_t v6 = v4[2];
  v11 = v4;
  if (selectedAction)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CAXPBContextualAction mergeFrom:](selectedAction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CAXPBContextualActionsFeedbackEvent setSelectedAction:](self, "setSelectedAction:");
  }
  unint64_t v4 = v11;
LABEL_7:
  suggestion = self->_suggestion;
  uint64_t v8 = v4[4];
  if (suggestion)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CAXPBSuggestion mergeFrom:](suggestion, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CAXPBContextualActionsFeedbackEvent setSuggestion:](self, "setSuggestion:");
  }
  unint64_t v4 = v11;
LABEL_13:
  deviceContext = self->_deviceContext;
  uint64_t v10 = v4[1];
  if (deviceContext)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CAXPBPredictionContext mergeFrom:](deviceContext, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CAXPBContextualActionsFeedbackEvent setDeviceContext:](self, "setDeviceContext:");
  }
  unint64_t v4 = v11;
LABEL_19:
  if (v4[3]) {
    -[CAXPBContextualActionsFeedbackEvent setSessionIdentifier:](self, "setSessionIdentifier:");
  }
  MEMORY[0x270F9A758]();
}

- (CAXPBContextualAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
}

- (CAXPBSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (CAXPBPredictionContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end