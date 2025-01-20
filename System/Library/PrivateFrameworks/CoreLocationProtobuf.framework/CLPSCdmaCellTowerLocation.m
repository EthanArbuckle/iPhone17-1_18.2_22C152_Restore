@interface CLPSCdmaCellTowerLocation
+ (Class)neighborType;
- (BOOL)hasAppBundleId;
- (BOOL)hasArfcn;
- (BOOL)hasEcn0;
- (BOOL)hasIsLimitedService;
- (BOOL)hasNeighborGroup;
- (BOOL)hasOperatorName;
- (BOOL)hasPsc;
- (BOOL)hasRat;
- (BOOL)hasRscp;
- (BOOL)hasServerHash;
- (BOOL)hasServiceProviderName;
- (BOOL)hasTransmit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitedService;
- (BOOL)readFrom:(id)a3;
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
- (void)setHasIsLimitedService:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHasTransmit:(BOOL)a3;
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
- (void)writeTo:(id)a3;
@end

@implementation CLPSCdmaCellTowerLocation

- (void)setArfcn:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasServerHash
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTransmit:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_transmit = a3;
}

- (void)setHasTransmit:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTransmit
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setEcn0:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEcn0
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRscp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRat
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsLimitedService
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPSCdmaCellTowerLocation;
  id v4 = [(CLPSCdmaCellTowerLocation *)&v8 description];
  v5 = [(CLPSCdmaCellTowerLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
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

  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithInt:self->_arfcn];
    [v3 setObject:v10 forKey:@"arfcn"];

    char has = (char)self->_has;
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
  char v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    v16 = [NSNumber numberWithInt:self->_serverHash];
    [v3 setObject:v16 forKey:@"serverHash"];

    char v15 = (char)self->_has;
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
  char v19 = (char)self->_has;
  if ((v19 & 2) != 0)
  {
    v33 = [NSNumber numberWithInt:self->_ecn0];
    [v3 setObject:v33 forKey:@"ecn0"];

    char v19 = (char)self->_has;
    if ((v19 & 0x10) == 0)
    {
LABEL_17:
      if ((v19 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_17;
  }
  v34 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v34 forKey:@"rscp"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_18:
    v20 = [NSNumber numberWithInt:self->_rat];
    [v3 setObject:v20 forKey:@"rat"];
  }
LABEL_19:
  if ([(NSMutableArray *)self->_neighbors count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v22 = self->_neighbors;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (void)v35);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
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
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v30 = [NSNumber numberWithBool:self->_isLimitedService];
    [v3 setObject:v30 forKey:@"isLimitedService"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSCdmaCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (!self->_location) {
    -[CLPSCdmaCellTowerLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_operatorName) {
    PBDataWriterWriteStringField();
  }
  char v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    char v7 = (char)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteSint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v8 = self->_neighbors;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if (self->_neighborGroup) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceProviderName) {
    PBDataWriterWriteStringField();
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
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_arfcn;
    *((unsigned char *)v4 + 112) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[18] = self->_psc;
    *((unsigned char *)v4 + 112) |= 4u;
  }
  id v14 = v4;
  [v4 setLocation:self->_location];
  if (self->_appBundleId) {
    objc_msgSend(v14, "setAppBundleId:");
  }
  char v6 = (char)self->_has;
  char v7 = v14;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v14 + 22) = self->_serverHash;
    *((unsigned char *)v14 + 112) |= 0x20u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v14 + 26) = self->_transmit;
    *((unsigned char *)v14 + 112) |= 0x40u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v14, "setOperatorName:");
    char v7 = v14;
  }
  char v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    v7[20] = self->_rscp;
    *((unsigned char *)v7 + 112) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v7[6] = self->_ecn0;
  *((unsigned char *)v7 + 112) |= 2u;
  char v8 = (char)self->_has;
  if ((v8 & 0x10) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((v8 & 8) != 0)
  {
LABEL_16:
    v7[19] = self->_rat;
    *((unsigned char *)v7 + 112) |= 8u;
  }
LABEL_17:
  if ([(CLPSCdmaCellTowerLocation *)self neighborsCount])
  {
    [v14 clearNeighbors];
    unint64_t v9 = [(CLPSCdmaCellTowerLocation *)self neighborsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v12 = [(CLPSCdmaCellTowerLocation *)self neighborAtIndex:i];
        [v14 addNeighbor:v12];
      }
    }
  }
  if (self->_neighborGroup) {
    objc_msgSend(v14, "setNeighborGroup:");
  }
  long long v13 = v14;
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v14 + 108) = self->_isLimitedService;
    *((unsigned char *)v14 + 112) |= 0x80u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v14, "setServiceProviderName:");
    long long v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 40) = self->_mcc;
  *(_DWORD *)(v5 + 44) = self->_mnc;
  *(_DWORD *)(v5 + 28) = self->_lac;
  *(_DWORD *)(v5 + 20) = self->_ci;
  *(_DWORD *)(v5 + 84) = self->_rssi;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_arfcn;
    *(unsigned char *)(v5 + 112) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_psc;
    *(unsigned char *)(v5 + 112) |= 4u;
  }
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_serverHash;
    *(unsigned char *)(v6 + 112) |= 0x20u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_transmit;
    *(unsigned char *)(v6 + 112) |= 0x40u;
  }
  uint64_t v13 = [(NSString *)self->_operatorName copyWithZone:a3];
  id v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_ecn0;
    *(unsigned char *)(v6 + 112) |= 2u;
    char v15 = (char)self->_has;
    if ((v15 & 0x10) == 0)
    {
LABEL_11:
      if ((v15 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 80) = self->_rscp;
  *(unsigned char *)(v6 + 112) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 76) = self->_rat;
    *(unsigned char *)(v6 + 112) |= 8u;
  }
