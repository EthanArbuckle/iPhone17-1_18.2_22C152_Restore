@interface CLPCdmaCellTowerLocation
+ (Class)neighborType;
- (BOOL)hasAppBundleId;
- (BOOL)hasBandclass;
- (BOOL)hasBsLatitude;
- (BOOL)hasBsLongitude;
- (BOOL)hasCelltype;
- (BOOL)hasChannel;
- (BOOL)hasDayLightSavings;
- (BOOL)hasEcn0;
- (BOOL)hasIsLimitedService;
- (BOOL)hasLtmOffset;
- (BOOL)hasNeighborGroup;
- (BOOL)hasOperatorName;
- (BOOL)hasPnoffset;
- (BOOL)hasRat;
- (BOOL)hasRscp;
- (BOOL)hasSectorLatitude;
- (BOOL)hasSectorLongitude;
- (BOOL)hasSectorid;
- (BOOL)hasServerHash;
- (BOOL)hasServiceProviderName;
- (BOOL)hasZoneid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitedService;
- (BOOL)readFrom:(id)a3;
- (CLPCellNeighborsGroup)neighborGroup;
- (CLPLocation)location;
- (NSMutableArray)neighbors;
- (NSString)appBundleId;
- (NSString)operatorName;
- (NSString)sectorid;
- (NSString)serviceProviderName;
- (double)bsLatitude;
- (double)bsLongitude;
- (double)sectorLatitude;
- (double)sectorLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)neighborAtIndex:(unint64_t)a3;
- (int)bandclass;
- (int)bsid;
- (int)celltype;
- (int)channel;
- (int)dayLightSavings;
- (int)derivedMccAtIndex:(unint64_t)a3;
- (int)derivedMccs;
- (int)ecn0;
- (int)ltmOffset;
- (int)mcc;
- (int)mnc;
- (int)nid;
- (int)pnoffset;
- (int)rat;
- (int)rscp;
- (int)serverHash;
- (int)sid;
- (int)zoneid;
- (unint64_t)derivedMccsCount;
- (unint64_t)hash;
- (unint64_t)neighborsCount;
- (void)addDerivedMcc:(int)a3;
- (void)addNeighbor:(id)a3;
- (void)clearDerivedMccs;
- (void)clearNeighbors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setBandclass:(int)a3;
- (void)setBsLatitude:(double)a3;
- (void)setBsLongitude:(double)a3;
- (void)setBsid:(int)a3;
- (void)setCelltype:(int)a3;
- (void)setChannel:(int)a3;
- (void)setDayLightSavings:(int)a3;
- (void)setDerivedMccs:(int *)a3 count:(unint64_t)a4;
- (void)setEcn0:(int)a3;
- (void)setHasBandclass:(BOOL)a3;
- (void)setHasBsLatitude:(BOOL)a3;
- (void)setHasBsLongitude:(BOOL)a3;
- (void)setHasCelltype:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasDayLightSavings:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasIsLimitedService:(BOOL)a3;
- (void)setHasLtmOffset:(BOOL)a3;
- (void)setHasPnoffset:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasSectorLatitude:(BOOL)a3;
- (void)setHasSectorLongitude:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHasZoneid:(BOOL)a3;
- (void)setIsLimitedService:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLtmOffset:(int)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setNeighborGroup:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setNid:(int)a3;
- (void)setOperatorName:(id)a3;
- (void)setPnoffset:(int)a3;
- (void)setRat:(int)a3;
- (void)setRscp:(int)a3;
- (void)setSectorLatitude:(double)a3;
- (void)setSectorLongitude:(double)a3;
- (void)setSectorid:(id)a3;
- (void)setServerHash:(int)a3;
- (void)setServiceProviderName:(id)a3;
- (void)setSid:(int)a3;
- (void)setZoneid:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCdmaCellTowerLocation

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CLPCdmaCellTowerLocation;
  [(CLPCdmaCellTowerLocation *)&v3 dealloc];
}

- (void)setBsLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bsLatitude = a3;
}

- (void)setHasBsLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBsLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBsLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bsLongitude = a3;
}

- (void)setHasBsLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBsLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setZoneid:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_zoneid = a3;
}

