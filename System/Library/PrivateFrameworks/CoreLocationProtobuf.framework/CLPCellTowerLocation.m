@interface CLPCellTowerLocation
+ (Class)neighborType;
- (BOOL)hasAppBundleId;
- (BOOL)hasArfcn;
- (BOOL)hasEcn0;
- (BOOL)hasHasWifiFallback;
- (BOOL)hasIsLimitedService;
- (BOOL)hasNeighborGroup;
- (BOOL)hasOperatorName;
- (BOOL)hasPsc;
- (BOOL)hasRat;
- (BOOL)hasRscp;
- (BOOL)hasServerHash;
- (BOOL)hasServiceProviderName;
- (BOOL)hasTransmit;
- (BOOL)hasUniqueCount;
- (BOOL)hasWifiFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitedService;
- (BOOL)readFrom:(id)a3;
- (BOOL)uniqueCount;
- (CLPCellNeighborsGroup)neighborGroup;
- (CLPLocation)location;
- (NSMutableArray)neighbors;
- (NSString)appBundleId;
- (NSString)operatorName;
- (NSString)serviceProviderName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)neighborAtIndex:(unint64_t)a3;
- (int)arfcn;
- (int)ci;
- (int)ecn0;
- (int)lac;
- (int)mcc;
- (int)mnc;
- (int)psc;
- (int)rat;
- (int)rscp;
- (int)rssi;
- (int)serverHash;
- (int)transmit;
- (unint64_t)hash;
- (unint64_t)neighborsCount;
- (void)addNeighbor:(id)a3;
- (void)clearNeighbors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setArfcn:(int)a3;
- (void)setCi:(int)a3;
- (void)setEcn0:(int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasHasWifiFallback:(BOOL)a3;
- (void)setHasIsLimitedService:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHasTransmit:(BOOL)a3;
- (void)setHasUniqueCount:(BOOL)a3;
- (void)setHasWifiFallback:(BOOL)a3;
- (void)setIsLimitedService:(BOOL)a3;
- (void)setLac:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setNeighborGroup:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setOperatorName:(id)a3;
- (void)setPsc:(int)a3;
- (void)setRat:(int)a3;
- (void)setRscp:(int)a3;
- (void)setRssi:(int)a3;
- (void)setServerHash:(int)a3;
- (void)setServiceProviderName:(id)a3;
- (void)setTransmit:(int)a3;
- (void)setUniqueCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCellTowerLocation

- (void)setArfcn:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPsc
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServerHash
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTransmit:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_transmit = a3;
}

