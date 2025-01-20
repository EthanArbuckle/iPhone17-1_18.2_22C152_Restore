@interface SYClock
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SYPeer)peer;
- (id)_myDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)increaseBy:(unint64_t)a3;
- (unint64_t)increment;
- (unint64_t)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeer:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYClock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
    v4 = class_getInstanceMethod((Class)a1, sel__myDescription);
    method_exchangeImplementations(InstanceMethod, v4);
  }
}

- (unint64_t)increaseBy:(unint64_t)a3
{
  unint64_t v4 = [(SYClock *)self version] + a3;
  [(SYClock *)self setVersion:v4];
  return v4;
}

- (unint64_t)increment
{
  return [(SYClock *)self increaseBy:1];
}

- (id)_myDescription
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SYClock;
  unint64_t v4 = [(SYClock *)&v9 description];
  v5 = [(SYClock *)self peer];
  v6 = [v5 peerID];
  v7 = [v3 stringWithFormat:@"%@: %@::%qu", v4, v6, -[SYClock version](self, "version")];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYClock;
  unint64_t v4 = [(SYClock *)&v8 description];
  v5 = [(SYClock *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  peer = self->_peer;
  if (peer)
  {
    v5 = [(SYPeer *)peer dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"peer"];
  }
  v6 = [NSNumber numberWithUnsignedLongLong:self->_version];
  [v3 setObject:v6 forKey:@"version"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYClockReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_peer) {
    -[SYClock writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  peer = self->_peer;
  id v5 = a3;
  [v5 setPeer:peer];
  v5[1] = self->_version;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYPeer *)self->_peer copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_version;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((peer = self->_peer, !((unint64_t)peer | v4[2])) || -[SYPeer isEqual:](peer, "isEqual:"))
    && self->_version == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_version) ^ [(SYPeer *)self->_peer hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  peer = self->_peer;
  uint64_t v6 = v4[2];
  if (peer)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    peer = (SYPeer *)-[SYPeer mergeFrom:](peer, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    peer = (SYPeer *)-[SYClock setPeer:](self, "setPeer:");
  }
  id v4 = v7;
LABEL_7:
  self->_version = v4[1];
  MEMORY[0x270F9A758](peer, v4);
}

- (SYPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYClock writeTo:]", "SYClock.m", 93, "self->_peer != nil");
}

@end