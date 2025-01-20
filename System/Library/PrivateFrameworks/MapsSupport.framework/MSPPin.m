@interface MSPPin
- (BOOL)hasDroppedPin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPDroppedPin)droppedPin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)setDroppedPin:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPin

- (BOOL)hasDroppedPin
{
  return self->_droppedPin != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPin;
  v4 = [(MSPPin *)&v8 description];
  v5 = [(MSPPin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    v5 = [(MSPDroppedPin *)droppedPin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"droppedPin"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_droppedPin)
  {
    v4 = (objc_class *)MEMORY[0x1E4F94098];
    id v5 = a3;
    id v7 = objc_alloc_init(v4);
    [(MSPDroppedPin *)self->_droppedPin writeTo:v7];
    v6 = [v7 data];
    [v5 writeData:v6 forTag:1];
  }
}

- (void)copyTo:(id)a3
{
  droppedPin = self->_droppedPin;
  if (droppedPin) {
    [a3 setDroppedPin:droppedPin];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MSPDroppedPin *)self->_droppedPin copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    droppedPin = self->_droppedPin;
    if ((unint64_t)droppedPin | v4[1]) {
      char v6 = -[MSPDroppedPin isEqual:](droppedPin, "isEqual:");
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
  return [(MSPDroppedPin *)self->_droppedPin hash];
}

- (MSPDroppedPin)droppedPin
{
  return self->_droppedPin;
}

- (void)setDroppedPin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end