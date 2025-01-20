@interface ServingCellBeamInfo
- (BOOL)hasAntennaPanelIndex;
- (BOOL)hasCellPci;
- (BOOL)hasCellRsrp;
- (BOOL)hasCellRsrq;
- (BOOL)hasNumDetectedTxBeams;
- (BOOL)hasRasterArfcn;
- (BOOL)hasRxBeamRsrp;
- (BOOL)hasSsbIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cellRsrp;
- (int)cellRsrq;
- (int)rxBeamRsrp;
- (unint64_t)hash;
- (unint64_t)rxBeamIdsCount;
- (unsigned)antennaPanelIndex;
- (unsigned)cellPci;
- (unsigned)numDetectedTxBeams;
- (unsigned)rasterArfcn;
- (unsigned)rxBeamIdAtIndex:(unint64_t)a3;
- (unsigned)rxBeamIds;
- (unsigned)ssbIndex;
- (void)addRxBeamId:(unsigned int)a3;
- (void)clearRxBeamIds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAntennaPanelIndex:(unsigned int)a3;
- (void)setCellPci:(unsigned int)a3;
- (void)setCellRsrp:(int)a3;
- (void)setCellRsrq:(int)a3;
- (void)setHasAntennaPanelIndex:(BOOL)a3;
- (void)setHasCellPci:(BOOL)a3;
- (void)setHasCellRsrp:(BOOL)a3;
- (void)setHasCellRsrq:(BOOL)a3;
- (void)setHasNumDetectedTxBeams:(BOOL)a3;
- (void)setHasRasterArfcn:(BOOL)a3;
- (void)setHasRxBeamRsrp:(BOOL)a3;
- (void)setHasSsbIndex:(BOOL)a3;
- (void)setNumDetectedTxBeams:(unsigned int)a3;
- (void)setRasterArfcn:(unsigned int)a3;
- (void)setRxBeamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRxBeamRsrp:(int)a3;
- (void)setSsbIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ServingCellBeamInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ServingCellBeamInfo;
  [(ServingCellBeamInfo *)&v3 dealloc];
}

- (void)setCellPci:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cellPci = a3;
}

- (void)setHasCellPci:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellPci
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSsbIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_ssbIndex = a3;
}

- (void)setHasSsbIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSsbIndex
{
  return *(unsigned char *)&self->_has >> 7;
}

- (unint64_t)rxBeamIdsCount
{
  return self->_rxBeamIds.count;
}

- (unsigned)rxBeamIds
{
  return self->_rxBeamIds.list;
}

- (void)clearRxBeamIds
{
}

- (void)addRxBeamId:(unsigned int)a3
{
}

- (unsigned)rxBeamIdAtIndex:(unint64_t)a3
{
  p_rxBeamIds = &self->_rxBeamIds;
  unint64_t count = self->_rxBeamIds.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rxBeamIds->list[a3];
}

- (void)setRxBeamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setNumDetectedTxBeams:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numDetectedTxBeams = a3;
}

- (void)setHasNumDetectedTxBeams:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumDetectedTxBeams
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAntennaPanelIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_antennaPanelIndex = a3;
}

- (void)setHasAntennaPanelIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAntennaPanelIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCellRsrp:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cellRsrp = a3;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCellRsrp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCellRsrq:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_cellRsrq = a3;
}

- (void)setHasCellRsrq:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCellRsrq
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRxBeamRsrp:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_rxBeamRsrp = a3;
}

- (void)setHasRxBeamRsrp:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRxBeamRsrp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRasterArfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rasterArfcn = a3;
}

