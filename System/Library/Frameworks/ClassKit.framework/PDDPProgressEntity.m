@interface PDDPProgressEntity
- (BOOL)hasAppIdentifier;
- (BOOL)hasDateCreated;
- (BOOL)hasObjectId;
- (BOOL)hasObjectIdPath;
- (BOOL)hasParentObjectId;
- (BOOL)hasStableObjectIdPath;
- (BOOL)hasStableParentObjectId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appIdentifier;
- (NSString)objectId;
- (NSString)objectIdPath;
- (NSString)parentObjectId;
- (NSString)stableObjectIdPath;
- (NSString)stableParentObjectId;
- (PDDPDate)dateCreated;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setObjectIdPath:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setStableObjectIdPath:(id)a3;
- (void)setStableParentObjectId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPProgressEntity

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
  if (a3 >= 7)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F3530 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ENTITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIME_INTERVAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACTIVITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_QUANTITY_ITEM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_BINARY_ITEM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ACTIVITY_SCORE_ITEM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RANGE"])
  {
    int v4 = 6;
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

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)hasObjectIdPath
{
  return self->_objectIdPath != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasStableParentObjectId
{
  return self->_stableParentObjectId != 0;
}

- (BOOL)hasStableObjectIdPath
{
  return self->_stableObjectIdPath != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPProgressEntity;
  id v3 = [(PDDPProgressEntity *)&v7 description];
  int v4 = [(PDDPProgressEntity *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 7)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v5 = *(&off_1001F3530 + type);
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v3 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v3 setObject:appIdentifier forKey:@"app_identifier"];
  }
  objectIdPath = self->_objectIdPath;
  if (objectIdPath) {
    [v3 setObject:objectIdPath forKey:@"object_id_path"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v11 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"date_created"];
  }
  stableParentObjectId = self->_stableParentObjectId;
  if (stableParentObjectId) {
    [v3 setObject:stableParentObjectId forKey:@"stable_parent_object_id"];
  }
  stableObjectIdPath = self->_stableObjectIdPath;
  if (stableObjectIdPath) {
    [v3 setObject:stableObjectIdPath forKey:@"stable_object_id_path"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100073574((uint64_t)self, (uint64_t)a3);
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
  if (self->_parentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_objectIdPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_stableParentObjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_stableObjectIdPath)
  {
    PBDataWriterWriteStringField();
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
  if (self->_parentObjectId)
  {
    objc_msgSend(v5, "setParentObjectId:");
    id v4 = v5;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v5, "setAppIdentifier:");
    id v4 = v5;
  }
  if (self->_objectIdPath)
  {
    objc_msgSend(v5, "setObjectIdPath:");
    id v4 = v5;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v5, "setDateCreated:");
    id v4 = v5;
  }
  if (self->_stableParentObjectId)
  {
    objc_msgSend(v5, "setStableParentObjectId:");
    id v4 = v5;
  }
  if (self->_stableObjectIdPath)
  {
    objc_msgSend(v5, "setStableObjectIdPath:");
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
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(NSString *)self->_objectIdPath copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  id v15 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v16 = (void *)v6[2];
  v6[2] = v15;

  id v17 = [(NSString *)self->_stableParentObjectId copyWithZone:a3];
  v18 = (void *)v6[7];
  v6[7] = v17;

  id v19 = [(NSString *)self->_stableObjectIdPath copyWithZone:a3];
  v20 = (void *)v6[6];
  v6[6] = v19;

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
  if ((unint64_t)objectId | *((void *)v4 + 3) && !-[NSString isEqual:](objectId, "isEqual:")) {
    goto LABEL_21;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentObjectId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  objectIdPath = self->_objectIdPath;
  if ((unint64_t)objectIdPath | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](objectIdPath, "isEqual:")) {
      goto LABEL_21;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_21;
    }
  }
  stableParentObjectId = self->_stableParentObjectId;
  if ((unint64_t)stableParentObjectId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](stableParentObjectId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  stableObjectIdPath = self->_stableObjectIdPath;
  if ((unint64_t)stableObjectIdPath | *((void *)v4 + 6)) {
    unsigned __int8 v12 = -[NSString isEqual:](stableObjectIdPath, "isEqual:");
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
  NSUInteger v5 = [(NSString *)self->_parentObjectId hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_appIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_objectIdPath hash];
  unint64_t v8 = v7 ^ [(PDDPDate *)self->_dateCreated hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_stableParentObjectId hash];
  return v9 ^ [(NSString *)self->_stableObjectIdPath hash];
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
  unint64_t v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[PDDPProgressEntity setObjectId:](self, "setObjectId:");
    NSUInteger v5 = v8;
  }
  if (v5[5])
  {
    -[PDDPProgressEntity setParentObjectId:](self, "setParentObjectId:");
    NSUInteger v5 = v8;
  }
  if (v5[1])
  {
    -[PDDPProgressEntity setAppIdentifier:](self, "setAppIdentifier:");
    NSUInteger v5 = v8;
  }
  if (v5[4])
  {
    -[PDDPProgressEntity setObjectIdPath:](self, "setObjectIdPath:");
    NSUInteger v5 = v8;
  }
  dateCreated = self->_dateCreated;
  uint64_t v7 = v5[2];
  if (dateCreated)
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PDDPProgressEntity setDateCreated:](self, "setDateCreated:");
  }
  NSUInteger v5 = v8;
LABEL_17:
  if (v5[7])
  {
    -[PDDPProgressEntity setStableParentObjectId:](self, "setStableParentObjectId:");
    NSUInteger v5 = v8;
  }
  if (v5[6]) {
    -[PDDPProgressEntity setStableObjectIdPath:](self, "setStableObjectIdPath:");
  }

  _objc_release_x1();
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)objectIdPath
{
  return self->_objectIdPath;
}

- (void)setObjectIdPath:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSString)stableParentObjectId
{
  return self->_stableParentObjectId;
}

- (void)setStableParentObjectId:(id)a3
{
}

- (NSString)stableObjectIdPath
{
  return self->_stableObjectIdPath;
}

- (void)setStableObjectIdPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableParentObjectId, 0);
  objc_storeStrong((id *)&self->_stableObjectIdPath, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectIdPath, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end