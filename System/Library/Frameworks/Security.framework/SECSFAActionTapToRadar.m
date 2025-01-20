@interface SECSFAActionTapToRadar
- (BOOL)hasAlert;
- (BOOL)hasComponentID;
- (BOOL)hasComponentName;
- (BOOL)hasComponentVersion;
- (BOOL)hasRadarDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)alert;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlert:(id)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAActionTapToRadar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentID, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

- (void)setComponentID:(id)a3
{
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setAlert:(id)a3
{
}

- (NSString)alert
{
  return self->_alert;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[SECSFAActionTapToRadar setAlert:](self, "setAlert:");
  }
  if (v4[5]) {
    -[SECSFAActionTapToRadar setRadarDescription:](self, "setRadarDescription:");
  }
  if (v4[3]) {
    -[SECSFAActionTapToRadar setComponentName:](self, "setComponentName:");
  }
  if (v4[4]) {
    -[SECSFAActionTapToRadar setComponentVersion:](self, "setComponentVersion:");
  }
  if (v4[2]) {
    -[SECSFAActionTapToRadar setComponentID:](self, "setComponentID:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alert hash];
  NSUInteger v4 = [(NSString *)self->_radarDescription hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_componentName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_componentVersion hash];
  return v6 ^ [(NSString *)self->_componentID hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((alert = self->_alert, !((unint64_t)alert | v4[1]))
     || -[NSString isEqual:](alert, "isEqual:"))
    && ((radarDescription = self->_radarDescription, !((unint64_t)radarDescription | v4[5]))
     || -[NSString isEqual:](radarDescription, "isEqual:"))
    && ((componentName = self->_componentName, !((unint64_t)componentName | v4[3]))
     || -[NSString isEqual:](componentName, "isEqual:"))
    && ((componentVersion = self->_componentVersion, !((unint64_t)componentVersion | v4[4]))
     || -[NSString isEqual:](componentVersion, "isEqual:")))
  {
    componentID = self->_componentID;
    if ((unint64_t)componentID | v4[2]) {
      char v10 = -[NSString isEqual:](componentID, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_alert copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_radarDescription copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSString *)self->_componentName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_componentVersion copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_componentID copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alert)
  {
    objc_msgSend(v4, "setAlert:");
    id v4 = v5;
  }
  if (self->_radarDescription)
  {
    objc_msgSend(v5, "setRadarDescription:");
    id v4 = v5;
  }
  if (self->_componentName)
  {
    objc_msgSend(v5, "setComponentName:");
    id v4 = v5;
  }
  if (self->_componentVersion)
  {
    objc_msgSend(v5, "setComponentVersion:");
    id v4 = v5;
  }
  if (self->_componentID)
  {
    objc_msgSend(v5, "setComponentID:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alert)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_radarDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_componentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_componentVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_componentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionTapToRadarReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  alert = self->_alert;
  if (alert) {
    [v3 setObject:alert forKey:@"alert"];
  }
  radarDescription = self->_radarDescription;
  if (radarDescription) {
    [v4 setObject:radarDescription forKey:@"radarDescription"];
  }
  componentName = self->_componentName;
  if (componentName) {
    [v4 setObject:componentName forKey:@"componentName"];
  }
  componentVersion = self->_componentVersion;
  if (componentVersion) {
    [v4 setObject:componentVersion forKey:@"componentVersion"];
  }
  componentID = self->_componentID;
  if (componentID) {
    [v4 setObject:componentID forKey:@"componentID"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAActionTapToRadar;
  id v4 = [(SECSFAActionTapToRadar *)&v8 description];
  id v5 = [(SECSFAActionTapToRadar *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasComponentID
{
  return self->_componentID != 0;
}

- (BOOL)hasComponentVersion
{
  return self->_componentVersion != 0;
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (BOOL)hasRadarDescription
{
  return self->_radarDescription != 0;
}

- (BOOL)hasAlert
{
  return self->_alert != 0;
}

@end