@interface KCellularWcdmaSelReselCellInfo
+ (Class)eutraPrioInfoType;
+ (Class)gsmPrioInfoType;
+ (Class)utraPrioInfoType;
- (BOOL)hasCellBarred;
- (BOOL)hasDuplexMode;
- (BOOL)hasEdchCapable;
- (BOOL)hasFachMeasOccInfoPresent;
- (BOOL)hasHsdpaCapable;
- (BOOL)hasImsEmergencySupport;
- (BOOL)hasSCellPrio;
- (BOOL)hasSIntersearch;
- (BOOL)hasSIntrasearch;
- (BOOL)hasSQual;
- (BOOL)hasSRxlev;
- (BOOL)hasSSearchRat;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)eutraPrioInfos;
- (NSMutableArray)gsmPrioInfos;
- (NSMutableArray)utraPrioInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)duplexModeAsString:(int)a3;
- (id)eutraPrioInfoAtIndex:(unint64_t)a3;
- (id)gsmPrioInfoAtIndex:(unint64_t)a3;
- (id)utraPrioInfoAtIndex:(unint64_t)a3;
- (int)StringAsDuplexMode:(id)a3;
- (int)duplexMode;
- (int)sIntersearch;
- (int)sIntrasearch;
- (int)sQual;
- (int)sRxlev;
- (int)sSearchRat;
- (unint64_t)eutraPrioInfosCount;
- (unint64_t)gsmPrioInfosCount;
- (unint64_t)hash;
- (unint64_t)multiBandInfosCount;
- (unint64_t)timestamp;
- (unint64_t)utraPrioInfosCount;
- (unsigned)cellBarred;
- (unsigned)edchCapable;
- (unsigned)fachMeasOccInfoPresent;
- (unsigned)hsdpaCapable;
- (unsigned)imsEmergencySupport;
- (unsigned)multiBandInfoAtIndex:(unint64_t)a3;
- (unsigned)multiBandInfos;
- (unsigned)sCellPrio;
- (unsigned)subsId;
- (void)addEutraPrioInfo:(id)a3;
- (void)addGsmPrioInfo:(id)a3;
- (void)addMultiBandInfo:(unsigned int)a3;
- (void)addUtraPrioInfo:(id)a3;
- (void)clearEutraPrioInfos;
- (void)clearGsmPrioInfos;
- (void)clearMultiBandInfos;
- (void)clearUtraPrioInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCellBarred:(unsigned int)a3;
- (void)setDuplexMode:(int)a3;
- (void)setEdchCapable:(unsigned int)a3;
- (void)setEutraPrioInfos:(id)a3;
- (void)setFachMeasOccInfoPresent:(unsigned int)a3;
- (void)setGsmPrioInfos:(id)a3;
- (void)setHasCellBarred:(BOOL)a3;
- (void)setHasDuplexMode:(BOOL)a3;
- (void)setHasEdchCapable:(BOOL)a3;
- (void)setHasFachMeasOccInfoPresent:(BOOL)a3;
- (void)setHasHsdpaCapable:(BOOL)a3;
- (void)setHasImsEmergencySupport:(BOOL)a3;
- (void)setHasSCellPrio:(BOOL)a3;
- (void)setHasSIntersearch:(BOOL)a3;
- (void)setHasSIntrasearch:(BOOL)a3;
- (void)setHasSQual:(BOOL)a3;
- (void)setHasSRxlev:(BOOL)a3;
- (void)setHasSSearchRat:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHsdpaCapable:(unsigned int)a3;
- (void)setImsEmergencySupport:(unsigned int)a3;
- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSCellPrio:(unsigned int)a3;
- (void)setSIntersearch:(int)a3;
- (void)setSIntrasearch:(int)a3;
- (void)setSQual:(int)a3;
- (void)setSRxlev:(int)a3;
- (void)setSSearchRat:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUtraPrioInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularWcdmaSelReselCellInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)KCellularWcdmaSelReselCellInfo;
  [(KCellularWcdmaSelReselCellInfo *)&v3 dealloc];
}

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

- (void)setHsdpaCapable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hsdpaCapable = a3;
}

- (void)setHasHsdpaCapable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHsdpaCapable
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setEdchCapable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_edchCapable = a3;
}

