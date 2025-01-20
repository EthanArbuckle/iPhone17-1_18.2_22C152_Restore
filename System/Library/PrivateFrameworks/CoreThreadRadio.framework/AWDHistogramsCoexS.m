@interface AWDHistogramsCoexS
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)coexAbortsDueToGrantRevokesHistogramsCount;
- (unint64_t)coexRxTotalGrantDutyCycleHistogramsCount;
- (unint64_t)coexRxUnsolicitedGrantDutyCycleHistogramsCount;
- (unint64_t)coexTotalGrantTimeHistogramsCount;
- (unint64_t)coexTxTotalGrantDutyCycleHistogramsCount;
- (unint64_t)coexTxUnsolicitedGrantDutyCycleHistogramsCount;
- (unint64_t)hash;
- (unsigned)coexAbortsDueToGrantRevokesHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexAbortsDueToGrantRevokesHistograms;
- (unsigned)coexRxTotalGrantDutyCycleHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexRxTotalGrantDutyCycleHistograms;
- (unsigned)coexRxUnsolicitedGrantDutyCycleHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexRxUnsolicitedGrantDutyCycleHistograms;
- (unsigned)coexTotalGrantTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexTotalGrantTimeHistograms;
- (unsigned)coexTxTotalGrantDutyCycleHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexTxTotalGrantDutyCycleHistograms;
- (unsigned)coexTxUnsolicitedGrantDutyCycleHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexTxUnsolicitedGrantDutyCycleHistograms;
- (void)addCoexAbortsDueToGrantRevokesHistogram:(unsigned int)a3;
- (void)addCoexRxTotalGrantDutyCycleHistogram:(unsigned int)a3;
- (void)addCoexRxUnsolicitedGrantDutyCycleHistogram:(unsigned int)a3;
- (void)addCoexTotalGrantTimeHistogram:(unsigned int)a3;
- (void)addCoexTxTotalGrantDutyCycleHistogram:(unsigned int)a3;
- (void)addCoexTxUnsolicitedGrantDutyCycleHistogram:(unsigned int)a3;
- (void)clearCoexAbortsDueToGrantRevokesHistograms;
- (void)clearCoexRxTotalGrantDutyCycleHistograms;
- (void)clearCoexRxUnsolicitedGrantDutyCycleHistograms;
- (void)clearCoexTotalGrantTimeHistograms;
- (void)clearCoexTxTotalGrantDutyCycleHistograms;
- (void)clearCoexTxUnsolicitedGrantDutyCycleHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCoexAbortsDueToGrantRevokesHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexRxTotalGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexRxUnsolicitedGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexTotalGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexTxTotalGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexTxUnsolicitedGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDHistogramsCoexS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDHistogramsCoexS;
  [(AWDHistogramsCoexS *)&v3 dealloc];
}

- (unint64_t)coexTotalGrantTimeHistogramsCount
{
  return self->_coexTotalGrantTimeHistograms.count;
}

- (unsigned)coexTotalGrantTimeHistograms
{
  return self->_coexTotalGrantTimeHistograms.list;
}

- (void)clearCoexTotalGrantTimeHistograms
{
}

- (void)addCoexTotalGrantTimeHistogram:(unsigned int)a3
{
}

- (unsigned)coexTotalGrantTimeHistogramAtIndex:(unint64_t)a3
{
  p_coexTotalGrantTimeHistograms = &self->_coexTotalGrantTimeHistograms;
  unint64_t count = self->_coexTotalGrantTimeHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexTotalGrantTimeHistograms->list[a3];
}

- (void)setCoexTotalGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexTxUnsolicitedGrantDutyCycleHistogramsCount
{
  return self->_coexTxUnsolicitedGrantDutyCycleHistograms.count;
}

- (unsigned)coexTxUnsolicitedGrantDutyCycleHistograms
{
  return self->_coexTxUnsolicitedGrantDutyCycleHistograms.list;
}

- (void)clearCoexTxUnsolicitedGrantDutyCycleHistograms
{
}

- (void)addCoexTxUnsolicitedGrantDutyCycleHistogram:(unsigned int)a3
{
}