- (void)setHasZoneid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasZoneid
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasSectorid
{
  return self->_sectorid != 0;
}

- (void)setSectorLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sectorLatitude = a3;
}

- (void)setHasSectorLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSectorLatitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSectorLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_sectorLongitude = a3;
}

- (void)setHasSectorLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSectorLongitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBandclass:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_bandclass = a3;
}

- (void)setHasBandclass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBandclass
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRat
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCelltype:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_celltype = a3;
}

- (void)setHasCelltype:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCelltype
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setChannel:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasServerHash
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setLtmOffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ltmOffset = a3;
}

- (void)setHasLtmOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLtmOffset
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDayLightSavings:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_dayLightSavings = a3;
}

- (void)setHasDayLightSavings:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDayLightSavings
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)derivedMccsCount
{
  return self->_derivedMccs.count;
}

- (int)derivedMccs
{
  return self->_derivedMccs.list;
}

- (void)clearDerivedMccs
{
}

- (void)addDerivedMcc:(int)a3
{
}

- (int)derivedMccAtIndex:(unint64_t)a3
{
  p_derivedMccs = &self->_derivedMccs;
  unint64_t count = self->_derivedMccs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_derivedMccs->list[a3];
}

- (void)setDerivedMccs:(int *)a3 count:(unint64_t)a4
{
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEcn0
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)clearNeighbors
{
}

- (void)addNeighbor:(id)a3
{
  id v4 = a3;
  neighbors = self->_neighbors;
  id v8 = v4;
  if (!neighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_neighbors;
    self->_neighbors = v6;

    id v4 = v8;
    neighbors = self->_neighbors;
  }
  [(NSMutableArray *)neighbors addObject:v4];
}

- (unint64_t)neighborsCount
{
  return [(NSMutableArray *)self->_neighbors count];
}

- (id)neighborAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_neighbors objectAtIndex:a3];
}

+ (Class)neighborType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNeighborGroup
{
  return self->_neighborGroup != 0;
}

