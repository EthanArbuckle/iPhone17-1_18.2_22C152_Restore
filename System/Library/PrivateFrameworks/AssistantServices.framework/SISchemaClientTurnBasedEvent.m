@interface SISchemaClientTurnBasedEvent
- (BOOL)hasEvent;
- (BOOL)hasTurnContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SISchemaClientAnyEvent)event;
- (SISchemaClientTurnContext)turnContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)si_dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(id)a3;
- (void)setTurnContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientTurnBasedEvent

- (id)si_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  turnContext = self->_turnContext;
  if (turnContext)
  {
    v5 = [(SISchemaClientTurnContext *)turnContext turnID];

    if (v5)
    {
      v13[0] = 0;
      v13[1] = 0;
      v6 = [(SISchemaClientTurnContext *)self->_turnContext turnID];
      [v6 getBytes:v13 length:16];

      v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v13];
      v8 = v7;
      if (v7)
      {
        v9 = [v7 UUIDString];
        [v3 setObject:v9 forKey:@"turnID"];
      }
    }
  }
  event = self->_event;
  if (event)
  {
    v11 = [(SISchemaClientAnyEvent *)event si_dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"event"];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)setEvent:(id)a3
{
}

- (SISchemaClientAnyEvent)event
{
  return self->_event;
}

- (void)setTurnContext:(id)a3
{
}

- (SISchemaClientTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  turnContext = self->_turnContext;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (turnContext)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SISchemaClientTurnContext mergeFrom:](turnContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SISchemaClientTurnBasedEvent setTurnContext:](self, "setTurnContext:");
  }
  v4 = v9;
LABEL_7:
  event = self->_event;
  uint64_t v8 = v4[1];
  if (event)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SISchemaClientAnyEvent mergeFrom:](event, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SISchemaClientTurnBasedEvent setEvent:](self, "setEvent:");
  }
  v4 = v9;
LABEL_13:
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaClientTurnContext *)self->_turnContext hash];
  return [(SISchemaClientAnyEvent *)self->_event hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((turnContext = self->_turnContext, !((unint64_t)turnContext | v4[2]))
     || -[SISchemaClientTurnContext isEqual:](turnContext, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1]) {
      char v7 = -[SISchemaClientAnyEvent isEqual:](event, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SISchemaClientTurnContext *)self->_turnContext copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SISchemaClientAnyEvent *)self->_event copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_turnContext)
  {
    objc_msgSend(v4, "setTurnContext:");
    id v4 = v5;
  }
  if (self->_event)
  {
    objc_msgSend(v5, "setEvent:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_turnContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientTurnBasedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  turnContext = self->_turnContext;
  if (turnContext)
  {
    id v5 = [(SISchemaClientTurnContext *)turnContext dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"turnContext"];
  }
  event = self->_event;
  if (event)
  {
    char v7 = [(SISchemaClientAnyEvent *)event dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"event"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientTurnBasedEvent;
  id v4 = [(SISchemaClientTurnBasedEvent *)&v8 description];
  id v5 = [(SISchemaClientTurnBasedEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

@end