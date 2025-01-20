@interface PDDPEESearchRequestZone
- (BOOL)hasCompareOptions;
- (BOOL)hasFilterQuery;
- (BOOL)hasKeyword;
- (BOOL)hasRequestZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)keyword;
- (PDDPEERequestZone)requestZone;
- (PDDPSearchQuery)filterQuery;
- (id)compareOptionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCompareOptions:(id)a3;
- (int)compareOptions;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompareOptions:(int)a3;
- (void)setFilterQuery:(id)a3;
- (void)setHasCompareOptions:(BOOL)a3;
- (void)setKeyword:(id)a3;
- (void)setRequestZone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEESearchRequestZone

- (BOOL)hasRequestZone
{
  return self->_requestZone != 0;
}

- (BOOL)hasFilterQuery
{
  return self->_filterQuery != 0;
}

- (BOOL)hasKeyword
{
  return self->_keyword != 0;
}

- (int)compareOptions
{
  if (*(unsigned char *)&self->_has) {
    return self->_compareOptions;
  }
  else {
    return 0;
  }
}

- (void)setCompareOptions:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_compareOptions = a3;
}

- (void)setHasCompareOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompareOptions
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)compareOptionsAsString:(int)a3
{
  if (a3 > 63)
  {
    switch(a3)
    {
      case 64:
        v4 = @"SC_OPTIONS_NUMERIC";
        break;
      case 128:
        v4 = @"SC_OPTIONS_DIACRITIC_INSENSITIVE";
        break;
      case 256:
        v4 = @"SC_OPTIONS_WIDTH_INSENSITIVE";
        break;
      default:
LABEL_27:
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_28:
        break;
    }
  }
  else
  {
    v4 = @"SC_OPTIONS_NONE";
    switch(a3)
    {
      case 0:
        goto LABEL_28;
      case 1:
        v4 = @"SC_OPTIONS_CASE_INSENSITIVE";
        break;
      case 2:
        v4 = @"SC_OPTIONS_LITERAL";
        break;
      case 4:
        v4 = @"SC_OPTIONS_BACKWARDS";
        break;
      case 8:
        v4 = @"SC_OPTIONS_ANCHORED";
        break;
      default:
        goto LABEL_27;
    }
  }
  return v4;
}

- (int)StringAsCompareOptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SC_OPTIONS_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_CASE_INSENSITIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_LITERAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_BACKWARDS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_ANCHORED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_NUMERIC"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_DIACRITIC_INSENSITIVE"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"SC_OPTIONS_WIDTH_INSENSITIVE"])
  {
    int v4 = 256;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEESearchRequestZone;
  id v3 = [(PDDPEESearchRequestZone *)&v7 description];
  int v4 = [(PDDPEESearchRequestZone *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  requestZone = self->_requestZone;
  if (requestZone)
  {
    v5 = [(PDDPEERequestZone *)requestZone dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request_zone"];
  }
  filterQuery = self->_filterQuery;
  if (filterQuery)
  {
    objc_super v7 = [(PDDPSearchQuery *)filterQuery dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"filter_query"];
  }
  keyword = self->_keyword;
  if (keyword) {
    [v3 setObject:keyword forKey:@"keyword"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t compareOptions = self->_compareOptions;
    if ((int)compareOptions > 63)
    {
      switch(compareOptions)
      {
        case 0x40:
          v10 = @"SC_OPTIONS_NUMERIC";
          break;
        case 0x80:
          v10 = @"SC_OPTIONS_DIACRITIC_INSENSITIVE";
          break;
        case 0x100:
          v10 = @"SC_OPTIONS_WIDTH_INSENSITIVE";
          break;
        default:
LABEL_20:
          v10 = +[NSString stringWithFormat:@"(unknown: %i)", compareOptions];
          break;
      }
    }
    else
    {
      v10 = @"SC_OPTIONS_NONE";
      switch((int)compareOptions)
      {
        case 0:
          break;
        case 1:
          v10 = @"SC_OPTIONS_CASE_INSENSITIVE";
          break;
        case 2:
          v10 = @"SC_OPTIONS_LITERAL";
          break;
        case 4:
          v10 = @"SC_OPTIONS_BACKWARDS";
          break;
        case 8:
          v10 = @"SC_OPTIONS_ANCHORED";
          break;
        default:
          goto LABEL_20;
      }
    }
    [v3 setObject:v10 forKey:@"compareOptions"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006E2F4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_filterQuery)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_keyword)
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
  if (self->_requestZone)
  {
    objc_msgSend(v4, "setRequestZone:");
    id v4 = v5;
  }
  if (self->_filterQuery)
  {
    objc_msgSend(v5, "setFilterQuery:");
    id v4 = v5;
  }
  if (self->_keyword)
  {
    objc_msgSend(v5, "setKeyword:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_compareOptions;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPEERequestZone *)self->_requestZone copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(PDDPSearchQuery *)self->_filterQuery copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_keyword copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_compareOptions;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  requestZone = self->_requestZone;
  if ((unint64_t)requestZone | *((void *)v4 + 4))
  {
    if (!-[PDDPEERequestZone isEqual:](requestZone, "isEqual:")) {
      goto LABEL_12;
    }
  }
  filterQuery = self->_filterQuery;
  if ((unint64_t)filterQuery | *((void *)v4 + 2))
  {
    if (!-[PDDPSearchQuery isEqual:](filterQuery, "isEqual:")) {
      goto LABEL_12;
    }
  }
  keyword = self->_keyword;
  if ((unint64_t)keyword | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](keyword, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_compareOptions == *((_DWORD *)v4 + 2))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPEERequestZone *)self->_requestZone hash];
  unint64_t v4 = [(PDDPSearchQuery *)self->_filterQuery hash];
  NSUInteger v5 = [(NSString *)self->_keyword hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_compareOptions;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestZone = self->_requestZone;
  uint64_t v6 = *((void *)v4 + 4);
  id v9 = v4;
  if (requestZone)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDDPEERequestZone mergeFrom:](requestZone, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDDPEESearchRequestZone setRequestZone:](self, "setRequestZone:");
  }
  id v4 = v9;
LABEL_7:
  filterQuery = self->_filterQuery;
  uint64_t v8 = *((void *)v4 + 2);
  if (filterQuery)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDDPSearchQuery mergeFrom:](filterQuery, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDDPEESearchRequestZone setFilterQuery:](self, "setFilterQuery:");
  }
  id v4 = v9;
LABEL_13:
  if (*((void *)v4 + 3))
  {
    -[PDDPEESearchRequestZone setKeyword:](self, "setKeyword:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_uint64_t compareOptions = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1();
}

- (PDDPEERequestZone)requestZone
{
  return self->_requestZone;
}

- (void)setRequestZone:(id)a3
{
}

- (PDDPSearchQuery)filterQuery
{
  return self->_filterQuery;
}

- (void)setFilterQuery:(id)a3
{
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestZone, 0);
  objc_storeStrong((id *)&self->_keyword, 0);

  objc_storeStrong((id *)&self->_filterQuery, 0);
}

@end