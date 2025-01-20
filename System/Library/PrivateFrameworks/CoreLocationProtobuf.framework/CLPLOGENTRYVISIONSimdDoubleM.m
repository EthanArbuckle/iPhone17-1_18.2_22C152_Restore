@interface CLPLOGENTRYVISIONSimdDoubleM
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)values;
- (double)valuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValues:(double)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setValues:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONSimdDoubleM

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPLOGENTRYVISIONSimdDoubleM;
  [(CLPLOGENTRYVISIONSimdDoubleM *)&v3 dealloc];
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (double)values
{
  return self->_values.list;
}

- (void)clearValues
{
}

- (void)addValues:(double)a3
{
}

- (double)valuesAtIndex:(unint64_t)a3
{
  p_values = &self->_values;
  unint64_t count = self->_values.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_values->list[a3];
}

- (void)setValues:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONSimdDoubleM;
  v4 = [(CLPLOGENTRYVISIONSimdDoubleM *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONSimdDoubleM *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v3 = PBRepeatedDoubleNSArray();
  [v2 setObject:v3 forKey:@"values"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_values = &self->_values;
  if (self->_values.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v4;
    }
    while (v4 < p_values->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(CLPLOGENTRYVISIONSimdDoubleM *)self valuesCount])
  {
    [v7 clearValues];
    unint64_t v4 = [(CLPLOGENTRYVISIONSimdDoubleM *)self valuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(CLPLOGENTRYVISIONSimdDoubleM *)self valuesAtIndex:i];
        objc_msgSend(v7, "addValues:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedDoubleCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedDoubleIsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 valuesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v7 valuesAtIndex:i];
      -[CLPLOGENTRYVISIONSimdDoubleM addValues:](self, "addValues:");
    }
  }
}

@end