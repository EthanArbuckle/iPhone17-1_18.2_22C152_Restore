@interface HDCodableTinkerOptInRequest
- (BOOL)hasGuardianDisplayName;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guardianDisplayName;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuardianDisplayName:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableTinkerOptInRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasGuardianDisplayName
{
  return self->_guardianDisplayName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableTinkerOptInRequest;
  v4 = [(HDCodableTinkerOptInRequest *)&v8 description];
  v5 = [(HDCodableTinkerOptInRequest *)self dictionaryRepresentation];
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
  guardianDisplayName = self->_guardianDisplayName;
  if (guardianDisplayName) {
    [v4 setObject:guardianDisplayName forKey:@"guardianDisplayName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerOptInRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_guardianDisplayName)
  {
    PBDataWriterWriteStringField();
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
  if (self->_guardianDisplayName)
  {
    objc_msgSend(v5, "setGuardianDisplayName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_guardianDisplayName copyWithZone:a3];
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
    guardianDisplayName = self->_guardianDisplayName;
    if ((unint64_t)guardianDisplayName | v4[1]) {
      char v7 = -[NSString isEqual:](guardianDisplayName, "isEqual:");
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
  return [(NSString *)self->_guardianDisplayName hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[HDCodableTinkerOptInRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[HDCodableTinkerOptInRequest setGuardianDisplayName:](self, "setGuardianDisplayName:");
    id v4 = v5;
  }
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)guardianDisplayName
{
  return self->_guardianDisplayName;
}

- (void)setGuardianDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_guardianDisplayName, 0);
}

@end