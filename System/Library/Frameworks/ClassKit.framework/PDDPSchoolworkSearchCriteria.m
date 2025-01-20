@interface PDDPSchoolworkSearchCriteria
- (BOOL)hasFieldName;
- (BOOL)hasSearchOperator;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (PDDPTypedValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)searchOperatorAsString:(int)a3;
- (int)StringAsSearchOperator:(id)a3;
- (int)searchOperator;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setHasSearchOperator:(BOOL)a3;
- (void)setSearchOperator:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSchoolworkSearchCriteria

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (int)searchOperator
{
  if (*(unsigned char *)&self->_has) {
    return self->_searchOperator;
  }
  else {
    return 0;
  }
}

- (void)setSearchOperator:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_searchOperator = a3;
}

- (void)setHasSearchOperator:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchOperator
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)searchOperatorAsString:(int)a3
{
  if (a3 >= 8)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1001F45D8[a3];
  }

  return v3;
}

- (int)StringAsSearchOperator:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SEARCH_OPERATOR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIKE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EQ"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LT_EQ"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GT_EQ"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPSchoolworkSearchCriteria;
  id v3 = [(PDDPSchoolworkSearchCriteria *)&v7 description];
  int v4 = [(PDDPSchoolworkSearchCriteria *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName) {
    [v3 setObject:fieldName forKey:@"field_name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t searchOperator = self->_searchOperator;
    if (searchOperator >= 8)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_searchOperator];
    }
    else
    {
      objc_super v7 = off_1001F45D8[searchOperator];
    }
    [v4 setObject:v7 forKey:@"search_operator"];
  }
  value = self->_value;
  if (value)
  {
    v9 = [(PDDPTypedValue *)value dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E0FD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    objc_msgSend(v4, "setFieldName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_searchOperator;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_fieldName copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_searchOperator;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(PDDPTypedValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  fieldName = self->_fieldName;
  if ((unint64_t)fieldName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](fieldName, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_searchOperator != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[PDDPTypedValue isEqual:](value, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fieldName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_searchOperator;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(PDDPTypedValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  unsigned __int8 v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[PDDPSchoolworkSearchCriteria setFieldName:](self, "setFieldName:");
    uint64_t v4 = v7;
  }
  if (v4[8])
  {
    self->_uint64_t searchOperator = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 3);
  if (value)
  {
    if (!v6) {
      goto LABEL_11;
    }
    value = (PDDPTypedValue *)-[PDDPTypedValue mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    value = (PDDPTypedValue *)-[PDDPSchoolworkSearchCriteria setValue:](self, "setValue:");
  }
  uint64_t v4 = v7;
LABEL_11:

  _objc_release_x1(value, v4);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (PDDPTypedValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end