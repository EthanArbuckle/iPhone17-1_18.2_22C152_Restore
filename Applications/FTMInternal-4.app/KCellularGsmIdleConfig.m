@interface KCellularGsmIdleConfig
- (BOOL)hasAcc;
- (BOOL)hasAccessTech;
- (BOOL)hasArfcnBcch;
- (BOOL)hasAttachAllowed;
- (BOOL)hasBsPaMfrms;
- (BOOL)hasBsic;
- (BOOL)hasC2Valid;
- (BOOL)hasCba;
- (BOOL)hasCbchSupported;
- (BOOL)hasCbq;
- (BOOL)hasCi;
- (BOOL)hasCrOffset;
- (BOOL)hasCsPagemode;
- (BOOL)hasDtxFromBs;
- (BOOL)hasEcsc;
- (BOOL)hasEmergCallAllowed;
- (BOOL)hasGsmBand;
- (BOOL)hasHalfRateSupported;
- (BOOL)hasLac;
- (BOOL)hasMaxRetransCs;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasMsTxpwr;
- (BOOL)hasMultibRep;
- (BOOL)hasPenaltyT;
- (BOOL)hasRadioLinkTimeout;
- (BOOL)hasReestAllowed;
- (BOOL)hasRxAccMin;
- (BOOL)hasSi2TerNeeded;
- (BOOL)hasSi78Broadcast;
- (BOOL)hasSubsId;
- (BOOL)hasT3212;
- (BOOL)hasTimestamp;
- (BOOL)hasTmpOffset;
- (BOOL)hasTypeOfCurChan;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)acc;
- (unsigned)accessTech;
- (unsigned)arfcnBcch;
- (unsigned)attachAllowed;
- (unsigned)bsPaMfrms;
- (unsigned)bsic;
- (unsigned)c2Valid;
- (unsigned)cba;
- (unsigned)cbchSupported;
- (unsigned)cbq;
- (unsigned)ci;
- (unsigned)crOffset;
- (unsigned)csPagemode;
- (unsigned)dtxFromBs;
- (unsigned)ecsc;
- (unsigned)emergCallAllowed;
- (unsigned)gsmBand;
- (unsigned)halfRateSupported;
- (unsigned)lac;
- (unsigned)maxRetransCs;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)msTxpwr;
- (unsigned)multibRep;
- (unsigned)penaltyT;
- (unsigned)radioLinkTimeout;
- (unsigned)reestAllowed;
- (unsigned)rxAccMin;
- (unsigned)si2TerNeeded;
- (unsigned)si78Broadcast;
- (unsigned)subsId;
- (unsigned)t3212;
- (unsigned)tmpOffset;
- (unsigned)typeOfCurChan;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcc:(unsigned int)a3;
- (void)setAccessTech:(unsigned int)a3;
- (void)setArfcnBcch:(unsigned int)a3;
- (void)setAttachAllowed:(unsigned int)a3;
- (void)setBsPaMfrms:(unsigned int)a3;
- (void)setBsic:(unsigned int)a3;
- (void)setC2Valid:(unsigned int)a3;
- (void)setCba:(unsigned int)a3;
- (void)setCbchSupported:(unsigned int)a3;
- (void)setCbq:(unsigned int)a3;
- (void)setCi:(unsigned int)a3;
- (void)setCrOffset:(unsigned int)a3;
- (void)setCsPagemode:(unsigned int)a3;
- (void)setDtxFromBs:(unsigned int)a3;
- (void)setEcsc:(unsigned int)a3;
- (void)setEmergCallAllowed:(unsigned int)a3;
- (void)setGsmBand:(unsigned int)a3;
- (void)setHalfRateSupported:(unsigned int)a3;
- (void)setHasAcc:(BOOL)a3;
- (void)setHasAccessTech:(BOOL)a3;
- (void)setHasArfcnBcch:(BOOL)a3;
- (void)setHasAttachAllowed:(BOOL)a3;
- (void)setHasBsPaMfrms:(BOOL)a3;
- (void)setHasBsic:(BOOL)a3;
- (void)setHasC2Valid:(BOOL)a3;
- (void)setHasCba:(BOOL)a3;
- (void)setHasCbchSupported:(BOOL)a3;
- (void)setHasCbq:(BOOL)a3;
- (void)setHasCi:(BOOL)a3;
- (void)setHasCrOffset:(BOOL)a3;
- (void)setHasCsPagemode:(BOOL)a3;
- (void)setHasDtxFromBs:(BOOL)a3;
- (void)setHasEcsc:(BOOL)a3;
- (void)setHasEmergCallAllowed:(BOOL)a3;
- (void)setHasGsmBand:(BOOL)a3;
- (void)setHasHalfRateSupported:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasMaxRetransCs:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasMsTxpwr:(BOOL)a3;
- (void)setHasMultibRep:(BOOL)a3;
- (void)setHasPenaltyT:(BOOL)a3;
- (void)setHasRadioLinkTimeout:(BOOL)a3;
- (void)setHasReestAllowed:(BOOL)a3;
- (void)setHasRxAccMin:(BOOL)a3;
- (void)setHasSi2TerNeeded:(BOOL)a3;
- (void)setHasSi78Broadcast:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasT3212:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTmpOffset:(BOOL)a3;
- (void)setHasTypeOfCurChan:(BOOL)a3;
- (void)setLac:(unsigned int)a3;
- (void)setMaxRetransCs:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setMsTxpwr:(unsigned int)a3;
- (void)setMultibRep:(unsigned int)a3;
- (void)setPenaltyT:(unsigned int)a3;
- (void)setRadioLinkTimeout:(unsigned int)a3;
- (void)setReestAllowed:(unsigned int)a3;
- (void)setRxAccMin:(unsigned int)a3;
- (void)setSi2TerNeeded:(unsigned int)a3;
- (void)setSi78Broadcast:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setT3212:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTmpOffset:(unsigned int)a3;
- (void)setTypeOfCurChan:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmIdleConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setArfcnBcch:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_arfcnBcch = a3;
}

