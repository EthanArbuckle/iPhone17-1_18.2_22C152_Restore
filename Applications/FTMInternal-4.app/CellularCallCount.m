@interface CellularCallCount
+ (Class)endStatusCountConnectedCdmaType;
+ (Class)endStatusCountConnectedGwType;
+ (Class)endStatusCountNotConnectedCdmaType;
+ (Class)endStatusCountNotConnectedGwType;
+ (Class)releaseCauseCountConnectedGsmType;
+ (Class)releaseCauseCountConnectedType;
+ (Class)releaseCauseCountConnectedWcdmaType;
+ (Class)releaseCauseCountNotConnectedGsmType;
+ (Class)releaseCauseCountNotConnectedType;
+ (Class)releaseCauseCountNotConnectedWcdmaType;
- (BOOL)hasNumConnectedCallsCdma;
- (BOOL)hasNumConnectedCallsGsm;
- (BOOL)hasNumConnectedCallsGw;
- (BOOL)hasNumConnectedCallsWcdma;
- (BOOL)hasNumMultiRabEndCalls;
- (BOOL)hasNumMultiRabEverCalls;
- (BOOL)hasNumNormalReleaseCallsCdma;
- (BOOL)hasNumNormalReleaseCallsGsm;
- (BOOL)hasNumNormalReleaseCallsGw;
- (BOOL)hasNumNormalReleaseCallsWcdma;
- (BOOL)hasNumTotalCallsCdma;
- (BOOL)hasNumTotalCallsGsm;
- (BOOL)hasNumTotalCallsGw;
- (BOOL)hasNumTotalCallsWcdma;
- (BOOL)hasPeriodSeconds;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalConnectedSecondsCdma;
- (BOOL)hasTotalConnectedSecondsGsm;
- (BOOL)hasTotalConnectedSecondsWcdma;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)endStatusCountConnectedCdmas;
- (NSMutableArray)endStatusCountConnectedGws;
- (NSMutableArray)endStatusCountNotConnectedCdmas;
- (NSMutableArray)endStatusCountNotConnectedGws;
- (NSMutableArray)releaseCauseCountConnectedGsms;
- (NSMutableArray)releaseCauseCountConnectedWcdmas;
- (NSMutableArray)releaseCauseCountConnecteds;
- (NSMutableArray)releaseCauseCountNotConnectedGsms;
- (NSMutableArray)releaseCauseCountNotConnectedWcdmas;
- (NSMutableArray)releaseCauseCountNotConnecteds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endStatusCountConnectedCdmaAtIndex:(unint64_t)a3;
- (id)endStatusCountConnectedGwAtIndex:(unint64_t)a3;
- (id)endStatusCountNotConnectedCdmaAtIndex:(unint64_t)a3;
- (id)endStatusCountNotConnectedGwAtIndex:(unint64_t)a3;
- (id)releaseCauseCountConnectedAtIndex:(unint64_t)a3;
- (id)releaseCauseCountConnectedGsmAtIndex:(unint64_t)a3;
- (id)releaseCauseCountConnectedWcdmaAtIndex:(unint64_t)a3;
- (id)releaseCauseCountNotConnectedAtIndex:(unint64_t)a3;
- (id)releaseCauseCountNotConnectedGsmAtIndex:(unint64_t)a3;
- (id)releaseCauseCountNotConnectedWcdmaAtIndex:(unint64_t)a3;
- (unint64_t)endStatusCountConnectedCdmasCount;
- (unint64_t)endStatusCountConnectedGwsCount;
- (unint64_t)endStatusCountNotConnectedCdmasCount;
- (unint64_t)endStatusCountNotConnectedGwsCount;
- (unint64_t)hash;
- (unint64_t)releaseCauseCountConnectedGsmsCount;
- (unint64_t)releaseCauseCountConnectedWcdmasCount;
- (unint64_t)releaseCauseCountConnectedsCount;
- (unint64_t)releaseCauseCountNotConnectedGsmsCount;
- (unint64_t)releaseCauseCountNotConnectedWcdmasCount;
- (unint64_t)releaseCauseCountNotConnectedsCount;
- (unint64_t)timestamp;
- (unsigned)numConnectedCallsCdma;
- (unsigned)numConnectedCallsGsm;
- (unsigned)numConnectedCallsGw;
- (unsigned)numConnectedCallsWcdma;
- (unsigned)numMultiRabEndCalls;
- (unsigned)numMultiRabEverCalls;
- (unsigned)numNormalReleaseCallsCdma;
- (unsigned)numNormalReleaseCallsGsm;
- (unsigned)numNormalReleaseCallsGw;
- (unsigned)numNormalReleaseCallsWcdma;
- (unsigned)numTotalCallsCdma;
- (unsigned)numTotalCallsGsm;
- (unsigned)numTotalCallsGw;
- (unsigned)numTotalCallsWcdma;
- (unsigned)periodSeconds;
- (unsigned)totalConnectedSecondsCdma;
- (unsigned)totalConnectedSecondsGsm;
- (unsigned)totalConnectedSecondsWcdma;
- (void)addEndStatusCountConnectedCdma:(id)a3;
- (void)addEndStatusCountConnectedGw:(id)a3;
- (void)addEndStatusCountNotConnectedCdma:(id)a3;
- (void)addEndStatusCountNotConnectedGw:(id)a3;
- (void)addReleaseCauseCountConnected:(id)a3;
- (void)addReleaseCauseCountConnectedGsm:(id)a3;
- (void)addReleaseCauseCountConnectedWcdma:(id)a3;
- (void)addReleaseCauseCountNotConnected:(id)a3;
- (void)addReleaseCauseCountNotConnectedGsm:(id)a3;
- (void)addReleaseCauseCountNotConnectedWcdma:(id)a3;
- (void)clearEndStatusCountConnectedCdmas;
- (void)clearEndStatusCountConnectedGws;
- (void)clearEndStatusCountNotConnectedCdmas;
- (void)clearEndStatusCountNotConnectedGws;
- (void)clearReleaseCauseCountConnectedGsms;
- (void)clearReleaseCauseCountConnectedWcdmas;
- (void)clearReleaseCauseCountConnecteds;
- (void)clearReleaseCauseCountNotConnectedGsms;
- (void)clearReleaseCauseCountNotConnectedWcdmas;
- (void)clearReleaseCauseCountNotConnecteds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndStatusCountConnectedCdmas:(id)a3;
- (void)setEndStatusCountConnectedGws:(id)a3;
- (void)setEndStatusCountNotConnectedCdmas:(id)a3;
- (void)setEndStatusCountNotConnectedGws:(id)a3;
- (void)setHasNumConnectedCallsCdma:(BOOL)a3;
- (void)setHasNumConnectedCallsGsm:(BOOL)a3;
- (void)setHasNumConnectedCallsGw:(BOOL)a3;
- (void)setHasNumConnectedCallsWcdma:(BOOL)a3;
- (void)setHasNumMultiRabEndCalls:(BOOL)a3;
- (void)setHasNumMultiRabEverCalls:(BOOL)a3;
- (void)setHasNumNormalReleaseCallsCdma:(BOOL)a3;
- (void)setHasNumNormalReleaseCallsGsm:(BOOL)a3;
- (void)setHasNumNormalReleaseCallsGw:(BOOL)a3;
- (void)setHasNumNormalReleaseCallsWcdma:(BOOL)a3;
- (void)setHasNumTotalCallsCdma:(BOOL)a3;
- (void)setHasNumTotalCallsGsm:(BOOL)a3;
- (void)setHasNumTotalCallsGw:(BOOL)a3;
- (void)setHasNumTotalCallsWcdma:(BOOL)a3;
- (void)setHasPeriodSeconds:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalConnectedSecondsCdma:(BOOL)a3;
- (void)setHasTotalConnectedSecondsGsm:(BOOL)a3;
- (void)setHasTotalConnectedSecondsWcdma:(BOOL)a3;
- (void)setNumConnectedCallsCdma:(unsigned int)a3;
- (void)setNumConnectedCallsGsm:(unsigned int)a3;
- (void)setNumConnectedCallsGw:(unsigned int)a3;
- (void)setNumConnectedCallsWcdma:(unsigned int)a3;
- (void)setNumMultiRabEndCalls:(unsigned int)a3;
- (void)setNumMultiRabEverCalls:(unsigned int)a3;
- (void)setNumNormalReleaseCallsCdma:(unsigned int)a3;
- (void)setNumNormalReleaseCallsGsm:(unsigned int)a3;
- (void)setNumNormalReleaseCallsGw:(unsigned int)a3;
- (void)setNumNormalReleaseCallsWcdma:(unsigned int)a3;
- (void)setNumTotalCallsCdma:(unsigned int)a3;
- (void)setNumTotalCallsGsm:(unsigned int)a3;
- (void)setNumTotalCallsGw:(unsigned int)a3;
- (void)setNumTotalCallsWcdma:(unsigned int)a3;
- (void)setPeriodSeconds:(unsigned int)a3;
- (void)setReleaseCauseCountConnectedGsms:(id)a3;
- (void)setReleaseCauseCountConnectedWcdmas:(id)a3;
- (void)setReleaseCauseCountConnecteds:(id)a3;
- (void)setReleaseCauseCountNotConnectedGsms:(id)a3;
- (void)setReleaseCauseCountNotConnectedWcdmas:(id)a3;
- (void)setReleaseCauseCountNotConnecteds:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalConnectedSecondsCdma:(unsigned int)a3;
- (void)setTotalConnectedSecondsGsm:(unsigned int)a3;
- (void)setTotalConnectedSecondsWcdma:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularCallCount

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPeriodSeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_periodSeconds = a3;
}