- (void)setHasEdchCapable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEdchCapable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)duplexMode
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_duplexMode;
  }
  else {
    return 0;
  }
}

- (void)setDuplexMode:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duplexMode = a3;
}

- (void)setHasDuplexMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuplexMode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)duplexModeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"TDD";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"FDD";
  }
  return v4;
}

- (int)StringAsDuplexMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FDD"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TDD"];
  }

  return v4;
}

- (unint64_t)multiBandInfosCount
{
  return self->_multiBandInfos.count;
}

- (unsigned)multiBandInfos
{
  return self->_multiBandInfos.list;
}

- (void)clearMultiBandInfos
{
}

- (void)addMultiBandInfo:(unsigned int)a3
{
}

- (unsigned)multiBandInfoAtIndex:(unint64_t)a3
{
  p_multiBandInfos = &self->_multiBandInfos;
  unint64_t count = self->_multiBandInfos.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_multiBandInfos->list[a3];
}

- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setImsEmergencySupport:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_imsEmergencySupport = a3;
}

- (void)setHasImsEmergencySupport:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasImsEmergencySupport
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCellBarred:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellBarred = a3;
}

- (void)setHasCellBarred:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellBarred
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFachMeasOccInfoPresent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fachMeasOccInfoPresent = a3;
}

- (void)setHasFachMeasOccInfoPresent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFachMeasOccInfoPresent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSRxlev:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sRxlev = a3;
}

- (void)setHasSRxlev:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSRxlev
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSQual:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sQual = a3;
}

- (void)setHasSQual:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSQual
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSIntrasearch:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sIntrasearch = a3;
}

- (void)setHasSIntrasearch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSIntrasearch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSIntersearch:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sIntersearch = a3;
}

- (void)setHasSIntersearch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSIntersearch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSSearchRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sSearchRat = a3;
}

- (void)setHasSSearchRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSSearchRat
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSCellPrio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sCellPrio = a3;
}

- (void)setHasSCellPrio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSCellPrio
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearEutraPrioInfos
{
}

- (void)addEutraPrioInfo:(id)a3
{
  id v4 = a3;
  eutraPrioInfos = self->_eutraPrioInfos;
  id v8 = v4;
  if (!eutraPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_eutraPrioInfos;
    self->_eutraPrioInfos = v6;

    id v4 = v8;
    eutraPrioInfos = self->_eutraPrioInfos;
  }
  [(NSMutableArray *)eutraPrioInfos addObject:v4];
}

- (unint64_t)eutraPrioInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_eutraPrioInfos count];
}

- (id)eutraPrioInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_eutraPrioInfos objectAtIndex:a3];
}

+ (Class)eutraPrioInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearUtraPrioInfos
{
}

- (void)addUtraPrioInfo:(id)a3
{
  id v4 = a3;
  utraPrioInfos = self->_utraPrioInfos;
  id v8 = v4;
  if (!utraPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_utraPrioInfos;
    self->_utraPrioInfos = v6;

    id v4 = v8;
    utraPrioInfos = self->_utraPrioInfos;
  }
  [(NSMutableArray *)utraPrioInfos addObject:v4];
}

- (unint64_t)utraPrioInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_utraPrioInfos count];
}

- (id)utraPrioInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_utraPrioInfos objectAtIndex:a3];
}

+ (Class)utraPrioInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearGsmPrioInfos
{
}

- (void)addGsmPrioInfo:(id)a3
{
  id v4 = a3;
  gsmPrioInfos = self->_gsmPrioInfos;
  id v8 = v4;
  if (!gsmPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_gsmPrioInfos;
    self->_gsmPrioInfos = v6;

    id v4 = v8;
    gsmPrioInfos = self->_gsmPrioInfos;
  }
  [(NSMutableArray *)gsmPrioInfos addObject:v4];
}

- (unint64_t)gsmPrioInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_gsmPrioInfos count];
}

- (id)gsmPrioInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_gsmPrioInfos objectAtIndex:a3];
}

