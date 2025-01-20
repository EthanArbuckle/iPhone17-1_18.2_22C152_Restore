@interface VCCCMessageWrapper
- (BOOL)hasAcknowledgement;
- (BOOL)hasContent;
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCCCMessage)message;
- (VCCCMessageAcknowledgment)acknowledgement;
- (id)contentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContent:(id)a3;
- (int)content;
- (unint64_t)hash;
- (void)clearOneofValuesForContent;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAcknowledgement:(id)a3;
- (void)setContent:(int)a3;
- (void)setHasContent:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCCMessageWrapper

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCCMessageWrapper *)self setMessage:0];
  [(VCCCMessageWrapper *)self setAcknowledgement:0];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessageWrapper;
  [(VCCCMessageWrapper *)&v3 dealloc];
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)setMessage:(id)a3
{
  [(VCCCMessageWrapper *)self clearOneofValuesForContent];
  *(unsigned char *)&self->_has |= 1u;
  self->_content = 1;
  id v5 = a3;

  self->_message = (VCCCMessage *)a3;
}

- (BOOL)hasAcknowledgement
{
  return self->_acknowledgement != 0;
}

- (void)setAcknowledgement:(id)a3
{
  [(VCCCMessageWrapper *)self clearOneofValuesForContent];
  *(unsigned char *)&self->_has |= 1u;
  self->_content = 2;
  id v5 = a3;

  self->_acknowledgement = (VCCCMessageAcknowledgment *)a3;
}

- (int)content
{
  if (*(unsigned char *)&self->_has) {
    return self->_content;
  }
  else {
    return 0;
  }
}

- (void)setContent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_content = a3;
}

- (void)setHasContent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContent
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)contentAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else {
    return off_1E6DB9118[a3];
  }
}

- (int)StringAsContent:(id)a3
{
  if ([a3 isEqualToString:@"PBUNSET"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"message"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"acknowledgement"]) {
    return 2;
  }
  return 0;
}

- (void)clearOneofValuesForContent
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_content = 0;

  self->_message = 0;
  self->_acknowledgement = 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessageWrapper;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCCMessageWrapper description](&v3, sel_description), -[VCCCMessageWrapper dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  message = self->_message;
  if (message) {
    objc_msgSend(v3, "setObject:forKey:", -[VCCCMessage dictionaryRepresentation](message, "dictionaryRepresentation"), @"message");
  }
  acknowledgement = self->_acknowledgement;
  if (acknowledgement) {
    objc_msgSend(v3, "setObject:forKey:", -[VCCCMessageAcknowledgment dictionaryRepresentation](acknowledgement, "dictionaryRepresentation"), @"acknowledgement");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t content = self->_content;
    if (content >= 3) {
      v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_content);
    }
    else {
      v7 = off_1E6DB9118[content];
    }
    [v3 setObject:v7 forKey:@"content"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCCMessageWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_message) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_acknowledgement)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_content;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_message) {
    objc_msgSend(a3, "setMessage:");
  }
  if (self->_acknowledgement)
  {
    objc_msgSend(a3, "setAcknowledgement:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_content;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 24) = [(VCCCMessage *)self->_message copyWithZone:a3];
  *(void *)(v6 + 8) = [(VCCCMessageAcknowledgment *)self->_acknowledgement copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_content != *((_DWORD *)a3 + 4)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    message = self->_message;
    if (!((unint64_t)message | *((void *)a3 + 3)) || (int v5 = -[VCCCMessage isEqual:](message, "isEqual:")) != 0)
    {
      acknowledgement = self->_acknowledgement;
      if ((unint64_t)acknowledgement | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[VCCCMessageAcknowledgment isEqual:](acknowledgement, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_content;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(VCCCMessage *)self->_message hash] ^ v3;
  return v4 ^ [(VCCCMessageAcknowledgment *)self->_acknowledgement hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_uint64_t content = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  message = self->_message;
  uint64_t v6 = *((void *)a3 + 3);
  if (message)
  {
    if (v6) {
      -[VCCCMessage mergeFrom:](message, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCCCMessageWrapper setMessage:](self, "setMessage:");
  }
  acknowledgement = self->_acknowledgement;
  uint64_t v8 = *((void *)a3 + 1);
  if (acknowledgement)
  {
    if (v8)
    {
      -[VCCCMessageAcknowledgment mergeFrom:](acknowledgement, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[VCCCMessageWrapper setAcknowledgement:](self, "setAcknowledgement:");
  }
}

- (VCCCMessage)message
{
  return self->_message;
}

- (VCCCMessageAcknowledgment)acknowledgement
{
  return self->_acknowledgement;
}

@end