- (void)setHasPeriodSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPeriodSeconds
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumTotalCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numTotalCallsCdma = a3;
}

- (void)setHasNumTotalCallsCdma:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumTotalCallsCdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNumConnectedCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_numConnectedCallsCdma = a3;
}

- (void)setHasNumConnectedCallsCdma:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNumConnectedCallsCdma
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumNormalReleaseCallsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numNormalReleaseCallsCdma = a3;
}

- (void)setHasNumNormalReleaseCallsCdma:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumNormalReleaseCallsCdma
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)clearEndStatusCountConnectedCdmas
{
}

- (void)addEndStatusCountConnectedCdma:(id)a3
{
  id v4 = a3;
  endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  id v8 = v4;
  if (!endStatusCountConnectedCdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountConnectedCdmas;
    self->_endStatusCountConnectedCdmas = v6;

    id v4 = v8;
    endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  }
  [(NSMutableArray *)endStatusCountConnectedCdmas addObject:v4];
}

- (unint64_t)endStatusCountConnectedCdmasCount
{
  return (unint64_t)[(NSMutableArray *)self->_endStatusCountConnectedCdmas count];
}

- (id)endStatusCountConnectedCdmaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endStatusCountConnectedCdmas objectAtIndex:a3];
}

+ (Class)endStatusCountConnectedCdmaType
{
  return (Class)objc_opt_class();
}

- (void)clearEndStatusCountNotConnectedCdmas
{
}

- (void)addEndStatusCountNotConnectedCdma:(id)a3
{
  id v4 = a3;
  endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  id v8 = v4;
  if (!endStatusCountNotConnectedCdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountNotConnectedCdmas;
    self->_endStatusCountNotConnectedCdmas = v6;

    id v4 = v8;
    endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  }
  [(NSMutableArray *)endStatusCountNotConnectedCdmas addObject:v4];
}

- (unint64_t)endStatusCountNotConnectedCdmasCount
{
  return (unint64_t)[(NSMutableArray *)self->_endStatusCountNotConnectedCdmas count];
}

- (id)endStatusCountNotConnectedCdmaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endStatusCountNotConnectedCdmas objectAtIndex:a3];
}

+ (Class)endStatusCountNotConnectedCdmaType
{
  return (Class)objc_opt_class();
}

- (void)setTotalConnectedSecondsCdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalConnectedSecondsCdma = a3;
}

- (void)setHasTotalConnectedSecondsCdma:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsCdma
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setNumTotalCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numTotalCallsGw = a3;
}

- (void)setHasNumTotalCallsGw:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumTotalCallsGw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNumConnectedCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_numConnectedCallsGw = a3;
}

- (void)setHasNumConnectedCallsGw:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNumConnectedCallsGw
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumNormalReleaseCallsGw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numNormalReleaseCallsGw = a3;
}

- (void)setHasNumNormalReleaseCallsGw:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsGw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)clearEndStatusCountConnectedGws
{
}

- (void)addEndStatusCountConnectedGw:(id)a3
{
  id v4 = a3;
  endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  id v8 = v4;
  if (!endStatusCountConnectedGws)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountConnectedGws;
    self->_endStatusCountConnectedGws = v6;

    id v4 = v8;
    endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  }
  [(NSMutableArray *)endStatusCountConnectedGws addObject:v4];
}

- (unint64_t)endStatusCountConnectedGwsCount
{
  return (unint64_t)[(NSMutableArray *)self->_endStatusCountConnectedGws count];
}

- (id)endStatusCountConnectedGwAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endStatusCountConnectedGws objectAtIndex:a3];
}

+ (Class)endStatusCountConnectedGwType
{
  return (Class)objc_opt_class();
}

- (void)clearEndStatusCountNotConnectedGws
{
}

- (void)addEndStatusCountNotConnectedGw:(id)a3
{
  id v4 = a3;
  endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  id v8 = v4;
  if (!endStatusCountNotConnectedGws)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endStatusCountNotConnectedGws;
    self->_endStatusCountNotConnectedGws = v6;

    id v4 = v8;
    endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  }
  [(NSMutableArray *)endStatusCountNotConnectedGws addObject:v4];
}

- (unint64_t)endStatusCountNotConnectedGwsCount
{
  return (unint64_t)[(NSMutableArray *)self->_endStatusCountNotConnectedGws count];
}

- (id)endStatusCountNotConnectedGwAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endStatusCountNotConnectedGws objectAtIndex:a3];
}

+ (Class)endStatusCountNotConnectedGwType
{
  return (Class)objc_opt_class();
}

- (void)setNumMultiRabEverCalls:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numMultiRabEverCalls = a3;
}

- (void)setHasNumMultiRabEverCalls:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumMultiRabEverCalls
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumMultiRabEndCalls:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numMultiRabEndCalls = a3;
}

- (void)setHasNumMultiRabEndCalls:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumMultiRabEndCalls
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearReleaseCauseCountConnecteds
{
}

- (void)addReleaseCauseCountConnected:(id)a3
{
  id v4 = a3;
  releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  id v8 = v4;
  if (!releaseCauseCountConnecteds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnecteds;
    self->_releaseCauseCountConnecteds = v6;

    id v4 = v8;
    releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  }
  [(NSMutableArray *)releaseCauseCountConnecteds addObject:v4];
}

- (unint64_t)releaseCauseCountConnectedsCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnecteds count];
}

- (id)releaseCauseCountConnectedAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountConnecteds objectAtIndex:a3];
}

+ (Class)releaseCauseCountConnectedType
{
  return (Class)objc_opt_class();
}

- (void)clearReleaseCauseCountNotConnecteds
{
}

- (void)addReleaseCauseCountNotConnected:(id)a3
{
  id v4 = a3;
  releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  id v8 = v4;
  if (!releaseCauseCountNotConnecteds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnecteds;
    self->_releaseCauseCountNotConnecteds = v6;

    id v4 = v8;
    releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  }
  [(NSMutableArray *)releaseCauseCountNotConnecteds addObject:v4];
}

- (unint64_t)releaseCauseCountNotConnectedsCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnecteds count];
}

- (id)releaseCauseCountNotConnectedAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountNotConnecteds objectAtIndex:a3];
}

+ (Class)releaseCauseCountNotConnectedType
{
  return (Class)objc_opt_class();
}

- (void)setNumTotalCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numTotalCallsGsm = a3;
}

- (void)setHasNumTotalCallsGsm:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumTotalCallsGsm
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumConnectedCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numConnectedCallsGsm = a3;
}

- (void)setHasNumConnectedCallsGsm:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumConnectedCallsGsm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumNormalReleaseCallsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numNormalReleaseCallsGsm = a3;
}

- (void)setHasNumNormalReleaseCallsGsm:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsGsm
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)clearReleaseCauseCountConnectedGsms
{
}

- (void)addReleaseCauseCountConnectedGsm:(id)a3
{
  id v4 = a3;
  releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  id v8 = v4;
  if (!releaseCauseCountConnectedGsms)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnectedGsms;
    self->_releaseCauseCountConnectedGsms = v6;

    id v4 = v8;
    releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  }
  [(NSMutableArray *)releaseCauseCountConnectedGsms addObject:v4];
}

- (unint64_t)releaseCauseCountConnectedGsmsCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnectedGsms count];
}

- (id)releaseCauseCountConnectedGsmAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountConnectedGsms objectAtIndex:a3];
}

+ (Class)releaseCauseCountConnectedGsmType
{
  return (Class)objc_opt_class();
}

- (void)clearReleaseCauseCountNotConnectedGsms
{
}

- (void)addReleaseCauseCountNotConnectedGsm:(id)a3
{
  id v4 = a3;
  releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  id v8 = v4;
  if (!releaseCauseCountNotConnectedGsms)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnectedGsms;
    self->_releaseCauseCountNotConnectedGsms = v6;

    id v4 = v8;
    releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  }
  [(NSMutableArray *)releaseCauseCountNotConnectedGsms addObject:v4];
}

- (unint64_t)releaseCauseCountNotConnectedGsmsCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnectedGsms count];
}

- (id)releaseCauseCountNotConnectedGsmAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountNotConnectedGsms objectAtIndex:a3];
}

+ (Class)releaseCauseCountNotConnectedGsmType
{
  return (Class)objc_opt_class();
}

- (void)setTotalConnectedSecondsGsm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalConnectedSecondsGsm = a3;
}

- (void)setHasTotalConnectedSecondsGsm:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsGsm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumTotalCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numTotalCallsWcdma = a3;
}

- (void)setHasNumTotalCallsWcdma:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumTotalCallsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumConnectedCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numConnectedCallsWcdma = a3;
}

- (void)setHasNumConnectedCallsWcdma:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNumConnectedCallsWcdma
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumNormalReleaseCallsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numNormalReleaseCallsWcdma = a3;
}

- (void)setHasNumNormalReleaseCallsWcdma:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumNormalReleaseCallsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearReleaseCauseCountConnectedWcdmas
{
}

- (void)addReleaseCauseCountConnectedWcdma:(id)a3
{
  id v4 = a3;
  releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  id v8 = v4;
  if (!releaseCauseCountConnectedWcdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountConnectedWcdmas;
    self->_releaseCauseCountConnectedWcdmas = v6;

    id v4 = v8;
    releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  }
  [(NSMutableArray *)releaseCauseCountConnectedWcdmas addObject:v4];
}

