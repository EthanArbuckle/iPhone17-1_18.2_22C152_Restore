@interface PDDPSearchCriteria
- (BOOL)hasCompareOptions;
- (BOOL)hasFieldName;
- (BOOL)hasSearchOperator;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (PDDPTypedValue)value;
- (id)compareOptionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)searchOperatorAsString:(int)a3;
- (int)StringAsCompareOptions:(id)a3;
- (int)StringAsSearchOperator:(id)a3;
- (int)compareOptions;
- (int)searchOperator;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompareOptions:(int)a3;
- (void)setFieldName:(id)a3;
- (void)setHasCompareOptions:(BOOL)a3;
- (void)setHasSearchOperator:(BOOL)a3;
- (void)setSearchOperator:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPSearchCriteria

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (int)searchOperator
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_searchOperator;
  }
  else {
    return 0;
  }
}

- (void)setSearchOperator:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_searchOperator = a3;
}

- (void)setHasSearchOperator:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSearchOperator
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)searchOperatorAsString:(int)a3
{
  if (a3 >= 8)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F50E8[a3];
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
        int v4 = @"SC_OPTIONS_NUMERIC";
        break;
      case 128:
        int v4 = @"SC_OPTIONS_DIACRITIC_INSENSITIVE";
        break;
      case 256:
        int v4 = @"SC_OPTIONS_WIDTH_INSENSITIVE";
        break;
      default:
LABEL_27:
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_28:
        break;
    }
  }
  else
  {
    int v4 = @"SC_OPTIONS_NONE";
    switch(a3)
    {
      case 0:
        goto LABEL_28;
      case 1:
        int v4 = @"SC_OPTIONS_CASE_INSENSITIVE";
        break;
      case 2:
        int v4 = @"SC_OPTIONS_LITERAL";
        break;
      case 4:
        int v4 = @"SC_OPTIONS_BACKWARDS";
        break;
      case 8:
        int v4 = @"SC_OPTIONS_ANCHORED";
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
  v7.super_class = (Class)PDDPSearchCriteria;
  id v3 = [(PDDPSearchCriteria *)&v7 description];
  int v4 = [(PDDPSearchCriteria *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t searchOperator = self->_searchOperator;
    if (searchOperator >= 8)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_searchOperator];
    }
    else
    {
      objc_super v7 = off_1001F50E8[searchOperator];
    }
    [v4 setObject:v7 forKey:@"search_operator"];
  }
  value = self->_value;
  if (value)
  {
    v9 = [(PDDPTypedValue *)value dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"value"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t compareOptions = self->_compareOptions;
    if ((int)compareOptions > 63)
    {
      switch(compareOptions)
      {
        case 0x40:
          v11 = @"SC_OPTIONS_NUMERIC";
          break;
        case 0x80:
          v11 = @"SC_OPTIONS_DIACRITIC_INSENSITIVE";
          break;
        case 0x100:
          v11 = @"SC_OPTIONS_WIDTH_INSENSITIVE";
          break;
        default:
LABEL_23:
          v11 = +[NSString stringWithFormat:@"(unknown: %i)", compareOptions];
          break;
      }
    }
    else
    {
      v11 = @"SC_OPTIONS_NONE";
      switch((int)compareOptions)
      {
        case 0:
          break;
        case 1:
          v11 = @"SC_OPTIONS_CASE_INSENSITIVE";
          break;
        case 2:
          v11 = @"SC_OPTIONS_LITERAL";
          break;
        case 4:
          v11 = @"SC_OPTIONS_BACKWARDS";
          break;
        case 8:
          v11 = @"SC_OPTIONS_ANCHORED";
          break;
        default:
          goto LABEL_23;
      }
    }
    [v4 setObject:v11 forKey:@"compareOptions"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10010DC54((uint64_t)self, (uint64_t)a3);
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_fieldName)
  {
    objc_msgSend(v4, "setFieldName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_searchOperator;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
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
  id v6 = [(NSString *)self->_fieldName copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_searchOperator;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  id v8 = [(PDDPTypedValue *)self->_value copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

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
    goto LABEL_16;
  }
  fieldName = self->_fieldName;
  if ((unint64_t)fieldName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](fieldName, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_searchOperator != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 4))
  {
    if (!-[PDDPTypedValue isEqual:](value, "isEqual:"))
    {
LABEL_16:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 40);
  }
  BOOL v9 = (v7 & 1) == 0;
  if (has)
  {
    if ((v7 & 1) == 0 || self->_compareOptions != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fieldName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_searchOperator;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(PDDPTypedValue *)self->_value hash];
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
  uint64_t v4 = (int *)a3;
  char v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[PDDPSearchCriteria setFieldName:](self, "setFieldName:");
    uint64_t v4 = v7;
  }
  if ((v4[10] & 2) != 0)
  {
    self->_uint64_t searchOperator = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  value = self->_value;
  uint64_t v6 = *((void *)v4 + 4);
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
    value = (PDDPTypedValue *)-[PDDPSearchCriteria setValue:](self, "setValue:");
  }
  uint64_t v4 = v7;
LABEL_11:
  if (v4[10])
  {
    self->_uint64_t compareOptions = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }

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