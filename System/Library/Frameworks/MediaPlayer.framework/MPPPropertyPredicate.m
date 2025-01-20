@interface MPPPropertyPredicate
- (BOOL)hasComparisonType;
- (BOOL)hasProperty;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MPPMediaPredicateValue)value;
- (NSString)property;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)comparisonType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setComparisonType:(int)a3;
- (void)setHasComparisonType:(BOOL)a3;
- (void)setProperty:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPPropertyPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

- (int)comparisonType
{
  return self->_comparisonType;
}

- (void)setValue:(id)a3
{
}

- (MPPMediaPredicateValue)value
{
  return self->_value;
}

- (void)setProperty:(id)a3
{
}

- (NSString)property
{
  return self->_property;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_property hash];
  unint64_t v4 = [(MPPMediaPredicateValue *)self->_value hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_comparisonType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  property = self->_property;
  if ((unint64_t)property | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](property, "isEqual:")) {
      goto LABEL_10;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 3))
  {
    if (!-[MPPMediaPredicateValue isEqual:](value, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_comparisonType == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_property copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(MPPMediaPredicateValue *)self->_value copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_comparisonType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  if ([(MPPPropertyPredicate *)self hasProperty])
  {
    id v4 = [(MPPPropertyPredicate *)self property];
    [v6 setProperty:v4];
  }
  if ([(MPPPropertyPredicate *)self hasValue])
  {
    uint64_t v5 = [(MPPPropertyPredicate *)self value];
    [v6 setValue:v5];
  }
  if ([(MPPPropertyPredicate *)self hasComparisonType]) {
    objc_msgSend(v6, "setComparisonType:", -[MPPPropertyPredicate comparisonType](self, "comparisonType"));
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  property = self->_property;
  id v8 = v4;
  if (property) {
    [v4 writeString:property forTag:1];
  }
  if (self->_value)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPMediaPredicateValue *)self->_value writeTo:v6];
    BOOL v7 = [v6 data];
    [v8 writeData:v7 forTag:2];
  }
  if (*(unsigned char *)&self->_has) {
    [v8 writeInt32:self->_comparisonType forTag:3];
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPPropertyPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  property = self->_property;
  if (property) {
    [v3 setObject:property forKey:@"property"];
  }
  value = self->_value;
  if (value)
  {
    BOOL v7 = [(MPPMediaPredicateValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v8 = [NSNumber numberWithInt:self->_comparisonType];
    [v4 setObject:v8 forKey:@"comparisonType"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPPropertyPredicate;
  id v4 = [(MPPPropertyPredicate *)&v8 description];
  uint64_t v5 = [(MPPPropertyPredicate *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasComparisonType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasComparisonType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setComparisonType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_comparisonType = a3;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasProperty
{
  return self->_property != 0;
}

- (void)dealloc
{
  [(MPPPropertyPredicate *)self setProperty:0];
  [(MPPPropertyPredicate *)self setValue:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPPropertyPredicate;
  [(MPPPropertyPredicate *)&v3 dealloc];
}

@end