- (unint64_t)releaseCauseCountConnectedWcdmasCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnectedWcdmas count];
}

- (id)releaseCauseCountConnectedWcdmaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountConnectedWcdmas objectAtIndex:a3];
}

+ (Class)releaseCauseCountConnectedWcdmaType
{
  return (Class)objc_opt_class();
}

- (void)clearReleaseCauseCountNotConnectedWcdmas
{
}

- (void)addReleaseCauseCountNotConnectedWcdma:(id)a3
{
  id v4 = a3;
  releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  id v8 = v4;
  if (!releaseCauseCountNotConnectedWcdmas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_releaseCauseCountNotConnectedWcdmas;
    self->_releaseCauseCountNotConnectedWcdmas = v6;

    id v4 = v8;
    releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  }
  [(NSMutableArray *)releaseCauseCountNotConnectedWcdmas addObject:v4];
}

- (unint64_t)releaseCauseCountNotConnectedWcdmasCount
{
  return (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnectedWcdmas count];
}

- (id)releaseCauseCountNotConnectedWcdmaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_releaseCauseCountNotConnectedWcdmas objectAtIndex:a3];
}

+ (Class)releaseCauseCountNotConnectedWcdmaType
{
  return (Class)objc_opt_class();
}

- (void)setTotalConnectedSecondsWcdma:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalConnectedSecondsWcdma = a3;
}

- (void)setHasTotalConnectedSecondsWcdma:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6BF4D661EEBB0D17828DA0D6CA72866A)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalConnectedSecondsWcdma
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCallCount;
  int v3 = [(CellularCallCount *)&v7 description];
  id v4 = [(CellularCallCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v88 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v88 forKey:@"timestamp"];

    $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_120;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v89 = +[NSNumber numberWithUnsignedInt:self->_periodSeconds];
  [v3 setObject:v89 forKey:@"period_seconds"];

  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_121;
  }
LABEL_120:
  v90 = +[NSNumber numberWithUnsignedInt:self->_numTotalCallsCdma];
  [v3 setObject:v90 forKey:@"num_total_calls_cdma"];

  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_121:
  v91 = +[NSNumber numberWithUnsignedInt:self->_numConnectedCallsCdma];
  [v3 setObject:v91 forKey:@"num_connected_calls_cdma"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numNormalReleaseCallsCdma];
    [v3 setObject:v5 forKey:@"num_normal_release_calls_cdma"];
  }
LABEL_7:
  if ([(NSMutableArray *)self->_endStatusCountConnectedCdmas count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_endStatusCountConnectedCdmas, "count")];
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    objc_super v7 = self->_endStatusCountConnectedCdmas;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v136 objects:v149 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v137;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v137 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v136 + 1) + 8 * (void)v11) dictionaryRepresentation];
          [v6 addObject:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v136 objects:v149 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"end_status_count_connected_cdma"];
  }
  if ([(NSMutableArray *)self->_endStatusCountNotConnectedCdmas count])
  {
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_endStatusCountNotConnectedCdmas, "count")];
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v14 = self->_endStatusCountNotConnectedCdmas;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v132 objects:v148 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v133;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v133 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v132 + 1) + 8 * (void)v18) dictionaryRepresentation];
          [v13 addObject:v19];

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v132 objects:v148 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"end_status_count_not_connected_cdma"];
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    v92 = +[NSNumber numberWithUnsignedInt:self->_totalConnectedSecondsCdma];
    [v3 setObject:v92 forKey:@"total_connected_seconds_cdma"];

    $6BF4D661EEBB0D17828DA0D6CA72866A v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x2000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v20 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_125;
    }
  }
  else if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
    goto LABEL_27;
  }
  v93 = +[NSNumber numberWithUnsignedInt:self->_numTotalCallsGw];
  [v3 setObject:v93 forKey:@"num_total_calls_gw"];

  $6BF4D661EEBB0D17828DA0D6CA72866A v20 = self->_has;
  if ((*(unsigned char *)&v20 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v20 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_125:
  v94 = +[NSNumber numberWithUnsignedInt:self->_numConnectedCallsGw];
  [v3 setObject:v94 forKey:@"num_connected_calls_gw"];

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    v21 = +[NSNumber numberWithUnsignedInt:self->_numNormalReleaseCallsGw];
    [v3 setObject:v21 forKey:@"num_normal_release_calls_gw"];
  }
LABEL_30:
  if ([(NSMutableArray *)self->_endStatusCountConnectedGws count])
  {
    id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_endStatusCountConnectedGws, "count")];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v23 = self->_endStatusCountConnectedGws;
    id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v128 objects:v147 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v129;
      do
      {
        v27 = 0;
        do
        {
          if (*(void *)v129 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v128 + 1) + 8 * (void)v27) dictionaryRepresentation];
          [v22 addObject:v28];

          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v128 objects:v147 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"end_status_count_connected_gw"];
  }
  if ([(NSMutableArray *)self->_endStatusCountNotConnectedGws count])
  {
    id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_endStatusCountNotConnectedGws, "count")];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v30 = self->_endStatusCountNotConnectedGws;
    id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v124 objects:v146 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v125;
      do
      {
        v34 = 0;
        do
        {
          if (*(void *)v125 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v124 + 1) + 8 * (void)v34) dictionaryRepresentation];
          [v29 addObject:v35];

          v34 = (char *)v34 + 1;
        }
        while (v32 != v34);
        id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v124 objects:v146 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"end_status_count_not_connected_gw"];
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x40) != 0)
  {
    v37 = +[NSNumber numberWithUnsignedInt:self->_numMultiRabEverCalls];
    [v3 setObject:v37 forKey:@"num_multi_rab_ever_calls"];

    $6BF4D661EEBB0D17828DA0D6CA72866A v36 = self->_has;
  }
  if ((*(unsigned char *)&v36 & 0x20) != 0)
  {
    v38 = +[NSNumber numberWithUnsignedInt:self->_numMultiRabEndCalls];
    [v3 setObject:v38 forKey:@"num_multi_rab_end_calls"];
  }
  if ([(NSMutableArray *)self->_releaseCauseCountConnecteds count])
  {
    id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountConnecteds, "count")];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v40 = self->_releaseCauseCountConnecteds;
    id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v120 objects:v145 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v121;
      do
      {
        v44 = 0;
        do
        {
          if (*(void *)v121 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v120 + 1) + 8 * (void)v44) dictionaryRepresentation];
          [v39 addObject:v45];

          v44 = (char *)v44 + 1;
        }
        while (v42 != v44);
        id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v120 objects:v145 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"release_cause_count_connected"];
  }
  if ([(NSMutableArray *)self->_releaseCauseCountNotConnecteds count])
  {
    id v46 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountNotConnecteds, "count")];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v47 = self->_releaseCauseCountNotConnecteds;
    id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v116 objects:v144 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v117;
      do
      {
        v51 = 0;
        do
        {
          if (*(void *)v117 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v116 + 1) + 8 * (void)v51) dictionaryRepresentation];
          [v46 addObject:v52];

          v51 = (char *)v51 + 1;
        }
        while (v49 != v51);
        id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v116 objects:v144 count:16];
      }
      while (v49);
    }

    [v3 setObject:v46 forKey:@"release_cause_count_not_connected"];
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x1000) != 0)
  {
    v95 = +[NSNumber numberWithUnsignedInt:self->_numTotalCallsGsm];
    [v3 setObject:v95 forKey:@"num_total_calls_gsm"];

    $6BF4D661EEBB0D17828DA0D6CA72866A v53 = self->_has;
    if ((*(unsigned char *)&v53 & 4) == 0)
    {
LABEL_72:
      if ((*(_WORD *)&v53 & 0x100) == 0) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&v53 & 4) == 0)
  {
    goto LABEL_72;
  }
  v96 = +[NSNumber numberWithUnsignedInt:self->_numConnectedCallsGsm];
  [v3 setObject:v96 forKey:@"num_connected_calls_gsm"];

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_73:
    v54 = +[NSNumber numberWithUnsignedInt:self->_numNormalReleaseCallsGsm];
    [v3 setObject:v54 forKey:@"num_normal_release_calls_gsm"];
  }
LABEL_74:
  if ([(NSMutableArray *)self->_releaseCauseCountConnectedGsms count])
  {
    id v55 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountConnectedGsms, "count")];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v56 = self->_releaseCauseCountConnectedGsms;
    id v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v112 objects:v143 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v113;
      do
      {
        v60 = 0;
        do
        {
          if (*(void *)v113 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v112 + 1) + 8 * (void)v60) dictionaryRepresentation];
          [v55 addObject:v61];

          v60 = (char *)v60 + 1;
        }
        while (v58 != v60);
        id v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v112 objects:v143 count:16];
      }
      while (v58);
    }

    [v3 setObject:v55 forKey:@"release_cause_count_connected_gsm"];
  }
  if ([(NSMutableArray *)self->_releaseCauseCountNotConnectedGsms count])
  {
    id v62 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountNotConnectedGsms, "count")];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v63 = self->_releaseCauseCountNotConnectedGsms;
    id v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v108 objects:v142 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v109;
      do
      {
        v67 = 0;
        do
        {
          if (*(void *)v109 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = [*(id *)(*((void *)&v108 + 1) + 8 * (void)v67) dictionaryRepresentation];
          [v62 addObject:v68];

          v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        id v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v108 objects:v142 count:16];
      }
      while (v65);
    }

    [v3 setObject:v62 forKey:@"release_cause_count_not_connected_gsm"];
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x20000) != 0)
  {
    v97 = +[NSNumber numberWithUnsignedInt:self->_totalConnectedSecondsGsm];
    [v3 setObject:v97 forKey:@"total_connected_seconds_gsm"];

    $6BF4D661EEBB0D17828DA0D6CA72866A v69 = self->_has;
    if ((*(_WORD *)&v69 & 0x4000) == 0)
    {
LABEL_94:
      if ((*(unsigned char *)&v69 & 0x10) == 0) {
        goto LABEL_95;
      }
      goto LABEL_132;
    }
  }
  else if ((*(_WORD *)&v69 & 0x4000) == 0)
  {
    goto LABEL_94;
  }
  v98 = +[NSNumber numberWithUnsignedInt:self->_numTotalCallsWcdma];
  [v3 setObject:v98 forKey:@"num_total_calls_wcdma"];

  $6BF4D661EEBB0D17828DA0D6CA72866A v69 = self->_has;
  if ((*(unsigned char *)&v69 & 0x10) == 0)
  {
LABEL_95:
    if ((*(_WORD *)&v69 & 0x400) == 0) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }
