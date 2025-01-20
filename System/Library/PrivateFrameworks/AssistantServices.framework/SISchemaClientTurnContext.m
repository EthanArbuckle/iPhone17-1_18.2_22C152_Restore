@interface SISchemaClientTurnContext
- (BOOL)hasTurnID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)turnID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTurnID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientTurnContext

- (void).cxx_destruct
{
}

- (void)setTurnID:(id)a3
{
}

- (NSData)turnID
{
  return self->_turnID;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SISchemaClientTurnContext setTurnID:](self, "setTurnID:");
  }
}

- (unint64_t)hash
{
  return [(NSData *)self->_turnID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    turnID = self->_turnID;
    if ((unint64_t)turnID | v4[1]) {
      char v6 = -[NSData isEqual:](turnID, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_turnID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  turnID = self->_turnID;
  if (turnID) {
    [a3 setTurnID:turnID];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_turnID) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientTurnContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  turnID = self->_turnID;
  if (turnID) {
    [v3 setObject:turnID forKey:@"turnID"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientTurnContext;
  v4 = [(SISchemaClientTurnContext *)&v8 description];
  v5 = [(SISchemaClientTurnContext *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

@end