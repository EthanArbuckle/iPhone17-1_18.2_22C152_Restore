@interface PDDPQueryRequest
- (BOOL)hasFilterQuery;
- (BOOL)hasIncludeChildren;
- (BOOL)hasQueryZone;
- (BOOL)includeChildren;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (PDDPSchoolworkQueryZone)queryZone;
- (PDDPSchoolworkSearchQuery)filterQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFilterQuery:(id)a3;
- (void)setHasIncludeChildren:(BOOL)a3;
- (void)setIncludeChildren:(BOOL)a3;
- (void)setQueryZone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPQueryRequest

- (BOOL)hasQueryZone
{
  return self->_queryZone != 0;
}

- (BOOL)hasFilterQuery
{
  return self->_filterQuery != 0;
}

- (void)setIncludeChildren:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_includeChildren = a3;
}

- (void)setHasIncludeChildren:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIncludeChildren
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPQueryRequest;
  v3 = [(PDDPQueryRequest *)&v7 description];
  v4 = [(PDDPQueryRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  queryZone = self->_queryZone;
  if (queryZone)
  {
    v5 = [(PDDPSchoolworkQueryZone *)queryZone dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"query_zone"];
  }
  filterQuery = self->_filterQuery;
  if (filterQuery)
  {
    objc_super v7 = [(PDDPSchoolworkSearchQuery *)filterQuery dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"filter_query"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithBool:self->_includeChildren];
    [v3 setObject:v8 forKey:@"include_children"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_36;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          uint64_t v17 = 0;
          goto LABEL_38;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_38:
      self->_includeChildren = v17 != 0;
    }
    else
    {
      if (v13 == 2)
      {
        v14 = objc_alloc_init(PDDPSchoolworkSearchQuery);
        objc_storeStrong((id *)&self->_filterQuery, v14);
        if (!PBReaderPlaceMark() || (sub_1000A26B0((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {
LABEL_41:

          LOBYTE(v20) = 0;
          return v20;
        }
      }
      else
      {
        if (v13 != 1)
        {
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
        }
        v14 = objc_alloc_init(PDDPSchoolworkQueryZone);
        objc_storeStrong((id *)&self->_queryZone, v14);
        if (!PBReaderPlaceMark() || (sub_1000A4F24((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
          goto LABEL_41;
        }
      }
      PBReaderRecallMark();
    }
  }
  LOBYTE(v20) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_queryZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_filterQuery)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 13;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_queryZone)
  {
    objc_msgSend(v4, "setQueryZone:");
    id v4 = v5;
  }
  if (self->_filterQuery)
  {
    objc_msgSend(v5, "setFilterQuery:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_includeChildren;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPSchoolworkQueryZone *)self->_queryZone copyWithZone:a3];
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDDPSchoolworkSearchQuery *)self->_filterQuery copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_includeChildren;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  queryZone = self->_queryZone;
  if ((unint64_t)queryZone | *((void *)v4 + 2))
  {
    if (!-[PDDPSchoolworkQueryZone isEqual:](queryZone, "isEqual:")) {
      goto LABEL_8;
    }
  }
  filterQuery = self->_filterQuery;
  if ((unint64_t)filterQuery | *((void *)v4 + 1))
  {
    if (!-[PDDPSchoolworkSearchQuery isEqual:](filterQuery, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_includeChildren)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPSchoolworkQueryZone *)self->_queryZone hash];
  unint64_t v4 = [(PDDPSchoolworkSearchQuery *)self->_filterQuery hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_includeChildren;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  queryZone = self->_queryZone;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (queryZone)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDDPSchoolworkQueryZone mergeFrom:](queryZone, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDDPQueryRequest setQueryZone:](self, "setQueryZone:");
  }
  id v4 = v9;
LABEL_7:
  filterQuery = self->_filterQuery;
  uint64_t v8 = *((void *)v4 + 1);
  if (filterQuery)
  {
    if (!v8) {
      goto LABEL_13;
    }
    filterQuery = (PDDPSchoolworkSearchQuery *)-[PDDPSchoolworkSearchQuery mergeFrom:](filterQuery, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    filterQuery = (PDDPSchoolworkSearchQuery *)-[PDDPQueryRequest setFilterQuery:](self, "setFilterQuery:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 28))
  {
    self->_includeChildren = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1(filterQuery, v4);
}

- (PDDPSchoolworkQueryZone)queryZone
{
  return self->_queryZone;
}

- (void)setQueryZone:(id)a3
{
}

- (PDDPSchoolworkSearchQuery)filterQuery
{
  return self->_filterQuery;
}

- (void)setFilterQuery:(id)a3
{
}

- (BOOL)includeChildren
{
  return self->_includeChildren;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryZone, 0);

  objc_storeStrong((id *)&self->_filterQuery, 0);
}

@end