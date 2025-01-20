@interface PDDPClass
- (BOOL)hasClassId;
- (BOOL)hasClassName;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayName;
- (BOOL)hasEntityMeta;
- (BOOL)hasIconIdentifier;
- (BOOL)hasLocationId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)classId;
- (NSString)className;
- (NSString)displayName;
- (NSString)iconIdentifier;
- (NSString)locationId;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPEntityMeta)entityMeta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassId:(id)a3;
- (void)setClassName:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEntityMeta:(id)a3;
- (void)setIconIdentifier:(id)a3;
- (void)setLocationId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPClass

- (BOOL)hasClassId
{
  return self->_classId != 0;
}

- (BOOL)hasClassName
{
  return self->_className != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (BOOL)hasEntityMeta
{
  return self->_entityMeta != 0;
}

- (BOOL)hasIconIdentifier
{
  return self->_iconIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPClass;
  v3 = [(PDDPClass *)&v7 description];
  v4 = [(PDDPClass *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  classId = self->_classId;
  if (classId) {
    [v3 setObject:classId forKey:@"class_id"];
  }
  className = self->_className;
  if (className) {
    [v4 setObject:className forKey:@"class_name"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v8 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v10 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_last_modified"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"display_name"];
  }
  locationId = self->_locationId;
  if (locationId) {
    [v4 setObject:locationId forKey:@"location_id"];
  }
  entityMeta = self->_entityMeta;
  if (entityMeta)
  {
    v14 = [(PDDPEntityMeta *)entityMeta dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"entity_meta"];
  }
  iconIdentifier = self->_iconIdentifier;
  if (iconIdentifier) {
    [v4 setObject:iconIdentifier forKey:@"icon_identifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F6DF0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_classId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_className)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_dateLastModified)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_entityMeta)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_iconIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_classId)
  {
    objc_msgSend(v4, "setClassId:");
    id v4 = v5;
  }
  if (self->_className)
  {
    objc_msgSend(v5, "setClassName:");
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v5, "setDateCreated:");
    id v4 = v5;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v5, "setDateLastModified:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_locationId)
  {
    objc_msgSend(v5, "setLocationId:");
    id v4 = v5;
  }
  if (self->_entityMeta)
  {
    objc_msgSend(v5, "setEntityMeta:");
    id v4 = v5;
  }
  if (self->_iconIdentifier)
  {
    objc_msgSend(v5, "setIconIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_classId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_className copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(NSString *)self->_displayName copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSString *)self->_locationId copyWithZone:a3];
  v17 = (void *)v5[8];
  v5[8] = v16;

  id v18 = [(PDDPEntityMeta *)self->_entityMeta copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  id v20 = [(NSString *)self->_iconIdentifier copyWithZone:a3];
  v21 = (void *)v5[7];
  v5[7] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((classId = self->_classId, !((unint64_t)classId | v4[1]))
     || -[NSString isEqual:](classId, "isEqual:"))
    && ((className = self->_className, !((unint64_t)className | v4[2]))
     || -[NSString isEqual:](className, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[3]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[4]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[5]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((locationId = self->_locationId, !((unint64_t)locationId | v4[8]))
     || -[NSString isEqual:](locationId, "isEqual:"))
    && ((entityMeta = self->_entityMeta, !((unint64_t)entityMeta | v4[6]))
     || -[PDDPEntityMeta isEqual:](entityMeta, "isEqual:")))
  {
    iconIdentifier = self->_iconIdentifier;
    if ((unint64_t)iconIdentifier | v4[7]) {
      unsigned __int8 v13 = -[NSString isEqual:](iconIdentifier, "isEqual:");
    }
    else {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_classId hash];
  unint64_t v4 = [(NSString *)self->_className hash] ^ v3;
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v7 = [(NSString *)self->_displayName hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_locationId hash];
  unint64_t v9 = v6 ^ v8 ^ [(PDDPEntityMeta *)self->_entityMeta hash];
  return v9 ^ [(NSString *)self->_iconIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  if (v10[1]) {
    -[PDDPClass setClassId:](self, "setClassId:");
  }
  if (v10[2]) {
    -[PDDPClass setClassName:](self, "setClassName:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v5 = v10[3];
  if (dateCreated)
  {
    if (v5) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PDDPClass setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v7 = v10[4];
  if (dateLastModified)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPClass setDateLastModified:](self, "setDateLastModified:");
  }
  if (v10[5]) {
    -[PDDPClass setDisplayName:](self, "setDisplayName:");
  }
  if (v10[8]) {
    -[PDDPClass setLocationId:](self, "setLocationId:");
  }
  entityMeta = self->_entityMeta;
  uint64_t v9 = v10[6];
  if (entityMeta)
  {
    if (v9) {
      -[PDDPEntityMeta mergeFrom:](entityMeta, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPClass setEntityMeta:](self, "setEntityMeta:");
  }
  if (v10[7]) {
    -[PDDPClass setIconIdentifier:](self, "setIconIdentifier:");
  }
}

- (NSString)classId
{
  return self->_classId;
}

- (void)setClassId:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (PDDPEntityMeta)entityMeta
{
  return self->_entityMeta;
}

- (void)setEntityMeta:(id)a3
{
}

- (NSString)iconIdentifier
{
  return self->_iconIdentifier;
}

- (void)setIconIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_iconIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMeta, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_className, 0);

  objc_storeStrong((id *)&self->_classId, 0);
}

@end