LABEL_132:
  v99 = +[NSNumber numberWithUnsignedInt:self->_numConnectedCallsWcdma];
  [v3 setObject:v99 forKey:@"num_connected_calls_wcdma"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_96:
    v70 = +[NSNumber numberWithUnsignedInt:self->_numNormalReleaseCallsWcdma];
    [v3 setObject:v70 forKey:@"num_normal_release_calls_wcdma"];
  }
LABEL_97:
  if ([(NSMutableArray *)self->_releaseCauseCountConnectedWcdmas count])
  {
    id v71 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountConnectedWcdmas, "count")];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v72 = self->_releaseCauseCountConnectedWcdmas;
    id v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v104 objects:v141 count:16];
    if (v73)
    {
      id v74 = v73;
      uint64_t v75 = *(void *)v105;
      do
      {
        v76 = 0;
        do
        {
          if (*(void *)v105 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = [*(id *)(*((void *)&v104 + 1) + 8 * (void)v76) dictionaryRepresentation];
          [v71 addObject:v77];

          v76 = (char *)v76 + 1;
        }
        while (v74 != v76);
        id v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v104 objects:v141 count:16];
      }
      while (v74);
    }

    [v3 setObject:v71 forKey:@"release_cause_count_connected_wcdma"];
  }
  if ([(NSMutableArray *)self->_releaseCauseCountNotConnectedWcdmas count])
  {
    id v78 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_releaseCauseCountNotConnectedWcdmas, "count")];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v79 = self->_releaseCauseCountNotConnectedWcdmas;
    id v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v100 objects:v140 count:16];
    if (v80)
    {
      id v81 = v80;
      uint64_t v82 = *(void *)v101;
      do
      {
        v83 = 0;
        do
        {
          if (*(void *)v101 != v82) {
            objc_enumerationMutation(v79);
          }
          v84 = [*(id *)(*((void *)&v100 + 1) + 8 * (void)v83) dictionaryRepresentation];
          [v78 addObject:v84];

          v83 = (char *)v83 + 1;
        }
        while (v81 != v83);
        id v81 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v100 objects:v140 count:16];
      }
      while (v81);
    }

    [v3 setObject:v78 forKey:@"release_cause_count_not_connected_wcdma"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v85 = +[NSNumber numberWithUnsignedInt:self->_totalConnectedSecondsWcdma];
    [v3 setObject:v85 forKey:@"total_connected_seconds_wcdma"];
  }
  id v86 = v3;

  return v86;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100034F78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v6 = self->_endStatusCountConnectedCdmas;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v96 objects:v109 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v97;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v97 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v96 objects:v109 count:16];
    }
    while (v8);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v11 = self->_endStatusCountNotConnectedCdmas;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v92 objects:v108 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v93;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v93 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      id v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v92 objects:v108 count:16];
    }
    while (v13);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $6BF4D661EEBB0D17828DA0D6CA72866A v16 = self->_has;
    if ((*(unsigned char *)&v16 & 0x40) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&v16 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v17 = self->_releaseCauseCountConnecteds;
  v18 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v88 objects:v107 count:16];
  if (v18)
  {
    v19 = v18;
    uint64_t v20 = *(void *)v89;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v89 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v88 objects:v107 count:16];
    }
    while (v19);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v22 = self->_releaseCauseCountNotConnecteds;
  v23 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v84 objects:v106 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v85;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v85 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      id v24 = (char *)[(NSMutableArray *)v22 countByEnumeratingWithState:&v84 objects:v106 count:16];
    }
    while (v24);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x2000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $6BF4D661EEBB0D17828DA0D6CA72866A v27 = self->_has;
    if ((*(unsigned char *)&v27 & 8) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v27 & 0x200) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v27 & 8) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_42:
  }
    PBDataWriterWriteUint32Field();
LABEL_43:
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v28 = self->_endStatusCountConnectedGws;
  id v29 = (char *)[(NSMutableArray *)v28 countByEnumeratingWithState:&v80 objects:v105 count:16];
  if (v29)
  {
    v30 = v29;
    uint64_t v31 = *(void *)v81;
    do
    {
      id v32 = 0;
      do
      {
        if (*(void *)v81 != v31) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
        ++v32;
      }
      while (v30 != v32);
      v30 = (char *)[(NSMutableArray *)v28 countByEnumeratingWithState:&v80 objects:v105 count:16];
    }
    while (v30);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v33 = self->_endStatusCountNotConnectedGws;
  v34 = (char *)[(NSMutableArray *)v33 countByEnumeratingWithState:&v76 objects:v104 count:16];
  if (v34)
  {
    v35 = v34;
    uint64_t v36 = *(void *)v77;
    do
    {
      v37 = 0;
      do
      {
        if (*(void *)v77 != v36) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      v35 = (char *)[(NSMutableArray *)v33 countByEnumeratingWithState:&v76 objects:v104 count:16];
    }
    while (v35);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $6BF4D661EEBB0D17828DA0D6CA72866A v38 = self->_has;
    if ((*(unsigned char *)&v38 & 4) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v38 & 0x100) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&v38 & 4) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100) != 0) {
LABEL_60:
  }
    PBDataWriterWriteUint32Field();
LABEL_61:
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v39 = self->_releaseCauseCountConnectedGsms;
  v40 = (char *)[(NSMutableArray *)v39 countByEnumeratingWithState:&v72 objects:v103 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v73;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v73 != v42) {
          objc_enumerationMutation(v39);
        }
        PBDataWriterWriteSubmessage();
        ++v43;
      }
      while (v41 != v43);
      id v41 = (char *)[(NSMutableArray *)v39 countByEnumeratingWithState:&v72 objects:v103 count:16];
    }
    while (v41);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v44 = self->_releaseCauseCountNotConnectedGsms;
  v45 = (char *)[(NSMutableArray *)v44 countByEnumeratingWithState:&v68 objects:v102 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v69;
    do
    {
      id v48 = 0;
      do
      {
        if (*(void *)v69 != v47) {
          objc_enumerationMutation(v44);
        }
        PBDataWriterWriteSubmessage();
        ++v48;
      }
      while (v46 != v48);
      id v46 = (char *)[(NSMutableArray *)v44 countByEnumeratingWithState:&v68 objects:v102 count:16];
    }
    while (v46);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $6BF4D661EEBB0D17828DA0D6CA72866A v49 = self->_has;
    if ((*(_WORD *)&v49 & 0x4000) == 0)
    {
LABEL_77:
      if ((*(unsigned char *)&v49 & 0x10) == 0) {
        goto LABEL_78;
      }
      goto LABEL_113;
    }
  }
  else if ((*(_WORD *)&v49 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  PBDataWriterWriteUint32Field();
  $6BF4D661EEBB0D17828DA0D6CA72866A v49 = self->_has;
  if ((*(unsigned char *)&v49 & 0x10) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v49 & 0x400) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_79:
  }
    PBDataWriterWriteUint32Field();
LABEL_80:
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v50 = self->_releaseCauseCountConnectedWcdmas;
  v51 = (char *)[(NSMutableArray *)v50 countByEnumeratingWithState:&v64 objects:v101 count:16];
  if (v51)
  {
    v52 = v51;
    uint64_t v53 = *(void *)v65;
    do
    {
      v54 = 0;
      do
      {
        if (*(void *)v65 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      v52 = (char *)[(NSMutableArray *)v50 countByEnumeratingWithState:&v64 objects:v101 count:16];
    }
    while (v52);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v55 = self->_releaseCauseCountNotConnectedWcdmas;
  v56 = (char *)[(NSMutableArray *)v55 countByEnumeratingWithState:&v60 objects:v100 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v61;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v61 != v58) {
          objc_enumerationMutation(v55);
        }
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      id v57 = (char *)[(NSMutableArray *)v55 countByEnumeratingWithState:&v60 objects:v100 count:16];
    }
    while (v57);
  }

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 43) |= 1u;
    $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 26) = self->_periodSeconds;
  *((_DWORD *)v4 + 43) |= 0x8000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_72:
    *((_DWORD *)v4 + 12) = self->_numConnectedCallsCdma;
    *((_DWORD *)v4 + 43) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_71:
  *((_DWORD *)v4 + 22) = self->_numTotalCallsCdma;
  *((_DWORD *)v4 + 43) |= 0x800u;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_72;
  }
LABEL_5:
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 18) = self->_numNormalReleaseCallsCdma;
    *((_DWORD *)v4 + 43) |= 0x80u;
  }