- (void)setHasArfcnBcch:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasArfcnBcch
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMnc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCi:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_ci = a3;
}

- (void)setHasCi:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBsic
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDtxFromBs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_dtxFromBs = a3;
}

- (void)setHasDtxFromBs:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDtxFromBs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRadioLinkTimeout:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_radioLinkTimeout = a3;
}

- (void)setHasRadioLinkTimeout:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRadioLinkTimeout
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMultibRep:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_multibRep = a3;
}

- (void)setHasMultibRep:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMultibRep
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setGsmBand:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasGsmBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAccessTech:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_accessTech = a3;
}

- (void)setHasAccessTech:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAccessTech
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTypeOfCurChan:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_typeOfCurChan = a3;
}

- (void)setHasTypeOfCurChan:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTypeOfCurChan
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setMsTxpwr:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_msTxpwr = a3;
}

- (void)setHasMsTxpwr:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMsTxpwr
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRxAccMin:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_rxAccMin = a3;
}

- (void)setHasRxAccMin:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRxAccMin
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCbq:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cbq = a3;
}

- (void)setHasCbq:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCbq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCba:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cba = a3;
}

- (void)setHasCba:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCba
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setC2Valid:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_c2Valid = a3;
}

- (void)setHasC2Valid:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasC2Valid
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCrOffset:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_crOffset = a3;
}

- (void)setHasCrOffset:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCrOffset
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTmpOffset:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_tmpOffset = a3;
}

- (void)setHasTmpOffset:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTmpOffset
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setPenaltyT:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_penaltyT = a3;
}

- (void)setHasPenaltyT:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPenaltyT
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setT3212:(unsigned int)a3
{
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_t3212 = a3;
}

- (void)setHasT3212:(BOOL)a3
{
  uint64_t v3 = &_mh_execute_header;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasT3212
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setAcc:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_acc = a3;
}

- (void)setHasAcc:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAcc
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBsPaMfrms:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bsPaMfrms = a3;
}

- (void)setHasBsPaMfrms:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBsPaMfrms
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCsPagemode:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_csPagemode = a3;
}

- (void)setHasCsPagemode:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCsPagemode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMaxRetransCs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_maxRetransCs = a3;
}

- (void)setHasMaxRetransCs:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMaxRetransCs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEmergCallAllowed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_emergCallAllowed = a3;
}

- (void)setHasEmergCallAllowed:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEmergCallAllowed
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAttachAllowed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_attachAllowed = a3;
}

- (void)setHasAttachAllowed:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAttachAllowed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHalfRateSupported:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_halfRateSupported = a3;
}

