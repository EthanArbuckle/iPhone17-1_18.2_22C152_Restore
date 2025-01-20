@interface CHHandlePb
+ (id)handleWithCHHandle:(id)a3;
+ (id)handleWithType:(int)a3 value:(id)a4 normalizedValue:(id)a5;
- (BOOL)hasNormalizedValue;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CHHandle)chHandle;
- (NSString)normalizedValue;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setNormalizedValue:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CHHandlePb

+ (id)handleWithType:(int)a3 value:(id)a4 normalizedValue:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = objc_alloc_init(CHHandlePb);
  [(CHHandlePb *)v9 setType:v6];
  [(CHHandlePb *)v9 setValue:v8];

  [(CHHandlePb *)v9 setNormalizedValue:v7];
  return v9;
}

+ (id)handleWithCHHandle:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = (char *)[v3 type];
    if ((unint64_t)(v4 - 1) < 3) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [v3 value];
    id v7 = [v3 normalizedValue];

    id v8 = +[CHHandlePb handleWithType:v5 value:v6 normalizedValue:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CHHandle)chHandle
{
  id v3 = [(CHHandlePb *)self value];
  if (v3)
  {
    uint64_t v4 = [(CHHandlePb *)self type] - 1;
    if (v4 < 3) {
      uint64_t v5 = v4 + 1;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = objc_alloc((Class)CHHandle);
    id v7 = [(CHHandlePb *)self normalizedValue];
    id v8 = [v6 initWithType:v5 value:v3 normalizedValue:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (CHHandle *)v8;
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
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = (void *)*((void *)&off_100049848 + a3);
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 3;
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

- (BOOL)hasNormalizedValue
{
  return self->_normalizedValue != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CHHandlePb;
  id v3 = [(CHHandlePb *)&v7 description];
  int v4 = [(CHHandlePb *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

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
      uint64_t v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      uint64_t v5 = (void *)*((void *)&off_100049848 + type);
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  normalizedValue = self->_normalizedValue;
  if (normalizedValue) {
    [v3 setObject:normalizedValue forKey:@"normalizedValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100020F18((uint64_t)self, (uint64_t)a3);
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
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_normalizedValue)
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
    v4[4] = self->_type;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v5;
  }
  if (self->_normalizedValue)
  {
    objc_msgSend(v5, "setNormalizedValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSString *)self->_value copyWithZone:a3];
  id v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_normalizedValue copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
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
  if ((unint64_t)value | *((void *)v4 + 3) && !-[NSString isEqual:](value, "isEqual:")) {
    goto LABEL_11;
  }
  normalizedValue = self->_normalizedValue;
  if ((unint64_t)normalizedValue | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSString isEqual:](normalizedValue, "isEqual:");
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
  unint64_t v4 = [(NSString *)self->_value hash] ^ v3;
  return v4 ^ [(NSString *)self->_normalizedValue hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[8])
  {
    self->_uint64_t type = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[CHHandlePb setValue:](self, "setValue:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[CHHandlePb setNormalizedValue:](self, "setNormalizedValue:");
    unint64_t v4 = v5;
  }
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (void)setNormalizedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_normalizedValue, 0);
}

@end