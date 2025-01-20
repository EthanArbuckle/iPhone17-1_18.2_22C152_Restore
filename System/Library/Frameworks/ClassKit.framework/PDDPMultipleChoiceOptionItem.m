@interface PDDPMultipleChoiceOptionItem
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasDisplayOrder;
- (BOOL)hasObjectId;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)objectId;
- (NSString)text;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)displayOrder;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPMultipleChoiceOptionItem

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)setDisplayOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayOrder = a3;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPMultipleChoiceOptionItem;
  v3 = [(PDDPMultipleChoiceOptionItem *)&v7 description];
  v4 = [(PDDPMultipleChoiceOptionItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    objc_super v7 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v9 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"date_last_modified"];
  }
  text = self->_text;
  if (text) {
    [v4 setObject:text forKey:@"text"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = +[NSNumber numberWithInt:self->_displayOrder];
    [v4 setObject:v11 forKey:@"display_order"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100131F48((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
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
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
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
  if (self->_text)
  {
    objc_msgSend(v5, "setText:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_displayOrder;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSString *)self->_text copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_displayOrder;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 1))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_14;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 2))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_14;
    }
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](text, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_displayOrder == *((_DWORD *)v4 + 6))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v5 = [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v6 = [(NSString *)self->_text hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_displayOrder;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  BOOL v9 = v4;
  if (*((void *)v4 + 4))
  {
    -[PDDPMultipleChoiceOptionItem setObjectId:](self, "setObjectId:");
    unint64_t v4 = v9;
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 1);
  if (dateCreated)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[PDDPMultipleChoiceOptionItem setDateCreated:](self, "setDateCreated:");
  }
  unint64_t v4 = v9;
LABEL_9:
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 2);
  if (dateLastModified)
  {
    if (!v8) {
      goto LABEL_15;
    }
    dateLastModified = (PDDPDate *)-[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    dateLastModified = (PDDPDate *)-[PDDPMultipleChoiceOptionItem setDateLastModified:](self, "setDateLastModified:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if (*((void *)v4 + 5))
  {
    dateLastModified = (PDDPDate *)-[PDDPMultipleChoiceOptionItem setText:](self, "setText:");
    unint64_t v4 = v9;
  }
  if (v4[12])
  {
    self->_displayOrder = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1(dateLastModified, v4);
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
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

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end