- (void)setHasHalfRateSupported:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHalfRateSupported
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSi78Broadcast:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_si78Broadcast = a3;
}

- (void)setHasSi78Broadcast:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSi78Broadcast
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCbchSupported:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_cbchSupported = a3;
}

- (void)setHasCbchSupported:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCbchSupported
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setReestAllowed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_reestAllowed = a3;
}

- (void)setHasReestAllowed:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasReestAllowed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEcsc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_ecsc = a3;
}

- (void)setHasEcsc:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEcsc
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSi2TerNeeded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_si2TerNeeded = a3;
}

- (void)setHasSi2TerNeeded:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSi2TerNeeded
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2B3023E7572ED387A2CBD1C46DAF5B75)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularGsmIdleConfig;
  uint64_t v3 = [(KCellularGsmIdleConfig *)&v7 description];
  v4 = [(KCellularGsmIdleConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithUnsignedInt:self->_arfcnBcch];
  [v3 setObject:v9 forKey:@"arfcn_bcch"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  v10 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v10 forKey:@"mcc"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  v11 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v11 forKey:@"mnc"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  v12 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v12 forKey:@"lac"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  v13 = +[NSNumber numberWithUnsignedInt:self->_ci];
  [v3 setObject:v13 forKey:@"ci"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  v14 = +[NSNumber numberWithUnsignedInt:self->_bsic];
  [v3 setObject:v14 forKey:@"bsic"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  v15 = +[NSNumber numberWithUnsignedInt:self->_dtxFromBs];
  [v3 setObject:v15 forKey:@"dtx_from_bs"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  v16 = +[NSNumber numberWithUnsignedInt:self->_radioLinkTimeout];
  [v3 setObject:v16 forKey:@"radio_link_timeout"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  v17 = +[NSNumber numberWithUnsignedInt:self->_multibRep];
  [v3 setObject:v17 forKey:@"multib_rep"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  v18 = +[NSNumber numberWithUnsignedInt:self->_gsmBand];
  [v3 setObject:v18 forKey:@"gsm_band"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  v19 = +[NSNumber numberWithUnsignedInt:self->_accessTech];
  [v3 setObject:v19 forKey:@"access_tech"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  v20 = +[NSNumber numberWithUnsignedInt:self->_typeOfCurChan];
  [v3 setObject:v20 forKey:@"type_of_cur_chan"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  v21 = +[NSNumber numberWithUnsignedInt:self->_msTxpwr];
  [v3 setObject:v21 forKey:@"ms_txpwr"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  v22 = +[NSNumber numberWithUnsignedInt:self->_rxAccMin];
  [v3 setObject:v22 forKey:@"rx_acc_min"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  v23 = +[NSNumber numberWithUnsignedInt:self->_cbq];
  [v3 setObject:v23 forKey:@"cbq"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  v24 = +[NSNumber numberWithUnsignedInt:self->_cba];
  [v3 setObject:v24 forKey:@"cba"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  v25 = +[NSNumber numberWithUnsignedInt:self->_c2Valid];
  [v3 setObject:v25 forKey:@"c2_valid"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  v26 = +[NSNumber numberWithUnsignedInt:self->_crOffset];
  [v3 setObject:v26 forKey:@"cr_offset"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  v27 = +[NSNumber numberWithUnsignedInt:self->_tmpOffset];
  [v3 setObject:v27 forKey:@"tmp_offset"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  v28 = +[NSNumber numberWithUnsignedInt:self->_penaltyT];
  [v3 setObject:v28 forKey:@"penalty_t"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  v29 = +[NSNumber numberWithUnsignedInt:self->_t3212];
  [v3 setObject:v29 forKey:@"t3212"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  v30 = +[NSNumber numberWithUnsignedInt:self->_acc];
  [v3 setObject:v30 forKey:@"acc"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  v31 = +[NSNumber numberWithUnsignedInt:self->_bsPaMfrms];
  [v3 setObject:v31 forKey:@"bs_pa_mfrms"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  v32 = +[NSNumber numberWithUnsignedInt:self->_csPagemode];
  [v3 setObject:v32 forKey:@"cs_pagemode"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  v33 = +[NSNumber numberWithUnsignedInt:self->_maxRetransCs];
  [v3 setObject:v33 forKey:@"max_retrans_cs"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  v34 = +[NSNumber numberWithUnsignedInt:self->_emergCallAllowed];
  [v3 setObject:v34 forKey:@"emerg_call_allowed"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  v35 = +[NSNumber numberWithUnsignedInt:self->_attachAllowed];
  [v3 setObject:v35 forKey:@"attach_allowed"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  v36 = +[NSNumber numberWithUnsignedInt:self->_halfRateSupported];
  [v3 setObject:v36 forKey:@"half_rate_supported"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  v37 = +[NSNumber numberWithUnsignedInt:self->_si78Broadcast];
  [v3 setObject:v37 forKey:@"si_7_8_broadcast"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  v38 = +[NSNumber numberWithUnsignedInt:self->_cbchSupported];
  [v3 setObject:v38 forKey:@"cbch_supported"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  v39 = +[NSNumber numberWithUnsignedInt:self->_reestAllowed];
  [v3 setObject:v39 forKey:@"reest_allowed"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_35;
    }
LABEL_71:
    v41 = +[NSNumber numberWithUnsignedInt:self->_si2TerNeeded];
    [v3 setObject:v41 forKey:@"si_2_ter_needed"];

    if ((*(void *)&self->_has & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_70:
  v40 = +[NSNumber numberWithUnsignedInt:self->_ecsc];
  [v3 setObject:v40 forKey:@"ecsc"];

  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
    goto LABEL_71;
  }
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_36:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_37:
  id v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000790E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x80000000) != 0) {
LABEL_36:
  }
    PBDataWriterWriteUint32Field();
LABEL_37:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    v4[19] |= 1uLL;
    $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_arfcnBcch;
  v4[19] |= 8uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 24) = self->_mcc;
  v4[19] |= 0x200000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 25) = self->_mnc;
  v4[19] |= 0x400000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 22) = self->_lac;
  v4[19] |= 0x80000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 14) = self->_ci;
  v4[19] |= 0x800uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 9) = self->_bsic;
  v4[19] |= 0x40uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 17) = self->_dtxFromBs;
  v4[19] |= 0x4000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 29) = self->_radioLinkTimeout;
  v4[19] |= 0x4000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 27) = self->_multibRep;
  v4[19] |= 0x1000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 20) = self->_gsmBand;
  v4[19] |= 0x20000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 5) = self->_accessTech;
  v4[19] |= 4uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 37) = self->_typeOfCurChan;
  v4[19] |= 0x400000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 26) = self->_msTxpwr;
  v4[19] |= 0x800000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 31) = self->_rxAccMin;
  v4[19] |= 0x10000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 13) = self->_cbq;
  v4[19] |= 0x400uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 11) = self->_cba;
  v4[19] |= 0x100uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 10) = self->_c2Valid;
  v4[19] |= 0x80uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 15) = self->_crOffset;
  v4[19] |= 0x1000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 36) = self->_tmpOffset;
  v4[19] |= 0x200000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 28) = self->_penaltyT;
  v4[19] |= 0x2000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 35) = self->_t3212;
  v4[19] |= (unint64_t)&_mh_execute_header;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 4) = self->_acc;
  v4[19] |= 2uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 8) = self->_bsPaMfrms;
  v4[19] |= 0x20uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 16) = self->_csPagemode;
  v4[19] |= 0x2000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 23) = self->_maxRetransCs;
  v4[19] |= 0x100000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 19) = self->_emergCallAllowed;
  v4[19] |= 0x10000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 7) = self->_attachAllowed;
  v4[19] |= 0x10uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 21) = self->_halfRateSupported;
  v4[19] |= 0x40000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 33) = self->_si78Broadcast;
  v4[19] |= 0x40000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 12) = self->_cbchSupported;
  v4[19] |= 0x200uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 30) = self->_reestAllowed;
  v4[19] |= 0x8000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 18) = self->_ecsc;
  v4[19] |= 0x8000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_73:
  *((_DWORD *)v4 + 32) = self->_si2TerNeeded;
  v4[19] |= 0x20000000uLL;
  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_36:
    *((_DWORD *)v4 + 34) = self->_subsId;
    v4[19] |= 0x80000000uLL;
  }