LABEL_7:
  uint64_t v50 = v4;
  if ([(CellularCallCount *)self endStatusCountConnectedCdmasCount])
  {
    [v50 clearEndStatusCountConnectedCdmas];
    unint64_t v6 = [(CellularCallCount *)self endStatusCountConnectedCdmasCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularCallCount *)self endStatusCountConnectedCdmaAtIndex:i];
        [v50 addEndStatusCountConnectedCdma:v9];
      }
    }
  }
  if ([(CellularCallCount *)self endStatusCountNotConnectedCdmasCount])
  {
    [v50 clearEndStatusCountNotConnectedCdmas];
    unint64_t v10 = [(CellularCallCount *)self endStatusCountNotConnectedCdmasCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v13 = [(CellularCallCount *)self endStatusCountNotConnectedCdmaAtIndex:j];
        [v50 addEndStatusCountNotConnectedCdma:v13];
      }
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    if ((*(unsigned char *)&v14 & 0x40) == 0) {
      goto LABEL_17;
    }
LABEL_75:
    v50[17] = self->_numMultiRabEverCalls;
    v50[43] |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v50[40] = self->_totalConnectedSecondsCdma;
  v50[43] |= 0x10000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0) {
    goto LABEL_75;
  }
LABEL_17:
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
LABEL_18:
    v50[16] = self->_numMultiRabEndCalls;
    v50[43] |= 0x20u;
  }
LABEL_19:
  if ([(CellularCallCount *)self releaseCauseCountConnectedsCount])
  {
    [v50 clearReleaseCauseCountConnecteds];
    unint64_t v15 = [(CellularCallCount *)self releaseCauseCountConnectedsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        v18 = [(CellularCallCount *)self releaseCauseCountConnectedAtIndex:k];
        [v50 addReleaseCauseCountConnected:v18];
      }
    }
  }
  if ([(CellularCallCount *)self releaseCauseCountNotConnectedsCount])
  {
    [v50 clearReleaseCauseCountNotConnecteds];
    unint64_t v19 = [(CellularCallCount *)self releaseCauseCountNotConnectedsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        id v22 = [(CellularCallCount *)self releaseCauseCountNotConnectedAtIndex:m];
        [v50 addReleaseCauseCountNotConnected:v22];
      }
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x2000) == 0)
  {
    if ((*(unsigned char *)&v23 & 8) == 0) {
      goto LABEL_29;
    }
LABEL_78:
    v50[14] = self->_numConnectedCallsGw;
    v50[43] |= 8u;
    if ((*(_DWORD *)&self->_has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v50[24] = self->_numTotalCallsGw;
  v50[43] |= 0x2000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v23 = self->_has;
  if ((*(unsigned char *)&v23 & 8) != 0) {
    goto LABEL_78;
  }
LABEL_29:
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
LABEL_30:
    v50[20] = self->_numNormalReleaseCallsGw;
    v50[43] |= 0x200u;
  }
LABEL_31:
  if ([(CellularCallCount *)self endStatusCountConnectedGwsCount])
  {
    [v50 clearEndStatusCountConnectedGws];
    unint64_t v24 = [(CellularCallCount *)self endStatusCountConnectedGwsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t n = 0; n != v25; ++n)
      {
        $6BF4D661EEBB0D17828DA0D6CA72866A v27 = [(CellularCallCount *)self endStatusCountConnectedGwAtIndex:n];
        [v50 addEndStatusCountConnectedGw:v27];
      }
    }
  }
  if ([(CellularCallCount *)self endStatusCountNotConnectedGwsCount])
  {
    [v50 clearEndStatusCountNotConnectedGws];
    unint64_t v28 = [(CellularCallCount *)self endStatusCountNotConnectedGwsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (iuint64_t i = 0; ii != v29; ++ii)
      {
        uint64_t v31 = [(CellularCallCount *)self endStatusCountNotConnectedGwAtIndex:ii];
        [v50 addEndStatusCountNotConnectedGw:v31];
      }
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x1000) == 0)
  {
    if ((*(unsigned char *)&v32 & 4) == 0) {
      goto LABEL_41;
    }
LABEL_81:
    v50[13] = self->_numConnectedCallsGsm;
    v50[43] |= 4u;
    if ((*(_DWORD *)&self->_has & 0x100) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  v50[23] = self->_numTotalCallsGsm;
  v50[43] |= 0x1000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v32 = self->_has;
  if ((*(unsigned char *)&v32 & 4) != 0) {
    goto LABEL_81;
  }
LABEL_41:
  if ((*(_WORD *)&v32 & 0x100) != 0)
  {
LABEL_42:
    v50[19] = self->_numNormalReleaseCallsGsm;
    v50[43] |= 0x100u;
  }
LABEL_43:
  if ([(CellularCallCount *)self releaseCauseCountConnectedGsmsCount])
  {
    [v50 clearReleaseCauseCountConnectedGsms];
    unint64_t v33 = [(CellularCallCount *)self releaseCauseCountConnectedGsmsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (juint64_t j = 0; jj != v34; ++jj)
      {
        uint64_t v36 = [(CellularCallCount *)self releaseCauseCountConnectedGsmAtIndex:jj];
        [v50 addReleaseCauseCountConnectedGsm:v36];
      }
    }
  }
  if ([(CellularCallCount *)self releaseCauseCountNotConnectedGsmsCount])
  {
    [v50 clearReleaseCauseCountNotConnectedGsms];
    unint64_t v37 = [(CellularCallCount *)self releaseCauseCountNotConnectedGsmsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (kuint64_t k = 0; kk != v38; ++kk)
      {
        v40 = [(CellularCallCount *)self releaseCauseCountNotConnectedGsmAtIndex:kk];
        [v50 addReleaseCauseCountNotConnectedGsm:v40];
      }
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x20000) != 0)
  {
    v50[41] = self->_totalConnectedSecondsGsm;
    v50[43] |= 0x20000u;
    $6BF4D661EEBB0D17828DA0D6CA72866A v41 = self->_has;
    if ((*(_WORD *)&v41 & 0x4000) == 0)
    {
LABEL_53:
      if ((*(unsigned char *)&v41 & 0x10) == 0) {
        goto LABEL_54;
      }
LABEL_85:
      v50[15] = self->_numConnectedCallsWcdma;
      v50[43] |= 0x10u;
      if ((*(_DWORD *)&self->_has & 0x400) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v41 & 0x4000) == 0)
  {
    goto LABEL_53;
  }
  v50[25] = self->_numTotalCallsWcdma;
  v50[43] |= 0x4000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v41 = self->_has;
  if ((*(unsigned char *)&v41 & 0x10) != 0) {
    goto LABEL_85;
  }
LABEL_54:
  if ((*(_WORD *)&v41 & 0x400) != 0)
  {
LABEL_55:
    v50[21] = self->_numNormalReleaseCallsWcdma;
    v50[43] |= 0x400u;
  }
LABEL_56:
  if ([(CellularCallCount *)self releaseCauseCountConnectedWcdmasCount])
  {
    [v50 clearReleaseCauseCountConnectedWcdmas];
    unint64_t v42 = [(CellularCallCount *)self releaseCauseCountConnectedWcdmasCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (muint64_t m = 0; mm != v43; ++mm)
      {
        v45 = [(CellularCallCount *)self releaseCauseCountConnectedWcdmaAtIndex:mm];
        [v50 addReleaseCauseCountConnectedWcdma:v45];
      }
    }
  }
  if ([(CellularCallCount *)self releaseCauseCountNotConnectedWcdmasCount])
  {
    [v50 clearReleaseCauseCountNotConnectedWcdmas];
    unint64_t v46 = [(CellularCallCount *)self releaseCauseCountNotConnectedWcdmasCount];
    if (v46)
    {
      unint64_t v47 = v46;
      for (nuint64_t n = 0; nn != v47; ++nn)
      {
        $6BF4D661EEBB0D17828DA0D6CA72866A v49 = [(CellularCallCount *)self releaseCauseCountNotConnectedWcdmaAtIndex:nn];
        [v50 addReleaseCauseCountNotConnectedWcdma:v49];
      }
    }
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v50[42] = self->_totalConnectedSecondsWcdma;
    v50[43] |= 0x40000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)v5 + 1) = self->_timestamp;
    v5[43] |= 1u;
    $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v5[26] = self->_periodSeconds;
  v5[43] |= 0x8000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_100;
  }
LABEL_99:
  v5[22] = self->_numTotalCallsCdma;
  v5[43] |= 0x800u;
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_100:
  v5[12] = self->_numConnectedCallsCdma;
  v5[43] |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v5[18] = self->_numNormalReleaseCallsCdma;
    v5[43] |= 0x80u;
  }
LABEL_7:
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v8 = self->_endStatusCountConnectedCdmas;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v111;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v111 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v110 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v6 addEndStatusCountConnectedCdma:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v110 objects:v123 count:16];
    }
    while (v10);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v14 = self->_endStatusCountNotConnectedCdmas;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v106 objects:v122 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v107;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v107 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v106 + 1) + 8 * (void)v18) copyWithZone:a3];
        [v6 addEndStatusCountNotConnectedCdma:v19];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v106 objects:v122 count:16];
    }
    while (v16);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) != 0)
  {
    v6[40] = self->_totalConnectedSecondsCdma;
    v6[43] |= 0x10000u;
    $6BF4D661EEBB0D17828DA0D6CA72866A v20 = self->_has;
    if ((*(unsigned char *)&v20 & 0x40) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&v20 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&v20 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  v6[17] = self->_numMultiRabEverCalls;
  v6[43] |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_24:
    v6[16] = self->_numMultiRabEndCalls;
    v6[43] |= 0x20u;
  }
LABEL_25:
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v21 = self->_releaseCauseCountConnecteds;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v103;
    do
    {
      unint64_t v25 = 0;
      do
      {
        if (*(void *)v103 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v102 + 1) + 8 * (void)v25) copyWithZone:a3];
        [v6 addReleaseCauseCountConnected:v26];

        unint64_t v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v102 objects:v121 count:16];
    }
    while (v23);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v27 = self->_releaseCauseCountNotConnecteds;
  id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v98 objects:v120 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v99;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v99 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = [*(id *)(*((void *)&v98 + 1) + 8 * (void)v31) copyWithZone:a3];
        [v6 addReleaseCauseCountNotConnected:v32];

        uint64_t v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v98 objects:v120 count:16];
    }
    while (v29);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) != 0)
  {
    v6[24] = self->_numTotalCallsGw;
    v6[43] |= 0x2000u;
    $6BF4D661EEBB0D17828DA0D6CA72866A v33 = self->_has;
    if ((*(unsigned char *)&v33 & 8) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v33 & 0x200) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v33 & 8) == 0)
  {
    goto LABEL_41;
  }
  v6[14] = self->_numConnectedCallsGw;
  v6[43] |= 8u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_42:
    v6[20] = self->_numNormalReleaseCallsGw;
    v6[43] |= 0x200u;
  }
