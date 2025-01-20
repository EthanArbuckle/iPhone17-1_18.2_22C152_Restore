@interface GEONetEventAggregateStats
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAlgMean;
- (BOOL)hasMax;
- (BOOL)hasMin;
- (BOOL)hasP10;
- (BOOL)hasP25;
- (BOOL)hasP50;
- (BOOL)hasP75;
- (BOOL)hasP90;
- (BOOL)hasP99;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONetEventAggregateStats)initWithDictionary:(id)a3;
- (GEONetEventAggregateStats)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)algMean;
- (unint64_t)hash;
- (unint64_t)max;
- (unint64_t)min;
- (unint64_t)p10;
- (unint64_t)p25;
- (unint64_t)p50;
- (unint64_t)p75;
- (unint64_t)p90;
- (unint64_t)p99;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgMean:(unint64_t)a3;
- (void)setHasAlgMean:(BOOL)a3;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setHasP10:(BOOL)a3;
- (void)setHasP25:(BOOL)a3;
- (void)setHasP50:(BOOL)a3;
- (void)setHasP75:(BOOL)a3;
- (void)setHasP90:(BOOL)a3;
- (void)setHasP99:(BOOL)a3;
- (void)setMax:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
- (void)setP10:(unint64_t)a3;
- (void)setP25:(unint64_t)a3;
- (void)setP50:(unint64_t)a3;
- (void)setP75:(unint64_t)a3;
- (void)setP90:(unint64_t)a3;
- (void)setP99:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONetEventAggregateStats

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMin
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMax
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)p10
{
  return self->_p10;
}

- (void)setP10:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_p10 = a3;
}

- (void)setHasP10:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasP10
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)p25
{
  return self->_p25;
}

- (void)setP25:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_p25 = a3;
}

- (void)setHasP25:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasP25
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)p50
{
  return self->_p50;
}

- (void)setP50:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_p50 = a3;
}

- (void)setHasP50:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasP50
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)p75
{
  return self->_p75;
}

- (void)setP75:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_p75 = a3;
}

- (void)setHasP75:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasP75
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unint64_t)p90
{
  return self->_p90;
}

- (void)setP90:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_p90 = a3;
}

- (void)setHasP90:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasP90
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (unint64_t)p99
{
  return self->_p99;
}

- (void)setP99:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_p99 = a3;
}

- (void)setHasP99:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasP99
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unint64_t)algMean
{
  return self->_algMean;
}

- (void)setAlgMean:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_algMean = a3;
}