LABEL_37:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    v4[19] |= 1uLL;
    $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_arfcnBcch;
  v4[19] |= 8uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 24) = self->_mcc;
  v4[19] |= 0x200000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 25) = self->_mnc;
  v4[19] |= 0x400000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 22) = self->_lac;
  v4[19] |= 0x80000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 14) = self->_ci;
  v4[19] |= 0x800uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 9) = self->_bsic;
  v4[19] |= 0x40uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = self->_dtxFromBs;
  v4[19] |= 0x4000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 29) = self->_radioLinkTimeout;
  v4[19] |= 0x4000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 27) = self->_multibRep;
  v4[19] |= 0x1000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 20) = self->_gsmBand;
  v4[19] |= 0x20000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 5) = self->_accessTech;
  v4[19] |= 4uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 37) = self->_typeOfCurChan;
  v4[19] |= 0x400000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 26) = self->_msTxpwr;
  v4[19] |= 0x800000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 31) = self->_rxAccMin;
  v4[19] |= 0x10000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 13) = self->_cbq;
  v4[19] |= 0x400uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 11) = self->_cba;
  v4[19] |= 0x100uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 10) = self->_c2Valid;
  v4[19] |= 0x80uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 15) = self->_crOffset;
  v4[19] |= 0x1000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 36) = self->_tmpOffset;
  v4[19] |= 0x200000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 28) = self->_penaltyT;
  v4[19] |= 0x2000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 35) = self->_t3212;
  v4[19] |= (unint64_t)&_mh_execute_header;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 4) = self->_acc;
  v4[19] |= 2uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 8) = self->_bsPaMfrms;
  v4[19] |= 0x20uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 16) = self->_csPagemode;
  v4[19] |= 0x2000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 23) = self->_maxRetransCs;
  v4[19] |= 0x100000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 19) = self->_emergCallAllowed;
  v4[19] |= 0x10000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 7) = self->_attachAllowed;
  v4[19] |= 0x10uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 21) = self->_halfRateSupported;
  v4[19] |= 0x40000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 33) = self->_si78Broadcast;
  v4[19] |= 0x40000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 12) = self->_cbchSupported;
  v4[19] |= 0x200uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 30) = self->_reestAllowed;
  v4[19] |= 0x8000000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_35;
    }