- (void)setHasTransmit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTransmit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEcn0
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRat
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
    v7 = self->_neighbors;
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsLimitedService
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUniqueCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHasWifiFallback
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCellTowerLocation;
  id v4 = [(CLPCellTowerLocation *)&v8 description];
  v5 = [(CLPCellTowerLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInt:self->_mcc];
  [v3 setObject:v4 forKey:@"mcc"];

  v5 = [NSNumber numberWithInt:self->_mnc];
  [v3 setObject:v5 forKey:@"mnc"];

  v6 = [NSNumber numberWithInt:self->_lac];
  [v3 setObject:v6 forKey:@"lac"];

  v7 = [NSNumber numberWithInt:self->_ci];
  [v3 setObject:v7 forKey:@"ci"];

  objc_super v8 = [NSNumber numberWithInt:self->_rssi];
  [v3 setObject:v8 forKey:@"rssi"];

  __int16 has = (__int16)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithInt:self->_arfcn];
    [v3 setObject:v10 forKey:@"arfcn"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_psc];
    [v3 setObject:v11 forKey:@"psc"];
  }
  location = self->_location;
  if (location)
  {
    v13 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x20) != 0)
  {
    v16 = [NSNumber numberWithInt:self->_serverHash];
    [v3 setObject:v16 forKey:@"serverHash"];

    __int16 v15 = (__int16)self->_has;
  }
  if ((v15 & 0x40) != 0)
  {
    v17 = [NSNumber numberWithInt:self->_transmit];
    [v3 setObject:v17 forKey:@"transmit"];
  }
  operatorName = self->_operatorName;
  if (operatorName) {
    [v3 setObject:operatorName forKey:@"operatorName"];
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    v36 = [NSNumber numberWithInt:self->_ecn0];
    [v3 setObject:v36 forKey:@"ecn0"];

    __int16 v19 = (__int16)self->_has;
    if ((v19 & 0x10) == 0)
    {
LABEL_17:
      if ((v19 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  v37 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v37 forKey:@"rscp"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_18:
    v20 = [NSNumber numberWithInt:self->_rat];
    [v3 setObject:v20 forKey:@"rat"];
  }
LABEL_19:
  if ([(NSMutableArray *)self->_neighbors count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v22 = self->_neighbors;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "dictionaryRepresentation", (void)v38);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"neighbor"];
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    v29 = [(CLPCellNeighborsGroup *)neighborGroup dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"neighborGroup"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v30 = [NSNumber numberWithBool:self->_isLimitedService];
    [v3 setObject:v30 forKey:@"isLimitedService"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }
  __int16 v32 = (__int16)self->_has;
  if ((v32 & 0x200) != 0)
  {
    v33 = [NSNumber numberWithBool:self->_uniqueCount];
    [v3 setObject:v33 forKey:@"uniqueCount"];

    __int16 v32 = (__int16)self->_has;
  }
  if ((v32 & 0x80) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_hasWifiFallback];
    [v3 setObject:v34 forKey:@"hasWifiFallback"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_location) {
    -[CLPCellTowerLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_operatorName) {
    PBDataWriterWriteStringField();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v8 = self->_neighbors;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if (self->_neighborGroup) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceProviderName) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[10] = self->_mcc;
  v4[11] = self->_mnc;
  v4[7] = self->_lac;
  v4[5] = self->_ci;
  v4[21] = self->_rssi;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[4] = self->_arfcn;
    *((_WORD *)v4 + 56) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[18] = self->_psc;
    *((_WORD *)v4 + 56) |= 4u;
  }
  id v15 = v4;
  [v4 setLocation:self->_location];
  if (self->_appBundleId) {
    objc_msgSend(v15, "setAppBundleId:");
  }
  __int16 v6 = (__int16)self->_has;
  __int16 v7 = v15;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v15 + 22) = self->_serverHash;
    *((_WORD *)v15 + 56) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v15 + 26) = self->_transmit;
    *((_WORD *)v15 + 56) |= 0x40u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v15, "setOperatorName:");
    __int16 v7 = v15;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_35:
    v7[20] = self->_rscp;
    *((_WORD *)v7 + 56) |= 0x10u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v7[6] = self->_ecn0;
  *((_WORD *)v7 + 56) |= 2u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) != 0) {
    goto LABEL_35;
  }
LABEL_15:
  if ((v8 & 8) != 0)
  {
LABEL_16:
    v7[19] = self->_rat;
    *((_WORD *)v7 + 56) |= 8u;
  }
LABEL_17:
  if ([(CLPCellTowerLocation *)self neighborsCount])
  {
    [v15 clearNeighbors];
    unint64_t v9 = [(CLPCellTowerLocation *)self neighborsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [(CLPCellTowerLocation *)self neighborAtIndex:i];
        [v15 addNeighbor:v12];
      }
    }
  }
  if (self->_neighborGroup) {
    objc_msgSend(v15, "setNeighborGroup:");
  }
  __int16 v13 = v15;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((unsigned char *)v15 + 109) = self->_isLimitedService;
    *((_WORD *)v15 + 56) |= 0x100u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v15, "setServiceProviderName:");
    __int16 v13 = v15;
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    v13[110] = self->_uniqueCount;
    *((_WORD *)v13 + 56) |= 0x200u;
    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 0x80) != 0)
  {
    v13[108] = self->_hasWifiFallback;
    *((_WORD *)v13 + 56) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 40) = self->_mcc;
  *(_DWORD *)(v5 + 44) = self->_mnc;
  *(_DWORD *)(v5 + 28) = self->_lac;
  *(_DWORD *)(v5 + 20) = self->_ci;
  *(_DWORD *)(v5 + 84) = self->_rssi;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_arfcn;
    *(_WORD *)(v5 + 112) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_psc;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v10;

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_serverHash;
    *(_WORD *)(v6 + 112) |= 0x20u;
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_transmit;
    *(_WORD *)(v6 + 112) |= 0x40u;
  }
  uint64_t v13 = [(NSString *)self->_operatorName copyWithZone:a3];
  __int16 v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_ecn0;
    *(_WORD *)(v6 + 112) |= 2u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x10) == 0)
    {
LABEL_11:
      if ((v15 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v15 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 80) = self->_rscp;
  *(_WORD *)(v6 + 112) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 76) = self->_rat;
    *(_WORD *)(v6 + 112) |= 8u;
  }