- (unsigned)coexTxUnsolicitedGrantDutyCycleHistogramAtIndex:(unint64_t)a3
{
  p_coexTxUnsolicitedGrantDutyCycleHistograms = &self->_coexTxUnsolicitedGrantDutyCycleHistograms;
  unint64_t count = self->_coexTxUnsolicitedGrantDutyCycleHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexTxUnsolicitedGrantDutyCycleHistograms->list[a3];
}

- (void)setCoexTxUnsolicitedGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexRxUnsolicitedGrantDutyCycleHistogramsCount
{
  return self->_coexRxUnsolicitedGrantDutyCycleHistograms.count;
}

- (unsigned)coexRxUnsolicitedGrantDutyCycleHistograms
{
  return self->_coexRxUnsolicitedGrantDutyCycleHistograms.list;
}

- (void)clearCoexRxUnsolicitedGrantDutyCycleHistograms
{
}

- (void)addCoexRxUnsolicitedGrantDutyCycleHistogram:(unsigned int)a3
{
}

- (unsigned)coexRxUnsolicitedGrantDutyCycleHistogramAtIndex:(unint64_t)a3
{
  p_coexRxUnsolicitedGrantDutyCycleHistograms = &self->_coexRxUnsolicitedGrantDutyCycleHistograms;
  unint64_t count = self->_coexRxUnsolicitedGrantDutyCycleHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexRxUnsolicitedGrantDutyCycleHistograms->list[a3];
}

- (void)setCoexRxUnsolicitedGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexTxTotalGrantDutyCycleHistogramsCount
{
  return self->_coexTxTotalGrantDutyCycleHistograms.count;
}

- (unsigned)coexTxTotalGrantDutyCycleHistograms
{
  return self->_coexTxTotalGrantDutyCycleHistograms.list;
}

- (void)clearCoexTxTotalGrantDutyCycleHistograms
{
}

- (void)addCoexTxTotalGrantDutyCycleHistogram:(unsigned int)a3
{
}

- (unsigned)coexTxTotalGrantDutyCycleHistogramAtIndex:(unint64_t)a3
{
  p_coexTxTotalGrantDutyCycleHistograms = &self->_coexTxTotalGrantDutyCycleHistograms;
  unint64_t count = self->_coexTxTotalGrantDutyCycleHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexTxTotalGrantDutyCycleHistograms->list[a3];
}

- (void)setCoexTxTotalGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexRxTotalGrantDutyCycleHistogramsCount
{
  return self->_coexRxTotalGrantDutyCycleHistograms.count;
}

- (unsigned)coexRxTotalGrantDutyCycleHistograms
{
  return self->_coexRxTotalGrantDutyCycleHistograms.list;
}

- (void)clearCoexRxTotalGrantDutyCycleHistograms
{
}

- (void)addCoexRxTotalGrantDutyCycleHistogram:(unsigned int)a3
{
}

- (unsigned)coexRxTotalGrantDutyCycleHistogramAtIndex:(unint64_t)a3
{
  p_coexRxTotalGrantDutyCycleHistograms = &self->_coexRxTotalGrantDutyCycleHistograms;
  unint64_t count = self->_coexRxTotalGrantDutyCycleHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexRxTotalGrantDutyCycleHistograms->list[a3];
}

- (void)setCoexRxTotalGrantDutyCycleHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexAbortsDueToGrantRevokesHistogramsCount
{
  return self->_coexAbortsDueToGrantRevokesHistograms.count;
}

- (unsigned)coexAbortsDueToGrantRevokesHistograms
{
  return self->_coexAbortsDueToGrantRevokesHistograms.list;
}

- (void)clearCoexAbortsDueToGrantRevokesHistograms
{
}

- (void)addCoexAbortsDueToGrantRevokesHistogram:(unsigned int)a3
{
}

- (unsigned)coexAbortsDueToGrantRevokesHistogramAtIndex:(unint64_t)a3
{
  p_coexAbortsDueToGrantRevokesHistograms = &self->_coexAbortsDueToGrantRevokesHistograms;
  unint64_t count = self->_coexAbortsDueToGrantRevokesHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexAbortsDueToGrantRevokesHistograms->list[a3];
}

