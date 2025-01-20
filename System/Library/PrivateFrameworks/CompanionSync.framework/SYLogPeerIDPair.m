@interface SYLogPeerIDPair
- (BOOL)hasGenerationID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)generationID;
- (NSString)peerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGenerationID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogPeerIDPair

- (BOOL)hasGenerationID
{
  return self->_generationID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogPeerIDPair;
  v4 = [(SYLogPeerIDPair *)&v8 description];
  v5 = [(SYLogPeerIDPair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  generationID = self->_generationID;
  if (generationID) {
    [v4 setObject:generationID forKey:@"generationID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogPeerIDPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_peerID) {
    -[SYLogPeerIDPair writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_generationID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setPeerID:self->_peerID];
  if (self->_generationID) {
    objc_msgSend(v4, "setGenerationID:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_peerID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_generationID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:")))
  {
    generationID = self->_generationID;
    if ((unint64_t)generationID | v4[1]) {
      char v7 = -[NSString isEqual:](generationID, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_peerID hash];
  return [(NSString *)self->_generationID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[SYLogPeerIDPair setPeerID:](self, "setPeerID:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[SYLogPeerIDPair setGenerationID:](self, "setGenerationID:");
    id v4 = v5;
  }
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogPeerIDPair writeTo:]", "SYLogPeerIDPair.m", 87, "nil != self->_peerID");
}

@end