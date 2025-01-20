@interface PDDPCollection
- (BOOL)hasCollectionItemLocation;
- (BOOL)hasDateClassCreated;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayName;
- (BOOL)hasIconIdentifier;
- (BOOL)hasObjectId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)collectionItemLocation;
- (NSString)displayName;
- (NSString)iconIdentifier;
- (NSString)objectId;
- (PDDPDate)dateClassCreated;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionItemLocation:(id)a3;
- (void)setDateClassCreated:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIconIdentifier:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPCollection

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F4708[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_COLLECTION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ARCHIVED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RETURNED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasCollectionItemLocation
{
  return self->_collectionItemLocation != 0;
}

- (BOOL)hasIconIdentifier
{
  return self->_iconIdentifier != 0;
}

- (BOOL)hasDateClassCreated
{
  return self->_dateClassCreated != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPCollection;
  id v3 = [(PDDPCollection *)&v7 description];
  int v4 = [(PDDPCollection *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = off_1001F4708[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"display_name"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v9 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v11 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"date_last_modified"];
  }
  collectionItemLocation = self->_collectionItemLocation;
  if (collectionItemLocation) {
    [v3 setObject:collectionItemLocation forKey:@"collection_item_location"];
  }
  iconIdentifier = self->_iconIdentifier;
  if (iconIdentifier) {
    [v3 setObject:iconIdentifier forKey:@"icon_identifier"];
  }
  dateClassCreated = self->_dateClassCreated;
  if (dateClassCreated)
  {
    v15 = [(PDDPDate *)dateClassCreated dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"date_class_created"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E3960((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_objectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayName)
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
  if (self->_collectionItemLocation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_iconIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dateClassCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_type;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  id v5 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
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
  if (self->_collectionItemLocation)
  {
    objc_msgSend(v5, "setCollectionItemLocation:");
    id v4 = v5;
  }
  if (self->_iconIdentifier)
  {
    objc_msgSend(v5, "setIconIdentifier:");
    id v4 = v5;
  }
  if (self->_dateClassCreated)
  {
    objc_msgSend(v5, "setDateClassCreated:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 16) = self->_type;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  id v7 = [(NSString *)self->_objectId copyWithZone:a3];
  v8 = (void *)v6[7];
  v6[7] = v7;

  id v9 = [(NSString *)self->_displayName copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  id v15 = [(NSString *)self->_collectionItemLocation copyWithZone:a3];
  v16 = (void *)v6[1];
  v6[1] = v15;

  id v17 = [(NSString *)self->_iconIdentifier copyWithZone:a3];
  v18 = (void *)v6[6];
  v6[6] = v17;

  id v19 = [(PDDPDate *)self->_dateClassCreated copyWithZone:a3];
  v20 = (void *)v6[2];
  v6[2] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_21:
    unsigned __int8 v12 = 0;
    goto LABEL_22;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 7) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_21;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_21;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_21;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 4))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_21;
    }
  }
  collectionItemLocation = self->_collectionItemLocation;
  if ((unint64_t)collectionItemLocation | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](collectionItemLocation, "isEqual:")) {
      goto LABEL_21;
    }
  }
  iconIdentifier = self->_iconIdentifier;
  if ((unint64_t)iconIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](iconIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  dateClassCreated = self->_dateClassCreated;
  if ((unint64_t)dateClassCreated | *((void *)v4 + 2)) {
    unsigned __int8 v12 = -[PDDPDate isEqual:](dateClassCreated, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_objectId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  unint64_t v6 = v4 ^ v5 ^ [(PDDPDate *)self->_dateCreated hash];
  unint64_t v7 = [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_collectionItemLocation hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_iconIdentifier hash];
  return v9 ^ [(PDDPDate *)self->_dateClassCreated hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (*((unsigned char *)v4 + 68))
  {
    self->_uint64_t type = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  unsigned __int8 v12 = v4;
  if (*((void *)v4 + 7))
  {
    -[PDDPCollection setObjectId:](self, "setObjectId:");
    NSUInteger v5 = v12;
  }
  if (v5[5])
  {
    -[PDDPCollection setDisplayName:](self, "setDisplayName:");
    NSUInteger v5 = v12;
  }
  dateCreated = self->_dateCreated;
  uint64_t v7 = v5[3];
  if (dateCreated)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[PDDPCollection setDateCreated:](self, "setDateCreated:");
  }
  NSUInteger v5 = v12;
LABEL_13:
  dateLastModified = self->_dateLastModified;
  uint64_t v9 = v5[4];
  if (dateLastModified)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[PDDPCollection setDateLastModified:](self, "setDateLastModified:");
  }
  NSUInteger v5 = v12;
LABEL_19:
  if (v5[1])
  {
    -[PDDPCollection setCollectionItemLocation:](self, "setCollectionItemLocation:");
    NSUInteger v5 = v12;
  }
  if (v5[6])
  {
    -[PDDPCollection setIconIdentifier:](self, "setIconIdentifier:");
    NSUInteger v5 = v12;
  }
  dateClassCreated = self->_dateClassCreated;
  uint64_t v11 = v5[2];
  if (dateClassCreated)
  {
    if (!v11) {
      goto LABEL_29;
    }
    dateClassCreated = (PDDPDate *)-[PDDPDate mergeFrom:](dateClassCreated, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_29;
    }
    dateClassCreated = (PDDPDate *)-[PDDPCollection setDateClassCreated:](self, "setDateClassCreated:");
  }
  NSUInteger v5 = v12;
LABEL_29:

  _objc_release_x1(dateClassCreated, v5);
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
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

- (NSString)collectionItemLocation
{
  return self->_collectionItemLocation;
}

- (void)setCollectionItemLocation:(id)a3
{
}

- (NSString)iconIdentifier
{
  return self->_iconIdentifier;
}

- (void)setIconIdentifier:(id)a3
{
}

- (PDDPDate)dateClassCreated
{
  return self->_dateClassCreated;
}

- (void)setDateClassCreated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_iconIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dateClassCreated, 0);

  objc_storeStrong((id *)&self->_collectionItemLocation, 0);
}

@end