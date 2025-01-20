@interface ASCodableFinalizeHandshake
- (ASCodableActivityDataPreview)activityDataPreview;
- (ASCodableShareLocations)inviterShareLocations;
- (BOOL)hasActivityDataPreview;
- (BOOL)hasHandshakeToken;
- (BOOL)hasInviterShareLocations;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)handshakeToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityDataPreview:(id)a3;
- (void)setHandshakeToken:(id)a3;
- (void)setInviterShareLocations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableFinalizeHandshake

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (BOOL)hasInviterShareLocations
{
  return self->_inviterShareLocations != 0;
}

- (BOOL)hasActivityDataPreview
{
  return self->_activityDataPreview != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableFinalizeHandshake;
  v4 = [(ASCodableFinalizeHandshake *)&v8 description];
  v5 = [(ASCodableFinalizeHandshake *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken) {
    [v3 setObject:handshakeToken forKey:@"handshakeToken"];
  }
  inviterShareLocations = self->_inviterShareLocations;
  if (inviterShareLocations)
  {
    v7 = [(ASCodableShareLocations *)inviterShareLocations dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"inviterShareLocations"];
  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    v9 = [(ASCodableActivityDataPreview *)activityDataPreview dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"activityDataPreview"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableFinalizeHandshakeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handshakeToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inviterShareLocations)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handshakeToken)
  {
    objc_msgSend(v4, "setHandshakeToken:");
    id v4 = v5;
  }
  if (self->_inviterShareLocations)
  {
    objc_msgSend(v5, "setInviterShareLocations:");
    id v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    objc_msgSend(v5, "setActivityDataPreview:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_handshakeToken copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(ASCodableShareLocations *)self->_inviterShareLocations copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(ASCodableActivityDataPreview *)self->_activityDataPreview copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((handshakeToken = self->_handshakeToken, !((unint64_t)handshakeToken | v4[2]))
     || -[NSString isEqual:](handshakeToken, "isEqual:"))
    && ((inviterShareLocations = self->_inviterShareLocations, !((unint64_t)inviterShareLocations | v4[3]))
     || -[ASCodableShareLocations isEqual:](inviterShareLocations, "isEqual:")))
  {
    activityDataPreview = self->_activityDataPreview;
    if ((unint64_t)activityDataPreview | v4[1]) {
      char v8 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_handshakeToken hash];
  unint64_t v4 = [(ASCodableShareLocations *)self->_inviterShareLocations hash] ^ v3;
  return v4 ^ [(ASCodableActivityDataPreview *)self->_activityDataPreview hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[ASCodableFinalizeHandshake setHandshakeToken:](self, "setHandshakeToken:");
    unint64_t v4 = v9;
  }
  inviterShareLocations = self->_inviterShareLocations;
  uint64_t v6 = v4[3];
  if (inviterShareLocations)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[ASCodableShareLocations mergeFrom:](inviterShareLocations, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[ASCodableFinalizeHandshake setInviterShareLocations:](self, "setInviterShareLocations:");
  }
  unint64_t v4 = v9;
LABEL_9:
  activityDataPreview = self->_activityDataPreview;
  uint64_t v8 = v4[1];
  if (activityDataPreview)
  {
    if (v8) {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ASCodableFinalizeHandshake setActivityDataPreview:](self, "setActivityDataPreview:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)handshakeToken
{
  return self->_handshakeToken;
}

- (void)setHandshakeToken:(id)a3
{
}

- (ASCodableShareLocations)inviterShareLocations
{
  return self->_inviterShareLocations;
}

- (void)setInviterShareLocations:(id)a3
{
}

- (ASCodableActivityDataPreview)activityDataPreview
{
  return self->_activityDataPreview;
}

- (void)setActivityDataPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterShareLocations, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);

  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end