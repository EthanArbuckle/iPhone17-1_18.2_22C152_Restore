@interface HDCodableAuthorizationCompleteMessage
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasErrorDescription;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)requestIdentifier;
- (NSString)appBundleIdentifier;
- (NSString)errorDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableAuthorizationCompleteMessage

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableAuthorizationCompleteMessage;
  v4 = [(HDCodableAuthorizationCompleteMessage *)&v8 description];
  v5 = [(HDCodableAuthorizationCompleteMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v3 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v4 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationCompleteMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v4, "setAppBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_requestIdentifier)
  {
    objc_msgSend(v5, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_requestIdentifier copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[1]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[3]))
     || -[NSData isEqual:](requestIdentifier, "isEqual:")))
  {
    errorDescription = self->_errorDescription;
    if ((unint64_t)errorDescription | v4[2]) {
      char v8 = -[NSString isEqual:](errorDescription, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_appBundleIdentifier hash];
  uint64_t v4 = [(NSData *)self->_requestIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_errorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[HDCodableAuthorizationCompleteMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  }
  if (v4[3]) {
    -[HDCodableAuthorizationCompleteMessage setRequestIdentifier:](self, "setRequestIdentifier:");
  }
  if (v4[2]) {
    -[HDCodableAuthorizationCompleteMessage setErrorDescription:](self, "setErrorDescription:");
  }
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSData)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end