- (void)setHasAlgMean:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasAlgMean
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONetEventAggregateStats;
  v4 = [(GEONetEventAggregateStats *)&v8 description];
  v5 = [(GEONetEventAggregateStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetEventAggregateStats _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 4) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"min"];

    __int16 v5 = *(_WORD *)(a1 + 80);
  }
  if ((v5 & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    [v4 setObject:v7 forKey:@"max"];

    __int16 v5 = *(_WORD *)(a1 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_6:
      if ((v5 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_6;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  [v4 setObject:v8 forKey:@"p10"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [v4 setObject:v9 forKey:@"p25"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  [v4 setObject:v10 forKey:@"p50"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  [v4 setObject:v11 forKey:@"p75"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
LABEL_19:
    v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
    [v4 setObject:v13 forKey:@"p99"];

    if ((*(_WORD *)(a1 + 80) & 1) == 0) {
      goto LABEL_24;
    }
LABEL_20:
    v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v15 = @"algMean";
    }
    else {
      v15 = @"alg_mean";
    }
    [v4 setObject:v14 forKey:v15];

    goto LABEL_24;
  }
LABEL_18:
  v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
  [v4 setObject:v12 forKey:@"p90"];

  __int16 v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x100) != 0) {
    goto LABEL_19;
  }
LABEL_11:
  if (v5) {
    goto LABEL_20;
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONetEventAggregateStats _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetEventAggregateStats)initWithDictionary:(id)a3
{
  return (GEONetEventAggregateStats *)-[GEONetEventAggregateStats _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"min"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMin:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"max"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMax:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"p10"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP10:", objc_msgSend(v8, "unsignedLongLongValue"));
      }

      v9 = [v5 objectForKeyedSubscript:@"p25"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP25:", objc_msgSend(v9, "unsignedLongLongValue"));
      }

      v10 = [v5 objectForKeyedSubscript:@"p50"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP50:", objc_msgSend(v10, "unsignedLongLongValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"p75"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP75:", objc_msgSend(v11, "unsignedLongLongValue"));
      }

      v12 = [v5 objectForKeyedSubscript:@"p90"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP90:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      v13 = [v5 objectForKeyedSubscript:@"p99"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setP99:", objc_msgSend(v13, "unsignedLongLongValue"));
      }

      if (a3) {
        v14 = @"algMean";
      }
      else {
        v14 = @"alg_mean";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAlgMean:", objc_msgSend(v15, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEONetEventAggregateStats)initWithJSON:(id)a3
{
  return (GEONetEventAggregateStats *)-[GEONetEventAggregateStats _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetEventAggregateStatsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetEventAggregateStatsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  if (*(_WORD *)&self->_flags) {
LABEL_10:
  }
    PBDataWriterWriteUint64Field();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONetEventAggregateStats *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[3] = self->_min;
    *((_WORD *)v5 + 40) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_max;
  *((_WORD *)v5 + 40) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v5[4] = self->_p10;
  *((_WORD *)v5 + 40) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v5[5] = self->_p25;
  *((_WORD *)v5 + 40) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v5[6] = self->_p50;
  *((_WORD *)v5 + 40) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v5[7] = self->_p75;
  *((_WORD *)v5 + 40) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v5[8] = self->_p90;
  *((_WORD *)v5 + 40) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v5[9] = self->_p99;
  *((_WORD *)v5 + 40) |= 0x100u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_10:
    v5[1] = self->_algMean;
    *((_WORD *)v5 + 40) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)result + 3) = self->_min;
    *((_WORD *)result + 40) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_max;
  *((_WORD *)result + 40) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 4) = self->_p10;
  *((_WORD *)result + 40) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 5) = self->_p25;
  *((_WORD *)result + 40) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 6) = self->_p50;
  *((_WORD *)result + 40) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 7) = self->_p75;
  *((_WORD *)result + 40) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 8) = self->_p90;
  *((_WORD *)result + 40) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 9) = self->_p99;
  *((_WORD *)result + 40) |= 0x100u;
  if ((*(_WORD *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 1) = self->_algMean;
  *((_WORD *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEONetEventAggregateStats *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_min != *((void *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 4) != 0)
  {
LABEL_47:
    BOOL v7 = 0;
    goto LABEL_48;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_max != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_p10 != *((void *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_p25 != *((void *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_p50 != *((void *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_p75 != *((void *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_p90 != *((void *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_p99 != *((void *)v4 + 9)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_algMean != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 1) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  [(GEONetEventAggregateStats *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    unint64_t v4 = 2654435761u * self->_min;
    if ((flags & 2) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_max;
      if ((flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_p10;
    if ((flags & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v6 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_5:
    unint64_t v7 = 2654435761u * self->_p25;
    if ((flags & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v7 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_6:
    unint64_t v8 = 2654435761u * self->_p50;
    if ((flags & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v8 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_p75;
    if ((flags & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v9 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    unint64_t v10 = 2654435761u * self->_p90;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v11 = 0;
    if (flags) {
      goto LABEL_10;
    }
LABEL_19:
    unint64_t v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_17:
  unint64_t v10 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  unint64_t v11 = 2654435761u * self->_p99;
  if ((flags & 1) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  unint64_t v12 = 2654435761u * self->_algMean;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (unint64_t *)a3;
  [v5 readAll:0];
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 4) != 0)
  {
    self->_min = v5[3];
    *(_WORD *)&self->_flags |= 4u;
    __int16 v4 = *((_WORD *)v5 + 40);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_max = v5[2];
  *(_WORD *)&self->_flags |= 2u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_p10 = v5[4];
  *(_WORD *)&self->_flags |= 8u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_p25 = v5[5];
  *(_WORD *)&self->_flags |= 0x10u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_p50 = v5[6];
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_p75 = v5[7];
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_p90 = v5[8];
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x100) == 0)
  {
LABEL_9:
    if ((v4 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_p99 = v5[9];
  *(_WORD *)&self->_flags |= 0x100u;
  if (v5[10])
  {
LABEL_10:
    self->_algMean = v5[1];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_11:
}

@end