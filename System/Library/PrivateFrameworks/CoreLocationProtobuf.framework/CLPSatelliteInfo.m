@interface CLPSatelliteInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsedInFixes;
- (BOOL)isUsedInFixesAtIndex:(unint64_t)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)azimuths;
- (int)azimuthsAtIndex:(unint64_t)a3;
- (int)cnos;
- (int)cnosAtIndex:(unint64_t)a3;
- (int)elevations;
- (int)elevationsAtIndex:(unint64_t)a3;
- (int)satIds;
- (int)satIdsAtIndex:(unint64_t)a3;
- (unint64_t)azimuthsCount;
- (unint64_t)cnosCount;
- (unint64_t)elevationsCount;
- (unint64_t)hash;
- (unint64_t)isUsedInFixesCount;
- (unint64_t)satIdsCount;
- (void)addAzimuths:(int)a3;
- (void)addCnos:(int)a3;
- (void)addElevations:(int)a3;
- (void)addIsUsedInFixes:(BOOL)a3;
- (void)addSatIds:(int)a3;
- (void)clearAzimuths;
- (void)clearCnos;
- (void)clearElevations;
- (void)clearIsUsedInFixes;
- (void)clearSatIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAzimuths:(int *)a3 count:(unint64_t)a4;
- (void)setCnos:(int *)a3 count:(unint64_t)a4;
- (void)setElevations:(int *)a3 count:(unint64_t)a4;
- (void)setIsUsedInFixes:(BOOL *)a3 count:(unint64_t)a4;
- (void)setSatIds:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CLPSatelliteInfo

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedBOOLClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPSatelliteInfo;
  [(CLPSatelliteInfo *)&v3 dealloc];
}

- (unint64_t)satIdsCount
{
  return self->_satIds.count;
}

- (int)satIds
{
  return self->_satIds.list;
}

- (void)clearSatIds
{
}

- (void)addSatIds:(int)a3
{
}

- (int)satIdsAtIndex:(unint64_t)a3
{
  p_satIds = &self->_satIds;
  unint64_t count = self->_satIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_satIds->list[a3];
}

- (void)setSatIds:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)cnosCount
{
  return self->_cnos.count;
}

- (int)cnos
{
  return self->_cnos.list;
}

- (void)clearCnos
{
}

- (void)addCnos:(int)a3
{
}

- (int)cnosAtIndex:(unint64_t)a3
{
  p_cnos = &self->_cnos;
  unint64_t count = self->_cnos.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_cnos->list[a3];
}

- (void)setCnos:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)azimuthsCount
{
  return self->_azimuths.count;
}

- (int)azimuths
{
  return self->_azimuths.list;
}

- (void)clearAzimuths
{
}

- (void)addAzimuths:(int)a3
{
}

- (int)azimuthsAtIndex:(unint64_t)a3
{
  p_azimuths = &self->_azimuths;
  unint64_t count = self->_azimuths.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_azimuths->list[a3];
}

- (void)setAzimuths:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)elevationsCount
{
  return self->_elevations.count;
}

- (int)elevations
{
  return self->_elevations.list;
}

- (void)clearElevations
{
}

- (void)addElevations:(int)a3
{
}

- (int)elevationsAtIndex:(unint64_t)a3
{
  p_elevations = &self->_elevations;
  unint64_t count = self->_elevations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_elevations->list[a3];
}

- (void)setElevations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)isUsedInFixesCount
{
  return self->_isUsedInFixes.count;
}

- (BOOL)isUsedInFixes
{
  return self->_isUsedInFixes.list;
}

- (void)clearIsUsedInFixes
{
}

- (void)addIsUsedInFixes:(BOOL)a3
{
}

- (BOOL)isUsedInFixesAtIndex:(unint64_t)a3
{
  p_isUsedInFixes = &self->_isUsedInFixes;
  unint64_t count = self->_isUsedInFixes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_isUsedInFixes->list[a3];
}

