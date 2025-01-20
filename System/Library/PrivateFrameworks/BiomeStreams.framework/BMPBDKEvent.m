@interface BMPBDKEvent
- (BOOL)hasDkEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dkEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDkEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBDKEvent

- (BOOL)hasDkEvent
{
  return self->_dkEvent != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBDKEvent;
  v4 = [(BMPBDKEvent *)&v8 description];
  v5 = [(BMPBDKEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  dkEvent = self->_dkEvent;
  if (dkEvent) {
    [v3 setObject:dkEvent forKey:@"dkEvent"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBDKEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_dkEvent) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  dkEvent = self->_dkEvent;
  if (dkEvent) {
    [a3 setDkEvent:dkEvent];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_dkEvent copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    dkEvent = self->_dkEvent;
    if ((unint64_t)dkEvent | v4[1]) {
      char v6 = -[NSData isEqual:](dkEvent, "isEqual:");
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

- (unint64_t)hash
{
  return [(NSData *)self->_dkEvent hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[BMPBDKEvent setDkEvent:](self, "setDkEvent:");
  }
}

- (NSData)dkEvent
{
  return self->_dkEvent;
}

- (void)setDkEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end