LABEL_13:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v16 = self->_neighbors;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        [(id)v6 addNeighbor:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  id v22 = [(CLPCellNeighborsGroup *)self->_neighborGroup copyWithZone:a3];
  uint64_t v23 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v22;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 109) = self->_isLimitedService;
    *(_WORD *)(v6 + 112) |= 0x100u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (void)v28);
  uint64_t v25 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v24;

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 110) = self->_uniqueCount;
    *(_WORD *)(v6 + 112) |= 0x200u;
    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 108) = self->_hasWifiFallback;
    *(_WORD *)(v6 + 112) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_mcc != *((_DWORD *)v4 + 10)
    || self->_mnc != *((_DWORD *)v4 + 11)
    || self->_lac != *((_DWORD *)v4 + 7)
    || self->_ci != *((_DWORD *)v4 + 5)
    || self->_rssi != *((_DWORD *)v4 + 21))
  {
    goto LABEL_75;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 56);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 4)) {
      goto LABEL_75;
    }
  }
  else if (v6)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_psc != *((_DWORD *)v4 + 18)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_75;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4) && !-[CLPLocation isEqual:](location, "isEqual:")) {
    goto LABEL_75;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_75;
    }
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 56);
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_serverHash != *((_DWORD *)v4 + 22)) {
      goto LABEL_75;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_transmit != *((_DWORD *)v4 + 26)) {
      goto LABEL_75;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:")) {
      goto LABEL_75;
    }
    __int16 v9 = (__int16)self->_has;
  }
  __int16 v12 = *((_WORD *)v4 + 56);
  if ((v9 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_ecn0 != *((_DWORD *)v4 + 6)) {
      goto LABEL_75;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_rscp != *((_DWORD *)v4 + 20)) {
      goto LABEL_75;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_rat != *((_DWORD *)v4 + 19)) {
      goto LABEL_75;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_75;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_75;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((void *)v4 + 6))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:")) {
      goto LABEL_75;
    }
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0) {
      goto LABEL_75;
    }
    if (self->_isLimitedService)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_75;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:")) {
      goto LABEL_75;
    }
    __int16 v15 = (__int16)self->_has;
  }
  __int16 v17 = *((_WORD *)v4 + 56);
  if ((v15 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0) {
      goto LABEL_75;
    }
    if (self->_uniqueCount)
    {
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_75;
      }
    }
    else if (*((unsigned char *)v4 + 110))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((v15 & 0x80) != 0)
  {
    if ((v17 & 0x80) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((unsigned char *)v4 + 108)) {
          goto LABEL_75;
        }
      }
      else if (*((unsigned char *)v4 + 108))
      {
        goto LABEL_75;
      }
      BOOL v18 = 1;
      goto LABEL_76;
    }
LABEL_75:
    BOOL v18 = 0;
    goto LABEL_76;
  }
  BOOL v18 = (v17 & 0x80) == 0;
