@interface HDCodableNotificationInstructionRequest
- (BOOL)hasNotificationInstruction;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableNotificationInstructionMessage)notificationInstruction;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNotificationInstruction:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNotificationInstructionRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasNotificationInstruction
{
  return self->_notificationInstruction != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNotificationInstructionRequest;
  v4 = [(HDCodableNotificationInstructionRequest *)&v8 description];
  v5 = [(HDCodableNotificationInstructionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  notificationInstruction = self->_notificationInstruction;
  if (notificationInstruction)
  {
    v7 = [(HDCodableNotificationInstructionMessage *)notificationInstruction dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"notificationInstruction"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_notificationInstruction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_notificationInstruction)
  {
    objc_msgSend(v5, "setNotificationInstruction:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HDCodableNotificationInstructionMessage *)self->_notificationInstruction copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:")))
  {
    notificationInstruction = self->_notificationInstruction;
    if ((unint64_t)notificationInstruction | v4[1]) {
      char v7 = -[HDCodableNotificationInstructionMessage isEqual:](notificationInstruction, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  return [(HDCodableNotificationInstructionMessage *)self->_notificationInstruction hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[HDCodableNotificationInstructionRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    id v4 = v7;
  }
  notificationInstruction = self->_notificationInstruction;
  uint64_t v6 = v4[1];
  if (notificationInstruction)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableNotificationInstructionMessage mergeFrom:](notificationInstruction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableNotificationInstructionRequest setNotificationInstruction:](self, "setNotificationInstruction:");
  }
  id v4 = v7;
LABEL_9:
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (HDCodableNotificationInstructionMessage)notificationInstruction
{
  return self->_notificationInstruction;
}

- (void)setNotificationInstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_notificationInstruction, 0);
}

@end