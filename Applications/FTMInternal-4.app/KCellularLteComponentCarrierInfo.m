@interface KCellularLteComponentCarrierInfo
+ (Class)carrierInfoType;
- (BOOL)hasPccBandwidth;
- (BOOL)hasPccEarfcn;
- (BOOL)hasPccRfBand;
- (BOOL)hasScc0Bandwidth;
- (BOOL)hasScc0Earfcn;
- (BOOL)hasScc0RfBand;
- (BOOL)hasScc1Bandwidth;
- (BOOL)hasScc1Earfcn;
- (BOOL)hasScc1RfBand;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)carrierInfos;
- (id)carrierInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)carrierInfosCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)pccBandwidth;
- (unsigned)pccEarfcn;
- (unsigned)pccRfBand;
- (unsigned)scc0Bandwidth;
- (unsigned)scc0Earfcn;
- (unsigned)scc0RfBand;
- (unsigned)scc1Bandwidth;
- (unsigned)scc1Earfcn;
- (unsigned)scc1RfBand;
- (unsigned)subsId;
- (void)addCarrierInfo:(id)a3;
- (void)clearCarrierInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarrierInfos:(id)a3;
- (void)setHasPccBandwidth:(BOOL)a3;
- (void)setHasPccEarfcn:(BOOL)a3;
- (void)setHasPccRfBand:(BOOL)a3;
- (void)setHasScc0Bandwidth:(BOOL)a3;
- (void)setHasScc0Earfcn:(BOOL)a3;
- (void)setHasScc0RfBand:(BOOL)a3;
- (void)setHasScc1Bandwidth:(BOOL)a3;
- (void)setHasScc1Earfcn:(BOOL)a3;
- (void)setHasScc1RfBand:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPccBandwidth:(unsigned int)a3;
- (void)setPccEarfcn:(unsigned int)a3;
- (void)setPccRfBand:(unsigned int)a3;
- (void)setScc0Bandwidth:(unsigned int)a3;
- (void)setScc0Earfcn:(unsigned int)a3;
- (void)setScc0RfBand:(unsigned int)a3;
- (void)setScc1Bandwidth:(unsigned int)a3;
- (void)setScc1Earfcn:(unsigned int)a3;
- (void)setScc1RfBand:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteComponentCarrierInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPccEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_pccEarfcn = a3;
}

- (void)setHasPccEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPccEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScc0Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_scc0Earfcn = a3;
}

- (void)setHasScc0Earfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScc0Earfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScc1Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scc1Earfcn = a3;
}

- (void)setHasScc1Earfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScc1Earfcn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPccBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pccBandwidth = a3;
}

- (void)setHasPccBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPccBandwidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setScc0Bandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_scc0Bandwidth = a3;
}

- (void)setHasScc0Bandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScc0Bandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScc1Bandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scc1Bandwidth = a3;
}

- (void)setHasScc1Bandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScc1Bandwidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPccRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pccRfBand = a3;
}

- (void)setHasPccRfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPccRfBand
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScc0RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scc0RfBand = a3;
}

- (void)setHasScc0RfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScc0RfBand
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScc1RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scc1RfBand = a3;
}

- (void)setHasScc1RfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScc1RfBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearCarrierInfos
{
}

- (void)addCarrierInfo:(id)a3
{
  id v4 = a3;
  carrierInfos = self->_carrierInfos;
  id v8 = v4;
  if (!carrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_carrierInfos;
    self->_carrierInfos = v6;

    id v4 = v8;
    carrierInfos = self->_carrierInfos;
  }
  [(NSMutableArray *)carrierInfos addObject:v4];
}

- (unint64_t)carrierInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_carrierInfos count];
}

- (id)carrierInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_carrierInfos objectAtIndex:a3];
}