LABEL_13:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v16 = self->_neighbors;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v6 addNeighbor:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  id v22 = [(CLPCellNeighborsGroup *)self->_neighborGroup copyWithZone:a3];
  uint64_t v23 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v22;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v6 + 108) = self->_isLimitedService;
    *(unsigned char *)(v6 + 112) |= 0x80u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (void)v27);
  uint64_t v25 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_mcc != *((_DWORD *)v4 + 10)
    || self->_mnc != *((_DWORD *)v4 + 11)
    || self->_lac != *((_DWORD *)v4 + 7)
    || self->_ci != *((_DWORD *)v4 + 5)
    || self->_rssi != *((_DWORD *)v4 + 21))
  {
    goto LABEL_58;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[112] & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 4)) {
      goto LABEL_58;
    }
  }
  else if (v4[112])
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[112] & 4) == 0 || self->_psc != *((_DWORD *)v4 + 18)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 4) != 0)
  {
    goto LABEL_58;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4) && !-[CLPLocation isEqual:](location, "isEqual:")) {
    goto LABEL_58;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_58;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((v4[112] & 0x20) == 0 || self->_serverHash != *((_DWORD *)v4 + 22)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[112] & 0x40) == 0 || self->_transmit != *((_DWORD *)v4 + 26)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:")) {
      goto LABEL_58;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[112] & 2) == 0 || self->_ecn0 != *((_DWORD *)v4 + 6)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v4[112] & 0x10) == 0 || self->_rscp != *((_DWORD *)v4 + 20)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v4[112] & 8) == 0 || self->_rat != *((_DWORD *)v4 + 19)) {
      goto LABEL_58;
    }
  }
  else if ((v4[112] & 8) != 0)
  {
    goto LABEL_58;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_58;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((void *)v4 + 6))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:")) {
      goto LABEL_58;
    }
  }
  int v11 = v4[112];
  if ((*(unsigned char *)&self->_has & 0x80000000) == 0)
  {
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_55;
    }