LABEL_43:
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  unint64_t v34 = self->_endStatusCountConnectedGws;
  id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v94 objects:v119 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v95;
    do
    {
      unint64_t v38 = 0;
      do
      {
        if (*(void *)v95 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)v38) copyWithZone:a3];
        [v6 addEndStatusCountConnectedGw:v39];

        unint64_t v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      id v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v94 objects:v119 count:16];
    }
    while (v36);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v40 = self->_endStatusCountNotConnectedGws;
  id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v90 objects:v118 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v91;
    do
    {
      v44 = 0;
      do
      {
        if (*(void *)v91 != v43) {
          objc_enumerationMutation(v40);
        }
        id v45 = [*(id *)(*((void *)&v90 + 1) + 8 * (void)v44) copyWithZone:a3];
        [v6 addEndStatusCountNotConnectedGw:v45];

        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v90 objects:v118 count:16];
    }
    while (v42);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x1000) != 0)
  {
    v6[23] = self->_numTotalCallsGsm;
    v6[43] |= 0x1000u;
    $6BF4D661EEBB0D17828DA0D6CA72866A v46 = self->_has;
    if ((*(unsigned char *)&v46 & 4) == 0)
    {
LABEL_59:
      if ((*(_WORD *)&v46 & 0x100) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&v46 & 4) == 0)
  {
    goto LABEL_59;
  }
  v6[13] = self->_numConnectedCallsGsm;
  v6[43] |= 4u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_60:
    v6[19] = self->_numNormalReleaseCallsGsm;
    v6[43] |= 0x100u;
  }
LABEL_61:
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  unint64_t v47 = self->_releaseCauseCountConnectedGsms;
  id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v86 objects:v117 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v87;
    do
    {
      v51 = 0;
      do
      {
        if (*(void *)v87 != v50) {
          objc_enumerationMutation(v47);
        }
        id v52 = [*(id *)(*((void *)&v86 + 1) + 8 * (void)v51) copyWithZone:a3];
        [v6 addReleaseCauseCountConnectedGsm:v52];

        v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v86 objects:v117 count:16];
    }
    while (v49);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v53 = self->_releaseCauseCountNotConnectedGsms;
  id v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v82 objects:v116 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v83;
    do
    {
      id v57 = 0;
      do
      {
        if (*(void *)v83 != v56) {
          objc_enumerationMutation(v53);
        }
        id v58 = [*(id *)(*((void *)&v82 + 1) + 8 * (void)v57) copyWithZone:a3];
        [v6 addReleaseCauseCountNotConnectedGsm:v58];

        id v57 = (char *)v57 + 1;
      }
      while (v55 != v57);
      id v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v82 objects:v116 count:16];
    }
    while (v55);
  }

  $6BF4D661EEBB0D17828DA0D6CA72866A v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x20000) != 0)
  {
    v6[41] = self->_totalConnectedSecondsGsm;
    v6[43] |= 0x20000u;
    $6BF4D661EEBB0D17828DA0D6CA72866A v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x4000) == 0)
    {
LABEL_77:
      if ((*(unsigned char *)&v59 & 0x10) == 0) {
        goto LABEL_78;
      }
      goto LABEL_113;
    }
  }
  else if ((*(_WORD *)&v59 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  v6[25] = self->_numTotalCallsWcdma;
  v6[43] |= 0x4000u;
  $6BF4D661EEBB0D17828DA0D6CA72866A v59 = self->_has;
  if ((*(unsigned char *)&v59 & 0x10) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v59 & 0x400) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_113:
  v6[15] = self->_numConnectedCallsWcdma;
  v6[43] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_79:
    v6[21] = self->_numNormalReleaseCallsWcdma;
    v6[43] |= 0x400u;
  }
LABEL_80:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v60 = self->_releaseCauseCountConnectedWcdmas;
  id v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v78 objects:v115 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v79;
    do
    {
      long long v64 = 0;
      do
      {
        if (*(void *)v79 != v63) {
          objc_enumerationMutation(v60);
        }
        id v65 = [*(id *)(*((void *)&v78 + 1) + 8 * (void)v64) copyWithZone:a3];
        [v6 addReleaseCauseCountConnectedWcdma:v65];

        long long v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      id v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v78 objects:v115 count:16];
    }
    while (v62);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v66 = self->_releaseCauseCountNotConnectedWcdmas;
  id v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v74 objects:v114 count:16];
  if (v67)
  {
    id v68 = v67;
    uint64_t v69 = *(void *)v75;
    do
    {
      long long v70 = 0;
      do
      {
        if (*(void *)v75 != v69) {
          objc_enumerationMutation(v66);
        }
        id v71 = [*(id *)(*((void *)&v74 + 1) + 8 * (void)v70) copyWithZone:a3];
        [v6 addReleaseCauseCountNotConnectedWcdma:v71];

        long long v70 = (char *)v70 + 1;
      }
      while (v68 != v70);
      id v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v74 objects:v114 count:16];
    }
    while (v68);
  }

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v6[42] = self->_totalConnectedSecondsWcdma;
    v6[43] |= 0x40000u;
  }
  long long v72 = v6;

  return v72;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_117;
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  int v6 = *((_DWORD *)v4 + 43);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_117;
    }
  }
  else if (v6)
  {
LABEL_117:
    BOOL v26 = 0;
    goto LABEL_118;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_periodSeconds != *((_DWORD *)v4 + 26)) {
      goto LABEL_117;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_numTotalCallsCdma != *((_DWORD *)v4 + 22)) {
      goto LABEL_117;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numConnectedCallsCdma != *((_DWORD *)v4 + 12)) {
      goto LABEL_117;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_numNormalReleaseCallsCdma != *((_DWORD *)v4 + 18)) {
      goto LABEL_117;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_117;
  }
  endStatusCountConnectedCdmas = self->_endStatusCountConnectedCdmas;
  if ((unint64_t)endStatusCountConnectedCdmas | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](endStatusCountConnectedCdmas, "isEqual:"))
  {
    goto LABEL_117;
  }
  endStatusCountNotConnectedCdmas = self->_endStatusCountNotConnectedCdmas;
  if ((unint64_t)endStatusCountNotConnectedCdmas | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](endStatusCountNotConnectedCdmas, "isEqual:")) {
      goto LABEL_117;
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v9 = self->_has;
  int v10 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_totalConnectedSecondsCdma != *((_DWORD *)v4 + 40)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_numMultiRabEverCalls != *((_DWORD *)v4 + 17)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_numMultiRabEndCalls != *((_DWORD *)v4 + 16)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnecteds = self->_releaseCauseCountConnecteds;
  if ((unint64_t)releaseCauseCountConnecteds | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnecteds, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnecteds = self->_releaseCauseCountNotConnecteds;
  if ((unint64_t)releaseCauseCountNotConnecteds | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnecteds, "isEqual:")) {
      goto LABEL_117;
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 43);
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0 || self->_numTotalCallsGw != *((_DWORD *)v4 + 24)) {
      goto LABEL_117;
    }
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_numConnectedCallsGw != *((_DWORD *)v4 + 14)) {
      goto LABEL_117;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_numNormalReleaseCallsGw != *((_DWORD *)v4 + 20)) {
      goto LABEL_117;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_117;
  }
  endStatusCountConnectedGws = self->_endStatusCountConnectedGws;
  if ((unint64_t)endStatusCountConnectedGws | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](endStatusCountConnectedGws, "isEqual:"))
  {
    goto LABEL_117;
  }
  endStatusCountNotConnectedGws = self->_endStatusCountNotConnectedGws;
  if ((unint64_t)endStatusCountNotConnectedGws | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](endStatusCountNotConnectedGws, "isEqual:")) {
      goto LABEL_117;
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v17 = self->_has;
  int v18 = *((_DWORD *)v4 + 43);
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0 || self->_numTotalCallsGsm != *((_DWORD *)v4 + 23)) {
      goto LABEL_117;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_numConnectedCallsGsm != *((_DWORD *)v4 + 13)) {
      goto LABEL_117;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0 || self->_numNormalReleaseCallsGsm != *((_DWORD *)v4 + 19)) {
      goto LABEL_117;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnectedGsms = self->_releaseCauseCountConnectedGsms;
  if ((unint64_t)releaseCauseCountConnectedGsms | *((void *)v4 + 14)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnectedGsms, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnectedGsms = self->_releaseCauseCountNotConnectedGsms;
  if ((unint64_t)releaseCauseCountNotConnectedGsms | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnectedGsms, "isEqual:")) {
      goto LABEL_117;
    }
  }
  $6BF4D661EEBB0D17828DA0D6CA72866A v21 = self->_has;
  int v22 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&v21 & 0x20000) != 0)
  {
    if ((v22 & 0x20000) == 0 || self->_totalConnectedSecondsGsm != *((_DWORD *)v4 + 41)) {
      goto LABEL_117;
    }
  }
  else if ((v22 & 0x20000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v21 & 0x4000) != 0)
  {
    if ((v22 & 0x4000) == 0 || self->_numTotalCallsWcdma != *((_DWORD *)v4 + 25)) {
      goto LABEL_117;
    }
  }
  else if ((v22 & 0x4000) != 0)
  {
    goto LABEL_117;
  }
  if ((*(unsigned char *)&v21 & 0x10) != 0)
  {
    if ((v22 & 0x10) == 0 || self->_numConnectedCallsWcdma != *((_DWORD *)v4 + 15)) {
      goto LABEL_117;
    }
  }
  else if ((v22 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&v21 & 0x400) != 0)
  {
    if ((v22 & 0x400) == 0 || self->_numNormalReleaseCallsWcdma != *((_DWORD *)v4 + 21)) {
      goto LABEL_117;
    }
  }
  else if ((v22 & 0x400) != 0)
  {
    goto LABEL_117;
  }
  releaseCauseCountConnectedWcdmas = self->_releaseCauseCountConnectedWcdmas;
  if ((unint64_t)releaseCauseCountConnectedWcdmas | *((void *)v4 + 15)
    && !-[NSMutableArray isEqual:](releaseCauseCountConnectedWcdmas, "isEqual:"))
  {
    goto LABEL_117;
  }
  releaseCauseCountNotConnectedWcdmas = self->_releaseCauseCountNotConnectedWcdmas;
  if ((unint64_t)releaseCauseCountNotConnectedWcdmas | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](releaseCauseCountNotConnectedWcdmas, "isEqual:")) {
      goto LABEL_117;
    }
  }
  int v25 = *((_DWORD *)v4 + 43);
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    if ((v25 & 0x40000) == 0 || self->_totalConnectedSecondsWcdma != *((_DWORD *)v4 + 42)) {
      goto LABEL_117;
    }
    BOOL v26 = 1;
  }
  else
  {
    BOOL v26 = (v25 & 0x40000) == 0;
  }
