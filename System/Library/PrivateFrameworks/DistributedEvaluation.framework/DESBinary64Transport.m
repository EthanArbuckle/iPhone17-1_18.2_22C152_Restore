@interface DESBinary64Transport
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dataAtIndex:(unint64_t)a3;
- (double)datas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)datasCount;
- (unint64_t)hash;
- (void)addData:(double)a3;
- (void)clearDatas;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDatas:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation DESBinary64Transport

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)DESBinary64Transport;
  [(DESBinary64Transport *)&v3 dealloc];
}

- (unint64_t)datasCount
{
  return self->_datas.count;
}

- (double)datas
{
  return self->_datas.list;
}

- (void)clearDatas
{
}

- (void)addData:(double)a3
{
}

- (double)dataAtIndex:(unint64_t)a3
{
  p_datas = &self->_datas;
  unint64_t count = self->_datas.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_datas->list[a3];
}

- (void)setDatas:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DESBinary64Transport;
  v4 = [(DESBinary64Transport *)&v8 description];
  v5 = [(DESBinary64Transport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v3 = PBRepeatedDoubleNSArray();
  [v2 setObject:v3 forKey:@"data"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return DESBinary64TransportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_datas = &self->_datas;
  if (p_datas->count)
  {
    PBDataWriterPlaceMark();
    if (p_datas->count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < p_datas->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(DESBinary64Transport *)self datasCount])
  {
    [v7 clearDatas];
    unint64_t v4 = [(DESBinary64Transport *)self datasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(DESBinary64Transport *)self dataAtIndex:i];
        objc_msgSend(v7, "addData:");
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
  uint64_t v4 = [v7 datasCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v7 dataAtIndex:i];
      -[DESBinary64Transport addData:](self, "addData:");
    }
  }
}

@end