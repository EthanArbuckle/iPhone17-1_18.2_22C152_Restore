@interface ASCodableShareLocations
- (BOOL)hasActivityShareURL;
- (BOOL)hasRelationshipShareURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityShareURL;
- (NSString)relationshipShareURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityShareURL:(id)a3;
- (void)setRelationshipShareURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableShareLocations

- (BOOL)hasActivityShareURL
{
  return self->_activityShareURL != 0;
}

- (BOOL)hasRelationshipShareURL
{
  return self->_relationshipShareURL != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableShareLocations;
  v4 = [(ASCodableShareLocations *)&v8 description];
  v5 = [(ASCodableShareLocations *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  activityShareURL = self->_activityShareURL;
  if (activityShareURL) {
    [v3 setObject:activityShareURL forKey:@"activityShareURL"];
  }
  relationshipShareURL = self->_relationshipShareURL;
  if (relationshipShareURL) {
    [v4 setObject:relationshipShareURL forKey:@"relationshipShareURL"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableShareLocationsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activityShareURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_relationshipShareURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activityShareURL)
  {
    objc_msgSend(v4, "setActivityShareURL:");
    id v4 = v5;
  }
  if (self->_relationshipShareURL)
  {
    objc_msgSend(v5, "setRelationshipShareURL:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_activityShareURL copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_relationshipShareURL copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((activityShareURL = self->_activityShareURL, !((unint64_t)activityShareURL | v4[1]))
     || -[NSString isEqual:](activityShareURL, "isEqual:")))
  {
    relationshipShareURL = self->_relationshipShareURL;
    if ((unint64_t)relationshipShareURL | v4[2]) {
      char v7 = -[NSString isEqual:](relationshipShareURL, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_activityShareURL hash];
  return [(NSString *)self->_relationshipShareURL hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[ASCodableShareLocations setActivityShareURL:](self, "setActivityShareURL:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[ASCodableShareLocations setRelationshipShareURL:](self, "setRelationshipShareURL:");
    id v4 = v5;
  }
}

- (NSString)activityShareURL
{
  return self->_activityShareURL;
}

- (void)setActivityShareURL:(id)a3
{
}

- (NSString)relationshipShareURL
{
  return self->_relationshipShareURL;
}

- (void)setRelationshipShareURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipShareURL, 0);

  objc_storeStrong((id *)&self->_activityShareURL, 0);
}

@end