@interface BandCombo
+ (Class)bandInfoType;
- (BOOL)hasNumBandComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bandInfos;
- (id)bandInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bandInfosCount;
- (unint64_t)hash;
- (unsigned)numBandComponents;
- (void)addBandInfo:(id)a3;
- (void)clearBandInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandInfos:(id)a3;
- (void)setHasNumBandComponents:(BOOL)a3;
- (void)setNumBandComponents:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BandCombo

- (void)setNumBandComponents:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numBandComponents = a3;
}

- (void)setHasNumBandComponents:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumBandComponents
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearBandInfos
{
}

- (void)addBandInfo:(id)a3
{
  id v4 = a3;
  bandInfos = self->_bandInfos;
  id v8 = v4;
  if (!bandInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_bandInfos;
    self->_bandInfos = v6;

    id v4 = v8;
    bandInfos = self->_bandInfos;
  }
  [(NSMutableArray *)bandInfos addObject:v4];
}

- (unint64_t)bandInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_bandInfos count];
}

- (id)bandInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_bandInfos objectAtIndex:a3];
}

+ (Class)bandInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BandCombo;
  v3 = [(BandCombo *)&v7 description];
  id v4 = [(BandCombo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_numBandComponents];
    [v3 setObject:v4 forKey:@"num_band_components"];
  }
  if ([(NSMutableArray *)self->_bandInfos count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_bandInfos, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_bandInfos;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [v13 dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"band_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100023298((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_bandInfos;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_numBandComponents;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(BandCombo *)self bandInfosCount])
  {
    [v9 clearBandInfos];
    unint64_t v5 = [(BandCombo *)self bandInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BandCombo *)self bandInfoAtIndex:i];
        [v9 addBandInfo:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_numBandComponents;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_bandInfos;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addBandInfo:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_numBandComponents != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  bandInfos = self->_bandInfos;
  if ((unint64_t)bandInfos | *((void *)v4 + 1)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](bandInfos, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_numBandComponents;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSMutableArray *)self->_bandInfos hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_numBandComponents = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BandCombo addBandInfo:](self, "addBandInfo:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)numBandComponents
{
  return self->_numBandComponents;
}

- (NSMutableArray)bandInfos
{
  return self->_bandInfos;
}

- (void)setBandInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end