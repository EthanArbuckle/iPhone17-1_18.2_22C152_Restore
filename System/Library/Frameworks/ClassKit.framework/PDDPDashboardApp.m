@interface PDDPDashboardApp
- (BOOL)hasAppIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPDashboardApp

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPDashboardApp;
  v3 = [(PDDPDashboardApp *)&v7 description];
  v4 = [(PDDPDashboardApp *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v3 setObject:appIdentifier forKey:@"app_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001626D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_appIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [a3 setAppIdentifier:appIdentifier];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    appIdentifier = self->_appIdentifier;
    if ((unint64_t)appIdentifier | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](appIdentifier, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_appIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PDDPDashboardApp setAppIdentifier:](self, "setAppIdentifier:");
  }
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end