LABEL_76:

  return v18;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has) {
    uint64_t v28 = 2654435761 * self->_arfcn;
  }
  else {
    uint64_t v28 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v27 = 2654435761 * self->_psc;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t mcc = self->_mcc;
  uint64_t mnc = self->_mnc;
  uint64_t lac = self->_lac;
  rssuint64_t i = self->_rssi;
  cuint64_t i = self->_ci;
  unint64_t v23 = [(CLPLocation *)self->_location hash];
  NSUInteger v20 = [(NSString *)self->_appBundleId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x20) != 0)
  {
    uint64_t v19 = 2654435761 * self->_serverHash;
    if ((v4 & 0x40) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((v4 & 0x40) != 0)
    {
LABEL_9:
      uint64_t v18 = 2654435761 * self->_transmit;
      goto LABEL_12;
    }
  }
  uint64_t v18 = 0;
LABEL_12:
  NSUInteger v5 = [(NSString *)self->_operatorName hash];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
    uint64_t v7 = 0;
    if ((v6 & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v8 = 0;
    if ((v6 & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v7 = 2654435761 * self->_ecn0;
  if ((v6 & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v8 = 2654435761 * self->_rscp;
  if ((v6 & 8) != 0)
  {
LABEL_15:
    uint64_t v9 = 2654435761 * self->_rat;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
LABEL_19:
  uint64_t v10 = [(NSMutableArray *)self->_neighbors hash];
  unint64_t v11 = [(CLPCellNeighborsGroup *)self->_neighborGroup hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v12 = 2654435761 * self->_isLimitedService;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_serviceProviderName hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    uint64_t v15 = 2654435761 * self->_uniqueCount;
    if ((v14 & 0x80) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v16 = 0;
    return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v28 ^ v27 ^ v23 ^ v20 ^ v19 ^ v18 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  }
  uint64_t v15 = 0;
  if ((v14 & 0x80) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v16 = 2654435761 * self->_hasWifiFallback;
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v28 ^ v27 ^ v23 ^ v20 ^ v19 ^ v18 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  __int16 v4 = a3;
  id v5 = v4;
  self->_uint64_t mcc = v4[10];
  self->_uint64_t mnc = v4[11];
  self->_uint64_t lac = v4[7];
  self->_cuint64_t i = v4[5];
  self->_rssuint64_t i = v4[21];
  __int16 v6 = *((_WORD *)v4 + 56);
  if (v6)
  {
    self->_arfcn = v4[4];
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 56);
  }
  if ((v6 & 4) != 0)
  {
    self->_psc = v4[18];
    *(_WORD *)&self->_has |= 4u;
  }
  location = self->_location;
  uint64_t v8 = *((void *)v5 + 4);
  if (location)
  {
    if (v8) {
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CLPCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((void *)v5 + 1)) {
    -[CLPCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  }
  __int16 v9 = *((_WORD *)v5 + 56);
  if ((v9 & 0x20) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v9 = *((_WORD *)v5 + 56);
  }
  if ((v9 & 0x40) != 0)
  {
    self->_transmit = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 8)) {
    -[CLPCellTowerLocation setOperatorName:](self, "setOperatorName:");
  }
  __int16 v10 = *((_WORD *)v5 + 56);
  if ((v10 & 2) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 6);
    *(_WORD *)&self->_has |= 2u;
    __int16 v10 = *((_WORD *)v5 + 56);
    if ((v10 & 0x10) == 0)
    {
LABEL_20:
      if ((v10 & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_20;
  }
  self->_rscp = *((_DWORD *)v5 + 20);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v5 + 56) & 8) != 0)
  {
LABEL_21:
    self->_rat = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_22:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = *((id *)v5 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        -[CLPCellTowerLocation addNeighbor:](self, "addNeighbor:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  neighborGroup = self->_neighborGroup;
  uint64_t v17 = *((void *)v5 + 6);
  if (neighborGroup)
  {
    if (v17) {
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[CLPCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if ((*((_WORD *)v5 + 56) & 0x100) != 0)
  {
    self->_isLimitedService = *((unsigned char *)v5 + 109);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 12)) {
    -[CLPCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  }
  __int16 v18 = *((_WORD *)v5 + 56);
  if ((v18 & 0x200) != 0)
  {
    self->_uniqueCount = *((unsigned char *)v5 + 110);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v18 = *((_WORD *)v5 + 56);
  }
  if ((v18 & 0x80) != 0)
  {
    self->_hasWifiFallback = *((unsigned char *)v5 + 108);
    *(_WORD *)&self->_has |= 0x80u;
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

- (int)lac
{
  return self->_lac;
}

- (void)setLac:(int)a3
{
  self->_uint64_t lac = a3;
}

- (int)ci
{
  return self->_ci;
}

- (void)setCi:(int)a3
{
  self->_cuint64_t i = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssuint64_t i = a3;
}

- (int)arfcn
{
  return self->_arfcn;
}

- (int)psc
{
  return self->_psc;
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

- (int)transmit
{
  return self->_transmit;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (int)rat
{
  return self->_rat;
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

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 6587, "self->_location != nil");
}

@end