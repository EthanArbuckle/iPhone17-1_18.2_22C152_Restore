@interface PDDPActivityReportItem
- (BOOL)hasBinaryValue;
- (BOOL)hasIdentifier;
- (BOOL)hasQuantityValue;
- (BOOL)hasScoreValue;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (PDDPBinaryValue)binaryValue;
- (PDDPQuantityValue)quantityValue;
- (PDDPScoreValue)scoreValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBinaryValue:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuantityValue:(id)a3;
- (void)setScoreValue:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPActivityReportItem

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

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
    v3 = off_1001F3850[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BINARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QUANTITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCORE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBinaryValue
{
  return self->_binaryValue != 0;
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
}

- (BOOL)hasScoreValue
{
  return self->_scoreValue != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPActivityReportItem;
  id v3 = [(PDDPActivityReportItem *)&v7 description];
  int v4 = [(PDDPActivityReportItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v8 = off_1001F3850[type];
    }
    [v4 setObject:v8 forKey:@"type"];
  }
  binaryValue = self->_binaryValue;
  if (binaryValue)
  {
    v10 = [(PDDPBinaryValue *)binaryValue dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"binary_value"];
  }
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    v12 = [(PDDPQuantityValue *)quantityValue dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"quantity_value"];
  }
  scoreValue = self->_scoreValue;
  if (scoreValue)
  {
    v14 = [(PDDPScoreValue *)scoreValue dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"score_value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008CB74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_binaryValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_quantityValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_scoreValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_type;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_binaryValue)
  {
    objc_msgSend(v5, "setBinaryValue:");
    id v4 = v5;
  }
  if (self->_quantityValue)
  {
    objc_msgSend(v5, "setQuantityValue:");
    id v4 = v5;
  }
  if (self->_scoreValue)
  {
    objc_msgSend(v5, "setScoreValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_title copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 12) = self->_type;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  id v10 = [(PDDPBinaryValue *)self->_binaryValue copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(PDDPQuantityValue *)self->_quantityValue copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(PDDPScoreValue *)self->_scoreValue copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_17;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    unsigned __int8 v10 = 0;
    goto LABEL_18;
  }
  binaryValue = self->_binaryValue;
  if ((unint64_t)binaryValue | *((void *)v4 + 1) && !-[PDDPBinaryValue isEqual:](binaryValue, "isEqual:")) {
    goto LABEL_17;
  }
  quantityValue = self->_quantityValue;
  if ((unint64_t)quantityValue | *((void *)v4 + 3))
  {
    if (!-[PDDPQuantityValue isEqual:](quantityValue, "isEqual:")) {
      goto LABEL_17;
    }
  }
  scoreValue = self->_scoreValue;
  if ((unint64_t)scoreValue | *((void *)v4 + 4)) {
    unsigned __int8 v10 = -[PDDPScoreValue isEqual:](scoreValue, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_type;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(PDDPBinaryValue *)self->_binaryValue hash];
  unint64_t v7 = [(PDDPQuantityValue *)self->_quantityValue hash];
  return v6 ^ v7 ^ [(PDDPScoreValue *)self->_scoreValue hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  v11 = v4;
  if (*((void *)v4 + 5))
  {
    -[PDDPActivityReportItem setTitle:](self, "setTitle:");
    NSUInteger v4 = v11;
  }
  if (*((void *)v4 + 2))
  {
    -[PDDPActivityReportItem setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v11;
  }
  if (v4[13])
  {
    self->_uint64_t type = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  binaryValue = self->_binaryValue;
  uint64_t v6 = *((void *)v4 + 1);
  if (binaryValue)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[PDDPBinaryValue mergeFrom:](binaryValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[PDDPActivityReportItem setBinaryValue:](self, "setBinaryValue:");
  }
  NSUInteger v4 = v11;
LABEL_13:
  quantityValue = self->_quantityValue;
  uint64_t v8 = *((void *)v4 + 3);
  if (quantityValue)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[PDDPQuantityValue mergeFrom:](quantityValue, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[PDDPActivityReportItem setQuantityValue:](self, "setQuantityValue:");
  }
  NSUInteger v4 = v11;
LABEL_19:
  scoreValue = self->_scoreValue;
  uint64_t v10 = *((void *)v4 + 4);
  if (scoreValue)
  {
    if (v10) {
      -[PDDPScoreValue mergeFrom:](scoreValue, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPActivityReportItem setScoreValue:](self, "setScoreValue:");
  }

  _objc_release_x1();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PDDPBinaryValue)binaryValue
{
  return self->_binaryValue;
}

- (void)setBinaryValue:(id)a3
{
}

- (PDDPQuantityValue)quantityValue
{
  return self->_quantityValue;
}

- (void)setQuantityValue:(id)a3
{
}

- (PDDPScoreValue)scoreValue
{
  return self->_scoreValue;
}

- (void)setScoreValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_scoreValue, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_binaryValue, 0);
}

@end