- (void)setCoexAbortsDueToGrantRevokesHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDHistogramsCoexS;
  objc_super v3 = [(AWDHistogramsCoexS *)&v7 description];
  v4 = [(AWDHistogramsCoexS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = +[NSMutableDictionary dictionary];
  objc_super v3 = PBRepeatedUInt32NSArray();
  [v2 setObject:v3 forKey:@"coex_total_grant_time_histogram"];

  v4 = PBRepeatedUInt32NSArray();
  [v2 setObject:v4 forKey:@"coex_tx_unsolicited_grant_duty_cycle_histogram"];

  v5 = PBRepeatedUInt32NSArray();
  [v2 setObject:v5 forKey:@"coex_rx_unsolicited_grant_duty_cycle_histogram"];

  v6 = PBRepeatedUInt32NSArray();
  [v2 setObject:v6 forKey:@"coex_tx_total_grant_duty_cycle_histogram"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v2 setObject:v7 forKey:@"coex_rx_total_grant_duty_cycle_histogram"];

  v8 = PBRepeatedUInt32NSArray();
  [v2 setObject:v8 forKey:@"coex_aborts_due_to_grant_revokes_histogram"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHistogramsCoexSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_coexTotalGrantTimeHistograms.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v5;
    }
    while (v5 < self->_coexTotalGrantTimeHistograms.count);
  }
  if (self->_coexTxUnsolicitedGrantDutyCycleHistograms.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v6;
    }
    while (v6 < self->_coexTxUnsolicitedGrantDutyCycleHistograms.count);
  }
  if (self->_coexRxUnsolicitedGrantDutyCycleHistograms.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v7;
    }
    while (v7 < self->_coexRxUnsolicitedGrantDutyCycleHistograms.count);
  }
  if (self->_coexTxTotalGrantDutyCycleHistograms.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v8;
    }
    while (v8 < self->_coexTxTotalGrantDutyCycleHistograms.count);
  }
  if (self->_coexRxTotalGrantDutyCycleHistograms.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v9;
    }
    while (v9 < self->_coexRxTotalGrantDutyCycleHistograms.count);
  }
  p_coexAbortsDueToGrantRevokesHistograms = &self->_coexAbortsDueToGrantRevokesHistograms;
  if (p_coexAbortsDueToGrantRevokesHistograms->count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v12;
      ++v11;
    }
    while (v11 < p_coexAbortsDueToGrantRevokesHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v22 = a3;
  if ([(AWDHistogramsCoexS *)self coexTotalGrantTimeHistogramsCount])
  {
    [v22 clearCoexTotalGrantTimeHistograms];
    unint64_t v4 = [(AWDHistogramsCoexS *)self coexTotalGrantTimeHistogramsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v22, "addCoexTotalGrantTimeHistogram:", -[AWDHistogramsCoexS coexTotalGrantTimeHistogramAtIndex:](self, "coexTotalGrantTimeHistogramAtIndex:", i));
    }
  }
  if ([(AWDHistogramsCoexS *)self coexTxUnsolicitedGrantDutyCycleHistogramsCount])
  {
    [v22 clearCoexTxUnsolicitedGrantDutyCycleHistograms];
    unint64_t v7 = [(AWDHistogramsCoexS *)self coexTxUnsolicitedGrantDutyCycleHistogramsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v22, "addCoexTxUnsolicitedGrantDutyCycleHistogram:", -[AWDHistogramsCoexS coexTxUnsolicitedGrantDutyCycleHistogramAtIndex:](self, "coexTxUnsolicitedGrantDutyCycleHistogramAtIndex:", j));
    }
  }
  if ([(AWDHistogramsCoexS *)self coexRxUnsolicitedGrantDutyCycleHistogramsCount])
  {
    [v22 clearCoexRxUnsolicitedGrantDutyCycleHistograms];
    unint64_t v10 = [(AWDHistogramsCoexS *)self coexRxUnsolicitedGrantDutyCycleHistogramsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v22, "addCoexRxUnsolicitedGrantDutyCycleHistogram:", -[AWDHistogramsCoexS coexRxUnsolicitedGrantDutyCycleHistogramAtIndex:](self, "coexRxUnsolicitedGrantDutyCycleHistogramAtIndex:", k));
    }
  }
  if ([(AWDHistogramsCoexS *)self coexTxTotalGrantDutyCycleHistogramsCount])
  {
    [v22 clearCoexTxTotalGrantDutyCycleHistograms];
    unint64_t v13 = [(AWDHistogramsCoexS *)self coexTxTotalGrantDutyCycleHistogramsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
        objc_msgSend(v22, "addCoexTxTotalGrantDutyCycleHistogram:", -[AWDHistogramsCoexS coexTxTotalGrantDutyCycleHistogramAtIndex:](self, "coexTxTotalGrantDutyCycleHistogramAtIndex:", m));
    }
  }
  if ([(AWDHistogramsCoexS *)self coexRxTotalGrantDutyCycleHistogramsCount])
  {
    [v22 clearCoexRxTotalGrantDutyCycleHistograms];
    unint64_t v16 = [(AWDHistogramsCoexS *)self coexRxTotalGrantDutyCycleHistogramsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
        objc_msgSend(v22, "addCoexRxTotalGrantDutyCycleHistogram:", -[AWDHistogramsCoexS coexRxTotalGrantDutyCycleHistogramAtIndex:](self, "coexRxTotalGrantDutyCycleHistogramAtIndex:", n));
    }
  }
  if ([(AWDHistogramsCoexS *)self coexAbortsDueToGrantRevokesHistogramsCount])
  {
    [v22 clearCoexAbortsDueToGrantRevokesHistograms];
    unint64_t v19 = [(AWDHistogramsCoexS *)self coexAbortsDueToGrantRevokesHistogramsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (iuint64_t i = 0; ii != v20; ++ii)
        objc_msgSend(v22, "addCoexAbortsDueToGrantRevokesHistogram:", -[AWDHistogramsCoexS coexAbortsDueToGrantRevokesHistogramAtIndex:](self, "coexAbortsDueToGrantRevokesHistogramAtIndex:", ii));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    char IsEqual = PBRepeatedUInt32IsEqual();

    return IsEqual;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedUInt32Hash();
  uint64_t v3 = PBRepeatedUInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  return v5 ^ v6 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v22 = a3;
  uint64_t v4 = (char *)[v22 coexTotalGrantTimeHistogramsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDHistogramsCoexS addCoexTotalGrantTimeHistogram:](self, "addCoexTotalGrantTimeHistogram:", [v22 coexTotalGrantTimeHistogramAtIndex:i]);
  }
  unint64_t v7 = (char *)[v22 coexTxUnsolicitedGrantDutyCycleHistogramsCount];
  if (v7)
  {
    unint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[AWDHistogramsCoexS addCoexTxUnsolicitedGrantDutyCycleHistogram:](self, "addCoexTxUnsolicitedGrantDutyCycleHistogram:", [v22 coexTxUnsolicitedGrantDutyCycleHistogramAtIndex:j]);
  }
  unint64_t v10 = (char *)[v22 coexRxUnsolicitedGrantDutyCycleHistogramsCount];
  if (v10)
  {
    unint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[AWDHistogramsCoexS addCoexRxUnsolicitedGrantDutyCycleHistogram:](self, "addCoexRxUnsolicitedGrantDutyCycleHistogram:", [v22 coexRxUnsolicitedGrantDutyCycleHistogramAtIndex:k]);
  }
  unint64_t v13 = (char *)[v22 coexTxTotalGrantDutyCycleHistogramsCount];
  if (v13)
  {
    unint64_t v14 = v13;
    for (uint64_t m = 0; m != v14; ++m)
      -[AWDHistogramsCoexS addCoexTxTotalGrantDutyCycleHistogram:](self, "addCoexTxTotalGrantDutyCycleHistogram:", [v22 coexTxTotalGrantDutyCycleHistogramAtIndex:m]);
  }
  unint64_t v16 = (char *)[v22 coexRxTotalGrantDutyCycleHistogramsCount];
  if (v16)
  {
    unint64_t v17 = v16;
    for (uint64_t n = 0; n != v17; ++n)
      -[AWDHistogramsCoexS addCoexRxTotalGrantDutyCycleHistogram:](self, "addCoexRxTotalGrantDutyCycleHistogram:", [v22 coexRxTotalGrantDutyCycleHistogramAtIndex:n]);
  }
  unint64_t v19 = (char *)[v22 coexAbortsDueToGrantRevokesHistogramsCount];
  if (v19)
  {
    unint64_t v20 = v19;
    for (iuint64_t i = 0; ii != v20; ++ii)
      -[AWDHistogramsCoexS addCoexAbortsDueToGrantRevokesHistogram:](self, "addCoexAbortsDueToGrantRevokesHistogram:", [v22 coexAbortsDueToGrantRevokesHistogramAtIndex:ii]);
  }
}

@end