LABEL_118:

  return v26;
}

- (unint64_t)hash
{
  $6BF4D661EEBB0D17828DA0D6CA72866A has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v37 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v36 = 2654435761 * self->_periodSeconds;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v37 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v36 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v35 = 2654435761 * self->_numTotalCallsCdma;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v34 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v34 = 2654435761 * self->_numConnectedCallsCdma;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v33 = 2654435761 * self->_numNormalReleaseCallsCdma;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v33 = 0;
LABEL_12:
  unint64_t v32 = (unint64_t)[(NSMutableArray *)self->_endStatusCountConnectedCdmas hash];
  unint64_t v31 = (unint64_t)[(NSMutableArray *)self->_endStatusCountNotConnectedCdmas hash];
  $6BF4D661EEBB0D17828DA0D6CA72866A v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
  {
    uint64_t v30 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v29 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v30 = 2654435761 * self->_totalConnectedSecondsCdma;
  if ((*(unsigned char *)&v4 & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v29 = 2654435761 * self->_numMultiRabEverCalls;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_15:
    uint64_t v28 = 2654435761 * self->_numMultiRabEndCalls;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v28 = 0;
LABEL_19:
  unint64_t v27 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnecteds hash];
  unint64_t v26 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnecteds hash];
  $6BF4D661EEBB0D17828DA0D6CA72866A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v5 & 8) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v24 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  uint64_t v25 = 2654435761 * self->_numTotalCallsGw;
  if ((*(unsigned char *)&v5 & 8) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v24 = 2654435761 * self->_numConnectedCallsGw;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_22:
    uint64_t v23 = 2654435761 * self->_numNormalReleaseCallsGw;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v23 = 0;
LABEL_26:
  unint64_t v22 = (unint64_t)[(NSMutableArray *)self->_endStatusCountConnectedGws hash];
  unint64_t v21 = (unint64_t)[(NSMutableArray *)self->_endStatusCountNotConnectedGws hash];
  $6BF4D661EEBB0D17828DA0D6CA72866A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
    uint64_t v20 = 0;
    if ((*(unsigned char *)&v6 & 4) != 0) {
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v19 = 0;
    if ((*(_WORD *)&v6 & 0x100) != 0) {
      goto LABEL_29;
    }
    goto LABEL_32;
  }
  uint64_t v20 = 2654435761 * self->_numTotalCallsGsm;
  if ((*(unsigned char *)&v6 & 4) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v19 = 2654435761 * self->_numConnectedCallsGsm;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
LABEL_29:
    uint64_t v18 = 2654435761 * self->_numNormalReleaseCallsGsm;
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v18 = 0;
LABEL_33:
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnectedGsms hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnectedGsms hash];
  $6BF4D661EEBB0D17828DA0D6CA72866A v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    uint64_t v10 = 2654435761 * self->_totalConnectedSecondsGsm;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
    {
LABEL_35:
      uint64_t v11 = 2654435761 * self->_numTotalCallsWcdma;
      if ((*(unsigned char *)&v9 & 0x10) != 0) {
        goto LABEL_36;
      }
LABEL_40:
      uint64_t v12 = 0;
      if ((*(_WORD *)&v9 & 0x400) != 0) {
        goto LABEL_37;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_WORD *)&v9 & 0x4000) != 0) {
      goto LABEL_35;
    }
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&v9 & 0x10) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v12 = 2654435761 * self->_numConnectedCallsWcdma;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_37:
    uint64_t v13 = 2654435761 * self->_numNormalReleaseCallsWcdma;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v13 = 0;
