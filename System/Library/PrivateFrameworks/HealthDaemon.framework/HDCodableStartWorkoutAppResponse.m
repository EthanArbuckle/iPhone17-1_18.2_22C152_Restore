@interface HDCodableStartWorkoutAppResponse
- (BOOL)hasLaunchError;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (HDCodableError)launchError;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setLaunchError:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableStartWorkoutAppResponse

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLaunchError
{
  return self->_launchError != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStartWorkoutAppResponse;
  v4 = [(HDCodableStartWorkoutAppResponse *)&v8 description];
  v5 = [(HDCodableStartWorkoutAppResponse *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_success];
    [v4 setObject:v6 forKey:@"success"];
  }
  launchError = self->_launchError;
  if (launchError)
  {
    objc_super v8 = [(HDCodableError *)launchError dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"launchError"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStartWorkoutAppResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_launchError)
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
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_success;
    v4[28] |= 1u;
  }
  if (self->_launchError)
  {
    objc_msgSend(v5, "setLaunchError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_success;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v8 = [(HDCodableError *)self->_launchError copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_success)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  launchError = self->_launchError;
  if ((unint64_t)launchError | *((void *)v4 + 1)) {
    char v6 = -[HDCodableError isEqual:](launchError, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_success;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(HDCodableError *)self->_launchError hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[HDCodableStartWorkoutAppResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    uint64_t v4 = v7;
  }
  if (v4[28])
  {
    self->_success = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  launchError = self->_launchError;
  uint64_t v6 = *((void *)v4 + 1);
  if (launchError)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableError mergeFrom:](launchError, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableStartWorkoutAppResponse setLaunchError:](self, "setLaunchError:");
  }
  uint64_t v4 = v7;
LABEL_11:
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (HDCodableError)launchError
{
  return self->_launchError;
}

- (void)setLaunchError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_launchError, 0);
}

@end