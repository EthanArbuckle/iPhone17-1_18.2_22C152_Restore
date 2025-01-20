@interface HMMediaGroupProtoMediaSystemRoles
- (BOOL)hasLeftDestinationIdentifier;
- (BOOL)hasRightDestinationIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)leftDestinationIdentifier;
- (NSString)rightDestinationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLeftDestinationIdentifier:(id)a3;
- (void)setRightDestinationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaSystemRoles

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDestinationIdentifier, 0);

  objc_storeStrong((id *)&self->_leftDestinationIdentifier, 0);
}

- (void)setRightDestinationIdentifier:(id)a3
{
}

- (NSString)rightDestinationIdentifier
{
  return self->_rightDestinationIdentifier;
}

- (void)setLeftDestinationIdentifier:(id)a3
{
}

- (NSString)leftDestinationIdentifier
{
  return self->_leftDestinationIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HMMediaGroupProtoMediaSystemRoles setLeftDestinationIdentifier:](self, "setLeftDestinationIdentifier:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HMMediaGroupProtoMediaSystemRoles setRightDestinationIdentifier:](self, "setRightDestinationIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_leftDestinationIdentifier hash];
  return [(NSString *)self->_rightDestinationIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((leftDestinationIdentifier = self->_leftDestinationIdentifier,
         !((unint64_t)leftDestinationIdentifier | v4[1]))
     || -[NSString isEqual:](leftDestinationIdentifier, "isEqual:")))
  {
    rightDestinationIdentifier = self->_rightDestinationIdentifier;
    if ((unint64_t)rightDestinationIdentifier | v4[2]) {
      char v7 = -[NSString isEqual:](rightDestinationIdentifier, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_leftDestinationIdentifier copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_rightDestinationIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_leftDestinationIdentifier)
  {
    objc_msgSend(v4, "setLeftDestinationIdentifier:");
    id v4 = v5;
  }
  if (self->_rightDestinationIdentifier)
  {
    objc_msgSend(v5, "setRightDestinationIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_leftDestinationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_rightDestinationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaSystemRolesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  leftDestinationIdentifier = self->_leftDestinationIdentifier;
  if (leftDestinationIdentifier) {
    [v3 setObject:leftDestinationIdentifier forKey:@"leftDestinationIdentifier"];
  }
  rightDestinationIdentifier = self->_rightDestinationIdentifier;
  if (rightDestinationIdentifier) {
    [v4 setObject:rightDestinationIdentifier forKey:@"rightDestinationIdentifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaSystemRoles;
  id v4 = [(HMMediaGroupProtoMediaSystemRoles *)&v8 description];
  id v5 = [(HMMediaGroupProtoMediaSystemRoles *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRightDestinationIdentifier
{
  return self->_rightDestinationIdentifier != 0;
}

- (BOOL)hasLeftDestinationIdentifier
{
  return self->_leftDestinationIdentifier != 0;
}

@end