LABEL_71:
    *((_DWORD *)v4 + 32) = self->_si2TerNeeded;
    v4[19] |= 0x20000000uLL;
    if ((*(void *)&self->_has & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_70:
  *((_DWORD *)v4 + 18) = self->_ecsc;
  v4[19] |= 0x8000uLL;
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
    goto LABEL_71;
  }
LABEL_35:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_36:
    *((_DWORD *)v4 + 34) = self->_subsId;
    v4[19] |= 0x80000000uLL;
  }
LABEL_37:
  id v6 = v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_177;
  }
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  uint64_t v6 = *((void *)v4 + 19);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_177;
    }
  }
  else if (v6)
  {
LABEL_177:
    BOOL v7 = 0;
    goto LABEL_178;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_arfcnBcch != *((_DWORD *)v4 + 6)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_mcc != *((_DWORD *)v4 + 24)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_mnc != *((_DWORD *)v4 + 25)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_lac != *((_DWORD *)v4 + 22)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_ci != *((_DWORD *)v4 + 14)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_bsic != *((_DWORD *)v4 + 9)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_dtxFromBs != *((_DWORD *)v4 + 17)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_radioLinkTimeout != *((_DWORD *)v4 + 29)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_multibRep != *((_DWORD *)v4 + 27)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_gsmBand != *((_DWORD *)v4 + 20)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_accessTech != *((_DWORD *)v4 + 5)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_177;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_typeOfCurChan != *((_DWORD *)v4 + 37)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_msTxpwr != *((_DWORD *)v4 + 26)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_rxAccMin != *((_DWORD *)v4 + 31)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_cbq != *((_DWORD *)v4 + 13)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_cba != *((_DWORD *)v4 + 11)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_c2Valid != *((_DWORD *)v4 + 10)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_crOffset != *((_DWORD *)v4 + 15)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_tmpOffset != *((_DWORD *)v4 + 36)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_penaltyT != *((_DWORD *)v4 + 28)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_t3212 != *((_DWORD *)v4 + 35)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_acc != *((_DWORD *)v4 + 4)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_bsPaMfrms != *((_DWORD *)v4 + 8)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_csPagemode != *((_DWORD *)v4 + 16)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_maxRetransCs != *((_DWORD *)v4 + 23)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_emergCallAllowed != *((_DWORD *)v4 + 19)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_attachAllowed != *((_DWORD *)v4 + 7)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_halfRateSupported != *((_DWORD *)v4 + 21)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_si78Broadcast != *((_DWORD *)v4 + 33)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_cbchSupported != *((_DWORD *)v4 + 12)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_reestAllowed != *((_DWORD *)v4 + 30)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_ecsc != *((_DWORD *)v4 + 18)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_si2TerNeeded != *((_DWORD *)v4 + 32)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 34)) {
      goto LABEL_177;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (int)v6 >= 0;
  }
