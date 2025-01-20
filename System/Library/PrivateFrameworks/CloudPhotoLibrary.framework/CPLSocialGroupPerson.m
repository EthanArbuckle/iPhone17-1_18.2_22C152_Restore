@interface CPLSocialGroupPerson
- (BOOL)hasPersonIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)personIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLSocialGroupPerson

- (void).cxx_destruct
{
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[CPLSocialGroupPerson setPersonIdentifier:](self, "setPersonIdentifier:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_personIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    personIdentifier = self->_personIdentifier;
    if ((unint64_t)personIdentifier | v4[1]) {
      char v6 = -[NSString isEqual:](personIdentifier, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_personIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  personIdentifier = self->_personIdentifier;
  if (personIdentifier) {
    [a3 setPersonIdentifier:personIdentifier];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_personIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLSocialGroupPersonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  personIdentifier = self->_personIdentifier;
  if (personIdentifier) {
    [v3 setObject:personIdentifier forKey:@"personIdentifier"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLSocialGroupPerson;
  v4 = [(CPLSocialGroupPerson *)&v8 description];
  v5 = [(CPLSocialGroupPerson *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPersonIdentifier
{
  return self->_personIdentifier != 0;
}

@end