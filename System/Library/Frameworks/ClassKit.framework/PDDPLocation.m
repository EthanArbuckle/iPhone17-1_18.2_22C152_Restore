@interface PDDPLocation
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEntityMeta;
- (BOOL)hasLocationId;
- (BOOL)hasLocationName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locationId;
- (NSString)locationName;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (PDDPEntityMeta)entityMeta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEntityMeta:(id)a3;
- (void)setLocationId:(id)a3;
- (void)setLocationName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPLocation

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (BOOL)hasLocationName
{
  return self->_locationName != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasEntityMeta
{
  return self->_entityMeta != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPLocation;
  v3 = [(PDDPLocation *)&v7 description];
  v4 = [(PDDPLocation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  locationId = self->_locationId;
  if (locationId) {
    [v3 setObject:locationId forKey:@"location_id"];
  }
  locationName = self->_locationName;
  if (locationName) {
    [v4 setObject:locationName forKey:@"location_name"];
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
  entityMeta = self->_entityMeta;
  if (entityMeta)
  {
    v12 = [(PDDPEntityMeta *)entityMeta dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"entity_meta"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10014CCB0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locationName)
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
  if (self->_entityMeta)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locationId)
  {
    objc_msgSend(v4, "setLocationId:");
    id v4 = v5;
  }
  if (self->_locationName)
  {
    objc_msgSend(v5, "setLocationName:");
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
  if (self->_entityMeta)
  {
    objc_msgSend(v5, "setEntityMeta:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_locationId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_locationName copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(PDDPEntityMeta *)self->_entityMeta copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((locationId = self->_locationId, !((unint64_t)locationId | v4[4]))
     || -[NSString isEqual:](locationId, "isEqual:"))
    && ((locationName = self->_locationName, !((unint64_t)locationName | v4[5]))
     || -[NSString isEqual:](locationName, "isEqual:"))
    && ((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[1]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[2]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:")))
  {
    entityMeta = self->_entityMeta;
    if ((unint64_t)entityMeta | v4[3]) {
      unsigned __int8 v10 = -[PDDPEntityMeta isEqual:](entityMeta, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locationId hash];
  unint64_t v4 = [(NSString *)self->_locationName hash] ^ v3;
  unint64_t v5 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateLastModified hash];
  return v6 ^ [(PDDPEntityMeta *)self->_entityMeta hash];
}

- (void)mergeFrom:(id)a3
{
  unsigned __int8 v10 = a3;
  if (v10[4]) {
    -[PDDPLocation setLocationId:](self, "setLocationId:");
  }
  if (v10[5]) {
    -[PDDPLocation setLocationName:](self, "setLocationName:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v5 = v10[1];
  if (dateCreated)
  {
    if (v5) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PDDPLocation setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v7 = v10[2];
  if (dateLastModified)
  {
    if (v7) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PDDPLocation setDateLastModified:](self, "setDateLastModified:");
  }
  entityMeta = self->_entityMeta;
  uint64_t v9 = v10[3];
  if (entityMeta)
  {
    if (v9) {
      -[PDDPEntityMeta mergeFrom:](entityMeta, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PDDPLocation setEntityMeta:](self, "setEntityMeta:");
  }
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
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

- (PDDPEntityMeta)entityMeta
{
  return self->_entityMeta;
}

- (void)setEntityMeta:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_entityMeta, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end