@interface HDCodableTinkerPairingResponse
- (BOOL)hasError;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasSetupMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableError)error;
- (HDCodableSharingSetupMetadata)setupMetadata;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSetupMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableTinkerPairingResponse

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasSetupMetadata
{
  return self->_setupMetadata != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableTinkerPairingResponse;
  v4 = [(HDCodableTinkerPairingResponse *)&v8 description];
  v5 = [(HDCodableTinkerPairingResponse *)self dictionaryRepresentation];
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
  setupMetadata = self->_setupMetadata;
  if (setupMetadata)
  {
    v7 = [(HDCodableSharingSetupMetadata *)setupMetadata dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"setupMetadata"];
  }
  error = self->_error;
  if (error)
  {
    v9 = [(HDCodableError *)error dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"error"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerPairingResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_setupMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_setupMetadata)
  {
    objc_msgSend(v5, "setSetupMetadata:");
    id v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HDCodableSharingSetupMetadata *)self->_setupMetadata copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(HDCodableError *)self->_error copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((setupMetadata = self->_setupMetadata, !((unint64_t)setupMetadata | v4[3]))
     || -[HDCodableSharingSetupMetadata isEqual:](setupMetadata, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      char v8 = -[HDCodableError isEqual:](error, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  unint64_t v4 = [(HDCodableSharingSetupMetadata *)self->_setupMetadata hash] ^ v3;
  return v4 ^ [(HDCodableError *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[HDCodableTinkerPairingResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    unint64_t v4 = v9;
  }
  setupMetadata = self->_setupMetadata;
  uint64_t v6 = v4[3];
  if (setupMetadata)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableSharingSetupMetadata mergeFrom:](setupMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableTinkerPairingResponse setSetupMetadata:](self, "setSetupMetadata:");
  }
  unint64_t v4 = v9;
LABEL_9:
  error = self->_error;
  uint64_t v8 = v4[1];
  if (error)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableTinkerPairingResponse setError:](self, "setError:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (HDCodableSharingSetupMetadata)setupMetadata
{
  return self->_setupMetadata;
}

- (void)setSetupMetadata:(id)a3
{
}

- (HDCodableError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupMetadata, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end