- (void)setHasRasterArfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRasterArfcn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ServingCellBeamInfo;
  char v3 = [(ServingCellBeamInfo *)&v7 description];
  v4 = [(ServingCellBeamInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_cellPci];
    [v3 setObject:v5 forKey:@"cell_pci"];

    char has = (char)self->_has;
  }
  if (has < 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_ssbIndex];
    [v3 setObject:v6 forKey:@"ssb_index"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rx_beam_id"];

  char v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
  {
    v11 = +[NSNumber numberWithUnsignedInt:self->_numDetectedTxBeams];
    [v3 setObject:v11 forKey:@"num_detected_tx_beams"];

    char v8 = (char)self->_has;
    if ((v8 & 1) == 0)
    {
LABEL_7:
      if ((v8 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_antennaPanelIndex];
  [v3 setObject:v12 forKey:@"antenna_panel_index"];

  char v8 = (char)self->_has;
  if ((v8 & 4) == 0)
  {
LABEL_8:
    if ((v8 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  v13 = +[NSNumber numberWithInt:self->_cellRsrp];
  [v3 setObject:v13 forKey:@"cell_rsrp"];

  char v8 = (char)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_9:
    if ((v8 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v14 = +[NSNumber numberWithInt:self->_cellRsrq];
  [v3 setObject:v14 forKey:@"cell_rsrq"];

  char v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_10:
    if ((v8 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v15 = +[NSNumber numberWithInt:self->_rxBeamRsrp];
  [v3 setObject:v15 forKey:@"rx_beam_rsrp"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    v9 = +[NSNumber numberWithUnsignedInt:self->_rasterArfcn];
    [v3 setObject:v9 forKey:@"raster_arfcn"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005F254((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v8 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if (has < 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_rxBeamIds.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v8;
      ++v6;
    }
    while (v6 < self->_rxBeamIds.count);
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    char v7 = (char)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_10:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  char v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_11:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  char v7 = (char)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  char v7 = (char)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_cellPci;
    *((unsigned char *)v4 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has < 0)
  {
    v4[15] = self->_ssbIndex;
    *((unsigned char *)v4 + 64) |= 0x80u;
  }
  id v10 = v4;
  if ([(ServingCellBeamInfo *)self rxBeamIdsCount])
  {
    [v10 clearRxBeamIds];
    unint64_t v6 = [(ServingCellBeamInfo *)self rxBeamIdsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v10 addRxBeamId:[self rxBeamIdAtIndex:i]];
    }
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 12) = self->_numDetectedTxBeams;
    *((unsigned char *)v10 + 64) |= 0x10u;
    char v9 = (char)self->_has;
    if ((v9 & 1) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v10 + 8) = self->_antennaPanelIndex;
  *((unsigned char *)v10 + 64) |= 1u;
  char v9 = (char)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v10 + 10) = self->_cellRsrp;
  *((unsigned char *)v10 + 64) |= 4u;
  char v9 = (char)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_13:
    if ((v9 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v10 + 11) = self->_cellRsrq;
  *((unsigned char *)v10 + 64) |= 8u;
  char v9 = (char)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_14:
    if ((v9 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  *((_DWORD *)v10 + 14) = self->_rxBeamRsrp;
  *((unsigned char *)v10 + 64) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *((_DWORD *)v10 + 13) = self->_rasterArfcn;
    *((unsigned char *)v10 + 64) |= 0x20u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_cellPci;
    *((unsigned char *)v4 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has < 0)
  {
    v4[15] = self->_ssbIndex;
    *((unsigned char *)v4 + 64) |= 0x80u;
  }
  PBRepeatedUInt32Copy();
  char v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    v5[12] = self->_numDetectedTxBeams;
    *((unsigned char *)v5 + 64) |= 0x10u;
    char v7 = (char)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_7:
      if ((v7 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v5[8] = self->_antennaPanelIndex;
  *((unsigned char *)v5 + 64) |= 1u;
  char v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_8:
    if ((v7 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  v5[10] = self->_cellRsrp;
  *((unsigned char *)v5 + 64) |= 4u;
  char v7 = (char)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_17:
    v5[14] = self->_rxBeamRsrp;
    *((unsigned char *)v5 + 64) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v5;
    }
    goto LABEL_11;
  }
LABEL_16:
  v5[11] = self->_cellRsrq;
  *((unsigned char *)v5 + 64) |= 8u;
  char v7 = (char)self->_has;
  if ((v7 & 0x40) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if ((v7 & 0x20) != 0)
  {
LABEL_11:
    v5[13] = self->_rasterArfcn;
    *((unsigned char *)v5 + 64) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_cellPci != *((_DWORD *)v4 + 9)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x80) == 0 || self->_ssbIndex != *((_DWORD *)v4 + 15)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x80) != 0)
  {
LABEL_42:
    BOOL v5 = 0;
    goto LABEL_43;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_numDetectedTxBeams != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_antennaPanelIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_cellRsrp != *((_DWORD *)v4 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_cellRsrq != *((_DWORD *)v4 + 11)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) == 0 || self->_rxBeamRsrp != *((_DWORD *)v4 + 14)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  BOOL v5 = (*((unsigned char *)v4 + 64) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_rasterArfcn != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
    BOOL v5 = 1;
  }
LABEL_43:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_cellPci;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_ssbIndex;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_numDetectedTxBeams;
    if (*(unsigned char *)&self->_has)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_antennaPanelIndex;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_cellRsrp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    uint64_t v9 = 2654435761 * self->_cellRsrq;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_18:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v5;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_rxBeamRsrp;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_rasterArfcn;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) != 0)
  {
    self->_cellPcuint64_t i = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if (v5 < 0)
  {
    self->_ssbIndex = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  id v10 = v4;
  uint64_t v6 = (char *)[v4 rxBeamIdsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[ServingCellBeamInfo addRxBeamId:](self, "addRxBeamId:", [v10 rxBeamIdAtIndex:i]);
  }
  char v9 = *((unsigned char *)v10 + 64);
  if ((v9 & 0x10) != 0)
  {
    self->_numDetectedTxBeams = *((_DWORD *)v10 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
    char v9 = *((unsigned char *)v10 + 64);
    if ((v9 & 1) == 0)
    {
LABEL_10:
      if ((v9 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v10 + 64) & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_antennaPanelIndex = *((_DWORD *)v10 + 8);
  *(unsigned char *)&self->_has |= 1u;
  char v9 = *((unsigned char *)v10 + 64);
  if ((v9 & 4) == 0)
  {
LABEL_11:
    if ((v9 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_cellRsrp = *((_DWORD *)v10 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v9 = *((unsigned char *)v10 + 64);
  if ((v9 & 8) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_cellRsrq = *((_DWORD *)v10 + 11);
  *(unsigned char *)&self->_has |= 8u;
  char v9 = *((unsigned char *)v10 + 64);
  if ((v9 & 0x40) == 0)
  {
LABEL_13:
    if ((v9 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_22:
  self->_rxBeamRsrp = *((_DWORD *)v10 + 14);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v10 + 64) & 0x20) != 0)
  {
LABEL_14:
    self->_rasterArfcn = *((_DWORD *)v10 + 13);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_15:
}

- (unsigned)cellPci
{
  return self->_cellPci;
}

- (unsigned)ssbIndex
{
  return self->_ssbIndex;
}

- (unsigned)numDetectedTxBeams
{
  return self->_numDetectedTxBeams;
}

- (unsigned)antennaPanelIndex
{
  return self->_antennaPanelIndex;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (int)cellRsrq
{
  return self->_cellRsrq;
}

- (int)rxBeamRsrp
{
  return self->_rxBeamRsrp;
}

- (unsigned)rasterArfcn
{
  return self->_rasterArfcn;
}

@end