+ (Class)carrierInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularLteComponentCarrierInfo;
  __int16 v3 = [(KCellularLteComponentCarrierInfo *)&v7 description];
  id v4 = [(KCellularLteComponentCarrierInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v15 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v16 = +[NSNumber numberWithUnsignedInt:self->_pccEarfcn];
  [v3 setObject:v16 forKey:@"pcc_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = +[NSNumber numberWithUnsignedInt:self->_scc0Earfcn];
  [v3 setObject:v17 forKey:@"scc0_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v18 = +[NSNumber numberWithUnsignedInt:self->_scc1Earfcn];
  [v3 setObject:v18 forKey:@"scc1_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v19 = +[NSNumber numberWithUnsignedInt:self->_pccBandwidth];
  [v3 setObject:v19 forKey:@"pcc_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v20 = +[NSNumber numberWithUnsignedInt:self->_scc0Bandwidth];
  [v3 setObject:v20 forKey:@"scc0_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v21 = +[NSNumber numberWithUnsignedInt:self->_scc1Bandwidth];
  [v3 setObject:v21 forKey:@"scc1_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v22 = +[NSNumber numberWithUnsignedInt:self->_pccRfBand];
  [v3 setObject:v22 forKey:@"pcc_rf_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_34:
  v23 = +[NSNumber numberWithUnsignedInt:self->_scc0RfBand];
  [v3 setObject:v23 forKey:@"scc0_rf_band"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v5 = +[NSNumber numberWithUnsignedInt:self->_scc1RfBand];
    [v3 setObject:v5 forKey:@"scc1_rf_band"];
  }
LABEL_12:
  if ([(NSMutableArray *)self->_carrierInfos count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_carrierInfos, "count")];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    objc_super v7 = self->_carrierInfos;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"carrier_info"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v13 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v13 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AD304((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_carrierInfos;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_pccEarfcn;
  *((_WORD *)v4 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 10) = self->_scc0Earfcn;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 13) = self->_scc1Earfcn;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 6) = self->_pccBandwidth;
  *((_WORD *)v4 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v4 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_29:
    *((_DWORD *)v4 + 11) = self->_scc0RfBand;
    *((_WORD *)v4 + 32) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_28:
  *((_DWORD *)v4 + 8) = self->_pccRfBand;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_29;
  }
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_scc1RfBand;
    *((_WORD *)v4 + 32) |= 0x200u;
  }
LABEL_12:
  id v10 = v4;
  if ([(KCellularLteComponentCarrierInfo *)self carrierInfosCount])
  {
    [v10 clearCarrierInfos];
    unint64_t v6 = [(KCellularLteComponentCarrierInfo *)self carrierInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(KCellularLteComponentCarrierInfo *)self carrierInfoAtIndex:i];
        [v10 addCarrierInfo:v9];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v10 + 15) = self->_subsId;
    *((_WORD *)v10 + 32) |= 0x400u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_pccEarfcn;
  *((_WORD *)v5 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 10) = self->_scc0Earfcn;
  *((_WORD *)v5 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 13) = self->_scc1Earfcn;
  *((_WORD *)v5 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 6) = self->_pccBandwidth;
  *((_WORD *)v5 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v5 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v5 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 8) = self->_pccRfBand;
  *((_WORD *)v5 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  *((_DWORD *)v5 + 11) = self->_scc0RfBand;
  *((_WORD *)v5 + 32) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 14) = self->_scc1RfBand;
    *((_WORD *)v5 + 32) |= 0x200u;
  }
LABEL_12:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_carrierInfos;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addCarrierInfo:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_subsId;
    *((_WORD *)v6 + 32) |= 0x400u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (v6)
  {
    goto LABEL_60;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_pccEarfcn != *((_DWORD *)v4 + 7)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_scc0Earfcn != *((_DWORD *)v4 + 10)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_scc1Earfcn != *((_DWORD *)v4 + 13)) {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_pccBandwidth != *((_DWORD *)v4 + 6)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_scc0Bandwidth != *((_DWORD *)v4 + 9)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_scc1Bandwidth != *((_DWORD *)v4 + 12)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_pccRfBand != *((_DWORD *)v4 + 8)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_scc0RfBand != *((_DWORD *)v4 + 11)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_scc1RfBand != *((_DWORD *)v4 + 14)) {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_60;
  }
  carrierInfos = self->_carrierInfos;
  if ((unint64_t)carrierInfos | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](carrierInfos, "isEqual:"))
    {
LABEL_60:
      BOOL v8 = 0;
      goto LABEL_61;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 15)) {
      goto LABEL_60;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (*((_WORD *)v4 + 32) & 0x400) == 0;
  }
LABEL_61:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_pccEarfcn;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v14 = 2654435761 * self->_scc0Earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_scc1Earfcn;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_pccBandwidth;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_scc0Bandwidth;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_scc1Bandwidth;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_pccRfBand;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_scc0RfBand;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_scc1RfBand;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
LABEL_22:
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_carrierInfos hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v12 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pccEarfcn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_scc0Earfcn = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_5:
    if ((v6 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_scc1Earfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_pccBandwidth = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_scc0Bandwidth = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_scc1Bandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_pccRfBand = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  self->_scc0RfBand = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_11:
    self->_scc1RfBand = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_12:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[KCellularLteComponentCarrierInfo addCarrierInfo:](self, "addCarrierInfo:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((v5[16] & 0x400) != 0)
  {
    self->_subsId = v5[15];
    *(_WORD *)&self->_has |= 0x400u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pccEarfcn
{
  return self->_pccEarfcn;
}

- (unsigned)scc0Earfcn
{
  return self->_scc0Earfcn;
}

- (unsigned)scc1Earfcn
{
  return self->_scc1Earfcn;
}

- (unsigned)pccBandwidth
{
  return self->_pccBandwidth;
}

- (unsigned)scc0Bandwidth
{
  return self->_scc0Bandwidth;
}

- (unsigned)scc1Bandwidth
{
  return self->_scc1Bandwidth;
}

- (unsigned)pccRfBand
{
  return self->_pccRfBand;
}

- (unsigned)scc0RfBand
{
  return self->_scc0RfBand;
}

- (unsigned)scc1RfBand
{
  return self->_scc1RfBand;
}

- (NSMutableArray)carrierInfos
{
  return self->_carrierInfos;
}

- (void)setCarrierInfos:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end