+ (Class)gsmPrioInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularWcdmaSelReselCellInfo;
  __int16 v3 = [(KCellularWcdmaSelReselCellInfo *)&v7 description];
  id v4 = [(KCellularWcdmaSelReselCellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v6 = +[NSNumber numberWithUnsignedInt:self->_hsdpaCapable];
  [v3 setObject:v6 forKey:@"hsdpa_capable"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
LABEL_8:
  objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_edchCapable];
  [v3 setObject:v7 forKey:@"edch_capable"];

  if ((*(_WORD *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  int duplexMode = self->_duplexMode;
  if (duplexMode)
  {
    if (duplexMode == 1)
    {
      v9 = @"TDD";
    }
    else
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_duplexMode];
    }
  }
  else
  {
    v9 = @"FDD";
  }
  [v3 setObject:v9 forKey:@"duplex_mode"];

LABEL_15:
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"multi_band_info"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v36 = +[NSNumber numberWithUnsignedInt:self->_imsEmergencySupport];
    [v3 setObject:v36 forKey:@"ims_emergency_support"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_17:
      if ((v11 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_59;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_17;
  }
  v37 = +[NSNumber numberWithUnsignedInt:self->_cellBarred];
  [v3 setObject:v37 forKey:@"cell_barred"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_18:
    if ((v11 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_60;
  }
LABEL_59:
  v38 = +[NSNumber numberWithUnsignedInt:self->_fachMeasOccInfoPresent];
  [v3 setObject:v38 forKey:@"fach_meas_occ_info_present"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x800) == 0)
  {
LABEL_19:
    if ((v11 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_61;
  }
LABEL_60:
  v39 = +[NSNumber numberWithInt:self->_sRxlev];
  [v3 setObject:v39 forKey:@"s_rxlev"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x400) == 0)
  {
LABEL_20:
    if ((v11 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_62;
  }
LABEL_61:
  v40 = +[NSNumber numberWithInt:self->_sQual];
  [v3 setObject:v40 forKey:@"s_qual"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_21:
    if ((v11 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_63;
  }
LABEL_62:
  v41 = +[NSNumber numberWithInt:self->_sIntrasearch];
  [v3 setObject:v41 forKey:@"s_intrasearch"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_22:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  v42 = +[NSNumber numberWithInt:self->_sIntersearch];
  [v3 setObject:v42 forKey:@"s_intersearch"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_23:
    if ((v11 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_64:
  v43 = +[NSNumber numberWithInt:self->_sSearchRat];
  [v3 setObject:v43 forKey:@"s_search_rat"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_24:
    v12 = +[NSNumber numberWithUnsignedInt:self->_sCellPrio];
    [v3 setObject:v12 forKey:@"s_cell_prio"];
  }
LABEL_25:
  if ([(NSMutableArray *)self->_eutraPrioInfos count])
  {
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_eutraPrioInfos, "count")];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v14 = self->_eutraPrioInfos;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v53;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"eutra_prio_info"];
  }
  if ([(NSMutableArray *)self->_utraPrioInfos count])
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_utraPrioInfos, "count")];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v21 = self->_utraPrioInfos;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"utra_prio_info"];
  }
  if ([(NSMutableArray *)self->_gsmPrioInfos count])
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_gsmPrioInfos, "count")];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v28 = self->_gsmPrioInfos;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"gsm_prio_info"];
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v34 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v34 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009AF90((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_multiBandInfos.count)
  {
    uint64_t v35 = 0;
    PBDataWriterPlaceMark();
    if (self->_multiBandInfos.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_multiBandInfos.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_13:
      if ((v7 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_51;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_14:
    if ((v7 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_15:
    if ((v7 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteSint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
LABEL_16:
    if ((v7 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteSint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_17:
    if ((v7 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteSint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_18:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x1000) == 0)
  {
LABEL_19:
    if ((v7 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_56:
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = self->_eutraPrioInfos;
  v9 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      v10 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = self->_utraPrioInfos;
  v14 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      id v15 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = self->_gsmPrioInfos;
  v19 = (char *)[(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      id v20 = (char *)[(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[4] = self->_timestamp;
    *((_WORD *)v4 + 64) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_39:
      *((_DWORD *)v4 + 12) = self->_edchCapable;
      *((_WORD *)v4 + 64) |= 8u;
      if ((*(_WORD *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 20) = self->_hsdpaCapable;
  *((_WORD *)v4 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_39;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 11) = self->_duplexMode;
    *((_WORD *)v4 + 64) |= 4u;
  }
LABEL_6:
  id v22 = v4;
  if ([(KCellularWcdmaSelReselCellInfo *)self multiBandInfosCount])
  {
    [v22 clearMultiBandInfos];
    unint64_t v6 = [(KCellularWcdmaSelReselCellInfo *)self multiBandInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v22 addMultiBandInfo:[self multiBandInfoAtIndex:i]];
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    *((_DWORD *)v22 + 21) = self->_imsEmergencySupport;
    *((_WORD *)v22 + 64) |= 0x40u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_12:
      if ((v9 & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_43;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v22 + 10) = self->_cellBarred;
  *((_WORD *)v22 + 64) |= 2u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v22 + 16) = self->_fachMeasOccInfoPresent;
  *((_WORD *)v22 + 64) |= 0x10u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v22 + 26) = self->_sRxlev;
  *((_WORD *)v22 + 64) |= 0x800u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x400) == 0)
  {
LABEL_15:
    if ((v9 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v22 + 25) = self->_sQual;
  *((_WORD *)v22 + 64) |= 0x400u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_16:
    if ((v9 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v22 + 24) = self->_sIntrasearch;
  *((_WORD *)v22 + 64) |= 0x200u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_17:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_18;
    }
LABEL_48:
    *((_DWORD *)v22 + 27) = self->_sSearchRat;
    *((_WORD *)v22 + 64) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_47:
  *((_DWORD *)v22 + 23) = self->_sIntersearch;
  *((_WORD *)v22 + 64) |= 0x100u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x1000) != 0) {
    goto LABEL_48;
  }
LABEL_18:
  if ((v9 & 0x80) != 0)
  {
LABEL_19:
    *((_DWORD *)v22 + 22) = self->_sCellPrio;
    *((_WORD *)v22 + 64) |= 0x80u;
  }
LABEL_20:
  if ([(KCellularWcdmaSelReselCellInfo *)self eutraPrioInfosCount])
  {
    [v22 clearEutraPrioInfos];
    unint64_t v10 = [(KCellularWcdmaSelReselCellInfo *)self eutraPrioInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v13 = [(KCellularWcdmaSelReselCellInfo *)self eutraPrioInfoAtIndex:j];
        [v22 addEutraPrioInfo:v13];
      }
    }
  }
  if ([(KCellularWcdmaSelReselCellInfo *)self utraPrioInfosCount])
  {
    [v22 clearUtraPrioInfos];
    unint64_t v14 = [(KCellularWcdmaSelReselCellInfo *)self utraPrioInfosCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(KCellularWcdmaSelReselCellInfo *)self utraPrioInfoAtIndex:k];
        [v22 addUtraPrioInfo:v17];
      }
    }
  }
  if ([(KCellularWcdmaSelReselCellInfo *)self gsmPrioInfosCount])
  {
    [v22 clearGsmPrioInfos];
    unint64_t v18 = [(KCellularWcdmaSelReselCellInfo *)self gsmPrioInfosCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(KCellularWcdmaSelReselCellInfo *)self gsmPrioInfoAtIndex:m];
        [v22 addGsmPrioInfo:v21];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v22 + 28) = self->_subsId;
    *((_WORD *)v22 + 64) |= 0x2000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[4] = self->_timestamp;
    *((_WORD *)v5 + 64) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 20) = self->_hsdpaCapable;
  *((_WORD *)v5 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_42:
  *((_DWORD *)v5 + 12) = self->_edchCapable;
  *((_WORD *)v5 + 64) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 11) = self->_duplexMode;
    *((_WORD *)v5 + 64) |= 4u;
  }
LABEL_6:
  PBRepeatedUInt32Copy();
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    v6[21] = self->_imsEmergencySupport;
    *((_WORD *)v6 + 64) |= 0x40u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_8:
      if ((v8 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_46;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_8;
  }
  v6[10] = self->_cellBarred;
  *((_WORD *)v6 + 64) |= 2u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_9:
    if ((v8 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  v6[16] = self->_fachMeasOccInfoPresent;
  *((_WORD *)v6 + 64) |= 0x10u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x800) == 0)
  {
LABEL_10:
    if ((v8 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  v6[26] = self->_sRxlev;
  *((_WORD *)v6 + 64) |= 0x800u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_11:
    if ((v8 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  v6[25] = self->_sQual;
  *((_WORD *)v6 + 64) |= 0x400u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_12:
    if ((v8 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  v6[24] = self->_sIntrasearch;
  *((_WORD *)v6 + 64) |= 0x200u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_13:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  v6[23] = self->_sIntersearch;
  *((_WORD *)v6 + 64) |= 0x100u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x1000) == 0)
  {
LABEL_14:
    if ((v8 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_51:
  v6[27] = self->_sSearchRat;
  *((_WORD *)v6 + 64) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v6[22] = self->_sCellPrio;
    *((_WORD *)v6 + 64) |= 0x80u;
  }
LABEL_16:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  __int16 v9 = self->_eutraPrioInfos;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        [v6 addEutraPrioInfo:v14];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v11);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v15 = self->_utraPrioInfos;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addUtraPrioInfo:v20];
      }
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = self->_gsmPrioInfos;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v23; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [k copyWithZone:a3];
        [v6 addGsmPrioInfo:v26];
      }
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v6[28] = self->_subsId;
    *((_WORD *)v6 + 64) |= 0x2000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 64);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_79;
    }
  }
  else if (v6)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_hsdpaCapable != *((_DWORD *)v4 + 20)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_edchCapable != *((_DWORD *)v4 + 12)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_duplexMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_79:
    BOOL v12 = 0;
    goto LABEL_80;
  }
  __int16 v7 = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 64);
  if ((v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_imsEmergencySupport != *((_DWORD *)v4 + 21)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_cellBarred != *((_DWORD *)v4 + 10)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_fachMeasOccInfoPresent != *((_DWORD *)v4 + 16)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x800) == 0 || self->_sRxlev != *((_DWORD *)v4 + 26)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x400) == 0 || self->_sQual != *((_DWORD *)v4 + 25)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x200) == 0 || self->_sIntrasearch != *((_DWORD *)v4 + 24)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x100) == 0 || self->_sIntersearch != *((_DWORD *)v4 + 23)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x1000) == 0 || self->_sSearchRat != *((_DWORD *)v4 + 27)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((v7 & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_sCellPrio != *((_DWORD *)v4 + 22)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  eutraPrioInfos = self->_eutraPrioInfos;
  if ((unint64_t)eutraPrioInfos | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](eutraPrioInfos, "isEqual:"))
  {
    goto LABEL_79;
  }
  utraPrioInfos = self->_utraPrioInfos;
  if ((unint64_t)utraPrioInfos | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](utraPrioInfos, "isEqual:")) {
      goto LABEL_79;
    }
  }
  gsmPrioInfos = self->_gsmPrioInfos;
  if ((unint64_t)gsmPrioInfos | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](gsmPrioInfos, "isEqual:")) {
      goto LABEL_79;
    }
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x2000) == 0 || self->_subsId != *((_DWORD *)v4 + 28)) {
      goto LABEL_79;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (*((_WORD *)v4 + 64) & 0x2000) == 0;
  }
LABEL_80:

  return v12;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v23 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v22 = 2654435761 * self->_hsdpaCapable;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v21 = 0;
      if ((has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = 0;
  if ((has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v21 = 2654435761 * self->_edchCapable;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v20 = 2654435761 * self->_duplexMode;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v20 = 0;
LABEL_10:
  uint64_t v19 = PBRepeatedUInt32Hash();
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x40) != 0)
  {
    uint64_t v18 = 2654435761 * self->_imsEmergencySupport;
    if ((v4 & 2) != 0)
    {
LABEL_12:
      uint64_t v17 = 2654435761 * self->_cellBarred;
      if ((v4 & 0x10) != 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v17 = 0;
  if ((v4 & 0x10) != 0)
  {
LABEL_13:
    uint64_t v16 = 2654435761 * self->_fachMeasOccInfoPresent;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_sRxlev;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_15:
    uint64_t v5 = 2654435761 * self->_sQual;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    uint64_t v6 = 2654435761 * self->_sIntrasearch;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    uint64_t v7 = 2654435761 * self->_sIntersearch;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_18;
    }
LABEL_27:
    uint64_t v8 = 0;
    if ((v4 & 0x80) != 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_27;
  }
LABEL_18:
  uint64_t v8 = 2654435761 * self->_sSearchRat;
  if ((v4 & 0x80) != 0)
  {
LABEL_19:
    uint64_t v9 = 2654435761 * self->_sCellPrio;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v9 = 0;
LABEL_29:
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_eutraPrioInfos hash];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_utraPrioInfos hash];
  unint64_t v12 = (unint64_t)[(NSMutableArray *)self->_gsmPrioInfos hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    uint64_t v13 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v13 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v19 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 64);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 64);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_hsdpaCapable = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_45:
  self->_edchCapable = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 64) & 4) != 0)
  {
LABEL_5:
    self->_int duplexMode = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_6:
  uint64_t v7 = (char *)[v4 multiBandInfosCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[KCellularWcdmaSelReselCellInfo addMultiBandInfo:](self, "addMultiBandInfo:", [v5 multiBandInfoAtIndex:i]);
  }
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x40) != 0)
  {
    self->_imsEmergencySupport = *((_DWORD *)v5 + 21);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v10 = *((_WORD *)v5 + 64);
    if ((v10 & 2) == 0)
    {
LABEL_11:
      if ((v10 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_49;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_cellBarred = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 2u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x10) == 0)
  {
LABEL_12:
    if ((v10 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_fachMeasOccInfoPresent = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x800) == 0)
  {
LABEL_13:
    if ((v10 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_sRxlev = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x400) == 0)
  {
LABEL_14:
    if ((v10 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_sQual = *((_DWORD *)v5 + 25);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x200) == 0)
  {
LABEL_15:
    if ((v10 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_sIntrasearch = *((_DWORD *)v5 + 24);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x100) == 0)
  {
LABEL_16:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_sIntersearch = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x1000) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_54:
  self->_sSearchRat = *((_DWORD *)v5 + 27);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v5 + 64) & 0x80) != 0)
  {
LABEL_18:
    self->_sCellPrio = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = *((id *)v5 + 7);
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [(KCellularWcdmaSelReselCellInfo *)self addEutraPrioInfo:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v13);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = *((id *)v5 + 15);
  id v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(KCellularWcdmaSelReselCellInfo *)self addUtraPrioInfo:*(void *)(*((void *)&v30 + 1) + 8 * (void)k)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v5 + 9);
  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[KCellularWcdmaSelReselCellInfo addGsmPrioInfo:](self, "addGsmPrioInfo:", *(void *)(*((void *)&v26 + 1) + 8 * (void)m), (void)v26);
      }
      id v23 = [v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v23);
  }

  if ((*((_WORD *)v5 + 64) & 0x2000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 28);
    *(_WORD *)&self->_has |= 0x2000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hsdpaCapable
{
  return self->_hsdpaCapable;
}

- (unsigned)edchCapable
{
  return self->_edchCapable;
}

- (unsigned)imsEmergencySupport
{
  return self->_imsEmergencySupport;
}

- (unsigned)cellBarred
{
  return self->_cellBarred;
}

- (unsigned)fachMeasOccInfoPresent
{
  return self->_fachMeasOccInfoPresent;
}

- (int)sRxlev
{
  return self->_sRxlev;
}

- (int)sQual
{
  return self->_sQual;
}

- (int)sIntrasearch
{
  return self->_sIntrasearch;
}

- (int)sIntersearch
{
  return self->_sIntersearch;
}

- (int)sSearchRat
{
  return self->_sSearchRat;
}

- (unsigned)sCellPrio
{
  return self->_sCellPrio;
}

- (NSMutableArray)eutraPrioInfos
{
  return self->_eutraPrioInfos;
}

- (void)setEutraPrioInfos:(id)a3
{
}

- (NSMutableArray)utraPrioInfos
{
  return self->_utraPrioInfos;
}

- (void)setUtraPrioInfos:(id)a3
{
}

- (NSMutableArray)gsmPrioInfos
{
  return self->_gsmPrioInfos;
}

- (void)setGsmPrioInfos:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraPrioInfos, 0);
  objc_storeStrong((id *)&self->_gsmPrioInfos, 0);

  objc_storeStrong((id *)&self->_eutraPrioInfos, 0);
}

@end