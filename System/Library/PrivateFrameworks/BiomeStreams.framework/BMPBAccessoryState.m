@interface BMPBAccessoryState
- (BOOL)hasDataValue;
- (BOOL)hasMediaPropertyType;
- (BOOL)hasNumValue;
- (BOOL)hasStringValue;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSString)mediaPropertyType;
- (NSString)stringValue;
- (double)numValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueTypeAsString:(int)a3;
- (int)StringAsValueType:(id)a3;
- (int)valueType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setHasNumValue:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setMediaPropertyType:(id)a3;
- (void)setNumValue:(double)a3;
- (void)setStringValue:(id)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBAccessoryState

- (BOOL)hasMediaPropertyType
{
  return self->_mediaPropertyType != 0;
}

- (int)valueType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_valueType;
  }
  else {
    return 0;
  }
}

- (void)setValueType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)valueTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7B70[a3];
  }

  return v3;
}

- (int)StringAsValueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Data"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"String"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Num"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setNumValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numValue = a3;
}

- (void)setHasNumValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBAccessoryState;
  int v4 = [(BMPBAccessoryState *)&v8 description];
  v5 = [(BMPBAccessoryState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  mediaPropertyType = self->_mediaPropertyType;
  if (mediaPropertyType) {
    [v3 setObject:mediaPropertyType forKey:@"mediaPropertyType"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t valueType = self->_valueType;
    if (valueType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_valueType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55D7B70[valueType];
    }
    [v4 setObject:v7 forKey:@"valueType"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"stringValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithDouble:self->_numValue];
    [v4 setObject:v10 forKey:@"numValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAccessoryStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mediaPropertyType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mediaPropertyType)
  {
    objc_msgSend(v4, "setMediaPropertyType:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_valueType;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  if (self->_dataValue)
  {
    objc_msgSend(v5, "setDataValue:");
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v5, "setStringValue:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_numValue;
    *((unsigned char *)v4 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mediaPropertyType copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_valueType;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_dataValue copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_stringValue copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_numValue;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  mediaPropertyType = self->_mediaPropertyType;
  if ((unint64_t)mediaPropertyType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](mediaPropertyType, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_valueType != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 2) && !-[NSData isEqual:](dataValue, "isEqual:")) {
    goto LABEL_17;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_numValue != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mediaPropertyType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_valueType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_dataValue hash];
  NSUInteger v6 = [(NSString *)self->_stringValue hash];
  if (*(unsigned char *)&self->_has)
  {
    double numValue = self->_numValue;
    double v9 = -numValue;
    if (numValue >= 0.0) {
      double v9 = self->_numValue;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[BMPBAccessoryState setMediaPropertyType:](self, "setMediaPropertyType:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_uint64_t valueType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBAccessoryState setDataValue:](self, "setDataValue:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBAccessoryState setStringValue:](self, "setStringValue:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_double numValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)mediaPropertyType
{
  return self->_mediaPropertyType;
}

- (void)setMediaPropertyType:(id)a3
{
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (double)numValue
{
  return self->_numValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_mediaPropertyType, 0);

  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end