LABEL_178:

  return v7;
}

- (unint64_t)hash
{
  $2B3023E7572ED387A2CBD1C46DAF5B75 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v38 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761 * self->_arfcnBcch;
      if ((*(_DWORD *)&has & 0x200000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else
  {
    unint64_t v38 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    uint64_t v35 = 2654435761 * self->_mnc;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_6:
    uint64_t v34 = 2654435761 * self->_lac;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v34 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v33 = 2654435761 * self->_ci;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v33 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v32 = 2654435761 * self->_bsic;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v32 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v31 = 2654435761 * self->_dtxFromBs;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_10:
    uint64_t v30 = 2654435761 * self->_radioLinkTimeout;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    uint64_t v3 = 2654435761 * self->_multibRep;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v3 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    uint64_t v4 = 2654435761 * self->_gsmBand;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_13:
    uint64_t v5 = 2654435761 * self->_accessTech;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v5 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_14:
    uint64_t v6 = 2654435761 * self->_typeOfCurChan;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_15:
    uint64_t v7 = 2654435761 * self->_msTxpwr;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_16:
    uint64_t v8 = 2654435761 * self->_rxAccMin;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    uint64_t v9 = 2654435761 * self->_cbq;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_18:
    uint64_t v10 = 2654435761 * self->_cba;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_19:
    uint64_t v11 = 2654435761 * self->_c2Valid;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_20:
    uint64_t v12 = 2654435761 * self->_crOffset;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v12 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_21:
    uint64_t v13 = 2654435761 * self->_tmpOffset;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_22:
    uint64_t v14 = 2654435761 * self->_penaltyT;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v14 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_23:
    uint64_t v15 = 2654435761 * self->_t3212;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_24:
    uint64_t v16 = 2654435761 * self->_acc;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_25:
    uint64_t v17 = 2654435761 * self->_bsPaMfrms;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    uint64_t v18 = 2654435761 * self->_csPagemode;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_27:
    uint64_t v19 = 2654435761 * self->_maxRetransCs;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_28:
    uint64_t v20 = 2654435761 * self->_emergCallAllowed;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_29:
    uint64_t v21 = 2654435761 * self->_attachAllowed;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_30:
    uint64_t v22 = 2654435761 * self->_halfRateSupported;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_31:
    uint64_t v23 = 2654435761 * self->_si78Broadcast;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_32:
    uint64_t v24 = 2654435761 * self->_cbchSupported;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_33:
    uint64_t v25 = 2654435761 * self->_reestAllowed;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_34:
    uint64_t v26 = 2654435761 * self->_ecsc;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_35;
    }
LABEL_70:
    uint64_t v27 = 0;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_36;
    }
LABEL_71:
    uint64_t v28 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_69:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_70;
  }
LABEL_35:
  uint64_t v27 = 2654435761 * self->_si2TerNeeded;
  if ((*(_DWORD *)&has & 0x80000000) == 0) {
    goto LABEL_71;
  }
LABEL_36:
  uint64_t v28 = 2654435761 * self->_subsId;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 19);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v5 = *((void *)v4 + 19);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_arfcnBcch = *((_DWORD *)v4 + 6);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x200000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_mcc = *((_DWORD *)v4 + 24);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x400000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_mnc = *((_DWORD *)v4 + 25);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x80000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_lac = *((_DWORD *)v4 + 22);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_ci = *((_DWORD *)v4 + 14);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_bsic = *((_DWORD *)v4 + 9);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_dtxFromBs = *((_DWORD *)v4 + 17);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_radioLinkTimeout = *((_DWORD *)v4 + 29);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_multibRep = *((_DWORD *)v4 + 27);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_gsmBand = *((_DWORD *)v4 + 20);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_accessTech = *((_DWORD *)v4 + 5);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_typeOfCurChan = *((_DWORD *)v4 + 37);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x800000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_msTxpwr = *((_DWORD *)v4 + 26);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_rxAccMin = *((_DWORD *)v4 + 31);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x400) == 0)
  {
LABEL_17:
    if ((v5 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_cbq = *((_DWORD *)v4 + 13);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x100) == 0)
  {
LABEL_18:
    if ((v5 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_cba = *((_DWORD *)v4 + 11);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x80) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_c2Valid = *((_DWORD *)v4 + 10);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_crOffset = *((_DWORD *)v4 + 15);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_tmpOffset = *((_DWORD *)v4 + 36);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_penaltyT = *((_DWORD *)v4 + 28);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_23:
    if ((v5 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_t3212 = *((_DWORD *)v4 + 35);
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 2) == 0)
  {
LABEL_24:
    if ((v5 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_acc = *((_DWORD *)v4 + 4);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x20) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_bsPaMfrms = *((_DWORD *)v4 + 8);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_csPagemode = *((_DWORD *)v4 + 16);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_maxRetransCs = *((_DWORD *)v4 + 23);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x10000) == 0)
  {
LABEL_28:
    if ((v5 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_emergCallAllowed = *((_DWORD *)v4 + 19);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x10) == 0)
  {
LABEL_29:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_attachAllowed = *((_DWORD *)v4 + 7);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x40000) == 0)
  {
LABEL_30:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_halfRateSupported = *((_DWORD *)v4 + 21);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_si78Broadcast = *((_DWORD *)v4 + 33);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x200) == 0)
  {
LABEL_32:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_cbchSupported = *((_DWORD *)v4 + 12);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_reestAllowed = *((_DWORD *)v4 + 30);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x8000) == 0)
  {
LABEL_34:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_ecsc = *((_DWORD *)v4 + 18);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)v4 + 19);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_73:
  self->_si2TerNeeded = *((_DWORD *)v4 + 32);
  *(void *)&self->_has |= 0x20000000uLL;
  if ((*((void *)v4 + 19) & 0x80000000) != 0)
  {
LABEL_36:
    self->_subsId = *((_DWORD *)v4 + 34);
    *(void *)&self->_has |= 0x80000000uLL;
  }
