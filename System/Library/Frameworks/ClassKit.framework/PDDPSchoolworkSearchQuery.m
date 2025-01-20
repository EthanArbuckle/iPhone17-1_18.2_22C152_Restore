@interface PDDPSchoolworkSearchQuery
+ (Class)contentsType;
- (BOOL)hasCriteria;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contents;
- (PDDPSchoolworkSearchCriteria)criteria;
- (id)contentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)contentsCount;
- (unint64_t)hash;
- (void)addContents:(id)a3;
- (void)clearContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSchoolworkSearchQuery

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
    v3 = off_1001F3BD0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SEARCH_QUERY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CRITERIA"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearContents
{
}

- (void)addContents:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSMutableArray *)contents addObject:v4];
}

- (unint64_t)contentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_contents count];
}

- (id)contentsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contents objectAtIndex:a3];
}

+ (Class)contentsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPSchoolworkSearchQuery;
  id v3 = [(PDDPSchoolworkSearchQuery *)&v7 description];
  id v4 = [(PDDPSchoolworkSearchQuery *)self dictionaryRepresentation];
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
      v5 = off_1001F3BD0[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  if ([(NSMutableArray *)self->_contents count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_contents, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v7 = self->_contents;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"contents"];
  }
  criteria = self->_criteria;
  if (criteria)
  {
    v14 = [(PDDPSchoolworkSearchCriteria *)criteria dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"criteria"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A26B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_contents;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_criteria) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v9 = v4;
  if ([(PDDPSchoolworkSearchQuery *)self contentsCount])
  {
    [v9 clearContents];
    unint64_t v5 = [(PDDPSchoolworkSearchQuery *)self contentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPSchoolworkSearchQuery *)self contentsAtIndex:i];
        [v9 addContents:v8];
      }
    }
  }
  if (self->_criteria) {
    objc_msgSend(v9, "setCriteria:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v7 = self->_contents;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v11), "copyWithZone:", a3, (void)v16);
        [v6 addContents:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(PDDPSchoolworkSearchCriteria *)self->_criteria copyWithZone:a3];
  v14 = (void *)v6[2];
  v6[2] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  contents = self->_contents;
  if ((unint64_t)contents | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](contents, "isEqual:"))
  {
    goto LABEL_11;
  }
  criteria = self->_criteria;
  if ((unint64_t)criteria | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[PDDPSchoolworkSearchCriteria isEqual:](criteria, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_contents hash] ^ v3;
  return v4 ^ [(PDDPSchoolworkSearchCriteria *)self->_criteria hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_uint64_t type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PDDPSchoolworkSearchQuery addContents:](self, "addContents:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  criteria = self->_criteria;
  uint64_t v12 = v5[2];
  if (criteria)
  {
    if (v12) {
      -[PDDPSchoolworkSearchCriteria mergeFrom:](criteria, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPSchoolworkSearchQuery setCriteria:](self, "setCriteria:");
  }
}

- (NSMutableArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (PDDPSchoolworkSearchCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end