LABEL_42:
  unint64_t v14 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountConnectedWcdmas hash];
  unint64_t v15 = (unint64_t)[(NSMutableArray *)self->_releaseCauseCountNotConnectedWcdmas hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v16 = 2654435761 * self->_totalConnectedSecondsWcdma;
  }
  else {
    uint64_t v16 = 0;
  }
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 43);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 43);
    if ((v6 & 0x8000) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_periodSeconds = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)v4 + 43);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_numTotalCallsCdma = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 43);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_100:
  self->_numConnectedCallsCdma = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 43) & 0x80) != 0)
  {
LABEL_6:
    self->_numNormalReleaseCallsCdma = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_7:
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v98;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v98 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CellularCallCount *)self addEndStatusCountConnectedCdma:*(void *)(*((void *)&v97 + 1) + 8 * (void)v11)];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v9);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v12 = *((id *)v5 + 4);
  id v13 = [v12 countByEnumeratingWithState:&v93 objects:v109 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v94;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v94 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CellularCallCount *)self addEndStatusCountNotConnectedCdma:*(void *)(*((void *)&v93 + 1) + 8 * (void)v16)];
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v93 objects:v109 count:16];
    }
    while (v14);
  }

  int v17 = *((_DWORD *)v5 + 43);
  if ((v17 & 0x10000) != 0)
  {
    self->_totalConnectedSecondsCdma = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v17 = *((_DWORD *)v5 + 43);
    if ((v17 & 0x40) == 0)
    {
LABEL_23:
      if ((v17 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  self->_numMultiRabEverCalls = *((_DWORD *)v5 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 43) & 0x20) != 0)
  {
LABEL_24:
    self->_numMultiRabEndCalls = *((_DWORD *)v5 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_25:
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v18 = *((id *)v5 + 16);
  id v19 = [v18 countByEnumeratingWithState:&v89 objects:v108 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v90;
    do
    {
      unint64_t v22 = 0;
      do
      {
        if (*(void *)v90 != v21) {
          objc_enumerationMutation(v18);
        }
        [(CellularCallCount *)self addReleaseCauseCountConnected:*(void *)(*((void *)&v89 + 1) + 8 * (void)v22)];
        unint64_t v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v89 objects:v108 count:16];
    }
    while (v20);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v23 = *((id *)v5 + 19);
  id v24 = [v23 countByEnumeratingWithState:&v85 objects:v107 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v86;
    do
    {
      unint64_t v27 = 0;
      do
      {
        if (*(void *)v86 != v26) {
          objc_enumerationMutation(v23);
        }
        [(CellularCallCount *)self addReleaseCauseCountNotConnected:*(void *)(*((void *)&v85 + 1) + 8 * (void)v27)];
        unint64_t v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v85 objects:v107 count:16];
    }
    while (v25);
  }

  int v28 = *((_DWORD *)v5 + 43);
  if ((v28 & 0x2000) != 0)
  {
    self->_numTotalCallsGw = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v28 = *((_DWORD *)v5 + 43);
    if ((v28 & 8) == 0)
    {
LABEL_41:
      if ((v28 & 0x200) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v28 & 8) == 0)
  {
    goto LABEL_41;
  }
  self->_numConnectedCallsGw = *((_DWORD *)v5 + 14);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v5 + 43) & 0x200) != 0)
  {
LABEL_42:
    self->_numNormalReleaseCallsGw = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_43:
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v29 = *((id *)v5 + 3);
  id v30 = [v29 countByEnumeratingWithState:&v81 objects:v106 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v82;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v82 != v32) {
          objc_enumerationMutation(v29);
        }
        [(CellularCallCount *)self addEndStatusCountConnectedGw:*(void *)(*((void *)&v81 + 1) + 8 * (void)v33)];
        uint64_t v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      id v31 = [v29 countByEnumeratingWithState:&v81 objects:v106 count:16];
    }
    while (v31);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v34 = *((id *)v5 + 5);
  id v35 = [v34 countByEnumeratingWithState:&v77 objects:v105 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v78;
    do
    {
      unint64_t v38 = 0;
      do
      {
        if (*(void *)v78 != v37) {
          objc_enumerationMutation(v34);
        }
        [(CellularCallCount *)self addEndStatusCountNotConnectedGw:*(void *)(*((void *)&v77 + 1) + 8 * (void)v38)];
        unint64_t v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      id v36 = [v34 countByEnumeratingWithState:&v77 objects:v105 count:16];
    }
    while (v36);
  }

  int v39 = *((_DWORD *)v5 + 43);
  if ((v39 & 0x1000) != 0)
  {
    self->_numTotalCallsGsuint64_t m = *((_DWORD *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v39 = *((_DWORD *)v5 + 43);
    if ((v39 & 4) == 0)
    {
LABEL_59:
      if ((v39 & 0x100) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((v39 & 4) == 0)
  {
    goto LABEL_59;
  }
  self->_numConnectedCallsGsuint64_t m = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v5 + 43) & 0x100) != 0)
  {
LABEL_60:
    self->_numNormalReleaseCallsGsuint64_t m = *((_DWORD *)v5 + 19);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_61:
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v40 = *((id *)v5 + 14);
  id v41 = [v40 countByEnumeratingWithState:&v73 objects:v104 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v74;
    do
    {
      v44 = 0;
      do
      {
        if (*(void *)v74 != v43) {
          objc_enumerationMutation(v40);
        }
        [(CellularCallCount *)self addReleaseCauseCountConnectedGsm:*(void *)(*((void *)&v73 + 1) + 8 * (void)v44)];
        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      id v42 = [v40 countByEnumeratingWithState:&v73 objects:v104 count:16];
    }
    while (v42);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v45 = *((id *)v5 + 17);
  id v46 = [v45 countByEnumeratingWithState:&v69 objects:v103 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v70;
    do
    {
      id v49 = 0;
      do
      {
        if (*(void *)v70 != v48) {
          objc_enumerationMutation(v45);
        }
        [(CellularCallCount *)self addReleaseCauseCountNotConnectedGsm:*(void *)(*((void *)&v69 + 1) + 8 * (void)v49)];
        id v49 = (char *)v49 + 1;
      }
      while (v47 != v49);
      id v47 = [v45 countByEnumeratingWithState:&v69 objects:v103 count:16];
    }
    while (v47);
  }

  int v50 = *((_DWORD *)v5 + 43);
  if ((v50 & 0x20000) != 0)
  {
    self->_totalConnectedSecondsGsuint64_t m = *((_DWORD *)v5 + 41);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v50 = *((_DWORD *)v5 + 43);
    if ((v50 & 0x4000) == 0)
    {
LABEL_77:
      if ((v50 & 0x10) == 0) {
        goto LABEL_78;
      }
      goto LABEL_113;
    }
  }
  else if ((v50 & 0x4000) == 0)
  {
    goto LABEL_77;
  }
  self->_numTotalCallsWcdma = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v50 = *((_DWORD *)v5 + 43);
  if ((v50 & 0x10) == 0)
  {
LABEL_78:
    if ((v50 & 0x400) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_113:
  self->_numConnectedCallsWcdma = *((_DWORD *)v5 + 15);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 43) & 0x400) != 0)
  {
LABEL_79:
    self->_numNormalReleaseCallsWcdma = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_80:
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v51 = *((id *)v5 + 15);
  id v52 = [v51 countByEnumeratingWithState:&v65 objects:v102 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v66;
    do
    {
      id v55 = 0;
      do
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v51);
        }
        [(CellularCallCount *)self addReleaseCauseCountConnectedWcdma:*(void *)(*((void *)&v65 + 1) + 8 * (void)v55)];
        id v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      id v53 = [v51 countByEnumeratingWithState:&v65 objects:v102 count:16];
    }
    while (v53);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v56 = *((id *)v5 + 18);
  id v57 = [v56 countByEnumeratingWithState:&v61 objects:v101 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v62;
    do
    {
      long long v60 = 0;
      do
      {
        if (*(void *)v62 != v59) {
          objc_enumerationMutation(v56);
        }
        -[CellularCallCount addReleaseCauseCountNotConnectedWcdma:](self, "addReleaseCauseCountNotConnectedWcdma:", *(void *)(*((void *)&v61 + 1) + 8 * (void)v60), (void)v61);
        long long v60 = (char *)v60 + 1;
      }
      while (v58 != v60);
      id v58 = [v56 countByEnumeratingWithState:&v61 objects:v101 count:16];
    }
    while (v58);
  }

  if ((*((unsigned char *)v5 + 174) & 4) != 0)
  {
    self->_totalConnectedSecondsWcdma = *((_DWORD *)v5 + 42);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)periodSeconds
{
  return self->_periodSeconds;
}

- (unsigned)numTotalCallsCdma
{
  return self->_numTotalCallsCdma;
}

- (unsigned)numConnectedCallsCdma
{
  return self->_numConnectedCallsCdma;
}

- (unsigned)numNormalReleaseCallsCdma
{
  return self->_numNormalReleaseCallsCdma;
}

- (NSMutableArray)endStatusCountConnectedCdmas
{
  return self->_endStatusCountConnectedCdmas;
}

- (void)setEndStatusCountConnectedCdmas:(id)a3
{
}

- (NSMutableArray)endStatusCountNotConnectedCdmas
{
  return self->_endStatusCountNotConnectedCdmas;
}

- (void)setEndStatusCountNotConnectedCdmas:(id)a3
{
}

- (unsigned)totalConnectedSecondsCdma
{
  return self->_totalConnectedSecondsCdma;
}

- (unsigned)numTotalCallsGw
{
  return self->_numTotalCallsGw;
}

- (unsigned)numConnectedCallsGw
{
  return self->_numConnectedCallsGw;
}

- (unsigned)numNormalReleaseCallsGw
{
  return self->_numNormalReleaseCallsGw;
}

- (NSMutableArray)endStatusCountConnectedGws
{
  return self->_endStatusCountConnectedGws;
}

- (void)setEndStatusCountConnectedGws:(id)a3
{
}

- (NSMutableArray)endStatusCountNotConnectedGws
{
  return self->_endStatusCountNotConnectedGws;
}

- (void)setEndStatusCountNotConnectedGws:(id)a3
{
}

- (unsigned)numMultiRabEverCalls
{
  return self->_numMultiRabEverCalls;
}

- (unsigned)numMultiRabEndCalls
{
  return self->_numMultiRabEndCalls;
}

- (NSMutableArray)releaseCauseCountConnecteds
{
  return self->_releaseCauseCountConnecteds;
}

- (void)setReleaseCauseCountConnecteds:(id)a3
{
}

- (NSMutableArray)releaseCauseCountNotConnecteds
{
  return self->_releaseCauseCountNotConnecteds;
}

- (void)setReleaseCauseCountNotConnecteds:(id)a3
{
}

- (unsigned)numTotalCallsGsm
{
  return self->_numTotalCallsGsm;
}

- (unsigned)numConnectedCallsGsm
{
  return self->_numConnectedCallsGsm;
}

- (unsigned)numNormalReleaseCallsGsm
{
  return self->_numNormalReleaseCallsGsm;
}

- (NSMutableArray)releaseCauseCountConnectedGsms
{
  return self->_releaseCauseCountConnectedGsms;
}

- (void)setReleaseCauseCountConnectedGsms:(id)a3
{
}

- (NSMutableArray)releaseCauseCountNotConnectedGsms
{
  return self->_releaseCauseCountNotConnectedGsms;
}

- (void)setReleaseCauseCountNotConnectedGsms:(id)a3
{
}

- (unsigned)totalConnectedSecondsGsm
{
  return self->_totalConnectedSecondsGsm;
}

- (unsigned)numTotalCallsWcdma
{
  return self->_numTotalCallsWcdma;
}

- (unsigned)numConnectedCallsWcdma
{
  return self->_numConnectedCallsWcdma;
}

- (unsigned)numNormalReleaseCallsWcdma
{
  return self->_numNormalReleaseCallsWcdma;
}

- (NSMutableArray)releaseCauseCountConnectedWcdmas
{
  return self->_releaseCauseCountConnectedWcdmas;
}

- (void)setReleaseCauseCountConnectedWcdmas:(id)a3
{
}

- (NSMutableArray)releaseCauseCountNotConnectedWcdmas
{
  return self->_releaseCauseCountNotConnectedWcdmas;
}

- (void)setReleaseCauseCountNotConnectedWcdmas:(id)a3
{
}

- (unsigned)totalConnectedSecondsWcdma
{
  return self->_totalConnectedSecondsWcdma;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnecteds, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedWcdmas, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountNotConnectedGsms, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnecteds, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedWcdmas, 0);
  objc_storeStrong((id *)&self->_releaseCauseCountConnectedGsms, 0);
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedGws, 0);
  objc_storeStrong((id *)&self->_endStatusCountNotConnectedCdmas, 0);
  objc_storeStrong((id *)&self->_endStatusCountConnectedGws, 0);

  objc_storeStrong((id *)&self->_endStatusCountConnectedCdmas, 0);
}

@end