LABEL_37:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)arfcnBcch
{
  return self->_arfcnBcch;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)ci
{
  return self->_ci;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)dtxFromBs
{
  return self->_dtxFromBs;
}

- (unsigned)radioLinkTimeout
{
  return self->_radioLinkTimeout;
}

- (unsigned)multibRep
{
  return self->_multibRep;
}

- (unsigned)gsmBand
{
  return self->_gsmBand;
}

- (unsigned)accessTech
{
  return self->_accessTech;
}

- (unsigned)typeOfCurChan
{
  return self->_typeOfCurChan;
}

- (unsigned)msTxpwr
{
  return self->_msTxpwr;
}

- (unsigned)rxAccMin
{
  return self->_rxAccMin;
}

- (unsigned)cbq
{
  return self->_cbq;
}

- (unsigned)cba
{
  return self->_cba;
}

- (unsigned)c2Valid
{
  return self->_c2Valid;
}

- (unsigned)crOffset
{
  return self->_crOffset;
}

- (unsigned)tmpOffset
{
  return self->_tmpOffset;
}

- (unsigned)penaltyT
{
  return self->_penaltyT;
}

- (unsigned)t3212
{
  return self->_t3212;
}

- (unsigned)acc
{
  return self->_acc;
}

- (unsigned)bsPaMfrms
{
  return self->_bsPaMfrms;
}

- (unsigned)csPagemode
{
  return self->_csPagemode;
}

- (unsigned)maxRetransCs
{
  return self->_maxRetransCs;
}

- (unsigned)emergCallAllowed
{
  return self->_emergCallAllowed;
}

- (unsigned)attachAllowed
{
  return self->_attachAllowed;
}

- (unsigned)halfRateSupported
{
  return self->_halfRateSupported;
}

- (unsigned)si78Broadcast
{
  return self->_si78Broadcast;
}

- (unsigned)cbchSupported
{
  return self->_cbchSupported;
}

- (unsigned)reestAllowed
{
  return self->_reestAllowed;
}

- (unsigned)ecsc
{
  return self->_ecsc;
}

- (unsigned)si2TerNeeded
{
  return self->_si2TerNeeded;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end