LABEL_58:
    char v13 = 0;
    goto LABEL_59;
  }
  if ((v11 & 0x80000000) == 0) {
    goto LABEL_58;
  }
  if (self->_isLimitedService)
  {
    if (!v4[108]) {
      goto LABEL_58;
    }
  }
  else if (v4[108])
  {
    goto LABEL_58;
  }
LABEL_55:
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 12)) {
    char v13 = -[NSString isEqual:](serviceProviderName, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_59:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v22 = 2654435761 * self->_arfcn;
  }
  else {
    uint64_t v22 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v21 = 2654435761 * self->_psc;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t mcc = self->_mcc;
  uint64_t mnc = self->_mnc;
  uint64_t lac = self->_lac;
  cuint64_t i = self->_ci;
  rssuint64_t i = self->_rssi;
  unint64_t v8 = [(CLPLocation *)self->_location hash];
  NSUInteger v9 = [(NSString *)self->_appBundleId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v20 = 2654435761 * self->_serverHash;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v24 = v9;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v19 = 2654435761 * self->_transmit;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_operatorName hash];
  uint64_t v25 = mcc;
  unint64_t v26 = v8;
  uint64_t v23 = mnc;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v18 = 2654435761 * self->_ecn0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_15:
      uint64_t v11 = 2654435761 * self->_rscp;
      goto LABEL_18;
    }
  }
  uint64_t v11 = 0;
LABEL_18:
  NSUInteger v12 = v10;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_rat;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(NSMutableArray *)self->_neighbors hash];
  unint64_t v15 = [(CLPCellNeighborsGroup *)self->_neighborGroup hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v16 = 2654435761 * self->_isLimitedService;
  }
  else {
    uint64_t v16 = 0;
  }
  return (2654435761 * v23) ^ (2654435761 * v25) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v22 ^ v21 ^ v26 ^ v24 ^ v20 ^ v19 ^ v12 ^ v18 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NSString *)self->_serviceProviderName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  uint64_t v5 = v4;
  self->_uint64_t mcc = *((_DWORD *)v4 + 10);
  self->_uint64_t mnc = *((_DWORD *)v4 + 11);
  self->_uint64_t lac = *((_DWORD *)v4 + 7);
  self->_cuint64_t i = *((_DWORD *)v4 + 5);
  self->_rssuint64_t i = *((_DWORD *)v4 + 21);
  char v6 = v4[112];
  if (v6)
  {
    self->_arfcn = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = v4[112];
  }
  if ((v6 & 4) != 0)
  {
    self->_psc = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
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
    -[CLPSCdmaCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((void *)v5 + 1)) {
    -[CLPSCdmaCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  }
  char v9 = v5[112];
  if ((v9 & 0x20) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 22);
    *(unsigned char *)&self->_has |= 0x20u;
    char v9 = v5[112];
  }
  if ((v9 & 0x40) != 0)
  {
    self->_transmit = *((_DWORD *)v5 + 26);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 8)) {
    -[CLPSCdmaCellTowerLocation setOperatorName:](self, "setOperatorName:");
  }
  char v10 = v5[112];
  if ((v10 & 2) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = v5[112];
    if ((v10 & 0x10) == 0)
    {
LABEL_20:
      if ((v10 & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v5[112] & 0x10) == 0)
  {
    goto LABEL_20;
  }
  self->_rscp = *((_DWORD *)v5 + 20);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((v5[112] & 8) != 0)
  {
LABEL_21:
    self->_rat = *((_DWORD *)v5 + 19);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_22:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *((id *)v5 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        -[CLPSCdmaCellTowerLocation addNeighbor:](self, "addNeighbor:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
    -[CLPSCdmaCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if (v5[112] < 0)
  {
    self->_isLimitedService = v5[108];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v5 + 12)) {
    -[CLPSCdmaCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
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
  __assert_rtn("-[CLPSCdmaCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 33248, "self->_location != nil");
}

@end