- (void)setIsLimitedService:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsLimitedService
{
  return *(_WORD *)&self->_has >> 15;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCdmaCellTowerLocation;
  id v4 = [(CLPCdmaCellTowerLocation *)&v8 description];
  v5 = [(CLPCdmaCellTowerLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInt:self->_mcc];
  [v3 setObject:v4 forKey:@"mcc"];

  v5 = [NSNumber numberWithInt:self->_mnc];
  [v3 setObject:v5 forKey:@"mnc"];

  v6 = [NSNumber numberWithInt:self->_sid];
  [v3 setObject:v6 forKey:@"sid"];

  uint64_t v7 = [NSNumber numberWithInt:self->_nid];
  [v3 setObject:v7 forKey:@"nid"];

  objc_super v8 = [NSNumber numberWithInt:self->_bsid];
  [v3 setObject:v8 forKey:@"bsid"];

  __int16 has = (__int16)self->_has;
  if (has)
  {
    v38 = [NSNumber numberWithDouble:self->_bsLatitude];
    [v3 setObject:v38 forKey:@"bsLatitude"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v39 = [NSNumber numberWithDouble:self->_bsLongitude];
  [v3 setObject:v39 forKey:@"bsLongitude"];

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    v10 = [NSNumber numberWithInt:self->_zoneid];
    [v3 setObject:v10 forKey:@"zoneid"];
  }
LABEL_5:
  sectorid = self->_sectorid;
  if (sectorid) {
    [v3 setObject:sectorid forKey:@"sectorid"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 4) != 0)
  {
    v40 = [NSNumber numberWithDouble:self->_sectorLatitude];
    [v3 setObject:v40 forKey:@"sectorLatitude"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_9:
      if ((v12 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_54;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_9;
  }
  v41 = [NSNumber numberWithDouble:self->_sectorLongitude];
  [v3 setObject:v41 forKey:@"sectorLongitude"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_10:
    if ((v12 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  v42 = [NSNumber numberWithInt:self->_bandclass];
  [v3 setObject:v42 forKey:@"bandclass"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) == 0)
  {
LABEL_11:
    if ((v12 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  v43 = [NSNumber numberWithInt:self->_rat];
  [v3 setObject:v43 forKey:@"rat"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_12:
    if ((v12 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  v44 = [NSNumber numberWithInt:self->_celltype];
  [v3 setObject:v44 forKey:@"celltype"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_13:
    if ((v12 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_57:
  v45 = [NSNumber numberWithInt:self->_pnoffset];
  [v3 setObject:v45 forKey:@"pnoffset"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    v13 = [NSNumber numberWithInt:self->_channel];
    [v3 setObject:v13 forKey:@"channel"];
  }
LABEL_15:
  location = self->_location;
  if (location)
  {
    v15 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v17 = [NSNumber numberWithInt:self->_serverHash];
    [v3 setObject:v17 forKey:@"serverHash"];
  }
  operatorName = self->_operatorName;
  if (operatorName) {
    [v3 setObject:operatorName forKey:@"operatorName"];
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x200) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_ltmOffset];
    [v3 setObject:v20 forKey:@"ltmOffset"];

    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 0x80) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_dayLightSavings];
    [v3 setObject:v21 forKey:@"dayLightSavings"];
  }
  v22 = PBRepeatedInt32NSArray();
  [v3 setObject:v22 forKey:@"derivedMcc"];

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    v24 = [NSNumber numberWithInt:self->_ecn0];
    [v3 setObject:v24 forKey:@"ecn0"];

    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x1000) != 0)
  {
    v25 = [NSNumber numberWithInt:self->_rscp];
    [v3 setObject:v25 forKey:@"rscp"];
  }
  if ([(NSMutableArray *)self->_neighbors count])
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v27 = self->_neighbors;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "dictionaryRepresentation", (void)v46);
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKey:@"neighbor"];
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    v34 = [(CLPCellNeighborsGroup *)neighborGroup dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"neighborGroup"];
  }
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    v35 = [NSNumber numberWithBool:self->_isLimitedService];
    [v3 setObject:v35 forKey:@"isLimitedService"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCdmaCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_sectorid) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (!self->_location) {
    -[CLPCdmaCellTowerLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_operatorName) {
    PBDataWriterWriteStringField();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_derivedMccs.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_derivedMccs.count);
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    PBDataWriterWriteSint32Field();
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x1000) != 0) {
    PBDataWriterWriteSint32Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_neighbors;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (self->_neighborGroup) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceProviderName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[27] = self->_mcc;
  v4[28] = self->_mnc;
  v4[48] = self->_sid;
  v4[34] = self->_nid;
  v4[19] = self->_bsid;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v4 + 4) = *(void *)&self->_bsLatitude;
    *((_WORD *)v4 + 102) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 5) = *(void *)&self->_bsLongitude;
  *((_WORD *)v4 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    v4[49] = self->_zoneid;
    *((_WORD *)v4 + 102) |= 0x4000u;
  }
LABEL_5:
  long long v18 = v4;
  if (self->_sectorid)
  {
    objc_msgSend(v4, "setSectorid:");
    id v4 = v18;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((void *)v4 + 6) = *(void *)&self->_sectorLatitude;
    *((_WORD *)v4 + 102) |= 4u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_51;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 7) = *(void *)&self->_sectorLongitude;
  *((_WORD *)v4 + 102) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_52;
  }
LABEL_51:
  v4[18] = self->_bandclass;
  *((_WORD *)v4 + 102) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_53;
  }
LABEL_52:
  v4[39] = self->_rat;
  *((_WORD *)v4 + 102) |= 0x800u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_54;
  }
LABEL_53:
  v4[20] = self->_celltype;
  *((_WORD *)v4 + 102) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_54:
  v4[38] = self->_pnoffset;
  *((_WORD *)v4 + 102) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    v4[21] = self->_channel;
    *((_WORD *)v4 + 102) |= 0x40u;
  }
LABEL_15:
  [v4 setLocation:self->_location];
  if (self->_appBundleId) {
    objc_msgSend(v18, "setAppBundleId:");
  }
  __int16 v7 = v18;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v18[44] = self->_serverHash;
    *((_WORD *)v18 + 102) |= 0x2000u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v18, "setOperatorName:");
    __int16 v7 = v18;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    v7[26] = self->_ltmOffset;
    *((_WORD *)v7 + 102) |= 0x200u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x80) != 0)
  {
    v7[22] = self->_dayLightSavings;
    *((_WORD *)v7 + 102) |= 0x80u;
  }
  if ([(CLPCdmaCellTowerLocation *)self derivedMccsCount])
  {
    [v18 clearDerivedMccs];
    unint64_t v9 = [(CLPCdmaCellTowerLocation *)self derivedMccsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
        objc_msgSend(v18, "addDerivedMcc:", -[CLPCdmaCellTowerLocation derivedMccAtIndex:](self, "derivedMccAtIndex:", i));
    }
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v18[23] = self->_ecn0;
    *((_WORD *)v18 + 102) |= 0x100u;
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x1000) != 0)
  {
    v18[40] = self->_rscp;
    *((_WORD *)v18 + 102) |= 0x1000u;
  }
  if ([(CLPCdmaCellTowerLocation *)self neighborsCount])
  {
    [v18 clearNeighbors];
    unint64_t v13 = [(CLPCdmaCellTowerLocation *)self neighborsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t j = 0; j != v14; ++j)
      {
        long long v16 = [(CLPCdmaCellTowerLocation *)self neighborAtIndex:j];
        [v18 addNeighbor:v16];
      }
    }
  }
  if (self->_neighborGroup) {
    objc_msgSend(v18, "setNeighborGroup:");
  }
  long long v17 = v18;
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v18 + 200) = self->_isLimitedService;
    *((_WORD *)v18 + 102) |= 0x8000u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v18, "setServiceProviderName:");
    long long v17 = v18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 108) = self->_mcc;
  *(_DWORD *)(v5 + 112) = self->_mnc;
  *(_DWORD *)(v5 + 192) = self->_sid;
  *(_DWORD *)(v5 + 136) = self->_nid;
  *(_DWORD *)(v5 + 76) = self->_bsid;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(double *)(v5 + 32) = self->_bsLatitude;
    *(_WORD *)(v5 + 204) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_bsLongitude;
  *(_WORD *)(v5 + 204) |= 2u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 196) = self->_zoneid;
    *(_WORD *)(v5 + 204) |= 0x4000u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_sectorid copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) != 0)
  {
    *(double *)(v6 + 48) = self->_sectorLatitude;
    *(_WORD *)(v6 + 204) |= 4u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_38;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 56) = self->_sectorLongitude;
  *(_WORD *)(v6 + 204) |= 8u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_8:
    if ((v10 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 72) = self->_bandclass;
  *(_WORD *)(v6 + 204) |= 0x10u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
LABEL_9:
    if ((v10 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 156) = self->_rat;
  *(_WORD *)(v6 + 204) |= 0x800u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_10:
    if ((v10 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 80) = self->_celltype;
  *(_WORD *)(v6 + 204) |= 0x20u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_41:
  *(_DWORD *)(v6 + 152) = self->_pnoffset;
  *(_WORD *)(v6 + 204) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 84) = self->_channel;
    *(_WORD *)(v6 + 204) |= 0x40u;
  }
LABEL_13:
  id v11 = [(CLPLocation *)self->_location copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v11;

  uint64_t v13 = [(NSString *)self->_appBundleId copyWithZone:a3];
  unint64_t v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_serverHash;
    *(_WORD *)(v6 + 204) |= 0x2000u;
  }
  uint64_t v15 = [(NSString *)self->_operatorName copyWithZone:a3];
  long long v16 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_ltmOffset;
    *(_WORD *)(v6 + 204) |= 0x200u;
    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_dayLightSavings;
    *(_WORD *)(v6 + 204) |= 0x80u;
  }
  PBRepeatedInt32Copy();
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 92) = self->_ecn0;
    *(_WORD *)(v6 + 204) |= 0x100u;
    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_rscp;
    *(_WORD *)(v6 + 204) |= 0x1000u;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  __int16 v19 = self->_neighbors;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        [(id)v6 addNeighbor:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  id v25 = [(CLPCellNeighborsGroup *)self->_neighborGroup copyWithZone:a3];
  v26 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v25;

  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v6 + 200) = self->_isLimitedService;
    *(_WORD *)(v6 + 204) |= 0x8000u;
  }
  uint64_t v27 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (void)v30);
  uint64_t v28 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v27;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (__int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_mcc != *((_DWORD *)v4 + 27)
    || self->_mnc != *((_DWORD *)v4 + 28)
    || self->_sid != *((_DWORD *)v4 + 48)
    || self->_nid != *((_DWORD *)v4 + 34)
    || self->_bsid != *((_DWORD *)v4 + 19))
  {
    goto LABEL_102;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = v4[102];
  if (has)
  {
    if ((v6 & 1) == 0 || self->_bsLatitude != *((double *)v4 + 4)) {
      goto LABEL_102;
    }
  }
  else if (v6)
  {
    goto LABEL_102;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bsLongitude != *((double *)v4 + 5)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((v4[102] & 0x4000) == 0 || self->_zoneid != *((_DWORD *)v4 + 49)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  sectorid = self->_sectorid;
  if ((unint64_t)sectorid | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](sectorid, "isEqual:")) {
      goto LABEL_102;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = v4[102];
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_sectorLatitude != *((double *)v4 + 6)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_sectorLongitude != *((double *)v4 + 7)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_bandclass != *((_DWORD *)v4 + 18)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x800) != 0)
  {
    if ((v4[102] & 0x800) == 0 || self->_rat != *((_DWORD *)v4 + 39)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_celltype != *((_DWORD *)v4 + 20)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x400) != 0)
  {
    if ((v4[102] & 0x400) == 0 || self->_pnoffset != *((_DWORD *)v4 + 38)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_channel != *((_DWORD *)v4 + 21)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 12) && !-[CLPLocation isEqual:](location, "isEqual:")) {
    goto LABEL_102;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_102;
    }
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0)
  {
    if ((v4[102] & 0x2000) == 0 || self->_serverHash != *((_DWORD *)v4 + 44)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:")) {
      goto LABEL_102;
    }
    __int16 v11 = (__int16)self->_has;
  }
  __int16 v13 = v4[102];
  if ((v11 & 0x200) != 0)
  {
    if ((v4[102] & 0x200) == 0 || self->_ltmOffset != *((_DWORD *)v4 + 26)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((v11 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_dayLightSavings != *((_DWORD *)v4 + 22)) {
      goto LABEL_102;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_102:
    char v18 = 0;
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((v4[102] & 0x100) == 0 || self->_ecn0 != *((_DWORD *)v4 + 23)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((v4[102] & 0x1000) == 0 || self->_rscp != *((_DWORD *)v4 + 40)) {
      goto LABEL_102;
    }
  }
  else if ((v4[102] & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_102;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((void *)v4 + 15))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:")) {
      goto LABEL_102;
    }
  }
  int v16 = v4[102];
  if ((*(_WORD *)&self->_has & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_102;
  }
  if ((v16 & 0x80000000) == 0) {
    goto LABEL_102;
  }
  if (self->_isLimitedService)
  {
    if (!*((unsigned char *)v4 + 200)) {
      goto LABEL_102;
    }
  }
  else if (*((unsigned char *)v4 + 200))
  {
    goto LABEL_102;
  }
LABEL_99:
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 23)) {
    char v18 = -[NSString isEqual:](serviceProviderName, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_103:

  return v18;
}

- (unint64_t)hash
{
  uint64_t mnc = self->_mnc;
  uint64_t mcc = self->_mcc;
  uint64_t nid = self->_nid;
  uint64_t sid = self->_sid;
  uint64_t bsid = self->_bsid;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double bsLatitude = self->_bsLatitude;
    double v6 = -bsLatitude;
    if (bsLatitude >= 0.0) {
      double v6 = self->_bsLatitude;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double bsLongitude = self->_bsLongitude;
    double v11 = -bsLongitude;
    if (bsLongitude >= 0.0) {
      double v11 = self->_bsLongitude;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v48 = v9;
  unint64_t v49 = v4;
  if ((has & 0x4000) != 0) {
    uint64_t v47 = 2654435761 * self->_zoneid;
  }
  else {
    uint64_t v47 = 0;
  }
  NSUInteger v46 = [(NSString *)self->_sectorid hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    double sectorLatitude = self->_sectorLatitude;
    double v17 = -sectorLatitude;
    if (sectorLatitude >= 0.0) {
      double v17 = self->_sectorLatitude;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((v14 & 8) != 0)
  {
    double sectorLongitude = self->_sectorLongitude;
    double v22 = -sectorLongitude;
    if (sectorLongitude >= 0.0) {
      double v22 = self->_sectorLongitude;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((v14 & 0x10) != 0)
  {
    uint64_t v44 = 2654435761 * self->_bandclass;
    if ((v14 & 0x800) != 0)
    {
LABEL_38:
      uint64_t v43 = 2654435761 * self->_rat;
      if ((v14 & 0x20) != 0) {
        goto LABEL_39;
      }
LABEL_43:
      uint64_t v42 = 0;
      if ((v14 & 0x400) != 0) {
        goto LABEL_40;
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((v14 & 0x800) != 0) {
      goto LABEL_38;
    }
  }
  uint64_t v43 = 0;
  if ((v14 & 0x20) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v42 = 2654435761 * self->_celltype;
  if ((v14 & 0x400) != 0)
  {
LABEL_40:
    uint64_t v41 = 2654435761 * self->_pnoffset;
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v41 = 0;
LABEL_45:
  unint64_t v45 = v20;
  if ((v14 & 0x40) != 0) {
    uint64_t v40 = 2654435761 * self->_channel;
  }
  else {
    uint64_t v40 = 0;
  }
  unint64_t v39 = [(CLPLocation *)self->_location hash];
  NSUInteger v38 = [(NSString *)self->_appBundleId hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    uint64_t v37 = 2654435761 * self->_serverHash;
  }
  else {
    uint64_t v37 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_operatorName hash];
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x200) != 0)
  {
    uint64_t v26 = 2654435761 * self->_ltmOffset;
    if ((v25 & 0x80) != 0) {
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((v25 & 0x80) != 0)
    {
LABEL_53:
      uint64_t v27 = 2654435761 * self->_dayLightSavings;
      goto LABEL_56;
    }
  }
  uint64_t v27 = 0;
LABEL_56:
  uint64_t v28 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v29 = 2654435761 * self->_ecn0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_58:
      uint64_t v30 = 2654435761 * self->_rscp;
      goto LABEL_61;
    }
  }
  uint64_t v30 = 0;
LABEL_61:
  uint64_t v31 = [(NSMutableArray *)self->_neighbors hash];
  unint64_t v32 = [(CLPCellNeighborsGroup *)self->_neighborGroup hash];
  if ((*(_WORD *)&self->_has & 0x80000000) != 0) {
    uint64_t v33 = 2654435761 * self->_isLimitedService;
  }
  else {
    uint64_t v33 = 0;
  }
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * sid) ^ (2654435761 * nid) ^ (2654435761 * bsid) ^ v49 ^ v48 ^ v47 ^ v46 ^ v15 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ [(NSString *)self->_serviceProviderName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (__int16 *)a3;
  uint64_t v5 = v4;
  self->_uint64_t mcc = *((_DWORD *)v4 + 27);
  self->_uint64_t mnc = *((_DWORD *)v4 + 28);
  self->_uint64_t sid = *((_DWORD *)v4 + 48);
  self->_uint64_t nid = *((_DWORD *)v4 + 34);
  self->_uint64_t bsid = *((_DWORD *)v4 + 19);
  __int16 v6 = v4[102];
  if (v6)
  {
    self->_double bsLatitude = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = v4[102];
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double bsLongitude = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((v4[102] & 0x4000) != 0)
  {
LABEL_4:
    self->_zoneid = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_5:
  if (*((void *)v4 + 21)) {
    -[CLPCdmaCellTowerLocation setSectorid:](self, "setSectorid:");
  }
  __int16 v7 = v5[102];
  if ((v7 & 4) != 0)
  {
    self->_double sectorLatitude = *((double *)v5 + 6);
    *(_WORD *)&self->_has |= 4u;
    __int16 v7 = v5[102];
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_double sectorLongitude = *((double *)v5 + 7);
  *(_WORD *)&self->_has |= 8u;
  __int16 v7 = v5[102];
  if ((v7 & 0x10) == 0)
  {
LABEL_10:
    if ((v7 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_bandclass = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v7 = v5[102];
  if ((v7 & 0x800) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_rat = *((_DWORD *)v5 + 39);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = v5[102];
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_celltype = *((_DWORD *)v5 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = v5[102];
  if ((v7 & 0x400) == 0)
  {
LABEL_13:
    if ((v7 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  self->_pnoffset = *((_DWORD *)v5 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  if ((v5[102] & 0x40) != 0)
  {
LABEL_14:
    self->_channel = *((_DWORD *)v5 + 21);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_15:
  location = self->_location;
  uint64_t v9 = *((void *)v5 + 12);
  if (location)
  {
    if (v9) {
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[CLPCdmaCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((void *)v5 + 8)) {
    -[CLPCdmaCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  }
  if ((v5[102] & 0x2000) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 44);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v5 + 18)) {
    -[CLPCdmaCellTowerLocation setOperatorName:](self, "setOperatorName:");
  }
  __int16 v10 = v5[102];
  if ((v10 & 0x200) != 0)
  {
    self->_ltmOffset = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v10 = v5[102];
  }
  if ((v10 & 0x80) != 0)
  {
    self->_dayLightSavings = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
  uint64_t v11 = [v5 derivedMccsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
      -[CLPCdmaCellTowerLocation addDerivedMcc:](self, "addDerivedMcc:", [v5 derivedMccAtIndex:i]);
  }
  __int16 v14 = v5[102];
  if ((v14 & 0x100) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 23);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v14 = v5[102];
  }
  if ((v14 & 0x1000) != 0)
  {
    self->_rscp = *((_DWORD *)v5 + 40);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = *((id *)v5 + 16);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CLPCdmaCellTowerLocation addNeighbor:](self, "addNeighbor:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  neighborGroup = self->_neighborGroup;
  uint64_t v21 = *((void *)v5 + 15);
  if (neighborGroup)
  {
    if (v21) {
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[CLPCdmaCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if (v5[102] < 0)
  {
    self->_isLimitedService = *((unsigned char *)v5 + 200);
    *(_WORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v5 + 23)) {
    -[CLPCdmaCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_uint64_t mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_uint64_t mnc = a3;
}

- (int)sid
{
  return self->_sid;
}

- (void)setSid:(int)a3
{
  self->_uint64_t sid = a3;
}

- (int)nid
{
  return self->_nid;
}

- (void)setNid:(int)a3
{
  self->_uint64_t nid = a3;
}

- (int)bsid
{
  return self->_bsid;
}

- (void)setBsid:(int)a3
{
  self->_uint64_t bsid = a3;
}

- (double)bsLatitude
{
  return self->_bsLatitude;
}

- (double)bsLongitude
{
  return self->_bsLongitude;
}

- (int)zoneid
{
  return self->_zoneid;
}

- (NSString)sectorid
{
  return self->_sectorid;
}

- (void)setSectorid:(id)a3
{
}

- (double)sectorLatitude
{
  return self->_sectorLatitude;
}

- (double)sectorLongitude
{
  return self->_sectorLongitude;
}

- (int)bandclass
{
  return self->_bandclass;
}

- (int)rat
{
  return self->_rat;
}

- (int)celltype
{
  return self->_celltype;
}

- (int)pnoffset
{
  return self->_pnoffset;
}

- (int)channel
{
  return self->_channel;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (int)serverHash
{
  return self->_serverHash;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
}

- (int)ltmOffset
{
  return self->_ltmOffset;
}

- (int)dayLightSavings
{
  return self->_dayLightSavings;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
}

- (CLPCellNeighborsGroup)neighborGroup
{
  return self->_neighborGroup;
}

- (void)setNeighborGroup:(id)a3
{
}

- (BOOL)isLimitedService
{
  return self->_isLimitedService;
}

- (NSString)serviceProviderName
{
  return self->_serviceProviderName;
}

- (void)setServiceProviderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_sectorid, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPCdmaCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 4391, "self->_location != nil");
}

@end