@interface HDCodableCompanionUserNotificationRequest
- (BOOL)hasNotificationConfiguration;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableCompanionUserNotificationConfiguration)notificationConfiguration;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNotificationConfiguration:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCompanionUserNotificationRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasNotificationConfiguration
{
  return self->_notificationConfiguration != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCompanionUserNotificationRequest;
  v4 = [(HDCodableCompanionUserNotificationRequest *)&v8 description];
  v5 = [(HDCodableCompanionUserNotificationRequest *)self dictionaryRepresentation];
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
  notificationConfiguration = self->_notificationConfiguration;
  if (notificationConfiguration)
  {
    v7 = [(HDCodableCompanionUserNotificationConfiguration *)notificationConfiguration dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"notificationConfiguration"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCompanionUserNotificationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_notificationConfiguration)
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
  if (self->_notificationConfiguration)
  {
    objc_msgSend(v5, "setNotificationConfiguration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HDCodableCompanionUserNotificationConfiguration *)self->_notificationConfiguration copyWithZone:a3];
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
    notificationConfiguration = self->_notificationConfiguration;
    if ((unint64_t)notificationConfiguration | v4[1]) {
      char v7 = -[HDCodableCompanionUserNotificationConfiguration isEqual:](notificationConfiguration, "isEqual:");
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
  return [(HDCodableCompanionUserNotificationConfiguration *)self->_notificationConfiguration hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[HDCodableCompanionUserNotificationRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    id v4 = v7;
  }
  notificationConfiguration = self->_notificationConfiguration;
  uint64_t v6 = v4[1];
  if (notificationConfiguration)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableCompanionUserNotificationConfiguration mergeFrom:](notificationConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableCompanionUserNotificationRequest setNotificationConfiguration:](self, "setNotificationConfiguration:");
  }
  id v4 = v7;
LABEL_9:
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (HDCodableCompanionUserNotificationConfiguration)notificationConfiguration
{
  return self->_notificationConfiguration;
}

- (void)setNotificationConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_notificationConfiguration, 0);
}

@end