@interface HDCodableAuthorizationResponseMessage
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasErrorDescription;
- (BOOL)hasHostAppName;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasShouldPrompt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldPrompt;
- (NSData)requestIdentifier;
- (NSString)appBundleIdentifier;
- (NSString)errorDescription;
- (NSString)hostAppName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasShouldPrompt:(BOOL)a3;
- (void)setHostAppName:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setShouldPrompt:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableAuthorizationResponseMessage

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (void)setShouldPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldPrompt = a3;
}

- (void)setHasShouldPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldPrompt
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHostAppName
{
  return self->_hostAppName != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableAuthorizationResponseMessage;
  v4 = [(HDCodableAuthorizationResponseMessage *)&v8 description];
  v5 = [(HDCodableAuthorizationResponseMessage *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_shouldPrompt];
    [v4 setObject:v7 forKey:@"shouldPrompt"];
  }
  hostAppName = self->_hostAppName;
  if (hostAppName) {
    [v4 setObject:hostAppName forKey:@"hostAppName"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationResponseMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hostAppName)
  {
    PBDataWriterWriteStringField();
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
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_shouldPrompt;
    v4[44] |= 1u;
  }
  if (self->_hostAppName)
  {
    objc_msgSend(v5, "setHostAppName:");
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
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_requestIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_shouldPrompt;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_hostAppName copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_shouldPrompt)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_18;
  }
LABEL_14:
  hostAppName = self->_hostAppName;
  if ((unint64_t)hostAppName | *((void *)v4 + 3)
    && !-[NSString isEqual:](hostAppName, "isEqual:"))
  {
    goto LABEL_18;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](errorDescription, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleIdentifier hash];
  uint64_t v4 = [(NSData *)self->_requestIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_shouldPrompt;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_hostAppName hash];
  return v6 ^ [(NSString *)self->_errorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[HDCodableAuthorizationResponseMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableAuthorizationResponseMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[44])
  {
    self->_shouldPrompt = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableAuthorizationResponseMessage setHostAppName:](self, "setHostAppName:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[HDCodableAuthorizationResponseMessage setErrorDescription:](self, "setErrorDescription:");
    uint64_t v4 = v5;
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

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
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
  objc_storeStrong((id *)&self->_hostAppName, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end