- (void)setIsUsedInFixes:(BOOL *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPSatelliteInfo;
  v4 = [(CLPSatelliteInfo *)&v8 description];
  v5 = [(CLPSatelliteInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v3 = PBRepeatedInt32NSArray();
  [v2 setObject:v3 forKey:@"satIds"];

  v4 = PBRepeatedInt32NSArray();
  [v2 setObject:v4 forKey:@"cnos"];

  v5 = PBRepeatedInt32NSArray();
  [v2 setObject:v5 forKey:@"azimuths"];

  v6 = PBRepeatedInt32NSArray();
  [v2 setObject:v6 forKey:@"elevations"];

  uint64_t v7 = PBRepeatedBOOLNSArray();
  [v2 setObject:v7 forKey:@"isUsedInFixes"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSatelliteInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_satIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_satIds.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_satIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_cnos.count)
  {
    PBDataWriterPlaceMark();
    if (self->_cnos.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v6;
      }
      while (v6 < self->_cnos.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_azimuths.count)
  {
    PBDataWriterPlaceMark();
    if (self->_azimuths.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v7;
      }
      while (v7 < self->_azimuths.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_elevations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_elevations.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v8;
      }
      while (v8 < self->_elevations.count);
    }
    PBDataWriterRecallMark();
  }
  p_isUsedInFixes = &self->_isUsedInFixes;
  if (p_isUsedInFixes->count)
  {
    PBDataWriterPlaceMark();
    if (p_isUsedInFixes->count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v10;
      }
      while (v10 < p_isUsedInFixes->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v19 = a3;
  if ([(CLPSatelliteInfo *)self satIdsCount])
  {
    [v19 clearSatIds];
    unint64_t v4 = [(CLPSatelliteInfo *)self satIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v19, "addSatIds:", -[CLPSatelliteInfo satIdsAtIndex:](self, "satIdsAtIndex:", i));
    }
  }
  if ([(CLPSatelliteInfo *)self cnosCount])
  {
    [v19 clearCnos];
    unint64_t v7 = [(CLPSatelliteInfo *)self cnosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v19, "addCnos:", -[CLPSatelliteInfo cnosAtIndex:](self, "cnosAtIndex:", j));
    }
  }
  if ([(CLPSatelliteInfo *)self azimuthsCount])
  {
    [v19 clearAzimuths];
    unint64_t v10 = [(CLPSatelliteInfo *)self azimuthsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v19, "addAzimuths:", -[CLPSatelliteInfo azimuthsAtIndex:](self, "azimuthsAtIndex:", k));
    }
  }
  if ([(CLPSatelliteInfo *)self elevationsCount])
  {
    [v19 clearElevations];
    unint64_t v13 = [(CLPSatelliteInfo *)self elevationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
        objc_msgSend(v19, "addElevations:", -[CLPSatelliteInfo elevationsAtIndex:](self, "elevationsAtIndex:", m));
    }
  }
  if ([(CLPSatelliteInfo *)self isUsedInFixesCount])
  {
    [v19 clearIsUsedInFixes];
    unint64_t v16 = [(CLPSatelliteInfo *)self isUsedInFixesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
        objc_msgSend(v19, "addIsUsedInFixes:", -[CLPSatelliteInfo isUsedInFixesAtIndex:](self, "isUsedInFixesAtIndex:", n));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedBOOLCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    char v4 = PBRepeatedBOOLIsEqual();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedInt32Hash();
  uint64_t v3 = PBRepeatedInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedInt32Hash();
  return v5 ^ PBRepeatedBOOLHash();
}

- (void)mergeFrom:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [v19 satIdsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[CLPSatelliteInfo addSatIds:](self, "addSatIds:", [v19 satIdsAtIndex:i]);
  }
  uint64_t v7 = [v19 cnosCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[CLPSatelliteInfo addCnos:](self, "addCnos:", [v19 cnosAtIndex:j]);
  }
  uint64_t v10 = [v19 azimuthsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[CLPSatelliteInfo addAzimuths:](self, "addAzimuths:", [v19 azimuthsAtIndex:k]);
  }
  uint64_t v13 = [v19 elevationsCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t m = 0; m != v14; ++m)
      -[CLPSatelliteInfo addElevations:](self, "addElevations:", [v19 elevationsAtIndex:m]);
  }
  uint64_t v16 = [v19 isUsedInFixesCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t n = 0; n != v17; ++n)
      -[CLPSatelliteInfo addIsUsedInFixes:](self, "addIsUsedInFixes:", [v19 isUsedInFixesAtIndex:n]);
  }
}

@end